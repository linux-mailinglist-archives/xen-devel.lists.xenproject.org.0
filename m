Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397AB191358
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 15:36:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGkdO-0000Y7-3A; Tue, 24 Mar 2020 14:34:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2LnZ=5J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGkdM-0000Y2-LV
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 14:34:24 +0000
X-Inumbo-ID: 8df274d4-6ddc-11ea-92cf-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8df274d4-6ddc-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 14:34:23 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id de14so2601722edb.4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2020 07:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2OjYgLWfb/828oTh9W7bW9hrW5QdJ7/sjkWhXgjZeDo=;
 b=i6gHrYcEduKwXv8jKJew5P/uYjANsa8or3aCqdb5fllCHbN2THFMV98JtlJqz9HnUh
 NjuZt10bXDZJ0vMqWBx897XhtIiT3ZIBquBDR1lMiPvz8nc5k4IDj2nRQESNNbNyJHx5
 sFBTsbO3UbNIZ2nH+mCVkNm4lj85TlRAxVJaPkh2QVDFlMLzZqmoJzozAN2mDQVjysyI
 G80+O+nrkrre+Vb+tlqzCClGTjleG8fCT8WgcD5+7EERpUteokHCfCz71flaoeVpEQcW
 uE64Mi5cHhUcRfMmZX/WwTJGMxDM92gOsI8I0e/aLorO6m0ipjUNWByxTbqjML/ot/Lt
 A8Gg==
X-Gm-Message-State: ANhLgQ1TAYbH4wh6EGWi1W0++uT67OoC7zC6g/NsgkDXOWudsGhnSu2F
 tQFbQzrdYs1PiQoJ+ledIaw=
X-Google-Smtp-Source: ADFU+vsat7L/7Gfk8y5GyFslhbIdJGk+PW6PTeKNWUnqJaM0yU0ViSBUAyJCVhNcu9OgyLxDNXDLOA==
X-Received: by 2002:a17:906:2288:: with SMTP id
 p8mr24449349eja.57.1585060462477; 
 Tue, 24 Mar 2020 07:34:22 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id x1sm1149409eju.10.2020.03.24.07.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 07:34:21 -0700 (PDT)
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200318173243.29183-1-paul@xen.org>
 <20200318173243.29183-4-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <302fa455-dda1-9d9f-2276-69306837b804@xen.org>
Date: Tue, 24 Mar 2020 14:34:20 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318173243.29183-4-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v4 3/3] mm: add 'is_special_page' inline
 function...
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/03/2020 17:32, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... to cover xenheap and PGC_extra pages.
> 
> PGC_extra pages are intended to hold data structures that are associated
> with a domain and may be mapped by that domain. They should not be treated
> as 'normal' guest pages (i.e. RAM or page tables). Hence, in many cases
> where code currently tests is_xen_heap_page() it should also check for
> the PGC_extra bit in 'count_info'.
> 
> This patch therefore defines is_special_page() to cover both cases and
> converts tests of is_xen_heap_page() (or open coded tests of PGC_xen_heap)
> to is_special_page() where the page is assigned to a domain.
> 
> Signed-off-by: Paul Durrant <paul@xen.org>
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
Acked-by: Julien Grall <julien@xen.org>

> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Tim Deegan <tim@xen.org>
> 
> v7:
>   - Fixed some uses of is_xen_heap_mfn() that I'd missed
>   - Updated commit comment to point out that only tests on assigned xenheap
>     pages are candidates for conversion
> 
> v6:
>   - Convert open-coded checks of PGC_xen_heap to use is_special_page()
>     where appropriate
> 
> v4:
>   - Use inline function instead of macro
>   - Add missing conversions from is_xen_heap_page()
> 
> v3:
>   - Delete obsolete comment.
> 
> v2:
>   - New in v2
> ---
>   xen/arch/x86/domctl.c           |  2 +-
>   xen/arch/x86/mm.c               | 13 ++++++-------
>   xen/arch/x86/mm/altp2m.c        |  2 +-
>   xen/arch/x86/mm/mem_sharing.c   |  3 +--
>   xen/arch/x86/mm/p2m-pod.c       | 12 +++++++-----
>   xen/arch/x86/mm/p2m.c           |  4 ++--
>   xen/arch/x86/mm/shadow/common.c | 13 ++++++++-----
>   xen/arch/x86/mm/shadow/multi.c  |  3 ++-
>   xen/arch/x86/tboot.c            |  4 ++--
>   xen/include/xen/mm.h            |  5 +++++
>   10 files changed, 35 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index ed86762fa6..add70126b9 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -394,7 +394,7 @@ long arch_do_domctl(
>               page = get_page_from_gfn(d, gfn, &t, P2M_ALLOC);
>   
>               if ( unlikely(!page) ||
> -                 unlikely(is_xen_heap_page(page)) )
> +                 unlikely(is_special_page(page)) )
>               {
>                   if ( unlikely(p2m_is_broken(t)) )
>                       type = XEN_DOMCTL_PFINFO_BROKEN;
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 62507ca651..2fac67ad57 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1014,7 +1014,7 @@ get_page_from_l1e(
>           unsigned long cacheattr = pte_flags_to_cacheattr(l1f);
>           int err;
>   
> -        if ( is_xen_heap_page(page) )
> +        if ( is_special_page(page) )
>           {
>               if ( write )
>                   put_page_type(page);
> @@ -2447,7 +2447,7 @@ static int cleanup_page_mappings(struct page_info *page)
>       {
>           page->count_info &= ~PGC_cacheattr_mask;
>   
> -        BUG_ON(is_xen_heap_page(page));
> +        BUG_ON(is_special_page(page));
>   
>           rc = update_xen_mappings(mfn, 0);
>       }
> @@ -2477,7 +2477,7 @@ static int cleanup_page_mappings(struct page_info *page)
>                   rc = rc2;
>           }
>   
> -        if ( likely(!is_xen_heap_page(page)) )
> +        if ( likely(!is_special_page(page)) )
>           {
>               ASSERT((page->u.inuse.type_info &
>                       (PGT_type_mask | PGT_count_mask)) == PGT_writable_page);
> @@ -4216,8 +4216,7 @@ int steal_page(
>       if ( !(owner = page_get_owner_and_reference(page)) )
>           goto fail;
>   
> -    if ( owner != d || is_xen_heap_page(page) ||
> -         (page->count_info & PGC_extra) )
> +    if ( owner != d || is_special_page(page) )
>           goto fail_put;
>   
>       /*
> @@ -4580,8 +4579,8 @@ int xenmem_add_to_physmap_one(
>       prev_mfn = get_gfn(d, gfn_x(gpfn), &p2mt);
>       if ( mfn_valid(prev_mfn) )
>       {
> -        if ( is_xen_heap_mfn(prev_mfn) )
> -            /* Xen heap frames are simply unhooked from this phys slot. */
> +        if ( is_special_page(mfn_to_page(prev_mfn)) )
> +            /* Special pages are simply unhooked from this phys slot. */
>               rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
>           else
>               /* Normal domain memory is freed, to avoid leaking memory. */
> diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
> index 50768f2547..c091b03ea3 100644
> --- a/xen/arch/x86/mm/altp2m.c
> +++ b/xen/arch/x86/mm/altp2m.c
> @@ -77,7 +77,7 @@ int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn)
>        * pageable() predicate for this, due to it having the same properties
>        * that we want.
>        */
> -    if ( !p2m_is_pageable(p2mt) || is_xen_heap_page(pg) )
> +    if ( !p2m_is_pageable(p2mt) || is_special_page(pg) )
>       {
>           rc = -EINVAL;
>           goto err;
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 3835bc928f..f49f27a3ef 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -840,9 +840,8 @@ static int nominate_page(struct domain *d, gfn_t gfn,
>       if ( !p2m_is_sharable(p2mt) )
>           goto out;
>   
> -    /* Skip xen heap pages */
>       page = mfn_to_page(mfn);
> -    if ( !page || is_xen_heap_page(page) )
> +    if ( !page || is_special_page(page) )
>           goto out;
>   
>       /* Check if there are mem_access/remapped altp2m entries for this page */
> diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
> index 2a7b8c117b..36bc471e7f 100644
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -749,8 +749,9 @@ p2m_pod_zero_check_superpage(struct p2m_domain *p2m, gfn_t gfn)
>   
>           n = 1UL << min(cur_order, SUPERPAGE_ORDER + 0U);
>           for ( k = 0, page = mfn_to_page(mfn); k < n; ++k, ++page )
> -            if ( !(page->count_info & PGC_allocated) ||
> -                 (page->count_info & (PGC_page_table | PGC_xen_heap)) ||
> +            if ( is_special_page(page) ||
> +                 !(page->count_info & PGC_allocated) ||
> +                 (page->count_info & PGC_page_table) ||
>                    (page->count_info & PGC_count_mask) > max_ref )
>                   goto out;
>       }
> @@ -883,11 +884,12 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>           pg = mfn_to_page(mfns[i]);
>   
>           /*
> -         * If this is ram, and not a pagetable or from the xen heap, and
> +         * If this is ram, and not a pagetable or a special page, and
>            * probably not mapped elsewhere, map it; otherwise, skip.
>            */
> -        if ( p2m_is_ram(types[i]) && (pg->count_info & PGC_allocated) &&
> -             !(pg->count_info & (PGC_page_table | PGC_xen_heap)) &&
> +        if ( !is_special_page(pg) && p2m_is_ram(types[i]) &&
> +             (pg->count_info & PGC_allocated) &&
> +             !(pg->count_info & PGC_page_table) &&
>                ((pg->count_info & PGC_count_mask) <= max_ref) )
>               map[i] = map_domain_page(mfns[i]);
>           else
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index 9f51370327..d93c418bcf 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2983,8 +2983,8 @@ int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
>       prev_mfn = get_gfn(tdom, gpfn, &p2mt_prev);
>       if ( mfn_valid(prev_mfn) )
>       {
> -        if ( is_xen_heap_mfn(prev_mfn) )
> -            /* Xen heap frames are simply unhooked from this phys slot */
> +        if ( is_special_page(mfn_to_page(prev_mfn)) )
> +            /* Special pages are simply unhooked from this phys slot */
>               rc = guest_physmap_remove_page(tdom, _gfn(gpfn), prev_mfn, 0);
>           else
>               /* Normal domain memory is freed, to avoid leaking memory. */
> diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
> index 121ddf1255..75dd414a6e 100644
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -2087,19 +2087,22 @@ static int sh_remove_all_mappings(struct domain *d, mfn_t gmfn, gfn_t gfn)
>            * The qemu helper process has an untyped mapping of this dom's RAM
>            * and the HVM restore program takes another.
>            * Also allow one typed refcount for
> -         * - Xen heap pages, to match share_xen_page_with_guest(),
> -         * - ioreq server pages, to match prepare_ring_for_helper().
> +         * - special pages, which are explicitly referenced and mapped by
> +         *   Xen.
> +         * - ioreq server pages, which may be special pages or normal
> +         *   guest pages with an extra reference taken by
> +         *   prepare_ring_for_helper().
>            */
>           if ( !(shadow_mode_external(d)
>                  && (page->count_info & PGC_count_mask) <= 3
>                  && ((page->u.inuse.type_info & PGT_count_mask)
> -                   == (is_xen_heap_page(page) ||
> +                   == (is_special_page(page) ||
>                          (is_hvm_domain(d) && is_ioreq_server_page(d, page))))) )
>               printk(XENLOG_G_ERR "can't find all mappings of mfn %"PRI_mfn
> -                   " (gfn %"PRI_gfn"): c=%lx t=%lx x=%d i=%d\n",
> +                   " (gfn %"PRI_gfn"): c=%lx t=%lx s=%d i=%d\n",
>                      mfn_x(gmfn), gfn_x(gfn),
>                      page->count_info, page->u.inuse.type_info,
> -                   !!is_xen_heap_page(page),
> +                   is_special_page(page),
>                      (is_hvm_domain(d) && is_ioreq_server_page(d, page)));
>       }
>   
> diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
> index b6afc0fba4..f6b1628742 100644
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -559,7 +559,8 @@ _sh_propagate(struct vcpu *v,
>        * caching attributes in the shadows to match what was asked for.
>        */
>       if ( (level == 1) && is_hvm_domain(d) &&
> -         !is_xen_heap_mfn(target_mfn) )
> +         (!mfn_valid(target_mfn) ||
> +          !is_special_page(mfn_to_page(target_mfn))) )
>       {
>           int type;
>   
> diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
> index 8c232270b4..3224d1684b 100644
> --- a/xen/arch/x86/tboot.c
> +++ b/xen/arch/x86/tboot.c
> @@ -189,7 +189,7 @@ static void update_pagetable_mac(vmac_ctx_t *ctx)
>   
>           if ( !mfn_valid(_mfn(mfn)) )
>               continue;
> -        if ( is_page_in_use(page) && !is_xen_heap_page(page) )
> +        if ( is_page_in_use(page) && !is_special_page(page) )
>           {
>               if ( page->count_info & PGC_page_table )
>               {
> @@ -289,7 +289,7 @@ static void tboot_gen_xenheap_integrity(const uint8_t key[TB_KEY_SIZE],
>                                 + 3 * PAGE_SIZE)) )
>               continue; /* skip tboot and its page tables */
>   
> -        if ( is_page_in_use(page) && is_xen_heap_page(page) )
> +        if ( is_page_in_use(page) && is_special_page(page) )
>           {
>               void *pg;
>   
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index a163c201e2..9b62087be1 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -285,6 +285,11 @@ extern struct domain *dom_cow;
>   
>   #include <asm/mm.h>
>   
> +static inline bool is_special_page(const struct page_info *page)
> +{
> +    return is_xen_heap_page(page) || (page->count_info & PGC_extra);
> +}
> +
>   #ifndef page_list_entry
>   struct page_list_head
>   {
> 

-- 
Julien Grall

