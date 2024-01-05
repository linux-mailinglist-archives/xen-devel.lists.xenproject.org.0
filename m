Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900282583C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 17:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662262.1032301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLn9a-00025n-Lj; Fri, 05 Jan 2024 16:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662262.1032301; Fri, 05 Jan 2024 16:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLn9a-00023J-Iy; Fri, 05 Jan 2024 16:34:38 +0000
Received: by outflank-mailman (input) for mailman id 662262;
 Fri, 05 Jan 2024 16:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Ewp=IP=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rLn9Z-00023D-6z
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 16:34:37 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f19bba0-abe8-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 17:34:34 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55590da560dso2063148a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 08:34:34 -0800 (PST)
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
X-Inumbo-ID: 4f19bba0-abe8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704472474; x=1705077274; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8kd6+sf4DWEw/vzbqh3Vxw/aTUg0tifj/myOQQrXK0=;
        b=y5WBUg0rE4p9+++zDx5A5ocaHyB94pm8nRJ0iv0Z0B0X2lyq/fv+n/+1z7aqTtpN8e
         0mjYqqAHFhkRDjL2Km/SnTF/2t0bOZGvDPDv9XM1bSzk0ap1grf4wPa8wNC+P2KiOjkL
         +Kj/eKbCvUs2yIfQb+7WLr7/KC1+fCzvfc2Wwc5No9BenHxOebXF4AGaJSF52PQUp2V0
         P2fFNetnJcWqXp8w6kWkEM+tR4Q5S3/u0EC2FF17LO7MoLQS6WClS8ksOU9WlN/Ssmsu
         wg5+AihAiNJPavSABx8LSnr22WIV2PHkGZUNAk1hI9Nw1OJ7CFzsUoczAbMANFu9B9ny
         EO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704472474; x=1705077274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8kd6+sf4DWEw/vzbqh3Vxw/aTUg0tifj/myOQQrXK0=;
        b=GoGsDmyJna28bLUf31pSOldoKz5SBocDaRH1xrxJ3n++EnzCCY5JuZECIBixJoRfFm
         NX0fT7HUgEJf6efxJuOuj53mAt3w3sFImqwWTMF7D5zfbxHgg9lgQ78OkEZ401yxcLUh
         x0AX+dIx6e4w05tjPoMNIP8FSO7aDTpUMQcXEsBS/TDq0J4X3J0RJDZJwkiurAzPsm6a
         dFnNkd1teeS4rGgNfJOKZF1rsM2CFiaPZrsjGb/6mai4Lb9vBGBONeOsuVG7NfETaLa4
         yffyeQoTHjxu8FbvMKvqbv1dasawb8jTEMzj55GPkshpLvH4tlK3haSvd6yMVYgy1aiW
         7Alg==
X-Gm-Message-State: AOJu0YyvOhmr7fpTzFmP46XJaQprKM+KoMDdzeNhUDl8JFiNadqm19pk
	JYv1A4A3TR0BImdEHWA1PqCXkSWkOfsZ9TcbfZkwdhq4l5fkvA==
X-Google-Smtp-Source: AGHT+IHT3dgc5MZKBSjw1/qJvBhhILlbNAvAOZx4DsDQpeMtLg4IR0eRuK4HEwu3dSSAZMwInNdfrllUVNcJezlw08Y=
X-Received: by 2002:a17:906:6d04:b0:a23:5c13:20ce with SMTP id
 m4-20020a1709066d0400b00a235c1320cemr1283635ejr.144.1704472473695; Fri, 05
 Jan 2024 08:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-3-carlo.nonato@minervasys.tech> <5eb9fa24-c95e-4ea0-84ef-be74c629c106@xen.org>
