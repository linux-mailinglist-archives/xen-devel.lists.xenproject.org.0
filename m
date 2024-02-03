Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25B848547
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 11:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675346.1050713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWDiq-0003ki-Gx; Sat, 03 Feb 2024 10:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675346.1050713; Sat, 03 Feb 2024 10:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWDiq-0003j9-D9; Sat, 03 Feb 2024 10:58:08 +0000
Received: by outflank-mailman (input) for mailman id 675346;
 Sat, 03 Feb 2024 10:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBn0=JM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rWDip-0003h9-JZ
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 10:58:07 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb78267-c283-11ee-98f5-efadbce2ee36;
 Sat, 03 Feb 2024 11:58:05 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d093cb1ef3so9009941fa.3
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2024 02:58:05 -0800 (PST)
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
X-Inumbo-ID: 1bb78267-c283-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706957885; x=1707562685; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDdMAAimSpageKWRimuNsLBbYmOtOFz0XiaG4cD/bQk=;
        b=ExAKcnosm83uXg9SvUMILTSpWU7KIEI3GiNrLPEmqrTwaeQTJW+FDwss1YTP+PRqZs
         1IKw5usqKN4qBd4LO1mIwvCHbxex+sM6XF1Jn1l06p1cxVtWQf6gnX9/GGC03Dl3mpmV
         pZmSoayZcp7gzowX1bUWaSXcMy1n/6PvpGK+oK82HbZQe64BkI21IZQ/NgO7r84mH3Pr
         aHc5fnhuAjly6HSst3hA9num2LDb8oAHOJfTcuqCLMTinYSfnekEzglr26mgVRbsFCv6
         LCOMOj1XRIucHqeWzrlpIde+HfD9At5MKQXsOfI/bTNGf9viLl4AHkPzLmt3/+uIAir8
         Cogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706957885; x=1707562685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDdMAAimSpageKWRimuNsLBbYmOtOFz0XiaG4cD/bQk=;
        b=DjsrhTvCdcH+XmSdySGUEycQhfYX9On4NzmnVRx7x41hXVCFpzIfy6har+VpO+Yxbm
         BCs4IyjfDOfzf++mLU1rUdJey5DTaYszQcHkKTSTxmestcCsKK7Zyl0irWkV/h9TfZfF
         QCyhrzWe329wDjp4Ad7Iz5gMWmTvtmQHjy0vyNGT8MqZ/XRJ8OSvYnJ4BtWKTvj2ueE/
         iJ0MG2CWXfeG8m26L1wfx+MRNkhqRVNOpExZ1wvlEsdc5NnCmZJnHDXaQZAoG3nGbo/3
         A4mES4Uzu3C0aoY41IeDXDhpJ2VTHvmhcN3ZL7BUy6IupfLITNlChxT53UP7FIKHGtg3
         BePg==
X-Gm-Message-State: AOJu0YzpPp9n+1Se27Gpg9BBEGff4VcYDiRWUMrfdaJP6cSujCQrEQcl
	63B1VQBEfOZ9UL5n2ti98zcIXBPeHUCSmmf0HMfgK4xQO+GpAxHwMsnvwk2pNHu9LT55miw5ClF
	2GlscHqMGzU3dN0eZX83O7uNXYiwQWfrLlti54Q==
X-Google-Smtp-Source: AGHT+IGxlFsF5RYpqn/+fabSdxDEQBFSIQV+PRRLuuqMtWbDgRoYvgPrSFU9Zorx3+fRMvJVSiJ+gV5K6h1B5EVhClc=
X-Received: by 2002:a2e:2201:0:b0:2d0:8eff:431e with SMTP id
 i1-20020a2e2201000000b002d08eff431emr1732528lji.44.1706957885043; Sat, 03 Feb
 2024 02:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech> <749799db-de6f-4ca8-bab1-67468f97929b@suse.com>
