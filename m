Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F07C8C3D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 19:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616778.959033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrLvk-0007S9-9F; Fri, 13 Oct 2023 17:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616778.959033; Fri, 13 Oct 2023 17:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrLvk-0007QM-6S; Fri, 13 Oct 2023 17:26:32 +0000
Received: by outflank-mailman (input) for mailman id 616778;
 Fri, 13 Oct 2023 17:26:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrLvj-0007QG-2Y
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 17:26:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrLvi-0007mf-Nn; Fri, 13 Oct 2023 17:26:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrLvi-0006oO-Fj; Fri, 13 Oct 2023 17:26:30 +0000
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
	bh=JDkBAq5a7fHQ/tDMNsn9a63rjNCAoUahpxUXy78ZeOw=; b=Yd9jevAMKHDxs/ZEY2Z+pBYeHu
	lPACzThnHfykbsx59GqqwybAAzvkcWnOwaMgpjsMG3h/F6xULWH0zjcGMi2XerfuvN0Pe+G6cuHlp
	nugSeCeSv7qk+AVq7LkCkjSAaJL6a3V0N6GxlgyJk7zfx15BH4BZszvQsZM2fu1ECaGY=;
Message-ID: <5673cd8c-8971-4c1f-890e-d993c22a909c@xen.org>
Date: Fri, 13 Oct 2023 18:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009010313.3668423-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 09/10/2023 02:03, Henry Wang wrote:
> Currently mmu_init_secondary_cpu() only enforces the page table
> should not contain mapping that are both Writable and eXecutables
> after boot. To ease the arch/arm/mm.c split work, fold this function
> to head.S.
> 
> Introduce assembly macro pt_enforce_wxn for both arm32 and arm64.
> For arm64, the macro is called at the end of enable_secondary_cpu_mm().
> For arm32, the macro is called before secondary CPUs jumping into
> the C world.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v7:
> - No change.

Given the discusion on v6, I was expecting some changes here at least on 
arm64 side.

For arm32, my proposal would not yet work because sadly the temporary 
page-tables for secondary bring-up will contain writable and executable 
mappings.

> v6:
> - New patch.
> ---
>   xen/arch/arm/arm32/head.S     | 20 ++++++++++++++++++++
>   xen/arch/arm/arm64/mmu/head.S | 21 +++++++++++++++++++++
>   xen/arch/arm/include/asm/mm.h |  2 --
>   xen/arch/arm/mm.c             |  6 ------
>   xen/arch/arm/smpboot.c        |  2 --
>   5 files changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 33b038e7e0..39218cf15f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -83,6 +83,25 @@
>           isb
>   .endm
>   
> +/*
> + * Enforce Xen page-tables do not contain mapping that are both
> + * Writable and eXecutables.
> + *
> + * This should be called on each secondary CPU.
> + */
> +.macro pt_enforce_wxn tmp
> +        mrc   CP32(\tmp, HSCTLR)
> +        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
> +        dsb
> +        mcr   CP32(\tmp, HSCTLR)
> +        /*
> +         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
> +         * before flushing the TLBs.
> +         */
> +        isb
> +        flush_xen_tlb_local \tmp
> +.endm
> +
>   /*
>    * Common register usage in this file:
>    *   r0  -
> @@ -254,6 +273,7 @@ secondary_switched:
>           /* Use a virtual address to access the UART. */
>           mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
>   #endif
> +        pt_enforce_wxn r0
>           PRINT("- Ready -\r\n")
>           /* Jump to C world */
>           mov_w r2, start_secondary
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index 88075ef083..e4b07594b5 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -31,6 +31,25 @@
>           isb
>   .endm
>   
> +/*
> + * Enforce Xen page-tables do not contain mapping that are both
> + * Writable and eXecutables.
> + *
> + * This should be called on each secondary CPU.
> + */
> +.macro pt_enforce_wxn tmp
> +       mrs   \tmp, SCTLR_EL2
> +       orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
> +       dsb   sy
> +       msr   SCTLR_EL2, \tmp
> +       /*
> +        * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
> +        * before flushing the TLBs.
> +        */
> +       isb
> +       flush_xen_tlb_local
> +.endm
> +
>   /*
>    * Macro to find the slot number at a given page-table level
>    *
> @@ -308,6 +327,8 @@ ENTRY(enable_secondary_cpu_mm)
>           bl    enable_mmu
>           mov   lr, x5
>   
> +        pt_enforce_wxn x0
> +
>           /* Return to the virtual address requested by the caller. */
>           ret
>   ENDPROC(enable_secondary_cpu_mm)
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index d25e59f828..163d22ecd3 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -214,8 +214,6 @@ extern void remove_early_mappings(void);
>   /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
>    * new page table */
>   extern int init_secondary_pagetables(int cpu);
> -/* Switch secondary CPUS to its own pagetables and finalise MMU setup */
> -extern void mmu_init_secondary_cpu(void);
>   /*
>    * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
>    * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b7eb3a6e08..923a90925c 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -326,12 +326,6 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>   #endif
>   }
>   
> -/* MMU setup for secondary CPUS (which already have paging enabled) */
> -void mmu_init_secondary_cpu(void)
> -{
> -    xen_pt_enforce_wnx();
> -}
> -
>   #ifdef CONFIG_ARM_32
>   /*
>    * Set up the direct-mapped xenheap:
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index ec76de3cac..beb137d06e 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -361,8 +361,6 @@ void start_secondary(void)
>        */
>       update_system_features(&current_cpu_data);
>   
> -    mmu_init_secondary_cpu();
> -
>       gic_init_secondary_cpu();
>   
>       set_current(idle_vcpu[cpuid]);

Cheers,

-- 
Julien Grall

