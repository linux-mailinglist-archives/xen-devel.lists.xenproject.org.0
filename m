Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18242A98867
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964446.1355238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YBh-0000Ly-Bd; Wed, 23 Apr 2025 11:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964446.1355238; Wed, 23 Apr 2025 11:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YBh-0000J8-8j; Wed, 23 Apr 2025 11:22:45 +0000
Received: by outflank-mailman (input) for mailman id 964446;
 Wed, 23 Apr 2025 11:22:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u7YBf-0000J2-MJ
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:22:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u7YBe-00H2KD-2G;
 Wed, 23 Apr 2025 11:22:42 +0000
Received: from [15.248.2.30] (helo=[10.24.67.70])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u7YBe-00A8KA-1J;
 Wed, 23 Apr 2025 11:22:42 +0000
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
	bh=aVxYP1WLmcfSVLs1wMvBwe2BHcUbrBKAHHHfOc5EryA=; b=5xnouchefVEkKSJ4phxita7RVY
	hLPXyQ8Kb7eNpJFEEGcmEZwU18V3vFnK6+zmY0tXHVO69NJwFGhEvsOQQjjbQUohtRVGA63ueoJiU
	oUJC3nxOMH2M2VyCP6pVGDjHzpkEUNsANsBL2Kh+ckUC07e5wIBfsamFs8WayFEViDQ4=;
Message-ID: <f0f159e6-ad79-4c1a-a61e-0272615754d6@xen.org>
Date: Wed, 23 Apr 2025 12:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: unify domain ID allocation
Content-Language: en-GB
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250422215322.521464-1-dmukhin@ford.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250422215322.521464-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Denis,

On 22/04/2025 22:54, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Currently, hypervisor code has two different non-system domain ID allocation
> algorithms:
> 
>    (a) Arm port allocates IDs sequentially based on max_init_domid;
> 
>    (b) x86 has another algorithm implementation embedded into
>        XEN_DOMCTL_createdomain; does not use max_init_domid, but does similar
>        thing wrt sequentially allocating IDs.

I am a bit confused with this statement. This is implying the code is 
only used by x86. However, XEN_DOMCTL_createdomain is common code and 
used by Arm when creating domains from the toolstack. Can you clarify? 
With this in mind...

> 
> It makes sense to have a common helper code for such task across architectures
> (Arm and x86).

... the unification is effectively between dom0less domU allocation and 
the toolstack domU allocation.

