Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53788377E4E
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124909.235153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1O0-0002nR-If; Mon, 10 May 2021 08:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124909.235153; Mon, 10 May 2021 08:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1O0-0002h4-CT; Mon, 10 May 2021 08:35:32 +0000
Received: by outflank-mailman (input) for mailman id 124909;
 Mon, 10 May 2021 08:35:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTYQ=KF=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lg1Ny-0002eE-Nx
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:35:30 +0000
Received: from mx.upb.ro (unknown [141.85.13.200])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 241b6232-d9e7-4af3-824a-d845635745e5;
 Mon, 10 May 2021 08:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id A5B8FB560125;
 Mon, 10 May 2021 11:35:28 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id il_eQ4xYdlLU; Mon, 10 May 2021 11:35:25 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 9983AB560122;
 Mon, 10 May 2021 11:35:25 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CD1RpKBsSRw4; Mon, 10 May 2021 11:35:25 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 3BC0AB560126;
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
X-Inumbo-ID: 241b6232-d9e7-4af3-824a-d845635745e5
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/5] tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error
Date: Mon, 10 May 2021 11:35:17 +0300
Message-Id: <2040286fc39b7e1d46376a8e75ac59d8d3be5aff.1620633386.git.costin.lupu@cs.pub.ro>
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
 tools/libs/foreignmemory/core.c    |  2 +-
 tools/libs/foreignmemory/freebsd.c | 10 +++++-----
 tools/libs/foreignmemory/linux.c   | 23 ++++++++++++-----------
 tools/libs/foreignmemory/minios.c  |  2 +-
 tools/libs/foreignmemory/netbsd.c  | 10 +++++-----
 tools/libs/foreignmemory/private.h |  9 +--------
 6 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/tools/libs/foreignmemory/core.c b/tools/libs/foreignmemory/c=
ore.c
index 28ec311af1..7edc6f0dbf 100644
--- a/tools/libs/foreignmemory/core.c
+++ b/tools/libs/foreignmemory/core.c
@@ -202,7 +202,7 @@ int xenforeignmemory_resource_size(
     if ( rc )
         return rc;
=20
-    *size =3D fres.nr_frames << PAGE_SHIFT;
+    *size =3D fres.nr_frames << XC_PAGE_SHIFT;
     return 0;
 }
=20
diff --git a/tools/libs/foreignmemory/freebsd.c b/tools/libs/foreignmemor=
y/freebsd.c
index d94ea07862..2cf0fa1c38 100644
--- a/tools/libs/foreignmemory/freebsd.c
+++ b/tools/libs/foreignmemory/freebsd.c
@@ -63,7 +63,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
     privcmd_mmapbatch_t ioctlx;
     int rc;
=20
-    addr =3D mmap(addr, num << PAGE_SHIFT, prot, flags | MAP_SHARED, fd,=
 0);
+    addr =3D mmap(addr, num << XC_PAGE_SHIFT, prot, flags | MAP_SHARED, =
fd, 0);
     if ( addr =3D=3D MAP_FAILED )
         return NULL;
=20
@@ -78,7 +78,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
     {
         int saved_errno =3D errno;
=20
-        (void)munmap(addr, num << PAGE_SHIFT);
+        (void)munmap(addr, num << XC_PAGE_SHIFT);
         errno =3D saved_errno;
         return NULL;
     }
@@ -89,7 +89,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num << PAGE_SHIFT);
+    return munmap(addr, num << XC_PAGE_SHIFT);
 }
=20
 int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
@@ -101,7 +101,7 @@ int osdep_xenforeignmemory_restrict(xenforeignmemory_=
handle *fmem,
 int osdep_xenforeignmemory_unmap_resource(xenforeignmemory_handle *fmem,
                                         xenforeignmemory_resource_handle=
 *fres)
 {
-    return fres ? munmap(fres->addr, fres->nr_frames << PAGE_SHIFT) : 0;
+    return fres ? munmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT) :=
 0;
 }
