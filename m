Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4AA93FE1
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 00:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959512.1351865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uE1-0004D4-VB; Fri, 18 Apr 2025 22:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959512.1351865; Fri, 18 Apr 2025 22:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uE1-0004BV-SD; Fri, 18 Apr 2025 22:30:21 +0000
Received: by outflank-mailman (input) for mailman id 959512;
 Fri, 18 Apr 2025 22:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5uDy-0004BP-Qr
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 22:30:19 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b103a6df-1ca4-11f0-9ffb-bf95429c2676;
 Sat, 19 Apr 2025 00:30:12 +0200 (CEST)
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
X-Inumbo-ID: b103a6df-1ca4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745015410; x=1745274610;
	bh=yOmMv4r0bmdtj8gYjrO3FpqGdbgw8UmxMH2/MjqIak0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=XSkcYN7UIuMfXvavb2d1OWkq9GxDMdiS6txEd0N+K267rZrMaahP4BpkFmq4jP7ec
	 ZeBn9bYdp4Tlaz5Hhr7DpBpZl9ZAJtTjAjmGNEITKU6ttGUTmm8JYy0dW4hpDJs3Ac
	 gKm/6tY4zxapAj9ngObedqJnd3iEkek2aTnBLEk7KTqewLQp19rBZG0CcgCP9TFnm/
	 fjha0z2vzSqtWO0R3iRrUOZylOBhhmiWrfQqtMFpeXIdGva3HbNyTl2ceH9yRTibxL
	 vA/v8ITvYF7U97UAVHtfcCFKaVXJ0/vMyw+gmxneVSlspRojEJEJGLlMLY6hz+GGj7
	 3iZHbZ9vPmRrA==
