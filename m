Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48487DDE7F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626252.976382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7cV-0001Ld-9g; Wed, 01 Nov 2023 09:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626252.976382; Wed, 01 Nov 2023 09:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7cV-0001IT-6y; Wed, 01 Nov 2023 09:34:39 +0000
Received: by outflank-mailman (input) for mailman id 626252;
 Wed, 01 Nov 2023 09:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7cT-0005sN-J8
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:34:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deb7cebc-7899-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:34:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A3AE1F74D;
 Wed,  1 Nov 2023 09:34:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7555613460;
 Wed,  1 Nov 2023 09:34:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oid6G6sbQmURCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:34:35 +0000
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
X-Inumbo-ID: deb7cebc-7899-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJbdIr85qdX7H1mLMVKcVj+vNBSvf/s3S7aCwRXLZlQ=;
	b=FjGW66jTUk03x2O8LiH/g+o33zHciSnG4/T4VUzdZmrKM7aA0soKNvBrmSdn2by8i4U6rN
	iBf176Wiu1lrug9lUff6Qd18AcHNP1YU7HCIFmpAxCopK+AJZUi85e1ZCcRjBJgEt9VGhC
	QxR3G6DkI9FzhVDximIimoZlhQL/Wgg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 12/29] tools/xenlogd: add 9pfs stat request support
Date: Wed,  1 Nov 2023 10:33:08 +0100
Message-Id: <20231101093325.30302-13-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the stat request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenlogd/io.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
index 34f137be1b..6e92667fab 100644
--- a/tools/xenlogd/io.c
+++ b/tools/xenlogd/io.c
@@ -33,6 +33,7 @@
 #define P9_CMD_OPEN       112
 #define P9_CMD_CREATE     114
 #define P9_CMD_CLUNK      120
+#define P9_CMD_STAT       124
 
 /* P9 protocol open flags. */
 #define P9_OREAD            0   /* read */
@@ -59,6 +60,25 @@ struct p9_qid {
     uint64_t path;
 };
 
+struct p9_stat {
+    uint16_t size;
+    uint16_t type;
+    uint32_t dev;
+    struct p9_qid qid;
+    uint32_t mode;
+    uint32_t atime;
+    uint32_t mtime;
+    uint64_t length;
+    const char *name;
+    const char *uid;
+    const char *gid;
+    const char *muid;
+    const char *extension;
+    uint32_t n_uid;
+    uint32_t n_gid;
+    uint32_t n_muid;
+};
+
 /*
  * Note that the ring names "in" and "out" are from the frontend's
  * perspective, so the "in" ring will be used for responses to the frontend,
@@ -1022,6 +1042,71 @@ static void p9_clunk(device *device, struct p9_header *hdr)
     fill_buffer(device, hdr->cmd + 1, hdr->tag, "");
 }
 
+static void fill_p9_stat(struct p9_stat *p9s, struct stat *st, const char *name)
+{
+    memset(p9s, 0, sizeof(*p9s));
+    fill_qid(NULL, &p9s->qid, st);
+    p9s->mode = st->st_mode & 0777;
+    if ( S_ISDIR(st->st_mode) )
+        p9s->mode |= P9_CREATE_PERM_DIR;
+    p9s->atime = st->st_atime;
+    p9s->mtime = st->st_mtime;
+    p9s->length = st->st_size;
+    p9s->name = name;
+    p9s->uid = "";
+    p9s->gid = "";
+    p9s->muid = "";
+    p9s->extension = "";
+    p9s->n_uid = 0;
+    p9s->n_gid = 0;
+    p9s->n_muid = 0;
+
+    /*
+     * Size of individual fields without the size field, including 5 2-byte
+     * string length fields.
+     */
+    p9s->size = 71 + strlen(p9s->name);
+}
+
+static void p9_stat(device *device, struct p9_header *hdr)
+{
+    uint32_t fid;
+    struct p9_fid *fidp;
+    struct p9_stat p9s;
+    struct stat st;
+    uint16_t total_length;
+    int ret;
+
+    ret = fill_data(device, "U", &fid);
+    if ( ret != 1 )
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
+
+    if ( stat(fidp->path, &st) < 0 )
+    {
+        p9_error(device, hdr->tag, errno);
+        return;
+    }
+    fill_p9_stat(&p9s, &st, strrchr(fidp->path, '/') + 1);
+
+    total_length = p9s.size + sizeof(p9s.size);
+    fill_buffer(device, hdr->cmd + 1, hdr->tag, "uuuUQUUULSSSSSUUU",
+                &total_length, &p9s.size, &p9s.type, &p9s.dev, &p9s.qid,
+                &p9s.mode, &p9s.atime, &p9s.mtime, &p9s.length, p9s.name,
+                p9s.uid, p9s.gid, p9s.muid, p9s.extension, &p9s.n_uid,
+                &p9s.n_gid, &p9s.n_muid);
+
+}
+
 void *io_thread(void *arg)
 {
     device *device = arg;
@@ -1101,6 +1186,10 @@ void *io_thread(void *arg)
                 p9_clunk(device, &hdr);
                 break;
 
+            case P9_CMD_STAT:
+                p9_stat(device, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        device->domid, device->devid, hdr.cmd);
-- 
2.35.3


