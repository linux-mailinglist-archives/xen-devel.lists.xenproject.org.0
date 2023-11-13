Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0AD7E9C58
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 13:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631563.985032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WI4-0001Qe-9w; Mon, 13 Nov 2023 12:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631563.985032; Mon, 13 Nov 2023 12:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WI4-0001OO-5R; Mon, 13 Nov 2023 12:43:44 +0000
Received: by outflank-mailman (input) for mailman id 631563;
 Mon, 13 Nov 2023 12:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2WI2-00089i-3f
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 12:43:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45b691b4-8222-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 13:43:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C1FC218F1;
 Mon, 13 Nov 2023 12:43:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F4711358C;
 Mon, 13 Nov 2023 12:43:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id foUqCvwZUmVzcQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 12:43:40 +0000
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
X-Inumbo-ID: 45b691b4-8222-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699879420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e446G+xhnceZo0d5puzVNgBcr2j5egvLiaV1XBFhMhk=;
	b=KNIGDnA5bPPhkylE+AV8izI7gRoOYYwWNuwAo/JEqdt0cHSklk2yCi6qpq4/8UOS1yFFWW
	r69ovYsJU+7UQKkMrQzg0HlVzCYIPwpOR3S6Q/mX5Ufl2o/KBbCxJ2WcGGQzkq4VJLe1rN
	pGrpLlx+YrxIW5RzNN/+yJ4D3zc5Alg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 5/5] tools/xenstored: remove the "-R" command line option
Date: Mon, 13 Nov 2023 13:43:09 +0100
Message-Id: <20231113124309.10862-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231113124309.10862-1-jgross@suse.com>
References: <20231113124309.10862-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "-R" (no recovery) command line option enables to omit fixing the
node store in case of detected inconsistencies.

This might have been of interest in the past, when the node data base
was kept in a file, but now the usability of this option is zero.

Remove the "-R" option.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index c3cfef0965..9d6a5684b8 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -78,7 +78,6 @@ char **orig_argv;
 
 LIST_HEAD(connections);
 int tracefd = -1;
-static bool recovery = true;
 bool keep_orphans = false;
 static int reopen_log_pipe[2];
 static int reopen_log_pipe0_pollfd_idx = -1;
@@ -2443,9 +2442,6 @@ int remember_string(struct hashtable *hash, const char *str)
  * have a corresponding child node (and if so, delete them).  Each valid child
  * is then recursively checked.
  *
- * No deleting is performed if the recovery flag is cleared (i.e. -R was
- * passed on the command line).
- *
  * As we go, we record each node in the given reachable hashtable.  These
  * entries will be used later in clean_store.
  */
@@ -2462,8 +2458,7 @@ static int check_store_step(const void *ctx, struct connection *conn,
 
 	if (hashtable_search(data->reachable, (void *)node->name)) {
 		log("check_store: '%s' is duplicated!", node->name);
-		return recovery ? WALK_TREE_RM_CHILDENTRY
-				: WALK_TREE_SKIP_CHILDREN;
+		return WALK_TREE_RM_CHILDENTRY;
 	}
 
 	if (remember_string(data->reachable, node->name))
@@ -2479,7 +2474,7 @@ static int check_store_enoent(const void *ctx, struct connection *conn,
 {
 	log("check_store: node '%s' not found", name);
 
-	return recovery ? WALK_TREE_RM_CHILDENTRY : WALK_TREE_OK;
+	return WALK_TREE_RM_CHILDENTRY;
 }
 
 
@@ -2504,8 +2499,7 @@ static int clean_store_(const void *key, void *val, void *private)
 	}
 	if (!hashtable_search(reachable, name)) {
 		log("clean_store: '%s' is orphaned!", name);
-		if (recovery)
-			db_delete(NULL, name, NULL);
+		db_delete(NULL, name, NULL);
 	}
 
 	talloc_free(name);
@@ -2685,8 +2679,6 @@ static void usage(void)
 "  -w, --timeout <what>=<seconds>   set the timeout in seconds for <what>,\n"
 "                          allowed timeout candidates are:\n"
 "                          watch-event: time a watch-event is kept pending\n"
-"  -R, --no-recovery       to request that no recovery should be attempted when\n"
-"                          the store is corrupted (debug only),\n"
 "  -K, --keep-orphans      don't delete nodes owned by a domain when the\n"
 "                          domain is deleted (this is a security risk!)\n");
 }
@@ -2708,7 +2700,6 @@ static struct option options[] = {
 	{ "quota", 1, NULL, 'Q' },
 	{ "quota-soft", 1, NULL, 'q' },
 	{ "timeout", 1, NULL, 'w' },
-	{ "no-recovery", 0, NULL, 'R' },
 	{ "keep-orphans", 0, NULL, 'K' },
 	{ "watch-nb", 1, NULL, 'W' },
 #ifndef NO_LIVE_UPDATE
@@ -2828,7 +2819,7 @@ int main(int argc, char *argv[])
 	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv,
-				  "E:F:H::KS:t:A:M:Q:q:T:RW:w:U",
+				  "E:F:H::KS:t:A:M:Q:q:T:W:w:U",
 				  options, NULL)) != -1) {
 		switch (opt) {
 		case 'E':
@@ -2840,9 +2831,6 @@ int main(int argc, char *argv[])
 		case 'H':
 			usage();
 			return 0;
-		case 'R':
-			recovery = false;
-			break;
 		case 'S':
 			hard_quotas[ACC_NODESZ].val = get_optval_uint(optarg);
 			break;
-- 
2.35.3


