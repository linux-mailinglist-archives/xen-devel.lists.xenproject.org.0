Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD981A2324
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:37:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAtD-0007X0-SE; Wed, 08 Apr 2020 13:37:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+IwF=5Y=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jMAtB-0007WY-RF
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:37:09 +0000
X-Inumbo-ID: 0ad08a5a-799e-11ea-81eb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ad08a5a-799e-11ea-81eb-12813bfff9fa;
 Wed, 08 Apr 2020 13:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=okmq5d3yLNx2nVi7NHGnb7kjUiX+Maxtj+okHFgjkpY=; b=VOUn1n2GY6f0hdKEf/6A2qCOgj
 BKfqZE9LLjSXL3He4sli5dpbintAbIw2vBdIXr61jyakVLAYqiH3YTiyirzRPySKdZXTUvlu2Pl8L
 3nE07BIcbBJBstE3JoSKcCVEuBfO4vZlHt/oRSQvfW0ax3Yzbc6765MyZ/tmaW7e6Sjs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAt9-00057f-UP; Wed, 08 Apr 2020 13:37:07 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAt9-0005ee-Ka; Wed, 08 Apr 2020 13:37:07 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/5] x86/shim: map and unmap page tables in
 replace_va_mapping
Date: Wed,  8 Apr 2020 14:36:51 +0100
Message-Id: <7638095024ec3379a8d9ddadfe47e36da168e4dd.1586352238.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586352238.git.hongyxia@amazon.com>
References: <cover.1586352238.git.hongyxia@amazon.com>
In-Reply-To: <cover.1586352238.git.hongyxia@amazon.com>
References: <cover.1586352238.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Also, introduce lYe_from_lXe() macros which do not rely on the direct
map when walking page tables. Unfortunately, they cannot be inline
functions due to the header dependency on domain_page.h, so keep them as
macros just like map_lYt_from_lXe().

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v2:
- unmap as early as possible instead of unmapping all at the end.
- use lYe_from_lXe() macros and lift them from a later patch to this
  patch.
- const qualify pointers in new macros.
---
 xen/arch/x86/pv/shim.c     |  9 +++++----
 xen/include/asm-x86/page.h | 13 +++++++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index ed2ece8a8a..28d2076065 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -168,16 +168,17 @@ const struct platform_bad_page *__init pv_shim_reserved_pages(unsigned int *size
 static void __init replace_va_mapping(struct domain *d, l4_pgentry_t *l4start,
                                       unsigned long va, mfn_t mfn)
 {
-    l4_pgentry_t *pl4e = l4start + l4_table_offset(va);
-    l3_pgentry_t *pl3e = l4e_to_l3e(*pl4e) + l3_table_offset(va);
-    l2_pgentry_t *pl2e = l3e_to_l2e(*pl3e) + l2_table_offset(va);
-    l1_pgentry_t *pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(va);
+    l4_pgentry_t l4e = l4start[l4_table_offset(va)];
+    l3_pgentry_t l3e = l3e_from_l4e(l4e, l3_table_offset(va));
+    l2_pgentry_t l2e = l2e_from_l3e(l3e, l2_table_offset(va));
+    l1_pgentry_t *pl1e = map_l1t_from_l2e(l2e) + l1_table_offset(va);
     struct page_info *page = mfn_to_page(l1e_get_mfn(*pl1e));
 
     put_page_and_type(page);
 
     *pl1e = l1e_from_mfn(mfn, (!is_pv_32bit_domain(d) ? L1_PROT
                                                       : COMPAT_L1_PROT));
+    UNMAP_DOMAIN_PAGE(pl1e);
 }
 
 static void evtchn_reserve(struct domain *d, unsigned int port)
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index c98d8f5ede..1e16f3980d 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -196,6 +196,19 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
 #define map_l2t_from_l3e(x)        (l2_pgentry_t *)map_domain_page(l3e_get_mfn(x))
 #define map_l3t_from_l4e(x)        (l3_pgentry_t *)map_domain_page(l4e_get_mfn(x))
 
+/* Unlike lYe_to_lXe(), lXe_from_lYe() do not rely on the direct map. */
+#define l2e_from_l3e(l3e, offset) ({                        \
+        const l2_pgentry_t *l2t = map_l2t_from_l3e(l3e);    \
+        l2_pgentry_t l2e = l2t[offset];                     \
+        UNMAP_DOMAIN_PAGE(l2t);                             \
+        l2e; })
+
+#define l3e_from_l4e(l4e, offset) ({                        \
+        const l3_pgentry_t *l3t = map_l3t_from_l4e(l4e);    \
+        l3_pgentry_t l3e = l3t[offset];                     \
+        UNMAP_DOMAIN_PAGE(l3t);                             \
+        l3e; })
+
 /* Given a virtual address, get an entry offset into a page table. */
 #define l1_table_offset(a)         \
     (((a) >> L1_PAGETABLE_SHIFT) & (L1_PAGETABLE_ENTRIES - 1))
-- 
2.24.1.AMZN


