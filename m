Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF3848558
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 12:40:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675362.1050732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWENK-0001uC-T3; Sat, 03 Feb 2024 11:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675362.1050732; Sat, 03 Feb 2024 11:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWENK-0001rt-QE; Sat, 03 Feb 2024 11:39:58 +0000
Received: by outflank-mailman (input) for mailman id 675362;
 Sat, 03 Feb 2024 11:39:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBn0=JM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rWENJ-0001rn-DQ
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 11:39:57 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2e4a5c2-c288-11ee-98f5-efadbce2ee36;
 Sat, 03 Feb 2024 12:39:54 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d051fb89fbso38242951fa.2
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2024 03:39:54 -0800 (PST)
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
X-Inumbo-ID: f2e4a5c2-c288-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706960394; x=1707565194; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64UaWdYCmmh8PjNcXUOydAJeDT3Q9ZzDW2Q62uynbwA=;
        b=edHMSFNjijgTzQQ0dl0MeE1gpHVFrG2C/Y8mZ2UDQVipKRfUmCA+uNwXKA29UNAnIE
         l89+tGpSBir9DKxnjMP4gpYLySR5nhmtVY5UlghCgQNywKP/cOjiVm7JLBsSMqiJGPEg
         WJ2Z7k4nkZf/ggVFTKVKVM+lIa1+30DOzbKoMSBZElz/c62CfPnovCnGAdPyC2HwEI3Q
         frL+Ro98utTXMyVcjQqcsSYtn9vSZHkMl+Zmt2x+zdMKJ5SXLMVWceYCyAGWPHyXGq8X
         iICHgSKItaGgx7Zo+9c+GSxn96eyJ7ZtZE+/2hEmebo6ebVsY+ZOmP1imZ06crjCXgOw
         SoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706960394; x=1707565194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64UaWdYCmmh8PjNcXUOydAJeDT3Q9ZzDW2Q62uynbwA=;
        b=E+PkZduoFB8C7k3W4qlUR6iTPpgA2x0f2+IfYZP3NSgNWBKoIP6ueE/V1LTewJQ8L8
         F7TJtPhppmezgmDdYN3doZ7ytQxNzYEI8twrdYRuH1+I8RI88/apzXcn5/01bGPjkHVW
         5Vl9jih1Zh5fxEv+amBl7ZGMJHa31WXPdySdrYyKc1uh9k2hONe1Vm4gHc282BBA+gJn
         Dth0YTTOCztV/gblAl0UHR37+VAxOr7Uo+529YT/OG9U6aUM1st9lW7YZnwnk1v0xdWs
         HEkxriWjQAtSrp0BP7KfZGnHlKjDgde2RL/qweaoEARvkP6ce4N9qq9DjUh+zfO+GntN
         VhgA==
X-Gm-Message-State: AOJu0YwvKMQ5+inYK/3QEAnwV/Dj/bAvdj4KaLIMjpFXLy5yTjUJR6Vh
	aCYu6/vsOMz8bfdfXZtBQAAbtVgSFTe75SQnWSj3mY1oBCYj0MYiwG3zXBQ1uoDjgA1lujgakhd
	vMu3M/Sl3pfsiQLm9Pq40lrcioqC4k+jBgyn3XQ==
X-Google-Smtp-Source: AGHT+IH4cT1re366oKsQSoTImKX+Qigf8CjiOT230T5Kq2eBN6QbmZr0HLSXUCJMHam0CPM9WXMODo3JAXqzRpZiz98=
X-Received: by 2002:a2e:9cc9:0:b0:2d0:9076:e9cc with SMTP id
 g9-20020a2e9cc9000000b002d09076e9ccmr1956581ljj.29.1706960393640; Sat, 03 Feb
 2024 03:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-5-carlo.nonato@minervasys.tech> <cf23d8a8-7111-4014-adc7-93ecd5f110ec@suse.com>
