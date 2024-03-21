Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD24A885B63
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 16:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696435.1087374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnJyT-0003aN-IH; Thu, 21 Mar 2024 15:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696435.1087374; Thu, 21 Mar 2024 15:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnJyT-0003XB-FK; Thu, 21 Mar 2024 15:04:57 +0000
Received: by outflank-mailman (input) for mailman id 696435;
 Thu, 21 Mar 2024 15:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xA2=K3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rnJyS-0003Wk-5v
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 15:04:56 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fb27f42-e794-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 16:04:54 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56b93b45779so1371630a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 08:04:54 -0700 (PDT)
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
X-Inumbo-ID: 5fb27f42-e794-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711033494; x=1711638294; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+X4qvwVwINCAFDnjL2nwnt17LPJFaX2g4YgC73YiOZ4=;
        b=UVy2I9o4d2PNu4NwQNjdf9qSuw2tNXGXRVlqnK0cCk9tI+FtKn9CCOVeDm8Xxh9xUd
         klOjK0UU4a2EkTn+K56wRDg3dlOfvh/wA+oFVnMfdfY9hP5lHCVBvtUW+X52lvp8GmUq
         VvT3l7DIkRJYy3ViIKas/o4nZNr/hhMLiAdLj2DBwN4JoVZO7PcduC2FTiu/xqx0N45m
         CLjhPhfXOS7TdsEzT4nCMTVXMYLuffiuBqAfKJrSgJ87pc70+zeENqG3HLrNCDYf4NQT
         8aKtAxtxc7P0DHkMfq6Xe4Owpb+KcuzQ5bJCfhT/8ywm0Xg5Cf8WgJ3D8RbPP/DSWQQB
         vpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711033494; x=1711638294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+X4qvwVwINCAFDnjL2nwnt17LPJFaX2g4YgC73YiOZ4=;
        b=fSAZQOYIfbSMGDgBuDwq0EHFC1ya/XS+5dW2hYPt5ZEhojjbswVxdzMwGC47zSBCQo
         EwnQteUk4FLc3RAVWWByTefr+KFHw5YpxIcA4RN2c4Exo7Ksr0c38zkMyTYQKzVQhX3H
         yhJiM/IpRZCQPLPd9wkgDIrG0pIQJxU9bXtTrzJZ219T5Aee5C9dfhaPIkYZHYyKtn8V
         eg3y/DRR4Qcj33c6+q01uafieySxdgC/r1Ndl+XwYkuNwYmNuWb53JKgAP2gN+fCFM8Y
         tQ9jsXsv373b4V1rDlf9aGef9t12AeuCbeowkapgQVIkSNRZu+2wGKc17rZoaQMM/5mM
         OAfg==
X-Forwarded-Encrypted: i=1; AJvYcCVTqs6z9sVZFHpZIS2kd+gRc1/3XFkwgUKSkcWRDMgREYqgeCGCyLW0EbnabLtlq9w8ZcGl4WVqdf90psLF9M0BmIjcs/qWlfM6vU/WVSY=
X-Gm-Message-State: AOJu0YyT5FAyyp3aaLdPhWjcysd3G6ntopgO9S6KEmE4FcYNNENag33Q
	8y3ch4Vr3b7zFl2O2EekydaJQG8B7Gj2WDjNozZwdNxgHQt+IuskbQ2dDxxfrgWrNKmE+0r3mfo
	04rD7cT+eKvC5kfU8dFmE/AZ4XoK2Gg9hViktTQ==
X-Google-Smtp-Source: AGHT+IE4U3kv4KKVkn6K8Eno6bQn2mcZkh8pakJlr0wIpxbQQ1u+tivCmiQRexYyTG7v7mqiGpse3RDczpi/gzo+s8U=
X-Received: by 2002:a17:906:d8c:b0:a46:181f:c1c3 with SMTP id
 m12-20020a1709060d8c00b00a46181fc1c3mr13302182eji.70.1711033493806; Thu, 21
 Mar 2024 08:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-5-carlo.nonato@minervasys.tech> <fa879713-4eee-4905-83f9-6182924cddbb@suse.com>
In-Reply-To: <fa879713-4eee-4905-83f9-6182924cddbb@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 21 Mar 2024 16:04:43 +0100
Message-ID: <CAG+AhRW8xDun1WGimaqsaUR+YqL4vW-OmiDMQHCBxT=S+pgOwQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org, 
	Andrea Bastoni <andrea.bastoni@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Mar 19, 2024 at 4:30=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.03.2024 11:58, Carlo Nonato wrote:
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
> > +Specify dom0 LLC color configuration. This option is available only wh=
en
> > +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all ava=
ilable
> > +colors are used.
>
> My reservation towards this being a top-level option remains.

How can I turn this into a lower-level option? Moving it into "dom0=3D" doe=
sn't
seem possible to me. How can I express a list (llc-colors) inside another l=
ist
(dom0)? dom0=3Dllc-colors=3D0-3,12-15,other-param=3D... How can I stop pars=
ing
before reaching other-param?

