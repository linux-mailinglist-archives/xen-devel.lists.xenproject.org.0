Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37061DDA93
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 00:53:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbu4F-0003yp-NH; Thu, 21 May 2020 22:53:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IBHf=7D=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jbu4D-0003yZ-Rd
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 22:53:33 +0000
X-Inumbo-ID: e31c22f0-9bb5-11ea-ab77-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e31c22f0-9bb5-11ea-ab77-12813bfff9fa;
 Thu, 21 May 2020 22:53:29 +0000 (UTC)
IronPort-SDR: y/I/yRtwb4qe2ZC/aI9RLUEPE5102Mu4foVGhb9fVcBXvM5xDjUchRi/rB57W3ogWUtHWy6CAc
 gm8VpqjOr7sA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 15:53:27 -0700
IronPort-SDR: 3ae7Lmt9oxNiI0YYrpyIj/B7bCMRzlEYzmBU++wyJZIwSlS8CUg+yeFKmhOlK192W871iSuXiI
 HtJKujlMEXIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,419,1583222400"; d="scan'208";a="412567795"
Received: from azehtab-mobl2.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.255.68.236])
 by orsmga004.jf.intel.com with ESMTP; 21 May 2020 15:53:26 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 2/2] tools/libxc: xc_memshr_fork with interrupts
 disabled
Date: Thu, 21 May 2020 15:53:23 -0700
Message-Id: <c2830cae9affe327170c900731a7ca050ddb91ea.1590101479.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7666b5bba73a1410446789a0c4ea908376da3487.1590101479.git.tamas.lengyel@intel.com>
References: <7666b5bba73a1410446789a0c4ea908376da3487.1590101479.git.tamas.lengyel@intel.com>
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

Toolstack side for creating forks with interrupt injection disabled.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxc/include/xenctrl.h | 3 ++-
 tools/libxc/xc_memshr.c       | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 45ff7db1e8..0ea839b72a 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -2242,7 +2242,8 @@ int xc_memshr_range_share(xc_interface *xch,
 int xc_memshr_fork(xc_interface *xch,
                    uint32_t source_domain,
                    uint32_t client_domain,
-                   bool allow_with_iommu);
+                   bool allow_with_iommu,
+                   bool prohibit_interrupts);
 
 /*
  * Note: this function is only intended to be used on short-lived forks that
diff --git a/tools/libxc/xc_memshr.c b/tools/libxc/xc_memshr.c
index 2300cc7075..e2de1d3aa2 100644
--- a/tools/libxc/xc_memshr.c
+++ b/tools/libxc/xc_memshr.c
@@ -240,7 +240,7 @@ int xc_memshr_debug_gref(xc_interface *xch,
 }
 
 int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
-                   bool allow_with_iommu)
+                   bool allow_with_iommu, bool prohibit_interrupts)
 {
     xen_mem_sharing_op_t mso;
 
@@ -251,6 +251,8 @@ int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
 
     if ( allow_with_iommu )
         mso.u.fork.flags |= XENMEM_FORK_WITH_IOMMU_ALLOWED;
+    if ( prohibit_interrupts )
+        mso.u.fork.flags |= XENMEM_FORK_PROHIBIT_INTERRUPTS;
 
     return xc_memshr_memop(xch, domid, &mso);
 }
-- 
2.25.1


