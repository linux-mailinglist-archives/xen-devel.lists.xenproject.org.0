Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A445CB60
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 18:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230480.398419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwOt-0008UA-29; Wed, 24 Nov 2021 17:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230480.398419; Wed, 24 Nov 2021 17:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwOs-0008SO-UW; Wed, 24 Nov 2021 17:49:42 +0000
Received: by outflank-mailman (input) for mailman id 230480;
 Wed, 24 Nov 2021 17:49:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpwOr-0008SI-9l
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 17:49:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwOr-00048b-4n; Wed, 24 Nov 2021 17:49:41 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.24.101]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwOq-0005Xm-V9; Wed, 24 Nov 2021 17:49:41 +0000
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
	bh=c8fkS/g+uLVbJWz6o/mBLSg/g6acsCQ2jv7JjvTx1f8=; b=grnq2S2iWiJ9VXSWEnEdUh7lro
	ZUwk8T+5061arj3gvtnqRlQ6Jtw7T0iJKQe5w7gq/A3XTz1Zgd36EPdFbllPz+9ccEUDhcVvMb6w6
	g62KTewXYBV9om5Ebo6y5fEZXKGevBAezRFHkkLJob9lHf6eJnutqW9NMA+Ow7vw8SkM=;
Message-ID: <f560b2e3-de0e-ac63-726d-40ee10291e1e@xen.org>
Date: Wed, 24 Nov 2021 17:49:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3 04/10] xen/arm: introduce direct-map for domUs
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-5-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211116063155.901183-5-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 16/11/2021 06:31, Penny Zheng wrote:
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
>    * Guest OS relies on the host memory layout
> 
> This commit introduces a new helper allocate_static_memory_11 to allocate
> static memory as guest RAM for direct-map domain.
> 
> For now, direct-map is only available when statically allocated memory is
> used for the domain, that is, "xen,static-mem" must be also defined in the
> domain configuration.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> v2 changes:
> - split the common codes into two helpers: parse_static_mem_prop and
> acquire_static_memory_bank to deduce complexity.
> - introduce a new helper allocate_static_memory_11 for allocating static
> memory for direct-map guests
> - remove redundant use "bool direct_map", to be replaced by
> d_cfg.flags & XEN_DOMCTL_CDF_directmap
> - remove panic action since it is fine to assign a non-DMA capable device when
> IOMMU and direct-map both off
> ---
> v3 changes:
> - doc refinement
> - drop the pointless gbank
> - add check of the size of nr_banks shall not exceed NR_MEM_BANKS
> - add ASSERT_UNREACHABLE to catch any misuse
> - add another check of validating flag XEN_DOMCTL_CDF_INTERNAL_directmap only
> when CONFIG_STATIC_MEMORY is set.
> ---
>   docs/misc/arm/device-tree/booting.txt |   6 ++
>   xen/arch/arm/domain_build.c           | 105 +++++++++++++++++++++++++-
>   2 files changed, 108 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 71895663a4..a94125394e 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -182,6 +182,12 @@ with the following properties:
>       Both #address-cells and #size-cells need to be specified because
>       both sub-nodes (described shortly) have reg properties.
>   
> +- direct-map
> +
> +    Only available when statically allocated memory is used for the domain.
> +    An empty property to request the memory of the domain to be
> +    direct-map (guest physical address == physical address).
> +
>   Under the "xen,domain" compatible node, one or more sub-nodes are present
>   for the DomU kernel and ramdisk.
>   
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1dc728e848..97a5b5dedd 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -500,8 +500,13 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>   {
>       int res;
>       unsigned int nr_pages = PFN_DOWN(size);
> -    /* Infer next GFN. */
> -    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
> +    gfn_t sgfn;
> +
> +    if ( !is_domain_direct_mapped(d) )
> +        /* Infer next GFN when GFN != MFN. */

I would move this comment just before the if and write something like:

/*
  * For direct-mapped domain, the GFN match the MFN.
  * Otherwise, this is inferred on what has already been allocated in the
  * bank.
  */

> +        sgfn = gaddr_to_gfn(bank->start + bank->size);
> +    else
> +        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
>   
>       res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
>       if ( res )
> @@ -674,12 +679,94 @@ static void __init allocate_static_memory(struct domain *d,
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

I would rename the function to assign_static_memory_11() to make
clear there is no allocation done. Instead we are only mapping 
pre-defined host regions to pre-defined guest regions.

> +                                             struct kernel_info *kinfo,
> +                                             const struct dt_device_node *node)
> +{
> +    u32 addr_cells, size_cells, reg_cells;
> +    unsigned int nr_banks, bank = 0;
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
> +    if ( nr_banks > NR_MEM_BANKS )
> +    {
> +        printk(XENLOG_ERR
> +               "%pd: exceed max number of supported guest memory banks.\n", d);
> +        goto fail;
> +    }
> +
> +    for ( ; bank < nr_banks; bank++ )
> +    {
> +        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
> +                                          &pbase, &psize);
> +        if ( !mfn_valid(smfn) )
> +            goto fail;
> +
> +        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
> +               d, bank, pbase, pbase + psize);
> +
> +        /* One guest memory bank is matched with one physical memory bank. */
> +        kinfo->mem.bank[bank].start = pbase;
> +        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[bank],
> +                                           smfn, psize) )
> +            goto fail;
> +
> +        tot_size += psize;

Rather than using tot_size, I would directly substract psize from 
kinfo->unassigned_mem. Regardless that...

> +    }
> +
> +    kinfo->mem.nr_banks = nr_banks;
> +
> +    kinfo->unassigned_mem -= tot_size;

... we should check that this doesn't underflow.

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
> +    ASSERT_UNREACHABLE();
> +}
>   #endif
>   
>   static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
> @@ -2983,7 +3070,12 @@ static int __init construct_domU(struct domain *d,
>       if ( !dt_find_property(node, "xen,static-mem", NULL) )
>           allocate_memory(d, &kinfo);
>       else
> -        allocate_static_memory(d, &kinfo, node);
> +    {
> +        if ( is_domain_direct_mapped(d) )
> +            allocate_static_memory_11(d, &kinfo, node);
> +        else
> +            allocate_static_memory(d, &kinfo, node);

The nested if/else can be avoided if you use:

if ( !dt_find_property() )
    ...
else if ( !is_domain_direct_mapped() )
    ...
else
    ...

> +    }
>   
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
> @@ -3024,6 +3116,13 @@ void __init create_domUs(void)
>               panic("Missing property 'cpus' for domain %s\n",
>                     dt_node_name(node));
>   
> +        if ( dt_property_read_bool(node, "direct-map") )
> +        {
> +            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) )
> +                panic("direct-map not valid without CONFIG_STATIC_MEMORY\n");

I would print the node name (see an example above) to help the admin to 
find the "error" in the DT.

Also I would write "direct-map is not valid ...".

> +            d_cfg.flags |= XEN_DOMCTL_CDF_INTERNAL_directmap;
> +        }
> +
>           if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
>                iommu_enabled )
>               d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> 

Cheers,

-- 
Julien Grall

