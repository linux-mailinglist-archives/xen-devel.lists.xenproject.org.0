Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9712F64CD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67206.119795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04he-0002ri-Rt; Thu, 14 Jan 2021 15:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67206.119795; Thu, 14 Jan 2021 15:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04he-0002qN-JS; Thu, 14 Jan 2021 15:38:26 +0000
Received: by outflank-mailman (input) for mailman id 67206;
 Thu, 14 Jan 2021 15:38:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hc-0002Sh-Ij
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2c593fc-66b5-45df-aa7b-b094302478c0;
 Thu, 14 Jan 2021 15:38:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3043AE39;
 Thu, 14 Jan 2021 15:38:06 +0000 (UTC)
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
X-Inumbo-ID: e2c593fc-66b5-45df-aa7b-b094302478c0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXeWCVLCNKqb1BhBiMbLtSi4Q/AfWDsC5gfu3rKZsDc=;
	b=bu39cAjn9t4Xv+wen9mSUS2t5b5MYNJTbscgiBqCCULeRnGoGCeqFjmspXml/IKPsXc3sL
	yCHl1Ni0ikqUtD2gUfnxEOZ/W9Vl45as1oBlfX9hnXefmf+gRT9pgyTuWrFGjYR0GxGhVg
	qxlR8spRUsbvN04CcjF9aCvMZ/5DOZg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v11 01/27] tools/libxenevtchn: switch to standard xen coding style
Date: Thu, 14 Jan 2021 16:37:37 +0100
Message-Id: <20210114153803.2591-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a mixture of different styles in libxenevtchn. Use the
standard xen style only.

No functional change.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V11:
- new patch
---
 tools/libs/evtchn/core.c    | 24 +++++----
 tools/libs/evtchn/freebsd.c | 25 +++++++---
 tools/libs/evtchn/linux.c   |  4 ++
 tools/libs/evtchn/minios.c  | 98 +++++++++++++++++++++++++++----------
 tools/libs/evtchn/netbsd.c  | 22 ++++++---
 tools/libs/evtchn/solaris.c | 12 +++--
 6 files changed, 131 insertions(+), 54 deletions(-)

diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
index aff6ecfaa0..5008810f4f 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -18,10 +18,11 @@
 
 #include "private.h"
 
-static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid) {
+static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid)
+{
     xenevtchn_handle *xce = CONTAINER_OF(ah, *xce, tc_ah);
 
-    if (xce->fd < 0)
+    if ( xce->fd < 0 )
         /* just in case */
         return 0;
 
@@ -33,7 +34,8 @@ xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned open_flags)
     xenevtchn_handle *xce = malloc(sizeof(*xce));
     int rc;
 
-    if (!xce) return NULL;
+    if ( !xce )
+        return NULL;
 
     xce->fd = -1;
     xce->logger = logger;
@@ -42,23 +44,26 @@ xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned open_flags)
     xce->tc_ah.restrict_callback = all_restrict_cb;
     xentoolcore__register_active_handle(&xce->tc_ah);
 
-    if (!xce->logger) {
-        xce->logger = xce->logger_tofree =
-            (xentoollog_logger*)
+    if ( !xce->logger )
+    {
+        xce->logger = xce->logger_tofree = (xentoollog_logger *)
             xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
-        if (!xce->logger) goto err;
+        if ( !xce->logger )
+            goto err;
     }
 
     rc = osdep_evtchn_open(xce);
-    if ( rc  < 0 ) goto err;
+    if ( rc  < 0 )
+        goto err;
 
     return xce;
 
-err:
+ err:
     xentoolcore__deregister_active_handle(&xce->tc_ah);
     osdep_evtchn_close(xce);
     xtl_logger_destroy(xce->logger_tofree);
     free(xce);
+
     return NULL;
 }
 
@@ -73,6 +78,7 @@ int xenevtchn_close(xenevtchn_handle *xce)
     rc = osdep_evtchn_close(xce);
     xtl_logger_destroy(xce->logger_tofree);
     free(xce);
+
     return rc;
 }
 
diff --git a/tools/libs/evtchn/freebsd.c b/tools/libs/evtchn/freebsd.c
index 6564ed4c44..554af122c8 100644
--- a/tools/libs/evtchn/freebsd.c
+++ b/tools/libs/evtchn/freebsd.c
@@ -34,9 +34,12 @@
 int osdep_evtchn_open(xenevtchn_handle *xce)
 {
     int fd = open(EVTCHN_DEV, O_RDWR|O_CLOEXEC);
+
     if ( fd == -1 )
         return -1;
+
     xce->fd = fd;
+
     return 0;
 }
 
@@ -51,6 +54,7 @@ int osdep_evtchn_close(xenevtchn_handle *xce)
 int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 {
     errno = -EOPNOTSUPP;
+
     return -1;
 }
 
