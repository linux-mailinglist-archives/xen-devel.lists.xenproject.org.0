Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0F555A161
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355828.583741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4oeD-0001sU-IV; Fri, 24 Jun 2022 19:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355828.583741; Fri, 24 Jun 2022 19:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4oeD-0001q2-Fk; Fri, 24 Jun 2022 19:07:17 +0000
Received: by outflank-mailman (input) for mailman id 355828;
 Fri, 24 Jun 2022 19:07:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4oeB-0001pw-DT
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 19:07:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4oeA-0005jE-Ug; Fri, 24 Jun 2022 19:07:14 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4oeA-00084Q-O2; Fri, 24 Jun 2022 19:07:14 +0000
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
	bh=bVHWr1eyOn7xrOFcb7kcXn1hxu6B9NX735jrtp9le3g=; b=2y6y85QY/dkWHkEuvboH6yRpHk
	LAqZcNl9WZ0LdU52CyCVzw5HpFqRSC8zJHXYlXRRu7bNDen9GmP8chSkz+bpXFlNRKVz0HgrhfXGE
	qTOX3Epc6mWXoVvCSZscWTHyWRw0JETsNvaIAIrdoYIJZpLLBlueILTolz41PxTWBGaM=;
Message-ID: <8cf391b9-02a3-6058-35cb-e0a63b8db854@xen.org>
Date: Fri, 24 Jun 2022 20:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 3/8] xen/arm: allocate static shared memory to a
 specific owner domain
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-4-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620051114.210118-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 20/06/2022 06:11, Penny Zheng wrote:
> If owner property is defined, then owner domain of a static shared memory
> region is not the default dom_io anymore, but a specific domain.
> 
> This commit implements allocating static shared memory to a specific domain
> when owner property is defined.
> 
> Coding flow for dealing borrower domain will be introduced later in the
> following commits.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v5 change:
> - no change
> ---
> v4 change:
> - no changes
> ---
> v3 change:
> - simplify the code since o_gbase is not used if the domain is dom_io
> ---
> v2 change:
> - P2M mapping is restricted to normal domain
> - in-code comment fix
> ---
>   xen/arch/arm/domain_build.c | 44 +++++++++++++++++++++++++++----------
>   1 file changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 91a5ace851..d4fd64e2bd 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -805,9 +805,11 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>    */
>   static int __init allocate_shared_memory(struct domain *d,
>                                            u32 addr_cells, u32 size_cells,
> -                                         paddr_t pbase, paddr_t psize)
> +                                         paddr_t pbase, paddr_t psize,
> +                                         paddr_t gbase)
>   {
>       mfn_t smfn;
> +    int ret = 0;
>   
>       dprintk(XENLOG_INFO,
>               "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> @@ -822,8 +824,18 @@ static int __init allocate_shared_memory(struct domain *d,
>        * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.
>        * It sees RAM 1:1 and we do not need to create P2M mapping for it
>        */
> -    ASSERT(d == dom_io);
> -    return 0;
> +    if ( d != dom_io )
> +    {
> +        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));

Coding style: this line is over 80 characters. And...

> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR
> +                   "Failed to map shared memory to %pd.\n", d);

... this line could be merged with the previous one.

> +            return ret;
> +        }
> +    }
> +
> +    return ret;
>   }
>   
>   static int __init process_shm(struct domain *d,
> @@ -836,6 +848,8 @@ static int __init process_shm(struct domain *d,
>       u32 shm_id;
>       u32 addr_cells, size_cells;
>       paddr_t gbase, pbase, psize;
> +    const char *role_str;
> +    bool owner_dom_io = true;

I think it would be best if role_str and owner_dom_io are defined within 
the loop. Same goes for all the other declarations.

>   
>       dt_for_each_child_node(node, shm_node)
>       {
> @@ -862,19 +876,27 @@ static int __init process_shm(struct domain *d,
>           ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
>           gbase = dt_read_number(cells, addr_cells);
>   
> -        /* TODO: Consider owner domain is not the default dom_io. */
> +        /*
> +         * "role" property is optional and if it is defined explicitly,
> +         * then the owner domain is not the default "dom_io" domain.
> +         */
> +        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
> +            owner_dom_io = false
IIUC, the role is per-region. However, owner_dom_io is first initialized 
to false outside the loop. Therefore, the variable may not be correct on 
the next region.

So I think you want to write:

owner_dom_io = !dt_property_read_string(...);

This can also be avoided if you reduce the scope of the variable (it is 
meant to only be used in the loop).

> +
>           /*
>            * Per static shared memory region could be shared between multiple
>            * domains.
> -         * In case re-allocating the same shared memory region, we check
> -         * if it is already allocated to the default owner dom_io before
> -         * the actual allocation.
> +         * So when owner domain is the default dom_io, in case re-allocating
> +         * the same shared memory region, we check if it is already allocated
> +         * to the default owner dom_io before the actual allocation.
>            */
> -        if ( !is_shm_allocated_to_domio(pbase) )
> +        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
> +             (!owner_dom_io && strcmp(role_str, "owner") == 0) )
>           {
> -            /* Allocate statically shared pages to the default owner dom_io. */
> -            ret = allocate_shared_memory(dom_io, addr_cells, size_cells,
> -                                         pbase, psize);
> +            /* Allocate statically shared pages to the owner domain. */
> +            ret = allocate_shared_memory(owner_dom_io ? dom_io : d,
> +                                         addr_cells, size_cells,
> +                                         pbase, psize, gbase);
>               if ( ret )
>                   return ret;
>           }

Cheers,

-- 
Julien Grall

