Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D49855ADC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 07:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681261.1059972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVfY-0006Rz-NY; Thu, 15 Feb 2024 06:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681261.1059972; Thu, 15 Feb 2024 06:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVfY-0006PV-Jx; Thu, 15 Feb 2024 06:56:28 +0000
Received: by outflank-mailman (input) for mailman id 681261;
 Thu, 15 Feb 2024 06:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raVfX-0003c6-FI
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 06:56:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55f39920-cbcf-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 07:56:25 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 666731F850;
 Thu, 15 Feb 2024 06:56:23 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 35FDE1346A;
 Thu, 15 Feb 2024 06:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id gxCSC5e1zWVfSQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 06:56:23 +0000
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
X-Inumbo-ID: 55f39920-cbcf-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0xuqXiEC4iAEod/g/QSMGJfwxMyyt5jqb3GT9oAAzI=;
	b=teRIGcmK2cVwHGBZH1h5M+3LE7TS/gZRbBIMHLjKZCGKIhMsJxQqDzi15bmm7MSbRorJ49
	mc/W2n78GeQI4Nm/+ZT2Fe+XASQbCzJVTutORpery0/SRvMF0qQPMHHV+YVfSNweSfLldU
	TFRuAEhsyrmQranIMYfLiFsJN5F+ViE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0xuqXiEC4iAEod/g/QSMGJfwxMyyt5jqb3GT9oAAzI=;
	b=mhjihxDU/oekcJz7V/y7aJiB3WnFsCBDLK0/7+XmFpt01zxvXOrFUeFBPc1zgWu3zmG8Hb
	9PDXEajRYxggB9BMt/tW+PS7PjI9fpu5kRqdmdX//hyuOtbL9PYcO6pJKZrtAY7fPmvze3
	6UKb3fZc/bahwzeoPqcYXlTcIdsbjVg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v6 07/21] tools/xen-9pfsd: add 9pfs walk request support
Date: Thu, 15 Feb 2024 07:55:27 +0100
Message-Id: <20240215065541.21067-8-jgross@suse.com>
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

Add the walk request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V2:
- don't allow walking across symbolic links
V6:
- use EBADF instead of EBADFD (Andrew Cooper)
- use strncpy() with strlen() + 1 (Andrew Cooper)
---
 tools/9pfsd/io.c        | 177 +++++++++++++++++++++++++++++++++++++++-
 tools/9pfsd/xen-9pfsd.h |   1 +
 2 files changed, 175 insertions(+), 3 deletions(-)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index 4f6acefc87..498f275a27 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -28,9 +28,11 @@
 #define P9_CMD_VERSION    100
 #define P9_CMD_ATTACH     104
 #define P9_CMD_ERROR      107
+#define P9_CMD_WALK       110
 
 #define P9_MIN_MSIZE      2048
 #define P9_VERSION        "9P2000.u"
+#define P9_WALK_MAXELEM   16
 
 struct p9_qid {
     uint8_t type;
@@ -478,14 +480,29 @@ static struct p9_fid *find_fid(device *device, unsigned int fid)
     return NULL;
 }
 
