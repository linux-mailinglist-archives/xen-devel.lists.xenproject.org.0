Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A448FBC2
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257853.443349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n913R-0007tV-2h; Sun, 16 Jan 2022 08:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257853.443349; Sun, 16 Jan 2022 08:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n913Q-0007qt-Vn; Sun, 16 Jan 2022 08:38:24 +0000
Received: by outflank-mailman (input) for mailman id 257853;
 Sun, 16 Jan 2022 08:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yw-0008IP-Q6
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:46 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd3aa52c-76a6-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:33:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95034219C9;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FFD213AB5;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6JszFlzY42HyFQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:33:32 +0000
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
X-Inumbo-ID: fd3aa52c-76a6-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eDN7dygQtWpp4PtzeecJTsg/5tatNDTI+Yj25CuIEDI=;
	b=mDts5epmvwpbSWm2VbNo8wTury2KLFycD4WQVRdkLIDFtaCyxTI/cfExusLRtx2GeKgMD3
	G2myLGJ94Try9iy8cDOmyw8R5WPkWGp0DikTQw6NSVIzhzKIEUgYvBNHXsI8G5oe5Zo+FZ
	JgndfXyroO35LPaTSHY1+L16C2JROu4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 10/12] add struct file_ops for file type socket
Date: Sun, 16 Jan 2022 09:33:26 +0100
Message-Id: <20220116083328.26524-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even with some special handling needed in select_poll(), add a struct
file_ops for FTYPE_SOCKET. Due to the need of the special handling it
isn't possible to use a dynamically allocated file type.

Most functions calling the file_ops methods can be simplified a lot now
that no file type specific handling is left. Same applies to the file
type name printing in debug/verbose mode.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- switch to struct file * parameter for callbacks
---
 lib/sys.c | 148 +++++++++++++++++++++++-------------------------------
 1 file changed, 64 insertions(+), 84 deletions(-)

diff --git a/lib/sys.c b/lib/sys.c
index 74c82b2a..538d6e7b 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -99,11 +99,67 @@ static const struct file_ops file_ops_none = {
     .name = "none",
 };
 
+#ifdef HAVE_LWIP
+static int socket_read(struct file *file, void *buf, size_t nbytes)
+{
+    return lwip_read(file->fd, buf, nbytes);
+}
+
+static int socket_write(struct file *file, const void *buf, size_t nbytes)
+{
+    return lwip_write(file->fd, buf, nbytes);
+}
+
+static int close_socket_fd(struct file *file)
+{
+    return lwip_close(file->fd);
+}
+
+static int socket_fstat(struct file *file, struct stat *buf)
+{
+    buf->st_mode = S_IFSOCK | S_IRUSR | S_IWUSR;
+    buf->st_atime = buf->st_mtime = buf->st_ctime = time(NULL);
+
+    return 0;
+}
+
+static int socket_fcntl(struct file *file, int cmd, va_list args)
+{
+    long arg;
+
+    arg = va_arg(args, long);
+
+    if ( cmd == F_SETFL && !(arg & ~O_NONBLOCK) )
+    {
+        /* Only flag supported: non-blocking mode */
+        uint32_t nblock = !!(arg & O_NONBLOCK);
+
+        return lwip_ioctl(file->fd, FIONBIO, &nblock);
+    }
+
+    printk("socket fcntl(fd, %d, %lx/%lo)\n", cmd, arg, arg);
+    errno = ENOSYS;
+    return -1;
+}
+
+static const struct file_ops socket_ops = {
+    .name = "socket",
+    .read = socket_read,
+    .write = socket_write,
+    .close = close_socket_fd,
+    .fstat = socket_fstat,
+    .fcntl = socket_fcntl,
+};
+#endif
+
 static const struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
     [FTYPE_NONE] = &file_ops_none,
 #ifdef CONFIG_CONSFRONT
     [FTYPE_CONSOLE] = &console_ops,
 #endif
+#ifdef HAVE_LWIP
+    [FTYPE_SOCKET] = &socket_ops,
+#endif
 };
 
 unsigned int alloc_file_type(const struct file_ops *ops)
@@ -288,15 +344,6 @@ int read(int fd, void *buf, size_t nbytes)
     if ( ops->read )
         return ops->read(file, buf, nbytes);
 
-    switch (file->type) {
-#ifdef HAVE_LWIP
-        case FTYPE_SOCKET:
-	    return lwip_read(files[fd].fd, buf, nbytes);
-#endif
-	default:
-	    break;
-    }
-
  error:
     printk("read(%d): Bad descriptor\n", fd);
     errno = EBADF;
@@ -315,15 +362,6 @@ int write(int fd, const void *buf, size_t nbytes)
     if ( ops->write )
         return ops->write(file, buf, nbytes);
 
