Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F283433D36
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 19:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213411.371611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcslc-0007Xe-9L; Tue, 19 Oct 2021 17:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213411.371611; Tue, 19 Oct 2021 17:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcslc-0007Vl-5f; Tue, 19 Oct 2021 17:19:12 +0000
Received: by outflank-mailman (input) for mailman id 213411;
 Tue, 19 Oct 2021 17:19:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mcslb-0007Vf-0G
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 17:19:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mcsla-0006lF-Na; Tue, 19 Oct 2021 17:19:10 +0000
Received: from [54.239.6.189] (helo=[192.168.0.120])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mcsla-0008OD-DR; Tue, 19 Oct 2021 17:19:10 +0000
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
	bh=kyK/wTNQ4cFxGRIUwYVloynCJR6nTraNDpaAy4O56wc=; b=nREUSxpM541wmPZvpIAb29ep7V
	M9S6Zlc9epyX++sK00mHhd9qpvqLgvFnCAZGYzR3ItNQi9fZj94nJYYkbhCK7yYzsGRM0ec40D01/
	QdxCUrSGNJoyXAnIFm7wzTsawbgFNUU/zZYDWm+oNQ/nDA/Uws2GE+B8YAn9LmHf/4Qo=;
Message-ID: <aa7add3d-ab03-a21f-72b7-89c11aeb8006@xen.org>
Date: Tue, 19 Oct 2021 18:19:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/6] xen/arm: introduce direct-map for domUs
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Wei.Chen@arm.com, Bertrand.Marquis@arm.com
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-3-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211015030945.2082898-3-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Penny,

On 15/10/2021 04:09, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Cases where domU needs direct-map memory map:
>    * IOMMU not present in the system.
>    * IOMMU disabled if it doesn't cover a specific device and all the guests
> are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
> a few without, then guest DMA security still could not be totally guaranteed.
> So users may want to disable the IOMMU, to at least gain some performance
> improvement from IOMMU disabled.
>    * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
> To be specific, in a few extreme situation, when multiple devices do DMA
> concurrently, these requests may exceed IOMMU's transmission capacity.
>    * IOMMU disabled when it adds too much latency on DMA. For example,
> TLB may be missing in some IOMMU hardware, which may bring latency in DMA
> progress, so users may want to disable it in some realtime scenario.
>    * Guest OS relies on the host memory layout-capablei
> 
> *WARNING:
> Users should be aware that it is not always secure to assign a DMA-capable
> device without IOMMU protection.
> The administrator should make sure that:
>   1. The device is assigned to a trusted guest.
>   2. Users have additional security mechanism on the platform.
> 
> This commit also avoids setting XEN_DOMCTL_CDF_iommu when the IOMMU is
> absent/disabled.

This change looks unrelated to the rest of this patch. Can you split in 
a separate patch?

> 
> For now, direct-map is only supported when domain on Static Allocation, that is,
> "xen.static-mem" must be also defined in the domain configuration.
> 
> This commit also introduces a new helper allocate_static_memory_11 to allocate
> static memory as guest RAM for direct-map domain.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   docs/misc/arm/device-tree/booting.txt |  10 ++
>   xen/arch/arm/domain_build.c           | 215 ++++++++++++++++++++------
>   2 files changed, 179 insertions(+), 46 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 71895663a4..297f8fa0c8 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -182,6 +182,16 @@ with the following properties:
>       Both #address-cells and #size-cells need to be specified because
>       both sub-nodes (described shortly) have reg properties.
>   
> +- direct-map
> +
> +    Optional for Domain on Static Allocation.

I read this as this is mandatory when the domain doesn't use static 
allocation. So how about:

"Only available when statically allocation memory is used for the domain".

> +    An empty property to request the memory of the domain to be
> +    direct-map (guest physical address == physical address).
> +    WARNING:
> +    Users must be aware of this risk, when doing DMA-capable device assignment,
> +    direct-map guest must be trusted or have additional security mechanism,
> +    otherwise it could use the DMA engine to access any other memory area.

I find this warning a bit odd to read because the property will not turn 
off the IOMMU for the domain. This is only going to happen if the admin 
decided to do it.

 From my understanding, it is not going to be possible to assign a 
device without IOMMU unless the property 
"xen,force-assign-without-iommu" is set. This is not a mechanism 
specific to direct-map, so I would drop this WARNING here.

