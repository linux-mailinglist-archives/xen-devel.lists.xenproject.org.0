Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E075A82F67
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 20:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944567.1342986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2aYo-0000aW-Qr; Wed, 09 Apr 2025 18:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944567.1342986; Wed, 09 Apr 2025 18:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2aYo-0000YR-O9; Wed, 09 Apr 2025 18:54:06 +0000
Received: by outflank-mailman (input) for mailman id 944567;
 Wed, 09 Apr 2025 18:54:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2aYm-0000YJ-Nc
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 18:54:05 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000aba72-1574-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 20:54:01 +0200 (CEST)
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
X-Inumbo-ID: 000aba72-1574-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744224838; x=1744484038;
	bh=FDls02VgMpWoqgWr9HzHcZaFpa4GILRpy8zPLpQzUXI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ng3ZKYfbF21wqn9L+CQ7wzdcoskCPLA9kI6cB2DusvgkaZoj5vFA2HQmWQkAfuB1X
	 jzCiZOOHJ82fEqvqRBPCEAtw4oeTwktZ+OZSfaUpi/xxSb3wCU2oNVoimODer/BjcX
	 EPtV+Es5qaMAlZuz7tR6/K3k2oMbuX+PSO/UIqTObi/RG9UARbs4WCr1eJEp+3/c9N
	 1dc8vaFklhZXWFAlHijt6kt3KdgXK76sAEtZHC4rRPgjowuQeJHTzqilafpMU3lu8A
	 G2Ed5LADeq6196qei6VwFZmkk8Ff///o4pxUchAzBazllkQW6kXZC3GitLG7wxhtyr
	 LzLsy0sNlvVSg==
Date: Wed, 09 Apr 2025 18:53:55 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Denis Mukhin <dmkhn@proton.me>
Subject: Re: [PATCH v3 06/16] x86/hyperlaunch: introduce the domain builder
Message-ID: <FxuO_b3q9bY4mPUG3KmuO_YTqqsPhI1sMXykQ5UkxaLzhMlAoAZtQKzl9puHPW29hxCx_Fm1y_YfmBquI1Cm0QA0Y3TKYTy4waHKKaODj9c=@proton.me>
In-Reply-To: <20250408160802.49870-7-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-7-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 169f3cbaafa468075511cacba74c7c3ecf1bf2f5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.com=
> wrote:

>=20
>=20
> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>=20
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
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>=20
> ---
> v3:
> * Move obj-y +=3D domain-builder/
> * Remove blank line in Makefile
> * const in has_hyperlaunch_fdt()
> * CONFIG_LIBFDT rename
> * Use boot_info forward declaration
> * Rename domainbuilder.h to domain-builder.h
> * Add fdt NULL check
> ---
> xen/arch/x86/Makefile | 1 +
> xen/arch/x86/domain-builder/Kconfig | 2 +-
> xen/arch/x86/domain-builder/Makefile | 2 +
> xen/arch/x86/domain-builder/core.c | 57 +++++++++++++++++++++++
> xen/arch/x86/domain-builder/fdt.c | 37 +++++++++++++++
> xen/arch/x86/domain-builder/fdt.h | 21 +++++++++

I have a general question.

Wouldn't that make sense to use arch-independent placeholder for domain bui=
lder
code right from the starting point?

For example something like xen/common/domain-builder ?

My understanding is that there's a lot of code in the domain builder which
can be potentially shared/re-used with non-x86 architectures.

Also, that seems to align with the intention to have common arch-independen=
t
subsystems in the code base:

   https://docs.google.com/presentation/d/1q9cjJZLUxUo1YzMpCxVHuL-ZOGoFaO9h=
aHfRBK4i4Uc/edit?slide=3Did.g32afc87aef4_0_18#slide=3Did.g32afc87aef4_0_18

