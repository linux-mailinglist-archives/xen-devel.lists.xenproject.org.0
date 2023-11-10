Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E3B7E7DBA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:22:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630570.983532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UGh-0005Su-8U; Fri, 10 Nov 2023 16:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630570.983532; Fri, 10 Nov 2023 16:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UGh-0005R5-5j; Fri, 10 Nov 2023 16:22:03 +0000
Received: by outflank-mailman (input) for mailman id 630570;
 Fri, 10 Nov 2023 16:22:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U49-0004cS-A9
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:09:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7749dc35-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:09:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F35DF2187C;
 Fri, 10 Nov 2023 16:09:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D09FA13398;
 Fri, 10 Nov 2023 16:09:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b2SXMZ5VTmXECAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:09:02 +0000
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
X-Inumbo-ID: 7749dc35-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ia0sJSe348M/0TeGjDY+uWzzzIk2QcQkMJh7HRaDODM=;
	b=WbHjVERfn/TIaMSP3gCmuO+GnCi/8siUI0Ud/lKpJlrCaVfLNuww4ujvC6HxAWUpZOht1T
	+DmtJ78ObAXbUjWTfroZrr3d5m7XPkSFuW/BUgjd8jYkDM/hs4i9FgnES/VqsD/SOVYc2d
	B1/pw3sf3Jr77aNLf2bPrF/LSZT20OU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 10/29] tools/xenlogd: add 9pfs clunk request support
Date: Fri, 10 Nov 2023 17:07:45 +0100
Message-Id: <20231110160804.29021-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the clunk request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xen-9pfsd/io.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index bb9c78a1f5..c182ef0483 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -31,6 +31,7 @@
 #define P9_CMD_ERROR      107
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
+#define P9_CMD_CLUNK      120
 
 /* P9 protocol open flags. */
 #define P9_OREAD            0   /* read */
@@ -943,6 +944,43 @@ static void p9_open(struct ring *ring, struct p9_header *hdr)
     fill_buffer(ring, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
 }
 
+static void p9_clunk(struct ring *ring, struct p9_header *hdr)
+{
+    device *device = ring->device;
+    uint32_t fid;
+    struct p9_fid *fidp;
+    int ret;
+
+    ret = fill_data(ring, "U", &fid);
+    if ( ret != 1 )
+    {
+        p9_error(ring, hdr->tag, EINVAL);
+        return;
+    }
+
+    fidp = get_fid_ref(device, fid);
+    if ( !fidp )
+    {
+        p9_error(ring, hdr->tag, ENOENT);
+        return;
+    }
+
+    if ( fidp->opened )
+    {
+        fidp->opened = false;
+        free_fid(device, fidp);
+        close(fidp->fd);
+        if ( fidp->mode & P9_OREMOVE )
+            unlink(fidp->path);
+    }
+
+    /* 2 calls of free_fid(): one for our reference, and one to free it. */
+    free_fid(device, fidp);
+    free_fid(device, fidp);
+
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "");
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -1014,6 +1052,10 @@ void *io_thread(void *arg)
                 p9_open(ring, &hdr);
                 break;
 
+            case P9_CMD_CLUNK:
+                p9_clunk(ring, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        ring->device->domid, ring->device->devid, hdr.cmd);
-- 
2.35.3


