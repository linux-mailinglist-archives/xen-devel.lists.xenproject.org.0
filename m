Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17DD5BB0DB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 18:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408070.650767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZDqW-0002HY-Vs; Fri, 16 Sep 2022 16:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408070.650767; Fri, 16 Sep 2022 16:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZDqW-0002Fk-Rq; Fri, 16 Sep 2022 16:05:40 +0000
Received: by outflank-mailman (input) for mailman id 408070;
 Fri, 16 Sep 2022 16:05:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=diiU=ZT=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oZDqU-0002Fe-I2
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 16:05:38 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 666bfe1c-35d9-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 18:05:36 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id g2so13217995qkk.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Sep 2022 09:05:36 -0700 (PDT)
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
X-Inumbo-ID: 666bfe1c-35d9-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gZJ0a6soAAQl4WWq651NOmdveJSbVmqt656874p+6qo=;
        b=TN25tjscCy7e3pHsHGj60SkUD13onWmohKyCwTpUhkWfO00QSShO0OdkDPIaej19HA
         btWUwoxzS83B8eUXlsS6V9Tiz8XvUfGEF6a3sBc5KEMKrCY5MAb+SJBCdjjSc4CPLZyw
         vXQFOCQkrKslXe/ft552744hcU2IPwbcJoXVf9XIEtHEWMhsptU8ZvNa8mmvGI/1FR5K
         y0jCmLxmTLmXMu7AALgChECufOhInEZP4caSI0BRCr9/p3PuHehF1e3e4iX9GMHhUCcV
         afHLBGfqJpD2za93B+6Dp2bfq1R0jPXixoKc9+LNr+uTlvR9RRH6TGDtC8VrkO/nJFdc
         Wvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gZJ0a6soAAQl4WWq651NOmdveJSbVmqt656874p+6qo=;
        b=lbKTCuuX4KqxyRmErKGB1/aGmrGLCzh6am13Jufq3eT8c0t4Ge7GhPVaRXhxilvwWi
         8eE6X4Sy7vx4jQhXCPpOPFfFAUv5gOwaYB8PdBQBZ2qQbm5MSxRhfGvSs4qVD2JehvXi
         5kLnrZ33GE+eF0KJivCz5WpsKgVbX+j2Pob1AcwXb9XqdGoNifMd3XZTrepNjGDYa1gC
         P8fJ3sc8utnx8qDVJVQp08Wq8ziNOvc7CisytEc194HnV5TH+KU35R4qaXPpek9+bL/Q
         Rrx4adac1ZY2yVS2XaWXj/D2h2nikDtUquU4+KpFbdcc1+bZ5lEivO1LCxfLwB1TPUWo
         NeEQ==
X-Gm-Message-State: ACrzQf0TBXQ5aOTiVe2S0FVfadEUqc5Cc23B0E0h99+B0BJOWtXxECo6
	ceMk5lx+VshatjnuBnSzHINlKBmjESoShFf3VN01Ug==
X-Google-Smtp-Source: AMsMyM47cUAiNOd6dwEXCpW6EuGHrM/i55GTPre7Dvdrg3pblF3pipQgpY/NLEioYk7FnpMY00sGXnS6K6oPbKMBDmI=
X-Received: by 2002:a05:620a:957:b0:6cd:ed32:ed2e with SMTP id
 w23-20020a05620a095700b006cded32ed2emr4552565qkw.48.1663344335163; Fri, 16
 Sep 2022 09:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-7-carlo.nonato@minervasys.tech> <32e2a752-975f-baa6-8d6c-ba27cf516c64@suse.com>
