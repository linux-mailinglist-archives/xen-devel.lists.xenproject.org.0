Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 897A594EDAE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775493.1185747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkm-0000HV-JT; Mon, 12 Aug 2024 13:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775493.1185747; Mon, 12 Aug 2024 13:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkm-0000CG-FJ; Mon, 12 Aug 2024 13:06:28 +0000
Received: by outflank-mailman (input) for mailman id 775493;
 Mon, 12 Aug 2024 13:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUkk-00074b-GF
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:26 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae0fe130-58ab-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 15:06:25 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f189a2a7f8so44356521fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:25 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f291dff990sm8301261fa.64.2024.08.12.06.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:22 -0700 (PDT)
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
X-Inumbo-ID: ae0fe130-58ab-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467985; x=1724072785; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/NQ+bDoiLffxrtbB/M0A1sRyjsF9bgHvteaiAPMvqQ=;
        b=V9rCi0Bx7d09sZMX0TUP7bBTeIxpjVzq8okmGchyI7DwqblFFWEKFo4L86+0sJCNTd
         WesmR2TN6fHt/UzwRy2OfaifTMGqhawOWYO0TIqNLamLyYotqbn4cq4FL2roRRSj8QXd
         OkrbKQ4qZwJAF0rJy+U0y+81stnBF2Mz+wmKRC60iB8z7/EmUG4u84pAa6KXQK/n80iA
         pjpgdCBJWAzqjzebwCfl5cXt9xYO3hkdK5NFtpzgLmXDJ4eoa3X+D+x5aKPnyVGvGPZt
         2EQATJG1+Lj+Xln6e/y4YzE8Xe107lRqaCPOGbmoDYtCD1vZuusnbdd1vfBQqjhZQUe6
         gNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467985; x=1724072785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/NQ+bDoiLffxrtbB/M0A1sRyjsF9bgHvteaiAPMvqQ=;
        b=kvjkOSvlREk4N865N3erEf3/EdFR78zR76qMaLLFmMINS9Bnp8vB3jejyVY0WVFPdx
         4UGbraNnEL0roTmOk+WYLi9AulGy7skgevJI1S6mfHEsV1V8HYy8U46WGjsRnmSNx8dR
         +mcAmdWiOQrbrNAEI2QZm4skWcm9BtLwI/vH33SBb2ieiKPKSaEI5timUPKPq3QtxOCm
         IaRhW8kV/zuQLriM4ghfKzKOKMQwK7GKkc0Bmu+xOBE95vNxZaz0pat/IfCIlP9SulL2
         /KTFTL6defNQVsULJDuzj11ZtkChjpO6Z2oB0x2ISzO4MCFCvRMuFj/wpVow1xQH9d1f
         Tj2A==
X-Forwarded-Encrypted: i=1; AJvYcCW8WfU1PiUDrAGNiakP8t4P+au2vLGWNwyYGFSocxosUdXZ+wdx9U+hldS8v+x6FUlx+HPysp90ozIHQhA/j/iRf0tf+soyiqJFomaxsLM=
X-Gm-Message-State: AOJu0Yw36H8bZQUovzjFha3RTvM9P7zOssSxe0/jWkhoUWkPRviPKnnk
	CYWKpit7RrlKs5EBj99z3A07V4nPQlbq0zVSMiaLfYiZUSDPCyMj
X-Google-Smtp-Source: AGHT+IF2RieUtGeR/iW9cWw+e/zdEKnbAONAmWuXU7OU5a81gT0ntNkasljwsAml/ALKofCfEA9e5A==
X-Received: by 2002:a2e:b1d2:0:b0:2f1:5561:4b4a with SMTP id 38308e7fff4ca-2f2b7155335mr1355051fa.25.1723467984300;
        Mon, 12 Aug 2024 06:06:24 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v1 05/10] hw/arm: xenpvh: Break out a common PVH module
