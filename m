Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5DD97C966
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800752.1210748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srGUL-00067L-NY; Thu, 19 Sep 2024 12:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800752.1210748; Thu, 19 Sep 2024 12:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srGUL-00065Z-Kb; Thu, 19 Sep 2024 12:42:25 +0000
Received: by outflank-mailman (input) for mailman id 800752;
 Thu, 19 Sep 2024 12:42:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1srGUJ-00065S-Hm
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:42:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srGUJ-0005wh-34; Thu, 19 Sep 2024 12:42:23 +0000
Received: from [83.68.141.146] (helo=[10.134.2.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srGUI-0001Aj-Sc; Thu, 19 Sep 2024 12:42:23 +0000
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
	bh=Xh3W/W60V9TuexS4l94Hq7CrykPz+Il+cG9ya2imiqc=; b=GoS8P77YVksr81VJVX5VsUBVv+
	UE84o6ESYiyzgR51Yfwy52oKMvkw2sq1j96hLAjiI83eTMRARzx8OBlEHS574Y+zy6A18DzgCB/Ra
	Pe+2muxKELWLS5LyegIoo86HZTa0C7k9NkAmpp/YRvMl2Fr/UcSHH5fufzQ2VMJXHeKk=;
Message-ID: <e1930816-14ff-489e-99c1-8e832655d4af@xen.org>
Date: Thu, 19 Sep 2024 14:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240918175102.223076-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 18/09/2024 19:51, Ayan Kumar Halder wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> On Armv8-A, Xen has a fixed virtual start address (link address too) for all
> Armv8-A platforms. In an MMU based system, Xen can map its loaded address to
> this virtual start address. So, on Armv8-A platforms, the Xen start address does
> not need to be configurable. But on Armv8-R platforms, there is no MMU to map
> loaded address to a fixed virtual address and different platforms will have very
> different address space layout. So Xen cannot use a fixed physical address on
> MPU based system and need to have it configurable.
> 
> So, we introduce a Kconfig option for users to set the start address. The start
> address needs to be aligned to 4KB. We have a check for this alignment.

It would suggest to add some explanation why you want the start address 
to be 4KB aligned.

> 
> In case if the user forgets to set the start address, then 0xffffffff is used
> as default. This is to trigger the error (on alignment check) and thereby prompt
> user to set the start address.
> 
> Also updated config.h so that it includes mpu/layout.h when CONFIG_MPU is
> defined.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. Fixed some of the coding style issues.
> 2. Reworded the help message.
> 3. Updated the commit message.
> 
>   xen/arch/arm/Kconfig                  | 10 ++++++++++
>   xen/arch/arm/include/asm/config.h     |  4 +++-
>   xen/arch/arm/include/asm/mpu/layout.h | 27 +++++++++++++++++++++++++++

Looking at this patch again, I don't see any modification in xen.lds.S. 
Is it intended?

>   3 files changed, 40 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index e881f5ba57..ab3ef005a6 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -23,6 +23,16 @@ config ARCH_DEFCONFIG
>   	default "arch/arm/configs/arm32_defconfig" if ARM_32
>   	default "arch/arm/configs/arm64_defconfig" if ARM_64
>   
> +config XEN_START_ADDRESS
> +	hex "Xen start address: keep default to use platform defined address"
> +	default 0xFFFFFFFF
> +	depends on MPU
> +	help
> +	  Used to set customized address at which which Xen will be linked on MPU
> +	  systems. Must be aligned to 4KB.
> +	  0xFFFFFFFF is used as default value to indicate that user has not
> +	  customized this address.
> +
>   menu "Architecture Features"
>   
>   choice
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index a2e22b659d..0a51142efd 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -69,8 +69,10 @@
>   #include <xen/const.h>
>   #include <xen/page-size.h>
>   
> -#ifdef CONFIG_MMU
> +#if defined(CONFIG_MMU)
>   #include <asm/mmu/layout.h>
> +#elif defined(CONFIG_MPU)
> +#include <asm/mpu/layout.h>
>   #else
>   # error "Unknown memory management layout"
>   #endif
> diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
> new file mode 100644
> index 0000000000..f9a5be2d6b
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/layout.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_MPU_LAYOUT_H__
> +#define __ARM_MPU_LAYOUT_H__
> +
> +#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
> +
> +/*
> + * All MPU platforms need to provide a XEN_START_ADDRESS for linker. This
> + * address indicates where Xen image will be loaded and run from. This
> + * address must be aligned to a PAGE_SIZE.

Strictly speaking, this doesn't match the Kconfig. AFAIU, we still said 
the internal code may continue to rely on PAGE_SIZE for the time being. 
But I think we would want to have a BUILD_BUG_ON(PAGE_SIZE != SZ_4K) to 
catch any value change.

> + */
> +#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
> +#error "XEN_START_ADDRESS must be aligned to PAGE_SIZE"

In the error message, you want to mention 4KB.

Cheers,

-- 
Julien Grall


