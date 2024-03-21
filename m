Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F314A885B5F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 16:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696433.1087363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnJxL-00033n-55; Thu, 21 Mar 2024 15:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696433.1087363; Thu, 21 Mar 2024 15:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnJxL-000324-1x; Thu, 21 Mar 2024 15:03:47 +0000
Received: by outflank-mailman (input) for mailman id 696433;
 Thu, 21 Mar 2024 15:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xA2=K3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rnJxJ-00031w-SP
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 15:03:46 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35e0cc06-e794-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 16:03:44 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56bcbad7ee2so874133a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 08:03:44 -0700 (PDT)
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
X-Inumbo-ID: 35e0cc06-e794-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711033423; x=1711638223; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ471QdbdomVThs/AZhYCLeWm0QKMxVE9383lGDlnkg=;
        b=Aa/rB64AprcJOE8ctmc+BLOVqoie2uSQQ/ZoqeAxZ9TcN2PprppyKNM6Cgo9By2B0L
         RfhWAyGVttaJX3fummiiIlrOGYOzJYBRMI9V9L5aLm0tX/qW58rx/4ZAI+u9M++ruhq+
         ysRxtm605TAcN7O+ZMUba+oDG1OMkIQWb1F/i3H9rJ39U3aNeqdfjGLJDISOuJEPceKk
         WiqgDAeO4KdQcTu/4a4pwW8IpKMV/JyM2T8hN7+m3J3bHc930zrPct9EqjS3EZGN8N9B
         p+PsDGi85CH99QmMbDXFQ7ekaGDPymBvW8UZOS2kBiAX+7Ct2/TDXewpqEAAkVCT0Ps8
         DWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711033423; x=1711638223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJ471QdbdomVThs/AZhYCLeWm0QKMxVE9383lGDlnkg=;
        b=euZSj+nRPwhMzUTZ6eNFaP5ZDHU5zNrJ60nq7jWzcMlzDhnxtXa43Jj/nKfdltjPDP
         kQ9qEo0p9pOBNmKCo6Z9UEo2+flIgi8/dtDnXQ9Z1zxhXIE6VBZ9qCitBwMjDEQD8EUE
         j5r6jNsjIervEJW4SsccTcrjnjWRJm5He/PiK3Yr7aBi5MvII42XUXHQoYTbj0IAs5EN
         QvOehX2esRUcWHDRUafiBpWc1BVZUePa0jk6Nluy3uJS8Cn74UmtAgMEYR4KcylGN7Y3
         27EBUOGdqd1YChSxg0WwQtFJHJm8fmvpI0lRlM1aLPReqKG/S13LFwcN2qT91BY/zkRL
         Iv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWV13TGm9lBg7/yzaH6RE3jffkY/KawkYkgOL1dHM2/6Uq6nkpPDIOyeWMnY/kL8nfBdXrave4NzmGJLYsENlT5s8NcYyS98+63QLeY4I8=
X-Gm-Message-State: AOJu0Ywt4GJ1UyjF+Q54NG0OCG6/yKDN3CmPXQwj8kR+cAbvZx04iaI7
	uk0UHAvCDkXFQYLQ6uhVS0JjjSDv9SaSbKRUgFQdo67UDHpowcov7vDUhOYV16PUeT+nbL3KrJZ
	p0jZZwbvzpGsDfBBPs3O/pEDMQw3Cd27WW5AotQ==
X-Google-Smtp-Source: AGHT+IHuB98ig8yynu78T42PA1YSLU9bRswrfCBD74X2gUwfygEoKKEMQgNdUgFKYjpHDHcBVDwSpZ1UYRI9ANv6qQw=
X-Received: by 2002:a17:907:7248:b0:a46:e4dc:25ab with SMTP id
 ds8-20020a170907724800b00a46e4dc25abmr6507202ejc.47.1711033423375; Thu, 21
 Mar 2024 08:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-2-carlo.nonato@minervasys.tech> <05e4d3da-4130-4c57-9855-43b685ce5005@suse.com>
In-Reply-To: <05e4d3da-4130-4c57-9855-43b685ce5005@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 21 Mar 2024 16:03:32 +0100
Message-ID: <CAG+AhRU4W+umVhOHn0ZnHvex-rmEn4+T_mKVczYG4o52EV+YtA@mail.gmail.com>
Subject: Re: [PATCH v7 01/14] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrea Bastoni <andrea.bastoni@minervasys.tech>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