In-Reply-To: <cf23d8a8-7111-4014-adc7-93ecd5f110ec@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Sat, 3 Feb 2024 12:39:42 +0100
Message-ID: <CAG+AhRW4Ng7wkhB5f2H5ruCmYgium0YXZgA_bu7=T6HErUEg2A@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] xen/arm: add Dom0 cache coloring support
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

On Thu, Feb 1, 2024 at 2:30=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 29.01.2024 18:18, Carlo Nonato wrote:
> > Add a command line parameter to allow the user to set the coloring
> > configuration for Dom0.
> > A common configuration syntax for cache colors is introduced and
> > documented.
> > Take the opportunity to also add:
> >  - default configuration notion.
> >  - function to check well-formed configurations.
> >
> > Direct mapping Dom0 isn't possible when coloring is enabled, so
> > CDF_directmap flag is removed when creating it.
>
> What implications does this have?

You will need an IOMMU to boot and extra care when assigning guest physical
addresses to Dom0. We have a new patch for that and it should solve what
Michal was pointing out in the cover letter.

> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
> >
> >  Specify a list of IO ports to be excluded from dom0 access.
> >
> > +### dom0-llc-colors
> > +> `=3D List of [ <integer> | <integer>-<integer> ]`
> > +
> > +> Default: `All available LLC colors`
> > +
> > +Specify dom0 LLC color configuration. This options is available only w=
hen
> > +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all ava=
ilable
> > +colors are used.
>
> Even Arm already has a "dom0=3D" option. Is there a particular reason why
> this doesn't become a new sub-option there?

Cause this is a list and I don't think "dom0" option supports it since it's
already a list.

> As to meaning: With just a single <integer>, that's still a color value
> then (and not a count of colors)?

Exactly.

> Wouldn't it make sense to have a
> simpler variant available where you just say how many, and a suitable
> set/range is then picked?

This can be done in the future. It's not a feature that we want to support =
as
of now. For the moment we just want to give the user maximum freedom.

> Finally a nit: "This option is ...".
>
> > @@ -2188,10 +2190,16 @@ void __init create_dom0(void)
> >              panic("SVE vector length error\n");
> >      }
> >
> > -    dom0 =3D domain_create(0, &dom0_cfg, CDF_privileged | CDF_directma=
p);
> > +    if ( !llc_coloring_enabled )
> > +        flags |=3D CDF_directmap;
> > +
> > +    dom0 =3D domain_create(0, &dom0_cfg, flags);
> >      if ( IS_ERR(dom0) )
> >          panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0))=
;
> >
> > +    if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
> > +        panic("Error initializing LLC coloring for domain 0 (rc =3D %d=
)", rc);
>
> As for the earlier patch, I find panic()ing here dubious. You can continu=
e
> quite fine, with a warning and perhaps again tainting the system.
>
> > --- a/xen/common/llc-coloring.c
> > +++ b/xen/common/llc-coloring.c
> > @@ -17,6 +17,63 @@ size_param("llc-way-size", llc_way_size);
> >  /* Number of colors available in the LLC */
> >  static unsigned int __ro_after_init max_nr_colors =3D CONFIG_NR_LLC_CO=
LORS;
> >
> > +static unsigned int __initdata dom0_colors[CONFIG_NR_LLC_COLORS];
> > +static unsigned int __initdata dom0_num_colors;
> > +
> > +/*
> > + * Parse the coloring configuration given in the buf string, following=
 the
> > + * syntax below.
> > + *
> > + * COLOR_CONFIGURATION ::=3D COLOR | RANGE,...,COLOR | RANGE
> > + * RANGE               ::=3D COLOR-COLOR
> > + *
> > + * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15=
,16.
> > + */
> > +static int parse_color_config(const char *buf, unsigned int *colors,
> > +                              unsigned int num_colors, unsigned int *n=
um_parsed)
>
> Is this function going to be re-used? If not, it wants to be __init.
> If so, I wonder where the input string is going to come from ...

You're right. It needs __init.

> Also "num_colors" looks to be misnamed - doesn't this specify an
> upper bound only?

