Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C3D7FF283
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644824.1006530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCo-0005As-PM; Thu, 30 Nov 2023 14:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644824.1006530; Thu, 30 Nov 2023 14:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCn-0004Wc-74; Thu, 30 Nov 2023 14:39:53 +0000
Received: by outflank-mailman (input) for mailman id 644824;
 Thu, 30 Nov 2023 14:36:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i9n-0000pO-Uk
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:36:47 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3151d4e-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:36:46 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:36:42 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:33 -0800
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
X-Inumbo-ID: e3151d4e-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701355006; x=1732891006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q0lEBoFOr9b0x5amAD6sBLj9mxt45Se06XmWgm72SHY=;
  b=aCv8TiwjThHi9DnlHxz3vJ6b31n05Kofu3wuWgXE+6wb9hgy0Ph2xAPj
   u/w/zHbvjh5AAhDM3ImFz7XunalIXo/RoUc9F6tfGPSNV/+Eb3o/jLzU+
   CjwlRnyPQoKXa1Fs1cZ6QVzhDPEI4ZQsANedF0CpRnMDqYNXjlRTVnJ2Y
   f7cmY4UtQlSBzNJBq/qN7C4Offqwpi24SZxaWOxP0Yhu4SErFyva6ODlH
   /DKXRQzAqALUzB2co7zqh/SpYuk0QY74Tt41+hwgpKHMdM1U1Yb0o+hxC
   zZgNIcn1pJkTQwO2s+6Ngdj9hlYeuUHKOp5EMFQcmxogs/EvWDQleartj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532773"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532773"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730530"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730530"
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
Subject: [RFC 39/41] hw/i386: Add the interface to search parent for QOM topology
Date: Thu, 30 Nov 2023 22:42:01 +0800
Message-Id: <20231130144203.2307629-40-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

QOM topology needs to search parent cpu-core for hotplugged CPU to
create topology child<> property in qdev_set_id().

This process is before x86_cpu_pre_plug(), thus place 2 helpers
x86_cpu_assign_apic_id() and x86_cpu_assign_topo_id() in
x86_cpu_search_parent_pre_plug() to help get the correct topology sub
indexes. Then x86_cpu_search_parent_pre_plug() searches the parent
cpu-core with these sub indexes.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c         | 128 +++++++++++++++++++++++++++++++++++++++---
 include/hw/i386/x86.h |   3 +
 2 files changed, 122 insertions(+), 9 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 04edd6de6aeb..595d4365fdd1 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -460,16 +460,18 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /* if 'address' properties socket-id/core-id/thread-id are not set, set them
-     * so that machine_query_hotpluggable_cpus would show correct values
+    /*
+     * possible_cpus_qom_granu means the QOM topology support.
+     *
+     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
+     * i386 completes QOM topology support.
      */
-    /* TODO: move socket_id/core_id/thread_id checks into x86_cpu_realizefn()
-     * once -smp refactoring is complete and there will be CPU private
-     * CPUState::nr_cores and CPUState::nr_threads fields instead of globals */
-    x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
-    x86_cpu_assign_topo_id(cpu, &topo_ids, errp);
-    if (*errp) {
-        return;
+    if (!mc->smp_props.possible_cpus_qom_granu) {
+        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
+        x86_cpu_assign_topo_id(cpu, &topo_ids, errp);
+        if (*errp) {
+            return;
+        }
     }
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &&
@@ -484,6 +486,114 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     numa_cpu_pre_plug(cpu_slot, dev, errp);
 }
 
