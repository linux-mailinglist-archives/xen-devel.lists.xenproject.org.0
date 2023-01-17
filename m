Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D066D969
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479137.742810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi0d-0000fn-2h; Tue, 17 Jan 2023 09:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479137.742810; Tue, 17 Jan 2023 09:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi0c-0000aK-VB; Tue, 17 Jan 2023 09:11:58 +0000
Received: by outflank-mailman (input) for mailman id 479137;
 Tue, 17 Jan 2023 09:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHi0b-0007bs-O2
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:11:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcb3ffbe-9646-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 10:11:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD6F3683DC;
 Tue, 17 Jan 2023 09:11:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B41E51390C;
 Tue, 17 Jan 2023 09:11:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Du3CKlpmxmMVcAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 09:11:54 +0000
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
X-Inumbo-ID: fcb3ffbe-9646-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673946714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yeWrscM88Vhy837N0J0RMcSEc0fQ7a4WxiqHlihRSgA=;
	b=exL1qlG/Vi6ciQUENU9ah6Tn7u9wBJfIjoGYMw9QdwkIc5+1+j6L/SfH9/cv3ZEZ2KIuEF
	+M7TuON7BgbHh1KSbtLE2wH3bGEOSOpN6K5XaHeYnB1rq8cbuyucJqYK2XnP86XU+jHlpd
	GQbzaDgaWLMskBTpvXlQQKpDBIo/v5s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 05/17] tools/xenstore: replace watch->relative_path with a prefix length
Date: Tue, 17 Jan 2023 10:11:12 +0100
Message-Id: <20230117091124.22170-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230117091124.22170-1-jgross@suse.com>
References: <20230117091124.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of storing a pointer to the path which is prepended to
relative paths in struct watch, just use the length of the prepended
path.

It should be noted that the now removed special case of the
relative path being "" in get_watch_path() can't happen at all.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


