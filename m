Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416E3F4FAE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 19:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170539.311351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIDty-0007Ga-A5; Mon, 23 Aug 2021 17:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170539.311351; Mon, 23 Aug 2021 17:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIDty-0007Dj-62; Mon, 23 Aug 2021 17:38:26 +0000
Received: by outflank-mailman (input) for mailman id 170539;
 Mon, 23 Aug 2021 17:38:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvRo=NO=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mIDtx-0007Dd-7p
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 17:38:25 +0000
Received: from mx.upb.ro (unknown [141.85.13.201])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea2552e6-0438-11ec-a87a-12813bfff9fa;
 Mon, 23 Aug 2021 17:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 69B4CB5600B7;
 Mon, 23 Aug 2021 20:03:10 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id oGo02o3IyrQN; Mon, 23 Aug 2021 20:03:05 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id E8CB7B5600C2;
 Mon, 23 Aug 2021 20:03:04 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id p2yt0dO45zb1; Mon, 23 Aug 2021 20:03:04 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 3A15EB5600C0;
 Mon, 23 Aug 2021 20:03:04 +0300 (EEST)
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
X-Inumbo-ID: ea2552e6-0438-11ec-a87a-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 3/4] libs/foreignmemory: Use XEN_PAGE_* definitions
Date: Mon, 23 Aug 2021 20:02:55 +0300
Message-Id: <b67bbe5e4a54e28c1d63cd1144081b779b9a6a8d.1629737453.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629737453.git.costin.lupu@cs.pub.ro>
References: <cover.1629737453.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These changes refine the changes in 0dbb4be7 which added a dependency to
xenctrl library. We use the XEN_PAGE_* definitions instead of the XC_PAGE=
_*
definitions and therefore we get rid of the unnecessary dependency.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/libs/foreignmemory/Makefile  |  2 ++
 tools/libs/foreignmemory/core.c    |  2 +-
 tools/libs/foreignmemory/freebsd.c | 10 +++++-----
 tools/libs/foreignmemory/linux.c   | 18 +++++++++---------
 tools/libs/foreignmemory/minios.c  | 10 +---------
 tools/libs/foreignmemory/netbsd.c  | 10 +++++-----
 tools/libs/foreignmemory/private.h |  1 -
 tools/libs/foreignmemory/solaris.c |  6 +++---
 8 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory=
/Makefile
index 0eb9a3a712..e3f417f5ca 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -11,4 +11,6 @@ SRCS-$(CONFIG_SunOS)   +=3D compat.c solaris.c
 SRCS-$(CONFIG_NetBSD)  +=3D netbsd.c
 SRCS-$(CONFIG_MiniOS)  +=3D minios.c
=20
+CFLAGS   +=3D -D__XEN_TOOLS__
+
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/foreignmemory/core.c b/tools/libs/foreignmemory/c=
ore.c
index 7edc6f0dbf..ad1ad9fc67 100644
--- a/tools/libs/foreignmemory/core.c
+++ b/tools/libs/foreignmemory/core.c
@@ -202,7 +202,7 @@ int xenforeignmemory_resource_size(
     if ( rc )
         return rc;
=20
-    *size =3D fres.nr_frames << XC_PAGE_SHIFT;
+    *size =3D fres.nr_frames << XEN_PAGE_SHIFT;
     return 0;
 }
=20
diff --git a/tools/libs/foreignmemory/freebsd.c b/tools/libs/foreignmemor=
y/freebsd.c
index 2cf0fa1c38..9439c4ca6a 100644
--- a/tools/libs/foreignmemory/freebsd.c
+++ b/tools/libs/foreignmemory/freebsd.c
@@ -63,7 +63,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
     privcmd_mmapbatch_t ioctlx;
     int rc;
=20
-    addr =3D mmap(addr, num << XC_PAGE_SHIFT, prot, flags | MAP_SHARED, =
fd, 0);
+    addr =3D mmap(addr, num << XEN_PAGE_SHIFT, prot, flags | MAP_SHARED,=
 fd, 0);
     if ( addr =3D=3D MAP_FAILED )
         return NULL;
=20
@@ -78,7 +78,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
     {
         int saved_errno =3D errno;
=20
-        (void)munmap(addr, num << XC_PAGE_SHIFT);
+        (void)munmap(addr, num << XEN_PAGE_SHIFT);
         errno =3D saved_errno;
         return NULL;
     }
@@ -89,7 +89,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num << XC_PAGE_SHIFT);
+    return munmap(addr, num << XEN_PAGE_SHIFT);
 }
=20
 int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
