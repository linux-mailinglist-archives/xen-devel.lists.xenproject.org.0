Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908B428770B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 17:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4499.11747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQXjX-0001Px-Uh; Thu, 08 Oct 2020 15:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4499.11747; Thu, 08 Oct 2020 15:21:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQXjX-0001PV-RX; Thu, 08 Oct 2020 15:21:31 +0000
Received: by outflank-mailman (input) for mailman id 4499;
 Thu, 08 Oct 2020 15:21:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kQXjX-0001PQ-0r
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:21:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 388cfe01-f52d-4982-8ff6-1300ac48f90d;
 Thu, 08 Oct 2020 15:21:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kQXjX-0001PQ-0r
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:21:31 +0000
X-Inumbo-ID: 388cfe01-f52d-4982-8ff6-1300ac48f90d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 388cfe01-f52d-4982-8ff6-1300ac48f90d;
	Thu, 08 Oct 2020 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602170488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pE04uvuGBd9qJQ4+u9fj1g+5M0gYiYl5ZZNsiR4/NHw=;
  b=Bpz9mNnvLH4voFS9TyGQC7wmaQKScrPLJjDcX9vt19vTfTDC8HMMv5ix
   MGnCX+YDj/VutQV4s/r88ri9opB98WJ3q/R8wkzSkbtN4lHcZUG/PvjaO
   59pytdMVgWK6xFr7/e+GtTRf/0QZ2U6pMwlCPXgVSpgqEg0RbJT48+zsU
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: H8zRRZJ0JgMpUM1nL1yViZ95Dv7T1ujS7DvVa57D+K7tUaiR4qCa43k4Rq/Edf/un+7ijIbUmj
 LcE3pkWo8pYUUM1LUpia/pHv4Ynk/DaraR1ph40leMyeH1ygiKkO28s5/5LaYJAeVGaqxmkYIr
 N6q2t0lQLu+yH/h5F/dSmcgwEn+2aYS2s8ja/ZSXRDJxoIGiw1BLG/mdYfi2Jwu5XweDTI6XRW
 t2Cy25HCus+zI65T5GSKd6ZOuC3ERPNtYW9Cq7yMkP1FnF5ztzZG+dcO7BG3aB4KSbx3cXrX0b
 RmQ=
X-SBRS: None
X-MesageID: 29617263
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,351,1596513600"; 
   d="scan'208";a="29617263"
Date: Thu, 8 Oct 2020 17:15:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v2 4/4] x86/shadow: refactor shadow_vram_{get,put}_l1e()
Message-ID: <20201008151556.GL19254@Air-de-Roger>
References: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
 <51515581-19f3-5b7c-a2f9-1a0b11f8283a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <51515581-19f3-5b7c-a2f9-1a0b11f8283a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 16, 2020 at 03:08:40PM +0200, Jan Beulich wrote:
> By passing the functions an MFN and flags, only a single instance of
                           ^ a
