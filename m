Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FA048FB9D
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257805.443126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90pU-00055b-Uz; Sun, 16 Jan 2022 08:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257805.443126; Sun, 16 Jan 2022 08:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90pU-00052b-Qr; Sun, 16 Jan 2022 08:24:00 +0000
Received: by outflank-mailman (input) for mailman id 257805;
 Sun, 16 Jan 2022 08:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90pT-00052L-OI
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:23:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a68da50a-76a5-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 09:23:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6BA4218E0;
 Sun, 16 Jan 2022 08:23:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9E5C13AB5;
 Sun, 16 Jan 2022 08:23:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gOc+LB3W42FLEwAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:23:57 +0000
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
X-Inumbo-ID: a68da50a-76a5-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642321437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lwv7UrthbYq5rR8LCXaRM2cQQusBd2qxNothm7VTMRM=;
	b=i/swlC09deGKUbaLLq7DYynecLl3fzdLBbG2O0RlWQ6zyqAUfifOP36WTfGofSDJ6IaH8B
	4/VRqL0arxU6Qvfu8dwOhHQWz30VF7muA1i7Ih/69z6cJLCz6EYYkftt05Jhghe+7R0u8M
	OpGYZPXelqRpMAVGICcNuJdkY1BD7Rs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 1/3] tools/libs/evtchn: decouple more from mini-os
Date: Sun, 16 Jan 2022 09:23:44 +0100
Message-Id: <20220116082346.26194-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116082346.26194-1-jgross@suse.com>
References: <20220116082346.26194-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mini-OS and libevtchn are using implementation details of each other.
Change that by letting libevtchn use the new alloc_file_type() and
get_file_from_fd() function and the generic dev pointer of struct file
from Mini-OS.

By using private struct declarations Mini-OS will be able to drop the
libevtchn specific definitions of struct evtchn_port_info and
evtchn_port_list in future. While at it use bool for "pending" and
"bound".

Switch to use xce as function parameter instead of fd where possible.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use xce instead of fd as parameter internally (Andrew Cooper)
- add alloc_file_type() support
V3:
- switch callback to use struct file * as a parameter (Andrew Cooper)
- use __attribute__((constructor)) (Andrew Cooper)
---
 tools/libs/evtchn/minios.c | 143 +++++++++++++++++++++++++------------
 1 file changed, 96 insertions(+), 47 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 8f84048b11..ee3da9f8fe 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -38,29 +38,40 @@
 
 #include "private.h"
 
-extern void minios_evtchn_close_fd(int fd);
+LIST_HEAD(port_list, port_info);
+
+struct port_info {
+    LIST_ENTRY(port_info) list;
+    evtchn_port_t port;
+    bool pending;
+    bool bound;
+};
 
 extern struct wait_queue_head event_queue;
 
+void minios_evtchn_close_fd(int fd);
+
 /* XXX Note: This is not threadsafe */
-static struct evtchn_port_info *port_alloc(int fd)
+static struct port_info *port_alloc(xenevtchn_handle *xce)
 {
-    struct evtchn_port_info *port_info;
+    struct port_info *port_info;
+    struct file *file = get_file_from_fd(xce->fd);
+    struct port_list *port_list = file->dev;
 
-    port_info = malloc(sizeof(struct evtchn_port_info));
+    port_info = malloc(sizeof(struct port_info));
     if ( port_info == NULL )
         return NULL;
 
-    port_info->pending = 0;
+    port_info->pending = false;
     port_info->port = -1;
-    port_info->bound = 0;
+    port_info->bound = false;
 
-    LIST_INSERT_HEAD(&files[fd].evtchn.ports, port_info, list);
+    LIST_INSERT_HEAD(port_list, port_info, list);
 
     return port_info;
 }
 
-static void port_dealloc(struct evtchn_port_info *port_info)
+static void port_dealloc(struct port_info *port_info)
 {
     if ( port_info->bound )
         unbind_evtchn(port_info->port);
@@ -69,18 +80,57 @@ static void port_dealloc(struct evtchn_port_info *port_info)
     free(port_info);
 }
 
+static int evtchn_close_fd(struct file *file)
+{
+    struct port_info *port_info, *tmp;
+    struct port_list *port_list = file->dev;
+
+    LIST_FOREACH_SAFE(port_info, port_list, list, tmp)
+        port_dealloc(port_info);
+    free(port_list);
+
+    return 0;
+}
+
+static const struct file_ops evtchn_ops = {
+    .name = "evtchn",
+    .close = evtchn_close_fd,
+    .select_rd = select_read_flag,
+};
+
+static unsigned int ftype_evtchn;
+
+__attribute__((constructor))
+static void evtchn_initialize(void)
+{
+    ftype_evtchn = alloc_file_type(&evtchn_ops);
+}
+
 /*
  * XENEVTCHN_NO_CLOEXEC is being ignored, as there is no exec() call supported
  * in Mini-OS.
  */
 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
-    int fd = alloc_fd(FTYPE_EVTCHN);
+    int fd;
+    struct file *file;
+    struct port_list *list;
 
-    if ( fd == -1 )
+    list = malloc(sizeof(*list));
+    if ( !list )
         return -1;
 
-    LIST_INIT(&files[fd].evtchn.ports);
+    fd = alloc_fd(ftype_evtchn);
+    file = get_file_from_fd(fd);
+
+    if ( !file )
+    {
+        free(list);
+        return -1;
+    }
+
+    file->dev = list;
+    LIST_INIT(list);
     xce->fd = fd;
     printf("evtchn_open() -> %d\n", fd);
 
