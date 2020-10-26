//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timerProgress: UIProgressView!
    
    var timerDic = ["Soft" : 300, "Medium" : 420, "Hard" : 600]
    var secondsRemaining = 0
    var timer = Timer()
    var seconds = 0
    
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        
        seconds = 0
        timer.invalidate()
        // set title label
        let eggTitle = sender.currentTitle!
        titleLabel.text = eggTitle
        
        // set timer for the eggs
        secondsRemaining = timerDic[eggTitle]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(action), userInfo: nil, repeats: true)
    }
    
    
    
    @objc func action () {
        if seconds < secondsRemaining + 1 {
            timerProgress.progress = Float(seconds) / Float(secondsRemaining)
            seconds += 1
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }

    
    
}
