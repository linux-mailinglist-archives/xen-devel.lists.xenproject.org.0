Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC346A0FE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239336.414834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGeL-0002L7-MG; Mon, 06 Dec 2021 16:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239336.414834; Mon, 06 Dec 2021 16:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGeL-0002JI-Hi; Mon, 06 Dec 2021 16:15:33 +0000
Received: by outflank-mailman (input) for mailman id 239336;
 Mon, 06 Dec 2021 16:15:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dgx3=QX=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1muGeJ-0002J7-Sn
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:15:32 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb3e8e7a-56af-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 17:15:30 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id k23so22033857lje.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Dec 2021 08:15:30 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t5sm1542563lfd.80.2021.12.06.08.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 08:15:29 -0800 (PST)
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
X-Inumbo-ID: bb3e8e7a-56af-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aFt6wJuLTMkarW2MTZg0Cl6fCaMkyk475xCqByUy3Ic=;
        b=aPKpBzugMJ7+mYvHtgX529n7TM0k4idGYbQx6KnQnyIzLe6OCbpJOGvWcs7QyLrI68
         8f+S6v++BBOZ32KF87LImFsG96WbWOdVUD6hFVVgW06Wv5/ZT2Tc1k1GIBOodnMxRL4j
         2t7CW6CqFX1bxP2xT9LRuASSZfwC9y/6IoBXq46+nAe6wRlYQTfnpk/QE0vfGUe/srNJ
         sSUm9pVQaiZk84bbBHAHFZNR+3RDODs5faxYDDgRDN9VeIddSP5MQRhmtDorDEpcTO/Z
         X1/zcsRBRNx4iWuZBxbCaxVmeGStsOfcC7gHF9Xu77cV7eDPXXg8j1RWOkNMFjogrfVF
         BAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aFt6wJuLTMkarW2MTZg0Cl6fCaMkyk475xCqByUy3Ic=;
        b=uMP8GupzWytVzkgnUk48L+7tH9C8wIQVrm+U0wbLafUfCieduuN7aWsin7lgxhQZb3
         9DM3CULaIEOaBKk26ALRoNK8CSdKFXbI35Rw7YyUGX7nKcZImQPJKmUpoBdVM6zt2Xuu
         I5VpHjLLRpXME5N2nUVQtyYR5YPwcDE40ZPZNzJHsBYMOBhbhhdN6EwubZN/NjXMBuP5
         FEx7C9D+kGprVkRqWF7nacGurEQmbxZZUvssXrfJHRYTgd+GcZcu3W7mjxVlMNk0Rw0k
         BX5sm4QKOD/1YlEZgdVvKGSc/RmDGngqhquuACe8ya3Eff+iAv3fB8LlKAAsWunBGC49
         EXmg==
X-Gm-Message-State: AOAM5328JjXqV2nIR1aeKw8f/UKR3s+jwwAJPI0Ri37xlO5+feQ/0tlc
	V0ouTYYmZ0kYNISr7cWGaxQ=
X-Google-Smtp-Source: ABdhPJztnFXATEnoOaL3qLxlj6sPuyseluIBdMTni7Jz4xfAMgSOVBCCD7kE0G10R6auy1SjxUUleA==
X-Received: by 2002:a2e:b0e3:: with SMTP id h3mr36113081ljl.62.1638807329678;
        Mon, 06 Dec 2021 08:15:29 -0800 (PST)
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
From: Oleksandr <olekstysh@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
Message-ID: <930f979b-66d2-c7ca-0be5-3f4afb7f2de2@gmail.com>
Date: Mon, 6 Dec 2021 18:15:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hi Jan


May I please ask, are you OK with the proposed changes?


