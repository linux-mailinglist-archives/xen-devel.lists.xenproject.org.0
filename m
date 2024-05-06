Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562EB8BD1D6
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 17:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717742.1120240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40ew-00026B-SB; Mon, 06 May 2024 15:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717742.1120240; Mon, 06 May 2024 15:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40ew-00023c-PB; Mon, 06 May 2024 15:53:46 +0000
Received: by outflank-mailman (input) for mailman id 717742;
 Mon, 06 May 2024 15:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2hIh=MJ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s40ev-00022I-Nt
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 15:53:45 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d114953e-0bc0-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 17:53:44 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so524449766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 08:53:44 -0700 (PDT)
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
X-Inumbo-ID: d114953e-0bc0-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1715010824; x=1715615624; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BF8NClv1jPLw3wlVZskeQ6pJjW/iX57O7dzan0zx8K0=;
        b=ApFq60RkP9gHF4vGVlar+wPlEZNT9KmARWzszuhvQtOwh088Tqn1qMFSdF18D5PW63
         rJdvz6MCdf6s1ovY1MkasfprSl+g39FnhNSOSyphAwVSc5eccSAjxftGhSHLZKFIkCK9
         sSf4rrXr498yn2PwjgUy9PQFguRwLaS9qHJVz3C6TJBQ4+saDgS1kq28PNx6ENCbrYI/
         R2h6OULtjEkDGSDSE29Grkq7P8Vaw1pgUoTtIazMTBhKqWKOeOmgUw+haCxouHLUsghN
         Tc9KsIyznSMCVhxmrw+QOsxd4jRFSfHtzF+e0M3scX4SgmIHf8hF0GLh9noxoHkn5XWq
         f9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715010824; x=1715615624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BF8NClv1jPLw3wlVZskeQ6pJjW/iX57O7dzan0zx8K0=;
        b=rwuTlWIvjFHe1HYPhp2w80LYniAgdVxolwgwsEy0TEefvKtQwpohhGdIhAbDW9RAD7
         YmhvAQkL6ZeFBnhPzHIxxZJAc8t4xBy78FPLjgiNELczGTeVBExtcVySowuUnHLzTiH2
         3Pj0EBjs5v5qyTBo2Ne8SVeEN6wEGsvAWNAGz+YaHvgNbHQ0xcIAdLGlcEJ1D4e5bVD1
         mx0xQrUKblUlCtmy5ErtCOixoTs9MtUzqhMPVKECNB0N7S55q/xdhia+vQivyAS0vya4
         1ZNPFonrOjuXrUjJ8Znz7A5cx+lR11zPuKxzMTV0jIG13/oNIRqpxF1X3qfku7LbHK5c
         oWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Sk3hjROEI/ADyTnqSqxmWyguF4DdPrd9KmCNK+3jVJgMNR/DUjqkhi7yq4aAcX7sJyjk0lgKPoDfVuepAG6U7A234eW67a4K1wNvQCg=
X-Gm-Message-State: AOJu0YwHCU7TuYOun4hwLTYWSsFEXsjWmdRED5AJ1MNb5KgDKPJ5LIiG
	+P7j11+/+xfaiMSZVSnW7cyFpjmk6LeF14KWluC3VFCRNv9Y7JFQLyUjctx/tFF8ZGxf7Zk+qwb
	pw5F+LyfdhPvjZpdegpHr8VRTWfvTsTE52L7i0Q==
X-Google-Smtp-Source: AGHT+IGPd2PvGoli0JwBV4Xf5joV1u9PoWFLIS1puMiNKG6zVUpEF7ZLNN4M/62zuFVbA3Xuyf+XsQRCqoZqwOrMF2I=
X-Received: by 2002:a17:907:3f07:b0:a59:c9b1:cb68 with SMTP id
 hq7-20020a1709073f0700b00a59c9b1cb68mr3493553ejc.7.1715010823607; Mon, 06 May
 2024 08:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-2-carlo.nonato@minervasys.tech> <bcfc0da1-5d8a-4e14-be34-89876d668b86@suse.com>
