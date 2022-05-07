Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300351E2E7
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 03:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323478.545153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8wJ-0004nT-1d; Sat, 07 May 2022 01:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323478.545153; Sat, 07 May 2022 01:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8wI-0004km-Tv; Sat, 07 May 2022 01:08:54 +0000
Received: by outflank-mailman (input) for mailman id 323478;
 Sat, 07 May 2022 01:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtL8=VP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn8wH-00045S-C7
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 01:08:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42628f14-cda2-11ec-a406-831a346695d4;
 Sat, 07 May 2022 03:08:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07F9CB838E6;
 Sat,  7 May 2022 01:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7752EC385A8;
 Sat,  7 May 2022 01:08:50 +0000 (UTC)
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
X-Inumbo-ID: 42628f14-cda2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651885730;
	bh=BoNFKBKfzSpWyDeOheFiBCiFvaa73UsP6sYCZE+3E/w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LNy7OYrxWr8ICZh1Cg2fWmy1Hih4oOyyk8bP1DrRkeWiXLk9wfhZdqsQBoLchNggL
	 wKvBu2mrwpYH/PK3CHt3ffMzuyhTAb4MUYfxFcmXgLmT4Gs1IgbBdg/S1HmBTuBd9R
	 LY6upvyA9z6QGwIlAlWAAt5vbeYC+KwC3t/UAkka/1g+JQ1E9up+qHjyhKWLS34/hj
	 fWx3BwNVPpQeQMhf2oGRBqHk8Xy3dwBZuaRvWSYwk+x7/vyLBjGu5IO7fmqJ4PPkyF
	 evtmGbL79VjzKUpfpZhrspAI+9pFjkEY6nK9D74j+6WwIlQo4GvRxWfnEP+mIz6ddR
	 5y2CbyMLJx9EA==
Date: Fri, 6 May 2022 18:08:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/9] xen/arm: allocate static shared memory to a
 specific owner domain
In-Reply-To: <20220506072502.2177828-4-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205061707371.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-4-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Penny Zheng wrote:
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
> ---
> v2 change:
> - P2M mapping is restricted to normal domain
> - in-code comment fix
> ---
>  xen/arch/arm/domain_build.c | 55 +++++++++++++++++++++++++++++--------
>  1 file changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index e97bb6eeba..f43378227a 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -798,9 +798,11 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>   */
>  static int __init allocate_shared_memory(struct domain *d,
>                                           u32 addr_cells, u32 size_cells,
> -                                         paddr_t pbase, paddr_t psize)
> +                                         paddr_t pbase, paddr_t psize,
> +                                         paddr_t gbase)
>  {
>      mfn_t smfn;
> +    int ret = 0;
>  
>      dprintk(XENLOG_INFO,
>              "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> @@ -813,10 +815,20 @@ static int __init allocate_shared_memory(struct domain *d,
>  
>      /*
>       * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.
> -     * It sees RAM 1:1 and we do not need to create P2M mapping for it
> +     * It sees RAM 1:1 and we do not need to create P2M mapping for it.
>       */
> -    ASSERT(d == dom_io);
> -    return 0;
> +    if ( d != dom_io )
> +    {
> +        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR
> +                   "Failed to map shared memory to %pd.\n", d);
> +            return ret;
> +        }
> +    }
> +
> +    return ret;
>  }
>  
>  static int __init process_shm(struct domain *d,
> @@ -829,6 +841,8 @@ static int __init process_shm(struct domain *d,
>      u32 shm_id;
>      u32 addr_cells, size_cells;
>      paddr_t gbase, pbase, psize;
> +    const char *role_str;
> +    bool owner_dom_io = true;
>  
>      dt_for_each_child_node(node, shm_node)
>      {
> @@ -855,19 +869,36 @@ static int __init process_shm(struct domain *d,
>          ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
>          gbase = dt_read_number(cells, addr_cells);
>  
> -        /* TODO: Consider owner domain is not the default dom_io. */
> +        /*
> +         * "role" property is optional and if it is defined explicitly,
> +         * then the owner domain is not the default "dom_io" domain.
> +         */
> +        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
> +            owner_dom_io = false;
> +
>          /*
>           * Per static shared memory region could be shared between multiple
>           * domains.
> -         * In case re-allocating the same shared memory region, we check
> -         * if it is already allocated to the default owner dom_io before
> -         * the actual allocation.
> +         * So when owner domain is the default dom_io, in case re-allocating
> +         * the same shared memory region, we check if it is already allocated
> +         * to the default owner dom_io before the actual allocation.
>           */
> -        if ( !is_shm_allocated_to_domio(pbase) )
> +        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
> +             (!owner_dom_io && strcmp(role_str, "owner") == 0) )
>          {
> -            /* Allocate statically shared pages to the default owner dom_io. */
> -            ret = allocate_shared_memory(dom_io, addr_cells, size_cells,
> -                                         pbase, psize);
> +            struct domain *od = d;
> +            paddr_t o_gbase = gbase;
> +
> +            if ( owner_dom_io )
> +            {
> +                od = dom_io;
> +                /* For dom_io, GFN is always equal to PFN. */
> +                o_gbase = pbase;
> +            }
>

o_gbase is not used if the domain is dom_io, so I would simplify it
further to:

ret = allocate_shared_memory(owner_dom_io ? dom_io : d,
                             addr_cells, size_cells,
                             pbase, psize, gbase);





> +            /* Allocate statically shared pages to the owner domain. */
> +            ret = allocate_shared_memory(od, addr_cells, size_cells,
> +                                         pbase, psize, o_gbase);
>              if ( ret )
>                  return ret;
>          }
> -- 
> 2.25.1
> 

