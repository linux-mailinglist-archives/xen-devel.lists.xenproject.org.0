Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A8C377E4C
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124910.235171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1O4-0003HH-QQ; Mon, 10 May 2021 08:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124910.235171; Mon, 10 May 2021 08:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1O4-0003Ee-LP; Mon, 10 May 2021 08:35:36 +0000
Received: by outflank-mailman (input) for mailman id 124910;
 Mon, 10 May 2021 08:35:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTYQ=KF=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lg1O3-0002e9-FW
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:35:35 +0000
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4c4f404-e686-4e6f-b88d-a6fdc9cc32f0;
 Mon, 10 May 2021 08:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 7186EB56007B;
 Mon, 10 May 2021 11:35:27 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id s8ApT06jIE62; Mon, 10 May 2021 11:35:24 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id C15BEB560125;
 Mon, 10 May 2021 11:35:24 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wUFcqcURlskq; Mon, 10 May 2021 11:35:24 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 5A31DB56007B;
 Mon, 10 May 2021 11:35:24 +0300 (EEST)
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
X-Inumbo-ID: a4c4f404-e686-4e6f-b88d-a6fdc9cc32f0
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/5] tools/debugger: Fix PAGE_SIZE redefinition error
Date: Mon, 10 May 2021 11:35:15 +0300
Message-Id: <88d4d2deeca3259450dc9af2b97f2fc1453a5d7d.1620633386.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620633386.git.costin.lupu@cs.pub.ro>
References: <cover.1620633386.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limit=
s.h
header) then gcc will trigger a redefinition error because of -Werror. Th=
is
patch replaces usage of PAGE_* macros with KDD_PAGE_* macros in order to =
avoid
confusion between control domain page granularity (PAGE_* definitions) an=
d
guest domain page granularity (which is what we are dealing with here).

We chose to define the KDD_PAGE_* macros instead of using XC_PAGE_* macro=
s
because (1) the code in kdd.c should not include any Xen headers and (2) =
to add
consistency for code in both kdd.c and kdd-xen.c.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/debugger/kdd/kdd-xen.c | 15 ++++++---------
 tools/debugger/kdd/kdd.c     | 19 ++++++++-----------
 tools/debugger/kdd/kdd.h     |  7 +++++++
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/tools/debugger/kdd/kdd-xen.c b/tools/debugger/kdd/kdd-xen.c
index f3f9529f9f..e78c9311c4 100644
--- a/tools/debugger/kdd/kdd-xen.c
+++ b/tools/debugger/kdd/kdd-xen.c
@@ -48,9 +48,6 @@
=20
 #define MAPSIZE 4093 /* Prime */
=20
-#define PAGE_SHIFT 12
-#define PAGE_SIZE (1U << PAGE_SHIFT)
-
 struct kdd_guest {
     struct xentoollog_logger xc_log; /* Must be first for xc log callbac=
ks */
     xc_interface *xc_handle;
@@ -72,7 +69,7 @@ static void flush_maps(kdd_guest *g)
     int i;
     for (i =3D 0; i < MAPSIZE; i++) {
         if (g->maps[i] !=3D NULL)
-            munmap(g->maps[i], PAGE_SIZE);
+            munmap(g->maps[i], KDD_PAGE_SIZE);
         g->maps[i] =3D NULL;
     }
 }
