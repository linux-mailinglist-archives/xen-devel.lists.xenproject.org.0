Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935CE7F2BF1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 12:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637751.993803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7z-000596-EH; Tue, 21 Nov 2023 11:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637751.993803; Tue, 21 Nov 2023 11:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7z-000558-Ar; Tue, 21 Nov 2023 11:41:15 +0000
Received: by outflank-mailman (input) for mailman id 637751;
 Tue, 21 Nov 2023 11:41:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5P7x-00041h-Uy
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 11:41:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df7a62ef-8862-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 12:41:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1CF1E1F8B8;
 Tue, 21 Nov 2023 11:41:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3B66138E3;
 Tue, 21 Nov 2023 11:41:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hVs+NliXXGU4dAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 11:41:12 +0000
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
X-Inumbo-ID: df7a62ef-8862-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700566873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=heCKLHEovjITn1/bJzQ4zeWzaVwCVa71/Mq7z/0Cys8=;
	b=tvAg9wARHDX6VxzWVocu3dRql4BsGfqgKwpTX6RSve6Djww5cLhGYcphpKzpcnWKmRoDeV
	yi8rAupjDiLaZk3nNTT7L7Ln/bt4dROHuEkCLOAVYvXbDY1xflkfpFPNjDnP8l2WXDSeGJ
	JrYDu5tq6UcFTqFcPk5sc7TyWqO6u0o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 4/5] tools/xenstored: remove the "-R" command line option
Date: Tue, 21 Nov 2023 12:40:47 +0100
Message-Id: <20231121114048.31294-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231121114048.31294-1-jgross@suse.com>
References: <20231121114048.31294-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

The "-R" (no recovery) command line option enables to omit fixing the
node store in case of detected inconsistencies.

This might have been of interest in the past, when the node data base
was kept in a file, but now the usability of this option is zero.

Remove the "-R" option.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstored/core.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 3ce50b313b..43be89c4fc 100644
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
@@ -2686,8 +2680,6 @@ static void usage(void)
 "  -w, --timeout <what>=<seconds>   set the timeout in seconds for <what>,\n"
 "                          allowed timeout candidates are:\n"
 "                          watch-event: time a watch-event is kept pending\n"
-"  -R, --no-recovery       to request that no recovery should be attempted when\n"
-"                          the store is corrupted (debug only),\n"
 "  -K, --keep-orphans      don't delete nodes owned by a domain when the\n"
 "                          domain is deleted (this is a security risk!)\n");
 }
@@ -2710,7 +2702,6 @@ static struct option options[] = {
 	{ "quota", 1, NULL, 'Q' },
 	{ "quota-soft", 1, NULL, 'q' },
 	{ "timeout", 1, NULL, 'w' },
-	{ "no-recovery", 0, NULL, 'R' },
 	{ "keep-orphans", 0, NULL, 'K' },
 	{ "watch-nb", 1, NULL, 'W' },
 #ifndef NO_LIVE_UPDATE
@@ -2831,7 +2822,7 @@ int main(int argc, char *argv[])
 	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv,
-				  "E:F:H::KNS:t:A:M:Q:q:T:RW:w:U",
+				  "E:F:H::KNS:t:A:M:Q:q:T:W:w:U",
 				  options, NULL)) != -1) {
 		switch (opt) {
 		case 'E':
@@ -2846,9 +2837,6 @@ int main(int argc, char *argv[])
 		case 'N':
 			dofork = false;
 			break;
-		case 'R':
-			recovery = false;
-			break;
 		case 'S':
 			hard_quotas[ACC_NODESZ].val = get_optval_uint(optarg);
 			break;
-- 
2.35.3


