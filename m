Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7049B61E5AA
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 20:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438710.692827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orlZR-0006tx-FH; Sun, 06 Nov 2022 19:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438710.692827; Sun, 06 Nov 2022 19:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orlZR-0006s2-CY; Sun, 06 Nov 2022 19:44:41 +0000
Received: by outflank-mailman (input) for mailman id 438710;
 Sun, 06 Nov 2022 19:44:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orlZQ-0006rw-7j
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 19:44:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orlZQ-0007Jg-2M; Sun, 06 Nov 2022 19:44:40 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orlZP-00041Y-T0; Sun, 06 Nov 2022 19:44:40 +0000
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
	bh=So3NTQ/8VWcpN010o6UVyE1ciHC8qregy3fSqLLY91s=; b=CH0HmzcTS9s3GOUsNJD++hHL2e
	6/6s6Bo9g3Vwu36py523rLsrIYl15NdhZ4EMrDvll0liB0vOfb/zbXdGJeUZzy0ZGO3MLG/5XBrID
	5qFwasE0x0+06qxJUZbpijwEclHgRyQ4Qlg9APDHX2jWmq2E3YYRxFP9IjpMGQG1D9cQ=;
Message-ID: <db5667fc-ac64-411c-4011-dd4bbe25ad7e@xen.org>
Date: Sun, 6 Nov 2022 19:44:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 07/11] xen/arm: implement FIXMAP_ADDR for MPU systems
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-8-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221104100741.2176307-8-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 04/11/2022 10:07, Wei Chen wrote:
> FIXMAP is a special virtual address section for Xen to map some
> physical ram or device memory temporarily in initialization for
> MMU systems. FIXMAP_ADDR will return a virtual address by index
> for special purpose phys-to-virt mapping usage. For example,
> FIXMAP_ADDR(FIXMAP_CONSOLE) for early console mapping and
> FIXMAP_ADDR(FIXMAP_MISC) for copy_from_paddr.

To me, we are bending quite a bit the definition of the fixmap. There 
are not many use of the FIXMAP within the code and I think it would 
simply be better to abstract the use (or removing it when possible) and 
avoid defining FIXMAP_ADDR() & co for MPU.

> 
> But in MPU systems, we can't map physical address to any virtual
> address. So we want the code that is using FIXMAP_ADDR to return
> the input physical address in MPU systems. So in MPU version,
> FIXMAP_ADDR will trim physical address to PAGE alignment. This
> will return an offset which is similar to MMU version FIXMAP_ADDR.
> But it's a physical offset got from input physical address, plus
> to an offset inside page (which is also got from physical address
> mask with PAGE_MASK). The caller can return the input physical
> address directly.
> 
> As pmap depends on FIXAMP, so we disable pmap for Arm with MPU
> enabled systems.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/Kconfig                  |  2 +-
>   xen/arch/arm/include/asm/config_mpu.h |  2 ++
>   xen/arch/arm/include/asm/fixmap.h     | 25 +++++++++++++++++++++++++
>   3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ac276307d6..1458ffa777 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -16,7 +16,7 @@ config ARM
>   	select HAS_DEVICE_TREE
>   	select HAS_PASSTHROUGH
>   	select HAS_PDX
> -	select HAS_PMAP
> +	select HAS_PMAP if !HAS_MPU

I can't find any change of mm.c in this series. So surely this will 
break the build?

>   	select IOMMU_FORCE_PT_SHARE
>   
>   config ARCH_DEFCONFIG
> diff --git a/xen/arch/arm/include/asm/config_mpu.h b/xen/arch/arm/include/asm/config_mpu.h
> index 530abb8302..eee60dcffc 100644
> --- a/xen/arch/arm/include/asm/config_mpu.h
> +++ b/xen/arch/arm/include/asm/config_mpu.h
> @@ -24,4 +24,6 @@
>   
>   #define HYPERVISOR_VIRT_START  XEN_VIRT_START
>   
> +#define FIXMAP_ADDR(n)         (_AT(paddr_t, n) & (PAGE_MASK))
> +
>   #endif /* __ARM_CONFIG_MPU_H__ */
> diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
> index d0c9a52c8c..1e338759e9 100644
> --- a/xen/arch/arm/include/asm/fixmap.h
> +++ b/xen/arch/arm/include/asm/fixmap.h
> @@ -7,6 +7,8 @@
>   #include <xen/acpi.h>
>   #include <xen/pmap.h>
>   
> +#ifndef CONFIG_HAS_MPU
> +
>   /* Fixmap slots */
>   #define FIXMAP_CONSOLE  0  /* The primary UART */
>   #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
> @@ -45,4 +47,27 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
>   
>   #endif /* __ASSEMBLY__ */
>   
> +#else
> +
> +/*
> + * FIXMAP_ADDR will trim physical address to PAGE alignment.
> + * This will return an offset which is similar to MMU version
> + * FIXMAP_ADDR.
> + * For example:
> + * EARLY_UART_VIRTUAL_ADDRESS is defined by:
> + *     (FIXMAP_ADDR(FIXMAP_CONSOLE) + \
> + *     (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
> + * With MPU version FIXMAP_CONSOLE and FIXMAP_ADDR definitions,
> + * EARLY_UART_VIRTUAL_ADDRESS can be restore to
> + * CONFIG_EARLY_UART_BASE_ADDRESS.
> + * In this case, we don't need to use #ifdef MPU in the code
> + * where are using FIXMAP_ADDR to make them to use physical
> + * address explicitily.
> + */
> +#ifdef CONFIG_EARLY_UART_BASE_ADDRESS
> +#define FIXMAP_CONSOLE         CONFIG_EARLY_UART_BASE_ADDRESS
> +#endif
> +
> +#endif /* CONFIG_HAS_MPU */
> +
>   #endif /* __ASM_FIXMAP_H */

Cheers,

-- 
Julien Grall

