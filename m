Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D248B003
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 15:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255771.438453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbY-0003ns-CN; Tue, 11 Jan 2022 14:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255771.438453; Tue, 11 Jan 2022 14:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbX-0003iM-G9; Tue, 11 Jan 2022 14:58:31 +0000
Received: by outflank-mailman (input) for mailman id 255771;
 Tue, 11 Jan 2022 14:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7IbU-0002Oa-Cs
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb21f76e-72ee-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:58:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C3C8212C9;
 Tue, 11 Jan 2022 14:58:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31DD213DDD;
 Tue, 11 Jan 2022 14:58:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kN/9Cg2b3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:21 +0000
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
X-Inumbo-ID: eb21f76e-72ee-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+xnAEQMivwL4xL9yiMr125JOzBgLed0TX8eG+d+rWgM=;
	b=R/45p93GSeJMhztoEblmNbeURw2Jd3i2M59SMmUr9L5QQZte6tY/E0Z8grVdSp9wexDUMw
	TP0HcQa9WBa/HfMYQNuU9pZltF2FEFkQzOYBeteIUQ2dCE21n5q5T+W9hmiMbg5JpHb2pT
	SFRKXp0LflJIK2ZWYuu5sPTGJWUifTI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 07/18] mini-os: eliminate consfront union member in struct file
Date: Tue, 11 Jan 2022 15:58:06 +0100
Message-Id: <20220111145817.22170-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the consfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 include/lib.h |  3 ---
 lib/sys.c     | 31 +++++++++++++++++--------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 3a40634..0cedae6 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -202,9 +202,6 @@ struct file {
 	struct {
 	    struct fbfront_dev *dev;
 	} fb;
-	struct {
-	    struct consfront_dev *dev;
-	} cons;
 #ifdef CONFIG_TPMFRONT
 	struct {
 	   struct tpmfront_dev *dev;
diff --git a/lib/sys.c b/lib/sys.c
index f2fdbdf..62c2020 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -179,7 +179,7 @@ int posix_openpt(int flags)
 
     dev = init_consfront(NULL);
     dev->fd = alloc_fd(FTYPE_CONSOLE);
-    files[dev->fd].cons.dev = dev;
+    files[dev->fd].dev = dev;
 
     printk("fd(%d) = posix_openpt\n", dev->fd);
     return(dev->fd);
@@ -194,7 +194,7 @@ int open_savefile(const char *path, int save)
 
     dev = init_consfront(nodename);
     dev->fd = alloc_fd(FTYPE_SAVEFILE);
-    files[dev->fd].cons.dev = dev;
+    files[dev->fd].dev = dev;
 
     printk("fd(%d) = open_savefile\n", dev->fd);
     return(dev->fd);
@@ -248,7 +248,7 @@ int read(int fd, void *buf, size_t nbytes)
             DEFINE_WAIT(w);
             while(1) {
                 add_waiter(w, console_queue);
-                ret = xencons_ring_recv(files[fd].cons.dev, buf, nbytes);
+                ret = xencons_ring_recv(files[fd].dev, buf, nbytes);
                 if (ret)
                     break;
                 schedule();
@@ -324,14 +324,14 @@ int write(int fd, const void *buf, size_t nbytes)
         case FTYPE_SAVEFILE: {
                 int ret = 0, tot = nbytes;
                 while (nbytes > 0) {
-                    ret = xencons_ring_send(files[fd].cons.dev, (char *)buf, nbytes);
+                    ret = xencons_ring_send(files[fd].dev, (char *)buf, nbytes);
                     nbytes -= ret;
                     buf = (char *)buf + ret;
                 }
                 return tot - nbytes;
             }
 	case FTYPE_CONSOLE:
-	    console_print(files[fd].cons.dev, (char *)buf, nbytes);
+	    console_print(files[fd].dev, (char *)buf, nbytes);
 	    return nbytes;
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET:
@@ -487,7 +487,7 @@ int close(int fd)
 #ifdef CONFIG_CONSFRONT
         case FTYPE_SAVEFILE:
         case FTYPE_CONSOLE:
-            fini_consfront(files[fd].cons.dev);
+            fini_consfront(files[fd].dev);
             files[fd].type = FTYPE_NONE;
             return 0;
 #endif
@@ -764,7 +764,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
 	    /* Fallthrough.  */
 	case FTYPE_CONSOLE:
 	    if (FD_ISSET(i, readfds)) {
-                if (xencons_ring_avail(files[i].cons.dev))
+                if (xencons_ring_avail(files[i].dev))
 		    n++;
 		else
 		    FD_CLR(i, readfds);
@@ -1447,6 +1447,8 @@ const struct termios default_termios = {0,             /* iflag */
 
 int tcsetattr(int fildes, int action, const struct termios *tios)
 {
+    struct consfront_dev *dev;
+
     if (fildes < 0 || fildes >= NOFILE) {
         errno = EBADF;
         return -1;
@@ -1472,21 +1474,21 @@ int tcsetattr(int fildes, int action, const struct termios *tios)
             return -1;
     }
 
-    if (files[fildes].cons.dev == NULL) {
+    dev = files[fildes].dev;
+    if (dev == NULL) {
         errno = ENOSYS;
         return -1;
     }
 
-    if (tios->c_oflag & OPOST)
-        files[fildes].cons.dev->is_raw = false;
-    else
-        files[fildes].cons.dev->is_raw = true;
+    dev->is_raw = !(tios->c_oflag & OPOST);
 
     return 0;
 }
 
 int tcgetattr(int fildes, struct termios *tios)
 {
+    struct consfront_dev *dev;
+
     if (fildes < 0 || fildes >= NOFILE) {
         errno = EBADF;
         return -1;
@@ -1497,7 +1499,8 @@ int tcgetattr(int fildes, struct termios *tios)
         return -1;
     }
 
-    if (files[fildes].cons.dev == NULL) {
+    dev = files[fildes].dev;
+    if (dev == NULL) {
         errno = ENOSYS;
         return 0;
     }
@@ -1509,7 +1512,7 @@ int tcgetattr(int fildes, struct termios *tios)
 
     memcpy(tios, &default_termios, sizeof(struct termios));
 
-    if (files[fildes].cons.dev->is_raw)
+    if (dev->is_raw)
         tios->c_oflag &= ~OPOST;
 
     return 0;
-- 
2.26.2


