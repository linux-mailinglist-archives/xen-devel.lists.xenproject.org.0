Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A390394EDB2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775499.1185782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUks-0001PV-I1; Mon, 12 Aug 2024 13:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775499.1185782; Mon, 12 Aug 2024 13:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUks-0001FU-8g; Mon, 12 Aug 2024 13:06:34 +0000
Received: by outflank-mailman (input) for mailman id 775499;
 Mon, 12 Aug 2024 13:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUkq-00074b-8p
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:32 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b19c9544-58ab-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 15:06:31 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f149845fbaso45483501fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:31 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f291df3c4esm8503311fa.40.2024.08.12.06.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:29 -0700 (PDT)
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
X-Inumbo-ID: b19c9544-58ab-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467991; x=1724072791; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpYqNKXAVuA0a+6/wfjyGjtY9ZeW5tCWM6T6raDN/Y4=;
        b=QgtnSVwvc56thpNKoLxfoUNC63Fjzv+hEvod3nd6UDvPR2s3IUGi6j4YUV2BpclwMj
         BjlEsJzQGwLC8NZQXg5i8Mfidi05RWTd3CErmFhpyv5nOrFa7hD3j1YItkMjfh+S85af
         +DFERiStt4Tc8Qgb2/DiH4FQFy8pD41uaBRT76Rf9bGucoReXgZ6UfbnFmPnHBGcK73f
         SHwF3Wlp8PIaINzUIL+DbpcC8nlSWf/fzhlCA2FIu5mJz4xj/2yxLhNkAUY7E+Pe7vbw
         mSAZrWwIvHf9ejvtUCrHFUxnW+wwTqZzhkrCYtWfbzUD24M+53KWpOmHeEw/Nq4O++PQ
         odkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467991; x=1724072791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpYqNKXAVuA0a+6/wfjyGjtY9ZeW5tCWM6T6raDN/Y4=;
        b=iisgonhi8F+AiaTVJt/i++d9IhHL9UGi/9O6XFH76/7hy4+aRfCoct5BUquQyzT533
         ElZGfsNE8ThATyyY2adxpfnpXhfz2iP3Q2i4W4WyAGMDD1n+z0fD6CAuc7eQsa5oGmVm
         ZB1hQmIFZjL7wXbDPFvQb/Xij70UTeBH+yxmcAtzNJbUZ7BI3IooQH2++nYociaeWGGj
         VDs7Lhcdzpf/39qFCXaoL2m7Gv8BOR6Hn0TeQPziNo/LUzmVUj0BanAz40VF7bojwY2W
         1/Z1iT+Wq6j8SQ/zmJtAKzn8WLKi97gMsyCjDzLlRIUPd1ruhNJoVKSTe8a3++a9fbPR
         AaNw==
X-Forwarded-Encrypted: i=1; AJvYcCWPbfU8bBwWKDJzAH0XSWGwS4OxTstfwKlVYECoyaMVf6xMzhZsJdF5qdLTSLnagMYx+o3fk/XcFWG/C78RT7de8cGebOo16j/dou7Miw0=
X-Gm-Message-State: AOJu0YwFS4RRpunwJmAIjLPeT9jlombF23gc82tM5KYMoCNaMEhJ9JMP
	Tv0cTHnGbTjAZQ9Z3mpehiv880foqE2gd40D/AgcdqymNMxFRkT3
