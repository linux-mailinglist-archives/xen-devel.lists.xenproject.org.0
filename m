Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858BC87CC82
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693822.1082414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5uR-0004bV-H1; Fri, 15 Mar 2024 11:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693822.1082414; Fri, 15 Mar 2024 11:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5uR-0004ZB-Co; Fri, 15 Mar 2024 11:39:35 +0000
Received: by outflank-mailman (input) for mailman id 693822;
 Fri, 15 Mar 2024 11:39:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5uP-0004Z5-Ot
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 11:39:33 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b01b48be-e2c0-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 12:39:31 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3122b70439so242942866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 04:39:31 -0700 (PDT)
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
X-Inumbo-ID: b01b48be-e2c0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710502770; x=1711107570; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3NUU0GS/HozcZ3HYb4tvh+06YYWS2jGALIKJFAoltM=;
        b=foazjUYeXf1WZ/6veC7PDc2jWpzW2LfJbtkrOflBbvpTKwLsH+erpxjPzm4l3PDVVN
         7nxBQn+i7nDHhmvv+Xw9jllnWHItvbOWun7uf8h/Pid/qUbA2PbMqhsnHqKFBcpgjbn0
         +6ke3xKUyIAi/x7SWIEf6miQhNAMn7scgzUp1J33DKTHJP2LO0iY3yKq5E9IxIzbrFxH
         ENwsL8ekRqLxMnskLvO5Is8onVB3gQ64Res19bXCZ0Is6TydUgbRdOms0OAihiy7Lf/U
         ODUQlFbeYbuzueRzMvVdamo7D4o+q1oPRd89QFtW/cRvO//lKWKqo9m2FQov1249cs+r
         q6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710502770; x=1711107570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3NUU0GS/HozcZ3HYb4tvh+06YYWS2jGALIKJFAoltM=;
        b=OyW8T70ZH1VgYNmUtI40hSn10GDxIO/4oWBAv03Ty3m1S6WA9/NdqYPs0NWvTLbpCq
         LkqLwJSoEIYZNEEo7uk+Qc2Bq8a66zTjEAvJ95Fdf782GPHMI5jxGC+pOzfK8iYbDibi
         +w/bknwwIMhgdpiiAyIseqVfzw9bOIpxOR9SsTL4qwGVSnf5ZXUoS7hUjgY9+MMTuKLy
         rOoJlCYf+3DRMi2IE7R8xodvEqtzBMhlIVjuNcpVt+tsF90+G+IAQ3Ux2YZ4YzWMFJ47
         yNhjtKPVsbbMrS68cJjUOeBNUxX67eQPmIS95Dn6QWZs/naGWgKifd8rVeyPQ0J20Axw
         1Bbg==
X-Gm-Message-State: AOJu0YyBLEt5YPusxzQqZdYgHGu+4hcwdpDRE87yFRU8XkwDwxVH+Vyo
	4P/rUP1dXTi8vgJvWA5LvC84GpcOIdw4bJALx2dUVSInDV8eZmqbnKVtREyoHj+esKzgM+u36vZ
	Mh42EIBzO8oX8ri/3pUdcMpJ4iLP6MRO56A3ZtxGcQmnN2WN6bTmB9w==
X-Google-Smtp-Source: AGHT+IFzKMafqRSJqRO/DFA9qXpD+OEe2H1B6CYzZcNwEsu9w9bbPPgS4UXULqu5P1lG8xvCJ8nT5WodltUbqhSXSrU=
X-Received: by 2002:a17:906:9c85:b0:a46:7323:6ab4 with SMTP id
 fj5-20020a1709069c8500b00a4673236ab4mr3443810ejc.14.1710502770361; Fri, 15
 Mar 2024 04:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech> <20240315105902.160047-2-carlo.nonato@minervasys.tech>
In-Reply-To: <20240315105902.160047-2-carlo.nonato@minervasys.tech>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 15 Mar 2024 12:39:19 +0100
Message-ID: <CAG+AhRUW0s0dogHy33rEAchuiBNijuJi6r05GNmnPQyQwJ7BzQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/14] xen/common: add cache coloring common code
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

unfortunately, this patch doesn't apply cleanly to the latest master.
The conflict is very small: just a reordering of two lines in
xen/common/Kconfig. Should I resend the whole series?

Thanks.

