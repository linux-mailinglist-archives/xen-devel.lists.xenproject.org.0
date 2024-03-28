Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFE28903F9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699018.1091439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6J-0001nA-QT; Thu, 28 Mar 2024 15:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699018.1091439; Thu, 28 Mar 2024 15:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6J-0001kO-NN; Thu, 28 Mar 2024 15:55:35 +0000
Received: by outflank-mailman (input) for mailman id 699018;
 Thu, 28 Mar 2024 15:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps6I-0001AK-G3
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:34 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c272e9b-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:55:33 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a472f8c6a55so149503166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:33 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 bj9-20020a17090736c900b00a4e28cacbddsm393913ejc.57.2024.03.28.08.55.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:32 -0700 (PDT)
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
X-Inumbo-ID: 9c272e9b-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641333; x=1712246133; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSkLCR/UlhKFiQpvqkRVhG8wkTGDHk2a+aqlC/uZCjk=;
        b=HzD778V6aqrHB/+GMu32/EiAaNPHaS7LorEsj5Al4RuC3N8ykXJixllfj0nJeCh6eY
         JVUlyRwrXTJhgwMkcqEmH5mEzJBoEM6sB0o0O7CediUaiRq+3DeR5qF6t3wmvrJlgdD/
         QEynec4mwiiEX7NGzMOkjX+xlL3bHLlJXFJjU8UJ+EVk5qobw9z9g3Dogjzmq1D+oyGY
         7t3/814ZyenbFeN6aU2mcANxR/SM14O8IDCKjBw14ZXPtPQxXh8orzNgvNqvaB61i2m4
         1MZqUykDviEBB/uvcaaOWHv3IJuB+94M7PU0SpIvml+xEDv9OtRDL4M+Rnw2QNHqKaRe
         oIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641333; x=1712246133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSkLCR/UlhKFiQpvqkRVhG8wkTGDHk2a+aqlC/uZCjk=;
        b=CrfOBMbsR4JBEPYHLOoWzOCjGUF4Aa5hlcAKUkf2UnQXg+c70qkpvpeylml1RCCsqP
         m1lf5oFXEwFegACrqHdNyfCYwiKsp/skyV2IVEBDupvSdiYywTV4lbXn4TTKCn1mUVFB
         EjKHrFntNiBVQITh1UPKATWFQOHizvhD0ibwj49hGwzb5yghIzoxDBuSXM2kud32vHWU
         oGkoptdEqqPJuB64o1XRra9srU0ownM5bzlGfrzFqVGrUu4CbRlS8AGVpGL+TJiSWFfY
         ughb/oVbIs7uLWeRd3YRvxQkdrj058qUDcHqyhULq6Oih/6LO6jrtn5GOigkwFbQdWKV
         SpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTvYXdBVcQF1hBtDygH3VXk2+KKQJBz8kCbqztTSXGgwHnInSVJc8oA2i4QNOk3QLVQnaPw6AweJvkuRuaJClqf3gXO7Y3cE2pEgUzzv4=
X-Gm-Message-State: AOJu0YxeiUh74vG0ygt5ih1K2YJa2Z3IFF7E0ZDxAMA+pX9G6L16PNVf
	ROwEi9yiUSnm0HmDOfx0EuXtXGxVHknDWBuA80fF7W9/7Ft0CGhmqniJbGQ7SvM=
X-Google-Smtp-Source: AGHT+IF/0mLdvRWo13tehO3NuCCV1getL+XsL801v0qQfgvFLMYq6AAaEiOV3hBAVWA55LBbGiFx8w==
X-Received: by 2002:a17:906:ef05:b0:a4e:207e:b71 with SMTP id f5-20020a170906ef0500b00a4e207e0b71mr2083747ejs.6.1711641333084;
        Thu, 28 Mar 2024 08:55:33 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 08/29] hw/i386/pc: Move CXLState to PcPciMachineState
