Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3238E9C3D1B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833604.1248783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASWo-0000Hd-TE; Mon, 11 Nov 2024 11:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833604.1248783; Mon, 11 Nov 2024 11:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASWo-0000FH-Q4; Mon, 11 Nov 2024 11:24:18 +0000
Received: by outflank-mailman (input) for mailman id 833604;
 Mon, 11 Nov 2024 11:24:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tASWn-0000FB-Iz
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:24:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tASWn-0002Gu-0F;
 Mon, 11 Nov 2024 11:24:17 +0000
Received: from [2a02:8012:3a1:0:440f:f547:9226:a08e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tASWn-0005QH-0b;
 Mon, 11 Nov 2024 11:24:17 +0000
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
	bh=SfSep94OMPUpm5c7upx4eLB/ph+cXEZnEhWzR75ruTQ=; b=4Ll6y0RoxvV5ZKfGnn6Bqofaxo
	zZ8gpX65hMrBv6OHkqIePIXjdfO+QsldV10C4DgWcgdp3t71GYx+5rMF8fKkSjbnZw2KXwHSxWuEw
	yMpqfSzNvRBAz37KO3W0QY6l+Hg0jDEuJ/+uwDG7PYOygu5zbG3bR3DpYswfSP3wiDZ8=;
Message-ID: <a0cd6b4d-fc4a-4a6e-a2bf-7b0a83a2a6a6@xen.org>
Date: Mon, 11 Nov 2024 11:24:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen/mpu: Map early uart when earlyprintk on
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241108200024.857766-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241108200024.857766-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 08/11/2024 20:00, Ayan Kumar Halder wrote:
> CONFIG_EARLY_UART_SIZE is introduced to let user provide physical size of
> early UART. Unlike MMU where we map a page in the virtual address space,
> here we need to know the exact physical size to be mapped.
> As VA == PA in case of MPU, the memory layout follows exactly the hardware
> configuration. As a consequence, we set  EARLY_UART_VIRTUAL_ADDRESS as physical
> address.
> 
> Further, we check whether user-defined EARLY_UART_SIZE is aligned to PAGE_SIZE
> (4KB). This is partly because we intend to map a minimum of 1 page(ie 4KB) and
> the limit address is set as "EARLY_UART_SIZE-1". The limit address needs to end
> with 0x3f (as required by PRLAR register).

Looking at the code below, it is not clear why you need to have 
UART_SIZE 4KB-aligned. Furthermore...

> 
> UART is mapped as nGnRE region (as specified by ATTR=100 , refer G1.3.13,
> MAIR_EL2, "---0100 Device memory nGnRE") and Doc ID - 102670_0101_02_en
> Table 4-3, Armv8 architecture memory types (nGnRE - Corresponds to Device in
> Armv7 architecture). Also, it is mapped as outer shareable, RW at EL2 only
> and execution of instructions from the region is not permitted.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/Kconfig.debug              |  7 +++++++
>   xen/arch/arm/arm64/mpu/head.S           |  9 +++++++++
>   xen/arch/arm/include/asm/early_printk.h | 19 +++++++++++++++++++
>   3 files changed, 35 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index 7660e599c0..84a0616102 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -121,6 +121,13 @@ config EARLY_UART_BASE_ADDRESS
>   	hex "Early printk, physical base address of debug UART"
>   	range 0x0 0xffffffff if ARM_32
>   
> +config EARLY_UART_SIZE
> +       depends on EARLY_PRINTK
> +       depends on MPU
> +       hex "Early printk, physical size of debug UART"
> +       range 0x0 0xffffffff if ARM_32
> +       default 0x1000
> +
>   config EARLY_UART_PL011_BAUD_RATE
>   	depends on EARLY_UART_PL011
>   	int "Early printk UART baud rate for pl011"
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index 731698aa3b..98422d7ed3 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -11,8 +11,10 @@
>   #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>   #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>   #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>   
>   #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>   
>   /*
>    * Macro to prepare and set a EL2 MPU memory region.
> @@ -137,6 +139,13 @@ FUNC(enable_boot_cpu_mm)
>       ldr   x2, =__bss_end
>       prepare_xen_region x0, x1, x2, x3, x4, x5
>   
> +#ifdef CONFIG_EARLY_PRINTK
> +    /* Xen early UART section. */
> +    ldr   x1, =CONFIG_EARLY_UART_BASE_ADDRESS
> +    ldr   x2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR


... the documentation of prepare_xen_region suggests that the base UART 
should be page-aligned. However, there are systems (although not sure 
about MPU ones) where the base UART address is not page-aligned (this is 
because multiple UARTs share the same page).

But I don't see any need to require page alignment here. I think the 
alignment/size should be based on the minumum supported by the MPU. This 
means the documentation in prepare_xen_region likely needs to be updated.


> +#endif
> +
>       b    enable_mpu
>       ret
>   END(enable_boot_cpu_mm)
> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
> index 46a5e562dd..98fd52c4db 100644
> --- a/xen/arch/arm/include/asm/early_printk.h
> +++ b/xen/arch/arm/include/asm/early_printk.h
> @@ -15,6 +15,24 @@
>   
>   #ifdef CONFIG_EARLY_PRINTK
>   
> +#ifndef CONFIG_MMU

Shouldn't this be #ifdef CONFIG_MPU followed by...

> +
> +/*
> + * For MPU systems, there is no VMSA support in EL2, so we use VA == PA
> + * for EARLY_UART_VIRTUAL_ADDRESS.
> + */
> +#define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
> +
> +/*
> + * User-defined EARLY_UART_SIZE must be aligned to a PAGE_SIZE, or
> + * we may map more than necessary in MPU system.
> + */
> +#if (EARLY_UART_SIZE % PAGE_SIZE) != 0
> +#error "EARLY_UART_SIZE must be aligned to PAGE_SIZE"
> +#endif
> +
> +#else

#elif CONFIG_MMU

> +
>   /* need to add the uart address offset in page to the fixmap address */
>   #define EARLY_UART_VIRTUAL_ADDRESS \
>       (FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
> @@ -22,6 +40,7 @@
>   #define TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS \
>       (TEMPORARY_FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
>   
> +#endif /* CONFIG_MMU */

And finally

#else
# error ...
#endif

>   #endif /* !CONFIG_EARLY_PRINTK */
 >   >   #endif

-- 
Julien Grall


