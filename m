Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3255258B6
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 01:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328044.550959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npIXE-00050a-8t; Thu, 12 May 2022 23:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328044.550959; Thu, 12 May 2022 23:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npIXE-0004yh-5S; Thu, 12 May 2022 23:47:56 +0000
Received: by outflank-mailman (input) for mailman id 328044;
 Thu, 12 May 2022 23:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rM9=VU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npIXC-0004h7-JJ
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 23:47:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f07ed6ac-d24d-11ec-a406-831a346695d4;
 Fri, 13 May 2022 01:47:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 913B4B82BCC;
 Thu, 12 May 2022 23:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB542C385B8;
 Thu, 12 May 2022 23:47:50 +0000 (UTC)
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
X-Inumbo-ID: f07ed6ac-d24d-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652399271;
	bh=NXFxOp/Qrwd2viPanIbIngggvGhBsOgWSXzae41CLJI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=srGg3Gyx6aSv/preyE6WBA5JMAeKecV03H9HZ3AqcVc2gAPWyHqh6HwSh6OT1e898
	 DeyclPGz/oyjSy1QsZv17ZBQaKPF5KehIlL/RQxI9CxUSoJQzZlq25pkCYjWPgjUKS
	 RgffI784WHVtDQhiw28qHgfW5tGtIHztvPApsWW+eDk+13/aLApVtTPz1mPSfaBPjs
	 SzuLs1a9z0TjqZd1kLnp825yw0cpdM17sTtABoyE1RQksYxZ0AGW3usrMNv/VeT9pY
	 i22pu3quNkC+ybyzwihF+fYryB+r1rcqFCiC6ALIsfBuD75S97OTn5GbqV0w0DTu1J
	 jHzJWUbCLudZg==
Date: Thu, 12 May 2022 16:47:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/8] xen/arm: allocate static shared memory to a
 specific owner domain
In-Reply-To: <20220512091129.2802997-4-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205121633400.3842@ubuntu-linux-20-04-desktop>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com> <20220512091129.2802997-4-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 May 2022, Penny Zheng wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v3 change:
> - simplify the code since o_gbase is not used if the domain is dom_io
> ---
> v2 change:
> - P2M mapping is restricted to normal domain
> - in-code comment fix
> ---
>  xen/arch/arm/domain_build.c | 44 +++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 5b41ec57f0..9c53b9fa7b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -797,9 +797,11 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
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
> @@ -814,8 +816,18 @@ static int __init allocate_shared_memory(struct domain *d,
>       * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.
>       * It sees RAM 1:1 and we do not need to create P2M mapping for it
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
> @@ -828,6 +840,8 @@ static int __init process_shm(struct domain *d,
>      u32 shm_id;
>      u32 addr_cells, size_cells;
>      paddr_t gbase, pbase, psize;
> +    const char *role_str;
> +    bool owner_dom_io = true;
>  
>      dt_for_each_child_node(node, shm_node)
>      {
> @@ -854,19 +868,27 @@ static int __init process_shm(struct domain *d,
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
> +            /* Allocate statically shared pages to the owner domain. */
> +            ret = allocate_shared_memory(owner_dom_io ? dom_io : d,
> +                                         addr_cells, size_cells,
> +                                         pbase, psize, gbase);
>              if ( ret )
>                  return ret;
>          }
> -- 
> 2.25.1
> 

