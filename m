Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F7A2F3862
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65865.116761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOG3-0004jW-7T; Tue, 12 Jan 2021 18:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65865.116761; Tue, 12 Jan 2021 18:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOG2-0004i3-Vf; Tue, 12 Jan 2021 18:19:06 +0000
Received: by outflank-mailman (input) for mailman id 65865;
 Tue, 12 Jan 2021 18:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOBf-0003Yo-Vv
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:14:36 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53337dc4-3bf3-4e1b-881c-a4dbdb54f8e9;
 Tue, 12 Jan 2021 18:13:37 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDZKp008277;
 Tue, 12 Jan 2021 19:13:35 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDYZC009847;
 Tue, 12 Jan 2021 19:13:34 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 2543A7218; Tue, 12 Jan 2021 19:13:34 +0100 (MET)
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
X-Inumbo-ID: 53337dc4-3bf3-4e1b-881c-a4dbdb54f8e9
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] libs/foreignmemory: Implement on NetBSD
Date: Tue, 12 Jan 2021 19:12:31 +0100
Message-Id: <20210112181242.1570-11-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:35 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

Implement foreignmemory interface on NetBSD. The compat interface is now used
only on __sun__

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/foreignmemory/Makefile  |  2 +-
 tools/libs/foreignmemory/netbsd.c  | 75 ++++++++++++++++++++++++++----
 tools/libs/foreignmemory/private.h |  6 +--
 3 files changed, 69 insertions(+), 14 deletions(-)

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
index 54a418ebd6..c2a691daed 100644
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
@@ -97,7 +102,57 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
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
+    errno = EOPNOTSUPP;
+    return -1;
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
+        if ( errno != EOPNOTSUPP )
+            PERROR("ioctl failed");
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
index b522a2b86b..f7569d4f6b 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -42,9 +42,9 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num);
 
-#if defined(__NetBSD__) || defined(__sun__)
+#if defined(__sun__)
 /* Strictly compat for those two only only */
-void *compat_mapforeign_batch(xenforeignmem_handle *fmem, uint32_t dom,
+void *osdep_map_foreign_batch(xenforeignmemory_handle *fmem, uint32_t dom,
                               void *addr, int prot, int flags,
                               xen_pfn_t *arr, int num);
 #endif
@@ -60,7 +60,7 @@ struct xenforeignmemory_resource_handle {
     int flags;
 };
 
-#ifndef __linux__
+#if  !defined(__linux__) && !defined(__NetBSD__)
 static inline int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
                                                   domid_t domid)
 {
-- 
2.29.2


