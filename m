Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C292D95894B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780535.1190224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPs9-0003Gk-GW; Tue, 20 Aug 2024 14:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780535.1190224; Tue, 20 Aug 2024 14:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPs9-0003D4-7e; Tue, 20 Aug 2024 14:30:09 +0000
Received: by outflank-mailman (input) for mailman id 780535;
 Tue, 20 Aug 2024 14:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPs7-0000m9-Rt
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:30:07 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b24d87a9-5f00-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:30:06 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f025b94e07so61565441fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:30:06 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3f1d2b43bsm938911fa.95.2024.08.20.07.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:30:04 -0700 (PDT)
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
X-Inumbo-ID: b24d87a9-5f00-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164206; x=1724769006; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La4bzOi9ro9f5XHQO0tTS2EJNdEqne2pZ5yj4kL9zGQ=;
        b=TWHDwzoB5iNagTsqqxZAaGa5zC7hRO5fQBWsYYTiLRe63DALnMRP0IrvlZe8uXdvyD
         ttEw6V8QZLcqvBclvNBFkMzJaAJMqrFK5zo6ty+KfWErsS5/tmlYF17zt+QZ62d6ZuMa
         V+hdeH62hSR1Z9+bJCIjr7zB8zybsaMUJR/zTZUW6dm1T1wB4Z9UkhgjgSmzhi6B81b8
         1cXm85JPIlEitsL81zti9/Z9vO9dK94uolZav0+OviNJsFPRH5VXJs8WyBARoDCiltZ8
         YmaDHbenzqEaV5EDsEC709gW+6xX/bRCyP0SzKZ9tqXw7S57eLCnXvl2ECQtz2fWIM3E
         1ESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164206; x=1724769006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La4bzOi9ro9f5XHQO0tTS2EJNdEqne2pZ5yj4kL9zGQ=;
        b=arAvkZTN+QnkOOUs+whU2xQnF7WRErSRBntaYOq+pAyVyYipBEyPRQSIwaUJsipPpH
         D1fBJnxUoKbNAMunmTNxZ6W315Ohp/ds8y6OWDzT/QhBqJo9IhbYirce9kNBtAGbENdR
         bo4OyyTDBkUfFoRDgGKQreF7yB6ww3TlJoMix0B+gyrYRsdAWYHSuZC0i+U0e6D2U18Z
         fr+KyxzAM2t6Z7C27GW2G3vYfJ284/GicbqUdrVgKejWnDY2d/DbJP1CINpNNKrTwXdJ
         V7b1XBj4sPxYn24MMQXc3sfIqP5+0cxCk5n1BSccIOYeq1PmTxgHAQF40ssHniXq2HMw
         oIKg==
X-Forwarded-Encrypted: i=1; AJvYcCWkdCVMNfCivZU6WgB3JFcGBHTfmwWZerlgbls0vQNCbk858lAlKMkw1B+AYj1wE8XgkkbpfC4gwYpvAERPt34UuZMl0uA0Utw49YSiTbU=
X-Gm-Message-State: AOJu0Yx4weNPBoI5mHJv4CfXJv56OSRovTJIYYrBd5BZhDfm10qiXwnL
	dAXod5J1Df2QG4lyJdaSwyTjbxWNLng4dxgbcpFU+S02xiIumvpM/ximcA02
X-Google-Smtp-Source: AGHT+IGd+6DaCDah465GFLHr+cvbOd8y3IHEHjhNmbfoVq2Sn24FbI50r9QhwbrpmK3ehA83NVB+2A==
X-Received: by 2002:a2e:4c12:0:b0:2f1:563d:ec8a with SMTP id 38308e7fff4ca-2f3be60c0cbmr87157561fa.41.1724164205499;
        Tue, 20 Aug 2024 07:30:05 -0700 (PDT)
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
Subject: [PATCH v2 07/12] hw/arm: xenpvh: Break out a common PVH machine
Date: Tue, 20 Aug 2024 16:29:44 +0200
Message-ID: <20240820142949.533381-8-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Break out a common Xen PVH machine in preparation for
adding a x86 Xen PVH machine.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/trace-events             |   5 -
 hw/arm/xen_arm.c                | 198 +++--------------------
 hw/xen/meson.build              |   1 +
 hw/xen/trace-events             |   4 +
 hw/xen/xen-pvh-common.c         | 275 ++++++++++++++++++++++++++++++++
 include/hw/xen/xen-pvh-common.h |  59 +++++++
 6 files changed, 358 insertions(+), 184 deletions(-)
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
index f0868e7be5..04cb9855af 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -7,44 +7,12 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qapi/qapi-commands-migration.h"
-#include "qapi/visitor.h"
 #include "hw/boards.h"
