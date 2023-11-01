Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE297DDEB8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626322.976503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7t3-00048C-Fc; Wed, 01 Nov 2023 09:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626322.976503; Wed, 01 Nov 2023 09:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7t3-00045M-B0; Wed, 01 Nov 2023 09:51:45 +0000
Received: by outflank-mailman (input) for mailman id 626322;
 Wed, 01 Nov 2023 09:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7cB-0005E0-On
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:34:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4d612ca-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:34:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ECD8D21835;
 Wed,  1 Nov 2023 09:34:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC2C713460;
 Wed,  1 Nov 2023 09:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bjaTLJobQmXzCAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:34:18 +0000
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
X-Inumbo-ID: d4d612ca-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+E0nJLTyclf5CJbKX/5YoRErJSYEG/DI6e1oQaOsog8=;
	b=AxiGrL9PBABzKDpoI3x/ry2nsJSvs/tZRvn9MxfY3oQ40chYOcrIm3bhEJTGiKeIW+PEO0
	Y8KSjYxrKt/H32nVQHIKOWQp57xW1W1yKJFkiFot+zoWY6xNP2elypLxy9Qg9Dwo2gqeKj
	+3xYoPYT39SmKmqe7983V+pzydJhuPY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 09/29] tools/xenlogd: add 9pfs open request support
Date: Wed,  1 Nov 2023 10:33:05 +0100
Message-Id: <20231101093325.30302-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the open request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenlogd/io.c      | 130 ++++++++++++++++++++++++++++++++++++++++
 tools/xenlogd/xenlogd.h |   4 ++
 2 files changed, 134 insertions(+)

diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
index 778e1dc2c9..c2b259f42e 100644
--- a/tools/xenlogd/io.c
+++ b/tools/xenlogd/io.c
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
@@ -734,6 +745,121 @@ static void p9_walk(device *device, struct p9_header *hdr)
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
+static unsigned int get_iounit(device *device, struct stat *st)
+{
+    return (device->max_size - st->st_blksize) & ~(st->st_blksize - 1);
+}
+
+static void p9_open(device *device, struct p9_header *hdr)
+{
+    uint32_t fid;
+    uint8_t mode;
+    struct p9_fid *fidp;
+    struct stat st;
+    struct p9_qid qid;
+    uint32_t iounit;
+    int flags;
+    int ret;
+
+    ret = fill_data(device, "Ub", &fid, &mode);
+    if ( ret != 2 )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        return;
+    }
+    if ( mode & ~(P9_OMODEMASK | P9_OTRUNC | P9_OREMOVE) )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        return;
+    }
+
+    fidp = find_fid(device, fid);
+    if ( !fidp )
+    {
+        p9_error(device, hdr->tag, ENOENT);
+        return;
+    }
+    if ( fidp->opened )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        return;
+    }
+
+    if ( stat(fidp->path, &st) < 0 )
+    {
+        p9_error(device, hdr->tag, ENOENT);
+        return;
+    }
+
+    fidp->isdir = S_ISDIR(st.st_mode);
+    fidp->mode = mode;
+    if ( fidp->isdir )
+    {
+        if ( mode != P9_OREAD )
+        {
+            p9_error(device, hdr->tag, EINVAL);
+            return;
+        }
+        fidp->data = opendir(fidp->path);
+        if ( !fidp->data )
+        {
+            p9_error(device, hdr->tag, errno);
+            return;
+        }
+        fidp->fd = dirfd(fidp->data);
+    }
+    else
+    {
+        flags = open_flags_from_mode(mode);
+        if ( flags < 0 )
+        {
+            p9_error(device, hdr->tag, EINVAL);
+            return;
+        }
+
+        fidp->fd = open(fidp->path, flags);
+        if ( fidp->fd < 0 )
+        {
+            p9_error(device, hdr->tag, errno);
+            return;
+        }
+    }
+
+    fill_qid(fidp->path, &qid, &st);
+    iounit = get_iounit(device, &st);
+    fidp->opened = true;
+
+    fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
+}
+
 void *io_thread(void *arg)
 {
     device *device = arg;
@@ -801,6 +927,10 @@ void *io_thread(void *arg)
                 p9_walk(device, &hdr);
                 break;
 
+            case P9_CMD_OPEN:
+                p9_open(device, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        device->domid, device->devid, hdr.cmd);
diff --git a/tools/xenlogd/xenlogd.h b/tools/xenlogd/xenlogd.h
index 23f013af9e..6b7b5e2b91 100644
--- a/tools/xenlogd/xenlogd.h
+++ b/tools/xenlogd/xenlogd.h
@@ -22,7 +22,11 @@ struct p9_header {
 struct p9_fid {
     XEN_TAILQ_ENTRY(struct p9_fid) list;
     unsigned int fid;
+    int fd;
+    uint8_t mode;
     bool opened;
+    bool isdir;
+    void *data;    /* File type specific. */
     char path[];
 };
 
-- 
2.35.3


