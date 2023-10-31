Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F987DD60D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 19:30:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625998.975858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxtUP-0006GH-6p; Tue, 31 Oct 2023 18:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625998.975858; Tue, 31 Oct 2023 18:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxtUP-0006Di-3g; Tue, 31 Oct 2023 18:29:21 +0000
Received: by outflank-mailman (input) for mailman id 625998;
 Tue, 31 Oct 2023 18:29:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxtUN-0006Dc-HF
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 18:29:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxtUN-0003Ls-0C; Tue, 31 Oct 2023 18:29:19 +0000
Received: from [15.248.3.3] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxtUM-0002UF-Qg; Tue, 31 Oct 2023 18:29:18 +0000
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
	bh=2nzn+pwa9gtmFfoi64MK5wKwmYRZIZY4pyJqT0MLR+8=; b=YqwvQ6fuMfn42WKOqQgQaIATGh
	CrioUYC4MqmeheVAZjRUeQQKZL/DAvFQebK7i54wEaZpE5BnzMFnWXDbLuxC1R1HYBd6eXm3kIzlZ
	w8uwdIvZiNhqlJhUPdHOdgcOR2b5oiUDUQdRRjjWTQsebg7S1Eu8uNtj45ZYW2JNtyAw=;
Message-ID: <f098a07d-fa19-4b40-bfac-7b121524382a@xen.org>
Date: Tue, 31 Oct 2023 18:29:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
 <20231023021345.1731436-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231023021345.1731436-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

+Ayan

On 23/10/2023 03:13, Henry Wang wrote:
> Currently mmu_init_secondary_cpu() only enforces the page table
> should not contain mapping that are both Writable and eXecutables
> after boot. To ease the arch/arm/mm.c split work, fold this function
> to head.S.
> 
> For arm32, introduce an assembly macro pt_enforce_wxn. The macro is
> called before secondary CPUs jumping into the C world.
> 
> For arm64, set the SCTLR_Axx_ELx_WXN flag right when the MMU is
> enabled. This would avoid the extra TLB flush and SCTLR dance.

For a random reader, it is not clear why you can't set WnX early for 
arm32 as well. I think it would helpful to explain the difference. I.e. 
at the point the MMU is enabled, the page-tables may still contain 
mapping which are writable and executable.

> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Co-authored-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> v8:
> - Change the setting of SCTLR_Axx_ELx_WXN for arm64 to set the
>    flag right when the MMU is enabled.
> v7:
> - No change.
> v6:
> - New patch.
> ---
>   xen/arch/arm/arm32/head.S     | 20 ++++++++++++++++++++
>   xen/arch/arm/arm64/mmu/head.S | 18 +++++++++++-------
>   xen/arch/arm/include/asm/mm.h |  2 --
>   xen/arch/arm/mm.c             |  6 ------
>   xen/arch/arm/smpboot.c        |  2 --
>   5 files changed, 31 insertions(+), 17 deletions(-)
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

 From recent discussion on IRC, Ayan reminded me this patch [1]. 
Ideally, I would want to print a message just before to indicate that 
the bit is set. But I understand that this would need to be droppped in 
Ayan rework as we don't yet support early printk in enable_mmu().

While debugging an MMU issue on Arm32, I wrote a patch to sprinkle 
prints in the enable_mmu() code. I will clean-up the patch and send it.

I will add a print at that point. Meanwhile, I would move the call a few 
lines above? This will allow Ayan to drop [1].

>           PRINT("- Ready -\r\n")
>           /* Jump to C world */
>           mov_w r2, start_secondary
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index 88075ef083..df06cefbbe 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -264,10 +264,11 @@ ENDPROC(create_page_tables)
>    * Inputs:
>    *   x0 : Physical address of the page tables.

The inputs list should be updated to mention what x1 means.

>    *
> - * Clobbers x0 - x4
> + * Clobbers x0 - x6

Below, you only seem to introduce x5. So shouldn't this be: "Clobbers x0 
- x5"?

>    */
>   enable_mmu:
>           mov   x4, x0
> +        mov   x5, x1
>           PRINT("- Turning on paging -\r\n")
>   
>           /*
> @@ -283,6 +284,7 @@ enable_mmu:
>           mrs   x0, SCTLR_EL2
>           orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
>           orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
> +        orr   x0, x0, x5                /* Enable extra flags */
>           dsb   sy                     /* Flush PTE writes and finish reads */
>           msr   SCTLR_EL2, x0          /* now paging is enabled */
>           isb                          /* Now, flush the icache */
> @@ -297,16 +299,17 @@ ENDPROC(enable_mmu)
>    * Inputs:
>    *   lr : Virtual address to return to. >    *
> - * Clobbers x0 - x5
> + * Clobbers x0 - x6
>    */
>   ENTRY(enable_secondary_cpu_mm)
> -        mov   x5, lr
> +        mov   x6, lr
>   
>           load_paddr x0, init_ttbr
>           ldr   x0, [x0]
>   
> +        mov   x1, #SCTLR_Axx_ELx_WXN        /* Enable WxN from the start */
>           bl    enable_mmu
> -        mov   lr, x5
> +        mov   lr, x6
>   
>           /* Return to the virtual address requested by the caller. */
>           ret
> @@ -320,14 +323,15 @@ ENDPROC(enable_secondary_cpu_mm)
>    * Inputs:
>    *   lr : Virtual address to return to.
>    *
> - * Clobbers x0 - x5
> + * Clobbers x0 - x6
>    */
>   ENTRY(enable_boot_cpu_mm)
> -        mov   x5, lr
> +        mov   x6, lr
>   
>           bl    create_page_tables
>           load_paddr x0, boot_pgtable
>   
> +        mov   x1, #0        /* No extra SCTLR flags */
>           bl    enable_mmu
>   
>           /*
> @@ -337,7 +341,7 @@ ENTRY(enable_boot_cpu_mm)
>           ldr   x0, =1f
>           br    x0
>   1:
> -        mov   lr, x5
> +        mov   lr, x6
>           /*
>            * The 1:1 map may clash with other parts of the Xen virtual memory
>            * layout. As it is not used anymore, remove it completely to
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

[1] 
https://lore.kernel.org/all/20230911135942.791206-2-ayan.kumar.halder@amd.com/

-- 
Julien Grall

