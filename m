Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198362837D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 16:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443386.697933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oub1K-0006FF-0g; Mon, 14 Nov 2022 15:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443386.697933; Mon, 14 Nov 2022 15:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oub1J-0006Bn-Tn; Mon, 14 Nov 2022 15:05:09 +0000
Received: by outflank-mailman (input) for mailman id 443386;
 Mon, 14 Nov 2022 15:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ws5r=3O=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oub1H-0006Bh-K2
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 15:05:07 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b26b6d67-642d-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 16:04:55 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id f7so17739596edc.6
 for <xen-devel@lists.xenproject.org>; Mon, 14 Nov 2022 07:05:05 -0800 (PST)
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
X-Inumbo-ID: b26b6d67-642d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dT0DldhRQ1Rv2uvTCiK9GiQ3pfOMhNFKBi3Sli3lCEI=;
        b=oSUQZrv9hzfsoOUyzseFH/14zyaRLNg5wZqjx2R4YYXyhtTZqNqKWRLZnCebDESS1P
         sFiiNDjS/3GGGQoLFerTk9HlG73s6YRae6qNkzGtkvNnK4uQnOT/lSgazrw1mrBMFbNg
         iLB9E7N336YTkkCQUbQefZN4ni5G4GzwGwv/H2A6btAllY8VUif7gO9MM2J5dbwsPi5N
         1uC4DGOtUYaL7XVAxtaKNAHGDIzLDXUyKtYr2GDIm8qDplPVqcEm7fRtoj4tq7EaieFK
         l6nssqVwco+WyNf04zmHkVT0SQteeV6g9le5YLJtRKMWsAoUIdgXxt3y7K2Oqw/97YU8
         rFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dT0DldhRQ1Rv2uvTCiK9GiQ3pfOMhNFKBi3Sli3lCEI=;
        b=iAYf+cIsR5EgHDD3Xxad774VUqofzqY0FSYzVVQeuM29mKMKFtze2Kz9HCvx8oY0SS
         M2bIPtTRdR31QxscQJ9mKoG8LGRf3aP7dju4/++Xuh2ph2K91epNRQMM/9i3j7cYsU/S
         GADlchrAr4puoPEPUCfG1RpnMhk4cfbhf3pnOGHeNdurg84W8oy+vU5K2/wh7+e122cI
         6uasm+ZqjhGkuIUqwlZ5u5vGft9Kh0Fwsdar3A06gV0GWsvmrav/H4cS8x9pc4GfMNEF
         XPE0WT1DQPtK/mBXVgDNZk0/T5Vt/HYoxUfNv8DG9A5B91zVC+17ggh5/USdu2QH2Hjx
         z3MQ==
X-Gm-Message-State: ANoB5pk/0EEFTqfZfHvK5xhkdmXT86JCP88eTQOnBNiioVveLFzQj2lb
	NNckbd7HOz3Y3H27ccdfwikqabWMcFn6SF6eEqNU8w==
X-Google-Smtp-Source: AA0mqf44Yuq4D3K2d4jhT85UGH/dYLFM7bhtooOP18p5Pa89Wa77QMDwrfAzqJ2imCQav1H03TjykFIiINnfjJqn67U=
X-Received: by 2002:aa7:d6cb:0:b0:467:e2dd:b593 with SMTP id
 x11-20020aa7d6cb000000b00467e2ddb593mr3721870edr.378.1668438305197; Mon, 14
 Nov 2022 07:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-7-carlo.nonato@minervasys.tech> <d7ecb1c6-4340-f44f-4f5e-f74236b900f3@suse.com>
In-Reply-To: <d7ecb1c6-4340-f44f-4f5e-f74236b900f3@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 14 Nov 2022 16:04:51 +0100
Message-ID: <CAG+AhRXeuNeLEWArZ+7b+=jZgLSs2LLL2nEt+jwyQZVOorqxkg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/common: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: marco.solieri@unimore.it, andrea.bastoni@minervasys.tech, 
	lucmiccio@gmail.com, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Thu, Nov 10, 2022 at 5:47 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 22.10.2022 17:51, Carlo Nonato wrote:
