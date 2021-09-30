Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC92E41E425
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 00:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200281.354754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW4vX-0004EJ-5J; Thu, 30 Sep 2021 22:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200281.354754; Thu, 30 Sep 2021 22:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW4vX-0004Cj-22; Thu, 30 Sep 2021 22:53:19 +0000
Received: by outflank-mailman (input) for mailman id 200281;
 Thu, 30 Sep 2021 22:53:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2g57=OU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW4vU-0004Cd-RM
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 22:53:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3167b240-2241-11ec-bd77-12813bfff9fa;
 Thu, 30 Sep 2021 22:53:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 288AF61882;
 Thu, 30 Sep 2021 22:53:13 +0000 (UTC)
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
X-Inumbo-ID: 3167b240-2241-11ec-bd77-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633042393;
	bh=slGvynQStahnHFFIDcDwS6mX5WxI52rBvpjspSzeIsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hr1YFEYRb5ATAX9bjAkST6ll28jY2oc+GCnS9jOvCYKC624v3mCiUY9k6ZkEhRyR+
	 yKXWWYuZJShgc4YhD3J2KnvyIyF+1X3GK3L88oJLaXhBLm3Y8d72Qc+bo4JSuw+N3R
	 /H5ka6KrY++TnGcAJNfnyRq8Og1g5Z0Eb8x0kf+69nwUuLZKDs/UvxySbzr/jByMRx
	 yK6bNLY8U9AMNfn+ouHeWreU2tQeZUaA0DvaWSKXIdlY5TQOZYgVF1eoR/kpBjWnqz
	 bCJCL6pMG0Sk1orHmrSys6Aq5+yRwapmDdmjah2FfBFkbqsAmMZC9bOwR4naG58dwn
	 GJgeY/3oL1Iow==
Date: Thu, 30 Sep 2021 15:53:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V4 2/3] xen/arm: Add handling of extended regions for
 Dom0
