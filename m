Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562AD5A28F9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 16:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393898.633098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRZs7-0001mm-HK; Fri, 26 Aug 2022 13:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393898.633098; Fri, 26 Aug 2022 13:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRZs7-0001kZ-ET; Fri, 26 Aug 2022 13:59:43 +0000
Received: by outflank-mailman (input) for mailman id 393898;
 Fri, 26 Aug 2022 13:59:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oRZs6-0001kT-Gw
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 13:59:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRZs6-0001ZY-1h; Fri, 26 Aug 2022 13:59:42 +0000
Received: from [54.239.6.187] (helo=[192.168.16.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRZs5-00059X-Q3; Fri, 26 Aug 2022 13:59:41 +0000
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
	bh=gPqyOPs2qnF6T77KS0SX79FEZfQKiJqON1mv7r57apU=; b=1VHgvhBcVHjQvE+gx/rWnU8TPR
	Zm88HK/L906HVkrVdq+JxahLQUqvBUy5d+s3j/4l/vDskZJtFrOjUpw6sOnTpL/acZqS5cKzB1507
	T8BRT6/WUQj4UyfVZxndihpALw7RNG9K/6B3GDzdveE+xQZzFrB6mUH7Nb5yL6h4gfFk=;
Message-ID: <b5d92f89-4231-e4e8-b219-80fd2911a944@xen.org>
Date: Fri, 26 Aug 2022 14:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v6 2/9] xen/arm: allocate static shared memory to the
 default owner dom_io
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220721132115.3015761-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 21/07/2022 14:21, Penny Zheng wrote:
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
> v6 change:
> - use if-array to check psize, pbase and gbase are suitably aligned and
> valid
> - use mfn_valid to check (pbase, pbase + psize)
> - check d->max_pages will not overflow
> - refine acquire_shared_memory_bank to not reuse acquire_static_memory_bank,
> then input pbase and psize do not need to be used as a pointer.
> - use if-array to check if page owner is dom_io
> - in-code comment refinement
> ---
> v5 change:
> - refine in-code comment
> ---
> v4 change:
> - no changes
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
>   xen/arch/arm/domain_build.c | 155 ++++++++++++++++++++++++++++++++++++
>   xen/common/domain.c         |   3 +
>   2 files changed, 158 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3fd1186b53..ff2aebaf28 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -759,6 +759,155 @@ static void __init assign_static_memory_11(struct domain *d,
>       panic("Failed to assign requested static memory for direct-map domain %pd.",
>             d);
>   }
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
> +    if ( page_get_owner(page) == NULL )

Sorry, I should have stopped the issue with the call before. 
page_get_owner() can only be called for pages that are marked inuse. 
This is because the field "domain" is part of an union.

So I think you want to use page_get_owner_and_reference() here. The 
reference will have to be dropped using put_page(). I think it should be 
fine to do within the same function because we are still at init and 
therefore the page owner shouldn't change. I would explain that in a 
comment.

> +        return false;
> +
> +    if ( page_get_owner(page) != dom_io )

Let's not duplicate the call to page_get_owner(). You can use the result 
from the caller above and drop the reference afterwards (see above).

> +    {
> +        printk(XENLOG_ERR
> +               "shm memory node has already been allocated to a specific owner %pd, Please check your configuration\n",
> +               page_get_owner(page));
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static mfn_t __init acquire_shared_memory_bank(struct domain *d,
> +                                               paddr_t pbase, paddr_t psize)
> +{
> +    mfn_t smfn;
> +    unsigned long nr_pfns;
> +    int res;
> +
> +    /*
> +     * Pages of statically shared memory shall be included
> +     * into domain_tot_pages().
> +     */
> +    nr_pfns = PFN_DOWN(psize);
> +    if ( (UINT_MAX - d->max_pages) < nr_pfns )
> +    {
> +        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
> +               d, nr_pfns);
> +        return INVALID_MFN;
> +    }
> +    d->max_pages += nr_pfns;
> +
> +    smfn = maddr_to_mfn(pbase);
> +    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR
> +               "%pd: failed to acquire static memory: %d.\n", d, res);

Should not we adjust "d->max_pages" if acquire_domstatic_pages() fails?

> +        return INVALID_MFN;
> +    }
> +
> +    return smfn;
> +}
> +
> +static int __init allocate_shared_memory(struct domain *d,
> +                                         u32 addr_cells, u32 size_cells,
> +                                         paddr_t pbase, paddr_t psize)
> +{
> +    mfn_t smfn;
> +
> +    dprintk(XENLOG_INFO,
> +            "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> +            d, pbase, pbase + psize);
> +
> +    smfn = acquire_shared_memory_bank(d, pbase, psize);
> +    if ( mfn_eq(smfn, INVALID_MFN) )
> +        return -EINVAL;
> +
> +    /*
> +     * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.

It is not quite clear why DOMID_XEN is mentioned here. Yes, it is 
auto-translated like DOMID_IO, but code doesn't care about that here.

> +     * It sees RAM 1:1 and we do not need to create P2M mapping for it
> +     */

The overall comment reads a bit odd without the implement for non-dom0. 
I don't have a good suggestion other than have a different comment for 
now and rewording it. But that's just churn.

Regarding the current comment I would suggest the following:

DOMID_IO is auto-translated (i.e. it seems RAM 1:1). So we do not need 
to create mapping in the P2M.

> +    ASSERT(d == dom_io);
> +    return 0;
> +}
> +
> +static int __init process_shm(struct domain *d,
> +                              const struct dt_device_node *node)
> +{
> +    struct dt_device_node *shm_node;
> +
> +    dt_for_each_child_node(node, shm_node)
> +    {
> +        const struct dt_property *prop;
> +        const __be32 *cells;
> +        uint32_t addr_cells, size_cells;
> +        paddr_t gbase, pbase, psize;
> +        int ret = 0;
> +        unsigned int i;
> +
> +        if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
> +            continue;
> +
> +        /*
> +         * xen,shared-mem = <pbase, psize, gbase>;
> +         * TODO: pbase is optional.
> +         */
> +        addr_cells = dt_n_addr_cells(shm_node);
> +        size_cells = dt_n_size_cells(shm_node);
> +        prop = dt_find_property(shm_node, "xen,shared-mem", NULL); > +        ASSERT(prop);

I would suggest to switch to BUG_ON() because this is init code. So 
better to be obvious.

> +        cells = (const __be32 *)prop->value;
> +        device_tree_get_reg(&cells, addr_cells, size_cells, &pbase, &psize);
> +        gbase = dt_read_number(cells, addr_cells);
> +        if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
> +        {
> +            printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> +                   d, pbase, gbase);
> +            return -EINVAL;
> +        }
> +        if ( !IS_ALIGNED(psize, PAGE_SIZE) )
> +        {
> +            printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
> +                   d, psize);
> +            return -EINVAL;
> +        }
> +
> +        for ( i = 0; i < PFN_DOWN(psize); i++ )
> +            if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
> +            {
> +                printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
> +                       d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
> +                return -EINVAL;
> +            }
> +
> +        /* TODO: Consider owner domain is not the default dom_io. */
> +        /*
> +         * Per static shared memory region could be shared between multiple
> +         * domains.

Well, it would not be shared memory otherwise :). I think here you are 
referring to the fact that the owner may be DOMID_IO *and* the area 
still shared with multiple borrower.

> +         * In case re-allocating the same shared memory region, we check
> +         * if it is already allocated to the default owner dom_io before
> +         * the actual allocation.
> +         */

I think it would be worth explaining in the commit message that DOMID_IO 
is not a "real" domain. This is why you need to check whether the shared 
area has been reserved. So how about replacing the two paragraphs with:

"DOMID_IO is a fake domain and is not described in the Device-Tree. 
Therefore When the owner of the shared region is DOMID_IO, we will only 
find the borrowers."

> +        if ( !is_shm_allocated_to_domio(pbase) )
> +        {
> +            /* Allocate statically shared pages to the default owner dom_io. */

This is mostly repeating the line below. How about:

"We found the first borrower of the region, the owner was not specified 
so they should be assign to dom0".

> +            ret = allocate_shared_memory(dom_io, addr_cells, size_cells,
> +                                         pbase, psize);

While proposing some comments above, I realized that this function is 
not really allocating memory. It is assigning a set of pages to domain.

So may I suggest to rename it to assign_shared_memory()? Or maybe 
acquire_shared_memory()?

> +            if ( ret )
> +                return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +#endif /* CONFIG_STATIC_SHM */
>   #else
>   static void __init allocate_static_memory(struct domain *d,
>                                             struct kernel_info *kinfo,
> @@ -3236,6 +3385,12 @@ static int __init construct_domU(struct domain *d,
>       else
>           assign_static_memory_11(d, &kinfo, node);
>   
> +#ifdef CONFIG_STATIC_SHM
> +    rc = process_shm(d, node);
> +    if ( rc < 0 )
> +        return rc;
> +#endif
> +
>       /*
>        * Base address and irq number are needed when creating vpl011 device
>        * tree node in prepare_dtb_domU, so initialization on related variables
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 618410e3b2..c8564113e9 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -780,6 +780,9 @@ void __init setup_system_domains(void)
>        * This domain owns I/O pages that are within the range of the page_info
>        * array. Mappings occur at the priv of the caller.
>        * Quarantined PCI devices will be associated with this domain.
> +     *
> +     * DOMID_IO is also the default owner of memory pre-shared among multiple
> +     * domains at boot time.
>        */
>       dom_io = domain_create(DOMID_IO, NULL, 0);
>       if ( IS_ERR(dom_io) )

Cheers,

-- 
Julien Grall

