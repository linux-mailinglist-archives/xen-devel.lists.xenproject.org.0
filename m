Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148382D819
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 12:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667307.1038443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKoi-0002nl-HJ; Mon, 15 Jan 2024 11:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667307.1038443; Mon, 15 Jan 2024 11:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKoi-0002lE-E3; Mon, 15 Jan 2024 11:07:44 +0000
Received: by outflank-mailman (input) for mailman id 667307;
 Mon, 15 Jan 2024 11:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nyhf=IZ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rPKog-0002l8-Uj
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 11:07:42 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cb82ac0-b396-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 12:07:41 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cd33336b32so112240851fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 03:07:40 -0800 (PST)
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
X-Inumbo-ID: 4cb82ac0-b396-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705316860; x=1705921660; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeVHDkO9IKAn0SnE591ikiHtFW1jLd3OhEB1XJbKsJg=;
        b=R7CEekcchOrVeopjnnE7oOac1xit1UoRenOe4Blgwo23sQujOpuAbAci2pt4SbRgTE
         SLPc3emxdYDMLhFlAizLZOQ4YilUPBMq4gLt6dSOCzA+So5Pn45attCAFyOYdTaydg5H
         Mg/UWQY4Gbp+fj7LcxbCk7UVrIBCmaon8dqmMBRL+urVagV7h1JNlMY8rqvTrjFHC5pW
         cRExZw2Feyrxg9RnpazrNQl2AAbmAW9oxR57XA7zBH72kDh0Max1Ts2WP2NmxacTI0wP
         0A+mmSpDMZWzh6YZ15PP5rz2OoUyMUoNawGQCr9VRSU5cJox3VJANaN3jq0rPGw6RFVK
         Ne3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705316860; x=1705921660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeVHDkO9IKAn0SnE591ikiHtFW1jLd3OhEB1XJbKsJg=;
        b=eMUkM10EnsiN0KqExPAbf5mdNQkkb9toO1MIR70MdRzR7r2IWCT30ZegrIqvZ1JVwt
         NZH6eIemffrCSdo6cQOWIk9IVmnOrYoY6jR6neEH4vxwTylR7F95/pt4SFtuAFVMV8wg
         XuLX8WMQxkQyigmAeSaeGiYr0D+o9lxTJ/rvkOUEEACF3s7h55i0nUtXQ4B14/pHwT/8
         2jcy4BefmpSksMihIi8NMV65/t3wnuOwpQRbNYqvf4XJkM7DixR3VgNqNU6RBgdImW0z
         BWfNG3dOtGc9abSopszSGrMr9eEVpS9o5AALVbVjJPNFy+ZqYbt16V+9zElTvyxOgKf/
         X9zQ==
X-Gm-Message-State: AOJu0YyIkrU5NaWl4399ZcqA38a3aHfC8RkuYSlHZGwpWCcwzMiuyUo2
	0yQDnB2sg6dnB6Po5tcwvzyox+y5C1F1EDzWyJ5istBNXQgUOA==
X-Google-Smtp-Source: AGHT+IFS2bZCDtelUD2IC2wmkkpOf0zmFg5Q/FR6T+lYalz1jK/OOpCbbPZlVKXTX9P9YTTIemUyrmHrFiYXnLa8Zzs=
X-Received: by 2002:a2e:2410:0:b0:2cc:a5b8:efaf with SMTP id
 k16-20020a2e2410000000b002cca5b8efafmr2453903ljk.55.1705316860235; Mon, 15
 Jan 2024 03:07:40 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-10-carlo.nonato@minervasys.tech> <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