+static struct p9_fid *get_fid_ref(device *device, unsigned int fid)
+{
+    struct p9_fid *fidp;
+
+    pthread_mutex_lock(&device->fid_mutex);
+
+    fidp = find_fid(device, fid);
+    if ( fidp )
+        fidp->ref++;
+
+    pthread_mutex_unlock(&device->fid_mutex);
+
+    return fidp;
+}
+
 static struct p9_fid *alloc_fid_mem(device *device, unsigned int fid,
                                     const char *path)
 {
     struct p9_fid *fidp;
     size_t pathlen;
 
-    pathlen = strlen(path);
-    fidp = calloc(sizeof(*fidp) + pathlen + 1, 1);
+    pathlen = strlen(path) + 1;
+    fidp = calloc(sizeof(*fidp) + pathlen, 1);
     if ( !fidp )
         return NULL;
 
@@ -504,7 +521,7 @@ static struct p9_fid *alloc_fid(device *device, unsigned int fid,
 
     if ( find_fid(device, fid) )
     {
-        errno = EBADFD;
+        errno = EBADF;
         goto out;
     }
 
@@ -578,6 +595,10 @@ static int fill_qid(device *device, const char *path, struct p9_qid *qid,
         stbuf = &st;
     }
 
+    /* Don't allow symbolic links. */
+    if ( S_ISLNK(stbuf->st_mode) )
+        return EMLINK;
+
     qid->type = S_ISDIR(stbuf->st_mode) ? QID_TYPE_DIR : 0;
     qid->version = stbuf->st_mtime ^ (stbuf->st_size << 8);
     qid->path = stbuf->st_ino;
@@ -585,6 +606,20 @@ static int fill_qid(device *device, const char *path, struct p9_qid *qid,
     return 0;
 }
 
+static bool name_ok(const char *str)
+{
+    if ( !*str )
+        return false;
+
+    if ( strchr(str, '/' ) )
+        return false;
+
+    if ( !strcmp(str, "..") || !strcmp(str, ".") )
+        return false;
+
+    return true;
+}
+
 static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
 {
     unsigned int erroff;
@@ -662,6 +697,138 @@ static void p9_attach(struct ring *ring, struct p9_header *hdr)
     fill_buffer(ring, hdr->cmd + 1, hdr->tag, "Q", &qid);
 }
 
+static void p9_walk(struct ring *ring, struct p9_header *hdr)
+{
+    device *device = ring->device;
+    uint32_t fid;
+    uint32_t newfid;
+    struct p9_fid *fidp = NULL;
+    struct p9_qid *qids = NULL;
+    unsigned int n_names = 0;
+    unsigned int *names = NULL;
+    unsigned int walked = 0;
+    unsigned int i;
+    char *path = NULL;
+    unsigned int path_len;
+    int ret;
+
+    ret = fill_data(ring, "UUaS", &fid, &newfid, &n_names, &names);
+    if ( n_names > P9_WALK_MAXELEM )
+    {
+        p9_error(ring, hdr->tag, EINVAL);
+        goto out;
+    }
+    if ( ret != 3 + n_names )
+    {
+        p9_error(ring, hdr->tag, errno);
+        goto out;
+    }
+
+    fidp = get_fid_ref(device, fid);
+    if ( !fidp )
+    {
+        p9_error(ring, hdr->tag, ENOENT);
+        goto out;
+    }
+    if ( fidp->opened )
+    {
+        p9_error(ring, hdr->tag, EINVAL);
+        goto out;
+    }
+
+    path_len = strlen(fidp->path) + 1;
+    for ( i = 0; i < n_names; i++ )
+    {
+        if ( !name_ok(ring->str + names[i]) )
+        {
+            p9_error(ring, hdr->tag, ENOENT);
+            goto out;
+        }
+        path_len += strlen(ring->str + names[i]) + 1;
+    }
+    path = calloc(path_len + 1, 1);
+    if ( !path )
+    {
+        p9_error(ring, hdr->tag, ENOMEM);
+        goto out;
+    }
+    strcpy(path, fidp->path);
+
+    if ( n_names )
+    {
+        qids = calloc(n_names, sizeof(*qids));
+        if ( !qids )
+        {
+            p9_error(ring, hdr->tag, ENOMEM);
+            goto out;
+        }
+        for ( i = 0; i < n_names; i++ )
+        {
+            strcat(path, "/");
+            strcat(path, ring->str + names[i]);
+            ret = fill_qid(device, path, qids + i, NULL);
+            if ( ret )
+            {
+                if ( !walked )
+                {
+                    p9_error(ring, hdr->tag, errno);
+                    goto out;
+                }
+                break;
+            }
+            walked++;
+        }
+    }
+
+    if ( walked == n_names )
+    {
+        bool ok = false;
+
+        if ( fid == newfid )
+        {
+            struct p9_fid *new_fidp;
+
+            pthread_mutex_lock(&device->fid_mutex);
+
+            if ( fidp->ref != 2 )
+            {
+                errno = EBUSY;
+            }
+            else
+            {
+                new_fidp = alloc_fid_mem(device, fid, path);
+                if ( new_fidp )
+                {
+                    new_fidp->ref = 2;
+                    XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+                    XEN_TAILQ_INSERT_HEAD(&device->fids, new_fidp, list);
+                    free(fidp);
+                    fidp = new_fidp;
+                    ok = true;
+                }
+            }
+
+            pthread_mutex_unlock(&device->fid_mutex);
+        }
+        else
+            ok = alloc_fid(device, newfid, path);
+
+        if ( !ok )
+        {
+            p9_error(ring, hdr->tag, errno);
+            goto out;
+        }
+    }
+
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "aQ", &walked, qids);
+
+ out:
+    free_fid(device, fidp);
+    free(qids);
+    free(path);
+    free(names);
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -725,6 +892,10 @@ void *io_thread(void *arg)
                 p9_attach(ring, &hdr);
                 break;
 
+            case P9_CMD_WALK:
+                p9_walk(ring, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        ring->device->domid, ring->device->devid, hdr.cmd);
diff --git a/tools/9pfsd/xen-9pfsd.h b/tools/9pfsd/xen-9pfsd.h
index 6c755411a7..f01fffb0bb 100644
--- a/tools/9pfsd/xen-9pfsd.h
+++ b/tools/9pfsd/xen-9pfsd.h
@@ -25,6 +25,7 @@ struct p9_fid {
     XEN_TAILQ_ENTRY(struct p9_fid) list;
     unsigned int fid;
     unsigned int ref;
+    bool opened;
     char path[];
 };
 
-- 
2.35.3