> > --- a/xen/common/llc-coloring.c
> > +++ b/xen/common/llc-coloring.c
> > @@ -18,6 +18,63 @@ integer_param("llc-nr-ways", llc_nr_ways);
> >  /* Number of colors available in the LLC */
> >  static unsigned int __ro_after_init max_nr_colors;
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
> > +static int __init parse_color_config(const char *buf, unsigned int *co=
lors,
> > +                                     unsigned int max_num_colors,
> > +                                     unsigned int *num_colors)
> > +{
> > +    const char *s =3D buf;
> > +
> > +    *num_colors =3D 0;
> > +
> > +    while ( *s !=3D '\0' )
> > +    {
> > +        unsigned int color, start, end;
> > +
> > +        start =3D simple_strtoul(s, &s, 0);
> > +
> > +        if ( *s =3D=3D '-' )    /* Range */
> > +        {
> > +            s++;
> > +            end =3D simple_strtoul(s, &s, 0);
> > +        }
> > +        else                /* Single value */
> > +            end =3D start;
> > +
> > +        if ( start > end || (end - start) > (UINT_MAX - *num_colors) |=
|
> > +             (*num_colors + (end - start)) >=3D max_num_colors )
> > +            return -EINVAL;
> > +
> > +        for ( color =3D start; color <=3D end; color++ )
> > +            colors[(*num_colors)++] =3D color;
>
> I can't spot any range check on start/end/color itself. In fact I was fir=
st
> meaning to ask why the return value of simple_strtoul() is silently clipp=
ed
> from unsigned long to unsigned int. Don't forget that a range specificati=
on
> may easily degenerate into a negative number (due to a simple oversight o=
r
> typo), which would then be converted to a huge positive one.
>
> > @@ -41,6 +98,22 @@ static void print_colors(const unsigned int *colors,=
 unsigned int num_colors)
> >      printk(" }\n");
> >  }
> >
> > +static bool check_colors(const unsigned int *colors, unsigned int num_=
colors)
> > +{
> > +    unsigned int i;
> > +
> > +    for ( i =3D 0; i < num_colors; i++ )
> > +    {
> > +        if ( colors[i] >=3D max_nr_colors )
> > +        {
> > +            printk(XENLOG_ERR "LLC color %u >=3D %u\n", colors[i], max=
_nr_colors);
> > +            return false;
> > +        }
> > +    }
> > +
> > +    return true;
> > +}
>
> Oh, here's the range checking of the color values themselves. Perhaps
> a comment in parse_color_config() would help.

I'll add it.

> > @@ -91,6 +164,61 @@ void cf_check domain_dump_llc_colors(const struct d=
omain *d)
> >      print_colors(d->llc_colors, d->num_llc_colors);
> >  }
> >
> > +static int domain_set_default_colors(struct domain *d)
> > +{
> > +    unsigned int *colors =3D xmalloc_array(unsigned int, max_nr_colors=
);
> > +    unsigned int i;
> > +
> > +    if ( !colors )
> > +        return -ENOMEM;
> > +
> > +    printk(XENLOG_WARNING
> > +           "LLC color config not found for %pd, using all colors\n", d=
);
> > +
> > +    for ( i =3D 0; i < max_nr_colors; i++ )
> > +        colors[i] =3D i;
> > +
> > +    d->llc_colors =3D colors;
> > +    d->num_llc_colors =3D max_nr_colors;
> > +
> > +    return 0;
> > +}
>
> If this function is expected to actually come into play, wouldn't it
> make sense to set up such an array just once, and re-use it wherever
> necessary?

Then how to distinguish when to free it in domain_destroy() and when not to=
 do
it?

> Also right here both this and check_colors() could be __init. I
> understand that subsequent patches will also want to use the
> functions at runtime, but until then this looks slightly wrong. I'd
> like to ask that such aspects be mentioned in the description, to
> avoid respective questions.

Ok, I'll do that.

> > +int __init dom0_set_llc_colors(struct domain *d)
> > +{
> > +    unsigned int *colors;
> > +
> > +    if ( !dom0_num_colors )
> > +        return domain_set_default_colors(d);
> > +
> > +    if ( !check_colors(dom0_colors, dom0_num_colors) )
> > +    {
> > +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> > +        return -EINVAL;
> > +    }
> > +
> > +    colors =3D xmalloc_array(unsigned int, dom0_num_colors);
> > +    if ( !colors )
> > +        return -ENOMEM;
> > +
> > +    /* Static type checking */
> > +    (void)(colors =3D=3D dom0_colors);
>
> Btw, a means to avoid this would by to use typeof() in the declaration
> of "colors".

Right.

> > +static int __init parse_dom0_colors(const char *s)
> > +{
> > +    return parse_color_config(s, dom0_colors, ARRAY_SIZE(dom0_colors),
>
> With it not being possible to pass max_nr_colors here (due to the value
> not having been established yet), don't you need to check somewhere else
> that ...
>
> > +                              &dom0_num_colors);
>
> ... dom0_num_colors isn't too large?

I can add it in dom0_set_llc_colors().

> Jan

Thanks.

