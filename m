Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D3AC8593
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 02:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000302.1380628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKnEa-0006Vc-W0; Fri, 30 May 2025 00:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000302.1380628; Fri, 30 May 2025 00:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKnEa-0006T6-Ss; Fri, 30 May 2025 00:04:28 +0000
Received: by outflank-mailman (input) for mailman id 1000302;
 Fri, 30 May 2025 00:04:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z72a=YO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKnEY-0006T0-Lb
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 00:04:26 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5493447-3ce9-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 02:04:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2ACCFA4FD1B;
 Fri, 30 May 2025 00:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78672C4CEE7;
 Fri, 30 May 2025 00:04:22 +0000 (UTC)
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
X-Inumbo-ID: a5493447-3ce9-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748563463;
	bh=1mwVF/KHkOBDkqMACEeZBs5U8mShfF4X6FVzllWHmoc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tcTiZmKTfCZl8s/kKPuT8aPF6lwPFyFvGjyR58A6FMhUDJ9lMr9LT3i5Z+2Lw/UWg
	 /AtScMtNn3juBBlmYnETt3c0y0rqXvPl0J90UIVy6KEnX2HDjFFV9i4mWtAcxDE6bQ
	 4IsbNNVjQnoxDcjvMHiSojEkR4sGK/0q3/YgrB6lpVoCRoFPBtqOJ2R0SM4Ga5Cs/z
	 4UesfI7ZpPhPcT7cm/EGrqpKL6Rxyv6TQlEzS80ltzXr+cCEhRJ0qaibE0zombAFqJ
	 vZr0fJ3SDriat7F9bnhStb4gyE0rwjpHPfXFrZipNOzUpPOzs2+ZyVwoWPoxoLqdmT
	 PU4j3Jlip1/DA==
Date: Thu, 29 May 2025 17:04:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Denis Mukhin <dmkhn@proton.me>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, 
    dmukhin@ford.com
Subject: Re: [PATCH v9 3/3] xen/domain: introduce CONFIG_MAX_DOMID
In-Reply-To: <20250528225030.2652166-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2505291659330.135336@ubuntu-linux-20-04-desktop>
References: <20250528225030.2652166-1-dmukhin@ford.com> <20250528225030.2652166-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 May 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmkhn@proton.me>
> 
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Embedded deployments of Xen do not need to have support for more than dozen of
> domains.
> 
> Introduce build-time configuration option to limit the number of domains during
> run-time.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

There is one DOMID_FIRST_RESERVED check in xen/arch/arm/tee/ffa.c that
should be changed too


