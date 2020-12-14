Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E82D9F28
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52390.91635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshI-0001wj-Ht; Mon, 14 Dec 2020 18:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52390.91635; Mon, 14 Dec 2020 18:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshI-0001uT-85; Mon, 14 Dec 2020 18:35:48 +0000
Received: by outflank-mailman (input) for mailman id 52390;
 Mon, 14 Dec 2020 16:37:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqqZ-0006vN-JH
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:37:15 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 529ef58c-2875-4c18-8456-429b71c1dbf1;
 Mon, 14 Dec 2020 16:36:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaX4U008860;
 Mon, 14 Dec 2020 17:36:33 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaX6J007339;
 Mon, 14 Dec 2020 17:36:33 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 34CCCAAC68; Mon, 14 Dec 2020 17:36:33 +0100 (MET)
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
X-Inumbo-ID: 529ef58c-2875-4c18-8456-429b71c1dbf1
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 08/24] Make libs/call build on NetBSD
Date: Mon, 14 Dec 2020 17:36:07 +0100
Message-Id: <20201214163623.2127-9-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 tools/libs/call/netbsd.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/libs/call/netbsd.c b/tools/libs/call/netbsd.c
index a5502da377..1a771e9928 100644
--- a/tools/libs/call/netbsd.c
+++ b/tools/libs/call/netbsd.c
@@ -19,12 +19,14 @@
  * Split from xc_netbsd.c
  */
 
-#include "xc_private.h"
 
 #include <unistd.h>
 #include <fcntl.h>
 #include <malloc.h>
+#include <errno.h>
 #include <sys/mman.h>
+#include <sys/ioctl.h>
+#include "private.h"
 
 int osdep_xencall_open(xencall_handle *xcall)
 {
@@ -69,12 +71,13 @@ int osdep_xencall_close(xencall_handle *xcall)
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
 
@@ -86,14 +89,13 @@ void *osdep_alloc_hypercall_buffer(xencall_handle *xcall, size_t npages)
     return p;
 }
 
-void osdep_free_hypercall_buffer(xencall_handle *xcall, void *ptr,
-                                 size_t npages)
+void osdep_free_pages(xencall_handle *xcall, void *ptr, size_t npages)
 {
-    (void) munlock(ptr, npages * XC_PAGE_SIZE);
+    (void) munlock(ptr, npages * PAGE_SIZE);
     free(ptr);
 }
 
-int do_xen_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
+int osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
 {
     int fd = xcall->fd;
     int error = ioctl(fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);
-- 
2.28.0


