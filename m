Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10B0670D42
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479987.744120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvJQ-00080s-L1; Tue, 17 Jan 2023 23:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479987.744120; Tue, 17 Jan 2023 23:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvJQ-0007yO-IH; Tue, 17 Jan 2023 23:24:16 +0000
Received: by outflank-mailman (input) for mailman id 479987;
 Tue, 17 Jan 2023 23:24:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHvJO-0007yG-GT
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:24:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHvJO-0006tM-9l; Tue, 17 Jan 2023 23:24:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHvJO-0003Fk-4U; Tue, 17 Jan 2023 23:24:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=2HOq/hXikQ2cSCtlt1XSjWml10OgtcsOj410j6bzY8A=; b=p30m2Yvva3cIaPQqVIQEBbCaxS
	EdTqeKd0N58Qb4Iy5yDHqo/kf7pYhAFtAIOxnn14ciHBPemv2ZmUR8Cn8OgolIBpDPTlekEg7dcH5
	6NQZBkvCIkXrlucoMe85dkpK8b1rCDCP5jxS6UJsFHukuhCFt/gKP3aBAMWxIe+8CvUo=;
Message-ID: <e406484a-aad3-4953-afdb-3159597ec998@xen.org>
Date: Tue, 17 Jan 2023 23:24:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-5-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 04/40] xen/arm: add an option to define Xen start
 address for Armv8-R
In-Reply-To: <20230113052914.3845596-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> On Armv8-A, Xen has a fixed virtual start address (link address
> too) for all Armv8-A platforms. In an MMU based system, Xen can
> map its loaded address to this virtual start address. So, on
> Armv8-A platforms, the Xen start address does not need to be
> configurable. But on Armv8-R platforms, there is no MMU to map
> loaded address to a fixed virtual address and different platforms
> will have very different address space layout. So Xen cannot use
> a fixed physical address on MPU based system and need to have it
> configurable.
> 
> In this patch we introduce one Kconfig option for users to define
> the default Xen start address for Armv8-R. Users can enter the
> address in config time, or select the tailored platform config
> file from arch/arm/configs.
> 
> And as we introduced Armv8-R platforms to Xen, that means the
> existed Arm64 platforms should not be listed in Armv8-R platform
> list, so we add !ARM_V8R dependency for these platforms.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>

Your signed-off-by is missing.

> ---
> v1 -> v2:
> 1. Remove the platform header fvp_baser.h.
> 2. Remove the default start address for fvp_baser64.
> 3. Remove the description of default address from commit log.
> 4. Change HAS_MPU to ARM_V8R for Xen start address dependency.
>     No matter Arm-v8r board has MPU or not, it always need to
>     specify the start address.

I don't quite understand the last sentence. Are you saying that it is 
possible to have an ARMv8-R system with an MPU nor a page-table?

> ---
>   xen/arch/arm/Kconfig           |  8 ++++++++
>   xen/arch/arm/platforms/Kconfig | 16 +++++++++++++---
>   2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ace7178c9a..c6b6b612d1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -145,6 +145,14 @@ config TEE
>   	  This option enables generic TEE mediators support. It allows guests
>   	  to access real TEE via one of TEE mediators implemented in XEN.
>   
> +config XEN_START_ADDRESS
> +	hex "Xen start address: keep default to use platform defined address"
> +	default 0
> +	depends on ARM_V8R

It is still pretty unclear to me what would be the difference between 
HAS_MPU and ARM_V8R.

> +	help
> +	  This option allows to set the customized address at which Xen will be
> +	  linked on MPU systems. This address must be aligned to a page size.
> +
>   source "arch/arm/tee/Kconfig"
>   
>   config STATIC_SHM
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index c93a6b2756..0904793a0b 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -1,6 +1,7 @@
>   choice
>   	prompt "Platform Support"
>   	default ALL_PLAT
> +	default FVP_BASER if ARM_V8R
>   	---help---
>   	Choose which hardware platform to enable in Xen.
>   
> @@ -8,13 +9,14 @@ choice
>   
>   config ALL_PLAT
>   	bool "All Platforms"
> +	depends on !ARM_V8R
>   	---help---
>   	Enable support for all available hardware platforms. It doesn't
>   	automatically select any of the related drivers.
>   
>   config QEMU
>   	bool "QEMU aarch virt machine support"
> -	depends on ARM_64
> +	depends on ARM_64 && !ARM_V8R
>   	select GICV3
>   	select HAS_PL011
>   	---help---
> @@ -23,7 +25,7 @@ config QEMU
>   
>   config RCAR3
>   	bool "Renesas RCar3 support"
> -	depends on ARM_64
> +	depends on ARM_64 && !ARM_V8R
>   	select HAS_SCIF
>   	select IPMMU_VMSA
>   	---help---
> @@ -31,14 +33,22 @@ config RCAR3
>   
>   config MPSOC
>   	bool "Xilinx Ultrascale+ MPSoC support"
> -	depends on ARM_64
> +	depends on ARM_64 && !ARM_V8R
>   	select HAS_CADENCE_UART
>   	select ARM_SMMU
>   	---help---
>   	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>   
> +config FVP_BASER
> +	bool "Fixed Virtual Platform BaseR support"
> +	depends on ARM_V8R
> +	help
> +	  Enable platform specific configurations for Fixed Virtual
> +	  Platform BaseR

This seems unrelated to this patch.

> +
>   config NO_PLAT
>   	bool "No Platforms"
> +	depends on !ARM_V8R
>   	---help---
>   	Do not enable specific support for any platform.
>   

Cheers,

-- 
Julien Grall

