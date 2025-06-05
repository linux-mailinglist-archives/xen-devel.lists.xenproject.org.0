Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939ECACF955
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 23:59:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007630.1386900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNIbt-0006C8-8m; Thu, 05 Jun 2025 21:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007630.1386900; Thu, 05 Jun 2025 21:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNIbt-0006Ah-62; Thu, 05 Jun 2025 21:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1007630;
 Thu, 05 Jun 2025 21:58:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uNIbr-0006Ab-QP
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 21:58:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNIbr-003lko-0D;
 Thu, 05 Jun 2025 21:58:51 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNIbr-007llA-0S;
 Thu, 05 Jun 2025 21:58:50 +0000
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
	bh=LXPlgXRyBH0nJQdK+aeWw/DSc//K16J41kysLCmOTo0=; b=u5pMc4KqnBzHbZRvYo4lWDw3gS
	2jyfDJyYgdjmZkWMuzcWV06GYdYYfEjXDkOEkTOCnbIyyYFZfNTncqlONJXYBQyc48qmRrJEUv4oR
	AEHNtDdMtoDtwTkHEHz30wC5nztKRIDzqurUMsjjVtgykniy9+FYC6NR+ct7mUiZ6C/M=;
Message-ID: <d0829041-1375-4161-b2c4-f8dffadbb657@xen.org>
Date: Thu, 5 Jun 2025 22:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] xen/domain: unify domain ID allocation
Content-Language: en-GB
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech,
 dmukhin@ford.com
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-2-dmukhin@ford.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250528225030.2652166-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

On 28/05/2025 23:50, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmkhn@proton.me>
> 
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Currently, hypervisor code has two different domain ID allocation
> implementations:
> 
>    (a) Sequential IDs allocation in dom0less Arm code based on max_init_domid;
> 
>    (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
>        max_init_domid (both Arm and x86).
> 
> The domain ID allocation covers dom0 or late hwdom, predefined domains,
> post-boot domains, excluding Xen system domains (domid >=
> DOMID_FIRST_RESERVED).
> 
> It makes sense to have a common helper code for such task across architectures
> (Arm and x86) and between dom0less / toolstack domU allocation.
> 
> Wrap the domain ID allocation as an arch-independent function domid_alloc() in
> common/domain.c based on the bitmap.
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and use it if
>    ID is not used;
> - If DOMID_INVALID is provided, search the range [0..DOMID_FIRST_RESERVED-1],
>    starting from the last used ID and wrapping around as needed. It guarantees
>    that two consecutive calls will never return the same ID. ID#0 is excluded
>    to account for late hwdom case.
> 
> Also, remove is_free_domid() helper as it is not needed now.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v8:
> - skip ID #0 in domid_alloc() to account for late hwdom
> ---
>   xen/arch/arm/domain_build.c             | 17 +++++---
>   xen/arch/x86/setup.c                    | 11 +++--
>   xen/common/device-tree/dom0less-build.c | 10 +++--
>   xen/common/domain.c                     | 54 +++++++++++++++++++++++++
>   xen/common/domctl.c                     | 42 +++----------------
>   xen/include/xen/domain.h                |  3 ++
>   6 files changed, 87 insertions(+), 50 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b189a7cfae..e9d563c269 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2010,6 +2010,7 @@ void __init create_dom0(void)
>           .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>       };
>       unsigned int flags = CDF_privileged | CDF_hardware;
> +    domid_t domid;
>       int rc;
>   
>       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2034,19 +2035,25 @@ void __init create_dom0(void)
>       if ( !llc_coloring_enabled )
>           flags |= CDF_directmap;
>   
> -    dom0 = domain_create(0, &dom0_cfg, flags);
> +    domid = domid_alloc(0);
> +    if ( domid == DOMID_INVALID )
> +        panic("Error allocating domain ID 0\n");
> +
> +    dom0 = domain_create(domid, &dom0_cfg, flags);
>       if ( IS_ERR(dom0) )
> -        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
> +        panic("Error creating domain %d (rc = %ld)\n", domid, PTR_ERR(dom0));

The change in the panic here and below seems unrelated to the goal of 
the patch. I am ok to keep them here, but I think it should be mentioned 
in the commit message.

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
> index 1f5cb67bd0..b36ce4491b 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1031,8 +1031,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>       if ( iommu_enabled )
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> +    /* Allocate initial domain ID. Not d0 for pvshim. */

