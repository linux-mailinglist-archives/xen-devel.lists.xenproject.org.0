Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C9248FBB1
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257828.443242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yq-0001Ji-Nh; Sun, 16 Jan 2022 08:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257828.443242; Sun, 16 Jan 2022 08:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yq-00018z-7h; Sun, 16 Jan 2022 08:33:40 +0000
Received: by outflank-mailman (input) for mailman id 257828;
 Sun, 16 Jan 2022 08:33:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90ym-0008IQ-Ui
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc710686-76a6-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 09:33:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB119219C8;
 Sun, 16 Jan 2022 08:33:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90E761346A;
 Sun, 16 Jan 2022 08:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WGg2IlvY42HyFQAAMHmgww
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
X-Inumbo-ID: fc710686-76a6-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFReguV4y++M9NUukSuxH+eG17KkgvbSsHOjbRhtUks=;
	b=Tr9a4POanzkbMhoSmBb9h3eLdK4XMXem0XTRAILtKVbPbd7bIfhWz0s/QaNk8tZqOsGTlo
	EVCVbE8P9WVFwY3Lik4axLUHqEHsO5egyd7uP/sHOKsqwJthNdpTdQzEDx0WjIkewfB7Yo
	99Jd+/ggIcGKXO6YS2qbjKUch7gFsR8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 06/12] use alloc_file_type() and get_file_from_fd() in blkfront
Date: Sun, 16 Jan 2022 09:33:22 +0100
Message-Id: <20220116083328.26524-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate the file type dynamically via alloc_file_type().

Instead of directly accessing the files[] array use get_file_from_fd().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- switch to struct file * parameter for callbacks
- use __attribute__((constructor))
---
 blkfront.c         | 92 ++++++++++++++++++++++++++++++++++------------
 include/blkfront.h |  5 ---
 include/lib.h      |  3 +-
 lib/sys.c          | 24 ------------
 4 files changed, 69 insertions(+), 55 deletions(-)

diff --git a/blkfront.c b/blkfront.c
index e3f42bef..ed902702 100644
--- a/blkfront.c
+++ b/blkfront.c
@@ -59,10 +59,10 @@ void blkfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
 {
 #ifdef HAVE_LIBC
     struct blkfront_dev *dev = data;
-    int fd = dev->fd;
+    struct file *file = get_file_from_fd(dev->fd);
 
-    if (fd != -1)
-        files[fd].read = true;
+    if ( file )
+        file->read = true;
 #endif
     wake_up(&blkfront_queue);
 }
@@ -483,9 +483,13 @@ int blkfront_aio_poll(struct blkfront_dev *dev)
 
 moretodo:
 #ifdef HAVE_LIBC
-    if (dev->fd != -1) {
-        files[dev->fd].read = false;
-        mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
+    {
+        struct file *file = get_file_from_fd(dev->fd);
+
+        if ( file ) {
+            file->read = false;
+            mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
+        }
     }
 #endif
 
@@ -554,22 +558,11 @@ moretodo:
 }
 
 #ifdef HAVE_LIBC
-int blkfront_open(struct blkfront_dev *dev)
+static int blkfront_posix_rwop(struct file *file, uint8_t *buf, size_t count,
+                               bool write)
 {
-    /* Silently prevent multiple opens */
-    if(dev->fd != -1) {
-       return dev->fd;
-    }
-    dev->fd = alloc_fd(FTYPE_BLK);
-    printk("blk_open(%s) -> %d\n", dev->nodename, dev->fd);
-    files[dev->fd].dev = dev;
-    return dev->fd;
-}
-
-int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
-{
-   struct blkfront_dev* dev = files[fd].dev;
-   off_t offset = files[fd].offset;
+   struct blkfront_dev *dev = file->dev;
+   off_t offset = file->offset;
    struct blkfront_aiocb aiocb;
    unsigned long long disksize = dev->info.sectors * dev->info.sector_size;
    unsigned int blocksize = dev->info.sector_size;
@@ -711,14 +704,24 @@ int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
    }
 
    free(copybuf);
-   files[fd].offset += rc;
+   file->offset += rc;
    return rc;
 
 }
 
-int blkfront_posix_fstat(int fd, struct stat* buf)
+static int blkfront_posix_read(struct file *file, void *buf, size_t nbytes)
 {
-   struct blkfront_dev* dev = files[fd].dev;
+    return blkfront_posix_rwop(file, buf, nbytes, false);
+}
+
+static int blkfront_posix_write(struct file *file, const void *buf, size_t nbytes)
+{
+    return blkfront_posix_rwop(file, (void *)buf, nbytes, true);
+}
+
+static int blkfront_posix_fstat(struct file *file, struct stat *buf)
+{
+   struct blkfront_dev *dev = file->dev;
 
    buf->st_mode = dev->info.mode;
    buf->st_uid = 0;
@@ -728,4 +731,45 @@ int blkfront_posix_fstat(int fd, struct stat* buf)
 
    return 0;
 }
