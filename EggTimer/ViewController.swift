//
//  ViewController.swift
//  EggTimer
//
//  Created by Isaac Bonilla on 8/29/23.
//



import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let softTime = 5
    let medTime = 7
    let hardTime = 12
    var timeIs = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var labelTxt: UILabel!
    // dictionary - similar to array
    let eggTimes = ["Soft": 5, "Medium": 6, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        //hardnessType(hType: sender.currentTitle!)
        
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        labelTxt.text = hardness

        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)

        
    }
    
    @objc func updateTimer() {
        print("total time == \(totalTime)")
         if secondsPassed < totalTime {
             secondsPassed += 1
             let percentageProgress = Float(secondsPassed) / Float(totalTime)
             print("\(percentageProgress) seconds left")
             progressBar.progress = percentageProgress
             
         }
        
        else
        {
            timer.invalidate()
            labelTxt.text = "Done!"
            playSound()
            
            
        }
        
        func playSound() {
            print("Sound played")
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
         
     }
    
   
    func hardnessType(hType: String) {
        print("hardness is = \(hType)")
        let hardness = hType
        
        //getting time to make egg
        print("egg time is = \(eggTimes[hardness]!)")
        
        
        
        
        
        //using a sitch to get times to cook
        /*
        switch hardness {
        case "Soft":
            print(eggTimes["Soft"]!)
        case "Medium":
            print(eggTimes["Medium"]!)
        case "Hard":
            print(eggTimes["Hard"]!)
            
        default:
            print("error")
        }
        
      */
        
        
      
        
        
        
        

            
     
        }
        
        
        
    

}