In-Reply-To: <1632955927-27911-3-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301553032.3209@sstabellini-ThinkPad-T480s>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com> <1632955927-27911-3-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The extended region (safe range) is a region of guest physical
> address space which is unused and could be safely used to create
> grant/foreign mappings instead of wasting real RAM pages from
> the domain memory for establishing these mappings.
> 
> The extended regions are chosen at the domain creation time and
> advertised to it via "reg" property under hypervisor node in
> the guest device-tree. As region 0 is reserved for grant table
> space (always present), the indexes for extended regions are 1...N.
> If extended regions could not be allocated for some reason,
> Xen doesn't fail and behaves as usual, so only inserts region 0.
> 
> Please note the following limitations:
> - The extended region feature is only supported for 64-bit domain
>   currently.
> - The ACPI case is not covered.
> 
> ***
> 
> As Dom0 is direct mapped domain on Arm (e.g. MFN == GFN)
> the algorithm to choose extended regions for it is different
> in comparison with the algorithm for non-direct mapped DomU.
> What is more, that extended regions should be chosen differently
> whether IOMMU is enabled or not.
> 
> Provide RAM not assigned to Dom0 if IOMMU is disabled or memory
> holes found in host device-tree if otherwise. Make sure that
> extended regions are 2MB-aligned and located within maximum possible
> addressable physical memory range. The minimum size of extended
> region is 64MB. The maximum number of extended regions is 128,
> which is an artificial limit to minimize code changes (we reuse
> struct meminfo to describe extended regions, so there are an array
> field for 128 elements).
> 
> It worth mentioning that unallocated memory solution (when the IOMMU
> is disabled) will work safely until Dom0 is able to allocate memory
> outside of the original range.
> 
> Also introduce command line option to be able to globally enable or
> disable support for extended regions for Dom0 (enabled by default).
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Please note, we need to decide which approach to use in find_unallocated_memory(),
> you can find details at:
> https://lore.kernel.org/xen-devel/28503e09-44c3-f623-bb8d-8778bb94225f@gmail.com/
> 
> Changes RFC -> V2:
>    - update patch description
>    - drop uneeded "extended-region" DT property
> 
> Changes V2 -> V3:
>    - update patch description
>    - add comment for "size" calculation in add_ext_regions()
>    - clarify "end" calculation in find_unallocated_memory() and
>      find_memory_holes()
>    - only pick up regions with size >= 64MB
>    - allocate reg dynamically instead of keeping on the stack in
>      make_hypervisor_node()
>    - do not show warning for 32-bit domain
>    - drop Linux specific limits EXT_REGION_*
>    - also cover "ranges" property in find_memory_holes()
>    - add command line arg to enable/disable extended region support
> 
> Changes V3 -> V4:
>   - update opt_ext_regions purpose and comment in code
>   - reorganize make_hypervisor_node() to move allocations after initial
>     checks, allocate only required amount of elements instead of maximum
>     possible
> ---
>  docs/misc/xen-command-line.pandoc |  11 ++
>  xen/arch/arm/domain_build.c       | 286 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 294 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 177e656..5cae4ad 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1081,6 +1081,17 @@ hardware domain is architecture dependent.
>  Note that specifying zero as domU value means zero, while for dom0 it means
>  to use the default.
>  
> +### ext_regions (Arm)
> +> `= <boolean>`
> +
> +> Default : `true`
> +
> +Flag to enable or disable support for extended regions for Dom0.
> +
> +Extended regions are ranges of unused address space exposed to Dom0 as
> +"safe to use" for special memory mappings. Disable if your board device
> +tree is incomplete.
> +
>  ### flask
>  > `= permissive | enforcing | late | disabled`
>  
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d233d63..c5afbe2 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -34,6 +34,10 @@
>  static unsigned int __initdata opt_dom0_max_vcpus;
>  integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>  
> +/* If true, the extended regions support is enabled for dom0 */
> +static bool __initdata opt_ext_regions = true;
> +boolean_param("ext_regions", opt_ext_regions);
> +
>  static u64 __initdata dom0_mem;
>  static bool __initdata dom0_mem_set;
>  
> @@ -886,6 +890,232 @@ static int __init make_memory_node(const struct domain *d,
>      return res;
>  }
>  
> +static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
> +{
> +    struct meminfo *ext_regions = data;
> +    paddr_t start, size;
> +
> +    if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
> +        return 0;
> +
> +    /* Both start and size of the extended region should be 2MB aligned */
> +    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
> +    if ( start > e )
> +        return 0;
> +
> +    /*
> +     * e is actually "end-1" because it is called by rangeset functions
> +     * which are inclusive of the last address.
> +     */
> +    e += 1;
> +    size = (e - start) & ~(SZ_2M - 1);
> +    if ( size < MB(64) )
> +        return 0;
> +
> +    ext_regions->bank[ext_regions->nr_banks].start = start;
> +    ext_regions->bank[ext_regions->nr_banks].size = size;
> +    ext_regions->nr_banks++;
> +
> +    return 0;
> +}
> +
> +static int __init find_unallocated_memory(const struct kernel_info *kinfo,
> +                                          struct meminfo *ext_regions)
> +{
> +    const struct meminfo *assign_mem = &kinfo->mem;
> +    struct rangeset *unalloc_mem;
> +    paddr_t start, end;
> +    unsigned int i;
> +    int res;
> +
> +    dt_dprintk("Find unallocated memory for extended regions\n");
> +
> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
> +    if ( !unalloc_mem )
> +        return -ENOMEM;
> +
> +    /* Start with all available RAM */
> +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
> +    {
> +        start = bootinfo.mem.bank[i].start;
> +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
> +        res = rangeset_add_range(unalloc_mem, start, end - 1);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> +                   start, end);
> +            goto out;
> +        }
> +    }
> +
> +    /* Remove RAM assigned to Dom0 */
> +    for ( i = 0; i < assign_mem->nr_banks; i++ )
> +    {
> +        start = assign_mem->bank[i].start;
> +        end = assign_mem->bank[i].start + assign_mem->bank[i].size;
> +        res = rangeset_remove_range(unalloc_mem, start, end - 1);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> +                   start, end);
> +            goto out;
> +        }
> +    }
> +
> +    /* Remove reserved-memory regions */
> +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
> +    {
> +        start = bootinfo.reserved_mem.bank[i].start;
> +        end = bootinfo.reserved_mem.bank[i].start +
> +            bootinfo.reserved_mem.bank[i].size;
> +        res = rangeset_remove_range(unalloc_mem, start, end - 1);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> +                   start, end);
> +            goto out;
> +        }
> +    }
> +
> +    /* Remove grant table region */
> +    start = kinfo->gnttab_start;
> +    end = kinfo->gnttab_start + kinfo->gnttab_size;
> +    res = rangeset_remove_range(unalloc_mem, start, end - 1);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> +               start, end);
> +        goto out;
> +    }
> +
> +    start = 0;
> +    end = (1ULL << p2m_ipa_bits) - 1;
> +    res = rangeset_report_ranges(unalloc_mem, start, end,
> +                                 add_ext_regions, ext_regions);
> +    if ( res )
> +        ext_regions->nr_banks = 0;
> +    else if ( !ext_regions->nr_banks )
> +        res = -ENOENT;
> +
> +out:
> +    rangeset_destroy(unalloc_mem);
> +
> +    return res;
> +}
> +
> +static int __init find_memory_holes(const struct kernel_info *kinfo,
> +                                    struct meminfo *ext_regions)
> +{
> +    struct dt_device_node *np;
> +    struct rangeset *mem_holes;
> +    paddr_t start, end;
> +    unsigned int i;
> +    int res;
> +
> +    dt_dprintk("Find memory holes for extended regions\n");
> +
> +    mem_holes = rangeset_new(NULL, NULL, 0);
> +    if ( !mem_holes )
> +        return -ENOMEM;
> +
> +    /* Start with maximum possible addressable physical memory range */
> +    start = 0;
> +    end = (1ULL << p2m_ipa_bits) - 1;
> +    res = rangeset_add_range(mem_holes, start, end);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> +               start, end);
> +        goto out;
> +    }
> +
> +    /*
> +     * Remove regions described by "reg" and "ranges" properties where
> +     * the memory is addressable (MMIO, RAM, PCI BAR, etc).
> +     */
> +    dt_for_each_device_node( dt_host, np )
> +    {
> +        unsigned int naddr;
> +        u64 addr, size;
> +
> +        naddr = dt_number_of_address(np);
> +
> +        for ( i = 0; i < naddr; i++ )
> +        {
> +            res = dt_device_get_address(np, i, &addr, &size);
> +            if ( res )
> +            {
> +                printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> +                       i, dt_node_full_name(np));
> +                goto out;
> +            }
> +
> +            start = addr & PAGE_MASK;
> +            end = PAGE_ALIGN(addr + size);
> +            res = rangeset_remove_range(mem_holes, start, end - 1);
> +            if ( res )
> +            {
> +                printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> +                       start, end);
> +                goto out;
> +            }
> +        }
> +
> +        if ( dt_device_type_is_equal(np, "pci" ) )
> +        {
> +            unsigned int range_size, nr_ranges;
> +            int na, ns, pna;
> +            const __be32 *ranges;
> +            u32 len;
> +
> +            /*
> +             * Looking for non-empty ranges property which in this context
> +             * describes the PCI host bridge aperture.
> +             */
> +            ranges = dt_get_property(np, "ranges", &len);
> +            if ( !ranges || !len )
> +                continue;
> +
> +            pna = dt_n_addr_cells(np);
> +            na = dt_child_n_addr_cells(np);
> +            ns = dt_child_n_size_cells(np);
> +            range_size = pna + na + ns;
> +            nr_ranges = len / sizeof(__be32) / range_size;
> +
> +            for ( i = 0; i < nr_ranges; i++, ranges += range_size )
> +            {
> +                /* Skip the child address and get the parent (CPU) address */
> +                addr = dt_read_number(ranges + na, pna);
> +                size = dt_read_number(ranges + na + pna, ns);
> +
> +                start = addr & PAGE_MASK;
> +                end = PAGE_ALIGN(addr + size);
> +                res = rangeset_remove_range(mem_holes, start, end - 1);
> +                if ( res )
> +                {
> +                    printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> +                           start, end);
> +                    goto out;
> +                }
> +            }
> +        }
> +    }
> +
> +    start = 0;
> +    end = (1ULL << p2m_ipa_bits) - 1;
> +    res = rangeset_report_ranges(mem_holes, start, end,
> +                                 add_ext_regions,  ext_regions);
> +    if ( res )
> +        ext_regions->nr_banks = 0;
> +    else if ( !ext_regions->nr_banks )
> +        res = -ENOENT;
> +
> +out:
> +    rangeset_destroy(mem_holes);
> +
> +    return res;
> +}
> +
>  static int __init make_hypervisor_node(struct domain *d,
>                                         const struct kernel_info *kinfo,
>                                         int addrcells, int sizecells)
> @@ -893,11 +1123,12 @@ static int __init make_hypervisor_node(struct domain *d,
>      const char compat[] =
>          "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
>          "xen,xen";
> -    __be32 reg[4];
> +    __be32 *reg, *cells;
>      gic_interrupt_t intr;
> -    __be32 *cells;
>      int res;
>      void *fdt = kinfo->fdt;
> +    struct meminfo *ext_regions = NULL;
> +    unsigned int i, nr_ext_regions;
>  
>      dt_dprintk("Create hypervisor node\n");
>  
> @@ -919,12 +1150,61 @@ static int __init make_hypervisor_node(struct domain *d,
>      if ( res )
>          return res;
>  
> +    if ( !opt_ext_regions )
> +    {
> +        printk(XENLOG_DEBUG "The extended regions support is disabled\n");
> +        nr_ext_regions = 0;
> +    }
> +    else if ( is_32bit_domain(d) )
> +    {
> +        printk(XENLOG_DEBUG "The extended regions are only supported for 64-bit guest currently\n");
> +        nr_ext_regions = 0;
> +    }
> +    else
> +    {
> +        ext_regions = xzalloc(struct meminfo);
> +        if ( !ext_regions )
> +            return -ENOMEM;
> +
> +        if ( !is_iommu_enabled(d) )
> +            res = find_unallocated_memory(kinfo, ext_regions);
> +        else
> +            res = find_memory_holes(kinfo, ext_regions);
> +
> +        if ( res )
> +            printk(XENLOG_WARNING "Failed to allocate extended regions\n");
> +        nr_ext_regions = ext_regions->nr_banks;
> +    }
> +
> +    reg = xzalloc_array(__be32, (nr_ext_regions + 1) * (addrcells + sizecells));
> +    if ( !reg )
> +    {
> +        xfree(ext_regions);
> +        return -ENOMEM;
> +    }
> +
>      /* reg 0 is grant table space */
>      cells = &reg[0];
>      dt_child_set_range(&cells, addrcells, sizecells,
>                         kinfo->gnttab_start, kinfo->gnttab_size);
> +    /* reg 1...N are extended regions */
> +    for ( i = 0; i < nr_ext_regions; i++ )
> +    {
> +        u64 start = ext_regions->bank[i].start;
> +        u64 size = ext_regions->bank[i].size;
> +
> +        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> +                   i, start, start + size);
> +
> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
> +    }
> +
>      res = fdt_property(fdt, "reg", reg,
> -                       dt_cells_to_size(addrcells + sizecells));
> +                       dt_cells_to_size(addrcells + sizecells) *
> +                       (nr_ext_regions + 1));
> +    xfree(ext_regions);
> +    xfree(reg);
> +
>      if ( res )
>          return res;
>  
> -- 
> 2.7.4
> 