Date: Thu, 28 Mar 2024 16:54:16 +0100
Message-ID: <20240328155439.58719-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CXL depends on PCIe, which isn't available on non-PCI
machines such the ISA-only PC one.
Move CXLState to PcPciMachineState, and move the CXL
specific calls to pc_pci_machine_initfn() and
pc_pci_machine_done().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h |  3 ++-
 hw/i386/acpi-build.c | 14 +++++++++++---
 hw/i386/pc.c         | 39 ++++++++++++++++++++-------------------
 3 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 24c8e17e62..a97493d29d 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -54,13 +54,14 @@ typedef struct PCMachineState {
     hwaddr memhp_io_base;
 
     SGXEPCState sgx_epc;
-    CXLState cxl_devices_state;
 } PCMachineState;
 
 typedef struct PcPciMachineState {
     PCMachineState parent_obj;
 
     Notifier machine_done;
+
+    CXLState cxl_devices_state;
 } PcPciMachineState;
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b9890886f6..6e8e32e5d2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1554,6 +1554,11 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     crs_range_set_init(&crs_range_set);
     bus = PC_MACHINE(machine)->pcibus;
     if (bus) {
+        PcPciMachineState *ppms;
+
+        assert(pc_machine_is_pci_enabled(pcms));
+        ppms = PC_PCI_MACHINE(machine);
+
         QLIST_FOREACH(bus, &bus->child, sibling) {
             uint8_t bus_num = pci_bus_num(bus);
             uint8_t numa_node = pci_bus_numa_node(bus);
@@ -1607,7 +1612,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
             /* Handle the ranges for the PXB expanders */
             if (pci_bus_is_cxl(bus)) {
-                MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
+                MemoryRegion *mr = &ppms->cxl_devices_state.host_mr;
                 uint64_t base = mr->addr;
 
                 cxl_present = true;
@@ -2513,6 +2518,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     Object *vmgenid_dev;
     char *oem_id;
     char *oem_table_id;
+    bool pci_enabled = pc_machine_is_pci_enabled(pcms);
+    PcPciMachineState *ppms = pci_enabled ? PC_PCI_MACHINE(pcms) : NULL;
 
     acpi_get_pm_info(machine, &pm);
     acpi_get_misc_info(&misc);
@@ -2640,9 +2647,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                           machine->nvdimms_state, machine->ram_slots,
                           x86ms->oem_id, x86ms->oem_table_id);
     }
-    if (pcms->cxl_devices_state.is_enabled) {
+    if (ppms && ppms->cxl_devices_state.is_enabled) {
         cxl_build_cedt(table_offsets, tables_blob, tables->linker,
-                       x86ms->oem_id, x86ms->oem_table_id, &pcms->cxl_devices_state);
+                       x86ms->oem_id, x86ms->oem_table_id,
+                       &ppms->cxl_devices_state);
     }
 
     acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f9226f7115..6d87d1d4c2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -598,13 +598,6 @@ void pc_machine_done(Notifier *notifier, void *data)
                                         PCMachineState, machine_done);
     X86MachineState *x86ms = X86_MACHINE(pcms);
 
-    cxl_hook_up_pxb_registers(pcms->pcibus, &pcms->cxl_devices_state,
-                              &error_fatal);
-
-    if (pcms->cxl_devices_state.is_enabled) {
-        cxl_fmws_link_targets(&pcms->cxl_devices_state, &error_fatal);
-    }
-
     /* set the number of CPUs */
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
 
@@ -626,6 +619,13 @@ static void pc_pci_machine_done(Notifier *notifier, void *data)
     PCMachineState *pcms = PC_MACHINE(ppms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
 
+    cxl_hook_up_pxb_registers(pcms->pcibus, &ppms->cxl_devices_state,
+                              &error_fatal);
+
+    if (ppms->cxl_devices_state.is_enabled) {
+        cxl_fmws_link_targets(&ppms->cxl_devices_state, &error_fatal);
+    }
+
     fw_cfg_add_extra_pci_roots(pcms->pcibus, x86ms->fw_cfg);
 }
 
