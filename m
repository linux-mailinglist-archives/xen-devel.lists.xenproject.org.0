Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35D6693FE6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 09:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494248.764304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRUSf-0000yh-Te; Mon, 13 Feb 2023 08:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494248.764304; Mon, 13 Feb 2023 08:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRUSf-0000x3-OO; Mon, 13 Feb 2023 08:45:21 +0000
Received: by outflank-mailman (input) for mailman id 494248;
 Mon, 13 Feb 2023 08:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DRhn=6J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pRUSI-0006An-PA
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 08:44:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b05b9c56-ab7a-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 09:44:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 15D2437870;
 Mon, 13 Feb 2023 08:44:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2B901391B;
 Mon, 13 Feb 2023 08:44:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MGEsNob46WNwRAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Feb 2023 08:44:54 +0000
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
X-Inumbo-ID: b05b9c56-ab7a-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676277895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsb+k9M0ZRBDQHW/kSOuXta4SExd/WLGLnOu4GRbNW4=;
	b=Fcg2Q83nLC0WBcoRucEIdajqN7DsYJYPRsQPs+EnbbinXqqUVaSWq/5SZvWLrMiVUuH7OM
	6RvXh3I1syHWV0+AbGaKQZEc3B5Qyxkga0cEwTzN1UWkD3UlVLAB08K6IfO2dgJZoPG94d
	ZQBwFac7ZekExICyEYzSUgC0BbM/mWs=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 7/7] Mini-OS: add read and write support to 9pfsfront