Date: Mon, 12 Aug 2024 15:06:00 +0200
Message-ID: <20240812130606.90410-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Break out a common Xen PVH module in preparation for
adding a x86 Xen PVH Machine.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/trace-events             |   5 -
 hw/arm/xen_arm.c                | 154 ++++++--------------------
 hw/xen/meson.build              |   1 +
 hw/xen/trace-events             |   4 +
 hw/xen/xen-pvh-common.c         | 185 ++++++++++++++++++++++++++++++++
 include/hw/xen/xen-pvh-common.h |  45 ++++++++
 6 files changed, 269 insertions(+), 125 deletions(-)
 create mode 100644 hw/xen/xen-pvh-common.c
 create mode 100644 include/hw/xen/xen-pvh-common.h

diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index be6c8f720b..c64ad344bd 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -68,10 +68,5 @@ z2_aer915_send_too_long(int8_t msg) "message too long (%i bytes)"
 z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
 z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
 
-# xen_arm.c
-xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%"PRIx64
-xen_init_ram(uint64_t machine_ram_size) "Initialized xen ram with size 0x%"PRIx64
-xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%"PRIx64
-
 # bcm2838.c
 bcm2838_gic_set_irq(int irq, int level) "gic irq:%d lvl:%d"
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index ef8315969c..b8a5c09bdf 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -12,40 +12,25 @@
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/tpm_backend.h"
 #include "sysemu/sysemu.h"
-#include "hw/xen/xen-hvm-common.h"
+#include "hw/xen/xen-pvh-common.h"
 #include "sysemu/tpm.h"
 #include "hw/xen/arch_hvm.h"
-#include "trace.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
 
-static const MemoryListener xen_memory_listener = {
-    .region_add = xen_region_add,
-    .region_del = xen_region_del,
-    .log_start = NULL,
-    .log_stop = NULL,
-    .log_sync = NULL,
-    .log_global_start = NULL,
-    .log_global_stop = NULL,
-    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
-};
-
 struct XenArmState {
     /*< private >*/
     MachineState parent;
 
-    XenIOState *state;
+    XenPVHCommonState pvh;
 
     struct {
         uint64_t tpm_base_addr;
     } cfg;
 };
 
-static MemoryRegion ram_lo, ram_hi;
-
 /*
  * VIRTIO_MMIO_DEV_SIZE is imported from tools/libs/light/libxl_arm.c under Xen
  * repository.
@@ -57,64 +42,6 @@ static MemoryRegion ram_lo, ram_hi;
 #define NR_VIRTIO_MMIO_DEVICES   \
    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
 
-static void xen_set_irq(void *opaque, int irq, int level)
-{
-    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
-        error_report("xendevicemodel_set_irq_level failed");
-    }
-}
-
-static void xen_create_virtio_mmio_devices(XenArmState *xam)
-{
-    int i;
-
-    for (i = 0; i < NR_VIRTIO_MMIO_DEVICES; i++) {
-        hwaddr base = GUEST_VIRTIO_MMIO_BASE + i * VIRTIO_MMIO_DEV_SIZE;
-        qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
-                                         GUEST_VIRTIO_MMIO_SPI_FIRST + i);
-
-        sysbus_create_simple("virtio-mmio", base, irq);
-
-        trace_xen_create_virtio_mmio_devices(i,
-                                             GUEST_VIRTIO_MMIO_SPI_FIRST + i,
-                                             base);
-    }
-}
-
-static void xen_init_ram(MachineState *machine)
-{
-    MemoryRegion *sysmem = get_system_memory();
-    ram_addr_t block_len, ram_size[GUEST_RAM_BANKS];
-
-    trace_xen_init_ram(machine->ram_size);
-    if (machine->ram_size <= GUEST_RAM0_SIZE) {
-        ram_size[0] = machine->ram_size;
-        ram_size[1] = 0;
-        block_len = GUEST_RAM0_BASE + ram_size[0];
-    } else {
-        ram_size[0] = GUEST_RAM0_SIZE;
-        ram_size[1] = machine->ram_size - GUEST_RAM0_SIZE;
-        block_len = GUEST_RAM1_BASE + ram_size[1];
-    }
-
-    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
-                           &error_fatal);
-
-    memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &xen_memory,
-                             GUEST_RAM0_BASE, ram_size[0]);
-    memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
-    if (ram_size[1] > 0) {
-        memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &xen_memory,
-                                 GUEST_RAM1_BASE, ram_size[1]);
-        memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
-    }
-
-    /* Setup support for grants.  */
-    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
-                           &error_fatal);
-    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
-}
-
 void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     hw_error("Invalid ioreq type 0x%x\n", req->type);
