Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3236A91A
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117303.223134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8C-0001VS-OS; Sun, 25 Apr 2021 20:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117303.223134; Sun, 25 Apr 2021 20:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8C-0001Uo-Kg; Sun, 25 Apr 2021 20:13:28 +0000
Received: by outflank-mailman (input) for mailman id 117303;
 Sun, 25 Apr 2021 20:13:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lal8B-0001Tv-5i
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:13:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8A-0000oJ-Pf; Sun, 25 Apr 2021 20:13:26 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8A-0005m7-HE; Sun, 25 Apr 2021 20:13:26 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=jWWczyhwx5+vonIhKTnyI8FTuC3mdInSZ1tXL3+0cBg=; b=Ib3Ub05fstFLx8pqFUj2tpx+l
	trTAMuc4XOpZ5Ge3426W5ETmcqn+9nMYRWdSyFl1hqYnuX24sOs/5xujbt/yU6hFC4Lf/3TBv1XyX
	O/RHbp+NCSWqVgNXGMv5ufJ5fIS+JQAYXDDVPXNLyDD3J+BCASCvzJ22oiGOXTiS813jc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFCv2 03/15] xen/arm: p2m: Replace level_{orders, masks} arrays with LEVEL_{ORDER, MASK}
Date: Sun, 25 Apr 2021 21:13:06 +0100
Message-Id: <20210425201318.15447-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The array level_orders and level_masks can be replaced with the
recently introduced macros LEVEL_ORDER and LEVEL_MASK.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/arch/arm/p2m.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ac5031262061..1b04c3534439 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -36,12 +36,6 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
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
@@ -232,7 +226,7 @@ static lpae_t *p2m_get_root_pointer(struct p2m_domain *p2m,
      * we can't use (P2M_ROOT_LEVEL - 1) because the root level might be
      * 0. Yet we still want to check if all the unused bits are zeroed.
      */
-    root_table = gfn_x(gfn) >> (level_orders[P2M_ROOT_LEVEL] + LPAE_SHIFT);
+    root_table = gfn_x(gfn) >> (LEVEL_ORDER(P2M_ROOT_LEVEL) + LPAE_SHIFT);
     if ( root_table >= P2M_ROOT_PAGES )
         return NULL;
 
@@ -378,7 +372,7 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
     {
         for ( level = P2M_ROOT_LEVEL; level < 3; level++ )
-            if ( (gfn_x(gfn) & (level_masks[level] >> PAGE_SHIFT)) >
+            if ( (gfn_x(gfn) & (LEVEL_MASK(level) >> PAGE_SHIFT)) >
                  gfn_x(p2m->max_mapped_gfn) )
                 break;
 
@@ -421,7 +415,7 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
          * The entry may point to a superpage. Find the MFN associated
          * to the GFN.
          */
-        mfn = mfn_add(mfn, gfn_x(gfn) & ((1UL << level_orders[level]) - 1));
+        mfn = mfn_add(mfn, gfn_x(gfn) & ((1UL << LEVEL_ORDER(level)) - 1));
 
         if ( valid )
             *valid = lpae_is_valid(entry);
@@ -432,7 +426,7 @@ out_unmap:
 
 out:
     if ( page_order )
-        *page_order = level_orders[level];
+        *page_order = LEVEL_ORDER(level);
 
     return mfn;
 }
@@ -806,7 +800,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, lpae_t *entry,
     /* Convenience aliases */
     mfn_t mfn = lpae_get_mfn(*entry);
     unsigned int next_level = level + 1;
-    unsigned int level_order = level_orders[next_level];
+    unsigned int level_order = LEVEL_ORDER(next_level);
 
     /*
      * This should only be called with target != level and the entry is
-- 
2.17.1


