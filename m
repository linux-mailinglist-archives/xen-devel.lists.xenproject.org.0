Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596F9BF2DD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 17:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831249.1246453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8iba-0003RU-A6; Wed, 06 Nov 2024 16:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831249.1246453; Wed, 06 Nov 2024 16:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8iba-0003Ny-7I; Wed, 06 Nov 2024 16:10:02 +0000
Received: by outflank-mailman (input) for mailman id 831249;
 Wed, 06 Nov 2024 16:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0u0=SB=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t8ibY-0003HC-Un
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 16:10:01 +0000
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [2607:f8b0:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90a6697e-9c59-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 17:09:57 +0100 (CET)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a3b463e9b0so24336675ab.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 08:09:57 -0800 (PST)
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
X-Inumbo-ID: 90a6697e-9c59-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoxMmQiLCJoZWxvIjoibWFpbC1pbDEteDEyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkwYTY2OTdlLTljNTktMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA5Mzk3LjI2ODA2NCwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1730909396; x=1731514196; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrxTxPGTV9NGXRNReCq+aWbGNvfGaaC9bERcA/xijE4=;
        b=RbvJ/xoHN1Is+j6wuKlA0e8zYuTYpRsUSWp7+wGringzc1J34YRnhRtz9sECJq4IRX
         bF2yXasOn4yNh3BsLcJnBOTMZi2IQwovqp97p1sVyRoRxCmJbJLlsvTBChVx2YL+Z6RZ
         Y74W76BAQVjBdQeUZcNvLTNGuntFW5tPLNduDewBQhTH1gkI0pP47jYDDoa3GZcT03El
         rRWrUinIwCrgBD3u10XxbBObiA5lMr9AQZlXTMz75jU7fnivbYqSaZtImQ6ocLa6ItEl
         0Lgszz/LAIbM7HBwjhVPSB1dWEWoy8sfomgyzD4hN7/T/9t+0U92/h+zVcaB8lWuOqFs
         RTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909396; x=1731514196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrxTxPGTV9NGXRNReCq+aWbGNvfGaaC9bERcA/xijE4=;
        b=nSBBF7ARGj0VCPOjyUz2GX/H6v0vQHvpclBaGdk8+ubqYhSewjY1IRYOPz7uDj2hoT
         l2xHGmzaSdZu2blN4b+hYFo3tLGNY10eRlUOEJhHlcdLjZBtopy5hdkDHFsCL9xuWdmT
         asYRzKINZX+MBzrTr7NbPFWDvf2PzgFNdM14wzaDyRPf/Yr+e8B6reJFyPE0qrtKvKt7
         iN6lo81wKMOktBTx0lWUbz394E3JtGlmVvI+X99n38W+HdRyRy0oo4Y/uPU+bjikBWAx
         zCshX/b+g6gAC+6fuI5cJStgOqV1CBHktWz1LD9JIzO6Iq/mWaPbVun6+DA/PARIw/qb
         CslQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvZobY16qV3olq/MjdeEuLPfFMEe4Sqa8qVyifvfbwhrYn4bNq2F7jkBkyIDj8/gu/JZ7mj7NZ5RM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4If1iS+hLgnpxbsApdVNiRy4qjm5wvW4qaUhg20tA8rbMX3Oz
	ZBSkzgwzZgOxTJJD99mEwPwQ1HgM4WGYJ4knlhzqxEJ2UkW1SQdVuQwPV90ViCjxV4TLlHkGWtE
	WcHUK20ercPMhsYHFObZ6QbZhXjj4CeSBYPn6sg==
X-Google-Smtp-Source: AGHT+IELeOfsitgzW+hYdMc9WCJg6M8WvYDhaXMSHKrNspDZ/r1hbfFUfTWhBfKNuRRuTqkRWGakkiS3MU75BqnWeXs=
X-Received: by 2002:a05:6e02:1948:b0:3a6:c7a8:a1cc with SMTP id
 e9e14a558f8ab-3a6c7a8a3ccmr151767865ab.20.1730909395525; Wed, 06 Nov 2024
 08:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-2-carlo.nonato@minervasys.tech> <6e6f8e2a-ea16-4b48-ac70-23e72ade2b1a@suse.com>
In-Reply-To: <6e6f8e2a-ea16-4b48-ac70-23e72ade2b1a@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 6 Nov 2024 17:09:44 +0100
Message-ID: <CAG+AhRUtmpB1uSd5kW7zNjyDdmBcVCta9t5Qdu6ND+RYx3VUfQ@mail.gmail.com>
Subject: Re: [PATCH v9 01/13] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 4:46=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 25.10.2024 11:50, Carlo Nonato wrote:
> > Last Level Cache (LLC) coloring allows to partition the cache in smalle=
r
> > chunks called cache colors.
> >
> > Since not all architectures can actually implement it, add a HAS_LLC_CO=
LORING
> > Kconfig option.
> > MAX_LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 =3D=
 1024)
