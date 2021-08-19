Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347363F202A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 20:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169069.308864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn6O-0001s0-La; Thu, 19 Aug 2021 18:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169069.308864; Thu, 19 Aug 2021 18:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn6O-0001pr-GW; Thu, 19 Aug 2021 18:49:20 +0000
Received: by outflank-mailman (input) for mailman id 169069;
 Thu, 19 Aug 2021 18:49:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErsO=NK=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mGn6M-0000ee-P5
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 18:49:18 +0000
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25a7411c-011e-11ec-a652-12813bfff9fa;
 Thu, 19 Aug 2021 18:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 10381B560115;
 Thu, 19 Aug 2021 21:49:12 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Gl-SHzGYgl4m; Thu, 19 Aug 2021 21:49:06 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 4205BB560448;
 Thu, 19 Aug 2021 21:34:03 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4Xhq7L00DpiX; Thu, 19 Aug 2021 21:34:03 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 6E154B56053B;
 Thu, 19 Aug 2021 20:50:19 +0300 (EEST)
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
X-Inumbo-ID: 25a7411c-011e-11ec-a652-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 4/4] libs/gnttab: Use XEN_PAGE_* definitions
Date: Thu, 19 Aug 2021 20:50:12 +0300
Message-Id: <1b78b6e4a196a7f57d014ee699f4e8080b60610a.1629395092.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629395092.git.costin.lupu@cs.pub.ro>
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These changes refine the changes in d1b32abd which added a dependency to
xenctrl library. We use the XEN_PAGE_* definitions instead of the XC_PAGE=
_*
definitions and therefore we get rid of the unnecessary dependency.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/libs/gnttab/freebsd.c | 20 ++++++++++----------
 tools/libs/gnttab/linux.c   | 20 ++++++++++----------
 tools/libs/gnttab/netbsd.c  | 20 ++++++++++----------
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
index e42ac3fbf3..7ecb0e3b38 100644
--- a/tools/libs/gnttab/freebsd.c
+++ b/tools/libs/gnttab/freebsd.c
@@ -28,9 +28,9 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
=20
+#include <xen/page.h>
 #include <xen/sys/gntdev.h>
=20
-#include <xenctrl.h>
 #include <xen-tools/libs.h>
=20
 #include "private.h"
@@ -74,7 +74,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     int domids_stride;
     unsigned int refs_size =3D ROUNDUP(count *
                                      sizeof(struct ioctl_gntdev_grant_re=
f),
-                                     XC_PAGE_SHIFT);
+                                     XEN_PAGE_SHIFT);
     int os_page_size =3D getpagesize();
=20
     domids_stride =3D (flags & XENGNTTAB_GRANT_MAP_SINGLE_DOMAIN) ? 0 : =
1;
@@ -105,7 +105,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         goto out;
     }
=20
-    addr =3D mmap(NULL, XC_PAGE_SIZE * count, prot, MAP_SHARED, fd,
+    addr =3D mmap(NULL, XEN_PAGE_SIZE * count, prot, MAP_SHARED, fd,
                 map.index);
     if ( addr !=3D MAP_FAILED )
     {
@@ -114,7 +114,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
=20
         notify.index =3D map.index;
         notify.action =3D 0;
-        if ( notify_offset < XC_PAGE_SIZE * count )
+        if ( notify_offset < XEN_PAGE_SIZE * count )
         {
             notify.index +=3D notify_offset;
             notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
@@ -129,7 +129,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         if ( rv )
         {
             GTERROR(xgt->logger, "ioctl SET_UNMAP_NOTIFY failed");
-            munmap(addr, count * XC_PAGE_SIZE);
+            munmap(addr, count * XEN_PAGE_SIZE);
             addr =3D MAP_FAILED;
         }
     }
@@ -187,7 +187,7 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
     }
=20
     /* Next, unmap the memory. */
-    if ( (rc =3D munmap(start_address, count * XC_PAGE_SIZE)) )
+    if ( (rc =3D munmap(start_address, count * XEN_PAGE_SIZE)) )
         return rc;
=20
     /* Finally, unmap the driver slots used to store the grant informati=
on. */
@@ -254,7 +254,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
         goto out;
     }
