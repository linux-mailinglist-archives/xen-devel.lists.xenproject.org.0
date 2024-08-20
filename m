Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9E5958952
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780542.1190260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPsH-0004h4-9c; Tue, 20 Aug 2024 14:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780542.1190260; Tue, 20 Aug 2024 14:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPsG-0004cx-NY; Tue, 20 Aug 2024 14:30:16 +0000
Received: by outflank-mailman (input) for mailman id 780542;
 Tue, 20 Aug 2024 14:30:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPsE-0000m9-NM
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:30:14 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6a0bd42-5f00-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:30:14 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52efc60a6e6so8080533e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:30:14 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-533449f5fdasm118978e87.284.2024.08.20.07.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:30:12 -0700 (PDT)
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
X-Inumbo-ID: b6a0bd42-5f00-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164213; x=1724769013; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb70tZhf6O0rqG3q2lg1Kgw4jrd26x22YIO9764ldGo=;
        b=jc/8/A4rHGCO692fgEx6TruDitoNfXvLzCOzpfNVA/iJQA1p0vUhINfBmBo7JMORMz
         S1Ydq53Q72Bvp3Vr1nqltZGZ3uPCy2DO2GwzJJII1KSpySA/yWf9AmwR1KMuuKet0UeQ
         6qhzCtovZH/mrPv2WnqmUhBuXOGAJShy0p8+0bmkvnob1T5mWtYiLSdN/j8ag62dwWHx
         0kOIMs46O/QHGwG0Dyd4ZJNTKIduXV8S4xq/otTpN+lZ0xXZJcGuPMPuo5aZl1/MFUkt
         c96ciIowyZLy+VSzROVbTYeoCUSI/4qCPdEq3XOOYq3m2Q9QwkWq4W689rkCw9mdH9Q8
         SZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164213; x=1724769013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qb70tZhf6O0rqG3q2lg1Kgw4jrd26x22YIO9764ldGo=;
        b=o4p3dbZMC1lPbcw1ugVbkhjGLRT67ZqEwSK9HrxeHHAwuqjsvOOI6LwCQzwC93A5vz
         u0XQclXZ0iqUT4P9u078FrUknExRYnngFw0sTOVdKuEnHXimzNKvb/jhRXGpMlxZWvvu
         ol4fDQiLX2VJYPI1t5+DWcIlkPEedIgfI7RBsVwUQXPMR6TUiAXsLETE0mHoQj6V0msX
         jgomG5mCQ0Kg2+1C9N8hLorlwMVNNL1RHQxRec1qHTvI0xUiNzux5FRAv0J59XmTdt2Q
         ET8Rgjv/lSb+pqfL/ifiE0jrVLnaE+K0iuYCk11W/khvOxBEVA1IUGcu4durDRK+NBJV
         PVtw==
X-Forwarded-Encrypted: i=1; AJvYcCXHR52t0wziCvrjNvMi+hQBWLWaQiRJe+PEPiKde8rcf7xVV9mtdcZBNvI6SUBNFlo4J3qruysD3snczemp9aEaFHOeAkeEB9Yjzjiaff8=
X-Gm-Message-State: AOJu0YyF6cBw5Ijx4NgCIB6dQvzsklPFS7JlmIP8aoxFAKII+0R+orG6
	RVsOkx8a9gl7Hh1VOOmeYtS92/72gVNUjbZILFI9dEoPMott/jgy
X-Google-Smtp-Source: AGHT+IFoXhrlxg3cNGb0+DSA5Qu76KzL7+3HHVZt7gmKWNEWr1BFmaIm+WYR3dUl/tDDDSx61bB+zA==
X-Received: by 2002:a05:6512:641a:b0:533:4477:28a2 with SMTP id 2adb3069b0e04-53344772a8emr1193165e87.16.1724164212866;
        Tue, 20 Aug 2024 07:30:12 -0700 (PDT)
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 11/12] hw/i386/xen: Add a Xen PVH x86 machine
Date: Tue, 20 Aug 2024 16:29:48 +0200
Message-ID: <20240820142949.533381-12-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a Xen PVH x86 machine based on the abstract PVH Machine.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/i386/xen/meson.build |   1 +
 hw/i386/xen/xen-pvh.c   | 121 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 hw/i386/xen/xen-pvh.c

diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index 3f0df8bc07..c73c62b8e3 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -4,6 +4,7 @@ i386_ss.add(when: 'CONFIG_XEN', if_true: files(
 ))
 i386_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-hvm.c',