On Fri, Mar 15, 2024 at 11:59=E2=80=AFAM Carlo Nonato
<carlo.nonato@minervasys.tech> wrote:
>
> Last Level Cache (LLC) coloring allows to partition the cache in smaller
> chunks called cache colors. Since not all architectures can actually
> implement it, add a HAS_LLC_COLORING Kconfig and put other options under
> xen/arch.
>
> LLC colors are a property of the domain, so the domain struct has to be
> extended.
>
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v7:
> - SUPPORT.md changes added to this patch
> - extended documentation to better address applicability of cache colorin=
g
> - "llc-nr-ways" and "llc-size" params introduced in favor of "llc-way-siz=
e"
> - moved dump_llc_coloring_info() call in 'm' keyhandler (pagealloc_info()=
)
> v6:
> - moved almost all code in common
> - moved documentation in this patch
> - reintroduced range for CONFIG_NR_LLC_COLORS
> - reintroduced some stub functions to reduce the number of checks on
>   llc_coloring_enabled
> - moved domain_llc_coloring_free() in same patch where allocation happens
> - turned "d->llc_colors" to pointer-to-const
> - llc_coloring_init() now returns void and panics if errors are found
> v5:
> - used - instead of _ for filenames
> - removed domain_create_llc_colored()
> - removed stub functions
> - coloring domain fields are now #ifdef protected
> v4:
> - Kconfig options moved to xen/arch
> - removed range for CONFIG_NR_LLC_COLORS
> - added "llc_coloring_enabled" global to later implement the boot-time
>   switch
> - added domain_create_llc_colored() to be able to pass colors
> - added is_domain_llc_colored() macro
> ---
>  SUPPORT.md                        |   7 ++
>  docs/misc/cache-coloring.rst      | 125 ++++++++++++++++++++++++++++++
>  docs/misc/xen-command-line.pandoc |  37 +++++++++
>  xen/arch/Kconfig                  |  20 +++++
>  xen/common/Kconfig                |   3 +
>  xen/common/Makefile               |   1 +
>  xen/common/keyhandler.c           |   3 +
>  xen/common/llc-coloring.c         | 102 ++++++++++++++++++++++++
>  xen/common/page_alloc.c           |   3 +
>  xen/include/xen/llc-coloring.h    |  36 +++++++++
>  xen/include/xen/sched.h           |   5 ++
>  11 files changed, 342 insertions(+)
>  create mode 100644 docs/misc/cache-coloring.rst
>  create mode 100644 xen/common/llc-coloring.c
>  create mode 100644 xen/include/xen/llc-coloring.h
>
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 510bb02190..456abd42bf 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -364,6 +364,13 @@ by maintaining multiple physical to machine (p2m) me=
mory mappings.
>      Status, x86 HVM: Tech Preview
>      Status, ARM: Tech Preview
>
> +### Cache coloring
> +
> +Allows to reserve Last Level Cache (LLC) partitions for Dom0, DomUs and =
Xen
> +itself.
> +
> +    Status, Arm64: Experimental
> +
>  ## Resource Management
>
>  ### CPU Pools
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> new file mode 100644
> index 0000000000..52ce52ffbd
> --- /dev/null
> +++ b/docs/misc/cache-coloring.rst
> @@ -0,0 +1,125 @@
> +Xen cache coloring user guide
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +The cache coloring support in Xen allows to reserve Last Level Cache (LL=
C)
> +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is suppo=
rted.
> +Cache coloring realizes per-set cache partitioning in software and is ap=
plicable
> +to shared LLCs as implemented in Cortex-A53, Cortex-A72 and similar CPUs=
.
> +
> +To compile LLC coloring support set ``CONFIG_LLC_COLORING=3Dy``.
> +
> +If needed, change the maximum number of colors with
> +``CONFIG_NR_LLC_COLORS=3D<n>``.
> +
> +Runtime configuration is done via `Command line parameters`_.
> +
> +Background
> +**********
> +
> +Cache hierarchy of a modern multi-core CPU typically has first levels de=
dicated
> +to each core (hence using multiple cache units), while the last level is=
 shared
> +among all of them. Such configuration implies that memory operations on =
one
> +core (e.g. running a DomU) are able to generate interference on another =
core
> +(e.g. hosting another DomU). Cache coloring realizes per-set cache-parti=
tioning
> +in software and mitigates this, guaranteeing higher and more predictable
> +performances for memory accesses.
> +Software-based cache coloring is particularly useful in those situations=
 where
