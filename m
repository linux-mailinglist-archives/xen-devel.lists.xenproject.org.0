Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8496848FBB0
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257832.443257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90ys-0001bn-HI; Sun, 16 Jan 2022 08:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257832.443257; Sun, 16 Jan 2022 08:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yr-0001Sh-TR; Sun, 16 Jan 2022 08:33:41 +0000
Received: by outflank-mailman (input) for mailman id 257832;
 Sun, 16 Jan 2022 08:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yo-0008IP-PG
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc7d0c98-76a6-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:33:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 575631F3B4;
 Sun, 16 Jan 2022 08:33:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2AF791346A;
 Sun, 16 Jan 2022 08:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0Dc/CVvY42HyFQAAMHmgww
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
X-Inumbo-ID: fc7d0c98-76a6-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5ZEOSnl4Zm8BpIud/3/sxMgQuEGzQWgZcmgMQmThgA=;
	b=ta1KHt3mzpfTtqE/kK0s7Nq6GcCZ9DhxscohOKSJKKR4HZGpCUC5gtscn6x05/+MQfLiOr
	noUHikursRXc+lnUIl1rLfXai2fiBhdO82FHfX0VTD4MzDW3GF7tKvc1K4Ps5ZB0yn9oCb
	sGx7gjigrhbi4xQJEcIlnh3lr3PGzgY=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 04/12] use alloc_file_type() and get_file_from_fd() in tpm_tis
Date: Sun, 16 Jan 2022 09:33:20 +0100
Message-Id: <20220116083328.26524-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate a file type dynamically via alloc_file_type().

Instead of directly accessing the files[] array use get_file_from_fd().

Make some now local functions static and modify their prototypes to
match the file_ops requirements.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- switch to struct file * parameter for callbacks
- use __attribute__((constructor))
---
 include/lib.h     |   3 +-
 include/tpm_tis.h |   6 ---
 lib/sys.c         |  23 ---------
 tpm_tis.c         | 121 +++++++++++++++++++++++++++++-----------------
 4 files changed, 78 insertions(+), 75 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index c5e47786..9dfb4689 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -168,8 +168,7 @@ extern struct wait_queue_head event_queue;
 #define FTYPE_TAP        8
 #define FTYPE_BLK        9
 #define FTYPE_TPMFRONT  10
-#define FTYPE_TPM_TIS   11
-#define FTYPE_N         12
+#define FTYPE_N         11
 #define FTYPE_SPARE     16
 
 struct file {
diff --git a/include/tpm_tis.h b/include/tpm_tis.h
index 86e83f13..2af974db 100644
--- a/include/tpm_tis.h
+++ b/include/tpm_tis.h
@@ -37,14 +37,11 @@ struct tpm_chip;
 
 struct tpm_chip* init_tpm_tis(unsigned long baseaddr, int localities, unsigned int irq);
 struct tpm_chip* init_tpm2_tis(unsigned long baseaddr, int localities, unsigned int irq);
-void shutdown_tpm_tis(struct tpm_chip* tpm);
 
 int tpm_tis_request_locality(struct tpm_chip* tpm, int locality);
 int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** resp, size_t* resplen);
 
 #ifdef HAVE_LIBC
-#include <sys/stat.h>
-#include <fcntl.h>
 /* POSIX IO functions:
  * use tpm_tis_open() to get a file descriptor to the tpm device
  * use write() on the fd to send a command to the backend. You must
@@ -53,9 +50,6 @@ int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** res
  * fstat() to get the size of the response and lseek() to seek on it.
  */
 int tpm_tis_open(struct tpm_chip* tpm);
-int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count);
-int tpm_tis_posix_write(int fd, const uint8_t* buf, size_t count);
-int tpm_tis_posix_fstat(int fd, struct stat* buf);
 #endif
 
 #endif
diff --git a/lib/sys.c b/lib/sys.c
index 53870aa4..2fc81f20 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -29,7 +29,6 @@
 #include <blkfront.h>
 #include <fbfront.h>
 #include <tpmfront.h>
-#include <tpm_tis.h>
 #include <xenbus.h>
 #include <xenstore.h>
 #include <poll.h>
@@ -355,11 +354,6 @@ int read(int fd, void *buf, size_t nbytes)
         case FTYPE_TPMFRONT: {
 	    return tpmfront_posix_read(fd, buf, nbytes);
         }
