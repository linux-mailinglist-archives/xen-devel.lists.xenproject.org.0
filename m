Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3187FF265
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644761.1006250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC5-0002lv-0l; Thu, 30 Nov 2023 14:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644761.1006250; Thu, 30 Nov 2023 14:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC4-0002ZO-TK; Thu, 30 Nov 2023 14:39:08 +0000
Received: by outflank-mailman (input) for mailman id 644761;
 Thu, 30 Nov 2023 14:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i5T-0007mE-FJ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:32:19 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42135ca2-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:32:17 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:31:48 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:38 -0800
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
X-Inumbo-ID: 42135ca2-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354738; x=1732890738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0HgUkt24A8GDXQknSCYGY0tM/5gPDdFuKpTNl12j5yE=;
  b=HcInUAROq26TgcQAWAlkd14Rcx+2MlqftpfeNAQ+DQgbwMiDHqu9DrX2
   GKii5ksO4Ck7OjrxO3SuzMgDWBzWBvadWXPrv99rA9XEBOBWcANBF7z2x
   4bh8RgP4TUsdoLqDr7zIKhpgINAXD9nFukR6agvFzkFHSj+kR9Wl8wjFx
   YjSInGpT0px8hGSPmyOngr1jn4XX9LR4r6gE+6vsTXkJoZS4w0QMvlKo5
   GO8y2DzScB2Z8iPf1wZgQKTAOdpJ88JLHE6cA/QOcN8PmfsVhI661jgeo
   VSnTXhkibZC5I3diWC2Llq+99IM3fhe8Bg3/RhMMX0AUFnFu4aKC3j/9+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531413"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531413"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729736"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729736"
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Zhiyuan Lv <zhiyuan.lv@intel.com>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 08/41] hw/core/topo: Introduce CPU topology device abstraction
Date: Thu, 30 Nov 2023 22:41:30 +0800
Message-Id: <20231130144203.2307629-9-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

To create more flexible CPU topologies (both symmetric and
heterogeneous) via the "-device" interface, it is necessary to convert
the current CPU topology hierarchies into the special CPU topology
devices.

The CPU topology will be built as a tree, and the device with the
CPU_TOPO_ROOT level is the only root of this CPU topology tree.

The different levels of CPU topology devices are connected in the
"-device" cli with the child<> property, which in turn will be set the
Object.parent through the qdev interface. And ultimately at the
realize(), CPU topology devices will be linked to their topological
parent based on the Object.parent field, and then be inserted into the
topology tree.

As the first step, introduce the basic CPU topology device abstraction,
as well as the topology tree and topology hierarchy construction based
on the CPU topology devices.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS                |   2 +
 hw/core/cpu-topo.c         | 201 +++++++++++++++++++++++++++++++++++++
 hw/core/meson.build        |   1 +
 include/hw/core/cpu-topo.h |  79 +++++++++++++++
 4 files changed, 283 insertions(+)
 create mode 100644 hw/core/cpu-topo.c
 create mode 100644 include/hw/core/cpu-topo.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fdbabaa983cc..564cb776ae80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1854,6 +1854,7 @@ R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
 F: hw/core/cpu.c
+F: hw/core/cpu-topo.c
 F: hw/core/machine-qmp-cmds.c
 F: hw/core/machine.c
 F: hw/core/machine-smp.c
@@ -1865,6 +1866,7 @@ F: qapi/machine-common.json
 F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
+F: include/hw/core/cpu-topo.h
 F: include/hw/cpu/cluster.h
 F: include/sysemu/numa.h
 F: tests/unit/test-smp-parse.c
diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
new file mode 100644
index 000000000000..4428b979a5dc
--- /dev/null
+++ b/hw/core/cpu-topo.c
@@ -0,0 +1,201 @@
+/*
+ * General CPU topology device abstraction
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/core/cpu-topo.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+
+static const char *cpu_topo_level_to_string(CPUTopoLevel level)
+{
+    switch (level) {
+    case CPU_TOPO_UNKNOWN:
+        return "unknown";
+    case CPU_TOPO_THREAD:
+        return "thread";
+    case CPU_TOPO_CORE:
+        return "core";
+    case CPU_TOPO_CLUSTER:
+        return "cluster";
+    case CPU_TOPO_DIE:
+        return "die";
+    case CPU_TOPO_SOCKET:
+        return "socket";
+    case CPU_TOPO_BOOK:
+        return "book";
+    case CPU_TOPO_DRAWER:
+        return "drawer";
+    case CPU_TOPO_ROOT:
+        return "root";
+    }
+
+    return NULL;
+}
+
+static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
+{
+    CPUTopoState *parent = topo->parent;
+    CPUTopoLevel level = CPU_TOPO_LEVEL(topo);
+    g_autofree char *name = NULL;
+
+    if (!parent) {
+        return;
+    }
+
+    if (parent->child_level == CPU_TOPO_UNKNOWN) {
+        parent->child_level = level;
+    } else if (parent->child_level != level) {
+        error_setg(errp, "cpu topo: the parent level %s asks for the "
+                   "%s child, but current level is %s",
+                   cpu_topo_level_to_string(CPU_TOPO_LEVEL(parent)),
+                   cpu_topo_level_to_string(parent->child_level),
+                   cpu_topo_level_to_string(level));
+        return;
+    }
+
+    if (parent->max_children && parent->max_children <= parent->num_children) {
+        error_setg(errp, "cpu topo: the parent limit the (%d) children, "
+                   "currently it has %d children",
+                   parent->max_children,
+                   parent->num_children);
+        return;
+    }
+
+    parent->num_children++;
+    QTAILQ_INSERT_TAIL(&parent->children, topo, sibling);
+}
+
+static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
+{
+    Object *obj = OBJECT(topo);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(topo);
+
+    if (!obj->parent) {
+        return;
+    }
+
+    if (object_dynamic_cast(obj->parent, TYPE_CPU_TOPO)) {
+        CPUTopoState *parent = CPU_TOPO(obj->parent);
+
+        if (level >= CPU_TOPO_LEVEL(parent)) {
+            error_setg(errp, "cpu topo: current level (%s) should be "
+                       "lower than parent (%s) level",
+                       object_get_typename(obj),
+                       object_get_typename(OBJECT(parent)));
+            return;
+        }
+        topo->parent = parent;
+    }
+
+    if (topo->parent) {
+        cpu_topo_build_hierarchy(topo, errp);
+    }
+}
+
+static void cpu_topo_realize(DeviceState *dev, Error **errp)
+{
+    CPUTopoState *topo = CPU_TOPO(dev);
+    CPUTopoClass *tc = CPU_TOPO_GET_CLASS(topo);
+
+    if (tc->level == CPU_TOPO_UNKNOWN) {
+        error_setg(errp, "cpu topo: no level specified"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+        return;
+    }
+
+    cpu_topo_set_parent(topo, errp);
+}
+
+static void cpu_topo_destroy_hierarchy(CPUTopoState *topo)
+{
+    CPUTopoState *parent = topo->parent;
+
+    if (!parent) {
+        return;
+    }
+
+    QTAILQ_REMOVE(&parent->children, topo, sibling);
+    parent->num_children--;
+
+    if (!parent->num_children) {
+        parent->child_level = CPU_TOPO_UNKNOWN;
+    }
+}
+
+static void cpu_topo_unrealize(DeviceState *dev)
+{
+    CPUTopoState *topo = CPU_TOPO(dev);
+
+    /*
+     * The specific unrealize method must consider the bottom-up,
+     * layer-by-layer unrealization implementation.
+     */
+    g_assert(!topo->num_children);
+
+    if (topo->parent) {
+        cpu_topo_destroy_hierarchy(topo);
+    }
+}
+
+static void cpu_topo_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    /* All topology devices belong to CPU property. */
+    set_bit(DEVICE_CATEGORY_CPU, dc->categories);
+    dc->realize = cpu_topo_realize;
+    dc->unrealize = cpu_topo_unrealize;
+
+    /*
+     * The general topo device is not hotpluggable by default.
+     * If any topo device needs hotplug support, this flag must be
+     * overridden under arch-specific topo device code.
+     */
+    dc->hotpluggable = false;
+
+    tc->level = CPU_TOPO_UNKNOWN;
+}
+
+static void cpu_topo_instance_init(Object *obj)
+{
+    CPUTopoState *topo = CPU_TOPO(obj);
+    QTAILQ_INIT(&topo->children);
+
+    topo->child_level = CPU_TOPO_UNKNOWN;
+}
+
+static const TypeInfo cpu_topo_type_info = {
+    .name = TYPE_CPU_TOPO,
+    .parent = TYPE_DEVICE,
+    .abstract = true,
+    .class_size = sizeof(CPUTopoClass),
+    .class_init = cpu_topo_class_init,
+    .instance_size = sizeof(CPUTopoState),
+    .instance_init = cpu_topo_instance_init,
+};
+
+static void cpu_topo_register_types(void)
+{
+    type_register_static(&cpu_topo_type_info);
+}
+
+type_init(cpu_topo_register_types)
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 67dad04de559..501d2529697e 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -23,6 +23,7 @@ else
 endif
 
 common_ss.add(files('cpu-common.c'))
