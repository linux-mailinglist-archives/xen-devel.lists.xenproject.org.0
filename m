Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003FE8C6F99
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722714.1126955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P6F-0005Ef-49; Thu, 16 May 2024 00:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722714.1126955; Thu, 16 May 2024 00:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P6F-0005Cm-18; Thu, 16 May 2024 00:35:59 +0000
Received: by outflank-mailman (input) for mailman id 722714;
 Thu, 16 May 2024 00:35:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7P6D-0005Ce-39
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:35:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f783f5a-131c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:35:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 23CCACE1814;
 Thu, 16 May 2024 00:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4ACC32782;
 Thu, 16 May 2024 00:35:47 +0000 (UTC)
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
X-Inumbo-ID: 3f783f5a-131c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715819749;
	bh=ubQXcp4hG8ObvAs5nalAUPiEO7p0iDgBvitvg1NYWAc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FGglG3sWTO61vbQYervNNy2sxZ47UfZKPsuHvpz1milpqA2B6BUMkdx+EYX6ykczw
	 LnS/sCR776ljEEuclPfY+2vjH2hiYPzExQR2OPJNhW9NnANk8rYWY++CmqNXsOzTw0
	 ztd5XMJBxRnTxfOVqczyYQJV4O8eP0rqwrviBNs92ZtCJnUzpMOd3maAqFJdjYc00q
	 phhiGrX1f+YqYP63uULuxXZoKnSdFX2OEcuX+dZJokrac0mI4sZyHtAGVjqAlVWpkt
	 CYXeZALJqYbN/6DpeFqPjw7k/4c46WnTDxUNuYE1U1rBiVfJkdDz0k+Es56LHFQOlW
	 dLvwq46unRINQ==
Date: Wed, 15 May 2024 17:35:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [XEN PATCH v2 04/15] x86/p2m: move altp2m-related code to separate
 file
