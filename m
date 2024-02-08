Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F89584E5A9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678368.1055612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7i3-0001gy-3R; Thu, 08 Feb 2024 16:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678368.1055612; Thu, 08 Feb 2024 16:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7i3-0001f5-0b; Thu, 08 Feb 2024 16:57:11 +0000
Received: by outflank-mailman (input) for mailman id 678368;
 Thu, 08 Feb 2024 16:57:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY7i1-0005q0-L6
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:57:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17d8a5dd-c6a3-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 17:57:07 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 987D11FCF6;
 Thu,  8 Feb 2024 16:57:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A19C1326D;
 Thu,  8 Feb 2024 16:57:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rdaDGOMHxWUvFAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 16:57:07 +0000
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
X-Inumbo-ID: 17d8a5dd-c6a3-11ee-98f5-efadbce2ee36
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v5 14/22] tools/9pfsd: add 9pfs read request support
Date: Thu,  8 Feb 2024 17:55:38 +0100
Message-Id: <20240208165546.5715-15-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208165546.5715-1-jgross@suse.com>
References: <20240208165546.5715-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 987D11FCF6
X-Spam-Flag: NO

Add the read request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
V2:
- make error check more readable (Jason Andryuk)
V4:
- add directory read support
V5:
- rewinddir() if reading a directory and offset is 0 (Jason Andryuk)
---
 tools/9pfsd/io.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index b763e3d8d9..df4f09356e 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -33,6 +33,7 @@
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
 #define P9_CMD_CREATE     114
+#define P9_CMD_READ       116
 #define P9_CMD_WRITE      118
 #define P9_CMD_CLUNK      120
 #define P9_CMD_STAT       124
@@ -1247,6 +1248,94 @@ static void p9_stat(struct ring *ring, struct p9_header *hdr)
     free_fid(device, fidp);
 }
 
+static void p9_read(struct ring *ring, struct p9_header *hdr)
+{
+    device *device = ring->device;
+    uint32_t fid;
+    uint64_t off;
+    unsigned int len;
+    uint32_t count;
+    void *buf;
+    struct p9_fid *fidp;
+    int ret;
+
+    ret = fill_data(ring, "ULU", &fid, &off, &count);
+    if ( ret != 3 )
+    {
+        p9_error(ring, hdr->tag, EINVAL);
+        return;
+    }
+
+    fidp = get_fid_ref(device, fid);
+    if ( !fidp || !fidp->opened )
+    {
+        errno = EBADF;
+        goto err;
+    }
+
+    len = count;
+    buf = ring->buffer + sizeof(*hdr) + sizeof(uint32_t);
+
+    if ( fidp->isdir )
+    {
+        struct dirent *dirent;
+        struct stat st;
+        struct p9_stat p9s;
+
+        if ( off == 0 )
+            rewinddir(fidp->data);
+
+        while ( len != 0 )
+        {
+            errno = 0;
+            dirent = readdir(fidp->data);
+            if ( !dirent )
+            {
+                if ( errno )
+                    goto err;
+                break;
+            }
+            if ( fstatat(fidp->fd, dirent->d_name, &st, 0) < 0 )
+                goto err;
+            fill_p9_stat(device, &p9s, &st, dirent->d_name);
+            if ( p9s.size + sizeof(p9s.size) > len )
+            {
+                seekdir(fidp->data, dirent->d_off);
+                break;
+            }
+            fill_buffer_at(&buf, "s", &p9s);
+            len -= p9s.size + sizeof(p9s.size);
+        }
+    }
+    else
+    {
+        while ( len != 0 )
+        {
+            ret = pread(fidp->fd, buf, len, off);
+            if ( ret <= 0 )
+                break;
+            len -= ret;
+            buf += ret;
+            off += ret;
+        }
+        if ( ret < 0 && len == count )
+            goto err;
+    }
+
+    buf = ring->buffer + sizeof(*hdr) + sizeof(uint32_t);
+    len = count - len;
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "D", &len, buf);
+
+ out:
+    free_fid(device, fidp);
+
+    return;
+
+ err:
+    p9_error(ring, hdr->tag, errno);
+    goto out;
+}
+
 static void p9_write(struct ring *ring, struct p9_header *hdr)
 {
     device *device = ring->device;
@@ -1371,6 +1460,10 @@ void *io_thread(void *arg)
                 p9_create(ring, &hdr);
                 break;
 
+            case P9_CMD_READ:
+                p9_read(ring, &hdr);
+                break;
+
             case P9_CMD_WRITE:
                 p9_write(ring, &hdr);
                 break;
-- 
2.35.3


