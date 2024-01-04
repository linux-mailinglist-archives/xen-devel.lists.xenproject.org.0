Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99868823E60
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661281.1031039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJm9-0003zo-H7; Thu, 04 Jan 2024 09:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661281.1031039; Thu, 04 Jan 2024 09:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJm9-0003ra-8m; Thu, 04 Jan 2024 09:12:29 +0000
Received: by outflank-mailman (input) for mailman id 661281;
 Thu, 04 Jan 2024 09:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJcD-0007Zm-C2
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:02:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f254ffa5-aadf-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 10:02:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E93721EE1;
 Thu,  4 Jan 2024 09:02:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2963E13722;
 Thu,  4 Jan 2024 09:02:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QhXeCBN0lmXlWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:02:11 +0000
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
X-Inumbo-ID: f254ffa5-aadf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8wa9pWvrMOGw1akjDhfhUuR8F7bLlS3/Tu/6p/vKMw=;
	b=NyPjfCnUel768c1HJYvf92BSkfRaB74bir+jAuLF/c4m3dvbFqyKScxmWz3g/kE7yB1sGP
	N4JjFGw1jonvOMzB6Ba2oU1hWRDfrNNcsbFzmuT83zhveATgAK2RPy4giTnpkdJOgjhdmC
	dxmrphTSvM5sH7TVzAzuRuFgNAjPVg4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8wa9pWvrMOGw1akjDhfhUuR8F7bLlS3/Tu/6p/vKMw=;
	b=NyPjfCnUel768c1HJYvf92BSkfRaB74bir+jAuLF/c4m3dvbFqyKScxmWz3g/kE7yB1sGP
	N4JjFGw1jonvOMzB6Ba2oU1hWRDfrNNcsbFzmuT83zhveATgAK2RPy4giTnpkdJOgjhdmC
	dxmrphTSvM5sH7TVzAzuRuFgNAjPVg4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 13/33] tools/xenlogd: add 9pfs stat request support
Date: Thu,  4 Jan 2024 10:00:35 +0100
Message-Id: <20240104090055.27323-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.20
X-Spamd-Result: default: False [1.20 / 50.00];
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
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Add the stat request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- use fstatat() (Jason Andryuk)
---
 tools/xen-9pfsd/io.c | 93 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index 9d816dc97e..7d40747b60 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -34,6 +34,7 @@
 #define P9_CMD_OPEN       112
 #define P9_CMD_CREATE     114
 #define P9_CMD_CLUNK      120
+#define P9_CMD_STAT       124
 
 /* P9 protocol open flags. */
 #define P9_OREAD            0   /* read */
@@ -60,6 +61,25 @@ struct p9_qid {
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
@@ -1140,6 +1160,75 @@ static void p9_clunk(struct ring *ring, struct p9_header *hdr)
     fill_buffer(ring, hdr->cmd + 1, hdr->tag, "");
 }
 
+static void fill_p9_stat(device *device, struct p9_stat *p9s, struct stat *st,
+                         const char *name)
+{
+    memset(p9s, 0, sizeof(*p9s));
+    fill_qid(device, NULL, &p9s->qid, st);
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
+static void p9_stat(struct ring *ring, struct p9_header *hdr)
+{
+    device *device = ring->device;
+    uint32_t fid;
+    struct p9_fid *fidp;
+    struct p9_stat p9s;
+    struct stat st;
+    uint16_t total_length;
+    int ret;
+
+    ret = fill_data(ring, "U", &fid);
+    if ( ret != 1 )
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
+
+    if ( fstatat(device->root_fd, relpath_from_path(fidp->path), &st, 0) < 0 )
+    {
+        p9_error(ring, hdr->tag, errno);
+        goto out;
+    }
+    fill_p9_stat(device, &p9s, &st, strrchr(fidp->path, '/') + 1);
+
+    total_length = p9s.size + sizeof(p9s.size);
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "uuuUQUUULSSSSSUUU",
+                &total_length, &p9s.size, &p9s.type, &p9s.dev, &p9s.qid,
+                &p9s.mode, &p9s.atime, &p9s.mtime, &p9s.length, p9s.name,
+                p9s.uid, p9s.gid, p9s.muid, p9s.extension, &p9s.n_uid,
+                &p9s.n_gid, &p9s.n_muid);
+
+ out:
+    free_fid(device, fidp);
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -1219,6 +1308,10 @@ void *io_thread(void *arg)
                 p9_clunk(ring, &hdr);
                 break;
 
+            case P9_CMD_STAT:
+                p9_stat(ring, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        ring->device->domid, ring->device->devid, hdr.cmd);
-- 
2.35.3