In-Reply-To: <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 15 Jan 2024 12:07:29 +0100
Message-ID: <CAG+AhRXFME0hzhhpRaAZ8AfK3A-npHWcGf=pHw_feVEA7SkaiQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] xen: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Jan 9, 2024 at 11:28=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 02.01.2024 10:51, Carlo Nonato wrote:
> > This commit adds a new memory page allocator that implements the cache
> > coloring mechanism. The allocation algorithm enforces equal frequency
> > distribution of cache partitions, following the coloring configuration =
of a
> > domain. This allows an even utilization of cache sets for every domain.
> >
> > Pages are stored in a color-indexed array of lists. Those lists are fil=
led
> > by a simple init function which computes the color of each page.
> > When a domain requests a page, the allocator extract the page from the =
list
> > with the maximum number of free pages between those that the domain can
> > access, given its coloring configuration.
> >
> > The allocator can only handle requests of order-0 pages. This allows fo=
r
> > easier implementation and since cache coloring targets only embedded sy=
stems,
> > it's assumed not to be a major problem.
>
> I'm curious about the specific properties of embedded systems that makes
> the performance implications of deeper page walks less of an issue for
> them.
>
> Nothing is said about address-constrained allocations. Are such entirely
> of no interest to domains on Arm, not even to Dom0 (e.g. for filling
> Linux'es swiotlb)? Certainly alloc_color_heap_page() should at least
> fail when it can't satisfy the passed in memflags.
>
> > ---
> > v5:
> > - Carlo Nonato as the new author
> > - the colored allocator balances color usage for each domain and it sea=
rches
> >   linearly only in the number of colors (FIXME removed)
>
> While this addresses earlier concerns, meanwhile NUMA work has also
> been progressing. What's the plan of interaction of coloring with it?
>
> > --- a/xen/arch/Kconfig
> > +++ b/xen/arch/Kconfig
> > @@ -47,3 +47,15 @@ config NR_LLC_COLORS
> >         bound. The runtime value is autocomputed or manually set via cm=
dline.
> >         The default value corresponds to an 8 MiB 16-ways LLC, which sh=
ould be
> >         more than what needed in the general case.
> > +
> > +config BUDDY_ALLOCATOR_SIZE
> > +     int "Buddy allocator reserved memory size (MiB)"
> > +     default "64"
> > +     depends on LLC_COLORING
> > +     help
> > +       Amount of memory reserved for the buddy allocator to work along=
side
> > +       the colored one. The colored allocator is meant as an alternati=
ve to
> > +       the buddy allocator because its allocation policy is by definit=
ion
> > +       incompatible with the generic one. Since the Xen heap is not co=
lored
> > +       yet, we need to support the coexistence of the two allocators a=
nd some
> > +       memory must be left for the buddy one.
>
> Imo help text should be about the specific option, not general
> documentation. How about
>
>           Amount of memory reserved for the buddy allocator, to serve Xen=
's
>           heap, to work alongside the colored one.
>
> or some such?
>
> > --- a/xen/arch/arm/llc-coloring.c
> > +++ b/xen/arch/arm/llc-coloring.c
> > @@ -30,6 +30,9 @@ static unsigned int __ro_after_init nr_colors =3D CON=
FIG_NR_LLC_COLORS;
> >  static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
> >  static unsigned int __ro_after_init dom0_num_colors;
> >
> > +#define mfn_color_mask              (nr_colors - 1)
>
> This is used solely ...
>
> > +#define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
>
> ... here, and this one in turn is used solely ...
>
> > @@ -312,6 +315,16 @@ int domain_set_llc_colors_from_str(struct domain *=
d, const char *str)
> >      return domain_check_colors(d);
> >  }
> >
> > +unsigned int page_to_llc_color(const struct page_info *pg)
> > +{
> > +    return mfn_to_color(page_to_mfn(pg));
> > +}
>
> ... here. What's the point in having those (private) macros?

They will be used in later patches (#13).

> > @@ -1946,6 +1951,162 @@ static unsigned long avail_heap_pages(
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
>
> It's "just" two pointers, but still - what use are they when ...
>
> > +/* Memory required for buddy allocator to work with colored one */
> > +#ifdef CONFIG_LLC_COLORING
>
> ... this isn't defined?
>
> > +static unsigned long __initdata buddy_alloc_size =3D
> > +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> > +size_param("buddy-alloc-size", buddy_alloc_size);
> > +
> > +#define domain_num_llc_colors(d) ((d)->num_llc_colors)
> > +#define domain_llc_color(d, i)   ((d)->llc_colors[(i)])
>
> Nit: No need to parenthesize i when used like this.
>
> > +#else
> > +static unsigned long __initdata buddy_alloc_size;
> > +
> > +#define domain_num_llc_colors(d) 0
> > +#define domain_llc_color(d, i)   0
> > +#define page_to_llc_color(p)     0
> > +#define get_nr_llc_colors()      0
> > +#endif
> > +
> > +#define color_heap(color) (&_color_heap[color])
> > +
> > +void free_color_heap_page(struct page_info *pg, bool need_scrub)
>
> Likely applicable further down as well - this is dead code when
> !CONFIG_LLC_COLORING. Besides me, Misra also won't like this. The
> function also looks to want to be static, at which point DCE would
> apparently take care of removing it (and others, and then hopefully
> also the two static variables commented on above).
>
> > +struct page_info *alloc_color_heap_page(unsigned int memflags, struct =
domain *d)
>
> I don't think d is written through in the function, so it wants to
> be pointer-to-const.
>
> > +void __init init_color_heap_pages(struct page_info *pg, unsigned long =
nr_pages)
> > +{
> > +    unsigned int i;
> > +    bool need_scrub =3D (system_state < SYS_STATE_active &&
>
> Can this part of the condition be false, seeing we're in an __init
> function?

Nope. I'll drop it.

> > +                       opt_bootscrub =3D=3D BOOTSCRUB_IDLE);
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
>
> So whatever is passed into this function first is going to fill the
> Xen heap, without regard to address. I expect you're sure this won't
> cause issues on Arm. On x86 certain constraints exist which would
> require lower address ranges to be preferred.
>
> > +void dump_color_heap(void)
> > +{
> > +    unsigned int color;
> > +
> > +    printk("Dumping color heap info\n");
> > +    for ( color =3D 0; color < get_nr_llc_colors(); color++ )
> > +        if ( free_colored_pages[color] > 0 )
> > +            printk("Color heap[%u]: %lu pages\n",
> > +                   color, free_colored_pages[color]);
> > +}
>
> What's a typical range of number of colors on a system? I expect more
> than 9, but I'm not sure about a reasonable upper bound. For the
> output to be easy to consume, [%u] may want to become at least [%2u].

16 or 32 colors are pretty typical. In the past we set an upper bound at
128 colors.

Thanks.

> Jan

