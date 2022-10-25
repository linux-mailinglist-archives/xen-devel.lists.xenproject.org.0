Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40D760CB94
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 14:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429837.681098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIoc-0001lK-Ha; Tue, 25 Oct 2022 12:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429837.681098; Tue, 25 Oct 2022 12:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIoc-0001jM-Ei; Tue, 25 Oct 2022 12:13:54 +0000
Received: by outflank-mailman (input) for mailman id 429837;
 Tue, 25 Oct 2022 12:13:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6Q6=22=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1onIob-0001jG-GP
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 12:13:53 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7caf34b8-545e-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 14:13:51 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id x2so8633974edd.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 05:13:51 -0700 (PDT)
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
X-Inumbo-ID: 7caf34b8-545e-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XPPVk7/CiDDz5EuHNpbx4V6WjnMH9Y8/ejHf18iThTg=;
        b=zFVJukIwSkogQ4jNt9+kxogaIRxaQU2yVZWe+QB6cfyoekQFKuYu9aDWnK9skwyFAT
         R4+O5luiPoTPr/63rCbG/W3mnbO1X4vbmVSXU6OT7+7dvJ4g8a1d9lkBxVDYqnw0rGAt
         7X4P1G3rqFCnOSwDr+sKsLowDvDVGILm7G3kKps2HCnm1ubDwnaIFIcpTgneUFK7xyH7
         bhOdHdUsVESs5vFmThJZus6H+7e95DyrC6aTknqyjKZpFZwvTp9PaGRivZ/+DJaTNWhZ
         VJtJgHyTEOUeEAYs5ChDpmOKc6p3ePQKrUjkXRnUqbQOCDyGCWidynRvZId675JW8I5B
         LDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPPVk7/CiDDz5EuHNpbx4V6WjnMH9Y8/ejHf18iThTg=;
        b=xwIAZPbeahNQtNKEPeRvc9yubTTMBphsN2NT+MIHNqjm8OYEEsFcSCQyeP6zqVu75g
         E/AiEIXgLh5JD7o+puzsEzaiEl1oX8BDlacEX+OGp3NBSDiMH8fnqVcf4hr+AtrsO8QL
         /y8Y1zRqJj89HX3i5u2o2jkmwO1tXYeR56wvKed8XXj9xwbeVvMhvEHVmU08WH5jCZJ3
         H222tH9Zdn70AMGsEKiOr12RkVD/33vjLZIGHBrWBzLWTO8CrdyUUrUlWo7HETloEage
         +DgHsiECK78bZ3UltXHO1Mm0ll8ftCKXHPw8KDuGpsvR73IHIIvtbMWl5pte39xAA5OV
         8aEw==
X-Gm-Message-State: ACrzQf0IDPZdYKl+9SH2bj8fVMhcWdDQDJJXUHEPERtgD/gVjZ6Jsr8K
	Q4/7ltCox3/hfn4LZXuasHGW9y9V9R9SCqcTxJd94w6j3+c=
X-Google-Smtp-Source: AMsMyM61yH6RbYyNRpDGO7tbdqYCv76+0Nd2gw8NLboC6Ld6KyWTai9UOV8dfKTzks9Oxe22cS12a/CGxLyuhMeXDdw=
X-Received: by 2002:aa7:c78e:0:b0:456:c524:90ec with SMTP id
 n14-20020aa7c78e000000b00456c52490ecmr35569211eds.192.1666700030661; Tue, 25
 Oct 2022 05:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221022160837.8497-1-carlo.nonato@minervasys.tech>
In-Reply-To: <20221022160837.8497-1-carlo.nonato@minervasys.tech>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 25 Oct 2022 14:13:39 +0200
Message-ID: <CAG+AhRX-kSFQvjo=+TygUxoXcn++V3xjKUoMpC1=LDXNJf-WOw@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/common: cache colored buddy allocator for domains
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it, andrea.bastoni@minervasys.tech, 
	lucmiccio@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 6:08 PM Carlo Nonato
