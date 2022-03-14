Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F44D8F22
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 22:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290467.492615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTsiM-0004lG-Q7; Mon, 14 Mar 2022 21:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290467.492615; Mon, 14 Mar 2022 21:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTsiM-0004hl-MB; Mon, 14 Mar 2022 21:58:54 +0000
Received: by outflank-mailman (input) for mailman id 290467;
 Mon, 14 Mar 2022 21:58:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTsiK-0004he-Gn
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 21:58:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTsiJ-0005th-QG; Mon, 14 Mar 2022 21:58:51 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTsiJ-0007IQ-GA; Mon, 14 Mar 2022 21:58:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=HyAYD4ovjWOWEyEbghE36rUuqJ6Y0G9aLSKDAU2dNNw=; b=60Il0xISd/QxJzhMnRu1oHdsUN
	32rDWg1FzmP5AT5AQUBzguYa9e0tNiOwq9lP7oXwuLmw3Fxti7yBdTn5XAWV3nQKMGyYospkJDT1g
	OPaRsYqKCZy8LdDpPOo22UdyJXsSqm0Jdq0l/O7Zroo4GLBeTAFeOpVWDXTKAX7YnWeE=;
Message-ID: <7f4da97f-643a-8d25-4f76-b58cf1833fc3@xen.org>
Date: Mon, 14 Mar 2022 21:58:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-28-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 27/36] xen/arch: add coloring support for Xen
In-Reply-To: <20220304174701.1453977-28-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Introduce a new implementation of setup_pagetables that uses coloring
> logic in order to isolate Xen code using its color selection.
> Page tables construction is essentially copied, except for the xenmap
> table, where coloring logic is needed.  Given the absence of a contiguous
> physical mapping, pointers to next level tables need to be manually
> calculated.
> 
> Xen code is relocated in strided mode using the same coloring logic as
> the one in xenmap table by using a temporary colored mapping that will
> be destroyed after switching the TTBR register.
> 
> Keep Xen text section mapped in the newly created pagetables.
> The boot process relies on computing needed physical addresses of Xen
> code by using a shift, but colored mapping is not linear and not easily
> computable. Therefore, the old Xen code is temporarily kept and used to
> boot secondary CPUs until they switch to the colored mapping, which is
> accessed using the handy macro virt_old.  After the boot process, the old
> Xen code memory is reset and its mapping is destroyed.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   xen/arch/arm/include/asm/coloring.h |  13 ++
>   xen/arch/arm/include/asm/mm.h       |   7 ++
>   xen/arch/arm/mm.c                   | 186 +++++++++++++++++++++++++++-
>   xen/arch/arm/psci.c                 |   4 +-
>   xen/arch/arm/setup.c                |  21 +++-
>   xen/arch/arm/smpboot.c              |  19 ++-
>   6 files changed, 241 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index 8c4525677c..424f6c2b04 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -26,6 +26,17 @@
>   #ifdef CONFIG_COLORING
>   #include <xen/sched.h>
>   
> +/*
> + * Amount of memory that we need to map in order to color Xen.  The value
> + * depends on the maximum number of available colors of the hardware.  The
> + * memory size is pessimistically calculated assuming only one color is used,
> + * which means that any pages belonging to any other color has to be skipped.
> + */
> +#define XEN_COLOR_MAP_SIZE \
> +	((((_end - _start) * get_max_colors())\
> +		+ (XEN_PADDR_ALIGN-1)) & ~(XEN_PADDR_ALIGN-1))

This is an open-coded version of ROUNDUP. Looking at the number, if we 
assume the maximum number of colors (128) and Xen of 2MB. We would end 
up to reserve 256MB of memory for Xen.

This sounds quite a lot to me. This might be acceptable for a first 
approach, but I am wondering if there are a way to reduce the size?

