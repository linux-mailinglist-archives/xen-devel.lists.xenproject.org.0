Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D937ADF73
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 21:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608096.946384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkr1m-0004uf-49; Mon, 25 Sep 2023 19:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608096.946384; Mon, 25 Sep 2023 19:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkr1m-0004rc-0v; Mon, 25 Sep 2023 19:13:54 +0000
Received: by outflank-mailman (input) for mailman id 608096;
 Mon, 25 Sep 2023 19:13:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qkr1j-0004rW-SL
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 19:13:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qkr1j-0007yu-KI; Mon, 25 Sep 2023 19:13:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qkr1j-0003gn-Ex; Mon, 25 Sep 2023 19:13:51 +0000
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
	bh=K6qGTVmv7+soL2pl0jwKIt8jDr2v923IggDtx+r1+n0=; b=1nsxZMHzJkWPiB2wvUYFnD6bOS
	+WpQ2nnQ/tDsK+q9RRdXS1rX9D+q+wxvwCbJEA15KNe09PVwa7vQeqXeNb4SeCwUnJwYl1UhSu4Kp
	qb+p8d9qoobtSI03t+gBAMS9UTU2uG09IrYJyTu6RMS6NC1q69ptXg/erD7AvXV4BEi0=;
Message-ID: <d38de2e7-c691-4203-a267-a8c7bd42fe71@xen.org>
Date: Mon, 25 Sep 2023 20:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] xen/arm: Split MMU system SMP MM bringup code to
 mmu/smpboot.c
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-8-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230828013224.669433-8-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 28/08/2023 02:32, Henry Wang wrote:
> Move the code related to secondary page table initialization, clear
> boot page tables and the global variable definitions of these boot
> page tables from arch/arm/mm.c to arch/arm/mmu/smpboot.c
> 
> Drop the "static" attribute of arm32 global variable cpu0_pgtable,
> and declare it in the arm32 mm.h header, because this variable
> will be used by both arch/arm/mm.c and arch/arm/mmu/smpboot.c.

I don't think you need to export cpu0_pgtable. You can instead replace 
use with per_cpu(xen_pgtable, 0).

