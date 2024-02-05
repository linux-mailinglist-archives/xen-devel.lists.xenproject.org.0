Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1A849964
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 13:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675980.1051706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWxdE-0007eh-5I; Mon, 05 Feb 2024 11:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675980.1051706; Mon, 05 Feb 2024 11:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWxdE-0007cR-2M; Mon, 05 Feb 2024 11:59:24 +0000
Received: by outflank-mailman (input) for mailman id 675980;
 Mon, 05 Feb 2024 11:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYrN=JO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rWxdC-0007cK-MR
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 11:59:22 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff1ce4ad-c41d-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 12:59:21 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55fe4534e9bso3837359a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 03:59:20 -0800 (PST)
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
X-Inumbo-ID: ff1ce4ad-c41d-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1707134360; x=1707739160; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whbs/pgXCP/L+jODEpOkjDwEFEYoQjVHY2lqzQ/c6g0=;
        b=JMn/lq1yAUHMA/DK7gz0GkFIEqdTZljcgkVtbl+fQQpjUybLAj9ltoFvWqknc3v3sh
         fbG5HNBHEV8hNgxsDucNZS0NyMDeDqMJP46Jtm9vNYK9r2xQTmXjh91q1COYpBaLG6fA
         //9re0VynjnZa4A+hxNZQAezGy0XiMOT6Qy/Mw6+GmeyFtx6urimhnT/4Fn+FU+VhbfZ
         oWtH0zyq1TvJdSNuvZl5F7gmb8517+AT4V8NN8orNUnxyWuQa244sMf57nrMSIRtnYy3
         k9szRJL3VbT4+nG92tMK/F4Fq0nbcywMOb5vJoMua0Fp9niZUySPwg0HAv/jboDUZ5tL
         PZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707134360; x=1707739160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whbs/pgXCP/L+jODEpOkjDwEFEYoQjVHY2lqzQ/c6g0=;
        b=gPW0jlD08rtTGWrU/4o8Ju/Z9fddbkmUmZBf60iERUblMuKVmEURsvvEnCRGlUihuc
         4sxH6TorZ594Mgn8ZtFSC2U9HCm+bF0ZAFX7P9HXVuu0LfK4yBfwb0g3Fs/MBnAXx9aF
         xtiVP5zuASVn0Tj+Buie1+Xm8GJQcalumoijXi/5hgwtEn5VtjsY4IFo9WDmRNA5o57v
         JZoEBpaOlaeQucAOIAkjoc+u+qY2jMQielgL496y+Q78ea3YbqBYetkUo0wLPplpYxka
         2MZQ+t2ATcDu+h53SZCwclOffRpVnhoHsLhTvNpAT+7bMaY0+qMkUouk/9GJugJzb+Q0
         UtKQ==
X-Gm-Message-State: AOJu0Yxluadnpj/7toxMplrUosUn9QAXbI0qlu9JoO3bjjJqcKrK/X8C
	nhq3mcqIjvs1BvWAqnUyJQlmDROFjaQOTlEk7JnUD+MHJ5B8EbHpWgg4b92Mnx2IcD53yi9mIGU
	DBLRvbsIgcUIprDWexWR7Q0aJQnxyTARAYcXnpQ==
X-Google-Smtp-Source: AGHT+IEUJkjdkJpq385u7vLcAxfs0pXhw1DySgWrt+NjPsIIgTFvaydTS+OvChDXX6tQ+rER0y+M9btDG3zd4t17s8I=
X-Received: by 2002:a05:6402:1d01:b0:560:7543:877 with SMTP id
 dg1-20020a0564021d0100b0056075430877mr1206408edb.3.1707134360273; Mon, 05 Feb
 2024 03:59:20 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-11-carlo.nonato@minervasys.tech> <1739dbb4-5d7e-4d84-8d4b-bfb13c4041d8@suse.com>
