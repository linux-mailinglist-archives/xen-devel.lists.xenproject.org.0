Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E724855ADB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 07:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681258.1059962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVfS-0005qx-BX; Thu, 15 Feb 2024 06:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681258.1059962; Thu, 15 Feb 2024 06:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVfS-0005nu-7b; Thu, 15 Feb 2024 06:56:22 +0000
Received: by outflank-mailman (input) for mailman id 681258;
 Thu, 15 Feb 2024 06:56:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raVfQ-0003c6-5i
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 06:56:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 517aa5e1-cbcf-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 07:56:18 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C9E2F21DA6;
 Thu, 15 Feb 2024 06:56:17 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 97AE61346A;
 Thu, 15 Feb 2024 06:56:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 1tWJI5G1zWVaSQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 06:56:17 +0000
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
X-Inumbo-ID: 517aa5e1-cbcf-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYco3d2a7SkA/imW9UK5aS4CeR/UeIsWQgnqFK/FENQ=;
	b=g9fBmyWZdHM3PCYTBMucFnsB5BRZGYNacaQPLmGhTu13H8jBOWPdd82YR5pknXlUZnK3la
	233vcY2eL06TPujrWhsotVa5NqRFBDrPLm9tP2mCiJSj2E1xce9lM19Ht5W/gT5rpsT8IE
	qz7nTNGnDccWGH7bj0O4cEqoO8DrqNE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYco3d2a7SkA/imW9UK5aS4CeR/UeIsWQgnqFK/FENQ=;
	b=g9fBmyWZdHM3PCYTBMucFnsB5BRZGYNacaQPLmGhTu13H8jBOWPdd82YR5pknXlUZnK3la
	233vcY2eL06TPujrWhsotVa5NqRFBDrPLm9tP2mCiJSj2E1xce9lM19Ht5W/gT5rpsT8IE
	qz7nTNGnDccWGH7bj0O4cEqoO8DrqNE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v6 06/21] tools/xen-9pfsd: add 9pfs attach request support
Date: Thu, 15 Feb 2024 07:55:26 +0100
Message-Id: <20240215065541.21067-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240215065541.21067-1-jgross@suse.com>
References: <20240215065541.21067-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=g9fBmyWZ
X-Spamd-Result: default: False [1.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.69
X-Rspamd-Queue-Id: C9E2F21DA6
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

Add the attach request of the 9pfs protocol. This introduces the "fid"
scheme of the 9pfs protocol.

As this will be needed later, use a dedicated memory allocation
function in alloc_fid() and prepare a fid reference count.

For filling the qid data take the approach from the qemu 9pfs backend
implementation.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V2:
- make fill_qid() parameter stbuf const (Jason Andryuk)
- free fids after disconnecting guest (Jason Andryuk)
V3:
- only store relative path in fid (Jason Andryuk)
V4:
- store a path directly usable by *at() functions in fid (Jason Andryuk)
---
 tools/9pfsd/io.c        | 164 ++++++++++++++++++++++++++++++++++++++++
 tools/9pfsd/xen-9pfsd.c |   6 ++
 tools/9pfsd/xen-9pfsd.h |  14 ++++
 3 files changed, 184 insertions(+)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index 839dd1112c..4f6acefc87 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -11,11 +11,14 @@
  * before looking for the next request.
  */
 
+#include <assert.h>
 #include <errno.h>
 #include <stdbool.h>
 #include <stdlib.h>
 #include <string.h>
 #include <syslog.h>
+#include <sys/types.h>
+#include <sys/stat.h>
 #include <xenctrl.h>           /* For cpu barriers. */
 #include <xen-tools/common-macros.h>
 
@@ -23,6 +26,7 @@
 
 /* P9 protocol commands (response is either cmd+1 or P9_CMD_ERROR). */
 #define P9_CMD_VERSION    100
+#define P9_CMD_ATTACH     104
 #define P9_CMD_ERROR      107
 
 #define P9_MIN_MSIZE      2048
@@ -461,6 +465,126 @@ static int fill_data(struct ring *ring, const char *fmt, ...)
     return pars;
 }
 