> 
> Take the opportunity to fix the in-code comment coding styles when
> possible.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v6:
> - Rework the original patch "[v5,07/13] xen/arm: Extract MMU-specific
>    code", only split the smpboot related code out in this patch.
> ---
>   xen/arch/arm/include/asm/arm32/mm.h |   1 +
>   xen/arch/arm/mm.c                   | 103 +----------------------
>   xen/arch/arm/mmu/Makefile           |   1 +
>   xen/arch/arm/mmu/smpboot.c          | 121 ++++++++++++++++++++++++++++
>   4 files changed, 124 insertions(+), 102 deletions(-)
>   create mode 100644 xen/arch/arm/mmu/smpboot.c
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
> index 856f2dbec4..0e149945f9 100644
> --- a/xen/arch/arm/include/asm/arm32/mm.h
> +++ b/xen/arch/arm/include/asm/arm32/mm.h
> @@ -6,6 +6,7 @@
>   #include <asm/lpae.h>
>   
>   DECLARE_PER_CPU(lpae_t *, xen_pgtable);
> +extern DEFINE_PAGE_TABLE(cpu0_pgtable);
>   
>   /*
>    * Only a limited amount of RAM, called xenheap, is always mapped on ARM32.
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b42814077c..f3ef0da0e3 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -27,39 +27,6 @@
>   #undef mfn_to_virt
>   #define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
>   
> -/* Static start-of-day pagetables that we use before the allocators
> - * are up. These are used by all CPUs during bringup before switching
> - * to the CPUs own pagetables.
> - *
> - * These pagetables have a very simple structure. They include:
> - *  - XEN_VIRT_SIZE worth of L3 mappings of xen at XEN_VIRT_START, boot_first
> - *    and boot_second are used to populate the tables down to boot_third
> - *    which contains the actual mapping.
> - *  - a 1:1 mapping of xen at its current physical address. This uses a
> - *    section mapping at whichever of boot_{pgtable,first,second}
> - *    covers that physical address.
> - *
> - * For the boot CPU these mappings point to the address where Xen was
> - * loaded by the bootloader. For secondary CPUs they point to the
> - * relocated copy of Xen for the benefit of secondary CPUs.
> - *
> - * In addition to the above for the boot CPU the device-tree is
> - * initially mapped in the boot misc slot. This mapping is not present
> - * for secondary CPUs.
> - *
> - * Finally, if EARLY_PRINTK is enabled then xen_fixmap will be mapped
> - * by the CPU once it has moved off the 1:1 mapping.
> - */
> -DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
> -#ifdef CONFIG_ARM_64
> -DEFINE_BOOT_PAGE_TABLE(boot_first);
> -DEFINE_BOOT_PAGE_TABLE(boot_first_id);
> -#endif
> -DEFINE_BOOT_PAGE_TABLE(boot_second_id);
> -DEFINE_BOOT_PAGE_TABLE(boot_third_id);
> -DEFINE_BOOT_PAGE_TABLE(boot_second);
> -DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));
> -
>   /* Main runtime page tables */
>   
>   /*
> @@ -80,7 +47,7 @@ static DEFINE_PAGE_TABLE(xen_first);
>   DEFINE_PER_CPU(lpae_t *, xen_pgtable);
>   #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
>   /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
> -static DEFINE_PAGE_TABLE(cpu0_pgtable);
> +DEFINE_PAGE_TABLE(cpu0_pgtable);
>   #endif
>   
>   /* Common pagetable leaves */
> @@ -277,13 +244,6 @@ static void xen_pt_enforce_wnx(void)
>       flush_xen_tlb_local();
>   }
>   
> -/* Clear a translation table and clean & invalidate the cache */
> -static void clear_table(void *table)
> -{
> -    clear_page(table);
> -    clean_and_invalidate_dcache_va_range(table, PAGE_SIZE);
> -}
> -
>   /* Boot-time pagetable setup.
>    * Changes here may need matching changes in head.S */
>   void __init setup_pagetables(unsigned long boot_phys_offset)
> @@ -362,67 +322,6 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>   #endif
>   }
>   
> -static void clear_boot_pagetables(void)
> -{
> -    /*
> -     * Clear the copy of the boot pagetables. Each secondary CPU
> -     * rebuilds these itself (see head.S).
> -     */
> -    clear_table(boot_pgtable);
> -#ifdef CONFIG_ARM_64
> -    clear_table(boot_first);
> -    clear_table(boot_first_id);
> -#endif
> -    clear_table(boot_second);
> -    clear_table(boot_third);
> -}
> -
> -#ifdef CONFIG_ARM_64
> -int init_secondary_pagetables(int cpu)
> -{
> -    clear_boot_pagetables();
> -
> -    /* Set init_ttbr for this CPU coming up. All CPus share a single setof
> -     * pagetables, but rewrite it each time for consistency with 32 bit. */
> -    init_ttbr = (uintptr_t) xen_pgtable + phys_offset;
> -    clean_dcache(init_ttbr);
> -    return 0;
> -}
> -#else
> -int init_secondary_pagetables(int cpu)
> -{
> -    lpae_t *first;
> -
> -    first = alloc_xenheap_page(); /* root == first level on 32-bit 3-level trie */
> -
> -    if ( !first )
> -    {
> -        printk("CPU%u: Unable to allocate the first page-table\n", cpu);
> -        return -ENOMEM;
> -    }
> -
> -    /* Initialise root pagetable from root of boot tables */
> -    memcpy(first, cpu0_pgtable, PAGE_SIZE);
> -    per_cpu(xen_pgtable, cpu) = first;
> -
> -    if ( !init_domheap_mappings(cpu) )
> -    {
> -        printk("CPU%u: Unable to prepare the domheap page-tables\n", cpu);
> -        per_cpu(xen_pgtable, cpu) = NULL;
> -        free_xenheap_page(first);
> -        return -ENOMEM;
> -    }
> -
> -    clear_boot_pagetables();
> -
> -    /* Set init_ttbr for this CPU coming up */
> -    init_ttbr = __pa(first);
> -    clean_dcache(init_ttbr);
> -
> -    return 0;
> -}
> -#endif
> -
>   /* MMU setup for secondary CPUS (which already have paging enabled) */
>   void mmu_init_secondary_cpu(void)
>   {
> diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
> index bdfc2e077d..0e82015ee1 100644
> --- a/xen/arch/arm/mmu/Makefile
> +++ b/xen/arch/arm/mmu/Makefile
> @@ -1 +1,2 @@
>   obj-y += pt.o
> +obj-y += smpboot.o
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> new file mode 100644
> index 0000000000..a673989d09
> --- /dev/null
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -0,0 +1,121 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/mmu/smpboot.c
> + *
> + * MMU system secondary CPUs MM bringup code.
> + */
> +
> +#include <xen/domain_page.h>
> +
> +/*
> + * Static start-of-day pagetables that we use before the allocators
> + * are up. These are used by all CPUs during bringup before switching
> + * to the CPUs own pagetables.
> + *
> + * These pagetables have a very simple structure. They include:
> + *  - XEN_VIRT_SIZE worth of L3 mappings of xen at XEN_VIRT_START, boot_first
> + *    and boot_second are used to populate the tables down to boot_third
> + *    which contains the actual mapping.
> + *  - a 1:1 mapping of xen at its current physical address. This uses a
> + *    section mapping at whichever of boot_{pgtable,first,second}
> + *    covers that physical address.
> + *
> + * For the boot CPU these mappings point to the address where Xen was
> + * loaded by the bootloader. For secondary CPUs they point to the
> + * relocated copy of Xen for the benefit of secondary CPUs.
> + *
> + * In addition to the above for the boot CPU the device-tree is
> + * initially mapped in the boot misc slot. This mapping is not present
> + * for secondary CPUs.
> + *
> + * Finally, if EARLY_PRINTK is enabled then xen_fixmap will be mapped
> + * by the CPU once it has moved off the 1:1 mapping.
> + */
> +DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
> +#ifdef CONFIG_ARM_64
> +DEFINE_BOOT_PAGE_TABLE(boot_first);
> +DEFINE_BOOT_PAGE_TABLE(boot_first_id);
> +#endif
> +DEFINE_BOOT_PAGE_TABLE(boot_second_id);
> +DEFINE_BOOT_PAGE_TABLE(boot_third_id);
> +DEFINE_BOOT_PAGE_TABLE(boot_second);
> +DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));

