Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBE648AC67
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 12:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255689.438198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FIJ-00084b-P0; Tue, 11 Jan 2022 11:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255689.438198; Tue, 11 Jan 2022 11:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FIJ-00082j-Km; Tue, 11 Jan 2022 11:26:27 +0000
Received: by outflank-mailman (input) for mailman id 255689;
 Tue, 11 Jan 2022 11:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWkq=R3=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1n7FII-00082d-AB
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 11:26:26 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c9b9ffb-72d1-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 12:26:23 +0100 (CET)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 4EA38182890;
 Tue, 11 Jan 2022 06:26:19 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 46EAF18288F;
 Tue, 11 Jan 2022 06:26:19 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id B5BC018288E;
 Tue, 11 Jan 2022 06:26:16 -0500 (EST)
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
X-Inumbo-ID: 4c9b9ffb-72d1-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=C2gvrDaIP/qIIMWdeVG2fXwCMoogfeMZMUj8caL6/l8=; b=pjEl
	bL8/+TTOrtN6Z/BNTTAXrVoMJ2SHbD+3yy6vPTqn3V7EobzOGPaT7Q2UlvGUxb6p
	z5cIfStOZdcLKDZd/QXw/v/7/KkksghjeRv3BNH0SU2JxDU9ksgHBUeZussX+tgy
	8uPeYsHVC+v1sbVs3vJnaUrENeEb/N04xeb22Lw=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Andrii Anisov <Andrii_Anisov@epam.com>
Subject: [XEN PATCH v3] xen/arm: introduce dummy iommu node for dom0
Date: Tue, 11 Jan 2022 11:26:11 +0000
Message-Id: <20220111112611.90508-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 4AA3904A-72D1-11EC-ADAA-C85A9F429DF0-90055647!pb-smtp20.pobox.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Andrii Anisov <Andrii_Anisov@epam.com>


Changelog:

v3: rebased over staging & remove redundand phandle_iommu attribute, disc=
ussion:
	https://lists.xenproject.org/archives/html/xen-devel/2021-12/msg01753.ht=
ml

v2: re-use common iommu dt bindings to let guests know which devices are =
protected:
	https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00073.ht=
ml

 xen/arch/arm/domain_build.c           | 42 +++++++++++++++++++++++++++
 xen/include/public/device_tree_defs.h |  1 +
 2 files changed, 43 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6931c022a2..b82ba72fac 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -845,6 +845,12 @@ static int __init write_properties(struct domain *d,=
 struct kernel_info *kinfo,
         }
     }
=20
+    if ( iommu_node && is_iommu_enabled(d) && dt_device_is_protected(nod=
e) )
+    {
+        res =3D fdt_property_cell(kinfo->fdt, "iommus", GUEST_PHANDLE_IO=
MMU);
+        if ( res )
+            return res;
+    }
     return 0;
 }
=20
@@ -1479,6 +1485,38 @@ static int __init make_cpus_node(const struct doma=
in *d, void *fdt)
     return res;
 }
=20
+static int __init make_iommu_node(const struct domain *d,
+                                  const struct kernel_info *kinfo)
+{
+    const char compat[] =3D "xen,iommu-el2-v1";
+    int res;
+
+    if ( !is_iommu_enabled(d) )
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
+    res =3D fdt_property_cell(kinfo->fdt, "phandle", GUEST_PHANDLE_IOMMU=
);
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
@@ -2127,6 +2165,10 @@ static int __init handle_node(struct domain *d, st=
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