> > --- a/xen/arch/arm/p2m.c
> > +++ b/xen/arch/arm/p2m.c
> > @@ -661,7 +661,12 @@ static int p2m_create_table(struct p2m_domain *p2m, lpae_t *entry)
> >
> >      ASSERT(!p2m_is_valid(*entry));
> >
> > -    page = alloc_domheap_page(NULL, 0);
> > +    /* If cache coloring is enabled, p2m tables are allocated using the domain
> > +     * coloring configuration to prevent cache interference. */
> > +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> > +        page = alloc_domheap_page(p2m->domain, MEMF_no_refcount);
>
> Are you sure you don't mean MEMF_no_owner (which implies MEMF_no_refcount)
> here? And then ...

Yes. I've already fixed it in the v4 that I'm working on right now.

> > +    else
> > +        page = alloc_domheap_page(NULL, 0);
>
> ... is it really necessary to keep the two cases separate?

Not sure. I don't know the reason behind the original code.

> Also nit: Comment style.
>
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -150,6 +150,9 @@
> >  #define p2m_pod_offline_or_broken_hit(pg) 0
> >  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
> >  #endif
> > +#ifdef CONFIG_HAS_CACHE_COLORING
> > +#include <asm/coloring.h>
> > +#endif
> >
> >  #ifndef PGC_static
> >  #define PGC_static 0
> > @@ -231,6 +234,14 @@ static bool __read_mostly scrub_debug;
> >  #define scrub_debug    false
> >  #endif
> >
> > +/* Memory required for buddy allocator to work with colored one */
> > +#ifdef CONFIG_BUDDY_ALLOCATOR_SIZE
> > +static unsigned long __initdata buddy_alloc_size =
> > +    CONFIG_BUDDY_ALLOCATOR_SIZE << 20;
> > +#else
> > +    static unsigned long __initdata buddy_alloc_size = 0;
>
> Nit: Bogus indentation. I wonder anyway whether if wouldn't better
> be
>
> static unsigned long __initdata buddy_alloc_size =
> #ifdef CONFIG_BUDDY_ALLOCATOR_SIZE
>     CONFIG_BUDDY_ALLOCATOR_SIZE << 20;
> #else
>     0;
> #endif
>
> or
>
> static unsigned long __initdata buddy_alloc_size
> #ifdef CONFIG_BUDDY_ALLOCATOR_SIZE
>     = CONFIG_BUDDY_ALLOCATOR_SIZE << 20
> #endif
>     ;
>
> > +static void free_color_heap_page(struct page_info *pg)
> > +{
> > +    struct page_info *pos;
> > +    unsigned int color = page_to_color(pg);
> > +    colored_pages_t *head = color_heap(color);
> > +
> > +    spin_lock(&heap_lock);
> > +
> > +    pg->count_info = PGC_state_free | PGC_colored;
> > +    page_set_owner(pg, NULL);
> > +    free_colored_pages[color]++;
> > +
> > +    page_list_for_each( pos, head )
> > +    {
> > +        if ( page_to_maddr(pos) < page_to_maddr(pg) )
> > +            break;
> > +    }
>
> I continue to view such loops as problematic. With them in place I don't
> think this feature can move to being (security) supported, so I think this
> and similar places want annotating with a FIXME or alike comment.

So I have another change for that but I don't think it solves much.
I've turned free_color_heap_page() into free_color_heap_pages() to free more
pages with a single call. By doing so I can do the linear search once for
each color: after finding the right insert position, all the pages that
share the same color can be inserted one after the other. This should
speed up the init phase, but it doesn't solve the domain destroy phase where
pages are freed one by one.

> > +    page_list_add_next(pg, pos, head);
> >
> > +    spin_unlock(&heap_lock);
> > +}
> > +
> > +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> > +                                               const unsigned int *colors,
> > +                                               unsigned int num_colors)
> > +{
> > +    struct page_info *pg = NULL;
> > +    unsigned int i, color;
> > +    bool need_tlbflush = false;
> > +    uint32_t tlbflush_timestamp = 0;
> > +
> > +    spin_lock(&heap_lock);
> > +
> > +    for ( i = 0; i < num_colors; i++ )
> > +    {
> > +        struct page_info *tmp;
> > +
> > +        if ( page_list_empty(color_heap(colors[i])) )
> > +            continue;
> > +
> > +        tmp = page_list_first(color_heap(colors[i]));
> > +        if ( !pg || page_to_maddr(tmp) > page_to_maddr(pg) )
> > +            pg = tmp;
> > +    }
> > +
> > +    if ( !pg )
> > +    {
> > +        spin_unlock(&heap_lock);
> > +        return NULL;
> > +    }
> > +
> > +    pg->count_info = PGC_state_inuse | PGC_colored;
> > +
> > +    if ( !(memflags & MEMF_no_tlbflush) )
> > +        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
> > +
> > +    init_free_page_fields(pg);
> > +    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
> > +                      !(memflags & MEMF_no_icache_flush));
> > +
> > +    color = page_to_color(pg);
>
> You don't really need to retrieve the color here, do you? You could as
> well latch it in the loop above.

