Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E6084982E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675831.1051417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfE-0001Xu-Mt; Mon, 05 Feb 2024 10:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675831.1051417; Mon, 05 Feb 2024 10:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfE-0001Vo-Gc; Mon, 05 Feb 2024 10:57:24 +0000
Received: by outflank-mailman (input) for mailman id 675831;
 Mon, 05 Feb 2024 10:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwZL-0000qL-2S
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:51:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d259515-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:51:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3AB8D2228A;
 Mon,  5 Feb 2024 10:51:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0AF08132DD;
 Mon,  5 Feb 2024 10:51:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id x5wxAaW9wGVeNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:51:17 +0000
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
X-Inumbo-ID: 7d259515-c414-11ee-98f5-efadbce2ee36
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v4 13/32] tools/xen-9pfsd: add 9pfs write request support
Date: Mon,  5 Feb 2024 11:49:42 +0100
Message-Id: <20240205105001.24171-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3AB8D2228A
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO

Add the write request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xen-9pfsd/io.c | 54 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index 031cff9f0e..b763e3d8d9 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -33,6 +33,7 @@
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
 #define P9_CMD_CREATE     114
+#define P9_CMD_WRITE      118
 #define P9_CMD_CLUNK      120
 #define P9_CMD_STAT       124
 
@@ -1246,6 +1247,55 @@ static void p9_stat(struct ring *ring, struct p9_header *hdr)
     free_fid(device, fidp);
 }
 
+static void p9_write(struct ring *ring, struct p9_header *hdr)
+{
+    device *device = ring->device;
+    uint32_t fid;
+    uint64_t off;
+    unsigned int len;
+    uint32_t written;
+    void *buf;
+    struct p9_fid *fidp;
+    int ret;
+
+    ret = fill_data(ring, "ULD", &fid, &off, &len, ring->buffer);
+    if ( ret != 3 )
+    {
+        p9_error(ring, hdr->tag, EINVAL);
+        return;
+    }
+
+    fidp = get_fid_ref(device, fid);
+    if ( !fidp || !fidp->opened || fidp->isdir )
+    {
+        p9_error(ring, hdr->tag, EBADF);
+        goto out;
+    }
+
+    buf = ring->buffer;
+
+    while ( len != 0 )
+    {
+        ret = pwrite(fidp->fd, buf, len, off);
+        if ( ret < 0 )
+            break;
+        len -= ret;
+        buf += ret;
+        off += ret;
+    }
+
+    written = buf - ring->buffer;
+    if ( written == 0 )
+    {
+        p9_error(ring, hdr->tag, errno);
+        goto out;
+    }
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "U", &written);
+
+ out:
+    free_fid(device, fidp);
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -1321,6 +1371,10 @@ void *io_thread(void *arg)
                 p9_create(ring, &hdr);
                 break;
 
+            case P9_CMD_WRITE:
+                p9_write(ring, &hdr);
+                break;
+
             case P9_CMD_CLUNK:
                 p9_clunk(ring, &hdr);
                 break;
-- 
2.35.3


