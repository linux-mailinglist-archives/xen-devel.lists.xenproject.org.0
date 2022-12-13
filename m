Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C104464B933
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:05:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460766.718792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mE-00068l-SH; Tue, 13 Dec 2022 16:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460766.718792; Tue, 13 Dec 2022 16:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mE-0005tW-HN; Tue, 13 Dec 2022 16:05:06 +0000
Received: by outflank-mailman (input) for mailman id 460766;
 Tue, 13 Dec 2022 16:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57in-0001dt-E3
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:01:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69a36e11-7aff-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 17:01:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 883C7222FD;
 Tue, 13 Dec 2022 16:01:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C4C5138EE;
 Tue, 13 Dec 2022 16:01:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UasqFdyhmGPOKQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:01:32 +0000
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
X-Inumbo-ID: 69a36e11-7aff-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyVuyD9+Q+M1bRSHu0iGPheTESc8gyqYCTxyk6Njp7w=;
	b=o5jnocG/7buStr8FLFt5rEcqT1hhnzt3/pLqXIJnjrbvS70iR59xVQhvhTLD3Fh/Aj5xfX
	Q/lkIcAVa84/CJnUI+b/eMbpUsZQn9VjoiAMYdHBfnZOmzbbViSFuHvg0m++uJ3RyR/uWA
	gqEciAjP/l3PJXN/exhw/mrJGMQJjvY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 08/19] tools/xenstore: replace watch->relative_path with a prefix length
Date: Tue, 13 Dec 2022 17:00:34 +0100
Message-Id: <20221213160045.28170-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
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
---
 tools/xenstore/xenstored_watch.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 75748ac109..5c0f764781 100644
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
 
@@ -313,19 +302,19 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 			       unsigned int conn_id)
 {
 	const char *ret = NULL;
+	const char *watch_path;
 	struct watch *watch;
 	struct xs_state_watch sw;
 	struct xs_state_record_header head;
-	const char *path;
 
 	head.type = XS_STATE_TYPE_WATCH;
 
 	list_for_each_entry(watch, &conn->watches, list) {
 		head.length = sizeof(sw);
 
+		watch_path = get_watch_path(watch, watch->node);
 		sw.conn_id = conn_id;
-		path = get_watch_path(watch, watch->node);
-		sw.path_length = strlen(path) + 1;
+		sw.path_length = strlen(watch_path) + 1;
 		sw.token_length = strlen(watch->token) + 1;
 		head.length += sw.path_length + sw.token_length;
 		head.length = ROUNDUP(head.length, 3);
@@ -334,7 +323,7 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 		if (fwrite(&sw, sizeof(sw), 1, fp) != 1)
 			return "Dump watch state error";
 
-		if (fwrite(path, sw.path_length, 1, fp) != 1)
+		if (fwrite(watch_path, sw.path_length, 1, fp) != 1)
 			return "Dump watch path error";
 		if (fwrite(watch->token, sw.token_length, 1, fp) != 1)
 			return "Dump watch token error";
-- 
2.35.3


