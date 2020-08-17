Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F125A2463BF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bm0-0004IY-OC; Mon, 17 Aug 2020 09:49:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7blz-00046j-0P
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:47 +0000
X-Inumbo-ID: 15fd8fe1-3080-47ed-947f-38b1ff40de51
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15fd8fe1-3080-47ed-947f-38b1ff40de51;
 Mon, 17 Aug 2020 09:49:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C47BAEFA;
 Mon, 17 Aug 2020 09:49:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 09/17] tools/misc: replace PAGE_SIZE with XC_PAGE_SIZE
 in xen-mfndump.c
Date: Mon, 17 Aug 2020 11:49:14 +0200
Message-Id: <20200817094922.15768-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The definition of PAGE_SIZE comes from xc_private.h, which shouldn't be
used by xen-mfndump.c. Replace PAGE_SIZE by XC_PAGE_SIZE, as
xc_private.h contains:

#define PAGE_SIZE XC_PAGE_SIZE

For the same reason PAGE_SHIFT_X86 needs to replaced with
XC_PAGE_SHIFT.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/misc/xen-mfndump.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/misc/xen-mfndump.c b/tools/misc/xen-mfndump.c
index cb15d08c7e..92bc954ce0 100644
--- a/tools/misc/xen-mfndump.c
+++ b/tools/misc/xen-mfndump.c
@@ -207,7 +207,7 @@ int dump_ptes_func(int argc, char *argv[])
         goto out;
     }
 
-    page = xc_map_foreign_range(xch, domid, PAGE_SIZE, PROT_READ,
+    page = xc_map_foreign_range(xch, domid, XC_PAGE_SIZE, PROT_READ,
                                 minfo.p2m_table[pfn]);
     if ( !page )
     {
@@ -216,7 +216,7 @@ int dump_ptes_func(int argc, char *argv[])
         goto out;
     }
 
-    pte_num = PAGE_SIZE / 8;
+    pte_num = XC_PAGE_SIZE / 8;
 
     printf(" --- Dumping %d PTEs for domain %d ---\n", pte_num, domid);
     printf(" Guest Width: %u, PT Levels: %u P2M size: = %lu\n",
@@ -252,7 +252,7 @@ int dump_ptes_func(int argc, char *argv[])
 
  out:
     if ( page )
-        munmap(page, PAGE_SIZE);
+        munmap(page, XC_PAGE_SIZE);
     xc_unmap_domain_meminfo(xch, &minfo);
     munmap(m2p_table, M2P_SIZE(max_mfn));
     return rc;
@@ -290,7 +290,7 @@ int lookup_pte_func(int argc, char *argv[])
         return -1;
     }
 
-    pte_num = PAGE_SIZE / 8;
+    pte_num = XC_PAGE_SIZE / 8;
 
     printf(" --- Lookig for PTEs mapping mfn 0x%lx for domain %d ---\n",
            mfn, domid);
@@ -302,7 +302,7 @@ int lookup_pte_func(int argc, char *argv[])
         if ( !(minfo.pfn_type[i] & XEN_DOMCTL_PFINFO_LTABTYPE_MASK) )
             continue;
 
-        page = xc_map_foreign_range(xch, domid, PAGE_SIZE, PROT_READ,
+        page = xc_map_foreign_range(xch, domid, XC_PAGE_SIZE, PROT_READ,
                                     minfo.p2m_table[i]);
         if ( !page )
             continue;
@@ -312,15 +312,15 @@ int lookup_pte_func(int argc, char *argv[])
             uint64_t pte = ((const uint64_t*)page)[j];
 
 #define __MADDR_BITS_X86  ((minfo.guest_width == 8) ? 52 : 44)
-#define __MFN_MASK_X86    ((1ULL << (__MADDR_BITS_X86 - PAGE_SHIFT_X86)) - 1)
-            if ( ((pte >> PAGE_SHIFT_X86) & __MFN_MASK_X86) == mfn)
+#define __MFN_MASK_X86    ((1ULL << (__MADDR_BITS_X86 - XC_PAGE_SHIFT)) - 1)
+            if ( ((pte >> XC_PAGE_SHIFT) & __MFN_MASK_X86) == mfn)
                 printf("  0x%lx <-- [0x%lx][%lu]: 0x%"PRIx64"\n",
                        mfn, minfo.p2m_table[i], j, pte);
 #undef __MADDR_BITS_X86
 #undef __MFN_MASK_X8
         }
 
-        munmap(page, PAGE_SIZE);
+        munmap(page, XC_PAGE_SIZE);
         page = NULL;
     }
 
@@ -355,8 +355,8 @@ int memcmp_mfns_func(int argc, char *argv[])
         return -1;
     }
 
-    page1 = xc_map_foreign_range(xch, domid1, PAGE_SIZE, PROT_READ, mfn1);
-    page2 = xc_map_foreign_range(xch, domid2, PAGE_SIZE, PROT_READ, mfn2);
+    page1 = xc_map_foreign_range(xch, domid1, XC_PAGE_SIZE, PROT_READ, mfn1);
+    page2 = xc_map_foreign_range(xch, domid2, XC_PAGE_SIZE, PROT_READ, mfn2);
     if ( !page1 || !page2 )
     {
         ERROR("Failed to map either 0x%lx[dom %d] or 0x%lx[dom %d]\n",
@@ -368,13 +368,13 @@ int memcmp_mfns_func(int argc, char *argv[])
     printf(" --- Comparing the content of 2 MFNs ---\n");
     printf(" 1: 0x%lx[dom %d], 2: 0x%lx[dom %d]\n",
            mfn1, domid1, mfn2, domid2);
-    printf("  memcpy(1, 2) = %d\n", memcmp(page1, page2, PAGE_SIZE));
+    printf("  memcpy(1, 2) = %d\n", memcmp(page1, page2, XC_PAGE_SIZE));
 
  out:
     if ( page1 )
-        munmap(page1, PAGE_SIZE);
+        munmap(page1, XC_PAGE_SIZE);
     if ( page2 )
-        munmap(page2, PAGE_SIZE);
+        munmap(page2, XC_PAGE_SIZE);
     return rc;
 }
 
-- 
2.26.2