<carlo.nonato@minervasys.tech> wrote:
>
> This commit replaces the colored allocator for domains with a simple buddy
> allocator indexed also by colors, so that it can allocate pages based on
> some coloring configuration.
>
> It applies on top of Arm cache coloring (v3) as sent to the mailing list.
>
> This has two benefits:
>  - order can now be greater than 0 if the color config contains a
>    sufficient number of adjacent colors starting from an order aligned
>    one;
>  - same benefits of the normal buddy: constant time alloc and free
>    (constant with respect to the number of pages, not for the number of
>    colors);
>
> But also one "big" cons:
>  - given the way Xen queries the allocator, it can only serve larger pages
>    first and only when a domain runs out of those, it can go with the smaller
>    ones. Let's say that domain 0 has 31 colors out of 32 total (0-30 out of
>    0-31). The order-4 pages (0-15) are allocated first and then the order-3
>    (16-23, since 0-7 and 8-15 are all already allocated), and then order-2
>    and so on. The result is... the domain practically uses only one half of
>    the colors that it should.

In case it isn't clear, less cache colors means less cache given to the
domain which results in lower performances.

> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
>  xen/common/page_alloc.c | 202 ++++++++++++++++++++++++++++------------
>  1 file changed, 141 insertions(+), 61 deletions(-)
>
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index fe214cd6ac..f20de1c891 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -462,67 +462,133 @@ static void init_free_page_fields(struct page_info *pg)
>
>  #ifdef CONFIG_CACHE_COLORING
>  /*************************
> - * COLORED SIDE-ALLOCATOR
> + * COLORED BUDDY ALLOCATOR
>   *
> - * Pages are stored by their color in separate lists. Each list defines a color
> - * and it is initialized during end_boot_allocator, where each page's color
> - * is calculated and the page itself is put in the correct list.
> - * After initialization there will be N lists where N is the number of
> - * available colors on the platform.
> - * The {free|alloc}_color_heap_page overwrite pg->count_info, but they do it in
> - * the same way as the buddy allocator corresponding functions do:
> - * protecting the access with a critical section using heap_lock.
> + * A simplified version of the buddy allocator with the addition of colors to
> + * serve pages based on coloring configuration.
> + * Pages are divided in lists by color and order, so the total space needed
> + * for the heap is greater than the normal one. The matrix of colors x orders
> + * page lists is linearized since not every color can use any order.
>   */
>  typedef struct page_list_head colored_pages_t;
>  static colored_pages_t *__ro_after_init _color_heap;
>  static unsigned long *__ro_after_init free_colored_pages;
> +static unsigned int max_color_order;
>
> -#define color_heap(color) (&_color_heap[color])
> +#define order_mask(order) ((1UL << (order)) - 1)
> +#define color_index_of_order(color, order) ((color) & order_mask(order))
> +#define color_align_to_order(color, order) ((color) & ~order_mask(order))
> +#define color_heap_pos(color, order) \
> +    ((((1 << max_color_order) + (color)) >> (order)) - 1)
> +#define color_heap(color, order) (&_color_heap[color_heap_pos(color, order)])
>
> -static void free_color_heap_page(struct page_info *pg)
> +static void free_color_heap_pages(struct page_info *pg, unsigned int order)
>  {
> -    struct page_info *pos;
> -    unsigned int color = page_to_color(pg);
> -    colored_pages_t *head = color_heap(color);
> +    unsigned int i, color = page_to_color(pg);
> +
> +    ASSERT(color_index_of_order(color, order) == 0);
>
>      spin_lock(&heap_lock);
>
> -    pg->count_info = PGC_state_free | PGC_colored;
> -    page_set_owner(pg, NULL);
> -    free_colored_pages[color]++;
> +    for ( i = 0; i < (1 << order); i++ )
> +    {
> +        pg[i].count_info = PGC_state_free | PGC_colored;
> +        page_set_owner(&pg[i], NULL);
> +        free_colored_pages[page_to_color(&pg[i])]++;
> +    }
>
> -    page_list_for_each( pos, head )
> +    for ( ; order < max_color_order; order++ )
>      {
> -        if ( page_to_maddr(pos) < page_to_maddr(pg) )
> +        unsigned long mask = 1UL << order;
> +        struct page_info *merge = pg + ((color & mask) ? -mask : mask);
> +
> +        if ( !page_state_is(merge, free) || (PFN_ORDER(merge) != order) )
>              break;
> +
> +        if ( color & mask )
> +        {
> +            pg = merge;
> +            color -= mask;
> +        }
> +
> +        page_list_del(merge, color_heap(color, order));
>      }
>
> -    page_list_add_next(pg, pos, head);
> +    PFN_ORDER(pg) = order;
> +    page_list_add(pg, color_heap(color, order));
>
>      spin_unlock(&heap_lock);
>  }
>
> -static struct page_info *alloc_color_heap_page(unsigned int memflags,
> -                                               const unsigned int *colors,
> -                                               unsigned int num_colors)
> +static struct page_info *find_free_color_heap_page(unsigned int color,
> +                                                   unsigned int order)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned int buddy_order, buddy_color;
> +
> +    ASSERT(color_index_of_order(color, order) == 0);
> +
> +    for ( buddy_order = order; buddy_order <= max_color_order; buddy_order++ )
> +    {
> +        pg = page_list_remove_head(color_heap(
> +            color_align_to_order(color, buddy_order), buddy_order));
> +        if ( pg )
> +            break;
> +    }
> +
> +    if ( !pg )
> +        return NULL;
> +
> +    buddy_color = page_to_color(pg);
> +
> +    while ( buddy_order != order )
> +    {
> +        unsigned long mask = (1U << --buddy_order);
> +        struct page_info *half = pg + mask;
> +
> +        if ( color & mask )
> +        {
> +            page_list_add(pg, color_heap(buddy_color, buddy_order));
> +            pg = half;
> +            buddy_color += mask;
> +        }
> +        else
> +            page_list_add(half, color_heap(buddy_color + mask, buddy_order));
> +    }
> +
> +    return pg;
> +}
> +
> +static struct page_info *alloc_color_heap_pages(unsigned int order,
> +                                                unsigned int memflags,
> +                                                unsigned int *colors,
> +                                                unsigned int num_colors)
>  {
>      struct page_info *pg = NULL;
> -    unsigned int i, color;
> +    unsigned int i, color = 0;
> +    unsigned long mask = order_mask(order);
>      bool need_tlbflush = false;
>      uint32_t tlbflush_timestamp = 0;
> +    mfn_t mfn;
>
>      spin_lock(&heap_lock);
>
> +    /* Search for 2^order contiguous colors */
>      for ( i = 0; i < num_colors; i++ )
>      {
> -        struct page_info *tmp;
> +        unsigned int index = colors[i] & mask;
> +
> +        if ( index == 0 )
> +            color = colors[i];
>
> -        if ( page_list_empty(color_heap(colors[i])) )
> +        if ( colors[i] != color )
>              continue;
>
> -        tmp = page_list_first(color_heap(colors[i]));
> -        if ( !pg || page_to_maddr(tmp) > page_to_maddr(pg) )
> -            pg = tmp;
> +        if ( index == mask &&
> +             (pg = find_free_color_heap_page(colors[i] & ~mask, order)) )
> +            break;
> +
> +        color++;
>      }
>
>      if ( !pg )
> @@ -531,59 +597,77 @@ static struct page_info *alloc_color_heap_page(unsigned int memflags,
>          return NULL;
>      }
>
> -    pg->count_info = PGC_state_inuse | PGC_colored;
> -
> -    if ( !(memflags & MEMF_no_tlbflush) )
> -        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
> +    for ( i = 0; i < (1 << order); i++ )
> +    {
> +        pg[i].count_info = PGC_state_inuse | PGC_colored;
>
> -    init_free_page_fields(pg);
> -    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
> -                      !(memflags & MEMF_no_icache_flush));
> +        if ( !(memflags & MEMF_no_tlbflush) )
> +            accumulate_tlbflush(&need_tlbflush, &pg[i], &tlbflush_timestamp);
>
> -    color = page_to_color(pg);
> -    free_colored_pages[color]--;
> -    page_list_del(pg, color_heap(color));
> +        init_free_page_fields(&pg[i]);
> +        free_colored_pages[page_to_color(&pg[i])]--;
> +    }
>
>      spin_unlock(&heap_lock);
>
>      if ( need_tlbflush )
>          filtered_flush_tlb_mask(tlbflush_timestamp);
>
> +    mfn = page_to_mfn(pg);
> +    for ( i = 0; i < (1U << order); i++ )
> +        flush_page_to_ram(mfn_x(mfn) + i, !(memflags & MEMF_no_icache_flush));
> +
>      return pg;
>  }
>
>  static void __init init_color_heap_pages(struct page_info *pg,
>                                           unsigned long nr_pages)
>  {
> -    unsigned int i;
> +    unsigned long s, e;
>
>      if ( !_color_heap )
>      {
>          unsigned int max_colors = get_max_colors();
> +        unsigned int color_heap_num = (2 * max_colors) - 1;
> +        unsigned int i;
>
> -        _color_heap = xmalloc_array(colored_pages_t, max_colors);
> +        max_color_order = flsl(max_colors) - 1;
> +
> +        _color_heap = xmalloc_array(colored_pages_t, color_heap_num);
>          BUG_ON(!_color_heap);
>          free_colored_pages = xzalloc_array(unsigned long, max_colors);
>          BUG_ON(!free_colored_pages);
> -
> -        for ( i = 0; i < max_colors; i++ )
> -            INIT_PAGE_LIST_HEAD(color_heap(i));
> +        for ( i = 0; i < color_heap_num; i++ )
> +            INIT_PAGE_LIST_HEAD(&_color_heap[i]);
>      }
>
>      printk(XENLOG_DEBUG
>             "Init color heap with %lu pages starting from: %#"PRIx64"\n",
>             nr_pages, page_to_maddr(pg));
>
> -    for ( i = 0; i < nr_pages; i++ )
> -        free_color_heap_page(&pg[i]);
> +    s = mfn_x(page_to_mfn(pg));
> +    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
> +
> +    while ( s < e )
> +    {
> +        unsigned int inc_order = min_t(unsigned int, max_color_order,
> +                                       flsl(e - s) - 1);
> +
> +        if ( s )
> +            inc_order = min(inc_order, ffsl(s) - 1U);
> +        free_color_heap_pages(mfn_to_page(_mfn(s)), inc_order);
> +        s += (1UL << inc_order);
> +    }
>  }
>
> -static struct page_info *alloc_color_domheap_page(struct domain *d,
> -                                                  unsigned int memflags)
> +static struct page_info *alloc_color_domheap_pages(struct domain *d,
> +                                                   unsigned int order,
> +                                                   unsigned int memflags)
>  {
>      struct page_info *pg;
>
> -    pg = alloc_color_heap_page(memflags, d->arch.colors, d->arch.num_colors);
> +    pg = alloc_color_heap_pages(order, memflags, d->arch.colors,
> +                                d->arch.num_colors);
>      if ( !pg )
>          return NULL;
>
> @@ -591,9 +675,9 @@ static struct page_info *alloc_color_domheap_page(struct domain *d,
>      {
>          if ( memflags & MEMF_no_refcount )
>              pg->count_info |= PGC_extra;
> -        if ( assign_page(pg, 0, d, memflags) )
> +        if ( assign_page(pg, order, d, memflags) )
>          {
> -            free_color_heap_page(pg);
> +            free_color_heap_pages(pg, order);
>              return NULL;
>          }
>      }
> @@ -616,12 +700,13 @@ integer_param("buddy-alloc-size", buddy_alloc_size);
>
>  static void __init init_color_heap_pages(struct page_info *pg,
>                                           unsigned long nr_pages) {}
> -static struct page_info *alloc_color_domheap_page(struct domain *d,
> -                                                  unsigned int memflags)
> +static struct page_info *alloc_color_domheap_pages(struct domain *d,
> +                                                   unsigned int order,
> +                                                   unsigned int memflags)
>  {
>      return NULL;
>  }
> -static void free_color_heap_page(struct page_info *pg) {}
> +static void free_color_heap_pages(struct page_info *pg, unsigned int order) {}
>  static void dump_color_heap(void) {}
>
>  #endif /* CONFIG_CACHE_COLORING */
> @@ -2637,12 +2722,7 @@ struct page_info *alloc_domheap_pages(
>
>      /* Only domains are supported for coloring */
>      if ( IS_ENABLED(CONFIG_CACHE_COLORING) && d )
> -    {
> -        /* Colored allocation must be done on 0 order */
> -        if ( order )
> -            return NULL;
> -        return alloc_color_domheap_page(d, memflags);
> -    }
> +        return alloc_color_domheap_pages(d, order, memflags);
>
>      bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
>                                        bits ? : (BITS_PER_LONG+PAGE_SHIFT));
> @@ -2762,7 +2842,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>          }
>
>          if ( pg->count_info & PGC_colored )
> -            free_color_heap_page(pg);
> +            free_color_heap_pages(pg, order);
>          else
>              free_heap_pages(pg, order, scrub);
>      }
> --
> 2.34.1
>