X-Google-Smtp-Source: AGHT+IFbDkFVn4nHNTgp2rSK1ep8EB3W/CnGnNoziWsVxIa3hCXemD+rWCA6eJi3qacG+boCLJdOoQ==
X-Received: by 2002:a2e:2414:0:b0:2ef:1808:7523 with SMTP id 38308e7fff4ca-2f2b714d294mr1493031fa.18.1723467990279;
        Mon, 12 Aug 2024 06:06:30 -0700 (PDT)
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
Subject: [PATCH v1 09/10] hw/i386/xen: Add a Xen PVH x86 machine
Date: Mon, 12 Aug 2024 15:06:04 +0200
Message-ID: <20240812130606.90410-10-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This adds a Xen PVH x86 machine based on the PVH Common
module used by the ARM PVH machine.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/i386/xen/meson.build |   1 +
 hw/i386/xen/xen-pvh.c   | 196 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 197 insertions(+)
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
index 0000000000..9c3d3fc58d
--- /dev/null
+++ b/hw/i386/xen/xen-pvh.c
@@ -0,0 +1,196 @@
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
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/error-report.h"
+#include "hw/boards.h"
+#include "sysemu/sysemu.h"
+#include "hw/xen/arch_hvm.h"
+#include "hw/xen/xen.h"
+#include "hw/xen/xen-pvh-common.h"
+
+#define TYPE_XEN_PVH_X86  MACHINE_TYPE_NAME("xenpvh")
+OBJECT_DECLARE_SIMPLE_TYPE(XenPVHx86State, XEN_PVH_X86)
+
+#define PVH_MAX_CPUS 128
+
+struct XenPVHx86State {
+    /*< private >*/
+    MachineState parent;
+
+    DeviceState *cpu[PVH_MAX_CPUS];
+    XenPVHCommonState pvh;
+
+    /*
+     * We provide these properties to allow Xen to move things to other
+     * addresses for example when users need to accomodate the memory-map
+     * for 1:1 mapped devices/memory.
+     */
+    struct {
+        MemMapEntry ram_low, ram_high;
+        MemMapEntry pci_ecam, pci_mmio, pci_mmio_high;
+    } cfg;
+};
+
+static void xenpvh_cpu_new(MachineState *ms,
+                           XenPVHx86State *xp,
+                           int cpu_idx,
+                           int64_t apic_id)
+{
+    Object *cpu = object_new(ms->cpu_type);
+
+    object_property_add_child(OBJECT(ms), "cpu[*]", cpu);
+    object_property_set_uint(cpu, "apic-id", apic_id, &error_fatal);
+    qdev_realize(DEVICE(cpu), NULL, &error_fatal);
+    object_unref(cpu);
+
+    xp->cpu[cpu_idx] = DEVICE(cpu);
+}
+
+static void xenpvh_init(MachineState *ms)
+{
+    XenPVHx86State *xp = XEN_PVH_X86(ms);
+    const struct {
+        const char *name;
+        MemMapEntry *map;
+    } map[] = {
+        { "ram-low", &xp->cfg.ram_low },
+        { "ram-high", &xp->cfg.ram_high },
+        { "pci-ecam", &xp->cfg.pci_ecam },
+        { "pci-mmio", &xp->cfg.pci_mmio },
+        { "pci-mmio-high", &xp->cfg.pci_mmio_high },
+    };
+    int i;
+
+    object_initialize_child(OBJECT(ms), "pvh", &xp->pvh, TYPE_XEN_PVH_COMMON);
+    object_property_set_int(OBJECT(&xp->pvh), "max-cpus", ms->smp.max_cpus,
+                            &error_abort);
+    object_property_set_int(OBJECT(&xp->pvh), "ram-size", ms->ram_size,
+                            &error_abort);
+
+    for (i = 0; i < ARRAY_SIZE(map); i++) {
+        g_autofree char *base_name = g_strdup_printf("%s-base", map[i].name);
+        g_autofree char *size_name = g_strdup_printf("%s-size", map[i].name);
+
+        object_property_set_int(OBJECT(&xp->pvh), base_name, map[i].map->base,
+                                 &error_abort);
+        object_property_set_int(OBJECT(&xp->pvh), size_name, map[i].map->size,
+                                 &error_abort);
+    }
+
+    /* GSI's 16 - 20 are used for legacy PCIe INTX IRQs.  */
+    object_property_set_int(OBJECT(&xp->pvh), "pci-intx-irq-base", 16,
+                            &error_abort);
+
+    sysbus_realize(SYS_BUS_DEVICE(&xp->pvh), &error_abort);
+
+    /* Create dummy cores. This will indirectly create the APIC MSI window.  */
+    for (i = 0; i < ms->smp.cpus; i++) {
+        xenpvh_cpu_new(ms, xp, i, i);
+    }
+}
+
+#define XENPVH_PROP_MEMMAP_SETTER(n, f)                                    \
+static void xenpvh_set_ ## n ## _ ## f(Object *obj, Visitor *v,            \
+                                       const char *name, void *opaque,     \
+                                       Error **errp)                       \
+{                                                                          \
+    XenPVHx86State *xp = XEN_PVH_X86(obj);                                 \
+    uint64_t value;                                                        \
+                                                                           \
+    if (!visit_type_size(v, name, &value, errp)) {                         \
+        return;                                                            \
+    }                                                                      \
+    xp->cfg.n.f = value;                                                   \
+}
+
+#define XENPVH_PROP_MEMMAP_GETTER(n, f)                                    \
+static void xenpvh_get_ ## n ## _ ## f(Object *obj, Visitor *v,            \
+                                       const char *name, void *opaque,     \
+                                       Error **errp)                       \
+{                                                                          \
+    XenPVHx86State *xp = XEN_PVH_X86(obj);                                 \
+    uint64_t value = xp->cfg.n.f;                                          \
+                                                                           \
+    visit_type_uint64(v, name, &value, errp);                              \
+}
+
+#define XENPVH_PROP_MEMMAP(n)              \
+    XENPVH_PROP_MEMMAP_SETTER(n, base)     \
+    XENPVH_PROP_MEMMAP_SETTER(n, size)     \
+    XENPVH_PROP_MEMMAP_GETTER(n, base)     \
+    XENPVH_PROP_MEMMAP_GETTER(n, size)
+
+
+XENPVH_PROP_MEMMAP(ram_low)
+XENPVH_PROP_MEMMAP(ram_high)
+XENPVH_PROP_MEMMAP(pci_ecam)
+XENPVH_PROP_MEMMAP(pci_mmio)
+XENPVH_PROP_MEMMAP(pci_mmio_high)
+
+static void xenpvh_instance_init(Object *obj)
+{
+    XenPVHx86State *xp = XEN_PVH_X86(obj);
+
+    /* Default memmap.  */
+    xp->cfg.ram_low.base = 0x0;
+    xp->cfg.ram_low.size = 0x80000000U;
+    xp->cfg.ram_high.base = 0xC000000000ULL;
+    xp->cfg.ram_high.size = 0x4000000000ULL;
+}
+
+static void xenpvh_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Xen PVH x86 machine";
+    mc->init = xenpvh_init;
+    mc->max_cpus = PVH_MAX_CPUS;
+    mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
+    mc->default_machine_opts = "accel=xen";
+    /* Set explicitly here to make sure that real ram_size is passed */
+    mc->default_ram_size = 0;
+
+#define OC_MEMMAP_PROP(c, prop_name, name)                               \
+do {                                                                     \
+    object_class_property_add(c, prop_name "-base", "uint64_t",          \
+                              xenpvh_get_ ## name ## _base,              \
+                              xenpvh_set_ ## name ## _base, NULL, NULL); \
+    object_class_property_set_description(oc, prop_name "-base",         \
+                              prop_name " base address");                \
+    object_class_property_add(c, prop_name "-size", "uint64_t",          \
+                              xenpvh_get_ ## name ## _size,              \
+                              xenpvh_set_ ## name ## _size, NULL, NULL); \
+    object_class_property_set_description(oc, prop_name "-size",         \
+                              prop_name " size of memory region");       \
+} while (0)
+
+    OC_MEMMAP_PROP(oc, "ram-low", ram_low);
+    OC_MEMMAP_PROP(oc, "ram-high", ram_high);
+    OC_MEMMAP_PROP(oc, "pci-ecam", pci_ecam);
+    OC_MEMMAP_PROP(oc, "pci-mmio", pci_mmio);
+    OC_MEMMAP_PROP(oc, "pci-mmio-high", pci_mmio_high);
+}
+
+static const TypeInfo xenpvh_machine_type = {
+    .name = TYPE_XEN_PVH_X86,
+    .parent = TYPE_MACHINE,
+    .class_init = xenpvh_machine_class_init,
+    .instance_init = xenpvh_instance_init,
+    .instance_size = sizeof(XenPVHx86State),
+};
+
+static void xenpvh_machine_register_types(void)
+{
+    type_register_static(&xenpvh_machine_type);
+}
+
+type_init(xenpvh_machine_register_types)
-- 
2.43.0