@@ -101,7 +101,7 @@ int osdep_xenforeignmemory_restrict(xenforeignmemory_=
handle *fmem,
 int osdep_xenforeignmemory_unmap_resource(xenforeignmemory_handle *fmem,
                                         xenforeignmemory_resource_handle=
 *fres)
 {
-    return fres ? munmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT) :=
 0;
+    return fres ? munmap(fres->addr, fres->nr_frames << XEN_PAGE_SHIFT) =
: 0;
 }
=20
 int osdep_xenforeignmemory_map_resource(xenforeignmemory_handle *fmem,
@@ -120,7 +120,7 @@ int osdep_xenforeignmemory_map_resource(xenforeignmem=
ory_handle *fmem,
         /* Request for resource size.  Skip mmap(). */
         goto skip_mmap;
=20
-    fres->addr =3D mmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT,
+    fres->addr =3D mmap(fres->addr, fres->nr_frames << XEN_PAGE_SHIFT,
                       fres->prot, fres->flags | MAP_SHARED, fmem->fd, 0)=
;
     if ( fres->addr =3D=3D MAP_FAILED )
         return -1;
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/=
linux.c
index 9062117407..9dabf28cae 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -134,7 +134,7 @@ static int retry_paged(int fd, uint32_t dom, void *ad=
dr,
         /* At least one gfn is still in paging state */
         ioctlx.num =3D 1;
         ioctlx.dom =3D dom;
-        ioctlx.addr =3D (unsigned long)addr + (i<<XC_PAGE_SHIFT);
+        ioctlx.addr =3D (unsigned long)addr + (i<<XEN_PAGE_SHIFT);
         ioctlx.arr =3D arr + i;
         ioctlx.err =3D err + i;
=20
@@ -168,7 +168,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
     size_t i;
     int rc;
=20
-    addr =3D mmap(addr, num << XC_PAGE_SHIFT, prot, flags | MAP_SHARED,
+    addr =3D mmap(addr, num << XEN_PAGE_SHIFT, prot, flags | MAP_SHARED,
                 fd, 0);
     if ( addr =3D=3D MAP_FAILED )
         return NULL;
@@ -198,7 +198,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
          */
         privcmd_mmapbatch_t ioctlx;
         xen_pfn_t *pfn;
-        unsigned int pfn_arr_size =3D ROUNDUP((num * sizeof(*pfn)), XC_P=
AGE_SHIFT);
+        unsigned int pfn_arr_size =3D ROUNDUP((num * sizeof(*pfn)), XEN_=
PAGE_SHIFT);
         int os_page_size =3D sysconf(_SC_PAGESIZE);
=20
         if ( pfn_arr_size <=3D os_page_size )
@@ -210,7 +210,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
             if ( pfn =3D=3D MAP_FAILED )
             {
                 PERROR("mmap of pfn array failed");
-                (void)munmap(addr, num << XC_PAGE_SHIFT);
+                (void)munmap(addr, num << XEN_PAGE_SHIFT);
                 return NULL;
             }
         }
@@ -243,7 +243,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
                     continue;
                 }
                 rc =3D map_foreign_batch_single(fd, dom, pfn + i,
-                        (unsigned long)addr + (i<<XC_PAGE_SHIFT));
+                        (unsigned long)addr + (i<<XEN_PAGE_SHIFT));
                 if ( rc < 0 )
                 {
                     rc =3D -errno;
@@ -271,7 +271,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
     {
         int saved_errno =3D errno;
=20
-        (void)munmap(addr, num << XC_PAGE_SHIFT);
+        (void)munmap(addr, num << XEN_PAGE_SHIFT);
         errno =3D saved_errno;
         return NULL;
     }
@@ -282,7 +282,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num << XC_PAGE_SHIFT);
+    return munmap(addr, num << XEN_PAGE_SHIFT);
 }
=20
 int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
@@ -294,7 +294,7 @@ int osdep_xenforeignmemory_restrict(xenforeignmemory_=
handle *fmem,
 int osdep_xenforeignmemory_unmap_resource(
     xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fre=
s)
 {
-    return fres ? munmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT) :=
 0;
+    return fres ? munmap(fres->addr, fres->nr_frames << XEN_PAGE_SHIFT) =
: 0;
 }