On 03.12.21 22:33, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Rework Arm implementation to store grant table frame GFN
> in struct page_info directly instead of keeping it in
> standalone status/shared arrays. This patch is based on
> the assumption that grant table page is the xenheap page.
>
> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
> to hold 52-bit/28-bit + extra bit value respectively. In order
> to not grow the size of struct page_info borrow the required
> amount of bits from type_info's count portion which current
> context won't suffer (currently only 1 bit is used on Arm).
> Please note, to minimize code changes and avoid introducing
> an extra #ifdef-s to the header, we keep the same amount of
> bits on both subarches, although the count portion on Arm64
> could be wider, so we waste some bits here.
>
> Introduce corresponding PGT_* constructs and access macros.
> Update existing gnttab macros to deal with GFN value according
> to new location. Also update the use of count portion on Arm
> in share_xen_page_with_guest().
>
> While at it, extend this simplified M2P-like approach for any
> xenheap pages which are proccessed in xenmem_add_to_physmap_one()
> except foreign ones. Update the code to set GFN portion after
> establishing new mapping for the xenheap page in said function
> and to clean GFN portion when putting a reference on that page
> in p2m_put_l3_page().
>
> And for everything to work correctly introduce arch-specific
> macros arch_alloc_(free)xenheap_page to be called from
> alloc_(free)xenheap_pages() respectively, the former's purpose
> on Arm is to clear the GFN portion before use, the latter was
> left dummy for now. On x86 both are just stubs.
>
> This patch is intended to fix the potential issue on Arm
> which might happen when remapping grant-table frame.
> A guest (or the toolstack) will unmap the grant-table frame
> using XENMEM_remove_physmap. This is a generic hypercall,
> so on x86, we are relying on the fact the M2P entry will
> be cleared on removal. For architecture without the M2P,
> the GFN would still be present in the grant frame/status
> array. So on the next call to map the page, we will end up to
> request the P2M to remove whatever mapping was the given GFN.
> This could well be another mapping.
>
> Besides that, this patch simplifies arch code on Arm by
> removing arrays and corresponding management code and
> as the result gnttab_init_arch/gnttab_destroy_arch helpers
> and struct grant_table_arch become useless and can be
> dropped globally.
>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Dear @RISC-V maintainers, please note in current patch I drop arch
> specific gnttab_init(destroy)_arch helpers as unneeded for both Arm and x86.
> Please let me know if you are going to reuse them in the nearest future and
> I will retain them.
>
> You can find the related discussions at:
> https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/
> https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-olekstysh@gmail.com/
> https://lore.kernel.org/xen-devel/1631652245-30746-1-git-send-email-olekstysh@gmail.com/
> https://lore.kernel.org/xen-devel/1632425551-18910-1-git-send-email-olekstysh@gmail.com/
>
> Changes RFC1 -> RFC2:
>   - update patch description
>   - add/update comments in code
>   - clarify check in p2m_put_l3_page()
>   - introduce arch_alloc_xenheap_page() and arch_free_xenheap_page()
>     and drop page_arch_init()
>   - add ASSERT to gnttab_shared_page() and gnttab_status_page()
>   - rework changes to Arm's struct page_info: do not split type_info,
>     allocate GFN portion by reducing count portion, create corresponding
>     PGT_* construct, etc
>   - update page_get_frame_gfn() and page_set_frame_gfn()
>   - update the use of count portion on Arm
>   - drop the leading underscore in the macro parameter names
>
> Changes RFC2 -> RFC3:
>   - update patch description
>   - drop PGT_count_base and MASK_INSR() in share_xen_page_with_guest()
>   - update alloc_xenheap_page() and free_xenheap_page() for SEPARATE_XENHEAP
>     case (Arm32)
>   - provide an extra bit for GFN portion, to get PGT_INVALID_FRAME_GFN
>     one bit more than the maximum number of physical address bits on Arm32
>
> Changes RFC3 -> V4:
>   - rebase on Jan's "gnttab: remove guest_physmap_remove_page() call
>     from gnttab_map_frame()"
>   - finally resolve locking question by recent Julien's suggestion,
>     so drop the RFC tag
>   - update comments in Arm's mm.h/p2m.c to not mention grant table
>   - convert page_set(get)_frame_gfn to static inline func and
>     rename them to page_set(get)_xenheap_gfn()
>   - rename PGT_INVALID_FRAME_GFN to PGT_INVALID_XENHEAP_GFN
>   - add ASSERT(is_xen_heap_page(...)) in page_set(get)_frame_gfn
>   - remove BUG_ON() in arch_free_xenheap_page
>   - remove local type_info in share_xen_page_with_guest()
>   - remove an extra argument p2m in p2m_put_l3_page()
>   - remove #ifdef CONFIG_GRANT_TABLE in p2m_put_l3_page()
>   - also cover real-only pages by using p2m_is_ram instead of a check
>     against p2m_ram_rw in p2m_put_l3_page() and use "else if" construct
>   - call arch_free_xenheap_page() before clearing the PGC_xen_heap in
>     free_xenheap_pages()
>   - remove ASSERT() in gnttab_shared(status)_page and use simpler
>     virt_to_page
>   - remove local pg_ in gnttab_shared(status)_gfn
>   - update patch description to reflect recent changes
> ---
>   xen/arch/arm/mm.c                 | 24 ++++++++++++++--
>   xen/arch/arm/p2m.c                |  7 +++--
>   xen/common/grant_table.c          |  9 ------
>   xen/common/page_alloc.c           | 20 +++++++++++++-
>   xen/include/asm-arm/grant_table.h | 58 ++++++++++++---------------------------
>   xen/include/asm-arm/mm.h          | 39 ++++++++++++++++++++++++--
>   xen/include/asm-x86/grant_table.h |  5 ----
>   xen/include/asm-x86/mm.h          |  4 +++
>   8 files changed, 102 insertions(+), 64 deletions(-)
>
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index eea926d..4f4cab3 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1382,8 +1382,10 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>       spin_lock(&d->page_alloc_lock);
>   
>       /* The incremented type count pins as writable or read-only. */
> -    page->u.inuse.type_info =
> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
> +    page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
> +    page->u.inuse.type_info |= (flags == SHARE_ro ? PGT_none
> +                                                  : PGT_writable_page) |
> +                                MASK_INSR(1, PGT_count_mask);
>   
>       page_set_owner(page, d);
>       smp_wmb(); /* install valid domain ptr before updating refcnt. */
> @@ -1487,7 +1489,23 @@ int xenmem_add_to_physmap_one(
>       }
>   
>       /* Map at new location. */
> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
> +    else
> +    {
> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +        p2m_write_lock(p2m);
> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), INVALID_GFN) )
> +        {
> +            rc = p2m_set_entry(p2m, gfn, 1, mfn, t, p2m->default_access);
> +            if ( !rc )
> +                page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
> +        }
> +        else
> +            rc = -EBUSY;
> +        p2m_write_unlock(p2m);
> +    }
>   
>       /*
>        * For XENMAPSPACE_gmfn_foreign if we failed to add the mapping, we need
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 8b20b43..fd8aff9 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -720,6 +720,8 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
>    */
>   static void p2m_put_l3_page(const lpae_t pte)
>   {
> +    mfn_t mfn = lpae_get_mfn(pte);
> +
>       ASSERT(p2m_is_valid(pte));
>   
>       /*
> @@ -731,11 +733,12 @@ static void p2m_put_l3_page(const lpae_t pte)
>        */
>       if ( p2m_is_foreign(pte.p2m.type) )
>       {
> -        mfn_t mfn = lpae_get_mfn(pte);
> -
>           ASSERT(mfn_valid(mfn));
>           put_page(mfn_to_page(mfn));
>       }
> +    /* Detect the xenheap page and mark the stored GFN as invalid. */
> +    else if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
> +        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
>   }
>   
>   /* Free lpae sub-tree behind an entry */
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 0262f2c..01d7a29 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -94,8 +94,6 @@ struct grant_table {
>   
>       /* Domain to which this struct grant_table belongs. */
>       struct domain *domain;
> -
> -    struct grant_table_arch arch;
>   };
>   
>   unsigned int __read_mostly opt_max_grant_frames = 64;
> @@ -1997,14 +1995,9 @@ int grant_table_init(struct domain *d, int max_grant_frames,
>   
>       grant_write_lock(gt);
>   
> -    ret = gnttab_init_arch(gt);
> -    if ( ret )
> -        goto unlock;
> -
>       /* gnttab_grow_table() allocates a min number of frames, so 0 is okay. */
>       ret = gnttab_grow_table(d, 0);
>   
> - unlock:
>       grant_write_unlock(gt);
>   
>    out:
> @@ -3911,8 +3904,6 @@ grant_table_destroy(
>       if ( t == NULL )
>           return;
>   
> -    gnttab_destroy_arch(t);
> -
>       for ( i = 0; i < nr_grant_frames(t); i++ )
>           free_xenheap_page(t->shared_raw[i]);
>       xfree(t->shared_raw);
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index d0baaa2..2306d9a 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2161,6 +2161,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
>   void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>   {
>       struct page_info *pg;
> +    unsigned int i;
>   
>       ASSERT(!in_irq());
>   
> @@ -2169,6 +2170,9 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>       if ( unlikely(pg == NULL) )
>           return NULL;
>   
> +    for ( i = 0; i < (1u << order); i++ )
> +        arch_alloc_xenheap_page(&pg[i]);
> +
>       memguard_unguard_range(page_to_virt(pg), 1 << (order + PAGE_SHIFT));
>   
>       return page_to_virt(pg);
> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>   
>   void free_xenheap_pages(void *v, unsigned int order)
>   {
> +    struct page_info *pg;
> +    unsigned int i;
> +
>       ASSERT(!in_irq());
>   
>       if ( v == NULL )
>           return;
>   
> +    pg = virt_to_page(v);
> +
>       memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>   
> -    free_heap_pages(virt_to_page(v), order, false);
> +    for ( i = 0; i < (1u << order); i++ )
> +        arch_free_xenheap_page(&pg[i]);
> +
> +    free_heap_pages(pg, order, false);
>   }
>   
>   #else  /* !CONFIG_SEPARATE_XENHEAP */
> @@ -2220,7 +2232,10 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>           return NULL;
>   
>       for ( i = 0; i < (1u << order); i++ )
> +    {
>           pg[i].count_info |= PGC_xen_heap;
> +        arch_alloc_xenheap_page(&pg[i]);
> +    }
>   
>       return page_to_virt(pg);
>   }
> @@ -2238,7 +2253,10 @@ void free_xenheap_pages(void *v, unsigned int order)
>       pg = virt_to_page(v);
>   
>       for ( i = 0; i < (1u << order); i++ )
> +    {
> +        arch_free_xenheap_page(&pg[i]);
>           pg[i].count_info &= ~PGC_xen_heap;
> +    }
>   
>       free_heap_pages(pg, order, true);
>   }
> diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
> index d31a4d6..d6fda31 100644
> --- a/xen/include/asm-arm/grant_table.h
> +++ b/xen/include/asm-arm/grant_table.h
> @@ -11,11 +11,6 @@
>   #define INITIAL_NR_GRANT_FRAMES 1U
>   #define GNTTAB_MAX_VERSION 1
>   
> -struct grant_table_arch {
> -    gfn_t *shared_gfn;
> -    gfn_t *status_gfn;
> -};
> -
>   static inline void gnttab_clear_flags(struct domain *d,
>                                         unsigned int mask, uint16_t *addr)
>   {
> @@ -46,41 +41,12 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>   #define gnttab_dom0_frames()                                             \
>       min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext - _stext))
>   
> -#define gnttab_init_arch(gt)                                             \
> -({                                                                       \
> -    unsigned int ngf_ = (gt)->max_grant_frames;                          \
> -    unsigned int nsf_ = grant_to_status_frames(ngf_);                    \
> -                                                                         \
> -    (gt)->arch.shared_gfn = xmalloc_array(gfn_t, ngf_);                  \
> -    (gt)->arch.status_gfn = xmalloc_array(gfn_t, nsf_);                  \
> -    if ( (gt)->arch.shared_gfn && (gt)->arch.status_gfn )                \
> -    {                                                                    \
> -        while ( ngf_-- )                                                 \
> -            (gt)->arch.shared_gfn[ngf_] = INVALID_GFN;                   \
> -        while ( nsf_-- )                                                 \
> -            (gt)->arch.status_gfn[nsf_] = INVALID_GFN;                   \
> -    }                                                                    \
> -    else                                                                 \
> -        gnttab_destroy_arch(gt);                                         \
> -    (gt)->arch.shared_gfn ? 0 : -ENOMEM;                                 \
> -})
> -
> -#define gnttab_destroy_arch(gt)                                          \
> -    do {                                                                 \
> -        XFREE((gt)->arch.shared_gfn);                                    \
> -        XFREE((gt)->arch.status_gfn);                                    \
> -    } while ( 0 )
> -
>   #define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
>       ({                                                                   \
> -        int rc_ = 0;                                                     \
>           gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
> -        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
> -             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn, mfn,   \
> -                                              0)) == 0 )                 \
> -            ((st) ? (gt)->arch.status_gfn                                \
> -                  : (gt)->arch.shared_gfn)[idx] = (gfn);                 \
> -        rc_;                                                             \
> +        (!gfn_eq(ogfn, INVALID_GFN) && !gfn_eq(ogfn, gfn))               \
> +         ? guest_physmap_remove_page((gt)->domain, ogfn, mfn, 0)         \
> +         : 0;                                                            \
>       })
>   
>   #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
> @@ -88,11 +54,21 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>           : gnttab_shared_gfn(NULL, gt, idx);                              \
>   })
>   
> -#define gnttab_shared_gfn(d, t, i)                                       \
> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
> +#define gnttab_shared_page(t, i) ({                                      \
> +    virt_to_page((t)->shared_raw[i]);                                    \
> +})
> +
> +#define gnttab_status_page(t, i) ({                                      \
> +    virt_to_page((t)->status[i]);                                        \
> +})
>   
> -#define gnttab_status_gfn(d, t, i)                                       \
> -    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
> +#define gnttab_shared_gfn(d, t, i) ({                                    \
> +    page_get_xenheap_gfn(gnttab_shared_page(t, i));                      \
> +})
> +
> +#define gnttab_status_gfn(d, t, i) ({                                    \
> +    page_get_xenheap_gfn(gnttab_status_page(t, i));                      \
> +})
>   
>   #define gnttab_need_iommu_mapping(d)                    \
>       (is_domain_direct_mapped(d) && is_iommu_enabled(d))
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index 7b5e7b7..74b6485 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -98,9 +98,16 @@ struct page_info
>   #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>   #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>   
> - /* Count of uses of this frame as its current type. */
> -#define PGT_count_width   PG_shift(2)
> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
> + /* 2-bit count of uses of this frame as its current type. */
> +#define PGT_count_mask    PG_mask(3, 3)
> +
> +/*
> + * Stored in bits [28:0] or [60:0] GFN if page is xenheap page.
> + */
> +#define PGT_gfn_width     PG_shift(3)
> +#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
> +
> +#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
>   
>    /* Cleared when the owning guest 'frees' this page. */
>   #define _PGC_allocated    PG_shift(1)
> @@ -166,6 +173,32 @@ extern unsigned long xenheap_base_pdx;
>   
>   #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>   
> +static inline gfn_t page_get_xenheap_gfn(struct page_info *p)
> +{
> +    gfn_t gfn_ = _gfn(p->u.inuse.type_info & PGT_gfn_mask);
> +
> +    ASSERT(is_xen_heap_page(p));
> +
> +    return gfn_eq(gfn_, PGT_INVALID_XENHEAP_GFN) ? INVALID_GFN : gfn_;
> +}
> +
> +static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
> +{
> +    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
> +
> +    ASSERT(is_xen_heap_page(p));
> +
> +    p->u.inuse.type_info &= ~PGT_gfn_mask;
> +    p->u.inuse.type_info |= gfn_x(gfn_);
> +}
> +
> +/*
> + * As the struct page_info representing the xenheap page on Arm can contain
> + * the valid GFN we need to clear it beforehand.
> + */
> +#define arch_alloc_xenheap_page(p)   page_set_xenheap_gfn(p, INVALID_GFN)
> +#define arch_free_xenheap_page(p)    do {} while ( 0 )
> +
>   #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>   /* PDX of the first page in the frame table. */
>   extern unsigned long frametable_base_pdx;
> diff --git a/xen/include/asm-x86/grant_table.h b/xen/include/asm-x86/grant_table.h
> index a8a2143..5c23cec 100644
> --- a/xen/include/asm-x86/grant_table.h
> +++ b/xen/include/asm-x86/grant_table.h
> @@ -14,9 +14,6 @@
>   
>   #define INITIAL_NR_GRANT_FRAMES 1U
>   
> -struct grant_table_arch {
> -};
> -
>   static inline int create_grant_host_mapping(uint64_t addr, mfn_t frame,
>                                               unsigned int flags,
>                                               unsigned int cache_flags)
> @@ -35,8 +32,6 @@ static inline int replace_grant_host_mapping(uint64_t addr, mfn_t frame,
>       return replace_grant_pv_mapping(addr, frame, new_addr, flags);
>   }
>   
> -#define gnttab_init_arch(gt) 0
> -#define gnttab_destroy_arch(gt) do {} while ( 0 )
>   #define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
>       (gfn_eq(gfn, INVALID_GFN)                                            \
>        ? guest_physmap_remove_page((gt)->domain,                           \
> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
> index cb90527..3c153c6 100644
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -327,6 +327,10 @@ struct page_info
>   
>   #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>   
> +/* No arch-specific actions are needed for the xenheap page */
> +#define arch_alloc_xenheap_page(p)   do {} while ( 0 )
> +#define arch_free_xenheap_page(p)    do {} while ( 0 )
> +
>   #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>   extern unsigned long max_page;
>   extern unsigned long total_pages;

-- 
Regards,

Oleksandr Tyshchenko


