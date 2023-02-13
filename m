Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F16693FD9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 09:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494210.764228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRURq-0005nG-LA; Mon, 13 Feb 2023 08:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494210.764228; Mon, 13 Feb 2023 08:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRURq-0005kU-Hg; Mon, 13 Feb 2023 08:44:30 +0000
Received: by outflank-mailman (input) for mailman id 494210;
 Mon, 13 Feb 2023 08:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DRhn=6J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pRURp-00053b-AI
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 08:44:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f3030d6-ab7a-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 09:44:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 30DED37870;
 Mon, 13 Feb 2023 08:44:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03E4E1391B;
 Mon, 13 Feb 2023 08:44:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yNUpO2r46WM2RAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Feb 2023 08:44:26 +0000
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
X-Inumbo-ID: 9f3030d6-ab7a-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676277867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19ujpdeO6r/ntB3v/0hzqQCc5N6kEKU3yTBXBtOtbZg=;
	b=UxYiQRhP1uw/dAULpCCF9xOTAqeUbO9hm0aaDfQjC1i0wV90bjKIPIzKCsoIV41Aiq+/3K
	cV8NacSRhsjG58kxQNyVHDGZ+stNlJvON/xNpy6S2L7Q/dfUiMaRgda/eFqjmbcgYNkvLO
	EL5Y5HLwN8l3iKbedmbWVBMcX3x4Lxo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 2/7] Mini-OS: add concept of mount points
Date: Mon, 13 Feb 2023 09:44:07 +0100
Message-Id: <20230213084412.21065-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213084412.21065-1-jgross@suse.com>
References: <20230213084412.21065-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the concept of mount points to Mini-OS. A mount point is a path
associated with a device pointer and an open() callback. A mount point
can be either a file (e.g. "/dev/mem") or a directory ("/var/log").

This allows to replace the special casing in the generic open()
handling with a generic mount point handling.

Prepare the open() callbacks to support creating new files by adding a
mode parameter.

Additionally add a close() prototype to include/lib.h, as it is missing
today.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
V2:
- pass path below mount point to open callbacks (Samuel Thibault)
---
 include/lib.h |  9 ++++++
 lib/sys.c     | 80 +++++++++++++++++++++++++++++++++++++++------------
 2 files changed, 70 insertions(+), 19 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index bec99646..36d94ec4 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -187,6 +187,13 @@ struct file_ops {
     bool (*select_wr)(struct file *file);
 };
 
+struct mount_point {
+    const char *path;
+    int (*open)(struct mount_point *mnt, const char *pathname, int flags,
+                mode_t mode);
+    void *dev;
+};
+
 unsigned int alloc_file_type(const struct file_ops *ops);
 
 off_t lseek_default(struct file *file, off_t offset, int whence);
@@ -198,6 +205,8 @@ int alloc_fd(unsigned int type);
 void close_all_files(void);
 extern struct thread *main_thread;
 void sparse(unsigned long data, size_t size);
+
+int close(int fd);
 #endif
 
 #endif /* _LIB_H_ */
diff --git a/lib/sys.c b/lib/sys.c
index 8f8a3de2..2f33c937 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -263,11 +263,6 @@ char *getcwd(char *buf, size_t size)
     return buf;
 }
 
-#define LOG_PATH "/var/log/"
-#define SAVE_PATH "/var/lib/xen"
-#define SAVE_CONSOLE 1
-#define RESTORE_CONSOLE 2
-
 int mkdir(const char *pathname, mode_t mode)
 {
     errno = EIO;
@@ -286,18 +281,30 @@ int posix_openpt(int flags)
     return fd;
 }
 
+static int open_pt(struct mount_point *mnt, const char *pathname, int flags,
+                   mode_t mode)
+{
+    return posix_openpt(flags);
+}
+
 int open_savefile(const char *path, int save)
 {
     int fd;
     char nodename[64];
 
-    snprintf(nodename, sizeof(nodename), "device/console/%d", save ? SAVE_CONSOLE : RESTORE_CONSOLE);
+    snprintf(nodename, sizeof(nodename), "device/console/%d", save ? 1 : 2);
 
     fd = open_consfront(nodename);
     printk("fd(%d) = open_savefile\n", fd);
 
     return fd;
 }
+
+static int open_save(struct mount_point *mnt, const char *pathname, int flags,
+                     mode_t mode)
+{
+    return open_savefile(pathname, flags & O_WRONLY);
+}
 #else
 int posix_openpt(int flags)
 {
@@ -311,24 +318,59 @@ int open_savefile(const char *path, int save)
 }
 #endif
 
-int open(const char *pathname, int flags, ...)
+static int open_log(struct mount_point *mnt, const char *pathname, int flags,
+                    mode_t mode)
 {
     int fd;
+
     /* Ugly, but fine.  */
-    if (!strncmp(pathname,LOG_PATH,strlen(LOG_PATH))) {
-	fd = alloc_fd(FTYPE_CONSOLE);
-        printk("open(%s) -> %d\n", pathname, fd);
-        return fd;
+    fd = alloc_fd(FTYPE_CONSOLE);
+    printk("open(%s%s) -> %d\n", mnt->path, pathname, fd);
+    return fd;
+}
+
+static int open_mem(struct mount_point *mnt, const char *pathname, int flags,
+                    mode_t mode)
+{
+    int fd;
+
+    fd = alloc_fd(FTYPE_MEM);
+    printk("open(%s%s) -> %d\n", mnt->path, pathname, fd);
+    return fd;
+}
+
+static struct mount_point mount_points[] = {
+    { .path = "/var/log",     .open = open_log,  .dev = NULL },
+    { .path = "/dev/mem",     .open = open_mem,  .dev = NULL },
+#ifdef CONFIG_CONSFRONT
+    { .path = "/dev/ptmx",    .open = open_pt,   .dev = NULL },
+    { .path = "/var/lib/xen", .open = open_save, .dev = NULL },
+#endif
+};
+
+int open(const char *pathname, int flags, ...)
+{
+    unsigned int m, mlen;
+    struct mount_point *mnt;
+    mode_t mode = 0;
+    va_list ap;
+
+    if ( flags & O_CREAT )
+    {
+        va_start(ap, flags);
+        mode = va_arg(ap, mode_t);
+        va_end(ap);
     }
-    if (!strncmp(pathname, "/dev/mem", strlen("/dev/mem"))) {
-        fd = alloc_fd(FTYPE_MEM);
-        printk("open(/dev/mem) -> %d\n", fd);
-        return fd;
+
+    for ( m = 0; m < ARRAY_SIZE(mount_points); m++ )
+    {
+        mnt = mount_points + m;
+        mlen = strlen(mnt->path);
+        if ( !strncmp(pathname, mnt->path, mlen) &&
+             (pathname[mlen] == '/' || pathname[mlen] == 0) )
+            return mnt->open(mnt, pathname + mlen, flags, mode);
     }
-    if (!strncmp(pathname, "/dev/ptmx", strlen("/dev/ptmx")))
-        return posix_openpt(flags);
-    if (!strncmp(pathname,SAVE_PATH,strlen(SAVE_PATH)))
-        return open_savefile(pathname, flags & O_WRONLY);
+
     errno = EIO;
     return -1;
 }
-- 
2.35.3


