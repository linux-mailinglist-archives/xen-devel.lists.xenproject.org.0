Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E79FEA1ADA3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876486.1286876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yk-0007b6-0b; Thu, 23 Jan 2025 23:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876486.1286876; Thu, 23 Jan 2025 23:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yj-0007WI-T8; Thu, 23 Jan 2025 23:51:17 +0000
Received: by outflank-mailman (input) for mailman id 876486;
 Thu, 23 Jan 2025 23:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6tj-0007hN-FG
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:46:07 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3620e9ed-d9e4-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:46:05 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so936519f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:46:05 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c403asm989733f8f.93.2025.01.23.15.46.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:46:03 -0800 (PST)
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
X-Inumbo-ID: 3620e9ed-d9e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675965; x=1738280765; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ+5PubFZrrCYmUor7z2ohXZLQOj0+FDz6CQ50FZwrM=;
        b=cNL9W4GgXiGbGKj5Oaf3xRXVRuwiyeOYXu35T/8Gek6sP8ZleQZ9j6A9Gwd79h5SwV
         b7ot/UE0hMOfrofoLe7KfZ6prqCnRkobFW2vqBRP1h7damETpX1HePopzG7g6iimmtcG
         yr4TceZEyoxU9eKyNxP9twyN345/mejOxRdiIeEYNr3Gp+NjgKZNORwC1RgkhJSTeSzF
         bew6hrKDuiaC5BEXL6YlPb96cDgmDKf0A6nHXQhAKW+5Ug+bl+Huwj76mAA0pE7rsoHW
         bu3ys0XPQ46DG6bG796R0ZM7dIjgLwaVhZltVu28LhV61GBn9qnYS91Tev+yBojcIJjM
         fKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675965; x=1738280765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQ+5PubFZrrCYmUor7z2ohXZLQOj0+FDz6CQ50FZwrM=;
        b=N/4IDG1mHaoDKC+S4ZV2CosUH1WIBQeZudMW8mz1ehVpXlf5IoeLCQBtGPt0wPnusK
         jbGAdWQLEwR8mq04DrCC8mAPcDXJ3qO2CBNpWVwIB8fU7Qv44aIy3uvPvRxg5Fy+TlGC
         XipG3xRBbciu6PAy+H48pkpL7NcJ/RCltj33f1OXj/Jx6uWu/XCNOBqgcNQBbi71YtDh
         jd18arq6Ta7Uzd2j1i02VY/GjSUr5TTW2YQZ7uNBZGloQZxnZ6U0+i5ohlCucIntdonx
         54XD09ujzjbLBwmClUslFyF+nyY/Akh3GAp57LFyx7ieBt6SxFFVqKB/gJCctugWEVf/
         5l9w==
X-Forwarded-Encrypted: i=1; AJvYcCVx/AleA068NJoEDcrWE0lXMhNZL53pkOu7pMR5PWZplyRf+G4dKeX2uUKhIyGWGf4zAO15V3mxwsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXhleRHduSx4qFQ568LDms2U+IBgKxZfUO/CTs1iiDUCPySaSY
	fkSpuTkwz5at3SSK7P1qeIl47qyMKCxcHRpIjTpRkZxOWLM5qNKQBQsc3Z6QGZlAr57YNLa15IG
	9TD8=
X-Gm-Gg: ASbGncvz9mDfY+LYwTsMQFLns7IwRXZNHj6YNpTyzq62QQ1kcy2aBffsCJWz6IBMRT8
	3ceijSICi0MJ8SKu1qJrQpjK3qyO8kh8J8xLOb2cLrgT73eeqxfNpuJRIeywFSlKGtZDgdF3vVs
	1ecSs4gUjiNe/36qWazzy1jr6c80Qcm8elWzSNNMQKYRMdpNn8llDP2B4/lwqMJv2xAczltv/uP
	CVOhMb6zT01hQopiCYNSV+jfjeVZTEU9d23JESNyXkbEQFXV8tKblYxb6s8S2VVmuyhP35LRR5l
	ZHh54gNS6WCmoiHAemtEqER3SIp1KMRD3+RA3YQKvsnl6Uxl3WGwOpA=
X-Google-Smtp-Source: AGHT+IGsiKZVvuhBn67VKbvp7ZCKdJegwhgfqv/IiEk5xyysRNRbKSY3tyJ6LqHq9Om3O3Zv9Xfmsw==
X-Received: by 2002:adf:f250:0:b0:38a:5dc4:6dcd with SMTP id ffacd0b85a97d-38c22279dafmr4343550f8f.22.1737675965020;
        Thu, 23 Jan 2025 15:46:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 19/20] cpus: Register VMState per user / system emulation
