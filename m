Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40F96C3C2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790558.1200447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfr-0003zi-SV; Wed, 04 Sep 2024 16:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790558.1200447; Wed, 04 Sep 2024 16:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfr-0003sK-GL; Wed, 04 Sep 2024 16:16:03 +0000
Received: by outflank-mailman (input) for mailman id 790558;
 Wed, 04 Sep 2024 16:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfp-0000LO-S9
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:16:01 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f910da40-6ad8-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 18:15:59 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f3f0a31ab2so77904341fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:59 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614f384eesm24841131fa.62.2024.09.04.09.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:58 -0700 (PDT)
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
X-Inumbo-ID: f910da40-6ad8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466559; x=1726071359; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNAX37zDCliJxTzZOV0veuq7ySJeesgiUypThOWliKg=;
        b=S4Vl5x6mvohebCnHgUWtAdmMF2wfgSt0fiY7GnlvWFN6G6ekRawLvuGyRIK1lzBqhP
         3XGoEodURgWpZHGFb9aMIo1VyVQMwwxZGB/faZi96oICFYg93cx1Dss/me+02TiGxFxG
         Ai83UP1z8mR0uSz0TntH44S2GpqUJ/mHSNwjZ5Vpcrf/a6j3EqK0rjM8MUK3jyIhY9o1
         uc0Pgb2995KJ6UT3IZGDg0vLYWsfeiOb4EorlptTOKQUHsLL9POIKw+SkuIpyIyfb0MX
         Murjrd+1tJbq6a/MSflCibD3kZ8buCbfydOazxw7Ahkv94cI6VEEMsUFYF6Qq8LJpP1e
         KHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466559; x=1726071359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNAX37zDCliJxTzZOV0veuq7ySJeesgiUypThOWliKg=;
        b=L2PKrlKGzH3Aiebxw9TtOhOfHbclR4QDc7+0yHHhX9+nS75GolYbbswetfMPM8ycX+
         ymDmyL3St7wfEZM06cio4zWfd/yESKdSCHOoSAmGf5qbCsu1EvrPdRqdOgi94oSojbAU
         5t+ChkwEwUU3l9FjHiKRgpgM4UAEkUDiOstXneSBfP1XNc3qd7PK2xrYAk6O1x+09Tkb
         PAUMFX8moMZSEkCWAkhhDRKQm9SIj6RefIPDNXXbzuHxMBwgag4J0zF3pkNHWt90byDj
         +2DDYG3s1/QY79JJX+wgyDvyEmmcTq+Ju0gl0X3suXQ9U1YDSGmaJSA7Wp70YJkTwJEf
         rnmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqEbnKManI77SCrXOXIS9YM8XEYmyr1T20Hq+h2UC3duqWevn9jtG174CBnG0bnnM5fmRZwuSrnJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRZr4t5AgsLGe0RmFOTt08zmN3kYDzzuzOkUX7fneayD9QmOp7
	zYKvXAPnmYHwi5Qa7VfU2rhlbtnjs3kmkHd3WCKsCtGXy2DWoY5s
X-Google-Smtp-Source: AGHT+IEAwPaVJCHA49+7M5oevfh+eYRN2zuFYPqyzy6yv+vvfKCbQ+16M9Wi0x4p76qr+HpI/LDCcw==
X-Received: by 2002:a2e:be03:0:b0:2ef:2b45:b71d with SMTP id 38308e7fff4ca-2f6103c83ccmr138143261fa.24.1725466558973;
        Wed, 04 Sep 2024 09:15:58 -0700 (PDT)
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
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v1 11/12] hw/i386/xen: Add a Xen PVH x86 machine
Date: Wed,  4 Sep 2024 18:15:35 +0200
Message-ID: <20240904161537.664189-12-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a Xen PVH x86 machine based on the abstract PVH Machine.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


