Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C184F825AF6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 20:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662343.1032428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLpcR-0001iJ-J1; Fri, 05 Jan 2024 19:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662343.1032428; Fri, 05 Jan 2024 19:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLpcR-0001fo-FG; Fri, 05 Jan 2024 19:12:35 +0000
Received: by outflank-mailman (input) for mailman id 662343;
 Fri, 05 Jan 2024 19:12:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLpcP-0001fg-RQ
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 19:12:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLpcO-0005b5-V4; Fri, 05 Jan 2024 19:12:32 +0000
Received: from [54.239.6.189] (helo=[192.168.15.166])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLpcO-0003hW-KH; Fri, 05 Jan 2024 19:12:32 +0000
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
	bh=ZKuVLz7mEta1/dzR8cFLC6y9HARFRP149zUSOGnpgkI=; b=xkHh33ZHEC8jVjEXEV01tplTaL
	0eCoSu75OZE9iAXEUwPI3cGOXz/EgRCcqRv6lYgBz8OfvSy/WBqs3mFRoc1Nxw2Cp0CkCWtXF85c9
	RUKJ2AXyd6r1P15MGKxbThVALlflbc1lYds0wCC6v6Y4KxaJT2tXOFC7oqWG22D1HZHk=;
Message-ID: <4553cc26-deb5-42ed-87b9-6cba2a5099eb@xen.org>
Date: Fri, 5 Jan 2024 19:12:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] xen/arm: add cache coloring support for Xen
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-14-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240102095138.17933-14-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 02/01/2024 09:51, Carlo Nonato wrote:
> This commit adds the cache coloring support for Xen own physical space.
> 
> It extends the implementation of setup_pagetables() to make use of Xen
> cache coloring configuration. Page tables construction is essentially the
> same except for the fact that PTEs point to a new temporary mapped,
> physically colored space.
> 
> The temporary mapping is also used to relocate Xen to the new physical
> space starting at the address taken from the old get_xen_paddr() function
> which is brought back for the occasion.
> The temporary mapping is finally converted to a mapping of the "old"
> (meaning the original physical space) Xen code, so that the boot CPU can
> actually address the variables and functions used by secondary CPUs until
> they enable the MMU. This happens when the boot CPU needs to bring up other
> CPUs (psci.c and smpboot.c) and when the TTBR value is passed to them
> (prepare_secondary_mm()).
> 
> Finally, since the alternative framework needs to remap the Xen text and
> inittext sections, this operation must be done in a coloring-aware way.
> The function xen_remap_colored() is introduced for that.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v5:
> - FIXME: consider_modules copy pasted since it got moved
> v4:
> - removed set_value_for_secondary() because it was wrongly cleaning cache
> - relocate_xen() now calls switch_ttbr_id()
> ---
>   xen/arch/arm/alternative.c              |   9 +-
>   xen/arch/arm/arm64/mmu/head.S           |  48 +++++++
>   xen/arch/arm/arm64/mmu/mm.c             |  26 +++-
>   xen/arch/arm/include/asm/llc-coloring.h |  16 +++
>   xen/arch/arm/include/asm/mm.h           |   7 +-
>   xen/arch/arm/llc-coloring.c             |  44 +++++++
>   xen/arch/arm/mmu/setup.c                |  82 +++++++++++-
>   xen/arch/arm/mmu/smpboot.c              |  11 +-
>   xen/arch/arm/psci.c                     |   9 +-
>   xen/arch/arm/setup.c                    | 165 +++++++++++++++++++++++-
>   xen/arch/arm/smpboot.c                  |   9 +-

This patch has is touching a lot of different components. I think this 
want to be split in more smaller chunk. It would also be help to mention 
what code has been copied from previous Xen. For instance, 
relocate_xen() is clearly a copy of f60658c6ae47.

>   11 files changed, 406 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index 016e66978b..54cbc2afad 100644
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
> @@ -209,8 +210,12 @@ void __init apply_alternatives_all(void)
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
> index 10774f30e4..6f0cc72897 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -419,6 +419,54 @@ fail:   PRINT("- Boot failed -\r\n")
>           b     1b
>   ENDPROC(fail)
>   
> +/* Copy Xen to new location and switch TTBR
> + * x0    ttbr
> + * x1    source address
> + * x2    destination address
> + * x3    length
> + *
> + * Source and destination must be word aligned, length is rounded up
> + * to a 16 byte boundary.
> + *
> + * MUST BE VERY CAREFUL when saving things to RAM over the copy */

