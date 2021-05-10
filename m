Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5F7377E4B
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124912.235195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1OA-0003x0-JD; Mon, 10 May 2021 08:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124912.235195; Mon, 10 May 2021 08:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1OA-0003u9-Ew; Mon, 10 May 2021 08:35:42 +0000
Received: by outflank-mailman (input) for mailman id 124912;
 Mon, 10 May 2021 08:35:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTYQ=KF=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lg1O8-0002eE-Mx
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:35:40 +0000
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76893116-5f30-4af4-b45e-129555ef27c2;
 Mon, 10 May 2021 08:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 0A56EB560122;
 Mon, 10 May 2021 11:35:30 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id i0deq6r05gz0; Mon, 10 May 2021 11:35:26 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 032A8B56012B;
 Mon, 10 May 2021 11:35:26 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VLVtO8iOZMin; Mon, 10 May 2021 11:35:25 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 9A686B56012A;
 Mon, 10 May 2021 11:35:25 +0300 (EEST)
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
X-Inumbo-ID: 76893116-5f30-4af4-b45e-129555ef27c2
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 4/5] tools/libs/gnttab: Fix PAGE_SIZE redefinition error
Date: Mon, 10 May 2021 11:35:18 +0300
Message-Id: <b1e87eb24dfde3b1f11c5a14a4298531b4a308ad.1620633386.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620633386.git.costin.lupu@cs.pub.ro>
References: <cover.1620633386.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limit=
s.h
header) then gcc will trigger a redefinition error because of -Werror. Th=
is
patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to a=
void
confusion between control domain page granularity (PAGE_* definitions) an=
d
guest domain page granularity (which is what we are dealing with here).

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/libs/gnttab/freebsd.c | 28 +++++++++++++---------------
 tools/libs/gnttab/linux.c   | 28 +++++++++++++---------------
 tools/libs/gnttab/netbsd.c  | 23 ++++++++++-------------
 3 files changed, 36 insertions(+), 43 deletions(-)

diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
index 768af701c6..e42ac3fbf3 100644
--- a/tools/libs/gnttab/freebsd.c
+++ b/tools/libs/gnttab/freebsd.c
@@ -30,14 +30,11 @@
=20
 #include <xen/sys/gntdev.h>
=20
+#include <xenctrl.h>
 #include <xen-tools/libs.h>
=20
 #include "private.h"
=20
-#define PAGE_SHIFT           12
-#define PAGE_SIZE            (1UL << PAGE_SHIFT)
-#define PAGE_MASK            (~(PAGE_SIZE-1))
-
 #define DEVXEN "/dev/xen/gntdev"
=20
 int osdep_gnttab_open(xengnttab_handle *xgt)
@@ -77,10 +74,11 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     int domids_stride;
     unsigned int refs_size =3D ROUNDUP(count *
                                      sizeof(struct ioctl_gntdev_grant_re=
f),
-                                     PAGE_SHIFT);
+                                     XC_PAGE_SHIFT);
+    int os_page_size =3D getpagesize();
=20
     domids_stride =3D (flags & XENGNTTAB_GRANT_MAP_SINGLE_DOMAIN) ? 0 : =
1;
-    if ( refs_size <=3D PAGE_SIZE )
+    if ( refs_size <=3D os_page_size )
         map.refs =3D malloc(refs_size);
     else
     {
@@ -107,7 +105,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         goto out;
     }
=20
-    addr =3D mmap(NULL, PAGE_SIZE * count, prot, MAP_SHARED, fd,
+    addr =3D mmap(NULL, XC_PAGE_SIZE * count, prot, MAP_SHARED, fd,
                 map.index);
     if ( addr !=3D MAP_FAILED )
     {
@@ -116,7 +114,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
=20
         notify.index =3D map.index;
         notify.action =3D 0;
-        if ( notify_offset < PAGE_SIZE * count )
+        if ( notify_offset < XC_PAGE_SIZE * count )
         {
             notify.index +=3D notify_offset;
             notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
@@ -131,7 +129,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         if ( rv )
         {
             GTERROR(xgt->logger, "ioctl SET_UNMAP_NOTIFY failed");
-            munmap(addr, count * PAGE_SIZE);
+            munmap(addr, count * XC_PAGE_SIZE);
             addr =3D MAP_FAILED;
         }
     }
@@ -150,7 +148,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     }
=20
  out:
-    if ( refs_size > PAGE_SIZE )
+    if ( refs_size > os_page_size )
         munmap(map.refs, refs_size);
     else
         free(map.refs);
@@ -189,7 +187,7 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
     }
=20
     /* Next, unmap the memory. */
-    if ( (rc =3D munmap(start_address, count * PAGE_SIZE)) )
+    if ( (rc =3D munmap(start_address, count * XC_PAGE_SIZE)) )
         return rc;
=20
     /* Finally, unmap the driver slots used to store the grant informati=
on. */
@@ -256,7 +254,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
         goto out;
     }
