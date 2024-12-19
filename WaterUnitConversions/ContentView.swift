//
//  ContentView.swift
//  WaterUnitConversions
//
//  Created by Marko Zivanovic on 17.12.24..
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputAmount = 0.0
    @State private var inputUnit = "Liter"
    @State private var outputUnit = "Milliliter"
    
    let units = ["Liter", "Deciliter", "Centiliter", "Milliliter"]
    
    var convertedAmount: Double {
            let inputInLiters: Double
            switch inputUnit {
            case "Liter":
                inputInLiters = inputAmount
            case "Deciliter":
                inputInLiters = inputAmount / 10
            case "Centiliter":
                inputInLiters = inputAmount / 100
            case "Milliliter":
                inputInLiters = inputAmount / 1000
            default:
                inputInLiters = 0
            }
            
            switch outputUnit {
            case "Liter":
                return inputInLiters
            case "Deciliter":
                return inputInLiters * 10
            case "Centiliter":
                return inputInLiters * 100
            case "Milliliter":
                return inputInLiters * 1000
            default:
                return 0
            }
        }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Choose Input Unit") {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                           Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Water input amount") {
                    TextField("Enter amount", value: $inputAmount, format: .number)
                        .keyboardType(.decimalPad)
                }
                                
                Section("Choose a water measurement unit") {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("converted amount") {
                    Text("\(convertedAmount, specifier: "%.2f") \(outputUnit)")
                }
            }
            .navigationTitle("Water Conversions")
        }
    }
}

#Preview {
    ContentView()
}
