Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05A67E7D95
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630480.983383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U44-0007RM-7J; Fri, 10 Nov 2023 16:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630480.983383; Fri, 10 Nov 2023 16:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U44-0007OM-2w; Fri, 10 Nov 2023 16:09:00 +0000
Received: by outflank-mailman (input) for mailman id 630480;
 Fri, 10 Nov 2023 16:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U42-00048H-8s
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:08:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73f78584-7fe3-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:08:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C24D2187C;
 Fri, 10 Nov 2023 16:08:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4723013398;
 Fri, 10 Nov 2023 16:08:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qcEZEJlVTmW1CAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:08:57 +0000
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
X-Inumbo-ID: 73f78584-7fe3-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiUP5xnrschicxXEJivLL6dPJo7q2V//fsn+oEaA+V0=;
	b=girxLdzabNpEHZ/6AXB/Uth9cG9z9CGZ0+wU4RIK3EQSv47y6jU4YNuPXkFp/+jHn8rvt8
	Vxjv4p8NKbefIH2YeLWj5EKLkXQJpz65r7B612ZGrEeNafF8bdmN5F3nmMpw3abxf8Opnm
	njjLB0K/7Z/9lc0EoktviqMlBjhy0AA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 09/29] tools/xenlogd: add 9pfs open request support
Date: Fri, 10 Nov 2023 17:07:44 +0100
Message-Id: <20231110160804.29021-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the open request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- don't allow to open symbolic link
---
 tools/xen-9pfsd/io.c        | 144 ++++++++++++++++++++++++++++++++++++
 tools/xen-9pfsd/xen-9pfsd.h |   4 +
 2 files changed, 148 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index 62c64474e6..bb9c78a1f5 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -18,6 +18,8 @@
 #include <syslog.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <dirent.h>
+#include <fcntl.h>
 #include <xenctrl.h>           /* For cpu barriers. */
 #include <xen-tools/common-macros.h>
 
@@ -28,6 +30,15 @@
 #define P9_CMD_ATTACH     104
 #define P9_CMD_ERROR      107
 #define P9_CMD_WALK       110
+#define P9_CMD_OPEN       112
+
+/* P9 protocol open flags. */
+#define P9_OREAD            0   /* read */
+#define P9_OWRITE           1   /* write */
+#define P9_ORDWR            2   /* read and write */
+#define P9_OMODEMASK     0x03
+#define P9_OTRUNC        0x10   /* or'ed in, truncate file first */
+#define P9_OREMOVE       0x40   /* or'ed in, remove file after clunk */
 
 #define P9_MIN_MSIZE      2048
 #define P9_VERSION        "9P2000.u"
@@ -803,6 +814,135 @@ static void p9_walk(struct ring *ring, struct p9_header *hdr)
     free(names);
 }
 
+static int open_flags_from_mode(uint8_t mode)
+{
+    int flags;
+
+    switch ( mode & P9_OMODEMASK )
+    {
+    case P9_OREAD:
+        flags = O_RDONLY;
+        break;
+
+    case P9_OWRITE:
+        flags = O_WRONLY;
+        break;
+
+    case P9_ORDWR:
+        flags = O_RDWR;
+        break;
+
+    default:
+        return -1;
+    }
+
+    if ( mode & P9_OTRUNC )
+        flags |= O_TRUNC;
+
+    return flags;
+}
+
+static unsigned int get_iounit(struct ring *ring, struct stat *st)
+{
+    return (ring->max_size - st->st_blksize) & ~(st->st_blksize - 1);
+}
+
+static void p9_open(struct ring *ring, struct p9_header *hdr)
+{
+    device *device = ring->device;
+    uint32_t fid;
+    uint8_t mode;
+    struct p9_fid *fidp;
+    struct stat st;
+    struct p9_qid qid;
+    uint32_t iounit;
+    int flags;
+    int ret;
+
+    ret = fill_data(ring, "Ub", &fid, &mode);
+    if ( ret != 2 )
+    {
+        p9_error(ring, hdr->tag, EINVAL);
+        return;
+    }
+    if ( mode & ~(P9_OMODEMASK | P9_OTRUNC | P9_OREMOVE) )
+    {
+        p9_error(ring, hdr->tag, EINVAL);
+        return;
+    }
+
+    fidp = get_fid_ref(device, fid);
+    if ( !fidp )
+    {
+        p9_error(ring, hdr->tag, ENOENT);
+        return;
+    }
+    if ( fidp->opened )
+    {
+        free_fid(device, fidp);
+        p9_error(ring, hdr->tag, EINVAL);
+        return;
+    }
+
+    if ( stat(fidp->path, &st) < 0 )
+    {
+        free_fid(device, fidp);
+        p9_error(ring, hdr->tag, ENOENT);
+        return;
+    }
+
+    if ( S_ISLNK(st.st_mode) )
+    {
+        free_fid(device, fidp);
+        p9_error(ring, hdr->tag, EMLINK);
+        return;
+    }
+
+    fidp->isdir = S_ISDIR(st.st_mode);
+    fidp->mode = mode;
+    if ( fidp->isdir )
+    {
+        if ( mode != P9_OREAD )
+        {
+            free_fid(device, fidp);
+            p9_error(ring, hdr->tag, EINVAL);
+            return;
+        }
+        fidp->data = opendir(fidp->path);
+        if ( !fidp->data )
+        {
+            free_fid(device, fidp);
+            p9_error(ring, hdr->tag, errno);
+            return;
+        }
+        fidp->fd = dirfd(fidp->data);
+    }
+    else
+    {
+        flags = open_flags_from_mode(mode);
+        if ( flags < 0 )
+        {
+            free_fid(device, fidp);
+            p9_error(ring, hdr->tag, EINVAL);
+            return;
+        }
+
+        fidp->fd = open(fidp->path, flags);
+        if ( fidp->fd < 0 )
+        {
+            free_fid(device, fidp);
+            p9_error(ring, hdr->tag, errno);
+            return;
+        }
+    }
+
+    fill_qid(fidp->path, &qid, &st);
+    iounit = get_iounit(ring, &st);
+    fidp->opened = true;
+
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -870,6 +1010,10 @@ void *io_thread(void *arg)
                 p9_walk(ring, &hdr);
                 break;
 
+            case P9_CMD_OPEN:
+                p9_open(ring, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        ring->device->domid, ring->device->devid, hdr.cmd);
diff --git a/tools/xen-9pfsd/xen-9pfsd.h b/tools/xen-9pfsd/xen-9pfsd.h
index 75eaac9f7b..1ca3093f1a 100644
--- a/tools/xen-9pfsd/xen-9pfsd.h
+++ b/tools/xen-9pfsd/xen-9pfsd.h
@@ -25,7 +25,11 @@ struct p9_fid {
     XEN_TAILQ_ENTRY(struct p9_fid) list;
     unsigned int fid;
     unsigned int ref;
+    int fd;
+    uint8_t mode;
     bool opened;
+    bool isdir;
+    void *data;    /* File type specific. */
     char path[];
 };
 
-- 
2.35.3


