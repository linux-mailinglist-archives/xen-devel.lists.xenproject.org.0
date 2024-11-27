Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D789DA86C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 14:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844833.1260333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGI2H-00056x-Kw; Wed, 27 Nov 2024 13:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844833.1260333; Wed, 27 Nov 2024 13:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGI2H-00053p-IC; Wed, 27 Nov 2024 13:24:53 +0000
Received: by outflank-mailman (input) for mailman id 844833;
 Wed, 27 Nov 2024 13:24:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfX9=SW=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tGI2G-00053g-3x
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 13:24:52 +0000
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [2607:f8b0:4864:20::d2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f87dbdc7-acc2-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 14:24:47 +0100 (CET)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-8418a2f596fso121861839f.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 05:24:47 -0800 (PST)
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
X-Inumbo-ID: f87dbdc7-acc2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpkMmEiLCJoZWxvIjoibWFpbC1pbzEteGQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY4N2RiZGM3LWFjYzItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzEzODg3LjMzNDIyNCwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732713886; x=1733318686; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqgPsMUQ1TS+2wIGPjrTVsu/91Ojz5raqby82SiYszI=;
        b=fKd8M+S91tckt/Xun2FFU+QBuB+AR0kVK3YNtkIT7Stbr6llrWxhZDKQJNuGYI7TmI
         Fm2dCIkZpz+4rmGiJBTmHCHpvkSm6JrACQInCUinYw/2XEFO5cKBoVTeiHt+pAFORbyx
         CqB42w1uABaVhilYvdbh9+icm+T3lMZT9oXPaJnHgG2n91mV8aGeVLvKZcxDqRvT6JyX
         eV98cOyororRbXsttNRbveahldBNQiEsnvliyx571h4KOQweLG5fPpwePU15vsX/s+1N
         kaHNmPUfguv431l2u11NIA4yM8L8DEs3ab4xnzvwy5a8A0zAylt4Uu5LJ+fogfFoUIXX
         XuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732713886; x=1733318686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqgPsMUQ1TS+2wIGPjrTVsu/91Ojz5raqby82SiYszI=;
        b=CHZgHS2n1DpHQj+OfsgMMBrrujHN6iWQDJd3zavicGNgMq4Oiq7+fwLyD3T3mHY8BZ
         3K+OgRJvqt71Dl6sRzeAHFsZZXPyfCiZ8Pycw8u1PYdaA0UWuT5qTed9bD7zeTT0H0gB
         ANAlzxMFHeZfZRnmMRKsqyTyv3VTlu4kAp5tF8HMkSeH/aOdp04HFk4GvcLVGFMZjaIe
         XRIycPEZ7gjHWrI0LdJ4ssoLKfPlfzb3bhr9ET/MNjaX/QudZ5G8ukum+JAAvAopBjsP
         HGIpykVOFUQiNKWhfhpGgAZh4NDYhZV/r6Wxkq3PSG1aFElMHb/LueO0Ym/b2Xh40j8X
         q23g==
X-Gm-Message-State: AOJu0YwKy9T8FiJ4uY0/KCIbsOcvkzJRPveuOCDIt+zXqAb0I6TPWXNP
	cnpTxdg7DnJsDsPqVHjAHrAzq7wvqlqrCeG0h70AkLHixudEZvP/NmrJ2wWpJp4HrgLxXvKTCSS
	E1CzyRTD9CTWyRpV8CcN2uZnkyLCEdvZD2kb/xA==
X-Gm-Gg: ASbGncsVdPYC/C14xFNJHnXUV95PEO2NJUGm/NikslizBdAFN3fOiGAM3LdFJ9BwWqx
	+YSEOKCSlczGrgjODn/ByORhVbs1sDdRY
X-Google-Smtp-Source: AGHT+IGNJaR3bZcFQnmq/OlOpO8IdvBnYKOZb1fdEQzVtW7mF+EEjE+5WWsYKzBVjTDWCI5IHO7MERiiC6Ig6ICx1LM=
X-Received: by 2002:a05:6602:150e:b0:843:ec8d:be00 with SMTP id
 ca18e2360f4ac-843ed021f2bmr337286739f.13.1732713885804; Wed, 27 Nov 2024
 05:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-2-carlo.nonato@minervasys.tech> <93c0a25f-4edc-4d21-8767-48d496cc3575@amd.com>
In-Reply-To: <93c0a25f-4edc-4d21-8767-48d496cc3575@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 27 Nov 2024 14:24:34 +0100
Message-ID: <CAG+AhRW+5XUk8KBFiB9LO6h=7W4nmXn_ZDtPuC+sUFgckKR_HQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/12] xen/common: add cache coloring common code
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, Nov 27, 2024 at 11:48=E2=80=AFAM Michal Orzel <michal.orzel@amd.com=
> wrote:
> On 19/11/2024 15:13, Carlo Nonato wrote:
> >
> >
> > Last Level Cache (LLC) coloring allows to partition the cache in smalle=
r
> > chunks called cache colors.
> >
> > Since not all architectures can actually implement it, add a HAS_LLC_CO=
LORING
> > Kconfig option.
> > LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 =3D 102=
4)
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
> > v10:
> > - fixed commit message to use LLC_COLORS_ORDER
> > - added documentation to index.rst
> > - moved check on CONFIG_NUMA in arch/arm/Kconfig (next patch)
> > - fixed copyright line
> > - fixed array type for colors parameter in print_colors()
> > - added check on (way_size & ~PAGE_MASK)
> > v9:
> > - dropped _MAX_ from CONFIG_MAX_LLC_COLORS_ORDER
> > v8:
> > - minor documentation fixes
> > - "llc-coloring=3Don" is inferred from "llc-nr-ways" and "llc-size" usa=
ge
> > - turned CONFIG_NR_LLC_COLORS to CONFIG_MAX_LLC_COLORS_ORDER, base-2 ex=
ponent
> > - moved Kconfig options to common/Kconfig
> > - don't crash if computed max_nr_colors is too large
> > v7:
> > - SUPPORT.md changes added to this patch
> > - extended documentation to better address applicability of cache color=
ing
> > - "llc-nr-ways" and "llc-size" params introduced in favor of "llc-way-s=
ize"
> > - moved dump_llc_coloring_info() call in 'm' keyhandler (pagealloc_info=
())
> > v6:
> > - moved almost all code in common
> > - moved documentation in this patch
> > - reintroduced range for CONFIG_NR_LLC_COLORS
> > - reintroduced some stub functions to reduce the number of checks on
> >   llc_coloring_enabled
> > - moved domain_llc_coloring_free() in same patch where allocation happe=
ns
> > - turned "d->llc_colors" to pointer-to-const
> > - llc_coloring_init() now returns void and panics if errors are found
> > v5:
> > - used - instead of _ for filenames
> > - removed domain_create_llc_colored()
> > - removed stub functions
> > - coloring domain fields are now #ifdef protected
> > v4:
> > - Kconfig options moved to xen/arch
> > - removed range for CONFIG_NR_LLC_COLORS
> > - added "llc_coloring_enabled" global to later implement the boot-time
> >   switch
> > - added domain_create_llc_colored() to be able to pass colors
> > - added is_domain_llc_colored() macro
> > ---
> >  SUPPORT.md                        |   7 ++
> >  docs/index.rst                    |   1 +
> >  docs/misc/cache-coloring.rst      | 116 ++++++++++++++++++++++++++++++
> >  docs/misc/xen-command-line.pandoc |  37 ++++++++++
> >  xen/common/Kconfig                |  21 ++++++
> >  xen/common/Makefile               |   1 +
> >  xen/common/keyhandler.c           |   3 +
> >  xen/common/llc-coloring.c         | 115 +++++++++++++++++++++++++++++
> >  xen/common/page_alloc.c           |   3 +
> >  xen/include/xen/llc-coloring.h    |  37 ++++++++++
> >  xen/include/xen/sched.h           |   5 ++
> >  11 files changed, 346 insertions(+)
> >  create mode 100644 docs/misc/cache-coloring.rst
> >  create mode 100644 xen/common/llc-coloring.c
> >  create mode 100644 xen/include/xen/llc-coloring.h
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index 82239d0294..998faf5635 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -401,6 +401,13 @@ by maintaining multiple physical to machine (p2m) =
memory mappings.
> >      Status, x86 HVM: Tech Preview
> >      Status, ARM: Tech Preview
> >
> > +### Cache coloring
> > +
> > +Allows to reserve Last Level Cache (LLC) partitions for Dom0, DomUs an=
d Xen
> > +itself.
> > +
> > +    Status, Arm64: Experimental
> > +
> >  ## Resource Management
> >
> >  ### CPU Pools
> > diff --git a/docs/index.rst b/docs/index.rst
> > index ab051a0f38..fad4462bbb 100644
> > --- a/docs/index.rst
> > +++ b/docs/index.rst
> > @@ -65,6 +65,7 @@ Documents in need of some rearranging.
> >     designs/launch/hyperlaunch-devicetree
> >     misc/xen-makefiles/makefiles
> >     misra/index
> > +   misc/cache-coloring
> >
> >
> >  Miscellanea
> > diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rs=
t
> > new file mode 100644
> > index 0000000000..0fe3830c40
> > --- /dev/null
> > +++ b/docs/misc/cache-coloring.rst
> > @@ -0,0 +1,116 @@
> You're missing SPDX tag at the top of the RST file:
> .. SPDX-License-Identifier: CC-BY-4.0
>
> > +Xen cache coloring user guide
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +The cache coloring support in Xen allows to reserve Last Level Cache (=
LLC)
> > +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is sup=
ported.
> > +Cache coloring realizes per-set cache partitioning in software and is =
applicable
> > +to shared LLCs as implemented in Cortex-A53, Cortex-A72 and similar CP=
Us.
> > +
> > +To compile LLC coloring support set ``CONFIG_LLC_COLORING=3Dy``.
> > +
> > +If needed, change the maximum number of colors with
> > +``CONFIG_LLC_COLORS_ORDER=3D<n>``.
> > +
> > +Runtime configuration is done via `Command line parameters`_.
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
> > +(e.g. hosting another DomU). Cache coloring realizes per-set cache-par=
titioning
> > +in software and mitigates this, guaranteeing more predictable performa=
nces for
> > +memory accesses.
> > +Software-based cache coloring is particularly useful in those situatio=
ns where
> > +no hardware mechanisms (e.g., DSU-based way partitioning) are availabl=
e to
> > +partition caches. This is the case for e.g., Cortex-A53, A57 and A72 C=
PUs that
> > +feature a L2 LLC cache shared among all cores.
> > +
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
> > +How colors are actually defined depends on the function that maps memo=
ry to
> > +cache lines. In case of physically-indexed, physically-tagged caches w=
ith linear
> > +mapping, the set index is found by extracting some contiguous bits fro=
m the
> > +physical address. This allows colors to be defined as shown in figure:=
 they
