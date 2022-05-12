Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C265258B4
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 01:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328043.550948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npIXB-0004k8-1g; Thu, 12 May 2022 23:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328043.550948; Thu, 12 May 2022 23:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npIXA-0004hQ-TV; Thu, 12 May 2022 23:47:52 +0000
Received: by outflank-mailman (input) for mailman id 328043;
 Thu, 12 May 2022 23:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rM9=VU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npIX8-0004h7-N5
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 23:47:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed80eddb-d24d-11ec-a406-831a346695d4;
 Fri, 13 May 2022 01:47:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7034662050;
 Thu, 12 May 2022 23:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE0EC385B8;
 Thu, 12 May 2022 23:47:46 +0000 (UTC)
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
X-Inumbo-ID: ed80eddb-d24d-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652399266;
	bh=bpMUX5bxRCVGBW4bA+5o/RvoQkmqxB9En86sYJgzRcA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cFxjO4k8hyc1oRN//Nhd8wL++5io+4e5/yyyyyv0LPViakibdi+DstM0lZcI9Fq+0
	 kfVCe+WDbPcg34nG0Ikng30Gtl10+Sh6XG50qk9o5+VXEs5wtQbdW69Utu96K35iUJ
	 E0QksLQft/jjpXQ+AshdaVew89cD3P12MZhP4cPvsmpxYh8nNmBviVqWUtl/YZAK/T
	 3/J2q33+K9UowKyXigj0JQx+Y44pnuBNuvLcUl2EWT0fSdcHm5G/DvOUTrqOV1pLrw
	 G2aUXB5zCfH7g/djVbQiOLsYENVaSOZi/IPcQCxSAKpM/eXCRqw6XeldLup9Yb8AUt
	 JQ67fp8Zb0KTg==
Date: Thu, 12 May 2022 16:47:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
In-Reply-To: <20220512091129.2802997-3-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205121631080.3842@ubuntu-linux-20-04-desktop>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com> <20220512091129.2802997-3-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 May 2022, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> This commit introduces process_shm to cope with static shared memory in
> domain construction.
> 
> DOMID_IO will be the default owner of memory pre-shared among multiple domains
> at boot time, when no explicit owner is specified.
> 
> This commit only considers allocating static shared memory to dom_io
> when owner domain is not explicitly defined in device tree, all the left,
> including the "borrower" code path, the "explicit owner" code path, shall
> be introduced later in the following patches.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v3 change:
> - refine in-code comment
> ---
> v2 change:
> - instead of introducing a new system domain, reuse the existing dom_io
> - make dom_io a non-auto-translated domain, then no need to create P2M
> for it
> - change dom_io definition and make it wider to support static shm here too
> - introduce is_shm_allocated_to_domio to check whether static shm is
> allocated yet, instead of using shm_mask bitmap
> - add in-code comment
> ---
>  xen/arch/arm/domain_build.c | 132 +++++++++++++++++++++++++++++++++++-
>  xen/common/domain.c         |   5 ++
>  2 files changed, 136 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1472ca4972..5b41ec57f0 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -519,6 +519,10 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>      return true;
>  }
>  
> +/*
> + * If cell is NULL, pbase and psize should hold valid values.
> + * Otherwise, cell will be populated together with pbase and psize.
> + */
>  static mfn_t __init acquire_static_memory_bank(struct domain *d,
>                                                 const __be32 **cell,
>                                                 u32 addr_cells, u32 size_cells,
> @@ -527,7 +531,8 @@ static mfn_t __init acquire_static_memory_bank(struct domain *d,
>      mfn_t smfn;
>      int res;
>  
> -    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
> +    if ( cell )
> +        device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
>      ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
>      if ( PFN_DOWN(*psize) > UINT_MAX )
>      {
> @@ -751,6 +756,125 @@ static void __init assign_static_memory_11(struct domain *d,
>      panic("Failed to assign requested static memory for direct-map domain %pd.",
>            d);
>  }
> +
> +#ifdef CONFIG_STATIC_SHM
> +/*
> + * This function checks whether the static shared memory region is
> + * already allocated to dom_io.
> + */
> +static bool __init is_shm_allocated_to_domio(paddr_t pbase)
> +{
> +    struct page_info *page;
> +
> +    page = maddr_to_page(pbase);
> +    ASSERT(page);
> +
> +    if ( page_get_owner(page) == NULL )
> +        return false;
> +
> +    ASSERT(page_get_owner(page) == dom_io);
> +    return true;
> +}
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
> +/*
> + * Func allocate_shared_memory is supposed to be only called
> + * from the owner.
> + */
> +static int __init allocate_shared_memory(struct domain *d,
> +                                         u32 addr_cells, u32 size_cells,
> +                                         paddr_t pbase, paddr_t psize)
> +{
> +    mfn_t smfn;
> +
> +    dprintk(XENLOG_INFO,
> +            "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> +            pbase, pbase + psize);
> +
> +    smfn = acquire_shared_memory_bank(d, addr_cells, size_cells, &pbase,
> +                                      &psize);
> +    if ( mfn_eq(smfn, INVALID_MFN) )
> +        return -EINVAL;
> +
> +    /*
> +     * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.
> +     * It sees RAM 1:1 and we do not need to create P2M mapping for it
> +     */
> +    ASSERT(d == dom_io);
> +    return 0;
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
> +        /* TODO: Consider owner domain is not the default dom_io. */
> +        /*
> +         * Per static shared memory region could be shared between multiple
> +         * domains.
> +         * In case re-allocating the same shared memory region, we check
> +         * if it is already allocated to the default owner dom_io before
> +         * the actual allocation.
> +         */
> +        if ( !is_shm_allocated_to_domio(pbase) )
> +        {
> +            /* Allocate statically shared pages to the default owner dom_io. */
> +            ret = allocate_shared_memory(dom_io, addr_cells, size_cells,
> +                                         pbase, psize);
> +            if ( ret )
> +                return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +#endif /* CONFIG_STATIC_SHM */
>  #else
>  static void __init allocate_static_memory(struct domain *d,
>                                            struct kernel_info *kinfo,
> @@ -3149,6 +3273,12 @@ static int __init construct_domU(struct domain *d,
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
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8d2c2a9897..43237c287a 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -780,6 +780,11 @@ void __init setup_system_domains(void)
>       * This domain owns I/O pages that are within the range of the page_info
>       * array. Mappings occur at the priv of the caller.
>       * Quarantined PCI devices will be associated with this domain.
> +     *
> +     * DOMID_IO could also be used for mapping memory when no explicit
> +     * domain is specified.
> +     * For instance, DOMID_IO is the owner of memory pre-shared among
> +     * multiple domains at boot time, when no explicit owner is specified.
>       */
>      dom_io = domain_create(DOMID_IO, NULL, 0);
>      if ( IS_ERR(dom_io) )
> -- 
> 2.25.1
> 

