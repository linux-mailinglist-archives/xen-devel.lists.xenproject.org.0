Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E57FF351
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644972.1006689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ioR-000519-LK; Thu, 30 Nov 2023 15:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644972.1006689; Thu, 30 Nov 2023 15:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ioR-0004xz-Hx; Thu, 30 Nov 2023 15:18:47 +0000
Received: by outflank-mailman (input) for mailman id 644972;
 Thu, 30 Nov 2023 15:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i8q-0008E0-8m
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:35:48 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf59b2a9-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:35:47 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:35:45 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:35 -0800
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
X-Inumbo-ID: bf59b2a9-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354947; x=1732890947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zMs3wimSwFi3OS/xT8fCJCLyivsPCu0OTNgeR6TOgP0=;
  b=Nw9Zwe69Mk+TS601A3YuuhAalgfKvFgpVCFb1nIq3+pqYPt0WlQCT0xm
   umeFpcCRZAXdCRhocduL+Zy0/iuFg+C6Zm+ewBg9woT1xr/ra5LJwHv4X
   KWQ0Uql02opxuXzfEyMS3mb85SwAp+mW/Ir1f83khKERRKRzjIKttS8v1
   z3KwKEWA0gNRNSuTQQlMjJ/SRzuXFMwVzzzqn5n6QAlIQIgaMoYpPEqTq
   ULj3wcbKW7bb/RXwTA6RRpztzAO3oewm2YCYRyU9xnk37LoP7KmCAY2Ou
   XBMdNpi0oBQtU5BOBZU4C7JFj8p3TiXeOD9z0/dqy3Rn+O2x1YkAbpF6m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532483"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532483"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730310"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730310"
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
Subject: [RFC 33/41] hw/machine: Validate smp topology tree without -smp
Date: Thu, 30 Nov 2023 22:41:55 +0800
Message-Id: <20231130144203.2307629-34-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

QOM topology allows user to create topology tree from cli without -smp,
in this case, validate the topology tree to meet the smp requirement.

Currently, for compatibility with MachineState.smp, initialize
MachineState.smp from topology tree in this case.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 146 +++++++++++++++++++++++++++++++++++++
 hw/core/machine.c          |  10 +++
 include/hw/core/cpu-slot.h |   1 +
 3 files changed, 157 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index ade155baf60b..45b6aef0750a 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -413,3 +413,149 @@ void machine_create_smp_topo_tree(MachineState *ms, Error **errp)
     }
     slot->smp_parsed = true;
 }
