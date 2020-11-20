Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B6A2BABBF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 15:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32245.63262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Gm-00011x-Tz; Fri, 20 Nov 2020 14:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32245.63262; Fri, 20 Nov 2020 14:20:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Gm-00011W-Qi; Fri, 20 Nov 2020 14:20:12 +0000
Received: by outflank-mailman (input) for mailman id 32245;
 Fri, 20 Nov 2020 14:20:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BBs/=E2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kg7Gk-00011R-T9
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:20:11 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 833713cc-579f-47d7-adad-50e4ed289afa;
 Fri, 20 Nov 2020 14:20:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BBs/=E2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kg7Gk-00011R-T9
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:20:11 +0000
X-Inumbo-ID: 833713cc-579f-47d7-adad-50e4ed289afa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 833713cc-579f-47d7-adad-50e4ed289afa;
	Fri, 20 Nov 2020 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605882010;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fqba70I57e6KRrSTc8lVRghlr06RGYUwzyNMoEC4v8Y=;
  b=Z4PzhSIDGE/AMt32gSoV7HlAuSG5Xm3e0wOnU4I8FVTPi12zetvTJF3m
   W+SXET0voXtIZM3nt2lDBnRc3OS7xEfDUe/8p+R2XDoEV2QVrE1U8h6OX
   mPvgAf0k4jrDOz+HHE/qtw+7D2KGIxYGqWhSKSLuIKQ3fZTvK4wVvP4Hs
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: taekLhPy/xegJpCbbLPyk0QWtVOnZwIfwsiNlhu2OfMVLSXLqzx/pXa8cI92Mx38J22Qa29FSJ
 zQ+KKU3POUHpMHwzkK4erpHOfiHDGsS1tiTNXcF54wATgu9yKvBLCojlZj5aIgtj8H8xF/RmJj
 4Vy2WTa0sm4SHpomNJi1RoHWgSYqhVQKhHMjSduwfNPa5NqQ56MnXNJtqXrG4LL9u0kSz7o0LA
 EcFvQHFU+DmcKInwmYz25u9sy3ZNSADKFrdzQmIUD2t7+v1Bx3kaXpX0d+PqGKjKFRK2AgMB9o
 wGs=
X-SBRS: None
X-MesageID: 31588333
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,356,1599537600"; 
   d="scan'208";a="31588333"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Paul Durrant
	<paul.durrant@citrix.com>
Subject: [PATCH] amd-iommu: Fix Guest CR3 Table following c/s 3a7947b6901
Date: Fri, 20 Nov 2020 14:19:51 +0000
Message-ID: <20201120141951.13742-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

"amd-iommu: use a bitfield for DTE" renamed iommu_dte_set_guest_cr3()'s gcr3
parameter to gcr3_mfn but ended up with an off-by-PAGE_SIZE error when
extracting bits from the address.

First of all, get_guest_cr3_from_dte() and iommu_dte_set_guest_cr3()
are (almost) getters and setters for the same field, so should live together.

Rename them to dte_{get,set}_gcr3_table() to specifically avoid 'guest_cr3' in
the name.  This field actually points to a table in memory containing an array
of guest CR3 values.  As these functions are used for different logical
indirections, they shouldn't use gfn/mfn terminology for their parameters.
Switch them to use straight uint64_t full addresses.

Fixes: 3a7947b6901 ("amd-iommu: use a bitfield for DTE")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wei.liu2@citrix.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul.durrant@citrix.com>

Rebase over several years worth of changes.

This code is unreachable, so completely untestable, but I think the end result
is better than it was previously.
---
 xen/drivers/passthrough/amd/iommu.h       |  2 --
 xen/drivers/passthrough/amd/iommu_guest.c | 36 +++++++++++++++++++++++++++----
 xen/drivers/passthrough/amd/iommu_map.c   | 21 ------------------
 3 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 28a44ceb85..ad089cb095 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -246,8 +246,6 @@ void amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
 				   uint8_t paging_mode, bool valid);
 void iommu_dte_add_device_entry(struct amd_iommu_dte *dte,
                                 const struct ivrs_mappings *ivrs_dev);
-void iommu_dte_set_guest_cr3(struct amd_iommu_dte *dte, uint16_t dom_id,
-                             uint64_t gcr3_mfn, bool gv, uint8_t glx);
 
 /* send cmd to iommu */
 void amd_iommu_flush_all_pages(struct domain *d);
diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
index 2a3def9a5d..00c5ccd7b5 100644
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -68,11 +68,39 @@ static void guest_iommu_disable(struct guest_iommu *iommu)
     iommu->enabled = 0;
 }
 
