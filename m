Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA003265B4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 17:40:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90454.171233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFg9x-0001jv-7W; Fri, 26 Feb 2021 16:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90454.171233; Fri, 26 Feb 2021 16:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFg9x-0001jT-2v; Fri, 26 Feb 2021 16:40:09 +0000
Received: by outflank-mailman (input) for mailman id 90454;
 Fri, 26 Feb 2021 16:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3f7O=H4=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1lFg9v-0001fY-DJ
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 16:40:07 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 337976cf-1dc1-40f6-9141-39f268ce7e78;
 Fri, 26 Feb 2021 16:40:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v15so9197977wrx.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Feb 2021 08:40:05 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z9sm13754247wrv.56.2021.02.26.08.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:40:03 -0800 (PST)
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
X-Inumbo-ID: 337976cf-1dc1-40f6-9141-39f268ce7e78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1YYfb9HtaU4XCyWre7LsV/F1n1nBQssVppd4Gep+V2o=;
        b=jhNEIGzNIvm7uIJDNeepdBUBvbCkZr3OsBRClju38u86A4yYqUv90EsetfETvrc3uy
         iI+zIGPzqsjlZqM++r2OHaGhN1EzCO0E3YJpAhFua42/pl21XD9e5HFMclVV3MQ+6lTS
         PClfCZetd/GDxJDP+5n9KoAX4AGRbRSG6XTZtSG+8Nw2bpL/4z0T+d5B7pCVGMZXmiNK
         OseETsQ/lfVRwt5qoIW8PcqR3RBzTgp54jgmCfQq4zN/3MyhKfBGnOaPaww63XbuW0Lc
         j7cEfUdZ3jM66LhZ8WTkEl5LGQpcwA2VaQagvYajzHh+QFFwl0nq4/OdBxEOZCSE+E8s
         q7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=1YYfb9HtaU4XCyWre7LsV/F1n1nBQssVppd4Gep+V2o=;
        b=NrnpQt3Fi/5bTzizxOKgQKA9TjyYOgnrruLSbLh/TJi7y128OBM2QyJf9h/hAN+Vdy
         wLUU3+mR/DyeB0WY8N5de1Tlj4KfCqLn+b6cAYgpIPsWXG2g1OkirEaarJSTiVYC1EvB
         eWaecSQ93KWTk0Wpf5shB1KAGccjxBbdqDJVv6Y3lNc5jGP2HxdxZKGg0TolyEmcioSY
         XkbK40Jws89JSPtBMUpr6Za9sxih/hVzpIVGOKsgKvRbKBiyceMIvancYGqSfQ3+1h8T
         30OqBAtfvDuk4VM/6jNcO1P8WCWCNA+hlFQpuG+mQlOPzhzPb3RVDLNglyUJLVg6nAiC
         9hSQ==
X-Gm-Message-State: AOAM5332QDF/dMdTtJ/fi2xLD7dDf+RQzbqx+l8pLGDGUYNGiq8N7uat
	t6y3MwDM7/QcgZcYiS4U5es=
X-Google-Smtp-Source: ABdhPJwZ/DYZ11NdDeegyRPZoqNN4h2zXrlp0uTbsaCHPUpP4XdOBWrM8f4yQU2LZOI/wLarcjbEaA==
X-Received: by 2002:adf:97d5:: with SMTP id t21mr4094844wrb.139.1614357604604;
        Fri, 26 Feb 2021 08:40:04 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH] cpu: system_ops: move to cpu-system-ops.h, keep a pointer in CPUClass
