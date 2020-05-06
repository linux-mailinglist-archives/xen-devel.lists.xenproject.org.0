Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390501C71DD
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 15:42:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWKJE-000430-3c; Wed, 06 May 2020 13:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Srcy=6U=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jWKJB-00042H-UM
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 13:41:57 +0000
X-Inumbo-ID: 5972e952-8f9f-11ea-9887-bc764e2007e4
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5972e952-8f9f-11ea-9887-bc764e2007e4;
 Wed, 06 May 2020 13:41:56 +0000 (UTC)
IronPort-SDR: ZKOUV3xuFZC//voXop9CLqejJAZ2JauOvQakU0OCKC7aiBhWuCWGPvA7rPVJ00WTqkEMdeYVBx
 uKnh4etw9dHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 06:41:54 -0700
IronPort-SDR: 85gj5SCOulbu6Af8PbMjNCSbyhnJNfLJ6RXQ8aPKtpmmCQ+sZxj0LXWHxMiaBvC+U0cGFZF5Er
 14gbVQKNJKwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,359,1583222400"; d="scan'208";a="304802044"
Received: from srcuster-mobl11.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.81.167])
 by FMSMGA003.fm.intel.com with ESMTP; 06 May 2020 06:41:53 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v18 1/2] tools/libxc: add VM forking functions
Date: Wed,  6 May 2020 06:41:43 -0700
Message-Id: <a59dabe3a40d4f3709d3ad6ca605523f180c2dc5.1588772376.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add functions to issue VM forking hypercalls

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxc/include/xenctrl.h | 14 ++++++++++++++
 tools/libxc/xc_memshr.c       | 26 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 5f25c5a6d4..0a6ff93229 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -2232,6 +2232,20 @@ int xc_memshr_range_share(xc_interface *xch,
                           uint64_t first_gfn,
                           uint64_t last_gfn);
 
+int xc_memshr_fork(xc_interface *xch,
+                   uint32_t source_domain,
+                   uint32_t client_domain,
+                   bool allow_with_iommu);
+
+/*
+ * Note: this function is only intended to be used on short-lived forks that
+ * haven't yet aquired a lot of memory. In case the fork has a lot of memory
+ * it is likely more performant to create a new fork with xc_memshr_fork.
+ *
+ * With VMs that have a lot of memory this call may block for a long time.
+ */
+int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain);
+
 /* Debug calls: return the number of pages referencing the shared frame backing
  * the input argument. Should be one or greater.
  *
diff --git a/tools/libxc/xc_memshr.c b/tools/libxc/xc_memshr.c
index 97e2e6a8d9..2300cc7075 100644
--- a/tools/libxc/xc_memshr.c
+++ b/tools/libxc/xc_memshr.c
@@ -239,6 +239,32 @@ int xc_memshr_debug_gref(xc_interface *xch,
     return xc_memshr_memop(xch, domid, &mso);
 }
 
+int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
+                   bool allow_with_iommu)
+{
+    xen_mem_sharing_op_t mso;
+
+    memset(&mso, 0, sizeof(mso));
+
+    mso.op = XENMEM_sharing_op_fork;
+    mso.u.fork.parent_domain = pdomid;
+
+    if ( allow_with_iommu )
+        mso.u.fork.flags |= XENMEM_FORK_WITH_IOMMU_ALLOWED;
+
+    return xc_memshr_memop(xch, domid, &mso);
+}
+
+int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid)
+{
+    xen_mem_sharing_op_t mso;
+
+    memset(&mso, 0, sizeof(mso));
+    mso.op = XENMEM_sharing_op_fork_reset;
+
+    return xc_memshr_memop(xch, domid, &mso);
+}
+
 int xc_memshr_audit(xc_interface *xch)
 {
     xen_mem_sharing_op_t mso;
-- 
2.25.1


