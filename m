Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DAA486411
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253948.435388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RQq-0004Tl-K6; Thu, 06 Jan 2022 11:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253948.435388; Thu, 06 Jan 2022 11:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RQq-0004QR-GE; Thu, 06 Jan 2022 11:59:48 +0000
Received: by outflank-mailman (input) for mailman id 253948;
 Thu, 06 Jan 2022 11:59:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RPE-0005UX-Ua
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e27cd5ea-6ee7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97BA6212C9;
 Thu,  6 Jan 2022 11:57:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E1E113C0D;
 Thu,  6 Jan 2022 11:57:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4EmeGUPZ1mHnJgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 11:57:55 +0000
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
X-Inumbo-ID: e27cd5ea-6ee7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l6pifbgOadZ0E6Wgy90T2ZIm93BZS6I+9qz60NhwbHg=;
	b=he6FNPlM2m97aBvtYpvwfEY0RsYBMXKDCpgoUo/1sc9lUS1Jw7v153yVQr67iV30WlYYwb
	TOWWwtkX7hmthBY/Niu1bCvj74zvAk3lH5igNigLiWvhPtLizCsIjUHaznFBukOVdS5m++
	NZc6V59v90ZABblqWZQdsO9TPuHm/Zc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 02/15] mini-os: makes file.read bool and move it ahead of device specific part
Date: Thu,  6 Jan 2022 12:57:28 +0100
Message-Id: <20220106115741.3219-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The read member of struct file should be bool.

In order to have the device specific part at the end of the structure
move "read" ahead of that.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 blkfront.c             |  4 ++--
 console/xencons_ring.c |  2 +-
 fbfront.c              | 12 ++++++------
 include/lib.h          |  3 ++-
 netfront.c             |  4 ++--
 tpm_tis.c              |  2 +-
 tpmfront.c             |  6 +++---
 7 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/blkfront.c b/blkfront.c
index 834a978..7c8eb74 100644
--- a/blkfront.c
+++ b/blkfront.c
@@ -62,7 +62,7 @@ void blkfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
     int fd = dev->fd;
 
     if (fd != -1)
-        files[fd].read = 1;
+        files[fd].read = true;
 #endif
     wake_up(&blkfront_queue);
 }
@@ -484,7 +484,7 @@ int blkfront_aio_poll(struct blkfront_dev *dev)
 moretodo:
 #ifdef HAVE_LIBC
     if (dev->fd != -1) {
-        files[dev->fd].read = 0;
+        files[dev->fd].read = false;
         mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
     }
 #endif
diff --git a/console/xencons_ring.c b/console/xencons_ring.c
index b6db74e..c348f3c 100644
--- a/console/xencons_ring.c
+++ b/console/xencons_ring.c
@@ -102,7 +102,7 @@ void console_handle_input(evtchn_port_t port, struct pt_regs *regs, void *data)
         int fd = dev ? dev->fd : -1;
 
         if (fd != -1)
-            files[fd].read = 1;
+            files[fd].read = true;
 
         wake_up(&console_queue);
 #else
diff --git a/fbfront.c b/fbfront.c
index d3b3848..6725da1 100644
--- a/fbfront.c
+++ b/fbfront.c
@@ -45,7 +45,7 @@ void kbdfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
     int fd = dev->fd;
 
     if (fd != -1)
-        files[fd].read = 1;
+        files[fd].read = true;
 #endif
     wake_up(&kbdfront_queue);
 }
@@ -207,7 +207,7 @@ int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n
 
 #ifdef HAVE_LIBC
     if (dev->fd != -1) {
-        files[dev->fd].read = 0;
+        files[dev->fd].read = false;
         mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
     }
 #endif
@@ -229,7 +229,7 @@ int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n
 #ifdef HAVE_LIBC
     if (cons != prod && dev->fd != -1)
         /* still some events to read */
-        files[dev->fd].read = 1;
+        files[dev->fd].read = true;
 #endif
 
     return i;
@@ -349,7 +349,7 @@ void fbfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
     int fd = dev->fd;
 
     if (fd != -1)
-        files[fd].read = 1;
+        files[fd].read = true;
 #endif
     wake_up(&fbfront_queue);
 }