@@ -104,12 +154,9 @@ int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 
 void minios_evtchn_close_fd(int fd)
 {
-    struct evtchn_port_info *port_info, *tmp;
+    struct file *file = get_file_from_fd(fd);
 
-    LIST_FOREACH_SAFE(port_info, &files[fd].evtchn.ports, list, tmp)
-        port_dealloc(port_info);
-
-    files[fd].type = FTYPE_NONE;
+    evtchn_close_fd(file);
 }
 
 int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
@@ -129,42 +176,43 @@ int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
 
 static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
 {
-    int fd = (int)(intptr_t)data;
-    struct evtchn_port_info *port_info;
+    xenevtchn_handle *xce = data;
+    struct file *file = get_file_from_fd(xce->fd);
+    struct port_info *port_info;
+    struct port_list *port_list;
 
-    assert(files[fd].type == FTYPE_EVTCHN);
+    assert(file);
+    port_list = file->dev;
     mask_evtchn(port);
-    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
+    LIST_FOREACH(port_info, port_list, list)
     {
         if ( port_info->port == port )
             goto found;
     }
 
-    printk("Unknown port for handle %d\n", fd);
+    printk("Unknown port %d for handle %d\n", port, xce->fd);
     return;
 
  found:
-    port_info->pending = 1;
-    files[fd].read = 1;
+    port_info->pending = true;
+    file->read = true;
     wake_up(&event_queue);
 }
 
 xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
                                                       uint32_t domid)
 {
-    int fd = xce->fd;
-    struct evtchn_port_info *port_info;
+    struct port_info *port_info;
     int ret;
     evtchn_port_t port;
 
     assert(get_current() == main_thread);
-    port_info = port_alloc(fd);
+    port_info = port_alloc(xce);
     if ( port_info == NULL )
         return -1;
 
     printf("xenevtchn_bind_unbound_port(%d)", domid);
-    ret = evtchn_alloc_unbound(domid, evtchn_handler,
-                               (void *)(intptr_t)fd, &port);
+    ret = evtchn_alloc_unbound(domid, evtchn_handler, xce, &port);
     printf(" = %d\n", ret);
 
     if ( ret < 0 )
@@ -174,7 +222,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
         return -1;
     }
 
-    port_info->bound = 1;
+    port_info->bound = true;
     port_info->port = port;
     unmask_evtchn(port);
 
@@ -185,19 +233,18 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
                                                      uint32_t domid,
                                                      evtchn_port_t remote_port)
 {
-    int fd = xce->fd;
-    struct evtchn_port_info *port_info;
+    struct port_info *port_info;
     evtchn_port_t local_port;
     int ret;
 
     assert(get_current() == main_thread);
-    port_info = port_alloc(fd);
+    port_info = port_alloc(xce);
     if ( port_info == NULL )
         return -1;
 
     printf("xenevtchn_bind_interdomain(%d, %"PRId32")", domid, remote_port);
     ret = evtchn_bind_interdomain(domid, remote_port, evtchn_handler,
-                                  (void *)(intptr_t)fd, &local_port);
+                                  xce, &local_port);
     printf(" = %d\n", ret);
 
     if ( ret < 0 )
@@ -207,7 +254,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
         return -1;
     }
 
-    port_info->bound = 1;
+    port_info->bound = true;
     port_info->port = local_port;
     unmask_evtchn(local_port);
 
@@ -217,9 +264,11 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
 int xenevtchn_unbind(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
-    struct evtchn_port_info *port_info;
+    struct file *file = get_file_from_fd(fd);
+    struct port_info *port_info;
+    struct port_list *port_list = file->dev;
 
-    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
+    LIST_FOREACH(port_info, port_list, list)
     {
         if ( port_info->port == port )
         {
@@ -238,17 +287,16 @@ int xenevtchn_unbind(xenevtchn_handle *xce, evtchn_port_t port)
 xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
                                               unsigned int virq)
 {
-    int fd = xce->fd;
-    struct evtchn_port_info *port_info;
+    struct port_info *port_info;
     evtchn_port_t port;
 
     assert(get_current() == main_thread);
-    port_info = port_alloc(fd);
+    port_info = port_alloc(xce);
     if ( port_info == NULL )
         return -1;
 
     printf("xenevtchn_bind_virq(%d)", virq);
-    port = bind_virq(virq, evtchn_handler, (void *)(intptr_t)fd);
+    port = bind_virq(virq, evtchn_handler, xce);
     printf(" = %d\n", port);
 
     if ( port < 0 )
@@ -258,7 +306,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
         return -1;
     }
 
-    port_info->bound = 1;
+    port_info->bound = true;
     port_info->port = port;
     unmask_evtchn(port);
 
@@ -267,27 +315,28 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
 
 xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 {
-    int fd = xce->fd;
-    struct evtchn_port_info *port_info;
+    struct file *file = get_file_from_fd(xce->fd);
+    struct port_info *port_info;
+    struct port_list *port_list = file->dev;
     unsigned long flags;
     evtchn_port_t ret = -1;
 
     local_irq_save(flags);
 
-    files[fd].read = 0;
+    file->read = false;
 
-    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
+    LIST_FOREACH(port_info, port_list, list)
     {
         if ( port_info->port != -1 && port_info->pending )
         {
             if ( ret == -1 )
             {
                 ret = port_info->port;
-                port_info->pending = 0;
+                port_info->pending = false;
             }
             else
             {
-                files[fd].read = 1;
+                file->read = true;
                 break;
             }
         }
-- 
2.26.2