Date: Mon, 13 Feb 2023 09:44:12 +0100
Message-Id: <20230213084412.21065-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213084412.21065-1-jgross@suse.com>
References: <20230213084412.21065-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to read from and write to a file handled by 9pfsfront.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add check for max message size
- return EAGAIN in case no free request got (Samuel Thibault)
- loop until all data read/written (Samuel Thibault)
V3:
- use an exact limit for read/write (Samuel Thibault)
- log read(write errors (Samuel Thibault)
---
 9pfront.c | 216 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 216 insertions(+)

diff --git a/9pfront.c b/9pfront.c
index fb2e5669..5da8a365 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -72,7 +72,10 @@ struct file_9pfs {
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
 #define P9_CMD_CREATE     114
+#define P9_CMD_READ       116
+#define P9_CMD_WRITE      118
 #define P9_CMD_CLUNK      120
+#define P9_CMD_STAT       124
 
 /* P9 protocol open flags. */
 #define P9_OREAD            0   /* read */
@@ -88,11 +91,39 @@ struct p9_header {
     uint16_t tag;
 } __attribute__((packed));
 
+struct p9_stat {
+    uint16_t size;
+    uint16_t type;
+    uint32_t dev;
+    uint8_t qid[P9_QID_SIZE];
+    uint32_t mode;
+    uint32_t atime;
+    uint32_t mtime;
+    uint64_t length;
+    char *name;
+    char *uid;
+    char *gid;
+    char *muid;
+    char *extension;
+    uint32_t n_uid;
+    uint32_t n_gid;
+    uint32_t n_muid;
+};
+
 #define P9_VERSION        "9P2000.u"
 #define P9_ROOT_FID       0
 
 static unsigned int ftype_9pfs;
 
+static void free_stat(struct p9_stat *stat)
+{
+    free(stat->name);
+    free(stat->uid);
+    free(stat->gid);
+    free(stat->muid);
+    free(stat->extension);
+}
+
 static unsigned int get_fid(struct dev_9pfs *dev)
 {
     unsigned int fid;
@@ -181,9 +212,12 @@ static void copy_from_ring(struct dev_9pfs *dev, void *data, unsigned int len)
  *    Only valid for sending.
  * u: 2 byte unsigned integer (uint16_t)
  * U: 4 byte unsigned integer (uint32_t)
+ * L: 8 byte unsigned integer (uint64_t)
  * S: String (2 byte length + <length> characters)
  *    in the rcv_9p() case the data for string is allocated (length omitted,
  *    string terminated by a NUL character)
+ * D: Binary data (4 byte length + <length> bytes of data), requires a length
+ *    and a buffer pointer parameter.
  * Q: A 13 byte "qid", consisting of 1 byte file type, 4 byte file version
  *    and 8 bytes unique file id. Only valid for receiving.
  */
@@ -192,10 +226,12 @@ static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
     struct p9_header hdr;
     va_list ap, aq;
     const char *f;
+    uint64_t longval;
     uint32_t intval;
     uint16_t shortval;
     uint16_t len;
     uint8_t byte;
+    uint8_t *data;
     char *strval;
 
     hdr.size = sizeof(hdr);
@@ -221,11 +257,21 @@ static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
             hdr.size += 4;
             intval = va_arg(aq, unsigned int);
             break;
+        case 'L':
+            hdr.size += 8;
+            longval = va_arg(aq, uint64_t);
+            break;
         case 'S':
             hdr.size += 2;
             strval = va_arg(aq, char *);
             hdr.size += strlen(strval);
             break;
+        case 'D':
+            hdr.size += 4;
+            intval = va_arg(aq, unsigned int);
+            hdr.size += intval;
+            data = va_arg(aq, uint8_t *);
+            break;
         default:
             printk("send_9p: unknown format character %c\n", *f);
             break;
@@ -258,12 +304,22 @@ static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
             intval = va_arg(ap, unsigned int);
             copy_to_ring(dev, &intval, sizeof(intval));
             break;
+        case 'L':
+            longval = va_arg(ap, uint64_t);
+            copy_to_ring(dev, &longval, sizeof(longval));
+            break;
         case 'S':
             strval = va_arg(ap, char *);
             len = strlen(strval);
             copy_to_ring(dev, &len, sizeof(len));
             copy_to_ring(dev, strval, len);
             break;
+        case 'D':
+            intval = va_arg(ap, unsigned int);
+            copy_to_ring(dev, &intval, sizeof(intval));
+            data = va_arg(ap, uint8_t *);
+            copy_to_ring(dev, data, intval);
+            break;
         }
     }
 
@@ -348,6 +404,8 @@ static void rcv_9p_copy(struct dev_9pfs *dev, struct req *req,
     uint32_t err;
     uint16_t *shortval;
     uint32_t *val;
+    uint64_t *longval;
+    uint8_t *data;
     char **strval;
     uint8_t *qval;
 
@@ -412,6 +470,10 @@ static void rcv_9p_copy(struct dev_9pfs *dev, struct req *req,
             val = va_arg(ap, uint32_t *);
             copy_bufs(&buf1, &buf2, &len1, &len2, val, sizeof(*val));
             break;
+        case 'L':
+            longval = va_arg(ap, uint64_t *);
+            copy_bufs(&buf1, &buf2, &len1, &len2, longval, sizeof(*longval));
+            break;
         case 'S':
             strval = va_arg(ap, char **);
             copy_bufs(&buf1, &buf2, &len1, &len2, &len, sizeof(len));
@@ -419,6 +481,12 @@ static void rcv_9p_copy(struct dev_9pfs *dev, struct req *req,
             copy_bufs(&buf1, &buf2, &len1, &len2, *strval, len);
             (*strval)[len] = 0;
             break;
+        case 'D':
+            val = va_arg(ap, uint32_t *);
+            data = va_arg(ap, uint8_t *);
+            copy_bufs(&buf1, &buf2, &len1, &len2, val, sizeof(*val));
+            copy_bufs(&buf1, &buf2, &len1, &len2, data, *val);
+            break;
         case 'Q':
             qval = va_arg(ap, uint8_t *);
             copy_bufs(&buf1, &buf2, &len1, &len2, qval, P9_QID_SIZE);
@@ -640,6 +708,115 @@ static int p9_create(struct dev_9pfs *dev, uint32_t fid, char *path,
     return ret;
 }
 
+static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *stat)
+{
+    struct req *req = get_free_req(dev);
+    int ret;
+
+    if ( !req )
+        return EAGAIN;
+
+    memset(stat, 0, sizeof(*stat));
+    req->cmd = P9_CMD_STAT;
+    send_9p(dev, req, "U", fid);
+    rcv_9p(dev, req, "uuUQUUULSSSSSUUU", &stat->size, &stat->type, &stat->dev,
+           stat->qid, &stat->mode, &stat->atime, &stat->mtime, &stat->length,
+           &stat->name, &stat->uid, &stat->gid, &stat->muid, &stat->extension,
+           &stat->n_uid, &stat->n_gid, &stat->n_muid);
+
+    ret = req->result;
+
+    put_free_req(dev, req);
+
+    return ret;
+}
+
+static int p9_read(struct dev_9pfs *dev, uint32_t fid, uint64_t offset,
+                   uint8_t *data, uint32_t len)
+{
+    struct req *req = get_free_req(dev);
+    int ret = 0;
+    uint32_t count, count_max;
+
+    if ( !req )
+    {
+        errno = EAGAIN;
+        return -1;
+    }
+    req->cmd = P9_CMD_READ;
+    count_max = dev->msize_max - (sizeof(struct p9_header) + sizeof(uint32_t));
+
+    while ( len )
+    {
+        count = len;
+        if ( count > count_max )
+            count = count_max;
+
+        send_9p(dev, req, "ULU", fid, offset, count);
+        rcv_9p(dev, req, "D", &count, data);
+
+        if ( !count )
+            break;
+        if ( req->result )
+        {
+            ret = -1;
+            errno = EIO;
+            printk("9pfs: read got error %d\n", req->result);
+            break;
+        }
+        ret += count;
+        offset += count;
+        data += count;
+        len -= count;
+    }
+
+    put_free_req(dev, req);
+
+    return ret;
+}
+
+static int p9_write(struct dev_9pfs *dev, uint32_t fid, uint64_t offset,
+                    const uint8_t *data, uint32_t len)
+{
+    struct req *req = get_free_req(dev);
+    int ret = 0;
+    uint32_t count, count_max;
+
+    if ( !req )
+    {
+        errno = EAGAIN;
+        return -1;
+    }
+    req->cmd = P9_CMD_WRITE;
+    count_max = dev->msize_max - (sizeof(struct p9_header) + sizeof(uint32_t) +
+                                  sizeof(uint64_t) + sizeof(uint32_t));
+
+    while ( len )
+    {
+        count = len;
+        if ( count > count_max )
+            count = count_max;
+
+        send_9p(dev, req, "ULD", fid, offset, count, data);
+        rcv_9p(dev, req, "U", &count);
+        if ( req->result )
+        {
+            ret = -1;
+            errno = EIO;
+            printk("9pfs: write got error %d\n", req->result);
+            break;
+        }
+        ret += count;
+        offset += count;
+        data += count;
+        len -= count;
+    }
+
+    put_free_req(dev, req);
+
+    return ret;
+}
+
 /*
  * Walk from root <steps> levels with the levels listed in <*paths> as a
  * sequence of names. Returns the number of steps not having been able to
@@ -731,6 +908,43 @@ static void intr_9pfs(evtchn_port_t port, struct pt_regs *regs, void *data)
     wake_up(&dev->waitq);
 }
 
+static int read_9pfs(struct file *file, void *buf, size_t nbytes)
+{
+    struct file_9pfs *f9pfs = file->filedata;
+    int ret;
+
+    ret = p9_read(f9pfs->dev, f9pfs->fid, file->offset, buf, nbytes);
+    if ( ret >= 0 )
+        file->offset += ret;
+
+    return ret;
+}
+
+static int write_9pfs(struct file *file, const void *buf, size_t nbytes)
+{
+    struct file_9pfs *f9pfs = file->filedata;
+    struct p9_stat stat;
+    int ret;
+
+    if ( f9pfs->append )
+    {
+        ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
+        free_stat(&stat);
+        if ( ret )
+        {
+            errno = EIO;
+            return -1;
+        }
+        file->offset = stat.length;
+    }
+
+    ret = p9_write(f9pfs->dev, f9pfs->fid, file->offset, buf, nbytes);
+    if ( ret >= 0 )
+        file->offset += ret;
+
+    return ret;
+}
+
 static int close_9pfs(struct file *file)
 {
     struct file_9pfs *f9pfs = file->filedata;
@@ -1072,6 +1286,8 @@ void shutdown_9pfront(void *dev)
 
 static const struct file_ops ops_9pfs = {
     .name = "9pfs",
+    .read = read_9pfs,
+    .write = write_9pfs,
     .close = close_9pfs,
 };
 
-- 
2.35.3