(adding Andrea Bastoni in cc)

On Tue, Mar 19, 2024 at 3:58=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.03.2024 11:58, Carlo Nonato wrote:
> > +Background
> > +**********
> > +
> > +Cache hierarchy of a modern multi-core CPU typically has first levels =
dedicated
> > +to each core (hence using multiple cache units), while the last level =
is shared
> > +among all of them. Such configuration implies that memory operations o=
n one
> > +core (e.g. running a DomU) are able to generate interference on anothe=
r core
> > +(e.g. hosting another DomU). Cache coloring realizes per-set cache-par=
titioning
> > +in software and mitigates this, guaranteeing higher and more predictab=
le
> > +performances for memory accesses.
>
> Are you sure about "higher"? On an otherwise idle system, a single domain=
 (or
> vCPU) may perform better when not partitioned, as more cache would be ava=
ilable
> to it overall.

I'll drop "higher" and leave the rest.

> > +How to compute the number of colors
> > +###################################
> > +
> > +Given the linear mapping from physical memory to cache lines for grant=
ed, the
> > +number of available colors for a specific platform is computed using t=
hree
> > +parameters:
> > +
> > +- the size of the LLC.
> > +- the number of the LLC ways.
> > +- the page size used by Xen.
> > +
> > +The first two parameters can be found in the processor manual, while t=
he third
> > +one is the minimum mapping granularity. Dividing the cache size by the=
 number of
> > +its ways we obtain the size of a way. Dividing this number by the page=
 size,
> > +the number of total cache colors is found. So for example an Arm Corte=
x-A53
> > +with a 16-ways associative 1 MiB LLC can isolate up to 16 colors when =
pages are
> > +4 KiB in size.
> > +
> > +LLC size and number of ways are probed automatically by default so the=
re's
> > +should be no need to compute the number of colors by yourself.
>
> Is this a leftover from the earlier (single) command line option?

Nope, but I can drop it since it's already stated below.

> > +Effective colors assignment
> > +###########################
> > +
> > +When assigning colors:
> > +
> > +1. If one wants to avoid cache interference between two domains, diffe=
rent
> > +   colors needs to be used for their memory.
> > +
> > +2. To improve spatial locality, color assignment should privilege cont=
inuity in
>
> s/privilege/prefer/ ?
>
> > +   the partitioning. E.g., assigning colors (0,1) to domain I and (2,3=
) to
> > +   domain J is better than assigning colors (0,2) to I and (1,3) to J.
>
> While I consider 1 obvious without further explanation, the same isn't
> the case for 2: What's the benefit of spatial locality? If there was
> support for allocating higher order pages, I could certainly see the
> point, but iirc that isn't supported (yet).

I'll drop point 2.

> > +Command line parameters
> > +***********************
> > +
> > +Specific documentation is available at `docs/misc/xen-command-line.pan=
doc`.
> > +
> > ++----------------------+-------------------------------+
> > +| **Parameter**        | **Description**               |
> > ++----------------------+-------------------------------+
> > +| ``llc-coloring``     | enable coloring at runtime    |
> > ++----------------------+-------------------------------+
> > +| ``llc-size``         | set the LLC size              |
> > ++----------------------+-------------------------------+
> > +| ``llc-nr-ways``      | set the LLC number of ways    |
> > ++----------------------+-------------------------------+
> > +
> > +Auto-probing of LLC specs
> > +#########################
> > +
> > +LLC size and number of ways are probed automatically by default.
> > +
> > +LLC specs can be manually set via the above command line parameters. T=
his
> > +bypasses any auto-probing and it's used to overcome failing situations=
 or for
> > +debugging/testing purposes.
>
> As well as perhaps for cases where the auto-probing logic is flawed?

This is what I meant with "overcome failing situations", but I'll be more
explicit.

> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1706,6 +1706,43 @@ This option is intended for debugging purposes o=
nly.  Enable MSR_DEBUGCTL.LBR
> >  in hypervisor context to be able to dump the Last Interrupt/Exception =
To/From
> >  record with other registers.
> >
> > +### llc-coloring
> > +> `=3D <boolean>`
> > +
> > +> Default: `false`
> > +
> > +Flag to enable or disable LLC coloring support at runtime. This option=
 is