>
> Is the MAX_ here stale ...
>
> > because that's the number of colors that fit in a 4 KiB page when integ=
ers
> > are 4 bytes long.
> >
> > LLC colors are a property of the domain, so struct domain has to be ext=
ended.
> >
> > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> > v9:
> > - dropped _MAX_ from CONFIG_MAX_LLC_COLORS_ORDER
>
> ... with this change?

Yes.

> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1708,6 +1708,43 @@ This option is intended for debugging purposes o=
nly.  Enable MSR_DEBUGCTL.LBR
> >  in hypervisor context to be able to dump the Last Interrupt/Exception =
To/From
> >  record with other registers.
> >
> > +### llc-coloring (arm64)
> > +> `=3D <boolean>`
> > +
> > +> Default: `false`
> > +
> > +Flag to enable or disable LLC coloring support at runtime. This option=
 is
> > +available only when `CONFIG_LLC_COLORING` is enabled. See the general
> > +cache coloring documentation for more info.
> > +
> > +### llc-nr-ways (arm64)
> > +> `=3D <integer>`
> > +
> > +> Default: `Obtained from hardware`
> > +
> > +Specify the number of ways of the Last Level Cache. This option is ava=
ilable
> > +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of way=
s are used
> > +to find the number of supported cache colors. By default the value is
> > +automatically computed by probing the hardware, but in case of specifi=
c needs,
> > +it can be manually set. Those include failing probing and debugging/te=
sting
> > +purposes so that it's possible to emulate platforms with different num=
ber of
> > +supported colors. If set, also "llc-size" must be set, otherwise the d=
efault
> > +will be used. Note that using these two options implies "llc-coloring=
=3Don".
>
> Nit: Both here and ...
>
> > +### llc-size (arm64)
> > +> `=3D <size>`
> > +
> > +> Default: `Obtained from hardware`
> > +
> > +Specify the size of the Last Level Cache. This option is available onl=
y when
> > +`CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used=
 to find
> > +the number of supported cache colors. By default the value is automati=
cally
> > +computed by probing the hardware, but in case of specific needs, it ca=
n be
> > +manually set. Those include failing probing and debugging/testing purp=
oses so
> > +that it's possible to emulate platforms with different number of suppo=
rted
> > +colors. If set, also "llc-nr-ways" must be set, otherwise the default =
will be
> > +used. Note that using these two options implies "llc-coloring=3Don".
>
> ... here, maybe better s/these two/both/?

Ok.

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
> > @@ -516,4 +519,23 @@ config TRACEBUFFER
> >         to be collected at run time for debugging or performance analys=
is.
> >         Memory and execution overhead when not active is minimal.
> >
> > +config LLC_COLORING
> > +     bool "Last Level Cache (LLC) coloring" if EXPERT
> > +     depends on HAS_LLC_COLORING
> > +     depends on !NUMA
>
> Instead of this dependency, wouldn't it be more natural to suppress the
> setting of HAS_LLC_COLORING by an arch when NUMA is on?

So moving the "depends on" in the HAS_LLC_COLORING definition? Yes I believ=
e
it would be better.

> > --- /dev/null
> > +++ b/xen/common/llc-coloring.c
> > @@ -0,0 +1,111 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Last Level Cache (LLC) coloring common code
> > + *
> > + * Copyright (C) 2022 Xilinx Inc.
>
> Does this need updating (if it can't be dropped)?

I don't remember what's the current policy for these copyright lines.
Do you still use them? If they are used, should they reflect the history
of the revisions of the patch series? I mean, in v1 it was "2019 Xilinx Inc=
."
2023-2024 would then be MinervaSys.

> > + */
> > +#include <xen/keyhandler.h>
> > +#include <xen/llc-coloring.h>
> > +#include <xen/param.h>
> > +
> > +#define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
> > +
> > +static bool __ro_after_init llc_coloring_enabled;
> > +boolean_param("llc-coloring", llc_coloring_enabled);
> > +
> > +static unsigned int __initdata llc_size;
> > +size_param("llc-size", llc_size);
> > +static unsigned int __initdata llc_nr_ways;
> > +integer_param("llc-nr-ways", llc_nr_ways);
> > +/* Number of colors available in the LLC */
> > +static unsigned int __ro_after_init max_nr_colors;
> > +
> > +static void print_colors(const unsigned int *colors, unsigned int num_=
colors)
>
> Just to mention it here as well (I mentioned it elsewhere in the past):
> Personally I think that when function parameters denote array, array
> notation would also better be used. I.e. "const unsigned int colors[]"
> here. That'll then probably also bring us closer to using the upcoming
> (in gcc) counted_by attribute.

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
> > +    }
> > +
> > +    /*
> > +     * The maximum number of colors must be a power of 2 in order to c=
orrectly
> > +     * map them to bits of an address.
> > +     */
> > +    max_nr_colors =3D way_size >> PAGE_SHIFT;
>
> This discards low bits of the quotient calculated above, bearing a certai=
n
> risk that ...
>
> > +    if ( max_nr_colors & (max_nr_colors - 1) )
> > +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr=
_colors);
>
> ... this panic() wrongly doesn't trigger.

Yes, but I don't care if way_size isn't a power of 2.

> Jan

- Carlo