-static uint64_t get_guest_cr3_from_dte(struct amd_iommu_dte *dte)
+/*
+ * The Guest CR3 Table is a table written by the guest kernel, pointing at
+ * gCR3 values for PASID transactions to use.  The Device Table Entry points
+ * at a system physical address.
+ *
+ * However, these helpers deliberately use untyped parameters without
+ * reference to gfn/mfn because they are used both for programming the real
+ * IOMMU, and interpreting a guests programming of its vIOMMU.
+ */
+static uint64_t dte_get_gcr3_table(const struct amd_iommu_dte *dte)
 {
     return (((uint64_t)dte->gcr3_trp_51_31 << 31) |
             (dte->gcr3_trp_30_15 << 15) |
-            (dte->gcr3_trp_14_12 << 12)) >> PAGE_SHIFT;
+            (dte->gcr3_trp_14_12 << 12));
+}
+
+static void dte_set_gcr3_table(struct amd_iommu_dte *dte, uint16_t dom_id,
+                               uint64_t addr, bool gv, uint8_t glx)
+{
+#define GCR3_MASK(hi, lo) (((1ul << ((hi) + 1)) - 1) & ~((1ul << (lo)) - 1))
+
+    /* I bit must be set when gcr3 is enabled */
+    dte->i = true;
+
+    dte->gcr3_trp_14_12 = MASK_EXTR(addr, GCR3_MASK(14, 12));
+    dte->gcr3_trp_30_15 = MASK_EXTR(addr, GCR3_MASK(30, 15));
+    dte->gcr3_trp_51_31 = MASK_EXTR(addr, GCR3_MASK(51, 31));
+
+    dte->domain_id = dom_id;
+    dte->glx = glx;
+    dte->gv = gv;
+
+#undef GCR3_MASK
 }
 
 static unsigned int host_domid(struct domain *d, uint64_t g_domid)
@@ -389,7 +417,7 @@ static int do_invalidate_dte(struct domain *d, cmd_entry_t *cmd)
     gdte = &dte_base[gbdf % (PAGE_SIZE / sizeof(struct amd_iommu_dte))];
 
     gdom_id = gdte->domain_id;
-    gcr3_gfn = get_guest_cr3_from_dte(gdte);
+    gcr3_gfn = dte_get_gcr3_table(gdte) >> PAGE_SHIFT;
     glx = gdte->glx;
     gv = gdte->gv;
 
@@ -419,7 +447,7 @@ static int do_invalidate_dte(struct domain *d, cmd_entry_t *cmd)
     mdte = &dte_base[req_id];
 
     spin_lock_irqsave(&iommu->lock, flags);
-    iommu_dte_set_guest_cr3(mdte, hdom_id, gcr3_mfn, gv, glx);
+    dte_set_gcr3_table(mdte, hdom_id, gcr3_mfn << PAGE_SHIFT, gv, glx);
 
     amd_iommu_flush_device(iommu, req_id);
     spin_unlock_irqrestore(&iommu->lock, flags);
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index f773ab33fd..d3a8b1aec7 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -173,27 +173,6 @@ void __init iommu_dte_add_device_entry(struct amd_iommu_dte *dte,
     };
 }
 
-void iommu_dte_set_guest_cr3(struct amd_iommu_dte *dte, uint16_t dom_id,
-                             uint64_t gcr3_mfn, bool gv, uint8_t glx)
-{
-#define GCR3_MASK(hi, lo) (((1ul << ((hi) + 1)) - 1) & ~((1ul << (lo)) - 1))
-#define GCR3_SHIFT(lo) ((lo) - PAGE_SHIFT)
-
-    /* I bit must be set when gcr3 is enabled */
-    dte->i = true;
-
-    dte->gcr3_trp_14_12 = (gcr3_mfn & GCR3_MASK(14, 12)) >> GCR3_SHIFT(12);
-    dte->gcr3_trp_30_15 = (gcr3_mfn & GCR3_MASK(30, 15)) >> GCR3_SHIFT(15);
-    dte->gcr3_trp_51_31 = (gcr3_mfn & GCR3_MASK(51, 31)) >> GCR3_SHIFT(31);
-
-    dte->domain_id = dom_id;
-    dte->glx = glx;
-    dte->gv = gv;
-
-#undef GCR3_SHIFT
-#undef GCR3_MASK
-}
-
 /* Walk io page tables and build level page tables if necessary
  * {Re, un}mapping super page frames causes re-allocation of io
  * page tables.
-- 
2.11.0


