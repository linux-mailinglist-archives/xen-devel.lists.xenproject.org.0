Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F340A23B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 02:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186028.334764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPwjI-0003zY-Bq; Tue, 14 Sep 2021 00:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186028.334764; Tue, 14 Sep 2021 00:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPwjI-0003wD-8K; Tue, 14 Sep 2021 00:55:20 +0000
Received: by outflank-mailman (input) for mailman id 186028;
 Tue, 14 Sep 2021 00:55:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L61H=OE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mPwjG-0003w7-5e
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 00:55:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18c84e56-eef3-4c24-a539-9163e884bb12;
 Tue, 14 Sep 2021 00:55:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B600360EFE;
 Tue, 14 Sep 2021 00:55:15 +0000 (UTC)
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
X-Inumbo-ID: 18c84e56-eef3-4c24-a539-9163e884bb12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631580916;
	bh=Kmoiwlto49Hh3XxoOAEJ6PYDt1AQ/ZhjKUNnlPJv1Ow=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RNDsha5jiydInhr/8c6uPTYLqBDFlN46E0+PDZOkfOKJjEWUSa1fmHVUL+M7Ziv7S
	 VcKiWt7HC4iKs0jj7O1blP6kTi3Py30xhCKdFMMaeVF+Z/1hq/x4S+NFC9Oxrig5cb
	 75KH0ylSfPvBkm7+kOizef5mqRBeH78dcKMqNyThyBthG1BlKcitQUJEyh4rEpgJP1
	 GK+lo18y10K7bWgDirCqkXyUsdhG6b0g8Czw/edOW5AbEzv0xZEZ0un1nsExky/6Mt
	 PVxGzRUyP8cmqLBl3zSI8wovWkn6wOrJKzc5aVTmJXYciAV5DPY0sjU/1L+f0nOTYL
	 HJom4s4qCsakg==
Date: Mon, 13 Sep 2021 17:55:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for
 Dom0
In-Reply-To: <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2109131726420.10523@sstabellini-ThinkPad-T480s>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com> <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Sep 2021, Oleksandr Tyshchenko wrote:
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
> - The extended region feature is only supported for 64-bit domain.
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
> addressable physical memory range. The maximum number of extended
> regions is 128.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes since RFC:
>    - update patch description
>    - drop uneeded "extended-region" DT property
> ---
> 
>  xen/arch/arm/domain_build.c | 226 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 224 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 206038d..070ec27 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -724,6 +724,196 @@ static int __init make_memory_node(const struct domain *d,
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
> +    size = (e - start + 1) & ~(SZ_2M - 1);
> +    if ( !size )
> +        return 0;

Can't you align size as well?

  size = (size - (SZ_2M - 1)) & ~(SZ_2M - 1);


> +    ext_regions->bank[ext_regions->nr_banks].start = start;
> +    ext_regions->bank[ext_regions->nr_banks].size = size;
> +    ext_regions->nr_banks ++;
                            ^ no space

> +    return 0;
> +}
> +
> +/*
> + * The extended regions will be prevalidated by the memory hotplug path
> + * in Linux which requires for any added address range to be within maximum
> + * possible addressable physical memory range for which the linear mapping
> + * could be created.
> + * For 48-bit VA space size the maximum addressable range are:
> + * 0x40000000 - 0x80003fffffff

Please don't make Linux-specific comments in Xen code for interfaces
that are supposed to be OS-agnostic.


> + */
> +#define EXT_REGION_START   0x40000000ULL
> +#define EXT_REGION_END     0x80003fffffffULL
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
> +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size - 1;

Is the -1 needed? Isn't it going to screw up the size calculation later?


> +        res = rangeset_add_range(unalloc_mem, start, end);
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
> +        end = assign_mem->bank[i].start + assign_mem->bank[i].size - 1;
> +        res = rangeset_remove_range(unalloc_mem, start, end);
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
> +            bootinfo.reserved_mem.bank[i].size - 1;
> +        res = rangeset_remove_range(unalloc_mem, start, end);
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
> +    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
> +    res = rangeset_remove_range(unalloc_mem, start, end);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> +               start, end);
> +        goto out;
> +    }
> +
> +    start = EXT_REGION_START;
> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
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
> +    start = EXT_REGION_START;
> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> +    res = rangeset_add_range(mem_holes, start, end);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> +               start, end);
> +        goto out;
> +    }
> +
> +    /* Remove all regions described by "reg" property (MMIO, RAM, etc) */
> +    dt_for_each_device_node( dt_host, np )

