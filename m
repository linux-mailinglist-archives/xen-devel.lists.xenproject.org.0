Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A0854AC5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680786.1058905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFgk-0002Ro-0j; Wed, 14 Feb 2024 13:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680786.1058905; Wed, 14 Feb 2024 13:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFgj-0002Pu-UD; Wed, 14 Feb 2024 13:52:37 +0000
Received: by outflank-mailman (input) for mailman id 680786;
 Wed, 14 Feb 2024 13:52:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U0HE=JX=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1raFgi-0002Po-M8
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:52:36 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dce86a2-cb40-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 14:52:34 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so7997520a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:52:34 -0800 (PST)
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
X-Inumbo-ID: 4dce86a2-cb40-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1707918753; x=1708523553; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NaW3+T/ol5E+Y89aSouGRO7U38Mk+SYTtVoYAoju/Q=;
        b=wblwJ0wKiGY0MZsjq5lVQJmgvqRelOU9/oQDrpBUjceVLOG2fSbZl4DJs5K21mth72
         RhQnJMFXVF06sdjHZF4q8z29FCR9+dY2ry4zuwqyrxAbWK9jpakS4+XRzflaTDiLgJfa
         R9Txg+gdfQzqUvcy1I/EiS8XJthgqp8n+pcnNrQGLB/FeuTJbLI7wvEP1zeAgdFQ+ThN
         r9Y3pdew4bVwa3ljRW9z1lphM2S/ggbHdMbnqfhOK1ia29GT0majahgs9SbOSZC0T7s7
         CvU0lSWohqiFMe8DCM5S/XE6b1YkKH9zAVVgHJ0fD6JE0/egPHtMuFQhAmkMxCfvs0pV
         H7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707918753; x=1708523553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NaW3+T/ol5E+Y89aSouGRO7U38Mk+SYTtVoYAoju/Q=;
        b=iGHoB2tK0GnAvzBCYWbEoO8+p2u/FfdnIiJ7pi57OG6Tr/IagRVTRq6gnVyKuKx3ty
         VxeB6nZAViqpuWqfbqGiyPzxCWbIYim1JFk6QAtc/4MHi/9lVbtrKHllWCVl3rV5rXNO
         mb5lqL2FbTaZ/1WkBgCEMnxbvLFftY9fN5+wBYUrvKbIwPW1WTXZ3OFEZCJAWJufj6GW
         iw0HdZs4gx1ESpLnGCKOILL1WkObVffU6oV16ywFkwi1dKzycJF2nC1saYeR6aoHLiZv
         DBw5zBJ3qc6wGIq7FBBd0mv3kfn0nLMr6qI4BCF0UN2oTXX/a9Yj1wi9gm/+OdEnxMPb
         IVEg==
X-Gm-Message-State: AOJu0Yy3uUY0N+Xxs5IZBL2pXHJc3cJ6o+2BjXpPlrsYKlRekdVMrlFq
	li/bIncjiDL45HWLmLKcrgc1/chVcI39dInDAeqRCy+729oPE7xWcu8GtydAsVcmHCQfPFiRhGr
	ZZyo/wYXNYhOdD7ic7If7OC1PZxuPAilM5fsGLg==
X-Google-Smtp-Source: AGHT+IGjh/jJ7IWOkhA0kpBufUqMaFMNEUojI7L46nCdB1H3t7WN2gPAV59OPAr9WCcuBnmB0VBzDRQwHnax6+SCM5w=
X-Received: by 2002:aa7:d7cb:0:b0:562:1441:81f0 with SMTP id
 e11-20020aa7d7cb000000b00562144181f0mr1941792eds.7.1707918753324; Wed, 14 Feb
 2024 05:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-3-carlo.nonato@minervasys.tech> <bb28c8a2-c2bd-4e1d-ad28-9bc632e3e474@amd.com>
In-Reply-To: <bb28c8a2-c2bd-4e1d-ad28-9bc632e3e474@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 14 Feb 2024 14:52:22 +0100
Message-ID: <CAG+AhRXsZC7Pjdce42yYTvBy7MyjS1axrDGsY0U=o+APNyxdYA@mail.gmail.com>
Subject: Re: [PATCH v6 02/15] xen/arm: add initial support for LLC coloring on arm64
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, Feb 14, 2024 at 11:14=E2=80=AFAM Michal Orzel <michal.orzel@amd.com=
> wrote:
>
> Hi Carlo,
>
> On 29/01/2024 18:17, Carlo Nonato wrote:
> >
> >
> > LLC coloring needs to know the last level cache layout in order to make=
 the
