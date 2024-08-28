Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7121962AC0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784942.1194361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJzi-0004RS-19; Wed, 28 Aug 2024 14:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784942.1194361; Wed, 28 Aug 2024 14:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJzh-0004OH-UM; Wed, 28 Aug 2024 14:49:57 +0000
Received: by outflank-mailman (input) for mailman id 784942;
 Wed, 28 Aug 2024 14:49:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sjJzg-0004OB-OE
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:49:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sjJzg-00028y-62; Wed, 28 Aug 2024 14:49:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sjJzf-0006KY-WD; Wed, 28 Aug 2024 14:49:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=X4t8IBRnrSGGQzGQ+NAqpV25AhiNyFtll5IAOWduaCk=; b=H7uHXC/ID76ZiIAXLPj5xGAHeW
	B2viPHQmD4wDg9gdyaOQsc8xn6RyQN24w4qj/3yBHqh7iiiiHASRrR9dHCUS/F2/LZpFoFvpuyHk6
	RoVJRPw1JnEDh8bqtfKMSTtPLpNNA6eiPWozM0ZnJSpYXX8ZHUgxpdp2QRhPZX7OtySo=;
Message-ID: <efc024ad-1e1c-45d0-9511-cc0c082dfef7@xen.org>
Date: Wed, 28 Aug 2024 15:49:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/08/2024 17:31, Ayan Kumar Halder wrote:
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
> So in this patch, we reuse the existing arm/platforms to store
> Armv8-R platforms' parameters. And `XEN_START_ADDRESS` is one
> kind of MPU based platform's parameters. So we define default
> `XEN_START_ADDRESS` in the MPU specific header file.

This seems a left-over from as previous work?

> 
> We also introduce one Kconfig option for users to override the
> default Xen start address of selected platform, if they think
> the default address doesn't suit their scenarios. For this
> Kconfig option, we use an unaligned address "0xffffffff" as the
> default value to indicate that users haven't used a customized
> Xen start address.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/Kconfig                  | 11 +++++++++++
>   xen/arch/arm/include/asm/mpu/layout.h | 25 +++++++++++++++++++++++++
>   2 files changed, 36 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 686948cefd..d722ca690c 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -23,6 +23,17 @@ config ARCH_DEFCONFIG
>   	default "arch/arm/configs/arm32_defconfig" if ARM_32
>   	default "arch/arm/configs/arm64_defconfig" if ARM_64
>   
> +config XEN_START_ADDRESS
> +	hex "Xen start address: keep default to use platform defined address"
> +	default 0xFFFFFFFF
> +	depends on MPU
> +	help
> +	  This option is allowed to set customized address at which Xen will be
> +	  linked on MPU systems.

I don't quite understand what you mean by "allowed".

 >  This address must be aligned to a page size.> +	  Use 0xFFFFFFFF as 
the default value to indicate that user hasn't
> +	  customized this address, and Xen use use the default value that has
> +	  been defined in platform files.

At least in this patch, there is no default set. Instead you will throw 
an error.

> +
>   menu "Architecture Features"
>   
>   choice
> diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
> new file mode 100644
> index 0000000000..82a74b8b5b
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/layout.h
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Coding style: /* SPDX-... */

> +/*
> + * config_mpu.h: A Linux-style configuration list for Arm MPU systems,
 > + *               only can be included by config.h
> + */

I don't understand how this description match the content below. Also, 
shouldn't you include it from xen/config.h?

> +
> +#ifndef __ARM_CONFIG_MPU_H__
> +#define __ARM_CONFIG_MPU_H__

This doesn't match the name of the file.

> +
> +
> +#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
> +
> +/*
> + * All MPU platforms need to provide a XEN_START_ADDRESS for linker. This
> + * address indicates where Xen image will be loaded and run from. This
> + * address must be aligned to a PAGE_SIZE.
> + */
> +#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
> +#error "XEN_START_ADDRESS must be aligned to PAGE_SIZE"
> +#endif
> +
> +#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
> +
> +#endif /* __ARM_CONFIG_MPU_H__ */
> +

Cheers,

-- 
Julien Grall


