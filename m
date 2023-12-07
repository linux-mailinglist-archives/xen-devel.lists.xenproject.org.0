Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A28080A3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 07:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649553.1014179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB7pf-0008G7-JH; Thu, 07 Dec 2023 06:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649553.1014179; Thu, 07 Dec 2023 06:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB7pf-0008DS-GW; Thu, 07 Dec 2023 06:25:59 +0000
Received: by outflank-mailman (input) for mailman id 649553;
 Thu, 07 Dec 2023 06:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZW7A=HS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rB7pe-0008DM-87
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 06:25:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a9c23e9-94c9-11ee-98e6-6d05b1d4d9a1;
 Thu, 07 Dec 2023 07:25:56 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9988121DE6;
 Thu,  7 Dec 2023 06:25:55 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 654FD139E3;
 Thu,  7 Dec 2023 06:25:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id U5gOF3NlcWW/EgAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 07 Dec 2023 06:25:55 +0000
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
X-Inumbo-ID: 7a9c23e9-94c9-11ee-98e6-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools/libs/evtchn: replace assert()s in stubdom with proper locking
Date: Thu,  7 Dec 2023 07:25:51 +0100
Message-Id: <20231207062551.19825-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***************
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 NEURAL_HAM_LONG(-0.99)[-0.986];
	 RCVD_COUNT_THREE(0.00)[3];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.17)[-0.852];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[99.99%]
X-Spam-Score: 15.00
X-Rspamd-Queue-Id: 9988121DE6
X-Spam-Flag: YES
X-Spam: Yes

In tools/libs/evtchn/minios.c there are assert()s for the current
thread being the main thread when binding an event channel.

As Mini-OS is supporting multiple threads, there is no real reason
why the binding shouldn't be allowed to happen in any other thread.

Drop the assert()s and replace them with proper locking of the
port_list.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add locking (Jason Andryuk)
---
 tools/libs/evtchn/minios.c | 79 ++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 25 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 28743cb055..c807e17f55 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -25,6 +25,7 @@
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
 #include <mini-os/events.h>
+#include <mini-os/semaphore.h>
 #include <mini-os/wait.h>
 
 #include <assert.h>
@@ -40,6 +41,11 @@
 
 XEN_LIST_HEAD(port_list, struct port_info);
 
+struct ports {
+    struct port_list list;
+    struct semaphore sem;
+};
+
 struct port_info {
     XEN_LIST_ENTRY(struct port_info) list;
     evtchn_port_t port;
@@ -47,12 +53,11 @@ struct port_info {
     bool bound;
 };
 
-/* XXX Note: This is not threadsafe */
 static struct port_info *port_alloc(xenevtchn_handle *xce)
 {
     struct port_info *port_info;
     struct file *file = get_file_from_fd(xce->fd);
-    struct port_list *port_list = file->dev;
+    struct ports *ports = file->dev;
 
     port_info = malloc(sizeof(struct port_info));
     if ( port_info == NULL )
@@ -62,7 +67,9 @@ static struct port_info *port_alloc(xenevtchn_handle *xce)
     port_info->port = -1;
     port_info->bound = false;
 
-    XEN_LIST_INSERT_HEAD(port_list, port_info, list);
+    down(&ports->sem);
+    XEN_LIST_INSERT_HEAD(&ports->list, port_info, list);
+    up(&ports->sem);
 
     return port_info;
 }
@@ -79,11 +86,12 @@ static void port_dealloc(struct port_info *port_info)
 static int evtchn_close_fd(struct file *file)
 {
     struct port_info *port_info, *tmp;
-    struct port_list *port_list = file->dev;
+    struct ports *ports = file->dev;
 
-    XEN_LIST_FOREACH_SAFE(port_info, port_list, list, tmp)
+    XEN_LIST_FOREACH_SAFE(port_info, &ports->list, list, tmp)
         port_dealloc(port_info);
-    free(port_list);
+
+    free(ports);
 
     return 0;
 }
@@ -110,10 +118,10 @@ int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
     int fd;
     struct file *file;
-    struct port_list *list;
+    struct ports *ports;
 
-    list = malloc(sizeof(*list));
-    if ( !list )
+    ports = malloc(sizeof(*ports));
+    if ( !ports )
         return -1;
 
     fd = alloc_fd(ftype_evtchn);
@@ -121,12 +129,13 @@ int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 
     if ( !file )
     {
-        free(list);
+        free(ports);
         return -1;
     }
 
-    file->dev = list;
-    XEN_LIST_INIT(list);
+    file->dev = ports;
+    XEN_LIST_INIT(&ports->list);
+    init_SEMAPHORE(&ports->sem, 1);
     xce->fd = fd;
     printf("evtchn_open() -> %d\n", fd);
 
@@ -168,16 +177,22 @@ static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
     xenevtchn_handle *xce = data;
     struct file *file = get_file_from_fd(xce->fd);
     struct port_info *port_info;
-    struct port_list *port_list;
+    struct ports *ports;
 
     assert(file);
-    port_list = file->dev;
+    ports = file->dev;
     mask_evtchn(port);
-    XEN_LIST_FOREACH(port_info, port_list, list)
+
+    down(&ports->sem);
+    XEN_LIST_FOREACH(port_info, &ports->list, list)
     {
         if ( port_info->port == port )
+        {
+            up(&ports->sem);
             goto found;
+        }
     }
+    up(&ports->sem);
 
     printk("Unknown port %d for handle %d\n", port, xce->fd);
     return;
@@ -188,6 +203,16 @@ static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
     wake_up(&event_queue);
 }
 
