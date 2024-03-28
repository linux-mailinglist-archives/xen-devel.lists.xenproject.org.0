Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019968904A4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699083.1091626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsKY-0007Ik-Na; Thu, 28 Mar 2024 16:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699083.1091626; Thu, 28 Mar 2024 16:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsKY-0007HB-JT; Thu, 28 Mar 2024 16:10:18 +0000
Received: by outflank-mailman (input) for mailman id 699083;
 Thu, 28 Mar 2024 16:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps70-0001AK-Ev
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:56:18 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b668fd9e-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:56:17 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-513ccc70a6dso1820969e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:56:17 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 z1-20020a170906668100b00a474b7bbc76sm886773ejo.56.2024.03.28.08.56.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:56:16 -0700 (PDT)
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
X-Inumbo-ID: b668fd9e-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641377; x=1712246177; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1jNCFtYZSmUOBchzYP/5PRkNu6FHAH8wzcx932FlSY=;
        b=EnaYBR8QzWipKM3eSIDrpfuOaiM8XXi6t/yfp5CwmfQmz0eRBAb+c+F9aaZGDPChM3
         s+WJBI5fmM/UsErX487wD4t04BKZF2JriYLmcwEq6Qv8vvCsgjXp95GOvum9SFNp6HN+
         wHZh6sLN9cERnHueMgL/sVCwcRVGmMX1rP/KijDjjkz6ZzdzzYvLKgTC2DZAOL3ozqTE
         kXbuiVdGiOIjg+D7n8wUW4iSa8nfJvcsC8uq/KU3jeEa9WPSAl8eHoEw/DqQweplx/N6
         b5kANDtPnfczJq0Zwa5I+gjp3KuHCxqTB/QgX8pFdf9xIxHa7uHs9ubiELehG00L3TkJ
         aqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641377; x=1712246177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1jNCFtYZSmUOBchzYP/5PRkNu6FHAH8wzcx932FlSY=;
        b=I+E8ZEd7ZwpVY92fHDRtTEvQkXgEPKTwoBeW3GsAMnoNMfpv5mDEySfP9b3rA8Rxco
         FLmF4MaA3zeUmERn/MeKyPDASMMq1hXZUcHWpfIawon6BKTaKTexpgsnXe4WihwIiFIi
         ZywW+p26XQgmb+jEih3Y6wJd1SAR3Flma128wZfTaz3dHzualQojpRfINUEtxmVouLGU
         Slx4Lq5Q057OtJsyCXMy0ZwOIXecKuB2FmeZTgCEhFfkDKe8HFzRMcax3Hw7POR4nOnL
         fuReGtRI+klbtRDvDVuZW9XddNQu7jUyPjsmiIX32wBFkVoKJJc3+kdxny3n0lprZZ6N
         YyFg==
X-Forwarded-Encrypted: i=1; AJvYcCUA3r2OnEEmUQB7bkym5uN2z0aLyC6uNUVbZxrHaouoTfhRoqEeWPitmGnJkFIeQEecfehagz56LJDiXeZtWFB6ClZrV5enV4uVrwHCm9M=
X-Gm-Message-State: AOJu0YxIfYNxrb1DsBADCZJl/llhPi71Fer28/g7SOhiZwOaFjWBMsEV
	cBj8/IWtezdhtvKDuheLc7r2boVCcmd2yz+Do2tM91Nf6MMeMBxqqWznA3i/zQk=
X-Google-Smtp-Source: AGHT+IHXj5Yz165xDmy5t4NF8sNvW6bTjTmkAtHF7KcewPKZsVQV788UJXIfXnYu/c9dgv0TxzoB4g==
X-Received: by 2002:a05:6512:110a:b0:515:c882:c44a with SMTP id l10-20020a056512110a00b00515c882c44amr2329607lfg.39.1711641377096;
        Thu, 28 Mar 2024 08:56:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 15/29] hw/i386/pc: Move FW/pflash related fields to PcPciMachineState
