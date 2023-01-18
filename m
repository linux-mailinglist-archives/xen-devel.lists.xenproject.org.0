Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A767182F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480329.744703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55s-000448-IM; Wed, 18 Jan 2023 09:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480329.744703; Wed, 18 Jan 2023 09:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55s-000420-CI; Wed, 18 Jan 2023 09:50:56 +0000
Received: by outflank-mailman (input) for mailman id 480329;
 Wed, 18 Jan 2023 09:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI55r-0001BV-1f
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:50:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 644e0224-9715-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:49:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F00E7340AE;
 Wed, 18 Jan 2023 09:50:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDE42139D2;
 Wed, 18 Jan 2023 09:50:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KIbuLPzAx2OAQwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:50:52 +0000
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
X-Inumbo-ID: 644e0224-9715-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWM249T7on3CZ5p3PxYw3ebFU4l9Os88mNOImsi4Puo=;
	b=WyO3MVgn1JrKHPJ3XkDF9V8ghEzFQ3kKZnpgxTFeG/9QpAB9rgmfvu29HDBW4sBAW4+meE
	SH2Ug84IHV1L84ugwHmXTTtYC3BSBvG5loQ4kRWxLkO8OyrHWmBJc6L18x5KY6m4pXfKDX
	+/94+mACf/n3nRAaNefrurXztVA3Hlk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 06/17] tools/xenstore: replace watch->relative_path with a prefix length
Date: Wed, 18 Jan 2023 10:50:05 +0100
Message-Id: <20230118095016.13091-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
References: <20230118095016.13091-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of storing a pointer to the path which is prepended to
relative paths in struct watch, just use the length of the prepended
path.

It should be noted that the now removed special case of the
relative path being "" in get_watch_path() can't happen at all.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- don't open code get_watch_path() (Julien Grall)
V3:
- drop needless modification of dump_state_watches() (Julien Grall)
---
 tools/xenstore/xenstored_watch.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 75748ac109..8ad0229df6 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -39,8 +39,8 @@ struct watch
 	/* Current outstanding events applying to this watch. */
 	struct list_head events;
 
-	/* Is this relative to connnection's implicit path? */
-	const char *relative_path;
+	/* Offset into path for skipping prefix (used for relative paths). */
+	unsigned int prefix_len;
 
 	char *token;
 	char *node;
@@ -66,15 +66,7 @@ static bool is_child(const char *child, const char *parent)
 
 static const char *get_watch_path(const struct watch *watch, const char *name)
 {
-	const char *path = name;
-
-	if (watch->relative_path) {
-		path += strlen(watch->relative_path);
-		if (*path == '/') /* Could be "" */
-			path++;
-	}
-
-	return path;
+	return name + watch->prefix_len;
 }
 
 /*
@@ -211,10 +203,7 @@ static struct watch *add_watch(struct connection *conn, char *path, char *token,
 			      no_quota_check))
 		goto nomem;
 
-	if (relative)
-		watch->relative_path = get_implicit_path(conn);
-	else
-		watch->relative_path = NULL;
+	watch->prefix_len = relative ? strlen(get_implicit_path(conn)) + 1 : 0;
 
 	INIT_LIST_HEAD(&watch->events);
 
-- 
2.35.3


