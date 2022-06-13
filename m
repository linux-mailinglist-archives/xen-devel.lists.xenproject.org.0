Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B1D549B14
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 20:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348446.574704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0oRl-0000x6-F3; Mon, 13 Jun 2022 18:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348446.574704; Mon, 13 Jun 2022 18:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0oRl-0000uT-9h; Mon, 13 Jun 2022 18:05:53 +0000
Received: by outflank-mailman (input) for mailman id 348446;
 Mon, 13 Jun 2022 18:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WHVA=WU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o0oRj-0000PT-FW
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 18:05:51 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7555356c-eb43-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 20:05:50 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id c30so7046082ljr.9
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jun 2022 11:05:50 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a2e7c12000000b00253ceefb668sm1038104ljc.60.2022.06.13.11.05.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 11:05:49 -0700 (PDT)
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
X-Inumbo-ID: 7555356c-eb43-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yLAAy4NtQ91FFDfJQHo6/8ROrRbfUrwl4KDHY/J0yS8=;
        b=CdjoAwNQMtcDWFyxiNV0beiF1x000yRfThIFE0Ouu+LedTLkc6GApwBVLB0w0Z2g/N
         bfaYh5SaOH7HRe4fSO84K9NuWhKLtuFdUzUX7cZsOxyAYBVlp1oIaWsQuTAMh0AKGT5E
         qMoefgfRgCyYGZ/VruPktAXgFYRDi1fS8VLxd8peq8uVTLGpgzAHBBqjJSYYlcVxDfE3
         ZxWgk8Qc7JJROioJ5FPsRehkKEJj+nVz4UIVVW0PJ0KTmieho3UP+ngNkysZPJFdpi7+
         ARAo+1p725yjO7k6+ZQCp/GqKtz/H4timUVlIId42dSSabO0lCpHF/wgMNqEQPVfCBa6
         CTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yLAAy4NtQ91FFDfJQHo6/8ROrRbfUrwl4KDHY/J0yS8=;
        b=GSFk1dKZKWiSiH1lZGXH39eKI1if8jp2P57cNsGcitMjRyZjO/6PyGCsHKLzIb4B7W
         0m7SoLqBBztQuQ9NuVIORvemA2ZLzUSXxeD88+9h8M500Slg2FlFCDllkjEfThVe/igi
         OqsLRNSI8+QrLELCk2eTAH/l6QkO6RMqvup0zS+WXzcKIvxEW6yqPXrHrsq5IcBtWfjl
         k0libONQIybKUwBSuqZ0DpjeDBWopbw8lyoR9i9dp42FvCdW7EIiTNCxHgMdC+S6SKwB
         qRQz75jMraWTgSAglqBXHF0nCgN5zmYWxX1g8YtQLLGHzCR4Cx6WoTcu3ynN2XLAEFja
         mAJQ==
X-Gm-Message-State: AJIora9RRXGBVX0pv55un8i3BWGaGcEB17SnwefFaKGOmXtM32s02Vb0
	haYPPychY3lqAoWJZM7a6Td8sylJEao=
X-Google-Smtp-Source: AGRyM1tubub6aWVX97nIYrtXZ2SdUGC23ArpBDutDXvLFrImrQ8SMLeWSBBB00BlcRCHNnppDKdJaQ==
X-Received: by 2002:a2e:7203:0:b0:255:56e1:68bc with SMTP id n3-20020a2e7203000000b0025556e168bcmr397790ljc.30.1655143549889;
        Mon, 13 Jun 2022 11:05:49 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V10 3/3] libxl/arm: Create specific IOMMU node to be referred by virtio-mmio device
Date: Mon, 13 Jun 2022 21:05:22 +0300
Message-Id: <1655143522-14356-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655143522-14356-1-git-send-email-olekstysh@gmail.com>
References: <1655143522-14356-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reuse generic IOMMU device tree bindings to communicate Xen specific
information for the virtio devices for which the restricted memory
access using Xen grant mappings need to be enabled.