In-Reply-To: <5eb9fa24-c95e-4ea0-84ef-be74c629c106@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 5 Jan 2024 17:34:22 +0100
Message-ID: <CAG+AhRW5Xxy7BHVhmfkBqbdeKqRz7E1Mrc7wNv6F+ecM4P_QPw@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] xen/arm: add cache coloring initialization
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Thu, Jan 4, 2024 at 8:25=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi Carlo,
>
> On 02/01/2024 09:51, Carlo Nonato wrote:
> > This commit implements functions declared in the LLC coloring common he=
ader
> > for arm64 and adds documentation. It also adds two command line options=
: a
> > runtime switch for the cache coloring feature and the LLC way size
> > parameter.
> >
> > The feature init function consists of an auto probing of the cache layo=
ut
> > necessary to retrieve the LLC way size which is used to compute the num=
ber
> > of platform colors. It also adds a debug-key to dump general cache colo=
ring
> > info.
> >
> > Static memory allocation and cache coloring are incompatible because st=
atic
> > memory can't be guaranteed to use only colors assigned to the domain.
> > Panic during domUs creation when both are enabled.
> >
> > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> > v5:
> > - used - instead of _ for filenames
> > - moved static-mem check in this patch
> > - moved dom0 colors parsing in next patch
> > - moved color allocation and configuration in next patch
> > - moved check_colors() in next patch
> > - colors are now printed in short form
> > v4:
> > - added "llc-coloring" cmdline option for the boot-time switch
> > - dom0 colors are now checked during domain init as for any other domai=
n
> > - fixed processor.h masks bit width
> > - check for overflow in parse_color_config()
> > - check_colors() now checks also that colors are sorted and unique
> > ---
> >   docs/misc/arm/cache-coloring.rst        |  97 ++++++++++++++
> >   docs/misc/xen-command-line.pandoc       |  28 +++++
> >   xen/arch/arm/Kconfig                    |   1 +
> >   xen/arch/arm/Makefile                   |   1 +
> >   xen/arch/arm/dom0less-build.c           |   6 +
> >   xen/arch/arm/include/asm/llc-coloring.h |  28 +++++
> >   xen/arch/arm/include/asm/processor.h    |  16 +++
> >   xen/arch/arm/llc-coloring.c             | 161 +++++++++++++++++++++++=
+
> >   xen/arch/arm/setup.c                    |   7 ++
> >   9 files changed, 345 insertions(+)
> >   create mode 100644 docs/misc/arm/cache-coloring.rst
> >   create mode 100644 xen/arch/arm/include/asm/llc-coloring.h
> >   create mode 100644 xen/arch/arm/llc-coloring.c
> >
> > diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-col=
oring.rst
> > new file mode 100644
> > index 0000000000..eabf8f5d1b
> > --- /dev/null
> > +++ b/docs/misc/arm/cache-coloring.rst
> > @@ -0,0 +1,97 @@
> > +Xen cache coloring user guide
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +The cache coloring support in Xen allows to reserve Last Level Cache (=
LLC)
> > +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is sup=
ported.
> > +
> > +To compile LLC coloring support set ``CONFIG_LLC_COLORING=3Dy``.
> > +
> > +If needed, change the maximum number of colors with
> > +``CONFIG_NR_LLC_COLORS=3D<n>``.
> > +
> > +Compile Xen and the toolstack and then configure it via
> > +`Command line parameters`_.
> > +
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
> > +(e.g .hosting another DomU). Cache coloring allows eliminating this
> > +mutual interference, and thus guaranteeing higher and more predictable
> > +performances for memory accesses.
> > +The key concept underlying cache coloring is a fragmentation of the me=
mory
> > +space into a set of sub-spaces called colors that are mapped to disjoi=
nt cache
> > +partitions. Technically, the whole memory space is first divided into =
a number
> > +of subsequent regions. Then each region is in turn divided into a numb=
er of
> > +subsequent sub-colors. The generic i-th color is then obtained by all =
the
> > +i-th sub-colors in each region.
> > +
> > +::
> > +
> > +                            Region j            Region j+1
> > +                .....................   ............
> > +                .                     . .
> > +                .                       .
> > +            _ _ _______________ _ _____________________ _ _
> > +                |     |     |     |     |     |     |
> > +                | c_0 | c_1 |     | c_n | c_0 | c_1 |
> > +           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
> > +                    :                       :
> > +                    :                       :...         ... .
> > +                    :                            color 0
> > +                    :...........................         ... .
> > +                                                :
> > +          . . ..................................:
> > +
> > +There are two pragmatic lesson to be learnt.
> > +
> > +1. If one wants to avoid cache interference between two domains, diffe=
rent
> > +   colors needs to be used for their memory.
> > +
> > +2. Color assignment must privilege contiguity in the partitioning. E.g=
.,
> > +   assigning colors (0,1) to domain I  and (2,3) to domain  J is bette=
r than
> > +   assigning colors (0,2) to I and (1,3) to J.
> > +
> > +How to compute the number of colors
> > +***********************************
> > +
> > +To compute the number of available colors for a specific platform, the=
 size of
