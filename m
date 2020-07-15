Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E573822123E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:26:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkET-0002ku-9E; Wed, 15 Jul 2020 16:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5qj=A2=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jvkER-0002Yi-Al
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:26:07 +0000
X-Inumbo-ID: d10c44f0-c6b7-11ea-bca7-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d10c44f0-c6b7-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 16:25:38 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jvkDx-0001sU-94; Wed, 15 Jul 2020 17:25:37 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 06/12] tools/misc: don't use libxenctrl internals from misc
 tools
Date: Wed, 15 Jul 2020 17:25:05 +0100
Message-Id: <20200715162511.5941-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
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
Reply-To: incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com,
 xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, ian.jackson@eu.citrix.com,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Juergen Gross <jgross@suse.com>

xen-hptool and xen-mfndump are using internals from libxenctrl e.g. by
including private headers. Fix that by using either the correct
official headers or use other means.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxc/xg_save_restore.h |  4 --
 tools/misc/Makefile           |  4 --
 tools/misc/xen-hptool.c       |  8 ++--
 tools/misc/xen-mfndump.c      | 70 +++++++++++++++++++----------------
 4 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/tools/libxc/xg_save_restore.h b/tools/libxc/xg_save_restore.h
index 303081df0d..b904296997 100644
--- a/tools/libxc/xg_save_restore.h
+++ b/tools/libxc/xg_save_restore.h
@@ -109,10 +109,6 @@ static inline int get_platform_info(xc_interface *xch, uint32_t dom,
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
-/* Returns TRUE if the PFN is currently mapped */
-#define is_mapped(pfn_type) (!((pfn_type) & 0x80000000UL))
-
-
 #define GET_FIELD(_p, _f, _w) (((_w) == 8) ? ((_p)->x64._f) : ((_p)->x32._f))
 
 #define SET_FIELD(_p, _f, _v, _w) do {          \
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 9fdb13597f..4e2e8f3b17 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -93,15 +93,11 @@ xenhypfs: xenhypfs.o
 xenlockprof: xenlockprof.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
-# xen-hptool incorrectly uses libxc internals
-xen-hptool.o: CFLAGS += -I$(XEN_ROOT)/tools/libxc $(CFLAGS_libxencall)
 xen-hptool: xen-hptool.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
 
 xenhypfs.o: CFLAGS += $(CFLAGS_libxenhypfs)
 
-# xen-mfndump incorrectly uses libxc internals
-xen-mfndump.o: CFLAGS += -I$(XEN_ROOT)/tools/libxc $(CFLAGS_libxencall)
 xen-mfndump: xen-mfndump.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
index 6e27d9cf43..7f17f24942 100644
--- a/tools/misc/xen-hptool.c
+++ b/tools/misc/xen-hptool.c
@@ -1,9 +1,11 @@
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 #include <xenevtchn.h>
 #include <xenctrl.h>
-#include <xc_private.h>
-#include <xc_core.h>
+#include <xenguest.h>
 #include <xenstore.h>
-#include <unistd.h>
+#include <xen-tools/libs.h>
 
 static xc_interface *xch;
 
diff --git a/tools/misc/xen-mfndump.c b/tools/misc/xen-mfndump.c
index 858bd0e26b..39ab00eb55 100644
--- a/tools/misc/xen-mfndump.c
+++ b/tools/misc/xen-mfndump.c
@@ -1,11 +1,17 @@
-#define XC_WANT_COMPAT_MAP_FOREIGN_API
-#include <xenctrl.h>
-#include <xc_private.h>
-#include <xc_core.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
 #include <unistd.h>
 #include <inttypes.h>
 
-#include "xg_save_restore.h"
+#define XC_WANT_COMPAT_MAP_FOREIGN_API
+#include <xenctrl.h>
+#include <xenguest.h>
+
+#include <xen-tools/libs.h>
+
+#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), 21)
+#define is_mapped(pfn_type) (!((pfn_type) & 0x80000000UL))
 
 static xc_interface *xch;
 
@@ -41,13 +47,13 @@ int dump_m2p_func(int argc, char *argv[])
     /* Map M2P and obtain gpfn */
     if ( xc_maximum_ram_page(xch, &max_mfn) < 0 )
     {
-        ERROR("Failed to get the maximum mfn");
+        fprintf(stderr, "Failed to get the maximum mfn");
         return -1;
     }
 
     if ( !(m2p_table = xc_map_m2p(xch, max_mfn, PROT_READ, NULL)) )
     {
-        ERROR("Failed to map live M2P table");
+        fprintf(stderr, "Failed to map live M2P table");
         return -1;
     }
 
@@ -80,7 +86,7 @@ int dump_p2m_func(int argc, char *argv[])
     if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
          info.domid != domid )
     {
-        ERROR("Failed to obtain info for domain %d\n", domid);
+        fprintf(stderr, "Failed to obtain info for domain %d\n", domid);
         return -1;
     }
 
@@ -88,7 +94,7 @@ int dump_p2m_func(int argc, char *argv[])
     memset(&minfo, 0, sizeof(minfo));
     if ( xc_map_domain_meminfo(xch, domid, &minfo) )
     {
-        ERROR("Could not map domain %d memory information\n", domid);
+        fprintf(stderr, "Could not map domain %d memory information\n", domid);
         return -1;
     }
 
@@ -167,7 +173,7 @@ int dump_ptes_func(int argc, char *argv[])
     if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
          info.domid != domid )
     {
-        ERROR("Failed to obtain info for domain %d\n", domid);
+        fprintf(stderr, "Failed to obtain info for domain %d\n", domid);
         return -1;
     }
 
