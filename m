Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF5689355
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 10:19:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489077.757443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNsDZ-0001Af-9U; Fri, 03 Feb 2023 09:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489077.757443; Fri, 03 Feb 2023 09:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNsDZ-000191-4G; Fri, 03 Feb 2023 09:18:49 +0000
Received: by outflank-mailman (input) for mailman id 489077;
 Fri, 03 Feb 2023 09:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HD5o=57=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pNsDW-0006sG-Qr
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 09:18:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2af7a08-a3a3-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 10:18:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DCDDF20FB3;
 Fri,  3 Feb 2023 09:18:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B12891346D;
 Fri,  3 Feb 2023 09:18:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qiq+KXXR3GNOEwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 03 Feb 2023 09:18:45 +0000
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
X-Inumbo-ID: c2af7a08-a3a3-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675415925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTiD9k1sCY7qPC5hUeI+17ax3Vq23ag+y7zk3UOd7aM=;
	b=SLfU45Jhn6S379Qf7olIldMyNbApKjP//8ON7kw9NH2TA2HhAExqlDviup7UwFR8krpqGm
	cl7Yqor4zT6gA1x/RrG419ScopckPtWmEuzvQGnGzygUL25bfNvZUaou/IWHJzZpn2HhB+
	6DWrguxS5RC/61hvj9l6XxIBLOk/3ws=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 6/7] Mini-OS: add open and close handling to the 9pfs frontend
Date: Fri,  3 Feb 2023 10:18:08 +0100
Message-Id: <20230203091809.14478-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230203091809.14478-1-jgross@suse.com>
References: <20230203091809.14478-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the open() and close() support to the 9pfs frontend. This requires
to split the path name and to walk to the desired directory level.

The opened file needs to be queried via stat in order to obtain the
data needed for proper access (access rights, size, type of file).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 9pfront.c | 285 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 283 insertions(+), 2 deletions(-)

diff --git a/9pfront.c b/9pfront.c
index f6fac50a..ebe48601 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -6,6 +6,7 @@
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
 #include <mini-os/events.h>
+#include <mini-os/fcntl.h>
 #include <mini-os/gnttab.h>
 #include <mini-os/semaphore.h>
 #include <mini-os/wait.h>
@@ -52,13 +53,32 @@ struct dev_9pfs {
     struct wait_queue_head waitq;
     struct semaphore ring_out_sem;
     struct semaphore ring_in_sem;
+
+    unsigned long long fid_mask;              /* Bit mask for free fids. */
+};
+
+struct file_9pfs {
+    uint32_t fid;
+    struct dev_9pfs *dev;
+    bool append;
 };
 
 #define DEFAULT_9PFS_RING_ORDER  4
 
+/* P9 protocol commands (response is either cmd+1 or P9_CMD_ERROR). */
 #define P9_CMD_VERSION    100
 #define P9_CMD_ATTACH     104
 #define P9_CMD_ERROR      107
