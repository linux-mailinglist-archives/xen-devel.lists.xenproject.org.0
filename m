Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92CA7FF25A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644769.1006283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC7-0003W9-AT; Thu, 30 Nov 2023 14:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644769.1006283; Thu, 30 Nov 2023 14:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iC7-0003Mx-2c; Thu, 30 Nov 2023 14:39:11 +0000
Received: by outflank-mailman (input) for mailman id 644769;
 Thu, 30 Nov 2023 14:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i5n-0007mE-Hl
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:32:39 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f65e906-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:32:38 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:32:26 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:32:17 -0800
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
X-Inumbo-ID: 4f65e906-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354758; x=1732890758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=giqm05kbC3tYOPrffoLra7vHI+bWgR59/qNt+YCSQ+8=;
  b=ViFxnAcDWpIlpeMhzKZKSxbwWJywdFVR8P+1d2i+GxXK/uup6sfcmjSF
   CqNwne7/GJIiDp3rtuT4kqbXg87y2fAe8pbPDBia5JGTy1rvWTkTz7Bao
   YqO9514T7X/ohXJAAUmpb6iXZNaLroEMAG69JhOKXp9cJQCDIwfGN206H
   NKMsx6BidAh8nxrN4hxp9gqmn7cLORvTidvjPg+6+tiv8cJXlPhatWr/P
   cHMTNwZXgrohSG8K56+fir2vEzGWOw1UzUctvds9u3x/aEr31bhzJId4I
   X+AzrV+v1hqN1rmpYXQAWikwv53I55lY1L7jPEppuNb9XF8t227J3e3s9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531669"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531669"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729853"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729853"
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
Subject: [RFC 12/41] hw/core/topo: Add helpers to traverse the CPU topology tree
Date: Thu, 30 Nov 2023 22:41:34 +0800
Message-Id: <20231130144203.2307629-13-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

The topology devices will be organized as a topology tree. Each topology
device may have many topology children with lower topology level.

Add the helpers to traverse the CPU topology tree.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 41 ++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu-topo.h | 13 ++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index cba2dc747e74..687a4cc566ec 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -318,3 +318,44 @@ static void cpu_topo_register_types(void)
 }
 
 type_init(cpu_topo_register_types)
+
+static int do_cpu_topo_child_foreach(CPUTopoState *topo,
+                                     unsigned long *levels,
+                                     topo_fn fn, void *opaque,
+                                     bool recurse)
+{
+    CPUTopoState *child;
+    int ret = TOPO_FOREACH_CONTINUE;
+
+    QTAILQ_FOREACH(child, &topo->children, sibling) {
+        if (!levels || (levels && test_bit(CPU_TOPO_LEVEL(child), levels))) {
+            ret = fn(child, opaque);
+            if (ret == TOPO_FOREACH_END || ret == TOPO_FOREACH_ERR) {
+                break;
+            } else if (ret == TOPO_FOREACH_SIBLING) {
+                continue;
+            }
+        }
+
+        if (recurse) {
+            ret = do_cpu_topo_child_foreach(child, levels, fn, opaque, recurse);
+            if (ret != TOPO_FOREACH_CONTINUE) {
+                break;
+            }
+        }
+    }
+    return ret;
+}
+
+int cpu_topo_child_foreach(CPUTopoState *topo, unsigned long *levels,
+                           topo_fn fn, void *opaque)
+{
+    return do_cpu_topo_child_foreach(topo, levels, fn, opaque, false);
+}
+
+int cpu_topo_child_foreach_recursive(CPUTopoState *topo,
+                                     unsigned long *levels,
+                                     topo_fn fn, void *opaque)
+{
+    return do_cpu_topo_child_foreach(topo, levels, fn, opaque, true);
+}
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index 1ffdb0be6d38..453bacbb558b 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -90,4 +90,17 @@ struct CPUTopoState {
 
 #define CPU_TOPO_LEVEL(topo)    (CPU_TOPO_GET_CLASS(topo)->level)
 
+#define TOPO_FOREACH_SIBLING         2
+#define TOPO_FOREACH_END             1
+#define TOPO_FOREACH_CONTINUE        0
+#define TOPO_FOREACH_ERR             -1
+
+typedef int (*topo_fn)(CPUTopoState *topo, void *opaque);
+
+int cpu_topo_child_foreach(CPUTopoState *topo, unsigned long *levels,
+                           topo_fn fn, void *opaque);
+int cpu_topo_child_foreach_recursive(CPUTopoState *topo,
+                                     unsigned long *levels,
+                                     topo_fn fn, void *opaque);
+
 #endif /* CPU_TOPO_H */
-- 
2.34.1


