Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426417FF27A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644805.1006455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCZ-0001Fj-EX; Thu, 30 Nov 2023 14:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644805.1006455; Thu, 30 Nov 2023 14:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCX-0000ad-MB; Thu, 30 Nov 2023 14:39:37 +0000
Received: by outflank-mailman (input) for mailman id 644805;
 Thu, 30 Nov 2023 14:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i8M-0008E0-OW
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:35:18 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adbced87-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:35:17 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:35:15 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:05 -0800
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
X-Inumbo-ID: adbced87-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354918; x=1732890918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HnOAO3NMx1dRMWQIeSpDRtg/0be+6N1pOpK/5nWbTXE=;
  b=d268OJrANGzjW2nqH1XFWmwdpbNdCZko7vWPvFJL19cQ2a4XcmR5HmBz
   bQ16DFdRGPys+DG4q484GIqZQjabSQx+oPeMvdwZIqCCcZ1VnU4d6lUti
   mirTFqJBb8zFoqlN2bohwlxc9REIlhMxwsKtK/Alp9od/MafNAIMSho07
   +FrrJKopuXuXeNq92OReh6z91Tb7JEGF3lsAU0qtEGwvNJAUtM7zbZ12U
   pYedlmcCmB3R2+c3OlwLrnR6MXaS2qIQ4ubABOUJ1OJxBTC1MJuwM+hs9
   1IIWWAOlcdbs//CIso2ND5v25WHXHXSxDuXtQAh/lWQfTieYLAbseG8n2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532381"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532381"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730225"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730225"
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
Subject: [RFC 30/41] hw/core/slot: Check topology child to be added under CPU slot
Date: Thu, 30 Nov 2023 22:41:52 +0800
Message-Id: <20231130144203.2307629-31-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Implement CPUTopoClass.check_topo_child() in cpu-slot to be compatible
with the limitations of the current smp topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 37 +++++++++++++++++++++++++++++++++++++
 hw/core/cpu-topo.c         |  2 +-
 include/hw/core/cpu-slot.h |  2 ++
 include/hw/core/cpu-topo.h |  1 +
 4 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index e8e6f4d25532..2a796ad5b6e7 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 
 #include "hw/core/cpu-slot.h"
+#include "qapi/error.h"
 
 static inline
 CPUTopoStatEntry *get_topo_stat_entry(CPUTopoStat *stat,
@@ -94,6 +95,37 @@ static void cpu_slot_update_topo_info(CPUTopoState *root, CPUTopoState *child,
     }
 }
 
+static void cpu_slot_check_topo_support(CPUTopoState *root, CPUTopoState *child,
+                                        Error **errp)
+{
+    CPUSlot *slot = CPU_SLOT(root);
+    CPUTopoLevel child_level = CPU_TOPO_LEVEL(child);
+
+    if (!test_bit(child_level, slot->supported_levels)) {
+        error_setg(errp, "cpu topo: the level %s is not supported",
+                   cpu_topo_level_to_string(child_level));
+        return;
+    }
+
+    /*
+     * Currently we doesn't support hybrid topology. For SMP topology,
+     * each child under the same parent are same type.
+     */
+    if (child->parent->num_children) {
+        CPUTopoState *sibling = QTAILQ_FIRST(&child->parent->children);
+        const char *sibling_type = object_get_typename(OBJECT(sibling));
+        const char *child_type = object_get_typename(OBJECT(child));
+
+        if (strcmp(sibling_type, child_type)) {
+            error_setg(errp, "Invalid smp topology: different CPU "
+                       "topology types (%s child vs %s sibling) "
+                       "under the same parent (%s).",
+                       child_type, sibling_type,
+                       object_get_typename(OBJECT(child->parent)));
+        }
+    }
+}
+
 static void cpu_slot_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -104,6 +136,7 @@ static void cpu_slot_class_init(ObjectClass *oc, void *data)
 
     tc->level = CPU_TOPO_ROOT;
     tc->update_topo_info = cpu_slot_update_topo_info;
+    tc->check_topo_child = cpu_slot_check_topo_support;
 }
 
 static void cpu_slot_instance_init(Object *obj)
@@ -112,6 +145,10 @@ static void cpu_slot_instance_init(Object *obj)
 
     QTAILQ_INIT(&slot->cores);
     set_bit(CPU_TOPO_ROOT, slot->stat.curr_levels);
+
+    /* Set all levels by default. */
+    bitmap_fill(slot->supported_levels, USER_AVAIL_LEVEL_NUM);
+    clear_bit(CPU_TOPO_UNKNOWN, slot->supported_levels);
 }
 
 static const TypeInfo cpu_slot_type_info = {
diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 687a4cc566ec..351112ca7a73 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -24,7 +24,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
-static const char *cpu_topo_level_to_string(CPUTopoLevel level)
+const char *cpu_topo_level_to_string(CPUTopoLevel level)
 {
     switch (level) {
     case CPU_TOPO_UNKNOWN:
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index fa2bd4af247d..7bf51988afb3 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -77,6 +77,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
  *     queues for other topology levels to facilitate traversal
  *     when necessary.
  * @stat: Statistical topology information for topology tree.
+ * @supported_levels: Supported topology levels for topology tree.
  */
 struct CPUSlot {
     /*< private >*/
@@ -85,6 +86,7 @@ struct CPUSlot {
     /*< public >*/
     QTAILQ_HEAD(, CPUCore) cores;
     CPUTopoStat stat;
+    DECLARE_BITMAP(supported_levels, USER_AVAIL_LEVEL_NUM);
 };
 
 #endif /* CPU_SLOT_H */
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index 453bacbb558b..d27da0335c42 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -102,5 +102,6 @@ int cpu_topo_child_foreach(CPUTopoState *topo, unsigned long *levels,
 int cpu_topo_child_foreach_recursive(CPUTopoState *topo,
                                      unsigned long *levels,
                                      topo_fn fn, void *opaque);
+const char *cpu_topo_level_to_string(CPUTopoLevel level);
 
 #endif /* CPU_TOPO_H */
-- 
2.34.1


