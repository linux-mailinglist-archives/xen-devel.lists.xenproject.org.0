Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A037FF27B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644813.1006463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCa-0001cC-SW; Thu, 30 Nov 2023 14:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644813.1006463; Thu, 30 Nov 2023 14:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCZ-0001Cp-8n; Thu, 30 Nov 2023 14:39:39 +0000
Received: by outflank-mailman (input) for mailman id 644813;
 Thu, 30 Nov 2023 14:35:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i8V-0008E0-KQ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:35:27 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b316c244-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:35:26 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:35:24 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:15 -0800
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
X-Inumbo-ID: b316c244-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354926; x=1732890926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f8dzVIiaV15FUJhTAcShJBTihquI/MGo+GvFSgqbGOs=;
  b=KBVmNrXf0jr/ocJ1dMv3RJ4GeezN/D1eOKUOAgMQZ1Jl6FYopYQeIRxi
   XsBFeRkWisBCNVLQQhXtMSbB3sV0GsjnOuu5HDfDnTl+YsIm5/UZ2Ncja
   WclvS8zR2OYRvSnpnrKctAMdrVh9nDeoJskszWRK8u5gHXuKupjyw1AzT
   zPVCPvr8R/LXVutPUuMC6DPYn0mVwg409xoOLsAw+KM1adhPJDUmJsmEP
   91CCfmOYJzueKsA0RuVyC+dnp8dsg9qxxeNAIpKjLwpb1k2FXu8ndCZxO
   po350qESlE6zwIE+ujasntYj24hovTMWQsTmq3l9bwIJc8rwxnmT9w/Oh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532402"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532402"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730271"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730271"
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
Subject: [RFC 31/41] hw/machine: Plug cpu-slot into machine to maintain topology tree
Date: Thu, 30 Nov 2023 22:41:53 +0800
Message-Id: <20231130144203.2307629-32-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Add a cpu-slot in machine as the root of topology tree to maintain the
QOM topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 31 +++++++++++++++++++++++++++++++
 include/hw/boards.h        |  2 ++
 include/hw/core/cpu-slot.h |  7 +++++++
 system/vl.c                |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index 2a796ad5b6e7..4b148440ed3d 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 
+#include "hw/boards.h"
 #include "hw/core/cpu-slot.h"
 #include "qapi/error.h"
 
@@ -165,3 +166,33 @@ static void cpu_slot_register_types(void)
 }
 
 type_init(cpu_slot_register_types)
+
+void machine_plug_cpu_slot(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    ms->topo = CPU_SLOT(qdev_new(TYPE_CPU_SLOT));
+
+    object_property_add_child(container_get(OBJECT(ms), "/peripheral"),
+                              "cpu-slot", OBJECT(ms->topo));
+    DEVICE(ms->topo)->id = g_strdup_printf("%s", "cpu-slot");
+
+    qdev_realize_and_unref(DEVICE(ms->topo), NULL, &error_abort);
+    ms->topo->ms = ms;
+
+    if (!mc->smp_props.clusters_supported) {
+        clear_bit(CPU_TOPO_CLUSTER, ms->topo->supported_levels);
+    }
+
+    if (!mc->smp_props.dies_supported) {
+        clear_bit(CPU_TOPO_DIE, ms->topo->supported_levels);
+    }
+
+    if (!mc->smp_props.books_supported) {
+        clear_bit(CPU_TOPO_BOOK, ms->topo->supported_levels);
+    }
+
+    if (!mc->smp_props.drawers_supported) {
+        clear_bit(CPU_TOPO_DRAWER, ms->topo->supported_levels);
+    }
+}
diff --git a/include/hw/boards.h b/include/hw/boards.h
index da85f86efb91..81a7b04ece86 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -10,6 +10,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "hw/core/cpu.h"
+#include "hw/core/cpu-slot.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
@@ -398,6 +399,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    CPUSlot *topo;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index 7bf51988afb3..1361af4ccfc0 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -78,6 +78,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
  *     when necessary.
  * @stat: Statistical topology information for topology tree.
  * @supported_levels: Supported topology levels for topology tree.
+ * @ms: Machine in which this cpu-slot is plugged.
  */
 struct CPUSlot {
     /*< private >*/
@@ -87,6 +88,12 @@ struct CPUSlot {
     QTAILQ_HEAD(, CPUCore) cores;
     CPUTopoStat stat;
     DECLARE_BITMAP(supported_levels, USER_AVAIL_LEVEL_NUM);
+    MachineState *ms;
 };
 
+#define MACHINE_CORE_FOREACH(ms, core) \
+    QTAILQ_FOREACH((core), &(ms)->topo->cores, node)
+
+void machine_plug_cpu_slot(MachineState *ms);
+
 #endif /* CPU_SLOT_H */
diff --git a/system/vl.c b/system/vl.c
index 65add2fb2460..637f708d2265 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2128,6 +2128,8 @@ static void qemu_create_machine(QDict *qdict)
                                           false, &error_abort);
         qobject_unref(default_opts);
     }
+
+    machine_plug_cpu_slot(current_machine);
 }
 
 static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
-- 
2.34.1


