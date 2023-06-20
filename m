Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E617372BD
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552059.861920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf74-00059b-M6; Tue, 20 Jun 2023 17:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552059.861920; Tue, 20 Jun 2023 17:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf74-00057D-IS; Tue, 20 Jun 2023 17:25:54 +0000
Received: by outflank-mailman (input) for mailman id 552059;
 Tue, 20 Jun 2023 17:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf72-0004q1-LE
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:25:52 +0000
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [2607:f8b0:4864:20::a34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f4a723c-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:25:49 +0200 (CEST)
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-460eb67244eso1697612e0c.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:25:49 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:25:47 -0700 (PDT)
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
X-Inumbo-ID: 7f4a723c-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281948; x=1689873948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hrk0wDBbf6/161Oz/dROIywUu4Lt8nMEGmJFRn8F00=;
        b=Obywgck3AURMMYDbVBVdtSBtT/SqGqBSDRZg9h25ziU0SsbIlgpTLssByVvDpTHpI2
         g1qtsIQ+94NG9dlgMNBtZfbt0uxoviGz++2OG+1/+lbczh0iCfDkz1jvJul38Inzgo4G
         FB9g1NNzNq2a33g5beQ2FJYyHnYM+ilX44age48drsme/gT+tJUcG+NGGEzQDCeAC4os
         OZ5zMnrANTxSmxgaMISNonIKBHsWAHsdgNJHBRNH1UnJ9GIAgd9f+lK457z/Tx+v0GFe
         5ekAVzVuxTgSGpUeiAzr9Z21JTswMqiOEIPc22lQDVc5GQpCzoV8OB0qxxLNnjSdz3z6
         869g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281948; x=1689873948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hrk0wDBbf6/161Oz/dROIywUu4Lt8nMEGmJFRn8F00=;
        b=G/MgUJymh9ZB/vnJL+T/HzAuqDoyRUMbHN5C2fCzSgLwISd+oLEYvFMzOOkulMBkRj
         gee7MEiYZSKcYvcCznXYagMi5cM55C5lo1uPbk2D+3yn/zVepZIu3HJT/AlHV4A6b+iX
         TshzBKrg41BjCu5nCdEKad++QSvifTXQZW6qxjbE9/g7cFu2uMsn0Vgw7oFiGNpxgj5D
         268NdBPh2mtGlMPrEdM+fbGw/lESDJQvKt52FPwySqiZNbxoeqAUFk9JXmRvYPpoyGLN
         j5cz3YdapNWbHH+cY3NWpL3dL1aQY9Fd2zJx9pH21MMKwyyDo4BUroedpnCgyrtaX0E4
         ph1g==
X-Gm-Message-State: AC+VfDyvRuRVT6YOUMQkn55CHuHZmf38LnpRmgNFLj0HUJL0zKAma3Q2
	H/gyE7rvWdgaxM1o/wugYTQ=
X-Google-Smtp-Source: ACHHUZ5n89RQ7Sbe1aNDnGGyqW0nP1Eb7/Rpjyat3GzAshcU2+942N9ZPVTFchUI1ZE7Z7Tx8gRb9g==
X-Received: by 2002:a1f:3d11:0:b0:465:fa30:d633 with SMTP id k17-20020a1f3d11000000b00465fa30d633mr4464272vka.0.1687281947492;
        Tue, 20 Jun 2023 10:25:47 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 1/1] Q35 Support
Date: Tue, 20 Jun 2023 13:24:35 -0400
Message-Id: <272947b9494f00bb4ad3e27c050e99f8b61905b3.1687127946.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687127946.git.jupham125@gmail.com>
References: <cover.1687127946.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 hw/acpi/ich9.c                |   22 +-
 hw/acpi/pcihp.c               |    6 +-
 hw/core/machine.c             |   19 +
 hw/i386/pc_piix.c             |    3 +-
 hw/i386/pc_q35.c              |   39 +-
 hw/i386/xen/xen-hvm.c         |    7 +-
 hw/i386/xen/xen_platform.c    |   19 +-
 hw/isa/lpc_ich9.c             |   53 +-
 hw/isa/piix3.c                |    2 +-
 hw/pci-host/q35.c             |   28 +-
 hw/pci/pci.c                  |   17 +
 hw/xen/xen-host-pci-device.c  |  106 +++-
 hw/xen/xen-host-pci-device.h  |    6 +-
 hw/xen/xen_pt.c               |   49 +-
 hw/xen/xen_pt.h               |   19 +-
 hw/xen/xen_pt_config_init.c   | 1103 ++++++++++++++++++++++++++++++---
 include/hw/acpi/ich9.h        |    1 +
 include/hw/acpi/pcihp.h       |    2 +
 include/hw/boards.h           |    1 +
 include/hw/i386/pc.h          |    3 +
 include/hw/pci-host/q35.h     |    4 +-
 include/hw/pci/pci.h          |    3 +
 include/hw/southbridge/ich9.h |    1 +
 include/hw/xen/xen.h          |    4 +-
 qemu-options.hx               |    1 +
 softmmu/datadir.c             |    1 -
 softmmu/qdev-monitor.c        |    3 +-
 stubs/xen-hw-stub.c           |    4 +-
 28 files changed, 1395 insertions(+), 131 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 25e2c7243e..234706a191 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -39,6 +39,8 @@
 #include "hw/southbridge/ich9.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/xen/xen.h"
+#include "sysemu/xen.h"
 
 //#define DEBUG
 
@@ -67,6 +69,10 @@ static void ich9_gpe_writeb(void *opaque, hwaddr addr, uint64_t val,
     ICH9LPCPMRegs *pm = opaque;
     acpi_gpe_ioport_writeb(&pm->acpi_regs, addr, val);
     acpi_update_sci(&pm->acpi_regs, pm->irq);
+
+    if (xen_enabled()) {
+        acpi_pcihp_reset(&pm->acpi_pci_hotplug);
+    }
 }
 
 static const MemoryRegionOps ich9_gpe_ops = {
@@ -137,7 +143,8 @@ static int ich9_pm_post_load(void *opaque, int version_id)
 {
     ICH9LPCPMRegs *pm = opaque;
     uint32_t pm_io_base = pm->pm_io_base;
-    pm->pm_io_base = 0;
+    if (!xen_enabled())
+        pm->pm_io_base = 0;
     ich9_pm_iospace_update(pm, pm_io_base);
     return 0;
 }
@@ -268,7 +275,10 @@ static void pm_reset(void *opaque)
     acpi_pm1_evt_reset(&pm->acpi_regs);
     acpi_pm1_cnt_reset(&pm->acpi_regs);
     acpi_pm_tmr_reset(&pm->acpi_regs);
-    acpi_gpe_reset(&pm->acpi_regs);
+    /* Noticed guest freezing in xen when this was reset after S3. */
+    if (!xen_enabled()) {
+        acpi_gpe_reset(&pm->acpi_regs);
+    }
 
     pm->smi_en = 0;
     if (!pm->smm_enabled) {
@@ -316,7 +326,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm, qemu_irq sci_irq)
         acpi_pm_tco_init(&pm->tco_regs, &pm->io);
     }
 