> +no hardware mechanisms (e.g., DSU-based way partitioning) are available =
to
> +partition caches. This is the case for e.g., Cortex-A53, A57 and A72 CPU=
s that
> +feature a L2 LLC cache shared among all cores.
> +
> +The key concept underlying cache coloring is a fragmentation of the memo=
ry
> +space into a set of sub-spaces called colors that are mapped to disjoint=
 cache
> +partitions. Technically, the whole memory space is first divided into a =
number
> +of subsequent regions. Then each region is in turn divided into a number=
 of
> +subsequent sub-colors. The generic i-th color is then obtained by all th=
e
> +i-th sub-colors in each region.
> +
> +::
> +
> +                            Region j            Region j+1
> +                .....................   ............
> +                .                     . .
> +                .                       .
> +            _ _ _______________ _ _____________________ _ _
> +                |     |     |     |     |     |     |
> +                | c_0 | c_1 |     | c_n | c_0 | c_1 |
> +           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
> +                    :                       :
> +                    :                       :...         ... .
> +                    :                            color 0
> +                    :...........................         ... .
> +                                                :
> +          . . ..................................:
> +
> +How colors are actually defined depends on the function that maps memory=
 to
> +cache lines. In case of physically-indexed, physically-tagged caches wit=
h linear
> +mapping, the set index is found by extracting some contiguous bits from =
the
> +physical address. This allows colors to be defined as shown in figure: t=
hey
> +appear in memory as subsequent blocks of equal size and repeats themselv=
es after
> +``n`` different colors, where ``n`` is the total number of colors.
> +
> +If some kind of bit shuffling appears in the mapping function, then colo=
rs
> +assume a different layout in memory. Those kind of caches aren't support=
ed by
> +the current implementation.
> +
> +**Note**: Finding the exact cache mapping function can be a really diffi=
cult
> +task since it's not always documented in the CPU manual. As said Cortex-=
A53, A57
> +and A72 are known to work with the current implementation.
> +
> +How to compute the number of colors
> +###################################
> +
> +Given the linear mapping from physical memory to cache lines for granted=
, the
> +number of available colors for a specific platform is computed using thr=
ee
> +parameters:
> +
> +- the size of the LLC.
> +- the number of the LLC ways.
> +- the page size used by Xen.
> +
> +The first two parameters can be found in the processor manual, while the=
 third