+static struct p9_fid *find_fid(device *device, unsigned int fid)
+{
+    struct p9_fid *fidp;
+
+    XEN_TAILQ_FOREACH(fidp, &device->fids, list)
+    {
+        if ( fidp->fid == fid )
+            return fidp;
+    }
+
+    return NULL;
+}
+
+static struct p9_fid *alloc_fid_mem(device *device, unsigned int fid,
+                                    const char *path)
+{
+    struct p9_fid *fidp;
+    size_t pathlen;
+
+    pathlen = strlen(path);
+    fidp = calloc(sizeof(*fidp) + pathlen + 1, 1);
+    if ( !fidp )
+        return NULL;
+
+    fidp->fid = fid;
+    strncpy(fidp->path, path, pathlen);
+
+    return fidp;
+}
+
+static struct p9_fid *alloc_fid(device *device, unsigned int fid,
+                                const char *path)
+{
+    struct p9_fid *fidp = NULL;
+
+    pthread_mutex_lock(&device->fid_mutex);
+
+    if ( find_fid(device, fid) )
+    {
+        errno = EBADFD;
+        goto out;
+    }
+
+    if ( device->n_fids >= device->max_open_files )
+    {
+        errno = EMFILE;
+        goto out;
+    }
+
+    fidp = alloc_fid_mem(device, fid, path);
+    if ( !fidp )
+        goto out;
+
+    fidp->ref = 1;
+    XEN_TAILQ_INSERT_HEAD(&device->fids, fidp, list);
+    device->n_fids++;
+
+ out:
+    pthread_mutex_unlock(&device->fid_mutex);
+
+    return fidp;
+}
+
+static void free_fid(device *device, struct p9_fid *fidp)
+{
+    if ( !fidp )
+        return;
+
+    pthread_mutex_lock(&device->fid_mutex);
+
+    fidp->ref--;
+    if ( !fidp->ref )
+    {
+        device->n_fids--;
+        XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+        free(fidp);
+    }
+
+    pthread_mutex_unlock(&device->fid_mutex);
+}
+
+void free_fids(device *device)
+{
+    struct p9_fid *fidp;
+
+    while ( (fidp = XEN_TAILQ_FIRST(&device->fids)) != NULL )
+    {
+        XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+        free(fidp);
+    }
+}
+
+static const char *relpath_from_path(const char *path)
+{
+    if (!strcmp(path, "/"))
+        return ".";
+
+    return (path[0] == '/') ? path + 1 : path;
+}
+
+static int fill_qid(device *device, const char *path, struct p9_qid *qid,
+                    const struct stat *stbuf)
+{
+    struct stat st;
+
+    if ( !stbuf )
+    {
+        if ( fstatat(device->root_fd, path, &st, 0) )
+            return errno;
+
+        stbuf = &st;
+    }
+
+    qid->type = S_ISDIR(stbuf->st_mode) ? QID_TYPE_DIR : 0;
+    qid->version = stbuf->st_mtime ^ (stbuf->st_size << 8);
+    qid->path = stbuf->st_ino;
+
+    return 0;
+}
+
 static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
 {
     unsigned int erroff;
@@ -502,6 +626,42 @@ static void p9_version(struct ring *ring, struct p9_header *hdr)
     fill_buffer(ring, hdr->cmd + 1, hdr->tag, "US", &ring->max_size, version);
 }
 
+static void p9_attach(struct ring *ring, struct p9_header *hdr)
+{
+    device *device = ring->device;
+    uint32_t fid;
+    uint32_t dummy_u32;
+    unsigned int dummy_uint;
+    struct p9_qid qid;
+    int ret;
+
+    ret = fill_data(ring, "UUSSU", &fid, &dummy_u32, &dummy_uint, &dummy_uint,
+                    &dummy_u32);
+    if ( ret != 5 )
+    {
+        p9_error(ring, hdr->tag, errno);
+        return;
+    }
+
+    device->root_fid = alloc_fid(device, fid, relpath_from_path("/"));
+    if ( !device->root_fid )
+    {
+        p9_error(ring, hdr->tag, errno);
+        return;
+    }
+
+    ret = fill_qid(device, device->root_fid->path, &qid, NULL);
+    if ( ret )
+    {
+        free_fid(device, device->root_fid);
+        device->root_fid = NULL;
+        p9_error(ring, hdr->tag, ret);
+        return;
+    }
+
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "Q", &qid);
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -561,6 +721,10 @@ void *io_thread(void *arg)
                 p9_version(ring, &hdr);
                 break;
 
+            case P9_CMD_ATTACH:
+                p9_attach(ring, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        ring->device->domid, ring->device->devid, hdr.cmd);
diff --git a/tools/9pfsd/xen-9pfsd.c b/tools/9pfsd/xen-9pfsd.c
index 73b6c3a30e..b83b896bcc 100644
--- a/tools/9pfsd/xen-9pfsd.c
+++ b/tools/9pfsd/xen-9pfsd.c
@@ -304,6 +304,9 @@ static device *new_device(unsigned int domid, unsigned int devid)
         return NULL;
     }
 
+    pthread_mutex_init(&device->fid_mutex, NULL);
+    XEN_TAILQ_INIT(&device->fids);
+
     val = read_backend_node(device, "security_model");
     if ( !val || strcmp(val, "none") )
     {
@@ -399,6 +402,8 @@ static void disconnect_guest(device *device)
     }
 
     device->num_rings = 0;
+
+    free_fids(device);
 }
 
 static void close_device(device *device, enum xenbus_state state)
@@ -482,6 +487,7 @@ static void remove_device(device *device)
     XEN_TAILQ_REMOVE(&devs, device, list);
 
     disconnect_guest(device);
+    pthread_mutex_destroy(&device->fid_mutex);
     free_device(device);
 }
 
diff --git a/tools/9pfsd/xen-9pfsd.h b/tools/9pfsd/xen-9pfsd.h
index 0cde0d2bb8..6c755411a7 100644
--- a/tools/9pfsd/xen-9pfsd.h
+++ b/tools/9pfsd/xen-9pfsd.h
@@ -21,6 +21,13 @@ struct p9_header {
     uint16_t tag;
 } __attribute__((packed));
 
+struct p9_fid {
+    XEN_TAILQ_ENTRY(struct p9_fid) list;
+    unsigned int fid;
+    unsigned int ref;
+    char path[];
+};
+
 typedef struct device device;
 
 struct ring {
@@ -71,10 +78,17 @@ struct device {
     unsigned int num_rings;
     struct ring *ring[MAX_RINGS];
     int root_fd;
+
+    /* File system handling. */
+    pthread_mutex_t fid_mutex;
+    XEN_TAILQ_HEAD(fidhead, struct p9_fid) fids;
+    struct p9_fid *root_fid;
+    unsigned int n_fids;
 };
 
 extern xenevtchn_handle *xe;
 
 void *io_thread(void *arg);
+void free_fids(device *device);
 
 #endif /* XEN_9PFSD_H */
-- 
2.35.3