> xen/arch/x86/include/asm/bootinfo.h | 3 ++
> xen/arch/x86/include/asm/domain-builder.h | 8 ++++
> xen/arch/x86/setup.c | 17 ++++---
> 9 files changed, 141 insertions(+), 7 deletions(-)
> create mode 100644 xen/arch/x86/domain-builder/Makefile
> create mode 100644 xen/arch/x86/domain-builder/core.c
> create mode 100644 xen/arch/x86/domain-builder/fdt.c
> create mode 100644 xen/arch/x86/domain-builder/fdt.h
> create mode 100644 xen/arch/x86/include/asm/domain-builder.h
>=20
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index f59c9665fd..deae31d627 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -1,6 +1,7 @@
> obj-y +=3D acpi/
> obj-y +=3D boot/
> obj-y +=3D cpu/
> +obj-y +=3D domain-builder/
> obj-y +=3D efi/
> obj-y +=3D genapic/
> obj-$(CONFIG_GUEST) +=3D guest/
> diff --git a/xen/arch/x86/domain-builder/Kconfig b/xen/arch/x86/domain-bu=
ilder/Kconfig
> index 8ed493c3b5..51d549c20d 100644
> --- a/xen/arch/x86/domain-builder/Kconfig
> +++ b/xen/arch/x86/domain-builder/Kconfig
> @@ -3,7 +3,7 @@ menu "Domain Builder Features"
>=20
> config DOMAIN_BUILDER
> bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
> - select LIB_DEVICE_TREE
> + select LIBFDT
> help
> Enables the domain builder capability to configure boot domain
> construction using a flattened device tree.
> diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/domain-b=
uilder/Makefile
> new file mode 100644
> index 0000000000..b10cd56b28
> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_DOMAIN_BUILDER) +=3D fdt.init.o
> +obj-y +=3D core.init.o
> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-bui=
lder/core.c
> new file mode 100644
> index 0000000000..d6ae94f45c
> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/core.c
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only /
> +/
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
>=20
> +#include <xen/init.h>
>=20
> +#include <xen/kconfig.h>
>=20
> +#include <xen/lib.h>
>=20
> +
> +#include <asm/bootinfo.h>
>=20
> +
> +#include "fdt.h"
> +
> +void __init builder_init(struct boot_info *bi)
> +{
> + if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
> + {
> + int ret;
> +
> + switch ( ret =3D has_hyperlaunch_fdt(bi) )
> + {
> + case 0:
> + printk("Hyperlaunch device tree detected\n");
> + bi->hyperlaunch_enabled =3D true;
>=20
> + bi->mods[0].type =3D BOOTMOD_FDT;
>=20
> + break;
> +
> + case -EINVAL:
> + printk("Hyperlaunch device tree was not detected\n");
> + bi->hyperlaunch_enabled =3D false;
>=20
> + break;
> +
> + case -ENOENT:
> + case -ENODATA:
> + printk("Device tree found, but not hyperlaunch (%d)\n", ret);
> + bi->hyperlaunch_enabled =3D false;
>=20
> + bi->mods[0].type =3D BOOTMOD_FDT;
>=20
> + break;
> +
> + default:
> + printk("Unknown error (%d) occured checking for hyperlaunch device tree=
\n",
> + ret);
> + bi->hyperlaunch_enabled =3D false;
>=20
> + break;
> + }
> + }
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
> + /
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-buil=
der/fdt.c
> new file mode 100644
> index 0000000000..aaf8c1cc16
> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -0,0 +1,37 @@
> +/ SPDX-License-Identifier: GPL-2.0-only /
> +/
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
>=20
> +#include <xen/init.h>
>=20
> +#include <xen/lib.h>
>=20
> +#include <xen/libfdt/libfdt.h>
>=20
> +
> +#include <asm/bootinfo.h>
>=20
> +#include <asm/page.h>
>=20
> +#include <asm/setup.h>
>=20
> +
> +#include "fdt.h"
> +
> +int __init has_hyperlaunch_fdt(const struct boot_info *bi)
> +{
> + int ret =3D 0;
> + const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX])=
;
>=20
> +
> + if ( !fdt || fdt_check_header(fdt) < 0 )
> + ret =3D -EINVAL;
> +
> + bootstrap_unmap();
> +
> + return ret;
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
> + /
> diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-buil=
der/fdt.h
> new file mode 100644
> index 0000000000..8e62cd843e
> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/fdt.h
> @@ -0,0 +1,21 @@
> +/ SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +#ifndef XEN_X86_FDT_H
> +#define XEN_X86_FDT_H
> +
> +#include <xen/init.h>
>=20
> +
> +struct boot_info;
> +
> +/* hyperlaunch fdt is required to be module 0 */
> +#define HYPERLAUNCH_MODULE_IDX 0
> +
> +#ifdef CONFIG_DOMAIN_BUILDER
> +int has_hyperlaunch_fdt(const struct boot_info *bi);
> +#else
> +static inline int __init has_hyperlaunch_fdt(const struct boot_info bi)
> +{
> + return -EINVAL;
> +}
> +#endif
> +
> +#endif / XEN_X86_FDT_H */
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/a=
sm/bootinfo.h
> index 3afc214c17..82c2650fcf 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -27,6 +27,7 @@ enum bootmod_type {
> BOOTMOD_RAMDISK,
> BOOTMOD_MICROCODE,
> BOOTMOD_XSM_POLICY,
> + BOOTMOD_FDT,
> };
>=20
> struct boot_module {
> @@ -80,6 +81,8 @@ struct boot_info {
> paddr_t memmap_addr;
> size_t memmap_length;
>=20
> + bool hyperlaunch_enabled;
> +
> unsigned int nr_modules;
> struct boot_module mods[MAX_NR_BOOTMODS + 1];
> struct boot_domain domains[MAX_NR_BOOTDOMS];
> diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/inc=
lude/asm/domain-builder.h
> new file mode 100644
> index 0000000000..b6d9ba94de
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/domain-builder.h
> @@ -0,0 +1,8 @@
> +#ifndef XEN_X86_DOMBUILDER_H
> +#define XEN_X86_DOMBUILDER_H
> +
> +struct boot_info;
> +
> +void builder_init(struct boot_info *bi);
> +
> +#endif
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 83cb66e309..e5d78bcb48 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -36,6 +36,7 @@
> #include <asm/bzimage.h>
>=20
> #include <asm/cpu-policy.h>
>=20
> #include <asm/desc.h>
>=20
> +#include <asm/domain-builder.h>
>=20
> #include <asm/e820.h>
>=20
> #include <asm/edd.h>
>=20
> #include <asm/genapic.h>
>=20
> @@ -1281,9 +1282,12 @@ void asmlinkage __init noreturn __start_xen(void)
> bi->nr_modules);
>=20
> }
>=20
> - /* Dom0 kernel is always first */
> - bi->mods[0].type =3D BOOTMOD_KERNEL;
>=20
> - bi->domains[0].kernel =3D &bi->mods[0];
>=20
> + builder_init(bi);
> +
> + /* Find first unknown boot module to use as Dom0 kernel */
> + i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> + bi->mods[i].type =3D BOOTMOD_KERNEL;
>=20
> + bi->domains[0].kernel =3D &bi->mods[i];
>=20
>=20
> if ( pvh_boot )
> {
> @@ -1466,8 +1470,9 @@ void asmlinkage __init noreturn __start_xen(void)
> xen->size =3D __2M_rwdata_end - _stext;
>=20
> }
>=20
> - bi->mods[0].headroom =3D
>=20
> - bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
>=20
> + bi->domains[0].kernel->headroom =3D
>=20
> + bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
>=20
> + bi->domains[0].kernel->size);
>=20
> bootstrap_unmap();
>=20
> #ifndef highmem_start
> @@ -1591,7 +1596,7 @@ void asmlinkage __init noreturn __start_xen(void)
> #endif
> }
>=20
> - if ( bi->mods[0].headroom && !bi->mods[0].relocated )
>=20
> + if ( bi->domains[0].kernel->headroom && !bi->domains[0].kernel->relocat=
ed )
>=20
> panic("Not enough memory to relocate the dom0 kernel image\n");
> for ( i =3D 0; i < bi->nr_modules; ++i )
>=20
> {
> --
> 2.43.0