In-Reply-To: <32e2a752-975f-baa6-8d6c-ba27cf516c64@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 16 Sep 2022 18:05:24 +0200
Message-ID: <CAG+AhRUJ0+CszWjSzO7=v4SmKtjG7VMpZ8P050s-rLz0rgXJBw@mail.gmail.com>
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Thu, Sep 15, 2022 at 3:13 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 26.08.2022 14:51, Carlo Nonato wrote:
> > This commit adds a new memory page allocator that implements the cache
> > coloring mechanism. The allocation algorithm follows the given color
> > configuration of the domain and maximizes contiguity in the page selection.
> >
> > Pages are stored in a color-indexed data structure of lists, sorted by their
> > machine addresses, that are collectively called the colored heap. A simple
> > initialization function computes the color of any available page and inserts
> > it in the corresponding list. When a domain requests a page, the allocator
> > takes one from the subset of lists whose colors equals the domain
> > configuration. It chooses the page with the highest machine address such that
> > contiguous pages are sequentially allocated, if this is made possible by a
> > color assignment which includes adjacent colors.
> >
> > The allocator can handle only requests with order equals to 0 since the
> > single color granularity is represented in memory by one page.
>
> In the earlier paragraph you talk about contiguous pages using contiguous
> colors. This paragraph then appears to say the opposite, i.e. that
> contiguous multi-page allocations aren't possible. Which of the two is it?

Here there's a little confusion, you're right. Probably it's better explained
in the documentation that comes with this very patch: with a contiguous
colors assignment, we *could* allocate contiguous pages using the "order"
parameter greater than 0, but as a first implementation we simply decided not
to care for such cases and force the order-0 pages only.
However if two order-0 pages are requested subsequently, the allocator tries
to allocate them using different colors so that the cache is used more
efficiently and this is what I meant with "maximizes contiguity".

> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -147,6 +147,18 @@ config MAX_CACHE_COLORS
> >         colors at boot. Note that if, at any time, a color configuration with more
> >         colors than the maximum will be employed an error will be produced.
> >
> > +config BUDDY_ALLOCATOR_SIZE
> > +     string "Buddy allocator reserved memory size" if CACHE_COLORING
> > +     default "64M" if CACHE_COLORING
> > +     default "0M" if !CACHE_COLORING
>
> I don't understand the purpose of this last line, nor the two earlier
> "if". Why not simply
>
> config BUDDY_ALLOCATOR_SIZE
>         string "Buddy allocator reserved memory size"
>         depend on CACHE_COLORING
>         default "64M"

This was just to have a value for the config option even with cache coloring
disabled. All those ifs emulate the "depends on" keyword, but let the
CONFIG_BUDDY_ALLOCATOR_SIZE takes "0M" when coloring is disabled. With just
the "depends on" the macro isn't defined at all. I know that this can be
handled with some simple #ifdef, but I found this way to be more elegant.
Not an expert here so if you prefer the other way or a whole different one
(more readable/better fitted) please let me know.

> ? Also does this really need to be a string, rather than a number (which
> then doesn't need parsing) with e.g. MiB granularity?

Yeah it's easier like you said. I don't think there's a need for a < 1 MiB
value.

> Finally - how much of this is really Arm-specific? Shouldn't this be a
> common config option, perhaps merely restricted to Arm by the top level
> option (CACHE_COLORING?) depending on a further HAS_CACHE_COLORING,
> which only Arm would select?

I'm sorry, but I don't understand your suggestion. BUDDY_ALLOCATOR_SIZE
is Arm specific because CACHE_COLORING is. In fact it depends only on this
last config value and not on Arm config directly. Why should someone limit
the buddy allocator when coloring isn't enabled?
I've lost you on the HAS_CACHE_COLORING. Why should Arm config select this
one? Cache coloring must remain optional. I'm probably missing something.

> > --- a/xen/arch/arm/coloring.c
> > +++ b/xen/arch/arm/coloring.c
> > @@ -300,6 +300,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
> >      config->num_colors = (uint16_t)num;
> >  }
> >
> > +unsigned int page_to_color(struct page_info *pg)
>
> The parameter will want to be pointer-to-const and I wonder whether ...
>
> > +{
> > +    return addr_to_color(page_to_maddr(pg));
> > +}
>
> ... the function as a whole wouldn't be a good candidate for being an
> inline one (requiring addr_to_color() to be available in outside of
> this file, of course).

You mean defining it as static inline in the coloring.h header?