Date: Fri, 24 Jan 2025 00:44:13 +0100
Message-ID: <20250123234415.59850-20-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Simplify cpu-target.c by extracting mixed vmstate code
into the cpu_vmstate_register() / cpu_vmstate_unregister()
helpers, implemented in cpu-user.c and cpu-system.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
XXX: tlb_flush() temporary declared manually.

Only 2 more CONFIG_USER_ONLY to go.
---
 include/hw/core/cpu.h |   2 +
 cpu-target.c          | 122 +----------------------------------------
 hw/core/cpu-system.c  | 123 ++++++++++++++++++++++++++++++++++++++++++
 hw/core/cpu-user.c    |  12 +++++
 4 files changed, 139 insertions(+), 120 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fb397cdfc53..aadbd2e1122 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1163,6 +1163,8 @@ G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
 /* $(top_srcdir)/cpu.c */
 void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_initfn(CPUState *cpu);
+void cpu_vmstate_register(CPUState *cpu);
+void cpu_vmstate_unregister(CPUState *cpu);
 bool cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
 void cpu_exec_reset_hold(CPUState *cpu);
diff --git a/cpu-target.c b/cpu-target.c
index 3d33d20b8c8..bfcd48f9ae2 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -21,115 +21,16 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
-#include "migration/vmstate.h"
-#ifndef CONFIG_USER_ONLY
-#include "hw/core/sysemu-cpu-ops.h"
-#endif
 #include "system/accel-ops.h"
 #include "system/cpus.h"
-#include "system/tcg.h"
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
-#include "exec/exec-all.h"
-#include "exec/tb-flush.h"
 #include "exec/log.h"
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
 #include "hw/core/cpu.h"
 