=20
-    area =3D mmap(NULL, count * PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_S=
HARED,
+    area =3D mmap(NULL, count * XC_PAGE_SIZE, PROT_READ | PROT_WRITE, MA=
P_SHARED,
                 fd, gref_info.index);
=20
     if ( area =3D=3D MAP_FAILED )
@@ -268,7 +266,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
=20
     notify.index =3D gref_info.index;
     notify.action =3D 0;
-    if ( notify_offset < PAGE_SIZE * count )
+    if ( notify_offset < XC_PAGE_SIZE * count )
     {
         notify.index +=3D notify_offset;
         notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
@@ -283,7 +281,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
     if ( err )
     {
         GSERROR(xgs->logger, "ioctl SET_UNMAP_NOTIFY failed");
-        munmap(area, count * PAGE_SIZE);
+        munmap(area, count * XC_PAGE_SIZE);
         area =3D NULL;
     }
=20
@@ -306,7 +304,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
 int osdep_gntshr_unshare(xengntshr_handle *xgs,
                          void *start_address, uint32_t count)
 {
-    return munmap(start_address, count * PAGE_SIZE);
+    return munmap(start_address, count * XC_PAGE_SIZE);
 }
=20
 /*
diff --git a/tools/libs/gnttab/linux.c b/tools/libs/gnttab/linux.c
index 74331a4c7b..9ce27bee6e 100644
--- a/tools/libs/gnttab/linux.c
+++ b/tools/libs/gnttab/linux.c
@@ -32,14 +32,11 @@
 #include <xen/sys/gntdev.h>
 #include <xen/sys/gntalloc.h>
=20
+#include <xenctrl.h>
 #include <xen-tools/libs.h>
=20
 #include "private.h"
=20
-#define PAGE_SHIFT           12
-#define PAGE_SIZE            (1UL << PAGE_SHIFT)
-#define PAGE_MASK            (~(PAGE_SIZE-1))
-
 #define DEVXEN "/dev/xen/"
=20
 #ifndef O_CLOEXEC
@@ -92,6 +89,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     int fd =3D xgt->fd;
     struct ioctl_gntdev_map_grant_ref *map;
     unsigned int map_size =3D sizeof(*map) + (count - 1) * sizeof(map->r=
efs[0]);
+    int os_page_size =3D getpagesize();
     void *addr =3D NULL;
     int domids_stride =3D 1;
     int i;
@@ -99,11 +97,11 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     if (flags & XENGNTTAB_GRANT_MAP_SINGLE_DOMAIN)
         domids_stride =3D 0;
=20
-    if ( map_size <=3D PAGE_SIZE )
+    if ( map_size <=3D os_page_size )
         map =3D alloca(map_size);
     else
     {
-        map_size =3D ROUNDUP(map_size, PAGE_SHIFT);
+        map_size =3D ROUNDUP(map_size, XC_PAGE_SHIFT);
         map =3D mmap(NULL, map_size, PROT_READ | PROT_WRITE,
                    MAP_PRIVATE | MAP_ANON | MAP_POPULATE, -1, 0);
         if ( map =3D=3D MAP_FAILED )
@@ -127,7 +125,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     }
=20
  retry:
-    addr =3D mmap(NULL, PAGE_SIZE * count, prot, MAP_SHARED, fd,
+    addr =3D mmap(NULL, XC_PAGE_SIZE * count, prot, MAP_SHARED, fd,
                 map->index);
=20
     if (addr =3D=3D MAP_FAILED && errno =3D=3D EAGAIN)
@@ -152,7 +150,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         struct ioctl_gntdev_unmap_notify notify;
         notify.index =3D map->index;
         notify.action =3D 0;
-        if (notify_offset < PAGE_SIZE * count) {
+        if (notify_offset < XC_PAGE_SIZE * count) {
             notify.index +=3D notify_offset;
             notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
         }
@@ -164,7 +162,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
             rv =3D ioctl(fd, IOCTL_GNTDEV_SET_UNMAP_NOTIFY, &notify);
         if (rv) {
             GTERROR(xgt->logger, "ioctl SET_UNMAP_NOTIFY failed");
-            munmap(addr, count * PAGE_SIZE);
+            munmap(addr, count * XC_PAGE_SIZE);
             addr =3D MAP_FAILED;
         }
     }
@@ -184,7 +182,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     }
=20
  out:
-    if ( map_size > PAGE_SIZE )
+    if ( map_size > os_page_size )
         munmap(map, map_size);
=20
     return addr;
@@ -220,7 +218,7 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
     }
=20
     /* Next, unmap the memory. */
-    if ( (rc =3D munmap(start_address, count * PAGE_SIZE)) )
+    if ( (rc =3D munmap(start_address, count * XC_PAGE_SIZE)) )
         return rc;
=20
     /* Finally, unmap the driver slots used to store the grant informati=
on. */
@@ -466,7 +464,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
         goto out;
     }
=20
-    area =3D mmap(NULL, count * PAGE_SIZE, PROT_READ | PROT_WRITE,
+    area =3D mmap(NULL, count * XC_PAGE_SIZE, PROT_READ | PROT_WRITE,
         MAP_SHARED, fd, gref_info->index);
=20
     if (area =3D=3D MAP_FAILED) {
@@ -477,7 +475,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
=20
     notify.index =3D gref_info->index;
     notify.action =3D 0;
-    if (notify_offset < PAGE_SIZE * count) {
+    if (notify_offset < XC_PAGE_SIZE * count) {
         notify.index +=3D notify_offset;
         notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
     }
@@ -489,7 +487,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
         err =3D ioctl(fd, IOCTL_GNTALLOC_SET_UNMAP_NOTIFY, &notify);
     if (err) {
         GSERROR(xgs->logger, "ioctl SET_UNMAP_NOTIFY failed");
-        munmap(area, count * PAGE_SIZE);
+        munmap(area, count * XC_PAGE_SIZE);
         area =3D NULL;
     }
=20
@@ -510,7 +508,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
 int osdep_gntshr_unshare(xengntshr_handle *xgs,
                          void *start_address, uint32_t count)
 {
-    return munmap(start_address, count * PAGE_SIZE);
+    return munmap(start_address, count * XC_PAGE_SIZE);
 }
=20
 /*
diff --git a/tools/libs/gnttab/netbsd.c b/tools/libs/gnttab/netbsd.c
index f8d7c356eb..a4ad624b54 100644
--- a/tools/libs/gnttab/netbsd.c
+++ b/tools/libs/gnttab/netbsd.c
@@ -28,15 +28,12 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
=20
+#include <xenctrl.h>
 #include <xen/xen.h>
 #include <xen/xenio.h>
=20
 #include "private.h"
=20
-#define PAGE_SHIFT           12
-#define PAGE_SIZE            (1UL << PAGE_SHIFT)
-#define PAGE_MASK            (~(PAGE_SIZE-1))
-
 #define DEVXEN "/kern/xen/privcmd"
=20
 int osdep_gnttab_open(xengnttab_handle *xgt)
@@ -87,19 +84,19 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     }
=20
     map.count =3D count;
-    addr =3D mmap(NULL, count * PAGE_SIZE,
+    addr =3D mmap(NULL, count * XC_PAGE_SIZE,
                 prot, flags | MAP_ANON | MAP_SHARED, -1, 0);
     if ( map.va =3D=3D MAP_FAILED )
     {
         GTERROR(xgt->logger, "osdep_gnttab_grant_map: mmap failed");
-        munmap((void *)map.va, count * PAGE_SIZE);
+        munmap((void *)map.va, count * XC_PAGE_SIZE);
         addr =3D MAP_FAILED;
     }
     map.va =3D addr;
=20
     map.notify.offset =3D 0;
     map.notify.action =3D 0;
-    if ( notify_offset < PAGE_SIZE * count )
+    if ( notify_offset < XC_PAGE_SIZE * count )
     {
         map.notify.offset =3D notify_offset;
         map.notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
@@ -115,7 +112,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     {
         GTERROR(xgt->logger,
             "ioctl IOCTL_GNTDEV_MMAP_GRANT_REF failed: %d", rv);
-        munmap(addr, count * PAGE_SIZE);
+        munmap(addr, count * XC_PAGE_SIZE);
         addr =3D MAP_FAILED;
     }
=20
@@ -136,7 +133,7 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
     }
=20
     /* Next, unmap the memory. */
-    rc =3D munmap(start_address, count * PAGE_SIZE);
+    rc =3D munmap(start_address, count * XC_PAGE_SIZE);
=20
     return rc;
 }
@@ -187,7 +184,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
     alloc.domid =3D domid;
     alloc.flags =3D writable ? GNTDEV_ALLOC_FLAG_WRITABLE : 0;
     alloc.count =3D count;
-    area =3D mmap(NULL, count * PAGE_SIZE,
+    area =3D mmap(NULL, count * XC_PAGE_SIZE,
                 PROT_READ | PROT_WRITE, MAP_ANON | MAP_SHARED, -1, 0);
=20
     if ( area =3D=3D MAP_FAILED )
@@ -200,7 +197,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
=20
     alloc.notify.offset =3D 0;
     alloc.notify.action =3D 0;
-    if ( notify_offset < PAGE_SIZE * count )
+    if ( notify_offset < XC_PAGE_SIZE * count )
     {
         alloc.notify.offset =3D notify_offset;
         alloc.notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
@@ -215,7 +212,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
     if ( err )
     {
         GSERROR(xgs->logger, "IOCTL_GNTDEV_ALLOC_GRANT_REF failed");
-        munmap(area, count * PAGE_SIZE);
+        munmap(area, count * XC_PAGE_SIZE);
         area =3D MAP_FAILED;
         goto out;
     }
@@ -230,7 +227,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
 int osdep_gntshr_unshare(xengntshr_handle *xgs,
                          void *start_address, uint32_t count)
 {
-    return munmap(start_address, count * PAGE_SIZE);
+    return munmap(start_address, count * XC_PAGE_SIZE);
 }
=20
 /*
--=20
2.20.1


