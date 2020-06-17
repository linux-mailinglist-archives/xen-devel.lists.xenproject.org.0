Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F31FCD6A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:29:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXBx-00071x-R3; Wed, 17 Jun 2020 12:29:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UiE7=76=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jlXBw-00070A-8l
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:29:20 +0000
X-Inumbo-ID: 2990f3a7-b096-11ea-b9d6-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2990f3a7-b096-11ea-b9d6-12813bfff9fa;
 Wed, 17 Jun 2020 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592396957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7m5RRVrZvMI+hYy8ktqweMxRA2Yf3dzvRQTzQqdINX4=;
 b=fXfNxl0O8/tOFbMGgTgfqOfHgRIvIaQg9GkDwFDWiAXVHs0tTUvaHIapS6x6KKqgSMTAro
 RZscUHWJ+eDa+LG8p45/ZqUiI2Md7oH4MUem81rZm313/Cc997HFswusTdS1I0m36LLxVA
 nxfP6NfWBaOToW1303eIx/qNynUlyYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-sth5Ug6LM0eMfV0zwjpDBA-1; Wed, 17 Jun 2020 08:29:13 -0400
X-MC-Unique: sth5Ug6LM0eMfV0zwjpDBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E57E188362E;
 Wed, 17 Jun 2020 12:29:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50D7C7BA19;
 Wed, 17 Jun 2020 12:29:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BEC2A1753D; Wed, 17 Jun 2020 14:29:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] x86: move max-ram-below-4g to pc
