Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07EC691D27
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 11:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493257.763135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQQvc-0006oH-MX; Fri, 10 Feb 2023 10:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493257.763135; Fri, 10 Feb 2023 10:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQQvc-0006kF-JU; Fri, 10 Feb 2023 10:46:52 +0000
Received: by outflank-mailman (input) for mailman id 493257;
 Fri, 10 Feb 2023 10:46:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9hqk=6G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQQva-000617-R2
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 10:46:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37f94573-a930-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 11:46:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F1F095CA5F;
 Fri, 10 Feb 2023 10:46:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C403B1325E;
 Fri, 10 Feb 2023 10:46:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B395Lpcg5mPlUwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Feb 2023 10:46:47 +0000
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
X-Inumbo-ID: 37f94573-a930-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676026007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6yg48m3tvne8UEfBZnk+9j9B6sQe1QaY7lXxFABCRM=;
	b=Pg/wOl+X1wnAx5gv9QVCPC0Svx3QQQCb9FVnjkyyR0ckKiDByOeK9io6QiUwEU2tS+WTuZ
	jr0/+13du395NvWMczqy1XTIzTajelRXA3VJZmpKoJWyyQOYDXyuLwEKSb6FRNDbNi3K0h
	c4X9mMUISJcSo6IT1RKi1Tr0gEuQDjs=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 3/7] Mini-OS: add support for runtime mounts
Date: Fri, 10 Feb 2023 11:46:24 +0100
Message-Id: <20230210104628.14374-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230210104628.14374-1-jgross@suse.com>
References: <20230210104628.14374-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the support to mount a device at runtime. The number of dynamic
mounts is limited by a #define.

For devices supporting multiple files struct file is modified to hold
a pointer to file specific data in contrast to device specific data.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 include/lib.h |  5 +++++
 lib/sys.c     | 50 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/include/lib.h b/include/lib.h
index 36d94ec4..fd8c36de 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -172,6 +172,7 @@ struct file {
     union {
         int fd; /* Any fd from an upper layer. */
         void *dev;
+        void *filedata;
     };
 };
 
@@ -194,6 +195,10 @@ struct mount_point {
     void *dev;
 };
 
+int mount(const char *path, void *dev,
+          int (*open)(struct mount_point *, const char *, int, mode_t));
+void umount(const char *path);
+
 unsigned int alloc_file_type(const struct file_ops *ops);
 
 off_t lseek_default(struct file *file, off_t offset, int whence);
diff --git a/lib/sys.c b/lib/sys.c
index 2f33c937..dc8a8c69 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -339,7 +339,14 @@ static int open_mem(struct mount_point *mnt, const char *pathname, int flags,
     return fd;
 }
 
-static struct mount_point mount_points[] = {
+#ifdef CONFIG_CONSFRONT
+#define STATIC_MNTS   4
+#else
+#define STATIC_MNTS   2
+#endif
+#define DYNAMIC_MNTS  8
+
+static struct mount_point mount_points[STATIC_MNTS + DYNAMIC_MNTS] = {
     { .path = "/var/log",     .open = open_log,  .dev = NULL },
     { .path = "/dev/mem",     .open = open_mem,  .dev = NULL },
 #ifdef CONFIG_CONSFRONT
@@ -365,6 +372,8 @@ int open(const char *pathname, int flags, ...)
     for ( m = 0; m < ARRAY_SIZE(mount_points); m++ )
     {
         mnt = mount_points + m;
+        if ( !mnt->path )
+            continue;
         mlen = strlen(mnt->path);
         if ( !strncmp(pathname, mnt->path, mlen) &&
              (pathname[mlen] == '/' || pathname[mlen] == 0) )
@@ -375,6 +384,45 @@ int open(const char *pathname, int flags, ...)
     return -1;
 }
 
+int mount(const char *path, void *dev,
+          int (*open)(struct mount_point *, const char *, int, mode_t))
+{
+    unsigned int m;
+    struct mount_point *mnt;
+
+    for ( m = 0; m < ARRAY_SIZE(mount_points); m++ )
+    {
+        mnt = mount_points + m;
+        if ( !mnt->path )
+        {
+            mnt->path = strdup(path);
+            mnt->open = open;
+            mnt->dev = dev;
+            return 0;
+        }
+    }
+
+    errno = ENOSPC;
+    return -1;
+}
+
+void umount(const char *path)
+{
+    unsigned int m;
+    struct mount_point *mnt;
+
+    for ( m = 0; m < ARRAY_SIZE(mount_points); m++ )
+    {
+        mnt = mount_points + m;
+        if ( mnt->path && !strcmp(mnt->path, path) )
+        {
+            free((char *)mnt->path);
+            mnt->path = NULL;
+            return;
+        }
+    }
+}
+
 int isatty(int fd)
 {
     return files[fd].type == FTYPE_CONSOLE;
-- 
2.35.3


