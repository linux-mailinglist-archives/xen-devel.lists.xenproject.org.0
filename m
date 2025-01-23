Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65DA1ADA8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876501.1286926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yw-0000yA-QG; Thu, 23 Jan 2025 23:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876501.1286926; Thu, 23 Jan 2025 23:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yw-0000tK-Ij; Thu, 23 Jan 2025 23:51:30 +0000
Received: by outflank-mailman (input) for mailman id 876501;
 Thu, 23 Jan 2025 23:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6tX-0007hN-Pb
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f406e78-d9e4-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:45:54 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436341f575fso16147015e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:54 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd43cdbbsm7488805e9.0.2025.01.23.15.45.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:52 -0800 (PST)
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
X-Inumbo-ID: 2f406e78-d9e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675953; x=1738280753; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvtCakZyrGCXwv1NUluQigNUDDDoRJgD07DKcxozaAI=;
        b=IdbepafowxlxzTKnGgOQ0vMfkH3kBJllrqugigxj6XZZNDgDlzNMC2rsWwESGnAVPl
         R+6JQN9hJz1jYaCTGSaiJH6dY84WaB/vdC4dDCMjTAeEUk011wLSUEn1dwGs++zLYcVs
         f40rQWfDhyuzONc6YHtP0apJIoxDiJfrAsFI2MijLSEJkS2j8e2px0ddp4ZMIgixl/5F
         kbj1wbeG3vi1zTz31QkGBHuB6CJ9JqPc7VJCz865xMwtXlU6Zd9lIsuGk3D+pdSLrWEh
         YpJFbB4gAzAAh8L4J8UsJJilafEpE2dFW0FAFOTOSiFG46V406FwgsIPkSTA3E+EOB9K
         vdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675953; x=1738280753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvtCakZyrGCXwv1NUluQigNUDDDoRJgD07DKcxozaAI=;
        b=NbVKTBg/UdWqMaQ6RBangpy+R0jqxJ5Aj2r3LyKMzI9VFw2+cfYGVZ8l6Oald17UxL
         mjanCcU09IwnthS3O0nYUAfDtiMMAllbDOyv+mU+OG9QYE+0P5wuUaJPIahbOYQZlQsB
         MKu2HyU2uLNVdsSVUP8fi/FXJOcjTcD3EfpZFzZp2NEhWKkSwUxML4iJlFt8sX0P9wJT
         qRIHIDIfRWeKJM20XqBkH7+R1/URIluTFIZXf0zyPeQofN3MmOFY0538l6IA3l6mEqkR
         STSWoRhKNhxHT9M+SAOV17RjJs9vZ+9/UDsoxNAeZM2I9c8+frsjDt/fIfC09p3HAt7v
         UTCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyEfUb6rxUSfCPo3uFiCs8uiVUrWq/Hi4TN4RUUHaS76vBnb0mLLKS/gVc3cqnQKBMwgyDqpL3dM8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdDvZa1yDr4GV54Z1OMyTg+JFzG949Z0CsF78jzIYiewoHOM0I
	vk/tHia5RqEj/9xtObe2UwXA+CUYvuT0i4uWu59yfztrcsip60lo0FNk233U4f4=
X-Gm-Gg: ASbGncsjyD0jPUhh/UYp2Tu+nLKJQmbf7J9O04jJqaqE8kCG9vyYyVbfahVGuyLRK5f
	IdxvM6BJ9zS5Z9AnClWsG3GjBxYqZOmqjQ3r6XbnbhpijPzeJYrnoEO6nYZy4icJYoJzssbdaqL
	aPwg1AQDOcmQjgOLsv7tPF9+HO4DJPjFwj2JdK350lGB/x4nFuEZZB3HcUO2A1hDWIGVPh/hBnY
	R1UF2APCwrPd4zX5IASE1wZwqqyv9TDOfqRjTE79aNP9R2/LgwmWfMPecAY6Gu4SBoRPOuRqINU
	qhqI14+iw7GcQE+EaTvdAfr4LskHR5i7Fz53gareS3AbXYqW8xVZ49Y=
X-Google-Smtp-Source: AGHT+IESHbhLNhi6WI+MIsv7kwcNIGaQJ9dXLlWxoyCR3XibduHPGVHiP0CzOiY9OItw0/7PMnFvyA==
X-Received: by 2002:a05:600c:1987:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-438913f2f4emr282730315e9.17.1737675953608;
        Thu, 23 Jan 2025 15:45:53 -0800 (PST)
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
Subject: [PATCH 17/20] cpus: Have cpu_class_init_props() per user / system emulation
Date: Fri, 24 Jan 2025 00:44:11 +0100
Message-ID: <20250123234415.59850-18-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rather than maintaining a mix of system / user code for CPU
class properties, move system properties to cpu-system.c
and user ones to the new cpu-user.c unit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c         | 58 --------------------------------------------
 hw/core/cpu-system.c | 40 ++++++++++++++++++++++++++++++
 hw/core/cpu-user.c   | 27 +++++++++++++++++++++
 hw/core/meson.build  |  5 +++-
 4 files changed, 71 insertions(+), 59 deletions(-)
 create mode 100644 hw/core/cpu-user.c

