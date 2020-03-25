Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C908A192D5B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 16:50:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8FP-0006Oq-Aj; Wed, 25 Mar 2020 15:47:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH8FN-0006OY-QU
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 15:47:13 +0000
X-Inumbo-ID: e3f8b900-6eaf-11ea-92cf-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3f8b900-6eaf-11ea-92cf-bc764e2007e4;
 Wed, 25 Mar 2020 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585151232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dbTOtT8x2SNiVtOKmCcNhDRhk0OYZTiy2I7AjHtuccI=;
 b=RmDHGVh+2cHj64u++w5QyPm5K23m0yJicyyA5JjGV8UhA1mV/fmacUgO
 7PrOsir1ZjkDekNsUHLmweWqJtcIgPtzJYKsPUxcI2afPj0VshN/kyZuY
 lasdl7wRNyYslpRbvIQqCkS9O6sf5eRDK9hR2IA65aBi/LvNUhbhmrM4D 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kZrplel5J875bLuTyDuYOJJl4zbXErwsm/hiaZVIkGN0A6YdRGHqdVaZgPiSrg5ZX0Ri0JjdLL
 umVZAXN1X4IkTxxEKdx6BeEazjixL2Y5cVpuEXuLfvOcTbvAq3n0rLyIoTRIg79Q58iU4b/nOY
 1At5dHVgz02ssHnnCZWCw0thBL24J7A3HHzBMDSJVd12zFSnRTEGyuM4d+8m0ymZZlC5wqTNWY
 mkmxJemyMC2ffmlcA7bvqxPYGvtmhLlx+uFhAID+UTfefARNRuritHeRWuot/9mw5GoF/QmWNy
 TeI=
X-SBRS: 2.7
X-MesageID: 14625989
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14625989"
Date: Wed, 25 Mar 2020 16:47:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Message-ID: <20200325154702.GD28601@Air-de-Roger>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Sorry it has taken me a while to get to this.