@@ -376,7 +376,7 @@ int fbfront_receive(struct fbfront_dev *dev, union xenfb_in_event *buf, int n)
 
 #ifdef HAVE_LIBC
     if (dev->fd != -1) {
-        files[dev->fd].read = 0;
+        files[dev->fd].read = false;
         mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
     }
 #endif
@@ -398,7 +398,7 @@ int fbfront_receive(struct fbfront_dev *dev, union xenfb_in_event *buf, int n)
 #ifdef HAVE_LIBC
     if (cons != prod && dev->fd != -1)
         /* still some events to read */
-        files[dev->fd].read = 1;
+        files[dev->fd].read = true;
 #endif
 
     return i;
diff --git a/include/lib.h b/include/lib.h
index a638bc9..df2de9e 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -49,6 +49,7 @@
 #define _LIB_H_
 
 #include <stdarg.h>
+#include <stdbool.h>
 #include <stddef.h>
 #include <xen/xen.h>
 #include <xen/event_channel.h>
@@ -183,6 +184,7 @@ struct evtchn_port_info {
 
 struct file {
     enum fd_type type;
+    bool read;	/* maybe available for read */
     union {
 	struct {
             /* lwIP fd */
@@ -235,7 +237,6 @@ struct file {
         } xenbus;
 #endif
     };
-    int read;	/* maybe available for read */
 };
 
 extern struct file files[];
diff --git a/netfront.c b/netfront.c
index dfe065b..a566e34 100644
--- a/netfront.c
+++ b/netfront.c
@@ -255,7 +255,7 @@ void netfront_select_handler(evtchn_port_t port, struct pt_regs *regs, void *dat
     local_irq_restore(flags);
 
     if (fd != -1)
-        files[fd].read = 1;
+        files[fd].read = true;
     wake_up(&netfront_queue);
 }
 #endif
@@ -783,7 +783,7 @@ ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t l
     network_rx(dev);
     if (!dev->rlen && fd != -1)
         /* No data for us, make select stop returning */
-        files[fd].read = 0;
+        files[fd].read = false;
     /* Before re-enabling the interrupts, in case a packet just arrived in the
      * meanwhile. */
     local_irq_restore(flags);
diff --git a/tpm_tis.c b/tpm_tis.c
index 475ac5d..4a51027 100644
--- a/tpm_tis.c
+++ b/tpm_tis.c
@@ -845,7 +845,7 @@ int tpm_tis_send(struct tpm_chip* tpm, uint8_t* buf, size_t len) {
    }
 #ifdef HAVE_LIBC
    if(tpm->fd >= 0) {
-      files[tpm->fd].read = 0;
+      files[tpm->fd].read = false;
       files[tpm->fd].tpm_tis.respgot = 0;
       files[tpm->fd].tpm_tis.offset = 0;
    }
diff --git a/tpmfront.c b/tpmfront.c
index 6049244..d825b49 100644
--- a/tpmfront.c
+++ b/tpmfront.c
@@ -66,7 +66,7 @@ void tpmfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data) {
    dev->waiting = 0;
 #ifdef HAVE_LIBC
    if(dev->fd >= 0) {
-      files[dev->fd].read = 1;
+      files[dev->fd].read = true;
    }
 #endif
    wake_up(&dev->waitq);
@@ -438,7 +438,7 @@ int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
    dev->resplen = 0;
 #ifdef HAVE_LIBC
    if(dev->fd >= 0) {
-      files[dev->fd].read = 0;
+      files[dev->fd].read = false;
       files[dev->fd].tpmfront.respgot = 0;
       files[dev->fd].tpmfront.offset = 0;
    }
@@ -611,7 +611,7 @@ int tpmfront_posix_fstat(int fd, struct stat* buf)
 
    /* If we have a response waiting, then read it now from the backend
     * so we can get its length*/
-   if(dev->waiting || (files[dev->fd].read == 1 && !files[dev->fd].tpmfront.respgot)) {
+   if(dev->waiting || (files[dev->fd].read && !files[dev->fd].tpmfront.respgot)) {
       if ((rc = tpmfront_recv(dev, &dummybuf, &dummysz)) != 0) {
 	 errno = EIO;
 	 return -1;
-- 
2.26.2