> > best use of it. This can be probed by inspecting the CLIDR_EL1 register=
,
> > so the Last Level is defined as the last level visible by this register=
.
> > Note that this excludes system caches in some platforms.
> >
> > Static memory allocation and cache coloring are incompatible because st=
atic
> > memory can't be guaranteed to use only colors assigned to the domain.
> > Panic during DomUs creation when both are enabled.
> >
> > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> > v6:
> > - get_llc_way_size() now checks for at least separate I/D caches
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
> >  docs/misc/cache-coloring.rst         | 11 ++++
> >  xen/arch/arm/Kconfig                 |  1 +
> >  xen/arch/arm/Makefile                |  1 +
> >  xen/arch/arm/dom0less-build.c        |  6 +++
> >  xen/arch/arm/include/asm/processor.h | 16 ++++++
> >  xen/arch/arm/llc-coloring.c          | 75 ++++++++++++++++++++++++++++
> >  xen/arch/arm/setup.c                 |  3 ++
> >  7 files changed, 113 insertions(+)
> >  create mode 100644 xen/arch/arm/llc-coloring.c
> >
> > diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rs=
t
> > index 9fe01e99e1..0535b5c656 100644
> > --- a/docs/misc/cache-coloring.rst
> > +++ b/docs/misc/cache-coloring.rst
> > @@ -85,3 +85,14 @@ More specific documentation is available at `docs/mi=
sc/xen-command-line.pandoc`.
> >  +----------------------+-------------------------------+
> >  | ``llc-way-size``     | set the LLC way size          |
> >  +----------------------+-------------------------------+
> > +
> > +Known issues and limitations
> > +****************************
> > +
> > +"xen,static-mem" isn't supported when coloring is enabled
> > +#########################################################
> > +
> > +In the domain configuration, "xen,static-mem" allows memory to be stat=
ically
> > +allocated to the domain. This isn't possible when LLC coloring is enab=
led,
> > +because that memory can't be guaranteed to use only colors assigned to=
 the
