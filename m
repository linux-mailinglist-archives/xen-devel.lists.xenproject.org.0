Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2A4E878B
	for <lists+xen-devel@lfdr.de>; Sun, 27 Mar 2022 14:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295071.502178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYRZ8-0007NL-LN; Sun, 27 Mar 2022 12:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295071.502178; Sun, 27 Mar 2022 12:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYRZ8-0007LW-Hh; Sun, 27 Mar 2022 12:00:14 +0000
Received: by outflank-mailman (input) for mailman id 295071;
 Sat, 26 Mar 2022 16:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HfZe=UF=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1nY9kj-0006RZ-JU
 for xen-devel@lists.xenproject.org; Sat, 26 Mar 2022 16:59:01 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 081938c4-ad26-11ec-8fbc-03012f2f19d4;
 Sat, 26 Mar 2022 17:59:00 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id x34so12417778ede.8
 for <xen-devel@lists.xenproject.org>; Sat, 26 Mar 2022 09:59:00 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-012-231-111.89.12.pool.telefonica.de. [89.12.231.111])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a50d9cc000000b0040f70fe78f3sm4515930edj.36.2022.03.26.09.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 09:58:59 -0700 (PDT)
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
X-Inumbo-ID: 081938c4-ad26-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C41s8dXYetIXRFUN79C7BELr5tThcFLwr+w3sJfI9HA=;
        b=GMLKj7Zbq/beiCnU/2Xo968GQ5Cv5ktuGHq/3BWJxE6ljArddc1wpG4isEeCjDkbMQ
         1/ukK8Bvz7Qdxa7nXdTzuI+UxeXuBS6yHl+MrX9jMCLsOuYSShdho9k5xZUh23a1s2pX
         LyoE70ECd01RrPOEAuG3X74rp1bHJA+5JRqrWqPbCDY8FmoliQ9ZOYNktTJqv1qbBuSP
         ivxP1WzBJoSIFA8rvj3ujiBpUNkWxzgprBSKnPN8+mpXepNcTMGH1hVHUkIAtkWgLDdv
         2Xh/HODwnSz+ufrafHl+u51VqQe5CNjHm1pztZRjK5ptA9iE/3xeq86HogrNnUydCqn7
         qp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C41s8dXYetIXRFUN79C7BELr5tThcFLwr+w3sJfI9HA=;
        b=N4uyxBDHsmpRv1GGrQny8cWhVaO0bz5GjDqfi7XBFI8Tw+Tgn1690ZEi8piYlxnwoi
         dh7LYjTFDk2gWDlZDnZobDE1vFQCyIVboRKvcwAMwaiGw4KabwX3+Lxh3cn9Y1p3eyu/
         sl4ePlbAE9FmlGjYzxeo3KV4m7/57tHU/PRYw5KitlUpn/h3pZmO/NcCREKlxfl/V39o
         O/LJhZJg203GOI4fxOGlcgkprk2W5wWGdgQ0Ii/3hg3k22b7ufwxeNC1RDvnGgf2lVxG
         PMr8hc2N4F9oEh15oX5HPdfQN8gjhlpj6EEiays9lEcFVxbgejok+9ERVynxOKNJQiPo
         hjhQ==
X-Gm-Message-State: AOAM530lEr1DOXq3+NTT8/c5/NiT/IYJ4mq7qfrPCI5w62r2BdxiZbUh
	XBPnNAHn/zTmWEcLF51ubuI=
X-Google-Smtp-Source: ABdhPJy6Aqj5FTWdQ+G+AWgjELFEvqpgoJbqa2BpHLgNArFWAXPcO5a+isreLt8QnClISXqIMadRyA==
X-Received: by 2002:a50:9fa5:0:b0:418:e7c4:cf96 with SMTP id c34-20020a509fa5000000b00418e7c4cf96mr5612764edf.30.1648313939404;
        Sat, 26 Mar 2022 09:58:59 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 1/2] hw/xen/xen_pt: Confine igd-passthrough-isa-bridge to XEN
Date: Sat, 26 Mar 2022 17:58:23 +0100
Message-Id: <20220326165825.30794-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165825.30794-1-shentey@gmail.com>
References: <20220326165825.30794-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