=20
 int osdep_xenforeignmemory_map_resource(
@@ -313,7 +313,7 @@ int osdep_xenforeignmemory_map_resource(
         /* Request for resource size.  Skip mmap(). */
         goto skip_mmap;
=20
-    fres->addr =3D mmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT,
+    fres->addr =3D mmap(fres->addr, fres->nr_frames << XEN_PAGE_SHIFT,
                       fres->prot, fres->flags | MAP_SHARED, fmem->fd, 0)=
;
     if ( fres->addr =3D=3D MAP_FAILED )
         return -1;
diff --git a/tools/libs/foreignmemory/minios.c b/tools/libs/foreignmemory=
/minios.c
index f2f4dfb2be..2454eb9af3 100644
--- a/tools/libs/foreignmemory/minios.c
+++ b/tools/libs/foreignmemory/minios.c
@@ -17,14 +17,6 @@
  * Copyright 2007-2008 Samuel Thibault <samuel.thibault@eu.citrix.com>.
  */
=20
-/*
- * xenctrl.h currently defines __XEN_TOOLS__ which affects what is
- * exposed by Xen headers. As the define needs to be set consistently,
- * we want to include xenctrl.h before the mini-os headers (they include
- * public headers).
- */
-#include <xenctrl.h>
-
 #include <mini-os/types.h>
 #include <mini-os/os.h>
 #include <mini-os/mm.h>
@@ -63,7 +55,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num << XC_PAGE_SHIFT);
+    return munmap(addr, num << XEN_PAGE_SHIFT);
 }
=20
 /*
diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory=
/netbsd.c
index 597db775d7..ba69b9c6bb 100644
--- a/tools/libs/foreignmemory/netbsd.c
+++ b/tools/libs/foreignmemory/netbsd.c
@@ -76,7 +76,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
 {
     int fd =3D fmem->fd;
     privcmd_mmapbatch_v2_t ioctlx;
-    addr =3D mmap(addr, num * XC_PAGE_SIZE, prot,
+    addr =3D mmap(addr, num * XEN_PAGE_SIZE, prot,
                 flags | MAP_ANON | MAP_SHARED, -1, 0);
     if ( addr =3D=3D MAP_FAILED ) {
         PERROR("osdep_xenforeignmemory_map: mmap failed");
@@ -93,7 +93,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handl=
e *fmem,
     {
         int saved_errno =3D errno;
         PERROR("osdep_xenforeignmemory_map: ioctl failed");
-        munmap(addr, num * XC_PAGE_SIZE);
+        munmap(addr, num * XEN_PAGE_SIZE);
         errno =3D saved_errno;
         return NULL;
     }
@@ -104,7 +104,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_han=
dle *fmem,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num * XC_PAGE_SIZE);
+    return munmap(addr, num * XEN_PAGE_SIZE);
 }
=20
 int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
@@ -117,7 +117,7 @@ int osdep_xenforeignmemory_restrict(xenforeignmemory_=
handle *fmem,
 int osdep_xenforeignmemory_unmap_resource(
     xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fre=
s)
 {
-    return fres ? munmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT) :=
 0;
+    return fres ? munmap(fres->addr, fres->nr_frames << XEN_PAGE_SHIFT) =
: 0;
 }
=20
 int osdep_xenforeignmemory_map_resource(
@@ -136,7 +136,7 @@ int osdep_xenforeignmemory_map_resource(
         /* Request for resource size.  Skip mmap(). */
         goto skip_mmap;
=20
-    fres->addr =3D mmap(fres->addr, fres->nr_frames << XC_PAGE_SHIFT,
+    fres->addr =3D mmap(fres->addr, fres->nr_frames << XEN_PAGE_SHIFT,
                       fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -=
1, 0);
     if ( fres->addr =3D=3D MAP_FAILED )
         return -1;
diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemor=
y/private.h
index 8540303adc..48df948f90 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -1,7 +1,6 @@
 #ifndef XENFOREIGNMEMORY_PRIVATE_H
 #define XENFOREIGNMEMORY_PRIVATE_H
=20
-#include <xenctrl.h>
 #include <xentoollog.h>
=20
 #include <xenforeignmemory.h>
diff --git a/tools/libs/foreignmemory/solaris.c b/tools/libs/foreignmemor=
y/solaris.c
index 958fb01f6d..4466780bd8 100644
--- a/tools/libs/foreignmemory/solaris.c
+++ b/tools/libs/foreignmemory/solaris.c
@@ -72,7 +72,7 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fme=
m, uint32_t dom,
 {
     int fd =3D fmem->fd;
     privcmd_mmapbatch_t ioctlx;
-    addr =3D mmap(addr, num*XC_PAGE_SIZE, prot, flags | MAP_SHARED, fd, =
0);
+    addr =3D mmap(addr, num*XEN_PAGE_SIZE, prot, flags | MAP_SHARED, fd,=
 0);
     if ( addr =3D=3D MAP_FAILED )
         return NULL;
=20
@@ -84,7 +84,7 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fme=
m, uint32_t dom,
     {
         int saved_errno =3D errno;
=20
-        (void)munmap(addr, num*XC_PAGE_SIZE);
+        (void)munmap(addr, num*XEN_PAGE_SIZE);
         errno =3D saved_errno;
         return NULL;
     }
@@ -94,7 +94,7 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fme=
m, uint32_t dom,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num*XC_PAGE_SIZE);
+    return munmap(addr, num*XEN_PAGE_SIZE);
 }
=20
 /*
--=20
2.20.1


