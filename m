Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA91E770B
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:40:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZcm-0007K5-Er; Fri, 29 May 2020 07:40:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3I2r=7L=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jeZck-0007Jv-EB
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:40:14 +0000
X-Inumbo-ID: a1c888fa-a17f-11ea-9dbe-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a1c888fa-a17f-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590738013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gb5GkJLhKQmpKKUOPuJsTnckJHtFKjaTwf/g8nYkDxc=;
 b=J8BmK2T+MjMPfspS3k28eb3fDnJqlXzVO9XwgZL/4am6vhRpt3JfhmGC1cPodSqi8udt8o
 0Ed0k9xZni22K6cNu0Kt+de/aRcKUB8GHCLQagmh963qSWcNlCxfbj4jiZFU0gwIfJSfM4
 JBinHyW+3k84MPVa81Lijgq/FWpPeHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-Zz3F4r-EMV2AXkdZs1hcTA-1; Fri, 29 May 2020 03:40:09 -0400
X-MC-Unique: Zz3F4r-EMV2AXkdZs1hcTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0866F100A8ED;
 Fri, 29 May 2020 07:40:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79CD810013C2;
 Fri, 29 May 2020 07:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 57E439DAF; Fri, 29 May 2020 09:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] x86: move max-ram-below-4g to pc
Date: Fri, 29 May 2020 09:39:56 +0200
Message-Id: <20200529073957.8018-4-kraxel@redhat.com>
In-Reply-To: <20200529073957.8018-1-kraxel@redhat.com>
References: <20200529073957.8018-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 imammedo@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move from X86MachineClass to PCMachineClass so it disappears
from microvm machine type property list.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 5e3b19ab78fc..dce1273c7dad 100644
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
index c5db7be6d8b1..6d6f6decb32c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1831,6 +1831,45 @@ static void pc_machine_set_pit(Object *obj, bool value, Error **errp)
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
@@ -1840,6 +1879,7 @@ static void pc_machine_initfn(Object *obj)
 #else
     pcms->vmport = ON_OFF_AUTO_OFF;
 #endif /* CONFIG_VMPORT */
+    pcms->max_ram_below_4g = 0; /* use default */
     /* acpi build is enabled by default if machine supports it */
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
     pcms->smbus_enabled = true;
@@ -1938,6 +1978,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
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
index f66e1d73ce0b..503c35f7bf4c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -127,11 +127,11 @@ static void pc_init1(MachineState *machine,
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
@@ -140,7 +140,7 @@ static void pc_init1(MachineState *machine,
                     warn_report("Large machine and max_ram_below_4g "
                                 "(%" PRIu64 ") not a multiple of 1G; "
                                 "possible bad performance.",
-                                x86ms->max_ram_below_4g);
+                                pcms->max_ram_below_4g);
                 }
             }
         }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4ba8ac8774e4..90e8fb2cb737 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -154,18 +154,18 @@ static void pc_q35_init(MachineState *machine)
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
index 7a3bc7ab6639..49884e5c1597 100644
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
index 82ece6b9e739..d6f4674418e9 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -203,7 +203,7 @@ static void xen_ram_init(PCMachineState *pcms,
     ram_addr_t block_len;
     uint64_t user_lowmem =
         object_property_get_uint(qdev_get_machine(),
-                                 X86_MACHINE_MAX_RAM_BELOW_4G,
+                                 PC_MACHINE_MAX_RAM_BELOW_4G,
                                  &error_abort);
 
     /* Handle the machine opt max-ram-below-4g.  It is basically doing
-- 
2.18.4