In-Reply-To: <1739dbb4-5d7e-4d84-8d4b-bfb13c4041d8@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 5 Feb 2024 12:59:09 +0100
Message-ID: <CAG+AhRUJysNCrUXLiu8tvh2d7oL2hNAtkM3A2-Hy73f=+PxkTA@mail.gmail.com>
Subject: Re: [PATCH v6 10/15] xen: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Feb 1, 2024 at 4:53=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 29.01.2024 18:18, Carlo Nonato wrote:
> > @@ -157,7 +158,11 @@
> >  #define PGC_static 0
> >  #endif
> >
> > -#define PGC_preserved (PGC_extra | PGC_static)
> > +#ifndef PGC_colored
> > +#define PGC_colored 0
> > +#endif
> > +
> > +#define PGC_preserved (PGC_extra | PGC_static | PGC_colored)
> >
> >  #ifndef PGT_TYPE_INFO_INITIALIZER
> >  #define PGT_TYPE_INFO_INITIALIZER 0
> > @@ -1504,6 +1509,7 @@ static void free_heap_pages(
> >              if ( !mfn_valid(page_to_mfn(predecessor)) ||
> >                   !page_state_is(predecessor, free) ||
> >                   (predecessor->count_info & PGC_static) ||
> > +                 (predecessor->count_info & PGC_colored) ||
>
> How about a 2nd #define (e.g. PGC_no_buddy_merge) to use here and ...
>
> >                   (PFN_ORDER(predecessor) !=3D order) ||
> >                   (page_to_nid(predecessor) !=3D node) )
> >                  break;
> > @@ -1528,6 +1534,7 @@ static void free_heap_pages(
> >              if ( !mfn_valid(page_to_mfn(successor)) ||
> >                   !page_state_is(successor, free) ||
> >                   (successor->count_info & PGC_static) ||
> > +                 (successor->count_info & PGC_colored) ||
>
> ... here? That'll then also avoid me commenting that I don't see why
> these two PGC_* checks aren't folded.

Yes for me it's ok (I even suggested that in v5). Do you want this change t=
o
be merged with the previous patch? Or should they all belong to this one?

> > @@ -1943,6 +1950,161 @@ static unsigned long avail_heap_pages(
> >      return free_pages;
> >  }
> >
> > +/*************************
> > + * COLORED SIDE-ALLOCATOR
> > + *
> > + * Pages are grouped by LLC color in lists which are globally referred=
 to as the
> > + * color heap. Lists are populated in end_boot_allocator().
> > + * After initialization there will be N lists where N is the number of
> > + * available colors on the platform.
> > + */
> > +static struct page_list_head *__ro_after_init _color_heap;
> > +static unsigned long *__ro_after_init free_colored_pages;
> > +
> > +/* Memory required for buddy allocator to work with colored one */
> > +#ifdef CONFIG_LLC_COLORING
> > +static unsigned long __initdata buddy_alloc_size =3D
> > +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> > +size_param("buddy-alloc-size", buddy_alloc_size);
> > +
> > +#define domain_num_llc_colors(d) (d)->num_llc_colors
> > +#define domain_llc_color(d, i)   (d)->llc_colors[(i)]
>
> Nit: Unnecessary parentheses inside the square brackets.
>
> > +#else
> > +static unsigned long __initdata buddy_alloc_size;
> > +
> > +#define domain_num_llc_colors(d) 0
> > +#define domain_llc_color(d, i)   0
> > +#endif
> > +
> > +#define color_heap(color) (&_color_heap[color])
>
> Wouldn't this better live next to _color_heap()'s definition?
>
> > +static void free_color_heap_page(struct page_info *pg, bool need_scrub=
)
> > +{
> > +    unsigned int color =3D page_to_llc_color(pg);
> > +    struct page_list_head *head =3D color_heap(color);
> > +
> > +    spin_lock(&heap_lock);
> > +
> > +    mark_page_free(pg, page_to_mfn(pg));
> > +
> > +    if ( need_scrub )
> > +    {
> > +        pg->count_info |=3D PGC_need_scrub;
> > +        poison_one_page(pg);
> > +    }
> > +
> > +    pg->count_info |=3D PGC_colored;
>
> The page transiently losing PGC_colored is not an issue then (presumably
> because of holding the heap lock)? Did you consider having mark_page_free=
()
> also use PGC_preserved?

I did something similar to what it's done in unprepare_staticmem_pages():
first mark_page_free() is called and then PGC_static is added to count_info=
.

> > +    free_colored_pages[color]++;
> > +    page_list_add(pg, head);
> > +
> > +    spin_unlock(&heap_lock);
> > +}
> > +
> > +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> > +                                               const struct domain *d)
> > +{
> > +    struct page_info *pg =3D NULL;
> > +    unsigned int i, color =3D 0;
> > +    unsigned long max =3D 0;
> > +    bool need_tlbflush =3D false;
> > +    uint32_t tlbflush_timestamp =3D 0;
> > +    bool scrub =3D !(memflags & MEMF_no_scrub);
> > +
> > +    spin_lock(&heap_lock);
> > +
> > +    for ( i =3D 0; i < domain_num_llc_colors(d); i++ )
> > +    {
> > +        unsigned long free =3D free_colored_pages[domain_llc_color(d, =
i)];
> > +
> > +        if ( free > max )
> > +        {
> > +            color =3D domain_llc_color(d, i);
> > +            pg =3D page_list_first(color_heap(color));
> > +            max =3D free;
> > +        }
> > +    }
>
> The apporach is likely fine at least initially, but: By going from where
> the most free pages are, you're not necessarily evenly distributing a
> domain's pages over the colors it may use, unless the domain uses its
> set of colors exclusively.

We don't find it problematic since the exclusive set of colors are to be
preferred (as per the documentation).

> > +    if ( !pg )
> > +    {
> > +        spin_unlock(&heap_lock);
> > +        return NULL;
> > +    }
> > +
> > +    pg->count_info =3D PGC_state_inuse | PGC_colored |
> > +                     (pg->count_info & PGC_need_scrub);
>
> Isn't PGC_colored already set on the page?

Yes but here I need to make sure that only PGC_state_inuse | PGC_colored ar=
e
used so an assignment seems legit.

> Together with ...
>
> > +    free_colored_pages[color]--;
> > +    page_list_del(pg, color_heap(color));
> > +
> > +    if ( !(memflags & MEMF_no_tlbflush) )
> > +        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
> > +
> > +    init_free_page_fields(pg);
> > +
> > +    spin_unlock(&heap_lock);
> > +
> > +    if ( test_and_clear_bit(_PGC_need_scrub, &pg->count_info) && scrub=
 )
>
> ... this, can't the above be simplified?

I tried to replicate what happens in alloc_heap_pages() where:

>  /* Preserve PGC_need_scrub so we can check it after lock is dropped. */
>  pg[i].count_info =3D PGC_state_inuse | (pg[i].count_info & PGC_need_scru=
b);

and then after the unlock the bit is tested.

> > +        scrub_one_page(pg);
> > +    else if ( scrub )
> > +        check_one_page(pg);
> > +
> > +    if ( need_tlbflush )
> > +        filtered_flush_tlb_mask(tlbflush_timestamp);
> > +
> > +    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
> > +                      !(memflags & MEMF_no_icache_flush));
> > +
> > +    return pg;
> > +}
> > +
> > +static void __init init_color_heap_pages(struct page_info *pg,
> > +                                         unsigned long nr_pages)
> > +{
> > +    unsigned int i;
> > +    bool need_scrub =3D opt_bootscrub =3D=3D BOOTSCRUB_IDLE;
> > +
> > +    if ( buddy_alloc_size )
> > +    {
> > +        unsigned long buddy_pages =3D min(PFN_DOWN(buddy_alloc_size), =
nr_pages);
> > +
> > +        init_heap_pages(pg, buddy_pages);
> > +        nr_pages -=3D buddy_pages;
> > +        buddy_alloc_size -=3D buddy_pages << PAGE_SHIFT;
> > +        pg +=3D buddy_pages;
> > +    }
> > +
> > +    if ( !_color_heap )
> > +    {
> > +        unsigned int max_nr_colors =3D get_max_nr_llc_colors();
> > +
> > +        _color_heap =3D xmalloc_array(struct page_list_head, max_nr_co=
lors);
> > +        free_colored_pages =3D xzalloc_array(unsigned long, max_nr_col=
ors);
> > +        if ( !_color_heap || !free_colored_pages )
> > +            panic("Can't allocate colored heap. Buddy reserved size is=
 too low");
> > +
> > +        for ( i =3D 0; i < max_nr_colors; i++ )
> > +            INIT_PAGE_LIST_HEAD(color_heap(i));
> > +    }
> > +
> > +    if ( nr_pages )
> > +        printk(XENLOG_DEBUG
> > +               "Init color heap with %lu pages, start MFN: %"PRI_mfn"\=
n",
> > +               nr_pages, mfn_x(page_to_mfn(pg)));
>
> This message can be issued more than once. Is that really desirable /
> necessary?

No I can drop it.

> > @@ -2458,7 +2626,14 @@ struct page_info *alloc_domheap_pages(
> >      if ( memflags & MEMF_no_owner )
> >          memflags |=3D MEMF_no_refcount;
> >
> > -    if ( !dma_bitsize )
> > +    /* Only domains are supported for coloring */
> > +    if ( d && llc_coloring_enabled )
> > +    {
> > +        /* Colored allocation must be done on 0 order */
> > +        if ( order || (pg =3D alloc_color_heap_page(memflags, d)) =3D=
=3D NULL )
> > +            return NULL;
> > +    }
>
> I think I had asked before: What about MEMF_node() or MEMF_bits()
> having been used by the caller?

MEMF_node() is used for NUMA, right? I think that for the moment, since cac=
he
coloring is supported only on arm64 and NUMA is not yet supported, it's saf=
e
to ignore it.

I'm not sure I understood what MEMF_bits() is for. It restricts the allocat=
or
to return pages in some range, right?

Thanks.

> Jan

