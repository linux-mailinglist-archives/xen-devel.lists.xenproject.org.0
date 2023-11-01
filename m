Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E6C7DDECA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626357.976602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7vw-0002F9-FK; Wed, 01 Nov 2023 09:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626357.976602; Wed, 01 Nov 2023 09:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7vw-0002Ck-C8; Wed, 01 Nov 2023 09:54:44 +0000
Received: by outflank-mailman (input) for mailman id 626357;
 Wed, 01 Nov 2023 09:54:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7c0-0005E0-LA
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:34:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce330d39-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:34:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CCAC721846;
 Wed,  1 Nov 2023 09:34:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8A4513460;
 Wed,  1 Nov 2023 09:34:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DT/6J48bQmXfCAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:34:07 +0000
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
X-Inumbo-ID: ce330d39-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=clPD8bKrjSItRh9+J5fvt9orEmlHmagPq1GlV/FwboY=;
	b=D9zW62sR92TOA5HFFrtOsYmlL7GuRQ/rDUKePCyhjT1JNbadVW38EdE/kU/aKfH4t3VnLt
	abq5QUf/XX4358xfp4zwFWDK2UIhGDqZvlc/Le4idc0kx/9ehwPKBGBOyy6UWX2ZyMJ7aO
	86Ean3ncbL739Wv611m+LwA+2+3gKmE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 07/29] tools/xenlogd: add 9pfs attach request support
Date: Wed,  1 Nov 2023 10:33:03 +0100
Message-Id: <20231101093325.30302-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the attach request of the 9pfs protocol. This introduces the "fid"
scheme of the 9pfs protocol.

As this will be needed later, use a dedicated memory allocation
function in alloc_fid().

For filling the qid data take the approach from the qemu 9pfs backend
implementation.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenlogd/io.c      | 128 ++++++++++++++++++++++++++++++++++++++++
 tools/xenlogd/xenlogd.c |   1 +
 tools/xenlogd/xenlogd.h |  11 ++++
 3 files changed, 140 insertions(+)

diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
index f35520018f..fa825c9f39 100644
--- a/tools/xenlogd/io.c
+++ b/tools/xenlogd/io.c
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
@@ -434,6 +437,92 @@ static int fill_data(device *device, const char *fmt, ...)
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
+    struct p9_fid *fidp;
+
+    if ( find_fid(device, fid) )
+    {
+        errno = EBADFD;
+        return NULL;
+    }
+
+    if ( device->n_fids >= device->max_open_files )
+    {
+        errno = EMFILE;
+        return NULL;
+    }
+
+    fidp = alloc_fid_mem(device, fid, path);
+    if ( !fidp )
+        return NULL;
+
+    XEN_TAILQ_INSERT_HEAD(&device->fids, fidp, list);
+    device->n_fids++;
+
+    return fidp;
+}
+
+static void free_fid(device *device, struct p9_fid *fidp)
+{
+    if ( !fidp )
+        return;
+
+    device->n_fids--;
+    XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+    free(fidp);
+}
+
+static int fill_qid(const char *path, struct p9_qid *qid, struct stat *stbuf)
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
 static void p9_error(device *device, uint16_t tag, uint32_t err)
 {
     unsigned int erroff;
@@ -476,6 +565,41 @@ static void p9_version(device *device, struct p9_header *hdr)
                 version);
 }
 
+static void p9_attach(device *device, struct p9_header *hdr)
+{
+    uint32_t fid;
+    uint32_t dummy_u32;
+    unsigned int dummy_uint;
+    struct p9_qid qid;
+    int ret;
+
+    ret = fill_data(device, "UUSSU", &fid, &dummy_u32, &dummy_uint, &dummy_uint,
+                    &dummy_u32);
+    if ( ret != 5 )
+    {
+        p9_error(device, hdr->tag, errno);
+        return;
+    }
+
+    device->root_fid = alloc_fid(device, fid, "");
+    if ( !device->root_fid )
+    {
+        p9_error(device, hdr->tag, errno);
+        return;
+    }
+
+    ret = fill_qid(device->host_path, &qid, NULL);
+    if ( ret )
+    {
+        free_fid(device, device->root_fid);
+        device->root_fid = NULL;
+        p9_error(device, hdr->tag, ret);
+        return;
+    }
+
+    fill_buffer(device, hdr->cmd + 1, hdr->tag, "Q", &qid);
+}
+
 void *io_thread(void *arg)
 {
     device *device = arg;
@@ -535,6 +659,10 @@ void *io_thread(void *arg)
                 p9_version(device, &hdr);
                 break;
 
+            case P9_CMD_ATTACH:
+                p9_attach(device, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        device->domid, device->devid, hdr.cmd);
diff --git a/tools/xenlogd/xenlogd.c b/tools/xenlogd/xenlogd.c
index da0a09a122..d2de7bfbf2 100644
--- a/tools/xenlogd/xenlogd.c
+++ b/tools/xenlogd/xenlogd.c
@@ -274,6 +274,7 @@ static device *new_device(unsigned int domid, unsigned int devid)
 
     pthread_cond_init(&device->cond, NULL);
     pthread_mutex_init(&device->mutex, NULL);
+    XEN_TAILQ_INIT(&device->fids);
 
     val = read_backend_node(device, "security_model");
     if ( !val || strcmp(val, "none") )
diff --git a/tools/xenlogd/xenlogd.h b/tools/xenlogd/xenlogd.h
index c10c6aa9e5..bd2a283ccb 100644
--- a/tools/xenlogd/xenlogd.h
+++ b/tools/xenlogd/xenlogd.h
@@ -19,6 +19,12 @@ struct p9_header {
     uint16_t tag;
 } __attribute__((packed));
 
+struct p9_fid {
+    XEN_TAILQ_ENTRY(struct p9_fid) list;
+    unsigned int fid;
+    char path[];
+};
+
 typedef struct device device;
 struct device {
     /* Admin data. */
@@ -60,6 +66,11 @@ struct device {
     char *str;              /* String work space. */
     unsigned int str_size;  /* Size of *str. */
     unsigned int str_used;  /* Currently used size of *str. */
+
+    /* File system handling. */
+    XEN_TAILQ_HEAD(fidhead, struct p9_fid) fids;
+    struct p9_fid *root_fid;
+    unsigned int n_fids;
 };
 
 extern xenevtchn_handle *xe;
-- 
2.35.3


