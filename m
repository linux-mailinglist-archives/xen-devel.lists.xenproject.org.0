Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7881F856400
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 14:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681700.1060629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabRH-0006Tz-Ru; Thu, 15 Feb 2024 13:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681700.1060629; Thu, 15 Feb 2024 13:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabRH-0006Rm-Nj; Thu, 15 Feb 2024 13:06:07 +0000
Received: by outflank-mailman (input) for mailman id 681700;
 Thu, 15 Feb 2024 13:06:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rabRG-0002j3-0a
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 13:06:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f97c1002-cc02-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 14:06:04 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D5FA2218B;
 Thu, 15 Feb 2024 13:06:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id F0877139D0;
 Thu, 15 Feb 2024 13:06:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 1GtCOTkMzmWhFQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 13:06:01 +0000
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
X-Inumbo-ID: f97c1002-cc02-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708002364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWrUdAn8G/WYw7Z+1jcLbLASeGn0zV6YHdFDB/FVJZ8=;
	b=WgaQ/5YU2tUY56RnuiKXPRFallvy18SVnEjYPNrEX3XLq5N59GKfVqUZp2UCLaf/ZQ/D1D
	4QC9lszG9OQUn3DOzjI0g7ojnSwIWRaF5oxXmdedPi9MGbKQBk/vxF80/aXNEhsPxDfDUt
	ucxdK4xbTHkNCsSqxLMVYuBtBaldQSM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708002362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWrUdAn8G/WYw7Z+1jcLbLASeGn0zV6YHdFDB/FVJZ8=;
	b=k4LFMBKBObiyWNa/GnSmZtrPLKnlN7hRgRgTxV4Zuy/MZPQH7lMt3nCoFbZ7K2zr49Y+60
	KeaE03RHfdMGe20O0Kve6XD1UAMFm9HkAF0z5vuR/VCGLo0rWNAykq7NxqIfnVOhpu53sF
	q0JAXAwZe1Ra2rjNiarO1I/X/Omfv0E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v7 09/21] tools/xen-9pfsd: add 9pfs clunk request support
Date: Thu, 15 Feb 2024 14:04:57 +0100
Message-Id: <20240215130509.24008-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240215130509.24008-1-jgross@suse.com>
References: <20240215130509.24008-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[11.21%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Add the clunk request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V3:
- use unlinkat() (Jason Andryuk)
---
 tools/9pfsd/io.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index 5ec780af14..6af14e5ee9 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -32,6 +32,7 @@
 #define P9_CMD_ERROR      107
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
+#define P9_CMD_CLUNK      120
 
 /* P9 protocol open flags. */
 #define P9_OREAD            0   /* read */
@@ -960,6 +961,44 @@ static void p9_open(struct ring *ring, struct p9_header *hdr)
     p9_error(ring, hdr->tag, errno);
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
+            unlinkat(device->root_fd, fidp->path,
+                     fidp->isdir ? AT_REMOVEDIR : 0);
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
@@ -1031,6 +1070,10 @@ void *io_thread(void *arg)
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


