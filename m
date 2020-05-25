Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB1A1E0EED
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 15:00:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdCiP-00007F-7Q; Mon, 25 May 2020 13:00:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arI+=7H=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jdCiO-000078-JK
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 13:00:24 +0000
X-Inumbo-ID: afcbd092-9e87-11ea-aecf-12813bfff9fa
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afcbd092-9e87-11ea-aecf-12813bfff9fa;
 Mon, 25 May 2020 13:00:19 +0000 (UTC)
IronPort-SDR: jMtoG8pplBeVLv1tousLMSXG3dfh6cjm5XGgF2W98PykInYcjsPEA2/XjeMU8A23cQUYo66LkR
 NwwJFewDLEig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 06:00:14 -0700
IronPort-SDR: 0AKhMnDC6ZUJOL+FPfKYZyI3pQtVz/B/iWd/hEHIT6WXrtwyQZZYUIcDnSp1LSjDTPzF35/ecU
 MhdzVH4TCuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="266140646"
Received: from dmaltesx-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.105.3])
 by orsmga003.jf.intel.com with ESMTP; 25 May 2020 06:00:13 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 for-4.14 2/2] tools/libxc: xc_memshr_fork with interrupts
 blocked
Date: Mon, 25 May 2020 06:00:09 -0700
Message-Id: <60dfdc24b87af20cf09e2cbd551fc62c34234c11.1590411162.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a3b3410c707636aa201641e14b1ab43d4b8821e1.1590411162.git.tamas.lengyel@intel.com>
References: <a3b3410c707636aa201641e14b1ab43d4b8821e1.1590411162.git.tamas.lengyel@intel.com>
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


