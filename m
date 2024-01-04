Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C085823E5C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661276.1031023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJm8-0003cX-FK; Thu, 04 Jan 2024 09:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661276.1031023; Thu, 04 Jan 2024 09:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJm8-0003WF-4z; Thu, 04 Jan 2024 09:12:28 +0000
Received: by outflank-mailman (input) for mailman id 661276;
 Thu, 04 Jan 2024 09:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJc3-0007Zm-K2
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:02:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebc0d355-aadf-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 10:02:00 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4703521F8C;
 Thu,  4 Jan 2024 09:02:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2237313722;
 Thu,  4 Jan 2024 09:02:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Y/4kBwh0lmXVWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:02:00 +0000
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
X-Inumbo-ID: ebc0d355-aadf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83zu8qXzCws1nGkvYOUtCjUN1acN1YTYVZrj0SieEXM=;
	b=MGBXku8Uqv5OTyrf79PNCpfNsXNldQC5y1DTA9g1JyasJsekDCw5e4NQEEiSeFwYln8i1m
	9h4mZQ/14zo04logZ5vQjv+ZQAI3iWhZOiU3eKzP2gXO97LQwbMMKCXn1mQzwEW+VQsa0a
	+0oKfhkW9QXQJb2UQB+SrKWlLKlL98w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83zu8qXzCws1nGkvYOUtCjUN1acN1YTYVZrj0SieEXM=;
	b=MGBXku8Uqv5OTyrf79PNCpfNsXNldQC5y1DTA9g1JyasJsekDCw5e4NQEEiSeFwYln8i1m
	9h4mZQ/14zo04logZ5vQjv+ZQAI3iWhZOiU3eKzP2gXO97LQwbMMKCXn1mQzwEW+VQsa0a
	+0oKfhkW9QXQJb2UQB+SrKWlLKlL98w=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 11/33] tools/xenlogd: add 9pfs clunk request support
Date: Thu,  4 Jan 2024 10:00:33 +0100
Message-Id: <20240104090055.27323-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Level: 
X-Spamd-Result: default: False [0.21 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.69)[83.29%]
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: 0.21
X-Spam-Flag: NO

Add the clunk request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- use unlinkat() (Jason Andryuk)
---
 tools/xen-9pfsd/io.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index e7db90a972..4adef6715f 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -32,6 +32,7 @@
 #define P9_CMD_ERROR      107
 #define P9_CMD_WALK       110
 #define P9_CMD_OPEN       112
+#define P9_CMD_CLUNK      120
 
 /* P9 protocol open flags. */
 #define P9_OREAD            0   /* read */
@@ -950,6 +951,44 @@ static void p9_open(struct ring *ring, struct p9_header *hdr)
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
+            unlinkat(device->root_fd, relpath_from_path(fidp->path),
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
@@ -1021,6 +1060,10 @@ void *io_thread(void *arg)
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


