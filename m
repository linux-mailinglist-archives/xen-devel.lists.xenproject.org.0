Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B977A833E2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 00:04:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944705.1343077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dX4-00080y-8F; Wed, 09 Apr 2025 22:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944705.1343077; Wed, 09 Apr 2025 22:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dX4-0007y8-5S; Wed, 09 Apr 2025 22:04:30 +0000
Received: by outflank-mailman (input) for mailman id 944705;
 Wed, 09 Apr 2025 22:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2dX1-0007xm-7N
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 22:04:28 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 978a4dff-158e-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 00:04:22 +0200 (CEST)
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
X-Inumbo-ID: 978a4dff-158e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744236260; x=1744495460;
	bh=UCEjU4LYeZJUAIjRezYVfPl42oqlC4FDWYN2cs84d3o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Kj2oq4ixsL92YtOJE9uNModcTySE/OeA1cI3JKBy4HxI93i1RsJmziA3TKvalZmx2
	 m35y4bVbFWFYHe7Uh9/jJP3eaEiqx4PHS0cM+Zb+X2sAW+r89QeTerf+gAIwq0BeDY
	 k7WBlbkrpmuR25p+NV3lxLK78c2h2WR/m4HY+ldcqV7waPGT2qVa7JG1QQI3UWYLGb
	 PyqXNUPVInKQRGInHTpgPHIEve5lTm932h1uJwothU15/80p8PTRVZMc1IHQWHGyfi
	 m0UTNrb6D+1rt1pEJFWTcFUNPfV/WHJW4zXFSWIZm+k/Q1GtaXw0NhIoCOr3t3FRdi
	 shcV5tDrxTN6A==
