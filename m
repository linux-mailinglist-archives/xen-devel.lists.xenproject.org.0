Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC848FBC0
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257841.443323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9122-0006c5-Es; Sun, 16 Jan 2022 08:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257841.443323; Sun, 16 Jan 2022 08:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9122-0006ZI-BG; Sun, 16 Jan 2022 08:36:58 +0000
Received: by outflank-mailman (input) for mailman id 257841;
 Sun, 16 Jan 2022 08:36:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90ys-0008IP-Pp
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf64275-76a6-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:33:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27B76219A8;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFD8113AB5;
 Sun, 16 Jan 2022 08:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8IJYOVvY42HyFQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:33:31 +0000
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
X-Inumbo-ID: fcf64275-76a6-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EyEnGVB5vj2rXALZOQkxMfap/9vtF59SnM7EBGmKPBU=;
	b=XTt8ZgVkevEntWYLIy95AiISyMPJcQd+OeXPsM85X6QLSBshhnH7Lk7XZHaeT0mJOsl+bo
	VZbvoXtK6Y2pb/4KCflxof1UPEAEFsACyvVP9Bl59o2J2FQHjpF5U2kD96+bBON7wabze6
	C5BGQKzQ1e+KX9SbXApJT2Q2RzCERNg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 08/12] use alloc_file_type() and get_file_from_fd() in fbfront
Date: Sun, 16 Jan 2022 09:33:24 +0100
Message-Id: <20220116083328.26524-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate file types dynamically via alloc_file_type().

Instead of directly accessing the files[] array use get_file_from_fd().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- switch to struct file * parameter for callbacks
- use __attribute__((constructor))
---
 fbfront.c     | 127 ++++++++++++++++++++++++++++++++++++++++++--------
 include/lib.h |   4 +-
 lib/sys.c     |  47 -------------------
 3 files changed, 108 insertions(+), 70 deletions(-)

diff --git a/fbfront.c b/fbfront.c
index 1e055fb0..360a9cf6 100644
--- a/fbfront.c
+++ b/fbfront.c
@@ -14,6 +14,9 @@
 #include <mini-os/xmalloc.h>
 #include <mini-os/fbfront.h>
 #include <mini-os/lib.h>
+#ifdef HAVE_LIBC
+#include <errno.h>
+#endif
 
 DECLARE_WAIT_QUEUE_HEAD(kbdfront_queue);
 
@@ -42,10 +45,10 @@ void kbdfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
 {
 #ifdef HAVE_LIBC
     struct kbdfront_dev *dev = data;
-    int fd = dev->fd;
+    struct file *file = get_file_from_fd(dev->fd);
 
-    if (fd != -1)
-        files[fd].read = true;
+    if ( file )
+        file->read = true;
 #endif
     wake_up(&kbdfront_queue);
 }
@@ -204,10 +207,12 @@ int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n
     struct xenkbd_page *page = dev->page;
     uint32_t prod, cons;
     int i;
-
 #ifdef HAVE_LIBC
-    if (dev->fd != -1) {
-        files[dev->fd].read = false;
+    struct file *file = get_file_from_fd(dev->fd);
+
+    if ( file )
+    {
+        file->read = false;
         mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
     }
 #endif
@@ -227,9 +232,9 @@ int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n
     notify_remote_via_evtchn(dev->evtchn);
 
 #ifdef HAVE_LIBC
-    if (cons != prod && dev->fd != -1)
+    if ( cons != prod && file )
         /* still some events to read */
-        files[dev->fd].read = true;
+        file->read = true;
 #endif
 
     return i;
@@ -298,11 +303,51 @@ close_kbdfront:
 }
 
 #ifdef HAVE_LIBC
+static int kbd_read(struct file *file, void *buf, size_t nbytes)
+{
+    int ret, n;
+
+    n = nbytes / sizeof(union xenkbd_in_event);
+    ret = kbdfront_receive(file->dev, buf, n);
+    if ( ret <= 0 )
+    {
+        errno = EAGAIN;
+        return -1;
+    }
+
+    return ret * sizeof(union xenkbd_in_event);
+}
+
+static int kbd_close_fd(struct file *file)
+{
+    shutdown_kbdfront(file->dev);
+
+    return 0;
+}
+
+static struct file_ops kbd_ops = {
+    .name = "kbd",
+    .read = kbd_read,
+    .close = kbd_close_fd,
+    .select_rd = select_read_flag,
+};
+
+static unsigned int ftype_kbd;
+
+__attribute__((constructor))
+static void kbdfront_initialize(void)
+{
+    ftype_kbd = alloc_file_type(&kbd_ops);
+}
+
 int kbdfront_open(struct kbdfront_dev *dev)
 {
-    dev->fd = alloc_fd(FTYPE_KBD);
+    struct file *file;
+
+    dev->fd = alloc_fd(ftype_kbd);
     printk("kbd_open(%s) -> %d\n", dev->nodename, dev->fd);
-    files[dev->fd].dev = dev;
+    file = get_file_from_fd(dev->fd);
+    file->dev = dev;
     return dev->fd;
 }
 #endif
@@ -346,10 +391,10 @@ void fbfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
 {
 #ifdef HAVE_LIBC
     struct fbfront_dev *dev = data;
-    int fd = dev->fd;
+    struct file *file = get_file_from_fd(dev->fd);
 
-    if (fd != -1)
-        files[fd].read = true;
+    if ( file )
+        file->read = true;
 #endif
     wake_up(&fbfront_queue);
 }