In-Reply-To: <749799db-de6f-4ca8-bab1-67468f97929b@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Sat, 3 Feb 2024 11:57:54 +0100
Message-ID: <CAG+AhRV8gPdbm5MK6-g_DO+=KNrakWs82xMCGDMGy05Rxngvtg@mail.gmail.com>
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Feb 1, 2024 at 1:59=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 29.01.2024 18:17, Carlo Nonato wrote:
> > --- a/xen/arch/Kconfig
> > +++ b/xen/arch/Kconfig
> > @@ -31,3 +31,20 @@ config NR_NUMA_NODES
> >         associated with multiple-nodes management. It is the upper boun=
d of
> >         the number of NUMA nodes that the scheduler, memory allocation =
and
> >         other NUMA-aware components can handle.
> > +
> > +config LLC_COLORING
> > +     bool "Last Level Cache (LLC) coloring" if EXPERT
> > +     depends on HAS_LLC_COLORING
> > +
> > +config NR_LLC_COLORS
> > +     int "Maximum number of LLC colors"
> > +     range 2 1024
>
> What's the reasoning behind this upper bound? IOW - can something to this
> effect be said in the description, please?

The only reason is that this is the number of colors that fit in a 4 KiB pa=
ge.
I don't have any other good way of picking a number here. 1024 is already b=
ig
and probably nobody would use such a configuration. But 512 or 256 would be
equally arbitrary.

