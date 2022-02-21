Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3244BD90E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275989.472028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pr-0004sV-Fv; Mon, 21 Feb 2022 10:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275989.472028; Mon, 21 Feb 2022 10:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pr-0004nL-BP; Mon, 21 Feb 2022 10:22:27 +0000
Received: by outflank-mailman (input) for mailman id 275989;
 Mon, 21 Feb 2022 10:22:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM5pq-0004cB-3l
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:22:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pp-0002Ay-VE; Mon, 21 Feb 2022 10:22:25 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pp-00070b-Nh; Mon, 21 Feb 2022 10:22:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=MXWuUJ4Gmt9SmtDQvOOz1c2o08azUVVOAJUW5p8Yymw=; b=QLO96n1xIu6/SHSb3SXM+I+P6F
	52Xx7khHqRnfeSkjkrvlruIRBxcGXkytgs7C0p+wVNyfG/mrykGKosZ780IoW9alQzdE2HJvn+77M
	e6Yd/5r9n2qbGkVTn32WCx+h3ojkIJ9ePXoZkNj9gefcCGHqDu2BfI/oIoItnyCICyIE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 03/19] xen/arm: p2m: Replace level_{orders, masks} arrays with XEN_PT_LEVEL_{ORDER, MASK}
Date: Mon, 21 Feb 2022 10:22:02 +0000
Message-Id: <20220221102218.33785-4-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The array level_orders and level_masks can be replaced with the
recently introduced macros LEVEL_ORDER and LEVEL_MASK.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - Fix clashes after prefixing the PT macros with XEN_PT_

    Changes in v2:
        - New patch

    The goal is to remove completely the static arrays so they
    don't need to be global (or duplicated) when adding superpage
    support for Xen PT.

    This also has the added benefits to replace a couple of loads
    with only a few instructions working on immediate.
---
 xen/arch/arm/p2m.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 493a1e25879a..1d1059f7d2bd 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -37,12 +37,6 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
  */
 unsigned int __read_mostly p2m_ipa_bits = 64;
 
-/* Helpers to lookup the properties of each level */
-static const paddr_t level_masks[] =
-    { ZEROETH_MASK, FIRST_MASK, SECOND_MASK, THIRD_MASK };
-static const uint8_t level_orders[] =
-    { ZEROETH_ORDER, FIRST_ORDER, SECOND_ORDER, THIRD_ORDER };
-
 static mfn_t __read_mostly empty_root_mfn;
 
 static uint64_t generate_vttbr(uint16_t vmid, mfn_t root_mfn)
@@ -233,7 +227,7 @@ static lpae_t *p2m_get_root_pointer(struct p2m_domain *p2m,
      * we can't use (P2M_ROOT_LEVEL - 1) because the root level might be
      * 0. Yet we still want to check if all the unused bits are zeroed.
      */
-    root_table = gfn_x(gfn) >> (level_orders[P2M_ROOT_LEVEL] +
+    root_table = gfn_x(gfn) >> (XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL) +
                                 XEN_PT_LPAE_SHIFT);
     if ( root_table >= P2M_ROOT_PAGES )
         return NULL;
@@ -380,7 +374,7 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
     {
         for ( level = P2M_ROOT_LEVEL; level < 3; level++ )
-            if ( (gfn_x(gfn) & (level_masks[level] >> PAGE_SHIFT)) >
+            if ( (gfn_x(gfn) & (XEN_PT_LEVEL_MASK(level) >> PAGE_SHIFT)) >
                  gfn_x(p2m->max_mapped_gfn) )
                 break;
 
@@ -423,7 +417,8 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
          * The entry may point to a superpage. Find the MFN associated
          * to the GFN.
          */
-        mfn = mfn_add(mfn, gfn_x(gfn) & ((1UL << level_orders[level]) - 1));
+        mfn = mfn_add(mfn,
+                      gfn_x(gfn) & ((1UL << XEN_PT_LEVEL_ORDER(level)) - 1));
 
         if ( valid )
             *valid = lpae_is_valid(entry);
@@ -434,7 +429,7 @@ out_unmap:
 
 out:
     if ( page_order )
-        *page_order = level_orders[level];
+        *page_order = XEN_PT_LEVEL_ORDER(level);
 
     return mfn;
 }
@@ -808,7 +803,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, lpae_t *entry,
     /* Convenience aliases */
     mfn_t mfn = lpae_get_mfn(*entry);
     unsigned int next_level = level + 1;
-    unsigned int level_order = level_orders[next_level];
+    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
 
     /*
      * This should only be called with target != level and the entry is
-- 
2.32.0


