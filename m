Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF7D7E7D98
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630483.983392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U4F-0008Di-Dc; Fri, 10 Nov 2023 16:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630483.983392; Fri, 10 Nov 2023 16:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U4F-0008Bl-AM; Fri, 10 Nov 2023 16:09:11 +0000
Received: by outflank-mailman (input) for mailman id 630483;
 Fri, 10 Nov 2023 16:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U4D-00048H-Cj
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:09:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a95d5d6-7fe3-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:09:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84D2D1F8BE;
 Fri, 10 Nov 2023 16:09:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E46413398;
 Fri, 10 Nov 2023 16:09:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2bevFaRVTmXVCAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:09:08 +0000
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
X-Inumbo-ID: 7a95d5d6-7fe3-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpIVjIc8Trw1a/1y0NH1SiQxKICQ+nMOfKarWypzx+Q=;
	b=tGXwddmjostmiVooVmFEGT5GCy6dfbDfopotvd5d+wVp1RGi2PHYRILi/W4F6LMkp07pox
	brh1LY9ikmCqgQYUN681aEqWl8P0tua4LTCQ3JwCpNQMnrkY0O9W6Mpls3silg87cMS8pK
	7U+KtwvBgm5L2sM/ZgohYPJv0GlcwhE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 11/29] tools/xenlogd: add 9pfs create request support
Date: Fri, 10 Nov 2023 17:07:46 +0100
Message-Id: <20231110160804.29021-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the create request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- set permissions correctly (Jason Andryuk)
---
 tools/xen-9pfsd/io.c | 159 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index c182ef0483..a605f51dc6 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -31,6 +31,7 @@
 #define P9_CMD_ERROR      107
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
+#define P9_CMD_CREATE     114
 #define P9_CMD_CLUNK      120
 
 /* P9 protocol open flags. */
@@ -41,6 +42,12 @@
 #define P9_OTRUNC        0x10   /* or'ed in, truncate file first */
 #define P9_OREMOVE       0x40   /* or'ed in, remove file after clunk */
 
+/* P9 protocol create permission masks. */
+#define P9_CREATE_PERM_DIR        0x80000000
+#define P9_CREATE_PERM_NOTSUPP    0x03b00000   /* link, symlink, ... */
+#define P9_CREATE_PERM_DIR_MASK   0777
+#define P9_CREATE_PERM_FILE_MASK  0666
+
 #define P9_MIN_MSIZE      2048
 #define P9_VERSION        "9P2000.u"
 #define P9_WALK_MAXELEM   16
@@ -944,6 +951,154 @@ static void p9_open(struct ring *ring, struct p9_header *hdr)
     fill_buffer(ring, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
 }
 
+static void p9_create(struct ring *ring, struct p9_header *hdr)
+{
+    device *device = ring->device;
+    uint32_t fid;
+    unsigned int name_off;
+    uint32_t perm;
+    uint8_t mode;
+    unsigned int ext_off;
+    struct p9_fid *fidp;
+    struct p9_fid *new_fidp;
+    char *path;
+    struct stat st;
+    struct p9_qid qid;
+    uint32_t iounit;
+    int flags;
+    int ret;
+
+    ret = fill_data(ring, "USUbS", &fid, &name_off, &perm, &mode, &ext_off);
+    if ( ret != 5 )
+    {
+        p9_error(ring, hdr->tag, EINVAL);
+        return;
+    }
+
+    if ( !name_ok(ring->str + name_off) )
+    {
+        p9_error(ring, hdr->tag, ENOENT);
+        return;
+    }
+
+    if ( perm & P9_CREATE_PERM_NOTSUPP )
+    {
+        p9_error(ring, hdr->tag, EINVAL);
+        return;
+    }
+
+    fidp = get_fid_ref(device, fid);
+    if ( !fidp || fidp->opened )
+    {
+        free_fid(device, fidp);
+        p9_error(ring, hdr->tag, EINVAL);
+        return;
+    }
+    if ( stat(fidp->path, &st) < 0 )
+    {
+        free_fid(device, fidp);
+        p9_error(ring, hdr->tag, errno);
+        return;
+    }
+
+    path = malloc(strlen(fidp->path) + strlen(ring->str + name_off) + 2 -
+                  strlen(device->host_path));
+    if ( !path )
+    {
+        free_fid(device, fidp);
+        p9_error(ring, hdr->tag, ENOMEM);
+        return;
+    }
+    sprintf(path, "%s/%s", fidp->path + strlen(device->host_path),
+            ring->str + name_off);
+    new_fidp = alloc_fid_mem(device, fid, path);
+    free(path);
+    if ( !new_fidp )
+    {
+        free_fid(device, fidp);
+        p9_error(ring, hdr->tag, ENOMEM);
+        return;
+    }
+
+    pthread_mutex_lock(&device->fid_mutex);
+
+    new_fidp->ref = fidp->ref;
+
+    if ( perm & P9_CREATE_PERM_DIR )
+    {
+        perm &= P9_CREATE_PERM_DIR_MASK & st.st_mode;
+        if ( mode != P9_OREAD )
+        {
+            p9_error(ring, hdr->tag, EINVAL);
+            free(new_fidp);
+            goto err;
+        }
+        if ( mkdir(new_fidp->path, perm) < 0 )
+        {
+            p9_error(ring, hdr->tag, errno);
+            free(new_fidp);
+            goto err;
+        }
+
+        XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+        XEN_TAILQ_INSERT_HEAD(&device->fids, new_fidp, list);
+        free(fidp);
+        fidp = new_fidp;
+
+        fidp->data = opendir(fidp->path);
+        if ( !fidp->data )
+        {
+            p9_error(ring, hdr->tag, errno);
+            goto err;
+        }
+        fidp->fd = dirfd(fidp->data);
+    }
+    else
+    {
+        flags = open_flags_from_mode(mode);
+        if ( flags < 0 )
+        {
+            p9_error(ring, hdr->tag, EINVAL);
+            free(new_fidp);
+            goto err;
+        }
+        flags |= perm & P9_CREATE_PERM_FILE_MASK & st.st_mode;
+
+        XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+        XEN_TAILQ_INSERT_HEAD(&device->fids, new_fidp, list);
+        free(fidp);
+        fidp = new_fidp;
+
+        fidp->fd = creat(fidp->path, flags);
+        if ( fidp->fd < 0 )
+        {
+            p9_error(ring, hdr->tag, errno);
+            goto err;
+        }
+    }
+
+    if ( stat(fidp->path, &st) < 0 )
+    {
+        p9_error(ring, hdr->tag, errno);
+        goto err;
+    }
+    fill_qid(fidp->path, &qid, &st);
+    iounit = get_iounit(ring, &st);
+    fidp->opened = true;
+    fidp->mode = mode;
+
+    pthread_mutex_unlock(&device->fid_mutex);
+
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
+
+    return;
+
+ err:
+    pthread_mutex_unlock(&device->fid_mutex);
+
+    free_fid(device, fidp);
+}
+
 static void p9_clunk(struct ring *ring, struct p9_header *hdr)
 {
     device *device = ring->device;
@@ -1052,6 +1207,10 @@ void *io_thread(void *arg)
                 p9_open(ring, &hdr);
                 break;
 
+            case P9_CMD_CREATE:
+                p9_create(ring, &hdr);
+                break;
+
             case P9_CMD_CLUNK:
                 p9_clunk(ring, &hdr);
                 break;
-- 
2.35.3