> > +an LLC way and the page size used by Xen must be known.
>
> Looking at the get_llc_way_size(), you are using CLIDR_EL1 which doesn't
> contains the system caches. They are invisible to the software but I
> guess could have an impact for cache coloring.
>
> Can you clarify if by Last Cache Level, you mean the last visible cache?

We are targeting only Cortex-A53, A57 and A72 where the "last level" is L2.
This "generic" approach for last level computation is inevitably problemati=
c,
but I think that defining it as the last visible cache is the best thing we
can do. Remember also that this computation is overridable with the
appropriate command line parameter, so it's still possible to target
cache architectures that aren't discovered by this code (which are rare cas=
es
since cache-coloring is already a small niche).

> > The first parameter can
> > +be found in the processor manual or can be also computed dividing the =
total
> > +cache size by the number of its ways. The second parameter is the mini=
mum
> > +amount of memory that can be mapped by the hypervisor, thus dividing t=
he way
> > +size by the page size, the number of total cache partitions is found. =
So for
> > +example, an Arm Cortex-A53 with a 16-ways associative 1 MiB LLC, can i=
solate up
> > +to 16 colors when pages are 4 KiB in size.
> > +
> > +Cache layout is probed automatically by Xen itself, but a possibility =
to
> > +manually set the way size it's left for the user to overcome failing s=
ituations
> > +or for debugging/testing purposes. See `Command line parameters`_ for =
more
> > +information on that.
> > +
> > +Command line parameters
> > +***********************
> > +
> > +More specific documentation is available at `docs/misc/xen-command-lin=
e.pandoc`.
> > +
> > ++----------------------+-------------------------------+
> > +| **Parameter**        | **Description**               |
> > ++----------------------+-------------------------------+
> > +| ``llc-coloring``     | enable coloring at runtime    |
> > ++----------------------+-------------------------------+
> > +| ``llc-way-size``     | set the LLC way size          |
> > ++----------------------+-------------------------------+
> > +
> > +Known issues and limitations
> > +****************************
> > +
> > +"xen,static-mem" isn't supported when coloring is enabled
> > +#########################################################
> > +
> > +In the domain configuration, "xen,static-mem" allows memory to be stat=
ically
> > +allocated to the domain. This isn't possibile when LLC coloring is ena=
bled,
> > +because that memory can't be guaranteed to use only colors assigned to=
 the
> > +domain.
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index 8e65f8bd18..22d2d5b6cf 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1713,6 +1713,34 @@ This option is intended for debugging purposes o=
nly.  Enable MSR_DEBUGCTL.LBR
> >   in hypervisor context to be able to dump the Last Interrupt/Exception=
 To/From
> >   record with other registers.
> >
> > +### llc-coloring (arm64)
> > +> `=3D <boolean>`
> > +
> > +> Default: `false`
> > +
> > +Flag to enable or disable LLC coloring support at runtime. This option=
s is
> > +available only when `CONFIG_LLC_COLORING` is enabled. See the general
> > +cache coloring documentation for more info.
> > +
> > +### llc-way-size (arm64)
> > +> `=3D <size>`
> > +
> > +> Default: `Obtained from the hardware`
> > +
> > +Specify the way size of the Last Level Cache. This options is availabl=
e only
> > +when `CONFIG_LLC_COLORING` is enabled. It is an optional, expert-only =
parameter
> > +and it is used to calculate the number of available LLC colors on the =
platform.
> > +It can be obtained by dividing the total LLC size by the number of its
> > +associative ways.
> > +By default, the value is automatically computed by probing the hardwar=
e, but in
> > +case of specific needs, it can be manually set. Those include failing =
probing
> > +and debugging/testing purposes so that it's possibile to emulate platf=
orms with
>
> typo: s/possibile/possible/
>
> > +different number of supported colors.
> > +An important detail to highlight is that the current implementation of=
 the
