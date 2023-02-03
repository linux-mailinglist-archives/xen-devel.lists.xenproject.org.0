Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C1689352
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 10:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489059.757399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNsDH-0007rV-PM; Fri, 03 Feb 2023 09:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489059.757399; Fri, 03 Feb 2023 09:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNsDH-0007oF-LZ; Fri, 03 Feb 2023 09:18:31 +0000
Received: by outflank-mailman (input) for mailman id 489059;
 Fri, 03 Feb 2023 09:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HD5o=57=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pNsDF-0006sG-OB
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 09:18:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8a0311c-a3a3-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 10:18:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 079943447D;
 Fri,  3 Feb 2023 09:18:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2CB01346D;
 Fri,  3 Feb 2023 09:18:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Jm4sMmTR3GMkEwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 03 Feb 2023 09:18:28 +0000
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
X-Inumbo-ID: b8a0311c-a3a3-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675415909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtWQKRAyY57feFJk8BbUzmL2nez/i6gSp+ydtlu7X9A=;
	b=W2spmIMlIzYekMsW/Nktfe/U0VVGVGHAsO/wqtUDQBwSfMriG+gLhv4eU8qX16ZeD2kqxU
	ZwKQEMJBklXMCsymSYU8e5wjFP83bBCQJHQuI898uqC2ZZh+HcL+lDyUoAEP0pp2V4jebs
	xzCkqi97iujyPKCo0BapNivCn+zUZbs=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/7] Mini-OS: add support for runtime mounts
Date: Fri,  3 Feb 2023 10:18:05 +0100
Message-Id: <20230203091809.14478-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230203091809.14478-1-jgross@suse.com>
References: <20230203091809.14478-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the support to mount a device at runtime. The number of dynamic
mounts is limited by a #define.

For devices supporting multiple files struct file is modified to hold
a pointer to file specific data in contrast to device specific data.

Signed-off-by: Juergen Gross <jgross@suse.com>
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
index 1475c621..4171bfd6 100644
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


