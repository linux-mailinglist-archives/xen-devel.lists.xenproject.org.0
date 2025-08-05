Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BCB1B517
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 15:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070488.1434092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujHsM-00007i-WA; Tue, 05 Aug 2025 13:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070488.1434092; Tue, 05 Aug 2025 13:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujHsM-00004q-So; Tue, 05 Aug 2025 13:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1070488;
 Tue, 05 Aug 2025 13:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujHsL-0008WQ-4T
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 13:38:45 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e70e7e5-7201-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 15:38:39 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so3080327f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 06:38:39 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3b9eddsm19252765f8f.22.2025.08.05.06.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 06:38:37 -0700 (PDT)
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
X-Inumbo-ID: 7e70e7e5-7201-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754401118; x=1755005918; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ICPZPpXze7J7LRr91S6QodYf4qNrYblEf+QBJDXMUo=;
        b=hdRsLhvVixPtaXS191GtLoGkV+NqQQ5AUCtIhHOwAaTb9XZX63wWkk98ciliVevEuW
         Mj0Sf2mrnlT2LsSRglFbG0p2oGXoDIUzK5RctVGGcyaKamHgNRPwWpKbcapOKq6DQ66d
         YIJcZAWtvbOhh6Yjz6ZV/TondEqNgxWTsePMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754401118; x=1755005918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ICPZPpXze7J7LRr91S6QodYf4qNrYblEf+QBJDXMUo=;
        b=uXEpPoswRe+l267n0u4kqJCr2ImQ6tfGWii2AOSYFdnn4JfC8z5T8ArAm676/T/sJ4
         LbnVKGjBdCfrT82W8Lddykty2soU8ANPs8SdbMfEoJSMbpb2940FydhTs+4hhr3frIDu
         8bVQmRQO2K5zFOThSRjmzZYwrj8DRfGzpSWtd82A5KqBIAGoyaX4XBkEY3SlywPK7vns
         /AFTcndIOWh5+VyCPky4Rh3S6loURU+2briqLXTuMVAIS9qpJasfjHLBnnFMgFGUa5Xv
         SbsHfEXThO0Q5dMBwpE7nyz/WesLsU0mWQN9Z5Y14w+VSpz4N4phFgvc2mQdEfwBKr6M
         zlag==
X-Gm-Message-State: AOJu0YzYu6OSNFznht1xMQMCgStlsA/nztjF+6AEEdMDQi2la8f6j682
	oh9fdUzVR1FApDHN2GvzJLJ0FrtA4nsTQ//W8Nh3QqVbfqC8pdzFtUNv+Vd2GynGm6o=
X-Gm-Gg: ASbGncv/NlZztU6unqv5vXD6+ffdynrYpQd8rjO0YJ7H3LkdXpVameu0wKUZzM/qrNd
	XBvTAaD5b+iMr5g6UOoLa7ulxb/f+zSoKuh45EVk8WaxHbY3cPyCcow7Za+RVbOHJySthg1DUZV
	dGj5TpImFB4iwzGE8cslaLzKI5gUMOmpmiXguyGejfbyIniF7ZN0b5t/wy+xKBki+hfNpq6ppCx
	t+jPAHv7YNndLfF/ffD5hq2n7Gp01RB5AXVsC8ECgn8pVXqvt097QSnGhM/qKwWbsMBHk41Ns9m
	7K/JkdABangnNT0e549ueBU3X6UYkpdV4e1Z0I0zIkSIIpgHdqpjSCe7+3oSsgxtEcsJPY9ekev
	zbrKPwqmf4EDAjcqWtxM6F6go6C6PPKSIFAGF/eHsQLkH9CwfqVPqLY3dcUbb6VCiUohyEkVmoX
	Ts
X-Google-Smtp-Source: AGHT+IFDEV4GGxybwIMaWwcQebpxjNel+VuoJ9aMQQ4jDghvQGo1aF4/C/MSeSv6FuOupAgAzSFzxQ==
X-Received: by 2002:a05:6000:18af:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3b8d94684e8mr9949850f8f.6.1754401118403;
        Tue, 05 Aug 2025 06:38:38 -0700 (PDT)
Date: Tue, 5 Aug 2025 15:38:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, alejandro.garciavallejo@amd.com,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
	sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v13 1/3] xen/domain: unify domain ID allocation
Message-ID: <aJIJXX4yO0zC8898@macbook.local>
References: <20250730174042.1632011-1-dmukhin@ford.com>
 <20250730174042.1632011-2-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250730174042.1632011-2-dmukhin@ford.com>