Insert "iommus" property pointed to the IOMMU node with "xen,grant-dma"
compatible to all virtio devices which backends are going to run in
non-hardware domains (which are non-trusted by default).

Based on device-tree binding from Linux:
Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml

The example of generated nodes:

xen_iommu {
    compatible = "xen,grant-dma";
    #iommu-cells = <0x01>;
    phandle = <0xfde9>;
};

virtio@2000000 {
    compatible = "virtio,mmio";
    reg = <0x00 0x2000000 0x00 0x200>;
    interrupts = <0x00 0x01 0xf01>;
    interrupt-parent = <0xfde8>;
    dma-coherent;
    iommus = <0xfde9 0x01>;
};

virtio@2000200 {
    compatible = "virtio,mmio";
    reg = <0x00 0x2000200 0x00 0x200>;
    interrupts = <0x00 0x02 0xf01>;
    interrupt-parent = <0xfde8>;
    dma-coherent;
    iommus = <0xfde9 0x01>;
};

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
The related series https://lore.kernel.org/xen-devel/1654197833-25362-1-git-send-email-olekstysh@gmail.com/
is already in the mainline Linux.

Changes RFC -> V1:
   - update commit description
   - rebase according to the recent changes to
     "libxl: Introduce basic virtio-mmio support on Arm"

Changes V1 -> V2:
   - Henry already gave his Reviewed-by, I dropped it due to the changes
   - use generic IOMMU device tree bindings instead of custom property
     "xen,dev-domid"
   - change commit subject and description, was
     "libxl/arm: Insert "xen,dev-domid" property to virtio-mmio device node"

Changes V2 -> V3:
   - add Stefano's and Anthony's R-b
   - send together with the series it depends on and update post commit
     remark that described dependencies
   - update a comment on top of #define GUEST_PHANDLE_GIC
---
 tools/libs/light/libxl_arm.c          | 49 ++++++++++++++++++++++++++++++++---
 xen/include/public/device_tree_defs.h |  3 ++-
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 9be9b2a..72da3b1 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -865,9 +865,32 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
+{
+    int res;
+
+    /* See Linux Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml */
+    res = fdt_begin_node(fdt, "xen_iommu");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "xen,grant-dma");
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#iommu-cells", 1);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_IOMMU);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
 
 static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
-                                 uint64_t base, uint32_t irq)
+                                 uint64_t base, uint32_t irq,
+                                 uint32_t backend_domid)
 {
     int res;
     gic_interrupt intr;
@@ -890,6 +913,16 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
     res = fdt_property(fdt, "dma-coherent", NULL, 0);
     if (res) return res;
 
+    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
+        uint32_t iommus_prop[2];
+
+        iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
+        iommus_prop[1] = cpu_to_fdt32(backend_domid);
+
+        res = fdt_property(fdt, "iommus", iommus_prop, sizeof(iommus_prop));
+        if (res) return res;
+    }
+
     res = fdt_end_node(fdt);
     if (res) return res;
 
@@ -1097,6 +1130,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
     size_t fdt_size = 0;
     int pfdt_size = 0;
     libxl_domain_build_info *const info = &d_config->b_info;
+    bool iommu_created;
     unsigned int i;
 
     const libxl_version_info *vers;
@@ -1204,11 +1238,20 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
 
+        iommu_created = false;
         for (i = 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk = &d_config->disks[i];
 
-            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
-                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
+            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
+                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
+                    !iommu_created) {
+                    FDT( make_xen_iommu_node(gc, fdt) );
+                    iommu_created = true;
+                }
+
+                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
+                                           disk->backend_domid) );
+            }
         }
 
         if (pfdt)
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
index 209d43d..228daaf 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -4,9 +4,10 @@
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 /*
  * The device tree compiler (DTC) is allocating the phandle from 1 to
- * onwards. Reserve a high value for the GIC phandle.
+ * onwards. Reserve high values for the specific phandles.
  */
 #define GUEST_PHANDLE_GIC (65000)
+#define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
 
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
-- 
2.7.4


