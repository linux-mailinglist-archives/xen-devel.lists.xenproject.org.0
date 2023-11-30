Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771EA7FF284
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644829.1006548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCs-00061X-ED; Thu, 30 Nov 2023 14:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644829.1006548; Thu, 30 Nov 2023 14:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCq-0005XJ-OP; Thu, 30 Nov 2023 14:39:56 +0000
Received: by outflank-mailman (input) for mailman id 644829;
 Thu, 30 Nov 2023 14:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8iA4-00012Q-T7
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:37:04 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecedd737-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:37:03 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:37:01 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:52 -0800
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
X-Inumbo-ID: ecedd737-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701355024; x=1732891024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1TBuBuayUq5ep3LedB2XG6MRM6nllhfykxLgfM/A+kw=;
  b=NVQsN9XsOQGKx6S/7t9IhJRy3s8xFQ54yloWKF/QeKolh5joJaEfIyCS
   DbsTmJhBAam5nwKa6LIQuQKdajNTq5UdGlO37t2tfz9gNlhfczKtc9DfT
   zLXtC4qjDs0/EwjEgPhKr6AqbJQN9ONQrl5NI72tp6vjkY1WAvFYsGGV+
   IMJF0s5cROsHvKeSIdKUO//YKMb2Pgr7NQopAz6Oxs/ssl+fn0ftZsjk0
   yVmI71N3lBigiffKgJxUDxnwvE1JVQ9u9gV5mS/JYaHn3+KDhZDAnmZrl
   EoIVOVWb5Oa0X+w0homY3IauYYbH2CkTARlU7B8sr+8qCtjBGP2/GdDBi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532884"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532884"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730622"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730622"
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
Subject: [RFC 41/41] hw/i386: Cleanup non-QOM topology support
Date: Thu, 30 Nov 2023 22:42:03 +0800
Message-Id: <20231130144203.2307629-42-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

After i386 supports QOM topology, drop original topology logic.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c | 52 +++++++++++----------------------------------------
 1 file changed, 11 insertions(+), 41 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 99f6c502de43..cba8b806cdb6 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -118,7 +118,8 @@ out:
 
 void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 {
-    int i;
+    CPUCore *core;
+    int i, cpu_index = 0, core_idx = 0;
     const CPUArchIdList *possible_cpus;
     MachineState *ms = MACHINE(x86ms);
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
@@ -153,34 +154,17 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
 
-    /*
-     * possible_cpus_qom_granu means the QOM topology support.
-     *
-     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
-     * i386 completes QOM topology support.
-     */
-    if (mc->smp_props.possible_cpus_qom_granu) {
-        CPUCore *core;
-        int cpu_index = 0;
-        int core_idx = 0;
-
-        MACHINE_CORE_FOREACH(ms, core) {
-            for (i = 0; i < core->plugged_threads; i++) {
-                x86_cpu_new(x86ms, possible_cpus->cpus[cpu_index].arch_id,
-                            OBJECT(core), cpu_index, &error_fatal);
-                cpu_index++;
-            }
-
-            if (core->plugged_threads < core->nr_threads) {
-                cpu_index += core->nr_threads - core->plugged_threads;
-            }
-            core_idx++;
+    MACHINE_CORE_FOREACH(ms, core) {
+        for (i = 0; i < core->plugged_threads; i++) {
+            x86_cpu_new(x86ms, possible_cpus->cpus[cpu_index].arch_id,
+                        OBJECT(core), cpu_index, &error_fatal);
+            cpu_index++;
         }
-    } else {
-        for (i = 0; i < ms->smp.cpus; i++) {
-            x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
-                        NULL, i, &error_fatal);
+
+        if (core->plugged_threads < core->nr_threads) {
+            cpu_index += core->nr_threads - core->plugged_threads;
         }
+        core_idx++;
     }
 }
 
@@ -460,20 +444,6 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /*
-     * possible_cpus_qom_granu means the QOM topology support.
-     *
-     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
-     * i386 completes QOM topology support.
-     */
-    if (!mc->smp_props.possible_cpus_qom_granu) {
-        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
-        x86_cpu_assign_topo_id(cpu, &topo_ids, errp);
-        if (*errp) {
-            return;
-        }
-    }
-
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &&
         kvm_enabled() && !kvm_hv_vpindex_settable()) {
         error_setg(errp, "kernel doesn't allow setting HyperV VP_INDEX");
-- 
2.34.1


