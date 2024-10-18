Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C29A4967
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 00:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822192.1236168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1v0m-0004PX-Lr; Fri, 18 Oct 2024 21:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822192.1236168; Fri, 18 Oct 2024 21:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1v0m-0004O0-J7; Fri, 18 Oct 2024 21:59:56 +0000
Received: by outflank-mailman (input) for mailman id 822192;
 Fri, 18 Oct 2024 21:59:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1v0k-0004Nu-FM
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 21:59:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1v0k-00061A-6K; Fri, 18 Oct 2024 21:59:54 +0000
Received: from [2a02:8012:3a1:0:11d8:dae4:636f:615c]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1v0j-0004lK-Vb; Fri, 18 Oct 2024 21:59:54 +0000
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
	bh=4DHIibTvMlDOEgAhm4AvPwIF0zESC5f25TDqgCLFYJA=; b=LpSZ0dUqKCzD0mO9V6B8yjYceZ
	A3oHmmkiCfvdaQhUOC0KiKy+c8uol+nzM50jNd4K34cxqt6G16Nu0eNaee8yntVjLQ5MM+Q+oaIBg
	z4pZ++mctJh8ADQswpmIiTUdChgLB+9Yz7g3VFDKssc1o9zOS3fHKs4Yvy6Dp2EMedwg=;
Message-ID: <5740cd89-1064-4ad1-a0a6-90c03ab99768@xen.org>
Date: Fri, 18 Oct 2024 22:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241010140351.309922-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/10/2024 15:03, Ayan Kumar Halder wrote:
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
> 
> MPU allows us to define regions which are 64 bits aligned. This restriction
> comes from the bitfields of PRBAR, PRLAR (the lower 6 bits are 0 extended to
> provide the base and limit address of a region). This means that the start
> address of Xen needs to be at least 64 bits aligned (as it will correspond to
> the start address of memory protection region).
> 
> As for now Xen on MPU tries to use the same memory alignment restrictions as it
> has been for MMU. Unlike MMU where the starting virtual address is 2MB, Xen on
> MPU needs the start address to be 4KB (ie page size) aligned.
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
> v2 - Added clarification for the use of page and page size.
> 
>   xen/arch/arm/Kconfig                  | 10 ++++++++
>   xen/arch/arm/include/asm/config.h     |  4 +++-
>   xen/arch/arm/include/asm/mpu/layout.h | 33 +++++++++++++++++++++++++++
>   xen/arch/arm/setup.c                  |  8 +++++++
>   xen/arch/arm/xen.lds.S                |  6 +++++
>   5 files changed, 60 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ed92eb67cb..15b2e4a227 100644
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
> index 0000000000..d6d397f4c2
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/layout.h
> @@ -0,0 +1,33 @@
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
> + */
> +#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
> +#error "XEN_START_ADDRESS must be aligned to 4KB"
> +#endif
> +
> +/*
> + * For MPU, XEN's virtual start address is same as the physical address.
> + * The reason being MPU treats VA == PA. IOW, it cannot map the physical
> + * address to a different fixed virtual address. So, the virtual start
> + * address is determined by the physical address at which Xen is loaded.
> + */
> +#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
> +
> +#endif /* __ARM_MPU_LAYOUT_H__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 71ebaa77ca..0203771164 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -295,6 +295,14 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>       struct domain *d;
>       int rc, i;
>   
> +#ifdef CONFIG_MPU
> +    /*
> +     * Unlike MMU, MPU does not use pages for translation. However, we continue
> +     * to use PAGE_SIZE to denote 4KB. This is so that the existing memory
> +     * management based on pages, continue to work for now.
> +     */
> +    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
> +#endif

I think it would be better suited in mm.c or mpu/*.c.

>       dcache_line_bytes = read_dcache_line_bytes();
>   
>       percpu_init_areas();
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index bd884664ad..fe4b468cca 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -231,6 +231,12 @@ SECTIONS
>    */
>   ASSERT(_start == XEN_VIRT_START, "_start != XEN_VIRT_START")
>   
> +/*
> + * On MPU based platforms, the starting address is to be provided by user.
> + * One need to check that it is 4KB aligned.
> + */
> +ASSERT(IS_ALIGNED(_start,       4096), "starting address is misaligned")
> +

Shouldn't this be protected with #ifdef CONFIG_MPU? Also, it would 
probably be useful to start the exact size in the error message.

>   /*
>    * We require that Xen is loaded at a page boundary, so this ensures that any
>    * code running on the identity map cannot cross a section boundary.

Cheers,

-- 
Julien Grall

