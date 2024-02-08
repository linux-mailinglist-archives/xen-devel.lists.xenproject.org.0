Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC584E5A3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678364.1055603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7hU-0000aK-Tp; Thu, 08 Feb 2024 16:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678364.1055603; Thu, 08 Feb 2024 16:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7hU-0000X0-PM; Thu, 08 Feb 2024 16:56:36 +0000
Received: by outflank-mailman (input) for mailman id 678364;
 Thu, 08 Feb 2024 16:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY7hT-0005bD-0Q
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:56:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03dbfd60-c6a3-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 17:56:34 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17FDD21F60;
 Thu,  8 Feb 2024 16:56:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC9D11326D;
 Thu,  8 Feb 2024 16:56:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id r7tcNMEHxWXlEwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 16:56:33 +0000
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
X-Inumbo-ID: 03dbfd60-c6a3-11ee-8a4a-1f161083a0e0
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v5 08/22] tools/9pfsd: add 9pfs walk request support
Date: Thu,  8 Feb 2024 17:55:32 +0100
Message-Id: <20240208165546.5715-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208165546.5715-1-jgross@suse.com>
References: <20240208165546.5715-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 17FDD21F60
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO

Add the walk request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V2:
- don't allow walking across symbolic links
---
 tools/9pfsd/io.c        | 171 ++++++++++++++++++++++++++++++++++++++++
 tools/9pfsd/xen-9pfsd.h |   1 +
 2 files changed, 172 insertions(+)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index 4f6acefc87..5b827706b7 100644
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
@@ -478,6 +480,21 @@ static struct p9_fid *find_fid(device *device, unsigned int fid)
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