If you plan to re-introduce code, then please at least make sure it 
match the coding style. For comments, it should be:

/*
  * Foo
  * Bar
  */

> +ENTRY(relocate_xen)
> +        /* Copy 16 bytes at a time using:
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
> +        /* Flush destination from dcache using:

I would explain why you need the flush. AFAICT, this is because you want 
the data to be visible to the instruction cache. I would also point out 
that you need the instruction cache flush in switch_ttbr_id() where the 
sentence "This should not be necessary ..." should be now reworked 
(AFAIK it is mandatory for cache coloring).

> +         * x9: counter
> +         * x10: step
> +         * x11: vaddr
> +         */
> +        dsb   sy        /* So the CPU issues all writes to the range */
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
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index d2651c9486..5a26d64ab7 100644
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
> @@ -125,27 +126,44 @@ void update_identity_mapping(bool enable)
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

Coding style: We tend to add a new line after variable declaration.

> +        fn(ttbr, _start, (void *)BOOT_RELOC_VIRT_START, _end - _start);
> +    }
> +    else
> +    {
> +        switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;

Ditto for the coding style.

> +        fn(ttbr);
> +    }
>   
>       /*
>        * Disable the identity mapping in the runtime page tables.
> diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/include/asm/llc-coloring.h
> index 5f9b0a8121..4d6071e50b 100644
> --- a/xen/arch/arm/include/asm/llc-coloring.h
> +++ b/xen/arch/arm/include/asm/llc-coloring.h
> @@ -12,11 +12,27 @@
>   #define __ASM_ARM_COLORING_H__
>   
>   #include <xen/init.h>
> +#include <xen/mm-frame.h>
> +
> +/**
> + * Iterate over each Xen mfn in the colored space.
> + * @mfn:    the current mfn. The first non colored mfn must be provided as the
> + *          starting point.
> + * @i:      loop index.
> + */
> +#define for_each_xen_colored_mfn(mfn, i)        \
> +    for ( i = 0, mfn = xen_colored_mfn(mfn);    \
> +          i < (_end - _start) >> PAGE_SHIFT;    \
> +          i++, mfn = xen_colored_mfn(mfn_add(mfn, 1)) )
>   
>   bool __init llc_coloring_init(void);
>   int dom0_set_llc_colors(struct domain *d);
>   int domain_set_llc_colors_from_str(struct domain *d, const char *str);
>   
> +paddr_t xen_colored_map_size(paddr_t size);
> +mfn_t xen_colored_mfn(mfn_t mfn);
> +void *xen_remap_colored(mfn_t xen_fn, paddr_t xen_size);
> +
>   #endif /* __ASM_ARM_COLORING_H__ */
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 1829c559d6..311f092cf2 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -203,12 +203,17 @@ extern unsigned long frametable_base_pdx;
>   
>   #define PDX_GROUP_SHIFT SECOND_SHIFT
>   
> +#define virt_to_reloc_virt(virt) \
> +    (((vaddr_t)virt) - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
> +
>   /* Boot-time pagetable setup */
> -extern void setup_pagetables(unsigned long boot_phys_offset);
> +extern void setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr);
>   /* Map FDT in boot pagetable */
>   extern void *early_fdt_map(paddr_t fdt_paddr);
>   /* Remove early mappings */
>   extern void remove_early_mappings(void);
> +/* Remove early LLC coloring mappings */
> +extern void remove_llc_coloring_mappings(void);
>   /* Prepare the memory subystem to bring-up the given secondary CPU */
>   extern int prepare_secondary_mm(int cpu);
>   /* Map a frame table to cover physical addresses ps through pe */
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index 99ea69ad39..f434efc45b 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -14,6 +14,7 @@
>   #include <xen/llc-coloring.h>
>   #include <xen/param.h>
>   #include <xen/types.h>
> +#include <xen/vmap.h>
>   
>   #include <asm/processor.h>
>   #include <asm/sysregs.h>
> @@ -38,6 +39,7 @@ static unsigned int __ro_after_init xen_num_colors;
>   
>   #define mfn_color_mask              (nr_colors - 1)
>   #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
> +#define mfn_set_color(mfn, color)   ((mfn_x(mfn) & ~mfn_color_mask) | (color))
>   
>   /*
>    * Parse the coloring configuration given in the buf string, following the
> @@ -354,6 +356,48 @@ unsigned int get_nr_llc_colors(void)
>       return nr_colors;
>   }
>   
> +paddr_t xen_colored_map_size(paddr_t size)
> +{
> +    return ROUNDUP(size * nr_colors, XEN_PADDR_ALIGN);
> +}
> + > +mfn_t xen_colored_mfn(mfn_t mfn)

Is this going to be used outside of boot? If not, then please add 
__init. If yes, then can you point me where?

> +{
> +    unsigned int i, color = mfn_to_color(mfn);
> +
> +    for( i = 0; i < xen_num_colors; i++ )
> +    {
> +        if ( color == xen_colors[i] )
> +            return mfn;
> +        else if ( color < xen_colors[i] )
> +            return mfn_set_color(mfn, xen_colors[i]);
> +    }
> +
> +    /* Jump to next color space (nr_colors mfns) and use the first color */
> +    return mfn_set_color(mfn_add(mfn, nr_colors), xen_colors[0]);
> +}
> +
> +void *xen_remap_colored(mfn_t xen_mfn, paddr_t xen_size)

