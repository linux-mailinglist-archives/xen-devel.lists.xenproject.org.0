Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235497FF276
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644803.1006442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCW-0000cB-PB; Thu, 30 Nov 2023 14:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644803.1006442; Thu, 30 Nov 2023 14:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCU-0000D7-Ra; Thu, 30 Nov 2023 14:39:34 +0000
Received: by outflank-mailman (input) for mailman id 644803;
 Thu, 30 Nov 2023 14:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i8C-0008E0-Vg
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:35:08 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7d88ddb-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:35:08 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:35:05 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:56 -0800
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
X-Inumbo-ID: a7d88ddb-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354908; x=1732890908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3aKtyhn4HEa/g5VVCwXVJ9czPMzUH1bTJvhs1x/p4jk=;
  b=ieFe+1UVXlIIJXNKd/9MWm4Gc6rcYToj1iYhCzXmPwn5QLhNydPUvpMh
   j1H9ACEAhWd8dnLFZv2iYlNMbrEhesI8pEvXUaWI9YWf41U/uru7TdUaj
   FvQesVheSpJoPElFhGSq34EjSgokWyjBOMhpUS0yxg1QYrpS+unE71YCT
   N5I94aGRNCVRixca+6Qh8LMGXMiZRFrnHiI5llM5/hw9wxd8U0v5Cs1Ty
   mItLO9qeNMzJ4mI0j5LXkIFpC9Wbxa/AMOebsNB9TWz7OBj7iyHtKivdd
   7CVCI5P2nil+Wt3TkE356S/kqiybNbMoumT4CX1b0BY5DJyeXfiWUUS5n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532332"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532332"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730181"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730181"
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
Subject: [RFC 29/41] hw/core/slot: Statistics topology information in CPU slot
Date: Thu, 30 Nov 2023 22:41:51 +0800
Message-Id: <20231130144203.2307629-30-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

The CPU slot, as the root of the topology tree, is responsible for
global topology information collection and updates.

When a new topology device is added to/deleted from the topology tree,
update the corresponding information in the slot.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 41 +++++++++++++++++++++++++++++++++++-
 include/hw/core/cpu-slot.h | 43 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index a6b7d98dea18..e8e6f4d25532 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -22,14 +22,44 @@
 
 #include "hw/core/cpu-slot.h"
 
+static inline
+CPUTopoStatEntry *get_topo_stat_entry(CPUTopoStat *stat,
+                                      CPUTopoLevel level)
+{
+    assert(level != CPU_TOPO_UNKNOWN);
+
+    return &stat->entries[TOPO_STAT_ENTRY_IDX(level)];
+}
+
 static void cpu_slot_add_topo_info(CPUTopoState *root, CPUTopoState *child)
 {
     CPUSlot *slot = CPU_SLOT(root);
     CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUTopoStatEntry *entry;
 
     if (level == CPU_TOPO_CORE) {
-        QTAILQ_INSERT_TAIL(&slot->cores, CPU_CORE(child), node);
+        CPUCore *core = CPU_CORE(child);
+        CPUTopoStatEntry *thread_entry;
+
+        QTAILQ_INSERT_TAIL(&slot->cores, core, node);
+
+        /* Max CPUs per core is pre-configured by "nr-threads". */
+        slot->stat.max_cpus += core->nr_threads;
+        slot->stat.pre_plugged_cpus += core->plugged_threads;
+
+        thread_entry = get_topo_stat_entry(&slot->stat, CPU_TOPO_THREAD);
+        if (child->max_children > thread_entry->max_units) {
+            thread_entry->max_units = child->max_children;
+        }
     }
+
+    entry = get_topo_stat_entry(&slot->stat, level);
+    entry->total_units++;
+    if (child->parent->num_children > entry->max_units) {
+        entry->max_units = child->parent->num_children;
+    }
+
+    set_bit(level, slot->stat.curr_levels);
     return;
 }
 
@@ -37,10 +67,18 @@ static void cpu_slot_del_topo_info(CPUTopoState *root, CPUTopoState *child)
 {
     CPUSlot *slot = CPU_SLOT(root);
     CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUTopoStatEntry *entry;
+
+    assert(level != CPU_TOPO_UNKNOWN);
 
     if (level == CPU_TOPO_CORE) {
         QTAILQ_REMOVE(&slot->cores, CPU_CORE(child), node);
     }
+
+    entry = get_topo_stat_entry(&slot->stat, level);
+    entry->total_units--;
+
+    /* No need to update entries[*].max_units and curr_levels. */
     return;
 }
 
@@ -73,6 +111,7 @@ static void cpu_slot_instance_init(Object *obj)
     CPUSlot *slot = CPU_SLOT(obj);
 
     QTAILQ_INIT(&slot->cores);
+    set_bit(CPU_TOPO_ROOT, slot->stat.curr_levels);
 }
 
 static const TypeInfo cpu_slot_type_info = {
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index d2a1160562be..fa2bd4af247d 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -25,6 +25,47 @@
 #include "hw/cpu/core.h"
 #include "hw/qdev-core.h"
 
+/**
+ * @USER_AVAIL_LEVEL_NUM: the number of total topology levels in topology
+ *                        bitmap, which includes CPU_TOPO_UNKNOWN.
+ */
+#define USER_AVAIL_LEVEL_NUM (CPU_TOPO_ROOT + 1)
+
+/**
+ * @VALID_LEVEL_NUM: the number of valid topology levels, which excludes
+ *                   CPU_TOPO_UNKNOWN and CPU_TOPO_ROOT.
+ */
+#define VALID_LEVEL_NUM (CPU_TOPO_ROOT - 1)
+
+#define TOPO_STAT_ENTRY_IDX(level) ((level) - 1)
+
+/**
+ * CPUTopoStatEntry:
+ * @total: Total number of topological units at the same level that are
+ *         currently inserted in CPU slot
+ * @max: Maximum number of topological units at the same level under the
+ *       parent topolofical container
+ */
+typedef struct CPUTopoStatEntry {
+    unsigned int total_units;
+    unsigned int max_units;
+} CPUTopoStatEntry;
+
+/**
+ * CPUTopoStat:
+ * @max_cpus: Maximum number of CPUs in CPU slot.
+ * @pre_plugged_cpus: Number of pre-plugged CPUs in CPU slot.
+ * @entries: Detail count information for valid topology levels under
+ *           CPU slot
+ * @curr_levels: Current CPU topology levels inserted in CPU slot
+ */
+typedef struct CPUTopoStat {
+    unsigned int max_cpus;
+    unsigned int pre_plugged_cpus;
+    CPUTopoStatEntry entries[VALID_LEVEL_NUM];
+    DECLARE_BITMAP(curr_levels, USER_AVAIL_LEVEL_NUM);
+} CPUTopoStat;
+
 #define TYPE_CPU_SLOT "cpu-slot"
 
 OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
@@ -35,6 +76,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
  *     where the cpu-slot is the root. cpu-slot can maintain similar
  *     queues for other topology levels to facilitate traversal
  *     when necessary.
+ * @stat: Statistical topology information for topology tree.
  */
 struct CPUSlot {
     /*< private >*/
@@ -42,6 +84,7 @@ struct CPUSlot {
 
     /*< public >*/
     QTAILQ_HEAD(, CPUCore) cores;
+    CPUTopoStat stat;
 };
 
 #endif /* CPU_SLOT_H */
-- 
2.34.1


