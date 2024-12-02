Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD4C9E0E0D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 22:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847117.1262251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIEDX-0000wS-C0; Mon, 02 Dec 2024 21:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847117.1262251; Mon, 02 Dec 2024 21:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIEDX-0000u5-7w; Mon, 02 Dec 2024 21:44:31 +0000
Received: by outflank-mailman (input) for mailman id 847117;
 Mon, 02 Dec 2024 21:44:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tIEDV-0000tz-QK
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 21:44:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIEDU-000Q1B-2q;
 Mon, 02 Dec 2024 21:44:29 +0000
Received: from [2a02:8012:3a1:0:c6e:c614:26eb:b495]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIEDU-00BFHj-2h;
 Mon, 02 Dec 2024 21:44:29 +0000
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
	bh=E4zctEyqEng8Qz8EtwEcpCCuurG450RkiGhedUO1H1A=; b=2FfJQjw9TCPaUBLaOjM7vmbpgs
	YZoUwoqZr7wQyN9IMuC7EG5jIm2SaCGIA0946vArAumYkAUMWVjyCK4NLG/H5AVs58OUNBLY3QeOv
	x+fv2ZjZ9EpZGUHnGoCyobugfBW+GSB1L4lfGTkWqzxe8/kLrc55OY6i7EqG4SZYdMcU=;
Message-ID: <800b0b49-e6c5-4a83-8ee6-d89d51613b0c@xen.org>
Date: Mon, 2 Dec 2024 21:44:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/12] xen/arm: add cache coloring support for Xen
 image
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-13-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241202165921.249585-13-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

I appreciate this is v11. So I will try to keep the comments to only 
what I consider important to fix and some coding style issue.

On 02/12/2024 16:59, Carlo Nonato wrote:
> ---
>   xen/arch/arm/alternative.c            | 30 +++++++-
>   xen/arch/arm/arm64/mmu/head.S         | 58 +++++++++++++++-
>   xen/arch/arm/arm64/mmu/mm.c           | 28 ++++++--
>   xen/arch/arm/include/asm/mmu/layout.h |  3 +
>   xen/arch/arm/llc-coloring.c           | 63 +++++++++++++++++
>   xen/arch/arm/mmu/setup.c              | 99 +++++++++++++++++++++++----
>   xen/arch/arm/setup.c                  | 10 ++-
>   xen/common/llc-coloring.c             | 18 +++++
>   xen/include/xen/llc-coloring.h        | 14 ++++
>   9 files changed, 302 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index d99b507093..0fcf4e451d 100644
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -9,6 +9,7 @@
>   #include <xen/init.h>
>   #include <xen/types.h>
>   #include <xen/kernel.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/mm.h>
>   #include <xen/vmap.h>
>   #include <xen/smp.h>
> @@ -191,6 +192,27 @@ static int __apply_alternatives_multi_stop(void *xenmap)
>       return 0;
>   }
>   
> +static void __init *xen_remap_colored(mfn_t xen_mfn, paddr_t xen_size)
> +{
> +    unsigned int i;
> +    void *xenmap;
> +    mfn_t *xen_colored_mfns, mfn;
> +
> +    xen_colored_mfns = xmalloc_array(mfn_t, xen_size >> PAGE_SHIFT);
 > +    if ( !xen_colored_mfns )> +        panic("Can't allocate LLC 
colored MFNs\n");
> +
> +    for_each_xen_colored_mfn ( xen_mfn, mfn, i )
> +    {
> +        xen_colored_mfns[i] = mfn;
> +    }

NIT: Parenthesis should not be necessary.

> +
> +    xenmap = vmap(xen_colored_mfns, xen_size >> PAGE_SHIFT);
 > +    xfree(xen_colored_mfns);> +
> +    return xenmap;
> +}
> +
>   /*
>    * This function should only be called during boot and before CPU0 jump
>    * into the idle_loop.
> @@ -209,8 +231,12 @@ void __init apply_alternatives_all(void)
>        * The text and inittext section are read-only. So re-map Xen to
>        * be able to patch the code.
>        */
> -    xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
> -                    VMAP_DEFAULT);
> +    if ( llc_coloring_enabled )
> +        xenmap = xen_remap_colored(xen_mfn, xen_size);
> +    else
> +        xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
> +                        VMAP_DEFAULT);
> +
>       /* Re-mapping Xen is not expected to fail during boot. */
>       BUG_ON(!xenmap);
>   
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index 665a51a337..a1fc9a82f1 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -428,6 +428,61 @@ FUNC_LOCAL(fail)
>           b     1b
>   END(fail)
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

We are trying to get rid of ENTRY. Instead, please use FUNC().

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

The comments implies that the only reason we need to flush the cache is 
to ensure the data and cache is coherent. But...

> +        dsb   sy
> +
> +        mov   x9, x3
> +        ldr   x10, =dcache_line_bytes /* x10 := step */
 > +        ldr   x10, [x10]> +        mov   x11, x2
> +
> +1:      dc    cvac, x11

... here you use Point of Coherency. Point of Unification should be 
sufficient here. This is boot code, so I am not against having stricter 
cache maintenance. But it would be good to clarify.

