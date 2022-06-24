Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0C55A095
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 20:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355822.583731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4nwt-0004RM-0v; Fri, 24 Jun 2022 18:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355822.583731; Fri, 24 Jun 2022 18:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4nws-0004OY-Tk; Fri, 24 Jun 2022 18:22:30 +0000
Received: by outflank-mailman (input) for mailman id 355822;
 Fri, 24 Jun 2022 18:22:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4nwr-0004OS-HE
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 18:22:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4nwr-0004ve-0R; Fri, 24 Jun 2022 18:22:29 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4nwq-0005jp-Pb; Fri, 24 Jun 2022 18:22:28 +0000
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
	bh=IMU+ODRBlkNAU2Z3TDAu/9pV1UuWSQzZj0s1oNRQSTA=; b=fSQSn9e2ADVVCUtCC8XdKK1Taj
	g+/nd1JUWZ8NSkdLdL1Nj+jZ4CzTKOViwW5cSE5jSb0tD0fGL6OsL7yGhDWAEIGJX2nfdRFtPcrP7
	dfQOm92iR/2Xb13q9oglNe1LIcOQq0x4SYXdy/F6e25dI9ZS5MdD0zX5mIaRjhzfFjsk=;
Message-ID: <3b7b32cb-df48-e458-e8a9-f17e86f39c9a@xen.org>
Date: Fri, 24 Jun 2022 19:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620051114.210118-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 20/06/2022 06:11, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> This commit introduces process_shm to cope with static shared memory in
> domain construction.
> 
> DOMID_IO will be the default owner of memory pre-shared among multiple domains
> at boot time, when no explicit owner is specified.

The document in patch #1 suggest the page will be shared with 
dom_shared. But here you say "DOMID_IO".

Which one is correct?

> 
> This commit only considers allocating static shared memory to dom_io
> when owner domain is not explicitly defined in device tree, all the left,
> including the "borrower" code path, the "explicit owner" code path, shall
> be introduced later in the following patches.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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
>   xen/arch/arm/domain_build.c | 132 +++++++++++++++++++++++++++++++++++-
>   xen/common/domain.c         |   3 +
>   2 files changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7ddd16c26d..91a5ace851 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -527,6 +527,10 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>       return true;
>   }
>   
> +/*
> + * If cell is NULL, pbase and psize should hold valid values.
> + * Otherwise, cell will be populated together with pbase and psize.
> + */
>   static mfn_t __init acquire_static_memory_bank(struct domain *d,
>                                                  const __be32 **cell,
>                                                  u32 addr_cells, u32 size_cells,
> @@ -535,7 +539,8 @@ static mfn_t __init acquire_static_memory_bank(struct domain *d,
>       mfn_t smfn;
>       int res;
>   
> -    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
> +    if ( cell )
> +        device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);

I think this is a bit of a hack. To me it sounds like this should be 
moved out to a separate helper. This will also make the interface of 
acquire_shared_memory_bank() less questionable (see below).

As this is v5, I would be OK with a follow-up for this split. But this 
interface of acuiqre_shared_memory_bank() needs to change.

>       ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));

In the context of your series, who is checking that both psize and pbase 
are suitably aligned?

>       if ( PFN_DOWN(*psize) > UINT_MAX )
>       {
> @@ -759,6 +764,125 @@ static void __init assign_static_memory_11(struct domain *d,
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
> +    ASSERT(page);

maddr_to_page() can never return NULL. If you want to check a page will 
be valid, then you should use mfn_valid().

However, the ASSERT() implies that the address was suitably checked 
before. But I can't find such check.

> +
> +    if ( page_get_owner(page) == NULL )
> +        return false;
> +
> +    ASSERT(page_get_owner(page) == dom_io);
Could this be hit because of a wrong device-tree? If yes, then this 
should not be an ASSERT() (they are not suitable to check user input).

> +    return true;
> +}
> +
> +static mfn_t __init acquire_shared_memory_bank(struct domain *d,
> +                                               u32 addr_cells, u32 size_cells,
> +                                               paddr_t *pbase, paddr_t *psize)

There is something that doesn't add-up in this interface. The use of 
pointer implies that pbase and psize may be modified by the function. So...

> +{
> +    /*
> +     * Pages of statically shared memory shall be included
> +     * in domain_tot_pages().
> +     */
> +    d->max_pages += PFN_DOWN(*psize);

... it sounds a bit strange to use psize here. If psize, can't be 
modified than it should probably not be a pointer.

Also, where do you check that d->max_pages will not overflow?

> +
> +    return acquire_static_memory_bank(d, NULL, addr_cells, size_cells,
> +                                      pbase, psize);
> +
> +}
> +
> +/*
> + * Func allocate_shared_memory is supposed to be only called

I am a bit concerned with the word "supposed". Are you implying that it 
may be called by someone that is not the owner? If not, then it should 
be "should".

Also NIT: Spell out completely "func". I.e "The function".

> + * from the owner.

I read from as "current should be the owner". But I guess this is not 
what you mean here. Instead it looks like you mean "d" is the owner. So 
I would write "d should be the owner of the shared area".

It would be good to have a check/ASSERT confirm this (assuming this is 
easy to write).

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

NIT: I would suggest to also print the domain. This could help to easily 
figure out that 'd' wasn't the owner.

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

See above about what ASSERT()s are for.

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
>   #else
>   static void __init allocate_static_memory(struct domain *d,
>                                             struct kernel_info *kinfo,
> @@ -3236,6 +3360,12 @@ static int __init construct_domU(struct domain *d,
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
> index 7570eae91a..7070f5a9b9 100644
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

