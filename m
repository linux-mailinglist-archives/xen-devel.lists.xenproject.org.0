Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1FF876DAC
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 00:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690413.1076363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rijCx-0001Xm-Ay; Fri, 08 Mar 2024 23:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690413.1076363; Fri, 08 Mar 2024 23:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rijCx-0001WA-6e; Fri, 08 Mar 2024 23:00:55 +0000
Received: by outflank-mailman (input) for mailman id 690413;
 Fri, 08 Mar 2024 23:00:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rijCv-0001W4-ER
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 23:00:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rijCv-00045Y-0Y; Fri, 08 Mar 2024 23:00:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rijCu-0001dQ-KY; Fri, 08 Mar 2024 23:00:52 +0000
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
	bh=bc/IZ4AQvBbxrIptymI6T8NPQr21T6cU63Qn1bPFCG0=; b=JymAW1rY//dSiEi0wElrfjjG/L
	UAqfL/sNLRlUAFrCJC0uwW9/OTsbzK8BBriA0RaWUe49Arx9vTcV2MAbh+griEXHfUSPM4r+2lg3Z
	iPIqsBRs6F3bJ2rnCHZ8OhRgMi4AkPD8mAiB/DFod/dcJNvQk70krwlj2GTBRoQV5msE=;
Message-ID: <8e4677a7-0550-4f02-aa7a-3f499f955cb3@xen.org>
Date: Fri, 8 Mar 2024 23:00:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/15] xen/arm: add cache coloring support for Xen
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-15-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240129171811.21382-15-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 29/01/2024 17:18, Carlo Nonato wrote:
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index fa40b696dd..7926849ab1 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -427,6 +427,60 @@ fail:   PRINT("- Boot failed -\r\n")
>           b     1b
>   ENDPROC(fail)
>   
> +/*
> + * Copy Xen to new location and switch TTBR
> + * x0    ttbr
> + * x1    source address
> + * x2    destination address
> + * x3    length
> + *
> + * Source and destination must be word aligned, length is rounded up
> + * to a 16 byte boundary.
> + *
> + * MUST BE VERY CAREFUL when saving things to RAM over the copy
> + */
> +ENTRY(relocate_xen)
> +        /*
> +         * Copy 16 bytes at a time using:
> +         *   x9: counter
> +         *   x10: data
> +         *   x11: data
> +         *   x12: source
> +         *   x13: destination
> +         */
> +        mov     x9, x3
> +        mov     x12, x1
> +        mov     x13, x2
> +
> +1:      ldp     x10, x11, [x12], #16
> +        stp     x10, x11, [x13], #16
> +
> +        subs    x9, x9, #16
> +        bgt     1b
> +
> +        /*
> +         * Flush destination from dcache using:
> +         *   x9: counter
> +         *   x10: step
> +         *   x11: vaddr
> +         *
> +         * This is to ensure data is visible to the instruction cache
> +         */
> +        dsb   sy
> +
> +        mov   x9, x3
> +        ldr   x10, =dcache_line_bytes /* x10 := step */
> +        ldr   x10, [x10]
> +        mov   x11, x2
> +
> +1:      dc    cvac, x11
> +
> +        add   x11, x11, x10
> +        subs  x9, x9, x10
> +        bgt   1b
> +

I would add a comment here explaining you are relying on the dsb/isb in
switch_ttbr_id().

