Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B892A4DD2B4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 03:00:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291826.495618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1ul-0003JH-Sa; Fri, 18 Mar 2022 02:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291826.495618; Fri, 18 Mar 2022 02:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1ul-0003Fe-Nv; Fri, 18 Mar 2022 02:00:27 +0000
Received: by outflank-mailman (input) for mailman id 291826;
 Fri, 18 Mar 2022 02:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nV1uj-0000eL-KJ
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 02:00:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ccaf7b5-a65f-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 03:00:24 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54E9FB820EE;
 Fri, 18 Mar 2022 02:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A78C340E9;
 Fri, 18 Mar 2022 02:00:22 +0000 (UTC)
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
X-Inumbo-ID: 2ccaf7b5-a65f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647568823;
	bh=tOsfkikweiXmGyE2Snc4IOxdlDo1VjsiXYnHIcQeXGM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eIktvNJxW0ExuzeJ9Jr32gD+fLhLuTP775141cP4q6XeSSCLaaXe3ohjEBF/ts4eg
	 XDOaEEaez4yKdnlsrNmf64xCheRf1QfYrHji/zzFDhcVIcZTGXSoviN2RHutGWEsek
	 W2knDwEq2XWlPh5pmB5JPihiEg0AOgiNfSM+zseX1HPHxyGdMX/1Y4zou1Qe1G90HO
	 Y3JzKHUaIEEkzAjjS9TaDQ13Uh30+RnPgfheebdGMNk/i9sXsNM8aSmx4DbVA0iWSM
	 1ioKS0X5QZpe7bd2+1pm1aKciQtOxnLe5J6UQnEjWbcnLgwaFWkSDSBTVcQoCEWOyO
	 3UtHHYCm6pLAg==
Date: Thu, 17 Mar 2022 19:00:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 10/13] xen/arm: allocate static shared memory to a
 specific owner domain
In-Reply-To: <20220311061123.1883189-11-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203171824140.3497@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-11-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Mar 2022, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> If owner property is defined, then owner domain of a static shared memory
> region is not the default dom_shared anymore, but a specific domain.
> 
> This commit implements allocating static shared memory to a specific domain
> when owner property is defined.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 63 ++++++++++++++++++++++++++++---------
>  1 file changed, 48 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d35f98ff9c..7ee4d33e0b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -872,6 +872,8 @@ static int __init process_shm(struct domain *d,
>      u32 shm_id;
>      u32 addr_cells, size_cells;
>      paddr_t gbase, pbase, psize;
> +    const char *role_str;
> +    bool owner_dom_shared = true;
>  
>      dt_for_each_child_node(node, shm_node)
>      {
> @@ -899,6 +901,13 @@ static int __init process_shm(struct domain *d,
>          gbase = dt_read_number(cells, addr_cells);
>  
>          /* TODO: Consider owner domain is not the default dom_shared. */

We should remove this comment?


> +        /*
> +         * "role" property is optional and if it is defined explicitly,
> +         * so the owner domain is not the default "dom_shared" domain.
> +         */
> +        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
> +            owner_dom_shared = false;
> +
>          /*
>           * Per shared memory region could be shared between multiple domains.
>           * In case re-allocating the same shared memory region, we use bitmask
> @@ -907,17 +916,38 @@ static int __init process_shm(struct domain *d,
>           */
>          if ( !test_bit(shm_id, shm_mask) )
>          {
> -            /*
> -             * Allocate statically shared pages to the default dom_shared.
> -             * Set up P2M, and dom_shared is a direct-map domain,
> -             * so GFN == PFN.
> -             */
> -            ret = allocate_shared_memory(dom_shared, addr_cells, size_cells,
> -                                         pbase, psize, pbase);
> -            if ( ret )
> -                return ret;
> -
> -            set_bit(shm_id, shm_mask);
> +            if ( !owner_dom_shared )
> +            {
> +                if ( strcmp(role_str, "owner") == 0 )
> +                {
> +                    /*
> +                     * Allocate statically shared pages to a specific owner
> +                     * domain.
> +                     */
> +                    ret = allocate_shared_memory(d, shm_id, addr_cells,
> +                                                 size_cells, pbase, psize,
> +                                                 gbase);
> +                    if ( ret )
> +                        return ret;
> +
> +                    set_bit(shm_id, shm_mask);
> +                }
> +            }
> +            else
> +            {
> +                /*
> +                 * Allocate statically shared pages to the default dom_shared.
> +                 * Set up P2M, and dom_shared is a direct-map domain,
> +                 * so GFN == PFN.
> +                 */
> +                ret = allocate_shared_memory(dom_shared, shm_id,
> +                                             addr_cells, size_cells, pbase,
> +                                             psize, pbase);
> +                if ( ret )
> +                    return ret;
> +
> +                set_bit(shm_id, shm_mask);
> +            }

These two chunks are identical if not for dom_shared / d. Can we just
do:

if ( owner_dom_shared )
  d = dom_shared;

on top? Then we can implement this only once.

>          }
>  
>          /*
> @@ -925,10 +955,13 @@ static int __init process_shm(struct domain *d,
>           * default dom_shared, so here we could just set up P2M foreign
>           * mapping for borrower domain immediately.
>           */
> -        ret = guest_physmap_add_shm(dom_shared, d, PFN_DOWN(pbase),
> -                                    PFN_DOWN(gbase), PFN_DOWN(psize));
> -        if ( ret )
> -            return ret;
> +        if ( owner_dom_shared )
> +        {
> +            ret = guest_physmap_add_shm(dom_shared, d, PFN_DOWN(pbase),
> +                                        PFN_DOWN(gbase), PFN_DOWN(psize));
> +            if ( ret )
> +                return ret;
> +        }

What happens if the borrower is specified before the owner in device
tree? I see the case is handle by the next patch. Maybe we can have at
least a comment here or in the commit message.


>  
>          /*
>           * Record static shared memory region info for later setting
> -- 
> 2.25.1
> 