Date: Fri, 26 Feb 2021 17:40:01 +0100
Message-Id: <20210226164001.4102868-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Similarly to commit 78271684719 ("cpu: tcg_ops: move to tcg-cpu-ops.h,
keep a pointer in CPUClass"):

We cannot in principle make the SysEmu Operations field definitions
conditional on CONFIG_SOFTMMU in code that is included by both
common_ss and specific_ss modules.

Therefore, what we can do safely to restrict the SysEmu fields to
system emulation builds, is to move all sysemu operations into a
separate header file, which is only included by system-specific code.

This leaves just a NULL pointer in the cpu.h for the user-mode builds.

Inspired-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC: Only ARM updated to get review before keep going with the other
targets.

Based-on: <20210226163227.4097950-1-f4bug@amsat.org>
---
 include/hw/core/cpu-system-ops.h | 89 ++++++++++++++++++++++++++++++++
 include/hw/core/cpu.h            | 77 ++-------------------------
 cpu.c                            | 13 ++---
 hw/core/cpu.c                    | 43 +++++++--------
 hw/core/qdev.c                   |  1 +
 monitor/misc.c                   |  1 +
 softmmu/physmem.c                |  1 +
 stubs/xen-hw-stub.c              |  1 +
 target/arm/cpu.c                 | 24 ++++++---
 9 files changed, 141 insertions(+), 109 deletions(-)
 create mode 100644 include/hw/core/cpu-system-ops.h

diff --git a/include/hw/core/cpu-system-ops.h b/include/hw/core/cpu-system-ops.h
new file mode 100644
index 00000000000..1554ccbdf07
--- /dev/null
+++ b/include/hw/core/cpu-system-ops.h
@@ -0,0 +1,89 @@
+/*
+ * CPU operations specific to system emulation
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef CPU_SYSTEM_OPS_H
+#define CPU_SYSTEM_OPS_H
+
+#include "hw/core/cpu.h"
+
+/*
+ * struct CPUSystemOperations: System operations specific to a CPU class
+ */
+typedef struct CPUSystemOperations {
+    /**
+     * @get_memory_mapping: Callback for obtaining the memory mappings.
+     */
+    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
+                               Error **errp);
+    /**
+     * @get_paging_enabled: Callback for inquiring whether paging is enabled.
+     */
+    bool (*get_paging_enabled)(const CPUState *cpu);
+    /**
+     * @get_phys_page_debug: Callback for obtaining a physical address.
+     */
+    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
+    /**
+     * @get_phys_page_attrs_debug: Callback for obtaining a physical address
+     *       and the associated memory transaction attributes to use for the
+     *       access.
+     * CPUs which use memory transaction attributes should implement this
+     * instead of get_phys_page_debug.
+     */
+    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
+                                        MemTxAttrs *attrs);
+    /**
+     * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
+     *       a memory access with the specified memory transaction attributes.
+     */
+    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
+    /**
+     * @get_crash_info: Callback for reporting guest crash information in
+     * GUEST_PANICKED events.
+     */
+    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
+    /**
+     * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
+     * 32-bit VM coredump.
+     */
+    int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
+                            int cpuid, void *opaque);
+    /**
+     * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
+     * 64-bit VM coredump.
+     */
+    int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
+                            int cpuid, void *opaque);
+    /**
+     * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
+     * note to a 32-bit VM coredump.
+     */
+    int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
+                                void *opaque);
+    /**
+     * @write_elf64_qemunote: Callback for writing a CPU- and QEMU-specific ELF
+     * note to a 64-bit VM coredump.
+     */
+    int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
+                                void *opaque);
+    /**
+     * @virtio_is_big_endian: Callback to return %true if a CPU which supports
+     *       runtime configurable endianness is currently big-endian.
+     * Non-configurable CPUs can use the default implementation of this method.
+     * This method should not be used by any callers other than the pre-1.0
+     * virtio devices.
+     */
+    bool (*virtio_is_big_endian)(CPUState *cpu);
+    /**
+     * @vmsd: State description for migration.
+     */
+    const VMStateDescription *vmsd;
+} CPUSystemOperations;
+
+#endif /* CPU_SYSTEM_OPS_H */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 29e1623f775..ef65011f206 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -80,79 +80,8 @@ struct TCGCPUOps;
 /* see accel-cpu.h */
 struct AccelCPUClass;
 
