Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60A4875A7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 11:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254338.436093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mbA-0001h6-SC; Fri, 07 Jan 2022 10:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254338.436093; Fri, 07 Jan 2022 10:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mbA-0001dd-Lb; Fri, 07 Jan 2022 10:35:52 +0000
Received: by outflank-mailman (input) for mailman id 254338;
 Fri, 07 Jan 2022 10:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqIQ=RX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5mb8-0001Nm-CP
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 10:35:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9303a079-6fa5-11ec-81c0-a30af7de8005;
 Fri, 07 Jan 2022 11:35:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BE7D212BE;
 Fri,  7 Jan 2022 10:35:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75F8913CCC;
 Fri,  7 Jan 2022 10:35:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WLmRG4IX2GHvCwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Jan 2022 10:35:46 +0000
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
X-Inumbo-ID: 9303a079-6fa5-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641551746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExUV76bDon3vF2lqMKSHAUkh14TbcK4d/8FVqDba5Ig=;
	b=M3jeiL0CMrEcA3+HQepc8xZ3F50RdCcNW+HzdyaL/v6JKr9/XVHPXlbnrGedRNlIDZa2Mz
	qyxcZVbzcfdqXoGkHgznpsjBfSXcR0rsauxGazPCqqOuef7lYnzPQb7t3W+k06BGrnU3up
	a+onKW/qNa8X5ke77fW17yxHb6kvsdc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/2] tools/libs/evtchn: decouple more from mini-os
Date: Fri,  7 Jan 2022 11:35:43 +0100
Message-Id: <20220107103544.9271-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220107103544.9271-1-jgross@suse.com>
References: <20220107103544.9271-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mini-OS and libevtchn are using implementation details of each other.
Change that by letting libevtchn use the new get_file_from_fd()
function and the generic dev pointer of struct file from Mini-OS.

By using private struct declarations Mini-OS will be able to drop the
libevtchn specific definitions of struct evtchn_port_info and
evtchn_port_list in future.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/evtchn/minios.c | 82 +++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 24 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index e5dfdc5ef5..3305102f22 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -38,16 +38,27 @@
 
 #include "private.h"
 
+LIST_HEAD(port_list, port_info);
+
+struct port_info {
+    LIST_ENTRY(port_info) list;
+    evtchn_port_t port;
+    unsigned long pending;
+    int bound;
+};
+
 extern void minios_evtchn_close_fd(int fd);
 
 extern struct wait_queue_head event_queue;
 
 /* XXX Note: This is not threadsafe */
-static struct evtchn_port_info *port_alloc(int fd)
+static struct port_info *port_alloc(int fd)
 {
-    struct evtchn_port_info *port_info;
+    struct port_info *port_info;
+    struct file *file = get_file_from_fd(fd);
+    struct port_list *port_list = file->dev;
 
-    port_info = malloc(sizeof(struct evtchn_port_info));
+    port_info = malloc(sizeof(struct port_info));
     if ( port_info == NULL )
         return NULL;
 
@@ -55,12 +66,12 @@ static struct evtchn_port_info *port_alloc(int fd)
     port_info->port = -1;
     port_info->bound = 0;
 
-    LIST_INSERT_HEAD(&files[fd].evtchn.ports, port_info, list);
+    LIST_INSERT_HEAD(port_list, port_info, list);
 
     return port_info;
 }
 
-static void port_dealloc(struct evtchn_port_info *port_info)
+static void port_dealloc(struct port_info *port_info)
 {
     if ( port_info->bound )
         unbind_evtchn(port_info->port);
@@ -75,12 +86,25 @@ static void port_dealloc(struct evtchn_port_info *port_info)
  */
 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
-    int fd = alloc_fd(FTYPE_EVTCHN);
+    int fd;
+    struct file *file;
+    struct port_list *list;
+
+    list = malloc(sizeof(*list));
+    if ( !list )
+        return -1;
+
+    fd = alloc_fd(FTYPE_EVTCHN);
+    file = get_file_from_fd(fd);
 
-    if ( fd == -1 )
+    if ( !file )
+    {
+        free(list);
         return -1;
+    }
 
-    LIST_INIT(&files[fd].evtchn.ports);
+    file->dev = list;
+    LIST_INIT(list);
     xce->fd = fd;
     printf("evtchn_open() -> %d\n", fd);
 
@@ -104,12 +128,15 @@ int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 
 void minios_evtchn_close_fd(int fd)
 {
-    struct evtchn_port_info *port_info, *tmp;
+    struct port_info *port_info, *tmp;
+    struct file *file = get_file_from_fd(fd);
+    struct port_list *port_list = file->dev;
 
-    LIST_FOREACH_SAFE(port_info, &files[fd].evtchn.ports, list, tmp)
+    LIST_FOREACH_SAFE(port_info, port_list, list, tmp)
         port_dealloc(port_info);
+    free(port_list);
 
-    files[fd].type = FTYPE_NONE;
+    file->type = FTYPE_NONE;
 }
 
 int xenevtchn_fd(xenevtchn_handle *xce)
@@ -135,11 +162,14 @@ int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
 static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
 {
     int fd = (int)(intptr_t)data;
-    struct evtchn_port_info *port_info;
+    struct file *file = get_file_from_fd(fd);
+    struct port_info *port_info;
+    struct port_list *port_list;
 
-    assert(files[fd].type == FTYPE_EVTCHN);
+    assert(file && file->type == FTYPE_EVTCHN);
+    port_list = file->dev;
     mask_evtchn(port);
-    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
+    LIST_FOREACH(port_info, port_list, list)
     {
         if ( port_info->port == port )
             goto found;
@@ -150,7 +180,7 @@ static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
 
  found:
     port_info->pending = 1;
-    files[fd].read = 1;
+    file->read = 1;
     wake_up(&event_queue);
 }
 
@@ -158,7 +188,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
                                                       uint32_t domid)
 {
     int fd = xce->fd;
-    struct evtchn_port_info *port_info;
+    struct port_info *port_info;
     int ret;
     evtchn_port_t port;
 
@@ -191,7 +221,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
                                                      evtchn_port_t remote_port)
 {
     int fd = xce->fd;
-    struct evtchn_port_info *port_info;
+    struct port_info *port_info;
     evtchn_port_t local_port;
     int ret;
 
@@ -222,9 +252,11 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
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
@@ -244,7 +276,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
                                               unsigned int virq)
 {
     int fd = xce->fd;
-    struct evtchn_port_info *port_info;
+    struct port_info *port_info;
     evtchn_port_t port;
 
     assert(get_current() == main_thread);
@@ -273,15 +305,17 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
 xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 {
     int fd = xce->fd;
-    struct evtchn_port_info *port_info;
+    struct file *file = get_file_from_fd(fd);
+    struct port_info *port_info;
+    struct port_list *port_list = file->dev;
     unsigned long flags;
     evtchn_port_t ret = -1;
 
     local_irq_save(flags);
 
-    files[fd].read = 0;
+    file->read = 0;
 
-    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
+    LIST_FOREACH(port_info, port_list, list)
     {
         if ( port_info->port != -1 && port_info->pending )
         {
@@ -292,7 +326,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
             }
             else
             {
-                files[fd].read = 1;
+                file->read = 1;
                 break;
             }
         }
-- 
2.26.2