+#define P9_CMD_WALK       110
+#define P9_CMD_OPEN       112
+#define P9_CMD_CREATE     114
+#define P9_CMD_CLUNK      120
+
+/* P9 protocol open flags. */
+#define P9_OREAD            0   /* read */
+#define P9_OWRITE           1   /* write */
+#define P9_ORDWR            2   /* read and write */
+#define P9_OTRUNC          16   /* or'ed in, truncate file first */
 
 struct p9_header {
     uint32_t size;
@@ -67,10 +87,27 @@ struct p9_header {
 } __attribute__((packed));
 
 #define P9_VERSION        "9P2000.u"
-#define P9_ROOT_FID       ~0
+#define P9_ROOT_FID       0
 
 static unsigned int ftype_9pfs;
 
+static unsigned int get_fid(struct dev_9pfs *dev)
+{
+    unsigned int fid;
+
+    fid = ffs(dev->fid_mask);
+    if ( fid )
+        dev->fid_mask &= 1ULL << (fid - 1);
+
+     return fid;
+}
+
+static void put_fid(struct dev_9pfs *dev, unsigned int fid)
+{
+    if ( fid )
+        dev->fid_mask |= 1ULL << (fid - 1);
+}
+
 static struct req *get_free_req(struct dev_9pfs *dev)
 {
     struct req *req;
@@ -138,6 +175,9 @@ static void copy_from_ring(struct dev_9pfs *dev, void *data, unsigned int len)
  * send_9p() and rcv_9p() are using a special format string for specifying
  * the kind of data sent/expected. Each data item is represented by a single
  * character:
+ * b: 1 byte unsigned integer (uint8_t)
+ *    Only valid for sending.
+ * u: 2 byte unsigned integer (uint16_t)
  * U: 4 byte unsigned integer (uint32_t)
  * S: String (2 byte length + <length> characters)
  *    in the rcv_9p() case the data for string is allocated (length omitted,
@@ -151,7 +191,9 @@ static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
     va_list ap, aq;
     const char *f;
     uint32_t intval;
+    uint16_t shortval;
     uint16_t len;
+    uint8_t byte;
     char *strval;
 
     hdr.size = sizeof(hdr);
@@ -165,6 +207,14 @@ static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
     {
         switch ( *f )
         {
+        case 'b':
+            hdr.size += 1;
+            byte = va_arg(aq, unsigned int);
+            break;
+        case 'u':
+            hdr.size += 2;
+            shortval = va_arg(aq, unsigned int);
+            break;
         case 'U':
             hdr.size += 4;
             intval = va_arg(aq, unsigned int);
@@ -194,6 +244,14 @@ static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
     {
         switch ( *f )
         {
+        case 'b':
+            byte = va_arg(ap, unsigned int);
+            copy_to_ring(dev, &byte, sizeof(byte));
+            break;
+        case 'u':
+            shortval = va_arg(ap, unsigned int);
+            copy_to_ring(dev, &shortval, sizeof(shortval));
+            break;
         case 'U':
             intval = va_arg(ap, unsigned int);
             copy_to_ring(dev, &intval, sizeof(intval));
@@ -263,6 +321,7 @@ static void rcv_9p_copy(struct dev_9pfs *dev, struct req *req,
     char *str;
     uint16_t len;
     uint32_t err;
+    uint16_t *shortval;
     uint32_t *val;
     char **strval;
     uint8_t *qval;
@@ -320,6 +379,10 @@ static void rcv_9p_copy(struct dev_9pfs *dev, struct req *req,
     {
         switch ( *f )
         {
+        case 'u':
+            shortval = va_arg(ap, uint16_t *);
+            copy_bufs(&buf1, &buf2, &len1, &len2, shortval, sizeof(*shortval));
+            break;
         case 'U':
             val = va_arg(ap, uint32_t *);
             copy_bufs(&buf1, &buf2, &len1, &len2, val, sizeof(*val));
@@ -459,6 +522,134 @@ static int p9_attach(struct dev_9pfs *dev)
     return ret;
 }
 
+static int p9_clunk(struct dev_9pfs *dev, uint32_t fid)
+{
+    struct req *req = get_free_req(dev);
+    int ret;
+
+    if ( !req )
+        return ENOENT;
+
+    req->cmd = P9_CMD_CLUNK;
+    send_9p(dev, req, "U", fid);
+    rcv_9p(dev, req, "");
+    ret = req->result;
+
+    put_free_req(dev, req);
+
+    return ret;
+}
+
+static int p9_walk(struct dev_9pfs *dev, uint32_t fid, uint32_t newfid,
+                   char *name)
+{
+    struct req *req = get_free_req(dev);
+    int ret;
+    uint16_t nqid;
+    uint8_t qid[13];
+
+    if ( !req )
+        return ENOENT;
+
+    req->cmd = P9_CMD_WALK;
+    if ( name[0] )
+        send_9p(dev, req, "UUuS", fid, newfid, 1, name);
+    else
+        send_9p(dev, req, "UUu", fid, newfid, 0);
+    rcv_9p(dev, req, "uQ", &nqid, qid);
+
+    ret = req->result;
+
+    put_free_req(dev, req);
+
+    return ret;
+}
+
+static int p9_open(struct dev_9pfs *dev, uint32_t fid, uint8_t omode)
+{
+    struct req *req = get_free_req(dev);
+    int ret;
+    uint8_t qid[13];
+    uint32_t iounit;
+
+    if ( !req )
+        return ENOENT;
+
+    req->cmd = P9_CMD_OPEN;
+    send_9p(dev, req, "Ub", fid, omode);
+    rcv_9p(dev, req, "QU", qid, &iounit);
+
+    ret = req->result;
+
+    put_free_req(dev, req);
+
+    return ret;
+}
+
+static int p9_create(struct dev_9pfs *dev, uint32_t fid, char *path,
+                     uint32_t mode, uint8_t omode)
+{
+    struct req *req = get_free_req(dev);
+    int ret;
+    uint8_t qid[13];
+    uint32_t iounit;
+
+    if ( !req )
+        return ENOENT;
+
+    req->cmd = P9_CMD_CREATE;
+    send_9p(dev, req, "USUbS", fid, path, mode, omode, "");
+    rcv_9p(dev, req, "QU", qid, &iounit);
+
+    ret = req->result;
+
+    put_free_req(dev, req);
+
+    return ret;
+}
+
+/*
+ * Walk from root <steps> levels with the levels listed in <*paths> as a
+ * sequence of names. Returns the number of steps not having been able to
+ * walk, with <*paths> pointing at the name of the failing walk step.
+ * <fid> will be associated with the last successful walk step. Note that
+ * the first step should always succeed, as it is an empty walk in order
+ * to start at the root (needed for creating new files in root).
+ */
+static unsigned int walk_9pfs(struct dev_9pfs *dev, uint32_t fid,
+                              unsigned int steps, char **paths)
+{
+    uint32_t curr_fid = P9_ROOT_FID;
+    int ret;
+
+    while ( steps-- )
+    {
+        ret = p9_walk(dev, curr_fid, fid, *paths);
+        if ( ret )
+            return steps + 1;
+        curr_fid = fid;
+        *paths += strlen(*paths) + 1;
+    }
+
+    return 0;
+}
+
+static unsigned int split_path(const char *pathname, char **split_ptr)
+{
+    unsigned int parts = 1;
+    char *p;
+
+    *split_ptr = strdup(pathname);
+
+    for ( p = strchr(*split_ptr, '/'); p; p = strchr(p + 1, '/') )
+    {
+        *p = 0;
+        parts++;
+    }
+
+    return parts;
+}
+
 static int connect_9pfs(struct dev_9pfs *dev)
 {
     int ret;
@@ -477,10 +668,98 @@ static void intr_9pfs(evtchn_port_t port, struct pt_regs *regs, void *data)
     wake_up(&dev->waitq);
 }
 
+static int close_9pfs(struct file *file)
+{
+    struct file_9pfs *f9pfs = file->filedata;
+
+    if ( f9pfs->fid != P9_ROOT_FID )
+    {
+        p9_clunk(f9pfs->dev, f9pfs->fid);
+        put_fid(f9pfs->dev, f9pfs->fid);
+    }
+
+    free(f9pfs);
+
+    return 0;
+}
+
 static int open_9pfs(struct mount_point *mnt, const char *pathname, int flags,
                      mode_t mode)
 {
-    errno = ENOSYS;
+    int fd;
+    char *path = NULL;
+    char *p;
+    struct file *file;
+    struct file_9pfs *f9pfs;
+    uint16_t nwalk;
+    uint8_t omode;
+    int ret;
+
+    f9pfs = calloc(1, sizeof(*f9pfs));
+    f9pfs->dev = mnt->dev;
+    f9pfs->fid = P9_ROOT_FID;
+
+    fd = alloc_fd(ftype_9pfs);
+    file = get_file_from_fd(fd);
+    file->filedata = f9pfs;
+
+    switch ( flags & O_ACCMODE )
+    {
+    case O_RDONLY:
+        omode = P9_OREAD;
+        break;
+    case O_WRONLY:
+        omode = P9_OWRITE;
+        break;
+    case O_RDWR:
+        omode = P9_ORDWR;
+        break;
+    default:
+        ret = EINVAL;
+        goto err;
+    }
+
+    if ( flags & O_TRUNC )
+        omode |= P9_OTRUNC;
+    f9pfs->append = flags & O_APPEND;
+
+    nwalk = split_path(pathname + strlen(mnt->path), &path);
+
+    f9pfs->fid = get_fid(mnt->dev);
+    if ( !f9pfs->fid )
+    {
+        ret = ENFILE;
+        goto err;
+    }
+    p = path;
+    nwalk = walk_9pfs(mnt->dev, f9pfs->fid, nwalk, &p);
+    if ( nwalk )
+    {
+        if ( nwalk > 1 || !(flags & O_CREAT) )
+        {
+            ret = ENOENT;
+            goto err;
+        }
+
+        ret = p9_create(mnt->dev, f9pfs->fid, p, mode, omode);
+        if ( ret )
+            goto err;
+        goto out;
+    }
+
+    ret = p9_open(mnt->dev, f9pfs->fid, omode);
+    if ( ret )
+        goto err;
+
+ out:
+    free(path);
+
+    return fd;
+
+ err:
+    free(path);
+    close(fd);
+    errno = ret;
 
     return -1;
 }
@@ -525,6 +804,7 @@ void *init_9pfront(unsigned int id, const char *mnt)
     init_waitqueue_head(&dev->waitq);
     init_SEMAPHORE(&dev->ring_out_sem, 1);
     init_SEMAPHORE(&dev->ring_in_sem, 1);
+    dev->fid_mask = ~0ULL;
 
     for ( i = 0; i < N_REQS; i++ )
     {
@@ -720,6 +1000,7 @@ void shutdown_9pfront(void *dev)
 
 static const struct file_ops ops_9pfs = {
     .name = "9pfs",
+    .close = close_9pfs,
 };
 
 __attribute__((constructor))
-- 
2.35.3


