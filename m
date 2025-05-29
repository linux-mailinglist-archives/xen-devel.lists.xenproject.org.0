Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C56AC858B
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 01:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000294.1380619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKn5N-000491-9d; Thu, 29 May 2025 23:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000294.1380619; Thu, 29 May 2025 23:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKn5N-00047c-6j; Thu, 29 May 2025 23:54:57 +0000
Received: by outflank-mailman (input) for mailman id 1000294;
 Thu, 29 May 2025 23:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKn5L-00047Q-DM
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 23:54:55 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fb354a0-3ce8-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 01:54:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27238A4FD0C;
 Thu, 29 May 2025 23:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98152C4CEE7;
 Thu, 29 May 2025 23:54:49 +0000 (UTC)
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
X-Inumbo-ID: 4fb354a0-3ce8-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748562890;
	bh=4BfsZ3augz5y7Ho+0ck+rFebHZj3y+T9LF9klbGr5jo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Io9sFGDhUqk1Y9zHHrRrFC+BpvreBrn69FuODJCWhoXcwk++z5PEF86+K8W+/LgS0
	 R/Tv/5EFHhoNPKiCihICQRGR7ryQ6to8lMbRqxZd507dJxJurfo0FxG3y2wrqVrXhy
	 WE5LIJg7xA2/UE3hnDQuhT2eFWrwABbKSW15xF7VGtzNAT5vNHt7hZvqIbvJGl5OF0
	 JTIIhlitTtKg5pXbP5EJT0KUJzlXnQMAzjQ9OA4fegHByg3gCV6lhgmmdif6jvbfGr
	 hWT8a4vvkLmSR1056XN2OU/EYPCaxVlyyHm9JH4x234m4vF+YyLczTTRCI9UeFV9bq
	 HK0ZoBFo2oEag==
Date: Thu, 29 May 2025 16:54:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Denis Mukhin <dmkhn@proton.me>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, 
    dmukhin@ford.com
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
In-Reply-To: <20250528225030.2652166-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2505291654200.135336@ubuntu-linux-20-04-desktop>
References: <20250528225030.2652166-1-dmukhin@ford.com> <20250528225030.2652166-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 May 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmkhn@proton.me>
> 
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Remove the hardcoded domain ID 0 allocation for hardware domain and replace it
> with a call to get_initial_domain_id() (returns the value of hardware_domid on
> Arm).
> 
> Update domid_alloc(DOMID_INVALID) case to ensure that get_initial_domain_id()
> ID is skipped during domain ID allocation to cover domU case in dom0less
> configuration. That also fixes a potential issue with re-using ID#0 for domUs
> when get_initial_domain_id() returns non-zero.

It looks like this sentence should be removed from the commit message as
not valid anymore.

Aside from that, the code changes below as clear.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v8:
> - rebased 
> ---
>  xen/arch/arm/domain_build.c             | 4 ++--
>  xen/common/device-tree/dom0less-build.c | 9 +++------
>  xen/common/domain.c                     | 4 ++--
>  3 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index e9d563c269..0ad80b020a 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2035,9 +2035,9 @@ void __init create_dom0(void)
>      if ( !llc_coloring_enabled )
>          flags |= CDF_directmap;
>  
> -    domid = domid_alloc(0);
> +    domid = domid_alloc(get_initial_domain_id());
>      if ( domid == DOMID_INVALID )
> -        panic("Error allocating domain ID 0\n");
> +        panic("Error allocating domain ID %d\n", get_initial_domain_id());
>  
>      dom0 = domain_create(domid, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index a509f8fecd..9a6015f4ce 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -974,14 +974,11 @@ void __init create_domUs(void)
>  
>          arch_create_domUs(node, &d_cfg, flags);
>  
> -        /*
> -         * The variable max_init_domid is initialized with zero, so here it's
> -         * very important to use the pre-increment operator to call
> -         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
> -         */
> -        domid = domid_alloc(++max_init_domid);
> +        domid = domid_alloc(DOMID_INVALID);
>          if ( domid == DOMID_INVALID )
>              panic("Error allocating ID for domain %s\n", dt_node_name(node));
> +        if ( max_init_domid < domid )
> +            max_init_domid = domid;
>  
>          d = domain_create(domid, &d_cfg, flags);
>          if ( IS_ERR(d) )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index ae0c44fcbb..129b4fcb37 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2423,8 +2423,8 @@ domid_t domid_alloc(domid_t domid)
>      else
>      {
>          static domid_t domid_last;
> -        /* NB: account for late hwdom case, skip ID#0 */
> -        const domid_t reserved_domid = 0;
> +        /* NB: account for late hwdom case */
> +        const domid_t reserved_domid = get_initial_domain_id();
>          const bool reserved = __test_and_set_bit(reserved_domid, domid_bitmap);
>  
>          domid = find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED,
> -- 
> 2.34.1
> 
> 

