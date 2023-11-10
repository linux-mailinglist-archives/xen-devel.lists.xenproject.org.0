Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476387E7D97
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630476.983363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U3t-0006ZE-Jn; Fri, 10 Nov 2023 16:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630476.983363; Fri, 10 Nov 2023 16:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U3t-0006WG-GX; Fri, 10 Nov 2023 16:08:49 +0000
Received: by outflank-mailman (input) for mailman id 630476;
 Fri, 10 Nov 2023 16:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U3s-0004cS-JM
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:08:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d4ee1bb-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:08:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D5432187C;
 Fri, 10 Nov 2023 16:08:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14AF013398;
 Fri, 10 Nov 2023 16:08:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i96uA45VTmWmCAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:08:46 +0000
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
X-Inumbo-ID: 6d4ee1bb-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXMUzNYrgUE7yKY/59/v2Vn6B+SqNKU5mV5KPcdYjpU=;
	b=fqE2QvSzbCJMwaxIhGm0OkBdBxXN6SUXC82ZvxfZaKcwnfbjpOoe0eg8jO/xT6vYkW0EM7
	JWOBKwBKgtcBNXHsxu2PtauLhlPTTzHHhRe0//VV7MpMtNpqle12Ib6mqIoaO5lSEueOuQ
	RQFfe9ClnyuKyvPk47PzZQEPb5vkEXQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 07/29] tools/xenlogd: add 9pfs attach request support
Date: Fri, 10 Nov 2023 17:07:42 +0100
Message-Id: <20231110160804.29021-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the attach request of the 9pfs protocol. This introduces the "fid"
scheme of the 9pfs protocol.

As this will be needed later, use a dedicated memory allocation
function in alloc_fid() and prepare a fid reference count.

For filling the qid data take the approach from the qemu 9pfs backend
implementation.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- make fill_qid() parameter stbuf const (Jason Andryuk)
- free fids after disconnecting guest (Jason Andryuk)
---
 tools/xen-9pfsd/io.c        | 155 ++++++++++++++++++++++++++++++++++++
 tools/xen-9pfsd/xen-9pfsd.c |   6 ++
 tools/xen-9pfsd/xen-9pfsd.h |  14 ++++
 3 files changed, 175 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index 18f81319b4..03e45d5f8b 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -16,6 +16,8 @@
 #include <stdlib.h>
 #include <string.h>
 #include <syslog.h>
+#include <sys/types.h>
+#include <sys/stat.h>
 #include <xenctrl.h>           /* For cpu barriers. */
 #include <xen-tools/common-macros.h>
 
@@ -23,6 +25,7 @@
 
 /* P9 protocol commands (response is either cmd+1 or P9_CMD_ERROR). */
 #define P9_CMD_VERSION    100
+#define P9_CMD_ATTACH     104
 #define P9_CMD_ERROR      107
 
 #define P9_MIN_MSIZE      2048
@@ -443,6 +446,118 @@ static int fill_data(struct ring *ring, const char *fmt, ...)
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
+    pathlen = strlen(device->host_path) + strlen(path) + 1;
+    fidp = calloc(sizeof(*fidp) + pathlen, 1);
+    if ( !fidp )
+        return NULL;
+
+    fidp->fid = fid;
+    snprintf(fidp->path, pathlen, "%s%s", device->host_path, path);
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
+static int fill_qid(const char *path, struct p9_qid *qid,
+                    const struct stat *stbuf)
+{
+    struct stat st;
+
+    if ( !stbuf )
+    {
+        if ( stat(path, &st) )
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
@@ -484,6 +599,42 @@ static void p9_version(struct ring *ring, struct p9_header *hdr)
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
+    device->root_fid = alloc_fid(device, fid, "");
+    if ( !device->root_fid )
+    {
+        p9_error(ring, hdr->tag, errno);
+        return;
+    }
+
+    ret = fill_qid(device->host_path, &qid, NULL);
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
@@ -543,6 +694,10 @@ void *io_thread(void *arg)
                 p9_version(ring, &hdr);
                 break;
 
+            case P9_CMD_ATTACH:
+                p9_attach(ring, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        ring->device->domid, ring->device->devid, hdr.cmd);
diff --git a/tools/xen-9pfsd/xen-9pfsd.c b/tools/xen-9pfsd/xen-9pfsd.c
index cc5734402d..534c0cefa5 100644
--- a/tools/xen-9pfsd/xen-9pfsd.c
+++ b/tools/xen-9pfsd/xen-9pfsd.c
@@ -278,6 +278,9 @@ static device *new_device(unsigned int domid, unsigned int devid)
         return NULL;
     }
 
+    pthread_mutex_init(&device->fid_mutex, NULL);
+    XEN_TAILQ_INIT(&device->fids);
+
     val = read_backend_node(device, "security_model");
     if ( !val || strcmp(val, "none") )
     {
@@ -370,6 +373,8 @@ static void disconnect_guest(device *device)
     }
 
     device->num_rings = 0;
+
+    free_fids(device);
 }
 
 static void close_device(device *device, enum xenbus_state state)
@@ -454,6 +459,7 @@ static void remove_device(device *device)
     XEN_TAILQ_REMOVE(&devs, device, list);
 
     disconnect_guest(device);
+    pthread_mutex_destroy(&device->fid_mutex);
     free_device(device);
 }
 
diff --git a/tools/xen-9pfsd/xen-9pfsd.h b/tools/xen-9pfsd/xen-9pfsd.h
index 5ff87ca5bd..e511acdb76 100644
--- a/tools/xen-9pfsd/xen-9pfsd.h
+++ b/tools/xen-9pfsd/xen-9pfsd.h
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
@@ -70,10 +77,17 @@ struct device {
     enum xenbus_state frontend_state;
     unsigned int num_rings;
     struct ring *ring[MAX_RINGS];
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