> +        b switch_ttbr_id
> +
>   /*
>    * Switch TTBR
>    *
> @@ -452,7 +506,8 @@ ENTRY(switch_ttbr_id)
>   
>           /*
>            * 5) Flush I-cache
> -         * This should not be necessary but it is kept for safety.
> +         * This should not be necessary in the general case, but it's needed
> +         * for cache coloring because in that case code is relocated.

I think there is missing "because" just after "in that case".

>            */
>           ic     iallu
>           isb
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index d2651c9486..07cf8040a2 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   
>   #include <xen/init.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/mm.h>
>   #include <xen/pfn.h>
>   
> @@ -125,27 +126,46 @@ void update_identity_mapping(bool enable)
>   }
>   
>   extern void switch_ttbr_id(uint64_t ttbr);
> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>   
>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>   
>   void __init switch_ttbr(uint64_t ttbr)
>   {
> -    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
> -    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
> +    vaddr_t vaddr, id_addr;
>       lpae_t pte;
>   
> +    if ( llc_coloring_enabled )
> +        vaddr = (vaddr_t)relocate_xen;
> +    else
> +        vaddr = (vaddr_t)switch_ttbr_id;
> +
> +    id_addr = virt_to_maddr(vaddr);
> +
>       /* Enable the identity mapping in the boot page tables */
>       update_identity_mapping(true);
>   
>       /* Enable the identity mapping in the runtime page tables */
> -    pte = pte_of_xenaddr((vaddr_t)switch_ttbr_id);
> +    pte = pte_of_xenaddr(vaddr);
>       pte.pt.table = 1;
>       pte.pt.xn = 0;
>       pte.pt.ro = 1;
>       write_pte(&xen_third_id[third_table_offset(id_addr)], pte);
>   
>       /* Switch TTBR */
> -    fn(ttbr);
> +    if ( llc_coloring_enabled )
> +    {
> +        relocate_xen_fn *fn = (relocate_xen_fn *)id_addr;
> +
> +        fn(ttbr, _start, (void *)BOOT_RELOC_VIRT_START, _end - _start);
> +    }
> +    else
> +    {
> +        switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
> +
> +        fn(ttbr);
> +    }
>   
>       /*
>        * Disable the identity mapping in the runtime page tables.
> diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
> index a3b546465b..7228c9fb82 100644
> --- a/xen/arch/arm/include/asm/mmu/layout.h
> +++ b/xen/arch/arm/include/asm/mmu/layout.h
> @@ -30,6 +30,7 @@
>    *  10M -  12M   Fixmap: special-purpose 4K mapping slots
>    *  12M -  16M   Early boot mapping of FDT
>    *  16M -  18M   Livepatch vmap (if compiled in)
> + *  16M -  22M   Cache-colored Xen text, data, bss (temporary, if compiled in)
>    *
>    *   1G -   2G   VMAP: ioremap and early_ioremap
>    *
> @@ -74,6 +75,8 @@
>   #define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
>   #define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
>   
> +#define BOOT_RELOC_VIRT_START   (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
> +
>   #ifdef CONFIG_LIVEPATCH
>   #define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
>   #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index eee1e80e2d..bbb39214a8 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -9,6 +9,7 @@
>   
>   #include <asm/processor.h>
>   #include <asm/sysregs.h>
> +#include <asm/setup.h>
>   
>   /* Return the LLC way size by probing the hardware */
>   unsigned int __init get_llc_way_size(void)
> @@ -62,7 +63,65 @@ unsigned int __init get_llc_way_size(void)
>       return line_size * num_sets;
>   }
>   
> -void __init arch_llc_coloring_init(void) {}
> +/**
> + * get_xen_paddr - get physical address to relocate Xen to
> + *
> + * Xen is relocated to as near to the top of RAM as possible and
> + * aligned to a XEN_PADDR_ALIGN boundary.
> + */
> +static paddr_t __init get_xen_paddr(uint32_t xen_size)
AFAICT, xen_size will be the size of a color. Is it possible that this 
will be bigger than 4GB? If so, this needs to be converted to a paddr_t.

