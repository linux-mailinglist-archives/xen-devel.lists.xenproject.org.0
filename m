Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D06855AEF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 07:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681306.1060100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVih-0005QL-45; Thu, 15 Feb 2024 06:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681306.1060100; Thu, 15 Feb 2024 06:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVig-0005MK-SR; Thu, 15 Feb 2024 06:59:42 +0000
Received: by outflank-mailman (input) for mailman id 681306;
 Thu, 15 Feb 2024 06:59:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raVfr-0003NA-3y
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 06:56:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6247e130-cbcf-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 07:56:46 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF9361F850;
 Thu, 15 Feb 2024 06:56:45 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BED311346A;
 Thu, 15 Feb 2024 06:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id EtIiLa21zWV6SQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 06:56:45 +0000
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
X-Inumbo-ID: 6247e130-cbcf-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vc2VSUYI94Us0Ei3rvbkISjz40iZ7FXy+b6mZ9EcBLc=;
	b=LybbqxRT5+qLQsi0FAiLmPsWJolEPqW2kVYrinmbaCkkyexNAxZ5Lt2nnZyTl9j/r0nI4W
	ERHwRiS+XiSp61SRlqp6CR7Goi8yd2MAWbSCt153IHwUD3eOgRuPaTxBYMBovLqYtLNfK/
	0E7Udu+JNrjyWHktM6N2r44Pg1PYnrw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vc2VSUYI94Us0Ei3rvbkISjz40iZ7FXy+b6mZ9EcBLc=;
	b=EvBu3DKerQ2dxTgL4JAg7cdOJko2RS0G3t3Rt9PbgxQvAdVsS0tb8x6eIEg+Hjrgkcg4QO
	JGSLTZOCcJo1RE1CXBMHIpyDu+WbYsSvdfl9ES4ZNOa6hZSZflQEIamHgBBHgpT14kDwbw
	wHN9B42zbKsQfAkeJdExhloIVXFm4co=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v6 11/21] tools/xen-9pfsd: add 9pfs stat request support
Date: Thu, 15 Feb 2024 07:55:31 +0100
Message-Id: <20240215065541.21067-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240215065541.21067-1-jgross@suse.com>
References: <20240215065541.21067-1-jgross@suse.com>
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
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Add the stat request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V3:
- use fstatat() (Jason Andryuk)
V4:
- add "s" format to fill_buffer() as a preparation for reading dirs
---
 tools/9pfsd/io.c | 102 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index 65ff4dab73..d08c4b1283 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
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
@@ -166,6 +186,7 @@ static void fmt_err(const char *fmt)
  * S: String (2 byte length + <length> characters)
  *    The length is obtained via strlen() of the parameter, being a pointer
  *    to the first character of the string
+ * s: stat (struct p9_stat)
  * U: 4 byte unsigned integer
  *    The parameter is a pointer to a uint32_t value
  */
@@ -176,6 +197,8 @@ static void vfill_buffer_at(void **data, const char *fmt, va_list ap)
     const void *par;
     const char *str_val;
     const struct p9_qid *qid;
+    const struct p9_stat *stat;
+    uint16_t tlen;
     unsigned int len;
     unsigned int array_sz = 0;
     unsigned int elem_sz = 0;
@@ -259,6 +282,18 @@ static void vfill_buffer_at(void **data, const char *fmt, va_list ap)
             *data += len;
             break;
 
+        case 's':
+            stat = par;
+            elem_sz = sizeof(*stat);
+            tlen = stat->size + sizeof(stat->size);
+            fill_buffer_at(data, "uuuUQUUULSSSSSUUU", &tlen, &stat->size,
+                           &stat->type, &stat->dev, &stat->qid, &stat->mode,
+                           &stat->atime, &stat->mtime, &stat->length,
+                           stat->name, stat->uid, stat->gid, stat->muid,
+                           stat->extension, &stat->n_uid, &stat->n_gid,
+                           &stat->n_muid);
+            break;
+
         case 'U':
             put_unaligned(*(const uint32_t *)par, (uint32_t *)*data);
             elem_sz = sizeof(uint32_t);
@@ -1148,6 +1183,69 @@ static void p9_clunk(struct ring *ring, struct p9_header *hdr)
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
+    if ( fstatat(device->root_fd, fidp->path, &st, 0) < 0 )
+    {
+        p9_error(ring, hdr->tag, errno);
+        goto out;
+    }
+    fill_p9_stat(device, &p9s, &st, strrchr(fidp->path, '/') + 1);
+
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "s", &p9s);
+
+ out:
+    free_fid(device, fidp);
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -1227,6 +1325,10 @@ void *io_thread(void *arg)
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


