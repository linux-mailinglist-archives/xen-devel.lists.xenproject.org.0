Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC26B7EC145
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633573.988532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2T-0005DM-7I; Wed, 15 Nov 2023 11:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633573.988532; Wed, 15 Nov 2023 11:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2T-0005A4-4M; Wed, 15 Nov 2023 11:26:33 +0000
Received: by outflank-mailman (input) for mailman id 633573;
 Wed, 15 Nov 2023 11:26:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXr+=G4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r3E2R-00040Y-1C
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:26:31 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d285dfd3-83a9-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 12:26:30 +0100 (CET)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id AC6461C1C8F;
 Wed, 15 Nov 2023 06:26:29 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id A4E641C1C8E;
 Wed, 15 Nov 2023 06:26:29 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id CA04C1C1C8B;
 Wed, 15 Nov 2023 06:26:28 -0500 (EST)
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
X-Inumbo-ID: d285dfd3-83a9-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=TAYZsg3dk4AhNSgCgF5CsTSHP
	MVtmpNUV/b5lNoFXUI=; b=BOUlGVnU12xONByr5wFXUFxEe3/9jeMolBA7kh+oz
	wQvdNc0vifwVg0qMLw4BsF1ftgoBxDMnR73dNhMmQjC4mlPPK6Ec1HocxlFEFTWb
	PBB94zQYSfJavWHndkION4uXWW/BC1hmfszdHS7A/PcLw5l+YR9CBzsgv7f2QiNr
	Xk=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [RFC PATCH 4/6] libxl/arm: Reuse generic PCI-IOMMU bindings for virtio-pci devices
Date: Wed, 15 Nov 2023 13:26:09 +0200
Message-Id: <20231115112611.3865905-5-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 D1D9D840-83A9-11EE-B925-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Use the same "xen-grant-dma" device concept for the PCI devices
behind device-tree based PCI Host controller, but with one modification.
Unlike for platform devices, we cannot use generic IOMMU bindings
(iommus property), as we need to support more flexible configuration.
The problem is that PCI devices under the single PCI Host controller
may have the backends running in different Xen domains and thus have
different endpoints ID (backend domains ID).

Reuse generic PCI-IOMMU bindings (iommu-map/iommu-map-mask properties)
which allows us to describe relationship between PCI devices and
backend domains ID properly. Linux guest is already able to deal
with generic PCI-IOMMU bindings (see Linux drivers/xen/grant-dma-ops.c
for details).

According to Linux:
   - Documentation/devicetree/bindings/pci/pci-iommu.txt
   - Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 tools/libs/light/libxl_arm.c | 64 ++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index df6cbbe756..03cf3e424b 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1030,6 +1030,7 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
 }
=20
 #define PCI_IRQ_MAP_MIN_STRIDE   8
+#define PCI_IOMMU_MAP_STRIDE 4
=20
 static int create_virtio_pci_irq_map(libxl__gc *gc, void *fdt,
                                      libxl_virtio_pci_host *host)
@@ -1099,6 +1100,65 @@ static int create_virtio_pci_irq_map(libxl__gc *gc=
, void *fdt,
     return 0;
 }
=20
+/* XXX Consider reusing libxl__realloc() to avoid an extra loop */
+static int create_virtio_pci_iommu_map(libxl__gc *gc, void *fdt,
+                                       libxl_virtio_pci_host *host,
+                                       libxl_domain_config *d_config)
+{
+    uint32_t *full_iommu_map, *iommu_map;
+    unsigned int i, len, ntranslated =3D 0;
+    int res;
+
+    for (i =3D 0; i < d_config->num_virtios; i++) {
+        libxl_device_virtio *virtio =3D &d_config->virtios[i];
+
+        if (libxl_defbool_val(virtio->grant_usage) &&
+            virtio->transport =3D=3D LIBXL_VIRTIO_TRANSPORT_PCI &&
+            virtio->u.pci.host_id =3D=3D host->id) {
+            ntranslated++;
+        }
+    }
+
+    if (!ntranslated)
+        return 0;
+
+    len =3D ntranslated * sizeof(uint32_t) * PCI_IOMMU_MAP_STRIDE;
+    full_iommu_map =3D libxl__malloc(gc, len);
+    iommu_map =3D full_iommu_map;
+
+    /* See Linux Documentation/devicetree/bindings/pci/pci-iommu.txt */
+    for (i =3D 0; i < d_config->num_virtios; i++) {
+        libxl_device_virtio *virtio =3D &d_config->virtios[i];
+
+        if (libxl_defbool_val(virtio->grant_usage) &&
+            virtio->transport =3D=3D LIBXL_VIRTIO_TRANSPORT_PCI &&
+            virtio->u.pci.host_id =3D=3D host->id) {
+            uint16_t bdf =3D (virtio->u.pci.bus << 8) |
+                (virtio->u.pci.dev << 3) | virtio->u.pci.func;
+            unsigned int j =3D 0;
+
+            /* rid_base (1 cell) */
+            iommu_map[j++] =3D cpu_to_fdt32(bdf);
+
+            /* iommu_phandle (1 cell) */
+            iommu_map[j++] =3D cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
+
+            /* iommu_base (1 cell) */
+            iommu_map[j++] =3D cpu_to_fdt32(virtio->backend_domid);
+
+            /* length (1 cell) */
+            iommu_map[j++] =3D cpu_to_fdt32(1 << 3);
+
+            iommu_map +=3D PCI_IOMMU_MAP_STRIDE;
+        }
+    }
+
+    res =3D fdt_property(fdt, "iommu-map", full_iommu_map, len);
+    if (res) return res;
+
+    return 0;
+}
+
 /* TODO Consider reusing make_vpci_node() */
 static int make_virtio_pci_node(libxl__gc *gc, void *fdt,
                                 libxl_virtio_pci_host *host,
@@ -1147,6 +1207,10 @@ static int make_virtio_pci_node(libxl__gc *gc, voi=
d *fdt,
     res =3D create_virtio_pci_irq_map(gc, fdt, host);
     if (res) return res;
=20
+    /* xen,grant-dma bindings */
+    res =3D create_virtio_pci_iommu_map(gc, fdt, host, d_config);
+    if (res) return res;
+
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
--=20
2.25.1