> +{
> +    struct meminfo *mi = &bootinfo.mem;

AFAICT, you are not modifying meminfo. So this can be const.

> +    paddr_t min_size;
> +    paddr_t paddr = 0;
> +    int i;

unsigned int please. I understand this is re-imported previous code, but 
we should avoid re-introduce issues with it.

> +
> +    min_size = (xen_size + (XEN_PADDR_ALIGN-1)) & ~(XEN_PADDR_ALIGN-1);

coding style: space before/after -.

> +
> +    /* Find the highest bank with enough space. */
> +    for ( i = 0; i < mi->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &mi->bank[i];
> +        paddr_t s, e;
> +
> +        if ( bank->size >= min_size )
> +        {
> +            e = consider_modules(bank->start, bank->start + bank->size,
> +                                 min_size, XEN_PADDR_ALIGN, 0);
> +            if ( !e )
> +                continue;
> +
> +#ifdef CONFIG_ARM_32
> +            /* Xen must be under 4GB */
> +            if ( e > 0x100000000ULL )
> +                e = 0x100000000ULL;

Can you replace with GB(4)? This makes easier to confirm the constant 
are correct.

> +            if ( e < bank->start )
> +                continue;
> +#endif
> +
> +            s = e - min_size;
> +
> +            if ( s > paddr )
> +                paddr = s;
> +        }
> +    }
> +
> +    if ( !paddr )
> +        panic("Not enough memory to relocate Xen\n");
> +
> +    printk("Placing Xen at 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
> +           paddr, paddr + min_size);
> +
> +    return paddr;
> +}
> +
> +void __init arch_llc_coloring_init(void)
> +{
> +    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);

I would add BUG_ON(xen_bootmodule). This would make it easier that 
trying to figure a NULL pointer dereference.

> +
> +    xen_bootmodule->size = xen_colored_map_size();
> +    xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
> +}
>   
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 72725840b6..f3e4f6c304 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -7,6 +7,7 @@
>   
>   #include <xen/init.h>
>   #include <xen/libfdt/libfdt.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/sizes.h>
>   #include <xen/vmap.h>
>   
> @@ -15,6 +16,11 @@
>   /* Override macros from asm/page.h to make them work with mfn_t */
>   #undef mfn_to_virt
>   #define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
> +#undef virt_to_mfn
> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> +
> +#define virt_to_reloc_virt(virt) \
> +    (((vaddr_t)virt) - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
>   
>   /* Main runtime page tables */
>   
> @@ -69,6 +75,7 @@ static void __init __maybe_unused build_assertions(void)
>       /* 2MB aligned regions */
>       BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
>       BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
> +    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
>       /* 1GB aligned regions */
>   #ifdef CONFIG_ARM_32
>       BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
> @@ -132,7 +139,12 @@ static void __init __maybe_unused build_assertions(void)
>   
>   lpae_t __init pte_of_xenaddr(vaddr_t va)
>   {
> -    paddr_t ma = va + phys_offset;
> +    paddr_t ma;
> +
> +    if ( llc_coloring_enabled )
> +        ma = virt_to_maddr(virt_to_reloc_virt(va));
> +    else
> +        ma = va + phys_offset;
>   
>       return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
>   }
> @@ -218,9 +230,44 @@ static void xen_pt_enforce_wnx(void)
>       flush_xen_tlb_local();
>   }
>   
> +static void __init create_llc_coloring_mappings(void)
> +{
> +    lpae_t pte;
> +    unsigned int i;
> +    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);

Please add a BUILD_BUG_ON() just to confirm xen_bootmodule is not NULL.

