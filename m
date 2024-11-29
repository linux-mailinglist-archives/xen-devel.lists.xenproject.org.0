Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3501D9DC193
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 10:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845875.1261205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGxRC-0002ih-PX; Fri, 29 Nov 2024 09:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845875.1261205; Fri, 29 Nov 2024 09:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGxRC-0002fq-Mf; Fri, 29 Nov 2024 09:37:22 +0000
Received: by outflank-mailman (input) for mailman id 845875;
 Fri, 29 Nov 2024 09:37:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lhP=SY=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tGxRB-0002fi-Lm
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 09:37:21 +0000
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [2607:f8b0:4864:20::d35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85c041b9-ae35-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 10:37:18 +0100 (CET)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-843d8679e0cso55034339f.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 01:37:17 -0800 (PST)
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
X-Inumbo-ID: 85c041b9-ae35-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpkMzUiLCJoZWxvIjoibWFpbC1pbzEteGQzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg1YzA0MWI5LWFlMzUtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODczMDM4LjAzOTQ1NCwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732873037; x=1733477837; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5wWp+R6OZpResArPiZ0kV1o1jzeqJc9Ee7t7eGQkuQ=;
        b=t/MXRadanorUmcYenhpEBQZZOGkihGbHEbj6hrUkww3NN/8Db4xl9YMX2REb7gbtvt
         FkKQh/wBGlhfXvtSx+fp7DeUHhwc0N1c5LtJKN84DuiPOEWA2wbnQA8AP4CLSG6/nU+n
         AIJ8V5A0wkS4PPPtamZbaRsOwJgNJRKq6kT9AM8yzALvzosjbYYQhaueS3tqDDIZbfAR
         LjMMCxlvg/jjVUaZiWjimE7yssCvoIhKIO73yChS4PwGBhA3OQG/vTP5G4wuJEK3EH8Z
         Qev5zorHx9HHEM+zPP/c2aIfJ5iLnJ+mmwvnlDelgq5n96Ktaiuf9NXcKtvTI/4VhyXy
         Tuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732873037; x=1733477837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5wWp+R6OZpResArPiZ0kV1o1jzeqJc9Ee7t7eGQkuQ=;
        b=sjUKM4toMuAPCi4uAcnISMVm87ds+3lbeofxxlQaBXOViRbZAqZGXSRVvTh/YABLjP
         cvEuLHKMp1UxbVCxMl2A3s3GJQ0Bi5c2Neb0rwRQaJzBvuD69IxvvMW610OdNxhk/IF/
         dsOlnG2dMKuoEMg97irqFsYS9iEw+NFz9dpqLtlrdB6HPnISWKESyXhBQbj0MqsWINT3
         Tc/CONMbqpI043GgFL+Pl4rHq0K3YP2oH5ocEnMSJHwspvL830Rx0gP/hQmJmmjlnPSU
         bvO6kMGUgycPjdfYrH2M46iAzhdmwtNWs5MKZEgDWFgFHGeN9Gf9LE+54Vb2LPUQ46Eq
         wU+w==
X-Forwarded-Encrypted: i=1; AJvYcCWDTp6cvA/u8hczTQwgC4WheoV4puNM9MUN5Ai9wy8ijabC1Qee2cxjEhbVD8kbdboIxXYE0QU6dZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSqtl7Cpln88DF2z9dX2Sajde4MqD2NjODqEgeYCEeMapfoMIa
	LIopWlctH5A4bU/iHMKH6MbdRIHRe4IwhO5mzHpxv2L4FHETxA5bGJPIcETXaQzKJjUkWNqtL0q
	U5eMNv2XqOw7t8UZeyHeWVqZqdIx9bN3n50zKvdpdHMSPqVx/C2Y=
X-Gm-Gg: ASbGnctUBIx/Dd165khNVgasPqv3CBqkhbMqP6gpPyOIJjV+JY1pbmjDvfTUYehgmW+
	0g4u7g1GFHzLFTTBUT3S5t5O731sPE3Oo
X-Google-Smtp-Source: AGHT+IFA9p1AKj5FG3kc1eQdLVQtgN38ZmSc+LHDql+RBfM1KeIAFti/Lshn/zEz97xo5cPett7z6QtuWRph+wq73aI=
X-Received: by 2002:a05:6602:340b:b0:841:950b:3871 with SMTP id
 ca18e2360f4ac-843ecfd398emr1300245739f.4.1732873036675; Fri, 29 Nov 2024
 01:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-10-carlo.nonato@minervasys.tech> <5f876671-4624-4ec6-957e-d4a7802fb46a@suse.com>
In-Reply-To: <5f876671-4624-4ec6-957e-d4a7802fb46a@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 29 Nov 2024 10:37:06 +0100
Message-ID: <CAG+AhRWAwkwd6w8+TOp8k+9pxj9=JvEjwNode_HrgdwMZHE5Qg@mail.gmail.com>
Subject: Re: [PATCH v10 09/12] xen: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Nov 28, 2024 at 12:43=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 19.11.2024 15:13, Carlo Nonato wrote:
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
> > +active. This option is available only when `CONFIG_LLC_COLORING` is en=
abled.
> > +The colored allocator is meant as an alternative to the buddy allocato=
r,
> > +because its allocation policy is by definition incompatible with the g=
eneric
> > +one. Since the Xen heap systems is not colored yet, we need to support=
 the
> > +coexistence of the two allocators for now. This parameter, which is op=
tional
> > +and for expert only, it's used to set the amount of memory reserved to=
 the
> > +buddy allocator.
>
> Every time I see this, and I further see the title of patch 12, I'm confu=
sed,
> expecting that what's being said here needs adjusting (or even undoing) t=
here.
> The issue is that patch 12's title says just "Xen" when, if I'm not mista=
ken,
> it really only means the Xen image.

I'll change the patch 12 title to reflect what you said.

> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -537,4 +537,12 @@ config LLC_COLORS_ORDER
> >         The default value corresponds to an 8 MiB 16-ways LLC, which sh=
ould be
> >         more than what's needed in the general case.
> >
> > +config BUDDY_ALLOCATOR_SIZE
> > +     int "Buddy allocator reserved memory size (MiB)" if LLC_COLORING
> > +     default "0" if !LLC_COLORING
> > +     default "64"
> > +     help
> > +       Amount of memory reserved for the buddy allocator to serve Xen =
heap,
> > +       working alongside the colored one.
>
> As the description has nothing in this regard: Why again is it that this
> can't simply have "depends on LLC_COLORING"? Even if it ends up with a
> value of 0, in an LLC_COLORING=3Dn (or LLC_COLORING entirely absent) .con=
fig
> I'd find it at least irritating to see this setting to be there.

Quoting you from v8 (6 months ago, a lot of time ago I know, link here
https://patchew.org/Xen/20240502165533.319988-1-carlo.nonato@minervasys.tec=
h/20240502165533.319988-10-carlo.nonato@minervasys.tech/#5c16f53f-3bb0-49d6=
-b174-b0e8c6ceff4c@suse.com):
> > +/* Memory required for buddy allocator to work with colored one */
> > +#ifdef CONFIG_LLC_COLORING
> > +static unsigned long __initdata buddy_alloc_size =3D
> > +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
>
> I think it would be quite nice if this and ...
>
> > +size_param("buddy-alloc-size", buddy_alloc_size);
> > +
> > +#define domain_num_llc_colors(d) (d)->num_llc_colors
> > +#define domain_llc_color(d, i)   (d)->llc_colors[i]
> > +#else
> > +static unsigned long __initdata buddy_alloc_size;
>
> ... this were folded. Which I think would be possible if the Kconfig
> addition went like this:
>
> config BUDDY_ALLOCATOR_SIZE
> int "Buddy allocator reserved memory size (MiB)" if LLC_COLORING
> default "0" if !LLC_COLORING
> default "64"

But I know that...

> > @@ -1945,6 +1960,155 @@ static unsigned long avail_heap_pages(
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
> > +static unsigned long __initdata buddy_alloc_size =3D
> > +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> > +size_param("buddy-alloc-size", buddy_alloc_size);
> > +
> > +#ifdef CONFIG_LLC_COLORING
>
> According to the (updated) command line doc, this #ifdef needs to move up
> so the command line option indeed is unrecognized when !LLC_COLORING.
> Question then is whether the variable is actually needed. With the variab=
le
> also moved into the #ifdef, the need for BUDDY_ALLOCATOR_SIZE also goes
> away when !LLC_COLORING (see the comment on the common/Kconfig change). O=
f
> course you'll then need "#ifndef buddy_alloc_size" in
> init_color_heap_pages(), around the respective if() there.

buddy-alloc-size must not be parsed when !LLC_COLORING. I'll change the cod=
e
accordingly to what you said.

> > +#define domain_num_llc_colors(d) ((d)->num_llc_colors)
> > +#define domain_llc_color(d, i)   ((d)->llc_colors[i])
> > +#else
> > +#define domain_num_llc_colors(d) 0
> > +#define domain_llc_color(d, i)   0
> > +#endif
> > +
> > +static void free_color_heap_page(struct page_info *pg, bool need_scrub=
)
> > +{
> > +    unsigned int color;
> > +
> > +    color =3D page_to_llc_color(pg);
> > +    free_colored_pages[color]++;
> > +    /*
> > +     * Head insertion allows re-using cache-hot pages in configuration=
s without
> > +     * sharing of colors.
> > +     */
> > +    page_list_add(pg, color_heap(color));
> > +}
>
> Iirc it was me who had asked to keep this and further functions outside o=
f
> #ifdef-s, for the compiler's DCE to take care of. However, with all that
> Misra work that has been going on since then, I now wonder what Misra
> thinks of this: When PGC_colored is 0, functions like the above are
> unreachable, and any code or data the compiler doesn't manage to eliminat=
e
> would be dead. Imo if the code is to remain as is, correctness Misra-wise
> may want mentioning in the description (this isn't the only place we have
> such, so an overall position towards this is going to be needed).

For the time being, I'll add a note that can be updated when the overall
position is found.

> > +static void __init init_color_heap_pages(struct page_info *pg,
> > +                                         unsigned long nr_pages)
> > +{
> > +    unsigned int i;
> > +    bool need_scrub =3D opt_bootscrub =3D=3D BOOTSCRUB_IDLE;
> > +
> > +    if ( buddy_alloc_size >=3D PAGE_SIZE )
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
>
> At this point, xvmalloc() and friends want using by all new code, unless
> explicitly justified otherwise.

Yes.

> > +        if ( !_color_heap || !free_colored_pages )
> > +            panic("Can't allocate colored heap. Buddy reserved size is=
 too low");
> > +
> > +        for ( i =3D 0; i < max_nr_colors; i++ )
> > +            INIT_PAGE_LIST_HEAD(color_heap(i));
>
> While for this loop i being unsigned int is okay, I fear that ...
>
> > +    }
> > +
> > +    for ( i =3D 0; i < nr_pages; i++ )
> > +    {
> > +        pg[i].count_info =3D PGC_colored;
> > +        free_color_heap_page(&pg[i], need_scrub);
> > +    }
>
> ... for this loop it isn't.

Ok.

> Jan

Thanks.
- Carlo