I think this function can be __init.

> +{
> +    unsigned int i;
> +    void *xenmap;
> +    mfn_t *xen_colored_mfns;
> +
> +    xen_colored_mfns = xmalloc_array(mfn_t, xen_size >> PAGE_SHIFT);
> +    if ( !xen_colored_mfns )
> +        panic("Can't allocate LLC colored MFNs\n");
Let's try to limit the number of panic(). In this case, I think you 
should return NULL and let the caller decide.

> +
> +    for_each_xen_colored_mfn( xen_mfn, i )
> +    {
> +        xen_colored_mfns[i] = xen_mfn;
> +    }
> +
> +    xenmap = vmap(xen_colored_mfns, xen_size >> PAGE_SHIFT);
> +    xfree(xen_colored_mfns);
> +
> +    return xenmap;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 37b6d230ad..66b674eeab 100644
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
> @@ -39,6 +40,10 @@ DEFINE_PER_CPU(lpae_t *, xen_pgtable);
>   static DEFINE_PAGE_TABLE(cpu0_pgtable);
>   #endif
>   
> +#ifdef CONFIG_LLC_COLORING
> +static DEFINE_PAGE_TABLE(xen_colored_temp);
> +#endif

Does this actually need to be static? And if yes, then is it necessary 
to be kept the boot as completed?

Also, this is not going to be enough to cover Xen. See above.


> +
>   /* Common pagetable leaves */
>   /* Second level page table used to cover Xen virtual address space */
>   static DEFINE_PAGE_TABLE(xen_second);
> @@ -130,7 +135,12 @@ static void __init __maybe_unused build_assertions(void)
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
> @@ -216,11 +226,55 @@ static void xen_pt_enforce_wnx(void)
>       flush_xen_tlb_local();
>   }
>   
> +#ifdef CONFIG_LLC_COLORING
> +static void __init create_llc_coloring_mappings(paddr_t xen_paddr)
> +{
> +    lpae_t pte;
> +    unsigned int i;
> +    mfn_t mfn = maddr_to_mfn(xen_paddr);
> +
> +    for_each_xen_colored_mfn( mfn, i )
> +    {
> +        pte = mfn_to_xen_entry(mfn, MT_NORMAL);
> +        pte.pt.table = 1; /* level 3 mappings always have this bit set */
> +        xen_colored_temp[i] = pte;
> +    }
> +
> +    pte = mfn_to_xen_entry(virt_to_mfn(xen_colored_temp), MT_NORMAL);
> +    pte.pt.table = 1;
> +    write_pte(&boot_second[second_table_offset(BOOT_RELOC_VIRT_START)], pte);
> +}
> +
> +void __init remove_llc_coloring_mappings(void)
> +{
> +    int rc;
> +
> +    /* destroy the _PAGE_BLOCK mapping */
> +    rc = modify_xen_mappings(BOOT_RELOC_VIRT_START,
> +                             BOOT_RELOC_VIRT_START + SZ_2M,

See above, Xen can now be bigger than 2MB. The limit is 8MB and could 
change in the future.

> +                             _PAGE_BLOCK);
> +    BUG_ON(rc);
> +}
> +#else
> +static void __init create_llc_coloring_mappings(paddr_t xen_paddr) {}
> +void __init remove_llc_coloring_mappings(void) {}

Both should never be called when !CONFIG_LCC_COLORING, correct? If so, 
then please add ASSERT_UNREACHABLE() in their body.