-#endif
-#ifdef CONFIG_TPM_TIS
-        case FTYPE_TPM_TIS: {
-	    return tpm_tis_posix_read(fd, buf, nbytes);
-        }
 #endif
 	default:
 	    break;
@@ -412,10 +406,6 @@ int write(int fd, const void *buf, size_t nbytes)
 #ifdef CONFIG_TPMFRONT
 	case FTYPE_TPMFRONT:
 	    return tpmfront_posix_write(fd, buf, nbytes);
-#endif
-#ifdef CONFIG_TPM_TIS
-	case FTYPE_TPM_TIS:
-	    return tpm_tis_posix_write(fd, buf, nbytes);
 #endif
 	default:
 	    break;
@@ -482,10 +472,6 @@ off_t lseek(int fd, off_t offset, int whence)
 #ifdef CONFIG_TPMFRONT
        case FTYPE_TPMFRONT:
           break;
-#endif
-#ifdef CONFIG_TPM_TIS
-       case FTYPE_TPM_TIS:
-          break;
 #endif
        case FTYPE_FILE:
           break;
@@ -543,11 +529,6 @@ int close(int fd)
             shutdown_tpmfront(files[fd].dev);
             break;
 #endif
-#ifdef CONFIG_TPM_TIS
-	case FTYPE_TPM_TIS:
-            shutdown_tpm_tis(files[fd].dev);
-            break;
-#endif
 #ifdef CONFIG_KBDFRONT
 	case FTYPE_KBD:
             shutdown_kbdfront(files[fd].dev);
@@ -636,10 +617,6 @@ int fstat(int fd, struct stat *buf)
 #ifdef CONFIG_TPMFRONT
 	case FTYPE_TPMFRONT:
 	   return tpmfront_posix_fstat(fd, buf);
-#endif
-#ifdef CONFIG_TPM_TIS
-	case FTYPE_TPM_TIS:
-	   return tpm_tis_posix_fstat(fd, buf);
 #endif
 	default:
 	    break;
