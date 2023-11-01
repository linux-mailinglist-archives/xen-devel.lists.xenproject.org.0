Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1907DDEC7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626349.976572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7vZ-0000UR-EW; Wed, 01 Nov 2023 09:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626349.976572; Wed, 01 Nov 2023 09:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7vZ-0000SK-Az; Wed, 01 Nov 2023 09:54:21 +0000
Received: by outflank-mailman (input) for mailman id 626349;
 Wed, 01 Nov 2023 09:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7cX-0005E0-RO
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:34:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e20f467e-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:34:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 287401F74D;
 Wed,  1 Nov 2023 09:34:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02A2913460;
 Wed,  1 Nov 2023 09:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DAT3OrAbQmUZCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:34:40 +0000
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
X-Inumbo-ID: e20f467e-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GExNKp/yhu+n6P2BIY5jfXZkhxU99CKU37BbtunsSk=;
	b=MppCvh+L8QO/WnZb70zdnCMROQq+m03SnlwSi2B8zsq7VvpsfxRwRzoa00hFBPd64pUJ6A
	FZGNhOZjZp9r9/AORC30jIYPaq+MBY4VA83H/ETdfTaIRn/ofphTyrrAi36CYy9/WMuu5m
	T3p1LWPe58VjNh+En1lplnIM7bpF/D8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 13/29] tools/xenlogd: add 9pfs write request support
Date: Wed,  1 Nov 2023 10:33:09 +0100
Message-Id: <20231101093325.30302-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the write request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenlogd/io.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
index 6e92667fab..6b4692ca67 100644
--- a/tools/xenlogd/io.c
+++ b/tools/xenlogd/io.c
@@ -32,6 +32,7 @@
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
 #define P9_CMD_CREATE     114
+#define P9_CMD_WRITE      118
 #define P9_CMD_CLUNK      120
 #define P9_CMD_STAT       124
 
@@ -1010,6 +1011,51 @@ static void p9_create(device *device, struct p9_header *hdr)
     fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
 }
 
+static void p9_write(device *device, struct p9_header *hdr)
+{
+    uint32_t fid;
+    uint64_t off;
+    unsigned int len;
+    uint32_t written;
+    void *buf;
+    struct p9_fid *fidp;
+    int ret;
+
+    ret = fill_data(device, "ULD", &fid, &off, &len, device->buffer);
+    if ( ret != 3 )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        return;
+    }
+
+    fidp = find_fid(device, fid);
+    if ( !fidp || !fidp->opened || fidp->isdir )
+    {
+        p9_error(device, hdr->tag, EBADF);
+        return;
+    }
+
+    buf = device->buffer;
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
+    written = buf - device->buffer;
+    if ( written == 0 )
+    {
+        p9_error(device, hdr->tag, errno);
+        return;
+    }
+    fill_buffer(device, hdr->cmd + 1, hdr->tag, "U", &written);
+}
+
 static void p9_clunk(device *device, struct p9_header *hdr)
 {
     uint32_t fid;
@@ -1182,6 +1228,10 @@ void *io_thread(void *arg)
                 p9_create(device, &hdr);
                 break;
 
+            case P9_CMD_WRITE:
+                p9_write(device, &hdr);
+                break;
+
             case P9_CMD_CLUNK:
                 p9_clunk(device, &hdr);
                 break;
-- 
2.35.3


