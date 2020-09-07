Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB89260197
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 19:10:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFKdz-0007US-Sb; Mon, 07 Sep 2020 17:09:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5qx=CQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFKdy-0007UN-Vp
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 17:09:27 +0000
X-Inumbo-ID: 7f961117-3571-4072-a1f1-1b26f855d901
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f961117-3571-4072-a1f1-1b26f855d901;
 Mon, 07 Sep 2020 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599498565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YGraFUm+xpzAVrCcC5FaAymr8aIloZE5VYP84ieUMd8=;
 b=Rgp/7FbzCvdGWPMIuRgXU77xEWuNXZ2yfxYq70CCoBGwEuhJBqSJagJk
 coqlsCTz5i8WCmBjLbmRtWXzwsZ6NIxzFBdy27EFVh2UrLODyT+4tRqQq
 JDLG084ZM4Sg6vhAnEWpg97x070w+oh+Bl3vjCboh8Eagea+KEDQIZj5f I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ki9GnZ++DcCqtApWT4hj5m+lXX1yHqfd7dKOsvy3lc3Da2qzi3qpo1toOl1jLiHeZsMVMB826h
 3pgu0NQhG/sP2U3r5RjzAwhPwYu1QXVB3TPI7XqbrcdC++CQJZKtKS+Jb501X7A4NPNKKNzo76
 Tf1DykezGNvGc7Zgyig5jU0RPBtoXYIJGpxYUtj7v4tnG2nVewcrLRgbcYx3RaSLRrQF9vi+y+
 qSmBu1NKe9O3l+9XtZwQmiQjUYkBCs2nx0oasge6m5nss4RX12ToD4ZjBQjilhcGO+jBvKqqQP
 zHA=
X-SBRS: 2.7
X-MesageID: 26440098
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,402,1592884800"; d="scan'208";a="26440098"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: [PATCH] Revert "x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()"
Date: Mon, 7 Sep 2020 19:09:16 +0200
Message-ID: <20200907170916.61693-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This reverts commit 81fd0d3ca4b2cd309403c6e8da662c325dd35750.

Original commit only takes into account the APIC access page being a
'special' page, but when running a PVH dom0 there are other pages that
also fulfill the 'special' page check but shouldn't have it's cache
type set to WB.

For example the ACPI regions are identity mapped into the guest but
are also Xen heap pages, and forcing those to WB cache type is wrong.

I've discovered this while trying to boot a PVH dom0, which fail to
boot with this commit applied.

Revert the commit while this is sorted out: either we settle that the
current code is correct, or we modify the way ACPI regions are mapped
into a PVH dom0.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Paul Durrant <paul@xen.org>
---
 xen/arch/x86/hvm/mtrr.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index fb051d59c3..2bd64e8025 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -815,13 +815,23 @@ int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
         return -1;
     }
 
+    if ( direct_mmio )
+    {
+        if ( (mfn_x(mfn) ^ mfn_x(d->arch.hvm.vmx.apic_access_mfn)) >> order )
+            return MTRR_TYPE_UNCACHABLE;
+        if ( order )
+            return -1;
+        *ipat = 1;
+        return MTRR_TYPE_WRBACK;
+    }
+
     if ( !mfn_valid(mfn) )
     {
         *ipat = 1;
         return MTRR_TYPE_UNCACHABLE;
     }
 
-    if ( !direct_mmio && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
+    if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
     {
         *ipat = 1;
         return MTRR_TYPE_WRBACK;
@@ -838,9 +848,6 @@ int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
         }
     }
 
-    if ( direct_mmio )
-        return MTRR_TYPE_UNCACHABLE;
-
     gmtrr_mtype = hvm_get_mem_pinned_cacheattr(d, _gfn(gfn), order);
     if ( gmtrr_mtype >= 0 )
     {
-- 
2.28.0