Strictly speaking, boot_* are also used for CPU0 but not in C code. That 
said, I am ok if there are moved here.

In the longer term, I would actually like to remove boot_*. This should 
already be possible for arm64 (in fact they are not used for secondary 
CPU bring-up). For arm32, it requires a bit more work.

Anyway, that's not a request for your series. :)

> +
> +/* Clear a translation table and clean & invalidate the cache */
> +static void clear_table(void *table)
> +{
> +    clear_page(table);
> +    clean_and_invalidate_dcache_va_range(table, PAGE_SIZE);
> +}
> +
> +static void clear_boot_pagetables(void)
> +{
> +    /*
> +     * Clear the copy of the boot pagetables. Each secondary CPU
> +     * rebuilds these itself (see head.S).
> +     */
> +    clear_table(boot_pgtable);
> +#ifdef CONFIG_ARM_64
> +    clear_table(boot_first);
> +    clear_table(boot_first_id);
> +#endif
> +    clear_table(boot_second);
> +    clear_table(boot_third);
> +}
> +
> +#ifdef CONFIG_ARM_64
> +int init_secondary_pagetables(int cpu)
> +{
> +    clear_boot_pagetables();
> +
> +    /*
> +     * Set init_ttbr for this CPU coming up. All CPus share a single setof
> +     * pagetables, but rewrite it each time for consistency with 32 bit.
> +     */
> +    init_ttbr = (uintptr_t) xen_pgtable + phys_offset;
> +    clean_dcache(init_ttbr);
> +    return 0;
> +}
> +#else
> +int init_secondary_pagetables(int cpu)
> +{
> +    lpae_t *first;
> +
> +    first = alloc_xenheap_page(); /* root == first level on 32-bit 3-level trie */
> +
> +    if ( !first )
> +    {
> +        printk("CPU%u: Unable to allocate the first page-table\n", cpu);
> +        return -ENOMEM;
> +    }
> +
> +    /* Initialise root pagetable from root of boot tables */
> +    memcpy(first, cpu0_pgtable, PAGE_SIZE);
> +    per_cpu(xen_pgtable, cpu) = first;
> +
> +    if ( !init_domheap_mappings(cpu) )
> +    {
> +        printk("CPU%u: Unable to prepare the domheap page-tables\n", cpu);
> +        per_cpu(xen_pgtable, cpu) = NULL;
> +        free_xenheap_page(first);
> +        return -ENOMEM;
> +    }
> +
> +    clear_boot_pagetables();
> +
> +    /* Set init_ttbr for this CPU coming up */
> +    init_ttbr = __pa(first);

init_ttbr will only be used by smpboot.c and assembly code. So I think 
the declaration needs to also be moved and the prototype moved to mmu/mm.h.

Cheers,

-- 
Julien Grall