Date: Wed, 09 Apr 2025 22:04:16 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3 10/16] x86/hyperlaunch: obtain cmdline from device tree
Message-ID: <AOApTL7inEgfBXUrdPTzjM3e6XyK-nDlfQz5j7gpcrOIHEJfLC9sXSTgbSthCSkzDqjRK8vAY-_5yDSXiKSEnEkoBvDIvCU9Rw-ZbsIZRh4=@proton.me>
In-Reply-To: <20250408160802.49870-11-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-11-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4af21ed900d1d49df64e3e211c203977d4f56f8d
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
> Add support to read the command line from the hyperlauunch device tree.
> The device tree command line is located in the "bootargs" property of the
> "multiboot,kernel" node.
>=20
> A boot loader command line, e.g. a grub module string field, takes
> precendence ove the device tree one since it is easier to modify.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>=20
> ---
> v3:
> * Rename to fdt_get_prop_offset()
> * Remove size_t cast from builder_get_cmdline_size()
> * fdt_get_prop_offset() use strcmp()
> * fdt_get_prop_offset() return bool
> ---
> xen/arch/x86/domain-builder/core.c | 28 +++++++++++++++++++++++
> xen/arch/x86/domain-builder/fdt.c | 6 +++++
> xen/arch/x86/domain-builder/fdt.h | 25 ++++++++++++++++++++
> xen/arch/x86/include/asm/bootinfo.h | 6 +++--
> xen/arch/x86/include/asm/domain-builder.h | 4 ++++
> xen/arch/x86/setup.c | 12 +++++++---
> xen/include/xen/libfdt/libfdt-xen.h | 23 +++++++++++++++++++
> 7 files changed, 99 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-bui=
lder/core.c
> index eda7fa7a8f..510a74a675 100644
> --- a/xen/arch/x86/domain-builder/core.c
> +++ b/xen/arch/x86/domain-builder/core.c
> @@ -8,9 +8,37 @@
> #include <xen/lib.h>
>=20
>=20
> #include <asm/bootinfo.h>
>=20
> +#include <asm/setup.h>
>=20
>=20
> #include "fdt.h"
>=20
> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset)
> +{
> +#ifdef CONFIG_DOMAIN_BUILDER
> + const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX])=
;
>=20
> + int size =3D fdt_cmdline_prop_size(fdt, offset);
> +
> + bootstrap_unmap();
> + return size < 0 ? 0 : size;
> +#else
> + return 0;
> +#endif
> +}
> +
> +int __init builder_get_cmdline(
> + struct boot_info *bi, int offset, char *cmdline, size_t size)
> +{
> +#ifdef CONFIG_DOMAIN_BUILDER
> + const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX])=
;
>=20
> + int ret =3D fdt_cmdline_prop_copy(fdt, offset, cmdline, size);
> +
> + bootstrap_unmap();
> + return ret;
> +#else
> + return 0;
> +#endif
> +}
> +
> void __init builder_init(struct boot_info *bi)
> {
> if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-buil=
der/fdt.c
> index a037c8b6cb..bc9903a9de 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -189,6 +189,12 @@ static int __init process_domain_node(
> printk(" kernel: boot module %d\n", idx);
> bi->mods[idx].type =3D BOOTMOD_KERNEL;
>=20
> bd->kernel =3D &bi->mods[idx];
>=20
> +
> + /* If bootloader didn't set cmdline, see if FDT provides one. */
> + if ( bd->kernel->cmdline_pa &&
>=20
> + !((char *)__va(bd->kernel->cmdline_pa))[0] )
>=20
> + bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
>=20
> + fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>=20
> }
> }
>=20
> diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-buil=
der/fdt.h
> index e8769dc51c..91f665c8fd 100644
> --- a/xen/arch/x86/domain-builder/fdt.h
> +++ b/xen/arch/x86/domain-builder/fdt.h
> @@ -12,6 +12,31 @@ struct boot_info;
> #define HYPERLAUNCH_MODULE_IDX 0
>=20
> #ifdef CONFIG_DOMAIN_BUILDER
> +
> +static inline int __init fdt_cmdline_prop_size(const void *fdt, int offs=
et)
> +{
> + int ret;
> +
> + fdt_get_property_by_offset(fdt, offset, &ret);
> +
> + return ret;
> +}
> +
> +static inline int __init fdt_cmdline_prop_copy(
> + const void *fdt, int offset, char *cmdline, size_t size)
> +{
> + int ret;
> + const struct fdt_property *prop =3D
> + fdt_get_property_by_offset(fdt, offset, &ret);
> +
> + if ( ret < 0 )
> + return ret;
> +
> + ASSERT(size > ret);
>=20
> +
> + return strlcpy(cmdline, prop->data, ret);
>=20
> +}
> +
> int has_hyperlaunch_fdt(const struct boot_info *bi);
> int walk_hyperlaunch_fdt(struct boot_info bi);
> #else
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/a=
sm/bootinfo.h
> index 1e3d582e45..5b2c93b1ef 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -35,11 +35,13 @@ struct boot_module {
>=20
> /
> * Module State Flags:
> - * relocated: indicates module has been relocated in memory.
> - * released: indicates module's pages have been freed.
> + * relocated: indicates module has been relocated in memory.
> + * released: indicates module's pages have been freed.
> + * fdt_cmdline: indicates module's cmdline is in the FDT.
> /
> bool relocated:1;
> bool released:1;
> + bool fdt_cmdline:1;
>=20
> /
> * A boot module may need decompressing by Xen. Headroom is an estimate of
> diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/inc=
lude/asm/domain-builder.h
> index b6d9ba94de..7518b6ddf3 100644
> --- a/xen/arch/x86/include/asm/domain-builder.h
> +++ b/xen/arch/x86/include/asm/domain-builder.h
> @@ -3,6 +3,10 @@
>=20
> struct boot_info;
>=20
> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset)=
;
> +int __init builder_get_cmdline(
> + struct boot_info *bi, int offset, char *cmdline, size_t size);
> +
> void builder_init(struct boot_info *bi);
>=20
> #endif
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 00e8c8a2a3..ca4415d020 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -984,7 +984,10 @@ static size_t __init domain_cmdline_size(
> {
> size_t s =3D bi->kextra ? strlen(bi->kextra) : 0;
>=20
>=20
> - s +=3D bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : =
0;
>=20
> + if ( bd->kernel->fdt_cmdline )
>=20
> + s +=3D builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
>=20
> + else
> + s +=3D strlen(__va(bd->kernel->cmdline_pa));
>=20
>=20
> if ( s =3D=3D 0 )
> return s;
> @@ -1047,9 +1050,12 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
> if ( !(cmdline =3D xzalloc_array(char, cmdline_size)) )
> panic("Error allocating cmdline buffer for %pd\n", d);
>=20
> - if ( bd->kernel->cmdline_pa )
>=20
> + if ( bd->kernel->fdt_cmdline )
>=20
> + builder_get_cmdline(
> + bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
>=20
> + else
> strlcpy(cmdline,
> - cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
>=20
> + cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),

Add extra space before bi->loader?

>=20
> cmdline_size);
>=20
> if ( bi->kextra )
>=20
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt=
/libfdt-xen.h
> index 2259c09a6a..e473fbaf0c 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -23,6 +23,29 @@ static inline uint64_t __init fdt_cell_as_u64(const fd=
t32_t *cell)
> return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);
> }
>=20
> +static inline bool __init fdt_get_prop_offset(
> + const void *fdt, int node, const char *name, unsigned long *offset)
> +{
> + int ret, poffset;
> + const char *pname;
> +
> + fdt_for_each_property_offset(poffset, fdt, node)
> + {
> + fdt_getprop_by_offset(fdt, poffset, &pname, &ret);

Return value is not checked.

> +
> + if ( ret < 0 )
> + continue;
> +
> + if ( strcmp(pname, name) =3D=3D 0 )

I got an impression that the preferred form is=20
   if ( !strcmp(pname, name) )

> + {
> + offset =3D poffset;
> + return true;
> + }
> + }
> +
> + return false;
> +}
> +
> /
> * Property: reg
> *
> --
> 2.43.0