In-Reply-To: <d791a552c3d9331d9b2d40c91e6568932ea6afb7.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151735350.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <d791a552c3d9331d9b2d40c91e6568932ea6afb7.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> Move altp2m code from generic p2m.c file to altp2m.c, so it is kept separately
> and can possibly be disabled in the build. We may want to disable it when
> building for specific platform only, that doesn't support alternate p2m.
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> CC: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> changes in v2:
>  - no double blank lines
>  - no unrelated re-formatting
>  - header #include-s ordering
>  - changed patch description
> ---
>  xen/arch/x86/mm/altp2m.c | 630 ++++++++++++++++++++++++++++++++++++++
>  xen/arch/x86/mm/p2m.c    | 632 +--------------------------------------
>  xen/arch/x86/mm/p2m.h    |   3 +
>  3 files changed, 635 insertions(+), 630 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
> index a04297b646..6fe1e9ed6b 100644
> --- a/xen/arch/x86/mm/altp2m.c
> +++ b/xen/arch/x86/mm/altp2m.c
> @@ -7,6 +7,8 @@
>  #include <asm/hvm/hvm.h>
>  #include <asm/p2m.h>
>  #include <asm/altp2m.h>
> +#include <public/hvm/hvm_op.h>
> +#include <xen/event.h>
>  #include "mm-locks.h"
>  #include "p2m.h"
>  
> @@ -151,6 +153,634 @@ void p2m_teardown_altp2m(struct domain *d)
>      }
>  }
>  
> +int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
> +                               p2m_type_t *t, p2m_access_t *a,
> +                               bool prepopulate)
> +{
> +    *mfn = ap2m->get_entry(ap2m, gfn, t, a, 0, NULL, NULL);
> +
> +    /* Check host p2m if no valid entry in alternate */
> +    if ( !mfn_valid(*mfn) && !p2m_is_hostp2m(ap2m) )
> +    {
> +        struct p2m_domain *hp2m = p2m_get_hostp2m(ap2m->domain);
> +        unsigned int page_order;
> +        int rc;
> +
> +        *mfn = p2m_get_gfn_type_access(hp2m, gfn, t, a, P2M_ALLOC | P2M_UNSHARE,
> +                                       &page_order, 0);
> +
> +        rc = -ESRCH;
> +        if ( !mfn_valid(*mfn) || *t != p2m_ram_rw )
> +            return rc;
> +
> +        /* If this is a superpage, copy that first */
> +        if ( prepopulate && page_order != PAGE_ORDER_4K )
> +        {
> +            unsigned long mask = ~((1UL << page_order) - 1);
> +            gfn_t gfn_aligned = _gfn(gfn_x(gfn) & mask);
> +            mfn_t mfn_aligned = _mfn(mfn_x(*mfn) & mask);
> +
> +            rc = ap2m->set_entry(ap2m, gfn_aligned, mfn_aligned, page_order, *t, *a, 1);
> +            if ( rc )
> +                return rc;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
> +{
> +    if ( altp2m_active(v->domain) )
> +        p2m_switch_vcpu_altp2m_by_id(v, idx);
> +}
> +
> +bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
> +{
> +    struct domain *d = v->domain;
> +    bool rc = false;
> +
> +    if ( idx >= MAX_ALTP2M )
> +        return rc;
> +
> +    altp2m_list_lock(d);
> +
> +    if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
> +    {
> +        if ( p2m_set_altp2m(v, idx) )
> +            altp2m_vcpu_update_p2m(v);
> +        rc = 1;
> +    }
> +
> +    altp2m_list_unlock(d);
> +    return rc;
> +}
> +
> +/*
> + * Read info about the gfn in an altp2m, locking the gfn.
> + *
> + * If the entry is valid, pass the results back to the caller.
> + *
> + * If the entry was invalid, and the host's entry is also invalid,
> + * return to the caller without any changes.
> + *
> + * If the entry is invalid, and the host entry was valid, propagate
> + * the host's entry to the altp2m (retaining page order), and indicate
> + * that the caller should re-try the faulting instruction.
> + */
> +bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
> +                                 mfn_t *mfn, p2m_type_t *p2mt,
> +                                 p2m_access_t *p2ma, unsigned int *page_order)
> +{
> +    p2m_type_t ap2mt;
> +    p2m_access_t ap2ma;
> +    unsigned int cur_order;
> +    unsigned long mask;
> +    gfn_t gfn;
> +    mfn_t amfn;
> +    int rc;
> +
> +    /*
> +     * NB we must get the full lock on the altp2m here, in addition to
> +     * the lock on the individual gfn, since we may change a range of
> +     * gfns below.
> +     */
> +    p2m_lock(ap2m);
> +
> +    amfn = get_gfn_type_access(ap2m, gfn_l, &ap2mt, &ap2ma, 0, &cur_order);
> +
> +    if ( cur_order > *page_order )
> +        cur_order = *page_order;
> +
> +    if ( !mfn_eq(amfn, INVALID_MFN) )
> +    {
> +        p2m_unlock(ap2m);
> +        *mfn  = amfn;
> +        *p2mt = ap2mt;
> +        *p2ma = ap2ma;
> +        *page_order = cur_order;
> +        return false;
> +    }
> +
> +    /* Host entry is also invalid; don't bother setting the altp2m entry. */
> +    if ( mfn_eq(*mfn, INVALID_MFN) )
> +    {
> +        p2m_unlock(ap2m);
> +        *page_order = cur_order;
> +        return false;
> +    }
> +
> +    /*
> +     * If this is a superpage mapping, round down both frame numbers
> +     * to the start of the superpage.  NB that we repupose `amfn`
> +     * here.
> +     */
> +    mask = ~((1UL << cur_order) - 1);
> +    amfn = _mfn(mfn_x(*mfn) & mask);
> +    gfn = _gfn(gfn_l & mask);
> +
> +    /* Override the altp2m entry with its default access. */
> +    *p2ma = ap2m->default_access;
> +
> +    rc = p2m_set_entry(ap2m, gfn, amfn, cur_order, *p2mt, *p2ma);
> +    p2m_unlock(ap2m);
> +
> +    if ( rc )
> +    {
> +        gprintk(XENLOG_ERR,
> +                "failed to set entry for %"PRI_gfn" -> %"PRI_mfn" altp2m %u, rc %d\n",
> +                gfn_l, mfn_x(amfn), vcpu_altp2m(current).p2midx, rc);
> +        domain_crash(ap2m->domain);
> +    }
> +
> +    return true;
> +}
> +
> +enum altp2m_reset_type {
> +    ALTP2M_RESET,
> +    ALTP2M_DEACTIVATE
> +};
> +
> +static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
> +                             enum altp2m_reset_type reset_type)
> +{
> +    struct p2m_domain *p2m;
> +
> +    ASSERT(idx < MAX_ALTP2M);
> +    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
> +
> +    p2m_lock(p2m);
> +
> +    p2m_flush_table_locked(p2m);
> +
> +    if ( reset_type == ALTP2M_DEACTIVATE )
> +        p2m_free_logdirty(p2m);
> +
> +    /* Uninit and reinit ept to force TLB shootdown */
> +    ept_p2m_uninit(p2m);
> +    ept_p2m_init(p2m);
> +
> +    p2m->min_remapped_gfn = gfn_x(INVALID_GFN);
> +    p2m->max_remapped_gfn = 0;
> +
> +    p2m_unlock(p2m);
> +}
> +
> +void p2m_flush_altp2m(struct domain *d)
> +{
> +    unsigned int i;
> +
> +    altp2m_list_lock(d);
> +
> +    for ( i = 0; i < MAX_ALTP2M; i++ )
> +    {
> +        p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
> +        d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
> +        d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
> +    }
> +
> +    altp2m_list_unlock(d);
> +}
> +
> +static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
> +                               p2m_access_t hvmmem_default_access)
> +{
> +    struct p2m_domain *hostp2m, *p2m;
> +    int rc;
> +
> +    ASSERT(idx < MAX_ALTP2M);
> +
> +    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
> +    hostp2m = p2m_get_hostp2m(d);
> +
> +    p2m_lock(p2m);
> +
> +    rc = p2m_init_logdirty(p2m);
> +
> +    if ( rc )
> +        goto out;
> +
> +    /* The following is really just a rangeset copy. */
> +    rc = rangeset_merge(p2m->logdirty_ranges, hostp2m->logdirty_ranges);
> +
> +    if ( rc )
> +    {
> +        p2m_free_logdirty(p2m);
> +        goto out;
> +    }
> +
> +    p2m->default_access = hvmmem_default_access;
> +    p2m->domain = hostp2m->domain;
> +    p2m->global_logdirty = hostp2m->global_logdirty;
> +    p2m->min_remapped_gfn = gfn_x(INVALID_GFN);
> +    p2m->max_mapped_pfn = p2m->max_remapped_gfn = 0;
> +
> +    p2m_init_altp2m_ept(d, idx);
> +
> + out:
> +    p2m_unlock(p2m);
> +
> +    return rc;
> +}
> +
> +int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
> +{
> +    int rc = -EINVAL;
> +    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
> +
> +    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
> +        return rc;
> +
> +    altp2m_list_lock(d);
> +
> +    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
> +         mfn_x(INVALID_MFN) )
> +        rc = p2m_activate_altp2m(d, idx, hostp2m->default_access);
> +
> +    altp2m_list_unlock(d);
> +    return rc;
> +}
> +
> +int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
> +                         xenmem_access_t hvmmem_default_access)
> +{
> +    int rc = -EINVAL;
> +    unsigned int i;
> +    p2m_access_t a;
> +    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
> +
> +    if ( hvmmem_default_access > XENMEM_access_default ||
> +         !xenmem_access_to_p2m_access(hostp2m, hvmmem_default_access, &a) )
> +        return rc;
> +
> +    altp2m_list_lock(d);
> +
> +    for ( i = 0; i < MAX_ALTP2M; i++ )
> +    {
> +        if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
> +            continue;
> +
> +        rc = p2m_activate_altp2m(d, i, a);
> +
> +        if ( !rc )
> +            *idx = i;
> +
> +        break;
> +    }
> +
> +    altp2m_list_unlock(d);
> +    return rc;
> +}
> +
> +int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
> +{
> +    struct p2m_domain *p2m;
> +    int rc = -EBUSY;
> +
> +    if ( !idx || idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
> +        return rc;
> +
> +    rc = domain_pause_except_self(d);
> +    if ( rc )
> +        return rc;
> +
> +    rc = -EBUSY;
> +    altp2m_list_lock(d);
> +
> +    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
> +         mfn_x(INVALID_MFN) )
> +    {
> +        p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
> +
> +        if ( !_atomic_read(p2m->active_vcpus) )
> +        {
> +            p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
> +            d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =
> +                mfn_x(INVALID_MFN);
> +            d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] =
> +                mfn_x(INVALID_MFN);
> +            rc = 0;
> +        }
> +    }
> +
> +    altp2m_list_unlock(d);
> +
> +    domain_unpause_except_self(d);
> +
> +    return rc;
> +}
> +
> +int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
> +{
> +    struct vcpu *v;
> +    int rc = -EINVAL;
> +
> +    if ( idx >= MAX_ALTP2M )
> +        return rc;
> +
> +    rc = domain_pause_except_self(d);
> +    if ( rc )
> +        return rc;
> +
> +    rc = -EINVAL;
> +    altp2m_list_lock(d);
> +
> +    if ( d->arch.altp2m_visible_eptp[idx] != mfn_x(INVALID_MFN) )
> +    {
> +        for_each_vcpu( d, v )
> +            if ( p2m_set_altp2m(v, idx) )
> +                altp2m_vcpu_update_p2m(v);
> +
> +        rc = 0;
> +    }
> +
> +    altp2m_list_unlock(d);
> +
> +    domain_unpause_except_self(d);
> +
> +    return rc;
> +}
> +
> +int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
> +                          gfn_t old_gfn, gfn_t new_gfn)
> +{
> +    struct p2m_domain *hp2m, *ap2m;
> +    p2m_access_t a;
> +    p2m_type_t t;
> +    mfn_t mfn;
> +    int rc = -EINVAL;
> +
> +    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +         d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
> +         mfn_x(INVALID_MFN) )
> +        return rc;
> +
> +    hp2m = p2m_get_hostp2m(d);
> +    ap2m = array_access_nospec(d->arch.altp2m_p2m, idx);
> +
> +    p2m_lock(hp2m);
> +    p2m_lock(ap2m);
> +
> +    if ( gfn_eq(new_gfn, INVALID_GFN) )
> +    {
> +        mfn = ap2m->get_entry(ap2m, old_gfn, &t, &a, 0, NULL, NULL);
> +        rc = mfn_valid(mfn)
> +             ? p2m_remove_entry(ap2m, old_gfn, mfn, PAGE_ORDER_4K)
> +             : 0;
> +        goto out;
> +    }
> +
> +    rc = altp2m_get_effective_entry(ap2m, old_gfn, &mfn, &t, &a,
> +                                    AP2MGET_prepopulate);
> +    if ( rc )
> +        goto out;
> +
> +    rc = altp2m_get_effective_entry(ap2m, new_gfn, &mfn, &t, &a,
> +                                    AP2MGET_query);
> +    if ( rc )
> +        goto out;
> +
> +    if ( !ap2m->set_entry(ap2m, old_gfn, mfn, PAGE_ORDER_4K, t, a,
> +                          (current->domain != d)) )
> +    {
> +        rc = 0;
> +
> +        if ( gfn_x(new_gfn) < ap2m->min_remapped_gfn )
> +            ap2m->min_remapped_gfn = gfn_x(new_gfn);
> +        if ( gfn_x(new_gfn) > ap2m->max_remapped_gfn )
> +            ap2m->max_remapped_gfn = gfn_x(new_gfn);
> +    }
> +
> + out:
> +    p2m_unlock(ap2m);
> +    p2m_unlock(hp2m);
> +    return rc;
> +}
> +
> +int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
> +                                mfn_t mfn, unsigned int page_order,
> +                                p2m_type_t p2mt, p2m_access_t p2ma)
> +{
> +    struct p2m_domain *p2m;
> +    unsigned int i;
> +    unsigned int reset_count = 0;
> +    unsigned int last_reset_idx = ~0;
> +    int ret = 0;
> +
> +    if ( !altp2m_active(d) )
> +        return 0;
> +
> +    altp2m_list_lock(d);
> +
> +    for ( i = 0; i < MAX_ALTP2M; i++ )
> +    {
> +        p2m_type_t t;
> +        p2m_access_t a;
> +
> +        if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
> +            continue;
> +
> +        p2m = d->arch.altp2m_p2m[i];
> +
> +        /* Check for a dropped page that may impact this altp2m */
> +        if ( mfn_eq(mfn, INVALID_MFN) &&
> +             gfn_x(gfn) + (1UL << page_order) > p2m->min_remapped_gfn &&
> +             gfn_x(gfn) <= p2m->max_remapped_gfn )
> +        {
> +            if ( !reset_count++ )
> +            {
> +                p2m_reset_altp2m(d, i, ALTP2M_RESET);
> +                last_reset_idx = i;
> +            }
> +            else
> +            {
> +                /* At least 2 altp2m's impacted, so reset everything */
> +                for ( i = 0; i < MAX_ALTP2M; i++ )
> +                {
> +                    if ( i == last_reset_idx ||
> +                         d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
> +                        continue;
> +
> +                    p2m_reset_altp2m(d, i, ALTP2M_RESET);
> +                }
> +
> +                ret = 0;
> +                break;
> +            }
> +        }
> +        else if ( !mfn_eq(get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0,
> +                                              NULL), INVALID_MFN) )
> +        {
> +            int rc = p2m_set_entry(p2m, gfn, mfn, page_order, p2mt, p2ma);
> +
> +            /* Best effort: Don't bail on error. */
> +            if ( !ret )
> +                ret = rc;
> +
> +            p2m_put_gfn(p2m, gfn);
> +        }
> +        else
> +            p2m_put_gfn(p2m, gfn);
> +    }
> +
> +    altp2m_list_unlock(d);
> +
> +    return ret;
> +}
> +
> +/*
> + * Set/clear the #VE suppress bit for a page.  Only available on VMX.
> + */
> +int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
> +                        unsigned int altp2m_idx)
> +{
> +    int rc;
> +    struct xen_hvm_altp2m_suppress_ve_multi sve = {
> +        altp2m_idx, suppress_ve, 0, 0, gfn_x(gfn), gfn_x(gfn), 0
> +    };
> +
> +    if ( !(rc = p2m_set_suppress_ve_multi(d, &sve)) )
> +        rc = sve.first_error;
> +
> +    return rc;
> +}
> +
> +/*
> + * Set/clear the #VE suppress bit for multiple pages.  Only available on VMX.
> + */
> +int p2m_set_suppress_ve_multi(struct domain *d,
> +                              struct xen_hvm_altp2m_suppress_ve_multi *sve)
> +{
> +    struct p2m_domain *host_p2m = p2m_get_hostp2m(d);
> +    struct p2m_domain *ap2m = NULL;
> +    struct p2m_domain *p2m = host_p2m;
> +    uint64_t start = sve->first_gfn;
> +    int rc = 0;
> +
> +    if ( sve->view > 0 )
> +    {
> +        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +             d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
> +             mfn_x(INVALID_MFN) )
> +            return -EINVAL;
> +
> +        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
> +    }
> +
> +    p2m_lock(host_p2m);
> +
> +    if ( ap2m )
> +        p2m_lock(ap2m);
> +
> +    while ( sve->last_gfn >= start )
> +    {
> +        p2m_access_t a;
> +        p2m_type_t t;
> +        mfn_t mfn;
> +        int err = 0;
> +
> +        if ( (err = altp2m_get_effective_entry(p2m, _gfn(start), &mfn, &t, &a,
> +                                               AP2MGET_query)) &&
> +             !sve->first_error )
> +        {
> +            sve->first_error_gfn = start; /* Save the gfn of the first error */
> +            sve->first_error = err; /* Save the first error code */
> +        }
> +
> +        if ( !err && (err = p2m->set_entry(p2m, _gfn(start), mfn,
> +                                           PAGE_ORDER_4K, t, a,
> +                                           sve->suppress_ve)) &&
> +             !sve->first_error )
> +        {
> +            sve->first_error_gfn = start; /* Save the gfn of the first error */
> +            sve->first_error = err; /* Save the first error code */
> +        }
> +
> +        /* Check for continuation if it's not the last iteration. */
> +        if ( sve->last_gfn >= ++start && hypercall_preempt_check() )
> +        {
> +            rc = -ERESTART;
> +            break;
> +        }
> +    }
> +
> +    sve->first_gfn = start;
> +
> +    if ( ap2m )
> +        p2m_unlock(ap2m);
> +
> +    p2m_unlock(host_p2m);
> +
> +    return rc;
> +}
> +
> +int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
> +                        unsigned int altp2m_idx)
> +{
> +    struct p2m_domain *host_p2m = p2m_get_hostp2m(d);
> +    struct p2m_domain *ap2m = NULL;
> +    struct p2m_domain *p2m;
> +    mfn_t mfn;
> +    p2m_access_t a;
> +    p2m_type_t t;
> +    int rc = 0;
> +
> +    if ( altp2m_idx > 0 )
> +    {
> +        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
> +             mfn_x(INVALID_MFN) )
> +            return -EINVAL;
> +
> +        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
> +    }
> +    else
> +        p2m = host_p2m;
> +
> +    gfn_lock(host_p2m, gfn, 0);
> +
> +    if ( ap2m )
> +        p2m_lock(ap2m);
> +
> +    mfn = p2m->get_entry(p2m, gfn, &t, &a, 0, NULL, suppress_ve);
> +    if ( !mfn_valid(mfn) )
> +        rc = -ESRCH;
> +
> +    if ( ap2m )
> +        p2m_unlock(ap2m);
> +
> +    gfn_unlock(host_p2m, gfn, 0);
> +
> +    return rc;
> +}
> +
> +int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
> +                                   uint8_t visible)
> +{
> +    int rc = 0;
> +
> +    altp2m_list_lock(d);
> +
> +    /*
> +     * Eptp index is correlated with altp2m index and should not exceed
> +     * min(MAX_ALTP2M, MAX_EPTP).
> +     */
> +    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +         d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
> +         mfn_x(INVALID_MFN) )
> +        rc = -EINVAL;
> +    else if ( visible )
> +        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
> +            d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)];
> +    else
> +        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
> +            mfn_x(INVALID_MFN);
> +
> +    altp2m_list_unlock(d);
> +
> +    return rc;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index ce742c12e0..7c422a2d7e 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -500,7 +500,7 @@ int p2m_alloc_table(struct p2m_domain *p2m)
>      return 0;
>  }
>  
> -static int __must_check
> +int __must_check
>  p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
>                   unsigned int page_order)
>  {
> @@ -1329,7 +1329,7 @@ p2m_getlru_nestedp2m(struct domain *d, struct p2m_domain *p2m)
>      return p2m;
>  }
>  
> -static void
> +void
>  p2m_flush_table_locked(struct p2m_domain *p2m)
>  {
>      struct page_info *top, *pg;
> @@ -1729,481 +1729,6 @@ int unmap_mmio_regions(struct domain *d,
>      return i == nr ? 0 : i ?: ret;
>  }
>  
> -int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
> -                               p2m_type_t *t, p2m_access_t *a,
> -                               bool prepopulate)
> -{
> -    *mfn = ap2m->get_entry(ap2m, gfn, t, a, 0, NULL, NULL);
> -
> -    /* Check host p2m if no valid entry in alternate */
> -    if ( !mfn_valid(*mfn) && !p2m_is_hostp2m(ap2m) )
> -    {
> -        struct p2m_domain *hp2m = p2m_get_hostp2m(ap2m->domain);
> -        unsigned int page_order;
> -        int rc;
> -
> -        *mfn = p2m_get_gfn_type_access(hp2m, gfn, t, a, P2M_ALLOC | P2M_UNSHARE,
> -                                       &page_order, 0);
> -
> -        rc = -ESRCH;
> -        if ( !mfn_valid(*mfn) || *t != p2m_ram_rw )
> -            return rc;
> -
> -        /* If this is a superpage, copy that first */
> -        if ( prepopulate && page_order != PAGE_ORDER_4K )
> -        {
> -            unsigned long mask = ~((1UL << page_order) - 1);
> -            gfn_t gfn_aligned = _gfn(gfn_x(gfn) & mask);
> -            mfn_t mfn_aligned = _mfn(mfn_x(*mfn) & mask);
> -
> -            rc = ap2m->set_entry(ap2m, gfn_aligned, mfn_aligned, page_order, *t, *a, 1);
> -            if ( rc )
> -                return rc;
> -        }
> -    }
> -
> -    return 0;
> -}
> -
> -void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
> -{
> -    if ( altp2m_active(v->domain) )
> -        p2m_switch_vcpu_altp2m_by_id(v, idx);
> -}
> -
> -bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
> -{
> -    struct domain *d = v->domain;
> -    bool rc = false;
> -
> -    if ( idx >= MAX_ALTP2M )
> -        return rc;
> -
> -    altp2m_list_lock(d);
> -
> -    if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
> -    {
> -        if ( p2m_set_altp2m(v, idx) )
> -            altp2m_vcpu_update_p2m(v);
> -        rc = 1;
> -    }
> -
> -    altp2m_list_unlock(d);
> -    return rc;
> -}
> -
> -/*
> - * Read info about the gfn in an altp2m, locking the gfn.
> - *
> - * If the entry is valid, pass the results back to the caller.
> - *
> - * If the entry was invalid, and the host's entry is also invalid,
> - * return to the caller without any changes.
> - *
> - * If the entry is invalid, and the host entry was valid, propagate
> - * the host's entry to the altp2m (retaining page order), and indicate
> - * that the caller should re-try the faulting instruction.
> - */
> -bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
> -                                 mfn_t *mfn, p2m_type_t *p2mt,
> -                                 p2m_access_t *p2ma, unsigned int *page_order)
> -{
> -    p2m_type_t ap2mt;
> -    p2m_access_t ap2ma;
> -    unsigned int cur_order;
> -    unsigned long mask;
> -    gfn_t gfn;
> -    mfn_t amfn;
> -    int rc;
> -
> -    /*
> -     * NB we must get the full lock on the altp2m here, in addition to
> -     * the lock on the individual gfn, since we may change a range of
> -     * gfns below.
> -     */
> -    p2m_lock(ap2m);
> -
> -    amfn = get_gfn_type_access(ap2m, gfn_l, &ap2mt, &ap2ma, 0, &cur_order);
> -
> -    if ( cur_order > *page_order )
> -        cur_order = *page_order;
> -
> -    if ( !mfn_eq(amfn, INVALID_MFN) )
> -    {
> -        p2m_unlock(ap2m);
> -        *mfn  = amfn;
> -        *p2mt = ap2mt;
> -        *p2ma = ap2ma;
> -        *page_order = cur_order;
> -        return false;
> -    }
> -
> -    /* Host entry is also invalid; don't bother setting the altp2m entry. */
> -    if ( mfn_eq(*mfn, INVALID_MFN) )
> -    {
> -        p2m_unlock(ap2m);
> -        *page_order = cur_order;
> -        return false;
> -    }
> -
> -    /*
> -     * If this is a superpage mapping, round down both frame numbers
> -     * to the start of the superpage.  NB that we repupose `amfn`
> -     * here.
> -     */
> -    mask = ~((1UL << cur_order) - 1);
> -    amfn = _mfn(mfn_x(*mfn) & mask);
> -    gfn = _gfn(gfn_l & mask);
> -
> -    /* Override the altp2m entry with its default access. */
> -    *p2ma = ap2m->default_access;
> -
> -    rc = p2m_set_entry(ap2m, gfn, amfn, cur_order, *p2mt, *p2ma);
> -    p2m_unlock(ap2m);
> -
> -    if ( rc )
> -    {
> -        gprintk(XENLOG_ERR,
> -                "failed to set entry for %"PRI_gfn" -> %"PRI_mfn" altp2m %u, rc %d\n",
> -                gfn_l, mfn_x(amfn), vcpu_altp2m(current).p2midx, rc);
> -        domain_crash(ap2m->domain);
> -    }
> -
> -    return true;
> -}
> -
> -enum altp2m_reset_type {
> -    ALTP2M_RESET,
> -    ALTP2M_DEACTIVATE
> -};
> -
> -static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
> -                             enum altp2m_reset_type reset_type)
> -{
> -    struct p2m_domain *p2m;
> -
> -    ASSERT(idx < MAX_ALTP2M);
> -    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
> -
> -    p2m_lock(p2m);
> -
> -    p2m_flush_table_locked(p2m);
> -
> -    if ( reset_type == ALTP2M_DEACTIVATE )
> -        p2m_free_logdirty(p2m);
> -
> -    /* Uninit and reinit ept to force TLB shootdown */
> -    ept_p2m_uninit(p2m);
> -    ept_p2m_init(p2m);
> -
> -    p2m->min_remapped_gfn = gfn_x(INVALID_GFN);
> -    p2m->max_remapped_gfn = 0;
> -
> -    p2m_unlock(p2m);
> -}
> -
> -void p2m_flush_altp2m(struct domain *d)
> -{
> -    unsigned int i;
> -
> -    altp2m_list_lock(d);
> -
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> -    {
> -        p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
> -        d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
> -        d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
> -    }
> -
> -    altp2m_list_unlock(d);
> -}
> -
> -static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
> -                               p2m_access_t hvmmem_default_access)
> -{
> -    struct p2m_domain *hostp2m, *p2m;
> -    int rc;
> -
> -    ASSERT(idx < MAX_ALTP2M);
> -
> -    p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
> -    hostp2m = p2m_get_hostp2m(d);
> -
> -    p2m_lock(p2m);
> -
> -    rc = p2m_init_logdirty(p2m);
> -
> -    if ( rc )
> -        goto out;
> -
> -    /* The following is really just a rangeset copy. */
> -    rc = rangeset_merge(p2m->logdirty_ranges, hostp2m->logdirty_ranges);
> -
> -    if ( rc )
> -    {
> -        p2m_free_logdirty(p2m);
> -        goto out;
> -    }
> -
> -    p2m->default_access = hvmmem_default_access;
> -    p2m->domain = hostp2m->domain;
> -    p2m->global_logdirty = hostp2m->global_logdirty;
> -    p2m->min_remapped_gfn = gfn_x(INVALID_GFN);
> -    p2m->max_mapped_pfn = p2m->max_remapped_gfn = 0;
> -
> -    p2m_init_altp2m_ept(d, idx);
> -
> - out:
> -    p2m_unlock(p2m);
> -
> -    return rc;
> -}
> -
> -int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
> -{
> -    int rc = -EINVAL;
> -    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
> -
> -    if ( idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
> -        return rc;
> -
> -    altp2m_list_lock(d);
> -
> -    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
> -         mfn_x(INVALID_MFN) )
> -        rc = p2m_activate_altp2m(d, idx, hostp2m->default_access);
> -
> -    altp2m_list_unlock(d);
> -    return rc;
> -}
> -
> -int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
> -                         xenmem_access_t hvmmem_default_access)
> -{
> -    int rc = -EINVAL;
> -    unsigned int i;
> -    p2m_access_t a;
> -    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
> -
> -    if ( hvmmem_default_access > XENMEM_access_default ||
> -         !xenmem_access_to_p2m_access(hostp2m, hvmmem_default_access, &a) )
> -        return rc;
> -
> -    altp2m_list_lock(d);
> -
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> -    {
> -        if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
> -            continue;
> -
> -        rc = p2m_activate_altp2m(d, i, a);
> -
> -        if ( !rc )
> -            *idx = i;
> -
> -        break;
> -    }
> -
> -    altp2m_list_unlock(d);
> -    return rc;
> -}
> -
> -int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
> -{
> -    struct p2m_domain *p2m;
> -    int rc = -EBUSY;
> -
> -    if ( !idx || idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) )
> -        return rc;
> -
> -    rc = domain_pause_except_self(d);
> -    if ( rc )
> -        return rc;
> -
> -    rc = -EBUSY;
> -    altp2m_list_lock(d);
> -
> -    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
> -         mfn_x(INVALID_MFN) )
> -    {
> -        p2m = array_access_nospec(d->arch.altp2m_p2m, idx);
> -
> -        if ( !_atomic_read(p2m->active_vcpus) )
> -        {
> -            p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
> -            d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =
> -                mfn_x(INVALID_MFN);
> -            d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] =
> -                mfn_x(INVALID_MFN);
> -            rc = 0;
> -        }
> -    }
> -
> -    altp2m_list_unlock(d);
> -
> -    domain_unpause_except_self(d);
> -
> -    return rc;
> -}
> -
> -int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
> -{
> -    struct vcpu *v;
> -    int rc = -EINVAL;
> -
> -    if ( idx >= MAX_ALTP2M )
> -        return rc;
> -
> -    rc = domain_pause_except_self(d);
> -    if ( rc )
> -        return rc;
> -
> -    rc = -EINVAL;
> -    altp2m_list_lock(d);
> -
> -    if ( d->arch.altp2m_visible_eptp[idx] != mfn_x(INVALID_MFN) )
> -    {
> -        for_each_vcpu( d, v )
> -            if ( p2m_set_altp2m(v, idx) )
> -                altp2m_vcpu_update_p2m(v);
> -
> -        rc = 0;
> -    }
> -
> -    altp2m_list_unlock(d);
> -
> -    domain_unpause_except_self(d);
> -
> -    return rc;
> -}
> -
> -int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
> -                          gfn_t old_gfn, gfn_t new_gfn)
> -{
> -    struct p2m_domain *hp2m, *ap2m;
> -    p2m_access_t a;
> -    p2m_type_t t;
> -    mfn_t mfn;
> -    int rc = -EINVAL;
> -
> -    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> -         d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
> -         mfn_x(INVALID_MFN) )
> -        return rc;
> -
> -    hp2m = p2m_get_hostp2m(d);
> -    ap2m = array_access_nospec(d->arch.altp2m_p2m, idx);
> -
> -    p2m_lock(hp2m);
> -    p2m_lock(ap2m);
> -
> -    if ( gfn_eq(new_gfn, INVALID_GFN) )
> -    {
> -        mfn = ap2m->get_entry(ap2m, old_gfn, &t, &a, 0, NULL, NULL);
> -        rc = mfn_valid(mfn)
> -             ? p2m_remove_entry(ap2m, old_gfn, mfn, PAGE_ORDER_4K)
> -             : 0;
> -        goto out;
> -    }
> -
> -    rc = altp2m_get_effective_entry(ap2m, old_gfn, &mfn, &t, &a,
> -                                    AP2MGET_prepopulate);
> -    if ( rc )
> -        goto out;
> -
> -    rc = altp2m_get_effective_entry(ap2m, new_gfn, &mfn, &t, &a,
> -                                    AP2MGET_query);
> -    if ( rc )
> -        goto out;
> -
> -    if ( !ap2m->set_entry(ap2m, old_gfn, mfn, PAGE_ORDER_4K, t, a,
> -                          (current->domain != d)) )
> -    {
> -        rc = 0;
> -
> -        if ( gfn_x(new_gfn) < ap2m->min_remapped_gfn )
> -            ap2m->min_remapped_gfn = gfn_x(new_gfn);
> -        if ( gfn_x(new_gfn) > ap2m->max_remapped_gfn )
> -            ap2m->max_remapped_gfn = gfn_x(new_gfn);
> -    }
> -
> - out:
> -    p2m_unlock(ap2m);
> -    p2m_unlock(hp2m);
> -    return rc;
> -}
> -
> -int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
> -                                mfn_t mfn, unsigned int page_order,
> -                                p2m_type_t p2mt, p2m_access_t p2ma)
> -{
> -    struct p2m_domain *p2m;
> -    unsigned int i;
> -    unsigned int reset_count = 0;
> -    unsigned int last_reset_idx = ~0;
> -    int ret = 0;
> -
> -    if ( !altp2m_active(d) )
> -        return 0;
> -
> -    altp2m_list_lock(d);
> -
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> -    {
> -        p2m_type_t t;
> -        p2m_access_t a;
> -
> -        if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
> -            continue;
> -
> -        p2m = d->arch.altp2m_p2m[i];
> -
> -        /* Check for a dropped page that may impact this altp2m */
> -        if ( mfn_eq(mfn, INVALID_MFN) &&
> -             gfn_x(gfn) + (1UL << page_order) > p2m->min_remapped_gfn &&
> -             gfn_x(gfn) <= p2m->max_remapped_gfn )
> -        {
> -            if ( !reset_count++ )
> -            {
> -                p2m_reset_altp2m(d, i, ALTP2M_RESET);
> -                last_reset_idx = i;
> -            }
> -            else
> -            {
> -                /* At least 2 altp2m's impacted, so reset everything */
> -                for ( i = 0; i < MAX_ALTP2M; i++ )
> -                {
> -                    if ( i == last_reset_idx ||
> -                         d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
> -                        continue;
> -
> -                    p2m_reset_altp2m(d, i, ALTP2M_RESET);
> -                }
> -
> -                ret = 0;
> -                break;
> -            }
> -        }
> -        else if ( !mfn_eq(get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0,
> -                                              NULL), INVALID_MFN) )
> -        {
> -            int rc = p2m_set_entry(p2m, gfn, mfn, page_order, p2mt, p2ma);
> -
> -            /* Best effort: Don't bail on error. */
> -            if ( !ret )
> -                ret = rc;
> -
> -            p2m_put_gfn(p2m, gfn);
> -        }
> -        else
> -            p2m_put_gfn(p2m, gfn);
> -    }
> -
> -    altp2m_list_unlock(d);
> -
> -    return ret;
> -}
> -
>  /*** Audit ***/
>  
>  #if P2M_AUDIT
> @@ -2540,159 +2065,6 @@ int xenmem_add_to_physmap_one(
>      return rc;
>  }
>  
> -/*
> - * Set/clear the #VE suppress bit for a page.  Only available on VMX.
> - */
> -int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
> -                        unsigned int altp2m_idx)
> -{
> -    int rc;
> -    struct xen_hvm_altp2m_suppress_ve_multi sve = {
> -        altp2m_idx, suppress_ve, 0, 0, gfn_x(gfn), gfn_x(gfn), 0
> -    };
> -
> -    if ( !(rc = p2m_set_suppress_ve_multi(d, &sve)) )
> -        rc = sve.first_error;
> -
> -    return rc;
> -}
> -
> -/*
> - * Set/clear the #VE suppress bit for multiple pages.  Only available on VMX.
> - */
> -int p2m_set_suppress_ve_multi(struct domain *d,
> -                              struct xen_hvm_altp2m_suppress_ve_multi *sve)
> -{
> -    struct p2m_domain *host_p2m = p2m_get_hostp2m(d);
> -    struct p2m_domain *ap2m = NULL;
> -    struct p2m_domain *p2m = host_p2m;
> -    uint64_t start = sve->first_gfn;
> -    int rc = 0;
> -
> -    if ( sve->view > 0 )
> -    {
> -        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> -             d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
> -             mfn_x(INVALID_MFN) )
> -            return -EINVAL;
> -
> -        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
> -    }
> -
> -    p2m_lock(host_p2m);
> -
> -    if ( ap2m )
> -        p2m_lock(ap2m);
> -
> -    while ( sve->last_gfn >= start )
> -    {
> -        p2m_access_t a;
> -        p2m_type_t t;
> -        mfn_t mfn;
> -        int err = 0;
> -
> -        if ( (err = altp2m_get_effective_entry(p2m, _gfn(start), &mfn, &t, &a,
> -                                               AP2MGET_query)) &&
> -             !sve->first_error )
> -        {
> -            sve->first_error_gfn = start; /* Save the gfn of the first error */
> -            sve->first_error = err; /* Save the first error code */
> -        }
> -
> -        if ( !err && (err = p2m->set_entry(p2m, _gfn(start), mfn,
> -                                           PAGE_ORDER_4K, t, a,
> -                                           sve->suppress_ve)) &&
> -             !sve->first_error )
> -        {
> -            sve->first_error_gfn = start; /* Save the gfn of the first error */
> -            sve->first_error = err; /* Save the first error code */
> -        }
> -
> -        /* Check for continuation if it's not the last iteration. */
> -        if ( sve->last_gfn >= ++start && hypercall_preempt_check() )
> -        {
> -            rc = -ERESTART;
> -            break;
> -        }
> -    }
> -
> -    sve->first_gfn = start;
> -
> -    if ( ap2m )
> -        p2m_unlock(ap2m);
> -
> -    p2m_unlock(host_p2m);
> -
> -    return rc;
> -}
> -
> -int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
> -                        unsigned int altp2m_idx)
> -{
> -    struct p2m_domain *host_p2m = p2m_get_hostp2m(d);
> -    struct p2m_domain *ap2m = NULL;
> -    struct p2m_domain *p2m;
> -    mfn_t mfn;
> -    p2m_access_t a;
> -    p2m_type_t t;
> -    int rc = 0;
> -
> -    if ( altp2m_idx > 0 )
> -    {
> -        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> -             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
> -             mfn_x(INVALID_MFN) )
> -            return -EINVAL;
> -
> -        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
> -    }
> -    else
> -        p2m = host_p2m;
> -
> -    gfn_lock(host_p2m, gfn, 0);
> -
> -    if ( ap2m )
> -        p2m_lock(ap2m);
> -
> -    mfn = p2m->get_entry(p2m, gfn, &t, &a, 0, NULL, suppress_ve);
> -    if ( !mfn_valid(mfn) )
> -        rc = -ESRCH;
> -
> -    if ( ap2m )
> -        p2m_unlock(ap2m);
> -
> -    gfn_unlock(host_p2m, gfn, 0);
> -
> -    return rc;
> -}
> -
> -int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
> -                                   uint8_t visible)
> -{
> -    int rc = 0;
> -
> -    altp2m_list_lock(d);
> -
> -    /*
> -     * Eptp index is correlated with altp2m index and should not exceed
> -     * min(MAX_ALTP2M, MAX_EPTP).
> -     */
> -    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> -         d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
> -         mfn_x(INVALID_MFN) )
> -        rc = -EINVAL;
> -    else if ( visible )
> -        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
> -            d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)];
> -    else
> -        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
> -            mfn_x(INVALID_MFN);
> -
> -    altp2m_list_unlock(d);
> -
> -    return rc;
> -}
> -
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
> index 04308cfb6d..635f5a7f45 100644
> --- a/xen/arch/x86/mm/p2m.h
> +++ b/xen/arch/x86/mm/p2m.h
> @@ -22,6 +22,9 @@ static inline void p2m_free_logdirty(struct p2m_domain *p2m) {}
>  int p2m_init_altp2m(struct domain *d);
>  void p2m_teardown_altp2m(struct domain *d);
>  
> +void p2m_flush_table_locked(struct p2m_domain *p2m);
> +int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
> +                                  unsigned int page_order);
>  void p2m_nestedp2m_init(struct p2m_domain *p2m);
>  int p2m_init_nestedp2m(struct domain *d);
>  void p2m_teardown_nestedp2m(struct domain *d);
> -- 
> 2.25.1
> 

