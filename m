Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FCEA99B07
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965575.1356102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7i2X-0007RE-C1; Wed, 23 Apr 2025 21:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965575.1356102; Wed, 23 Apr 2025 21:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7i2X-0007PD-9G; Wed, 23 Apr 2025 21:53:57 +0000
Received: by outflank-mailman (input) for mailman id 965575;
 Wed, 23 Apr 2025 21:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Ler=XJ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7i2V-0007En-VT
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:53:55 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7302ed42-208d-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 23:53:54 +0200 (CEST)
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
X-Inumbo-ID: 7302ed42-208d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745445232; x=1745704432;
	bh=vSAN6P9D32IdqFROvax9YB0eoXUJKepDQFPCmAj9hg4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ULdR86SnULiZbKuyWe6nh4UZj9Fsc9+WlFYjgYLKh1lPMfq3iFcMp6oOM4Ff4K/rl
	 Ij30hEQsz/H3o9wl+ckc6drlNUo+Iz+X2/t9jnlc9rsHQpcSZwefjcfOBSGmX34N8c
	 prMVyro8UmBFDy/68p863LJZTu3Na/ZlRmMXvfLyfZ8h6LK8kNXI5Pkf6ee8zY239C
	 9uwUZQSqhDrwUAldb8J2gqd6A3yTnYzjn9ZdhW/v9SwhrNvtqgtbOPNq/bNCgTkTCa
	 kdzRjOG7bZqHassBc6AuNGcpfqbSAtZTG2ZvWCdkT/mUyR27/GGh+OCE2vOYnxqRf8
	 CmoiMlUiGbgOg==
Date: Wed, 23 Apr 2025 21:53:47 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 03/13] common/hyperlaunch: introduce the domain builder
Message-ID: <aAlhZxtdic0zJ2FZ@kraken>
In-Reply-To: <D9DZWZDYLF7B.11NTQG6LIA1IX@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-4-agarciav@amd.com> <aALKTolElzpGmD60@kraken> <D9DZWZDYLF7B.11NTQG6LIA1IX@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8f86805a5d427b1fe85d1eaed8e2367f035dee51
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 12:52:58PM +0100, Alejandro Vallejo wrote:
> On Fri Apr 18, 2025 at 10:55 PM BST, dmkhn wrote:
> > On Thu, Apr 17, 2025 at 01:48:25PM +0100, Alejandro Vallejo wrote:
> >> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> >>
> >> Introduce the domain builder which is capable of consuming a device tr=
ee as the
> >> first boot module. If it finds a device tree as the first boot module,=
 it will