@@ -69,7 +73,8 @@ int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
     return ioctl(fd, IOCTL_EVTCHN_NOTIFY, &notify);
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce, uint32_t domid)
+xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
+                                                      uint32_t domid)
 {
     int ret, fd = xce->fd;
     struct ioctl_evtchn_bind_unbound_port bind;
@@ -77,11 +82,13 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce, uin
     bind.remote_domain = domid;
 
     ret = ioctl(fd, IOCTL_EVTCHN_BIND_UNBOUND_PORT, &bind);
-    return ( ret == 0 ) ? bind.port : ret;
+
+    return ret ?: bind.port;
 }
 
-xenevtchn_port_or_error_t
-xenevtchn_bind_interdomain(xenevtchn_handle *xce, uint32_t domid, evtchn_port_t remote_port)
+xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
+                                                     uint32_t domid,
+                                                     evtchn_port_t remote_port)
 {
     int ret, fd = xce->fd;
     struct ioctl_evtchn_bind_interdomain bind;
@@ -90,10 +97,12 @@ xenevtchn_bind_interdomain(xenevtchn_handle *xce, uint32_t domid, evtchn_port_t
     bind.remote_port = remote_port;
 
     ret = ioctl(fd, IOCTL_EVTCHN_BIND_INTERDOMAIN, &bind);
-    return ( ret == 0 ) ? bind.port : ret;
+
+    return ret ?: bind.port;
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce, unsigned int virq)
+xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
+                                              unsigned int virq)
 {
     int ret, fd = xce->fd;
     struct ioctl_evtchn_bind_virq bind;
@@ -101,7 +110,8 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce, unsigned in
     bind.virq = virq;
 
     ret = ioctl(fd, IOCTL_EVTCHN_BIND_VIRQ, &bind);
-    return ( ret == 0 ) ? bind.port : ret;
+
+    return ret ?: bind.port;
 }
 
 int xenevtchn_unbind(xenevtchn_handle *xce, evtchn_port_t port)
@@ -131,6 +141,7 @@ int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
 
     if ( write(fd, &port, sizeof(port)) != sizeof(port) )
         return -1;
+
     return 0;
 }
 
diff --git a/tools/libs/evtchn/linux.c b/tools/libs/evtchn/linux.c
index 17e64aea32..4582a58ec4 100644
--- a/tools/libs/evtchn/linux.c
+++ b/tools/libs/evtchn/linux.c
@@ -37,9 +37,12 @@
 int osdep_evtchn_open(xenevtchn_handle *xce)
 {
     int fd = open("/dev/xen/evtchn", O_RDWR|O_CLOEXEC);
+
     if ( fd == -1 )
         return -1;
+
     xce->fd = fd;
+
     return 0;
 }
 
@@ -135,6 +138,7 @@ int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
 
     if ( write(fd, &port, sizeof(port)) != sizeof(port) )
         return -1;
+
     return 0;
 }
 
diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 9cd7636fc5..8e9f77bb6b 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -43,22 +43,28 @@ extern void minios_evtchn_close_fd(int fd);
 extern struct wait_queue_head event_queue;
 
 /* XXX Note: This is not threadsafe */
