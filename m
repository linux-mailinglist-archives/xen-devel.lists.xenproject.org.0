Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8AF2D9F23
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52399.91723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshV-0002TZ-MJ; Mon, 14 Dec 2020 18:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52399.91723; Mon, 14 Dec 2020 18:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshR-0002G2-M4; Mon, 14 Dec 2020 18:35:57 +0000
Received: by outflank-mailman (input) for mailman id 52399;
 Mon, 14 Dec 2020 16:39:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqqy-0006vN-Jn
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:37:40 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36f209d1-9377-407d-8c57-ce478a8fd182;
 Mon, 14 Dec 2020 16:36:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaXAO005133;
 Mon, 14 Dec 2020 17:36:33 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaXTw001450;
 Mon, 14 Dec 2020 17:36:33 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 6A40CAAC65; Mon, 14 Dec 2020 17:36:33 +0100 (MET)
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
X-Inumbo-ID: 36f209d1-9377-407d-8c57-ce478a8fd182
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 11/24] Implement foreignmemory on NetBSD
Date: Mon, 14 Dec 2020 17:36:10 +0100
Message-Id: <20201214163623.2127-12-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 tools/libs/foreignmemory/Makefile  |  2 +-
 tools/libs/foreignmemory/netbsd.c  | 76 ++++++++++++++++++++++++++----
 tools/libs/foreignmemory/private.h | 10 +++-
 3 files changed, 75 insertions(+), 13 deletions(-)

diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index 13850f7988..f191cdbed0 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -8,7 +8,7 @@ SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c
 SRCS-$(CONFIG_FreeBSD) += freebsd.c
 SRCS-$(CONFIG_SunOS)   += compat.c solaris.c
-SRCS-$(CONFIG_NetBSD)  += compat.c netbsd.c
+SRCS-$(CONFIG_NetBSD)  += netbsd.c
 SRCS-$(CONFIG_MiniOS)  += minios.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
index 54a418ebd6..6d740ec2a3 100644
--- a/tools/libs/foreignmemory/netbsd.c
+++ b/tools/libs/foreignmemory/netbsd.c
@@ -19,7 +19,9 @@
 
 #include <unistd.h>
 #include <fcntl.h>
+#include <errno.h>
 #include <sys/mman.h>
+#include <sys/ioctl.h>
 
 #include "private.h"
 
@@ -66,15 +68,17 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem)
     return close(fd);
 }
 
-void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
-                              void *addr, int prot, int flags,
-                              xen_pfn_t *arr, int num)
+void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
+                                 uint32_t dom, void *addr,
+				 int prot, int flags, size_t num,
+				 const xen_pfn_t arr[/*num*/], int err[/*num*/])
+
 {
     int fd = fmem->fd;
-    privcmd_mmapbatch_t ioctlx;
-    addr = mmap(addr, num*XC_PAGE_SIZE, prot, flags | MAP_ANON | MAP_SHARED, -1, 0);
+    privcmd_mmapbatch_v2_t ioctlx;
+    addr = mmap(addr, num*PAGE_SIZE, prot, flags | MAP_ANON | MAP_SHARED, -1, 0);
     if ( addr == MAP_FAILED ) {
-        PERROR("osdep_map_foreign_batch: mmap failed");
+        PERROR("osdep_xenforeignmemory_map: mmap failed");
         return NULL;
     }
 
@@ -82,11 +86,12 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
     ioctlx.dom=dom;
     ioctlx.addr=(unsigned long)addr;
     ioctlx.arr=arr;
-    if ( ioctl(fd, IOCTL_PRIVCMD_MMAPBATCH, &ioctlx) < 0 )
+    ioctlx.err=err;
+    if ( ioctl(fd, IOCTL_PRIVCMD_MMAPBATCH_V2, &ioctlx) < 0 )
     {
         int saved_errno = errno;
-        PERROR("osdep_map_foreign_batch: ioctl failed");
-        (void)munmap(addr, num*XC_PAGE_SIZE);
+        PERROR("osdep_xenforeignmemory_map: ioctl failed");
+        (void)munmap(addr, num*PAGE_SIZE);
         errno = saved_errno;
         return NULL;
     }
@@ -97,7 +102,58 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num)
 {
-    return munmap(addr, num*XC_PAGE_SIZE);
+    return munmap(addr, num*PAGE_SIZE);
+}
+
+int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
+                                    domid_t domid)
+{
+    return 0;
+}
+
+int osdep_xenforeignmemory_unmap_resource(
+    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
+{
+    return fres ? munmap(fres->addr, fres->nr_frames << PAGE_SHIFT) : 0;
+}
+
+int osdep_xenforeignmemory_map_resource(
+    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
+{
+    privcmd_mmap_resource_t mr = {
+        .dom = fres->domid,
+        .type = fres->type,
+        .id = fres->id,
+        .idx = fres->frame,
+        .num = fres->nr_frames,
+    };
+    int rc;
+
+    fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
+                      fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -1, 0);
+    if ( fres->addr == MAP_FAILED )
+        return -1;
+
+    mr.addr = (uintptr_t)fres->addr;
+
+    rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
+    if ( rc )
+    {
+        int saved_errno;
+
+        if ( errno != fmem->unimpl_errno && errno != EOPNOTSUPP )
+            PERROR("ioctl failed");
+        else
+            errno = EOPNOTSUPP;
+
+        saved_errno = errno;
+        (void)osdep_xenforeignmemory_unmap_resource(fmem, fres);
+        errno = saved_errno;
+
+        return -1;
+    }
+
+    return 0;
 }
 
 /*
diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
index 8f1bf081ed..abeceb8720 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -8,7 +8,13 @@
 #include <xentoolcore_internal.h>
 
 #include <xen/xen.h>
+
+#ifdef __NetBSD__
+#include <xen/xen.h>
+#include <xen/xenio.h>
+#else
 #include <xen/sys/privcmd.h>
+#endif
 
 #ifndef PAGE_SHIFT /* Mini-os, Yukk */
 #define PAGE_SHIFT           12
@@ -38,7 +44,7 @@ int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
 
 #if defined(__NetBSD__) || defined(__sun__)
 /* Strictly compat for those two only only */
-void *compat_mapforeign_batch(xenforeignmem_handle *fmem, uint32_t dom,
+void *osdep_map_foreign_batch(xenforeignmemory_handle *fmem, uint32_t dom,
                               void *addr, int prot, int flags,
                               xen_pfn_t *arr, int num);
 #endif
@@ -54,7 +60,7 @@ struct xenforeignmemory_resource_handle {
     int flags;
 };
 
-#ifndef __linux__
+#if  !defined(__linux__) && !defined(__NetBSD__)
 static inline int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
                                                   domid_t domid)
 {
-- 
2.28.0


