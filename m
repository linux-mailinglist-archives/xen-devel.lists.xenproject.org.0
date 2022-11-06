Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C61161E582
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 20:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438703.692816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orlB9-0002uI-Gq; Sun, 06 Nov 2022 19:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438703.692816; Sun, 06 Nov 2022 19:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orlB9-0002sW-Dl; Sun, 06 Nov 2022 19:19:35 +0000
Received: by outflank-mailman (input) for mailman id 438703;
 Sun, 06 Nov 2022 19:19:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orlB8-0002sQ-IP
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 19:19:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orlB8-0006v1-9W; Sun, 06 Nov 2022 19:19:34 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orlB8-00032Q-3j; Sun, 06 Nov 2022 19:19:34 +0000
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
	bh=JW38zcUk4Sti1KNTRFmM6TpSD8Mt8H8OAbAdO4O4Qic=; b=4LKXeN4LJWSBqLYFtRiVJg3YwE
	M2geMhV7USTbboxGLjOYHc7QlfkOEafVVSyYoj88KdKtY6DQmBaGoiSzQgv8IP1ZT/45bQSs6H8Hw
	GoJNKAzOx76/3AWH2vDsqgoq1LKR9nEhLoFkiBg75qq4bOu5VTzj1o1+dFRSbd6B1EAk=;
Message-ID: <0ffe8a4d-7caf-89af-d189-a872b6b4f0fa@xen.org>
Date: Sun, 6 Nov 2022 19:19:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-6-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
In-Reply-To: <20221104100741.2176307-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2022 10:07, Wei Chen wrote:
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
> So in this patch, we reuse the existing arm/platforms to store
> Armv8-R platforms' parameters. And `XEN_START_ADDRESS` is one
> kind of FVP BaseR platform's parameters. So we define default
> `XEN_START_ADDRESS` for FVP BaseR in its platform file.
> 
> We also introduce one Kconfig option for users to override the
> default Xen start address of selected platform, if they think
> the default address doesn't suit their scenarios. For this
> Kconfig option, we use an unaligned address "0xffffffff" as the
> default value to indicate that users haven't used a customized
> Xen start address.
> 
> And as we introduced Armv8-R platforms to Xen, that means the
> existed Arm64 platforms should not be listed in Armv8-R platform
> list, so we add !ARM_V8R dependency for these platforms.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
> ---
>   xen/arch/arm/Kconfig                           | 11 +++++++++++
>   xen/arch/arm/include/asm/platforms/fvp_baser.h | 14 ++++++++++++++

I looked at the content of fvp_baser.h after this series is applied. 
There are a bit of boiler plate that I expect to be part for other 
platforms. In particular...

>   xen/arch/arm/platforms/Kconfig                 | 16 +++++++++++++---
>   3 files changed, 38 insertions(+), 3 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/platforms/fvp_baser.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ad592367bd..ac276307d6 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -138,6 +138,17 @@ config TEE
>   	  This option enables generic TEE mediators support. It allows guests
>   	  to access real TEE via one of TEE mediators implemented in XEN.
>   
> +config XEN_START_ADDRESS
> +	hex "Xen start address: keep default to use platform defined address"
> +	default 0xFFFFFFFF

... this default value will need to be tested everywhere. At least for 
now, I think you can avoid the per platform header by using the Kconfig 
to select the proper address (see the config for selecting early printk 
address).

This will also avoids to use an invalid value here.

> +	depends on HAS_MPU
> +	help
> +	  This option allows to set the customized address at which Xen will be
> +	  linked on MPU systems. This address must be aligned to a page size.
> +	  Use 0xFFFFFFFF as the default value to indicate that user hasn't
> +	  customized this address, and Xen use use the default value that has
> +	  been defined in platform files.
> +
>   source "arch/arm/tee/Kconfig"
>   
>   config STATIC_SHM
> diff --git a/xen/arch/arm/include/asm/platforms/fvp_baser.h b/xen/arch/arm/include/asm/platforms/fvp_baser.h
> new file mode 100644
> index 0000000000..9450a411a9
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/platforms/fvp_baser.h
> @@ -0,0 +1,14 @@
> +#ifndef __ASM_ARM_PLATFORMS_FVP_BASER_H__
> +#define __ASM_ARM_PLATFORMS_FVP_BASER_H__
> +
> +/*
> + * 0xFFFFFFFF indicates users haven't customized XEN_START_ADDRESS,
> + * we will use platform defined default address.
> + */
> +#if CONFIG_XEN_START_ADDRESS == 0xFFFFFFFF
> +#define XEN_START_ADDRESS 0x200000
> +#else
> +#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
> +#endif
> +
> +#endif /* __ASM_ARM_PLATFORMS_FVP_BASER_H__ */
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index c93a6b2756..0904793a0b 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -1,6 +1,7 @@
>   choice
>   	prompt "Platform Support"
>   	default ALL_PLAT
> +	default FVP_BASER if ARM_V8R

Is there any reason to create a new Kconfig rather than using MPU?

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

