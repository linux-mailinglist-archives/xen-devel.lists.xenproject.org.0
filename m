Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274FC48FBAE
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257824.443213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yn-0000hZ-GP; Sun, 16 Jan 2022 08:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257824.443213; Sun, 16 Jan 2022 08:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yn-0000aI-3t; Sun, 16 Jan 2022 08:33:37 +0000
Received: by outflank-mailman (input) for mailman id 257824;
 Sun, 16 Jan 2022 08:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yk-0008IQ-UY
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc522c0f-76a6-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 09:33:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B1211F45F;
 Sun, 16 Jan 2022 08:33:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D8631346A;
 Sun, 16 Jan 2022 08:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GPWRFVvY42HyFQAAMHmgww
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
X-Inumbo-ID: fc522c0f-76a6-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g38pTaT4/z9XKrWqRxaUROnYf4HhbDG2ikYR2ifx7WM=;
	b=mRfbTabA5NNamgetFyP0/9CEZSIsACvFyE7wvMvi7WZQbEwd9I8EF3FzbslncBWJJXw88t
	DLVcFBNXUSK0SMfQT7JY/zVBW3SfGKCWOv4WiPgKw9RX1iX+6xlAMHtYrLQNsSdh4IBZua
	pBg3lOrmPtV/d5YYpTTkDsRcNV0nAJc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 05/12] use alloc_file_type() and get_file_from_fd() in tpmfront
Date: Sun, 16 Jan 2022 09:33:21 +0100
Message-Id: <20220116083328.26524-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate a file type dynamically via alloc_file_type().

Instead of directly accessing the files[] array use get_file_from_fd().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- switch to struct file * parameter for callbacks
- use __attribute__((constructor))
---
 include/lib.h      |   3 +-
 include/tpmfront.h |   5 ---
 lib/sys.c          |  23 -----------
 tpmfront.c         | 100 ++++++++++++++++++++++++++++++---------------
 4 files changed, 69 insertions(+), 62 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 9dfb4689..9b7eaae7 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -167,8 +167,7 @@ extern struct wait_queue_head event_queue;
 #define FTYPE_KBD        7
 #define FTYPE_TAP        8
 #define FTYPE_BLK        9
