Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89395AC98A6
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001712.1381835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAGM-0003pk-PR; Sat, 31 May 2025 00:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001712.1381835; Sat, 31 May 2025 00:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAGM-0003md-MR; Sat, 31 May 2025 00:39:50 +0000
Received: by outflank-mailman (input) for mailman id 1001712;
 Sat, 31 May 2025 00:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nViP=YP=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uLAGK-0003mH-QA
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:39:48 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c08c9394-3db7-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 02:39:46 +0200 (CEST)
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
X-Inumbo-ID: c08c9394-3db7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748651986; x=1748911186;
	bh=sWU6u4ddiUwSPNUnlgP3++F+h+5dhxc6fyLc1W0nIOw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=mZYsudnEucdICIA1zqF/GZ0m7pb6d++im/fCE9CKvDBlGogOaAOToS9HwCHpfkUpf
	 Q9thw1xjm53kv75vStZHjhmVcPVkw86u0L4KzsUdjvJQojLL3ICMB0GHQM6k8YR4oa
	 BEJRwHHyTgjDM+nh2h79iBICkPwDr8JjZrKIy0Jp0Om1+NOTeczQaa9tLF5H1++xAL
	 6A8rlZKHJf13h60e1RxSao6R2C6L+PjMgmgR2UpMXuXWkac91jHUvPTDUqVs4VMyYg
	 544AZhu0nCg76AyZYzy0nizKWIPtAuLeGoFHnoU09dDqllYwO1ahfLykIoXRoFRBGJ
	 sMc8tndCQ7RNQ==