> +one is the minimum mapping granularity. Dividing the cache size by the n=
umber of
> +its ways we obtain the size of a way. Dividing this number by the page s=
ize,
> +the number of total cache colors is found. So for example an Arm Cortex-=
A53
> +with a 16-ways associative 1 MiB LLC can isolate up to 16 colors when pa=
ges are
> +4 KiB in size.
> +
> +LLC size and number of ways are probed automatically by default so there=
's
> +should be no need to compute the number of colors by yourself.
> +
> +Effective colors assignment
> +###########################
> +
> +When assigning colors:
> +
> +1. If one wants to avoid cache interference between two domains, differe=
nt
> +   colors needs to be used for their memory.
> +
> +2. To improve spatial locality, color assignment should privilege contin=
uity in
> +   the partitioning. E.g., assigning colors (0,1) to domain I and (2,3) =
to
> +   domain J is better than assigning colors (0,2) to I and (1,3) to J.
> +
> +Command line parameters
> +***********************
> +
> +Specific documentation is available at `docs/misc/xen-command-line.pando=
c`.
> +
> ++----------------------+-------------------------------+
> +| **Parameter**        | **Description**               |
> ++----------------------+-------------------------------+
> +| ``llc-coloring``     | enable coloring at runtime    |
> ++----------------------+-------------------------------+
> +| ``llc-size``         | set the LLC size              |
> ++----------------------+-------------------------------+
> +| ``llc-nr-ways``      | set the LLC number of ways    |
> ++----------------------+-------------------------------+
> +
> +Auto-probing of LLC specs
> +#########################
> +
> +LLC size and number of ways are probed automatically by default.
> +
> +LLC specs can be manually set via the above command line parameters. Thi=
s
> +bypasses any auto-probing and it's used to overcome failing situations o=
r for
> +debugging/testing purposes.
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 54edbc0fbc..2936abea2c 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1706,6 +1706,43 @@ This option is intended for debugging purposes onl=
y.  Enable MSR_DEBUGCTL.LBR
>  in hypervisor context to be able to dump the Last Interrupt/Exception To=
/From
>  record with other registers.
>
> +### llc-coloring
> +> `=3D <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable LLC coloring support at runtime. This option i=
s
> +available only when `CONFIG_LLC_COLORING` is enabled. See the general
> +cache coloring documentation for more info.
> +
> +### llc-nr-ways
> +> `=3D <integer>`
> +
> +> Default: `Obtained from hardware`
> +
> +Specify the number of ways of the Last Level Cache. This option is avail=
able
> +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of ways =
are used
> +to find the number of supported cache colors. By default the value is
> +automatically computed by probing the hardware, but in case of specific =
needs,
> +it can be manually set. Those include failing probing and debugging/test=
ing
> +purposes so that it's possibile to emulate platforms with different numb=
er of
> +supported colors. If set, also "llc-size" must be set, otherwise the def=
ault
> +will be used.
> +
> +### llc-size
> +> `=3D <size>`
> +
> +> Default: `Obtained from hardware`
> +
> +Specify the size of the Last Level Cache. This option is available only =
when
> +`CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used t=
o find
> +the number of supported cache colors. By default the value is automatica=
lly
> +computed by probing the hardware, but in case of specific needs, it can =
be
> +manually set. Those include failing probing and debugging/testing purpos=
es so
> +that it's possibile to emulate platforms with different number of suppor=
ted
> +colors. If set, also "llc-nr-ways" must be set, otherwise the default wi=
ll be
> +used.
> +
>  ### lock-depth-size
>  > `=3D <integer>`
>
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index 67ba38f32f..a65c38e53e 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -31,3 +31,23 @@ config NR_NUMA_NODES
>           associated with multiple-nodes management. It is the upper boun=
d of
>           the number of NUMA nodes that the scheduler, memory allocation =
and
>           other NUMA-aware components can handle.
> +
> +config LLC_COLORING
> +       bool "Last Level Cache (LLC) coloring" if EXPERT
> +       depends on HAS_LLC_COLORING
> +       depends on !NUMA
> +
> +config NR_LLC_COLORS
> +       int "Maximum number of LLC colors"
> +       range 2 1024
> +       default 128
> +       depends on LLC_COLORING
> +       help
> +         Controls the build-time size of various arrays associated with =
LLC
> +         coloring. Refer to cache coloring documentation for how to comp=
ute the
> +         number of colors supported by the platform. This is only an upp=
er
> +         bound. The runtime value is autocomputed or manually set via cm=
dline.
> +         The default value corresponds to an 8 MiB 16-ways LLC, which sh=
ould be
> +         more than what's needed in the general case. Use only power of =
2 values.
> +         1024 is the number of colors that fit in a 4 KiB page when inte=
gers are 4
> +         bytes long.
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index a5c3d5a6bf..1e467178bd 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -71,6 +71,9 @@ config HAS_IOPORTS
>  config HAS_KEXEC
>         bool
>
> +config HAS_LLC_COLORING
> +       bool
> +
>  config HAS_PMAP
>         bool
>
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index e5eee19a85..3054254a7d 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -23,6 +23,7 @@ obj-y +=3D keyhandler.o
>  obj-$(CONFIG_KEXEC) +=3D kexec.o
>  obj-$(CONFIG_KEXEC) +=3D kimage.o
>  obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o livepatch_elf.o
> +obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
>  obj-$(CONFIG_MEM_ACCESS) +=3D mem_access.o
>  obj-y +=3D memory.o
>  obj-y +=3D multicall.o
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 127ca50696..778f93e063 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -5,6 +5,7 @@
>  #include <asm/regs.h>
>  #include <xen/delay.h>
>  #include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/param.h>
>  #include <xen/shutdown.h>
>  #include <xen/event.h>
> @@ -303,6 +304,8 @@ static void cf_check dump_domains(unsigned char key)
>
>          arch_dump_domain_info(d);
>
> +        domain_dump_llc_colors(d);
> +
>          rangeset_domain_printk(d);
>
>          dump_pageframe_info(d);
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> new file mode 100644
> index 0000000000..db96a83ddd
> --- /dev/null
> +++ b/xen/common/llc-coloring.c
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring common code
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + */
> +#include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/param.h>
> +
> +static bool __ro_after_init llc_coloring_enabled;
> +boolean_param("llc-coloring", llc_coloring_enabled);
> +
> +static unsigned int __initdata llc_size;
> +size_param("llc-size", llc_size);
> +static unsigned int __initdata llc_nr_ways;
> +integer_param("llc-nr-ways", llc_nr_ways);
> +/* Number of colors available in the LLC */
> +static unsigned int __ro_after_init max_nr_colors;
> +
> +static void print_colors(const unsigned int *colors, unsigned int num_co=
lors)
> +{
> +    unsigned int i;
> +
> +    printk("{ ");
> +    for ( i =3D 0; i < num_colors; i++ )
> +    {
> +        unsigned int start =3D colors[i], end =3D start;
> +
> +        printk("%u", start);
> +
> +        for ( ; i < num_colors - 1 && end + 1 =3D=3D colors[i + 1]; i++,=
 end++ )
> +            ;
> +
> +        if ( start !=3D end )
> +            printk("-%u", end);
> +
> +        if ( i < num_colors - 1 )
> +            printk(", ");
> +    }
> +    printk(" }\n");
> +}
> +
> +void __init llc_coloring_init(void)
> +{
> +    unsigned int way_size;
> +
> +    if ( !llc_coloring_enabled )
> +        return;
> +
> +    if ( llc_size && llc_nr_ways )
> +        way_size =3D llc_size / llc_nr_ways;
> +    else
> +    {
> +        way_size =3D get_llc_way_size();
> +        if ( !way_size )
> +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' mi=
ssing\n");
> +    }
> +
> +    /*
> +     * The maximum number of colors must be a power of 2 in order to cor=
rectly
> +     * map them to bits of an address.
> +     */
> +    max_nr_colors =3D way_size >> PAGE_SHIFT;
> +
> +    if ( max_nr_colors & (max_nr_colors - 1) )
> +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr_c=
olors);
> +
> +    if ( max_nr_colors < 2 || max_nr_colors > CONFIG_NR_LLC_COLORS )
> +        panic("Number of LLC colors (%u) not in range [2, %u]\n",
> +              max_nr_colors, CONFIG_NR_LLC_COLORS);
> +
> +    arch_llc_coloring_init();
> +}
> +
> +void cf_check dump_llc_coloring_info(void)
> +{
> +    if ( !llc_coloring_enabled )
> +        return;
> +
> +    printk("LLC coloring info:\n");
> +    printk("    Number of LLC colors supported: %u\n", max_nr_colors);
> +}
> +
> +void cf_check domain_dump_llc_colors(const struct domain *d)
> +{
> +    if ( !llc_coloring_enabled )
> +        return;
> +
> +    printk("%u LLC colors: ", d->num_llc_colors);
> +    print_colors(d->llc_colors, d->num_llc_colors);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 2ec17df9b4..c38edb9a58 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -126,6 +126,7 @@
>  #include <xen/irq.h>
>  #include <xen/keyhandler.h>
>  #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/mm.h>
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>
> @@ -2623,6 +2624,8 @@ static void cf_check pagealloc_info(unsigned char k=
ey)
>      }
>
>      printk("    Dom heap: %lukB free\n", total << (PAGE_SHIFT-10));
> +
> +    dump_llc_coloring_info();
>  }
>
>  static __init int cf_check pagealloc_keyhandler_init(void)
> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-colorin=
g.h
> new file mode 100644
> index 0000000000..c60c8050c5
> --- /dev/null
> +++ b/xen/include/xen/llc-coloring.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring common header
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + */
> +#ifndef __COLORING_H__
> +#define __COLORING_H__
> +
> +#include <xen/sched.h>
> +#include <public/domctl.h>
> +
> +#ifdef CONFIG_LLC_COLORING
> +void llc_coloring_init(void);
> +void dump_llc_coloring_info(void);
> +void domain_dump_llc_colors(const struct domain *d);
> +#else
> +static inline void llc_coloring_init(void) {}
> +static inline void dump_llc_coloring_info(void) {}
> +static inline void domain_dump_llc_colors(const struct domain *d) {}
> +#endif
> +
> +unsigned int get_llc_way_size(void);
> +void arch_llc_coloring_init(void);
> +
> +#endif /* __COLORING_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 37f5922f32..96cc934fc3 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -627,6 +627,11 @@ struct domain
>
>      /* Holding CDF_* constant. Internal flags for domain creation. */
>      unsigned int cdf;
> +
> +#ifdef CONFIG_LLC_COLORING
> +    unsigned int num_llc_colors;
> +    const unsigned int *llc_colors;
> +#endif
>  };
>
>  static inline struct page_list_head *page_to_list(
> --
> 2.34.1
>

