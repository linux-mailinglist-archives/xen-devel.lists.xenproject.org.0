Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714F97FF287
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644834.1006564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCv-0006p9-JT; Thu, 30 Nov 2023 14:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644834.1006564; Thu, 30 Nov 2023 14:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iCu-0006LP-AO; Thu, 30 Nov 2023 14:40:00 +0000
Received: by outflank-mailman (input) for mailman id 644834;
 Thu, 30 Nov 2023 14:37:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jjew=HL=linux.intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1r8i4u-0004Xw-Pi
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:31:44 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2da480e5-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:31:43 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:31:10 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:01 -0800
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
X-Inumbo-ID: 2da480e5-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354703; x=1732890703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q8av5JpkyS6FnEIeBR5gNojelDu9V7STUz/Dtf8UH7E=;
  b=Pl6RCKidOy53hMl3u9OgllTrCBuThagxP6zWt4pqBM3gXsKSbNG7F7tK
   zC4wGVlrY35oZKltxYiRdpgVknZhCrwbuDeuTfGu/nkhELnJ1dJv6NZNL
   qw4tST/bP3IaOPs8S0si3jp/gpfmH2nAHvZ9/NHcfzbUmxE/1uIpRlKdJ
   ZLRzKuZzcJqZaL4K+3xUwtdLS3Acr9H20fvjYYiEJ5IgqeR6Sf6vhkVPB
   T28RrtY9hDgmdKNuMaOAH02xaxgtBIg2krB7oxYj0/59l5R612FkbnJqV
   rB/Pjw5LQ2NtOst8JJ4WWpQqb0dXOFXUWaXyFiOQpJYRwHrv5HSRdX+4m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531053"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531053"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729632"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729632"
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
Subject: [RFC 04/41] qom/object: Introduce helper to resolve path from non-direct parent
Date: Thu, 30 Nov 2023 22:41:26 +0800
Message-Id: <20231130144203.2307629-5-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

When we support child<> property creation from cli, the peripheral
container (/machine/peripheral) may not be the direct parent of the
devices created from cli.

For this case, add a helper to resolve path from non-direct parent.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/qom/object.h | 15 +++++++++++++++
 qom/object.c         | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index afccd24ca7ab..494eef801be3 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1562,6 +1562,21 @@ Object *object_resolve_path_type(const char *path, const char *typename,
  */
 Object *object_resolve_path_at(Object *parent, const char *path);
 
+/**
+ * object_resolve_path_from:
+ * @parent: the object from which to resolve the path
+ * @path: the path to resolve
+ * @ambiguous: returns true if the path resolution failed because of an
+ *   ambiguous match
+ *
+ * This is like object_resolve_path_at(), except @parent may be the
+ * partial parent of @path.
+ *
+ * Returns: The resolved object or NULL on path lookup failure.
+ */
+Object *object_resolve_path_from(Object *parent, const char *path,
+                                 bool *ambiguous);
+
 /**
  * object_resolve_path_component:
  * @parent: the object in which to resolve the path
diff --git a/qom/object.c b/qom/object.c
index 95c0dc8285fe..da29e88816b5 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2192,6 +2192,24 @@ Object *object_resolve_path_at(Object *parent, const char *path)
     return object_resolve_abs_path(parent, parts, TYPE_OBJECT);
 }
 
+Object *object_resolve_path_from(Object *parent, const char *path,
+                                 bool *ambiguousp)
+{
+    g_auto(GStrv) parts = NULL;
+    bool ambiguous = false;
+    Object *obj;
+
+    parts = g_strsplit(path, "/", 0);
+    assert(parts);
+
+    obj = object_resolve_partial_path(parent, parts, TYPE_OBJECT,
+                                      &ambiguous);
+    if (ambiguousp) {
+        *ambiguousp = ambiguous;
+    }
+    return obj;
+}
+
 typedef struct StringProperty
 {
     char *(*get)(Object *, Error **);
-- 
2.34.1