igd-passthrough-isa-bridge is only requested in xen_pt but was
implemented in pc_piix.c. This caused xen_pt to dependend on i386/pc
which is hereby resolved.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c        | 118 --------------------------------------
 hw/xen/xen_pt.c          |   1 -
 hw/xen/xen_pt.h          |   1 +
 hw/xen/xen_pt_graphics.c | 119 +++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h     |   1 -
 5 files changed, 120 insertions(+), 120 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b72c03d0a6..6ad5c02f07 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -801,124 +801,6 @@ static void pc_i440fx_1_4_machine_options(MachineClass *m)
 DEFINE_I440FX_MACHINE(v1_4, "pc-i440fx-1.4", pc_compat_1_4_fn,
                       pc_i440fx_1_4_machine_options);
 
-typedef struct {
-    uint16_t gpu_device_id;
-    uint16_t pch_device_id;
-    uint8_t pch_revision_id;
-} IGDDeviceIDInfo;
-
-/* In real world different GPU should have different PCH. But actually
- * the different PCH DIDs likely map to different PCH SKUs. We do the
- * same thing for the GPU. For PCH, the different SKUs are going to be
- * all the same silicon design and implementation, just different
- * features turn on and off with fuses. The SW interfaces should be
- * consistent across all SKUs in a given family (eg LPT). But just same
- * features may not be supported.
- *
- * Most of these different PCH features probably don't matter to the
- * Gfx driver, but obviously any difference in display port connections
- * will so it should be fine with any PCH in case of passthrough.
- *
- * So currently use one PCH version, 0x8c4e, to cover all HSW(Haswell)
- * scenarios, 0x9cc3 for BDW(Broadwell).
- */
-static const IGDDeviceIDInfo igd_combo_id_infos[] = {
-    /* HSW Classic */
-    {0x0402, 0x8c4e, 0x04}, /* HSWGT1D, HSWD_w7 */
-    {0x0406, 0x8c4e, 0x04}, /* HSWGT1M, HSWM_w7 */
-    {0x0412, 0x8c4e, 0x04}, /* HSWGT2D, HSWD_w7 */
-    {0x0416, 0x8c4e, 0x04}, /* HSWGT2M, HSWM_w7 */
-    {0x041E, 0x8c4e, 0x04}, /* HSWGT15D, HSWD_w7 */
-    /* HSW ULT */
-    {0x0A06, 0x8c4e, 0x04}, /* HSWGT1UT, HSWM_w7 */
-    {0x0A16, 0x8c4e, 0x04}, /* HSWGT2UT, HSWM_w7 */
-    {0x0A26, 0x8c4e, 0x06}, /* HSWGT3UT, HSWM_w7 */
-    {0x0A2E, 0x8c4e, 0x04}, /* HSWGT3UT28W, HSWM_w7 */
-    {0x0A1E, 0x8c4e, 0x04}, /* HSWGT2UX, HSWM_w7 */
-    {0x0A0E, 0x8c4e, 0x04}, /* HSWGT1ULX, HSWM_w7 */
-    /* HSW CRW */
-    {0x0D26, 0x8c4e, 0x04}, /* HSWGT3CW, HSWM_w7 */
-    {0x0D22, 0x8c4e, 0x04}, /* HSWGT3CWDT, HSWD_w7 */
-    /* HSW Server */
-    {0x041A, 0x8c4e, 0x04}, /* HSWSVGT2, HSWD_w7 */
-    /* HSW SRVR */
-    {0x040A, 0x8c4e, 0x04}, /* HSWSVGT1, HSWD_w7 */
-    /* BSW */
-    {0x1606, 0x9cc3, 0x03}, /* BDWULTGT1, BDWM_w7 */
-    {0x1616, 0x9cc3, 0x03}, /* BDWULTGT2, BDWM_w7 */
-    {0x1626, 0x9cc3, 0x03}, /* BDWULTGT3, BDWM_w7 */
-    {0x160E, 0x9cc3, 0x03}, /* BDWULXGT1, BDWM_w7 */
-    {0x161E, 0x9cc3, 0x03}, /* BDWULXGT2, BDWM_w7 */
-    {0x1602, 0x9cc3, 0x03}, /* BDWHALOGT1, BDWM_w7 */
-    {0x1612, 0x9cc3, 0x03}, /* BDWHALOGT2, BDWM_w7 */
-    {0x1622, 0x9cc3, 0x03}, /* BDWHALOGT3, BDWM_w7 */
-    {0x162B, 0x9cc3, 0x03}, /* BDWHALO28W, BDWM_w7 */
-    {0x162A, 0x9cc3, 0x03}, /* BDWGT3WRKS, BDWM_w7 */
-    {0x162D, 0x9cc3, 0x03}, /* BDWGT3SRVR, BDWM_w7 */
-};
-
-static void isa_bridge_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    dc->desc        = "ISA bridge faked to support IGD PT";
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    k->vendor_id    = PCI_VENDOR_ID_INTEL;
-    k->class_id     = PCI_CLASS_BRIDGE_ISA;
-};
-
-static const TypeInfo isa_bridge_info = {
-    .name          = "igd-passthrough-isa-bridge",
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
-    .class_init = isa_bridge_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
-static void pt_graphics_register_types(void)
-{
-    type_register_static(&isa_bridge_info);
-}
-type_init(pt_graphics_register_types)
-
-void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
-{
-    struct PCIDevice *bridge_dev;
-    int i, num;
-    uint16_t pch_dev_id = 0xffff;
-    uint8_t pch_rev_id = 0;
-
-    num = ARRAY_SIZE(igd_combo_id_infos);
-    for (i = 0; i < num; i++) {
-        if (gpu_dev_id == igd_combo_id_infos[i].gpu_device_id) {
-            pch_dev_id = igd_combo_id_infos[i].pch_device_id;
-            pch_rev_id = igd_combo_id_infos[i].pch_revision_id;
-        }
-    }
-
-    if (pch_dev_id == 0xffff) {
-        return;
-    }
-
-    /* Currently IGD drivers always need to access PCH by 1f.0. */
-    bridge_dev = pci_create_simple(bus, PCI_DEVFN(0x1f, 0),
-                                   "igd-passthrough-isa-bridge");
-
-    /*
-     * Note that vendor id is always PCI_VENDOR_ID_INTEL.
-     */
-    if (!bridge_dev) {
-        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
-        return;
-    }
-    pci_config_set_device_id(bridge_dev->config, pch_dev_id);
-    pci_config_set_revision(bridge_dev->config, pch_rev_id);
-}
-
 #ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 027190fa44..829ea9985f 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -60,7 +60,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/xen/xen.h"
-#include "hw/i386/pc.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "xen_pt.h"
 #include "qemu/range.h"
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 6b8e13cdee..806d832c94 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -43,6 +43,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
+void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id);
 
 /* function type for config reg */
 typedef int (*xen_pt_conf_reg_init)
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index a3bc7e3921..f1fbb98912 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -289,3 +289,122 @@ void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val)
                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
                     (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT));
 }