> +#endif /* CONFIG_LLC_COLORING */
> +
>   /*
> - * Boot-time pagetable setup.
> + * Boot-time pagetable setup with coloring support
>    * Changes here may need matching changes in head.S
> + *
> + * The coloring support consists of:
> + * - Create a temporary colored mapping that conforms to Xen color selection.
> + * - pte_of_xenaddr takes care of translating the virtual addresses to the
> + *   new colored physical space and the returns the pte, so that the page table
> + *   initialization can remain the same.
> + * - Copy Xen to the new colored physical space by exploiting the temporary
> + *   mapping.
> + * - Update TTBR0_EL2 with the new root page table address.
>    */
> -void __init setup_pagetables(unsigned long boot_phys_offset)
> +
> +void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
>   {
>       uint64_t ttbr;
>       lpae_t pte, *p;
> @@ -228,6 +282,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>   
>       phys_offset = boot_phys_offset;
>   
> +    if ( llc_coloring_enabled )
> +        create_llc_coloring_mappings(xen_paddr);
> +
>       arch_setup_page_tables();
>   
>   #ifdef CONFIG_ARM_64
> @@ -281,10 +338,13 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>       pte.pt.table = 1;
>       xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
>   
> +    if ( llc_coloring_enabled )
> +        ttbr = virt_to_maddr(virt_to_reloc_virt(xen_pgtable));

xen_pgtable is only valid for Arm64. But rather than ifdef-ing. I would 
consder to move...

> +    else
>   #ifdef CONFIG_ARM_64
> -    ttbr = (uintptr_t) xen_pgtable + phys_offset;
> +        ttbr = (uintptr_t) xen_pgtable + phys_offset;
>   #else
> -    ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
> +        ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
>   #endif
>   
>       switch_ttbr(ttbr);
> @@ -294,6 +354,18 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>   #ifdef CONFIG_ARM_32
>       per_cpu(xen_pgtable, 0) = cpu0_pgtable;
>   #endif

.. these two lines before hand so you can use THIS_CPU_PGTABLE.

> +
> +    /*

Coding style: It looks like you have one space too much before /*.

> +    * Keep original Xen memory mapped because secondary CPUs still point to it
> +    * and a few variables needs to be accessed by the master CPU in order to
> +    * let them boot. This mapping will also replace the one created at the
> +    * beginning of setup_pagetables.
> +    */

It feels wrong to keep the full Xen (even temporarily) just for CPU 
bring-up. But I don't think this is necessary. The secondary CPUs 
outside of code in head.S, secondary CPU should only need to access to 
init_ttbr and smp_cpu_up.

The last one is already questionable because the CPU should never wait 
in Xen. Instead they would be held somewhere else. But that's separate 
issue.

Anyway, if you move init_ttbr and smp_cpu_up in the identity mapped 
area, then you will not need to copy of Xen. Instead, secondary CPUs 
should be able to jump to the new Xen directly.

This will also avoid to spread cache coloring changes in every Xen 
components.

> +    if ( llc_coloring_enabled )
> +        map_pages_to_xen(BOOT_RELOC_VIRT_START,
> +                         maddr_to_mfn(XEN_VIRT_START + phys_offset),
> +                         SZ_2M >> PAGE_SHIFT, PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +
>   }
>   
>   void *__init arch_vmap_virt_end(void)
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> index b6fc0aae07..a69183ec88 100644
> --- a/xen/arch/arm/mmu/smpboot.c
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <xen/domain_page.h>
> +#include <xen/llc-coloring.h>
>   
>   #include <asm/setup.h>
>   
> @@ -71,14 +72,20 @@ static void clear_boot_pagetables(void)
>   #ifdef CONFIG_ARM_64
>   int prepare_secondary_mm(int cpu)
>   {
> +    uint64_t *init_ttbr_addr = &init_ttbr;
> +
>       clear_boot_pagetables();
>   
> +    if ( llc_coloring_enabled )
> +        init_ttbr_addr = (uint64_t *)virt_to_reloc_virt(&init_ttbr);
> +
>       /*
>        * Set init_ttbr for this CPU coming up. All CPUs share a single setof
>        * pagetables, but rewrite it each time for consistency with 32 bit.
>        */
> -    init_ttbr = virt_to_maddr(xen_pgtable);
> -    clean_dcache(init_ttbr);
> +    *init_ttbr_addr = virt_to_maddr(xen_pgtable);
> +    clean_dcache(*init_ttbr_addr);
> +
>       return 0;
>   }
>   #else
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 695d2fa1f1..23e298c477 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -11,6 +11,7 @@
>   
>   #include <xen/types.h>
>   #include <xen/init.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/mm.h>
>   #include <xen/smp.h>
>   #include <asm/cpufeature.h>
> @@ -39,9 +40,13 @@ static uint32_t psci_cpu_on_nr;
>   int call_psci_cpu_on(int cpu)
>   {
>       struct arm_smccc_res res;
> +    vaddr_t init_secondary_addr = (vaddr_t)init_secondary;
>   
> -    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
> -                  &res);
> +    if ( llc_coloring_enabled )
> +        init_secondary_addr = virt_to_reloc_virt(init_secondary);
> +
> +    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
> +                  __pa(init_secondary_addr), &res);
>   
>       return PSCI_RET(res);
>   }