@@ -373,10 +418,12 @@ int fbfront_receive(struct fbfront_dev *dev, union xenfb_in_event *buf, int n)
     struct xenfb_page *page = dev->page;
     uint32_t prod, cons;
     int i;
-
 #ifdef HAVE_LIBC
-    if (dev->fd != -1) {
-        files[dev->fd].read = false;
+    struct file *file = get_file_from_fd(dev->fd);
+
+    if ( file )
+    {
+        file->read = false;
         mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
     }
 #endif
@@ -396,9 +443,9 @@ int fbfront_receive(struct fbfront_dev *dev, union xenfb_in_event *buf, int n)
     notify_remote_via_evtchn(dev->evtchn);
 
 #ifdef HAVE_LIBC
-    if (cons != prod && dev->fd != -1)
+    if ( cons != prod && file )
         /* still some events to read */
-        files[dev->fd].read = true;
+        file->read = true;
 #endif
 
     return i;
@@ -699,11 +746,51 @@ close_fbfront:
 }
 
 #ifdef HAVE_LIBC
+static int fbfront_read(struct file *file, void *buf, size_t nbytes)
+{
+    int ret, n;
+
+    n = nbytes / sizeof(union xenfb_in_event);
+    ret = fbfront_receive(file->dev, buf, n);
+    if ( ret <= 0 )
+    {
+        errno = EAGAIN;
+        return -1;
+    }
+
+    return ret * sizeof(union xenfb_in_event);
+}
+
+static int fbfront_close_fd(struct file *file)
+{
+    shutdown_fbfront(file->dev);
+
+    return 0;
+}
+
+static const struct file_ops fb_ops = {
+    .name = "fb",
+    .read = fbfront_read,
+    .close = fbfront_close_fd,
+    .select_rd = select_read_flag,
+};
+
+static unsigned int ftype_fb;
+
+__attribute__((constructor))
+static void fbfront_initialize(void)
+{
+    ftype_fb = alloc_file_type(&fb_ops);
+}
+
 int fbfront_open(struct fbfront_dev *dev)
 {
-    dev->fd = alloc_fd(FTYPE_FB);
+    struct file *file;
+
+    dev->fd = alloc_fd(ftype_fb);
     printk("fb_open(%s) -> %d\n", dev->nodename, dev->fd);
-    files[dev->fd].dev = dev;
+    file = get_file_from_fd(dev->fd);
+    file->dev = dev;
     return dev->fd;
 }
 #endif
diff --git a/include/lib.h b/include/lib.h
index b0d08807..b1beeed3 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -163,9 +163,7 @@ extern struct wait_queue_head event_queue;
 #define FTYPE_SOCKET     3
 #define FTYPE_MEM        4
 #define FTYPE_SAVEFILE   5
-#define FTYPE_FB         6
-#define FTYPE_KBD        7
-#define FTYPE_N          8
+#define FTYPE_N          6
 #define FTYPE_SPARE     16
 
 struct file {
diff --git a/lib/sys.c b/lib/sys.c
index 44fe848c..db26fd2d 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -308,30 +308,6 @@ int read(int fd, void *buf, size_t nbytes)
 #ifdef HAVE_LWIP
         case FTYPE_SOCKET:
 	    return lwip_read(files[fd].fd, buf, nbytes);
-#endif
-#ifdef CONFIG_KBDFRONT
-        case FTYPE_KBD: {
-            int ret, n;
-            n = nbytes / sizeof(union xenkbd_in_event);
-            ret = kbdfront_receive(files[fd].dev, buf, n);
-	    if (ret <= 0) {
-		errno = EAGAIN;
-		return -1;
-	    }
-	    return ret * sizeof(union xenkbd_in_event);
-        }
-#endif
-#ifdef CONFIG_FBFRONT
-        case FTYPE_FB: {
-            int ret, n;
-            n = nbytes / sizeof(union xenfb_in_event);
-            ret = fbfront_receive(files[fd].dev, buf, n);
-	    if (ret <= 0) {
-		errno = EAGAIN;
-		return -1;
-	    }
-	    return ret * sizeof(union xenfb_in_event);
-        }
 #endif
 	default:
 	    break;
@@ -471,16 +447,6 @@ int close(int fd)
             res = lwip_close(files[fd].fd);
             break;
 #endif
-#ifdef CONFIG_KBDFRONT
-	case FTYPE_KBD:
-            shutdown_kbdfront(files[fd].dev);
-            break;
-#endif
-#ifdef CONFIG_FBFRONT
-	case FTYPE_FB:
-            shutdown_fbfront(files[fd].dev);
-            break;
-#endif
 #ifdef CONFIG_CONSFRONT
         case FTYPE_SAVEFILE:
         case FTYPE_CONSOLE:
@@ -666,8 +632,6 @@ static const char *const file_types[] = {
     [FTYPE_NONE]    = "none",
     [FTYPE_CONSOLE] = "console",
     [FTYPE_SOCKET]  = "socket",
-    [FTYPE_KBD]     = "kbd",
-    [FTYPE_FB]      = "fb",
 };
 
 static const char *get_type_name(unsigned int type)
@@ -850,17 +814,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
                 n++;
 	    FD_CLR(i, exceptfds);
 	    break;
-	case FTYPE_KBD:
-	case FTYPE_FB:
-	    if (FD_ISSET(i, readfds)) {
-		if (files[i].read)
-		    n++;
-		else
-		    FD_CLR(i, readfds);
-	    }
-	    FD_CLR(i, writefds);
-	    FD_CLR(i, exceptfds);
-	    break;
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET:
 	    if (FD_ISSET(i, readfds)) {
-- 
2.26.2