> +#define XEN_COLOR_MAP_SIZE_M (XEN_COLOR_MAP_SIZE >> 20)
> +
>   bool __init coloring_init(void);
>   
>   /*
> @@ -67,6 +78,8 @@ unsigned long color_from_page(struct page_info *pg);
>   /* Return the maximum available number of colors supported by the hardware */
>   uint32_t get_max_colors(void);
>   #else /* !CONFIG_COLORING */
> +#define XEN_COLOR_MAP_SIZE (_end - _start)
> +
>   static inline bool __init coloring_init(void)
>   {
>       return true;
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 041ec4ee70..1422091436 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -362,6 +362,13 @@ void clear_and_clean_page(struct page_info *page);
>   
>   unsigned int arch_get_dma_bitsize(void);
>   
> +#ifdef CONFIG_COLORING
> +#define virt_boot_xen(virt)\
> +    (vaddr_t)((virt - XEN_VIRT_START) + BOOT_RELOC_VIRT_START)
> +#else
> +#define virt_boot_xen(virt) virt
> +#endif
> +
>   #endif /*  __ARCH_ARM_MM__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index d69f18b5d2..53ea13641b 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -42,6 +42,7 @@
>   #include <xen/libfdt/libfdt.h>
>   
>   #include <asm/setup.h>
> +#include <asm/coloring.h>
>   
>   /* Override macros from asm/page.h to make them work with mfn_t */
>   #undef virt_to_mfn
> @@ -110,6 +111,9 @@ DEFINE_BOOT_PAGE_TABLE(boot_second_id);
>   DEFINE_BOOT_PAGE_TABLE(boot_third_id);
>   DEFINE_BOOT_PAGE_TABLE(boot_second);
>   DEFINE_BOOT_PAGE_TABLE(boot_third);
> +#ifdef CONFIG_COLORING
> +DEFINE_BOOT_PAGE_TABLE(boot_colored_xen);
> +#endif

DEFINE_BOOT_PAGE_TABLE() should only be used for page-tables that will 
be used before switching to the C world. AFAICT, boot_colored_xen is 
only going to be access in the C world, so you should use 
DEFINE_PAGE_TABLE().

>   
>   /* Main runtime page tables */
>   
> @@ -632,6 +636,166 @@ static void clear_table(void *table)
>       clean_and_invalidate_dcache_va_range(table, PAGE_SIZE);
>   }
>   
> +#ifdef CONFIG_COLORING
> +/*
> + * Translate a Xen (.text) virtual address to the colored physical one
> + * depending on the hypervisor configuration.
> + * N.B: this function must be used only when migrating from non colored to
> + * colored pagetables since it assumes to have the temporary mappings created
> + * during setup_pagetables that starts from BOOT_RELOC_VIRT_START.
> + * After the migration we have to use virt_to_maddr.
> + */
> +static paddr_t virt_to_maddr_colored(vaddr_t virt)
> +{
> +    unsigned int va_offset;
> +
> +    va_offset = virt - XEN_VIRT_START;
> +    return __pa(BOOT_RELOC_VIRT_START + va_offset);
> +}
> +
> +static void __init coloring_temp_mappings(paddr_t xen_paddr, vaddr_t virt_start)