=20
 int osdep_xenforeignmemory_map_resource(xenforeignmemory_handle *fmem,
@@ -120,7 +120,7 @@ int osdep_xenforeignmemory_map_resource(xenforeignmem=
ory_handle *fmem,
         /* Request for resource size.  Skip mmap(). */
         goto skip_mmap;
=20
-    fres->addr =3D mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
+    fres->addr =3D mmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT,
                       fres->prot, fres->flags | MAP_SHARED, fmem->fd, 0)=
;
     if ( fres->addr =3D=3D MAP_FAILED )
         return -1;
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/=
linux.c
index c1f35e2db7..a5f6d62567 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -134,7 +134,7 @@ static int retry_paged(int fd, uint32_t dom, void *ad=
dr,
         /* At least one gfn is still in paging state */
         ioctlx.num =3D 1;
         ioctlx.dom =3D dom;
-        ioctlx.addr =3D (unsigned long)addr + (i<<PAGE_SHIFT);
+        ioctlx.addr =3D (unsigned long)addr + (i<<XC_PAGE_SHIFT);
         ioctlx.arr =3D arr + i;
         ioctlx.err =3D err + i;
=20
@@ -168,7 +168,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
     size_t i;
     int rc;
=20
-    addr =3D mmap(addr, num << PAGE_SHIFT, prot, flags | MAP_SHARED,
+    addr =3D mmap(addr, num << XC_PAGE_SHIFT, prot, flags | MAP_SHARED,
                 fd, 0);
     if ( addr =3D=3D MAP_FAILED )
         return NULL;
@@ -198,9 +198,10 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_ha=
ndle *fmem,
          */
         privcmd_mmapbatch_t ioctlx;
         xen_pfn_t *pfn;
-        unsigned int pfn_arr_size =3D ROUNDUP((num * sizeof(*pfn)), PAGE=
_SHIFT);
+        unsigned int pfn_arr_size =3D ROUNDUP((num * sizeof(*pfn)), XC_P=
AGE_SHIFT);
+        int os_page_size =3D getpagesize();
=20
-        if ( pfn_arr_size <=3D PAGE_SIZE )
+        if ( pfn_arr_size <=3D os_page_size )
             pfn =3D alloca(num * sizeof(*pfn));
         else
         {
@@ -209,7 +210,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
             if ( pfn =3D=3D MAP_FAILED )
             {
                 PERROR("mmap of pfn array failed");
-                (void)munmap(addr, num << PAGE_SHIFT);
+                (void)munmap(addr, num << XC_PAGE_SHIFT);
                 return NULL;
             }
         }
@@ -242,7 +243,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
                     continue;
                 }
                 rc =3D map_foreign_batch_single(fd, dom, pfn + i,
-                        (unsigned long)addr + (i<<PAGE_SHIFT));
+                        (unsigned long)addr + (i<<XC_PAGE_SHIFT));
                 if ( rc < 0 )
                 {
                     rc =3D -errno;
@@ -254,7 +255,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
             break;
         }
=20
-        if ( pfn_arr_size > PAGE_SIZE )
+        if ( pfn_arr_size > os_page_size )
             munmap(pfn, pfn_arr_size);
=20
         if ( rc =3D=3D -ENOENT && i =3D=3D num )
@@ -270,7 +271,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
     {
         int saved_errno =3D errno;
=20
-        (void)munmap(addr, num << PAGE_SHIFT);
+        (void)munmap(addr, num << XC_PAGE_SHIFT);
         errno =3D saved_errno;
         return NULL;
     }
@@ -281,7 +282,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num << PAGE_SHIFT);
+    return munmap(addr, num << XC_PAGE_SHIFT);
 }
=20
 int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
@@ -293,7 +294,7 @@ int osdep_xenforeignmemory_restrict(xenforeignmemory_=
handle *fmem,
 int osdep_xenforeignmemory_unmap_resource(
     xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fre=
s)
 {
-    return fres ? munmap(fres->addr, fres->nr_frames << PAGE_SHIFT) : 0;
+    return fres ? munmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT) :=
 0;
 }