> > +appear in memory as subsequent blocks of equal size and repeats themse=
lves after
> > +``n`` different colors, where ``n`` is the total number of colors.
> > +
> > +If some kind of bit shuffling appears in the mapping function, then co=
lors
> > +assume a different layout in memory. Those kind of caches aren't suppo=
rted by
> > +the current implementation.
> > +
> > +**Note**: Finding the exact cache mapping function can be a really dif=
ficult
> > +task since it's not always documented in the CPU manual. As said Corte=
x-A53, A57
> > +and A72 are known to work with the current implementation.
> > +
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
> > +Effective colors assignment
> > +###########################
> > +
> > +When assigning colors, if one wants to avoid cache interference betwee=
n two
> > +domains, different colors needs to be used for their memory.
> > +
> > +Command line parameters
> > +***********************
> > +
> > +Specific documentation is available at `docs/misc/xen-command-line.pan=
doc`.
> > +
> > ++----------------------+-------------------------------+
> > +| **Parameter**        | **Description**               |
> > ++----------------------+-------------------------------+
> > +| ``llc-coloring``     | Enable coloring at runtime    |
> > ++----------------------+-------------------------------+
> > +| ``llc-size``         | Set the LLC size              |
> > ++----------------------+-------------------------------+
> > +| ``llc-nr-ways``      | Set the LLC number of ways    |
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
, such as
> > +flawed probing logic, or for debugging/testing purposes.
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index 293dbc1a95..abd8dae96f 100644
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
> > +will be used. Note that using both options implies "llc-coloring=3Don"=
.
> I can understand this decision, but ...
>
> [...]
>
> > +    if ( llc_size && llc_nr_ways )
> > +    {
> > +        llc_coloring_enabled =3D true;
> > +        way_size =3D llc_size / llc_nr_ways;
> > +    }
> > +    else if ( !llc_coloring_enabled )
> > +        return;
> the above code does not seem to be right. When debugging or in general it=
 is useful to have on the cmdline:
> llc-size=3D1M llc-nr-ways=3D16 llc-coloring=3Don
> and be able to disable it by just switching between on/off in llc-colorin=
g=3D. However, with your solution,
> even if I specify llc-coloring=3Doff, it will be enabled because I specif=
ied both llc-size and llc-nr-ways.
> I think llc-coloring=3D should have a precedence.

How do you differentiate from
llc-size=3D1M llc-nr-ways=3D16 llc-coloring=3Doff
where llc coloring is disabled, and
llc-size=3D1M llc-nr-ways=3D16
where llc coloring is enabled? I mean, in both situations llc_coloring_enab=
led
is going to be set to false.

> > +    else
> > +    {
> > +        way_size =3D get_llc_way_size();
> > +        if ( !way_size )
> > +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' =
missing\n");
> > +    }
> > +
> > +    if ( way_size & ~PAGE_MASK )
> > +        panic("LLC way size must be a multiple of PAGE_SIZE\n");
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
> CODING STYLE
>
> > +        panic("Number of LLC colors %u < 2\n", max_nr_colors);
> > +
> > +    arch_llc_coloring_init();
> > +}
> > +
> > +void dump_llc_coloring_info(void)
> > +{
> > +    if ( !llc_coloring_enabled )
> > +        return;
> > +
> > +    printk("LLC coloring info:\n");
> > +    printk("    Number of LLC colors supported: %u\n", max_nr_colors);
> > +}
> > +
> > +void domain_dump_llc_colors(const struct domain *d)
> > +{
> > +    if ( !llc_coloring_enabled )
> > +        return;
> > +
> > +    printk("%u LLC colors: ", d->num_llc_colors);
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
> > diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> > index 33c8c917d9..7b911b5ed9 100644
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -126,6 +126,7 @@
> >  #include <xen/irq.h>
> >  #include <xen/keyhandler.h>
> >  #include <xen/lib.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/mm.h>
> >  #include <xen/nodemask.h>
> >  #include <xen/numa.h>
> > @@ -2626,6 +2627,8 @@ static void cf_check pagealloc_info(unsigned char=
 key)
> >      }
> >
> >      printk("    Dom heap: %lukB free\n", total << (PAGE_SHIFT-10));
> > +
> > +    dump_llc_coloring_info();
> >  }
> >
> >  static __init int cf_check pagealloc_keyhandler_init(void)
> > diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-color=
ing.h
> > new file mode 100644
> > index 0000000000..6ccf4613c2
> > --- /dev/null
> > +++ b/xen/include/xen/llc-coloring.h
> > @@ -0,0 +1,37 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Last Level Cache (LLC) coloring common header
> > + *
> > + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> > + * Copyright (C) 2024, Minerva Systems SRL
> > + */
> > +#ifndef __COLORING_H__
> > +#define __COLORING_H__
> > +
> > +#include <xen/sched.h>
> You could just forward declare struct domain unless you know you need sch=
ed.h for other things too in other patches.
>
> > +#include <public/domctl.h>
> Why is this here? It's not needed yet at this point.
>
> > +
> > +#ifdef CONFIG_LLC_COLORING
> > +void llc_coloring_init(void);
> > +void dump_llc_coloring_info(void);
> > +void domain_dump_llc_colors(const struct domain *d);
> > +#else
> > +static inline void llc_coloring_init(void) {}
> > +static inline void dump_llc_coloring_info(void) {}
> > +static inline void domain_dump_llc_colors(const struct domain *d) {}
> > +#endif
> > +
> > +unsigned int get_llc_way_size(void);
> > +void arch_llc_coloring_init(void);
> > +
> > +#endif /* __COLORING_H__ */
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
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index 90666576c2..c0e49cd1e7 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -637,6 +637,11 @@ struct domain
> >
> >      /* Holding CDF_* constant. Internal flags for domain creation. */
> >      unsigned int cdf;
> > +
> > +#ifdef CONFIG_LLC_COLORING
> > +    unsigned int num_llc_colors;
> > +    const unsigned int *llc_colors;
> > +#endif
> >  };
> >
> >  static inline struct page_list_head *page_to_list(
> > --
> > 2.43.0
> >
>
> Otherwise, with the remarks addressed:
> Acked-by: Michal Orzel <michal.orzel@amd.com>
>
> ~Michal

Thanks.

- Carlo