-/*
- * struct CPUSystemOperations: System operations specific to a CPU class
- */
-typedef struct CPUSystemOperations {
-    /**
-     * @get_memory_mapping: Callback for obtaining the memory mappings.
-     */
-    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
-                               Error **errp);
-    /**
-     * @get_paging_enabled: Callback for inquiring whether paging is enabled.
-     */
-    bool (*get_paging_enabled)(const CPUState *cpu);
-    /**
-     * @get_phys_page_debug: Callback for obtaining a physical address.
-     */
-    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
-    /**
-     * @get_phys_page_attrs_debug: Callback for obtaining a physical address
-     *       and the associated memory transaction attributes to use for the
-     *       access.
-     * CPUs which use memory transaction attributes should implement this
-     * instead of get_phys_page_debug.
-     */
-    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
-                                        MemTxAttrs *attrs);
-    /**
-     * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
-     *       a memory access with the specified memory transaction attributes.
-     */
-    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
-    /**
-     * @get_crash_info: Callback for reporting guest crash information in
-     * GUEST_PANICKED events.
-     */
-    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
-    /**
-     * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
-     * 32-bit VM coredump.
-     */
-    int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
-    /**
-     * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
-     * 64-bit VM coredump.
-     */
-    int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
-    /**
-     * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
-     * note to a 32-bit VM coredump.
-     */
-    int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
-    /**
-     * @write_elf64_qemunote: Callback for writing a CPU- and QEMU-specific ELF
-     * note to a 64-bit VM coredump.
-     */
-    int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
-    /**
-     * @virtio_is_big_endian: Callback to return %true if a CPU which supports
-     *       runtime configurable endianness is currently big-endian.
-     * Non-configurable CPUs can use the default implementation of this method.
-     * This method should not be used by any callers other than the pre-1.0
-     * virtio devices.
-     */
-    bool (*virtio_is_big_endian)(CPUState *cpu);
-    /**
-     * @vmsd: State description for migration.
-     */
-    const VMStateDescription *vmsd;
-} CPUSystemOperations;
+/* see cpu-system-ops.h */
+struct CPUSystemOperations;
 
 /**
  * CPUClass:
@@ -224,7 +153,7 @@ struct CPUClass {
     struct AccelCPUClass *accel_cpu;
 
     /* when system emulation is not available, this pointer is NULL */
-    struct CPUSystemOperations system_ops;
+    struct CPUSystemOperations *system_ops;
 
     /* when TCG is not available, this pointer is NULL */
     struct TCGCPUOps *tcg_ops;
diff --git a/cpu.c b/cpu.c
index 619b8c14f94..9a1792edaec 100644
--- a/cpu.c
+++ b/cpu.c
@@ -36,6 +36,7 @@
 #include "sysemu/replay.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
+#include "hw/core/cpu-system-ops.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
@@ -138,13 +139,13 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #endif /* CONFIG_TCG */
 
 #ifdef CONFIG_USER_ONLY
