Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AFE9F3626
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 17:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858369.1270596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNE23-0000Fl-Us; Mon, 16 Dec 2024 16:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858369.1270596; Mon, 16 Dec 2024 16:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNE23-0000Ce-Pl; Mon, 16 Dec 2024 16:33:19 +0000
Received: by outflank-mailman (input) for mailman id 858369;
 Mon, 16 Dec 2024 16:33:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EuNa=TJ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNE21-0000CX-WF
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 16:33:18 +0000
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [2607:f8b0:4864:20::d30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7283e7f0-bbcb-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 17:33:15 +0100 (CET)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-844e1eb50e2so139951739f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 08:33:15 -0800 (PST)
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
X-Inumbo-ID: 7283e7f0-bbcb-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734366794; x=1734971594; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpOMfa/mF/n3ZZ8ESoBLLNBu8MYcUunfzbkXkXEi5/w=;
        b=jUgYVoUMc+1Ff47ZeJ4NsLCmEnn8nIOUiHwum9kHONnqdXUHGrp+p6CoLb8LgI/5cI
         7FxiGwVeZzeKNnXcnKVG59jPT54cc6swQuG1Hq8uKe2SnSMpBInRKmnGD/dnb5tHsynV
         jas43I4x/d5zqQJ2AD6uomtVyryuJyG19qxxwyqg+K3UmWBjF+KqVUzKhHPjo6+0Ru5b
         FQcZ79nUA0WiboCQWtEgv4pY8ub4vHMEC25o33vojf1WqWgPS09TgOhw6U0f1cRKMrrm
         fqDf28/1vIZK3C7xYtvjtAZqyYnmEbyzH1AyCAiZq8VIfqWQek8rtVTaPZoq7EkQPazX
         SQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734366794; x=1734971594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpOMfa/mF/n3ZZ8ESoBLLNBu8MYcUunfzbkXkXEi5/w=;
        b=eM2BRtx00+y5R+hCBIdwNDKpGXQH6X6Dm9/11+Lo9lt53eHmTDRPdNTtoAUPeE3jCN
         iESDxeTLZYWMJRCibsz+UvspdSH6SZZejS1Wz7kRNtZbtd8X/8TZJxhVKJKbr/UcxhML
         JoyY5XmnYnSAtlRSGiMuplaqUmrVj9HzsdftsrCsbGw0V61HOEhGbWcdYRMQNIjfKawl
         GhZqwxFzo0JXipb2Aja0XGrvOT0rZuWjPwW8nxaKFbz1Vx5pvJE20gaaLUbTzsyumwWL
         ClaqTODFy7gvSA2691fm6Wal0gobJmlBbO/QbbdjXv8QBcm9I3WEfgn6W8pZeBnemmtT
         u61Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdMNlK4ZYzYcsM3syKa6Aq/vy2gj+iYREjfaq535HV8g0oeMqDjJGNDDBaKIYETiprUuERC3v7FSg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsRIV2z24A4P62mPdQgUxiSy7RpXAcsCMe3n+WpmSbTpb4420L
	ZQ2O6QEvO55cOWHnF0Alv8yXIabzT6eM38GtvZ46w5xqcMu00hx93Qg5lYc1rOqUyjT7dWCFcVa
	bSaPhENK7w2wV2Tovoli+LkAtwtXRQlcPADZyXQ==
X-Gm-Gg: ASbGncvY18vdNYRjY06RD2BOhgIvxguke4KtjIEl3PSXQOcFPKLozASxHF+C16CH6L0
	AxFEk5yXFA1VvHOi5LR+DWwtWTrQFoOy3QiuySKE=
X-Google-Smtp-Source: AGHT+IFLfvEmDKAg5ADJBv/H012KEJ+UQ83zyBDwoxceECUItTv0JqSmvYOpfRwqxW2u01Nnw8bGBqgyniV7B4ZGaAk=
X-Received: by 2002:a05:6e02:198c:b0:3a7:c5ff:e60b with SMTP id
 e9e14a558f8ab-3afef630628mr147150505ab.6.1734366794064; Mon, 16 Dec 2024
 08:33:14 -0800 (PST)
MIME-Version: 1.0
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-2-carlo.nonato@minervasys.tech> <eaf99fc7-30f4-4820-ab36-8f5926a4e9b8@suse.com>
In-Reply-To: <eaf99fc7-30f4-4820-ab36-8f5926a4e9b8@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 16 Dec 2024 17:33:03 +0100
Message-ID: <CAG+AhRUNrj9a2P1TL7MNbkPw5scZjcTamQGxKsDS5sBWqpZrYg@mail.gmail.com>
Subject: Re: [PATCH v12 01/12] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Dec 16, 2024 at 11:51=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 13.12.2024 17:28, Carlo Nonato wrote:
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
> > Acked-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> > v12:
> > - fixed build errors
> > - added opt_llc_coloring to improve readibility
> > - reverted llc_coloring_enabled type to bool
> > v11:
> > - __COLORING_H__ -> __XEN_LLC_COLORING_H__ in llc-coloring.h
> > - added SPDX tag to cache-coloring.rst
> > - llc-coloring=3Doff now takes precedence over other cmdline options
> > - removed useless #includes
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
> >  docs/misc/cache-coloring.rst      | 118 ++++++++++++++++++++++++++++
> >  docs/misc/xen-command-line.pandoc |  37 +++++++++
> >  xen/common/Kconfig                |  21 +++++
> >  xen/common/Makefile               |   1 +
> >  xen/common/keyhandler.c           |   3 +
> >  xen/common/llc-coloring.c         | 124 ++++++++++++++++++++++++++++++
> >  xen/common/page_alloc.c           |   3 +
> >  xen/include/xen/llc-coloring.h    |  36 +++++++++
> >  xen/include/xen/sched.h           |   5 ++
> >  11 files changed, 356 insertions(+)
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
> > index 1d44796d72..1bb8d02ea3 100644
> > --- a/docs/index.rst
> > +++ b/docs/index.rst
> > @@ -66,6 +66,7 @@ Documents in need of some rearranging.
> >     misc/xen-makefiles/makefiles
> >     misra/index
> >     fusa/index
> > +   misc/cache-coloring
> >
> >
> >  Miscellanea
> > diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rs=
t
> > new file mode 100644
> > index 0000000000..371f21a0e7
> > --- /dev/null
> > +++ b/docs/misc/cache-coloring.rst
> > @@ -0,0 +1,118 @@
> > +.. SPDX-License-Identifier: CC-BY-4.0
> > +
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
> > +
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
> > +used. Note that using both options implies "llc-coloring=3Don".
> > +
> >  ### lock-depth-size
> >  > `=3D <integer>`
> >
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 90268d9249..b4ec6893be 100644
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
> > @@ -516,4 +519,22 @@ config TRACEBUFFER
> >         to be collected at run time for debugging or performance analys=
is.
> >         Memory and execution overhead when not active is minimal.
> >
> > +config LLC_COLORING
> > +     bool "Last Level Cache (LLC) coloring" if EXPERT
> > +     depends on HAS_LLC_COLORING
> > +
> > +config LLC_COLORS_ORDER
> > +     int "Maximum number of LLC colors (base-2 exponent)"
> > +     range 1 10
> > +     default 7
> > +     depends on LLC_COLORING
> > +     help
> > +       Controls the build-time size of various arrays associated with =
LLC
> > +       coloring. The value is a base-2 exponent. Refer to cache colori=
ng
> > +       documentation for how to compute the number of colors supported=
 by the
> > +       platform. This is only an upper bound. The runtime value is aut=
ocomputed
> > +       or manually set via cmdline parameters.
> > +       The default value corresponds to an 8 MiB 16-ways LLC, which sh=
ould be
> > +       more than what's needed in the general case.
> > +
> >  endmenu
> > diff --git a/xen/common/Makefile b/xen/common/Makefile
> > index b279b09bfb..cba3b32733 100644
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -25,6 +25,7 @@ obj-y +=3D keyhandler.o
> >  obj-$(CONFIG_KEXEC) +=3D kexec.o
> >  obj-$(CONFIG_KEXEC) +=3D kimage.o
> >  obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o livepatch_elf.o
> > +obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
> >  obj-$(CONFIG_MEM_ACCESS) +=3D mem_access.o
> >  obj-y +=3D memory.o
> >  obj-y +=3D multicall.o
> > diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> > index 6da291b34e..6ea54838d4 100644
> > --- a/xen/common/keyhandler.c
> > +++ b/xen/common/keyhandler.c
> > @@ -5,6 +5,7 @@
> >  #include <asm/regs.h>
> >  #include <xen/delay.h>
> >  #include <xen/keyhandler.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/param.h>
> >  #include <xen/sections.h>
> >  #include <xen/shutdown.h>
> > @@ -304,6 +305,8 @@ static void cf_check dump_domains(unsigned char key=
)
> >
> >          arch_dump_domain_info(d);
> >
> > +        domain_dump_llc_colors(d);
> > +
> >          rangeset_domain_printk(d);
> >
> >          dump_pageframe_info(d);
> > diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> > new file mode 100644
> > index 0000000000..b0fc162b05
> > --- /dev/null
> > +++ b/xen/common/llc-coloring.c
> > @@ -0,0 +1,124 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Last Level Cache (LLC) coloring common code
> > + *
> > + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> > + * Copyright (C) 2024, Minerva Systems SRL
> > + */
> > +#include <xen/keyhandler.h>
> > +#include <xen/llc-coloring.h>
> > +#include <xen/param.h>
> > +
> > +#define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
> > +
> > +/*
> > + * -1: not specified (disabled unless llc-size and llc-nr-ways present=
)
> > + *  0: explicitly disabled through cmdline
> > + *  1: explicitly enabled through cmdline
> > + */
> > +static int8_t __initdata opt_llc_coloring =3D -1;
> > +boolean_param("llc-coloring", opt_llc_coloring);
> > +
> > +static bool __ro_after_init llc_coloring_enabled;
> > +
> > +static unsigned int __initdata llc_size;
> > +size_param("llc-size", llc_size);
> > +static unsigned int __initdata llc_nr_ways;
> > +integer_param("llc-nr-ways", llc_nr_ways);
> > +/* Number of colors available in the LLC */
> > +static unsigned int __ro_after_init max_nr_colors;
> > +
> > +static void print_colors(const unsigned int colors[], unsigned int num=
_colors)
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
> > +    llc_coloring_enabled =3D (opt_llc_coloring =3D=3D 1);
>
> Generally I'd suggest to only use > 0, >=3D 0, < 0, and <=3D 0 on such
> variables.
>
> > +    if ( (opt_llc_coloring !=3D 0) && llc_size && llc_nr_ways )
> > +    {
> > +        llc_coloring_enabled =3D true;
> > +        way_size =3D llc_size / llc_nr_ways;
> > +    }
>
> Hmm, I actually see a difference in someone saying
>
> "llc-coloring=3D0 llc-size=3D... llc-nr-ways=3D..."
>
> vs
>
> "llc-size=3D... llc-nr-ways=3D... llc-coloring=3D0"
>
> I'm not sure about Arm, but on x86 this can be relevant as there may be
> pre-set parts of a command line with appended (human) overrides. Therefor=
e
> it always wants to be "last wins". Yet yes, you may weant to take the
> position that in such a case the former example would require "llc-colori=
ng=3D1"
> to also be added.

Yes, I think this should be the way to go.

> Kind of against the shorthand llc-size+llc-nr-ways only,
> though.

The shorthand was proposed by you here:
https://patchew.org/Xen/20240315105902.160047-1-carlo.nonato@minervasys.tec=
h/20240315105902.160047-2-carlo.nonato@minervasys.tech/#05e4d3da-4130-4c57-=
9855-43b685ce5005@suse.com

> Wouldn't it make sense to infer "llc-coloring" when both of the latter op=
tions
> were supplied?

We both agreed that it was something good to have.

> Jan

Thanks.

- Carlo

