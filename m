Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AB7FF262
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644765.1006265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC6-00038w-2W; Thu, 30 Nov 2023 14:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644765.1006265; Thu, 30 Nov 2023 14:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC5-0002zo-TM; Thu, 30 Nov 2023 14:39:09 +0000
Received: by outflank-mailman (input) for mailman id 644765;
 Thu, 30 Nov 2023 14:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i5f-0007mE-6r
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:32:31 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a61d930-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:32:30 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:32:08 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:58 -0800
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
X-Inumbo-ID: 4a61d930-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354750; x=1732890750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rfkBnAETWygr5TaDQC+NvTNqfHDXa5mpCuKsaH8rIdY=;
  b=aPuyWK5A854Ff9dtyoTyoKDHk4MlCWRzjVALHOdu7BJg+IhIk5PVtKX0
   0CLnVd0I30oCisuj2FsROL5rMT2WeWP4eg4m7C1QUjkdgROMfkyS9nsaR
   XHz43ZzcdMaAI6SB1iCnMe3tl1qTH7uA3X3eJsT+sKg4gYEj2MTszAzhN
   IsMIMKnjz53PBpXRQVvTefPfehOIgvzacXmWNiiVveK+W08QgaFsMxzYY
   +XrFi9ZxdczaOn3fgY6FFIHqvH6XzrXeq/+WdQdToKQm1Qn30znrOahn2
   WyMv3It1LEOSjsKTSYZK5pU99ypVJlwamh/llyaKJiEk7G2U31upvQuif
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531552"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531552"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729798"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729798"
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
Subject: [RFC 10/41] hw/core/topo: Add virtual method to update topology info for parent
Date: Thu, 30 Nov 2023 22:41:32 +0800
Message-Id: <20231130144203.2307629-11-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

When a new topology device is inserted into the topology tree,
its'parents (including non-direct parent) need to update topology
information.

Add the virtual method to help parents on topology tree update
topology information statistics.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 20 ++++++++++++++++++++
 include/hw/core/cpu-topo.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 3e0c183388d8..e244f0a3564e 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -154,6 +154,20 @@ static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
     cpu_topo_refresh_free_child_index(parent);
 }
 
+static void cpu_topo_update_info(CPUTopoState *topo, bool is_realize)
+{
+    CPUTopoState *parent = topo->parent;
+    CPUTopoClass *tc;
+
+    while (parent) {
+        tc = CPU_TOPO_GET_CLASS(parent);
+        if (tc->update_topo_info) {
+            tc->update_topo_info(parent, topo, is_realize);
+        }
+        parent = parent->parent;
+    }
+}
+
 static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
 {
     Object *obj = OBJECT(topo);
@@ -178,6 +192,11 @@ static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
 
     if (topo->parent) {
         cpu_topo_build_hierarchy(topo, errp);
+        if (*errp) {
+            return;
+        }
+
+        cpu_topo_update_info(topo, true);
     }
 }
 
@@ -203,6 +222,7 @@ static void cpu_topo_destroy_hierarchy(CPUTopoState *topo)
         return;
     }
 
+    cpu_topo_update_info(topo, false);
     QTAILQ_REMOVE(&parent->children, topo, sibling);
     parent->num_children--;
 
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index c0dfff9dc63b..79cd8606feca 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -44,6 +44,8 @@ OBJECT_DECLARE_TYPE(CPUTopoState, CPUTopoClass, CPU_TOPO)
 /**
  * CPUTopoClass:
  * @level: Topology level for this CPUTopoClass.
+ * @update_topo_info: Method to update topology information statistics when
+ *     new child (including direct child and non-direct child) is added.
  */
 struct CPUTopoClass {
     /*< private >*/
@@ -51,6 +53,8 @@ struct CPUTopoClass {
 
     /*< public >*/
     CPUTopoLevel level;
+    void (*update_topo_info)(CPUTopoState *parent, CPUTopoState *child,
+                             bool is_realize);
 };
 
 /**
-- 
2.34.1