diff --git a/cpu-target.c b/cpu-target.c
index c05ef1ff096..dff8c0747f9 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -19,15 +19,12 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/qdev-core.h"
-#include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "migration/vmstate.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 #include "exec/address-spaces.h"
-#include "exec/memory.h"
 #endif
 #include "system/accel-ops.h"
 #include "system/cpus.h"
@@ -179,61 +176,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     accel_cpu_common_unrealize(cpu);
 }
 
-/*
- * This can't go in hw/core/cpu.c because that file is compiled only
- * once for both user-mode and system builds.
- */
-static const Property cpu_common_props[] = {
-#ifdef CONFIG_USER_ONLY
-    /*
-     * Create a property for the user-only object, so users can
-     * adjust prctl(PR_SET_UNALIGN) from the command-line.
-     * Has no effect if the target does not support the feature.
-     */
-    DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
-                     prctl_unalign_sigbus, false),
-#else
-    /*
-     * Create a memory property for system CPU object, so users can
-     * wire up its memory.  The default if no link is set up is to use
-     * the system address space.
-     */
-    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
-                     MemoryRegion *),
-#endif
-};
-
-#ifndef CONFIG_USER_ONLY
-static bool cpu_get_start_powered_off(Object *obj, Error **errp)
-{
-    CPUState *cpu = CPU(obj);
-    return cpu->start_powered_off;
-}
-
-static void cpu_set_start_powered_off(Object *obj, bool value, Error **errp)
-{
-    CPUState *cpu = CPU(obj);
-    cpu->start_powered_off = value;
-}
-#endif
-
-void cpu_class_init_props(DeviceClass *dc)
-{
-#ifndef CONFIG_USER_ONLY
-    ObjectClass *oc = OBJECT_CLASS(dc);
-
-    /*
-     * We can't use DEFINE_PROP_BOOL in the Property array for this
-     * property, because we want this to be settable after realize.
-     */
-    object_class_property_add_bool(oc, "start-powered-off",
-                                   cpu_get_start_powered_off,
-                                   cpu_set_start_powered_off);
-#endif
-
-    device_class_set_props(dc, cpu_common_props);
-}
-
 void cpu_exec_initfn(CPUState *cpu)
 {
 #ifndef CONFIG_USER_ONLY
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 6aae28a349a..c63c984a803 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -20,7 +20,10 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "exec/memory.h"
 #include "exec/tswap.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
 #include "hw/core/sysemu-cpu-ops.h"
 
 bool cpu_paging_enabled(const CPUState *cpu)
@@ -142,3 +145,40 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
     }
     return res;
 }
+
+static const Property cpu_system_props[] = {
+    /*
+     * Create a memory property for system CPU object, so users can
+     * wire up its memory.  The default if no link is set up is to use
+     * the system address space.
+     */
+    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+};
+
+static bool cpu_get_start_powered_off(Object *obj, Error **errp)
+{
+    CPUState *cpu = CPU(obj);
+    return cpu->start_powered_off;
+}
+
+static void cpu_set_start_powered_off(Object *obj, bool value, Error **errp)
+{
+    CPUState *cpu = CPU(obj);
+    cpu->start_powered_off = value;
+}
+
+void cpu_class_init_props(DeviceClass *dc)
+{
+    ObjectClass *oc = OBJECT_CLASS(dc);
+
+    /*
+     * We can't use DEFINE_PROP_BOOL in the Property array for this
+     * property, because we want this to be settable after realize.
+     */
+    object_class_property_add_bool(oc, "start-powered-off",
+                                   cpu_get_start_powered_off,
+                                   cpu_set_start_powered_off);
+
+    device_class_set_props(dc, cpu_system_props);
+}
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
new file mode 100644
index 00000000000..e5ccf6bf13a
--- /dev/null
+++ b/hw/core/cpu-user.c
@@ -0,0 +1,27 @@
+/*
+ * QEMU CPU model (user specific)
+ *
+ * Copyright (c) Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
+#include "hw/core/cpu.h"
+
+static const Property cpu_user_props[] = {
+    /*
+     * Create a property for the user-only object, so users can
+     * adjust prctl(PR_SET_UNALIGN) from the command-line.
+     * Has no effect if the target does not support the feature.
+     */
+    DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
+                     prctl_unalign_sigbus, false),
+};
+
+void cpu_class_init_props(DeviceClass *dc)
+{
+    device_class_set_props(dc, cpu_user_props);
+}
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 65a1698ed1f..b5a545a0edd 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -46,4 +46,7 @@ system_ss.add(files(
   'vm-change-state-handler.c',
   'clock-vmstate.c',
 ))
-user_ss.add(files('qdev-user.c'))
+user_ss.add(files(
+  'cpu-user.c',
+  'qdev-user.c',
+))
-- 
2.47.1


