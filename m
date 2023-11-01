Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5527DDE80
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626255.976392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7cg-0001sx-MX; Wed, 01 Nov 2023 09:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626255.976392; Wed, 01 Nov 2023 09:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7cg-0001pV-Im; Wed, 01 Nov 2023 09:34:50 +0000
Received: by outflank-mailman (input) for mailman id 626255;
 Wed, 01 Nov 2023 09:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7ce-0005sN-Fs
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:34:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e55372ef-7899-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:34:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AFD661F74D;
 Wed,  1 Nov 2023 09:34:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8924813460;
 Wed,  1 Nov 2023 09:34:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q2IdILYbQmUlCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:34:46 +0000
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
X-Inumbo-ID: e55372ef-7899-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lD7OYj5Yt2uwwISmgGvZUOhfU+UjKp9N5PIhwoDUvt4=;
	b=FAhpGBUB5tJOWxQcnddOSvFXFux2A4K8QwWGeXi9JX/xoj7O8uG1mDdhzne8LutEltj/w5
	fmXA7Sl3eH9aZ0KevqobefRCbVtgSQPLFID+eV8oRHVZEOtkxzOtucM+dWFjtkjiCJv5Kd
	Nxglq6waIkTZgCK8xwphW4TcVKWRn1w=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 14/29] tools/xenlogd: add 9pfs read request support
Date: Wed,  1 Nov 2023 10:33:10 +0100
Message-Id: <20231101093325.30302-15-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the read request of the 9pfs protocol.

For now support only reading plain files (no directories).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenlogd/io.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
index 6b4692ca67..b3f9f96bcc 100644
--- a/tools/xenlogd/io.c
+++ b/tools/xenlogd/io.c
@@ -32,6 +32,7 @@
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
 #define P9_CMD_CREATE     114
+#define P9_CMD_READ       116
 #define P9_CMD_WRITE      118
 #define P9_CMD_CLUNK      120
 #define P9_CMD_STAT       124
@@ -1011,6 +1012,61 @@ static void p9_create(device *device, struct p9_header *hdr)
     fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
 }
 
+static void p9_read(device *device, struct p9_header *hdr)
+{
+    uint32_t fid;
+    uint64_t off;
+    unsigned int len;
+    uint32_t count;
+    void *buf;
+    struct p9_fid *fidp;
+    int ret;
+
+    ret = fill_data(device, "ULU", &fid, &off, &count);
+    if ( ret != 3 )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        return;
+    }
+
+    fidp = find_fid(device, fid);
+    if ( !fidp || !fidp->opened )
+    {
+        p9_error(device, hdr->tag, EBADF);
+        return;
+    }
+
+    if ( fidp->isdir )
+    {
+        p9_error(device, hdr->tag, EOPNOTSUPP);
+        return;
+    }
+    else
+    {
+        len = count;
+        buf = device->buffer + sizeof(*hdr) + sizeof(uint32_t);
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
+        if ( ret && len == count )
+        {
+            p9_error(device, hdr->tag, errno);
+            return;
+        }
+
+        buf = device->buffer + sizeof(*hdr) + sizeof(uint32_t);
+        len = count - len;
+        fill_buffer(device, hdr->cmd + 1, hdr->tag, "D", &len, buf);
+    }
+}
+
 static void p9_write(device *device, struct p9_header *hdr)
 {
     uint32_t fid;
@@ -1228,6 +1284,10 @@ void *io_thread(void *arg)
                 p9_create(device, &hdr);
                 break;
 
+            case P9_CMD_READ:
+                p9_read(device, &hdr);
+                break;
+
             case P9_CMD_WRITE:
                 p9_write(device, &hdr);
                 break;
-- 
2.35.3