+common_ss.add(files('cpu-topo.c'))
 common_ss.add(files('machine-smp.c'))
 system_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 system_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
new file mode 100644
index 000000000000..ebcbdd854da5
--- /dev/null
+++ b/include/hw/core/cpu-topo.h
@@ -0,0 +1,79 @@
+/*
+ * General CPU topology device abstraction
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef CPU_TOPO_H
+#define CPU_TOPO_H
+
+#include "hw/qdev-core.h"
+#include "qemu/queue.h"
+
+typedef enum CPUTopoLevel {
+    CPU_TOPO_UNKNOWN,
+    CPU_TOPO_THREAD,
+    CPU_TOPO_CORE,
+    CPU_TOPO_CLUSTER,
+    CPU_TOPO_DIE,
+    CPU_TOPO_SOCKET,
+    CPU_TOPO_BOOK,
+    CPU_TOPO_DRAWER,
+    CPU_TOPO_ROOT,
+} CPUTopoLevel;
+
+#define TYPE_CPU_TOPO "cpu-topo"
+OBJECT_DECLARE_TYPE(CPUTopoState, CPUTopoClass, CPU_TOPO)
+
+/**
+ * CPUTopoClass:
+ * @level: Topology level for this CPUTopoClass.
+ */
+struct CPUTopoClass {
+    /*< private >*/
+    DeviceClass parent_class;
+
+    /*< public >*/
+    CPUTopoLevel level;
+};
+
+/**
+ * CPUTopoState:
+ * @num_children: Number of topology children under this topology device.
+ * @max_children: Maximum number of children allowed to be inserted under
+ *     this topology device.
+ * @child_level: Topology level for children.
+ * @parent: Topology parent of this topology device.
+ * @children: Queue of topology children.
+ * @sibling: Queue node to be inserted in parent's topology queue.
+ */
+struct CPUTopoState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    int num_children;
+    int max_children;
+    CPUTopoLevel child_level;
+    struct CPUTopoState *parent;
+    QTAILQ_HEAD(, CPUTopoState) children;
+    QTAILQ_ENTRY(CPUTopoState) sibling;
+};
+
+#define CPU_TOPO_LEVEL(topo)    (CPU_TOPO_GET_CLASS(topo)->level)
+
+#endif /* CPU_TOPO_H */
-- 
2.34.1