@@ -719,13 +719,14 @@ static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
 
 static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
 {
+    PcPciMachineState *ppms = PC_PCI_MACHINE(pcms);
     uint64_t start = pc_get_cxl_range_start(pcms) + MiB;
 
-    if (pcms->cxl_devices_state.fixed_windows) {
+    if (ppms->cxl_devices_state.fixed_windows) {
         GList *it;
 
         start = ROUND_UP(start, 256 * MiB);
-        for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
+        for (it = ppms->cxl_devices_state.fixed_windows; it; it = it->next) {
             CXLFixedWindow *fw = it->data;
             start += fw->size;
         }
@@ -823,6 +824,7 @@ void pc_memory_init(PCMachineState *pcms,
     hwaddr cxl_base, cxl_resv_end = 0;
     X86CPU *cpu = X86_CPU(first_cpu);
     bool pci_enabled = pc_machine_is_pci_enabled(pcms);
+    PcPciMachineState *ppms = pci_enabled ? PC_PCI_MACHINE(pcms) : NULL;
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -926,20 +928,20 @@ void pc_memory_init(PCMachineState *pcms,
         machine_memory_devices_init(machine, device_mem_base, device_mem_size);
     }
 
-    if (pcms->cxl_devices_state.is_enabled) {
-        MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
+    if (ppms && ppms->cxl_devices_state.is_enabled) {
+        MemoryRegion *mr = &ppms->cxl_devices_state.host_mr;
         hwaddr cxl_size = MiB;
 
         cxl_base = pc_get_cxl_range_start(pcms);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
         cxl_resv_end = cxl_base + cxl_size;
-        if (pcms->cxl_devices_state.fixed_windows) {
+        if (ppms->cxl_devices_state.fixed_windows) {
             hwaddr cxl_fmw_base;
             GList *it;
 
             cxl_fmw_base = ROUND_UP(cxl_base + cxl_size, 256 * MiB);
-            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
+            for (it = ppms->cxl_devices_state.fixed_windows; it; it = it->next) {
                 CXLFixedWindow *fw = it->data;
 
                 fw->base = cxl_fmw_base;
@@ -979,7 +981,7 @@ void pc_memory_init(PCMachineState *pcms,
             res_mem_end += memory_region_size(&machine->device_memory->mr);
         }
 
-        if (pcms->cxl_devices_state.is_enabled) {
+        if (ppms->cxl_devices_state.is_enabled) {
             res_mem_end = cxl_resv_end;
         }
         *val = cpu_to_le64(ROUND_UP(res_mem_end, 1 * GiB));
@@ -1010,11 +1012,12 @@ uint64_t pc_pci_hole64_start(void)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    PcPciMachineState *ppms = PC_PCI_MACHINE(pcms);
     MachineState *ms = MACHINE(pcms);
     uint64_t hole64_start = 0;
     ram_addr_t size = 0;
 
-    if (pcms->cxl_devices_state.is_enabled) {
+    if (ppms->cxl_devices_state.is_enabled) {
         hole64_start = pc_get_cxl_range_end(pcms);
     } else if (pcmc->has_reserved_memory && (ms->ram_size < ms->maxram_size)) {
         pc_get_device_memory_range(pcms, &hole64_start, &size);
@@ -1651,7 +1654,6 @@ static void pc_machine_initfn(Object *obj)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
-    bool pci_enabled = pc_machine_is_pci_enabled(pcms);
 
 #ifdef CONFIG_VMPORT
     pcms->vmport = ON_OFF_AUTO_AUTO;
@@ -1678,9 +1680,6 @@ static void pc_machine_initfn(Object *obj)
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
     object_property_add_alias(OBJECT(pcms), "pcspk-audiodev",
                               OBJECT(pcms->pcspk), "audiodev");
-    if (pci_enabled) {
-        cxl_machine_init(obj, &pcms->cxl_devices_state);
-    }
 
     pcms->machine_done.notify = pc_machine_done;
     qemu_add_machine_init_done_notifier(&pcms->machine_done);
@@ -1690,6 +1689,8 @@ static void pc_pci_machine_initfn(Object *obj)
 {
     PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
 
+    cxl_machine_init(obj, &ppms->cxl_devices_state);
+
     ppms->machine_done.notify = pc_pci_machine_done;
     qemu_add_machine_init_done_notifier(&ppms->machine_done);
 }
-- 
2.41.0


