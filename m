Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB016FAEDB
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 13:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531401.827058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzLu-0005w7-W3; Mon, 08 May 2023 11:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531401.827058; Mon, 08 May 2023 11:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzLu-0005tK-Sp; Mon, 08 May 2023 11:48:26 +0000
Received: by outflank-mailman (input) for mailman id 531401;
 Mon, 08 May 2023 11:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pvzLt-0004FA-9j
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 11:48:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d402bad-ed96-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 13:48:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8EDE11FE45;
 Mon,  8 May 2023 11:48:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 623961346B;
 Mon,  8 May 2023 11:48:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id heugFojhWGQeNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 11:48:24 +0000
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
X-Inumbo-ID: 3d402bad-ed96-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683546504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e3gBj5zfxkpTLBUN5UffF19V51EVI0dt3OZ8371Y2g4=;
	b=QDQkK6m/wEb45LS3of0LKGp9TMCrzRREqdkFLFZ44LT7ZlKaD3WtMLBx6emedlKIiX3YsU
	pbCgDkGhrsKLDNNFbJZji5wMkLUGas75fPYfykiD8mZu7K9izYZlKjLhPnt4c2vlGluVT+
	xZ0DnjcQedm5VotHJ6Rvbv6pzrwT4RM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 05/14] tools/xenstore: use accounting buffering for node accounting
Date: Mon,  8 May 2023 13:47:45 +0200
Message-Id: <20230508114754.31514-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230508114754.31514-1-jgross@suse.com>
References: <20230508114754.31514-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the node accounting to the accounting information buffering in
order to avoid having to undo it in case of failure.

This requires to call domain_nbentry_dec() before any changes to the
data base, as it can return an error now.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- add error handling after domain_nbentry_dec() calls (Julien Grall)
---
 tools/xenstore/xenstored_core.c   | 29 +++++++----------------------
 tools/xenstore/xenstored_domain.h |  4 ++--
 2 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 8392bdec9b..22da434e2a 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1454,7 +1454,6 @@ static void destroy_node_rm(struct connection *conn, struct node *node)
 static int destroy_node(struct connection *conn, struct node *node)
 {
 	destroy_node_rm(conn, node);
-	domain_nbentry_dec(conn, get_node_owner(node));
 
 	/*
 	 * It is not possible to easily revert the changes in a transaction.
@@ -1645,6 +1644,9 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 	if (ret > 0)
 		return WALK_TREE_SUCCESS_STOP;
 
+	if (domain_nbentry_dec(conn, get_node_owner(node)))
+		return WALK_TREE_ERROR_STOP;
+
 	/* In case of error stop the walk. */
 	if (!ret && do_tdb_delete(conn, &key, &node->acc))
 		return WALK_TREE_SUCCESS_STOP;
@@ -1657,8 +1659,6 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 	watch_exact = strcmp(root, node->name);
 	fire_watches(conn, ctx, node->name, node, watch_exact, NULL);
 
-	domain_nbentry_dec(conn, get_node_owner(node));
-
 	return WALK_TREE_RM_CHILDENTRY;
 }
 
@@ -1797,29 +1797,14 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 		return EPERM;
 
 	old_perms = node->perms;
-	domain_nbentry_dec(conn, get_node_owner(node));
+	if (domain_nbentry_dec(conn, get_node_owner(node)))
+		return ENOMEM;
 	node->perms = perms;
-	if (domain_nbentry_inc(conn, get_node_owner(node))) {
-		node->perms = old_perms;
-		/*
-		 * This should never fail because we had a reference on the
-		 * domain before and Xenstored is single-threaded.
-		 */
-		domain_nbentry_inc(conn, get_node_owner(node));
+	if (domain_nbentry_inc(conn, get_node_owner(node)))
 		return ENOMEM;
-	}
-
-	if (write_node(conn, node, false)) {
-		int saved_errno = errno;
 
-		domain_nbentry_dec(conn, get_node_owner(node));
-		node->perms = old_perms;
-		/* No failure possible as above. */
-		domain_nbentry_inc(conn, get_node_owner(node));
-
-		errno = saved_errno;
+	if (write_node(conn, node, false))
 		return errno;
-	}
 
 	fire_watches(conn, ctx, name, node, false, &old_perms);
 	send_ack(conn, XS_SET_PERMS);
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index e40657216b..466549709f 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -25,9 +25,9 @@
  * a per transaction array.
  */
 enum accitem {
+	ACC_NODES,
 	ACC_REQ_N,		/* Number of elements per request. */
-	ACC_NODES = ACC_REQ_N,
-	ACC_TR_N,		/* Number of elements per transaction. */
+	ACC_TR_N = ACC_REQ_N,	/* Number of elements per transaction. */
 	ACC_CHD_N = ACC_TR_N,	/* max(ACC_REQ_N, ACC_TR_N), for changed dom. */
 	ACC_N = ACC_TR_N,	/* Number of elements per domain. */
 };
-- 
2.35.3