> > +domain.
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 50e9bfae1a..55143f86a9 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -8,6 +8,7 @@ config ARM_64
> >         depends on !ARM_32
> >         select 64BIT
> >         select HAS_FAST_MULTIPLY
> > +       select HAS_LLC_COLORING
> >
> >  config ARM
> >         def_bool y
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index 33c677672f..c9a1cd298d 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -37,6 +37,7 @@ obj-$(CONFIG_IOREQ_SERVER) +=3D ioreq.o
> >  obj-y +=3D irq.o
> >  obj-y +=3D kernel.init.o
> >  obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
> > +obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
> >  obj-y +=3D mem_access.o
> >  obj-y +=3D mm.o
> >  obj-y +=3D monitor.o
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-buil=
d.c
> > index fb63ec6fd1..1142f7f74a 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -5,6 +5,7 @@
> >  #include <xen/grant_table.h>
> >  #include <xen/iocap.h>
> >  #include <xen/libfdt/libfdt.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/sched.h>
> >  #include <xen/serial.h>
> >  #include <xen/sizes.h>
> > @@ -879,7 +880,12 @@ void __init create_domUs(void)
> >              panic("No more domain IDs available\n");
> >
> >          if ( dt_find_property(node, "xen,static-mem", NULL) )
> > +        {
> > +            if ( llc_coloring_enabled )
> > +                panic("LLC coloring and static memory are incompatible=
\n");
> > +
> >              flags |=3D CDF_staticmem;
> > +        }
> >
> >          if ( dt_property_read_bool(node, "direct-map") )
> >          {
> > diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/includ=
e/asm/processor.h
> > index 8e02410465..336933ee62 100644
> > --- a/xen/arch/arm/include/asm/processor.h
> > +++ b/xen/arch/arm/include/asm/processor.h
> > @@ -18,6 +18,22 @@
> >  #define CTR_IDC_SHIFT       28
> >  #define CTR_DIC_SHIFT       29
> >
> > +/* CCSIDR Current Cache Size ID Register */
> > +#define CCSIDR_LINESIZE_MASK            _AC(0x7, ULL)
> Why ULL and not UL? ccsidr is of register_t type

Julien, while reviewing an earlier version:

> Please use ULL here otherwise someone using MASK << SHIFT will have the
> expected result.

https://patchew.org/Xen/20220826125111.152261-1-carlo.nonato@minervasys.tec=
h/20220826125111.152261-2-carlo.nonato@minervasys.tech/#08956082-c194-8bae-=
cb25-44e4e3227689@xen.org

>
> > +#define CCSIDR_NUMSETS_SHIFT            13
> > +#define CCSIDR_NUMSETS_MASK             _AC(0x3fff, ULL)
> > +#define CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX 32
> > +#define CCSIDR_NUMSETS_MASK_FEAT_CCIDX  _AC(0xffffff, ULL)
> > +
> > +/* CSSELR Cache Size Selection Register */
> > +#define CSSELR_LEVEL_MASK  _AC(0x7, UL)
> > +#define CSSELR_LEVEL_SHIFT 1
> > +
> > +/* CLIDR Cache Level ID Register */
> > +#define CLIDR_CTYPEn_SHIFT(n) (3 * (n - 1))
> n should be within parentheses
>
> > +#define CLIDR_CTYPEn_MASK     _AC(0x7, UL)
> > +#define CLIDR_CTYPEn_LEVELS   7
> > +
> >  #define ICACHE_POLICY_VPIPT  0
> >  #define ICACHE_POLICY_AIVIVT 1
> >  #define ICACHE_POLICY_VIPT   2
> > diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> > new file mode 100644
> > index 0000000000..eee1e80e2d
> > --- /dev/null
> > +++ b/xen/arch/arm/llc-coloring.c
> > @@ -0,0 +1,75 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Last Level Cache (LLC) coloring support for ARM
> > + *
> > + * Copyright (C) 2022 Xilinx Inc.
> > + */
> > +#include <xen/llc-coloring.h>
> > +#include <xen/types.h>
> > +
> > +#include <asm/processor.h>
> > +#include <asm/sysregs.h>
> > +
> > +/* Return the LLC way size by probing the hardware */
> > +unsigned int __init get_llc_way_size(void)
> > +{
> > +    register_t ccsidr_el1;
> > +    register_t clidr_el1 =3D READ_SYSREG(CLIDR_EL1);
> > +    register_t csselr_el1 =3D READ_SYSREG(CSSELR_EL1);
> > +    register_t id_aa64mmfr2_el1 =3D READ_SYSREG(ID_AA64MMFR2_EL1);
> > +    uint32_t ccsidr_numsets_shift =3D CCSIDR_NUMSETS_SHIFT;
> > +    uint32_t ccsidr_numsets_mask =3D CCSIDR_NUMSETS_MASK;
> > +    unsigned int n, line_size, num_sets;
> > +
> > +    for ( n =3D CLIDR_CTYPEn_LEVELS; n !=3D 0; n-- )
> > +    {
> > +        uint8_t ctype_n =3D (clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) &
> > +                          CLIDR_CTYPEn_MASK;
> > +
> > +        /* At least separate I/D caches (see Arm ARM DDI 0487H.a D13.2=
.27) */
> I'm a bit confused here given that this comment does not reflect the line=
 below (also please refer to the latest spec).
> Since 0b011 is "Separate instruction and data caches" you would break onl=
y for Unified cache.
> That said, we care about last level cache that is visible to SW and I'm n=
ot aware of any Arm CPU where L2,L3 is not unified.

You're right, that should have been >=3D.
Anyway I can check more explicitly for =3D=3D 0b100.

> > +        if ( ctype_n > 0b011 )
> > +            break;
> > +    }
> > +
> > +    if ( n =3D=3D 0 )
> > +        return 0;
> > +
> > +    WRITE_SYSREG((n - 1) << CSSELR_LEVEL_SHIFT, CSSELR_EL1);
> > +
> no need for this empty line
>
> > +    isb();
> > +
> > +    ccsidr_el1 =3D READ_SYSREG(CCSIDR_EL1);
> > +
> > +    /* Arm ARM: (Log2(Number of bytes in cache line)) - 4 */
> > +    line_size =3D 1U << ((ccsidr_el1 & CCSIDR_LINESIZE_MASK) + 4);
> > +
> > +    /* If FEAT_CCIDX is enabled, CCSIDR_EL1 has a different bit layout=
 */
> > +    if ( (id_aa64mmfr2_el1 >> ID_AA64MMFR2_CCIDX_SHIFT) & 0x7 )
> > +    {
> > +        ccsidr_numsets_shift =3D CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX;
> > +        ccsidr_numsets_mask =3D CCSIDR_NUMSETS_MASK_FEAT_CCIDX;
> > +    }
> empty line here please
>
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
> > +void __init arch_llc_coloring_init(void) {}
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
> > index 59dd9bb25a..14cb023783 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -12,6 +12,7 @@
> >  #include <xen/device_tree.h>
> >  #include <xen/domain_page.h>
> >  #include <xen/grant_table.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/types.h>
> >  #include <xen/string.h>
> >  #include <xen/serial.h>
> > @@ -746,6 +747,8 @@ void asmlinkage __init start_xen(unsigned long boot=
_phys_offset,
> >      printk("Command line: %s\n", cmdline);
> >      cmdline_parse(cmdline);
> >
> > +    llc_coloring_init();
> I think a check with llc_coloring_enabled is missing, given there is none=
 in llc_coloring_init

You're right. It should have been in llc_coloring_init(), my bad.

Thanks.

> ~Michal
>

