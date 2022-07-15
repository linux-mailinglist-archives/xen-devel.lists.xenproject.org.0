Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B9A576745
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 21:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368518.599858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQrf-0000Dl-7H; Fri, 15 Jul 2022 19:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368518.599858; Fri, 15 Jul 2022 19:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQrf-00008r-2o; Fri, 15 Jul 2022 19:20:39 +0000
Received: by outflank-mailman (input) for mailman id 368518;
 Fri, 15 Jul 2022 19:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLTF=XU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oCQrd-0008UB-Kj
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 19:20:37 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3476136e-0473-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 21:20:36 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id m9so4064781ljp.9
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jul 2022 12:20:36 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k3-20020ac257c3000000b0048159b43083sm1043178lfo.201.2022.07.15.12.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 12:20:35 -0700 (PDT)
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
X-Inumbo-ID: 3476136e-0473-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=elrHr5L0SkxQ3LO81KmQhscJxktKNPP4wxTaLG26eSY=;
        b=X0EcvT6E+XdoN9C113NAQwTHE+VY9yWTB2n9g1wcvztNrB6fkeFhpZqZfau8gBWjv2
         mFzP1CJHjMA/xPepyyKCtP577kawYa4I8IlNUqLc/1AmYpI+wNmmO2VGR/Ff2uvp5nd9
         mPe5xNzCNB6TPUBLHdbwSwTpWWgyqXmSUlMjX+uuEWZeD2QUUkZ53RgULOICNYFMucgo
         iN9ShgYV6H5JlgHpBCKdEBwdnDWtaDGCmgAqMEaFbcmRPv5fM/ghfzOzSX3UK70wYhfu
         gU9hfXM4RNt+QWdvfQPPxjCdj5TpH3CU7NgNETj5+s6RdPeTdJigWgg00JWulGjCifSH
         DKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=elrHr5L0SkxQ3LO81KmQhscJxktKNPP4wxTaLG26eSY=;
        b=tjB69BMEb7dhISVw1MYo17fHZVOUbJZdzp9Oe8M/LNfsyPvFZBoJRH08qJefFUYwPt
         g3CdJT10AWv9Ua4yZyROIQ0k2jihM2e+7G1f+xo5j0Syi+TNc7Arnu9ulzdkL7DHBSz1
         cP8zJFNBrlHDf0gyC2eBdQiDckdof87dfyUEJqAdfdsP8XqB83cn/jiL1TR6DKIeFbDm
         mcpAUBBxXozFz57kHJkCKMJwIHl92Jud3bm/lpii/jA7E3qVFaRB4H/N+qXscNGIAzi3
         0L9NAYC/YosW+rfTKTKJk0yq7Yz7rUsyo/5KU+1E53OS+PiKskN3bz0dv32ZjrobnC4X
         fmwg==
X-Gm-Message-State: AJIora/sv6SqvoKo5wwxUo+k81gOfEA7c0BF9pO4HQnYTsys0LKzmR1+
	bKuTNHefwMOLjoJ+iNVziZftJVfIRGJrdw==
X-Google-Smtp-Source: AGRyM1vxTB+eGNKJRv4tZVNZM98KJaujiTk2xJQ6Lsr7EFf4XdImQnRL57UnQYMTmdbUdouTqRSdBw==
X-Received: by 2002:a05:651c:1691:b0:25d:8240:6b3a with SMTP id bd17-20020a05651c169100b0025d82406b3amr7021640ljb.305.1657912835973;
        Fri, 15 Jul 2022 12:20:35 -0700 (PDT)
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH V11 3/3] libxl/arm: Create specific IOMMU node to be referred by virtio-mmio device
Date: Fri, 15 Jul 2022 22:20:26 +0300
Message-Id: <20220715192026.4013441-4-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715192026.4013441-1-olekstysh@gmail.com>
References: <20220715192026.4013441-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
   - send together with the series it depends on and drop post commit
     remark that described dependencies
   - update a comment on top of #define GUEST_PHANDLE_GIC
---
 tools/libs/light/libxl_arm.c          | 49 +++++++++++++++++++++++++--
 xen/include/public/device_tree_defs.h |  3 +-
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 9be9b2a2d1..72da3b17a8 100644
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
index 209d43de3f..228daafe81 100644
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
2.25.1