Date: Wed, 17 Jun 2020 14:29:00 +0200
Message-Id: <20200617122901.13327-4-kraxel@redhat.com>
In-Reply-To: <20200617122901.13327-1-kraxel@redhat.com>
References: <20200617122901.13327-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move from X86MachineClass to PCMachineClass so it disappears
from microvm machine type property list.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Message-id: 20200529073957.8018-4-kraxel@redhat.com
---
 include/hw/i386/pc.h  |  2 ++
 include/hw/i386/x86.h |  4 ----
 hw/i386/pc.c          | 46 +++++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc_piix.c     | 10 +++++-----
 hw/i386/pc_q35.c      | 10 +++++-----
 hw/i386/x86.c         | 46 -------------------------------------------
 hw/i386/xen/xen-hvm.c |  2 +-
 7 files changed, 59 insertions(+), 61 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 8d764f965cd3..e6135c34d656 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -35,6 +35,7 @@ struct PCMachineState {
     PFlashCFI01 *flash[2];
 
     /* Configuration options: */
+    uint64_t max_ram_below_4g;
     OnOffAuto vmport;
 
     bool acpi_build_enabled;
@@ -51,6 +52,7 @@ struct PCMachineState {
 };
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
+#define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
 #define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
 #define PC_MACHINE_VMPORT           "vmport"
 #define PC_MACHINE_SMBUS            "smbus"
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index b52285481687..b79f24e28545 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -51,9 +51,6 @@ typedef struct {
     qemu_irq *gsi;
     GMappedFile *initrd_mapped_file;
 
-    /* Configuration options: */
-    uint64_t max_ram_below_4g;
-
     /* RAM information (sizes, addresses, configuration): */
     ram_addr_t below_4g_mem_size, above_4g_mem_size;
 
@@ -82,7 +79,6 @@ typedef struct {
     AddressSpace *ioapic_as;
 } X86MachineState;
 
-#define X86_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ec39741c87ac..d103b8c0ab82 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1857,6 +1857,45 @@ static void pc_machine_set_pit(Object *obj, bool value, Error **errp)
     pcms->pit_enabled = value;
 }
 
+static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
+                                            const char *name, void *opaque,
+                                            Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    uint64_t value = pcms->max_ram_below_4g;
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void pc_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
+                                            const char *name, void *opaque,
+                                            Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    Error *error = NULL;
+    uint64_t value;
+
+    visit_type_size(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+    if (value > 4 * GiB) {
+        error_setg(&error,
+                   "Machine option 'max-ram-below-4g=%"PRIu64
+                   "' expects size less than or equal to 4G", value);
+        error_propagate(errp, error);
+        return;
+    }
+
+    if (value < 1 * MiB) {
+        warn_report("Only %" PRIu64 " bytes of RAM below the 4GiB boundary,"
+                    "BIOS may not work with less than 1MiB", value);
+    }
+
+    pcms->max_ram_below_4g = value;
+}
+
 static void pc_machine_initfn(Object *obj)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -1866,6 +1905,7 @@ static void pc_machine_initfn(Object *obj)
 #else
     pcms->vmport = ON_OFF_AUTO_OFF;
 #endif /* CONFIG_VMPORT */
+    pcms->max_ram_below_4g = 0; /* use default */
     /* acpi build is enabled by default if machine supports it */
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
     pcms->smbus_enabled = true;
@@ -1964,6 +2004,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->numa_mem_supported = true;
     mc->default_ram_id = "pc.ram";
 
+    object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
+        pc_machine_get_max_ram_below_4g, pc_machine_set_max_ram_below_4g,
+        NULL, NULL);
+    object_class_property_set_description(oc, PC_MACHINE_MAX_RAM_BELOW_4G,
+        "Maximum ram below the 4G boundary (32bit boundary)");
+
     object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
         pc_machine_get_device_memory_region_size, NULL,
         NULL, NULL);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 054d3aa9f7ae..1497d0e4ae94 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -129,11 +129,11 @@ static void pc_init1(MachineState *machine,
     if (xen_enabled()) {
         xen_hvm_init(pcms, &ram_memory);
     } else {
-        if (!x86ms->max_ram_below_4g) {
-            x86ms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
+        if (!pcms->max_ram_below_4g) {
+            pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
         }
-        lowmem = x86ms->max_ram_below_4g;
-        if (machine->ram_size >= x86ms->max_ram_below_4g) {
+        lowmem = pcms->max_ram_below_4g;
+        if (machine->ram_size >= pcms->max_ram_below_4g) {
             if (pcmc->gigabyte_align) {
                 if (lowmem > 0xc0000000) {
                     lowmem = 0xc0000000;
@@ -142,7 +142,7 @@ static void pc_init1(MachineState *machine,
                     warn_report("Large machine and max_ram_below_4g "
                                 "(%" PRIu64 ") not a multiple of 1G; "
                                 "possible bad performance.",
-                                x86ms->max_ram_below_4g);
+                                pcms->max_ram_below_4g);
                 }
             }
         }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 18d2fad9c513..46cd06524c68 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -156,18 +156,18 @@ static void pc_q35_init(MachineState *machine)
     /* Handle the machine opt max-ram-below-4g.  It is basically doing
      * min(qemu limit, user limit).
      */
-    if (!x86ms->max_ram_below_4g) {
-        x86ms->max_ram_below_4g = 4 * GiB;
+    if (!pcms->max_ram_below_4g) {
+        pcms->max_ram_below_4g = 4 * GiB;
     }
-    if (lowmem > x86ms->max_ram_below_4g) {
-        lowmem = x86ms->max_ram_below_4g;
+    if (lowmem > pcms->max_ram_below_4g) {
+        lowmem = pcms->max_ram_below_4g;
         if (machine->ram_size - lowmem > lowmem &&
             lowmem & (1 * GiB - 1)) {
             warn_report("There is possibly poor performance as the ram size "
                         " (0x%" PRIx64 ") is more then twice the size of"
                         " max-ram-below-4g (%"PRIu64") and"
                         " max-ram-below-4g is not a multiple of 1G.",
-                        (uint64_t)machine->ram_size, x86ms->max_ram_below_4g);
+                        (uint64_t)machine->ram_size, pcms->max_ram_below_4g);
         }
     }
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index bb31935f7017..34229b45c759 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -846,45 +846,6 @@ void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw)
                                 bios);
 }
 
-static void x86_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
-                                             const char *name, void *opaque,
-                                             Error **errp)
-{
-    X86MachineState *x86ms = X86_MACHINE(obj);
-    uint64_t value = x86ms->max_ram_below_4g;
-
-    visit_type_size(v, name, &value, errp);
-}
-
-static void x86_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
-                                             const char *name, void *opaque,
-                                             Error **errp)
-{
-    X86MachineState *x86ms = X86_MACHINE(obj);
-    Error *error = NULL;
-    uint64_t value;
-
-    visit_type_size(v, name, &value, &error);
-    if (error) {
-        error_propagate(errp, error);
-        return;
-    }
-    if (value > 4 * GiB) {
-        error_setg(&error,
-                   "Machine option 'max-ram-below-4g=%"PRIu64
-                   "' expects size less than or equal to 4G", value);
-        error_propagate(errp, error);
-        return;
-    }
-
-    if (value < 1 * MiB) {
-        warn_report("Only %" PRIu64 " bytes of RAM below the 4GiB boundary,"
-                    "BIOS may not work with less than 1MiB", value);
-    }
-
-    x86ms->max_ram_below_4g = value;
-}
-
 bool x86_machine_is_smm_enabled(X86MachineState *x86ms)
 {
     bool smm_available = false;
@@ -958,7 +919,6 @@ static void x86_machine_initfn(Object *obj)
 
     x86ms->smm = ON_OFF_AUTO_AUTO;
     x86ms->acpi = ON_OFF_AUTO_AUTO;
-    x86ms->max_ram_below_4g = 0; /* use default */
     x86ms->smp_dies = 1;
 
     x86ms->apicid_from_cpu_idx = x86_apicid_from_cpu_idx;
@@ -980,12 +940,6 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     x86mc->save_tsc_khz = true;
     nc->nmi_monitor_handler = x86_nmi;
 
-    object_class_property_add(oc, X86_MACHINE_MAX_RAM_BELOW_4G, "size",
-        x86_machine_get_max_ram_below_4g, x86_machine_set_max_ram_below_4g,
-        NULL, NULL);
-    object_class_property_set_description(oc, X86_MACHINE_MAX_RAM_BELOW_4G,
-        "Maximum ram below the 4G boundary (32bit boundary)");
-
     object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
         x86_machine_get_smm, x86_machine_set_smm,
         NULL, NULL);
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 628bde5fac0c..cde981bad667 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -205,7 +205,7 @@ static void xen_ram_init(PCMachineState *pcms,
     ram_addr_t block_len;
     uint64_t user_lowmem =
         object_property_get_uint(qdev_get_machine(),
-                                 X86_MACHINE_MAX_RAM_BELOW_4G,
+                                 PC_MACHINE_MAX_RAM_BELOW_4G,
                                  &error_abort);
 
     /* Handle the machine opt max-ram-below-4g.  It is basically doing
-- 
2.18.4