-#include "hw/irq.h"
-#include "hw/sysbus.h"
-#include "sysemu/block-backend.h"
-#include "sysemu/tpm_backend.h"
 #include "sysemu/sysemu.h"
-#include "hw/xen/xen-hvm-common.h"
-#include "sysemu/tpm.h"
+#include "hw/xen/xen-pvh-common.h"
 #include "hw/xen/arch_hvm.h"
-#include "trace.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
-OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
-
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
-struct XenArmState {
-    /*< private >*/
-    MachineState parent;
-
-    XenIOState *state;
-
-    struct {
-        uint64_t tpm_base_addr;
-    } cfg;
-};
-
-static MemoryRegion ram_lo, ram_hi;
 
 /*
  * VIRTIO_MMIO_DEV_SIZE is imported from tools/libs/light/libxl_arm.c under Xen
@@ -57,147 +25,26 @@ static MemoryRegion ram_lo, ram_hi;
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
+static void xen_arm_instance_init(Object *obj)
 {
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
+    XenPVHMachineState *s = XEN_PVH_MACHINE(obj);
 
-    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
-                           &error_fatal);
+    /* Default values.  */
+    s->cfg.ram_low = (MemMapEntry) { GUEST_RAM0_BASE, GUEST_RAM0_SIZE };
+    s->cfg.ram_high = (MemMapEntry) { GUEST_RAM1_BASE, GUEST_RAM1_SIZE };
 
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
+    s->cfg.virtio_mmio_num = NR_VIRTIO_MMIO_DEVICES;
+    s->cfg.virtio_mmio_irq_base = GUEST_VIRTIO_MMIO_SPI_FIRST;
+    s->cfg.virtio_mmio = (MemMapEntry) { GUEST_VIRTIO_MMIO_BASE,
+                                         VIRTIO_MMIO_DEV_SIZE };
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
-{
-    XenArmState *xam = XEN_ARM(machine);
-
-    xam->state =  g_new0(XenIOState, 1);
-
-    if (machine->ram_size == 0) {
-        warn_report("%s: ram size not specified. QEMU machine started"
-                    " without IOREQ (no emulated devices including virtio)",
-                    MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
-        return;
-    }
-
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
-}
-
-#ifdef CONFIG_TPM
-static void xen_arm_get_tpm_base_addr(Object *obj, Visitor *v,
-                                      const char *name, void *opaque,
-                                      Error **errp)
-{
-    XenArmState *xam = XEN_ARM(obj);
-    uint64_t value = xam->cfg.tpm_base_addr;
-
-    visit_type_uint64(v, name, &value, errp);
-}
-
-static void xen_arm_set_tpm_base_addr(Object *obj, Visitor *v,
-                                      const char *name, void *opaque,
-                                      Error **errp)
-{
-    XenArmState *xam = XEN_ARM(obj);
-    uint64_t value;
-
-    if (!visit_type_uint64(v, name, &value, errp)) {
-        return;
-    }
-
-    xam->cfg.tpm_base_addr = value;
-}
-#endif
-
 static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
-
+    XenPVHMachineClass *xpc = XEN_PVH_MACHINE_CLASS(oc);
     MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Xen PVH ARM machine";
-    mc->init = xen_arm_init;
 
     /*
      * mc->max_cpus holds the MAX value allowed in the -smp command-line opts.
@@ -218,27 +65,20 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
      * mc->max_cpus, QEMU will bail out with an error message.
      */
     mc->max_cpus = GUEST_MAX_VCPUS;
-    mc->default_machine_opts = "accel=xen";
-    /* Set explicitly here to make sure that real ram_size is passed */
-    mc->default_ram_size = 0;
 
-#ifdef CONFIG_TPM
-    object_class_property_add(oc, "tpm-base-addr", "uint64_t",
-                              xen_arm_get_tpm_base_addr,
-                              xen_arm_set_tpm_base_addr,
-                              NULL, NULL);
-    object_class_property_set_description(oc, "tpm-base-addr",
-                                          "Set Base address for TPM device.");
+    /* List of supported features known to work on PVH ARM.  */
+    xpc->has_tpm = true;
+    xpc->has_virtio_mmio = true;
 
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
-#endif
+    xen_pvh_class_setup_common_props(xpc);
 }
 
 static const TypeInfo xen_arm_machine_type = {
     .name = TYPE_XEN_ARM,
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_XEN_PVH_MACHINE,
     .class_init = xen_arm_machine_class_init,
-    .instance_size = sizeof(XenArmState),
+    .instance_size = sizeof(XenPVHMachineState),
+    .instance_init = xen_arm_instance_init,
 };
 
 static void xen_arm_machine_register_types(void)
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
index 0000000000..880e8143d7
--- /dev/null
+++ b/hw/xen/xen-pvh-common.c
@@ -0,0 +1,275 @@
+/*
+ * QEMU Xen PVH machine - common code.
+ *
+ * Copyright (c) 2024 Advanced Micro Devices, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
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
+static void xen_pvh_init_ram(XenPVHMachineState *s,
+                             MemoryRegion *sysmem)
+{
+    MachineState *ms = MACHINE(s);
+    ram_addr_t block_len, ram_size[2];
+
+    if (ms->ram_size <= s->cfg.ram_low.size) {
+        ram_size[0] = ms->ram_size;
+        ram_size[1] = 0;
+        block_len = s->cfg.ram_low.base + ram_size[0];
+    } else {
+        ram_size[0] = s->cfg.ram_low.size;
+        ram_size[1] = ms->ram_size - s->cfg.ram_low.size;
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
+static void xen_create_virtio_mmio_devices(XenPVHMachineState *s)
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
+static void xen_enable_tpm(XenPVHMachineState *s)
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
+static void xen_pvh_init(MachineState *ms)
+{
+    XenPVHMachineState *s = XEN_PVH_MACHINE(ms);
+    XenPVHMachineClass *xpc = XEN_PVH_MACHINE_GET_CLASS(s);
+    MemoryRegion *sysmem = get_system_memory();
+
+    if (ms->ram_size == 0) {
+        warn_report("%s: ram size not specified. QEMU machine started"
+                    " without IOREQ (no emulated devices including virtio)",
+                    MACHINE_CLASS(object_get_class(OBJECT(ms)))->desc);
+        return;
+    }
+
+    xen_pvh_init_ram(s, sysmem);
+    xen_register_ioreq(&s->ioreq, ms->smp.max_cpus, &xen_memory_listener);
+
+    if (s->cfg.virtio_mmio_num) {
+        xen_create_virtio_mmio_devices(s);
+    }
+
+#ifdef CONFIG_TPM
+    if (xpc->has_tpm) {
+        if (s->cfg.tpm.base) {
+            xen_enable_tpm(s);
+        } else {
+            warn_report("tpm-base-addr is not set. TPM will not be enabled");
+        }
+    }
+#endif
+
+    /* Call the implementation specific init.  */
+    if (xpc->init) {
+        xpc->init(ms);
+    }
+}
+
+#define XEN_PVH_PROP_MEMMAP_SETTER(n, f)                                   \
+static void xen_pvh_set_ ## n ## _ ## f(Object *obj, Visitor *v,           \
+                                       const char *name, void *opaque,     \
+                                       Error **errp)                       \
+{                                                                          \
+    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);                         \
+    uint64_t value;                                                        \
+                                                                           \
+    if (!visit_type_size(v, name, &value, errp)) {                         \
+        return;                                                            \
+    }                                                                      \
+    xp->cfg.n.f = value;                                                   \
+}
+
+#define XEN_PVH_PROP_MEMMAP_GETTER(n, f)                                   \
+static void xen_pvh_get_ ## n ## _ ## f(Object *obj, Visitor *v,           \
+                                       const char *name, void *opaque,     \
+                                       Error **errp)                       \
+{                                                                          \
+    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);                         \
+    uint64_t value = xp->cfg.n.f;                                          \
+                                                                           \
+    visit_type_uint64(v, name, &value, errp);                              \
+}
+
+#define XEN_PVH_PROP_MEMMAP_BASE(n)        \
+    XEN_PVH_PROP_MEMMAP_SETTER(n, base)    \
+    XEN_PVH_PROP_MEMMAP_GETTER(n, base)    \
+
+#define XEN_PVH_PROP_MEMMAP_SIZE(n)        \
+    XEN_PVH_PROP_MEMMAP_SETTER(n, size)    \
+    XEN_PVH_PROP_MEMMAP_GETTER(n, size)
+
+#define XEN_PVH_PROP_MEMMAP(n)             \
+    XEN_PVH_PROP_MEMMAP_BASE(n)            \
+    XEN_PVH_PROP_MEMMAP_SIZE(n)
+
+XEN_PVH_PROP_MEMMAP(ram_low)
+XEN_PVH_PROP_MEMMAP(ram_high)
+/* TPM only has a base-addr option.  */
+XEN_PVH_PROP_MEMMAP_BASE(tpm)
+XEN_PVH_PROP_MEMMAP(virtio_mmio)
+
+void xen_pvh_class_setup_common_props(XenPVHMachineClass *xpc)
+{
+    ObjectClass *oc = OBJECT_CLASS(xpc);
+    MachineClass *mc = MACHINE_CLASS(xpc);
+
+#define OC_MEMMAP_PROP_BASE(c, prop_name, name)                           \
+do {                                                                      \
+    object_class_property_add(c, prop_name "-base", "uint64_t",           \
+                              xen_pvh_get_ ## name ## _base,              \
+                              xen_pvh_set_ ## name ## _base, NULL, NULL); \
+    object_class_property_set_description(oc, prop_name "-base",          \
+                              "Set base address for " prop_name);         \
+} while (0)
+
+#define OC_MEMMAP_PROP_SIZE(c, prop_name, name)                           \
+do {                                                                      \
+    object_class_property_add(c, prop_name "-size", "uint64_t",           \
+                              xen_pvh_get_ ## name ## _size,              \
+                              xen_pvh_set_ ## name ## _size, NULL, NULL); \
+    object_class_property_set_description(oc, prop_name "-size",          \
+                              "Set memory range size for " prop_name);    \
+} while (0)
+
+#define OC_MEMMAP_PROP(c, prop_name, name)                                \
+do {                                                                      \
+        OC_MEMMAP_PROP_BASE(c, prop_name, name);                          \
+        OC_MEMMAP_PROP_SIZE(c, prop_name, name);                          \
+} while (0)
+
+    /*
+     * We provide memmap properties to allow Xen to move things to other
+     * addresses for example when users need to accomodate the memory-map
+     * for 1:1 mapped devices/memory.
+     */
+    OC_MEMMAP_PROP(oc, "ram-low", ram_low);
+    OC_MEMMAP_PROP(oc, "ram-high", ram_high);
+
+    if (xpc->has_virtio_mmio) {
+        OC_MEMMAP_PROP(oc, "virtio-mmio", virtio_mmio);
+    }
+
+#ifdef CONFIG_TPM
+    if (xpc->has_tpm) {
+        object_class_property_add(oc, "tpm-base-addr", "uint64_t",
+                                  xen_pvh_get_tpm_base,
+                                  xen_pvh_set_tpm_base,
+                                  NULL, NULL);
+        object_class_property_set_description(oc, "tpm-base-addr",
+                                  "Set Base address for TPM device.");
+
+        machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+    }
+#endif
+}
+
+static void xen_pvh_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->init = xen_pvh_init;
+
+    mc->desc = "Xen PVH machine";
+    mc->max_cpus = 1;
+    mc->default_machine_opts = "accel=xen";
+    /* Set to zero to make sure that the real ram size is passed. */
+    mc->default_ram_size = 0;
+}
+
+static const TypeInfo xen_pvh_info = {
+    .name = TYPE_XEN_PVH_MACHINE,
+    .parent = TYPE_MACHINE,
+    .abstract = true,
+    .instance_size = sizeof(XenPVHMachineState),
+    .class_size = sizeof(XenPVHMachineClass),
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
index 0000000000..77fd98b9fe
--- /dev/null
+++ b/include/hw/xen/xen-pvh-common.h
@@ -0,0 +1,59 @@
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
+#define TYPE_XEN_PVH_MACHINE MACHINE_TYPE_NAME("xen-pvh-base")
+OBJECT_DECLARE_TYPE(XenPVHMachineState, XenPVHMachineClass,
+                    XEN_PVH_MACHINE)
+
+struct XenPVHMachineClass {
+    MachineClass parent;
+
+    /* PVH implementation specific init.  */
+    void (*init)(MachineState *state);
+
+    /*
+     * Each implementation can optionally enable features that it
+     * supports and are known to work.
+     */
+    bool has_tpm;
+    bool has_virtio_mmio;
+};
+
+struct XenPVHMachineState {
+    /*< private >*/
+    MachineState parent;
+
+    XenIOState ioreq;
+
+    struct {
+        MemoryRegion low;
+        MemoryRegion high;
+    } ram;
+
+    struct {
+        MemMapEntry ram_low, ram_high;
+        MemMapEntry tpm;
+
+        /* Virtio-mmio */
+        MemMapEntry virtio_mmio;
+        uint32_t virtio_mmio_num;
+        uint32_t virtio_mmio_irq_base;
+    } cfg;
+};
+
+void xen_pvh_class_setup_common_props(XenPVHMachineClass *xpc);
+#endif
-- 
2.43.0