diff --git a/tpm_tis.c b/tpm_tis.c
index 477f5550..b88ec874 100644
--- a/tpm_tis.c
+++ b/tpm_tis.c
@@ -792,6 +792,9 @@ int tpm_tis_send(struct tpm_chip* tpm, uint8_t* buf, size_t len) {
    int status, burstcnt = 0;
    int count = 0;
    uint32_t ordinal;
+#ifdef HAVE_LIBC
+   struct file *file = get_file_from_fd(tpm->fd);
+#endif
 
    if(tpm_tis_request_locality(tpm, tpm->locality) < 0) {
       return -EBUSY;
@@ -844,9 +847,10 @@ int tpm_tis_send(struct tpm_chip* tpm, uint8_t* buf, size_t len) {
       }
    }
 #ifdef HAVE_LIBC
-   if(tpm->fd >= 0) {
-      files[tpm->fd].read = false;
-      files[tpm->fd].offset = 0;
+   if ( file )
+   {
+      file->read = false;
+      file->offset = 0;
    }
 #endif
    return len;
@@ -1093,6 +1097,26 @@ ssize_t tpm_getcap(struct tpm_chip *chip, uint32_t subcap_id, cap_t *cap,
         return rc;
 }
 
+static void shutdown_tpm_tis(struct tpm_chip *tpm)
+{
+    int i;
+
+    printk("Shutting down tpm_tis device\n");
+
+    iowrite32(TPM_INT_ENABLE(tpm, tpm->locality), ~TPM_GLOBAL_INT_ENABLE);
+
+    /* Unmap all of the mmio pages */
+    for ( i = 0; i < 5; ++i )
+    {
+        if ( tpm->pages[i] != NULL )
+        {
+            iounmap(tpm->pages[i], PAGE_SIZE);
+            tpm->pages[i] = NULL;
+        }
+    }
+    free(tpm);
+    return;
+}
 
 struct tpm_chip* init_tpm_tis(unsigned long baseaddr, int localities, unsigned int irq)
 {
@@ -1242,25 +1266,6 @@ abort_egress:
    return NULL;
 }
 
-void shutdown_tpm_tis(struct tpm_chip* tpm){
-   int i;
-
-   printk("Shutting down tpm_tis device\n");
-
-   iowrite32(TPM_INT_ENABLE(tpm, tpm->locality), ~TPM_GLOBAL_INT_ENABLE);
-
-   /*Unmap all of the mmio pages */
-   for(i = 0; i < 5; ++i) {
-      if(tpm->pages[i] != NULL) {
-	 iounmap(tpm->pages[i], PAGE_SIZE);
-	 tpm->pages[i] = NULL;
-      }
-   }
-   free(tpm);
-   return;
-}
-
-
 int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** resp, size_t* resplen)
 {
    if(tpm->locality < 0) {
@@ -1279,23 +1284,19 @@ int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** res
 }
 
 #ifdef HAVE_LIBC
-int tpm_tis_open(struct tpm_chip* tpm)
+#include <sys/stat.h>
+#include <fcntl.h>
+
+static int tpm_tis_close(struct file *file)
 {
-   /* Silently prevent multiple opens */
-   if(tpm->fd != -1) {
-      return tpm->fd;
-   }
+    shutdown_tpm_tis(file->dev);
 
-   tpm->fd = alloc_fd(FTYPE_TPM_TIS);
-   printk("tpm_tis_open() -> %d\n", tpm->fd);
-   files[tpm->fd].dev = tpm;
-   return tpm->fd;
+    return 0;
 }
 
-int tpm_tis_posix_write(int fd, const uint8_t* buf, size_t count)
+static int tpm_tis_posix_write(struct file *file, const void *buf, size_t count)
 {
-   struct tpm_chip* tpm;
-   tpm = files[fd].dev;
+   struct tpm_chip *tpm = file->dev;
 
    if(tpm->locality < 0) {
       printk("tpm_tis_posix_write() failed! locality not set!\n");
@@ -1319,11 +1320,10 @@ int tpm_tis_posix_write(int fd, const uint8_t* buf, size_t count)
    return count;
 }
 
-int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count)
+static int tpm_tis_posix_read(struct file *file, void *buf, size_t count)
 {
    int rc;
-   struct tpm_chip* tpm;
-   tpm = files[fd].dev;
+   struct tpm_chip *tpm = file->dev;
 
    if(count == 0) {
       return 0;
@@ -1337,20 +1337,21 @@ int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count)
 
 
    /* Handle EOF case */
-   if(files[fd].offset >= tpm->data_len) {
+   if ( file->offset >= tpm->data_len )
+   {
       rc = 0;
    } else {
-      rc = min(tpm->data_len - files[fd].offset, count);
-      memcpy(buf, tpm->data_buffer + files[fd].offset, rc);
+      rc = min(tpm->data_len - file->offset, count);
+      memcpy(buf, tpm->data_buffer + file->offset, rc);
    }
-   files[fd].offset += rc;
+   file->offset += rc;
    /* Reset the data pending flag */
    return rc;
 }
-int tpm_tis_posix_fstat(int fd, struct stat* buf)
+
+static int tpm_tis_posix_fstat(struct file *file, struct stat *buf)
 {
-   struct tpm_chip* tpm;
-   tpm = files[fd].dev;
+   struct tpm_chip *tpm = file->dev;
 
    buf->st_mode = O_RDWR;
    buf->st_uid = 0;
@@ -1360,6 +1361,38 @@ int tpm_tis_posix_fstat(int fd, struct stat* buf)
    return 0;
 }
 
+static const struct file_ops tpm_tis_ops = {
+    .name = "tpm_tis",
+    .read = tpm_tis_posix_read,
+    .write = tpm_tis_posix_write,
+    .lseek = lseek_default,
+    .close = tpm_tis_close,
+    .fstat = tpm_tis_posix_fstat,
+};
+
+static unsigned int ftype_tis;
+
+__attribute__((constructor))
+static void tpm_tis_initialize(void)
+{
+    ftype_tis = alloc_file_type(&tpm_tis_ops);
+}
+
+int tpm_tis_open(struct tpm_chip *tpm)
+{
+    struct file *file;
+
+    /* Silently prevent multiple opens */
+    if ( tpm->fd != -1 )
+        return tpm->fd;
+
+    tpm->fd = alloc_fd(ftype_tis);
+    printk("tpm_tis_open() -> %d\n", tpm->fd);
+    file = get_file_from_fd(tpm->fd);
+    file->dev = tpm;
+    return tpm->fd;
+}
+
 /* TPM 2.0 */
 
 /*TPM2.0 Selftest*/
-- 
2.26.2