Don't you need something like device_tree_for_each_node ?
dt_for_each_device_node won't go down any deeper in the tree?

Alternatively, maybe we could simply record the highest possible address
of any memory/device/anything as we scan the device tree with
handle_node. Then we can use that as the starting point here. So that we
don't need to scan the device tree twice, and also we don't need my
suggestion below to remove 1GB-aligned 1GB-multiple regions.


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

It might be possible for a device not to have a range if it doesn't have
any MMIO regions, right? For instance, certain ARM timer nodes. I would
not print any errors and continue.


> +                goto out;
> +            }
> +
> +            start = addr & PAGE_MASK;
> +            end = PAGE_ALIGN(addr + size) - 1;
> +            res = rangeset_remove_range(mem_holes, start, end);
> +            if ( res )
> +            {
> +                printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> +                       start, end);
> +                goto out;
> +            }
> +        }
> +    }

As is, it will result in a myriad of small ranges which is unuseful and
slow to parse. I suggest to simplify it by removing a larger region than
strictly necessary. For instance, you could remove a 1GB-aligned and
1GB-multiple region for each range. That way, you are going to get fewer
large free ranges instance of many small ones which we don't need.


> +    start = EXT_REGION_START;
> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
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
> @@ -731,11 +921,13 @@ static int __init make_hypervisor_node(struct domain *d,
>      const char compat[] =
>          "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
>          "xen,xen";
> -    __be32 reg[4];
> +    __be32 reg[(NR_MEM_BANKS + 1) * 4];

If you are xzalloc'ing struct meminfo then you might as well xzalloc reg
too. Or keep both on the stack with a lower NR_MEM_BANKS.


>      gic_interrupt_t intr;
>      __be32 *cells;
>      int res;
>      void *fdt = kinfo->fdt;
> +    struct meminfo *ext_regions;
> +    unsigned int i;
>  
>      dt_dprintk("Create hypervisor node\n");
>  
> @@ -757,12 +949,42 @@ static int __init make_hypervisor_node(struct domain *d,
>      if ( res )
>          return res;
>  
> +    ext_regions = xzalloc(struct meminfo);
> +    if ( !ext_regions )
> +        return -ENOMEM;
> +
> +    if ( is_32bit_domain(d) )
> +        printk(XENLOG_WARNING "The extended region is only supported for 64-bit guest\n");

This is going to add an unconditional warning to all 32bit boots. I
would skip it entirely or only keep it as XENLOG_DEBUG.


> +    else
> +    {
> +        if ( !is_iommu_enabled(d) )
> +            res = find_unallocated_memory(kinfo, ext_regions);
> +        else
> +            res = find_memory_holes(kinfo, ext_regions);
> +
> +        if ( res )
> +            printk(XENLOG_WARNING "Failed to allocate extended regions\n");
> +    }
> +
>      /* reg 0 is grant table space */
>      cells = &reg[0];
>      dt_child_set_range(&cells, addrcells, sizecells,
>                         kinfo->gnttab_start, kinfo->gnttab_size);
> +    /* reg 1...N are extended regions */
> +    for ( i = 0; i < ext_regions->nr_banks; i++ )
> +    {
> +        u64 start = ext_regions->bank[i].start;
> +        u64 size = ext_regions->bank[i].size;
> +
> +        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> +                   i, start, start + size);
> +
> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
> +    }
> +    xfree(ext_regions);
> +
>      res = fdt_property(fdt, "reg", reg,
> -                       dt_cells_to_size(addrcells + sizecells));
> +                       dt_cells_to_size(addrcells + sizecells) * (i + 1));
>      if ( res )
>          return res;
>  
> -- 
> 2.7.4
> 