> +    mfn_t mfn = maddr_to_mfn(xen_bootmodule->start);
> +
> +    for_each_xen_colored_mfn( mfn, i )
> +    {
> +        pte = mfn_to_xen_entry(mfn, MT_NORMAL);
> +        pte.pt.table = 1; /* level 3 mappings always have this bit set */
> +        xen_xenmap[i] = pte;
> +    }
> +
> +    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
> +    {
> +        vaddr_t va = BOOT_RELOC_VIRT_START + (i << XEN_PT_LEVEL_SHIFT(2));
> +
> +        pte = mfn_to_xen_entry(virt_to_mfn(xen_xenmap +
> +                                           i * XEN_PT_LPAE_ENTRIES),
> +                               MT_NORMAL);
> +        pte.pt.table = 1;
> +        write_pte(&boot_second[second_table_offset(va)], pte);
> +    }
> +}
> +
>   /*
> - * Boot-time pagetable setup.
> + * Boot-time pagetable setup with coloring support
>    * Changes here may need matching changes in head.S
> + *
> + * The cache coloring support consists of:
> + * - Create colored mapping that conforms to Xen color selection in xen_xenmap[]
> + * - Link the mapping in boot page tables using BOOT_RELOC_VIRT_START as vaddr
> + * - pte_of_xenaddr() takes care of translating addresses to the new space
> + *   during runtime page tables creation
> + * - Relocate xen and update TTBR with the new address in the colored space
> + *   (see switch_ttbr())
> + * - Protect the new space
>    */
>   void __init setup_pagetables(unsigned long boot_phys_offset)
>   {
> @@ -230,6 +277,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>   
>       phys_offset = boot_phys_offset;
>   
> +    if ( llc_coloring_enabled )
> +        create_llc_coloring_mappings();
> +
>       arch_setup_page_tables();
>   
>   #ifdef CONFIG_ARM_64
> @@ -257,13 +307,7 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>               break;
>           pte = pte_of_xenaddr(va);
>           pte.pt.table = 1; /* third level mappings always have this bit set */
> -        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> -        {
> -            pte.pt.xn = 0;
> -            pte.pt.ro = 1;
> -        }
> -        if ( is_kernel_rodata(va) )
> -            pte.pt.ro = 1;
> +        pte.pt.xn = 0; /* Permissions will be enforced later. Allow execution */

I feel this patch contains a lot of change that are cache coloring 
specific but somewhat different. I think you could have split in a more 
piece meal one which would have made the review easier.

No need to split this patch now, but if there are more place to change, 
then please consider to do them in separate patches.

>           xen_xenmap[i] = pte;
>       }
>   
> @@ -289,8 +333,43 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>       ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
>   #endif
>   
> +    if ( llc_coloring_enabled )
> +        ttbr = virt_to_maddr(virt_to_reloc_virt(THIS_CPU_PGTABLE));

You are using THIS_CPU_PGTABLE here, but technically it is only valid after

#ifdef CONFIG_ARM_32
	per_cpu(xen_pgtable, ...) = ...
#endif

AFAICT, you haven't moved it.

> +
>       switch_ttbr(ttbr);
>   
> +    /* Protect Xen */
> +    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
> +    {
> +        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
> +        lpae_t *entry = xen_xenmap + i;
> +
> +        if ( !is_kernel(va) )
> +            break;
> +
> +        pte = read_atomic(entry);
> +
> +        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> +        {
> +            pte.pt.xn = 0;
> +            pte.pt.ro = 1;
> +        } else if ( is_kernel_rodata(va) ) {
> +            pte.pt.ro = 1;
> +            pte.pt.xn = 1;
> +        } else {
> +            pte.pt.xn = 1;
> +            pte.pt.ro = 0;
> +        }
> +
> +        write_pte(entry, pte);
> +    }
> +
> +    /*
> +     * We modified live page-tables. Ensure the TBLs are invalidated

s/TBLs/TLBs/

> +     * before setting enforcing the WnX permissions.
> +     */
> +    flush_xen_tlb_local();
> +
>       xen_pt_enforce_wnx();
>   
>   #ifdef CONFIG_ARM_32
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 28f4761705..64a449f78d 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -816,8 +816,6 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>       /* Initialize traps early allow us to get backtrace when an error occurred */
>       init_traps();
>   
> -    setup_pagetables(boot_phys_offset);
> -
>       smp_clear_cpu_maps();
>   
>       device_tree_flattened = early_fdt_map(fdt_paddr);
> @@ -841,6 +839,9 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>   
>       llc_coloring_init();
>   
> +    setup_pagetables(boot_phys_offset);

Please add a comment on top explaining that setup_pagetables() relies on 
the cache coloring feature to be initalized.

> +    device_tree_flattened = early_fdt_map(fdt_paddr);
I understand why you are calling early_fdt_map(). But it reads odd that 
this is called twice. I think you want to explain in a comment why this 
is called again and why we don't unmap the previous one.

Cheers,

-- 
Julien Grall