> +
> +        add   x11, x11, x10
> +        subs  x9, x9, x10
> +        bgt   1b
> +
> +        /* No need for dsb/isb because they are alredy done in switch_ttbr_id */
> +        b switch_ttbr_id
> +
>   /*
>    * Switch TTBR
>    *
> @@ -453,7 +508,8 @@ FUNC(switch_ttbr_id)
>   
>           /*
>            * 5) Flush I-cache
> -         * This should not be necessary but it is kept for safety.
> +         * This should not be necessary in the general case, but it's needed
> +         * for cache coloring because code is relocated in that case.
>            */
>           ic     iallu
>           isb
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 671eaadbc1..3732d5897e 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
>   #include <xen/init.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/mm.h>
>   #include <xen/pfn.h>
>   
> @@ -138,27 +139,46 @@ void update_boot_mapping(bool enable)
>   }
>   
>   extern void switch_ttbr_id(uint64_t ttbr);
> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>   
>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>   
>   void __init switch_ttbr(uint64_t ttbr)

Given the change below, I think this function needs to be renamed. 
Possibly to relocate_and_jump() with a comment explaning that the 
relocation only happen for cache-coloring.

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

This comment needs to be updated.

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
> index a3b546465b..19c0ec63a5 100644
> --- a/xen/arch/arm/include/asm/mmu/layout.h
> +++ b/xen/arch/arm/include/asm/mmu/layout.h
> @@ -30,6 +30,7 @@
>    *  10M -  12M   Fixmap: special-purpose 4K mapping slots
>    *  12M -  16M   Early boot mapping of FDT
>    *  16M -  18M   Livepatch vmap (if compiled in)
> + *  16M -  24M   Cache-colored Xen text, data, bss (temporary, if compiled in)
>    *
>    *   1G -   2G   VMAP: ioremap and early_ioremap
>    *
> @@ -74,6 +75,8 @@
>   #define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
>   #define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
>   
> +#define BOOT_RELOC_VIRT_START   (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
 > +>   #ifdef CONFIG_LIVEPATCH
>   #define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
>   #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index 6c8fa6b576..8e10a505db 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -10,6 +10,7 @@
>   #include <xen/types.h>
>   
>   #include <asm/processor.h>
> +#include <asm/setup.h>
>   #include <asm/sysregs.h>
>   
>   /* Return the LLC way size by probing the hardware */
> @@ -64,8 +65,70 @@ unsigned int __init get_llc_way_size(void)
>       return line_size * num_sets;
>   }
>   
> +/**
> + * get_xen_paddr - get physical address to relocate Xen to
> + *
> + * Xen is relocated to as near to the top of RAM as possible and
> + * aligned to a XEN_PADDR_ALIGN boundary.
> + */
> +static paddr_t __init get_xen_paddr(paddr_t xen_size)
> +{
> +    const struct membanks *mem = bootinfo_get_mem();
> +    paddr_t min_size, paddr = 0;
> +    unsigned int i;
> +
> +    min_size = (xen_size + (XEN_PADDR_ALIGN-1)) & ~(XEN_PADDR_ALIGN-1);

Style: Missing space before *and* after '-' in both cases.

But effectively, this is an open-coded version of ROUNDUP().

> +
> +    /* Find the highest bank with enough space. */
> +    for ( i = 0; i < mem->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &mem->bank[i];
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
> +            if ( e > GB(4) )
> +                e = GB(4);
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

[...]

> +static void __init create_llc_coloring_mappings(void)
> +{
> +    lpae_t pte;
> +    unsigned int i;
> +    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
 > +    mfn_t start_mfn = maddr_to_mfn(xen_bootmodule->start), mfn;> +
> +    for_each_xen_colored_mfn ( start_mfn, mfn, i )
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

I am a bit confused with this change. I agree you added support for 
cache coloring, but the code is still doing the same thing: Preparing 
the page-tables regardless on whether this is cache coloring or not.

So I would say this update is not warrant.

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

Similarly here. Most of what is written has nothing to do with cache 
coloring. So I think this comment needs to be made a bit more generic.

>    */
>   void __init setup_pagetables(void)
>   {
> @@ -326,6 +369,9 @@ void __init setup_pagetables(void)
>       lpae_t pte, *p;
>       int i;
>   
> +    if ( llc_coloring_enabled )
> +        create_llc_coloring_mappings();
> +
>       arch_setup_page_tables();
>   
>   #ifdef CONFIG_ARM_64
> @@ -353,13 +399,7 @@ void __init setup_pagetables(void)
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
>           xen_xenmap[i] = pte;
>       }
>   
> @@ -385,13 +425,48 @@ void __init setup_pagetables(void)
>       ttbr = virt_to_maddr(cpu0_pgtable);
>   #endif
>   
> -    switch_ttbr(ttbr);
> -
> -    xen_pt_enforce_wnx();
> -
>   #ifdef CONFIG_ARM_32
>       per_cpu(xen_pgtable, 0) = cpu0_pgtable;
>   #endif
> +
> +    if ( llc_coloring_enabled )
> +        ttbr = virt_to_maddr(virt_to_reloc_virt(THIS_CPU_PGTABLE));

The logic is a bit difficult to understand. You first update ttbr above:

ttbr = virt_to_maddr(cpu0_pgtable);

But then overwrite it for cache coloring. virt_to_maddr() is also not a 
trivial function.

So I think it would be better to write the following:

#ifdef CONFIG_ARM_32
per_cpu(xen_pgtable, 0) = cpu0_pgtable;
#endif

if ( llc_coloring_enabled )
   ttbr = virt_to_maddr(virt_to_reloc_virt(...));
else
   ttbr = virt_to_maddr(THIS_CPU_PGTABLE);

 > +> +    switch_ttbr(ttbr);
> +
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

Coding style:

}
else if
{
...
}
else
{
...
}

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
> +     * We modified live page-tables. Ensure the TLBs are invalidated
> +     * before setting enforcing the WnX permissions.
> +     */
> +    flush_xen_tlb_local();
> +
> +    xen_pt_enforce_wnx();
>   }

Cheers,

-- 
Julien Grall