> >> set its type to BOOTMOD_FDT. This change only detects the boot module =
and
> >> continues to boot with slight change to the boot convention that the d=
om0
> >> kernel is no longer first boot module but is the second.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> >> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> >> ---
> >> v4:
> >>   * Moved from arch/x86/ to common/
> >>   * gated all of domain-builder/ on CONFIG_BOOT_INFO
> >>   * Hide the domain builder submenu for !X86
> >>   * Factor out the "hyperlaunch_enabled =3D false" toggle core.c
> >>   * Removed stub inline, as DCE makes it unnecessary
> >>   * Adjusted printks.
> >> ---
> >>  xen/arch/x86/include/asm/bootinfo.h |  3 ++
> >>  xen/arch/x86/setup.c                | 17 +++++----
> >>  xen/common/Makefile                 |  1 +
> >>  xen/common/domain-builder/Makefile  |  2 ++
> >>  xen/common/domain-builder/core.c    | 56 ++++++++++++++++++++++++++++=
+
> >>  xen/common/domain-builder/fdt.c     | 37 +++++++++++++++++++
> >>  xen/common/domain-builder/fdt.h     | 12 +++++++
> >>  xen/include/xen/domain-builder.h    |  9 +++++
> >>  8 files changed, 131 insertions(+), 6 deletions(-)
> >>  create mode 100644 xen/common/domain-builder/Makefile
> >>  create mode 100644 xen/common/domain-builder/core.c
> >>  create mode 100644 xen/common/domain-builder/fdt.c
> >>  create mode 100644 xen/common/domain-builder/fdt.h
> >>  create mode 100644 xen/include/xen/domain-builder.h
> >>
> >> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/includ=
e/asm/bootinfo.h
> >> index 3afc214c17..82c2650fcf 100644
> >> --- a/xen/arch/x86/include/asm/bootinfo.h
> >> +++ b/xen/arch/x86/include/asm/bootinfo.h
> >> @@ -27,6 +27,7 @@ enum bootmod_type {
> >>      BOOTMOD_RAMDISK,
> >>      BOOTMOD_MICROCODE,
> >>      BOOTMOD_XSM_POLICY,
> >> +    BOOTMOD_FDT,
> >>  };
> >>
> >>  struct boot_module {
> >> @@ -80,6 +81,8 @@ struct boot_info {
> >>      paddr_t memmap_addr;
> >>      size_t memmap_length;
> >>
> >> +    bool hyperlaunch_enabled;
> >> +
> >>      unsigned int nr_modules;
> >>      struct boot_module mods[MAX_NR_BOOTMODS + 1];
> >>      struct boot_domain domains[MAX_NR_BOOTDOMS];
> >> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> >> index 4df012460d..ccc57cc70a 100644
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -5,6 +5,7 @@
> >>  #include <xen/cpuidle.h>
> >>  #include <xen/dmi.h>
> >>  #include <xen/domain.h>
> >> +#include <xen/domain-builder.h>
> >>  #include <xen/domain_page.h>
> >>  #include <xen/efi.h>
> >>  #include <xen/err.h>
> >> @@ -1282,9 +1283,12 @@ void asmlinkage __init noreturn __start_xen(voi=
d)
> >>                 bi->nr_modules);
> >>      }
> >>
> >> -    /* Dom0 kernel is always first */
> >> -    bi->mods[0].type =3D BOOTMOD_KERNEL;
> >> -    bi->domains[0].kernel =3D &bi->mods[0];
> >> +    builder_init(bi);
> >> +
> >> +    /* Find first unknown boot module to use as dom0 kernel */
> >> +    i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> >> +    bi->mods[i].type =3D BOOTMOD_KERNEL;
> >> +    bi->domains[0].kernel =3D &bi->mods[i];
> >
> > Nit: perhaps add convenience aliases for bi->domains[0] (e.g. dom0) and
> > for bi->mods[0] (e.g. mod)?
>=20
> Inside the boot_info? As in separate aliasing pointers into the arrays?


I was thinking about local variables inside the function pointing to the
bi->mods[0] and bi->domains[0].


