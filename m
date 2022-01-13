Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD748E0AA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 23:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257429.442278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n88xw-0004hy-U2; Thu, 13 Jan 2022 22:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257429.442278; Thu, 13 Jan 2022 22:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n88xw-0004fb-R4; Thu, 13 Jan 2022 22:53:08 +0000
Received: by outflank-mailman (input) for mailman id 257429;
 Thu, 13 Jan 2022 22:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n88xv-0004fV-Mr
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 22:53:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92135fed-74c3-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 23:53:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68BAEB8239D;
 Thu, 13 Jan 2022 22:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0D6C36AEA;
 Thu, 13 Jan 2022 22:53:03 +0000 (UTC)
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
X-Inumbo-ID: 92135fed-74c3-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642114384;
	bh=7XuRcCAUTqSLyDC8M3f1HwXlI1ZZmFeypK7y6e4W7+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Xh2SdBnJcwDgzaj1i8RHXwiOU2IXNWNpK9VXVx0gocp6QBQShmmh/i2kH8d+DoA5l
	 f/z3w6TVTD9kYUW5gnh08wxSI+rFJVlvOkwLvQYmKfaBssqr4/2x4dNVhePZnj/J8m
	 ijdpnnznUw/d8gMvRu2vWWSEw6b4dsZ1sWmgO+25VSkIPKyiOVAjPEFoGFPkq/5f3x
	 JgCFDdht4MGrFBgJBEGxvtbpqjw3lzOSWa1x6t7vZKh84bDeAOzOStjnnrDcgn3McY
	 YOcRTd4B4YQ6YqygBVV4t8JQ8862qTz7WGoobl+R6mf2kuZyCYXVkbChHb5NdKoO9F
	 0d/FTNuy8Q8MQ==
Date: Thu, 13 Jan 2022 14:53:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com
Subject: Re: [PATCH v4 05/11] xen/arm: introduce direct-map for domUs
In-Reply-To: <20211220052123.969876-6-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2201131447520.19362@ubuntu-linux-20-04-desktop>
References: <20211220052123.969876-1-penny.zheng@arm.com> <20211220052123.969876-6-penny.zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Dec 2021, Penny Zheng wrote:
> Cases where domU needs direct-map memory map:
>   * IOMMU not present in the system.
>   * IOMMU disabled if it doesn't cover a specific device and all the guests
> are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
> a few without, then guest DMA security still could not be totally guaranteed.
> So users may want to disable the IOMMU, to at least gain some performance
> improvement from IOMMU disabled.
>   * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
> To be specific, in a few extreme situation, when multiple devices do DMA
> concurrently, these requests may exceed IOMMU's transmission capacity.
>   * IOMMU disabled when it adds too much latency on DMA. For example,
> TLB may be missing in some IOMMU hardware, which may bring latency in DMA
> progress, so users may want to disable it in some realtime scenario.
>   * Guest OS relies on the host memory layout
> 
> This commit introduces a new helper assign_static_memory_11 to allocate
> static memory as guest RAM for direct-map domain.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

The patch looks good. There are a couple of minor code style issus below
that it would be good to fix, at least the function parameters
alignment.  With that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


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
> v4 changes:
> - comment refinement
> - rename function allocate_static_memory_11() to assign_static_memory_11()
> to make clear there is actually no allocation done. Instead we are only
> mapping pre-defined host regions to pre-defined guest regions.
> - remove tot_size to directly substract psize from kinfo->unassigned_mem
> - check kinfo->unassigned_mem doesn't underflow or overflow
> - remove nested if/else
> - refine "panic" info
> ---
>  xen/arch/arm/domain_build.c | 97 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 94 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9206ec908d..d74a3eb908 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -494,8 +494,17 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>  {
>      int res;
>      unsigned int nr_pages = PFN_DOWN(size);
> -    /* Infer next GFN. */
> -    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
> +    gfn_t sgfn;
> +
> +    /*
> +     * For direct-mapped domain, the GFN match the MFN.
> +     * Otherwise, this is inferred on what has already been allocated
> +     * in the bank.
> +     */
> +    if ( !is_domain_direct_mapped(d) )
> +        sgfn = gaddr_to_gfn(bank->start + bank->size);
> +    else
> +        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
>  
>      res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
>      if ( res )
> @@ -668,12 +677,92 @@ static void __init allocate_static_memory(struct domain *d,
>   fail:
>      panic("Failed to allocate requested static memory for domain %pd.", d);
>  }
> +
> +/*
> + * Allocate static memory as RAM for one specific domain d.
> + * The static memory will be directly mapped in the guest(Guest Physical
> + * Address == Physical Address).
> + */
> +static void __init assign_static_memory_11(struct domain *d,
> +                                             struct kernel_info *kinfo,
> +                                             const struct dt_device_node *node)

Please align the parameters


> +{
> +    u32 addr_cells, size_cells, reg_cells;
> +    unsigned int nr_banks, bank = 0;
> +    const __be32 *cell;
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

no space after sizeof


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
> +        if ( mfn_eq(smfn, INVALID_MFN) )
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
> +        kinfo->unassigned_mem -= psize;
> +    }
> +
> +    kinfo->mem.nr_banks = nr_banks;
> +
> +    /*
> +     * The property 'memory' should match the amount of memory given to
> +     * the guest.
> +     * Currently, it is only possible to either acquire static memory or
> +     * let Xen allocate. *Mixing* is not supported.
> +     */
> +    if ( kinfo->unassigned_mem != 0 )
> +    {
> +        printk(XENLOG_ERR
> +               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");

This line would benefit from being broken down, but I am also OK if we
leave it as is


> +        goto fail;
> +    }
> +
> +    return;
> +
> + fail:
> +    panic("Failed to assign requested static memory for direct-map domain %pd.",
> +          d);
> +}
>  #else
>  static void __init allocate_static_memory(struct domain *d,
>                                            struct kernel_info *kinfo,
>                                            const struct dt_device_node *node)
>  {
>  }
> +
> +static void __init assign_static_memory_11(struct domain *d,
> +                                             struct kernel_info *kinfo,
> +                                             const struct dt_device_node *node)
> +{
> +    ASSERT_UNREACHABLE();
> +}
>  #endif
>  
>  /*
> @@ -3023,8 +3112,10 @@ static int __init construct_domU(struct domain *d,
>  #endif
>      if ( !dt_find_property(node, "xen,static-mem", NULL) )
>          allocate_memory(d, &kinfo);
> -    else
> +    else if ( !is_domain_direct_mapped(d) )
>          allocate_static_memory(d, &kinfo, node);
> +    else
> +        assign_static_memory_11(d, &kinfo, node);
>  
>      rc = prepare_dtb_domU(d, &kinfo);
>      if ( rc < 0 )
> -- 
> 2.25.1
> 

