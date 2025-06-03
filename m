Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B07FACBDF7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 02:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003916.1383547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMFfV-0004Wh-B7; Tue, 03 Jun 2025 00:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003916.1383547; Tue, 03 Jun 2025 00:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMFfV-0004Uo-7i; Tue, 03 Jun 2025 00:38:17 +0000
Received: by outflank-mailman (input) for mailman id 1003916;
 Tue, 03 Jun 2025 00:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XduF=YS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMFfT-0004IK-2D
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 00:38:16 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0824140d-4013-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 02:38:14 +0200 (CEST)
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
X-Inumbo-ID: 0824140d-4013-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=vnfvoodvuzapxl32lxf6ktocfi.protonmail; t=1748911092; x=1749170292;
	bh=NkqVXTkUraQM1kDo5kywHE98t4vuBH9mpp4lvyunIHA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WyXk5IdkzFX8lAw0CZjaYrNsHV2eBYHxWMHY07X11x/xv1RpmmrNmnF2wzgDR3+DT
	 Ng92SHKbwR7hP5hBfmRWrambYIoDi4uG+PCMf6vnP7sSDGRiO/FX+aTUjYeOfaUKHj
	 QYAjsK2OFm8r89guN9qSp1NunYtsBSvaOiJy2jrGFDNIV8EmDk0n95SqK8V2wUmVpI
	 OPDtXKvSQCdtO9IT7HOLReYEG3E8WftTw5J50KT3j2QFlOuQBVuzoAREgCMd4IQIFN
	 kllJkbFqrxCKbq8id3HahJxpJBI4bHjm3kKmd9I3FplmjfJ4djHhUZcjnUwa32wrgx
	 XLG6HGabidXcA==
Date: Tue, 03 Jun 2025 00:38:04 +0000
To: "Orzel, Michal" <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
Message-ID: <aD5D6JjxASirpRtB@kraken>
In-Reply-To: <9df7c8b2-0864-4d8e-8969-d876ae77c4cc@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-13-agarciav@amd.com> <aDpO1vpKUqWSyBt1@kraken> <9df7c8b2-0864-4d8e-8969-d876ae77c4cc@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 243c7a256fddd7c3254a3848b7c533d23957cce5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 02, 2025 at 09:29:16AM +0200, Orzel, Michal wrote:
>=20
>=20
> On 31/05/2025 02:35, dmkhn@proton.me wrote:
> > On Fri, May 30, 2025 at 02:02:20PM +0200, Alejandro Vallejo wrote:
> >> Part of an unpicking process to extract bootfdt contents independent o=
f bootinfo
> >> to a separate file for x86 to take.
> >>
> >> Move functions required for early FDT parsing from device_tree.h and a=
rm's
> >> setup.h onto bootfdt.h
> >>
> >> Declaration motion only. Not a functional change.
> >>
> >> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> >> ---
> >>  xen/arch/arm/include/asm/setup.h |  6 ----
> >>  xen/include/xen/bootfdt.h        | 62 +++++++++++++++++++++++++++++++=
+
> >>  xen/include/xen/device_tree.h    | 34 +-----------------
> >>  3 files changed, 63 insertions(+), 39 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/a=
sm/setup.h
> >> index 0f9e531a34..32308837a9 100644
> >> --- a/xen/arch/arm/include/asm/setup.h
> >> +++ b/xen/arch/arm/include/asm/setup.h
> >> @@ -55,12 +55,6 @@ void setup_mm(void);
> >>  extern uint32_t hyp_traps_vector[];
> >>  void init_traps(void);
> >>
> >> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> >> -                         uint32_t size_cells, paddr_t *start, paddr_t=
 *size);
> >> -
> >> -u32 device_tree_get_u32(const void *fdt, int node,
> >> -                        const char *prop_name, u32 dflt);
> >> -
> >>  int handle_device(struct domain *d, struct dt_device_node *dev, p2m_t=
ype_t p2mt,
> >>                    struct rangeset *iomem_ranges, struct rangeset *irq=
_ranges);
> >>
> >> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> >> index fa65e8fcf4..079259c719 100644
> >> --- a/xen/include/xen/bootfdt.h
> >> +++ b/xen/include/xen/bootfdt.h
> >> @@ -2,6 +2,7 @@
> >>  #ifndef XEN_BOOTFDT_H
> >>  #define XEN_BOOTFDT_H
> >>
> >> +#include <xen/byteorder.h>
> >>  #include <xen/types.h>
> >>  #include <xen/kernel.h>
> >>  #include <xen/macros.h>
> >> @@ -16,8 +17,53 @@
> >>  #define NR_MEM_BANKS 256
> >>  #define NR_SHMEM_BANKS 32
> >>
> >> +/* Default #address and #size cells */
> >> +#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> >> +#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> >> +
> >>  #define MAX_MODULES 32 /* Current maximum useful modules */
> >>
> >> +#define DEVICE_TREE_MAX_DEPTH 16
> >> +
> >> +/* Helper to read a big number; size is in cells (not bytes) */
> >> +static inline u64 dt_read_number(const __be32 *cell, int size)
> >> +{
> >> +    u64 r =3D 0;
> >> +
> >> +    while ( size-- )
> >> +        r =3D (r << 32) | be32_to_cpu(*(cell++));
> >> +    return r;
> >> +}
> >> +
> >> +static inline u64 dt_next_cell(int s, const __be32 **cellp)
> >> +{
> >> +    const __be32 *p =3D *cellp;
> >> +
> >> +    *cellp =3D p + s;
> >> +    return dt_read_number(p, s);
> >> +}
> >> +
> >> +typedef int (*device_tree_node_func)(const void *fdt,
> >> +                                     int node, const char *name, int =
depth,
> >> +                                     u32 address_cells, u32 size_cell=
s,
> >> +                                     void *data);
> >> +
> >> +/**
> >> + * device_tree_for_each_node - iterate over all device tree sub-nodes
> >> + * @fdt: flat device tree.
> >> + * @node: parent node to start the search from
> >> + * @func: function to call for each sub-node.
> >> + * @data: data to pass to @func.
> >> + *
> >> + * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
> >> + *
> >> + * Returns 0 if all nodes were iterated over successfully.  If @func
> >> + * returns a value different from 0, that value is returned immediate=
ly.
> >> + */
> >> +int device_tree_for_each_node(const void *fdt, int node,
> >> +                              device_tree_node_func func,
> >> +                              void *data);
> >> +
> >>  typedef enum {
> >>      BOOTMOD_XEN,
> >>      BOOTMOD_FDT,
> >> @@ -246,4 +292,20 @@ static inline struct membanks *membanks_xzalloc(u=
nsigned int nr,
> >>      return banks;
> >>  }
> >>
> >> +/*
> >> + * Interpret the property `prop_name` of `node` as a u32.
> >> + *
> >> + * Returns the property value on success; otherwise returns `dflt`.
> >> + */
> >> +uint32_t device_tree_get_u32(const void *fdt, int node,
> >> +                             const char *prop_name, uint32_t dflt);
> >
> > Suggest using `dt_` prefix (or any other good prefix) for all functions
> > in this header for consistency: e.g. there's dt_read_number() but also
> > device_tree_get_u32().
> Not really. AFAIR device_tree_ prefix is for functions operating on flatt=
ened DT
> (usually calling libfdt functions inside) and dt_ otherwise. Let's not mi=
x them.

I see, thanks for explanation.
I would add a brief comment in this header to distinguish such difference t=
hen.

>=20
> ~Michal
>=20