@@ -135,55 +62,42 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
 {
 }
 
-#ifdef CONFIG_TPM
-static void xen_enable_tpm(XenArmState *xam)
-{
-    Error *errp = NULL;
-    DeviceState *dev;
-    SysBusDevice *busdev;
-
-    TPMBackend *be = qemu_find_tpm_be("tpm0");
-    if (be == NULL) {
-        error_report("Couldn't find tmp0 backend");
-        return;
-    }
-    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
-    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
-    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
-    sysbus_mmio_map(busdev, 0, xam->cfg.tpm_base_addr);
-
-    trace_xen_enable_tpm(xam->cfg.tpm_base_addr);
-}
-#endif
-
-static void xen_arm_init(MachineState *machine)
+static void xen_arm_init(MachineState *ms)
 {
-    XenArmState *xam = XEN_ARM(machine);
-
-    xam->state =  g_new0(XenIOState, 1);
+    XenArmState *xam = XEN_ARM(ms);
+    const struct {
+        const char *name;
+        MemMapEntry map;
+    } map[] = {
+        { "ram-low", { GUEST_RAM0_BASE, GUEST_RAM0_SIZE } },
+        { "ram-high", { GUEST_RAM1_BASE, GUEST_RAM1_SIZE } },
+        { "virtio-mmio", { GUEST_VIRTIO_MMIO_BASE, VIRTIO_MMIO_DEV_SIZE } },
+        { "tpm", { xam->cfg.tpm_base_addr, 0x1000 } },
+    };
+    int i;
 
-    if (machine->ram_size == 0) {
-        warn_report("%s non-zero ram size not specified. QEMU machine started"
-                    " without IOREQ (no emulated devices including virtio)",
-                    MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
-        return;
+    object_initialize_child(OBJECT(ms), "pvh", &xam->pvh, TYPE_XEN_PVH_COMMON);
+
+    object_property_set_int(OBJECT(&xam->pvh), "max-cpus", ms->smp.max_cpus,
+                            &error_abort);
+    object_property_set_int(OBJECT(&xam->pvh), "ram-size", ms->ram_size,
+                            &error_abort);
+    object_property_set_int(OBJECT(&xam->pvh), "virtio-mmio-num",
+                            NR_VIRTIO_MMIO_DEVICES, &error_abort);
+    object_property_set_int(OBJECT(&xam->pvh), "virtio-mmio-irq-base",
+                            GUEST_VIRTIO_MMIO_SPI_FIRST, &error_abort);
+
+    for (i = 0; i < ARRAY_SIZE(map); i++) {
+        g_autofree char *base_name = g_strdup_printf("%s-base", map[i].name);
+        g_autofree char *size_name = g_strdup_printf("%s-size", map[i].name);
+
+        object_property_set_int(OBJECT(&xam->pvh), base_name, map[i].map.base,
+                                &error_abort);
+        object_property_set_int(OBJECT(&xam->pvh), size_name, map[i].map.size,
+                                &error_abort);
     }
 
-    xen_init_ram(machine);
-
-    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
-
-    xen_create_virtio_mmio_devices(xam);
-
-#ifdef CONFIG_TPM
-    if (xam->cfg.tpm_base_addr) {
-        xen_enable_tpm(xam);
-    } else {
-        warn_report("tpm-base-addr is not provided. TPM will not be enabled");
-    }
-#endif
+    sysbus_realize(SYS_BUS_DEVICE(&xam->pvh), &error_abort);
 }
 
 #ifdef CONFIG_TPM
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index d887fa9ba4..4a486e3673 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -15,6 +15,7 @@ xen_specific_ss = ss.source_set()
 xen_specific_ss.add(files(
   'xen-mapcache.c',
   'xen-hvm-common.c',
+  'xen-pvh-common.c',
 ))
 if have_xen_pci_passthrough
   xen_specific_ss.add(files(
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index d1b27f6c11..a07fe41c6d 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -64,6 +64,10 @@ destroy_hvm_domain_cannot_acquire_handle(void) "Cannot acquire xenctrl handle"
 destroy_hvm_domain_failed_action(const char *action, int sts, char *errno_s) "xc_domain_shutdown failed to issue %s, sts %d, %s"
 destroy_hvm_domain_action(int xen_domid, const char *action) "Issued domain %d %s"
 
+# xen-pvh-common.c
+xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%"PRIx64
+xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%"PRIx64
+
 # xen-mapcache.c
 xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
 xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
new file mode 100644
index 0000000000..0d368398d0
--- /dev/null
+++ b/hw/xen/xen-pvh-common.c
@@ -0,0 +1,185 @@
+/*
+ * Common Xen PVH code.
+ *
+ * Copyright (c) 2024 Advanced Micro Devices, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/tpm.h"
+#include "sysemu/tpm_backend.h"
+#include "hw/xen/xen-pvh-common.h"
+#include "trace.h"
+
+static const MemoryListener xen_memory_listener = {
+    .region_add = xen_region_add,
+    .region_del = xen_region_del,
+    .log_start = NULL,
+    .log_stop = NULL,
+    .log_sync = NULL,
+    .log_global_start = NULL,
+    .log_global_stop = NULL,
+    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
+};
+
+static void xen_pvh_init_ram(XenPVHCommonState *s,
+                             MemoryRegion *sysmem)
+{
+    ram_addr_t block_len, ram_size[2];
+
+    if (s->cfg.ram_size <= s->cfg.ram_low.size) {
+        ram_size[0] = s->cfg.ram_size;
+        ram_size[1] = 0;
+        block_len = s->cfg.ram_low.base + ram_size[0];
+    } else {
+        ram_size[0] = s->cfg.ram_low.size;
+        ram_size[1] = s->cfg.ram_size - s->cfg.ram_low.size;
+        block_len = s->cfg.ram_high.base + ram_size[1];
+    }
+
+    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
+                           &error_fatal);
+
+    memory_region_init_alias(&s->ram.low, NULL, "xen.ram.lo", &xen_memory,
+                             s->cfg.ram_low.base, ram_size[0]);
+    memory_region_add_subregion(sysmem, s->cfg.ram_low.base, &s->ram.low);
+    if (ram_size[1] > 0) {
+        memory_region_init_alias(&s->ram.high, NULL, "xen.ram.hi", &xen_memory,
+                                 s->cfg.ram_high.base, ram_size[1]);
+        memory_region_add_subregion(sysmem, s->cfg.ram_high.base, &s->ram.high);
+    }
+
+    /* Setup support for grants.  */
+    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
+                           &error_fatal);
+    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
+}
+
+static void xen_set_irq(void *opaque, int irq, int level)
+{
+    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
+        error_report("xendevicemodel_set_irq_level failed");
+    }
+}
+
+static void xen_create_virtio_mmio_devices(XenPVHCommonState *s)
+{
+    int i;
+
+    for (i = 0; i < s->cfg.virtio_mmio_num; i++) {
+        hwaddr base = s->cfg.virtio_mmio.base + i * s->cfg.virtio_mmio.size;
+        qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
+                                         s->cfg.virtio_mmio_irq_base + i);
+
+        sysbus_create_simple("virtio-mmio", base, irq);
+
+        trace_xen_create_virtio_mmio_devices(i,
+                                             s->cfg.virtio_mmio_irq_base + i,
+                                             base);
+    }
+}
+
+#ifdef CONFIG_TPM
+static void xen_enable_tpm(XenPVHCommonState *s)
+{
+    Error *errp = NULL;
+    DeviceState *dev;
+    SysBusDevice *busdev;
+
+    TPMBackend *be = qemu_find_tpm_be("tpm0");
+    if (be == NULL) {
+        error_report("Couldn't find tmp0 backend");
+        return;
+    }
+    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
+    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
+    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, s->cfg.tpm.base);
+
+    trace_xen_enable_tpm(s->cfg.tpm.base);
+}
+#endif
+
+static void xen_pvh_realize(DeviceState *dev, Error **errp)
+{
+    XenPVHCommonState *s = XEN_PVH_COMMON(dev);
+    MemoryRegion *sysmem = get_system_memory();
+
+    if (s->cfg.ram_size == 0) {
+        /* FIXME: Prefix with object path and consider bailing out.  */
+        warn_report("non-zero ram size not specified. QEMU machine started"
+                    " without IOREQ (no emulated devices including virtio)");
+        return;
+    }
+
+    if (s->cfg.max_cpus == 0) {
+        /* FIXME: Prefix with object path and bail out.  */
+        warn_report("max-cpus not specified. QEMU machine started");
+        return;
+    }
+
+    xen_pvh_init_ram(s, sysmem);
+    xen_register_ioreq(&s->ioreq, s->cfg.max_cpus, &xen_memory_listener);
+
+    if (s->cfg.virtio_mmio_num) {
+        xen_create_virtio_mmio_devices(s);
+    }
+
+#ifdef CONFIG_TPM
+    if (s->cfg.tpm.base) {
+        xen_enable_tpm(s);
+    } else {
+        warn_report("tpm-base-addr is not provided. TPM will not be enabled");
+    }
+#endif
+}
+
+#define DEFINE_PROP_MEMMAP(n, f) \
+    DEFINE_PROP_UINT64(n "-base", XenPVHCommonState, cfg.f.base, 0), \
+    DEFINE_PROP_UINT64(n "-size", XenPVHCommonState, cfg.f.size, 0)
+
+static Property xen_pvh_properties[] = {
+    DEFINE_PROP_UINT32("max-cpus", XenPVHCommonState, cfg.max_cpus, 0),
+    DEFINE_PROP_UINT64("ram-size", XenPVHCommonState, cfg.ram_size, 0),
+    DEFINE_PROP_MEMMAP("ram-low", ram_low),
+    DEFINE_PROP_MEMMAP("ram-high", ram_high),
+    DEFINE_PROP_MEMMAP("virtio-mmio", virtio_mmio),
+    DEFINE_PROP_MEMMAP("tpm", tpm),
+    DEFINE_PROP_UINT32("virtio-mmio-num", XenPVHCommonState,
+                       cfg.virtio_mmio_num, 0),
+    DEFINE_PROP_UINT32("virtio-mmio-irq-base", XenPVHCommonState,
+                       cfg.virtio_mmio_irq_base, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void xen_pvh_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = xen_pvh_realize;
+    device_class_set_props(dc, xen_pvh_properties);
+    /* No VMSD since we haven't got any top-level SoC state to save.  */
+}
+
+static const TypeInfo xen_pvh_info = {
+    .name = TYPE_XEN_PVH_COMMON,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XenPVHCommonState),
+    .class_init = xen_pvh_class_init,
+};
+
+static void xen_pvh_register_types(void)
+{
+    type_register_static(&xen_pvh_info);
+}
+
+type_init(xen_pvh_register_types);
diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
new file mode 100644
index 0000000000..e958b441fd
--- /dev/null
+++ b/include/hw/xen/xen-pvh-common.h
@@ -0,0 +1,45 @@
+/*
+ * QEMU Xen PVH machine - common code.
+ *
+ * Copyright (c) 2024 Advanced Micro Devices, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef XEN_PVH_COMMON_H__
+#define XEN_PVH_COMMON_H__
+
+#include <assert.h>
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+#include "hw/xen/xen-hvm-common.h"
+#include "hw/pci-host/gpex.h"
+
+#define TYPE_XEN_PVH_COMMON "xen-pvh-common"
+OBJECT_DECLARE_SIMPLE_TYPE(XenPVHCommonState, XEN_PVH_COMMON)
+
+typedef struct XenPVHCommonState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    XenIOState ioreq;
+
+    struct {
+        MemoryRegion low;
+        MemoryRegion high;
+    } ram;
+
+    struct {
+        uint64_t ram_size;
+        uint32_t max_cpus;
+        uint32_t virtio_mmio_num;
+        uint32_t virtio_mmio_irq_base;
+        struct {
+            uint64_t base;
+            uint64_t size;
+        } ram_low, ram_high,
+          virtio_mmio,
+          tpm;
+    } cfg;
+} XenPVHCommonState;
+#endif
-- 
2.43.0


