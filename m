Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825B4885C0E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 16:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696450.1087403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKT6-0001Ho-CM; Thu, 21 Mar 2024 15:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696450.1087403; Thu, 21 Mar 2024 15:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKT6-0001GY-8n; Thu, 21 Mar 2024 15:36:36 +0000
Received: by outflank-mailman (input) for mailman id 696450;
 Thu, 21 Mar 2024 15:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xA2=K3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rnKT5-0001GS-Jw
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 15:36:35 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc00d854-e798-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 16:36:34 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a4644bde1d4so155202066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 08:36:34 -0700 (PDT)
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
X-Inumbo-ID: cc00d854-e798-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711035393; x=1711640193; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnqlUy7Ur0A23UUjZxjTHOStUMnKCmNJ5F5UJxdjgIw=;
        b=sr+8ObDGTqVL4ypE0Do9aaQiznaZMY4PkrWS3TrYQ86hrzFt92kqi+v8v/8HiSB69O
         tNGm1rCaZZNSAizHYrCBC5aYqkEL5i+v5bEDjAN9Xtl+O6jC1mEClSAPeiiNuw2znW9a
         lTTrj2SVEAlXPKx9+pv7GwEeUH0x5gL/wpRtR8vUFS617O6a9/UZif1qTSohK97ToyuM
         yGnxheYKL6hpPUDCd7Latd4p6sOrjHNy165VnjFTSOjLhb3pH2gn5MDcjpH4AB9uSqZM
         mFmsSJbD9WPjuc9/lI9C27u1YfiDFCyACQ5PBQh+vmULAhySZh5EUnmtVwSitOBRQHO5
         CG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711035393; x=1711640193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnqlUy7Ur0A23UUjZxjTHOStUMnKCmNJ5F5UJxdjgIw=;
        b=Arof83/B6vnA3wYTs7YbR1RC7ZYbFlZG5AEzgZKJXbiQZzjZ12u8ZOfmkrug4ao2yW
         660hL6fljRgBae+xp+8RsprqY20ROa2e5L1oJCGdIOp52wlPRtItR2cQhpz4xlme9kLs
         yptcZD+maBXxFCSOqAOZUpISMrKe4SH1v9Mpyx1UN/XIB1gxyBVxN4xZhZWdpt0ZlpgH
         3Id8JF6XfxhA3e0l4nHJBN+cpBvppq3i3kLhYaULNPZmGt03pGY556w0FEQW8SYjp24t
         rxq2sCzn/eQ9vcY/yo594d5IFgUXfHvk5vuUci6LFo14SfHBzAy5fWXrotGQlUXKr1zb
         OwBA==
X-Forwarded-Encrypted: i=1; AJvYcCUgcyu5Ly8FNfJCtDZLELhmrGXySTe1w96nHC6z3etRPe53PkmApEY6XEy/1khalItYuznuOwQBRdIGGV4+CQWc14DJ/6IHb97x1MNlBoo=
X-Gm-Message-State: AOJu0YwNnB2pWFmz+a4asc+0k4i4RGFOQg3y+fdEzcRiJHqzdh0+aZ7/
	yiF3YGUNvnoh210Tp4pQCPc8OUqyXSkhxS/vmtTtSwgv5wH4bcBVfWPw9DfS+ob635j7Kty89eN
	wbRv9eVWNYM/wz4aAhf01g+q1Kzk3Iecgl++Y6w==
X-Google-Smtp-Source: AGHT+IF+b4z6TD+3LNrKZdZElHLWGv/Sx4ccr3IC7du7Ipbe6zJ9e7godBtp2HArsVb8wsgBhhArVzvRQtnTQgArf6M=
X-Received: by 2002:a17:906:f849:b0:a46:f955:3721 with SMTP id
 ks9-20020a170906f84900b00a46f9553721mr3689472ejb.58.1711035393490; Thu, 21
 Mar 2024 08:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-11-carlo.nonato@minervasys.tech> <fee07e30-e73a-4c1f-92f3-3e4ef7bc707a@suse.com>
In-Reply-To: <fee07e30-e73a-4c1f-92f3-3e4ef7bc707a@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 21 Mar 2024 16:36:22 +0100
Message-ID: <CAG+AhRXx-TL_Fto0TevZB5d1gc3iOq9OG8Ev1jTdELf1x4PJXQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/14] xen: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Mar 19, 2024 at 5:43=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.03.2024 11:58, Carlo Nonato wrote:
> > Add a new memory page allocator that implements the cache coloring mech=
anism.
> > The allocation algorithm enforces equal frequency distribution of cache
> > partitions, following the coloring configuration of a domain. This allo=
ws
> > for an even utilization of cache sets for every domain.
> >
> > Pages are stored in a color-indexed array of lists. Those lists are fil=
led
> > by a simple init function which computes the color of each page.
> > When a domain requests a page, the allocator extract the page from the =
list
> > with the maximum number of free pages between those that the domain can
> > access, given its coloring configuration.
>
> Minor remark: I'm not a native speaker, but "between" here reads odd to
> me. I'd have expected perhaps "among".

Yes, I'm gonna change it.

> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -270,6 +270,20 @@ and not running softirqs. Reduce this if softirqs =
are not being run frequently
> >  enough. Setting this to a high value may cause boot failure, particula=
rly if
> >  the NMI watchdog is also enabled.
> >
> > +### buddy-alloc-size (arm64)
> > +> `=3D <size>`
> > +
> > +> Default: `64M`
> > +
> > +Amount of memory reserved for the buddy allocator when colored allocat=
or is
> > +active. This options is parsed only when LLC coloring support is enabl=
ed.
>
> Nit: s/parsed/used/ - the option is always parsed as long as LLC_COLORING=
=3Dy.
>
> > @@ -1945,6 +1949,164 @@ static unsigned long avail_heap_pages(
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
> > +#define color_heap(color) (&_color_heap[color])
> > +
> > +static unsigned long *__ro_after_init free_colored_pages;
> > +
> > +/* Memory required for buddy allocator to work with colored one */
> > +#ifdef CONFIG_LLC_COLORING
> > +static unsigned long __initdata buddy_alloc_size =3D
> > +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> > +size_param("buddy-alloc-size", buddy_alloc_size);
> > +
> > +#define domain_num_llc_colors(d) (d)->num_llc_colors
> > +#define domain_llc_color(d, i)   (d)->llc_colors[i]
> > +#else
> > +static unsigned long __initdata buddy_alloc_size;
> > +
> > +#define domain_num_llc_colors(d) 0
> > +#define domain_llc_color(d, i)   0
> > +#endif
> > +
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
> > +    free_colored_pages[color]++;
> > +    page_list_add(pg, head);
>
> May I please ask for a comment (or at least some wording in the descripti=
on)
> as to the choice made here between head or tail insertion? When assuming
> that across a system there's no sharing of colors, preferably re-using
> cache-hot pages is certainly good. Whereas when colors can reasonably be
> expected to be shared, avoiding to quickly re-use a freed page can also
> have benefits.

I'll add it.

> > +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> > +                                               const struct domain *d)
> > +{
> > +    struct page_info *pg =3D NULL;
> > +    unsigned int i, color =3D 0;
> > +    unsigned long max =3D 0;
> > +    bool need_tlbflush =3D false;
> > +    uint32_t tlbflush_timestamp =3D 0;
> > +    bool need_scrub;
> > +
> > +    if ( memflags >> _MEMF_bits )
> > +        return NULL;
>
> By mentioning MEMF_bits earlier on I meant to give an example. What
> about MEMF_node and in particular MEMF_exact_node? Certain other flags
> also aren't obvious as to being okay to silently ignore.

You're right.

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
> > +
> > +    if ( !pg )
> > +    {
> > +        spin_unlock(&heap_lock);
> > +        return NULL;
> > +    }
> > +
> > +    need_scrub =3D pg->count_info & (PGC_need_scrub);
> > +    pg->count_info =3D PGC_state_inuse | (pg->count_info & PGC_colored=
);
>
> Better PGC_preserved?

Yeah.

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
>
> There's a corner case where init_heap_pages() would break when passed 0
> as 2nd argument.

I don't see it. There's just a for-loop that would be skipped in that case.=
..

> I think you want to alter the enclosing if() to
> "if ( buddy_alloc_size >=3D PAGE_SIZE )" to be entirely certain to avoid
> that case.

... anyway, ok.

> > +static void dump_color_heap(void)
> > +{
> > +    unsigned int color;
> > +
> > +    printk("Dumping color heap info\n");
> > +    for ( color =3D 0; color < get_max_nr_llc_colors(); color++ )
> > +        if ( free_colored_pages[color] > 0 )
> > +            printk("Color heap[%u]: %lu pages\n",
> > +                   color, free_colored_pages[color]);
> > +}
>
> While having all of the code above from here outside of any #ifdef is
> helpful to prevent unintended breakage when changes are made and tested
> only on non-Arm64 targets, I'd still like to ask: Halfway recent
> compilers manage to eliminate everything? I'd like to avoid e.g. x86
> being left with traces of coloring despite not being able at all to use
> it.

I don't know the answer to this, sorry.

> > @@ -2485,7 +2660,10 @@ struct page_info *alloc_domheap_pages(
> >          }
> >          if ( assign_page(pg, order, d, memflags) )
> >          {
> > -            free_heap_pages(pg, order, memflags & MEMF_no_scrub);
> > +            if ( pg->count_info & PGC_colored )
> > +                free_color_heap_page(pg, memflags & MEMF_no_scrub);
> > +            else
> > +                free_heap_pages(pg, order, memflags & MEMF_no_scrub);
> >              return NULL;
> >          }
> >      }
> > @@ -2568,7 +2746,10 @@ void free_domheap_pages(struct page_info *pg, un=
signed int order)
> >              scrub =3D 1;
> >          }
> >
> > -        free_heap_pages(pg, order, scrub);
> > +        if ( pg->count_info & PGC_colored )
> > +            free_color_heap_page(pg, scrub);
> > +        else
> > +            free_heap_pages(pg, order, scrub);
> >      }
>
> Instead of this, did you consider altering free_heap_pages() to forward
> to free_color_heap_page()? That would then also allow to have a single,
> central comment and/or assertion that the "order" value here isn't lost.

Yes this can be easily done.

> Jan

Thanks.

