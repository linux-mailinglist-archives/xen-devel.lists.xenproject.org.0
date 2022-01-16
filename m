Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB748FBAF
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257827.443237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yp-00019F-Un; Sun, 16 Jan 2022 08:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257827.443237; Sun, 16 Jan 2022 08:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yp-000145-DC; Sun, 16 Jan 2022 08:33:39 +0000
Received: by outflank-mailman (input) for mailman id 257827;
 Sun, 16 Jan 2022 08:33:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90ym-0008IP-Ot
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc5c7437-76a6-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:33:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 24AED219C7;
 Sun, 16 Jan 2022 08:33:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEDB31346A;
 Sun, 16 Jan 2022 08:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gFAeOVrY42HyFQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:33:30 +0000
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
X-Inumbo-ID: fc5c7437-76a6-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BA1FXffCj1pRX9eT2SPzxm7/juZIBKAdcFoxvIMicZM=;
	b=p2M7YRDOPXHlt5FZ7r0mAq2b0Nt69Rb574mg1OrScenyE0vv73xEFn8qZ2lnkAwV6L9w4o
	NPamkQW6L776NZGmgt628jaUlrzJ6T+R49bG1iL7Hda0EqkYGGc+tOItb56DTjAmx2N7Im
	J8urN7vxH3savtG1N9kPKesKhVjNwj4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 03/12] use alloc_file_type() and get_file_from_fd() in xs
Date: Sun, 16 Jan 2022 09:33:19 +0100
Message-Id: <20220116083328.26524-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate the needed file type via alloc_file_type().

Instead of directly accessing the files[] array use get_file_from_fd().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- switch to struct file * parameter for callbacks
- use __attribute__((constructor))
---
 include/lib.h   |  3 +--
 lib/sys.c       | 18 --------------
 lib/xs.c        | 65 +++++++++++++++++++++++++++++++++++++------------
 xenbus/xenbus.c |  1 +
 4 files changed, 52 insertions(+), 35 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 5838b0d4..c5e47786 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -169,8 +169,7 @@ extern struct wait_queue_head event_queue;
 #define FTYPE_BLK        9
 #define FTYPE_TPMFRONT  10
 #define FTYPE_TPM_TIS   11
-#define FTYPE_XENBUS    12
-#define FTYPE_N         13
+#define FTYPE_N         12
 #define FTYPE_SPARE     16
 
 struct file {
diff --git a/lib/sys.c b/lib/sys.c
index 6ba26294..53870aa4 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -523,11 +523,6 @@ int close(int fd)
     switch (file->type) {
         default:
             break;
-#ifdef CONFIG_LIBXS
-	case FTYPE_XENBUS:
-            xs_daemon_close((void*)(intptr_t) fd);
-            break;
-#endif
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET:
             res = lwip_close(files[fd].fd);
@@ -759,7 +754,6 @@ int closedir(DIR *dir)
 static const char *const file_types[] = {
     [FTYPE_NONE]    = "none",
     [FTYPE_CONSOLE] = "console",
-    [FTYPE_XENBUS]  = "xenbus",
     [FTYPE_SOCKET]  = "socket",
     [FTYPE_TAP]     = "net",
     [FTYPE_BLK]     = "blk",
@@ -947,18 +941,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
                 n++;
 	    FD_CLR(i, exceptfds);
 	    break;
-#ifdef CONFIG_LIBXS
-	case FTYPE_XENBUS:
-	    if (FD_ISSET(i, readfds)) {
-                if (files[i].dev)
-		    n++;
-		else
-		    FD_CLR(i, readfds);
-	    }
-	    FD_CLR(i, writefds);
-	    FD_CLR(i, exceptfds);
-	    break;
-#endif
 	case FTYPE_TAP:
 	case FTYPE_BLK:
 	case FTYPE_KBD:
diff --git a/lib/xs.c b/lib/xs.c
index 4af0f960..c12341aa 100644
--- a/lib/xs.c
+++ b/lib/xs.c
@@ -18,23 +18,56 @@ static inline int _xs_fileno(struct xs_handle *h) {
     return (intptr_t) h;
 }
 
+static int xs_close_fd(struct file *file)
+{
+    struct xenbus_event *event, *next;
+
+    for (event = file->dev; event; event = next)
+    {
+        next = event->next;
+        free(event);
+    }
+
+    return 0;
+}
+
+static bool xs_can_read(struct file *file)
+{
+    return file && file->dev;
+}
+
+static const struct file_ops xenbus_ops = {
+    .name = "xenbus",
+    .close = xs_close_fd,
+    .select_rd = xs_can_read,
+};
+
+static unsigned int ftype_xenbus;
+
+__attribute__((constructor))
+static void xs_initialize(void)
+{
+    ftype_xenbus = alloc_file_type(&xenbus_ops);
+}
+
 struct xs_handle *xs_daemon_open()
 {
-    int fd = alloc_fd(FTYPE_XENBUS);
-    files[fd].dev = NULL;
-    printk("xs_daemon_open -> %d, %p\n", fd, &files[fd].dev);
+    int fd;
+    struct file *file;
+
+    fd = alloc_fd(ftype_xenbus);
+    file = get_file_from_fd(fd);
+    if ( !file )
+        return NULL;
+
+    file->dev = NULL;
+    printk("xs_daemon_open -> %d, %p\n", fd, &file->dev);
     return (void*)(intptr_t) fd;
 }
 
 void xs_daemon_close(struct xs_handle *h)
 {
-    int fd = _xs_fileno(h);
-    struct xenbus_event *event, *next;
-    for (event = files[fd].dev; event; event = next)
-    {
-        next = event->next;
-        free(event);
-    }
+    close(_xs_fileno(h));
 }
 
 int xs_fileno(struct xs_handle *h)
@@ -169,18 +202,20 @@ char **xs_directory(struct xs_handle *h, xs_transaction_t t,
 
 bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 {
-    int fd = _xs_fileno(h);
+    struct file *file = get_file_from_fd(_xs_fileno(h));
+
     printk("xs_watch(%s, %s)\n", path, token);
     return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token,
-                   (xenbus_event_queue *)&files[fd].dev));
+                   (xenbus_event_queue *)&file->dev));
 }
 
 char **xs_read_watch(struct xs_handle *h, unsigned int *num)
 {
-    int fd = _xs_fileno(h);
     struct xenbus_event *event;
-    event = files[fd].dev;
-    files[fd].dev = event->next;
+    struct file *file = get_file_from_fd(_xs_fileno(h));
+
+    event = file->dev;
+    file->dev = event->next;
     printk("xs_read_watch() -> %s %s\n", event->path, event->token);
     *num = 2;
     return (char **) &event->path;
diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
index b687678f..785389fb 100644
--- a/xenbus/xenbus.c
+++ b/xenbus/xenbus.c
@@ -393,6 +393,7 @@ static int allocate_xenbus_id(void)
 void init_xenbus(void)
 {
     int err;
+
     DEBUG("init_xenbus called.\n");
     create_thread("xenstore", xenbus_thread_func, NULL);
     DEBUG("buf at %p.\n", xenstore_buf);
-- 
2.26.2


