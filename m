Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D5867E161
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 11:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485406.752606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLng-00019G-N9; Fri, 27 Jan 2023 10:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485406.752606; Fri, 27 Jan 2023 10:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLng-000161-JZ; Fri, 27 Jan 2023 10:17:40 +0000
Received: by outflank-mailman (input) for mailman id 485406;
 Fri, 27 Jan 2023 10:17:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oNy1=5Y=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pLLne-00015v-Qz
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 10:17:39 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0992301-9e2b-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 11:17:34 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id gs13so1659312ejc.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 02:17:34 -0800 (PST)
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
X-Inumbo-ID: d0992301-9e2b-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uCXzBVPg1G6s5/AvAdll+PAHsk5kTJigLRFtl/dlAT4=;
        b=FtrBXCp3i+7AZJSaZUXZ6udBZZSrCIMMM0H6jjTp9h1Jc5dTggBurnteypWPsL6EK5
         EwMxkGjn7ruWg7AhLHGM2R5aLZGKa4eYu1o+mmKA6hxdcG1AuDaoyDijN5MvAqhqXRLB
         Ipuzw4Fbt9PF0p/OeHpSDix+p7s0ikqGqeozjJ0d/8sBQAMxLKJ/ILYPB2tGm6smVVp6
         VPeh6RAJXoZtnNnvZlydIW0+U4CUn6UXQAnm88bbKKD6lV/Sbgx4o7EoSgL9nGwKgrmx
         1xkbXqFTIn07f7hCMauKwMuRzMtBTAUq5WGhMtRJC15gvJkKYSP35lRqdzflE7VlGlKP
         +fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCXzBVPg1G6s5/AvAdll+PAHsk5kTJigLRFtl/dlAT4=;
        b=ApGFeSx2GACa5YCLvY4O67STFNPKQ+x7X8cIwz3/67IoMxP6FOmZPjmHa3hezN7kxP
         Tgw5/YTkSOo5r+TbQ1voETaZVeplefPdVUsFxYleyYFXspZhkfjwGEqpMMNAmvXOUruC
         3dOjWm8Y2SJ1YU2u5xB53vEG+TlX7lWBT/RRDODFPKTC7QnCNlyXJp+cDV4m68X3qF+w
         47EeqBYObMItdwH5KGix0BLHU98osbmnMKcpAF6lqW6dGqA8G8a45rJj0+DLYQ7+SOhg
         7EYvFtofk5Fs5m58yMKbNf+S6NcxhhDx+rRUrfC7Q1pYqWU0BWp/ES/8VcZ6TGp1bHQu
         U07Q==
X-Gm-Message-State: AFqh2kqgAjwEpUYJNLgq3nN9LSKSugSCLC7aR5ONz828hzqjorFWHfbJ
	sG1yD0VtiJzZD/I/7QmLjYZ5DUJQ3I+2rNZxSA6odQ==
X-Google-Smtp-Source: AMrXdXufg9iB1rD9C/1JZE0U56JkK2prqmggZzvg6J4MvcM7WwA1TqsmZu0b+XG4DBJcDnHCZ5eqX0EKvAkzplDvZe4=
X-Received: by 2002:a17:907:10d0:b0:84d:49c2:8701 with SMTP id
 rv16-20020a17090710d000b0084d49c28701mr5092702ejb.236.1674814653429; Fri, 27
 Jan 2023 02:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-8-carlo.nonato@minervasys.tech> <21f1e368-5d44-b689-0bb7-164a53e5ffd7@suse.com>
In-Reply-To: <21f1e368-5d44-b689-0bb7-164a53e5ffd7@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 27 Jan 2023 11:17:22 +0100
Message-ID: <CAG+AhRXvKi4HmPoOL7cLToCgOPf3-evvcdvSzYGZ6fLc+mBvtQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] xen: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Luca Miccio <lucmiccio@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Thu, Jan 26, 2023 at 5:29 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.01.2023 16:47, Carlo Nonato wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -299,6 +299,20 @@ can be maintained with the pv-shim mechanism.
> >      cause Xen not to use Indirect Branch Tracking even when support is
> >      available in hardware.
> >
> > +### buddy-alloc-size (arm64)
>
> I can't find where such a command line option would be processed.

Another merge problem... sorry.

> > --- a/xen/arch/arm/include/asm/mm.h
> > +++ b/xen/arch/arm/include/asm/mm.h
> > @@ -128,6 +128,9 @@ struct page_info
> >  #else
> >  #define PGC_static     0
> >  #endif
> > +/* Page is cache colored */
> > +#define _PGC_colored      PG_shift(4)
> > +#define PGC_colored       PG_mask(1, 4)
>
> Is there a reason you don't follow the conditional approach we've taken
> for PGC_static?

