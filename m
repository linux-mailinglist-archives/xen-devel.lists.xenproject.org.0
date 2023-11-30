Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA537FF26A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644781.1006347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCD-0005Lz-Ll; Thu, 30 Nov 2023 14:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644781.1006347; Thu, 30 Nov 2023 14:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCC-0004xl-Ug; Thu, 30 Nov 2023 14:39:16 +0000
Received: by outflank-mailman (input) for mailman id 644781;
 Thu, 30 Nov 2023 14:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i6Y-0007xx-U3
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:33:26 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a8ef08c-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:33:25 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:33:22 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:33:13 -0800
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
X-Inumbo-ID: 6a8ef08c-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354805; x=1732890805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UIctuJN57ff0cGtb6JQuQGzOnsVqrF/BvG/lcB/CLAU=;
  b=BibP+vG+yTKo1aVZHkGErA51pYvbsfiKOJyvHmetA4Urf/T/oYqHECgb
   1bxE+9u7MS9cB6O8QjEXW626eZNVZAklOhwkQbdpSKrXsBXaUB3BeH9gC
   /zi/WZn8IvNXQDkx417mS6aznz50A1HhauewTQz1Wr9KIK5d/8anvSx9H
   AlKvnv2F/dVv5ngNgWMZpEHh2vQzJ4ZX6Oq2Oao6UFFtx1Q9PqBm0/Hxg
   50VlICOD6t6SCALEjDH3ZUmces5sOnxQJpBCA1PZPogdwgXxi/MdD6/QO
   G8O7WBT4qiB0IQEVLUx6+Yo/kcqTeBrgw0/ckvpO91f5H/YGnEkeUt+h6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531936"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531936"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730016"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730016"
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
Subject: [RFC 18/41] hw/cpu/cluster: Rename CPUClusterState to CPUCluster
Date: Thu, 30 Nov 2023 22:41:40 +0800
Message-Id: <20231130144203.2307629-19-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

To keep the same naming style as cpu-core, rename CPUClusterState to
CPUCluster.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 gdbstub/system.c                   | 2 +-
 hw/cpu/cluster.c                   | 8 ++++----
 include/hw/arm/armsse.h            | 2 +-
 include/hw/arm/xlnx-versal.h       | 4 ++--
 include/hw/arm/xlnx-zynqmp.h       | 4 ++--
 include/hw/cpu/cluster.h           | 6 +++---
 include/hw/riscv/microchip_pfsoc.h | 4 ++--
 include/hw/riscv/sifive_u.h        | 4 ++--
 8 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/gdbstub/system.c b/gdbstub/system.c