> > +available only when `CONFIG_LLC_COLORING` is enabled. See the general
> > +cache coloring documentation for more info.
> > +
> > +### llc-nr-ways
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
> > +purposes so that it's possibile to emulate platforms with different nu=
mber of
> > +supported colors. If set, also "llc-size" must be set, otherwise the d=
efault
> > +will be used.
> > +
> > +### llc-size
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
> > +that it's possibile to emulate platforms with different number of supp=
orted
> > +colors. If set, also "llc-nr-ways" must be set, otherwise the default =
will be
> > +used.
>
> Wouldn't it make sense to infer "llc-coloring" when both of the latter op=
tions
> were supplied?

To me it looks a bit strange that specifying some attributes of the cache
automatically enables cache coloring. Also it would require some changes in
how to express the auto-probing for such attributes.

> > --- a/xen/arch/Kconfig
> > +++ b/xen/arch/Kconfig
> > @@ -31,3 +31,23 @@ config NR_NUMA_NODES
> >         associated with multiple-nodes management. It is the upper boun=
d of
> >         the number of NUMA nodes that the scheduler, memory allocation =
and
> >         other NUMA-aware components can handle.
> > +
> > +config LLC_COLORING
> > +     bool "Last Level Cache (LLC) coloring" if EXPERT
> > +     depends on HAS_LLC_COLORING
> > +     depends on !NUMA
> > +
> > +config NR_LLC_COLORS
> > +     int "Maximum number of LLC colors"
> > +     range 2 1024
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
> > +       more than what's needed in the general case. Use only power of =
2 values.
>
> I think I said so before: Rather than telling people to pick only power-o=
f-2
> values (and it remaining unclear what happens if they don't), why don't y=
ou
> simply keep them from specifying anything bogus, by having them pass in t=
he
> value to use as a power of 2? I.e. "range 1 10" and "default 7" for what
> you're currently putting in place.

I'll do that.

> > +       1024 is the number of colors that fit in a 4 KiB page when inte=
gers are 4
> > +       bytes long.
>
> How's this relevant here? As a justification it would make sense to have =
in
> the description.

I'll move it.

> I'm btw also not convinced this is a good place to put these options. Imo=
 ...
>
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -71,6 +71,9 @@ config HAS_IOPORTS
> >  config HAS_KEXEC
> >       bool
> >
> > +config HAS_LLC_COLORING
> > +     bool
> > +
> >  config HAS_PMAP
> >       bool
>
> ... they'd better live further down from here.

Ok.

> > --- /dev/null
> > +++ b/xen/common/llc-coloring.c
> > @@ -0,0 +1,102 @@
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
> > +{
> > +    unsigned int i;
> > +
> > +    printk("{ ");
> > +    for ( i =3D 0; i < num_colors; i++ )
> > +    {
> > +        unsigned int start =3D colors[i], end =3D start;
> > +
> > +        printk("%u", start);
> > +
> > +        for ( ; i < num_colors - 1 && end + 1 =3D=3D colors[i + 1]; i+=
+, end++ )
> > +            ;
> > +
> > +        if ( start !=3D end )
> > +            printk("-%u", end);
> > +
> > +        if ( i < num_colors - 1 )
> > +            printk(", ");
> > +    }
> > +    printk(" }\n");
> > +}
> > +
> > +void __init llc_coloring_init(void)
> > +{
> > +    unsigned int way_size;
> > +
> > +    if ( !llc_coloring_enabled )
> > +        return;
> > +
> > +    if ( llc_size && llc_nr_ways )
> > +        way_size =3D llc_size / llc_nr_ways;
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
> > +
> > +    if ( max_nr_colors & (max_nr_colors - 1) )
> > +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr=
_colors);
> > +
> > +    if ( max_nr_colors < 2 || max_nr_colors > CONFIG_NR_LLC_COLORS )
> > +        panic("Number of LLC colors (%u) not in range [2, %u]\n",
> > +              max_nr_colors, CONFIG_NR_LLC_COLORS);
>
> Rather than crashing when max_nr_colors is too large, couldn't you simply
> halve it a number of times? That would still satisfy the requirement on
> isolation, wouldn't it?

Well I could simply set it to CONFIG_NR_LLC_COLORS at this point.

> > +    arch_llc_coloring_init();
> > +}
> > +
> > +void cf_check dump_llc_coloring_info(void)
>
> I don't think cf_check is needed here nor ...
>
> > +void cf_check domain_dump_llc_colors(const struct domain *d)
>
> ... here anymore. You're using direct calls now.

Ok.

> Jan

Thanks.