> I'd rather not. It'd be dangerous on systems without an actual dom0.
>=20
> The PV shim comes to mind, but other configurations might arise in the
> future where no domain holds the id of 0.
>=20
> >
> >>
> >>      if ( pvh_boot )
> >>      {
> >> @@ -1467,8 +1471,9 @@ void asmlinkage __init noreturn __start_xen(void=
)
> >>          xen->size  =3D __2M_rwdata_end - _stext;
> >>      }
> >>
> >> -    bi->mods[0].headroom =3D
> >> -        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].=
size);
> >> +    bi->domains[0].kernel->headroom =3D
> >> +        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
> >> +                         bi->domains[0].kernel->size);
> >>      bootstrap_unmap();
> >>
> >>  #ifndef highmem_start
> >> @@ -1592,7 +1597,7 @@ void asmlinkage __init noreturn __start_xen(void=
)
> >>  #endif
> >>      }
> >>
> >> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
> >> +    if ( bi->domains[0].kernel->headroom && !bi->domains[0].kernel->r=
elocated )
> >>          panic("Not enough memory to relocate the dom0 kernel image\n"=
);
> >>      for ( i =3D 0; i < bi->nr_modules; ++i )
> >>      {
> >> diff --git a/xen/common/Makefile b/xen/common/Makefile
> >> index 98f0873056..565837bc71 100644
> >> --- a/xen/common/Makefile
> >> +++ b/xen/common/Makefile
> >> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D =
device.o
> >>  obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device-tree/
> >>  obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
> >>  obj-y +=3D domain.o
> >> +obj-$(CONFIG_HAS_BOOT_INFO) +=3D domain-builder/
> >>  obj-y +=3D event_2l.o
> >>  obj-y +=3D event_channel.o
> >>  obj-$(CONFIG_EVTCHN_FIFO) +=3D event_fifo.o
> >> diff --git a/xen/common/domain-builder/Makefile b/xen/common/domain-bu=
ilder/Makefile
> >> new file mode 100644
> >> index 0000000000..b10cd56b28
> >> --- /dev/null
> >> +++ b/xen/common/domain-builder/Makefile
> >> @@ -0,0 +1,2 @@
> >> +obj-$(CONFIG_DOMAIN_BUILDER) +=3D fdt.init.o
> >> +obj-y +=3D core.init.o
> >> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-buil=
der/core.c
> >> new file mode 100644
> >> index 0000000000..a5b21fc179
> >> --- /dev/null
> >> +++ b/xen/common/domain-builder/core.c
> >> @@ -0,0 +1,56 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (C) 2024, Apertus Solutions, LLC
> >> + */
> >> +#include <xen/err.h>
> >> +#include <xen/init.h>
> >> +#include <xen/kconfig.h>
> >> +#include <xen/lib.h>
> >> +
> >> +#include <asm/bootinfo.h>
> >> +
> >> +#include "fdt.h"
> >> +
> >> +void __init builder_init(struct boot_info *bi)
> >> +{
> >> +    bi->hyperlaunch_enabled =3D false;
> >> +
> >> +    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
> >
> > I would re-organize the code to remove one level of indentation, e.g.:
> >
> >        if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
> >             return;
> >
> >        switch ( ret =3D has_hyperlaunch_fdt(bi) )
> >        ...
> >
> > or even add #ifdef CONFIG_DOMAIN_BUILDER for builder_init() in the head=
er file.
> >
> > What do you think?
>=20
> In this patch it sounds good, but a later patch adds more stuff at the
> tail of the function that must not be skipped, so it wouldn't work
> as-is.
>=20
> Another matter is whether this function could be skipped in the "no-fdt"
> case, and it probably could. But I do know the longer series (big RFC
> from Daniel) adds more common logic present when !CONFIG_DOMAIN_BUILDER,
> so I'm reticent to deviate too much from it to avoid rebasing headaches.


I see, thanks for clarification.


>=20
> >
> >> +    {
> >> +        int ret;
> >> +
> >> +        switch ( ret =3D has_hyperlaunch_fdt(bi) )
> >> +        {
> >> +        case 0:
> >> +            printk(XENLOG_DEBUG "DT found: hyperlaunch\n");
> >> +            bi->hyperlaunch_enabled =3D true;
> >> +            bi->mods[0].type =3D BOOTMOD_FDT;
> >> +            break;
> >> +
> >> +        case -EINVAL:
> >> +            /* No DT found */
> >> +            break;
> >> +
> >> +        case -ENOENT:
> >> +        case -ENODATA:
> >
> > Looks like this code accounts for the follow on change: current impleme=
ntation
> > only returns -EINVAL or 0.
> >
> > Is it possible to convert has_hyperlaunch_fdt() to a simple predicate?
>=20
> The function is a misnomer and it ought to change to return an
> enumerated type instead where it returns FDT_HYPERLAUNCH, FDT_DOM0LESS,
> FDT_UNKNOWN or NO_FDT. Using error codes for identification is a tad too
> hacky.
>=20
> Cheers,
> Alejandro