@@ -175,7 +181,7 @@ int dump_ptes_func(int argc, char *argv[])
     memset(&minfo, 0, sizeof(minfo));
     if ( xc_map_domain_meminfo(xch, domid, &minfo) )
     {
-        ERROR("Could not map domain %d memory information\n", domid);
+        fprintf(stderr, "Could not map domain %d memory information\n", domid);
         return -1;
     }
 
@@ -185,35 +191,35 @@ int dump_ptes_func(int argc, char *argv[])
          !(m2p_table = xc_map_m2p(xch, max_mfn, PROT_READ, NULL)) )
     {
         xc_unmap_domain_meminfo(xch, &minfo);
-        ERROR("Failed to map live M2P table");
+        fprintf(stderr, "Failed to map live M2P table");
         return -1;
     }
 
     pfn = m2p_table[mfn];
     if ( pfn >= minfo.p2m_size )
     {
-        ERROR("pfn 0x%lx out of range for domain %d\n", pfn, domid);
+        fprintf(stderr, "pfn 0x%lx out of range for domain %d\n", pfn, domid);
         rc = -1;
         goto out;
     }
 
     if ( !(minfo.pfn_type[pfn] & XEN_DOMCTL_PFINFO_LTABTYPE_MASK) )
     {
-        ERROR("pfn 0x%lx for domain %d is not a PT\n", pfn, domid);
+        fprintf(stderr, "pfn 0x%lx for domain %d is not a PT\n", pfn, domid);
         rc = -1;
         goto out;
     }
 
-    page = xc_map_foreign_range(xch, domid, PAGE_SIZE, PROT_READ,
+    page = xc_map_foreign_range(xch, domid, XC_PAGE_SIZE, PROT_READ,
                                 minfo.p2m_table[pfn]);
     if ( !page )
     {
-        ERROR("Failed to map 0x%lx\n", minfo.p2m_table[pfn]);
+        fprintf(stderr, "Failed to map 0x%lx\n", minfo.p2m_table[pfn]);
         rc = -1;
         goto out;
     }
 
-    pte_num = PAGE_SIZE / 8;
+    pte_num = XC_PAGE_SIZE / 8;
 
     printf(" --- Dumping %d PTEs for domain %d ---\n", pte_num, domid);
     printf(" Guest Width: %u, PT Levels: %u P2M size: = %lu\n",
@@ -249,7 +255,7 @@ int dump_ptes_func(int argc, char *argv[])
 
  out:
     if ( page )
-        munmap(page, PAGE_SIZE);
+        munmap(page, XC_PAGE_SIZE);
     xc_unmap_domain_meminfo(xch, &minfo);
     munmap(m2p_table, M2P_SIZE(max_mfn));
     return rc;
@@ -275,7 +281,7 @@ int lookup_pte_func(int argc, char *argv[])
     if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
          info.domid != domid )
     {
-        ERROR("Failed to obtain info for domain %d\n", domid);
+        fprintf(stderr, "Failed to obtain info for domain %d\n", domid);
         return -1;
     }
 
@@ -283,11 +289,11 @@ int lookup_pte_func(int argc, char *argv[])
     memset(&minfo, 0, sizeof(minfo));
     if ( xc_map_domain_meminfo(xch, domid, &minfo) )
     {
-        ERROR("Could not map domain %d memory information\n", domid);
+        fprintf(stderr, "Could not map domain %d memory information\n", domid);
         return -1;
     }
 
-    pte_num = PAGE_SIZE / 8;
+    pte_num = XC_PAGE_SIZE / 8;
 
     printf(" --- Lookig for PTEs mapping mfn 0x%lx for domain %d ---\n",
            mfn, domid);
@@ -299,7 +305,7 @@ int lookup_pte_func(int argc, char *argv[])
         if ( !(minfo.pfn_type[i] & XEN_DOMCTL_PFINFO_LTABTYPE_MASK) )
             continue;
 
-        page = xc_map_foreign_range(xch, domid, PAGE_SIZE, PROT_READ,
+        page = xc_map_foreign_range(xch, domid, XC_PAGE_SIZE, PROT_READ,
                                     minfo.p2m_table[i]);
         if ( !page )
             continue;
@@ -309,15 +315,15 @@ int lookup_pte_func(int argc, char *argv[])
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
 
@@ -348,15 +354,15 @@ int memcmp_mfns_func(int argc, char *argv[])
          xc_domain_getinfo(xch, domid2, 1, &info2) != 1 ||
          info1.domid != domid1 || info2.domid != domid2)
     {
-        ERROR("Failed to obtain info for domains\n");
+        fprintf(stderr, "Failed to obtain info for domains\n");
         return -1;
     }
 
-    page1 = xc_map_foreign_range(xch, domid1, PAGE_SIZE, PROT_READ, mfn1);
-    page2 = xc_map_foreign_range(xch, domid2, PAGE_SIZE, PROT_READ, mfn2);
+    page1 = xc_map_foreign_range(xch, domid1, XC_PAGE_SIZE, PROT_READ, mfn1);
+    page2 = xc_map_foreign_range(xch, domid2, XC_PAGE_SIZE, PROT_READ, mfn2);
     if ( !page1 || !page2 )
     {
-        ERROR("Failed to map either 0x%lx[dom %d] or 0x%lx[dom %d]\n",
+        fprintf(stderr, "Failed to map either 0x%lx[dom %d] or 0x%lx[dom %d]\n",
               mfn1, domid1, mfn2, domid2);
         rc = -1;
         goto out;
@@ -365,13 +371,13 @@ int memcmp_mfns_func(int argc, char *argv[])
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
2.20.1


