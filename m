Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D34E7FF260
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644763.1006261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC5-0002zO-NQ; Thu, 30 Nov 2023 14:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644763.1006261; Thu, 30 Nov 2023 14:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC5-0002nJ-DL; Thu, 30 Nov 2023 14:39:09 +0000
Received: by outflank-mailman (input) for mailman id 644763;
 Thu, 30 Nov 2023 14:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i5Y-0007mE-PZ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:32:24 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 469be651-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:32:23 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:31:58 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:48 -0800
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
X-Inumbo-ID: 469be651-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354743; x=1732890743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zcorAWDLgR7QueFdQsmIMfIxo58a5rqxmGG3Y6CdsHI=;
  b=VgYisIiSsbos+Sam4aKPEPGUxnfFbnknBxJu5NgdrxvxdOzYk3xcsP2e
   jWmhxxi3IeWau+eWxJdcmLiVsygBG5HHdHPLCFLzkguu3ndjMwryy8417
   rTzFGXEpS3w8mgES/x/4RloHdijezqTLmb0eVG4aRcPReDQbEQmo3Up2w
   3YbOWHh4m0kANh59wOWaZtGYLcyvZmmk3yXFGX8+eGL/DmcyEeIAS1MLI
   TldG/h/NPWRpzpPgjJ9fBhCU8fYed0nPnjiFGDgwyWUqSbMav+WuUkjTr
   inR911vtcxa0aDPELUxW0AHvhQF7byYS4tU51lq0FmJPFCJzwkC/3elgz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531485"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531485"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729745"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729745"
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
Subject: [RFC 09/41] hw/core/topo: Support topology index for topology device
Date: Thu, 30 Nov 2023 22:41:31 +0800
Message-Id: <20231130144203.2307629-10-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

Topology index is used to identify the topology child under the same
parent topology device.

This field corresponds to the topology sub index (e.g., socket-id/
core-id/thread-id) used for addressing.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 77 ++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu-topo.h |  6 +++
 2 files changed, 83 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 4428b979a5dc..3e0c183388d8 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -50,6 +50,66 @@ static const char *cpu_topo_level_to_string(CPUTopoLevel level)
     return NULL;
 }
 
+static void cpu_topo_refresh_free_child_index(CPUTopoState *topo)
+{
+    CPUTopoState *child;
+
+    /*
+     * Fast way: Assume that the index grows sequentially and that there
+     * are no "index hole" in the previous children.
+     *
+     * The previous check on num_children ensures that free_child_index + 1
+     * does not hit the max_children limit.
+     */
+    if (topo->free_child_index + 1 == topo->num_children) {
+        topo->free_child_index++;
+        return;
+    }
+
+    /* Slow way: Search the "index hole". The index hole must be found. */
+    for (int index = 0; index < topo->num_children; index++) {
+        bool existed = false;
+
+        QTAILQ_FOREACH(child, &topo->children, sibling) {
+            if (child->index == index) {
+                existed = true;
+                break;
+            }
+        }
+
+        if (!existed) {
+            topo->free_child_index = index;
+            return;
+        }
+    }
+}
+
+static void cpu_topo_validate_index(CPUTopoState *topo, Error **errp)
+{
+    CPUTopoState *parent = topo->parent, *child;
+
+    if (topo->index < 0) {
+        error_setg(errp, "Invalid topology index (%d).",
+                   topo->index);
+        return;
+    }
+
+    if (parent->max_children && topo->index >= parent->max_children) {
+        error_setg(errp, "Invalid topology index (%d): "
+                   "The maximum index is %d.",
+                   topo->index, parent->max_children);
+        return;
+    }
+
+    QTAILQ_FOREACH(child, &topo->children, sibling) {
+        if (child->index == topo->index) {
+            error_setg(errp, "Duplicate topology index (%d)",
+                       topo->index);
+            return;
+        }
+    }
+}
+
 static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
 {
     CPUTopoState *parent = topo->parent;
@@ -80,7 +140,18 @@ static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
     }
 
     parent->num_children++;
+    if (topo->index == UNASSIGNED_TOPO_INDEX) {
+        topo->index = parent->free_child_index;
+    } else if (topo->index != parent->free_child_index) {
+        /* The index has been set, then we need to validate it. */
+        cpu_topo_validate_index(topo, errp);
+        if (*errp) {
+            return;
+        }
+    }
+
     QTAILQ_INSERT_TAIL(&parent->children, topo, sibling);
+    cpu_topo_refresh_free_child_index(parent);
 }
 
 static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
@@ -135,6 +206,10 @@ static void cpu_topo_destroy_hierarchy(CPUTopoState *topo)
     QTAILQ_REMOVE(&parent->children, topo, sibling);
     parent->num_children--;
 
+    if (topo->index < parent->free_child_index) {
+        parent->free_child_index = topo->index;
+    }
+
     if (!parent->num_children) {
         parent->child_level = CPU_TOPO_UNKNOWN;
     }
@@ -180,6 +255,8 @@ static void cpu_topo_instance_init(Object *obj)
     CPUTopoState *topo = CPU_TOPO(obj);
     QTAILQ_INIT(&topo->children);
 
+    topo->index = UNASSIGNED_TOPO_INDEX;
+    topo->free_child_index = 0;
     topo->child_level = CPU_TOPO_UNKNOWN;
 }
 
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index ebcbdd854da5..c0dfff9dc63b 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -24,6 +24,8 @@
 #include "hw/qdev-core.h"
 #include "qemu/queue.h"
 
+#define UNASSIGNED_TOPO_INDEX -1
+
 typedef enum CPUTopoLevel {
     CPU_TOPO_UNKNOWN,
     CPU_TOPO_THREAD,
@@ -53,6 +55,8 @@ struct CPUTopoClass {
 
 /**
  * CPUTopoState:
+ * @index: Topology index within parent's topology queue.
+ * @free_child_index: Cached free index to be specified for next child.
  * @num_children: Number of topology children under this topology device.
  * @max_children: Maximum number of children allowed to be inserted under
  *     this topology device.
@@ -66,6 +70,8 @@ struct CPUTopoState {
     DeviceState parent_obj;
 
     /*< public >*/
+    int index;
+    int free_child_index;
     int num_children;
     int max_children;
     CPUTopoLevel child_level;
-- 
2.34.1