This code is making some assumptions about virt_start (e.g. it has to be 
in the first 512MB of the address space. Given that the address is 
always the same, I think it would be better to drop the parameter and 
hardocode the value.

> +{
> +    int i;

unsigned int please.

> +    lpae_t pte;
> +    unsigned int xen_text_size = (_end - _start);
> +
> +    xen_text_size = PAGE_ALIGN(xen_text_size);

None of the memory between _end and the next page can really be used for 
other purpose. So I think it would be better to make sure that _end is 
always page aligned.

To do that, you would need to modify xen.lds.S.

> +
> +    pte = mfn_to_xen_entry(maddr_to_mfn(__pa(boot_second)), MT_NORMAL);

maddr_to_mfn(__pa()) is an open-coded version of virt_to_mfn().

> +    pte.pt.table = 1;
> +    boot_first[first_table_offset(virt_start)] = pte;
> +
> +    pte = mfn_to_xen_entry(maddr_to_mfn(__pa(boot_colored_xen)), MT_NORMAL);
> +    pte.pt.table = 1;
> +    boot_second[second_table_offset(virt_start)] = pte;

This is live page-table. So you want to use write_pte(). Also, I would 
link the page table *after* boot_colored_xen has been fully populated.

If you don't do that, you would need to use write_pte() as well below.

> +
> +    for ( i = 0; i < (xen_text_size/PAGE_SIZE); i++ )

Coding style: missing space before and after '/'.

> +    {
> +        mfn_t mfn;

Coding style: we usually add a blank line after the declarations.

That said, this variable seems to be a bit pointless as you use it only 
once below.

> +        xen_paddr = next_xen_colored(xen_paddr);
> +        mfn = maddr_to_mfn(xen_paddr);
> +        pte = mfn_to_xen_entry(mfn, MT_NORMAL);
> +        pte.pt.table = 1; /* 4k mappings always have this bit set */

For new code, I would like if we avoid mentionning a particular page and 
use the level where the mapping happens. In this case, it would be a 
level 3 mapping.

> +        boot_colored_xen[i] = pte;
> +        xen_paddr += PAGE_SIZE;
> +    }
> + > +   flush_xen_tlb_local();

The flush is not necessary as the entry in boot_second should be freed. 
If it were not, then you would have to use the break-before-make 
sequence (i.e. remove the entry, flush, add the entry) to avoid any issue.

> +}
> +
> +/*
> + * Boot-time pagetable setup with coloring support
> + * Changes here may need matching changes in head.S

I am not overly happy to see setup_pagetables() completely duplicated. I 
hope we can drop the non-coloring version at some point, but in the 
meantime I think we should try to adapt the existing one.

This would also help to review/maintain the code.

> + *
> + * The process can be explained as follows:
> + * - Create a temporary colored mapping that conforms to Xen color selection.
> + * - Update all the pagetables links that point to the next level table(s):
> + * this process is crucial beacause the translation tables are not physically
> + * contiguous and we cannot calculate the physical addresses by using the
> + * standard method (physical offset). In order to get the correct physical
> + * address we use virt_to_maddr_colored that translates the virtual address
> + * into a physical one based on the Xen coloring configuration.
> + * - Copy Xen to the new location.
> + * - Update TTBR0_EL2 with the new root page table address.
> + */
> +void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
> +{
> +    int i;
> +    lpae_t pte, *p;
> +    paddr_t pt_phys;
> +    mfn_t pt_phys_mfn;
> +    paddr_t _xen_paddr = xen_paddr;
> +
> +    phys_offset = boot_phys_offset;
> +
> +    ASSERT((_end - _start) < SECOND_SIZE);

_end and _start are not going to change. So I think this should be an 
ASSERT as part of the linker script.

[...]

> +    /* ... DTB */
> +    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START)];
> +    xen_second[second_table_offset(BOOT_FDT_VIRT_START)] = pte;
> +    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)];
> +    xen_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)] = pte;

The DTB will not be used right after the switch_ttbr(). So I would 
prefer if we call early_fdt_map() again after the switch.

> +
> +    /* Update the value of init_ttbr */
> +    init_ttbr = virt_to_maddr_colored((vaddr_t)xen_pgtable);
> +    clean_dcache(init_ttbr);

I don't much like the idea to set init_ttbr in a different place for 
coloring. See more below.

> +
> +    /* Copy Xen to the new location */
> +    memcpy((void*)BOOT_RELOC_VIRT_START,
> +        (const void*)XEN_VIRT_START, (_end - _start));
> +    clean_dcache_va_range((void*)BOOT_RELOC_VIRT_START, (_end - _start)); > +
> +    /* Change ttbr */
> +    switch_ttbr(init_ttbr);
> +
> +    /*
> +     * Keep mapped old Xen memory in a contiguous mapping
> +     * for other cpus to boot. This mapping will also replace the
> +     * one created at the beginning of setup_pagetables.
> +     */

