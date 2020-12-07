Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1118F2D10E0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 13:50:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46479.82489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFxj-0000ZV-5x; Mon, 07 Dec 2020 12:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46479.82489; Mon, 07 Dec 2020 12:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFxj-0000Z5-2T; Mon, 07 Dec 2020 12:49:55 +0000
Received: by outflank-mailman (input) for mailman id 46479;
 Mon, 07 Dec 2020 12:49:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kmFxh-0000Z0-3G
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 12:49:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kmFxg-0008Tk-Ei; Mon, 07 Dec 2020 12:49:52 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kmFxg-0005Dh-2I; Mon, 07 Dec 2020 12:49:52 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=avA3/AgNUAj6DyXzZAF5RRWLTIEI3aIs4sNfUQvf0+4=; b=DpXQsAghdggFCEbbBGYvoNxUqo
	f9PZ9/smDhPZktVdtNyT0B4bByTZTzsSbppL1rXaCNSdAkN82AXumWNn2mI9xWDl95/09S49/Bv24
	Zv6zaMS5zAjFQJlPZqkWmsvxUiQ4hf5JmdTBsd8xzy5Rxx9x0BSdxgSd/aTBHxgSOc20=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] x86/vmap: handle superpages in vmap_to_mfn()
Date: Mon,  7 Dec 2020 12:49:33 +0000
Message-Id: <8e7a12064c68a1743dd3bd8c38feae2abea24071.1607345364.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1

From: Hongyan Xia <hongyxia@amazon.com>

There is simply no guarantee that vmap won't return superpages to the
caller. It can happen if the list of MFNs are contiguous, or we simply
have a large granularity. Although rare, if such things do happen, we
will simply hit BUG_ON() and crash.

Introduce xen_map_to_mfn() to translate any mapped Xen address to mfn
regardless of page size, and wrap vmap_to_mfn() around it.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v3:
- switch to do-while.
- move the declaration close to map_pages_to_xen().
- add missing parentheses to vmap_to_mfn().

Changed in v2:
- const pl*e
- introduce xen_map_to_mfn().
- goto to a single exit path.
- ASSERT_UNREACHABLE instead of ASSERT.
---
 xen/arch/x86/mm.c          | 56 ++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/page.h |  2 +-
 xen/include/xen/mm.h       |  1 +
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5a50339284c7..723cc1070f16 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5194,6 +5194,62 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
         }                                          \
     } while ( false )
 
+/* Translate mapped Xen address to MFN. */
+mfn_t xen_map_to_mfn(unsigned long va)
+{
+#define CHECK_MAPPED(cond)          \
+    do {                            \
+        if ( !(cond) )              \
+        {                           \
+            ASSERT_UNREACHABLE();   \
+            ret = INVALID_MFN;      \
+            goto out;               \
+        }                           \
+    } while ( false )
+
+    bool locking = system_state > SYS_STATE_boot;
+    unsigned int l2_offset = l2_table_offset(va);
+    unsigned int l1_offset = l1_table_offset(va);
+    const l3_pgentry_t *pl3e = virt_to_xen_l3e(va);
+    const l2_pgentry_t *pl2e = NULL;
+    const l1_pgentry_t *pl1e = NULL;
+    struct page_info *l3page;
+    mfn_t ret;
+
+    L3T_INIT(l3page);
+    CHECK_MAPPED(pl3e);
+    l3page = virt_to_page(pl3e);
+    L3T_LOCK(l3page);
+
+    CHECK_MAPPED(l3e_get_flags(*pl3e) & _PAGE_PRESENT);
+    if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
+    {
+        ret = mfn_add(l3e_get_mfn(*pl3e),
+                      (l2_offset << PAGETABLE_ORDER) + l1_offset);
+        goto out;
+    }
+
+    pl2e = map_l2t_from_l3e(*pl3e) + l2_offset;
+    CHECK_MAPPED(l2e_get_flags(*pl2e) & _PAGE_PRESENT);
+    if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
+    {
+        ret = mfn_add(l2e_get_mfn(*pl2e), l1_offset);
+        goto out;
+    }
+
+    pl1e = map_l1t_from_l2e(*pl2e) + l1_offset;
+    CHECK_MAPPED(l1e_get_flags(*pl1e) & _PAGE_PRESENT);
+    ret = l1e_get_mfn(*pl1e);
+
+#undef CHECK_MAPPED
+ out:
+    L3T_UNLOCK(l3page);
+    unmap_domain_page(pl1e);
+    unmap_domain_page(pl2e);
+    unmap_domain_page(pl3e);
+    return ret;
+}
+
 int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index 7a771baf7cb3..082c14a66226 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -291,7 +291,7 @@ void copy_page_sse2(void *, const void *);
 #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
 #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
 #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
-#define vmap_to_mfn(va)     l1e_get_mfn(*virt_to_xen_l1e((unsigned long)(va)))
+#define vmap_to_mfn(va)     xen_map_to_mfn((unsigned long)(va))
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 #endif /* !defined(__ASSEMBLY__) */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index f7975b2df00b..1475f352e411 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -175,6 +175,7 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
+mfn_t xen_map_to_mfn(unsigned long va);
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
     unsigned long virt,
-- 
2.17.1


