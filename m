Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88B849837
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:58:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675847.1051495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfj-0005IP-22; Mon, 05 Feb 2024 10:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675847.1051495; Mon, 05 Feb 2024 10:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfi-0005Fk-V6; Mon, 05 Feb 2024 10:57:54 +0000
Received: by outflank-mailman (input) for mailman id 675847;
 Mon, 05 Feb 2024 10:57:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwZP-0002wU-ON
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:51:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80824b0b-c414-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 11:51:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C6FFC1F8C0;
 Mon,  5 Feb 2024 10:51:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99820132DD;
 Mon,  5 Feb 2024 10:51:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PxkaJKq9wGVjNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:51:22 +0000
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
X-Inumbo-ID: 80824b0b-c414-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zG6E8AnOVGoVetT7WwKYTZr00RdCVDPWEd53rIfPGH8=;
	b=UU62A3+MXUu2WBMoDgVQoEf4iO6lCkjABHyh+SpKYyuMWTpGm2Nkb9suU+HVxnAu3kQd/K
	e87se/bad9W6phvLymD3akQwZk+ppyxLQMMQDUFNtp2H5FwWrrbvaJORaDXXwUrP4s+LQ/
	hxc1ooYCFK2lbZEtZgQne0g7JxRgEjM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zG6E8AnOVGoVetT7WwKYTZr00RdCVDPWEd53rIfPGH8=;
	b=UU62A3+MXUu2WBMoDgVQoEf4iO6lCkjABHyh+SpKYyuMWTpGm2Nkb9suU+HVxnAu3kQd/K
	e87se/bad9W6phvLymD3akQwZk+ppyxLQMMQDUFNtp2H5FwWrrbvaJORaDXXwUrP4s+LQ/
	hxc1ooYCFK2lbZEtZgQne0g7JxRgEjM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v4 14/32] tools/xen-9pfsd: add 9pfs read request support
Date: Mon,  5 Feb 2024 11:49:43 +0100
Message-Id: <20240205105001.24171-15-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.90

Add the read request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
V2:
- make error check more readable (Jason Andryuk)
V4:
- add directory read support
---
 tools/xen-9pfsd/io.c | 90 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index b763e3d8d9..cfbf3bef59 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -33,6 +33,7 @@
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
 #define P9_CMD_CREATE     114
+#define P9_CMD_READ       116
 #define P9_CMD_WRITE      118
 #define P9_CMD_CLUNK      120
 #define P9_CMD_STAT       124
@@ -1247,6 +1248,91 @@ static void p9_stat(struct ring *ring, struct p9_header *hdr)
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
@@ -1371,6 +1457,10 @@ void *io_thread(void *arg)
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