It's the real size of the colors array. Than the used size will be found in
num_parsed.

> > +{
> > +    const char *s =3D buf;
> > +
> > +    if ( !colors || !num_colors )
> > +        return -EINVAL;
>
> Why do you check colors but not ...
>
> > +    *num_parsed =3D 0;
>
> ... num_parsed? I think internal functions don't need such NULL checks.

Ok I'll drop it.

>
> > +    while ( *s !=3D '\0' )
> > +    {
> > +        if ( *s !=3D ',' )
>
> Hmm, this way you also accept leading/trailing commas as well as multiple
> consecutive ones. Elsewhere we're more strict.
>
> > @@ -70,12 +150,85 @@ void __init llc_coloring_init(void)
> >      arch_llc_coloring_init();
> >  }
> >
> > +void domain_llc_coloring_free(struct domain *d)
> > +{
> > +    xfree(__va(__pa(d->llc_colors)));
>
> This __va(__pa()) trick deserves a comment, I think.
>
> > +}
> > +
> >  void domain_dump_llc_colors(const struct domain *d)
> >  {
> >      printk("Domain %pd has %u LLC colors: ", d, d->num_llc_colors);
> >      print_colors(d->llc_colors, d->num_llc_colors);
> >  }
> >
> > +static unsigned int *alloc_colors(unsigned int num_colors)
> > +{
> > +    unsigned int *colors;
> > +
> > +    if ( num_colors > max_nr_colors )
> > +        return NULL;
>
> Shouldn't check_colors() have made sure of this? If so, convert to
> ASSERT()?
>
> > +    colors =3D xmalloc_array(unsigned int, num_colors);
> > +    if ( !colors )
> > +        return NULL;
>
> These last two lines are redundant with ...
>
> > +    return colors;
>
> ... this one. Question then is whether this is useful at all as a
> separate helper function.

I'm going to remove alloc_colors().

> > +}
> > +
> > +static int domain_check_colors(const struct domain *d)
> > +{
> > +    if ( !d->num_llc_colors )
> > +    {
> > +        printk(XENLOG_ERR "No LLC color config found for %pd\n", d);
> > +        return -ENODATA;
> > +    }
> > +    else if ( !check_colors(d->llc_colors, d->num_llc_colors) )
>
> I generally recommend against use of "else" in cases like this one.
>
> > +    {
> > +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> > +        return -EINVAL;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int domain_set_default_colors(struct domain *d)
> > +{
> > +    unsigned int *colors =3D alloc_colors(max_nr_colors);
> > +    unsigned int i;
> > +
> > +    if ( !colors )
> > +        return -ENOMEM;
> > +
> > +    printk(XENLOG_WARNING
> > +           "LLC color config not found for %pd, using default\n", d);
>
> Leaving open what the default(s) is/are. Judging from ...
>
> > +    for ( i =3D 0; i < max_nr_colors; i++ )
> > +        colors[i] =3D i;
>
> ... this it's simply "all colors". Then perhaps have the message also
> say so?

Yep, ok.

> > +    d->llc_colors =3D colors;
> > +    d->num_llc_colors =3D max_nr_colors;
> > +
> > +    return 0;
> > +}
> > +
> > +int __init dom0_set_llc_colors(struct domain *d)
> > +{
> > +    unsigned int *colors;
> > +
> > +    if ( !dom0_num_colors )
> > +        return domain_set_default_colors(d);
> > +
> > +    colors =3D alloc_colors(dom0_num_colors);
> > +    if ( !colors )
> > +        return -ENOMEM;
> > +
> > +    memcpy(colors, dom0_colors, sizeof(unsigned int) * dom0_num_colors=
);
>
> sizeof(*colors) or some such please. Plus a check that colors and
> dom0_colors are actually of the same type. Alternatively, how about
> making dom0_colors[] __ro_after_init? Is this too much of a waste?

You mean an ASSERT on the two arrays type?

Thanks

> Jan

