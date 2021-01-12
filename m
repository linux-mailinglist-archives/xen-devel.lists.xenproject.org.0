Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C192F3866
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65871.116790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGF-00051L-2I; Tue, 12 Jan 2021 18:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65871.116790; Tue, 12 Jan 2021 18:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGE-00050W-TO; Tue, 12 Jan 2021 18:19:18 +0000
Received: by outflank-mailman (input) for mailman id 65871;
 Tue, 12 Jan 2021 18:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOBL-0003Yo-Up
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:14:15 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2548167-0b56-4ac7-bc3d-3545afb8af1d;
 Tue, 12 Jan 2021 18:13:32 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDV5M029918;
 Tue, 12 Jan 2021 19:13:31 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDU3t005928;
 Tue, 12 Jan 2021 19:13:30 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 66A297218; Tue, 12 Jan 2021 19:13:30 +0100 (MET)
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
X-Inumbo-ID: b2548167-0b56-4ac7-bc3d-3545afb8af1d
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] libs/call: fix build on NetBSD
Date: Tue, 12 Jan 2021 19:12:29 +0100
Message-Id: <20210112181242.1570-9-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:31 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

Define PAGE_* if not already defined
Catch up with osdep interface change.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/call/netbsd.c  | 19 +++++++++++--------
 tools/libs/call/private.h |  6 ++++--
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/tools/libs/call/netbsd.c b/tools/libs/call/netbsd.c
index a5502da377..4dcc2919ba 100644
--- a/tools/libs/call/netbsd.c
+++ b/tools/libs/call/netbsd.c
@@ -19,12 +19,15 @@
  * Split from xc_netbsd.c
  */
 
-#include "xc_private.h"
 
 #include <unistd.h>
 #include <fcntl.h>
 #include <malloc.h>
+#include <errno.h>
 #include <sys/mman.h>
+#include <sys/ioctl.h>
+
+#include "private.h"
 
 int osdep_xencall_open(xencall_handle *xcall)
 {
@@ -69,12 +72,13 @@ int osdep_xencall_close(xencall_handle *xcall)
     return close(fd);
 }
 
-void *osdep_alloc_hypercall_buffer(xencall_handle *xcall, size_t npages)
+void *osdep_alloc_pages(xencall_handle *xcall, size_t npages)
 {
-    size_t size = npages * XC_PAGE_SIZE;
+    size_t size = npages * PAGE_SIZE;
     void *p;
+    int ret;
 
-    ret = posix_memalign(&p, XC_PAGE_SIZE, size);
+    ret = posix_memalign(&p, PAGE_SIZE, size);
     if ( ret != 0 || !p )
         return NULL;
 
@@ -86,14 +90,13 @@ void *osdep_alloc_hypercall_buffer(xencall_handle *xcall, size_t npages)
     return p;
 }
 
-void osdep_free_hypercall_buffer(xencall_handle *xcall, void *ptr,
-                                 size_t npages)
+void osdep_free_pages(xencall_handle *xcall, void *ptr, size_t npages)
 {
-    (void) munlock(ptr, npages * XC_PAGE_SIZE);
+    munlock(ptr, npages * PAGE_SIZE);
     free(ptr);
 }
 
-int do_xen_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
+int osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
 {
     int fd = xcall->fd;
     int error = ioctl(fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);
diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
index 57e49356a1..2ca84d723b 100644
--- a/tools/libs/call/private.h
+++ b/tools/libs/call/private.h
@@ -13,11 +13,13 @@
 #include <xen/sys/privcmd.h>
 #endif
 
-#ifndef PAGE_SHIFT /* Mini-os, Yukk */
+#ifndef PAGE_SHIFT
 #define PAGE_SHIFT           12
 #endif
-#ifndef __MINIOS__ /* Yukk */
+#ifndef PAGE_SIZE
 #define PAGE_SIZE            (1UL << PAGE_SHIFT)
+#endif
+#ifndef PAGE_MASK
 #define PAGE_MASK            (~(PAGE_SIZE-1))
 #endif
 
-- 
2.29.2