+static int x86_cpu_get_topo_id_by_level(X86CPU *cpu,
+                                        CPUTopoLevel level)
+{
+    switch (level) {
+    case CPU_TOPO_THREAD:
+        return cpu->thread_id;
+    case CPU_TOPO_CORE:
+        return cpu->core_id;
+    case CPU_TOPO_DIE:
+        return cpu->die_id;
+    case CPU_TOPO_SOCKET:
+        return cpu->socket_id;
+    default:
+        g_assert_not_reached();
+    }
+
+    return -1;
+}
+
+typedef struct SearchCoreCb {
+    X86CPU *cpu;
+    CPUTopoState *parent;
+    int id;
+} SearchCoreCb;
+
+static int x86_cpu_search_parent_core(CPUTopoState *topo,
+                                      void *opaque)
+{
+    SearchCoreCb *cb = opaque;
+    CPUTopoLevel level = CPU_TOPO_LEVEL(topo);
+
+    cb->parent = topo;
+    cb->id = x86_cpu_get_topo_id_by_level(cb->cpu, level);
+
+    if (cb->id == topo->index) {
+        if (level == CPU_TOPO_CORE) {
+            return TOPO_FOREACH_END;
+        }
+        return TOPO_FOREACH_CONTINUE;
+    }
+    return TOPO_FOREACH_SIBLING;
+}
+
+Object *x86_cpu_search_parent_pre_plug(CPUTopoState *topo,
+                                       CPUTopoState *root,
+                                       Error **errp)
+{
+    int ret;
+    SearchCoreCb cb;
+    X86CPUTopoIDs topo_ids;
+    X86CPUTopoInfo topo_info;
+    X86CPU *cpu = X86_CPU(topo);
+    CPUSlot *slot = CPU_SLOT(root);
+    MachineState *ms = slot->ms;
+    DECLARE_BITMAP(foreach_bitmap, USER_AVAIL_LEVEL_NUM);
+
+    topo_info.dies_per_pkg = ms->smp.dies;
+    topo_info.cores_per_die = ms->smp.cores;
+    topo_info.threads_per_core = ms->smp.threads;
+
+    if (cpu->apic_id == UNASSIGNED_APIC_ID) {
+        x86_cpu_assign_apic_id(ms, cpu, &topo_ids, &topo_info, errp);
+        if (*errp) {
+            return NULL;
+        }
+    } else {
+        /*
+         * if 'address' properties socket-id/core-id/thread-id are not set,
+         * set them so that machine_query_hotpluggable_cpus would show
+         * correct values.
+         *
+         * TODO: move socket_id/core_id/thread_id checks into
+         * x86_cpu_realizefn() once -smp refactoring is complete and there
+         * will be CPU private CPUState::nr_cores and CPUState::nr_threads
+         * fields instead of globals.
+         */
+        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
+    }
+
+    x86_cpu_assign_topo_id(cpu, &topo_ids, errp);
+    if (*errp) {
+        return NULL;
+    }
+
+    cb.cpu = cpu;
+    cb.parent = NULL;
+    cb.id = -1;
+    bitmap_fill(foreach_bitmap, USER_AVAIL_LEVEL_NUM);
+    clear_bit(CPU_TOPO_UNKNOWN, foreach_bitmap);
+    clear_bit(CPU_TOPO_THREAD, foreach_bitmap);
+
+    ret = cpu_topo_child_foreach_recursive(root, foreach_bitmap,
+                                           x86_cpu_search_parent_core, &cb);
+    if (ret != TOPO_FOREACH_END) {
+        g_autofree char *search_info = NULL;
+
+        search_info = !cb.parent ? g_strdup("") :
+            g_strdup_printf(" for %s level with id: %d",
+            cpu_topo_level_to_string(CPU_TOPO_LEVEL(cb.parent)), cb.id);
+        error_setg(errp, "Can't find parent%s", search_info);
+        return NULL;
+    }
+
+    /* Keep the index of CPU topology device the same as the thread_id. */
+    topo->index = cpu->thread_id;
+    return OBJECT(cb.parent);
+}
+
 CpuInstanceProperties
 x86_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 19e9f93fe286..e8c9ddc36359 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -104,6 +104,9 @@ int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx);
 const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms);
 CPUArchId *x86_find_cpu_slot(MachineState *ms, uint32_t id, int *idx);
 void x86_rtc_set_cpus_count(ISADevice *rtc, uint16_t cpus_count);
+Object *x86_cpu_search_parent_pre_plug(CPUTopoState *topo,
+                                       CPUTopoState *root,
+                                       Error **errp);
 void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
                       DeviceState *dev, Error **errp);
 void x86_cpu_plug(HotplugHandler *hotplug_dev,
-- 
2.34.1


