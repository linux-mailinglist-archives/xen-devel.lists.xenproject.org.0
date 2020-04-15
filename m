Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACFF1A9E8B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOghi-0003Ef-Uk; Wed, 15 Apr 2020 11:59:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lFP+=57=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jOghh-0003EK-5Z
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:59:41 +0000
X-Inumbo-ID: 96400832-7f10-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96400832-7f10-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 11:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9mcwfS2UNApo7+gpEmAq4QsskjJ6UAD8MG/Ev2F27Uc=; b=RV3IORgR7mWX/59sDGHfPn9mNz
 p0JKr88IhtNwd8y4fBK2mP2U45nI4djiIpC63+Rv4jz4VtzY4uP/6GkpPj4MnMDLZyxRUjxDaxLya
 autw7/H49qggpvOok3nkV0gUVTFOsgn2no1BIuKc9mzV8s8ZhhRhJ1UquB7PbXF4c7KY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOghg-00027R-9f; Wed, 15 Apr 2020 11:59:40 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOghf-0008L0-Vd; Wed, 15 Apr 2020 11:59:40 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 1/4] x86/shim: map and unmap page tables in
 replace_va_mapping
Date: Wed, 15 Apr 2020 12:59:24 +0100
Message-Id: <37ad7487bc6e6f76e2082c0b42b4cf819007f513.1586951696.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586951696.git.hongyxia@amazon.com>
References: <cover.1586951696.git.hongyxia@amazon.com>
In-Reply-To: <cover.1586951696.git.hongyxia@amazon.com>
References: <cover.1586951696.git.hongyxia@amazon.com>
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
Changed in v3:
- use unmap_domain_page() instead of the macro in several places.
- also introduce l1e_from_l2e().
- add _ prefix in macros to avoid aliasing.

Changed in v2:
- instead of map, map, map, read/write, unmap, unmap, unmap, do map,
  read PTE, unmap for each level instead.
- use lYe_from_lXe() macros and lift them from a later patch to this
  patch.
- const qualify pointers in new macros.
---
 xen/arch/x86/pv/shim.c     |  9 +++++----
 xen/include/asm-x86/page.h | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index ed2ece8a8a..31264582cc 100644
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
+    unmap_domain_page(pl1e);
 }
 
 static void evtchn_reserve(struct domain *d, unsigned int port)
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index eb73a0fc23..d50989a357 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -197,6 +197,25 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
 #define map_l2t_from_l3e(x)        (l2_pgentry_t *)map_domain_page(l3e_get_mfn(x))
 #define map_l3t_from_l4e(x)        (l3_pgentry_t *)map_domain_page(l4e_get_mfn(x))
 
+/* Unlike lYe_to_lXe(), lXe_from_lYe() do not rely on the direct map. */
+#define l1e_from_l2e(_l2e, _offset) ({                      \
+        const l1_pgentry_t *_l1t = map_l1t_from_l2e(_l2e);  \
+        l1_pgentry_t _l1e = _l1t[_offset];                  \
+        unmap_domain_page(_l1t);                            \
+        _l1e; })
+
+#define l2e_from_l3e(_l3e, _offset) ({                      \
+        const l2_pgentry_t *_l2t = map_l2t_from_l3e(_l3e);  \
+        l2_pgentry_t _l2e = _l2t[_offset];                  \
+        unmap_domain_page(_l2t);                            \
+        _l2e; })
+
+#define l3e_from_l4e(_l4e, _offset) ({                      \
+        const l3_pgentry_t *_l3t = map_l3t_from_l4e(_l4e);  \
+        l3_pgentry_t _l3e = _l3t[_offset];                  \
+        unmap_domain_page(_l3t);                            \
+        _l3e; })
+
 /* Given a virtual address, get an entry offset into a page table. */
 #define l1_table_offset(a)         \
     (((a) >> L1_PAGETABLE_SHIFT) & (L1_PAGETABLE_ENTRIES - 1))
-- 
2.24.1.AMZN


