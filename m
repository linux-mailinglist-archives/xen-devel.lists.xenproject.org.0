Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD0F7FF277
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644801.1006432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCU-0000C2-JU; Thu, 30 Nov 2023 14:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644801.1006432; Thu, 30 Nov 2023 14:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCS-0008EY-Uy; Thu, 30 Nov 2023 14:39:32 +0000
Received: by outflank-mailman (input) for mailman id 644801;
 Thu, 30 Nov 2023 14:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i83-0008E0-F4
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:34:59 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a249a6b7-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:34:58 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:34:56 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:47 -0800
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
X-Inumbo-ID: a249a6b7-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354898; x=1732890898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FbB6vbX6bR4dqU1fCV07ghJ+c5nYYHlqh35CAqrTsmY=;
  b=C6X5Ftzjr3qufornHD4QbhdH7yYB2zNkz92LccZnSp/zG+x5Cd5K8fcK
   aauMozS+22014MvJT1xgtBLA6uV4OXfX3iNajd4vTsBMT0C2/I+IDRCLm
   XHSAL13j1AU3htiWxQc57GwHbCcr2/Oa/ZFi+V5OYPW0pqMJooMN/zsaq
   CkJb5RG0E4WMcKcH1mgFGaIAkenfMdN5jyYsghmOmtH2HNISnhveE/tPt
   ykoBQeEwgYjXzHep2f0x0qqQ8i4YEvQJSwNUc2WDC/G7y6CBZzpyty4GP
   mZFJwhtHyZ1m8qwSFagEDgmn97wc6vhicEPlaaa4jFyF8yUxbMLqCYFNH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532308"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532308"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730130"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730130"
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
Subject: [RFC 28/41] hw/core/slot: Maintain the core queue in CPU slot
Date: Thu, 30 Nov 2023 22:41:50 +0800
Message-Id: <20231130144203.2307629-29-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Maintain the cores queue at cpu-slot to facilitate direct traversal
of all cores.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 43 ++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu-slot.h |  9 ++++++++
 include/hw/cpu/core.h      |  2 ++
 3 files changed, 54 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index 5aef5b0189c2..a6b7d98dea18 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -22,6 +22,40 @@
 
 #include "hw/core/cpu-slot.h"
 
+static void cpu_slot_add_topo_info(CPUTopoState *root, CPUTopoState *child)
+{
+    CPUSlot *slot = CPU_SLOT(root);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+
+    if (level == CPU_TOPO_CORE) {
+        QTAILQ_INSERT_TAIL(&slot->cores, CPU_CORE(child), node);
+    }
+    return;
+}
+
+static void cpu_slot_del_topo_info(CPUTopoState *root, CPUTopoState *child)
+{
+    CPUSlot *slot = CPU_SLOT(root);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+
+    if (level == CPU_TOPO_CORE) {
+        QTAILQ_REMOVE(&slot->cores, CPU_CORE(child), node);
+    }
+    return;
+}
+
+static void cpu_slot_update_topo_info(CPUTopoState *root, CPUTopoState *child,
+                                      bool is_realize)
+{
+    g_assert(child->parent);
+
+    if (is_realize) {
+        cpu_slot_add_topo_info(root, child);
+    } else {
+        cpu_slot_del_topo_info(root, child);
+    }
+}
+
 static void cpu_slot_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -31,12 +65,21 @@ static void cpu_slot_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
 
     tc->level = CPU_TOPO_ROOT;
+    tc->update_topo_info = cpu_slot_update_topo_info;
+}
+
+static void cpu_slot_instance_init(Object *obj)
+{
+    CPUSlot *slot = CPU_SLOT(obj);
+
+    QTAILQ_INIT(&slot->cores);
 }
 
 static const TypeInfo cpu_slot_type_info = {
     .name = TYPE_CPU_SLOT,
     .parent = TYPE_CPU_TOPO,
     .class_init = cpu_slot_class_init,
+    .instance_init = cpu_slot_instance_init,
     .instance_size = sizeof(CPUSlot),
 };
 
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index 718c8ecaa751..d2a1160562be 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -22,17 +22,26 @@
 #define CPU_SLOT_H
 
 #include "hw/core/cpu-topo.h"
+#include "hw/cpu/core.h"
 #include "hw/qdev-core.h"
 
 #define TYPE_CPU_SLOT "cpu-slot"
 
 OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
 
+/**
+ * CPUSlot:
+ * @cores: Queue consisting of all the cores in the topology tree
+ *     where the cpu-slot is the root. cpu-slot can maintain similar
+ *     queues for other topology levels to facilitate traversal
+ *     when necessary.
+ */
 struct CPUSlot {
     /*< private >*/
     CPUTopoState parent_obj;
 
     /*< public >*/
+    QTAILQ_HEAD(, CPUCore) cores;
 };
 
 #endif /* CPU_SLOT_H */
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 591240861efb..65dc10931190 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -40,6 +40,8 @@ struct CPUCore {
      * "-device"/"device_add"?
      */
     int plugged_threads;
+
+    QTAILQ_ENTRY(CPUCore) node;
 };
 
 #endif
-- 
2.34.1