Date: Thu, 28 Mar 2024 16:54:23 +0100
Message-ID: <20240328155439.58719-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only PCI-based machines use the set of parallel flash devices.
Move the fields from PCMachineState to PcPciMachineState.
Directly pass a PcPciMachineState argument to the
pc_system_flash/fw methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 10 ++++----
 hw/i386/pc.c         | 25 +++++++++---------
 hw/i386/pc_piix.c    |  3 ++-
 hw/i386/pc_sysfw.c   | 60 +++++++++++++++++++-------------------------
 4 files changed, 45 insertions(+), 53 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 67f8f4730b..668347c248 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -30,7 +30,6 @@ typedef struct PCMachineState {
     /* Pointers to devices and objects: */
     PCIBus *pcibus;
     I2CBus *smbus;
-    PFlashCFI01 *flash[2];
     ISADevice *pcspk;
     DeviceState *iommu;
     BusState *idebus[MAX_IDE_BUS];
@@ -47,7 +46,6 @@ typedef struct PCMachineState {
     bool i8042_enabled;
     bool default_bus_bypass_iommu;
     bool fd_bootchk;
-    uint64_t max_fw_size;
 
     /* ACPI Memory hotplug IO base address */
     hwaddr memhp_io_base;
@@ -61,7 +59,9 @@ typedef struct PcPciMachineState {
     Notifier machine_done;
 
     bool acpi_build_enabled;
+    uint64_t max_fw_size;
 
+    PFlashCFI01 *flash[2];
     CXLState cxl_devices_state;
 } PcPciMachineState;
 
@@ -184,9 +184,9 @@ void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 #define TYPE_PORT92 "port92"
 
 /* pc_sysfw.c */
-void pc_system_flash_create(PCMachineState *pcms);
-void pc_system_flash_cleanup_unused(PCMachineState *pcms);
-void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
+void pc_system_flash_create(PcPciMachineState *ppms);
+void pc_system_flash_cleanup_unused(PcPciMachineState *ppms);
+void pc_system_firmware_init(PcPciMachineState *ppms, MemoryRegion *rom_memory);
 bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len);
 void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 33724791fd..5753a3ff0b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -957,7 +957,7 @@ void pc_memory_init(PCMachineState *pcms,
 
     /* Initialize PC system firmware */
     if (pci_enabled) {
-        pc_system_firmware_init(pcms, rom_memory);
+        pc_system_firmware_init(ppms, rom_memory);
     } else {
         x86_bios_rom_init(machine, "bios.bin", rom_memory, true);
     }
@@ -1617,8 +1617,8 @@ static void pc_machine_get_max_fw_size(Object *obj, Visitor *v,
                                        const char *name, void *opaque,
                                        Error **errp)
 {
-    PCMachineState *pcms = PC_MACHINE(obj);
-    uint64_t value = pcms->max_fw_size;
+    PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
+    uint64_t value = ppms->max_fw_size;
 
     visit_type_size(v, name, &value, errp);
 }
@@ -1627,7 +1627,7 @@ static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
                                        const char *name, void *opaque,
                                        Error **errp)
 {
-    PCMachineState *pcms = PC_MACHINE(obj);
+    PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
     uint64_t value;
 
     if (!visit_type_size(v, name, &value, errp)) {
@@ -1651,7 +1651,7 @@ static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
         return;
     }
 
-    pcms->max_fw_size = value;
+    ppms->max_fw_size = value;
 }
 
 
@@ -1672,7 +1672,6 @@ static void pc_machine_initfn(Object *obj)
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
     pcms->i8042_enabled = true;
-    pcms->max_fw_size = 8 * MiB;
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
 #endif
@@ -1692,8 +1691,9 @@ static void pc_pci_machine_initfn(Object *obj)
     PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
 
     ppms->acpi_build_enabled = true;
+    ppms->max_fw_size = 8 * MiB;
 
-    pc_system_flash_create(PC_MACHINE(obj));
+    pc_system_flash_create(ppms);
     cxl_machine_init(obj, &ppms->cxl_devices_state);
 
     ppms->machine_done.notify = pc_pci_machine_done;
@@ -1815,12 +1815,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         pc_machine_get_default_bus_bypass_iommu,
         pc_machine_set_default_bus_bypass_iommu);
 