> > --- a/xen/arch/arm/include/asm/mm.h
> > +++ b/xen/arch/arm/include/asm/mm.h
> > @@ -143,6 +143,9 @@ struct page_info
> >  #define PGC_count_width   PG_shift(10)
> >  #define PGC_count_mask    ((1UL<<PGC_count_width)-1)
> >
> > +#define _PGC_colored      PG_shift(11)
> > +#define PGC_colored       PG_mask(1, 11)
>
> I don't think this can work - you can't use bits already covered by
> the count. You'll need to shift up PGC_count_{width,mask} by one and
> insert your bit between PGC_extra and that. Or you could use one of
> the lower unused ones, between PGC_static and PGC_broken.

Yes you're right. I misinterpreted those values. Shame on me.

> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -150,6 +150,9 @@
> >  #define p2m_pod_offline_or_broken_hit(pg) 0
> >  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
> >  #endif
> > +#ifdef CONFIG_CACHE_COLORING
> > +#include <asm/coloring.h>
> > +#endif
> >
> >  #ifndef PGC_static
> >  #define PGC_static 0
> > @@ -231,6 +234,9 @@ static bool __read_mostly scrub_debug;
> >  #define scrub_debug    false
> >  #endif
> >
> > +/* Memory required for buddy allocator to work with colored one */
> > +static unsigned long __initdata buddy_alloc_size;
> > +
> >  /*
> >   * Bit width of the DMA heap -- used to override NUMA-node-first.
> >   * allocation strategy, which can otherwise exhaust low memory.
> > @@ -440,7 +446,172 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
> >      BUG();
> >  }
> >
> > +static DEFINE_SPINLOCK(heap_lock);
> >
> > +/* Initialise fields which have other uses for free pages. */
> > +static void init_free_page_fields(struct page_info *pg)
> > +{
> > +    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
> > +    page_set_owner(pg, NULL);
> > +}
> > +
> > +static bool is_page_colored(struct page_info *pg)
> > +{
> > +    return pg->count_info & PGC_colored;
> > +}
> > +
> > +#ifdef CONFIG_CACHE_COLORING
> > +/*************************
> > + * COLORED SIDE-ALLOCATOR
> > + *
> > + * Pages are stored by their color in separate lists. Each list defines a color
> > + * and it is initialized during end_boot_allocator, where each page's color
> > + * is calculated and the page itself is put in the correct list.
> > + * After initialization there will be N lists where N is the number of maximum
> > + * available colors on the platform.
> > + */
>
> Nit: Perhaps either "maximum number of colors" or "number of available
> colors"?
>
> > +typedef struct page_list_head colored_pages_t;
> > +static colored_pages_t __ro_after_init *color_heap;
>
> Please place the attribute at its canonical slot:
>
> static colored_pages_t *__ro_after_init color_heap;
>
> It applies to the variable, not to the pointed-to type.
>
> > +#define colored_pages(color) &color_heap[(color)]
>
> The parentheses want to move:
>
> #define colored_pages(color) (&color_heap[color])
>
> > +static void color_heap_insert_page(struct page_info *pg)
> > +{
> > +    struct page_info *pos;
> > +    struct page_list_head *head = colored_pages(page_to_color(pg));
> > +
> > +    pg->count_info |= PGC_colored;
>
> The function isn't marked __init, so runtime correctness as to the
> (non-atomic) update here wants clarifying.

Yes. I need to check and probably add a spin lock for the color heap.

> > +    /* Insert page in list in ascending machine address order */
>
> Isn't is descending order that you actually use, also seeing that
> you take the first page of a list when allocating (further down)?

Yes you're right. Forgot to change the comment.

> > +    page_list_for_each( pos, head )
> > +    {
> > +        if ( page_to_maddr(pos) < page_to_maddr(pg) )
> > +        {
> > +            head = &pos->list;
> > +            break;
> > +        }
> > +    }
>
> Wait - a linear search for every single page insertion? How well
> is that going to perform on a multi-terabyte system?

For our test cases (embedded systems) the linear search is good enough.
I agree with you that in the general case this is bad (even though the main
targets are indeed embedded systems).
Are there any already available data structures that we can exploit to get
better performances?

> > +    page_list_add_tail(pg, head);
>
> page_list_head and page_list_entry are generally different things,
> so I'm afraid this isn't correct in the common case, and you're
> getting away with it only because only Arm currently enables this
> code.

So how to insert in the middle of the list?

>
> > +}
> > +
> > +static void color_heap_remove_page(struct page_info *pg)
> > +{
> > +    page_list_del(pg, colored_pages(page_to_color(pg)));
> > +}
> > +
> > +static void __init init_col_heap_pages(struct page_info *pg,
> > +                                       unsigned long nr_pages)
> > +{
> > +    unsigned int i;
> > +
> > +    if ( !color_heap )
> > +    {
> > +        unsigned int max_colors = get_max_colors();
> > +        color_heap = xmalloc_array(colored_pages_t, max_colors);
>
> Nit: Please always have a blank line between declaration(s) and
> statement(s).
>
> > +        BUG_ON(!color_heap);
> > +
> > +        for ( i = 0; i < max_colors; i++ )
> > +            INIT_PAGE_LIST_HEAD(colored_pages(i));
> > +
> > +        if ( !buddy_alloc_size )
> > +            buddy_alloc_size = parse_size_and_unit(CONFIG_BUDDY_ALLOCATOR_SIZE,
> > +                                                   NULL);
> > +    }
> > +
> > +    printk(XENLOG_INFO "Init color heap with %lu pages\n", nr_pages);
> > +    printk(XENLOG_INFO "Paging starting from: 0x%"PRIx64"\n",
> > +           page_to_maddr(pg));
>
> "Paging"? And please prefer %# over 0x% for hex formatting, as we do
> elsewhere.
>
> > +    for ( i = 0; i < nr_pages; i++ )
> > +        color_heap_insert_page(pg++);
> > +}
> > +
> > +/* Alloc one page based on domain color configuration */
> > +static struct page_info *alloc_col_heap_page(unsigned int memflags,
> > +                                             const unsigned int *colors,
> > +                                             unsigned int num_colors)
>
> Array instead of pointer notation would better reflect the purpose.
>
> > +{
> > +    struct page_info *pg = NULL;
> > +    unsigned int i;
> > +    bool need_tlbflush = false;
> > +    uint32_t tlbflush_timestamp = 0;
> > +
> > +    spin_lock(&heap_lock);
> > +
> > +    for ( i = 0; i < num_colors; i++ )
> > +    {
> > +        struct page_info *tmp;
> > +
> > +        if ( page_list_empty(colored_pages(colors[i])) )
> > +            continue;
> > +
> > +        tmp = page_list_first(colored_pages(colors[i]));
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
> > +    pg->count_info = PGC_state_inuse;
>
> Aren't you losing PGC_colored here?

Right. Pretty nasty bug you found.

> > +static struct page_info *alloc_col_domheap_page(struct domain *d,
> > +                                                unsigned int memflags)
> > +{
> > +    struct page_info *pg;
> > +
> > +    ASSERT(!in_irq());
>
> ASSERT_ALLOC_CONTEXT()? Albeit that's redundant then with the sole caller.
>
> > +#else
> > +static void free_col_domheap_page(struct page_info *pg)
> > +{
> > +    return;
> > +}
>
> No need for "return" here.
>
> > @@ -1939,11 +2107,24 @@ void __init end_boot_allocator(void)
> >              break;
> >          }
> >      }
> > -    for ( i = nr_bootmem_regions; i-- > 0; )
> > +
> > +    for ( i = 0; i < nr_bootmem_regions; i++ )
>
> I'm afraid you can't simply go and invert the direction this loop works
> without any justification. It's not even clear why you need to work
> forwards in the colored case.

The order was inverted because I'm assuming bootmem regions are stored in
ascending order (this should be the case looking at bootmem_region_add().
Am I wrong?) and (second assumption) pages taken from each memory region
are sorted in ascending order relatively to their machine address.
This means that color_heap_insert_page() is called (at least during
end_boot_allocator()) with always increasing machine addresses and so the
linear search should be O(1).

> Jan

Thanks.

- Carlo Nonato