index 783ac140b982..1c0b55d3ebe7 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -277,7 +277,7 @@ static int find_cpu_clusters(Object *child, void *opaque)
 {
     if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
         GDBState *s = (GDBState *) opaque;
-        CPUClusterState *cluster = CPU_CLUSTER(child);
+        CPUCluster *cluster = CPU_CLUSTER(child);
         GDBProcess *process;
 
         s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 61289a840d46..fd978a543e40 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -26,12 +26,12 @@
 #include "qapi/error.h"
 
 static Property cpu_cluster_properties[] = {
-    DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
+    DEFINE_PROP_UINT32("cluster-id", CPUCluster, cluster_id, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
 typedef struct CallbackData {
-    CPUClusterState *cluster;
+    CPUCluster *cluster;
     int cpu_count;
 } CallbackData;
 
@@ -50,7 +50,7 @@ static int add_cpu_to_cluster(Object *obj, void *opaque)
 static void cpu_cluster_realize(DeviceState *dev, Error **errp)
 {
     /* Iterate through all our CPU children and set their cluster_index */
-    CPUClusterState *cluster = CPU_CLUSTER(dev);
+    CPUCluster *cluster = CPU_CLUSTER(dev);
     Object *cluster_obj = OBJECT(dev);
     CallbackData cbdata = {
         .cluster = cluster,
@@ -87,7 +87,7 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 static const TypeInfo cpu_cluster_type_info = {
     .name = TYPE_CPU_CLUSTER,
     .parent = TYPE_DEVICE,
-    .instance_size = sizeof(CPUClusterState),
+    .instance_size = sizeof(CPUCluster),
     .class_init = cpu_cluster_class_init,
 };
 
diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 88b3b759c5a8..886586a3bed4 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -153,7 +153,7 @@ struct ARMSSE {
 
     /*< public >*/
     ARMv7MState armv7m[SSE_MAX_CPUS];
-    CPUClusterState cluster[SSE_MAX_CPUS];
+    CPUCluster cluster[SSE_MAX_CPUS];
     IoTKitSecCtl secctl;
     TZPPC apb_ppc[NUM_INTERNAL_PPCS];
     TZMPC mpc[IOTS_NUM_MPC];
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index b24fa64557fd..61bde52b6af5 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -58,7 +58,7 @@ struct Versal {
     struct {
         struct {
             MemoryRegion mr;
-            CPUClusterState cluster;
+            CPUCluster cluster;
             ARMCPU cpu[XLNX_VERSAL_NR_ACPUS];
             GICv3State gic;
         } apu;
@@ -88,7 +88,7 @@ struct Versal {
             MemoryRegion mr;
             MemoryRegion mr_ps_alias;
 
-            CPUClusterState cluster;
+            CPUCluster cluster;
             ARMCPU cpu[XLNX_VERSAL_NR_RCPUS];
         } rpu;
 
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 96358d51ebb7..5eea765ea76c 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -98,8 +98,8 @@ struct XlnxZynqMPState {
     DeviceState parent_obj;
 
     /*< public >*/
-    CPUClusterState apu_cluster;
-    CPUClusterState rpu_cluster;
+    CPUCluster apu_cluster;
+    CPUCluster rpu_cluster;
     ARMCPU apu_cpu[XLNX_ZYNQMP_NUM_APU_CPUS];
     ARMCPU rpu_cpu[XLNX_ZYNQMP_NUM_RPU_CPUS];
     GICState gic;
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 53fbf36af542..644b87350268 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -55,7 +55,7 @@
  */
 
 #define TYPE_CPU_CLUSTER "cpu-cluster"
-OBJECT_DECLARE_SIMPLE_TYPE(CPUClusterState, CPU_CLUSTER)
+OBJECT_DECLARE_SIMPLE_TYPE(CPUCluster, CPU_CLUSTER)
 
 /*
  * This limit is imposed by TCG, which puts the cluster ID into an
@@ -64,13 +64,13 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUClusterState, CPU_CLUSTER)
 #define MAX_CLUSTERS 255
 
 /**
- * CPUClusterState:
+ * CPUCluster:
  * @cluster_id: The cluster ID. This value is for internal use only and should
  *   not be exposed directly to the user or to the guest.
  *
  * State of a CPU cluster.
  */
-struct CPUClusterState {
+struct CPUCluster {
     /*< private >*/
     DeviceState parent_obj;
 
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index daef086da602..c9ac14e35625 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -38,8 +38,8 @@ typedef struct MicrochipPFSoCState {
     DeviceState parent_obj;
 
     /*< public >*/
-    CPUClusterState e_cluster;
-    CPUClusterState u_cluster;
+    CPUCluster e_cluster;
+    CPUCluster u_cluster;
     RISCVHartArrayState e_cpus;
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 0696f8594277..fda4a708e960 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -40,8 +40,8 @@ typedef struct SiFiveUSoCState {
     DeviceState parent_obj;
 
     /*< public >*/
-    CPUClusterState e_cluster;
-    CPUClusterState u_cluster;
+    CPUCluster e_cluster;
+    CPUCluster u_cluster;
     RISCVHartArrayState e_cpus;
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
-- 
2.34.1


