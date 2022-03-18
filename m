Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0F4DD2AF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 03:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291817.495585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1uD-0000o2-2f; Fri, 18 Mar 2022 01:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291817.495585; Fri, 18 Mar 2022 01:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1uC-0000lC-V8; Fri, 18 Mar 2022 01:59:52 +0000
Received: by outflank-mailman (input) for mailman id 291817;
 Fri, 18 Mar 2022 01:59:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nV1uB-0008RA-NT
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 01:59:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 181dd984-a65f-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 02:59:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88DB460F8B;
 Fri, 18 Mar 2022 01:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DC3C340E9;
 Fri, 18 Mar 2022 01:59:48 +0000 (UTC)
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
X-Inumbo-ID: 181dd984-a65f-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647568789;
	bh=mJZWUil0h/9svaxQ5BOZS1h+f4rD8rgHoqSEbKcIp9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sKsDZ4ku/qVfgR+mCOKQG27HzRSuaxYt1e3nz62J0RW30DUcnwHcOIwZd3XHoii7X
	 jB8DU+A0t8wN1r4Q4KAMtJHgGarU+SjJHfQSZBsCiPxeb0z0hXqVYe2B/6lEZmhzpK
	 tsbB36IxF6YgztAe+Mkvg+DPLSCB8Pv4/8Er/uG7EHtwzjkiKVM4MA2LoWCWFUVNMc
	 x9ic6oX66KDF8ZyczOPQXxpt8DEObf4DKGWjVn+wH/elBJ8Fj59ekHiZMK0CZIjU91
	 jk9CvPMf28CLSbDti/gBQsQXajcdkWtt+EPW1Jfq7gRTac+Jtln2q39Q48WViQ0pY6
	 cXX2scgkH2Myg==
Date: Thu, 17 Mar 2022 18:59:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 03/13] xen/arm: allocate static shared memory to
 dom_shared
In-Reply-To: <20220311061123.1883189-4-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203171707200.3497@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-4-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Mar 2022, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> This commit introduces process_shm to cope with static shared memory in
> domain construction.
> 
> This commit only considers allocating static shared memory to dom_shared
> when owner domain is not explicitly defined in device tree, the other
> scenario will be covered in the following patches.
> 
> Static shared memory could reuse acquire_static_memory_bank() to acquire
> and allocate static memory.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 116 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8be01678de..6e6349caac 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -527,7 +527,8 @@ static mfn_t __init acquire_static_memory_bank(struct domain *d,
>      mfn_t smfn;
>      int res;
>  
> -    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
> +    if ( cell )
> +        device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);

Why this change?