=20
 int osdep_xenforeignmemory_map_resource(
@@ -312,7 +313,7 @@ int osdep_xenforeignmemory_map_resource(
         /* Request for resource size.  Skip mmap(). */
         goto skip_mmap;
=20
-    fres->addr =3D mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
+    fres->addr =3D mmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT,
                       fres->prot, fres->flags | MAP_SHARED, fmem->fd, 0)=
;
     if ( fres->addr =3D=3D MAP_FAILED )
         return -1;
diff --git a/tools/libs/foreignmemory/minios.c b/tools/libs/foreignmemory=
/minios.c
index 43341ca301..c5453736d5 100644
--- a/tools/libs/foreignmemory/minios.c
+++ b/tools/libs/foreignmemory/minios.c
@@ -55,7 +55,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num << PAGE_SHIFT);
+    return munmap(addr, num << XC_PAGE_SHIFT);
 }
=20
 /*
diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory=
/netbsd.c
index c0b1b8f79d..597db775d7 100644
--- a/tools/libs/foreignmemory/netbsd.c
+++ b/tools/libs/foreignmemory/netbsd.c
@@ -76,7 +76,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
 {
     int fd =3D fmem->fd;
     privcmd_mmapbatch_v2_t ioctlx;
-    addr =3D mmap(addr, num * PAGE_SIZE, prot,
+    addr =3D mmap(addr, num * XC_PAGE_SIZE, prot,
                 flags | MAP_ANON | MAP_SHARED, -1, 0);
     if ( addr =3D=3D MAP_FAILED ) {
         PERROR("osdep_xenforeignmemory_map: mmap failed");
@@ -93,7 +93,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
     {
         int saved_errno =3D errno;
         PERROR("osdep_xenforeignmemory_map: ioctl failed");
-        munmap(addr, num * PAGE_SIZE);
+        munmap(addr, num * XC_PAGE_SIZE);
         errno =3D saved_errno;
         return NULL;
     }
@@ -104,7 +104,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num * PAGE_SIZE);
+    return munmap(addr, num * XC_PAGE_SIZE);
 }
=20
 int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
@@ -117,7 +117,7 @@ int osdep_xenforeignmemory_restrict(xenforeignmemory_=
handle *fmem,
 int osdep_xenforeignmemory_unmap_resource(
     xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fre=
s)
 {
-    return fres ? munmap(fres->addr, fres->nr_frames << PAGE_SHIFT) : 0;
+    return fres ? munmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT) :=
 0;
 }
=20
 int osdep_xenforeignmemory_map_resource(
@@ -136,7 +136,7 @@ int osdep_xenforeignmemory_map_resource(
         /* Request for resource size.  Skip mmap(). */
         goto skip_mmap;
=20
-    fres->addr =3D mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
+    fres->addr =3D mmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT,
                       fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -=
1, 0);
     if ( fres->addr =3D=3D MAP_FAILED )
         return -1;
diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemor=
y/private.h
index 1ee3626dd2..65fe77aa5b 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -1,6 +1,7 @@
 #ifndef XENFOREIGNMEMORY_PRIVATE_H
 #define XENFOREIGNMEMORY_PRIVATE_H
=20
+#include <xenctrl.h>
 #include <xentoollog.h>
=20
 #include <xenforeignmemory.h>
@@ -10,14 +11,6 @@
 #include <xen/xen.h>
 #include <xen/sys/privcmd.h>
=20
-#ifndef PAGE_SHIFT /* Mini-os, Yukk */
-#define PAGE_SHIFT           12
-#endif
-#ifndef __MINIOS__ /* Yukk */
-#define PAGE_SIZE            (1UL << PAGE_SHIFT)
-#define PAGE_MASK            (~(PAGE_SIZE-1))
-#endif
-
 struct xenforeignmemory_handle {
     xentoollog_logger *logger, *logger_tofree;
     unsigned flags;
--=20
2.20.1


