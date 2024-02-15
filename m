Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6B8563FF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 14:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681696.1060619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabR9-0005uK-JM; Thu, 15 Feb 2024 13:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681696.1060619; Thu, 15 Feb 2024 13:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabR9-0005sV-GE; Thu, 15 Feb 2024 13:05:59 +0000
Received: by outflank-mailman (input) for mailman id 681696;
 Thu, 15 Feb 2024 13:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rabR7-0002yD-HU
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 13:05:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f503beee-cc02-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 14:05:57 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8ACC31F8A4;
 Thu, 15 Feb 2024 13:05:56 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 56694139D0;
 Thu, 15 Feb 2024 13:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 70V3EzQMzmWeFQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 13:05:56 +0000
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
X-Inumbo-ID: f503beee-cc02-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708002356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y958eMYICr4NUQbK+9A+PrL+kcGy4gkIM8hHmNn6rfg=;
	b=LtJ0yJpYTTETF9XJaoW+MWfkdp1rZXY63Htg3kAAu2jxKdQTpSSmSsr8vknbjKtDZAQM8S
	45MV7MZjRP36xetkeP7sb/Lg9lyGQpO+dArm5ceglvscuW8+v/b6fAaCKuFlkwOkA4bzD5
	CJjicTMxZ+ZI29F19ZvbZSCXX6CANV0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708002356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y958eMYICr4NUQbK+9A+PrL+kcGy4gkIM8hHmNn6rfg=;
	b=LtJ0yJpYTTETF9XJaoW+MWfkdp1rZXY63Htg3kAAu2jxKdQTpSSmSsr8vknbjKtDZAQM8S
	45MV7MZjRP36xetkeP7sb/Lg9lyGQpO+dArm5ceglvscuW8+v/b6fAaCKuFlkwOkA4bzD5
	CJjicTMxZ+ZI29F19ZvbZSCXX6CANV0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v7 08/21] tools/xen-9pfsd: add 9pfs open request support
Date: Thu, 15 Feb 2024 14:04:56 +0100
Message-Id: <20240215130509.24008-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240215130509.24008-1-jgross@suse.com>
References: <20240215130509.24008-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Add the open request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V2:
- don't allow to open symbolic link
V3:
- use openat() (Jason Andryuk)
- use common error handling in p9_open()
---
 tools/9pfsd/io.c        | 137 ++++++++++++++++++++++++++++++++++++++++
 tools/9pfsd/xen-9pfsd.h |   4 ++
 2 files changed, 141 insertions(+)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index 731fbd1ad7..5ec780af14 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -19,6 +19,8 @@
 #include <syslog.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <dirent.h>
+#include <fcntl.h>
 #include <xenctrl.h>           /* For cpu barriers. */
 #include <xen-tools/common-macros.h>
 
@@ -29,6 +31,15 @@
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
@@ -827,6 +838,128 @@ static void p9_walk(struct ring *ring, struct p9_header *hdr)
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
+        errno = EINVAL;
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
+        errno = EINVAL;
+        goto err;
+    }
+
+    if ( fstatat(device->root_fd, fidp->path, &st, 0) < 0 )
+    {
+        errno = ENOENT;
+        goto err;
+    }
+
+    if ( S_ISLNK(st.st_mode) )
+    {
+        errno = EMLINK;
+        goto err;
+    }
+
+    fidp->isdir = S_ISDIR(st.st_mode);
+    fidp->mode = mode;
+    if ( fidp->isdir )
+    {
+        if ( mode != P9_OREAD )
+        {
+            errno = EINVAL;
+            goto err;
+        }
+        fidp->fd = openat(device->root_fd, fidp->path, O_RDONLY);
+        if ( fidp->fd < 0 )
+            goto err;
+        fidp->data = fdopendir(fidp->fd);
+        if ( !fidp->data )
+            goto err;
+    }
+    else
+    {
+        flags = open_flags_from_mode(mode);
+        if ( flags < 0 )
+            goto err;
+
+        fidp->fd = openat(device->root_fd, fidp->path, flags);
+        if ( fidp->fd < 0 )
+            goto err;
+    }
+
+    fill_qid(device, fidp->path, &qid, &st);
+    iounit = get_iounit(ring, &st);
+    fidp->opened = true;
+
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
+
+    return;
+
+ err:
+    free_fid(device, fidp);
+    p9_error(ring, hdr->tag, errno);
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -894,6 +1027,10 @@ void *io_thread(void *arg)
                 p9_walk(ring, &hdr);
                 break;
 
+            case P9_CMD_OPEN:
+                p9_open(ring, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        ring->device->domid, ring->device->devid, hdr.cmd);
diff --git a/tools/9pfsd/xen-9pfsd.h b/tools/9pfsd/xen-9pfsd.h
index f01fffb0bb..757be2da4b 100644
--- a/tools/9pfsd/xen-9pfsd.h
+++ b/tools/9pfsd/xen-9pfsd.h
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