+
+static void set_smp_child_topo_info(CpuTopology *smp_info,
+                                    CPUTopoStat *stat,
+                                    CPUTopoLevel child_level)
+{
+    unsigned int *smp_count;
+    CPUTopoStatEntry *entry;
+
+    smp_count = get_smp_info_by_level(smp_info, child_level);
+    entry = get_topo_stat_entry(stat, child_level);
+    *smp_count = entry->max_units ? entry->max_units : 1;
+
+    return;
+}
+
+typedef struct ValidateCbData {
+    CPUTopoStat *stat;
+    CpuTopology *smp_info;
+    Error **errp;
+} ValidateCbData;
+
+static int validate_topo_children(CPUTopoState *topo, void *opaque)
+{
+    CPUTopoLevel level = CPU_TOPO_LEVEL(topo), next_level;
+    ValidateCbData *cb = opaque;
+    unsigned int max_children;
+    CPUTopoStatEntry *entry;
+    Error **errp = cb->errp;
+
+    if (level != CPU_TOPO_THREAD && !topo->num_children &&
+        !topo->max_children) {
+        error_setg(errp, "Invalid topology: the CPU topology "
+                   "(level: %s, index: %d) isn't completed.",
+                   cpu_topo_level_to_string(level), topo->index);
+        return TOPO_FOREACH_ERR;
+    }
+
+    if (level == CPU_TOPO_UNKNOWN) {
+        error_setg(errp, "Invalid CPU topology: unknown topology level.");
+        return TOPO_FOREACH_ERR;
+    }
+
+    /*
+     * Only CPU_TOPO_THREAD level's child_level could be CPU_TOPO_UNKNOWN,
+     * but machine_validate_cpu_topology() is before CPU creation.
+     */
+    if (topo->child_level == CPU_TOPO_UNKNOWN) {
+        error_setg(errp, "Invalid CPU topology: incomplete topology "
+                   "(level: %s, index: %d), no child?.",
+                   cpu_topo_level_to_string(level), topo->index);
+        return TOPO_FOREACH_ERR;
+    }
+
+    /*
+     * Currently hybrid topology isn't supported, so only SMP topology
+     * is allowed.
+     */
+
+    entry = get_topo_stat_entry(cb->stat, topo->child_level);
+
+    /* Max threads per core is pre-configured by "nr-threads". */
+    max_children = topo->child_level != CPU_TOPO_THREAD ?
+                   topo->num_children : topo->max_children;
+
+    if (entry->max_units != max_children) {
+        error_setg(errp, "Invalid SMP topology: "
+                   "The %s topology is asymmetric.",
+                   cpu_topo_level_to_string(level));
+        return TOPO_FOREACH_ERR;
+    }
+
+    next_level = find_next_bit(cb->stat->curr_levels, USER_AVAIL_LEVEL_NUM,
+                               topo->child_level + 1);
+
+    if (next_level != level) {
+        error_setg(errp, "Invalid smp topology: "
+                   "asymmetric CPU topology depth.");
+        return TOPO_FOREACH_ERR;
+    }
+
+    set_smp_child_topo_info(cb->smp_info, cb->stat, topo->child_level);
+
+    return TOPO_FOREACH_CONTINUE;
+}
+
+/*
+ * Only check the case user configures CPU topology via -device
+ * without -smp. In this case, MachineState.smp also needs to be
+ * initialized based on topology tree.
+ */
+bool machine_validate_cpu_topology(MachineState *ms, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    CPUTopoState *slot_topo = CPU_TOPO(ms->topo);
+    CPUTopoStat *stat = &ms->topo->stat;
+    CpuTopology *smp_info = &ms->smp;
+    unsigned int total_cpus;
+    ValidateCbData cb;
+
+    if (ms->topo->smp_parsed) {
+        return true;
+    } else if (!slot_topo->num_children) {
+        /*
+         * If there's no -smp nor -device to add topology children,
+         * then create the default topology.
+         */
+        machine_create_smp_topo_tree(ms, errp);
+        if (*errp) {
+            return false;
+        }
+        return true;
+    }
+
+    if (test_bit(CPU_TOPO_CLUSTER, stat->curr_levels)) {
+        mc->smp_props.has_clusters = true;
+    }
+
+    /*
+     * The next cpu_topo_child_foreach_recursive() doesn't cover the
+     * parent topology unit. Update information for root here.
+     */
+    set_smp_child_topo_info(smp_info, stat, slot_topo->child_level);
+
+    cb.stat = stat;
+    cb.smp_info = smp_info;
+    cb.errp = errp;
+
+    cpu_topo_child_foreach_recursive(slot_topo, NULL,
+                                     validate_topo_children, &cb);
+    if (*errp) {
+        return false;
+    }
+
+    ms->smp.cpus = stat->pre_plugged_cpus ?
+                   stat->pre_plugged_cpus : 1;
+    ms->smp.max_cpus = stat->max_cpus ?
+                       stat->max_cpus : 1;
+
+    total_cpus = ms->smp.drawers * ms->smp.books *
+                 ms->smp.sockets * ms->smp.dies *
+                 ms->smp.clusters * ms->smp.cores *
+                 ms->smp.threads;
+    g_assert(total_cpus == ms->smp.max_cpus);
+
+    return true;
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0c1739814124..5fa0c826f35e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1505,6 +1505,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
                                    "on", false);
     }
 
+    /*
+     * TODO: drop this check and validate topology tree by default
+     * when all arches support QOM topology.
+     */
+    if (machine_class->smp_props.possible_cpus_qom_granu) {
+        if (!machine_validate_cpu_topology(machine, errp)) {
+            return;
+        }
+    }
+
     accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
     machine_class->init(machine);
     phase_advance(PHASE_MACHINE_INITIALIZED);
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index de3d08fcb2ac..9e1c6d6b7ff2 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -100,5 +100,6 @@ struct CPUSlot {
 
 void machine_plug_cpu_slot(MachineState *ms);
 void machine_create_smp_topo_tree(MachineState *ms, Error **errp);
+bool machine_validate_cpu_topology(MachineState *ms, Error **errp);
 
 #endif /* CPU_SLOT_H */
-- 
2.34.1


