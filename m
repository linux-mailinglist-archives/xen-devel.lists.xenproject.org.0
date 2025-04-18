Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E451A93F98
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 23:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959479.1351817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5tgT-00067j-W3; Fri, 18 Apr 2025 21:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959479.1351817; Fri, 18 Apr 2025 21:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5tgT-00065H-TG; Fri, 18 Apr 2025 21:55:41 +0000
Received: by outflank-mailman (input) for mailman id 959479;
 Fri, 18 Apr 2025 21:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5tgR-00065B-FU
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 21:55:40 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc89bef4-1c9f-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 23:55:37 +0200 (CEST)
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
X-Inumbo-ID: dc89bef4-1c9f-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745013335; x=1745272535;
	bh=OIfcLVid6psy/hJ4DVPe0lp09d3coURkz8DGUU4fDsE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gJfiAEuzTTBaH/Ga1/xKf+F0brP54blPvKf301Vk4uCtmVC6Bhrmzwi/8XJAA8zE4
	 l3tD0afTBBxOX2RgevoNpxZ5Py0hM8MpPBvX2D5Ew11ly/RI0IagjqzqB9OeDbdC/8
	 rHjMgY80/LC4O4qS44lrY8zF/RsppCPX7dJXWCtCJSKwa38i9h8RrczLbunpmDnr5h
	 Q7VyIK+4LGM0xgpKHO8tHzabZctpBd3EiLvf4KIT1Xmpzp3qjWBPcw7NG/H5ZlWfmY
	 4jJ026w3OAsnweax4ucL5ynPreIgHtsiOcz7szhwc1bmzb8YY/2STPBQV+OWnpjkd8
	 mm7wH+5O+oMcQ==
Date: Fri, 18 Apr 2025 21:55:29 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 03/13] common/hyperlaunch: introduce the domain builder
Message-ID: <aALKTolElzpGmD60@kraken>
In-Reply-To: <20250417124844.11143-4-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-4-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 728179361440caf02256ff384a8e010cca674479
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:25PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Introduce the domain builder which is capable of consuming a device tree =
as the
> first boot module. If it finds a device tree as the first boot module, it=
 will
> set its type to BOOTMOD_FDT. This change only detects the boot module and
> continues to boot with slight change to the boot convention that the dom0
> kernel is no longer first boot module but is the second.
>=20
> No functional change intended.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v4:
>   * Moved from arch/x86/ to common/
>   * gated all of domain-builder/ on CONFIG_BOOT_INFO
>   * Hide the domain builder submenu for !X86
>   * Factor out the "hyperlaunch_enabled =3D false" toggle core.c
>   * Removed stub inline, as DCE makes it unnecessary
>   * Adjusted printks.
> ---
>  xen/arch/x86/include/asm/bootinfo.h |  3 ++
>  xen/arch/x86/setup.c                | 17 +++++----
>  xen/common/Makefile                 |  1 +
>  xen/common/domain-builder/Makefile  |  2 ++
>  xen/common/domain-builder/core.c    | 56 +++++++++++++++++++++++++++++
>  xen/common/domain-builder/fdt.c     | 37 +++++++++++++++++++
>  xen/common/domain-builder/fdt.h     | 12 +++++++
>  xen/include/xen/domain-builder.h    |  9 +++++
>  8 files changed, 131 insertions(+), 6 deletions(-)
>  create mode 100644 xen/common/domain-builder/Makefile
>  create mode 100644 xen/common/domain-builder/core.c
>  create mode 100644 xen/common/domain-builder/fdt.c
>  create mode 100644 xen/common/domain-builder/fdt.h
>  create mode 100644 xen/include/xen/domain-builder.h
>=20
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/a=
sm/bootinfo.h
> index 3afc214c17..82c2650fcf 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -27,6 +27,7 @@ enum bootmod_type {
>      BOOTMOD_RAMDISK,
>      BOOTMOD_MICROCODE,
>      BOOTMOD_XSM_POLICY,
> +    BOOTMOD_FDT,
>  };
>=20
>  struct boot_module {
> @@ -80,6 +81,8 @@ struct boot_info {
>      paddr_t memmap_addr;
>      size_t memmap_length;
>=20
> +    bool hyperlaunch_enabled;
> +
>      unsigned int nr_modules;
>      struct boot_module mods[MAX_NR_BOOTMODS + 1];
>      struct boot_domain domains[MAX_NR_BOOTDOMS];
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 4df012460d..ccc57cc70a 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -5,6 +5,7 @@
>  #include <xen/cpuidle.h>
>  #include <xen/dmi.h>
>  #include <xen/domain.h>
> +#include <xen/domain-builder.h>
>  #include <xen/domain_page.h>
>  #include <xen/efi.h>
>  #include <xen/err.h>
> @@ -1282,9 +1283,12 @@ void asmlinkage __init noreturn __start_xen(void)
>                 bi->nr_modules);
>      }
>=20
> -    /* Dom0 kernel is always first */
> -    bi->mods[0].type =3D BOOTMOD_KERNEL;
> -    bi->domains[0].kernel =3D &bi->mods[0];
> +    builder_init(bi);
> +
> +    /* Find first unknown boot module to use as dom0 kernel */
> +    i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> +    bi->mods[i].type =3D BOOTMOD_KERNEL;
> +    bi->domains[0].kernel =3D &bi->mods[i];