AFAICT, the second CPUs will never run using the virtual address 
BOOT_RELOC_VIRT_START. You only seem to use it so you can conveniently 
translate the address using virt_to_* helper.

> +    create_mappings(xen_second, BOOT_RELOC_VIRT_START,
> +                paddr_to_pfn(XEN_VIRT_START + phys_offset),
> +                SZ_2M >> PAGE_SHIFT, SZ_2M);

This call will create a 2MB mapping. We only guarantee that Xen will be 
4KB aligned.

In addition to Xen, we don't know what we will in memory right after Xen 
(assuming it is less than 2MB). This may be device memory and could 
result to weird issue.

But, as I wrote above, the virtual mapping doesn't look to be used by 
the secondary CPUs. So I would rather prefer if we don't introduce that 
extra mapping and temporarily map/unmap if CPU0 needs to access it 
temporarily.

> +
> +    xen_pt_enforce_wnx();
> +}
> +#else
>   /* Boot-time pagetable setup.
>    * Changes here may need matching changes in head.S */
>   void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
> @@ -721,6 +885,7 @@ void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
>       per_cpu(xen_dommap, 0) = cpu0_dommap;
>   #endif
>   }
> +#endif /* !CONFIG_COLORING */
>   
>   static void clear_boot_pagetables(void)
>   {
> @@ -735,6 +900,9 @@ static void clear_boot_pagetables(void)
>   #endif
>       clear_table(boot_second);
>       clear_table(boot_third);
> +#ifdef CONFIG_COLORING
> +    clear_table(boot_colored_xen);
> +#endif

The boot_colored_xen is going to be touched by the secondary CPUs. So 
this doesn't need to be cleared.

>   }
>   
>   #ifdef CONFIG_ARM_64
> @@ -742,10 +910,16 @@ int init_secondary_pagetables(int cpu)
>   {
>       clear_boot_pagetables();
>   
> +    /*
> +     * For coloring the value of the ttbr was already set up during
> +     * setup_pagetables.
> +     */
> +#ifndef CONFIG_COLORING

This is not necessary if...

>       /* Set init_ttbr for this CPU coming up. All CPus share a single setof
>        * pagetables, but rewrite it each time for consistency with 32 bit. */
>       init_ttbr = (uintptr_t) xen_pgtable + phys_offset;

... virt_to_maddr() here.

>       clean_dcache(init_ttbr);
> +#endif
>       return 0;
>   }
>   #else
> @@ -859,12 +1033,20 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,
>           else if ( xenheap_first_first_slot == -1)
>           {
>               /* Use xenheap_first_first to bootstrap the mappings */
> -            first = xenheap_first_first;
> +            paddr_t phys_addr;
> +
> +            /*
> +             * At this stage is safe to use virt_to_maddr because Xen mapping
> +             * is already in place. Using virt_to_maddr allows us to unify
> +             * codepath with and without cache coloring enabled.
> +             */
> +            phys_addr = virt_to_maddr((vaddr_t)xenheap_first_first);
> +            pte = mfn_to_xen_entry(maddr_to_mfn(phys_addr),MT_NORMAL);
>   
> -            pte = pte_of_xenaddr((vaddr_t)xenheap_first_first);
>               pte.pt.table = 1;
>               write_pte(p, pte);
>   
> +            first = xenheap_first_first;
>               xenheap_first_first_slot = slot;
>           }
>           else
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 0c90c2305c..d443fac6a2 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -25,6 +25,7 @@
>   #include <asm/cpufeature.h>
>   #include <asm/psci.h>
>   #include <asm/acpi.h>
> +#include <asm/coloring.h>
>   
>   /*
>    * While a 64-bit OS can make calls with SMC32 calling conventions, for
> @@ -49,7 +50,8 @@ int call_psci_cpu_on(int cpu)
>   {
>       struct arm_smccc_res res;
>   
> -    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
> +    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
> +                  __pa(virt_boot_xen((vaddr_t)init_secondary)),
>                     &res);
>   
>       return PSCI_RET(res);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 13b10515a8..294b806120 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -924,6 +924,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>       struct domain *d;
>       int rc;
>       paddr_t xen_paddr = (paddr_t)(_start + boot_phys_offset);
> +    uint32_t xen_size = (_end - _start);

You are setting the size here but...

>   
>       dcache_line_bytes = read_dcache_line_bytes();
>   
> @@ -952,13 +953,16 @@ void __init start_xen(unsigned long boot_phys_offset,
>       if ( !coloring_init() )
>           panic("Xen Coloring support: setup failed\n");
>   
> +    xen_size = XEN_COLOR_MAP_SIZE;

... overwrite it before using it. Shouldn't this be in the '#ifdef' below?

> +#ifdef CONFIG_COLORING
> +    xen_paddr = get_xen_paddr(xen_size);
> +#endif
> +
>       /* Register Xen's load address as a boot module. */
> -    xen_bootmodule = add_boot_module(BOOTMOD_XEN, xen_paddr,
> -                             (paddr_t)(uintptr_t)(_end - _start + 1), false);
> +    xen_bootmodule = add_boot_module(BOOTMOD_XEN, xen_paddr, xen_size, false);
>       BUG_ON(!xen_bootmodule);
>   
>       setup_pagetables(boot_phys_offset, xen_paddr);
> -