-    switch (file->type) {
-#ifdef HAVE_LWIP
-	case FTYPE_SOCKET:
-	    return lwip_write(files[fd].fd, (void*) buf, nbytes);
-#endif
-	default:
-	    break;
-    }
-
  error:
     printk("write(%d): Bad descriptor\n", fd);
     errno = EBADF;
@@ -406,24 +444,10 @@ int close(int fd)
     ops = get_file_ops(file->type);
     printk("close(%d)\n", fd);
     if ( ops->close )
-    {
         res = ops->close(file);
-        goto out;
-    }
-
-    switch (file->type) {
-        default:
-            break;
-#ifdef HAVE_LWIP
-	case FTYPE_SOCKET:
-            res = lwip_close(files[fd].fd);
-            break;
-#endif
-	case FTYPE_NONE:
-            goto error;
-    }
+    else if ( file->type == FTYPE_NONE )
+        goto error;
 
- out:
     memset(files + fd, 0, sizeof(struct file));
     BUILD_BUG_ON(FTYPE_NONE != 0);
 
@@ -466,21 +490,6 @@ int fstat(int fd, struct stat *buf)
     if ( ops->fstat )
         return ops->fstat(file, buf);
 
-    switch (file->type) {
-	case FTYPE_SOCKET: {
-            buf->st_mode = S_IFSOCK|S_IRUSR|S_IWUSR;
-	    buf->st_uid = 0;
-	    buf->st_gid = 0;
-	    buf->st_size = 0;
-	    buf->st_atime = 
-	    buf->st_mtime = 
-	    buf->st_ctime = time(NULL);
-	    return 0;
-	}
-	default:
-	    break;
-    }
-
  error:
     printk("statf(%d): Bad descriptor\n", fd);
     errno = EBADF;
@@ -538,21 +547,9 @@ int fcntl(int fd, int cmd, ...)
     arg = va_arg(ap, long);
     va_end(ap);
 
-    switch (cmd) {
-#ifdef HAVE_LWIP
-	case F_SETFL:
-	    if (files[fd].type == FTYPE_SOCKET && !(arg & ~O_NONBLOCK)) {
-		/* Only flag supported: non-blocking mode */
-		uint32_t nblock = !!(arg & O_NONBLOCK);
-		return lwip_ioctl(files[fd].fd, FIONBIO, &nblock);
-	    }
-	    /* Fallthrough */
-#endif
-	default:
-	    printk("fcntl(%d, %d, %lx/%lo)\n", fd, cmd, arg, arg);
-	    errno = ENOSYS;
-	    return -1;
-    }
+    printk("fcntl(%d, %d, %lx/%lo)\n", fd, cmd, arg, arg);
+    errno = ENOSYS;
+    return -1;
 }
 
 DIR *opendir(const char *name)
@@ -586,23 +583,6 @@ int closedir(DIR *dir)
 
 /* We assume that only the main thread calls select(). */
 
-#if defined(LIBC_DEBUG) || defined(LIBC_VERBOSE)
-static const char *const file_types[] = {
-    [FTYPE_NONE]    = "none",
-    [FTYPE_SOCKET]  = "socket",
-};
-
-static const char *get_type_name(unsigned int type)
-{
-    if ( type < ARRAY_SIZE(file_ops) && file_ops[type] )
-        return file_ops[type]->name;
-
-    if ( type < ARRAY_SIZE(file_types) && file_types[type] )
-        return file_types[type];
-
-    return "none";
-}
-#endif
 #ifdef LIBC_DEBUG
 static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout)
 {
@@ -613,7 +593,7 @@ static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 	if (FD_ISSET(i, set)) { \
 	    if (comma) \
 		printk(", "); \
-            printk("%d(%s)", i, get_type_name(files[i].type)); \
+            printk("%d(%s)", i, get_file_ops(files[i].type)->name); \
 	    comma = 1; \
 	} \
     } \
@@ -647,7 +627,7 @@ static void dump_pollfds(struct pollfd *pfd, int nfds, int timeout)
         fd = pfd[i].fd;
         if (comma)
             printk(", ");
-        printk("%d(%s)/%02x", fd, get_type_name(files[fd].type),
+        printk("%d(%s)/%02x", fd, get_file_ops(files[fd].type)->name,
             pfd[i].events);
             comma = 1;
     }
@@ -809,7 +789,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
 	printk("%d(%d): ", nb, sock_n);
 	for (i = 0; i < nfds; i++) {
 	    if (nbread[i] || nbwrite[i] || nbexcept[i])
-                printk(" %d(%c):", i, get_type_name(files[i].type));
+                printk(" %d(%c):", i, get_file_ops(files[i].type)->name);
 	    if (nbread[i])
 	    	printk(" %dR", nbread[i]);
 	    if (nbwrite[i])
-- 
2.26.2


