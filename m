Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525CC823E63
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661296.1031064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJmU-0006CO-T1; Thu, 04 Jan 2024 09:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661296.1031064; Thu, 04 Jan 2024 09:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJmU-00066x-Ow; Thu, 04 Jan 2024 09:12:50 +0000
Received: by outflank-mailman (input) for mailman id 661296;
 Thu, 04 Jan 2024 09:12:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJc8-0007Zm-7Y
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:02:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef0dd399-aadf-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 10:02:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C75D921F8C;
 Thu,  4 Jan 2024 09:02:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1CE513722;
 Thu,  4 Jan 2024 09:02:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Q5AiJg10lmXYWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:02:05 +0000
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
X-Inumbo-ID: ef0dd399-aadf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9IiqoAT56C+h23tOpIynn8xmHY6LcxxwPGqEgbggL8=;
	b=NIhr69+OtpqXstkMNcDOKP0hbE+nWmJOYDF4ITusVK6zKDXPfIdNKXx7hYm3pnjL8y+Kdd
	9btmPoyXHbrF5GRjVMwY+DG3emoadrQ0q2nhzKKbnYJipTQCLJssGnyUeLDdY/6K75w2sK
	2ENuFPrvJz5KUHd8OTMuPrAGGmp0gl4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9IiqoAT56C+h23tOpIynn8xmHY6LcxxwPGqEgbggL8=;
	b=NIhr69+OtpqXstkMNcDOKP0hbE+nWmJOYDF4ITusVK6zKDXPfIdNKXx7hYm3pnjL8y+Kdd
	9btmPoyXHbrF5GRjVMwY+DG3emoadrQ0q2nhzKKbnYJipTQCLJssGnyUeLDdY/6K75w2sK
	2ENuFPrvJz5KUHd8OTMuPrAGGmp0gl4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 12/33] tools/xenlogd: add 9pfs create request support
Date: Thu,  4 Jan 2024 10:00:34 +0100
Message-Id: <20240104090055.27323-13-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Level: 
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: -2.10
X-Spam-Flag: NO

Add the create request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- set permissions correctly (Jason Andryuk)
V3:
- use opendirat() etc. (Jason Andryuk)
- rework error handling a little bit
---
 tools/xen-9pfsd/io.c | 155 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index 4adef6715f..9d816dc97e 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -32,6 +32,7 @@
 #define P9_CMD_ERROR      107
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
+#define P9_CMD_CREATE     114
 #define P9_CMD_CLUNK      120
 
 /* P9 protocol open flags. */
@@ -42,6 +43,12 @@
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
@@ -951,6 +958,150 @@ static void p9_open(struct ring *ring, struct p9_header *hdr)
     p9_error(ring, hdr->tag, errno);
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
+    const char *relpath;
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
+    if ( fstatat(device->root_fd, relpath_from_path(fidp->path), &st, 0) < 0 )
+    {
+        free_fid(device, fidp);
+        p9_error(ring, hdr->tag, errno);
+        return;
+    }
+
+    path = malloc(strlen(fidp->path) + strlen(ring->str + name_off) + 2);
+    if ( !path )
+    {
+        free_fid(device, fidp);
+        p9_error(ring, hdr->tag, ENOMEM);
+        return;
+    }
+    sprintf(path, "%s/%s", strcmp(fidp->path, "/") ? fidp->path : "",
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
+    relpath = relpath_from_path(new_fidp->path);
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
+            errno = EINVAL;
+            goto err;
+        }
+        if ( mkdirat(device->root_fd, relpath, perm) < 0 )
+            goto err;
+
+        XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+        XEN_TAILQ_INSERT_HEAD(&device->fids, new_fidp, list);
+        free(fidp);
+        fidp = new_fidp;
+        new_fidp = NULL;
+
+        fidp->fd = openat(device->root_fd, relpath, O_RDONLY);
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
+        {
+            errno = EINVAL;
+            goto err;
+        }
+        perm &= P9_CREATE_PERM_FILE_MASK & st.st_mode;
+
+        XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+        XEN_TAILQ_INSERT_HEAD(&device->fids, new_fidp, list);
+        free(fidp);
+        fidp = new_fidp;
+        new_fidp = NULL;
+
+        fidp->fd = openat(device->root_fd, relpath, flags | O_CREAT | O_EXCL,
+                          perm);
+        if ( fidp->fd < 0 )
+            goto err;
+    }
+
+    if ( fstatat(device->root_fd, relpath, &st, 0) < 0 )
+        goto err;
+
+    fill_qid(device, fidp->path, &qid, &st);
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
+    p9_error(ring, hdr->tag, errno);
+
+    pthread_mutex_unlock(&device->fid_mutex);
+
+    free(new_fidp);
+    free_fid(device, fidp);
+}
+
 static void p9_clunk(struct ring *ring, struct p9_header *hdr)
 {
     device *device = ring->device;
@@ -1060,6 +1211,10 @@ void *io_thread(void *arg)
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