In-Reply-To: <bcfc0da1-5d8a-4e14-be34-89876d668b86@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 6 May 2024 17:53:32 +0200
Message-ID: <CAG+AhRXj6GeyAXvWyVPymB9eD=YkzcuoB2GTAj2uKb_q_RWa4g@mail.gmail.com>
Subject: Re: [PATCH v8 01/13] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, May 6, 2024 at 1:54=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.05.2024 18:55, Carlo Nonato wrote:
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -71,6 +71,9 @@ config HAS_IOPORTS
> >  config HAS_KEXEC
> >       bool
> >
> > +config HAS_LLC_COLORING
> > +     bool
> > +
> >  config HAS_PIRQ
> >       bool
> >
> > @@ -513,4 +516,23 @@ config TRACEBUFFER
> >         to be collected at run time for debugging or performance analys=
is.
> >         Memory and execution overhead when not active is minimal.
> >
> > +config LLC_COLORING
> > +     bool "Last Level Cache (LLC) coloring" if EXPERT
> > +     depends on HAS_LLC_COLORING
> > +     depends on !NUMA
> > +
> > +config MAX_LLC_COLORS_ORDER
>
> May I ask that you consider dropping MAX_ from here (but keeping "maximum=
"
> in prompt and text), thus ...
>
> > --- /dev/null
> > +++ b/xen/common/llc-coloring.c
> > @@ -0,0 +1,111 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Last Level Cache (LLC) coloring common code
> > + *
> > + * Copyright (C) 2022 Xilinx Inc.
> > + */
> > +#include <xen/keyhandler.h>
> > +#include <xen/llc-coloring.h>
> > +#include <xen/param.h>
> > +
> > +#define NR_LLC_COLORS          (1 << CONFIG_MAX_LLC_COLORS_ORDER)
>
> ... making this look less strange?

Ok.

> To match up with e.g. max_nr_colors you may also want to use 1U here.

Ok.

> > +void __init llc_coloring_init(void)
> > +{
> > +    unsigned int way_size;
> > +
> > +    if ( llc_size && llc_nr_ways )
> > +    {
> > +        llc_coloring_enabled =3D true;
> > +        way_size =3D llc_size / llc_nr_ways;
> > +    }
> > +    else if ( !llc_coloring_enabled )
> > +        return;
> > +    else
> > +    {
> > +        way_size =3D get_llc_way_size();
> > +        if ( !way_size )
> > +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' =
missing\n");
>
> Since you won't accept way_size =3D=3D 0 here, how about it ending up zer=
o in
> the initial if()'s body? Even more, don't you want to demand
> llc_size % llc_nr_ways =3D=3D 0 there (thus, together with the enclosing
> condition, guaranteeing way_size !=3D 0)?

Not sure why I would need it. way_size =3D=3D 0 is checked later via max_nr=
_colors
as you said. llc_size % llc_nr_ways =3D=3D 0 doesn't add anything imo. What=
 matters
the most is that max_nr_colors must be a power of 2.

Thanks.


> > +    }
> > +
> > +    /*
> > +     * The maximum number of colors must be a power of 2 in order to c=
orrectly
> > +     * map them to bits of an address.
> > +     */
> > +    max_nr_colors =3D way_size >> PAGE_SHIFT;
> > +
> > +    if ( max_nr_colors & (max_nr_colors - 1) )
> > +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr=
_colors);
> > +
> > +    if ( max_nr_colors > NR_LLC_COLORS )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "Number of LLC colors (%u) too big. Using configured ma=
x %u\n",
> > +               max_nr_colors, NR_LLC_COLORS);
> > +        max_nr_colors =3D NR_LLC_COLORS;
> > +    } else if ( max_nr_colors < 2 )
> > +        panic("Number of LLC colors %u < 2\n", max_nr_colors);
>
> Ah, here's a check guaranteeing at least the first of the two things aske=
d
> about above.
>
> Jan

