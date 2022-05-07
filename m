Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566E951E2E9
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 03:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323476.545141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8wA-0004QK-OJ; Sat, 07 May 2022 01:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323476.545141; Sat, 07 May 2022 01:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8wA-0004NS-Km; Sat, 07 May 2022 01:08:46 +0000
Received: by outflank-mailman (input) for mailman id 323476;
 Sat, 07 May 2022 01:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtL8=VP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn8w9-00045S-1c
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 01:08:45 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d37d35c-cda2-11ec-a406-831a346695d4;
 Sat, 07 May 2022 03:08:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 235D8B81031;
 Sat,  7 May 2022 01:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5F3C385A8;
 Sat,  7 May 2022 01:08:41 +0000 (UTC)
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
X-Inumbo-ID: 3d37d35c-cda2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651885721;
	bh=qKLsxrkRx6OnqjuwOvuzu03qa5vsk11A0xOi+U4j1lI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tPz0YgqN+UsFlseRhjcn9brfrdPAw/Oajy0oK/6Da848auWRe4nC+9QQWsFvoBh2p
	 cxWYBkbw06F+U+pgCF3LE/hv9bayiEFjKH4oEzhkQm4ykl8qP/Hm9KprRxnH+mmiDu
	 iFFNdb3Nsp891g36/vJRXrp1pUxrBkx1GL1/kybvC9ez8yAS65uRKgGOa/dws+PPFv
	 crN9afE5xKLktWMqQpbliZeYoMR8TYNQcZ0D0qGwKu4HZOUQ9Fd8znhIRu6dQ5hxRj
	 mxdX6ASf7yrZcd/wyKyecyLOvTk5i6dWrbscbDh9ILiO2MHP8uSN+08SClxYCg33PY
	 NypF6VXaLy5fw==
Date: Fri, 6 May 2022 18:08:40 -0700 (PDT)
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
Subject: Re: [PATCH v2 2/9] xen/arm: allocate static shared memory to the
 default owner dom_io
In-Reply-To: <20220506072502.2177828-3-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205061327110.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-3-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Penny Zheng wrote:
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
>  xen/arch/arm/domain_build.c | 133 +++++++++++++++++++++++++++++++++++-
>  xen/common/domain.c         |  18 ++++-
>  2 files changed, 148 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1472ca4972..e97bb6eeba 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -527,7 +527,13 @@ static mfn_t __init acquire_static_memory_bank(struct domain *d,
>      mfn_t smfn;
>      int res;
>  
> -    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
> +    /*
> +     * acquire_static_memory_bank() is also used for acquiring static shared
> +     * memory, in such case, we don't need to parse 'cell' here since it is
> +     * already parsed in process_shm().
> +     */

I would prefer if the comment was moved on top of
acquire_static_memory_bank and rephrased as:

/*
 * If cell is NULL, pbase and psize should hold valid values.
 * Otherwise, cell will be populated together with pbase and psize.
 */

Other than that, it looks good. I'll leave it to Jan to comment on the
in-code comment in xen/common/domain.c.


> +    if ( cell )
> +        device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
>      ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
>      if ( PFN_DOWN(*psize) > UINT_MAX )
>      {
> @@ -751,6 +757,125 @@ static void __init assign_static_memory_11(struct domain *d,
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
> @@ -3149,6 +3274,12 @@ static int __init construct_domU(struct domain *d,
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
> index 8d2c2a9897..0c41ecb197 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -777,8 +777,22 @@ void __init setup_system_domains(void)
>  
>      /*
>       * Initialise our DOMID_IO domain.
> -     * This domain owns I/O pages that are within the range of the page_info
> -     * array. Mappings occur at the priv of the caller.
> +     * DOMID_IO is used for mapping memory and MMIO regions when no explicit
> +     * Domain need to be specified.
> +     *
> +     * For instance, DOMID_IO is the owner of memory pre-shared among
> +     * multiple domains at boot time, when no explicit owner is specified.
> +     *
> +     * Also, DOMID_IO is used to restrict page-table updates to mapping I/O
> +     * memory. Although no Foreign Domain need to be specified to map I/O
> +     * pages, DOMID_IO is useful to ensure that no mappings to the OS's own
> +     * heap are accidentally installed. (e.g., in Linux this could cause
> +     * havoc as reference counts aren't adjusted on the I/O-mapping code
> +     * path). This only makes sense as HYPERVISOR_mmu_update()'s and
> +     * HYPERVISOR_update_va_mapping_otherdomain()'s "foreigndom" argument.
> +     * For HYPERVISOR_mmu_update() context it can be specified by any
> +     * calling domain, otherwise it's only permitted if the caller is
> +     * privileged.
>       * Quarantined PCI devices will be associated with this domain.
>       */
>      dom_io = domain_create(DOMID_IO, NULL, 0);
> -- 
> 2.25.1
> 