> > +     default 128
> > +     depends on LLC_COLORING
> > +     help
> > +       Controls the build-time size of various arrays associated with =
LLC
> > +       coloring. Refer to cache coloring documentation for how to comp=
ute the
> > +       number of colors supported by the platform. This is only an upp=
er
> > +       bound. The runtime value is autocomputed or manually set via cm=
dline.
> > +       The default value corresponds to an 8 MiB 16-ways LLC, which sh=
ould be
> > +       more than what needed in the general case.
>
> Aiui while not outright wrong, non-power-of-2 values are meaningless to
> specify. Perhaps that is worth mentioning (if not making this a value
> that's used as exponent of 2 in the first place)?

Yes, I prefer a better help message.

> As to the default and its description: As said for the documentation,
> doesn't what this corresponds to also depend on cache line size? Even
> if this was still Arm-specific rather than common code, I'd question
> whether now and forever Arm chips may only use one pre-determined cache
> line size.

I hope I answered in the previous mail why the line size (in the specific c=
ase
we are applying coloring to) can be ignored as a parameter in favor of cach=
e
size and number of ways.

> > --- /dev/null
> > +++ b/xen/common/llc-coloring.c
> > @@ -0,0 +1,87 @@
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
> > +bool __ro_after_init llc_coloring_enabled;
> > +boolean_param("llc-coloring", llc_coloring_enabled);
>
> The variable has no use right now afaics, so it's unclear whether (a) it
> is legitimately non-static and (b) placed in an appropriate section.

My bad here. The variable should be tested for in llc_coloring_init() and i=
n
domain_dump_llc_colors() (in domain_llc_coloring_free() as well, in later
patches). That change was lost in the rebase of the series.

Anyway per this patch, the global is only accessed from this file while it'=
s
going to be accessed from outside in later patches. In this case what shoul=
d
I do? Declare it static and then make it non-static afterwards?

> > +/* Size of an LLC way */
> > +static unsigned int __ro_after_init llc_way_size;
> > +size_param("llc-way-size", llc_way_size);
> > +/* Number of colors available in the LLC */
> > +static unsigned int __ro_after_init max_nr_colors =3D CONFIG_NR_LLC_CO=
LORS;
> > +
> > +static void print_colors(const unsigned int *colors, unsigned int num_=
colors)
> > +{
> > +    unsigned int i;
> > +
> > +    printk("{ ");
> > +    for ( i =3D 0; i < num_colors; i++ ) {
>
> Nit (style): Brace placement.
>
> > +        unsigned int start =3D colors[i], end =3D colors[i];
> > +
> > +        printk("%u", start);
> > +
> > +        for ( ;
> > +              i < num_colors - 1 && colors[i] + 1 =3D=3D colors[i + 1]=
;
>
> To reduce the number of array accesses, may I suggest to use "end + 1"
> here instead of "colors[i] + 1"? (The initializer of "end" could also
> be "start", but I guess the compiler will recognize this anyway.) This
> would then (imo) also better justify the desire for having "end" in
> the first place.
>
> > +              i++, end++ );
>
> Imo for clarity the semicolon want to live on its own line.
>
> > +static void dump_coloring_info(unsigned char key)
>
> This being common code now, I think it would be good practice to have
> cf_check here right away, even if for now (for whatever reason) the
> feature is meant to be limited to Arm. (Albeit see below for whether
> this is to remain that way.)
>
> > +void __init llc_coloring_init(void)
> > +{
> > +    if ( !llc_way_size && !(llc_way_size =3D get_llc_way_size()) )
> > +        panic("Probed LLC coloring way size is 0 and no custom value f=
ound\n");
> > +
> > +    /*
> > +     * The maximum number of colors must be a power of 2 in order to c=
orrectly
> > +     * map them to bits of an address, so also the LLC way size must b=
e so.
> > +     */
> > +    if ( llc_way_size & (llc_way_size - 1) )
> > +        panic("LLC coloring way size (%u) isn't a power of 2\n", llc_w=
ay_size);
> > +
> > +    max_nr_colors =3D llc_way_size >> PAGE_SHIFT;
>
> With this unconditionally initialized here, what's the purpose of the
> variable's initializer?

Previously I was using the global in parse_color_config() (later introduced=
),
but since now I'm not doing it anymore I can drop the initializer.

> > +    if ( max_nr_colors < 2 || max_nr_colors > CONFIG_NR_LLC_COLORS )
> > +        panic("Number of LLC colors (%u) not in range [2, %u]\n",
> > +              max_nr_colors, CONFIG_NR_LLC_COLORS);
>
> I'm not convinced of panic()ing here (including the earlier two
> instances). You could warn, taint, disable, and continue. If you want
> to stick to panic(), please justify doing so in the description.
>
> Plus, if you panic(), shouldn't that be limited to llc_coloring_enabled
> being true? Or - not visible here, due to the lack of a caller of the
> function - is that meant to be taken care of by the caller (to not call
> here when the flag is off)? I think it would be cleaner if the check
> lived here; quite possibly that would then further permit the flag
> variable to become static.

You're right. As I said here the check on llc_coloring_enabled is missing.
Obviously it's an error doing the initialization no matter what.

> > +    register_keyhandler('K', dump_coloring_info, "dump LLC coloring in=
fo", 1);
>
> I'm also not convinced of using a separate key for this little bit of
> information. How about attaching this to what 'm' or 'H' produce?

Ok. 'm' seems the right place.

> > +    arch_llc_coloring_init();
> > +}
> > +
> > +void domain_dump_llc_colors(const struct domain *d)
> > +{
> > +    printk("Domain %pd has %u LLC colors: ", d, d->num_llc_colors);
>
> %pd resolves to d<N> - why "Domain" as a prefix? And really - why the
> domain identifier in the first place? All surrounding information is
> already for this very domain.
>
> > +    print_colors(d->llc_colors, d->num_llc_colors);
>
> Imo this (or perhaps even the entire function) wants skipping when
> num_llc_colors is zero, which would in particular also cover the
> !llc_coloring_enabled case.

This shouldn't be possible. As I said this function should be a no-op when
!llc_coloring_enabled.

Thanks.

> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -626,6 +626,11 @@ struct domain
> >
> >      /* Holding CDF_* constant. Internal flags for domain creation. */
> >      unsigned int cdf;
> > +
> > +#ifdef CONFIG_LLC_COLORING
> > +    unsigned const int *llc_colors;
>
> const unsigned int * please.
>
> Jan