Date: Sat, 31 May 2025 00:39:43 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 15/19] xen/dt: Move bootinfo-independent helpers out of bootinfo-fdt.c
Message-ID: <aDpPyk6MHv+4bseE@kraken>
In-Reply-To: <20250530120242.39398-16-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-16-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 78278d0f8258107d4d2c4498f91c765f42724dd7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 02:02:23PM +0200, Alejandro Vallejo wrote:
> ... back into bootfdt.c
>=20
> These will be required by x86 later on to detect modules in the early sca=
n of
> the FDT. They are independent of bootinfo, so it's cleaner for them to ex=
ist in
> a separate file.
>=20
> Not a functional change.
>=20
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/common/device-tree/Makefile       |   1 +
>  xen/common/device-tree/bootfdt.c      |  97 ++++++++++++++++++++++++
>  xen/common/device-tree/bootinfo-fdt.c | 104 --------------------------
>  3 files changed, 98 insertions(+), 104 deletions(-)
>  create mode 100644 xen/common/device-tree/bootfdt.c
>=20
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Mak=
efile
> index bb6d5ddec5..922c5bba9b 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,3 +1,4 @@
> +obj-y +=3D bootfdt.init.o
>  obj-y +=3D bootinfo-fdt.init.o
>  obj-y +=3D bootinfo.init.o
>  obj-y +=3D device-tree.o
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bo=
otfdt.c
> new file mode 100644
> index 0000000000..5decf17faf
> --- /dev/null
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/bootfdt.h>
> +#include <xen/bug.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +
> +uint32_t __init device_tree_get_u32(const void *fdt, int node,
> +                                    const char *prop_name, uint32_t dflt=
)
> +{
> +    const struct fdt_property *prop;
> +
> +    prop =3D fdt_get_property(fdt, node, prop_name, NULL);
> +    if ( !prop || prop->len < sizeof(u32) )
> +        return dflt;
> +
> +    return fdt32_to_cpu(*(uint32_t*)prop->data);
> +}
> +
> +int __init device_tree_for_each_node(const void *fdt, int node,
> +                                     device_tree_node_func func,
> +                                     void *data)
> +{
> +    /*
> +     * We only care about relative depth increments, assume depth of
> +     * node is 0 for simplicity.
> +     */
> +    int depth =3D 0;
> +    const int first_node =3D node;
> +    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
> +    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
> +    int ret;
> +
> +    do {
> +        const char *name =3D fdt_get_name(fdt, node, NULL);
> +        u32 as, ss;
> +
> +        if ( depth >=3D DEVICE_TREE_MAX_DEPTH )
> +        {
> +            printk("Warning: device tree node `%s' is nested too deep\n"=
,
> +                   name);

Use XENLOG_WARNING?

> +            continue;
> +        }
> +
> +        as =3D depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CE=
LLS_DEFAULT;
> +        ss =3D depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS=
_DEFAULT;
> +
> +        address_cells[depth] =3D device_tree_get_u32(fdt, node,
> +                                                   "#address-cells", as)=
;
> +        size_cells[depth] =3D device_tree_get_u32(fdt, node,
> +                                                "#size-cells", ss);
> +
> +        /* skip the first node */
> +        if ( node !=3D first_node )
> +        {
> +            ret =3D func(fdt, node, name, depth, as, ss, data);
> +            if ( ret !=3D 0 )
> +                return ret;
> +        }
> +
> +        node =3D fdt_next_node(fdt, node, &depth);
> +    } while ( node >=3D 0 && depth > 0 );
> +
> +    return 0;
> +}
> +
> +void __init device_tree_get_reg(const __be32 **cell, uint32_t address_ce=
lls,
> +                                uint32_t size_cells, paddr_t *start,
> +                                paddr_t *size)
> +{
> +    uint64_t dt_start, dt_size;
> +
> +    /*
> +     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-b=
it.
> +     * Thus, there is an implicit cast from uint64_t to paddr_t.
> +     */
> +    dt_start =3D dt_next_cell(address_cells, cell);
> +    dt_size =3D dt_next_cell(size_cells, cell);
> +
> +    if ( dt_start !=3D (paddr_t)dt_start )
> +    {
> +        printk("Physical address greater than max width supported\n");

I would add current and expected dt_start values to the printout.

> +        WARN();
> +    }
> +
> +    if ( dt_size !=3D (paddr_t)dt_size )
> +    {
> +        printk("Physical size greater than max width supported\n");
> +        WARN();
> +    }
> +
> +    /*
> +     * Xen will truncate the address/size if it is greater than the maxi=
mum
> +     * supported width and it will give an appropriate warning.
> +     */
> +    *start =3D dt_start;
> +    *size =3D dt_size;
> +}
> diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tr=
ee/bootinfo-fdt.c
> index bb5f45771e..736f877616 100644
> --- a/xen/common/device-tree/bootinfo-fdt.c
> +++ b/xen/common/device-tree/bootinfo-fdt.c
> @@ -112,39 +112,6 @@ static bool __init device_tree_is_memory_node(const =
void *fdt, int node,
>      return true;
>  }
>=20
> -void __init device_tree_get_reg(const __be32 **cell, uint32_t address_ce=
lls,
> -                                uint32_t size_cells, paddr_t *start,
> -                                paddr_t *size)
> -{
> -    uint64_t dt_start, dt_size;
> -
> -    /*
> -     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-b=
it.
> -     * Thus, there is an implicit cast from uint64_t to paddr_t.
> -     */
> -    dt_start =3D dt_next_cell(address_cells, cell);
> -    dt_size =3D dt_next_cell(size_cells, cell);
> -
> -    if ( dt_start !=3D (paddr_t)dt_start )
> -    {
> -        printk("Physical address greater than max width supported\n");
> -        WARN();
> -    }
> -
> -    if ( dt_size !=3D (paddr_t)dt_size )
> -    {
> -        printk("Physical size greater than max width supported\n");
> -        WARN();
> -    }
> -
> -    /*
> -     * Xen will truncate the address/size if it is greater than the maxi=
mum
> -     * supported width and it will give an appropriate warning.
> -     */
> -    *start =3D dt_start;
> -    *size =3D dt_size;
> -}
> -
>  static int __init device_tree_get_meminfo(const void *fdt, int node,
>                                            const char *prop_name,
>                                            u32 address_cells, u32 size_ce=
lls,
> @@ -205,77 +172,6 @@ static int __init device_tree_get_meminfo(const void=
 *fdt, int node,
>      return 0;
>  }
>=20
> -u32 __init device_tree_get_u32(const void *fdt, int node,
> -                               const char *prop_name, u32 dflt)
> -{
> -    const struct fdt_property *prop;
> -
> -    prop =3D fdt_get_property(fdt, node, prop_name, NULL);
> -    if ( !prop || prop->len < sizeof(u32) )
> -        return dflt;
> -
> -    return fdt32_to_cpu(*(uint32_t*)prop->data);
> -}
> -
> -/**
> - * device_tree_for_each_node - iterate over all device tree sub-nodes
> - * @fdt: flat device tree.
> - * @node: parent node to start the search from
> - * @func: function to call for each sub-node.
> - * @data: data to pass to @func.
> - *
> - * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
> - *
> - * Returns 0 if all nodes were iterated over successfully.  If @func
> - * returns a value different from 0, that value is returned immediately.
> - */
> -int __init device_tree_for_each_node(const void *fdt, int node,
> -                                     device_tree_node_func func,
> -                                     void *data)
> -{
> -    /*
> -     * We only care about relative depth increments, assume depth of
> -     * node is 0 for simplicity.
> -     */
> -    int depth =3D 0;
> -    const int first_node =3D node;
> -    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
> -    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
> -    int ret;
> -
> -    do {
> -        const char *name =3D fdt_get_name(fdt, node, NULL);
> -        u32 as, ss;
> -
> -        if ( depth >=3D DEVICE_TREE_MAX_DEPTH )
> -        {
> -            printk("Warning: device tree node `%s' is nested too deep\n"=
,
> -                   name);
> -            continue;
> -        }
> -
> -        as =3D depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CE=
LLS_DEFAULT;
> -        ss =3D depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS=
_DEFAULT;
> -
> -        address_cells[depth] =3D device_tree_get_u32(fdt, node,
> -                                                   "#address-cells", as)=
;
> -        size_cells[depth] =3D device_tree_get_u32(fdt, node,
> -                                                "#size-cells", ss);
> -
> -        /* skip the first node */
> -        if ( node !=3D first_node )
> -        {
> -            ret =3D func(fdt, node, name, depth, as, ss, data);
> -            if ( ret !=3D 0 )
> -                return ret;
> -        }
> -
> -        node =3D fdt_next_node(fdt, node, &depth);
> -    } while ( node >=3D 0 && depth > 0 );
> -
> -    return 0;
> -}
> -
>  static int __init process_memory_node(const void *fdt, int node,
>                                        const char *name, int depth,
>                                        u32 address_cells, u32 size_cells,
> --
> 2.43.0
>=20
>=20