-    assert(cc->system_ops.vmsd == NULL);
+    assert(cc->system_ops->vmsd == NULL);
 #else
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->system_ops.vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->system_ops.vmsd, cpu);
+    if (cc->system_ops->vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cc->system_ops->vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
@@ -154,10 +155,10 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
 #ifdef CONFIG_USER_ONLY
-    assert(cc->system_ops.vmsd == NULL);
+    assert(cc->system_ops->vmsd == NULL);
 #else
-    if (cc->system_ops.vmsd != NULL) {
-        vmstate_unregister(NULL, cc->system_ops.vmsd, cpu);
+    if (cc->system_ops->vmsd != NULL) {
+        vmstate_unregister(NULL, cc->system_ops->vmsd, cpu);
     }
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 8bd7bda6b0b..0c58d81b6a5 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
+#include "hw/core/cpu-system-ops.h"
 #include "sysemu/hw_accel.h"
 #include "qemu/notify.h"
 #include "qemu/log.h"
@@ -71,8 +72,8 @@ bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->system_ops.get_paging_enabled) {
-        return cc->system_ops.get_paging_enabled(cpu);
+    if (cc->system_ops->get_paging_enabled) {
+        return cc->system_ops->get_paging_enabled(cpu);
     }
 
     return false;
@@ -83,8 +84,8 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->system_ops.get_memory_mapping) {
-        cc->system_ops.get_memory_mapping(cpu, list, errp);
+    if (cc->system_ops->get_memory_mapping) {
+        cc->system_ops->get_memory_mapping(cpu, list, errp);
         return;
     }
 
@@ -96,12 +97,12 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->system_ops.get_phys_page_attrs_debug) {
-        return cc->system_ops.get_phys_page_attrs_debug(cpu, addr, attrs);
+    if (cc->system_ops->get_phys_page_attrs_debug) {
+        return cc->system_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
     }
     /* Fallback for CPUs which don't implement the _attrs_ hook */
     *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->system_ops.get_phys_page_debug(cpu, addr);
+    return cc->system_ops->get_phys_page_debug(cpu, addr);
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
@@ -116,8 +117,8 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->system_ops.asidx_from_attrs) {
-        ret = cc->system_ops.asidx_from_attrs(cpu, attrs);
+    if (cc->system_ops->asidx_from_attrs) {
+        ret = cc->system_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
@@ -151,10 +152,10 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->system_ops.write_elf32_qemunote) {
+    if (!cc->system_ops->write_elf32_qemunote) {
         return 0;
     }
-    return (*cc->system_ops.write_elf32_qemunote)(f, cpu, opaque);
+    return (*cc->system_ops->write_elf32_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -162,10 +163,10 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->system_ops.write_elf32_note) {
+    if (!cc->system_ops->write_elf32_note) {
         return -1;
     }
-    return (*cc->system_ops.write_elf32_note)(f, cpu, cpuid, opaque);
+    return (*cc->system_ops->write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
@@ -173,10 +174,10 @@ int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->system_ops.write_elf64_qemunote) {
+    if (!cc->system_ops->write_elf64_qemunote) {
         return 0;
     }
-    return (*cc->system_ops.write_elf64_qemunote)(f, cpu, opaque);
+    return (*cc->system_ops->write_elf64_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -184,10 +185,10 @@ int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->system_ops.write_elf64_note) {
+    if (!cc->system_ops->write_elf64_note) {
         return -1;
     }
-    return (*cc->system_ops.write_elf64_note)(f, cpu, cpuid, opaque);
+    return (*cc->system_ops->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
@@ -204,8 +205,8 @@ bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->system_ops.virtio_is_big_endian) {
-        return cc->system_ops.virtio_is_big_endian(cpu);
+    if (cc->system_ops->virtio_is_big_endian) {
+        return cc->system_ops->virtio_is_big_endian(cpu);
     }
     return target_words_bigendian();
 }
@@ -220,8 +221,8 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     GuestPanicInformation *res = NULL;
 
-    if (cc->system_ops.get_crash_info) {
-        res = cc->system_ops.get_crash_info(cpu);
+    if (cc->system_ops->get_crash_info) {
+        res = cc->system_ops->get_crash_info(cpu);
     }
     return res;
 }
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a9..b2de42ed6ce 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -38,6 +38,7 @@
 #include "hw/boards.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-clock.h"
+#include "hw/core/cpu-system-ops.h"
 #include "migration/vmstate.h"
 #include "trace.h"
 
diff --git a/monitor/misc.c b/monitor/misc.c
index a7650ed7470..8feb34c1633 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -77,6 +77,7 @@
 #include "qapi/qmp-event.h"
 #include "sysemu/cpus.h"
 #include "qemu/cutils.h"
+#include "hw/core/cpu-system-ops.h"
 
 #if defined(TARGET_S390X)
 #include "hw/s390x/storage-keys.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 19e0aa9836a..06b72bee2d7 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -28,6 +28,7 @@
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
+#include "hw/core/cpu-system-ops.h"
 
 #include "exec/exec-all.h"
 #include "exec/target_page.h"
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 15f3921a76b..2af9c1de9d9 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/core/cpu-system-ops.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-x86.h"
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 87a581fa47c..90fe3bfaaf3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2278,6 +2278,19 @@ static struct TCGCPUOps arm_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/cpu-system-ops.h"
+
+static struct CPUSystemOperations arm_sysemu_ops = {
+    .vmsd = &vmstate_arm_cpu,
+    .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
+    .asidx_from_attrs = arm_asidx_from_attrs,
+    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
+    .write_elf64_note = arm_cpu_write_elf64_note,
+    .write_elf32_note = arm_cpu_write_elf32_note,
+};
+#endif
+
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -2296,14 +2309,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
-#ifndef CONFIG_USER_ONLY
-    cc->system_ops.get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
-    cc->system_ops.asidx_from_attrs = arm_asidx_from_attrs;
-    cc->system_ops.vmsd = &vmstate_arm_cpu;
-    cc->system_ops.virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
-    cc->system_ops.write_elf64_note = arm_cpu_write_elf64_note;
-    cc->system_ops.write_elf32_note = arm_cpu_write_elf32_note;
-#endif
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
@@ -2314,6 +2319,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_ops = &arm_tcg_ops;
 #endif /* CONFIG_TCG */
+#ifndef CONFIG_USER_ONLY
+    cc->system_ops = &arm_sysemu_ops;
+#endif
 }
 
 #ifdef CONFIG_KVM
-- 
2.26.2