Nit: perhaps add convenience aliases for bi->domains[0] (e.g. dom0) and=20
for bi->mods[0] (e.g. mod)?

>=20
>      if ( pvh_boot )
>      {
> @@ -1467,8 +1471,9 @@ void asmlinkage __init noreturn __start_xen(void)
>          xen->size  =3D __2M_rwdata_end - _stext;
>      }
>=20
> -    bi->mods[0].headroom =3D
> -        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].siz=
e);
> +    bi->domains[0].kernel->headroom =3D
> +        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
> +                         bi->domains[0].kernel->size);
>      bootstrap_unmap();
>=20
>  #ifndef highmem_start
> @@ -1592,7 +1597,7 @@ void asmlinkage __init noreturn __start_xen(void)
>  #endif
>      }
>=20
> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
> +    if ( bi->domains[0].kernel->headroom && !bi->domains[0].kernel->relo=
cated )
>          panic("Not enough memory to relocate the dom0 kernel image\n");
>      for ( i =3D 0; i < bi->nr_modules; ++i )
>      {
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 98f0873056..565837bc71 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D dev=
ice.o
>  obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
>  obj-y +=3D domain.o
> +obj-$(CONFIG_HAS_BOOT_INFO) +=3D domain-builder/
>  obj-y +=3D event_2l.o
>  obj-y +=3D event_channel.o
>  obj-$(CONFIG_EVTCHN_FIFO) +=3D event_fifo.o
> diff --git a/xen/common/domain-builder/Makefile b/xen/common/domain-build=
er/Makefile
> new file mode 100644
> index 0000000000..b10cd56b28
> --- /dev/null
> +++ b/xen/common/domain-builder/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_DOMAIN_BUILDER) +=3D fdt.init.o
> +obj-y +=3D core.init.o
> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder=
/core.c
> new file mode 100644
> index 0000000000..a5b21fc179
> --- /dev/null
> +++ b/xen/common/domain-builder/core.c
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/kconfig.h>
> +#include <xen/lib.h>
> +
> +#include <asm/bootinfo.h>
> +
> +#include "fdt.h"
> +
> +void __init builder_init(struct boot_info *bi)
> +{
> +    bi->hyperlaunch_enabled =3D false;
> +
> +    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )

I would re-organize the code to remove one level of indentation, e.g.:

       if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
            return;

       switch ( ret =3D has_hyperlaunch_fdt(bi) )
       ...

or even add #ifdef CONFIG_DOMAIN_BUILDER for builder_init() in the header f=
ile.

What do you think?

> +    {
> +        int ret;
> +
> +        switch ( ret =3D has_hyperlaunch_fdt(bi) )
> +        {
> +        case 0:
> +            printk(XENLOG_DEBUG "DT found: hyperlaunch\n");
> +            bi->hyperlaunch_enabled =3D true;
> +            bi->mods[0].type =3D BOOTMOD_FDT;
> +            break;
> +
> +        case -EINVAL:
> +            /* No DT found */
> +            break;
> +
> +        case -ENOENT:
> +        case -ENODATA:

Looks like this code accounts for the follow on change: current implementat=
ion
only returns -EINVAL or 0.

Is it possible to convert has_hyperlaunch_fdt() to a simple predicate?

> +            printk(XENLOG_DEBUG "DT found: non-hyperlaunch (%d)\n", ret)=
;
> +            bi->mods[0].type =3D BOOTMOD_FDT;
> +            break;
> +
> +        default:
> +            printk(XENLOG_ERR "unknown error (%d) checking hyperlaunch D=
T\n",
> +                   ret);
> +            break;
> +        }
> +    }
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
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> new file mode 100644
> index 0000000000..aaf8c1cc16
> --- /dev/null
> +++ b/xen/common/domain-builder/fdt.c
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +
> +#include <asm/bootinfo.h>
> +#include <asm/page.h>
> +#include <asm/setup.h>
> +
> +#include "fdt.h"
> +
> +int __init has_hyperlaunch_fdt(const struct boot_info *bi)

I think the function can return `bool` in current patch.

> +{
> +    int ret =3D 0;
> +    const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_ID=
X]);
> +
> +    if ( !fdt || fdt_check_header(fdt) < 0 )
> +        ret =3D -EINVAL;
> +
> +    bootstrap_unmap();
> +
> +    return ret;
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
> diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/=
fdt.h
> new file mode 100644
> index 0000000000..97a45a6ec4
> --- /dev/null
> +++ b/xen/common/domain-builder/fdt.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_DOMAIN_BUILDER_FDT_H__
> +#define __XEN_DOMAIN_BUILDER_FDT_H__
> +
> +struct boot_info;
> +
> +/* hyperlaunch fdt is required to be module 0 */
> +#define HYPERLAUNCH_MODULE_IDX 0
> +
> +int has_hyperlaunch_fdt(const struct boot_info *bi);
> +
> +#endif /* __XEN_DOMAIN_BUILDER_FDT_H__ */
> diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-bu=
ilder.h
> new file mode 100644
> index 0000000000..ac2b84775d
> --- /dev/null
> +++ b/xen/include/xen/domain-builder.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_DOMAIN_BUILDER_H__
> +#define __XEN_DOMAIN_BUILDER_H__
> +
> +struct boot_info;
> +
> +void builder_init(struct boot_info *bi);
> +
> +#endif /* __XEN_DOMAIN_BUILDER_H__ */
> --
> 2.43.0
>=20
>=20