+
+typedef struct {
+    uint16_t gpu_device_id;
+    uint16_t pch_device_id;
+    uint8_t pch_revision_id;
+} IGDDeviceIDInfo;
+
+/*
+ * In real world different GPU should have different PCH. But actually
+ * the different PCH DIDs likely map to different PCH SKUs. We do the
+ * same thing for the GPU. For PCH, the different SKUs are going to be
+ * all the same silicon design and implementation, just different
+ * features turn on and off with fuses. The SW interfaces should be
+ * consistent across all SKUs in a given family (eg LPT). But just same
+ * features may not be supported.
+ *
+ * Most of these different PCH features probably don't matter to the
+ * Gfx driver, but obviously any difference in display port connections
+ * will so it should be fine with any PCH in case of passthrough.
+ *
+ * So currently use one PCH version, 0x8c4e, to cover all HSW(Haswell)
+ * scenarios, 0x9cc3 for BDW(Broadwell).
+ */
+static const IGDDeviceIDInfo igd_combo_id_infos[] = {
+    /* HSW Classic */
+    {0x0402, 0x8c4e, 0x04}, /* HSWGT1D, HSWD_w7 */
+    {0x0406, 0x8c4e, 0x04}, /* HSWGT1M, HSWM_w7 */
+    {0x0412, 0x8c4e, 0x04}, /* HSWGT2D, HSWD_w7 */
+    {0x0416, 0x8c4e, 0x04}, /* HSWGT2M, HSWM_w7 */
+    {0x041E, 0x8c4e, 0x04}, /* HSWGT15D, HSWD_w7 */
+    /* HSW ULT */
+    {0x0A06, 0x8c4e, 0x04}, /* HSWGT1UT, HSWM_w7 */
+    {0x0A16, 0x8c4e, 0x04}, /* HSWGT2UT, HSWM_w7 */
+    {0x0A26, 0x8c4e, 0x06}, /* HSWGT3UT, HSWM_w7 */
+    {0x0A2E, 0x8c4e, 0x04}, /* HSWGT3UT28W, HSWM_w7 */
+    {0x0A1E, 0x8c4e, 0x04}, /* HSWGT2UX, HSWM_w7 */
+    {0x0A0E, 0x8c4e, 0x04}, /* HSWGT1ULX, HSWM_w7 */
+    /* HSW CRW */
+    {0x0D26, 0x8c4e, 0x04}, /* HSWGT3CW, HSWM_w7 */
+    {0x0D22, 0x8c4e, 0x04}, /* HSWGT3CWDT, HSWD_w7 */
+    /* HSW Server */
+    {0x041A, 0x8c4e, 0x04}, /* HSWSVGT2, HSWD_w7 */
+    /* HSW SRVR */
+    {0x040A, 0x8c4e, 0x04}, /* HSWSVGT1, HSWD_w7 */
+    /* BSW */
+    {0x1606, 0x9cc3, 0x03}, /* BDWULTGT1, BDWM_w7 */
+    {0x1616, 0x9cc3, 0x03}, /* BDWULTGT2, BDWM_w7 */
+    {0x1626, 0x9cc3, 0x03}, /* BDWULTGT3, BDWM_w7 */
+    {0x160E, 0x9cc3, 0x03}, /* BDWULXGT1, BDWM_w7 */
+    {0x161E, 0x9cc3, 0x03}, /* BDWULXGT2, BDWM_w7 */
+    {0x1602, 0x9cc3, 0x03}, /* BDWHALOGT1, BDWM_w7 */
+    {0x1612, 0x9cc3, 0x03}, /* BDWHALOGT2, BDWM_w7 */
+    {0x1622, 0x9cc3, 0x03}, /* BDWHALOGT3, BDWM_w7 */
+    {0x162B, 0x9cc3, 0x03}, /* BDWHALO28W, BDWM_w7 */
+    {0x162A, 0x9cc3, 0x03}, /* BDWGT3WRKS, BDWM_w7 */
+    {0x162D, 0x9cc3, 0x03}, /* BDWGT3SRVR, BDWM_w7 */
+};
+
+static void isa_bridge_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    dc->desc        = "ISA bridge faked to support IGD PT";
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    k->vendor_id    = PCI_VENDOR_ID_INTEL;
+    k->class_id     = PCI_CLASS_BRIDGE_ISA;
+};
+
+static const TypeInfo isa_bridge_info = {
+    .name          = "igd-passthrough-isa-bridge",
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PCIDevice),
+    .class_init = isa_bridge_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void pt_graphics_register_types(void)
+{
+    type_register_static(&isa_bridge_info);
+}
+type_init(pt_graphics_register_types)
+
+void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
+{
+    struct PCIDevice *bridge_dev;
+    int i, num;
+    uint16_t pch_dev_id = 0xffff;
+    uint8_t pch_rev_id = 0;
+
+    num = ARRAY_SIZE(igd_combo_id_infos);
+    for (i = 0; i < num; i++) {
+        if (gpu_dev_id == igd_combo_id_infos[i].gpu_device_id) {
+            pch_dev_id = igd_combo_id_infos[i].pch_device_id;
+            pch_rev_id = igd_combo_id_infos[i].pch_revision_id;
+        }
+    }
+
+    if (pch_dev_id == 0xffff) {
+        return;
+    }
+
+    /* Currently IGD drivers always need to access PCH by 1f.0. */
+    bridge_dev = pci_create_simple(bus, PCI_DEVFN(0x1f, 0),
+                                   "igd-passthrough-isa-bridge");
+
+    /*
+     * Note that vendor id is always PCI_VENDOR_ID_INTEL.
+     */
+    if (!bridge_dev) {
+        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
+        return;
+    }
+    pci_config_set_device_id(bridge_dev->config, pch_dev_id);
+    pci_config_set_revision(bridge_dev->config, pch_rev_id);
+}
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 1a27de9c8b..926a507a0c 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -312,5 +312,4 @@ extern const size_t pc_compat_1_4_len;
     } \
     type_init(pc_machine_init_##suffix)
 
-extern void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id);
 #endif
-- 
2.35.1