On Mon, Mar 23, 2020 at 10:04:35AM -0700, Tamas K Lengyel wrote:
> VM forking is the process of creating a domain with an empty memory space and a
> parent domain specified from which to populate the memory when necessary. For
> the new domain to be functional the VM state is copied over as part of the fork
> operation (HVM params, hap allocation, etc).
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
> v12: Minor style adjustments Jan pointed out
>      Convert mem_sharing_is_fork to inline function
> v11: Fully copy vcpu_info pages
>      Setup vcpu_runstate for forks
>      Added TODO note for PV timers
>      Copy shared_info page
>      Add copy_settings function, to be shared with fork_reset in the next patch
> ---
>  xen/arch/x86/domain.c             |  11 +
>  xen/arch/x86/hvm/hvm.c            |   4 +-
>  xen/arch/x86/mm/hap/hap.c         |   3 +-
>  xen/arch/x86/mm/mem_sharing.c     | 368 ++++++++++++++++++++++++++++++
>  xen/arch/x86/mm/p2m.c             |   9 +-
>  xen/common/domain.c               |   3 +
>  xen/include/asm-x86/hap.h         |   1 +
>  xen/include/asm-x86/hvm/hvm.h     |   2 +
>  xen/include/asm-x86/mem_sharing.h |  18 ++
>  xen/include/public/memory.h       |   5 +
>  xen/include/xen/sched.h           |   5 +
>  11 files changed, 424 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index caf2ecad7e..11d3c2216e 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2202,6 +2202,17 @@ int domain_relinquish_resources(struct domain *d)
>              ret = relinquish_shared_pages(d);
>              if ( ret )
>                  return ret;
> +
> +            /*
> +             * If the domain is forked, decrement the parent's pause count
> +             * and release the domain.
> +             */
> +            if ( mem_sharing_is_fork(d) )
> +            {
> +                domain_unpause(d->parent);
> +                put_domain(d->parent);
> +                d->parent = NULL;
> +            }
>          }
>  #endif
>  
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index a3d115b650..304b3d1562 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1917,7 +1917,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>      }
>  #endif
>  
> -    /* Spurious fault? PoD and log-dirty also take this path. */
> +    /* Spurious fault? PoD, log-dirty and VM forking also take this path. */
>      if ( p2m_is_ram(p2mt) )
>      {
>          rc = 1;
> @@ -4377,7 +4377,7 @@ static int hvm_allow_get_param(struct domain *d,
>      return rc;
>  }
>  
> -static int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
> +int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
>  {
>      int rc;
>  
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index a6d5e39b02..814d0c3253 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -321,8 +321,7 @@ static void hap_free_p2m_page(struct domain *d, struct page_info *pg)
>  }
>  
>  /* Return the size of the pool, rounded up to the nearest MB */
> -static unsigned int
> -hap_get_allocation(struct domain *d)
> +unsigned int hap_get_allocation(struct domain *d)
>  {
>      unsigned int pg = d->arch.paging.hap.total_pages
>          + d->arch.paging.hap.p2m_pages;
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 3835bc928f..23deeddff2 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -22,6 +22,7 @@
>  
>  #include <xen/types.h>
>  #include <xen/domain_page.h>
> +#include <xen/event.h>
>  #include <xen/spinlock.h>
>  #include <xen/rwlock.h>
>  #include <xen/mm.h>
> @@ -36,6 +37,8 @@
>  #include <asm/altp2m.h>
>  #include <asm/atomic.h>
>  #include <asm/event.h>
> +#include <asm/hap.h>
> +#include <asm/hvm/hvm.h>
>  #include <xsm/xsm.h>
>  
>  #include "mm-locks.h"
> @@ -1444,6 +1447,334 @@ static inline int mem_sharing_control(struct domain *d, bool enable)
>      return 0;
>  }
>  
> +/*
> + * Forking a page only gets called when the VM faults due to no entry being
> + * in the EPT for the access. Depending on the type of access we either
> + * populate the physmap with a shared entry for read-only access or
> + * fork the page if its a write access.
> + *
> + * The client p2m is already locked so we only need to lock
> + * the parent's here.
> + */
> +int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
> +{
> +    int rc = -ENOENT;
> +    shr_handle_t handle;
> +    struct domain *parent = d->parent;
> +    struct p2m_domain *p2m;
> +    unsigned long gfn_l = gfn_x(gfn);
> +    mfn_t mfn, new_mfn;
> +    p2m_type_t p2mt;
> +    struct page_info *page;
> +
> +    if ( !mem_sharing_is_fork(d) )
> +        return -ENOENT;
> +
> +    if ( !unsharing )
> +    {
> +        /* For read-only accesses we just add a shared entry to the physmap */
> +        while ( parent )
> +        {
> +            if ( !(rc = nominate_page(parent, gfn, 0, &handle)) )
> +                break;
> +
> +            parent = parent->parent;
> +        }
> +
> +        if ( !rc )
> +        {
> +            /* The client's p2m is already locked */
> +            struct p2m_domain *pp2m = p2m_get_hostp2m(parent);

Nit: I think you could just use the existing p2m local variable.

> +            p2m_lock(pp2m);
> +            rc = add_to_physmap(parent, gfn_l, handle, d, gfn_l, false);
> +            p2m_unlock(pp2m);
> +
> +            if ( !rc )
> +                return 0;
> +        }
> +    }
> +
> +    /*
> +     * If it's a write access (ie. unsharing) or if adding a shared entry to
> +     * the physmap failed we'll fork the page directly.
> +     */
> +    p2m = p2m_get_hostp2m(d);
> +    parent = d->parent;
> +
> +    while ( parent )
> +    {
> +        mfn = get_gfn_query(parent, gfn_l, &p2mt);
> +
> +        /*
> +         * We can't fork grant memory from the parent, only regular ram.
> +         */

Nit: single line comments should use /* ... */ (here and below).

> +        if ( mfn_valid(mfn) && p2m_is_ram(p2mt) )
> +            break;
> +
> +        put_gfn(parent, gfn_l);
> +        parent = parent->parent;
> +    }
> +
> +    if ( !parent )
> +        return -ENOENT;
> +
> +    if ( !(page = alloc_domheap_page(d, 0)) )
> +    {
> +        put_gfn(parent, gfn_l);
> +        return -ENOMEM;
> +    }
> +
> +    new_mfn = page_to_mfn(page);
> +    copy_domain_page(new_mfn, mfn);
> +    set_gpfn_from_mfn(mfn_x(new_mfn), gfn_l);
> +
> +    put_gfn(parent, gfn_l);
> +
> +    return p2m->set_entry(p2m, gfn, new_mfn, PAGE_ORDER_4K, p2m_ram_rw,
> +                          p2m->default_access, -1);
> +}
> +
> +static int bring_up_vcpus(struct domain *cd, struct domain *d)
> +{
> +    unsigned int i;
> +    int ret = -EINVAL;

Nit: you can get rid of ret...

> +
> +    if ( d->max_vcpus != cd->max_vcpus ||
> +        (ret = cpupool_move_domain(cd, d->cpupool)) )
> +        return ret;

...and just return -EINVAL here. Seeing as it's not used anywhere
else.

> +
> +    for ( i = 0; i < cd->max_vcpus; i++ )
> +    {
> +        if ( !d->vcpu[i] || cd->vcpu[i] )
> +            continue;
> +
> +        if ( !vcpu_create(cd, i) )
> +            return -EINVAL;
> +    }
> +
> +    domain_update_node_affinity(cd);
> +    return 0;
> +}
> +
> +static int copy_vcpu_settings(struct domain *cd, struct domain *d)
> +{
> +    unsigned int i;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
> +    int ret = -EINVAL;
> +
> +    for ( i = 0; i < cd->max_vcpus; i++ )
> +    {
> +        const struct vcpu *d_vcpu = d->vcpu[i];
> +        struct vcpu *cd_vcpu = cd->vcpu[i];
> +        struct vcpu_runstate_info runstate;
> +        mfn_t vcpu_info_mfn;
> +
> +        if ( !d_vcpu || !cd_vcpu )
> +            continue;
> +
> +        /*
> +         * Copy & map in the vcpu_info page if the guest uses one
> +         */
> +        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
> +        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> +        {
> +            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
> +
> +            /*
> +             * Allocate & map the page for it if it hasn't been already
> +             */
> +            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
> +            {
> +                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
> +                unsigned long gfn_l = gfn_x(gfn);
> +                struct page_info *page;
> +
> +                if ( !(page = alloc_domheap_page(cd, 0)) )
> +                    return -ENOMEM;
> +
> +                new_vcpu_info_mfn = page_to_mfn(page);
> +                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
> +
> +                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn, PAGE_ORDER_4K,
> +                                     p2m_ram_rw, p2m->default_access, -1);
> +                if ( ret )
> +                    return ret;
> +
> +                ret = map_vcpu_info(cd_vcpu, gfn_l,
> +                                    d_vcpu->vcpu_info_offset);
> +                if ( ret )
> +                    return ret;
> +            }
> +
> +            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
> +        }
> +
> +        /*
> +         * Setup the vCPU runstate area
> +         */
> +        if ( guest_handle_is_null(runstate_guest(cd_vcpu)) )

Maybe I'm confused, but isn't this the other way around and you need
to check? If the parent runstate is not null copy it to the fork,
ie:

if ( !guest_handle_is_null(runstate_guest(d_vcpu)) )
{
    ...

> +        {
> +            runstate_guest(cd_vcpu) = runstate_guest(d_vcpu);
> +            vcpu_runstate_get(cd_vcpu, &runstate);
> +            __copy_to_guest(runstate_guest(cd_vcpu), &runstate, 1);

You should check the return code I think.

> +        }
> +
> +        /*
> +         * TODO: to support VMs with PV interfaces copy additional
> +         * settings here, such as PV timers.
> +         */
> +    }
> +
> +    return 0;
> +}
> +
> +static int fork_hap_allocation(struct domain *cd, struct domain *d)
> +{
> +    int rc;
> +    bool preempted;
> +    unsigned long mb = hap_get_allocation(d);
> +
> +    if ( mb == hap_get_allocation(cd) )
> +        return 0;
> +
> +    paging_lock(cd);
> +    rc = hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempted);
> +    paging_unlock(cd);
> +
> +    return preempted ? -ERESTART : rc;
> +}
> +
> +static void copy_tsc(struct domain *cd, struct domain *d)
> +{
> +    uint32_t tsc_mode;
> +    uint32_t gtsc_khz;
> +    uint32_t incarnation;
> +    uint64_t elapsed_nsec;
> +
> +    tsc_get_info(d, &tsc_mode, &elapsed_nsec, &gtsc_khz, &incarnation);
> +    /* Don't bump incarnation on set */
> +    tsc_set_info(cd, tsc_mode, elapsed_nsec, gtsc_khz, incarnation - 1);
> +}
> +
> +static int copy_special_pages(struct domain *cd, struct domain *d)
> +{
> +    mfn_t new_mfn, old_mfn;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
> +    static const unsigned int params[] =
> +    {
> +        HVM_PARAM_STORE_PFN,
> +        HVM_PARAM_IOREQ_PFN,
> +        HVM_PARAM_BUFIOREQ_PFN,
> +        HVM_PARAM_CONSOLE_PFN
> +    };
> +    unsigned int i;
> +    int rc;
> +
> +    for ( i = 0; i < 4; i++ )

Please use ARRAY_SIZE instead of hard coding 4.

> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index 9f51370327..1ed7d13084 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_domain *p2m, unsigned long gfn_l,
>  
>      mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
>  
> +    /* Check if we need to fork the page */
> +    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
> +         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
> +        mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> +
> +    /* Check if we need to unshare the page */
>      if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
>      {
>          ASSERT(p2m_is_hostp2m(p2m));
> @@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
>              return page;
>  
>          /* Error path: not a suitable GFN at all */
> -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) )
> +        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
> +             !mem_sharing_is_fork(p2m->domain) )
>              return NULL;
>      }
>  
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index b4eb476a9c..62aed53a16 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset)
>  
>      v->vcpu_info = new_info;
>      v->vcpu_info_mfn = page_to_mfn(page);
> +#ifdef CONFIG_MEM_SHARING
> +    v->vcpu_info_offset = offset;

There's no need to introduce this field, you can just use v->vcpu_info
& ~PAGE_MASK AFAICT.

Thanks, Roger.