-    object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
-        pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
-        NULL, NULL);
-    object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
-        "Maximum combined firmware size");
-
     object_class_property_add(oc, PC_MACHINE_SMBIOS_EP, "str",
         pc_machine_get_smbios_ep, pc_machine_set_smbios_ep,
         NULL, NULL);
@@ -1834,6 +1828,11 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
 
 static void pc_pci_machine_class_init(ObjectClass *oc, void *data)
 {
+    object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
+                              pc_machine_get_max_fw_size,
+                              pc_machine_set_max_fw_size, NULL, NULL);
+    object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
+                                          "Maximum combined firmware size");
 }
 
 bool pc_machine_is_pci_enabled(PCMachineState *pcms)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7aa2598e10..6b3403d0bd 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -118,6 +118,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
     ram_addr_t lowmem;
     uint64_t hole64_size = 0;
     bool pci_enabled = pc_machine_is_pci_enabled(pcms);
+    PcPciMachineState *ppms = pci_enabled ? PC_PCI_MACHINE(pcms) : NULL;
 
     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
@@ -228,7 +229,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
         assert(machine->ram_size == x86ms->below_4g_mem_size +
                                     x86ms->above_4g_mem_size);
 
-        pc_system_flash_cleanup_unused(pcms);
+        pc_system_flash_cleanup_unused(ppms);
         if (machine->kernel_filename != NULL) {
             /* For xen HVM direct kernel boot, load linux here */
             xen_load_linux(pcms);
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 167ff24fcb..54d15afa49 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -71,7 +71,7 @@ static void pc_isa_bios_init(MemoryRegion *rom_memory,
     memory_region_set_readonly(isa_bios, true);
 }
 
-static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
+static PFlashCFI01 *pc_pflash_create(PcPciMachineState *ppms,
                                      const char *name,
                                      const char *alias_prop_name)
 {
@@ -80,8 +80,8 @@ static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
     qdev_prop_set_uint64(dev, "sector-length", FLASH_SECTOR_SIZE);
     qdev_prop_set_uint8(dev, "width", 1);
     qdev_prop_set_string(dev, "name", name);
-    object_property_add_child(OBJECT(pcms), name, OBJECT(dev));
-    object_property_add_alias(OBJECT(pcms), alias_prop_name,
+    object_property_add_child(OBJECT(ppms), name, OBJECT(dev));
+    object_property_add_alias(OBJECT(ppms), alias_prop_name,
                               OBJECT(dev), "drive");
     /*
      * The returned reference is tied to the child property and
@@ -91,28 +91,24 @@ static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
     return PFLASH_CFI01(dev);
 }
 
-void pc_system_flash_create(PCMachineState *pcms)
+void pc_system_flash_create(PcPciMachineState *ppms)
 {
-    assert(pc_machine_is_pci_enabled(pcms));
-
-    pcms->flash[0] = pc_pflash_create(pcms, "system.flash0", "pflash0");
-    pcms->flash[1] = pc_pflash_create(pcms, "system.flash1", "pflash1");
+    ppms->flash[0] = pc_pflash_create(ppms, "system.flash0", "pflash0");
+    ppms->flash[1] = pc_pflash_create(ppms, "system.flash1", "pflash1");
 }
 
-void pc_system_flash_cleanup_unused(PCMachineState *pcms)
+void pc_system_flash_cleanup_unused(PcPciMachineState *ppms)
 {
     char *prop_name;
     int i;
 
-    assert(pc_machine_is_pci_enabled(pcms));
-
-    for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        if (!qdev_is_realized(DEVICE(pcms->flash[i]))) {
+    for (i = 0; i < ARRAY_SIZE(ppms->flash); i++) {
+        if (!qdev_is_realized(DEVICE(ppms->flash[i]))) {
             prop_name = g_strdup_printf("pflash%d", i);
-            object_property_del(OBJECT(pcms), prop_name);
+            object_property_del(OBJECT(ppms), prop_name);
             g_free(prop_name);
-            object_unparent(OBJECT(pcms->flash[i]));
-            pcms->flash[i] = NULL;
+            object_unparent(OBJECT(ppms->flash[i]));
+            ppms->flash[i] = NULL;
         }
     }
 }
@@ -130,7 +126,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
  * pc_isa_bios_init().  Merging several flash devices for isa-bios is
  * not supported.
  */
-static void pc_system_flash_map(PCMachineState *pcms,
+static void pc_system_flash_map(PcPciMachineState *ppms,
                                 MemoryRegion *rom_memory)
 {
     hwaddr total_size = 0;
@@ -142,10 +138,8 @@ static void pc_system_flash_map(PCMachineState *pcms,
     void *flash_ptr;
     int flash_size;
 
-    assert(pc_machine_is_pci_enabled(pcms));
-
-    for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        system_flash = pcms->flash[i];
+    for (i = 0; i < ARRAY_SIZE(ppms->flash); i++) {
+        system_flash = ppms->flash[i];
         blk = pflash_cfi01_get_blk(system_flash);
         if (!blk) {
             break;
@@ -166,10 +160,10 @@ static void pc_system_flash_map(PCMachineState *pcms,
         }
         if ((hwaddr)size != size
             || total_size > HWADDR_MAX - size
-            || total_size + size > pcms->max_fw_size) {
+            || total_size + size > ppms->max_fw_size) {
             error_report("combined size of system firmware exceeds "
                          "%" PRIu64 " bytes",
-                         pcms->max_fw_size);
+                         ppms->max_fw_size);
             exit(1);
         }
 
@@ -194,23 +188,21 @@ static void pc_system_flash_map(PCMachineState *pcms,
     }
 }
 
-void pc_system_firmware_init(PCMachineState *pcms,
+void pc_system_firmware_init(PcPciMachineState *ppms,
                              MemoryRegion *rom_memory)
 {
     int i;
-    BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
-
-    assert(pc_machine_is_pci_enabled(pcms));
+    BlockBackend *pflash_blk[ARRAY_SIZE(ppms->flash)];
 
     /* Map legacy -drive if=pflash to machine properties */
-    for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        pflash_cfi01_legacy_drive(pcms->flash[i],
+    for (i = 0; i < ARRAY_SIZE(ppms->flash); i++) {
+        pflash_cfi01_legacy_drive(ppms->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
-        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
+        pflash_blk[i] = pflash_cfi01_get_blk(ppms->flash[i]);
     }
 
     /* Reject gaps */
-    for (i = 1; i < ARRAY_SIZE(pcms->flash); i++) {
+    for (i = 1; i < ARRAY_SIZE(ppms->flash); i++) {
         if (pflash_blk[i] && !pflash_blk[i - 1]) {
             error_report("pflash%d requires pflash%d", i, i - 1);
             exit(1);
@@ -219,7 +211,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     if (!pflash_blk[0]) {
         /* Machine property pflash0 not set, use ROM mode */
-        x86_bios_rom_init(MACHINE(pcms), "bios.bin", rom_memory, false);
+        x86_bios_rom_init(MACHINE(ppms), "bios.bin", rom_memory, false);
     } else {
         if (kvm_enabled() && !kvm_readonly_mem_enabled()) {
             /*
@@ -231,10 +223,10 @@ void pc_system_firmware_init(PCMachineState *pcms,
             exit(1);
         }
 
-        pc_system_flash_map(pcms, rom_memory);
+        pc_system_flash_map(ppms, rom_memory);
     }
 
-    pc_system_flash_cleanup_unused(pcms);
+    pc_system_flash_cleanup_unused(ppms);
 }
 
 void x86_firmware_configure(void *ptr, int size)
-- 
2.41.0