-#define FTYPE_TPMFRONT  10
-#define FTYPE_N         11
+#define FTYPE_N         10
 #define FTYPE_SPARE     16
 
 struct file {
diff --git a/include/tpmfront.h b/include/tpmfront.h
index b7da50e3..a527371b 100644
--- a/include/tpmfront.h
+++ b/include/tpmfront.h
@@ -81,7 +81,6 @@ int tpmfront_cmd(struct tpmfront_dev* dev, uint8_t* req, size_t reqlen, uint8_t*
 int tpmfront_set_locality(struct tpmfront_dev* dev, int locality);
 
 #ifdef HAVE_LIBC
-#include <sys/stat.h>
 /* POSIX IO functions:
  * use tpmfront_open() to get a file descriptor to the tpm device
  * use write() on the fd to send a command to the backend. You must
@@ -90,10 +89,6 @@ int tpmfront_set_locality(struct tpmfront_dev* dev, int locality);
  * fstat() to get the size of the response and lseek() to seek on it.
  */
 int tpmfront_open(struct tpmfront_dev* dev);
-int tpmfront_posix_read(int fd, uint8_t* buf, size_t count);
-int tpmfront_posix_write(int fd, const uint8_t* buf, size_t count);
-int tpmfront_posix_fstat(int fd, struct stat* buf);
 #endif
 
-
 #endif
diff --git a/lib/sys.c b/lib/sys.c
index 2fc81f20..39f51980 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -28,7 +28,6 @@
 #include <netfront.h>
 #include <blkfront.h>
 #include <fbfront.h>
-#include <tpmfront.h>
 #include <xenbus.h>
 #include <xenstore.h>
 #include <poll.h>
@@ -349,11 +348,6 @@ int read(int fd, void *buf, size_t nbytes)
         case FTYPE_BLK: {
 	    return blkfront_posix_read(fd, buf, nbytes);
         }
-#endif
-#ifdef CONFIG_TPMFRONT
-        case FTYPE_TPMFRONT: {
-	    return tpmfront_posix_read(fd, buf, nbytes);
-        }
 #endif
 	default:
 	    break;
@@ -402,10 +396,6 @@ int write(int fd, const void *buf, size_t nbytes)
 #ifdef CONFIG_BLKFRONT
 	case FTYPE_BLK:
 	    return blkfront_posix_write(fd, buf, nbytes);
-#endif
-#ifdef CONFIG_TPMFRONT
-	case FTYPE_TPMFRONT:
-	    return tpmfront_posix_write(fd, buf, nbytes);
 #endif
 	default:
 	    break;
@@ -468,10 +458,6 @@ off_t lseek(int fd, off_t offset, int whence)
 #ifdef CONFIG_BLKFRONT
        case FTYPE_BLK:
           break;
-#endif
-#ifdef CONFIG_TPMFRONT
-       case FTYPE_TPMFRONT:
-          break;
 #endif
        case FTYPE_FILE:
           break;
@@ -524,11 +510,6 @@ int close(int fd)
             shutdown_blkfront(files[fd].dev);
             break;
 #endif
-#ifdef CONFIG_TPMFRONT
-	case FTYPE_TPMFRONT:
-            shutdown_tpmfront(files[fd].dev);
-            break;
-#endif
 #ifdef CONFIG_KBDFRONT
 	case FTYPE_KBD:
             shutdown_kbdfront(files[fd].dev);
@@ -613,10 +594,6 @@ int fstat(int fd, struct stat *buf)
 #ifdef CONFIG_BLKFRONT
 	case FTYPE_BLK:
 	   return blkfront_posix_fstat(fd, buf);
-#endif
-#ifdef CONFIG_TPMFRONT
-	case FTYPE_TPMFRONT:
-	   return tpmfront_posix_fstat(fd, buf);
 #endif
 	default:
 	    break;
diff --git a/tpmfront.c b/tpmfront.c
index 0a2fefc5..13163ad6 100644
--- a/tpmfront.c
+++ b/tpmfront.c
@@ -49,6 +49,10 @@
 void tpmfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data) {
    struct tpmfront_dev* dev = (struct tpmfront_dev*) data;
    tpmif_shared_page_t *shr = dev->page;
+#ifdef HAVE_LIBC
+    struct file *file = get_file_from_fd(dev->fd);
+#endif
+
    /*If we get a response when we didnt make a request, just ignore it */
    if(!dev->waiting) {
       return;
@@ -65,8 +69,9 @@ void tpmfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data) {
 
    dev->waiting = 0;
 #ifdef HAVE_LIBC
-   if(dev->fd >= 0) {
-      files[dev->fd].read = true;
+   if ( file )
+   {
+      file->read = true;
    }
 #endif
    wake_up(&dev->waitq);
@@ -405,6 +410,10 @@ int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
 #ifdef TPMFRONT_PRINT_DEBUG
    int i;
 #endif
+#ifdef HAVE_LIBC
+    struct file *file = dev ? get_file_from_fd(dev->fd) : NULL;
+#endif
+
    /* Error Checking */
    if(dev == NULL || dev->state != XenbusStateConnected) {
       TPMFRONT_ERR("Tried to send message through disconnected frontend\n");
@@ -437,9 +446,10 @@ int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
    dev->waiting = 1;
    dev->resplen = 0;
 #ifdef HAVE_LIBC
-   if(dev->fd >= 0) {
-      files[dev->fd].read = false;
-      files[dev->fd].offset = 0;
+   if ( file )
+   {
+      file->read = false;
+      file->offset = 0;
       dev->respgot = false;
    }
 #endif
@@ -529,25 +539,11 @@ int tpmfront_set_locality(struct tpmfront_dev* dev, int locality)
 
 #ifdef HAVE_LIBC
 #include <errno.h>
-int tpmfront_open(struct tpmfront_dev* dev)
-{
-   /* Silently prevent multiple opens */
-   if(dev->fd != -1) {
-      return dev->fd;
-   }
 
-   dev->fd = alloc_fd(FTYPE_TPMFRONT);
-   printk("tpmfront_open(%s) -> %d\n", dev->nodename, dev->fd);
-   files[dev->fd].dev = dev;
-   dev->respgot = false;
-   return dev->fd;
-}
-
-int tpmfront_posix_write(int fd, const uint8_t* buf, size_t count)
+static int tpmfront_posix_write(struct file *file, const void *buf, size_t count)
 {
    int rc;
-   struct tpmfront_dev* dev;
-   dev = files[fd].dev;
+   struct tpmfront_dev *dev = file->dev;
 
    if(count == 0) {
       return 0;
@@ -566,14 +562,12 @@ int tpmfront_posix_write(int fd, const uint8_t* buf, size_t count)
    return count;
 }
 
-int tpmfront_posix_read(int fd, uint8_t* buf, size_t count)
+static int tpmfront_posix_read(struct file *file, void *buf, size_t count)
 {
    int rc;
    uint8_t* dummybuf;
    size_t dummysz;
-   struct tpmfront_dev* dev;
-
-   dev = files[fd].dev;
+   struct tpmfront_dev *dev = file->dev;
 
    if(count == 0) {
       return 0;
@@ -588,29 +582,32 @@ int tpmfront_posix_read(int fd, uint8_t* buf, size_t count)
    }
 
    /* handle EOF case */
-   if(files[dev->fd].offset >= dev->resplen) {
+   if ( file->offset >= dev->resplen )
+   {
       return 0;
    }
 
    /* Compute the number of bytes and do the copy operation */
-   if((rc = min(count, dev->resplen - files[dev->fd].offset)) != 0) {
-      memcpy(buf, dev->respbuf + files[dev->fd].offset, rc);
-      files[dev->fd].offset += rc;
+   if ( (rc = min(count, dev->resplen - file->offset)) != 0 )
+   {
+      memcpy(buf, dev->respbuf + file->offset, rc);
+      file->offset += rc;
    }
 
    return rc;
 }
 
-int tpmfront_posix_fstat(int fd, struct stat* buf)
+static int tpmfront_posix_fstat(struct file *file, struct stat *buf)
 {
    uint8_t* dummybuf;
    size_t dummysz;
    int rc;
-   struct tpmfront_dev* dev = files[fd].dev;
+   struct tpmfront_dev *dev = file->dev;
 
    /* If we have a response waiting, then read it now from the backend
     * so we can get its length*/
-   if(dev->waiting || (files[dev->fd].read && !dev->respgot)) {
+   if ( dev->waiting || (file->read && !dev->respgot) )
+   {
       if ((rc = tpmfront_recv(dev, &dummybuf, &dummysz)) != 0) {
 	 errno = EIO;
 	 return -1;
@@ -626,5 +623,44 @@ int tpmfront_posix_fstat(int fd, struct stat* buf)
    return 0;
 }
 
+static int tpmfront_close_fd(struct file *file)
+{
+    shutdown_tpmfront(file->dev);
+
+    return 0;
+}
+
+static const struct file_ops tpmfront_ops = {
+    .name = "tpmfront",
+    .read = tpmfront_posix_read,
+    .write = tpmfront_posix_write,
+    .lseek = lseek_default,
+    .close = tpmfront_close_fd,
+    .fstat = tpmfront_posix_fstat,
+};
+
+static unsigned int ftype_tpmfront;
+
+__attribute__((constructor))
+static void tpmfront_initialize(void)
+{
+    ftype_tpmfront = alloc_file_type(&tpmfront_ops);
+}
+
+int tpmfront_open(struct tpmfront_dev *dev)
+{
+    struct file *file;
+
+    /* Silently prevent multiple opens */
+    if ( dev->fd != -1 )
+        return dev->fd;
+
+    dev->fd = alloc_fd(ftype_tpmfront);
+    printk("tpmfront_open(%s) -> %d\n", dev->nodename, dev->fd);
+    file = get_file_from_fd(dev->fd);
+    file->dev = dev;
+    dev->respgot = false;
+    return dev->fd;
+}
 
 #endif
-- 
2.26.2


