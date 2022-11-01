Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94023614E79
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:37:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434913.687751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optKN-0007LS-D6; Tue, 01 Nov 2022 15:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434913.687751; Tue, 01 Nov 2022 15:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optKN-0007Ib-3Y; Tue, 01 Nov 2022 15:37:23 +0000
Received: by outflank-mailman (input) for mailman id 434913;
 Tue, 01 Nov 2022 15:37:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optCy-0007Tl-Nq
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:29:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0183a777-59fa-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 16:29:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3FA51F8E3;
 Tue,  1 Nov 2022 15:29:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C7DC61346F;
 Tue,  1 Nov 2022 15:29:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W4FOL2U7YWPvYAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:29:41 +0000
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
X-Inumbo-ID: 0183a777-59fa-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBeCcFuOhLUEwWwrku8ezHj3ySsRMOxBoKQyjJXO/Rw=;
	b=GKHnzEtw0Utvfi1KYA0w3j9knflkiyuEPxBNpn2l9n0YccG2EaIzQKsOPnEcyzTgHKs2xI
	/VfnGYAfcuqBZH3aP7VUxPEthZNYbq4ikvy+v9S829wbxc9iXLJ/sfJ5N3LuPj2952BFvC
	+LNPV+7SFeCLpynsKx1ITNzbn9F/KMI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 10/20] tools/xenstore: replace watch->relative_path with a prefix length
Date: Tue,  1 Nov 2022 16:28:32 +0100
Message-Id: <20221101152842.4257-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of storing a pointer to the path which is prepended to
relative paths in struct watch, just use the length of the prepended
path.

It should be noted that the now removed special case of the
relative path being "" in get_watch_path() can't happen at all.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_watch.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 75748ac109..8bed967c56 100644
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
 
@@ -316,7 +305,6 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 	struct watch *watch;
 	struct xs_state_watch sw;
 	struct xs_state_record_header head;
-	const char *path;
 
 	head.type = XS_STATE_TYPE_WATCH;
 
@@ -324,8 +312,7 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 		head.length = sizeof(sw);
 
 		sw.conn_id = conn_id;
-		path = get_watch_path(watch, watch->node);
-		sw.path_length = strlen(path) + 1;
+		sw.path_length = strlen(watch->node + watch->prefix_len) + 1;
 		sw.token_length = strlen(watch->token) + 1;
 		head.length += sw.path_length + sw.token_length;
 		head.length = ROUNDUP(head.length, 3);
@@ -334,7 +321,8 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 		if (fwrite(&sw, sizeof(sw), 1, fp) != 1)
 			return "Dump watch state error";
 
-		if (fwrite(path, sw.path_length, 1, fp) != 1)
+		if (fwrite(watch->node + watch->prefix_len, sw.path_length,
+			   1, fp) != 1)
 			return "Dump watch path error";
 		if (fwrite(watch->token, sw.token_length, 1, fp) != 1)
 			return "Dump watch token error";
-- 
2.35.3