NIT: The two spaces were valid here. This is in fact quite common to 
unambiguously mark the end of a sentence.

> +    bd->domid = domid_alloc(get_initial_domain_id());
> +    if ( bd->domid == DOMID_INVALID )
> +        panic("Error allocating domain ID %d\n", get_initial_domain_id());
> +
>       d = domain_create(bd->domid, &dom0_cfg,
>                         pv_shim ? 0 : CDF_privileged | CDF_hardware);
>       if ( IS_ERR(d) )
> @@ -1064,7 +1067,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>   
>           if ( (strlen(acpi_param) == 0) && acpi_disabled )
>           {
> -            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
> +            printk("ACPI is disabled, notifying domain %pd (acpi=off)\n", d);
>               safe_strcpy(acpi_param, "off");
>           }
>   
> @@ -1079,7 +1082,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>   
>       bd->d = d;
>       if ( construct_dom0(bd) != 0 )
> -        panic("Could not construct domain 0\n");
> +        panic("Could not construct domain %pd\n", d);
>   
>       bd->cmdline = NULL;
>       xfree(cmdline);
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 39cb2cd5c7..a509f8fecd 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -850,15 +850,13 @@ void __init create_domUs(void)
>           struct xen_domctl_createdomain d_cfg = {0};
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

I can't find a similar check in domid_alloc(). But if the value is 
unlikely above DOMID_FIRST_RESERVED, then we would end up to allocate a 
random domid.

> -            panic("No more domain IDs available\n");
> -
 >           d_cfg.max_evtchn_port = 1023;> 
d_cfg.max_grant_frames = -1;
>           d_cfg.max_maptrack_frames = -1;
> @@ -981,7 +979,11 @@ void __init create_domUs(void)
>            * very important to use the pre-increment operator to call
>            * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
>            */
> -        d = domain_create(++max_init_domid, &d_cfg, flags);
> +        domid = domid_alloc(++max_init_domid);

In the commit message you wrote:


"""
     (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
         max_init_domid (both Arm and x86).
"""

I read it as max_init_domid should have been moved to common code. I see 
this is done in the next patch. So I would suggest to clarify this will 
be handled separately.


> +        if ( domid == DOMID_INVALID )
> +            panic("Error allocating ID for domain %s\n", dt_node_name(node));
> +
> +        d = domain_create(domid, &d_cfg, flags);
>           if ( IS_ERR(d) )
>               panic("Error creating domain %s (rc = %ld)\n",
>                     dt_node_name(node), PTR_ERR(d));
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index abf1969e60..ae0c44fcbb 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -66,6 +66,10 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>   static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>   struct domain *domain_list;
>   
> +/* Non-system domain ID allocator. */
> +static DEFINE_SPINLOCK(domid_lock);
> +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> +
>   /*
>    * Insert a domain into the domlist/hash.  This allows the domain to be looked
>    * up by domid, and therefore to be the subject of hypercalls/etc.
> @@ -1449,6 +1453,8 @@ void domain_destroy(struct domain *d)
>   
>       TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
>   
> +    domid_free(d->domain_id);
> +
>       /* Remove from the domlist/hash. */
>       domlist_remove(d);
>   
> @@ -2405,6 +2411,54 @@ domid_t get_initial_domain_id(void)
>       return hardware_domid;
>   }
>   
> +domid_t domid_alloc(domid_t domid)
> +{
> +    spin_lock(&domid_lock);
> +
> +    if ( domid < DOMID_FIRST_RESERVED )
> +    {
> +        if ( __test_and_set_bit(domid, domid_bitmap) )
> +            domid = DOMID_INVALID;
> +    }
> +    else
> +    {
> +        static domid_t domid_last;
> +        /* NB: account for late hwdom case, skip ID#0 */

I am somewhat confused with this comment. For the late hwdom case, I 
thought we were using a non-zero ID. Dom0 should also always be the 
first dom0 to be reserved. Can you clarify?

That said, if you want to skip to dom0. Wouldn't it be better to have
domid_last set to 1 and then ...

 > +        const domid_t reserved_domid = 0;> +        const bool 
reserved = __test_and_set_bit(reserved_domid, domid_bitmap);
> +
> +        domid = find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED,
> +                                   domid_last);
> +
> +        if ( domid == DOMID_FIRST_RESERVED )
> +            domid = find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED, 0);

... use 1 here? This would avoid to temporarily mark the domid 0 as 
reserved.

Cheers,

-- 
Julien Grall