> +
>   Under the "xen,domain" compatible node, one or more sub-nodes are present
>   for the DomU kernel and ramdisk.
>   
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 37e2d62d47..d9118e5bc1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -492,8 +492,14 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>   {
>       int res;
>       unsigned int nr_pages = PFN_DOWN(size);
> -    /* Infer next GFN. */
> -    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
> +    gfn_t sgfn;
> +
> +    if ( !is_domain_direct_mapped(d) )
> +        /* Infer next GFN when GFN != MFN. */
> +        sgfn = gaddr_to_gfn(bank->start + bank->size);
> +    else
> +        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
> +
>   
>       res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
>       if ( res )
> @@ -507,12 +513,69 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>       return true;
>   }
>   
> -/* Allocate memory from static memory as RAM for one specific domain d. */
> +static int __init acquire_static_memory_bank(struct domain *d,
> +                                             const __be32 **cell,
> +                                             u32 addr_cells, u32 size_cells,
> +                                             paddr_t *pbase, paddr_t *psize)
> +{
> +    int res = 0;
> +
> +    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
> +    ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
> +    if ( PFN_DOWN(*psize) > UINT_MAX )
> +    {
> +        printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
> +               d, *psize);
> +        return -EINVAL;
> +    }
> +
> +    res = acquire_domstatic_pages(d, maddr_to_mfn(*pbase), PFN_DOWN(*psize), 0);
> +    if ( res )
> +        printk(XENLOG_ERR
> +               "%pd: failed to acquire static memory: %d.\n", d, res);
> +
> +    return res;
> +}
> +
> +static int __init parse_static_mem_prop(const struct dt_device_node *node,
> +                                        u32 *addr_cells, u32 *size_cells,
> +                                        int *length, const __be32 **cell)
> +{
> +    const struct dt_property *prop;
> +
> +    prop = dt_find_property(node, "xen,static-mem", NULL);
> +    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
> +                               addr_cells) )
> +    {
> +        printk(XENLOG_ERR
> +               "failed to read \"#xen,static-mem-address-cells\".\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
> +                               size_cells) )
> +    {
> +        printk(XENLOG_ERR
> +               "failed to read \"#xen,static-mem-size-cells\".\n");
> +        return -EINVAL;
> +    }
> +
> +    *cell = (const __be32 *)prop->value;
> +    *length = prop->length;
> +
> +    return 0;
> +}
> +
> +/*
> + * Allocate static memory as RAM for one specific domain d.
> + * The static memory will be mapped in the guest at the usual guest
> + * memory addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
> + * xen/include/public/arch-arm.h.
> + */
>   static void __init allocate_static_memory(struct domain *d,
>                                             struct kernel_info *kinfo,
>                                             const struct dt_device_node *node)
>   {
> -    const struct dt_property *prop;
>       u32 addr_cells, size_cells, reg_cells;
>       unsigned int nr_banks, gbank, bank = 0;
>       const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
> @@ -521,61 +584,31 @@ static void __init allocate_static_memory(struct domain *d,
>       u64 tot_size = 0;
>       paddr_t pbase, psize, gsize;
>       mfn_t smfn;
> -    int res;
> +    int length;
>   
> -    prop = dt_find_property(node, "xen,static-mem", NULL);
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
> -                               &addr_cells) )
> -    {
> -        printk(XENLOG_ERR
> -               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
> -        goto fail;
> -    }
> +    gbank = 0;
> +    gsize = ramsize[gbank];
> +    kinfo->mem.bank[gbank].start = rambase[gbank];

I am not sure to understand why this 3 assignments were moved earlier. I 
am not against the change, but this looks somewhat unrelated to this 
patch itself. The same...

>   
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
> -                               &size_cells) )
> +    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
>       {
>           printk(XENLOG_ERR
> -               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
> +               "%pd: failed to parse \"xen,static-mem\" property.\n", d);
>           goto fail;
>       }
>       reg_cells = addr_cells + size_cells;
> -
> -    /*
> -     * The static memory will be mapped in the guest at the usual guest memory
> -     * addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
> -     * xen/include/public/arch-arm.h.
> -     */

... applies to this comment.


But, I would suggest to move the split off of the code outside in a 
separate patch. This will make easier to review new changes vs refactoring.

