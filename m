Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474E48B086
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255867.438741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Iox-00030Q-66; Tue, 11 Jan 2022 15:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255867.438741; Tue, 11 Jan 2022 15:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Iow-0002y3-Vx; Tue, 11 Jan 2022 15:12:22 +0000
Received: by outflank-mailman (input) for mailman id 255867;
 Tue, 11 Jan 2022 15:12:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Iou-0002Fv-VK
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:12:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd8042dd-72f0-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 16:12:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BC961F3B8;
 Tue, 11 Jan 2022 15:12:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5665A13DDD;
 Tue, 11 Jan 2022 15:12:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UNUCFFGe3WG8AwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:12:17 +0000
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
X-Inumbo-ID: dd8042dd-72f0-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTPeNHy0AVh7duIevs+xqjLxKhkGSrZIz5TiPB1taxY=;
	b=IRkL3v6k2KUYC2e1crbEs0Lw5Izu4d+fHlophfX9cPw76G/pbv0YqXKfbEwbqEysaBI8xa
	Q3Fo82RyLoSralVP088j9JE1wfo/qBNlvFtKyVN6d2H2Bhtkk/28Xo3pLB6EP57ilJhV0p
	4p7xRiGRrlwFAt+8mBeLO3eHtsG1gLM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 03/12] mini-os: use alloc_file_type() and get_file_from_fd() in xs
Date: Tue, 11 Jan 2022 16:12:06 +0100
Message-Id: <20220111151215.22955-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111151215.22955-1-jgross@suse.com>
References: <20220111151215.22955-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate the needed file type via alloc_file_type().

Instead of directly accessing the files[] array use get_file_from_fd().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h   |  3 +--
 lib/sys.c       | 18 --------------
 lib/xs.c        | 64 +++++++++++++++++++++++++++++++++++++------------
 xenbus/xenbus.c |  1 +
 4 files changed, 51 insertions(+), 35 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 283abb8..05c7de5 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -167,8 +167,7 @@ void sanity_check(void);
 #define FTYPE_BLK        9
 #define FTYPE_TPMFRONT  10
 #define FTYPE_TPM_TIS   11
-#define FTYPE_XENBUS    12
-#define FTYPE_N         13
+#define FTYPE_N         12
 #define FTYPE_SPARE     16
 
 typedef int file_read_func(int fd, void *buf, size_t nbytes);
diff --git a/lib/sys.c b/lib/sys.c
index 9540410..d213ae5 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -495,11 +495,6 @@ int close(int fd)
     switch (files[fd].type) {
         default:
             break;
-#ifdef CONFIG_XENBUS
-	case FTYPE_XENBUS:
-            xs_daemon_close((void*)(intptr_t) fd);
-            break;
-#endif
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET:
 	    res = lwip_close(files[fd].fd);
@@ -712,7 +707,6 @@ int closedir(DIR *dir)
 static const char *file_types[] = {
     [FTYPE_NONE]    = "none",
     [FTYPE_CONSOLE] = "console",
-    [FTYPE_XENBUS]  = "xenbus",
     [FTYPE_SOCKET]  = "socket",
     [FTYPE_TAP]     = "net",
     [FTYPE_BLK]     = "blk",
@@ -892,18 +886,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
                 n++;
 	    FD_CLR(i, exceptfds);
 	    break;
-#ifdef CONFIG_XENBUS
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
index 4af0f96..ac830d2 100644
--- a/lib/xs.c
+++ b/lib/xs.c
@@ -18,23 +18,55 @@ static inline int _xs_fileno(struct xs_handle *h) {
     return (intptr_t) h;
 }
 
+static int xs_close_fd(int fd)
+{
+    struct xenbus_event *event, *next;
+    struct file *file = get_file_from_fd(fd);
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
+static bool xs_can_read(int fd)
+{
+    struct file *file = get_file_from_fd(fd);
+
+    return file && file->dev;
+}
+
+static struct file_ops xenbus_ops = {
+    .name = "xenbus",
+    .close = xs_close_fd,
+    .select_rd = xs_can_read,
+};
+
 struct xs_handle *xs_daemon_open()
 {
-    int fd = alloc_fd(FTYPE_XENBUS);
-    files[fd].dev = NULL;
-    printk("xs_daemon_open -> %d, %p\n", fd, &files[fd].dev);
+    int fd;
+    struct file *file;
+    static unsigned int ftype_xenbus;
+
+    if ( !ftype_xenbus )
+        ftype_xenbus = alloc_file_type(&xenbus_ops);
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
@@ -169,18 +201,20 @@ char **xs_directory(struct xs_handle *h, xs_transaction_t t,
 
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
index b687678..785389f 100644
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