Yes.

> > +static void dump_color_heap(void)
> > +{
> > +    unsigned int color;
> > +
> > +    printk("Dumping coloring heap info\n");
> > +    for ( color = 0; color < get_max_colors(); color++ )
> > +        printk("Color heap[%u]: %lu pages\n", color, free_colored_pages[color]);
> > +}
> > +
> > +integer_param("buddy-alloc-size", buddy_alloc_size);
>
> This would preferably live next to the variable it controls, e.g. (taking
> the earlier comment into account)
>
> static unsigned long __initdata buddy_alloc_size =
> #ifdef CONFIG_CACHE_COLORING
>     CONFIG_BUDDY_ALLOCATOR_SIZE << 20;
> integer_param("buddy-alloc-size", buddy_alloc_size);
> #else
>     0;
> #endif
>
> (Assuming buddy_alloc_size is indeed used anywhere outside any #ifdef
> CONFIG_CACHE_COLORING in the first place.)
>
> > @@ -1926,24 +2106,49 @@ static unsigned long avail_heap_pages(
> >  void __init end_boot_allocator(void)
> >  {
> >      unsigned int i;
> > +    unsigned long buddy_pages;
> >
> > -    /* Pages that are free now go to the domain sub-allocator. */
> > -    for ( i = 0; i < nr_bootmem_regions; i++ )
> > +    buddy_pages = PFN_DOWN(buddy_alloc_size);
>
> Any reason this can't be the initializer of the variable?

Nope. The end_boot_allocator() changes are a bit messy. In v4 I'm doing
things more nicely, moving everything in init_color_heap_pages().

> > +    if ( !IS_ENABLED(CONFIG_CACHE_COLORING) )
> >      {
> > -        struct bootmem_region *r = &bootmem_region_list[i];
> > -        if ( (r->s < r->e) &&
> > -             (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
> > +        /* Pages that are free now go to the domain sub-allocator. */
> > +        for ( i = 0; i < nr_bootmem_regions; i++ )
> >          {
> > -            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> > -            r->e = r->s;
> > -            break;
> > +            struct bootmem_region *r = &bootmem_region_list[i];
> > +            if ( (r->s < r->e) &&
>
> Even if you're only re-indenting the original code (which personally I'd
> prefer if it was avoided), please add the missing blank line between
> declaration and statement here.
>
> > +                (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
> > +            {
> > +                init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> > +                r->e = r->s;
> > +                break;
> > +            }
> >          }
> >      }
> > +
> >      for ( i = nr_bootmem_regions; i-- > 0; )
> >      {
> > -        struct bootmem_region *r = &bootmem_region_list[i];
> > +        struct bootmem_region *r;
> > +
> > +        if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> > +            r = &bootmem_region_list[nr_bootmem_regions - i - 1];
>
> If you want to handle things low-to-high, why don't you alter the
> earlier loop rather than skipping (and re-indenting) it?

Yes, you're right.

> However,
> considering that in alloc_color_heap_page() you prefer pages at
> higher addresses, I continue to find it odd that here you want to
> process low address pages first.

It doesn't matter if alloc_color_heap_page() returns higher or lower
addresses. The important thing is to create a sorted list so that min or
max are easily found. Having a sorted list means that it's easier to insert
pages if their addresses are always increasing or always decreasing, so that
starting either from the head or from the tail, the position where to insert
is found in O(1). If regions are processed high-to-low but pages of each
region are instead low-to-high, the always-decreasing/always-increasing
property doesn't hold anymore and the linear search needs to be repeated
multiple times. This problem can be solved in many ways and doing
everything low-to-high is one solution.

> > +        else
> > +            r = &bootmem_region_list[i];
> > +
> > +        if ( buddy_pages && (r->s < r->e) )
> > +        {
> > +            unsigned long pages = MIN(r->e - r->s, buddy_pages);
> > +            init_heap_pages(mfn_to_page(_mfn(r->s)), pages);
>
> Nit: Blank line between declaration(s) and statement(s) please. Also:
> Any reason the type-safe min() cannot be used here?

Not really. I've changed it.

> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -297,6 +297,37 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
> >      }
> >      head->tail = page;
> >  }
> > +static inline void
> > +_page_list_add(struct page_info *new, struct page_info *prev,
> > +               struct page_info *next)
> > +{
> > +    new->list.prev = page_to_pdx(prev);
> > +     new->list.next = page_to_pdx(next);
> > +     prev->list.next = page_to_pdx(new);
> > +     next->list.prev = page_to_pdx(new);
>
> Nit: Several hard tabs here, and ...
>
> > +}
> > +static inline void
> > +page_list_add_next(struct page_info *new, struct page_info *prev,
> > +                   struct page_list_head *head)
> > +{
> > +     struct page_info *next = page_list_next(prev, head);
>
> ... one more here (and at least one more further down).

Sorry, I don't really know how I've added those since my editor only uses
spaces...

> Afaict you're passing a NULL "pos" in here from free_color_heap_page()
> if the list was previously empty and page lists aren't simply "normal"
> (xen/list.h) lists. I don't consider it valid to call page_list_next()
> with a NULL first argument, even if it looks as if this would work
> right now as long as the list is empty (but I think we'd see a NULL
> prev here also if all other pages looked at by free_color_heap_page()
> are at lower addresses). So perhaps ...
>
> > +    if ( !next )
> > +        page_list_add_tail(new, head);
> > +    else
> > +        _page_list_add(new, prev, next);
>
>     if ( !prev )
>         page_list_add_tail(new, head);
>     else
>         _page_list_add(new, prev, page_list_next(prev, head));
>
> ?

Note: I was wrongly calling page_list_add_next() while I'm inserting a
predecessor instead. Anyway, yes, you're right about the fact that both next and
prev need to be checked since both can be NULL. This is my last version of
page_list_add_prev().

static inline void
page_list_add_prev(struct page_info *page, struct page_info *next,
                   struct page_list_head *head)
{
    struct page_info *prev;

    if ( !next )
    {
        page_list_add_tail(page, head);
        return;
    }

    prev = page_list_prev(next, head);
    if ( !prev )
        page_list_add(page, head);
    else
        _page_list_add(page, prev, next);
}

> > +}
> > +static inline void
> > +page_list_add_prev(struct page_info *new, struct page_info *next,
> > +                   struct page_list_head *head)
> > +{
> > +     struct page_info *prev = page_list_prev(next, head);
> > +
> > +    if ( !prev )
> > +        page_list_add(new, head);
> > +    else
> > +        _page_list_add(new, prev, next);
> > +}
>
> This function looks to not be used anywhere.

Yes. I've added it only for completeness. I'm gonna drop it.

> Jan

Thanks.

- Carlo Nonato