> 
> Wrap the domain ID allocation as an arch-independent function domid_alloc() in
> common/domain.c.
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and
>    use it if ID is unused;
> - Otherwise, perform an exhaustive search starting from the end of the used
>    domain ID range, excluding hardware_domid.
> 
> Move the is_free_domid() helper closer to domid_alloc(). Simplify
> is_free_domid() by removing the domain ID range check, as the ID is now
> guaranteed to be within the valid range. Additionally, update the predicate to
> return a bool value instead of an int.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes v3->v4:
> - fixed the behavior of domctl ID allocator to match the original behavior
>    in case of exhaustive search
> - use domid_t input argument in domid_alloc()
> - use DOMID_INVALID as an indicator of performing an exhaustive search
> - use DOMID_INVALID as an indicator of allocator failure
> - use %pd formatting for domain ID printouts in the modified code
> - some comments fixups
> - Link to v2: https://lore.kernel.org/xen-devel/20250416061509.934220-1-dmukhin@ford.com/
> - CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1780576277
> ---
>   xen/arch/arm/dom0less-build.c | 17 ++++++------
>   xen/arch/arm/domain_build.c   | 17 ++++++++----
>   xen/arch/x86/setup.c          | 11 +++++---
>   xen/common/domain.c           | 51 +++++++++++++++++++++++++++++++++++
>   xen/common/domctl.c           | 41 +++-------------------------
>   xen/include/xen/domain.h      |  2 ++
>   6 files changed, 84 insertions(+), 55 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index a356fc94fc..61e01b7306 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -1038,15 +1038,13 @@ void __init create_domUs(void)
>           };
>           unsigned int flags = 0U;
>           bool has_dtb = false;
> +        domid_t domid;
>           uint32_t val;
>           int rc;
>   
>           if ( !dt_device_is_compatible(node, "xen,domain") )
>               continue;
>   
> -        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
> -            panic("No more domain IDs available\n");
> -
>           if ( dt_property_read_u32(node, "capabilities", &val) )
>           {
>               if ( val & ~DOMAIN_CAPS_MASK )
> @@ -1218,12 +1216,13 @@ void __init create_domUs(void)
>           if ( !llc_coloring_enabled && llc_colors_str )
>               panic("'llc-colors' found, but LLC coloring is disabled\n");
>   
> -        /*
> -         * The variable max_init_domid is initialized with zero, so here it's
> -         * very important to use the pre-increment operator to call
> -         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
> -         */
> -        d = domain_create(++max_init_domid, &d_cfg, flags);
> +        domid = domid_alloc(DOMID_INVALID);
> +        if ( domid == DOMID_INVALID )
> +            panic("Error allocating ID for domain %s\n", dt_node_name(node));
> +        if ( max_init_domid < domid )
> +            max_init_domid = domid;

While I think it is a good idea to have a single way to allocate domain 
IDs, I am a bit concerned of the change for dom0less domUs. By 
introducing domid_alloc(), it will now be easier to change the behavior 
of the domain ID allocation without realizing the impact for dom0less 
domUs (max_init_domid is mainly used to limit the loop when switching 
consoles).

I think we need to document explicitely in domid_alloc() that some 
callers specifically rely on the existing allocation scheme. So we need 
to be careful when changing it.

> +
> +        d = domain_create(domid, &d_cfg, flags);
>           if ( IS_ERR(d) )
>               panic("Error creating domain %s (rc = %ld)\n",
>                     dt_node_name(node), PTR_ERR(d));
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 270a6b97e4..fe968dd66b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2371,6 +2371,7 @@ void __init create_dom0(void)
>           .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>       };
>       unsigned int flags = CDF_privileged | CDF_hardware;
> +    domid_t domid;
>       int rc;
>   
>       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2395,19 +2396,25 @@ void __init create_dom0(void)
>       if ( !llc_coloring_enabled )
>           flags |= CDF_directmap;
>   
> -    dom0 = domain_create(0, &dom0_cfg, flags);
> +    domid = domid_alloc(get_initial_domain_id());

This is technically a change of behavior for Arm if the hardware_domid 
is not 0. I think we need to using 0 here. If you want to change the 
behavior, then this should be a separate patch with a proper explanation.

> +    if ( domid ==  DOMID_INVALID )
> +        panic("Error allocating domain ID %d\n", get_initial_domain_id());
> +
> +    dom0 = domain_create(domid, &dom0_cfg, flags);
>       if ( IS_ERR(dom0) )
> -        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
> +        panic("Error creating domain %d (rc = %ld)\n", domid, PTR_ERR(dom0));
>   
>       if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
> -        panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
> +        panic("Error initializing LLC coloring for domain %pd (rc = %d)\n",
> +              dom0, rc);
>   
>       if ( alloc_dom0_vcpu0(dom0) == NULL )
> -        panic("Error creating domain 0 vcpu0\n");
> +        panic("Error creating domain %pdv0\n", dom0);
>   
>       rc = construct_dom0(dom0);
>       if ( rc )
> -        panic("Could not set up DOM0 guest OS (rc = %d)\n", rc);
> +        panic("Could not set up guest OS for domain %pd (rc = %d)\n",
> +              dom0, rc);
>   
>       set_xs_domain(dom0);
>   }
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 24b36c1a59..e61c023085 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1009,8 +1009,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>       if ( iommu_enabled )
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> +    /* Allocate initial domain ID. Not d0 for pvshim. */
> +    bd->domid = domid_alloc(get_initial_domain_id());
> +    if ( bd->domid == DOMID_INVALID )
> +        panic("Error allocating domain ID %d\n", get_initial_domain_id());
> +
>       d = domain_create(bd->domid, &dom0_cfg,
>                         pv_shim ? 0 : CDF_privileged | CDF_hardware);
>       if ( IS_ERR(d) )
> @@ -1038,7 +1041,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>   
>           if ( (strlen(acpi_param) == 0) && acpi_disabled )
>           {
> -            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
> +            printk("ACPI is disabled, notifying domain %pd (acpi=off)\n", d);
>               safe_strcpy(acpi_param, "off");
>           }
>   
> @@ -1053,7 +1056,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>   
>       bd->d = d;
>       if ( construct_dom0(bd) != 0 )
> -        panic("Could not construct domain 0\n");
> +        panic("Could not construct domain %pd\n", d);
>   
>       return d;
>   }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index abf1969e60..7c0f7a4990 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -66,6 +66,57 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>   static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>   struct domain *domain_list;
>   
> +/* Domain ID allocator */
> +static unsigned int domid_last;
> +
> +static inline bool is_free_domid(domid_t dom)
> +{
> +    struct domain *d = rcu_lock_domain_by_id(dom);
> +
> +    if ( d )
> +        rcu_unlock_domain(d);
> +
> +    return !d;
> +}
> +
> +/*
> + * Allocate new domain ID based on the hint.

Maybe clarify this should not be used for system domains?

> + *
> + * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of IDs,
> + * perform an exhaustive search starting from the end of the used domain ID
> + * range, excluding hardware_domid.
> + */
> +domid_t domid_alloc(domid_t hint)

 From the name, my naive expectation is a second call to domid_alloc() 