[...]

> +#ifdef CONFIG_LLC_COLORING
> +/**
> + * get_xen_paddr - get physical address to relocate Xen to
> + *
> + * Xen is relocated to as near to the top of RAM as possible and
> + * aligned to a XEN_PADDR_ALIGN boundary.
> + */
> +static paddr_t __init get_xen_paddr(uint32_t xen_size)
> +{
> +    struct meminfo *mi = &bootinfo.mem;
> +    paddr_t min_size;
> +    paddr_t paddr = 0;
> +    int i;
> +
> +    min_size = (xen_size + (XEN_PADDR_ALIGN-1)) & ~(XEN_PADDR_ALIGN-1);
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
> +#else
> +static paddr_t __init get_xen_paddr(uint32_t xen_size) { return 0; }
> +#endif
> +
>   void __init init_pdx(void)
>   {
>       paddr_t bank_start, bank_size, bank_end;
> @@ -724,8 +874,6 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>       /* Initialize traps early allow us to get backtrace when an error occurred */
>       init_traps();
>   
> -    setup_pagetables(boot_phys_offset);
> -
>       smp_clear_cpu_maps();
>   
>       device_tree_flattened = early_fdt_map(fdt_paddr);
> @@ -751,8 +899,13 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>       {
>           if ( !llc_coloring_init() )
>               panic("Xen LLC coloring support: setup failed\n");
> +        xen_bootmodule->size = xen_colored_map_size(_end - _start);
> +        xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);

As you update xen_bootmodule, wouldn't this mean that the non-relocated 
Xen would could be passed to the bootallocator?

>       } >
> +    setup_pagetables(boot_phys_offset, xen_bootmodule->start);

The new placement of setup_pagetables() deserve an explanation.

> +    device_tree_flattened = early_fdt_map(fdt_paddr);
> +
>       setup_mm();
>   
>       /* Parse the ACPI tables for possible boot-time configuration */
> @@ -867,6 +1020,14 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>   
>       setup_virt_paging();
>   
> +    /*
> +     * The removal is done earlier than discard_initial_modules beacuse the

Typo: s/beacuase/because/

> +     * livepatch init uses a virtual address equal to BOOT_RELOC_VIRT_START.
> +     * Remove LLC coloring mappings to expose a clear state to the livepatch
> +     * module.
> +     */
> +    if ( llc_coloring_enabled )
> +        remove_llc_coloring_mappings();
>       do_initcalls();
>   
>       /*
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7110bc11fc..7ed7357d58 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -14,6 +14,7 @@
>   #include <xen/domain_page.h>
>   #include <xen/errno.h>
>   #include <xen/init.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/mm.h>
>   #include <xen/param.h>
>   #include <xen/sched.h>
> @@ -444,6 +445,7 @@ int __cpu_up(unsigned int cpu)
>   {
>       int rc;
>       s_time_t deadline;
> +    unsigned long *smp_up_cpu_addr = &smp_up_cpu;
>   
>       printk("Bringing up CPU%d\n", cpu);
>   
> @@ -459,9 +461,12 @@ int __cpu_up(unsigned int cpu)
>       /* Tell the remote CPU what its logical CPU ID is. */
>       init_data.cpuid = cpu;
>   
> +    if ( llc_coloring_enabled )
> +        smp_up_cpu_addr = (unsigned long *)virt_to_reloc_virt(&smp_up_cpu);
> +
>       /* Open the gate for this CPU */
> -    smp_up_cpu = cpu_logical_map(cpu);
> -    clean_dcache(smp_up_cpu);
> +    *smp_up_cpu_addr = cpu_logical_map(cpu);
> +    clean_dcache(*smp_up_cpu_addr);
>   
>       rc = arch_cpu_up(cpu);
>   

Cheers,

-- 
Julien Grall

