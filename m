Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD7E80C1A8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 08:11:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651488.1017165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCaQt-00015f-Fb; Mon, 11 Dec 2023 07:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651488.1017165; Mon, 11 Dec 2023 07:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCaQt-00012t-Cx; Mon, 11 Dec 2023 07:10:27 +0000
Received: by outflank-mailman (input) for mailman id 651488;
 Mon, 11 Dec 2023 07:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g7EY=HW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCaQr-00012k-Nm
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 07:10:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59acdb7a-97f4-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 08:10:24 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43681221C8;
 Mon, 11 Dec 2023 07:10:22 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 135E6138FF;
 Mon, 11 Dec 2023 07:10:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id xYBgA961dmUvdgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 11 Dec 2023 07:10:22 +0000
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
X-Inumbo-ID: 59acdb7a-97f4-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702278622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GCO6k+P750qbUTWPFT2od1dSN0T/kJ4b8bU4dSmdUDw=;
	b=qmlp40tI5QtYkYVEpeViGidCuqQXxmOxLueGJXRX88KD8knRuZeVOAL0wEG/bBSbiuPEBV
	QXOd3eqko5ayM0jWjA05ivoZtK57M91ZwtuPGuEJd2BfCf1nX/p8/qiAf5rzdgT7lT++lG
	Qw5TeYWV7mG91JmJzi0TVvlQ06dxAbw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702278622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GCO6k+P750qbUTWPFT2od1dSN0T/kJ4b8bU4dSmdUDw=;
	b=qmlp40tI5QtYkYVEpeViGidCuqQXxmOxLueGJXRX88KD8knRuZeVOAL0wEG/bBSbiuPEBV
	QXOd3eqko5ayM0jWjA05ivoZtK57M91ZwtuPGuEJd2BfCf1nX/p8/qiAf5rzdgT7lT++lG
	Qw5TeYWV7mG91JmJzi0TVvlQ06dxAbw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/libs/evtchn: fix locking in Mini-OS
Date: Mon, 11 Dec 2023 08:10:17 +0100
Message-Id: <20231211071017.27752-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.998];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[99.99%]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: 0.70
Authentication-Results: smtp-out1.suse.de;
	none

When adding locking to tools/libs/evtchn/minios.c a semaphore was
used. This can result in deadlocks, as the lock is taken inside the
event handler, which can interrupt an already locked region.

The fix is rather simple, as Mini-OS is supporting a single vcpu
only. So instead of the semaphore it is enough to disable interrupts
when operating on the port list.

Fixes: bc4fe94a69d4 ("ools/libs/evtchn: replace assert()s in stubdom with proper locking")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/evtchn/minios.c | 45 +++++++++++++-------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index c807e17f55..046cd28d37 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -25,7 +25,6 @@
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
 #include <mini-os/events.h>
-#include <mini-os/semaphore.h>
 #include <mini-os/wait.h>
 
 #include <assert.h>
@@ -43,7 +42,6 @@ XEN_LIST_HEAD(port_list, struct port_info);
 
 struct ports {
     struct port_list list;
-    struct semaphore sem;
 };
 
 struct port_info {
@@ -58,6 +56,7 @@ static struct port_info *port_alloc(xenevtchn_handle *xce)
     struct port_info *port_info;
     struct file *file = get_file_from_fd(xce->fd);
     struct ports *ports = file->dev;
+    unsigned long flags;
 
     port_info = malloc(sizeof(struct port_info));
     if ( port_info == NULL )
@@ -67,19 +66,24 @@ static struct port_info *port_alloc(xenevtchn_handle *xce)
     port_info->port = -1;
     port_info->bound = false;
 
-    down(&ports->sem);
+    local_irq_save(flags);
     XEN_LIST_INSERT_HEAD(&ports->list, port_info, list);
-    up(&ports->sem);
+    local_irq_restore(flags);
 
     return port_info;
 }
 
 static void port_dealloc(struct port_info *port_info)
 {
+    unsigned long flags;
+
     if ( port_info->bound )
         unbind_evtchn(port_info->port);
 
+    local_irq_save(flags);
     XEN_LIST_REMOVE(port_info, list);
+    local_irq_restore(flags);
+
     free(port_info);
 }
 
@@ -135,7 +139,6 @@ int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 
     file->dev = ports;
     XEN_LIST_INIT(&ports->list);
-    init_SEMAPHORE(&ports->sem, 1);
     xce->fd = fd;
     printf("evtchn_open() -> %d\n", fd);
 
@@ -183,16 +186,11 @@ static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
     ports = file->dev;
     mask_evtchn(port);
 
-    down(&ports->sem);
     XEN_LIST_FOREACH(port_info, &ports->list, list)
     {
         if ( port_info->port == port )
-        {
-            up(&ports->sem);
             goto found;
-        }
     }
-    up(&ports->sem);
 
     printk("Unknown port %d for handle %d\n", port, xce->fd);
     return;
@@ -203,16 +201,6 @@ static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
     wake_up(&event_queue);
 }
 
-static void port_remove(xenevtchn_handle *xce, struct port_info *port_info)
-{
-    struct file *file = get_file_from_fd(xce->fd);
-    struct ports *ports = file->dev;
-
-    down(&ports->sem);
-    port_dealloc(port_info);
-    up(&ports->sem);
-}
-
 xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
                                                       uint32_t domid)
 {
@@ -230,7 +218,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
 
     if ( ret < 0 )
     {
-        port_remove(xce, port_info);
+        port_dealloc(port_info);
         errno = -ret;
         return -1;
     }
@@ -261,7 +249,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
 
     if ( ret < 0 )
     {
-        port_remove(xce, port_info);
+        port_dealloc(port_info);
         errno = -ret;
         return -1;
     }
@@ -279,18 +267,19 @@ int xenevtchn_unbind(xenevtchn_handle *xce, evtchn_port_t port)
     struct file *file = get_file_from_fd(fd);
     struct port_info *port_info;
     struct ports *ports = file->dev;
+    unsigned long flags;
 
-    down(&ports->sem);
+    local_irq_save(flags);
     XEN_LIST_FOREACH(port_info, &ports->list, list)
     {
         if ( port_info->port == port )
         {
             port_dealloc(port_info);
-            up(&ports->sem);
+            local_irq_restore(flags);
             return 0;
         }
     }
-    up(&ports->sem);
+    local_irq_restore(flags);
 
     printf("Warning: couldn't find port %"PRId32" for xc handle %x\n",
            port, fd);
@@ -315,7 +304,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
 
     if ( port < 0 )
     {
-        port_remove(xce, port_info);
+        port_dealloc(port_info);
         errno = -port;
         return -1;
     }
@@ -335,8 +324,6 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
     unsigned long flags;
     evtchn_port_t ret = -1;
 
-    down(&ports->sem);
-
     local_irq_save(flags);
 
     file->read = false;
@@ -360,8 +347,6 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 
     local_irq_restore(flags);
 
-    up(&ports->sem);
-
     return ret;
 }
 
-- 
2.35.3