Nope, fixed that.

> Thinking of which - what are the planned interactions with the static
> allocator? If the two are exclusive of one another, I guess that would
> need expressing somehow.
>
> > --- a/xen/arch/arm/llc_coloring.c
> > +++ b/xen/arch/arm/llc_coloring.c
> > @@ -33,6 +33,8 @@ static paddr_t __ro_after_init addr_col_mask;
> >  static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
> >  static unsigned int __ro_after_init dom0_num_colors;
> >
> > +#define addr_to_color(addr) (((addr) & addr_col_mask) >> PAGE_SHIFT)
>
> You're shifting right by PAGE_SHIFT here just to ...
>
> > @@ -299,6 +301,16 @@ unsigned int *llc_colors_from_str(const char *str, unsigned int *num_colors)
> >      return colors;
> >  }
> >
> > +unsigned int page_to_llc_color(const struct page_info *pg)
> > +{
> > +    return addr_to_color(page_to_maddr(pg));
>
> ... undo the corresponding left shift in page_to_maddr(). Depending
> on other uses of addr_col_mask it may be worthwhile to either change
> that to or accompany it by a mask to operate on frame numbers.

Yep, this would simplify things probably.

> > @@ -924,6 +929,13 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
> >      }
> >  }
> >
> > +/* Initialise fields which have other uses for free pages. */
> > +static void init_free_page_fields(struct page_info *pg)
> > +{
> > +    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
> > +    page_set_owner(pg, NULL);
> > +}
>
> To limit the size of the functional change, abstracting out this function
> could helpfully be a separate patch (and could then also likely go in ahead
> of time, simplifying things slightly for you as well).
>
> > @@ -1488,7 +1497,7 @@ static void free_heap_pages(
> >              /* Merge with predecessor block? */
> >              if ( !mfn_valid(page_to_mfn(predecessor)) ||
> >                   !page_state_is(predecessor, free) ||
> > -                 (predecessor->count_info & PGC_static) ||
> > +                 (predecessor->count_info & (PGC_static | PGC_colored)) ||
> >                   (PFN_ORDER(predecessor) != order) ||
> >                   (page_to_nid(predecessor) != node) )
> >                  break;
> > @@ -1512,7 +1521,7 @@ static void free_heap_pages(
> >              /* Merge with successor block? */
> >              if ( !mfn_valid(page_to_mfn(successor)) ||
> >                   !page_state_is(successor, free) ||
> > -                 (successor->count_info & PGC_static) ||
> > +                 (successor->count_info & (PGC_static | PGC_colored)) ||
> >                   (PFN_ORDER(successor) != order) ||
> >                   (page_to_nid(successor) != node) )
> >                  break;
>
> This, especially without being mentioned in the description (only in the
> revision log), could likely also be split out (and then also be properly
> justified).

You mean to make it a prereq patch or putting it after this patch?
In the second case it would be like a fix for the previous patch, something
that is to be avoided, right?

> > @@ -1928,6 +1937,182 @@ static unsigned long avail_heap_pages(
> >      return free_pages;
> >  }
> >
> > +#ifdef CONFIG_LLC_COLORING
> > +/*************************
> > + * COLORED SIDE-ALLOCATOR
> > + *
> > + * Pages are grouped by LLC color in lists which are globally referred to as the
> > + * color heap. Lists are populated in end_boot_allocator().
> > + * After initialization there will be N lists where N is the number of
> > + * available colors on the platform.
> > + */
> > +typedef struct page_list_head colored_pages_t;
>
> To me this type rather hides information, so I think I would prefer if
> you dropped it.

Ok.

> > +static colored_pages_t *__ro_after_init _color_heap;
> > +static unsigned long *__ro_after_init free_colored_pages;
> > +
> > +/* Memory required for buddy allocator to work with colored one */
> > +static unsigned long __initdata buddy_alloc_size =
> > +    CONFIG_BUDDY_ALLOCATOR_SIZE << 20;
>
> Please don't open-code MB().
>
> > +#define color_heap(color) (&_color_heap[color])
> > +
> > +static bool is_free_colored_page(struct page_info *page)
>
> const please (and wherever applicable throughout the series)
>
> > +{
> > +    return page && (page->count_info & PGC_state_free) &&
> > +                   (page->count_info & PGC_colored);
> > +}
> > +
> > +/*
> > + * The {free|alloc}_color_heap_page overwrite pg->count_info, but they do it in
> > + * the same way as the buddy allocator corresponding functions do:
> > + * protecting the access with a critical section using heap_lock.
> > + */
>
> I think such a comment would only be useful if you did things differently,
> even if just slightly. And indeed I think you do, e.g. by ORing in
> PGC_colored below (albeit that's still similar to unprepare_staticmem_pages(),
> so perhaps fine without further explanation). Differences are what may need
> commenting on (such that the safety thereof can be judged upon).
>
> > +static void free_color_heap_page(struct page_info *pg)
> > +{
> > +    unsigned int color = page_to_llc_color(pg), nr_colors = get_nr_llc_colors();
> > +    unsigned long pdx = page_to_pdx(pg);
> > +    colored_pages_t *head = color_heap(color);
> > +    struct page_info *prev = pdx >= nr_colors ? pg - nr_colors : NULL;
> > +    struct page_info *next = pdx + nr_colors < FRAMETABLE_NR ? pg + nr_colors
> > +                                                             : NULL;
>
> Are these two calculations safe? At least on x86 parts of frame_table[] may
> not be populated, so de-referencing prev and/or next might fault.

I have to admit I've not taken this into consideration. I'll check that.

> > +    spin_lock(&heap_lock);
> > +
> > +    if ( is_free_colored_page(prev) )
> > +        next = page_list_next(prev, head);
> > +    else if ( !is_free_colored_page(next) )
> > +    {
> > +        /*
> > +         * FIXME: linear search is slow, but also note that the frametable is
> > +         * used to find free pages in the immediate neighborhood of pg in
> > +         * constant time. When freeing contiguous pages, the insert position of
> > +         * most of them is found without the linear search.
> > +         */
> > +        page_list_for_each( next, head )
> > +        {
> > +            if ( page_to_maddr(next) > page_to_maddr(pg) )
> > +                break;
> > +        }
> > +    }
> > +
> > +    mark_page_free(pg, page_to_mfn(pg));
> > +    pg->count_info |= PGC_colored;
> > +    free_colored_pages[color]++;
> > +    page_list_add_prev(pg, next, head);
> > +
> > +    spin_unlock(&heap_lock);
> > +}
>
> There's no scrubbing here at all, and no mention of the lack thereof in
> the description.

This comes from the very first version (which I'm not an author of).
Can you explain to me briefly what is it and if I need it? Or can you give
me pointers?

> > +static void __init init_color_heap_pages(struct page_info *pg,
> > +                                         unsigned long nr_pages)
> > +{
> > +    unsigned int i;
> > +
> > +    if ( buddy_alloc_size )
> > +    {
> > +        unsigned long buddy_pages = min(PFN_DOWN(buddy_alloc_size), nr_pages);
> > +
> > +        init_heap_pages(pg, buddy_pages);
> > +        nr_pages -= buddy_pages;
> > +        buddy_alloc_size -= buddy_pages << PAGE_SHIFT;
> > +        pg += buddy_pages;
> > +    }
>
> I think you want to bail here if nr_pages is now zero, not the least to avoid
> crashing ...
>
> > +    if ( !_color_heap )
> > +    {
> > +        unsigned int nr_colors = get_nr_llc_colors();
> > +
> > +        _color_heap = xmalloc_array(colored_pages_t, nr_colors);
> > +        BUG_ON(!_color_heap);
> > +        free_colored_pages = xzalloc_array(unsigned long, nr_colors);
> > +        BUG_ON(!free_colored_pages);
>
> ... here in case the amount that was freed was really tiny.

Here the array is allocated with nr_colors not nr_pages. nr_colors can't be 0.
And if nr_pages is 0 it just means that all pages went to the buddy. I see no
crash in this case.

> > +        for ( i = 0; i < nr_colors; i++ )
> > +            INIT_PAGE_LIST_HEAD(color_heap(i));
> > +    }
> > +
> > +    printk(XENLOG_DEBUG
> > +           "Init color heap with %lu pages starting from: %#"PRIx64"\n",
> > +           nr_pages, page_to_maddr(pg));
> > +
> > +    for ( i = 0; i < nr_pages; i++ )
> > +        free_color_heap_page(&pg[i]);
> > +}
> > +
> > +static void dump_color_heap(void)
> > +{
> > +    unsigned int color;
> > +
> > +    printk("Dumping color heap info\n");
> > +    for ( color = 0; color < get_nr_llc_colors(); color++ )
> > +        printk("Color heap[%u]: %lu pages\n", color, free_colored_pages[color]);
>
> When there are many colors and most memory is used, you may produce a
> lot of output here for just displaying zeros. May I suggest that you
> log only non-zero values?

Yep.

> > +}
> > +
> > +#else /* !CONFIG_LLC_COLORING */
> > +
> > +static void free_color_heap_page(struct page_info *pg) {}
> > +static void __init init_color_heap_pages(struct page_info *pg,
> > +                                         unsigned long nr_pages) {}
> > +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> > +                                               struct domain *d)
> > +{
> > +    return NULL;
> > +}
> > +static void dump_color_heap(void) {}
>
> As said elsewhere (albeit for a slightly different reason): It may be
> worthwhile to try to omit these stubs and instead expose the normal
> code to the compiler unconditionally, relying on DCE. That'll reduce
> the risk of people breaking the coloring code without noticing, when
> build-testing only other configurations.

Yep.

> > @@ -1936,12 +2121,19 @@ void __init end_boot_allocator(void)
> >      for ( i = 0; i < nr_bootmem_regions; i++ )
> >      {
> >          struct bootmem_region *r = &bootmem_region_list[i];
> > -        if ( (r->s < r->e) &&
> > -             (mfn_to_nid(_mfn(r->s)) == cpu_to_node(0)) )
> > +        if ( r->s < r->e )
> >          {
> > -            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> > -            r->e = r->s;
> > -            break;
> > +            if ( llc_coloring_enabled )
> > +            {
> > +                init_color_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> > +                r->e = r->s;
> > +            }
> > +            else if ( mfn_to_nid(_mfn(r->s)) == cpu_to_node(0) )
> > +            {
> > +                init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> > +                r->e = r->s;
> > +                break;
> > +            }
>
> I think the coloring part here deserves a comment, or else it can easily
> look as if there was a missing "break" (or it was placed in the wrong
> scope). I also think it might help to restructure your change a little,
> both to reduce the diff and to keep indentation bounded:
>
>   if ( r->s >= r->e )
>     continue;
>
>   if ( llc_coloring_enabled )
>     ...
>
> Also please take the opportunity to add the missing blank lines between
> declaration and statements.
>
> > @@ -2332,6 +2524,7 @@ int assign_pages(
> >  {
> >      int rc = 0;
> >      unsigned int i;
> > +    unsigned long allowed_flags = (PGC_extra | PGC_static | PGC_colored);
>
> This is one of the few cases where I think "const" would be helpful even
> on a not-pointed-to type. There's also not really any need for parentheses
> here. As to the name, ...
>
> > @@ -2349,7 +2542,7 @@ int assign_pages(
> >
> >          for ( i = 0; i < nr; i++ )
> >          {
> > -            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
> > +            ASSERT(!(pg[i].count_info & ~allowed_flags));
>
> ... while "allowed" may be fine for this use, it really isn't ...
>
> > @@ -2408,8 +2601,8 @@ int assign_pages(
> >          ASSERT(page_get_owner(&pg[i]) == NULL);
> >          page_set_owner(&pg[i], d);
> >          smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
> > -        pg[i].count_info =
> > -            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
> > +        pg[i].count_info = (pg[i].count_info & allowed_flags) |
> > +                           PGC_allocated | 1;
>
> ... here. Maybe "preserved_flags" (or just "preserved")?
>
> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -299,6 +299,33 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
> >      }
> >      head->tail = page;
> >  }
> > +static inline void
> > +_page_list_add(struct page_info *page, struct page_info *prev,
> > +               struct page_info *next)
> > +{
> > +    page->list.prev = page_to_pdx(prev);
> > +    page->list.next = page_to_pdx(next);
> > +    prev->list.next = page_to_pdx(page);
> > +    next->list.prev = page_to_pdx(page);
> > +}
> > +static inline void
> > +page_list_add_prev(struct page_info *page, struct page_info *next,
> > +                   struct page_list_head *head)
> > +{
> > +    struct page_info *prev;
> > +
> > +    if ( !next )
> > +    {
> > +        page_list_add_tail(page, head);
> > +        return;
> > +    }
>
> !next is ambiguous in its meaning, so a comment towards the intended
> behavior here would be helpful. It could be that the tail insertion is
> necessary behavior, but it also could be that insertion anywhere would
> actually be okay, and tail insertion is merely the variant you ended up
> picking.

This makes it possible to call the function when next has been used to iterate
over a list. If there's no next we are at the end of the list, so add to the
tail. The other way is to handle the case outside this function.

> Then again ...
>
> > +    prev = page_list_prev(next, head);
> > +    if ( !prev )
> > +        page_list_add(page, head);
> > +    else
> > +        _page_list_add(page, prev, next);
> > +}
> >  static inline bool_t
> >  __page_list_del_head(struct page_info *page, struct page_list_head *head,
> >                       struct page_info *next, struct page_info *prev)
> > @@ -451,6 +478,12 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
> >      list_add_tail(&page->list, head);
> >  }
> >  static inline void
> > +page_list_add_prev(struct page_info *page, struct page_info *next,
> > +                   struct page_list_head *head)
> > +{
> > +    list_add_tail(&page->list, &next->list);
>
> ... you don't care about !next here at all?

I did it this way since *page is never checked for NULL as well. Also, this
other type of list isn't NULL terminated.

> Jan

