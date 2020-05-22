Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F531DED57
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 18:34:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcAcY-0008ON-2N; Fri, 22 May 2020 16:34:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UE2V=7E=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jcAcX-0008OG-9W
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 16:34:05 +0000
X-Inumbo-ID: 0a47d7e0-9c4a-11ea-b07b-bc764e2007e4
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a47d7e0-9c4a-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 16:34:00 +0000 (UTC)
IronPort-SDR: GAK5B0aPxgcDVjfYmww21crZRwn4iCU7cYH2NlSS0orDwucsU7hVgiHYvycYpmGImkAyovvUSX
 c4xNnwyYH6aQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2020 09:33:57 -0700
IronPort-SDR: iZyueIouIt1QOBCDMYx+urq1Nqe60j6GkJlwLC/tYvEctZCC1KG7/uhyQAzfRKkM2XIumvoZ13
 lDdnoyMd4Fcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,422,1583222400"; d="scan'208";a="301157059"
Received: from rpenaran-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.41.203])
 by orsmga008.jf.intel.com with ESMTP; 22 May 2020 09:33:56 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 for-4.14 2/2] tools/libxc: xc_memshr_fork with interrupts
 blocked
Date: Fri, 22 May 2020 09:33:53 -0700
Message-Id: <a903f59b9dc202114e06b7e4c7e0bb6e3fb588e9.1590165055.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Toolstack side for creating forks with interrupt injection blocked.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 tools/libxc/include/xenctrl.h | 3 ++-
 tools/libxc/xc_memshr.c       | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 45ff7db1e8..804ff001d7 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -2242,7 +2242,8 @@ int xc_memshr_range_share(xc_interface *xch,
 int xc_memshr_fork(xc_interface *xch,
                    uint32_t source_domain,
                    uint32_t client_domain,
-                   bool allow_with_iommu);
+                   bool allow_with_iommu,
+                   bool block_interrupts);
 
 /*
  * Note: this function is only intended to be used on short-lived forks that
diff --git a/tools/libxc/xc_memshr.c b/tools/libxc/xc_memshr.c
index 2300cc7075..a6cfd7dccf 100644
--- a/tools/libxc/xc_memshr.c
+++ b/tools/libxc/xc_memshr.c
@@ -240,7 +240,7 @@ int xc_memshr_debug_gref(xc_interface *xch,
 }
 
 int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
-                   bool allow_with_iommu)
+                   bool allow_with_iommu, bool block_interrupts)
 {
     xen_mem_sharing_op_t mso;
 
@@ -251,6 +251,8 @@ int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
 
     if ( allow_with_iommu )
         mso.u.fork.flags |= XENMEM_FORK_WITH_IOMMU_ALLOWED;
+    if ( block_interrupts )
+        mso.u.fork.flags |= XENMEM_FORK_BLOCK_INTERRUPTS;
 
     return xc_memshr_memop(xch, domid, &mso);
 }
-- 
2.25.1


