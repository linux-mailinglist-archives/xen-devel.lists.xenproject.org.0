Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C917DDE7E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626250.976372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7cP-00010h-0z; Wed, 01 Nov 2023 09:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626250.976372; Wed, 01 Nov 2023 09:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7cO-0000xG-U3; Wed, 01 Nov 2023 09:34:32 +0000
Received: by outflank-mailman (input) for mailman id 626250;
 Wed, 01 Nov 2023 09:34:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7cN-0005sN-Sv
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:34:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db63d30c-7899-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:34:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C03B21846;
 Wed,  1 Nov 2023 09:34:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8D1613460;
 Wed,  1 Nov 2023 09:34:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YJ+TM6UbQmULCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:34:29 +0000
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
X-Inumbo-ID: db63d30c-7899-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iYKu4ORgu+LVBDEqtNfJuA6R+ODvE4fC94p2On/5gV8=;
	b=QdG23Hcc2Eiqk0WPw8nPSZV4h+Od8vv1CJrrzNgSDcqrZu27pYMg4praAmBR5CAOHL3aMy
	snK4UiSHVujjexJ4lFacUXBXH81RU9Q4klX3q6yFFgfap5MeoT2Ag6mWRjuhH+x6J8Q9Xf
	EMN92RpaQI2b2/vlNTvqbpnAldKXCkI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 11/29] tools/xenlogd: add 9pfs create request support
Date: Wed,  1 Nov 2023 10:33:07 +0100
Message-Id: <20231101093325.30302-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the create request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenlogd/io.c | 133 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
index 2607095e51..34f137be1b 100644
--- a/tools/xenlogd/io.c
+++ b/tools/xenlogd/io.c
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
@@ -861,6 +868,128 @@ static void p9_open(device *device, struct p9_header *hdr)
     fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
 }
 
+static void p9_create(device *device, struct p9_header *hdr)
+{
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
+    ret = fill_data(device, "USUbS", &fid, &name_off, &perm, &mode, &ext_off);
+    if ( ret != 5 )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        return;
+    }
+
+    if ( !name_ok(device->str + name_off) )
+    {
+        p9_error(device, hdr->tag, ENOENT);
+        return;
+    }
+
+    if ( perm & P9_CREATE_PERM_NOTSUPP )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        return;
+    }
+
+    fidp = find_fid(device, fid);
+    if ( !fidp || fidp->opened )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        return;
+    }
+
+    path = malloc(strlen(fidp->path) + strlen(device->str + name_off) + 2 -
+                  strlen(device->host_path));
+    if ( !path )
+    {
+        p9_error(device, hdr->tag, ENOMEM);
+        return;
+    }
+    sprintf(path, "%s/%s", fidp->path + strlen(device->host_path),
+            device->str + name_off);
+    new_fidp = alloc_fid_mem(device, fid, path);
+    free(path);
+    if ( !new_fidp )
+    {
+        p9_error(device, hdr->tag, ENOMEM);
+        return;
+    }
+
+    if ( perm & P9_CREATE_PERM_DIR )
+    {
+        if ( mode != P9_OREAD )
+        {
+            p9_error(device, hdr->tag, EINVAL);
+            free(new_fidp);
+            return;
+        }
+        if ( mkdir(new_fidp->path, perm & P9_CREATE_PERM_DIR_MASK) < 0 )
+        {
+            p9_error(device, hdr->tag, errno);
+            free(new_fidp);
+            return;
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
+            free(new_fidp);
+            return;
+        }
+
+        XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+        XEN_TAILQ_INSERT_HEAD(&device->fids, new_fidp, list);
+        free(fidp);
+        fidp = new_fidp;
+
+        fidp->fd = creat(fidp->path, flags);
+        if ( fidp->fd < 0 )
+        {
+            p9_error(device, hdr->tag, errno);
+            return;
+        }
+    }
+
+    if ( stat(fidp->path, &st) < 0 )
+    {
+        p9_error(device, hdr->tag, errno);
+        return;
+    }
+    fill_qid(fidp->path, &qid, &st);
+    iounit = get_iounit(device, &st);
+    fidp->opened = true;
+
+    fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
+}
+
 static void p9_clunk(device *device, struct p9_header *hdr)
 {
     uint32_t fid;
@@ -964,6 +1093,10 @@ void *io_thread(void *arg)
                 p9_open(device, &hdr);
                 break;
 
+            case P9_CMD_CREATE:
+                p9_create(device, &hdr);
+                break;
+
             case P9_CMD_CLUNK:
                 p9_clunk(device, &hdr);
                 break;
-- 
2.35.3