> -    gbank = 0;
> -    gsize = ramsize[gbank];
> -    kinfo->mem.bank[gbank].start = rambase[gbank];
> -
> -    cell = (const __be32 *)prop->value;
> -    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
> +    nr_banks = length / (reg_cells * sizeof (u32));
>   
>       for ( ; bank < nr_banks; bank++ )
>       {
> -        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
> -        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
> -
> -        if ( PFN_DOWN(psize) > UINT_MAX )
> -        {
> -            printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
> -                   d, psize);
> +        if ( acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
> +                                        &pbase, &psize) )
>               goto fail;
> -        }
> -        smfn = maddr_to_mfn(pbase);
> -        res = acquire_domstatic_pages(d, smfn, PFN_DOWN(psize), 0);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR
> -                   "%pd: failed to acquire static memory: %d.\n", d, res);
> -            goto fail;
> -        }
>   
>           printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
>                  d, bank, pbase, pbase + psize);
>   
> +        smfn = maddr_to_mfn(pbase);
>           while ( 1 )
>           {
>               /* Map as much as possible the static range to the guest bank */
> @@ -638,12 +671,91 @@ static void __init allocate_static_memory(struct domain *d,
>    fail:
>       panic("Failed to allocate requested static memory for domain %pd.", d);
>   }
> +
> +/*
> + * Allocate static memory as RAM for one specific domain d.
> + * The static memory will be directly mapped in the guest(Guest Physical
> + * Address == Physical Address).
> + */
> +static void __init allocate_static_memory_11(struct domain *d,
> +                                             struct kernel_info *kinfo,
> +                                             const struct dt_device_node *node)
> +{
> +    u32 addr_cells, size_cells, reg_cells;
> +    unsigned int nr_banks, gbank = 0, bank = 0;
> +    const __be32 *cell;
> +    u64 tot_size = 0;
> +    paddr_t pbase, psize;
> +    mfn_t smfn;
> +    int length;
> +
> +    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pd: failed to parse \"xen,static-mem\" property.\n", d);
> +        goto fail;
> +    }
> +    reg_cells = addr_cells + size_cells;
> +    nr_banks = length / (reg_cells * sizeof (u32));
> +
> +    for ( ; bank < nr_banks; bank++ )
> +    {
> +        if ( acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
> +                                        &pbase, &psize) )
> +            goto fail;
> +
> +        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
> +               d, bank, pbase, pbase + psize);
> +
> +        /*
> +         * One guest memory bank is matched with one physical
> +         * memory bank.
> +         */
> +        smfn = maddr_to_mfn(pbase);
> +        gbank = bank;

gbank looks pointless as this is equivalent to bank. Can you drop it?

> +        kinfo->mem.bank[gbank].start = pbase;
AFAICT, nr_banks is computed from the DT property. However, our internal 
array has a fixed size. So you want to check we have enough space in the 
array to store all the banks.

> +
> +        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
> +                                           smfn, psize) )
> +            goto fail;
> +
> +        tot_size += psize;
> +    }
> +
> +    kinfo->mem.nr_banks = ++gbank;

At the end of the loop, ++gbank == nr_banks. So how about using nr_banks 
directly?

> +
> +    kinfo->unassigned_mem -= tot_size;
> +    /*
> +     * The property 'memory' should match the amount of memory given to the
> +     * guest.
> +     * Currently, it is only possible to either acquire static memory or let
> +     * Xen allocate. *Mixing* is not supported.
> +     */
> +    if ( kinfo->unassigned_mem )
> +    {
> +        printk(XENLOG_ERR
> +               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
> +        goto fail;
> +    }
> +
> +    return;
> +
> + fail:
> +    panic("Failed to allocate requested static memory for direct-map domain %pd.",
> +          d);
> +}
>   #else
>   static void __init allocate_static_memory(struct domain *d,
>                                             struct kernel_info *kinfo,
>                                             const struct dt_device_node *node)
>   {
>   }
> +
> +static void __init allocate_static_memory_11(struct domain *d,
> +                                             struct kernel_info *kinfo,
> +                                             const struct dt_device_node *node)
> +{

This helper is not meant to be reachable when built with 
!CONFIG_STATIC_MEMORY. So I would add ASSERT_UNREACHABLE to catch any 
misuse.

> +}
>   #endif
>   
>   static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
> @@ -2936,7 +3048,12 @@ static int __init construct_domU(struct domain *d,
>       if ( !dt_find_property(node, "xen,static-mem", NULL) )
>           allocate_memory(d, &kinfo);
>       else
> -        allocate_static_memory(d, &kinfo, node);
> +    {
> +        if ( is_domain_direct_mapped(d) )
> +            allocate_static_memory_11(d, &kinfo, node);
> +        else
> +            allocate_static_memory(d, &kinfo, node);
> +    }
>   
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
> @@ -2976,8 +3093,14 @@ void __init create_domUs(void)
>               panic("Missing property 'cpus' for domain %s\n",
>                     dt_node_name(node));
>   
> +        if ( dt_property_read_bool(node, "direct-map") )
> +            d_cfg.flags |= XEN_DOMCTL_CDF_directmap;
> +
>           if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
> -            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +        {
> +            if ( iommu_enabled )
> +                d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +        }

As I wrote above, this change looks unrelated to this patch. Regardless 
that, the nested if (and indentation) can be avoided if you write:

if ( dt_find_compatible(....) && iommu_enabled )
  ...

>   
>           if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
>           {
> 

Cheers,

-- 
Julien Grall