(whether concurrent or not) would return a different domid. However, 
AFAICT, this is not the case.

I am in two mind whether this is the right interface to have. I think 
the minimum would be to clarify the expectation from the callers.

> +{
> +    domid_t domid = DOMID_INVALID;
> +
> +    if ( hint < DOMID_FIRST_RESERVED )
> +    {
> +        /* Exact match. */
> +        if ( is_free_domid(hint) )
> +            domid = hint;
> +    }
> +    else
> +    {
> +        for ( domid = domid_last + 1; domid != domid_last; domid++ )
> +        {
> +            if ( domid == DOMID_FIRST_RESERVED )
> +                domid = 0;
> +
> +            if ( domid == hardware_domid )
> +                continue;
> +
> +            if ( is_free_domid(domid) )
> +                break;
> +        }
> +
> +        if ( domid != domid_last )
> +            domid_last = domid;
> +    }
> +
> +    return domid;
> +}
> +
>   /*
>    * Insert a domain into the domlist/hash.  This allows the domain to be looked
>    * up by domid, and therefore to be the subject of hypercalls/etc.
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index bfe2e1f9f0..2e02139660 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -49,20 +49,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodemask,
>                                      MAX_NUMNODES);
>   }
>   
> -static inline int is_free_domid(domid_t dom)
> -{
> -    struct domain *d;
> -
> -    if ( dom >= DOMID_FIRST_RESERVED )
> -        return 0;
> -
> -    if ( (d = rcu_lock_domain_by_id(dom)) == NULL )
> -        return 1;
> -
> -    rcu_unlock_domain(d);
> -    return 0;
> -}
> -
>   void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>   {
>       struct vcpu *v;
> @@ -421,34 +407,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>   
>       case XEN_DOMCTL_createdomain:
>       {
> -        domid_t        dom;
> -        static domid_t rover = 0;
> +        domid_t domid = domid_alloc(op->domain);
>   
> -        dom = op->domain;
> -        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
> +        if ( domid == DOMID_INVALID )
>           {
>               ret = -EEXIST;
> -            if ( !is_free_domid(dom) )
> -                break;
> -        }
> -        else
> -        {
> -            for ( dom = rover + 1; dom != rover; dom++ )
> -            {
> -                if ( dom == DOMID_FIRST_RESERVED )
> -                    dom = 1;
> -                if ( is_free_domid(dom) )
> -                    break;
> -            }
> -
> -            ret = -ENOMEM;
> -            if ( dom == rover )
> -                break;
> -
> -            rover = dom;
> +            break;
>           }
>   
> -        d = domain_create(dom, &op->u.createdomain, false);
> +        d = domain_create(domid, &op->u.createdomain, false);
>           if ( IS_ERR(d) )
>           {
>               ret = PTR_ERR(d);
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index e10baf2615..43e9411fc0 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -38,6 +38,8 @@ void arch_get_domain_info(const struct domain *d,
>   
>   domid_t get_initial_domain_id(void);
>   
> +domid_t domid_alloc(domid_t hint);
> +
>   /* CDF_* constant. Internal flags for domain creation. */
>   /* Is this a privileged domain? */
>   #define CDF_privileged           (1U << 0)

Cheers,

-- 
Julien Grall