=20
-    area =3D mmap(NULL, count * XC_PAGE_SIZE, PROT_READ | PROT_WRITE, MA=
P_SHARED,
+    area =3D mmap(NULL, count * XEN_PAGE_SIZE, PROT_READ | PROT_WRITE, M=
AP_SHARED,
                 fd, gref_info.index);
=20
     if ( area =3D=3D MAP_FAILED )
@@ -266,7 +266,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
=20
     notify.index =3D gref_info.index;
     notify.action =3D 0;
-    if ( notify_offset < XC_PAGE_SIZE * count )
+    if ( notify_offset < XEN_PAGE_SIZE * count )
     {
         notify.index +=3D notify_offset;
         notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
@@ -281,7 +281,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
     if ( err )
     {
         GSERROR(xgs->logger, "ioctl SET_UNMAP_NOTIFY failed");
-        munmap(area, count * XC_PAGE_SIZE);
+        munmap(area, count * XEN_PAGE_SIZE);
         area =3D NULL;
     }
=20
@@ -304,7 +304,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
 int osdep_gntshr_unshare(xengntshr_handle *xgs,
                          void *start_address, uint32_t count)
 {
-    return munmap(start_address, count * XC_PAGE_SIZE);
+    return munmap(start_address, count * XEN_PAGE_SIZE);
 }
=20
 /*
diff --git a/tools/libs/gnttab/linux.c b/tools/libs/gnttab/linux.c
index 5628fd5719..11f1acb771 100644
--- a/tools/libs/gnttab/linux.c
+++ b/tools/libs/gnttab/linux.c
@@ -29,10 +29,10 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
=20
+#include <xen/page.h>
 #include <xen/sys/gntdev.h>
 #include <xen/sys/gntalloc.h>
=20
-#include <xenctrl.h>
 #include <xen-tools/libs.h>
=20
 #include "private.h"
@@ -101,7 +101,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         map =3D alloca(map_size);
     else
     {
-        map_size =3D ROUNDUP(map_size, XC_PAGE_SHIFT);
+        map_size =3D ROUNDUP(map_size, XEN_PAGE_SHIFT);
         map =3D mmap(NULL, map_size, PROT_READ | PROT_WRITE,
                    MAP_PRIVATE | MAP_ANON | MAP_POPULATE, -1, 0);
         if ( map =3D=3D MAP_FAILED )
@@ -125,7 +125,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     }
=20
  retry:
-    addr =3D mmap(NULL, XC_PAGE_SIZE * count, prot, MAP_SHARED, fd,
+    addr =3D mmap(NULL, XEN_PAGE_SIZE * count, prot, MAP_SHARED, fd,
                 map->index);
=20
     if (addr =3D=3D MAP_FAILED && errno =3D=3D EAGAIN)
@@ -150,7 +150,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         struct ioctl_gntdev_unmap_notify notify;
         notify.index =3D map->index;
         notify.action =3D 0;
-        if (notify_offset < XC_PAGE_SIZE * count) {
+        if (notify_offset < XEN_PAGE_SIZE * count) {
             notify.index +=3D notify_offset;
             notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
         }
@@ -162,7 +162,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
             rv =3D ioctl(fd, IOCTL_GNTDEV_SET_UNMAP_NOTIFY, &notify);
         if (rv) {
             GTERROR(xgt->logger, "ioctl SET_UNMAP_NOTIFY failed");
-            munmap(addr, count * XC_PAGE_SIZE);
+            munmap(addr, count * XEN_PAGE_SIZE);
             addr =3D MAP_FAILED;
         }
     }
@@ -218,7 +218,7 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
     }
=20
     /* Next, unmap the memory. */
-    if ( (rc =3D munmap(start_address, count * XC_PAGE_SIZE)) )
+    if ( (rc =3D munmap(start_address, count * XEN_PAGE_SIZE)) )
         return rc;
=20
     /* Finally, unmap the driver slots used to store the grant informati=
on. */
@@ -464,7 +464,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
         goto out;
     }
=20
-    area =3D mmap(NULL, count * XC_PAGE_SIZE, PROT_READ | PROT_WRITE,
+    area =3D mmap(NULL, count * XEN_PAGE_SIZE, PROT_READ | PROT_WRITE,
         MAP_SHARED, fd, gref_info->index);
=20
     if (area =3D=3D MAP_FAILED) {
@@ -475,7 +475,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
=20
     notify.index =3D gref_info->index;
     notify.action =3D 0;
-    if (notify_offset < XC_PAGE_SIZE * count) {
+    if (notify_offset < XEN_PAGE_SIZE * count) {
         notify.index +=3D notify_offset;
         notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
     }
@@ -487,7 +487,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
         err =3D ioctl(fd, IOCTL_GNTALLOC_SET_UNMAP_NOTIFY, &notify);
     if (err) {
         GSERROR(xgs->logger, "ioctl SET_UNMAP_NOTIFY failed");
-        munmap(area, count * XC_PAGE_SIZE);
+        munmap(area, count * XEN_PAGE_SIZE);
         area =3D NULL;
     }
=20
@@ -508,7 +508,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
 int osdep_gntshr_unshare(xengntshr_handle *xgs,
                          void *start_address, uint32_t count)
 {
-    return munmap(start_address, count * XC_PAGE_SIZE);
+    return munmap(start_address, count * XEN_PAGE_SIZE);
 }
=20
 /*
diff --git a/tools/libs/gnttab/netbsd.c b/tools/libs/gnttab/netbsd.c
index a4ad624b54..beb94be468 100644
--- a/tools/libs/gnttab/netbsd.c
+++ b/tools/libs/gnttab/netbsd.c
@@ -28,8 +28,8 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
=20
-#include <xenctrl.h>
 #include <xen/xen.h>
+#include <xen/page.h>
 #include <xen/xenio.h>
=20
 #include "private.h"
@@ -84,19 +84,19 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     }
=20
     map.count =3D count;
-    addr =3D mmap(NULL, count * XC_PAGE_SIZE,
+    addr =3D mmap(NULL, count * XEN_PAGE_SIZE,
                 prot, flags | MAP_ANON | MAP_SHARED, -1, 0);
     if ( map.va =3D=3D MAP_FAILED )
     {
         GTERROR(xgt->logger, "osdep_gnttab_grant_map: mmap failed");
-        munmap((void *)map.va, count * XC_PAGE_SIZE);
+        munmap((void *)map.va, count * XEN_PAGE_SIZE);
         addr =3D MAP_FAILED;
     }
     map.va =3D addr;
=20
     map.notify.offset =3D 0;
     map.notify.action =3D 0;
-    if ( notify_offset < XC_PAGE_SIZE * count )
+    if ( notify_offset < XEN_PAGE_SIZE * count )
     {
         map.notify.offset =3D notify_offset;
         map.notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
@@ -112,7 +112,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     {
         GTERROR(xgt->logger,
             "ioctl IOCTL_GNTDEV_MMAP_GRANT_REF failed: %d", rv);
-        munmap(addr, count * XC_PAGE_SIZE);
+        munmap(addr, count * XEN_PAGE_SIZE);
         addr =3D MAP_FAILED;
     }
=20
@@ -133,7 +133,7 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
     }
=20
     /* Next, unmap the memory. */
-    rc =3D munmap(start_address, count * XC_PAGE_SIZE);
+    rc =3D munmap(start_address, count * XEN_PAGE_SIZE);
=20
     return rc;
 }
@@ -184,7 +184,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
     alloc.domid =3D domid;
     alloc.flags =3D writable ? GNTDEV_ALLOC_FLAG_WRITABLE : 0;
     alloc.count =3D count;
-    area =3D mmap(NULL, count * XC_PAGE_SIZE,
+    area =3D mmap(NULL, count * XEN_PAGE_SIZE,
                 PROT_READ | PROT_WRITE, MAP_ANON | MAP_SHARED, -1, 0);
=20
     if ( area =3D=3D MAP_FAILED )
@@ -197,7 +197,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
=20
     alloc.notify.offset =3D 0;
     alloc.notify.action =3D 0;
-    if ( notify_offset < XC_PAGE_SIZE * count )
+    if ( notify_offset < XEN_PAGE_SIZE * count )
     {
         alloc.notify.offset =3D notify_offset;
         alloc.notify.action |=3D UNMAP_NOTIFY_CLEAR_BYTE;
@@ -212,7 +212,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
     if ( err )
     {
         GSERROR(xgs->logger, "IOCTL_GNTDEV_ALLOC_GRANT_REF failed");
-        munmap(area, count * XC_PAGE_SIZE);
+        munmap(area, count * XEN_PAGE_SIZE);
         area =3D MAP_FAILED;
         goto out;
     }
@@ -227,7 +227,7 @@ void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
 int osdep_gntshr_unshare(xengntshr_handle *xgs,
                          void *start_address, uint32_t count)
 {
-    return munmap(start_address, count * XC_PAGE_SIZE);
+    return munmap(start_address, count * XEN_PAGE_SIZE);
 }
=20
 /*
--=20
2.20.1