+
+static int blkfront_close_fd(struct file *file)
+{
+    shutdown_blkfront(file->dev);
+
+    return 0;
+}
+
+static const struct file_ops blk_ops = {
+    .name = "blk",
+    .read = blkfront_posix_read,
+    .write = blkfront_posix_write,
+    .lseek = lseek_default,
+    .close = blkfront_close_fd,
+    .fstat = blkfront_posix_fstat,
+    .select_rd = select_read_flag,
+};
+
+static unsigned int ftype_blk;
+
+__attribute__((constructor))
+static void blkfron_initialize(void)
+{
+    ftype_blk = alloc_file_type(&blk_ops);
+}
+
+int blkfront_open(struct blkfront_dev *dev)
+{
+    struct file *file;
+
+    /* Silently prevent multiple opens */
+    if ( dev->fd != -1 )
+        return dev->fd;
+
+    dev->fd = alloc_fd(ftype_blk);
+    printk("blk_open(%s) -> %d\n", dev->nodename, dev->fd);
+    file = get_file_from_fd(dev->fd);
+    file->dev = dev;
+
+    return dev->fd;
+}
 #endif
diff --git a/include/blkfront.h b/include/blkfront.h
index 3528af9d..7f84a0a2 100644
--- a/include/blkfront.h
+++ b/include/blkfront.h
@@ -28,17 +28,12 @@ struct blkfront_info
 };
 struct blkfront_dev *init_blkfront(char *nodename, struct blkfront_info *info);
 #ifdef HAVE_LIBC
-#include <sys/stat.h>
 /* POSIX IO functions:
  * use blkfront_open() to get a file descriptor to the block device
  * Don't use the other blkfront posix functions here directly, instead use
  * read(), write(), lseek() and fstat() on the file descriptor
  */
 int blkfront_open(struct blkfront_dev *dev);
-int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write);
-#define blkfront_posix_write(fd, buf, count) blkfront_posix_rwop(fd, (uint8_t*)buf, count, 1)
-#define blkfront_posix_read(fd, buf, count) blkfront_posix_rwop(fd, (uint8_t*)buf, count, 0)
-int blkfront_posix_fstat(int fd, struct stat* buf);
 #endif
 void blkfront_aio(struct blkfront_aiocb *aiocbp, int write);
 #define blkfront_aio_read(aiocbp) blkfront_aio(aiocbp, 0)
diff --git a/include/lib.h b/include/lib.h
index 9b7eaae7..2f472b00 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -166,8 +166,7 @@ extern struct wait_queue_head event_queue;
 #define FTYPE_FB         6
 #define FTYPE_KBD        7
 #define FTYPE_TAP        8
-#define FTYPE_BLK        9
-#define FTYPE_N         10
+#define FTYPE_N          9
 #define FTYPE_SPARE     16
 
 struct file {
diff --git a/lib/sys.c b/lib/sys.c
index 39f51980..90684335 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -343,11 +343,6 @@ int read(int fd, void *buf, size_t nbytes)
 	    }
 	    return ret * sizeof(union xenfb_in_event);
         }
-#endif
-#ifdef CONFIG_BLKFRONT
-        case FTYPE_BLK: {
-	    return blkfront_posix_read(fd, buf, nbytes);
-        }
 #endif
 	default:
 	    break;
@@ -392,10 +387,6 @@ int write(int fd, const void *buf, size_t nbytes)
 	case FTYPE_TAP:
 	    netfront_xmit(files[fd].dev, (void*) buf, nbytes);
 	    return nbytes;
-#endif
-#ifdef CONFIG_BLKFRONT
-	case FTYPE_BLK:
-	    return blkfront_posix_write(fd, buf, nbytes);
 #endif
 	default:
 	    break;
@@ -455,10 +446,6 @@ off_t lseek(int fd, off_t offset, int whence)
         return ops->lseek(file, offset, whence);
 
     switch(file->type) {
-#ifdef CONFIG_BLKFRONT
-       case FTYPE_BLK:
-          break;
-#endif
        case FTYPE_FILE:
           break;
        default:
@@ -505,11 +492,6 @@ int close(int fd)
 	    shutdown_netfront(files[fd].dev);
             break;
 #endif
-#ifdef CONFIG_BLKFRONT
-	case FTYPE_BLK:
-            shutdown_blkfront(files[fd].dev);
-            break;
-#endif
 #ifdef CONFIG_KBDFRONT
 	case FTYPE_KBD:
             shutdown_kbdfront(files[fd].dev);
@@ -591,10 +573,6 @@ int fstat(int fd, struct stat *buf)
 	    buf->st_ctime = time(NULL);
 	    return 0;
 	}
-#ifdef CONFIG_BLKFRONT
-	case FTYPE_BLK:
-	   return blkfront_posix_fstat(fd, buf);
-#endif
 	default:
 	    break;
     }
@@ -710,7 +688,6 @@ static const char *const file_types[] = {
     [FTYPE_CONSOLE] = "console",
     [FTYPE_SOCKET]  = "socket",
     [FTYPE_TAP]     = "net",
-    [FTYPE_BLK]     = "blk",
     [FTYPE_KBD]     = "kbd",
     [FTYPE_FB]      = "fb",
 };
@@ -896,7 +873,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
 	    FD_CLR(i, exceptfds);
 	    break;
 	case FTYPE_TAP:
-	case FTYPE_BLK:
 	case FTYPE_KBD:
 	case FTYPE_FB:
 	    if (FD_ISSET(i, readfds)) {
-- 
2.26.2