-static struct evtchn_port_info* port_alloc(int fd) {
+static struct evtchn_port_info* port_alloc(int fd)
+{
     struct evtchn_port_info *port_info;
+
     port_info = malloc(sizeof(struct evtchn_port_info));
-    if (port_info == NULL)
+    if ( port_info == NULL )
         return NULL;
+
     port_info->pending = 0;
     port_info->port = -1;
     port_info->bound = 0;
 
     LIST_INSERT_HEAD(&files[fd].evtchn.ports, port_info, list);
+
     return port_info;
 }
 
-static void port_dealloc(struct evtchn_port_info *port_info) {
-    if (port_info->bound)
+static void port_dealloc(struct evtchn_port_info *port_info)
+{
+    if ( port_info->bound )
         unbind_evtchn(port_info->port);
+
     LIST_REMOVE(port_info, list);
     free(port_info);
 }
@@ -66,11 +72,14 @@ static void port_dealloc(struct evtchn_port_info *port_info) {
 int osdep_evtchn_open(xenevtchn_handle *xce)
 {
     int fd = alloc_fd(FTYPE_EVTCHN);
+
     if ( fd == -1 )
         return -1;
+
     LIST_INIT(&files[fd].evtchn.ports);
     xce->fd = fd;
     printf("evtchn_open() -> %d\n", fd);
+
     return 0;
 }
 
@@ -85,12 +94,14 @@ int osdep_evtchn_close(xenevtchn_handle *xce)
 int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 {
     errno = -EOPNOTSUPP;
+
     return -1;
 }
 
 void minios_evtchn_close_fd(int fd)
 {
     struct evtchn_port_info *port_info, *tmp;
+
     LIST_FOREACH_SAFE(port_info, &files[fd].evtchn.ports, list, tmp)
         port_dealloc(port_info);
 
@@ -108,10 +119,12 @@ int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
 
     ret = notify_remote_via_evtchn(port);
 
-    if (ret < 0) {
+    if (ret < 0)
+    {
         errno = -ret;
         ret = -1;
     }
+
     return ret;
 }
 
@@ -119,12 +132,15 @@ static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
 {
     int fd = (int)(intptr_t)data;
     struct evtchn_port_info *port_info;
+
     assert(files[fd].type == FTYPE_EVTCHN);
     mask_evtchn(port);
-    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list) {
-        if (port_info->port == port)
+    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
+    {
+        if ( port_info->port == port )
             goto found;
     }
+
     printk("Unknown port for handle %d\n", fd);
     return;
 
@@ -134,7 +150,8 @@ static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
     wake_up(&event_queue);
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce, uint32_t domid)
+xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
+                                                      uint32_t domid)
 {
     int fd = xce->fd;
     struct evtchn_port_info *port_info;
@@ -143,26 +160,31 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce, uin
 
     assert(get_current() == main_thread);
     port_info = port_alloc(fd);
-    if (port_info == NULL)
+    if ( port_info == NULL )
         return -1;
 
     printf("xenevtchn_bind_unbound_port(%d)", domid);
-    ret = evtchn_alloc_unbound(domid, evtchn_handler, (void*)(intptr_t)fd, &port);
+    ret = evtchn_alloc_unbound(domid, evtchn_handler,
+                               (void *)(intptr_t)fd, &port);
     printf(" = %d\n", ret);
 
-    if (ret < 0) {
+    if ( ret < 0 )
+    {
         port_dealloc(port_info);
         errno = -ret;
         return -1;
     }
+
     port_info->bound = 1;
     port_info->port = port;
     unmask_evtchn(port);
+
     return port;
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce, uint32_t domid,
-                                                  evtchn_port_t remote_port)
+xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
+                                                     uint32_t domid,
+                                                     evtchn_port_t remote_port)
 {
     int fd = xce->fd;
     struct evtchn_port_info *port_info;
@@ -171,21 +193,25 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce, uint
 
     assert(get_current() == main_thread);
     port_info = port_alloc(fd);
-    if (port_info == NULL)
+    if ( port_info == NULL )
         return -1;
 
     printf("xenevtchn_bind_interdomain(%d, %"PRId32")", domid, remote_port);
-    ret = evtchn_bind_interdomain(domid, remote_port, evtchn_handler, (void*)(intptr_t)fd, &local_port);
+    ret = evtchn_bind_interdomain(domid, remote_port, evtchn_handler,
+                                  (void *)(intptr_t)fd, &local_port);
     printf(" = %d\n", ret);
 
-    if (ret < 0) {
+    if ( ret < 0 )
+    {
         port_dealloc(port_info);
         errno = -ret;
         return -1;
     }
+
     port_info->bound = 1;
     port_info->port = local_port;
     unmask_evtchn(local_port);
+
     return local_port;
 }
 
@@ -194,18 +220,24 @@ int xenevtchn_unbind(xenevtchn_handle *xce, evtchn_port_t port)
     int fd = xce->fd;
     struct evtchn_port_info *port_info;
 
-    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list) {
-        if (port_info->port == port) {
+    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
+    {
+        if ( port_info->port == port )
+        {
             port_dealloc(port_info);
             return 0;
         }
     }
-    printf("Warning: couldn't find port %"PRId32" for xc handle %x\n", port, fd);
+
+    printf("Warning: couldn't find port %"PRId32" for xc handle %x\n",
+           port, fd);
     errno = EINVAL;
+
     return -1;
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce, unsigned int virq)
+xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
+                                              unsigned int virq)
 {
     int fd = xce->fd;
     struct evtchn_port_info *port_info;
@@ -213,21 +245,24 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce, unsigned in
 
     assert(get_current() == main_thread);
     port_info = port_alloc(fd);
-    if (port_info == NULL)
+    if ( port_info == NULL )
         return -1;
 
     printf("xenevtchn_bind_virq(%d)", virq);
-    port = bind_virq(virq, evtchn_handler, (void*)(intptr_t)fd);
+    port = bind_virq(virq, evtchn_handler, (void *)(intptr_t)fd);
     printf(" = %d\n", port);
 
-    if (port < 0) {
+    if ( port < 0 )
+    {
         port_dealloc(port_info);
         errno = -port;
         return -1;
     }
+
     port_info->bound = 1;
     port_info->port = port;
     unmask_evtchn(port);
+
     return port;
 }
 
@@ -239,26 +274,35 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
     evtchn_port_t ret = -1;
 
     local_irq_save(flags);
+
     files[fd].read = 0;
 
-    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list) {
-        if (port_info->port != -1 && port_info->pending) {
-            if (ret == -1) {
+    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
+    {
+        if ( port_info->port != -1 && port_info->pending )
+        {
+            if ( ret == -1 )
+            {
                 ret = port_info->port;
                 port_info->pending = 0;
-            } else {
+            }
+            else
+            {
                 files[fd].read = 1;
                 break;
             }
         }
     }
+
     local_irq_restore(flags);
+
     return ret;
 }
 
 int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
 {
     unmask_evtchn(port);
+
     return 0;
 }
 
diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
index 8b8545d2f9..53f9299ebb 100644
--- a/tools/libs/evtchn/netbsd.c
+++ b/tools/libs/evtchn/netbsd.c
@@ -34,9 +34,12 @@
 int osdep_evtchn_open(xenevtchn_handle *xce)
 {
     int fd = open(EVTCHN_DEV_NAME, O_NONBLOCK|O_RDWR);
+
     if ( fd == -1 )
         return -1;
+
     xce->fd = fd;
+
     return 0;
 }
 
@@ -51,6 +54,7 @@ int osdep_evtchn_close(xenevtchn_handle *xce)
 int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 {
     errno = -EOPNOTSUPP;
+
     return -1;
 }
 
@@ -69,7 +73,8 @@ int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
     return ioctl(fd, IOCTL_EVTCHN_NOTIFY, &notify);
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle * xce, uint32_t domid)
+xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
+                                                      uint32_t domid)
 {
     int fd = xce->fd;
     struct ioctl_evtchn_bind_unbound_port bind;
@@ -78,14 +83,15 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle * xce, ui
     bind.remote_domain = domid;
 
     ret = ioctl(fd, IOCTL_EVTCHN_BIND_UNBOUND_PORT, &bind);
-    if (ret == 0)
+    if ( ret == 0 )
         return bind.port;
     else
         return -1;
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce, uint32_t domid,
-                                                  evtchn_port_t remote_port)
+xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
+                                                     uint32_t domid,
+                                                     evtchn_port_t remote_port)
 {
     int fd = xce->fd;
     struct ioctl_evtchn_bind_interdomain bind;
@@ -95,7 +101,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce, uint
     bind.remote_port = remote_port;
 
     ret = ioctl(fd, IOCTL_EVTCHN_BIND_INTERDOMAIN, &bind);
-    if (ret == 0)
+    if ( ret == 0 )
         return bind.port;
     else
         return -1;
@@ -111,7 +117,8 @@ int xenevtchn_unbind(xenevtchn_handle *xce, evtchn_port_t port)
     return ioctl(fd, IOCTL_EVTCHN_UNBIND, &unbind);
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce, unsigned int virq)
+xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
+                                              unsigned int virq)
 {
     int fd = xce->fd;
     struct ioctl_evtchn_bind_virq bind;
@@ -120,7 +127,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce, unsigned in
     bind.virq = virq;
 
     err = ioctl(fd, IOCTL_EVTCHN_BIND_VIRQ, &bind);
-    if (err)
+    if ( err )
         return -1;
     else
         return bind.port;
@@ -140,6 +147,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
+
     return write_exact(fd, (char *)&port, sizeof(port));
 }
 
diff --git a/tools/libs/evtchn/solaris.c b/tools/libs/evtchn/solaris.c
index dd41f62a24..d87abc553c 100644
--- a/tools/libs/evtchn/solaris.c
+++ b/tools/libs/evtchn/solaris.c
@@ -72,7 +72,8 @@ int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
     return ioctl(fd, IOCTL_EVTCHN_NOTIFY, &notify);
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce, uint32_t domid)
+xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
+                                                      uint32_t domid)
 {
     int fd = xce->fd;
     struct ioctl_evtchn_bind_unbound_port bind;
@@ -82,8 +83,9 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce, uin
     return ioctl(fd, IOCTL_EVTCHN_BIND_UNBOUND_PORT, &bind);
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce, uint32_t domid,
-                                                  evtchn_port_t remote_port)
+xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
+                                                     uint32_t domid,
+                                                     evtchn_port_t remote_port)
 {
     int fd = xce->fd;
     struct ioctl_evtchn_bind_interdomain bind;
@@ -94,7 +96,8 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce, uint
     return ioctl(fd, IOCTL_EVTCHN_BIND_INTERDOMAIN, &bind);
 }
 
-xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce, unsigned int virq)
+xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
+                                              unsigned int virq)
 {
     int fd = xce->fd;
     struct ioctl_evtchn_bind_virq bind;
@@ -128,6 +131,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
+
     return write_exact(fd, (char *)&port, sizeof(port));
 }
 
-- 
2.26.2