+  'xen-pvh.c',
 ))
 
 i386_ss.add(when: 'CONFIG_XEN_BUS', if_true: files(
diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
new file mode 100644
index 0000000000..45645667e9
--- /dev/null
+++ b/hw/i386/xen/xen-pvh.c
@@ -0,0 +1,121 @@
+/*
+ * QEMU Xen PVH x86 Machine
+ *
+ * Copyright (c) 2024 Advanced Micro Devices, Inc.
+ * Written by Edgar E. Iglesias <edgar.iglesias@amd.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "hw/boards.h"
+#include "sysemu/sysemu.h"
+#include "hw/xen/arch_hvm.h"
+#include <xen/hvm/hvm_info_table.h>
+#include "hw/xen/xen-pvh-common.h"
+
+#define TYPE_XEN_PVH_X86  MACHINE_TYPE_NAME("xenpvh")
+OBJECT_DECLARE_SIMPLE_TYPE(XenPVHx86State, XEN_PVH_X86)
+
+struct XenPVHx86State {
+    /*< private >*/
+    XenPVHMachineState parent;
+
+    DeviceState **cpu;
+};
+
+static DeviceState *xen_pvh_cpu_new(MachineState *ms,
+                                    int64_t apic_id)
+{
+    Object *cpu = object_new(ms->cpu_type);
+
+    object_property_add_child(OBJECT(ms), "cpu[*]", cpu);
+    object_property_set_uint(cpu, "apic-id", apic_id, &error_fatal);
+    qdev_realize(DEVICE(cpu), NULL, &error_fatal);
+    object_unref(cpu);
+
+    return DEVICE(cpu);
+}
+
+static void xen_pvh_init(MachineState *ms)
+{
+    XenPVHx86State *xp = XEN_PVH_X86(ms);
+    int i;
+
+    /* Create dummy cores. This will indirectly create the APIC MSI window.  */
+    xp->cpu = g_malloc(sizeof xp->cpu[0] * ms->smp.max_cpus);
+    for (i = 0; i < ms->smp.max_cpus; i++) {
+        xp->cpu[i] = xen_pvh_cpu_new(ms, i);
+    }
+}
+
+static void xen_pvh_instance_init(Object *obj)
+{
+    XenPVHMachineState *s = XEN_PVH_MACHINE(obj);
+
+    /* Default values.  */
+    s->cfg.ram_low = (MemMapEntry) { 0x0, 0x80000000U };
+    s->cfg.ram_high = (MemMapEntry) { 0xC000000000ULL, 0x4000000000ULL };
+    s->cfg.pci_intx_irq_base = 16;
+}
+
+/*
+ * Deliver INTX interrupts to Xen guest.
+ */
+static void xen_pvh_set_pci_intx_irq(void *opaque, int irq, int level)
+{
+    /*
+     * Since QEMU emulates all of the swizziling
+     * We don't want Xen to do any additional swizzling in
+     * xen_set_pci_intx_level() so we always set device to 0.
+     */
+    if (xen_set_pci_intx_level(xen_domid, 0, 0, 0, irq, level)) {
+        error_report("xendevicemodel_set_pci_intx_level failed");
+    }
+}
+
+static void xen_pvh_machine_class_init(ObjectClass *oc, void *data)
+{
+    XenPVHMachineClass *xpc = XEN_PVH_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Xen PVH x86 machine";
+    mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
+
+    /* mc->max_cpus holds the MAX value allowed in the -smp cmd-line opts. */
+    mc->max_cpus = HVM_MAX_VCPUS;
+
+    /* We have an implementation specific init to create CPU objects.  */
+    xpc->init = xen_pvh_init;
+
+    /*
+     * PCI INTX routing.
+     *
+     * We describe the mapping between the 4 INTX interrupt and GSIs
+     * using xen_set_pci_link_route(). xen_pvh_set_pci_intx_irq is
+     * used to deliver the interrupt.
+     */
+    xpc->set_pci_intx_irq = xen_pvh_set_pci_intx_irq;
+    xpc->set_pci_link_route = xen_set_pci_link_route;
+
+    /* List of supported features known to work on PVH x86.  */
+    xpc->has_pci = true;
+
+    xen_pvh_class_setup_common_props(xpc);
+}
+
+static const TypeInfo xen_pvh_x86_machine_type = {
+    .name = TYPE_XEN_PVH_X86,
+    .parent = TYPE_XEN_PVH_MACHINE,
+    .class_init = xen_pvh_machine_class_init,
+    .instance_init = xen_pvh_instance_init,
+    .instance_size = sizeof(XenPVHx86State),
+};
+
+static void xen_pvh_machine_register_types(void)
+{
+    type_register_static(&xen_pvh_x86_machine_type);
+}
+
+type_init(xen_pvh_machine_register_types)
-- 
2.43.0