@@ -490,13 +487,13 @@ static uint32_t kdd_access_physical_page(kdd_guest =
*g, uint64_t addr,
     uint32_t map_pfn, map_offset;
     uint8_t *map;
=20
-    map_pfn =3D (addr >> PAGE_SHIFT);
-    map_offset =3D addr & (PAGE_SIZE - 1);
+    map_pfn =3D (addr >> KDD_PAGE_SHIFT);
+    map_offset =3D addr & (KDD_PAGE_SIZE - 1);
=20
     /* Evict any mapping of the wrong frame from our slot */=20
     if (g->pfns[map_pfn % MAPSIZE] !=3D map_pfn
         && g->maps[map_pfn % MAPSIZE] !=3D NULL) {
-        munmap(g->maps[map_pfn % MAPSIZE], PAGE_SIZE);
+        munmap(g->maps[map_pfn % MAPSIZE], KDD_PAGE_SIZE);
         g->maps[map_pfn % MAPSIZE] =3D NULL;
     }
     g->pfns[map_pfn % MAPSIZE] =3D map_pfn;
@@ -507,7 +504,7 @@ static uint32_t kdd_access_physical_page(kdd_guest *g=
, uint64_t addr,
     else {
         map =3D xc_map_foreign_range(g->xc_handle,
                                    g->domid,
-                                   PAGE_SIZE,
+                                   KDD_PAGE_SIZE,
                                    PROT_READ|PROT_WRITE,
                                    map_pfn);
=20
@@ -533,7 +530,7 @@ uint32_t kdd_access_physical(kdd_guest *g, uint64_t a=
ddr,
 {
     uint32_t chunk, rv, done =3D 0;
     while (len > 0) {
-        chunk =3D PAGE_SIZE - (addr & (PAGE_SIZE - 1));
+        chunk =3D KDD_PAGE_SIZE - (addr & (KDD_PAGE_SIZE - 1));
         if (chunk > len)=20
             chunk =3D len;
         rv =3D kdd_access_physical_page(g, addr, chunk, buf, write);
diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
index 17513c2650..320c623eda 100644
--- a/tools/debugger/kdd/kdd.c
+++ b/tools/debugger/kdd/kdd.c
@@ -288,9 +288,6 @@ static void kdd_log_pkt(kdd_state *s, const char *nam=
e, kdd_pkt *p)
  *  Memory access: virtual addresses and syntactic sugar.
  */
=20
-#define PAGE_SHIFT (12)
-#define PAGE_SIZE (1ULL << PAGE_SHIFT)=20
-
 static uint32_t kdd_read_physical(kdd_state *s, uint64_t addr,=20
                                   uint32_t len, void *buf)
 {
@@ -352,7 +349,7 @@ static uint64_t v2p(kdd_state *s, int cpuid, uint64_t=
 va)
=20
     /* Walk the appropriate number of levels */
     for (i =3D levels; i > 0; i--) {
-        shift =3D PAGE_SHIFT + bits * (i-1);
+        shift =3D KDD_PAGE_SHIFT + bits * (i-1);
         mask =3D ((1ULL << bits) - 1) << shift;
         offset =3D ((va & mask) >> shift) * width;
         KDD_DEBUG(s, "level %i: mask 0x%16.16"PRIx64" pa 0x%16.16"PRIx64
@@ -364,12 +361,12 @@ static uint64_t v2p(kdd_state *s, int cpuid, uint64=
_t va)
             return -1ULL; // Not present
         pa =3D entry & 0x000ffffffffff000ULL;
         if (pse && (i =3D=3D 2) && (entry & 0x80)) { // Superpage
-            mask =3D ((1ULL << (PAGE_SHIFT + bits)) - 1);
+            mask =3D ((1ULL << (KDD_PAGE_SHIFT + bits)) - 1);
             return (pa & ~mask) + (va & mask);
         }
     }
=20
-    return pa + (va & (PAGE_SIZE - 1));
+    return pa + (va & (KDD_PAGE_SIZE - 1));
 }
=20
 static uint32_t kdd_access_virtual(kdd_state *s, int cpuid, uint64_t add=
r,
@@ -380,7 +377,7 @@ static uint32_t kdd_access_virtual(kdd_state *s, int =
cpuid, uint64_t addr,
    =20
     /* Process one page at a time */
     while (len > 0) {
-        chunk =3D PAGE_SIZE - (addr & (PAGE_SIZE - 1));
+        chunk =3D KDD_PAGE_SIZE - (addr & (KDD_PAGE_SIZE - 1));
         if (chunk > len)=20
             chunk =3D len;
         pa =3D v2p(s, cpuid, addr);
@@ -591,7 +588,7 @@ static void get_os_info_64(kdd_state *s)
     uint64_t dbgkd_addr;
     DBGKD_GET_VERSION64 dbgkd_get_version64;
     /* Maybe 1GB is too big for the limit to search? */
-    uint32_t search_limit =3D (1024 * 1024 * 1024) / PAGE_SIZE; /*1GB/Pa=
geSize*/
+    uint32_t search_limit =3D (1024 * 1024 * 1024) / KDD_PAGE_SIZE; /*1G=
B/PageSize*/
     uint64_t efer;
=20
     /* if we are not in 64-bit mode, fail */
@@ -620,7 +617,7 @@ static void get_os_info_64(kdd_state *s)
      * in 1GB range above the current page base address
      */
=20
-    base =3D idt0_addr & ~(PAGE_SIZE - 1);
+    base =3D idt0_addr & ~(KDD_PAGE_SIZE - 1);
=20
     while (search_limit) {
         uint16_t val;
@@ -633,7 +630,7 @@ static void get_os_info_64(kdd_state *s)
         if (val =3D=3D MZ_HEADER) // MZ
             break;
=20
-        base -=3D PAGE_SIZE;
+        base -=3D KDD_PAGE_SIZE;
         search_limit -=3D 1;
     }
=20
@@ -720,7 +717,7 @@ static void find_os(kdd_state *s)
         /* Try each page in the potential range of kernel load addresses=
 */
         for (limit =3D s->os.base + s->os.range;
              s->os.base <=3D limit;
-             s->os.base +=3D PAGE_SIZE)
+             s->os.base +=3D KDD_PAGE_SIZE)
             if (check_os(s))
                 return;
     }
diff --git a/tools/debugger/kdd/kdd.h b/tools/debugger/kdd/kdd.h
index b9a17440df..b476a76d93 100644
--- a/tools/debugger/kdd/kdd.h
+++ b/tools/debugger/kdd/kdd.h
@@ -39,6 +39,13 @@
=20
 #define PACKED __attribute__((packed))
=20
+/* We define our page related constants here in order to specifically
+ * avoid using the Xen page macros (this is a restriction for the code
+ * in kdd.c which should not include any Xen headers) and to add
+ * consistency for code in both kdd.c and kdd-xen.c. */
+#define KDD_PAGE_SHIFT 12
+#define KDD_PAGE_SIZE (1U << KDD_PAGE_SHIFT)
+
 /***********************************************************************=
******
  * Serial line protocol: Sender sends a 16-byte header with an optional
  * payload following it.  Receiver responds to each packet with an
--=20
2.20.1