On Wed, Jul 30, 2025 at 05:40:54PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Currently, there are two different domain ID allocation implementations:
> 
>   1) Sequential IDs allocation in dom0less Arm code based on max_init_domid;
> 
>   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
>      max_init_domid (both Arm and x86).
> 
> The domain ID allocation covers dom0 or late hwdom, predefined domains,
> post-boot domains, excluding Xen system domains (domid >=
> DOMID_FIRST_RESERVED).
> 
> It makes sense to have a common helper code for such task across architectures
> (Arm and x86) and between dom0less / toolstack domU allocation.
> 
> Note, fixing dependency on max_init_domid is out of scope of this patch.
> 
> Wrap the domain ID allocation as an arch-independent function domid_alloc() in
> new common/domid.c based on the bitmap.
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and use it if
>   ID is not used;
> - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERVED-1],
>   starting from the last used ID.
>   Implementation guarantees that two consecutive calls will never return the
>   same ID. ID#0 is reserved for the first boot domain (currently, dom0) and
>   excluded from the allocation range.
> 
> Remove is_free_domid() helper as it is not needed now.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> Changes since v12:
> - updated comment for domid_alloc() and commit message
> - added Alejandro's R-b
> ---
>  xen/arch/arm/domain_build.c             |  7 +-
>  xen/arch/x86/setup.c                    |  7 +-
>  xen/common/Makefile                     |  1 +
>  xen/common/device-tree/dom0less-build.c | 15 ++--
>  xen/common/domain.c                     |  2 +
>  xen/common/domctl.c                     | 42 ++---------
>  xen/common/domid.c                      | 94 +++++++++++++++++++++++++
>  xen/include/xen/domain.h                |  3 +
>  8 files changed, 124 insertions(+), 47 deletions(-)
>  create mode 100644 xen/common/domid.c
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 463ae4474d30..789f2b9d3ce7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2050,6 +2050,7 @@ void __init create_dom0(void)
>          .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>      };
>      unsigned int flags = CDF_privileged | CDF_hardware;
> +    domid_t domid;
>      int rc;
>  
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2074,7 +2075,11 @@ void __init create_dom0(void)
>      if ( !llc_coloring_enabled )
>          flags |= CDF_directmap;
>  
> -    dom0 = domain_create(0, &dom0_cfg, flags);
> +    domid = domid_alloc(0);
> +    if ( domid == DOMID_INVALID )
> +        panic("Error allocating domain ID 0\n");
> +
> +    dom0 = domain_create(domid, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
>          panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>  
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 1543dd251cc6..2ff7c28c277b 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1047,8 +1047,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> +    /* Allocate initial domain ID.  Not d0 for pvshim. */
> +    bd->domid = domid_alloc(get_initial_domain_id());
> +    if ( bd->domid == DOMID_INVALID )
> +        panic("Error allocating domain ID %d\n", get_initial_domain_id());

Nit: in other error messages in the same function we handle the domid
as an unsigned integer, so %u probably wants using here.  Unless you
have an explicit intention to print IDs >= DOMID_FIRST_RESERVED as
negative integers?

> +
>      d = domain_create(bd->domid, &dom0_cfg,
>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>      if ( IS_ERR(d) )
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index c316957fcb36..0c7d0f5d46e1 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>  obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
> +obj-y += domid.o
>  obj-y += event_2l.o
>  obj-y += event_channel.o
>  obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 6bb038111de9..f4b6b515d2d2 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -833,6 +833,7 @@ void __init create_domUs(void)
>      {
>          struct kernel_info ki = KERNEL_INFO_INIT;
>          int rc = parse_dom0less_node(node, &ki.bd);
> +        domid_t domid;
>  
>          if ( rc == -ENOENT )
>              continue;
> @@ -842,13 +843,13 @@ void __init create_domUs(void)
>          if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>              panic("No more domain IDs available\n");
>  
> -        /*
> -         * The variable max_init_domid is initialized with zero, so here it's
> -         * very important to use the pre-increment operator to call
> -         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
> -         */
> -        ki.bd.d = domain_create(++max_init_domid,
> -                                &ki.bd.create_cfg, ki.bd.create_flags);
> +        domid = domid_alloc(DOMID_INVALID);
> +        if ( domid == DOMID_INVALID )
> +            panic("Error allocating ID for domain %s\n", dt_node_name(node));
> +
> +        max_init_domid = max(max_init_domid, domid);
> +
> +        ki.bd.d = domain_create(domid, &ki.bd.create_cfg, ki.bd.create_flags);
>          if ( IS_ERR(ki.bd.d) )
>              panic("Error creating domain %s (rc = %ld)\n",
>                    dt_node_name(node), PTR_ERR(ki.bd.d));
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 5241a1629eeb..12fbab01cd8e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1473,6 +1473,8 @@ void domain_destroy(struct domain *d)
>      /* Remove from the domlist/hash. */
>      domlist_remove(d);
>  
> +    domid_free(d->domain_id);

The domlist removal above still allows current users to continue
"operating" on the domain until the next RCU.  Should for safety the
freeing of the domid be deferred to _domain_destroy(), which is
executed in RCU context, and thus ensures there are no current users
of the removed domain?

I cannot think of a specific scenario where this could be dangerous
right now, but deferring to RCU context together with the final
cleanup seems safer overall.

> +
>      /* Schedule RCU asynchronous completion of domain destroy. */
>      call_rcu(&d->rcu, complete_domain_destroy);
>  }
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index f2a7caaf853c..5509998aa139 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -51,20 +51,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodemask,
>                                     MAX_NUMNODES);
>  }
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
>  void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>  {
>      struct vcpu *v;
> @@ -423,36 +409,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>  
>      case XEN_DOMCTL_createdomain:
>      {
> -        domid_t        dom;
> -        static domid_t rover = 0;
> +        domid_t domid = domid_alloc(op->domain);
>  
> -        dom = op->domain;
> -        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
> +        if ( domid == DOMID_INVALID )

This is a change in behavior AFAICT, as you now allow
XEN_DOMCTL_createdomain to possibly create a domain with domid 0 (if
it's available).  Currently op->domain == 0 is handled as op->domain
== DOMID_FIRST_RESERVED. You either need to adjust the code here, so
that you do:

domid_t domid = domid_alloc(op->domain ?: DOMID_FIRST_RESERVED);

Or domid_alloc() needs to be adjusted to handle an input domid == 0 as
it handles DOMID_FIRST_RESERVED.

>          {
>              ret = -EEXIST;
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
>          }
>  
> -        d = domain_create(dom, &op->u.createdomain, false);
> +        d = domain_create(domid, &op->u.createdomain, false);
>          if ( IS_ERR(d) )
>          {
> +            domid_free(domid);
>              ret = PTR_ERR(d);
>              d = NULL;
>              break;
> diff --git a/xen/common/domid.c b/xen/common/domid.c
> new file mode 100644
> index 000000000000..e727dcaf0793
> --- /dev/null
> +++ b/xen/common/domid.c
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Domain ID allocator.
> + *
> + * Covers dom0 or late hwdom, predefined domains, post-boot domains.
> + * Excludes Xen system domains (ID >= DOMID_FIRST_RESERVED).
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#include <xen/domain.h>
> +
> +static DEFINE_SPINLOCK(domid_lock);
> +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> +
> +/*
> + * Allocate domain ID.
> + *
> + * @param domid Domain ID hint:
> + * - If an explicit domain ID is provided, verify its availability and use it
> + *   if ID is not used;
> + * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
> + *   starting from the last used ID. Implementation guarantees that two
> + *   consecutive calls will never return the same ID. ID#0 is reserved for
> + *   the first boot domain (currently, dom0) and excluded from the allocation
> + *   range.
> + * @return Valid domain ID in case of successful allocation,
> + *         DOMID_INVALID - otherwise.
> + */
> +domid_t domid_alloc(domid_t domid)
> +{
> +    static domid_t domid_last;
> +
> +    spin_lock(&domid_lock);
> +
> +    /* Exact match. */
> +    if ( domid < DOMID_FIRST_RESERVED )
> +    {
> +        if ( __test_and_set_bit(domid, domid_bitmap) )
> +            domid = DOMID_INVALID;
> +    }
> +    /*
> +     * Exhaustive search.
> +     *
> +     * Domain ID#0 is reserved for the first boot domain (e.g. control domain)
> +     * and excluded from allocation.
> +     */
> +    else
> +    {
> +        domid = find_next_zero_bit(domid_bitmap,
> +                                   DOMID_FIRST_RESERVED,
> +                                   domid_last + 1);
> +        if ( domid == DOMID_FIRST_RESERVED )

Nit: you could further gate this second search to domid_last != 0, as
otherwise the first search has already scanned the whole bitmap.

> +            domid = find_next_zero_bit(domid_bitmap,
> +                                       DOMID_FIRST_RESERVED,
> +                                       1);

Nit: you could possibly limit this second search to (domid_last + 1)
size, as you have already searched from [domid_last + 1,
DOMID_FIRST_RESERVED], and the bitmap couldn't have changed as the
lock is being held.

Thanks, Roger.

