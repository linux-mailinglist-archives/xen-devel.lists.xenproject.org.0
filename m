Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101E25AF771
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400518.642245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgXN-00030e-Ik; Tue, 06 Sep 2022 21:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400518.642245; Tue, 06 Sep 2022 21:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgXN-0002yZ-Fy; Tue, 06 Sep 2022 21:55:17 +0000
Received: by outflank-mailman (input) for mailman id 400518;
 Tue, 06 Sep 2022 21:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4s6j=ZJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVgXM-0002yT-57
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:55:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95d68aa6-2e2e-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 23:55:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 243B8615BB;
 Tue,  6 Sep 2022 21:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6CBC433C1;
 Tue,  6 Sep 2022 21:55:11 +0000 (UTC)
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
X-Inumbo-ID: 95d68aa6-2e2e-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662501312;
	bh=LuXSCf+/dyfRqqCH7TweTrKu2nhhJw+Y2SyCDFvD4DA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CPI6K38w81sioYQFUp3mGrbW5/9ZidJ37Rn4C0B2AcGmqJ2BTshCMSXMFqdcp/Nh2
	 s0UZ9lgRDtErl2uj6A18nrH3wj98oD+8HoeSd+O6HEze1TZIS41GBzMq5kYL1z42JP
	 nsPBE4mLggnDTPPea8dUonYxkBnywF/fb7+zJFp8TjDCon0bGhXvWM+JYXmeu3aLIV
	 BhfUcJvVvGMyF/rbysx6n3zqfkoxduf05faMtkTz0aS48vHtC898L+mSV7wdcPvcoQ
	 z49gwgT3JxJrRno2ZKbtqnFSkHlwhIazRicN4NRFgv2/X+Ge/DulGUcAnL1R8GQLkR
	 9shzwm/729Tkg==
Date: Tue, 6 Sep 2022 14:55:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 3/9] xen/arm: allocate static shared memory to a
 specific owner domain
In-Reply-To: <20220906085941.944592-4-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209061455020.157835@ubuntu-linux-20-04-desktop>
References: <20220906085941.944592-1-Penny.Zheng@arm.com> <20220906085941.944592-4-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Sep 2022, Penny Zheng wrote:
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
> v7 chhanges:
> - adapt to the previous commits' changes
> ---
> v6 change:
> - fix coding-style
> - role_str and owner_dom_io shall be defined within the loop
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
>  xen/arch/arm/domain_build.c | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index be98ff83b1..4be8a00171 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -822,9 +822,11 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>  
>  static int __init assign_shared_memory(struct domain *d,
>                                         uint32_t addr_cells, uint32_t size_cells,
> -                                       paddr_t pbase, paddr_t psize)
> +                                       paddr_t pbase, paddr_t psize,
> +                                       paddr_t gbase)
>  {
>      mfn_t smfn;
> +    int ret = 0;
>  
>      dprintk(XENLOG_INFO,
>              "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> @@ -838,8 +840,18 @@ static int __init assign_shared_memory(struct domain *d,
>       * DOMID_IO is auto-translated (i.e. it seems RAM 1:1). So we do not need
>       * to create mapping in the P2M.
>       */
> -    ASSERT(d == dom_io);
> -    return 0;
> +    if ( d != dom_io )
> +    {
> +        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn,
> +                                      PFN_DOWN(psize));
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR "Failed to map shared memory to %pd.\n", d);
> +            return ret;
> +        }
> +    }
> +
> +    return ret;
>  }
>  
>  static int __init process_shm(struct domain *d,
> @@ -855,6 +867,8 @@ static int __init process_shm(struct domain *d,
>          paddr_t gbase, pbase, psize;
>          int ret = 0;
>          unsigned int i;
> +        const char *role_str;
> +        bool owner_dom_io = true;
>  
>          if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
>              continue;
> @@ -891,20 +905,28 @@ static int __init process_shm(struct domain *d,
>                  return -EINVAL;
>              }
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
>           * DOMID_IO is a fake domain and is not described in the Device-Tree.
>           * Therefore when the owner of the shared region is DOMID_IO, we will
>           * only find the borrowers.
>           */
> -        if ( !is_shm_allocated_to_domio(pbase) )
> +        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
> +             (!owner_dom_io && strcmp(role_str, "owner") == 0) )
>          {
>              /*
>               * We found the first borrower of the region, the owner was not
>               * specified, so they should be assigned to dom_io.
>               */
> -            ret = assign_shared_memory(dom_io, addr_cells, size_cells,
> -                                       pbase, psize);
> +            ret = assign_shared_memory(owner_dom_io ? dom_io : d,
> +                                       addr_cells, size_cells,
> +                                       pbase, psize, gbase);
>              if ( ret )
>                  return ret;
>          }
> -- 
> 2.25.1
> 