> > +cache coloring technique requires the number of colors to be a power o=
f 2, and
> > +consequently, also the LLC way size must be so. A value that doesn't m=
atch this
> > +requirement is aligned down to the previous power of 2.
>
> Possibly a matter of taste here, but I would prefer if we simply throw
> an error. This makes more obvious that the size provided by the user was
> incorrect.
>
> > +
> >   ### lock-depth-size
> >   > `=3D <integer>`
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 50e9bfae1a..55143f86a9 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -8,6 +8,7 @@ config ARM_64
> >       depends on !ARM_32
> >       select 64BIT
> >       select HAS_FAST_MULTIPLY
> > +     select HAS_LLC_COLORING
> >
> >   config ARM
> >       def_bool y
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index 33c677672f..c9a1cd298d 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -37,6 +37,7 @@ obj-$(CONFIG_IOREQ_SERVER) +=3D ioreq.o
> >   obj-y +=3D irq.o
> >   obj-y +=3D kernel.init.o
> >   obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
> > +obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
> >   obj-y +=3D mem_access.o
> >   obj-y +=3D mm.o
> >   obj-y +=3D monitor.o
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-buil=
d.c
> > index fb63ec6fd1..1142f7f74a 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -5,6 +5,7 @@
> >   #include <xen/grant_table.h>
> >   #include <xen/iocap.h>
> >   #include <xen/libfdt/libfdt.h>
> > +#include <xen/llc-coloring.h>
> >   #include <xen/sched.h>
> >   #include <xen/serial.h>
> >   #include <xen/sizes.h>
> > @@ -879,7 +880,12 @@ void __init create_domUs(void)
> >               panic("No more domain IDs available\n");
> >
> >           if ( dt_find_property(node, "xen,static-mem", NULL) )
> > +        {
> > +            if ( llc_coloring_enabled )
> > +                panic("LLC coloring and static memory are incompatible=
\n");
> > +
> >               flags |=3D CDF_staticmem;
> > +        }
> >
> >           if ( dt_property_read_bool(node, "direct-map") )
> >           {
> > diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/inc=
lude/asm/llc-coloring.h
> > new file mode 100644
> > index 0000000000..7885e9e3f5
> > --- /dev/null
> > +++ b/xen/arch/arm/include/asm/llc-coloring.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
> Please use GPL-2.0-only.
>
> > +/*
> > + * Last Level Cache (LLC) coloring support for ARM
> > + *
> > + * Copyright (C) 2022 Xilinx Inc.
> > + *
> > + * Authors:
> > + *    Luca Miccio <lucmiccio@gmail.com>
> > + *    Carlo Nonato <carlo.nonato@minervasys.tech>
>
> Same question as before for the authorship.
>
> > + */
> > +#ifndef __ASM_ARM_COLORING_H__
> > +#define __ASM_ARM_COLORING_H__
> > +
> > +#include <xen/init.h>
> > +
> > +bool __init llc_coloring_init(void);
>
> The __init attribute is not necessary here. It is sufficient on the
> definition.
>
> > +
> > +#endif /* __ASM_ARM_COLORING_H__ */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/includ=
e/asm/processor.h
> > index 8e02410465..fd5e8eba98 100644
> > --- a/xen/arch/arm/include/asm/processor.h
> > +++ b/xen/arch/arm/include/asm/processor.h
> > @@ -18,6 +18,22 @@
> >   #define CTR_IDC_SHIFT       28
> >   #define CTR_DIC_SHIFT       29
> >
> > +/* CCSIDR Current Cache Size ID Register */
> > +#define CCSIDR_LINESIZE_MASK            _AC(0x7, ULL)
> > +#define CCSIDR_NUMSETS_SHIFT            13
> > +#define CCSIDR_NUMSETS_MASK             _AC(0x3fff, ULL)
> > +#define CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX 32
> > +#define CCSIDR_NUMSETS_MASK_FEAT_CCIDX  _AC(0xffffff, ULL)
> > +
> > +/* CCSELR Cache Size Selection Register */
>
> Typo: s/CCSELR/CSSELR/
>
> > +#define CCSELR_LEVEL_MASK  _AC(0x7, UL)
> > +#define CCSELR_LEVEL_SHIFT 1
> > +
> > +/* CLIDR Cache Level ID Register */
> > +#define CLIDR_CTYPEn_SHIFT(n) (3 * (n - 1))
> > +#define CLIDR_CTYPEn_MASK     _AC(0x7, UL)
> > +#define CLIDR_CTYPEn_LEVELS   7
> > +
> >   #define ICACHE_POLICY_VPIPT  0
> >   #define ICACHE_POLICY_AIVIVT 1
> >   #define ICACHE_POLICY_VIPT   2
> > diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> > new file mode 100644
> > index 0000000000..37d647f038
> > --- /dev/null
> > +++ b/xen/arch/arm/llc-coloring.c
> > @@ -0,0 +1,161 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
> GPL-2.0-only
>
> > +/*
> > + * Last Level Cache (LLC) coloring support for ARM
> > + *
> > + * Copyright (C) 2022 Xilinx Inc.
> > + *
> > + * Authors:
> > + *    Luca Miccio <lucmiccio@gmail.com>
> > + *    Carlo Nonato <carlo.nonato@minervasys.tech>
>
> Same question as before for the authorship.
>
> > + */
> > +#include <xen/errno.h>
> > +#include <xen/keyhandler.h>
> > +#include <xen/llc-coloring.h>
> > +#include <xen/param.h>
> > +#include <xen/types.h>
> > +
> > +#include <asm/processor.h>
> > +#include <asm/sysregs.h>
> > +
> > +bool __ro_after_init llc_coloring_enabled;
> > +boolean_param("llc-coloring", llc_coloring_enabled);
> > +
> > +/* Size of an LLC way */
> > +static unsigned int __ro_after_init llc_way_size;
> > +size_param("llc-way-size", llc_way_size);
> > +/* Number of colors available in the LLC */
> > +static unsigned int __ro_after_init nr_colors =3D CONFIG_NR_LLC_COLORS=
;
> > +
> > +/* Return the LLC way size by probing the hardware */
> > +static unsigned int __init get_llc_way_size(void)
> > +{
> > +    register_t ccsidr_el1;
> > +    register_t clidr_el1 =3D READ_SYSREG(CLIDR_EL1);
> > +    register_t csselr_el1 =3D READ_SYSREG(CSSELR_EL1);
> > +    register_t id_aa64mmfr2_el1 =3D READ_SYSREG(ID_AA64MMFR2_EL1);
> > +    uint32_t ccsidr_numsets_shift =3D CCSIDR_NUMSETS_SHIFT;
> > +    uint32_t ccsidr_numsets_mask =3D CCSIDR_NUMSETS_MASK;
> > +    unsigned int n, line_size, num_sets;
> > +
> > +    for ( n =3D CLIDR_CTYPEn_LEVELS;
> > +          n !=3D 0 && !((clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) & CLIDR_C=
TYPEn_MASK);
> > +          n-- );
> > +
> > +    if ( n =3D=3D 0 )
> > +        return 0;
>
>
> Shouldn't you check cache type of the level is either 0b011 (Separate
> instruction and cache) or 0b100 (Unified cache)?

Yes this is better.

> > +
> > +    WRITE_SYSREG(((n - 1) & CCSELR_LEVEL_MASK) << CCSELR_LEVEL_SHIFT,
>
> NIT: masking (n - 1) looks a bit odd as it already indicates the cache
> level. It actually made me wonder if the other bits have a meaning. So I
> would drop the mask.
>
> > +                 CSSELR_EL1);
> > +    isb();
> > +
> > +    ccsidr_el1 =3D READ_SYSREG(CCSIDR_EL1);
> > +
> > +    /* Arm ARM: (Log2(Number of bytes in cache line)) - 4 */
> > +    line_size =3D 1 << ((ccsidr_el1 & CCSIDR_LINESIZE_MASK) + 4);
>
> Please use 1U even thought the shift should not be big enough to result
> to an overflow.
>
> > +
> > +    /* If FEAT_CCIDX is enabled, CCSIDR_EL1 has a different bit layout=
 */
> > +    if ( (id_aa64mmfr2_el1 >> ID_AA64MMFR2_CCIDX_SHIFT) & 0x7 )
> > +    {
> > +        ccsidr_numsets_shift =3D CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX;
> > +        ccsidr_numsets_mask =3D CCSIDR_NUMSETS_MASK_FEAT_CCIDX;
> > +    }
> > +    /* Arm ARM: (Number of sets in cache) - 1 */
> > +    num_sets =3D ((ccsidr_el1 >> ccsidr_numsets_shift) & ccsidr_numset=
s_mask) + 1;
> > +
> > +    printk(XENLOG_INFO "LLC found: L%u (line size: %u bytes, sets num:=
 %u)\n",
> > +           n, line_size, num_sets);
> > +
> > +    /* Restore value in CSSELR_EL1 */
> > +    WRITE_SYSREG(csselr_el1, CSSELR_EL1);
> > +    isb();
> > +
> > +    return line_size * num_sets;
> > +}
> > +
> > +static void print_colors(unsigned int *colors, unsigned int num_colors=
)
>
> I think colors can be const. In general, I would prefer if
> variable/parameters that should not be modified are const.
>
> > +{
> > +    unsigned int i;
> > +
> > +    printk("{ ");
> > +    for ( i =3D 0; i < num_colors; i++ ) {
> > +        unsigned int start =3D colors[i], end =3D colors[i];
> > +
> > +        printk("%u", start);
> > +
> > +        for ( ;
> > +              i < num_colors - 1 && colors[i] + 1 =3D=3D colors[i + 1]=
;
> > +              i++, end++ );
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
> > +static void dump_coloring_info(unsigned char key)
> > +{
> > +    printk("'%c' pressed -> dumping LLC coloring general info\n", key)=
;
> > +    printk("LLC way size: %u KiB\n", llc_way_size >> 10);
> > +    printk("Number of LLC colors supported: %u\n", nr_colors);
> > +}
> > +
> > +bool __init llc_coloring_init(void)
> > +{
> > +    if ( !llc_way_size && !(llc_way_size =3D get_llc_way_size()) )
> > +    {
> > +        printk(XENLOG_ERR
> > +               "Probed LLC way size is 0 and no custom value provided\=
n");
> > +        return false;
> > +    }
> > +
> > +    /*
> > +     * The maximum number of colors must be a power of 2 in order to c=
orrectly
> > +     * map them to bits of an address, so also the LLC way size must b=
e so.
> > +     */
> > +    if ( llc_way_size & (llc_way_size - 1) )
> > +    {
> > +        printk(XENLOG_WARNING "LLC way size (%u) isn't a power of 2.\n=
",
> > +               llc_way_size);
> > +        llc_way_size =3D 1U << flsl(llc_way_size);
> > +        printk(XENLOG_WARNING
> > +               "Using %u instead. Performances will be suboptimal\n",
> > +               llc_way_size);
> > +    }
> > +
> > +    nr_colors =3D llc_way_size >> PAGE_SHIFT;
> > +
> > +    if ( nr_colors < 2 || nr_colors > CONFIG_NR_LLC_COLORS )
>
> I didn't find any documentation explaining why we need at least two
> colors. I guess you want to make sure that there is a color for Xen and
> domain. But I wonder what could wrong with just one color (other than
> been pointless)?

Yes, it would just be pointless. I'll change it to 1.

> > +    {
> > +        printk(XENLOG_ERR "Number of LLC colors (%u) not in range [2, =
%u]\n",
> > +               nr_colors, CONFIG_NR_LLC_COLORS);
> > +        return false;
> > +    }
> > +
> > +    register_keyhandler('K', dump_coloring_info, "dump LLC coloring in=
fo", 1);
> > +
> > +    return true;
> > +}
> > +
> > +void domain_llc_coloring_free(struct domain *d)
> > +{
> > +    xfree(d->llc_colors);
> > +}
> > +
> > +void domain_dump_llc_colors(struct domain *d)
> > +{
> > +    printk("Domain %pd has %u LLC colors: ", d, d->num_llc_colors);
> > +    print_colors(d->llc_colors, d->num_llc_colors);
> > +}
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 59dd9bb25a..4c16b566db 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -12,6 +12,7 @@
> >   #include <xen/device_tree.h>
> >   #include <xen/domain_page.h>
> >   #include <xen/grant_table.h>
> > +#include <xen/llc-coloring.h>
> >   #include <xen/types.h>
> >   #include <xen/string.h>
> >   #include <xen/serial.h>
> > @@ -746,6 +747,12 @@ void asmlinkage __init start_xen(unsigned long boo=
t_phys_offset,
> >       printk("Command line: %s\n", cmdline);
> >       cmdline_parse(cmdline);
> >
> > +    if ( llc_coloring_enabled )
>
> I would consider to move llc_coloring_enabled in llc_coloring_init().
> But if you prefer to keep the check here, then I would at least request
> to merge the two ifs. I.e.
>
> if ( llc_coloring_enabled && !llc_coloring_init() )
>
> That said...
>
> > +    {
> > +        if ( !llc_coloring_init() )
> > +            panic("Xen LLC coloring support: setup failed\n");
> > +    }
> > +
> >       setup_mm();
>
> ... shouldn't the coloring happen in setup_mm()? After all, this is part
> of the memory subystem and I suspect this will not work with the
> upcoming MPU support.

Coloring initialization must happen before setup_pagetables() otherwise it
isn't possible to color the hypervisor code. In later patches
setup_pagetables() is moved after coloring init so I don't think it would
make sense to have it in setup_mm().

> >
> >       /* Parse the ACPI tables for possible boot-time configuration */
>
> Cheers,
>
> --
> Julien Grall

Thanks.