> each is needed; they were pretty large for being inline functions
> anyway.
> 
> While moving the code, also adjust coding style and add const where
> sensible / possible.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- a/xen/arch/x86/mm/shadow/hvm.c
> +++ b/xen/arch/x86/mm/shadow/hvm.c
> @@ -903,6 +903,104 @@ int shadow_track_dirty_vram(struct domai
>      return rc;
>  }
>  
> +void shadow_vram_get_mfn(mfn_t mfn, unsigned int l1f,
> +                         mfn_t sl1mfn, const void *sl1e,
> +                         const struct domain *d)
> +{
> +    unsigned long gfn;
> +    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
> +
> +    ASSERT(is_hvm_domain(d));
> +
> +    if ( !dirty_vram /* tracking disabled? */ ||
> +         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
> +         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
> +        return;
> +
> +    gfn = gfn_x(mfn_to_gfn(d, mfn));
> +    /* Page sharing not supported on shadow PTs */
> +    BUG_ON(SHARED_M2P(gfn));
> +
> +    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
> +    {
> +        unsigned long i = gfn - dirty_vram->begin_pfn;
> +        const struct page_info *page = mfn_to_page(mfn);
> +
> +        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
> +            /* Initial guest reference, record it */
> +            dirty_vram->sl1ma[i] = mfn_to_maddr(sl1mfn) |
> +                                   PAGE_OFFSET(sl1e);
> +    }
> +}
> +
> +void shadow_vram_put_mfn(mfn_t mfn, unsigned int l1f,
> +                         mfn_t sl1mfn, const void *sl1e,
> +                         const struct domain *d)
> +{
> +    unsigned long gfn;
> +    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
> +
> +    ASSERT(is_hvm_domain(d));
> +
> +    if ( !dirty_vram /* tracking disabled? */ ||
> +         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
> +         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
> +        return;
> +
> +    gfn = gfn_x(mfn_to_gfn(d, mfn));
> +    /* Page sharing not supported on shadow PTs */
> +    BUG_ON(SHARED_M2P(gfn));
> +
> +    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
> +    {
> +        unsigned long i = gfn - dirty_vram->begin_pfn;
> +        const struct page_info *page = mfn_to_page(mfn);
> +        bool dirty = false;
> +        paddr_t sl1ma = mfn_to_maddr(sl1mfn) | PAGE_OFFSET(sl1e);
> +
> +        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
> +        {
> +            /* Last reference */
> +            if ( dirty_vram->sl1ma[i] == INVALID_PADDR )
> +            {
> +                /* We didn't know it was that one, let's say it is dirty */
> +                dirty = true;
> +            }
> +            else
> +            {
> +                ASSERT(dirty_vram->sl1ma[i] == sl1ma);
> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
> +                if ( l1f & _PAGE_DIRTY )
> +                    dirty = true;
> +            }
> +        }
> +        else
> +        {
> +            /* We had more than one reference, just consider the page dirty. */
> +            dirty = true;
> +            /* Check that it's not the one we recorded. */
> +            if ( dirty_vram->sl1ma[i] == sl1ma )
> +            {
> +                /* Too bad, we remembered the wrong one... */
> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
> +            }
> +            else
> +            {
> +                /*
> +                 * Ok, our recorded sl1e is still pointing to this page, let's
> +                 * just hope it will remain.
> +                 */
> +            }
> +        }
> +
> +        if ( dirty )
> +        {
> +            dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);

Could you use _set_bit here?

> +            dirty_vram->last_dirty = NOW();
> +        }
> +    }
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -1047,107 +1047,6 @@ static int shadow_set_l2e(struct domain
>      return flags;
>  }
>  
> -static inline void shadow_vram_get_l1e(shadow_l1e_t new_sl1e,
> -                                       shadow_l1e_t *sl1e,
> -                                       mfn_t sl1mfn,
> -                                       struct domain *d)
> -{
> -#ifdef CONFIG_HVM
> -    mfn_t mfn = shadow_l1e_get_mfn(new_sl1e);
> -    int flags = shadow_l1e_get_flags(new_sl1e);
> -    unsigned long gfn;
> -    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
> -
> -    if ( !is_hvm_domain(d) || !dirty_vram /* tracking disabled? */
> -         || !(flags & _PAGE_RW) /* read-only mapping? */
> -         || !mfn_valid(mfn) )   /* mfn can be invalid in mmio_direct */
> -        return;
> -
> -    gfn = gfn_x(mfn_to_gfn(d, mfn));
> -    /* Page sharing not supported on shadow PTs */
> -    BUG_ON(SHARED_M2P(gfn));
> -
> -    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
> -    {
> -        unsigned long i = gfn - dirty_vram->begin_pfn;
> -        struct page_info *page = mfn_to_page(mfn);
> -
> -        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
> -            /* Initial guest reference, record it */
> -            dirty_vram->sl1ma[i] = mfn_to_maddr(sl1mfn)
> -                | ((unsigned long)sl1e & ~PAGE_MASK);
> -    }
> -#endif
> -}
> -
> -static inline void shadow_vram_put_l1e(shadow_l1e_t old_sl1e,
> -                                       shadow_l1e_t *sl1e,
> -                                       mfn_t sl1mfn,
> -                                       struct domain *d)
> -{
> -#ifdef CONFIG_HVM
> -    mfn_t mfn = shadow_l1e_get_mfn(old_sl1e);
> -    int flags = shadow_l1e_get_flags(old_sl1e);
> -    unsigned long gfn;
> -    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
> -
> -    if ( !is_hvm_domain(d) || !dirty_vram /* tracking disabled? */
> -         || !(flags & _PAGE_RW) /* read-only mapping? */
> -         || !mfn_valid(mfn) )   /* mfn can be invalid in mmio_direct */
> -        return;
> -
> -    gfn = gfn_x(mfn_to_gfn(d, mfn));
> -    /* Page sharing not supported on shadow PTs */
> -    BUG_ON(SHARED_M2P(gfn));
> -
> -    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
> -    {
> -        unsigned long i = gfn - dirty_vram->begin_pfn;
> -        struct page_info *page = mfn_to_page(mfn);
> -        int dirty = 0;
> -        paddr_t sl1ma = mfn_to_maddr(sl1mfn)
> -            | ((unsigned long)sl1e & ~PAGE_MASK);
> -
> -        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
> -        {
> -            /* Last reference */
> -            if ( dirty_vram->sl1ma[i] == INVALID_PADDR ) {
> -                /* We didn't know it was that one, let's say it is dirty */
> -                dirty = 1;
> -            }
> -            else
> -            {
> -                ASSERT(dirty_vram->sl1ma[i] == sl1ma);
> -                dirty_vram->sl1ma[i] = INVALID_PADDR;
> -                if ( flags & _PAGE_DIRTY )
> -                    dirty = 1;
> -            }
> -        }
> -        else
> -        {
> -            /* We had more than one reference, just consider the page dirty. */
> -            dirty = 1;
> -            /* Check that it's not the one we recorded. */
> -            if ( dirty_vram->sl1ma[i] == sl1ma )
> -            {
> -                /* Too bad, we remembered the wrong one... */
> -                dirty_vram->sl1ma[i] = INVALID_PADDR;
> -            }
> -            else
> -            {
> -                /* Ok, our recorded sl1e is still pointing to this page, let's
> -                 * just hope it will remain. */
> -            }
> -        }
> -        if ( dirty )
> -        {
> -            dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
> -            dirty_vram->last_dirty = NOW();
> -        }
> -    }
> -#endif
> -}
> -
>  static int shadow_set_l1e(struct domain *d,
>                            shadow_l1e_t *sl1e,
>                            shadow_l1e_t new_sl1e,
> @@ -1156,6 +1055,7 @@ static int shadow_set_l1e(struct domain
>  {
>      int flags = 0;
>      shadow_l1e_t old_sl1e;
> +    unsigned int old_sl1f;
>  #if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
>      mfn_t new_gmfn = shadow_l1e_get_mfn(new_sl1e);
>  #endif
> @@ -1194,7 +1094,9 @@ static int shadow_set_l1e(struct domain
>                  new_sl1e = shadow_l1e_flip_flags(new_sl1e, rc);
>                  /* fall through */
>              case 0:
> -                shadow_vram_get_l1e(new_sl1e, sl1e, sl1mfn, d);
> +                shadow_vram_get_mfn(shadow_l1e_get_mfn(new_sl1e),
> +                                    shadow_l1e_get_flags(new_sl1e),
> +                                    sl1mfn, sl1e, d);

As you have moved this function into a HVM build time file, don't you
need to guard this call, or alternatively provide a dummy handler for
!CONFIG_HVM in private.h?

Same for shadow_vram_put_mfn.

Thanks, Roger.

