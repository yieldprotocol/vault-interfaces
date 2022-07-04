// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

interface IConverter {
    /// @notice An even to capture wrapping of the asset
    /// @param to Address to which wrapped asset is sent
    /// @param amount Amount of asset which was wrapped
    /// @param wrappedAmount Amount of wrapped asset received
    event Wrapped(address indexed to, uint256 amount, uint256 wrappedAmount);

    /// @notice An even to capture unwrapping of the asset
    /// @param to Address to which unwrapped asset is sent
    /// @param amount Amount of asset which was unwrapped
    /// @param unwrappedAmount Amount of unwrapped asset received
    event Unwrapped(
        address indexed to,
        uint256 amount,
        uint256 unwrappedAmount
    );

    /* View Functions
     ******************************************************************************************************************/
    /// @notice A function to get exactly how many wrappedAsset would be obtained from wrapping assets.
    /// @param assets Amount of assets to be wrapped
    /// @return The amount of wrapped assets that would be received
    function wrappedFrom(uint256 assets) external view returns (uint256);

    /// @notice A function to get exactly how many asset would be obtained from unwrapping wrappedAssets
    /// @param wrappedAssets Amount of wrapped asset
    /// @return Amount of assets that would be received
    function assetFrom(uint256 wrappedAssets) external view returns (uint256);

    /// @notice A function to get exactly how many wrappedAssets would need to be unwrapped to obtain assets.
    /// @param assets Amount of assets to be obtained
    /// @return Amount of wrapped assets that would be required
    function wrappedFor(uint256 assets) external view returns (uint256);

    /// @notice A function to get exactly how many assets would need to be wrapped to obtain wrappedAssets.
    /// @param wrappedAssets Amount of wrapped asset to be obtained
    /// @return Amount of assets that would be required
    function assetFor(uint256 wrappedAssets) external view returns (uint256);

    /* Converter functions
     ******************************************************************************************************************/
    /// @notice Wraps the asset present in the contract
    /// @dev The asset to be wrapped must have been transferred to the converter before this is called
    /// @param to Address to which the wrapped asset would be sent
    /// @return wrappedAmount Amount of wrapped assets received
    function wrap(address to) external returns (uint256 wrappedAmount);

    /// @notice Unwraps the asset present in the contract
    /// @dev The asset to be unwrapped must have been transferred to the converter before this is called
    /// @param to Address to which the unwrapped asset would be sent
    /// @return unwrappedAmount Amount of unwrapped assets received
    function unwrap(address to) external returns (uint256 unwrappedAmount);
}