-    if (pm->acpi_pci_hotplug.use_acpi_hotplug_bridge) {
+    if (pm->acpi_pci_hotplug.use_acpi_hotplug_bridge || xen_enabled()) {
         acpi_pcihp_init(OBJECT(lpc_pci),
                         &pm->acpi_pci_hotplug,
                         pci_get_bus(lpc_pci),
@@ -332,10 +342,14 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm, qemu_irq sci_irq)
     pm->powerdown_notifier.notify = pm_powerdown_req;
     qemu_register_powerdown_notifier(&pm->powerdown_notifier);
 
+    if (xen_enabled()) {
+            acpi_set_pci_info(true);
+    }
+
     legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
         OBJECT(lpc_pci), &pm->gpe_cpu, ICH9_CPU_HOTPLUG_IO_BASE);
 
-    if (pm->acpi_memory_hotplug.is_enabled) {
+    if (pm->acpi_memory_hotplug.is_enabled || xen_enabled()) {
         acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(lpc_pci),
                                  &pm->acpi_memory_hotplug,
                                  ACPI_MEMORY_HOTPLUG_BASE);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index cdd6f775a1..5b065d670c 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -40,6 +40,7 @@
 #include "qapi/error.h"
 #include "qom/qom-qobject.h"
 #include "trace.h"
+#include "sysemu/xen.h"
 
 #define ACPI_PCIHP_SIZE 0x0018
 #define PCI_UP_BASE 0x0000
@@ -84,7 +85,8 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
     bool is_bridge = IS_PCI_BRIDGE(br);
 
     /* hotplugged bridges can't be described in ACPI ignore them */
-    if (qbus_is_hotpluggable(BUS(bus))) {
+    /* Xen requires hotplugging to the root device, even on the Q35 chipset */
+    if (qbus_is_hotpluggable(BUS(bus)) || xen_enabled()) {
         if (!is_bridge || (!br->hotplugged && info->has_bridge_hotplug)) {
             bus_bsel = g_malloc(sizeof *bus_bsel);
 
@@ -97,7 +99,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
     return info;
 }
 
-static void acpi_set_pci_info(bool has_bridge_hotplug)
+void acpi_set_pci_info(bool has_bridge_hotplug)
 {
     static bool bsel_is_set;
     Object *host = acpi_get_i386_pci_host();
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1000406211..703138d2ec 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -455,6 +455,20 @@ static void machine_set_graphics(Object *obj, bool value, Error **errp)
     ms->enable_graphics = value;
 }
 
+static bool machine_get_xen_platform_dev(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->xen_platform_dev;
+}
+
+static void machine_set_xen_platform_dev(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->xen_platform_dev = value;
+}
+
 static char *machine_get_firmware(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -1004,6 +1018,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "graphics",
         "Set on/off to enable/disable graphics emulation");
 
+    object_class_property_add_bool(oc, "xen-platform-dev",
+        machine_get_xen_platform_dev, machine_set_xen_platform_dev);
+    object_class_property_set_description(oc, "xen-platform-dev",
+        "Set on/off to enable/disable Xen Platform device");
+
     object_class_property_add_str(oc, "firmware",
         machine_get_firmware, machine_set_firmware);
     object_class_property_set_description(oc, "firmware",
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d5b0dcd1fe..8c1b20f3bc 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -62,6 +62,7 @@
 #endif
 #include "hw/xen/xen-x86.h"
 #include "hw/xen/xen.h"
+#include "sysemu/xen.h"
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "sysemu/numa.h"
@@ -233,7 +234,7 @@ static void pc_init1(MachineState *machine,
                               x86ms->above_4g_mem_size,
                               pci_memory, ram_memory);
         pci_bus_map_irqs(pci_bus,
-                         xen_enabled() ? xen_pci_slot_get_pirq
+                         xen_enabled() ? xen_cmn_pci_slot_get_pirq
                                        : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 6155427e48..81aa9e04f0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -57,10 +57,24 @@
 #include "hw/hyperv/vmbus-bridge.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/i386/acpi-build.h"
+#include "hw/xen/xen-x86.h"
+#include "sysemu/xen.h"
 
 /* ICH9 AHCI has 6 ports */
 #define MAX_SATA_PORTS     6
 
+static void q35_xen_hvm_init(MachineState *machine)
+{
+    PCMachineState *pcms = PC_MACHINE(machine);
+
+    if (xen_enabled()) {
+        /* check if Xen Platform device is enabled */
+        if (machine->xen_platform_dev) {
+            pci_create_simple(pcms->bus, -1, "xen-platform");
+        }
+    }
+}
+
 struct ehci_companions {
     const char *name;
     int func;
@@ -131,6 +145,7 @@ static void pc_q35_init(MachineState *machine)
     MemoryRegion *system_io = get_system_io();
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
+    MemoryRegion *ram_memory;
     GSIState *gsi_state;
     ISABus *isa_bus;
     int i;
@@ -182,8 +197,12 @@ static void pc_q35_init(MachineState *machine)
     }
 
     pc_machine_init_sgx_epc(pcms);
-    x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
+    x86_cpus_init(x86ms, pcmc->default_cpu_version);
+    if (xen_enabled()) {
+        xen_hvm_init_pc(pcms, &ram_memory);
+	machine->ram = ram_memory;
+    }
     kvmclock_create(pcmc->kvmclock_create_always);
 
     /* pci enabled */
@@ -216,7 +235,15 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
+    if (!xen_enabled()) 
+        pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
+     else {
+        pc_system_flash_cleanup_unused(pcms);
+        if (machine->kernel_filename != NULL) {
+            /* For xen HVM direct kernel boot, load linux here */
+            xen_load_linux(pcms);
+        }
+    }
 
     object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
@@ -273,8 +300,12 @@ static void pc_q35_init(MachineState *machine)
     for (i = 0; i < IOAPIC_NUM_PINS; i++) {
         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gsi[i]);
     }
-    isa_bus = ISA_BUS(qdev_get_child_bus(lpc_dev, "isa.0"));
 
+    if (xen_enabled()) {
+        q35_xen_hvm_init(machine);
+    }
+
+    isa_bus = ISA_BUS(qdev_get_child_bus(lpc_dev, "isa.0"));
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
     }
@@ -289,7 +320,7 @@ static void pc_q35_init(MachineState *machine)
 
     assert(pcms->vmport != ON_OFF_AUTO__MAX);
     if (pcms->vmport == ON_OFF_AUTO_AUTO) {
-        pcms->vmport = ON_OFF_AUTO_ON;
+        pcms->vmport = xen_enabled() ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
     }
 
     /* init basic PC hardware */
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 56641a550e..540ac46639 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/i386/pc.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
 #include "hw/i386/apic-msidef.h"
@@ -136,14 +137,14 @@ typedef struct XenIOState {
     Notifier wakeup;
 } XenIOState;
 
-/* Xen specific function for piix pci */
+/* Xen-specific functions for pci dev IRQ handling */
 
-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+int xen_cmn_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_cmn_set_irq(void *opaque, int irq_num, int level)
 {
     xen_set_pci_intx_level(xen_domid, 0, 0, irq_num >> 2,
                            irq_num & 3, level);
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 57f1d742c1..0375337222 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -34,6 +34,7 @@
 #include "sysemu/block-backend.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "include/hw/i386/pc.h"
 #include "qom/object.h"
 
 #ifdef CONFIG_XEN
@@ -223,6 +224,12 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
         if (flags & UNPLUG_NVME_DISKS) {
             object_unparent(OBJECT(d));
         }
+        break;
+
+    case PCI_CLASS_STORAGE_SATA:
+	if (!aux) {
+            object_unparent(OBJECT(d));
+        }
 
     default:
         break;
@@ -231,7 +238,17 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 
 static void pci_unplug_disks(PCIBus *bus, uint32_t flags)
 {
-    pci_for_each_device(bus, 0, unplug_disks, &flags);
+    PCIBus *q35 = find_q35();
+    if (q35) {
+        /* When q35 is detected, we will remove the ahci controller
+	 * with the hard disks.  In the libxl config, cdrom devices
+	 * are put on a seperate ahci controller. This allows for 6 cdrom
+	 * devices to be added, and 6 qemu hard disks.
+	 */
+        pci_function_for_one_bus(bus, unplug_disks, &flags);
+    } else {
+        pci_for_each_device(bus, 0, unplug_disks, &flags);
+    }
 }
 
 static void platform_fixed_ioport_writew(void *opaque, uint32_t addr, uint32_t val)
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 9c47a2f6c7..fbda6085d0 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -51,6 +51,9 @@
 #include "hw/core/cpu.h"
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/cutils.h"
+#include "hw/xen/xen.h"
+#include "sysemu/xen.h"
+#include "hw/southbridge/piix.h"
 #include "hw/acpi/acpi_aml_interface.h"
 #include "trace.h"
 
@@ -535,11 +538,49 @@ static int ich9_lpc_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static void ich9_lpc_config_write_xen(PCIDevice *d,
+                                  uint32_t addr, uint32_t val, int len)
+{   
+    static bool pirqe_f_warned = false;
+    if (ranges_overlap(addr, len, ICH9_LPC_PIRQA_ROUT, 4)) {
+        /* handle PIRQA..PIRQD routing */
+        /* Scan for updates to PCI link routes (0x60-0x63). */
+        int i; 
+        for (i = 0; i < len; i++) {
+            uint8_t v = (val >> (8 * i)) & 0xff;
+            if (v & 0x80) {
+                v = 0;
+            } 
+            v &= 0xf;
+            if (((addr + i) >= PIIX_PIRQCA) && ((addr + i) <= PIIX_PIRQCD)) {
+                xen_set_pci_link_route(addr + i - PIIX_PIRQCA, v);
+            }
+        }
+    } else if (ranges_overlap(addr, len, ICH9_LPC_PIRQE_ROUT, 4)) {
+        while (len--) {
+            if (range_covers_byte(ICH9_LPC_PIRQE_ROUT, 4, addr) &&
+                (val & 0x80) == 0) {
+                /* print warning only once */
+                if (!pirqe_f_warned) {
+                    pirqe_f_warned = true;
+                    fprintf(stderr, "WARNING: guest domain attempted to use PIRQ%c "
+                            "routing which is not supported for Xen/Q35 currently\n",
+                            (char)(addr - ICH9_LPC_PIRQE_ROUT + 'E'));
+                    break;
+                }
+            }
+            addr++, val >>= 8;
+        }
+    }
+}
+
 static void ich9_lpc_config_write(PCIDevice *d,
                                   uint32_t addr, uint32_t val, int len)
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(d);
     uint32_t rcba_old = pci_get_long(d->config + ICH9_LPC_RCBA);
+    if (xen_enabled())
+        ich9_lpc_config_write_xen(d, addr, val, len);
 
     pci_default_write_config(d, addr, val, len);
     if (ranges_overlap(addr, len, ICH9_LPC_PMBASE, 4) ||
@@ -731,10 +772,14 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
-    pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
-    pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
-
+    if (xen_enabled()) {
+        pci_bus_irqs(pci_bus, xen_cmn_set_irq, d, ICH9_XEN_NUM_IRQ_SOURCES);
+        pci_bus_map_irqs(pci_bus, xen_cmn_pci_slot_get_pirq);
+    } else {
+        pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
+        pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
+        pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
+    }
     ich9_lpc_pm_init(lpc);
 }
 
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index f9103ea45a..3d0545eb0e 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -420,7 +420,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, xen_cmn_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index fd18920e7f..3bb6325fb3 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -37,6 +37,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/module.h"
+#include "sysemu/xen.h"
 
 /****************************************************************************
  * Q35 host
@@ -259,6 +260,15 @@ static void q35_host_initfn(Object *obj)
                              qdev_prop_allow_set_link_before_realize, 0);
 }
 
+PCIBus *find_q35(void)
+{
+    PCIHostState *s = OBJECT_CHECK(PCIHostState,
+                                   object_resolve_path("/machine/q35", NULL),
+                                   TYPE_PCI_HOST_BRIDGE);
+    return s ? s->bus : NULL;
+}
+
+
 static const TypeInfo q35_host_info = {
     .name       = TYPE_Q35_HOST_DEVICE,
     .parent     = TYPE_PCIE_HOST_BRIDGE,
@@ -315,12 +325,21 @@ static void mch_update_pciexbar(MCHPCIState *mch)
         break;
     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_128M:
         length = 128 * 1024 * 1024;
-        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK |
-            MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
+	if (!xen_enabled()) {
+            addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK |
+                MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
+	} else {
+            addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK;
+        }
         break;
     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_64M:
         length = 64 * 1024 * 1024;
-        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
+	if (!xen_enabled()) {
+            addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
+	} else {
+            addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK |
+                MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK;	
+        }
         break;
     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
         qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n");
@@ -561,7 +580,8 @@ static void mch_reset(DeviceState *qdev)
     d->config[MCH_HOST_BRIDGE_F_SMBASE] = 0;
     d->wmask[MCH_HOST_BRIDGE_F_SMBASE] = 0xff;
 
-    mch_update(mch);
+    if (!xen_enabled())
+        mch_update(mch);
 }
 
 static void mch_realize(PCIDevice *d, Error **errp)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1cc7c89036..8eac3d751a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1815,6 +1815,23 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
     }
 }
 
+void pci_function_for_one_bus(PCIBus *bus,
+                          void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
+                          void *opaque)
+{
+    bus = pci_find_bus_nr(bus, 0);
+
+    if (bus) {
+        PCIDevice *d;
+
+        d = bus->devices[PCI_DEVFN(4,0)];
+        if (d) {
+            fn(bus, d, opaque);
+            return;
+        }
+    }
+}
+
 void pci_for_each_device_under_bus(PCIBus *bus,
                                    pci_bus_dev_fn fn, void *opaque)
 {
diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 8c6e9a1716..63481a859e 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -32,6 +32,7 @@
 
 #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
 #define IORESOURCE_MEM_64       0x00100000
+#define XEN_HOST_PCI_CAP_MAX    48
 
 static void xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
                                     const char *name, char *buf, ssize_t size)
@@ -198,6 +199,19 @@ static bool xen_host_pci_dev_is_virtfn(XenHostPCIDevice *d)
     return !stat(path, &buf);
 }
 
+static bool xen_host_pci_dev_has_pcie_ext_caps(XenHostPCIDevice *d)
+{
+    uint32_t header;
+
+    if (xen_host_pci_get_long(d, PCI_CONFIG_SPACE_SIZE, &header))
+        return false;
+
+    if (header == 0 || header == ~0U)
+        return false;
+
+    return true;
+}
+
 static void xen_host_pci_config_open(XenHostPCIDevice *d, Error **errp)
 {
     char path[PATH_MAX];
@@ -296,37 +310,93 @@ int xen_host_pci_set_block(XenHostPCIDevice *d, int pos, uint8_t *buf, int len)
     return xen_host_pci_config_write(d, pos, buf, len);
 }
 
-int xen_host_pci_find_ext_cap_offset(XenHostPCIDevice *d, uint32_t cap)
+int xen_host_pci_find_next_ext_cap(XenHostPCIDevice *d, int pos, uint32_t cap)
 {
     uint32_t header = 0;
     int max_cap = XEN_HOST_PCI_MAX_EXT_CAP;
-    int pos = PCI_CONFIG_SPACE_SIZE;
+
+    if (!d->has_pcie_ext_caps)
+        return 0;
+
+    if (!pos) {
+        pos = PCI_CONFIG_SPACE_SIZE;
+    } else {
+        if (xen_host_pci_get_long(d, pos, &header))
+            return 0;
+
+        pos = PCI_EXT_CAP_NEXT(header);
+    }
 
     do {
+        if (!pos || pos < PCI_CONFIG_SPACE_SIZE) {
+            break;
+        }
+
         if (xen_host_pci_get_long(d, pos, &header)) {
             break;
         }
         /*
          * If we have no capabilities, this is indicated by cap ID,
          * cap version and next pointer all being 0.
+	 * Also check for all F's returned (which means PCIe ext conf space
+	 * is unreadable for some reason)
          */
-        if (header == 0) {
+	if (header == 0 || header == ~0U) {
             break;
         }
 
-        if (PCI_EXT_CAP_ID(header) == cap) {
+        if (cap == CAP_ID_ANY) {
+            return pos;
+        } else if (PCI_EXT_CAP_ID(header) == cap) {
             return pos;
         }
 
         pos = PCI_EXT_CAP_NEXT(header);
-        if (pos < PCI_CONFIG_SPACE_SIZE) {
+    } while (--max_cap);
+
+    return 0;
+}
+
+int xen_host_pci_find_next_cap(XenHostPCIDevice *d, int pos, uint32_t cap)
+{
+    uint8_t id;
+    unsigned max_cap = XEN_HOST_PCI_CAP_MAX;
+    uint8_t status = 0;
+    uint8_t curpos;
+
+    if (xen_host_pci_get_byte(d, PCI_STATUS, &status))
+        return 0;
+
+    if ((status & PCI_STATUS_CAP_LIST) == 0)
+        return 0;
+
+    if (pos < PCI_CAPABILITY_LIST) {
+        curpos = PCI_CAPABILITY_LIST;
+    } else {
+        curpos = (uint8_t) pos;
+    }
+
+    while (max_cap--) {
+        if (xen_host_pci_get_byte(d, curpos, &curpos))
+             break;
+        if (!curpos)
+             break;
+
+        if (cap == CAP_ID_ANY)
+            return curpos;
+
+        if (xen_host_pci_get_byte(d, curpos + PCI_CAP_LIST_ID, &id))
             break;
-        }
 
-        max_cap--;
-    } while (max_cap > 0);
+        if (id == 0xff)
+            break;
+        else if (id == cap)
+            return curpos;
+
+        curpos += PCI_CAP_LIST_NEXT;
+    }
 
-    return -1;
+    return 0;
 }
 
 void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
@@ -335,6 +405,7 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
 {
     ERRP_GUARD();
     unsigned int v;
+    int pcie_cap_pos;
 
     d->config_fd = -1;
     d->domain = domain;
@@ -376,7 +447,22 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     }
     d->class_code = v;
 
-    d->is_virtfn = xen_host_pci_dev_is_virtfn(d);
+    d->is_virtfn         = xen_host_pci_dev_is_virtfn(d);
+    d->has_pcie_ext_caps = xen_host_pci_dev_has_pcie_ext_caps(d);
+
+    /* read and store PCIe Capabilities field for later use */
+    pcie_cap_pos = xen_host_pci_find_next_cap(d, 0, PCI_CAP_ID_EXP);
+
+    if (pcie_cap_pos) {
+        if (xen_host_pci_get_word(d, pcie_cap_pos + PCI_EXP_FLAGS,
+                                  &d->pcie_flags)) {
+            error_setg(errp, "Unable to read from PCI Express capability "
+                       "structure at 0x%x", pcie_cap_pos);
+            goto error;
+        }
+    } else {
+        d->pcie_flags = 0xFFFF;
+    }
 
     return;
 
diff --git a/hw/xen/xen-host-pci-device.h b/hw/xen/xen-host-pci-device.h
index 4d8d34ecb0..2884c4b4b9 100644
--- a/hw/xen/xen-host-pci-device.h
+++ b/hw/xen/xen-host-pci-device.h
@@ -27,11 +27,13 @@ typedef struct XenHostPCIDevice {
     uint16_t device_id;
     uint32_t class_code;
     int irq;
+    uint16_t pcie_flags;
 
     XenHostPCIIORegion io_regions[PCI_NUM_REGIONS - 1];
     XenHostPCIIORegion rom;
 
     bool is_virtfn;
+    bool has_pcie_ext_caps;
 
     int config_fd;
 } XenHostPCIDevice;
@@ -53,6 +55,8 @@ int xen_host_pci_set_long(XenHostPCIDevice *d, int pos, uint32_t data);
 int xen_host_pci_set_block(XenHostPCIDevice *d, int pos, uint8_t *buf,
                            int len);
 
-int xen_host_pci_find_ext_cap_offset(XenHostPCIDevice *s, uint32_t cap);
+#define CAP_ID_ANY  (~0U)
+int xen_host_pci_find_next_cap(XenHostPCIDevice *s, int pos, uint32_t cap);
+int xen_host_pci_find_next_ext_cap(XenHostPCIDevice *d, int pos, uint32_t cap);
 
 #endif /* XEN_HOST_PCI_DEVICE_H */
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index a540149639..2399fabb2b 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -96,8 +96,16 @@ void xen_pt_log(const PCIDevice *d, const char *f, ...)
 
 static int xen_pt_pci_config_access_check(PCIDevice *d, uint32_t addr, int len)
 {
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
     /* check offset range */
-    if (addr > 0xFF) {
+    if (s->pcie_enabled_dev) {
+        if (addr >= PCIE_CONFIG_SPACE_SIZE) {
+            XEN_PT_ERR(d, "Failed to access register with offset "
+                          "exceeding 0xFFF. (addr: 0x%02x, len: %d)\n",
+                          addr, len);
+            return -1;
+        }
+    } else if (addr >= PCI_CONFIG_SPACE_SIZE) {
         XEN_PT_ERR(d, "Failed to access register with offset exceeding 0xFF. "
                    "(addr: 0x%02x, len: %d)\n", addr, len);
         return -1;
@@ -156,7 +164,16 @@ static uint32_t xen_pt_pci_read_config(PCIDevice *d, uint32_t addr, int len)
     reg_grp_entry = xen_pt_find_reg_grp(s, addr);
     if (reg_grp_entry) {
         /* check 0-Hardwired register group */
-        if (reg_grp_entry->reg_grp->grp_type == XEN_PT_GRP_TYPE_HARDWIRED) {
+        if (reg_grp_entry->reg_grp->grp_type == XEN_PT_GRP_TYPE_HARDWIRED &&
+            /*
+             * For PCIe Extended Capabilities we need to emulate
+             * CapabilityID and NextCapability/Version registers for a
+             * hardwired reg group located at the offset 0x100 in PCIe
+             * config space. This allows us to hide the first extended
+             * capability as well.
+             */
+            !(reg_grp_entry->base_offset == PCI_CONFIG_SPACE_SIZE &&
+            ranges_overlap(addr, len, 0x100, 4))) {
             /* no need to emulate, just return 0 */
             val = 0;
             goto exit;
@@ -701,6 +718,21 @@ static const MemoryListener xen_pt_io_listener = {
     .priority = 10,
 };
 
+static inline bool xen_pt_dev_is_pcie_mode(PCIDevice *d)
+{
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
+    PCIBus *bus = pci_get_bus(d);
+
+    if (bus != NULL) {
+        if (pci_is_express(d) && pci_bus_is_express(bus) &&
+            xen_host_pci_find_next_cap(&s->real_device, 0, PCI_CAP_ID_EXP)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /* destroy. */
 static void xen_pt_destroy(PCIDevice *d) {
 
@@ -787,8 +819,17 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
                    s->real_device.dev, s->real_device.func);
     }
 
-    /* Initialize virtualized PCI configuration (Extended 256 Bytes) */
-    memset(d->config, 0, PCI_CONFIG_SPACE_SIZE);
+    s->pcie_enabled_dev = xen_pt_dev_is_pcie_mode(d);
+    if (s->pcie_enabled_dev) {
+        XEN_PT_LOG(d, "Host device %04x:%02x:%02x.%d passed thru "
+                   "in PCIe mode\n", s->real_device.domain,
+                    s->real_device.bus, s->real_device.dev,
+                    s->real_device.func);
+    }
+
+    /* Initialize virtualized PCI configuration space (256/4K bytes) */
+    memset(d->config, 0, pci_is_express(d) ? PCIE_CONFIG_SPACE_SIZE
+                                           : PCI_CONFIG_SPACE_SIZE);
 
     s->memory_listener = xen_pt_memory_listener;
     s->io_listener = xen_pt_io_listener;
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index b20744f7c7..0ed6e77e76 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -33,6 +33,11 @@ void xen_pt_log(const PCIDevice *d, const char *f, ...) G_GNUC_PRINTF(2, 3);
 /* Helper */
 #define XEN_PFN(x) ((x) >> XC_PAGE_SHIFT)
 
+/* Macro's for PCIe Extended Capabilities */
+#define PCIE_EXT_CAP_ID(cap_id)     ((cap_id) | (1U << 16))
+#define IS_PCIE_EXT_CAP_ID(grp_id)  ((grp_id) & (1U << 16))
+#define GET_PCIE_EXT_CAP_ID(grp_id) ((grp_id) & 0xFFFF)
+
 typedef const struct XenPTRegInfo XenPTRegInfo;
 typedef struct XenPTReg XenPTReg;
 
@@ -88,6 +93,11 @@ typedef int (*xen_pt_conf_byte_read)
 
 #define XEN_PCI_INTEL_OPREGION 0xfc
 
+#define XEN_PCIE_CAP_ID 0
+#define XEN_PCIE_CAP_LIST_NEXT 2
+#define XEN_PCIE_FAKE_CAP_ID_BASE 0xFE00
+
+
 #define XEN_PCI_IGD_DOMAIN 0
 #define XEN_PCI_IGD_BUS 0
 #define XEN_PCI_IGD_DEV 2
@@ -174,13 +184,13 @@ typedef const struct XenPTRegGroupInfo XenPTRegGroupInfo;
 /* emul reg group size initialize method */
 typedef int (*xen_pt_reg_size_init_fn)
     (XenPCIPassthroughState *, XenPTRegGroupInfo *,
-     uint32_t base_offset, uint8_t *size);
+     uint32_t base_offset, uint32_t *size);
 
 /* emulated register group information */
 struct XenPTRegGroupInfo {
-    uint8_t grp_id;
+    uint32_t grp_id;
     XenPTRegisterGroupType grp_type;
-    uint8_t grp_size;
+    uint32_t grp_size;
     xen_pt_reg_size_init_fn size_init;
     XenPTRegInfo *emu_regs;
 };
@@ -190,7 +200,7 @@ typedef struct XenPTRegGroup {
     QLIST_ENTRY(XenPTRegGroup) entries;
     XenPTRegGroupInfo *reg_grp;
     uint32_t base_offset;
-    uint8_t size;
+    uint32_t size;
     QLIST_HEAD(, XenPTReg) reg_tbl_list;
 } XenPTRegGroup;
 
@@ -234,6 +244,7 @@ struct XenPCIPassthroughState {
 
     PCIHostDeviceAddress hostaddr;
     bool is_virtfn;
+    bool pcie_enabled_dev;
     bool permissive;
     bool permissive_warned;
     XenHostPCIDevice real_device;
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 2b8680b112..cc583f9cc1 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "xen_pt.h"
+#include "xen-host-pci-device.h"
 #include "hw/xen/xen-legacy-backend.h"
 
 #define XEN_PT_MERGE_VALUE(value, data, val_mask) \
@@ -27,33 +28,52 @@
 
 static int xen_pt_ptr_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *reg,
                                uint32_t real_offset, uint32_t *data);
-
+static int xen_pt_ext_cap_ptr_reg_init(XenPCIPassthroughState *s,
+                                       XenPTRegInfo *reg,
+                                       uint32_t real_offset,
+                                       uint32_t *data);
+static int xen_pt_ext_cap_capid_reg_init(XenPCIPassthroughState *s,
+                                         XenPTRegInfo *reg,
+                                         uint32_t real_offset,
+                                         uint32_t *data);
 
 /* helper */
 
 /* A return value of 1 means the capability should NOT be exposed to guest. */
-static int xen_pt_hide_dev_cap(const XenHostPCIDevice *d, uint8_t grp_id)
-{
-    switch (grp_id) {
-    case PCI_CAP_ID_EXP:
-        /* The PCI Express Capability Structure of the VF of Intel 82599 10GbE
-         * Controller looks trivial, e.g., the PCI Express Capabilities
-         * Register is 0. We should not try to expose it to guest.
-         *
-         * The datasheet is available at
-         * http://download.intel.com/design/network/datashts/82599_datasheet.pdf
-         *
-         * See 'Table 9.7. VF PCIe Configuration Space' of the datasheet, the
-         * PCI Express Capability Structure of the VF of Intel 82599 10GbE
-         * Controller looks trivial, e.g., the PCI Express Capabilities
-         * Register is 0, so the Capability Version is 0 and
-         * xen_pt_pcie_size_init() would fail.
-         */
-        if (d->vendor_id == PCI_VENDOR_ID_INTEL &&
-            d->device_id == PCI_DEVICE_ID_INTEL_82599_SFP_VF) {
-            return 1;
+static int xen_pt_hide_dev_cap(const XenHostPCIDevice *d, uint32_t grp_id)
+{
+    if (IS_PCIE_EXT_CAP_ID(grp_id)) {
+        switch (GET_PCIE_EXT_CAP_ID(grp_id)) {
+            /* Here can be added device-specific filtering
+             * for PCIe Extended capabilities (those with offset >= 0x100).
+             * This is simply a placeholder as no filtering needed for now.
+             */
+        default:
+            break;
+        }
+    } else {
+        /* basic PCI capability */
+        switch (grp_id) {
+        case PCI_CAP_ID_EXP:
+            /* The PCI Express Capability Structure of the VF of Intel 82599 10GbE
+             * Controller looks trivial, e.g., the PCI Express Capabilities
+             * Register is 0. We should not try to expose it to guest.
+             *
+             * The datasheet is available at
+             * http://download.intel.com/design/network/datashts/82599_datasheet.pdf
+             *
+             * See 'Table 9.7. VF PCIe Configuration Space' of the datasheet, the
+             * PCI Express Capability Structure of the VF of Intel 82599 10GbE
+             * Controller looks trivial, e.g., the PCI Express Capabilities
+             * Register is 0, so the Capability Version is 0 and
+             * xen_pt_pcie_size_init() would fail.
+             */
+            if (d->vendor_id == PCI_VENDOR_ID_INTEL &&
+                d->device_id == PCI_DEVICE_ID_INTEL_82599_SFP_VF) {
+                return 1;
+            }
+            break;
         }
-        break;
     }
     return 0;
 }
@@ -109,6 +129,17 @@ static uint32_t get_throughable_mask(const XenPCIPassthroughState *s,
     return throughable_mask & valid_mask;
 }
 
+static void log_pcie_extended_cap(XenPCIPassthroughState *s,
+                                  const char *cap_name,
+                                  uint32_t base_offset, uint32_t size)
+{
+    if (size) {
+        XEN_PT_LOG(&s->dev, "Found PCIe Extended Capability: %s at 0x%04x, "
+                            "size 0x%x bytes\n", cap_name,
+                            (uint16_t) base_offset, size);
+    }
+}
+
 /****************
  * general register functions
  */
@@ -832,24 +863,18 @@ static XenPTRegInfo xen_pt_emu_reg_vendor[] = {
  * PCI Express Capability
  */
 
-static inline uint8_t get_capability_version(XenPCIPassthroughState *s,
-                                             uint32_t offset)
+static inline uint8_t get_pcie_capability_version(XenPCIPassthroughState *s)
 {
-    uint8_t flag;
-    if (xen_host_pci_get_byte(&s->real_device, offset + PCI_EXP_FLAGS, &flag)) {
-        return 0;
-    }
-    return flag & PCI_EXP_FLAGS_VERS;
+    assert(s->real_device.pcie_flags != 0xFFFF);
+
+    return (uint8_t) (s->real_device.pcie_flags & PCI_EXP_FLAGS_VERS);
 }
 
-static inline uint8_t get_device_type(XenPCIPassthroughState *s,
-                                      uint32_t offset)
+static inline uint8_t get_pcie_device_type(XenPCIPassthroughState *s)
 {
-    uint8_t flag;
-    if (xen_host_pci_get_byte(&s->real_device, offset + PCI_EXP_FLAGS, &flag)) {
-        return 0;
-    }
-    return (flag & PCI_EXP_FLAGS_TYPE) >> 4;
+    assert(s->real_device.pcie_flags != 0xFFFF);
+
+    return (uint8_t) ((s->real_device.pcie_flags & PCI_EXP_FLAGS_TYPE) >> 4);
 }
 
 /* initialize Link Control register */
@@ -857,8 +882,8 @@ static int xen_pt_linkctrl_reg_init(XenPCIPassthroughState *s,
                                     XenPTRegInfo *reg, uint32_t real_offset,
                                     uint32_t *data)
 {
-    uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
-    uint8_t dev_type = get_device_type(s, real_offset - reg->offset);
+    uint8_t cap_ver  = get_pcie_capability_version(s);
+    uint8_t dev_type = get_pcie_device_type(s);
 
     /* no need to initialize in case of Root Complex Integrated Endpoint
      * with cap_ver 1.x
@@ -875,7 +900,7 @@ static int xen_pt_devctrl2_reg_init(XenPCIPassthroughState *s,
                                     XenPTRegInfo *reg, uint32_t real_offset,
                                     uint32_t *data)
 {
-    uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
+    uint8_t cap_ver = get_pcie_capability_version(s);
 
     /* no need to initialize in case of cap_ver 1.x */
     if (cap_ver == 1) {
@@ -890,7 +915,7 @@ static int xen_pt_linkctrl2_reg_init(XenPCIPassthroughState *s,
                                      XenPTRegInfo *reg, uint32_t real_offset,
                                      uint32_t *data)
 {
-    uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
+    uint8_t cap_ver = get_pcie_capability_version(s);
     uint32_t reg_field = 0;
 
     /* no need to initialize in case of cap_ver 1.x */
@@ -913,6 +938,55 @@ static int xen_pt_linkctrl2_reg_init(XenPCIPassthroughState *s,
     return 0;
 }
 
+/* initialize PCI Express Capabilities register */
+static int xen_pt_pcie_capabilities_reg_init(XenPCIPassthroughState *s,
+                                             XenPTRegInfo *reg,
+                                             uint32_t real_offset,
+                                             uint32_t *data)
+{
+    uint8_t dev_type = get_pcie_device_type(s);
+    uint16_t reg_field;
+
+    if (xen_host_pci_get_word(&s->real_device,
+                             real_offset - reg->offset + PCI_EXP_FLAGS,
+                             &reg_field)) {
+        XEN_PT_ERR(&s->dev, "Error reading PCIe Capabilities reg\n");
+        *data = 0;
+        return 0;
+    }
+    /*
+     * Q35 workaround for Win7+ pci.sys PCIe topology check.
+     * As our PT device currently located on a bus 0, fake the
+     * device/port type field to the "Root Complex integrated device"
+     * value to bypass the check
+     */
+    switch (dev_type) {
+    case PCI_EXP_TYPE_ENDPOINT:
+    case PCI_EXP_TYPE_LEG_END:
+        XEN_PT_LOG(&s->dev, "Original PCIe Capabilities reg is 0x%04X\n",
+            reg_field);
+        reg_field &= ~PCI_EXP_FLAGS_TYPE;
+        reg_field |= ((PCI_EXP_TYPE_RC_END /*9*/ << 4) & PCI_EXP_FLAGS_TYPE);
+        XEN_PT_LOG(&s->dev, "Q35 PCIe topology check workaround: "
+                   "faking Capabilities reg to 0x%04X\n", reg_field);
+        break;
+
+    case PCI_EXP_TYPE_ROOT_PORT:
+    case PCI_EXP_TYPE_UPSTREAM:
+    case PCI_EXP_TYPE_DOWNSTREAM:
+    case PCI_EXP_TYPE_PCI_BRIDGE:
+    case PCI_EXP_TYPE_PCIE_BRIDGE:
+    case PCI_EXP_TYPE_RC_END:
+    case PCI_EXP_TYPE_RC_EC:
+    default:
+        /* do nothing, return as is */
+        break;
+    }
+
+    *data = reg_field;
+    return 0;
+}
+
 /* PCI Express Capability Structure reg static information table */
 static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
     /* Next Pointer reg */
@@ -926,6 +1000,17 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
     },
+    /* PCI Express Capabilities Register */
+    {
+        .offset     = PCI_EXP_FLAGS,
+        .size       = 2,
+        .init_val   = 0x0000,
+        .ro_mask    = 0xFFFF,
+        .emu_mask   = 0xFFFF,
+        .init       = xen_pt_pcie_capabilities_reg_init,
+        .u.w.read   = xen_pt_word_reg_read,
+        .u.w.write  = xen_pt_word_reg_write,
+    },
     /* Device Capabilities reg */
     {
         .offset     = PCI_EXP_DEVCAP,
@@ -1564,6 +1649,121 @@ static XenPTRegInfo xen_pt_emu_reg_igd_opregion[] = {
     },
 };
 
+/****************************
+ * Emulated registers for
+ * PCIe Extended Capabilities
+ */
+
+static uint16_t fake_cap_id = XEN_PCIE_FAKE_CAP_ID_BASE;
+
+/* PCIe Extended Capability ID reg */
+static int xen_pt_ext_cap_capid_reg_init(XenPCIPassthroughState *s,
+                                         XenPTRegInfo *reg,
+                                         uint32_t real_offset,
+                                         uint32_t *data)
+{
+    uint16_t reg_field;
+    int rc;
+    XenPTRegGroup *reg_grp_entry = NULL;
+
+    /* use real device register's value as initial value */
+    rc = xen_host_pci_get_word(&s->real_device, real_offset, &reg_field);
+    if (rc) {
+        return rc;
+    }
+
+    reg_grp_entry = xen_pt_find_reg_grp(s, real_offset);
+
+    if (reg_grp_entry) {
+        if (reg_grp_entry->reg_grp->grp_type == XEN_PT_GRP_TYPE_HARDWIRED &&
+            reg_grp_entry->base_offset == PCI_CONFIG_SPACE_SIZE) {
+            /*
+             * This is the situation when we were asked to hide (aka
+             * "hardwire to 0") some PCIe ext capability, but it was located
+             * at offset 0x100 in PCIe config space. In this case we can't
+             * simply exclude it from the linked list of capabilities
+             * (as it is the first entry in the list), so we must fake its
+             * Capability ID in PCIe Extended Capability header, leaving
+             * the Next Ptr field intact while returning zeroes on attempts
+             * to read capability body (writes are ignored).
+             */
+            reg_field = fake_cap_id;
+            /* increment the value in order to have unique Capability IDs */
+            fake_cap_id++;
+        }
+    }
+
+    *data = reg_field;
+    return 0;
+}
+
+/* Vendor-specific Ext Capability Structure reg static information table */
+static XenPTRegInfo xen_pt_ext_cap_emu_reg_vendor[] = {
+    {
+        .offset     = XEN_PCIE_CAP_ID,
+        .size       = 2,
+        .init_val   = 0x0000,
+        .ro_mask    = 0xFFFF,
+        .emu_mask   = 0xFFFF,
+        .init       = xen_pt_ext_cap_capid_reg_init,
+        .u.w.read   = xen_pt_word_reg_read,
+        .u.w.write  = xen_pt_word_reg_write,
+    },
+    {
+        .offset     = XEN_PCIE_CAP_LIST_NEXT,
+        .size       = 2,
+        .init_val   = 0x0000,
+        .ro_mask    = 0xFFFF,
+        .emu_mask   = 0xFFFF,
+        .init       = xen_pt_ext_cap_ptr_reg_init,
+        .u.w.read   = xen_pt_word_reg_read,
+        .u.w.write  = xen_pt_word_reg_write,
+    },
+    {
+        .offset     = PCI_VNDR_HEADER,
+        .size       = 4,
+        .init_val   = 0x00000000,
+        .ro_mask    = 0xFFFFFFFF,
+        .emu_mask   = 0x00000000,
+        .init       = xen_pt_common_reg_init,
+        .u.dw.read  = xen_pt_long_reg_read,
+        .u.dw.write = xen_pt_long_reg_write,
+    },
+    {
+        .size = 0,
+    },
+};
+
+/* Common reg static information table for all passthru-type
+ * PCIe Extended Capabilities. Only Extended Cap ID and
+ * Next pointer are handled (to support capability hiding).
+ */
+static XenPTRegInfo xen_pt_ext_cap_emu_reg_dummy[] = {
+    {
+        .offset     = XEN_PCIE_CAP_ID,
+        .size       = 2,
+        .init_val   = 0x0000,
+        .ro_mask    = 0xFFFF,
+        .emu_mask   = 0xFFFF,
+        .init       = xen_pt_ext_cap_capid_reg_init,
+        .u.w.read   = xen_pt_word_reg_read,
+        .u.w.write  = xen_pt_word_reg_write,
+    },
+    {
+        .offset     = XEN_PCIE_CAP_LIST_NEXT,
+        .size       = 2,
+        .init_val   = 0x0000,
+        .ro_mask    = 0xFFFF,
+        .emu_mask   = 0xFFFF,
+        .init       = xen_pt_ext_cap_ptr_reg_init,
+        .u.w.read   = xen_pt_word_reg_read,
+        .u.w.write  = xen_pt_word_reg_write,
+    },
+    {
+        .size = 0,
+    },
+};
+
 /****************************
  * Capabilities
  */
@@ -1572,7 +1772,7 @@ static XenPTRegInfo xen_pt_emu_reg_igd_opregion[] = {
 
 static int xen_pt_reg_grp_size_init(XenPCIPassthroughState *s,
                                     const XenPTRegGroupInfo *grp_reg,
-                                    uint32_t base_offset, uint8_t *size)
+                                    uint32_t base_offset, uint32_t *size)
 {
     *size = grp_reg->grp_size;
     return 0;
@@ -1580,18 +1780,40 @@ static int xen_pt_reg_grp_size_init(XenPCIPassthroughState *s,
 /* get Vendor Specific Capability Structure register group size */
 static int xen_pt_vendor_size_init(XenPCIPassthroughState *s,
                                    const XenPTRegGroupInfo *grp_reg,
-                                   uint32_t base_offset, uint8_t *size)
+                                   uint32_t base_offset, uint32_t *size)
 {
-    return xen_host_pci_get_byte(&s->real_device, base_offset + 0x02, size);
+    uint8_t sz = 0;
+    int ret = xen_host_pci_get_byte(&s->real_device, base_offset + 0x02, &sz);
+
+    *size = sz;
+    return ret;
+}
+
+static int xen_pt_ext_cap_vendor_size_init(XenPCIPassthroughState *s,
+                                           const XenPTRegGroupInfo *grp_reg,
+                                           uint32_t base_offset,
+                                           uint32_t *size)
+{
+    uint32_t vsec_hdr = 0;
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_VNDR_HEADER,
+                                    &vsec_hdr);
+
+    *size = PCI_VNDR_HEADER_LEN(vsec_hdr);
+
+    log_pcie_extended_cap(s, "Vendor-specific", base_offset, *size);
+
+    return ret;
 }
+
 /* get PCI Express Capability Structure register group size */
 static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
                                  const XenPTRegGroupInfo *grp_reg,
-                                 uint32_t base_offset, uint8_t *size)
+                                 uint32_t base_offset, uint32_t *size)
 {
     PCIDevice *d = PCI_DEVICE(s);
-    uint8_t version = get_capability_version(s, base_offset);
-    uint8_t type = get_device_type(s, base_offset);
+    uint8_t version = get_pcie_capability_version(s);
+    uint8_t type = get_pcie_device_type(s);
     uint8_t pcie_size = 0;
 
 
@@ -1659,7 +1881,7 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
 /* get MSI Capability Structure register group size */
 static int xen_pt_msi_size_init(XenPCIPassthroughState *s,
                                 const XenPTRegGroupInfo *grp_reg,
-                                uint32_t base_offset, uint8_t *size)
+                                uint32_t base_offset, uint32_t *size)
 {
     uint16_t msg_ctrl = 0;
     uint8_t msi_size = 0xa;
@@ -1687,7 +1909,7 @@ static int xen_pt_msi_size_init(XenPCIPassthroughState *s,
 /* get MSI-X Capability Structure register group size */
 static int xen_pt_msix_size_init(XenPCIPassthroughState *s,
                                  const XenPTRegGroupInfo *grp_reg,
-                                 uint32_t base_offset, uint8_t *size)
+                                 uint32_t base_offset, uint32_t *size)
 {
     int rc = 0;
 
@@ -1703,6 +1925,426 @@ static int xen_pt_msix_size_init(XenPCIPassthroughState *s,
 }
 
 
+/* get Advanced Error Reporting Extended Capability register group size */
+#define PCI_ERR_CAP_TLP_PREFIX_LOG      (1U << 11)
+#define PCI_DEVCAP2_END_END_TLP_PREFIX  (1U << 21)
+static int xen_pt_ext_cap_aer_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint8_t dev_type = get_pcie_device_type(s);
+    uint32_t aer_caps = 0;
+    uint32_t sz = 0;
+    int pcie_cap_pos;
+    uint32_t devcaps2;
+    int ret = 0;
+
+    pcie_cap_pos = xen_host_pci_find_next_cap(&s->real_device, 0,
+                                              PCI_CAP_ID_EXP);
+    if (!pcie_cap_pos) {
+        XEN_PT_ERR(&s->dev,
+                   "Cannot find a required PCI Express Capability\n");
+        return -1;
+    }
+
+    if (get_pcie_capability_version(s) > 1) {
+        ret = xen_host_pci_get_long(&s->real_device,
+                                    pcie_cap_pos + PCI_EXP_DEVCAP2,
+                                    &devcaps2);
+        if (ret) {
+            XEN_PT_ERR(&s->dev, "Error while reading Device "
+                       "Capabilities 2 Register \n");
+            return -1;
+        }
+    }
+
+    if (devcaps2 & PCI_DEVCAP2_END_END_TLP_PREFIX) {
+        ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_ERR_CAP,
+                                    &aer_caps);
+        if (ret) {
+            XEN_PT_ERR(&s->dev,
+                       "Error while reading AER Extended Capability\n");
+            return -1;
+        }
+
+        if (aer_caps & PCI_ERR_CAP_TLP_PREFIX_LOG) {
+            sz = 0x48;
+        }
+    }
+
+    if (!sz) {
+        if (dev_type == PCI_EXP_TYPE_ROOT_PORT ||
+            dev_type == PCI_EXP_TYPE_RC_EC) {
+            sz = 0x38;
+        } else {
+            sz = 0x2C;
+        }
+    }
+
+    *size = sz;
+
+    log_pcie_extended_cap(s, "AER", base_offset, *size);
+    return ret;
+}
+
+/* get Root Complex Link Declaration Extended Capability register group size */
+#define RCLD_GET_NUM_ENTRIES(x)     (((x) >> 8) & 0xFF)
+static int xen_pt_ext_cap_rcld_size_init(XenPCIPassthroughState *s,
+                                         const XenPTRegGroupInfo *grp_reg,
+                                         uint32_t base_offset,
+                                         uint32_t *size)
+{
+    uint32_t elem_self_descr = 0;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + 4,
+                                    &elem_self_descr);
+
+    *size = 0x10 + RCLD_GET_NUM_ENTRIES(elem_self_descr) * 0x10;
+
+    log_pcie_extended_cap(s, "Root Complex Link Declaration",
+                          base_offset, *size);
+    return ret;
+}
+
+/* get Access Control Services Extended Capability register group size */
+#define ACS_VECTOR_SIZE_BITS(x)    ((((x) >> 8) & 0xFF) ?: 256)
+static int xen_pt_ext_cap_acs_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint16_t acs_caps = 0;
+
+    int ret = xen_host_pci_get_word(&s->real_device,
+                                    base_offset + PCI_ACS_CAP,
+                                    &acs_caps);
+
+    if (acs_caps & PCI_ACS_EC) {
+        uint32_t vector_sz = ACS_VECTOR_SIZE_BITS(acs_caps);
+
+        *size = PCI_ACS_EGRESS_CTL_V + ((vector_sz + 7) & ~7) / 8;
+    } else {
+        *size = PCI_ACS_EGRESS_CTL_V;
+    }
+
+    log_pcie_extended_cap(s, "ACS", base_offset, *size);
+    return ret;
+}
+
+/* get Multicast Extended Capability register group size */
+static int xen_pt_ext_cap_multicast_size_init(XenPCIPassthroughState *s,
+                                              const XenPTRegGroupInfo *grp_reg,
+                                              uint32_t base_offset,
+                                              uint32_t *size)
+{
+    uint8_t dev_type = get_pcie_device_type(s);
+
+    switch (dev_type) {
+    case PCI_EXP_TYPE_ENDPOINT:
+    case PCI_EXP_TYPE_LEG_END:
+    case PCI_EXP_TYPE_RC_END:
+    case PCI_EXP_TYPE_RC_EC:
+    default:
+        *size = PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF;
+        break;
+
+    case PCI_EXP_TYPE_ROOT_PORT:
+    case PCI_EXP_TYPE_UPSTREAM:
+    case PCI_EXP_TYPE_DOWNSTREAM:
+        *size = 0x30;
+        break;
+    }
+
+    log_pcie_extended_cap(s, "Multicast", base_offset, *size);
+    return 0;
+}
+
+/* get Dynamic Power Allocation Extended Capability register group size */
+static int xen_pt_ext_cap_dpa_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint32_t dpa_caps = 0;
+    uint32_t num_entries;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_DPA_CAP,
+                                    &dpa_caps);
+
+    num_entries = (dpa_caps & PCI_DPA_CAP_SUBSTATE_MASK) + 1;
+
+    *size = PCI_DPA_BASE_SIZEOF + num_entries /*byte-size registers*/;
+
+    log_pcie_extended_cap(s, "Dynamic Power Allocation", base_offset, *size);
+    return ret;
+}
+
+/* get TPH Requester Extended Capability register group size */
+static int xen_pt_ext_cap_tph_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint32_t tph_caps = 0;
+    uint32_t num_entries;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_TPH_CAP,
+                                    &tph_caps);
+
+    switch(tph_caps & PCI_TPH_CAP_LOC_MASK) {
+    case PCI_TPH_LOC_CAP:
+        num_entries = (tph_caps & PCI_TPH_CAP_ST_MASK) >> PCI_TPH_CAP_ST_SHIFT;
+        num_entries++;
+        break;
+
+    case PCI_TPH_LOC_NONE:
+    case PCI_TPH_LOC_MSIX:
+    default:
+        /* not in the capability */
+        num_entries = 0;
+    }
+
+    *size = PCI_TPH_BASE_SIZEOF + num_entries * 2;
+
+    log_pcie_extended_cap(s, "TPH Requester", base_offset, *size);
+    return ret;
+}
+
+/* get Downstream Port Containment Extended Capability register group size */
+static int xen_pt_ext_cap_dpc_size_init(XenPCIPassthroughState *s,
+                                        const XenPTRegGroupInfo *grp_reg,
+                                        uint32_t base_offset,
+                                        uint32_t *size)
+{
+    uint16_t dpc_caps = 0;
+
+    int ret = xen_host_pci_get_word(&s->real_device,
+                                    base_offset + PCI_EXP_DPC_CAP,
+                                    &dpc_caps);
+
+    if (dpc_caps & PCI_EXP_DPC_CAP_RP_EXT) {
+        *size = 0x20 + ((dpc_caps & PCI_EXP_DPC_RP_PIO_LOG_SIZE) >> 8) * 4;
+    } else {
+        *size = 0xC;
+    }
+
+    log_pcie_extended_cap(s, "Downstream Port Containment",
+                          base_offset, *size);
+    return ret;
+}
+
+/* get Protocol Multiplexing Extended Capability register group size */
+#define PMUX_GET_NUM_ENTRIES(x)     ((x) & 0x3F)
+static int xen_pt_ext_cap_pmux_size_init(XenPCIPassthroughState *s,
+                                         const XenPTRegGroupInfo *grp_reg,
+                                         uint32_t base_offset,
+                                         uint32_t *size)
+{
+    uint32_t pmux_caps = 0;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + 4,
+                                    &pmux_caps);
+
+    *size = 0x10 + PMUX_GET_NUM_ENTRIES(pmux_caps) * 4;
+
+    log_pcie_extended_cap(s, "PMUX", base_offset, *size);
+    return ret;
+}
+
+/* get Resizable BAR Extended Capability register group size */
+static int xen_pt_ext_cap_rebar_size_init(XenPCIPassthroughState *s,
+                                          const XenPTRegGroupInfo *grp_reg,
+                                          uint32_t base_offset,
+                                          uint32_t *size)
+{
+    uint32_t rebar_ctl = 0;
+    uint32_t num_entries;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_REBAR_CTRL,
+                                    &rebar_ctl);
+    num_entries =
+        (rebar_ctl & PCI_REBAR_CTRL_NBAR_MASK) >> PCI_REBAR_CTRL_NBAR_SHIFT;
+
+    *size = num_entries*8 + 4;
+
+    log_pcie_extended_cap(s, "Resizable BAR", base_offset, *size);
+    return ret;
+}
+
+/* get VC/VC9/MFVC Extended Capability register group size */
+static uint32_t get_arb_table_len_max(XenPCIPassthroughState *s,
+                                      uint32_t max_bit_supported,
+                                      uint32_t arb_cap)
+{
+    int n_bit;
+    uint32_t table_max_size = 0;
+
+    if (!arb_cap) {
+        return 0;
+    }
+
+    for (n_bit = 7; n_bit >= 0 && !(arb_cap & (1 << n_bit)); n_bit--);
+
+    if (n_bit > max_bit_supported) {
+        XEN_PT_ERR(&s->dev, "Warning: encountered unknown VC arbitration "
+                   "capability supported: 0x%02x\n", (uint8_t) arb_cap);
+    }
+
+    switch (n_bit) {
+    case 0: break;
+    case 1: return 32;
+    case 2: return 64;
+    case 3: /*128 too*/
+    case 4: return 128;
+    default:
+        table_max_size = 8 << n_bit;
+    }
+
+    return table_max_size;
+}
+
+#define GET_ARB_TABLE_OFFSET(x)           (((x) >> 24) * 0x10)
+#define GET_VC_ARB_CAPABILITY(x)          ((x) & 0xFF)
+#define ARB_TABLE_ENTRY_SIZE_BITS(x)      (1 << (((x) & PCI_VC_CAP1_ARB_SIZE)\
+                                          >> 10))
+static int xen_pt_ext_cap_vchan_size_init(XenPCIPassthroughState *s,
+                                          const XenPTRegGroupInfo *grp_reg,
+                                          uint32_t base_offset,
+                                          uint32_t *size)
+{
+    uint32_t header;
+    uint32_t vc_cap_max_size = PCIE_CONFIG_SPACE_SIZE - base_offset;
+    uint32_t next_ptr;
+    uint32_t arb_table_start_max = 0, arb_table_end_max = 0;
+    uint32_t port_vc_cap1, port_vc_cap2, vc_rsrc_cap;
+    uint32_t ext_vc_count = 0;
+    uint32_t arb_table_entry_size;  /* in bits */
+    const char *cap_name;
+    int ret;
+    int i;
+
+    ret = xen_host_pci_get_long(&s->real_device, base_offset, &header);
+    if (ret) {
+        goto err_read;
+    }
+
+    next_ptr = PCI_EXT_CAP_NEXT(header);
+
+    switch (PCI_EXT_CAP_ID(header)) {
+    case PCI_EXT_CAP_ID_VC:
+    case PCI_EXT_CAP_ID_VC9:
+        cap_name = "Virtual Channel";
+        break;
+    case PCI_EXT_CAP_ID_MFVC:
+        cap_name = "Multi-Function VC";
+        break;
+    default:
+        XEN_PT_ERR(&s->dev, "Unknown VC Extended Capability ID "
+                   "encountered: 0x%04x\n", PCI_EXT_CAP_ID(header));
+        return -1;
+    }
+
+    if (next_ptr && next_ptr > base_offset) {
+        vc_cap_max_size = next_ptr - base_offset;
+    }
+
+    ret = xen_host_pci_get_long(&s->real_device,
+                                base_offset + PCI_VC_PORT_CAP1,
+                                &port_vc_cap1);
+    if (ret) {
+        goto err_read;
+    }
+
+    ret = xen_host_pci_get_long(&s->real_device,
+                                base_offset + PCI_VC_PORT_CAP2,
+                                &port_vc_cap2);
+    if (ret) {
+        goto err_read;
+    }
+
+    ext_vc_count = port_vc_cap1 & PCI_VC_CAP1_EVCC;
+
+    arb_table_start_max = GET_ARB_TABLE_OFFSET(port_vc_cap2);
+
+    /* check arbitration table offset for validity */
+    if (arb_table_start_max >= vc_cap_max_size) {
+        XEN_PT_ERR(&s->dev, "Warning: VC arbitration table offset points "
+                   "outside the expected range: %#04x\n",
+                   (uint16_t) arb_table_start_max);
+        /* skip this arbitration table */
+        arb_table_start_max = 0;
+    }
+
+    if (arb_table_start_max) {
+        uint32_t vc_arb_cap = GET_VC_ARB_CAPABILITY(port_vc_cap2);
+        uint32_t num_phases = get_arb_table_len_max(s, 3, vc_arb_cap);
+        uint32_t arb_tbl_sz = QEMU_ALIGN_UP(num_phases * 4, 32) / 8;
+
+        arb_table_end_max = base_offset + arb_table_start_max + arb_tbl_sz;
+    }
+
+    /* get Function/Port Arbitration Table Entry size */
+    arb_table_entry_size = ARB_TABLE_ENTRY_SIZE_BITS(port_vc_cap1);
+
+    /* process all VC Resource entries */
+    for (i = 0; i < ext_vc_count; i++) {
+        uint32_t arb_table_offset;
+
+        /* read VC Resource Capability */
+        ret = xen_host_pci_get_long(&s->real_device,
+            base_offset + PCI_VC_RES_CAP + i * PCI_CAP_VC_PER_VC_SIZEOF,
+            &vc_rsrc_cap);
+        if (ret) {
+            goto err_read;
+        }
+
+        arb_table_offset = GET_ARB_TABLE_OFFSET(vc_rsrc_cap);
+
+        if (arb_table_offset > arb_table_start_max) {
+            /* check arbitration table offset for validity */
+            if (arb_table_offset >= vc_cap_max_size) {
+                XEN_PT_ERR(&s->dev, "Warning: Port/Function arbitration table "
+                           "offset points outside the expected range: %#04x\n",
+                           (uint16_t) arb_table_offset);
+                /* skip this arbitration table */
+                arb_table_offset = 0;
+            } else {
+                arb_table_start_max = arb_table_offset;
+            }
+
+            if (arb_table_offset) {
+                uint32_t vc_arb_cap = GET_VC_ARB_CAPABILITY(vc_rsrc_cap);
+                uint32_t num_phases = get_arb_table_len_max(s, 5, vc_arb_cap);
+                uint32_t arb_tbl_sz =
+                    QEMU_ALIGN_UP(num_phases * arb_table_entry_size, 32) / 8;
+
+                arb_table_end_max = base_offset + arb_table_offset + arb_tbl_sz;
+            }
+        }
+    }
+
+    if (arb_table_end_max) {
+        *size = arb_table_end_max - base_offset;
+    } else {
+        *size = PCI_CAP_VC_BASE_SIZEOF +
+                ext_vc_count * PCI_CAP_VC_PER_VC_SIZEOF;
+    }
+
+    log_pcie_extended_cap(s, cap_name, base_offset, *size);
+    return 0;
+
+err_read:
+    XEN_PT_ERR(&s->dev, "Error while reading VC Extended Capability\n");
+    return ret;
+}
+
 static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
     /* Header Type0 reg group */
     {
@@ -1810,6 +2452,261 @@ static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
         .size_init   = xen_pt_reg_grp_size_init,
         .emu_regs    = xen_pt_emu_reg_igd_opregion,
     },
+    /* Vendor-specific Extended Capability reg group */
+    {
+        .grp_id      = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_VNDR),
+        .grp_type    = XEN_PT_GRP_TYPE_EMU,
+        .grp_size    = 0xFF,
+        .size_init   = xen_pt_ext_cap_vendor_size_init,
+        .emu_regs    = xen_pt_ext_cap_emu_reg_vendor,
+    },
+    /* Device Serial Number Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_DSN),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_DSN_SIZEOF,       /*0x0C*/
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Power Budgeting Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PWR),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_PWR_SIZEOF,       /*0x10*/
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Root Complex Internal Link Control Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_RCILC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x0C,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Root Complex Event Collector Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_RCEC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x08,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Root Complex Register Block Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_RCRB),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x14,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Configuration Access Correlation Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_CAC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x08,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Alternate Routing ID Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_ARI),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_ARI_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Address Translation Services Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_ATS),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_ATS_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Single Root I/O Virtualization Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_SRIOV),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_SRIOV_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Page Request Interface Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PRI),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_PRI_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Latency Tolerance Reporting Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_LTR),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_LTR_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Secondary PCIe Capability Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_SECPCI),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x10,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Process Address Space ID Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PASID),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = PCI_EXT_CAP_PASID_SIZEOF,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* L1 PM Substates Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_L1SS),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x10,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Precision Time Measurement Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PTM),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x0C,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* M-PCIe Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(0x20),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x1C,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* LN Requester (LNR) Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(0x1C),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x08,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Function Readiness Status (FRS) Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(0x21),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x10,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Readiness Time Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(0x22),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0x0C,
+        .size_init  = xen_pt_reg_grp_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Advanced Error Reporting Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_ERR),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_aer_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Root Complex Link Declaration Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_RCLD),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_rcld_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Access Control Services Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_ACS),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_acs_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Multicast Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_MCAST),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_multicast_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Dynamic Power Allocation Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_DPA),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_dpa_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* TPH Requester Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_TPH),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_tph_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Protocol Multiplexing Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_PMUX),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_pmux_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Downstream Port Containment Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_DPC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_dpc_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Resizable BAR Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_REBAR),
+        .grp_type   = XEN_PT_GRP_TYPE_HARDWIRED,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_rebar_size_init,
+    },
+    /* Virtual Channel Extended Capability reg group (2) */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_VC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_vchan_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Virtual Channel Extended Capability reg group (9) */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_VC9),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_vchan_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
+    /* Multi-Function Virtual Channel Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_MFVC),
+        .grp_type   = XEN_PT_GRP_TYPE_EMU,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_vchan_size_init,
+        .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
+    },
     {
         .grp_size = 0,
     },
@@ -1865,51 +2762,91 @@ out:
     return 0;
 }
 
+#define PCIE_EXT_CAP_NEXT_SHIFT 4
+#define PCIE_EXT_CAP_VER_MASK   0xF
 
-/*************
- * Main
- */
-
-static uint8_t find_cap_offset(XenPCIPassthroughState *s, uint8_t cap)
+static int xen_pt_ext_cap_ptr_reg_init(XenPCIPassthroughState *s,
+                                       XenPTRegInfo *reg,
+                                       uint32_t real_offset,
+                                       uint32_t *data)
 {
-    uint8_t id;
-    unsigned max_cap = XEN_PCI_CAP_MAX;
-    uint8_t pos = PCI_CAPABILITY_LIST;
-    uint8_t status = 0;
+    int i, rc;
+    XenHostPCIDevice *d = &s->real_device;
+    uint16_t reg_field;
+    uint16_t cur_offset, version, cap_id;
+    uint32_t header;
 
-    if (xen_host_pci_get_byte(&s->real_device, PCI_STATUS, &status)) {
-        return 0;
-    }
-    if ((status & PCI_STATUS_CAP_LIST) == 0) {
-        return 0;
+    if (real_offset < 0x0010) {
+        XEN_PT_ERR(&s->dev, "Incorrect PCIe extended capability offset "
+                   "encountered: 0x%04x\n", real_offset);
+        return -EINVAL;
     }
 
-    while (max_cap--) {
-        if (xen_host_pci_get_byte(&s->real_device, pos, &pos)) {
-            break;
-        }
-        if (pos < PCI_CONFIG_HEADER_SIZE) {
-            break;
-        }
+    rc = xen_host_pci_get_word(d, real_offset, &reg_field);
+    if (rc)
+        return rc;
 
-        pos &= ~3;
-        if (xen_host_pci_get_byte(&s->real_device,
-                                  pos + PCI_CAP_LIST_ID, &id)) {
-            break;
-        }
+    /* preserve version field */
+    version    = reg_field & PCIE_EXT_CAP_VER_MASK;
+    cur_offset = reg_field >> PCIE_EXT_CAP_NEXT_SHIFT;
 
-        if (id == 0xff) {
-            break;
+    while (cur_offset && cur_offset != 0xFFF) {
+        rc = xen_host_pci_get_long(d, cur_offset, &header);
+        if (rc) {
+            XEN_PT_ERR(&s->dev, "Failed to read PCIe extended capability "
+                       "@0x%x (rc:%d)\n", cur_offset, rc);
+            return rc;
         }
-        if (id == cap) {
-            return pos;
+
+        cap_id = PCI_EXT_CAP_ID(header);
+
+        for (i = 0; xen_pt_emu_reg_grps[i].grp_size != 0; i++) {
+            uint32_t cur_grp_id = xen_pt_emu_reg_grps[i].grp_id;
+
+            if (!IS_PCIE_EXT_CAP_ID(cur_grp_id))
+                continue;
+
+            if (xen_pt_hide_dev_cap(d, cur_grp_id))
+                continue;
+
+            if (GET_PCIE_EXT_CAP_ID(cur_grp_id) == cap_id) {
+                if (xen_pt_emu_reg_grps[i].grp_type == XEN_PT_GRP_TYPE_EMU)
+                    goto out;
+
+                /* skip TYPE_HARDWIRED capability, move the ptr to next one */
+                break;
+            }
         }
 
-        pos += PCI_CAP_LIST_NEXT;
+        /* next capability */
+        cur_offset = PCI_EXT_CAP_NEXT(header);
     }
+
+out:
+    *data = (cur_offset << PCIE_EXT_CAP_NEXT_SHIFT) | version;
     return 0;
 }
 
+/*************
+ * Main
+ */
+
+static uint8_t find_cap_offset(XenPCIPassthroughState *s, uint32_t cap)
+{
+    uint32_t retval = 0;
+
+    if (IS_PCIE_EXT_CAP_ID(cap)) {
+        if (s->pcie_enabled_dev) {
+            retval = xen_host_pci_find_next_ext_cap(&s->real_device, 0,
+                                                    GET_PCIE_EXT_CAP_ID(cap));
+        }
+
+    } else {
+        retval = xen_host_pci_find_next_cap(&s->real_device, 0, cap);
+    }
+    return retval;
+}
+
 static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
                                    XenPTRegGroup *reg_grp, XenPTRegInfo *reg,
                                    Error **errp)
@@ -2065,7 +3002,13 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
             }
         }
 
-        if (xen_pt_emu_reg_grps[i].grp_type == XEN_PT_GRP_TYPE_EMU) {
+        if (xen_pt_emu_reg_grps[i].grp_type == XEN_PT_GRP_TYPE_EMU ||
+            /*
+             * We need to always emulate the PCIe Extended Capability
+             * header for a hidden capability which starts at offset 0x100
+             */
+            (xen_pt_emu_reg_grps[i].grp_type == XEN_PT_GRP_TYPE_HARDWIRED &&
+            reg_grp_offset == 0x100)) {
             if (xen_pt_emu_reg_grps[i].emu_regs) {
                 int j = 0;
                 XenPTRegInfo *regs = xen_pt_emu_reg_grps[i].emu_regs;
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 2faf7f0cae..903560f72c 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -27,6 +27,7 @@
 #include "hw/acpi/pcihp.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/acpi/ich9_tco.h"
 
 #define ACPI_PCIHP_ADDR_ICH9 0x0cc0
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index ef59810c17..d35a517c9e 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -72,6 +72,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 /* Called on reset */
 void acpi_pcihp_reset(AcpiPciHpState *s);
 
+void acpi_set_pci_info(bool has_bridge_hotplug);
+
 void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus);
 
 extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a385010909..0b021f0764 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -339,6 +339,7 @@ struct MachineState {
     bool mem_merge;
     bool usb;
     bool usb_disabled;
+    bool xen_platform_dev;
     char *firmware;
     bool iommu;
     bool suppress_vmdesc;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c661e9cc80..550f8fa221 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -196,6 +196,9 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+/* q35.c */
+PCIBus *find_q35(void);
+
 extern GlobalProperty pc_compat_8_0[];
 extern const size_t pc_compat_8_0_len;
 
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index e89329c51e..441cce6ccd 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -105,8 +105,8 @@ struct Q35PCIHost {
 #define MCH_HOST_BRIDGE_PCIEXBAR_DEFAULT       0xb0000000
 #define MCH_HOST_BRIDGE_PCIEXBAR_MAX           (0x10000000) /* 256M */
 #define MCH_HOST_BRIDGE_PCIEXBAR_ADMSK         Q35_MASK(64, 35, 28)
-#define MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK      ((uint64_t)(1 << 26))
-#define MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK       ((uint64_t)(1 << 25))
+#define MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK      ((uint64_t)(1 << 27))
+#define MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK       ((uint64_t)(1 << 26))
 #define MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_MASK   ((uint64_t)(0x3 << 1))
 #define MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_256M   ((uint64_t)(0x0 << 1))
 #define MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_128M   ((uint64_t)(0x1 << 1))
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index e6d0574a29..c53e21082a 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -343,6 +343,9 @@ void pci_for_each_device_under_bus(PCIBus *bus,
 void pci_for_each_device_under_bus_reverse(PCIBus *bus,
                                            pci_bus_dev_fn fn,
                                            void *opaque);
+void pci_function_for_one_bus(PCIBus *bus,
+                         void (*fn)(PCIBus *bus, PCIDevice *d, void *opaque),
+                         void *opaque);
 void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
                                   pci_bus_fn end, void *parent_state);
 PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
diff --git a/include/hw/southbridge/ich9.h b/include/hw/southbridge/ich9.h
index fd01649d04..07b84d5227 100644
--- a/include/hw/southbridge/ich9.h
+++ b/include/hw/southbridge/ich9.h
@@ -130,6 +130,7 @@ struct ICH9LPCState {
 
 #define ICH9_A2_LPC_REVISION                    0x2
 #define ICH9_LPC_NB_PIRQS                       8       /* PCI A-H */
+#define ICH9_XEN_NUM_IRQ_SOURCES                128
 
 #define ICH9_LPC_PMBASE                         0x40
 #define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       ICH9_MASK(32, 15, 7)
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 2bd8ec742d..a2c3d98eaa 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -37,9 +37,9 @@ extern uint32_t xen_domid;
 extern enum xen_mode xen_mode;
 extern bool xen_domid_restrict;
 
-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
+int xen_cmn_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
-void xen_piix3_set_irq(void *opaque, int irq_num, int level);
+void xen_cmn_set_irq(void *opaque, int irq_num, int level);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
diff --git a/qemu-options.hx b/qemu-options.hx
index b37eb9662b..ea018257da 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
+    "                xen-platform-dev=on|off controls Xen Platform device (default=off)\n"
     "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
     "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index c9237cb5d4..943e7db0dd 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -26,7 +26,6 @@
 #include "qemu/datadir.h"
 #include "qemu/cutils.h"
 #include "trace.h"
-
 static const char *data_dir[16];
 static int data_dir_idx;
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b8d2c4dadd..c458a03cd0 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -43,6 +43,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/clock.h"
 #include "hw/boards.h"
+#include "sysemu/xen.h"
 
 /*
  * Aliases were a bad idea from the start.  Let's keep them
@@ -663,7 +664,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
         return NULL;
     }
 
-    if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
+    if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus) && !xen_enabled()) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         return NULL;
     }
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 34a22f2ad7..f06fbf48c8 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -10,12 +10,12 @@
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-x86.h"
 
-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+int xen_cmn_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     return -1;
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_cmn_set_irq(void *opaque, int irq_num, int level)
 {
 }
 
-- 
2.34.1


