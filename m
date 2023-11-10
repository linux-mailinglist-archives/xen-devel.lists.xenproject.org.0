Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32837E7DBF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630576.983563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UHQ-0006pN-LF; Fri, 10 Nov 2023 16:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630576.983563; Fri, 10 Nov 2023 16:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UHQ-0006eL-FM; Fri, 10 Nov 2023 16:22:48 +0000
Received: by outflank-mailman (input) for mailman id 630576;
 Fri, 10 Nov 2023 16:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U4V-0004cS-U3
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:09:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84962116-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:09:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4BC2F219B3;
 Fri, 10 Nov 2023 16:09:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E4CA13398;
 Fri, 10 Nov 2023 16:09:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xHsQBrVVTmUJCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:09:25 +0000
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
X-Inumbo-ID: 84962116-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNELVOtIBvsXIZZicR5yL0eKM2DQUzTKU2kSsnMPGxo=;
	b=sVcDy2eCiRDJlVk10Kk2Wm9uV0EeUF1Mfbd06tvg2Jc+tPdaEOOb7cpdgGpvn7VpZpKcOH
	LZcZna+SV0w4v8dmxw6g9PbNi7fwy6meX+IbAnLHxhWTJsyZdy/JN0DPnZMbNMqE1Y/Zm3
	/WlKEPtTsIP0e9kdXPILeyfMTjmbnPQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 14/29] tools/xenlogd: add 9pfs read request support
Date: Fri, 10 Nov 2023 17:07:49 +0100
Message-Id: <20231110160804.29021-15-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the read request of the 9pfs protocol.

For now support only reading plain files (no directories).

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V2:
- make error check more readable (Jason Andryuk)
---
 tools/xen-9pfsd/io.c | 64 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index f8d981c2a6..1edea2e24a 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -32,6 +32,7 @@
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
 #define P9_CMD_CREATE     114
+#define P9_CMD_READ       116
 #define P9_CMD_WRITE      118
 #define P9_CMD_CLUNK      120
 #define P9_CMD_STAT       124
@@ -1120,6 +1121,65 @@ static void p9_create(struct ring *ring, struct p9_header *hdr)
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
+        p9_error(ring, hdr->tag, EBADF);
+        goto out;
+    }
+
+    if ( fidp->isdir )
+    {
+        p9_error(ring, hdr->tag, EOPNOTSUPP);
+        goto out;
+    }
+    else
+    {
+        len = count;
+        buf = ring->buffer + sizeof(*hdr) + sizeof(uint32_t);
+
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
+        {
+            p9_error(ring, hdr->tag, errno);
+            goto out;
+        }
+
+        buf = ring->buffer + sizeof(*hdr) + sizeof(uint32_t);
+        len = count - len;
+        fill_buffer(ring, hdr->cmd + 1, hdr->tag, "D", &len, buf);
+    }
+
+ out:
+    free_fid(device, fidp);
+}
+
 static void p9_write(struct ring *ring, struct p9_header *hdr)
 {
     device *device = ring->device;
@@ -1349,6 +1409,10 @@ void *io_thread(void *arg)
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