>      ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
>      if ( PFN_DOWN(*psize) > UINT_MAX )
>      {
> @@ -751,6 +752,113 @@ static void __init assign_static_memory_11(struct domain *d,
>      panic("Failed to assign requested static memory for direct-map domain %pd.",
>            d);
>  }
> +
> +#ifdef CONFIG_STATIC_SHM
> +static __initdata DECLARE_BITMAP(shm_mask, NR_MEM_BANKS);
> +
> +static mfn_t __init acquire_shared_memory_bank(struct domain *d,
> +                                               u32 addr_cells, u32 size_cells,
> +                                               paddr_t *pbase, paddr_t *psize)
> +{
> +    /*
> +     * Pages of statically shared memory shall be included
> +     * in domain_tot_pages().
> +     */
> +    d->max_pages += PFN_DOWN(*psize);
> +
> +    return acquire_static_memory_bank(d, NULL, addr_cells, size_cells,
> +                                      pbase, psize);
> +
> +}
> +
> +static int __init allocate_shared_memory(struct domain *d,
> +                                         u32 addr_cells, u32 size_cells,
> +                                         paddr_t pbase, paddr_t psize,
> +                                         paddr_t gbase)
> +{
> +    mfn_t smfn;
> +    int ret = 0;
> +
> +    printk(XENLOG_INFO "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr"\n",
> +           pbase, pbase + psize);
> +
> +    smfn = acquire_shared_memory_bank(d, addr_cells, size_cells, &pbase,
> +                                      &psize);
> +    if ( mfn_eq(smfn, INVALID_MFN) )
> +        return -EINVAL;
> +
> +    ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
> +    if ( ret )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to map shared memory to %pd.\n", d);
> +        return ret;
> +    }
> +
> +    return ret;
> +}
> +
> +static int __init process_shm(struct domain *d,
> +                              const struct dt_device_node *node)
> +{
> +    struct dt_device_node *shm_node;
> +    int ret = 0;
> +    const struct dt_property *prop;
> +    const __be32 *cells;
> +    u32 shm_id;
> +    u32 addr_cells, size_cells;
> +    paddr_t gbase, pbase, psize;
> +
> +    dt_for_each_child_node(node, shm_node)
> +    {
> +        if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
> +            continue;
> +
> +        if ( !dt_property_read_u32(shm_node, "xen,shm-id", &shm_id) )
> +        {
> +            printk("Shared memory node does not provide \"xen,shm-id\" property.\n");
> +            return -ENOENT;
> +        }
> +
> +        addr_cells = dt_n_addr_cells(shm_node);
> +        size_cells = dt_n_size_cells(shm_node);
> +        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
> +        if ( !prop )
> +        {
> +            printk("Shared memory node does not provide \"xen,shared-mem\" property.\n");
> +            return -ENOENT;
> +        }
> +        cells = (const __be32 *)prop->value;
> +        /* xen,shared-mem = <pbase, psize, gbase>; */
> +        device_tree_get_reg(&cells, addr_cells, size_cells, &pbase, &psize);
> +        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
> +        gbase = dt_read_number(cells, addr_cells);
> +
> +        /* TODO: Consider owner domain is not the default dom_shared. */
> +        /*
> +         * Per shared memory region could be shared between multiple domains.
> +         * In case re-allocating the same shared memory region, we use bitmask
> +         * shm_mask to record whether this shared memory region has ever been
> +         * allocated already.
> +         */
> +        if ( !test_bit(shm_id, shm_mask) )
> +        {
> +            /*
> +             * Allocate statically shared pages to the default dom_shared.
> +             * Set up P2M, and dom_shared is a direct-map domain,
> +             * so GFN == PFN.
> +             */
> +            ret = allocate_shared_memory(dom_shared, addr_cells, size_cells,
> +                                         pbase, psize, pbase);
                                                          ^gbase

The last parameter should be gbase instead of pbase?


Reading this patch is not clear that only the "owner" code path is
implemented here. The "borrower" code path is implemented later and
missing in this patch. I think it would be good to clarify that in the
commit message.

Under this light, allocate_shared_memory is supposed to be only called
for the owner. I think we should probably mention that in the in-code
comment too.

I don't think we need to define a second copy of shm_mask. Can we reuse
the one in bootfdt.c?

Or we could get rid of shm_mask entirely here if we check whether the
pages were already allocated in the owner p2m.


> +            if ( ret )
> +                return ret;
> +
> +            set_bit(shm_id, shm_mask);
> +        }
> +    }
> +
> +    return 0;
> +}
> +#endif /* CONFIG_STATIC_SHM */
>  #else
>  static void __init allocate_static_memory(struct domain *d,
>                                            struct kernel_info *kinfo,
> @@ -3150,6 +3258,12 @@ static int __init construct_domU(struct domain *d,
>      else
>          assign_static_memory_11(d, &kinfo, node);
>  
> +#ifdef CONFIG_STATIC_SHM
> +    rc = process_shm(d, node);
> +    if ( rc < 0 )
> +        return rc;
> +#endif
> +
>      /*
>       * Base address and irq number are needed when creating vpl011 device
>       * tree node in prepare_dtb_domU, so initialization on related variables
> -- 
> 2.25.1
> 