+static void port_remove(xenevtchn_handle *xce, struct port_info *port_info)
+{
+    struct file *file = get_file_from_fd(xce->fd);
+    struct ports *ports = file->dev;
+
+    down(&ports->sem);
+    port_dealloc(port_info);
+    up(&ports->sem);
+}
+
 xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
                                                       uint32_t domid)
 {
@@ -195,7 +220,6 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
     int ret;
     evtchn_port_t port;
 
-    assert(get_current() == main_thread);
     port_info = port_alloc(xce);
     if ( port_info == NULL )
         return -1;
@@ -206,7 +230,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port(xenevtchn_handle *xce,
 
     if ( ret < 0 )
     {
-        port_dealloc(port_info);
+        port_remove(xce, port_info);
         errno = -ret;
         return -1;
     }
@@ -226,7 +250,6 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
     evtchn_port_t local_port;
     int ret;
 
-    assert(get_current() == main_thread);
     port_info = port_alloc(xce);
     if ( port_info == NULL )
         return -1;
@@ -238,7 +261,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_interdomain(xenevtchn_handle *xce,
 
     if ( ret < 0 )
     {
-        port_dealloc(port_info);
+        port_remove(xce, port_info);
         errno = -ret;
         return -1;
     }
@@ -255,16 +278,19 @@ int xenevtchn_unbind(xenevtchn_handle *xce, evtchn_port_t port)
     int fd = xce->fd;
     struct file *file = get_file_from_fd(fd);
     struct port_info *port_info;
-    struct port_list *port_list = file->dev;
+    struct ports *ports = file->dev;
 
-    XEN_LIST_FOREACH(port_info, port_list, list)
+    down(&ports->sem);
+    XEN_LIST_FOREACH(port_info, &ports->list, list)
     {
         if ( port_info->port == port )
         {
             port_dealloc(port_info);
+            up(&ports->sem);
             return 0;
         }
     }
+    up(&ports->sem);
 
     printf("Warning: couldn't find port %"PRId32" for xc handle %x\n",
            port, fd);
@@ -279,7 +305,6 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
     struct port_info *port_info;
     evtchn_port_t port;
 
-    assert(get_current() == main_thread);
     port_info = port_alloc(xce);
     if ( port_info == NULL )
         return -1;
@@ -290,7 +315,7 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
 
     if ( port < 0 )
     {
-        port_dealloc(port_info);
+        port_remove(xce, port_info);
         errno = -port;
         return -1;
     }
@@ -306,15 +331,17 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 {
     struct file *file = get_file_from_fd(xce->fd);
     struct port_info *port_info;
-    struct port_list *port_list = file->dev;
+    struct ports *ports = file->dev;
     unsigned long flags;
     evtchn_port_t ret = -1;
 
+    down(&ports->sem);
+
     local_irq_save(flags);
 
     file->read = false;
 
-    XEN_LIST_FOREACH(port_info, port_list, list)
+    XEN_LIST_FOREACH(port_info, &ports->list, list)
     {
         if ( port_info->port != -1 && port_info->pending )
         {
@@ -333,6 +360,8 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 
     local_irq_restore(flags);
 
+    up(&ports->sem);
+
     return ret;
 }
 
-- 
2.35.3


