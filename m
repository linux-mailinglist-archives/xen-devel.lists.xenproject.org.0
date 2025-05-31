Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32323AC98A3
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001705.1381825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLACZ-0003Gi-9I; Sat, 31 May 2025 00:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001705.1381825; Sat, 31 May 2025 00:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLACZ-0003EG-6K; Sat, 31 May 2025 00:35:55 +0000
Received: by outflank-mailman (input) for mailman id 1001705;
 Sat, 31 May 2025 00:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nViP=YP=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uLACW-0003EA-0C
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:35:53 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3141cc44-3db7-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 02:35:46 +0200 (CEST)
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
X-Inumbo-ID: 3141cc44-3db7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=pbmd52kys5g25bbf36orjl3s4i.protonmail; t=1748651745; x=1748910945;
	bh=o0KvuhmVnTSPDujnz7LCsj+x1vXQZJO4HgOSlrJh7aQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=lCStGrIa8vhmqQN4cLAJo5Th5GLGZCRRMOEMGWDBiKfk0tz49uaZmpzSUH7RgVkNh
	 fzYJj3k1f4MgLlSopja8MOYT2CNXZZUqy94g/M0Kon9K9y1d4YUzZMI7NBvSBn68uf
	 lGRe124IkpkA0jc6v4XtBglQz0NvewwKMLdrU/yTVRYhpeXwSstOzrK73Qnst/qLeT
	 zdKrO4sj5hJVdER2DQvSsC1mpz/c0WRm4P+fcN9uRZqeWv+HYpQK6RmINMPE4VDLlE
	 xo17ExuJBNCcksSnIgcTDFggG3EYdt2UIuaQV+QSlVm+AD6LyqrM3BB+Jta7wZ40a/
	 Pv0yUqghi7ISw==