Date: Fri, 18 Apr 2025 22:30:07 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 05/13] x86/hyperlaunch: Add helpers to locate multiboot modules
Message-ID: <aALSauQee7Z3O8Bj@kraken>
In-Reply-To: <20250417124844.11143-6-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-6-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5c74d651b7676a213b58f9693db0e5a79410a251
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:27PM +0100, Alejandro Vallejo wrote:
> Hyperlaunch mandates either a reg or module-index DT prop on nodes that
> contain `multiboot,module" under their "compatible" prop. This patch
> introduces a helper to generically find such index, appending the module
> to the list of modules if it wasn't already (i.e: because it's given via
> the "reg" prop).
>=20
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v4:
>   * Remove stray reg prop parser in libfdt-xen.h.
>   * Remove fdt32_as_uX accessors.
>   * Brough fdt_prop_as_u32() accesor from later patches.
>     * So it can be used in place of a hardcoded fdt32_as_u32().
>   * Limited MAX_NR_BOOTMODS to INT_MAX.
>   * Preserved BOOTMOD_XEN on module append logic.
>   * Add missing bounds check to module-index parsed in multiboot module h=
elper.
>   * Converted idx variable to uint32_t for better bounds checking.
>   * Braces from switch statement to conform to coding style.
>   * Added missing XENLOG_X.
>   * Print address_cells and size_cells on error parsing reg properties.
>   * Added (transient) missing declaration for extern helper.
>     * becomes static on the next patch.
> ---
>  xen/common/domain-builder/fdt.c     | 162 ++++++++++++++++++++++++++++
>  xen/common/domain-builder/fdt.h     |   2 +
>  xen/include/xen/domain-builder.h    |   3 +
>  xen/include/xen/libfdt/libfdt-xen.h |  11 ++
>  4 files changed, 178 insertions(+)
>=20
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index b5ff8220da..d73536fed6 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -13,6 +13,168 @@
>=20
>  #include "fdt.h"
>=20
> +/*
> + * Unpacks a "reg" property into its address and size constituents.
> + *
> + * @param prop          Pointer to an FDT "reg" property.
> + * @param address_cells Number of 4-octet cells that make up an "address=
".
> + * @param size_cells    Number of 4-octet cells that make up a "size".
> + * @param p_addr[out]   Address encoded in the property.
> + * @param p_size[out]   Size encoded in the property.
> + * @returns             -EINVAL on malformed property, 0 otherwise.
> + */
> +static int __init read_fdt_prop_as_reg(const struct fdt_property *prop,

I would do s/read_fdt_prop_as_reg/fdt_prop_as_reg/ similar to fdt_prop_as_u=
32()
below.

> +                                       int address_cells, int size_cells=
,
> +                                       uint64_t *p_addr, uint64_t *p_siz=
e)
> +{
> +    const fdt32_t *cell =3D (const fdt32_t *)prop->data;
> +    uint64_t addr, size;
> +
> +    if ( fdt32_to_cpu(prop->len) !=3D
> +         (address_cells + size_cells) * sizeof(*cell) )
> +    {
> +        printk(XENLOG_ERR "  cannot read reg %lu+%lu from prop len %u\n"=
,
> +            address_cells * sizeof(*cell), size_cells * sizeof(*cell),
> +            fdt32_to_cpu(prop->len));
> +        return -EINVAL;
> +    }
> +
> +    switch ( address_cells )
> +    {
> +    case 1:
> +        addr =3D fdt32_to_cpu(*cell);
> +        break;
> +    case 2:
> +        addr =3D fdt64_to_cpu(*(const fdt64_t *)cell);
> +        break;
> +    default:
> +        printk(XENLOG_ERR "  unsupported address_cells=3D%d\n", address_=
cells);
> +        return -EINVAL;
> +    }
> +
> +    cell +=3D address_cells;
> +    switch ( size_cells )
> +    {
> +    case 1:
> +        size =3D fdt32_to_cpu(*cell);
> +        break;
> +    case 2:
> +        size =3D fdt64_to_cpu(*(const fdt64_t *)cell);
> +        break;
> +    default:
> +        printk(XENLOG_ERR "  unsupported size_cells=3D%d\n", size_cells)=
;
> +        return -EINVAL;
> +    }
> +
> +    *p_addr =3D addr;
> +    *p_size =3D size;
> +
> +    return 0;
> +}
> +
> +/*
> + * Locate a multiboot module given its node offset in the FDT.
> + *
> + * The module location may be given via either FDT property:
> + *     * reg =3D <address, size>
> + *         * Mutates `bi` to append the module.
> + *     * module-index =3D <idx>
> + *         * Leaves `bi` unchanged.
> + *
> + * @param fdt           Pointer to the full FDT.
> + * @param node          Offset for the module node.
> + * @param address_cells Number of 4-octet cells that make up an "address=
".
> + * @param size_cells    Number of 4-octet cells that make up a "size".
> + * @param bi[inout]     Xen's representation of the boot parameters.
> + * @return              -EINVAL on malformed nodes, otherwise
> + *                      index inside `bi->mods`
> + */
> +int __init fdt_read_multiboot_module(const void *fdt, int node,
> +                                     int address_cells, int size_cells,
> +                                     struct boot_info *bi)
> +{
> +    const struct fdt_property *prop;
> +    uint64_t addr, size;
> +    int ret;
> +    uint32_t idx;
> +
> +    if ( fdt_node_check_compatible(fdt, node, "multiboot,module") )
> +    {
> +        printk(XENLOG_ERR "  bad module. multiboot,module not found");
> +        return -ENODATA;
> +    }
> +
> +    /* Location given as a `module-index` property. */
> +    if ( (prop =3D fdt_get_property(fdt, node, "module-index", NULL)) )
> +    {
> +        if ( fdt_get_property(fdt, node, "reg", NULL) )
> +        {
> +            printk(XENLOG_ERR "  found both reg and module-index for mod=
ule\n");
> +            return -EINVAL;
> +        }
> +        if ( (ret =3D fdt_prop_as_u32(prop, &idx)) )
> +        {
> +            printk(XENLOG_ERR "  bad module-index prop\n");
> +            return ret;
> +        }
> +        if ( idx >=3D MAX_NR_BOOTMODS )
> +        {
> +            printk(XENLOG_ERR "  module-index overflow. %s=3D%u\n",
> +                   STR(MAX_NR_BOOTMODS), MAX_NR_BOOTMODS);
> +            return -EINVAL;
> +        }
> +
> +        return idx;
> +    }
> +
> +    /* Otherwise location given as a `reg` property. */
> +    if ( !(prop =3D fdt_get_property(fdt, node, "reg", NULL)) )
> +    {
> +        printk(XENLOG_ERR "  no location for multiboot,module\n");
> +        return -EINVAL;
> +    }
> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
> +    {
> +        printk(XENLOG_ERR "  found both reg and module-index for module\=
n");
> +        return -EINVAL;
> +    }
> +
> +    ret =3D read_fdt_prop_as_reg(prop, address_cells, size_cells, &addr,=
 &size);
> +    if ( ret < 0 )
> +    {
> +        printk(XENLOG_ERR "  failed reading reg for multiboot,module\n")=
;
> +        return -EINVAL;
> +    }
> +
> +    idx =3D bi->nr_modules;
> +    if ( idx > MAX_NR_BOOTMODS )
> +    {
> +        /*
> +         * MAX_NR_BOOTMODS must fit in 31 bits so it's representable in =
the
> +         * positive side of an int; for the return value.
> +         */
> +        BUILD_BUG_ON(MAX_NR_BOOTMODS > (uint64_t)INT_MAX);
> +        printk(XENLOG_ERR "  idx=3D%u exceeds len=3D%u\n", idx, MAX_NR_B=
OOTMODS);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * Append new module to the existing list
> +     *
> +     * Note that bi->nr_modules points to Xen itself, so we must shift i=
t first
> +     */
> +    bi->nr_modules++;
> +    bi->mods[bi->nr_modules] =3D bi->mods[idx];
> +    bi->mods[idx] =3D (struct boot_module){
> +        .start =3D addr,
> +        .size =3D size,
> +    };
> +
> +    printk(XENLOG_INFO "  module[%u]: addr %lx size %lx\n", idx, addr, s=
ize);
> +
> +    return idx;
> +}
> +
>  static int __init find_hyperlaunch_node(const void *fdt)
>  {
>      int hv_node =3D fdt_path_offset(fdt, "/chosen/hypervisor");
> diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/=
fdt.h
> index 955aead497..8c98a256eb 100644
> --- a/xen/common/domain-builder/fdt.h
> +++ b/xen/common/domain-builder/fdt.h
> @@ -2,6 +2,8 @@
>  #ifndef __XEN_DOMAIN_BUILDER_FDT_H__
>  #define __XEN_DOMAIN_BUILDER_FDT_H__
>=20
> +#include <xen/libfdt/libfdt-xen.h>
> +
>  struct boot_info;
>=20
>  /* hyperlaunch fdt is required to be module 0 */
> diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-bu=
ilder.h
> index ac2b84775d..ace6b6875b 100644
> --- a/xen/include/xen/domain-builder.h
> +++ b/xen/include/xen/domain-builder.h
> @@ -5,5 +5,8 @@
>  struct boot_info;
>=20
>  void builder_init(struct boot_info *bi);
> +int fdt_read_multiboot_module(const void *fdt, int node,
> +                              int address_cells, int size_cells,
> +                              struct boot_info *bi)
>=20
>  #endif /* __XEN_DOMAIN_BUILDER_H__ */
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt=
/libfdt-xen.h
> index a5340bc9f4..deafb25d98 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -12,6 +12,17 @@
>  #define LIBFDT_XEN_H
>=20
>  #include <xen/libfdt/libfdt.h>
> +#include <xen/errno.h>
> +
> +static inline int __init fdt_prop_as_u32(
> +    const struct fdt_property *prop, uint32_t *val)
> +{
> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
> +        return -EINVAL;
> +
> +    *val =3D fdt32_to_cpu(*(const fdt32_t *)prop->data);
> +    return 0;
> +}

My understanding is domain builder establishes its own shims around libfdt =
so
libfdt is kept unmodified and it is easier to pick up libfdt updates.

So, IMO, this function should reside in xen/common/domain-builder/fdt.c

Thoughts?

>=20
>  static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
>                                          paddr_t *address,
> --
> 2.43.0
>=20
>=20


