Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44D693FDE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 09:44:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494216.764244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRURz-0006Q6-11; Mon, 13 Feb 2023 08:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494216.764244; Mon, 13 Feb 2023 08:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRURy-0006Mu-Td; Mon, 13 Feb 2023 08:44:38 +0000
Received: by outflank-mailman (input) for mailman id 494216;
 Mon, 13 Feb 2023 08:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DRhn=6J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pRURw-0006An-NG
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 08:44:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3098a0a-ab7a-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 09:44:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5FC137870;
 Mon, 13 Feb 2023 08:44:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D23C1391B;
 Mon, 13 Feb 2023 08:44:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aHdDIXD46WNARAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Feb 2023 08:44:32 +0000
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
X-Inumbo-ID: a3098a0a-ab7a-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676277872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/tiDXbP/9+hZp0jDtSI+PwtYbXnE16R86Manl6T7bw=;
	b=qiR+HkdnGMmX36aZ+SoeWq7GNf4wwvzOGMdiNfYGeiA1zLvLOv6d/EiRWw5K3JRpmdJr1S
	8nUOwXjEBHl7+0sNC8SUyEqCHPZOaAWUunLG4c6G56biCIP0q4goSBslMbUBZ2rS8JxS6/
	MYvFRShMfQnaj/DJmzIY0bop4HB1F+M=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 3/7] Mini-OS: add support for runtime mounts
Date: Mon, 13 Feb 2023 09:44:08 +0100
Message-Id: <20230213084412.21065-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213084412.21065-1-jgross@suse.com>
References: <20230213084412.21065-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the support to mount a device at runtime. The number of dynamic
mounts is limited by a #define.

For devices supporting multiple files struct file is modified to hold
a pointer to file specific data in contrast to device specific data.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
V3:
- set number of possible mountpoints to 16 (Andrew Cooper)
---
 include/lib.h |  5 +++++
 lib/sys.c     | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 1 deletion(-)

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
index 2f33c937..118fc441 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -85,6 +85,8 @@
     }
 
 #define NOFILE 32
+#define N_MOUNTS  16
+
 extern void minios_evtchn_close_fd(int fd);
 extern void minios_gnttab_close_fd(int fd);
 
@@ -339,7 +341,7 @@ static int open_mem(struct mount_point *mnt, const char *pathname, int flags,
     return fd;
 }
 
-static struct mount_point mount_points[] = {
+static struct mount_point mount_points[N_MOUNTS] = {
     { .path = "/var/log",     .open = open_log,  .dev = NULL },
     { .path = "/dev/mem",     .open = open_mem,  .dev = NULL },
 #ifdef CONFIG_CONSFRONT
@@ -365,6 +367,8 @@ int open(const char *pathname, int flags, ...)
     for ( m = 0; m < ARRAY_SIZE(mount_points); m++ )
     {
         mnt = mount_points + m;
+        if ( !mnt->path )
+            continue;
         mlen = strlen(mnt->path);
         if ( !strncmp(pathname, mnt->path, mlen) &&
              (pathname[mlen] == '/' || pathname[mlen] == 0) )
@@ -375,6 +379,45 @@ int open(const char *pathname, int flags, ...)
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