Date: Sat, 31 May 2025 00:35:39 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
Message-ID: <aDpO1vpKUqWSyBt1@kraken>
In-Reply-To: <20250530120242.39398-13-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-13-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e89c53fcdad1d076fe8dfc002626794684995d39
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 02:02:20PM +0200, Alejandro Vallejo wrote:
> Part of an unpicking process to extract bootfdt contents independent of b=
ootinfo
> to a separate file for x86 to take.
>=20
> Move functions required for early FDT parsing from device_tree.h and arm'=
s
> setup.h onto bootfdt.h
>=20
> Declaration motion only. Not a functional change.
>=20
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/arch/arm/include/asm/setup.h |  6 ----
>  xen/include/xen/bootfdt.h        | 62 ++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h    | 34 +-----------------
>  3 files changed, 63 insertions(+), 39 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/=
setup.h
> index 0f9e531a34..32308837a9 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -55,12 +55,6 @@ void setup_mm(void);
>  extern uint32_t hyp_traps_vector[];
>  void init_traps(void);
>=20
> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> -                         uint32_t size_cells, paddr_t *start, paddr_t *s=
ize);
> -
> -u32 device_tree_get_u32(const void *fdt, int node,
> -                        const char *prop_name, u32 dflt);
> -
>  int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type=
_t p2mt,
>                    struct rangeset *iomem_ranges, struct rangeset *irq_ra=
nges);
>=20
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index fa65e8fcf4..079259c719 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -2,6 +2,7 @@
>  #ifndef XEN_BOOTFDT_H
>  #define XEN_BOOTFDT_H
>=20
> +#include <xen/byteorder.h>
>  #include <xen/types.h>
>  #include <xen/kernel.h>
>  #include <xen/macros.h>
> @@ -16,8 +17,53 @@
>  #define NR_MEM_BANKS 256
>  #define NR_SHMEM_BANKS 32
>=20
> +/* Default #address and #size cells */
> +#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> +#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> +
>  #define MAX_MODULES 32 /* Current maximum useful modules */
>=20
> +#define DEVICE_TREE_MAX_DEPTH 16
> +
> +/* Helper to read a big number; size is in cells (not bytes) */
> +static inline u64 dt_read_number(const __be32 *cell, int size)
> +{
> +    u64 r =3D 0;
> +
> +    while ( size-- )
> +        r =3D (r << 32) | be32_to_cpu(*(cell++));
> +    return r;
> +}
> +
> +static inline u64 dt_next_cell(int s, const __be32 **cellp)
> +{
> +    const __be32 *p =3D *cellp;
> +
> +    *cellp =3D p + s;
> +    return dt_read_number(p, s);
> +}
> +
> +typedef int (*device_tree_node_func)(const void *fdt,
> +                                     int node, const char *name, int dep=
th,
> +                                     u32 address_cells, u32 size_cells,
> +                                     void *data);
> +
> +/**
> + * device_tree_for_each_node - iterate over all device tree sub-nodes
> + * @fdt: flat device tree.
> + * @node: parent node to start the search from
> + * @func: function to call for each sub-node.
> + * @data: data to pass to @func.
> + *
> + * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
> + *
> + * Returns 0 if all nodes were iterated over successfully.  If @func
> + * returns a value different from 0, that value is returned immediately.
> + */
> +int device_tree_for_each_node(const void *fdt, int node,
> +                              device_tree_node_func func,
> +                              void *data);
> +
>  typedef enum {
>      BOOTMOD_XEN,
>      BOOTMOD_FDT,
> @@ -246,4 +292,20 @@ static inline struct membanks *membanks_xzalloc(unsi=
gned int nr,
>      return banks;
>  }
>=20
> +/*
> + * Interpret the property `prop_name` of `node` as a u32.
> + *
> + * Returns the property value on success; otherwise returns `dflt`.
> + */
> +uint32_t device_tree_get_u32(const void *fdt, int node,
> +                             const char *prop_name, uint32_t dflt);

Suggest using `dt_` prefix (or any other good prefix) for all functions
in this header for consistency: e.g. there's dt_read_number() but also
device_tree_get_u32().

> +
> +/*
> + * Interpret the property `prop_name` of `node` as a "reg".
> + *
> + * Returns outputs in `start` and `size`.
> + */
> +void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                         uint32_t size_cells, paddr_t *start, paddr_t *s=
ize);
> +
>  #endif /* XEN_BOOTFDT_H */
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index 6dc1fb5159..0a22b1ba1d 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -10,6 +10,7 @@
>  #ifndef __XEN_DEVICE_TREE_H__
>  #define __XEN_DEVICE_TREE_H__
>=20
> +#include <xen/bootfdt.h>
>  #include <xen/byteorder.h>
>=20
>  #include <asm/device.h>
> @@ -22,8 +23,6 @@
>  #include <xen/list.h>
>  #include <xen/rwlock.h>
>=20
> -#define DEVICE_TREE_MAX_DEPTH 16
> -
>  /*
>   * Struct used for matching a device
>   */
> @@ -164,17 +163,8 @@ struct dt_raw_irq {
>      u32 specifier[DT_MAX_IRQ_SPEC];
>  };
>=20
> -typedef int (*device_tree_node_func)(const void *fdt,
> -                                     int node, const char *name, int dep=
th,
> -                                     u32 address_cells, u32 size_cells,
> -                                     void *data);
> -
>  extern const void *device_tree_flattened;
>=20
> -int device_tree_for_each_node(const void *fdt, int node,
> -                              device_tree_node_func func,
> -                              void *data);
> -
>  /**
>   * dt_unflatten_host_device_tree - Unflatten the host device tree
>   *
> @@ -245,10 +235,6 @@ void intc_dt_preinit(void);
>  #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
>  #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
>=20
> -/* Default #address and #size cells */
> -#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> -#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> -
>  #define dt_for_each_property_node(dn, pp)                   \
>      for ( pp =3D (dn)->properties; (pp) !=3D NULL; pp =3D (pp)->next )
>=20
> @@ -258,16 +244,6 @@ void intc_dt_preinit(void);
>  #define dt_for_each_child_node(dt, dn)                      \
>      for ( dn =3D (dt)->child; (dn) !=3D NULL; dn =3D (dn)->sibling )
>=20
> -/* Helper to read a big number; size is in cells (not bytes) */
> -static inline u64 dt_read_number(const __be32 *cell, int size)
> -{
> -    u64 r =3D 0;
> -
> -    while ( size-- )
> -        r =3D (r << 32) | be32_to_cpu(*(cell++));
> -    return r;
> -}
> -
>  /* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) =
*/
>  static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
>  {
> @@ -307,14 +283,6 @@ static inline int dt_size_to_cells(int bytes)
>      return (bytes / sizeof(u32));
>  }
>=20
> -static inline u64 dt_next_cell(int s, const __be32 **cellp)
> -{
> -    const __be32 *p =3D *cellp;
> -
> -    *cellp =3D p + s;
> -    return dt_read_number(p, s);
> -}
> -
>  static inline const char *dt_node_full_name(const struct dt_device_node =
*np)
>  {
>      return (np && np->full_name) ? np->full_name : "<no-node>";
> --
> 2.43.0
>=20
>=20