Spurious change.

>       setup_mm();
>   
>       /* Parse the ACPI tables for possible boot-time configuration */
> @@ -1072,6 +1076,17 @@ void __init start_xen(unsigned long boot_phys_offset,
>   
>       setup_virt_paging();
>   
> +    /*
> +     * This removal is useful if cache coloring is enabled but
> +     * it should not affect non coloring configuration.
> +     * The removal is done earlier than discard_initial_modules
> +     * beacuse in do_initcalls there is the livepatch support
> +     * setup which uses the virtual addresses starting from
> +     * BOOT_RELOC_VIRT_START.
> +     * Remove coloring mappings to expose a clear state to the
> +     * livepatch module.
> +     */
> +    remove_early_mappings(BOOT_RELOC_VIRT_START, SZ_2M);
>       do_initcalls();
>   
>       /*
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7bfd0a73a7..5ef68976c9 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -438,6 +438,7 @@ int __cpu_up(unsigned int cpu)
>   {
>       int rc;
>       s_time_t deadline;
> +    vaddr_t *smp_up_cpu_addr;
>   
>       printk("Bringing up CPU%d\n", cpu);
>   
> @@ -453,10 +454,22 @@ int __cpu_up(unsigned int cpu)
>       /* Tell the remote CPU what its logical CPU ID is. */
>       init_data.cpuid = cpu;
>   
> +    /*
> +     * If coloring is enabled, non-Master CPUs boot using the old Xen code.
> +     * During the boot process each cpu is booted one after another using the
> +     * smp_cpu_cpu variable. This variable is accessed in head.S using its
> +     * physical address.
> +     * That address is calculated using the physical offset of the old Xen
> +     * code. With coloring we can not rely anymore on that offset. For this
> +     * reason in order to boot the other cpus we rely on the old xen code that
> +     * was mapped during tables setup in mm.c so that we can use the old physical
> +     * offset and the old head.S code also. In order to modify the old Xen code
> +     * we need to access it using the mapped done in color_xen.
> +     */
> +    smp_up_cpu_addr = (vaddr_t *)virt_boot_xen((vaddr_t)&smp_up_cpu);

smp_up_cpu is defined as unsigned long. So shouldn't the cast be 
(unsigned long *)?

> +    *smp_up_cpu_addr = cpu_logical_map(cpu);

Why is this line moved before the comment: "/* Open ... */"?

>       /* Open the gate for this CPU */
> -    smp_up_cpu = cpu_logical_map(cpu);
> -    clean_dcache(smp_up_cpu);
> -
> +    clean_dcache(*smp_up_cpu_addr);
>       rc = arch_cpu_up(cpu);
>   
>       console_end_sync();

Cheers,

-- 
Julien Grall