> ---
> Changes since v8:
> - dropped hunk w/ compile-time check for DOMID_FIRST_RESERVED
> - updated CONFIG_MAX_DOMID explanation
> - dropped public header file changes
> ---
>  xen/arch/x86/cpu/mcheck/mce.c       |  2 +-
>  xen/arch/x86/cpu/vpmu.c             |  2 +-
>  xen/common/Kconfig                  |  8 ++++++++
>  xen/common/domain.c                 | 20 +++++++++++---------
>  xen/common/sched/core.c             |  4 ++--
>  xen/drivers/passthrough/vtd/iommu.c |  2 +-
>  6 files changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
> index 1c348e557d..ee8ddd33b0 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -1493,7 +1493,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
>              d = rcu_lock_domain_by_any_id(mc_msrinject->mcinj_domid);
>              if ( d == NULL )
>              {
> -                if ( mc_msrinject->mcinj_domid >= DOMID_FIRST_RESERVED )
> +                if ( mc_msrinject->mcinj_domid >= CONFIG_MAX_DOMID )
>                      return x86_mcerr("do_mca inject: incompatible flag "
>                                       "MC_MSRINJ_F_GPADDR with domain %d",
>                                       -EINVAL, domid);
> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index c28192ea26..67d423e088 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -174,7 +174,7 @@ void vpmu_do_interrupt(void)
>       * in XENPMU_MODE_ALL, for everyone.
>       */
>      if ( (vpmu_mode & XENPMU_MODE_ALL) ||
> -         (sampled->domain->domain_id >= DOMID_FIRST_RESERVED) )
> +         (sampled->domain->domain_id >= CONFIG_MAX_DOMID) )
>      {
>          sampling = choose_hwdom_vcpu();
>          if ( !sampling )
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 3d66d09397..ef083856b8 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -579,4 +579,12 @@ config BUDDY_ALLOCATOR_SIZE
>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>  	  working alongside the colored one.
>  
> +config MAX_DOMID
> +	int "Maximum domain ID"
> +	range 1 32752
> +	default 32752
> +	help
> +	  Specifies the maximum domain ID (dom0 or late hwdom, predefined
> +	  domains, post-boot domains, excluding Xen system domains).

Written like this it would seem that the maximum domain ID is usable,
e.g. that 32752 is a valid domid number. Actually 32752 is 0x7ff0 which
is DOMID_FIRST_RESERVED == DOMID_SELF and cannot be used.

I think we should change the description:


Specifies the maximum domain ID (dom0 or late hwdom, predefined domains,
post-boot domains, excluding Xen system domains). This value indicates
the first domain ID that is out of bounds and cannot be used for domain
allocation.



>  endmenu
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 129b4fcb37..87e5be35e5 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -68,7 +68,7 @@ struct domain *domain_list;
>  
>  /* Non-system domain ID allocator. */
>  static DEFINE_SPINLOCK(domid_lock);
> -static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> +static DECLARE_BITMAP(domid_bitmap, CONFIG_MAX_DOMID);
>  
>  /*
>   * Insert a domain into the domlist/hash.  This allows the domain to be looked
> @@ -154,7 +154,7 @@ int domain_init_states(void)
>      ASSERT(rw_is_write_locked_by_me(&current->domain->event_lock));
>  
>      dom_state_changed = xvzalloc_array(unsigned long,
> -                                       BITS_TO_LONGS(DOMID_FIRST_RESERVED));
> +                                       BITS_TO_LONGS(CONFIG_MAX_DOMID));
>      if ( !dom_state_changed )
>          return -ENOMEM;
>  
> @@ -234,7 +234,7 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>      while ( dom_state_changed )
>      {
>          dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
> -        if ( dom >= DOMID_FIRST_RESERVED )
> +        if ( dom >= CONFIG_MAX_DOMID )
>              break;
>          if ( test_and_clear_bit(dom, dom_state_changed) )
>          {
> @@ -823,7 +823,7 @@ struct domain *domain_create(domid_t domid,
>      /* Sort out our idea of is_hardware_domain(). */
>      if ( (flags & CDF_hardware) || domid == hardware_domid )
>      {
> -        if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
> +        if ( hardware_domid < 0 || hardware_domid >= CONFIG_MAX_DOMID )
>              panic("The value of hardware_dom must be a valid domain ID\n");
>  
>          /* late_hwdom is only allowed for dom0. */
> @@ -2413,9 +2413,11 @@ domid_t get_initial_domain_id(void)
>  
>  domid_t domid_alloc(domid_t domid)
>  {
> +    BUILD_BUG_ON(DOMID_FIRST_RESERVED < CONFIG_MAX_DOMID);
> +
>      spin_lock(&domid_lock);
>  
> -    if ( domid < DOMID_FIRST_RESERVED )
> +    if ( domid < CONFIG_MAX_DOMID )
>      {
>          if ( __test_and_set_bit(domid, domid_bitmap) )
>              domid = DOMID_INVALID;
> @@ -2427,13 +2429,13 @@ domid_t domid_alloc(domid_t domid)
>          const domid_t reserved_domid = get_initial_domain_id();
>          const bool reserved = __test_and_set_bit(reserved_domid, domid_bitmap);
>  
> -        domid = find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED,
> +        domid = find_next_zero_bit(domid_bitmap, CONFIG_MAX_DOMID,
>                                     domid_last);
>  
> -        if ( domid == DOMID_FIRST_RESERVED )
> -            domid = find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED, 0);
> +        if ( domid == CONFIG_MAX_DOMID )
> +            domid = find_next_zero_bit(domid_bitmap, CONFIG_MAX_DOMID, 0);
>  
> -        if ( domid == DOMID_FIRST_RESERVED )
> +        if ( domid == CONFIG_MAX_DOMID )
>          {
>              domid = DOMID_INVALID;
>          }
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 9043414290..f1bfb6f6a2 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -867,7 +867,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
>      int ret;
>  
>      ASSERT(d->cpupool == NULL);
> -    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
> +    ASSERT(d->domain_id < CONFIG_MAX_DOMID);
>  
>      if ( (ret = cpupool_add_domain(d, poolid)) )
>          return ret;
> @@ -891,7 +891,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
>  
>  void sched_destroy_domain(struct domain *d)
>  {
> -    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
> +    ASSERT(d->domain_id < CONFIG_MAX_DOMID);
>  
>      if ( d->cpupool )
>      {
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index c55f02c97e..5df85ca629 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1509,7 +1509,7 @@ int domain_context_mapping_one(
>  
>          prev_did = context_domain_id(lctxt);
>          domid = did_to_domain_id(iommu, prev_did);
> -        if ( domid < DOMID_FIRST_RESERVED )
> +        if ( domid < CONFIG_MAX_DOMID )
>              prev_dom = rcu_lock_domain_by_id(domid);
>          else if ( pdev ? domid == pdev->arch.pseudo_domid : domid > DOMID_MASK )
>              prev_dom = rcu_lock_domain(dom_io);
> -- 
> 2.34.1
> 
> 