-#ifndef CONFIG_USER_ONLY
-static int cpu_common_post_load(void *opaque, int version_id)
-{
-#ifdef CONFIG_TCG
-    if (tcg_enabled()) {
-        CPUState *cpu = opaque;
-
-        /*
-         * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
-         * version_id is increased.
-         */
-        cpu->interrupt_request &= ~0x01;
-
-        tlb_flush(cpu);
-
-        /*
-         * loadvm has just updated the content of RAM, bypassing the
-         * usual mechanisms that ensure we flush TBs for writes to
-         * memory we've translated code from. So we must flush all TBs,
-         * which will now be stale.
-         */
-        tb_flush(cpu);
-    }
-#endif
-
-    return 0;
-}
-
-static int cpu_common_pre_load(void *opaque)
-{
-    CPUState *cpu = opaque;
-
-    cpu->exception_index = -1;
-
-    return 0;
-}
-
-static bool cpu_common_exception_index_needed(void *opaque)
-{
-    CPUState *cpu = opaque;
-
-    return tcg_enabled() && cpu->exception_index != -1;
-}
-
-static const VMStateDescription vmstate_cpu_common_exception_index = {
-    .name = "cpu_common/exception_index",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .needed = cpu_common_exception_index_needed,
-    .fields = (const VMStateField[]) {
-        VMSTATE_INT32(exception_index, CPUState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static bool cpu_common_crash_occurred_needed(void *opaque)
-{
-    CPUState *cpu = opaque;
-
-    return cpu->crash_occurred;
-}
-
-static const VMStateDescription vmstate_cpu_common_crash_occurred = {
-    .name = "cpu_common/crash_occurred",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .needed = cpu_common_crash_occurred_needed,
-    .fields = (const VMStateField[]) {
-        VMSTATE_BOOL(crash_occurred, CPUState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-const VMStateDescription vmstate_cpu_common = {
-    .name = "cpu_common",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .pre_load = cpu_common_pre_load,
-    .post_load = cpu_common_post_load,
-    .fields = (const VMStateField[]) {
-        VMSTATE_UINT32(halted, CPUState),
-        VMSTATE_UINT32(interrupt_request, CPUState),
-        VMSTATE_END_OF_LIST()
-    },
-    .subsections = (const VMStateDescription * const []) {
-        &vmstate_cpu_common_exception_index,
-        &vmstate_cpu_common_crash_occurred,
-        NULL
-    }
-};
-#endif
-
 bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
     if (!accel_cpu_common_realize(cpu, errp)) {
@@ -139,33 +40,14 @@ bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
     /* Wait until cpu initialization complete before exposing cpu. */
     cpu_list_add(cpu);
 
-#ifdef CONFIG_USER_ONLY
-    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
-           qdev_get_vmsd(DEVICE(cpu))->unmigratable);
-#else
-    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
-        vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
-    }
-    if (cpu->cc->sysemu_ops->legacy_vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
+    cpu_vmstate_register(cpu);
 
     return true;
 }
 
 void cpu_exec_unrealizefn(CPUState *cpu)
 {
-#ifndef CONFIG_USER_ONLY
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->legacy_vmsd != NULL) {
-        vmstate_unregister(NULL, cc->sysemu_ops->legacy_vmsd, cpu);
-    }
-    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
-        vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
-    }
-#endif
+    cpu_vmstate_unregister(cpu);
 
     cpu_list_remove(cpu);
     /*
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 0520c362db4..3e1f60f23df 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -22,10 +22,21 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
+#include "exec/tb-flush.h"
 #include "exec/tswap.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/sysemu-cpu-ops.h"
+#include "migration/vmstate.h"
+#include "system/tcg.h"
+
+/*
+ * XXX this series plan is to be applied on top on my exec/cputlb rework series,
+ * then tlb_flush() won't be declared target-specific in exec-all.h.
+ * Meanwhile, declare locally.
+ * XXX
+ */
+void tlb_flush(CPUState *cs);
 
 bool cpu_paging_enabled(const CPUState *cpu)
 {
@@ -189,3 +200,115 @@ void cpu_exec_initfn(CPUState *cpu)
     cpu->memory = get_system_memory();
     object_ref(OBJECT(cpu->memory));
 }
+
+static int cpu_common_post_load(void *opaque, int version_id)
+{
+#ifdef CONFIG_TCG
+    if (tcg_enabled()) {
+        CPUState *cpu = opaque;
+
+        /*
+         * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
+         * version_id is increased.
+         */
+        cpu->interrupt_request &= ~0x01;
+
+        tlb_flush(cpu);
+
+        /*
+         * loadvm has just updated the content of RAM, bypassing the
+         * usual mechanisms that ensure we flush TBs for writes to
+         * memory we've translated code from. So we must flush all TBs,
+         * which will now be stale.
+         */
+        tb_flush(cpu);
+    }
+#endif
+
+    return 0;
+}
+
+static int cpu_common_pre_load(void *opaque)
+{
+    CPUState *cpu = opaque;
+
+    cpu->exception_index = -1;
+
+    return 0;
+}
+
+static bool cpu_common_exception_index_needed(void *opaque)
+{
+    CPUState *cpu = opaque;
+
+    return tcg_enabled() && cpu->exception_index != -1;
+}
+
+static const VMStateDescription vmstate_cpu_common_exception_index = {
+    .name = "cpu_common/exception_index",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = cpu_common_exception_index_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_INT32(exception_index, CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool cpu_common_crash_occurred_needed(void *opaque)
+{
+    CPUState *cpu = opaque;
+
+    return cpu->crash_occurred;
+}
+
+static const VMStateDescription vmstate_cpu_common_crash_occurred = {
+    .name = "cpu_common/crash_occurred",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = cpu_common_crash_occurred_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_BOOL(crash_occurred, CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+const VMStateDescription vmstate_cpu_common = {
+    .name = "cpu_common",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .pre_load = cpu_common_pre_load,
+    .post_load = cpu_common_post_load,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32(halted, CPUState),
+        VMSTATE_UINT32(interrupt_request, CPUState),
+        VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * const []) {
+        &vmstate_cpu_common_exception_index,
+        &vmstate_cpu_common_crash_occurred,
+        NULL
+    }
+};
+
+void cpu_vmstate_register(CPUState *cpu)
+{
+    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
+        vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
+    }
+    if (cpu->cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
+    }
+}
+
+void cpu_vmstate_unregister(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_unregister(NULL, cc->sysemu_ops->legacy_vmsd, cpu);
+    }
+    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
+        vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
+    }
+}
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index cdd8de2fefa..1892acdee0f 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -10,6 +10,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
+#include "migration/vmstate.h"
 
 static const Property cpu_user_props[] = {
     /*
@@ -30,3 +31,14 @@ void cpu_exec_initfn(CPUState *cpu)
 {
     /* nothing to do */
 }
+
+void cpu_vmstate_register(CPUState *cpu)
+{
+    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
+           qdev_get_vmsd(DEVICE(cpu))->unmigratable);
+}
+
+void cpu_vmstate_unregister(CPUState *cpu)
+{
+    /* nothing to do */
+}
-- 
2.47.1


