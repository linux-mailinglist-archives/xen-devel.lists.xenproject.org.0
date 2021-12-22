Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F133D47D2FB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 14:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250826.431991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n01Wh-00071u-Rq; Wed, 22 Dec 2021 13:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250826.431991; Wed, 22 Dec 2021 13:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n01Wh-0006yy-OE; Wed, 22 Dec 2021 13:19:27 +0000
Received: by outflank-mailman (input) for mailman id 250826;
 Wed, 22 Dec 2021 13:19:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCiG=RH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1n01Wg-0006y0-QK
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 13:19:26 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c73b22f6-6329-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 14:19:25 +0100 (CET)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id D822815E430;
 Wed, 22 Dec 2021 08:19:21 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id BEB9215E42F;
 Wed, 22 Dec 2021 08:19:21 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 6F93615E42A;
 Wed, 22 Dec 2021 08:19:17 -0500 (EST)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: c73b22f6-6329-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=OD9az6OdDKqFn0VnlxEgG5MkL
	A6uVejNOQFIWvtBMjM=; b=TIsaknFsIM8FWiUKmv7wzaxn2CKkwXo6MC06pCZ1i
	fmup7d1d19rLdiSMhceASWYFLm7hnV2I8LfYMNpHs+Ya7o+Gqqd+QEvuZzoeSy1w
	LfLOZi07Ls/1FvzJl6IRau+8x7SPy3i4A1Zmy2iMuTlDCB/POqlM13FWJUXvG9y1
	VU=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH 1/1] xen/arm: introduce dummy iommu node for dom0
Date: Wed, 22 Dec 2021 13:18:46 +0000
Message-Id: <20211222131847.2476835-2-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222131847.2476835-1-Sergiy_Kibrik@epam.com>
References: <20211222131847.2476835-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C3FED40C-6329-11EC-8523-CBA7845BAAA9-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Currently no IOMMU properties are exposed to dom0, thus kernel by default
assumes no protection and enables swiotlb-xen, which leads to costly and
unnecessary buffers bouncing.

To let kernel know which device is behing IOMMU and hence needs no swiotl=
b
services we introduce dummy xen-iommu node in FDT and link protected devi=
ce
nodes to it, using here device tree iommu bindings.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/arm/domain_build.c           | 44 +++++++++++++++++++++++++++
 xen/include/asm-arm/kernel.h          |  3 ++
 xen/include/public/device_tree_defs.h |  1 +
 3 files changed, 48 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6cfc772e66..951ca0a0cb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -623,6 +623,12 @@ static int __init write_properties(struct domain *d,=
 struct kernel_info *kinfo,
         }
     }
=20
+    if ( iommu_node && kinfo->phandle_iommu && dt_device_is_protected(no=
de) )
+    {
+        res =3D fdt_property_cell(kinfo->fdt, "iommus", kinfo->phandle_i=
ommu);
+        if ( res )
+            return res;
+    }
     return 0;
 }
=20
@@ -948,6 +954,38 @@ static int __init make_cpus_node(const struct domain=
 *d, void *fdt)
     return res;
 }
=20
+static int __init make_iommu_node(const struct domain *d,
+                                  const struct kernel_info *kinfo)
+{
+    const char compat[] =3D "xen,iommu-el2-v1";
+    int res;
+
+    if ( !kinfo->phandle_iommu )
+        return 0;
+
+    dt_dprintk("Create iommu node\n");
+
+    res =3D fdt_begin_node(kinfo->fdt, "xen-iommu");
+    if ( res )
+        return res;
+
+    res =3D fdt_property(kinfo->fdt, "compatible", compat, sizeof(compat=
));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(kinfo->fdt, "#iommu-cells", 0);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(kinfo->fdt, "phandle", kinfo->phandle_iomm=
u);
+
+    res =3D fdt_end_node(kinfo->fdt);
+    if ( res )
+        return res;
+
+    return res;
+}
+
 static int __init make_gic_node(const struct domain *d, void *fdt,
                                 const struct dt_device_node *node)
 {
@@ -1584,6 +1622,10 @@ static int __init handle_node(struct domain *d, st=
ruct kernel_info *kinfo,
         if ( res )
             return res;
=20
+        res =3D make_iommu_node(d, kinfo);
+        if ( res )
+            return res;
+
         res =3D make_memory_node(d, kinfo->fdt, addrcells, sizecells, &k=
info->mem);
         if ( res )
             return res;
@@ -2177,6 +2219,8 @@ static int __init prepare_dtb_hwdom(struct domain *=
d, struct kernel_info *kinfo)
     ASSERT(dt_host && (dt_host->sibling =3D=3D NULL));
=20
     kinfo->phandle_gic =3D dt_interrupt_controller->phandle;
+    if ( is_iommu_enabled(d) )
+        kinfo->phandle_iommu =3D GUEST_PHANDLE_IOMMU;
     fdt =3D device_tree_flattened;
=20
     new_size =3D fdt_totalsize(fdt) + DOM0_FDT_EXTRA_SIZE;
diff --git a/xen/include/asm-arm/kernel.h b/xen/include/asm-arm/kernel.h
index 874aa108a7..efe09cd1e0 100644
--- a/xen/include/asm-arm/kernel.h
+++ b/xen/include/asm-arm/kernel.h
@@ -39,6 +39,9 @@ struct kernel_info {
     /* GIC phandle */
     uint32_t phandle_gic;
=20
+    /* dummy iommu phandle */
+    uint32_t phandle_iommu;
+
     /* loader to use for this kernel */
     void (*load)(struct kernel_info *info);
     /* loader specific state */
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/d=
evice_tree_defs.h
index 209d43de3f..df58944bd0 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -7,6 +7,7 @@
  * onwards. Reserve a high value for the GIC phandle.
  */
 #define GUEST_PHANDLE_GIC (65000)
+#define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
=20
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
--=20
2.25.1


