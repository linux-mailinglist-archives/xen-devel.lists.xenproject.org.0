Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5826CC255
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515910.799263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAXt-00054h-9r; Tue, 28 Mar 2023 14:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515910.799263; Tue, 28 Mar 2023 14:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAXt-00051h-71; Tue, 28 Mar 2023 14:43:33 +0000
Received: by outflank-mailman (input) for mailman id 515910;
 Tue, 28 Mar 2023 14:43:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLKu=7U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phAXr-00051b-VO
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:43:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e78ee3cf-cd76-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 16:43:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 063D221A2E;
 Tue, 28 Mar 2023 14:43:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF4BB1390D;
 Tue, 28 Mar 2023 14:43:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fj9iMRD9ImRvfwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Mar 2023 14:43:28 +0000
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
X-Inumbo-ID: e78ee3cf-cd76-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680014609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WJKej2F2T0liQUy5RrirY2PhZ84TxQV/5YAjMJ02gg0=;
	b=bYA1m47rG+RYuvY1drnbx/Kj+vPAIp4ooiUX1AQfFpvXTPYiTFGxGfPW0t0CNR2LbaFh/P
	Ga20qDsIxxvv12HeVBQ/H1Xd6Sbx9/a3otrdFnbsDJTP+Z0kevu2JR5WLUylg5v0qaSAi6
	09FA3bVJrb5gGennYS75PqghfzfzORo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools/xenstore: fix quota check in acc_fix_domains()
Date: Tue, 28 Mar 2023 16:43:27 +0200
Message-Id: <20230328144327.6562-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today when finalizing a transaction the number of node quota is checked
to not being exceeded after the transaction. This check is always done,
even if the transaction is being performed by a privileged connection,
or if there were no nodes created in the transaction.

Correct that by checking quota only if:
- the transaction is being performed by an unprivileged guest, and
- at least one node was created in the transaction

Reported-by: Julien Grall <julien@xen.org>
Fixes: f2bebf72c4d5 ("xenstore: rework of transaction handling")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add comment (Julien Grall)
---
 tools/xenstore/xenstored_core.c        |  3 +++
 tools/xenstore/xenstored_domain.c      |  4 ++--
 tools/xenstore/xenstored_domain.h      |  7 ++++++-
 tools/xenstore/xenstored_transaction.c | 16 ++++++++++++++--
 tools/xenstore/xenstored_transaction.h |  3 +++
 5 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a61db2db2d..3ca68681e3 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1472,6 +1472,9 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 	if (!node)
 		return NULL;
 
+	if (conn && conn->transaction)
+		ta_node_created(conn->transaction);
+
 	node->data = data;
 	node->datalen = datalen;
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index d7fc2fafc7..f62be2245c 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -544,7 +544,7 @@ static struct domain *find_domain_by_domid(unsigned int domid)
 	return (d && d->introduced) ? d : NULL;
 }
 
-int acc_fix_domains(struct list_head *head, bool update)
+int acc_fix_domains(struct list_head *head, bool chk_quota, bool update)
 {
 	struct changed_domain *cd;
 	int cnt;
@@ -552,7 +552,7 @@ int acc_fix_domains(struct list_head *head, bool update)
 	list_for_each_entry(cd, head, list) {
 		cnt = domain_nbentry_fix(cd->domid, cd->nbentry, update);
 		if (!update) {
-			if (cnt >= quota_nb_entry_per_domain)
+			if (chk_quota && cnt >= quota_nb_entry_per_domain)
 				return ENOSPC;
 			if (cnt < 0)
 				return ENOMEM;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index dc4660861e..279cccb3ad 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -96,7 +96,12 @@ void domain_outstanding_dec(struct connection *conn);
 void domain_outstanding_domid_dec(unsigned int domid);
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid);
-int acc_fix_domains(struct list_head *head, bool update);
+
+/*
+ * Update or check number of nodes per domain at the end of a transaction.
+ * If "update" is true, "chk_quota" is ignored.
+ */
+int acc_fix_domains(struct list_head *head, bool chk_quota, bool update);
 
 /* Write rate limiting */
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 1aa9d3cb3d..2b15506953 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -160,12 +160,20 @@ struct transaction
 	/* List of changed domains - to record the changed domain entry number */
 	struct list_head changed_domains;
 
+	/* There was at least one node created in the transaction. */
+	bool node_created;
+
 	/* Flag for letting transaction fail. */
 	bool fail;
 };
 
 uint64_t generation;
 
+void ta_node_created(struct transaction *trans)
+{
+	trans->node_created = true;
+}
+
 static struct accessed_node *find_accessed_node(struct transaction *trans,
 						const char *name)
 {
@@ -509,6 +517,7 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 	const char *arg = onearg(in);
 	struct transaction *trans;
 	bool is_corrupt = false;
+	bool chk_quota;
 	int ret;
 
 	if (!arg || (!streq(arg, "T") && !streq(arg, "F")))
@@ -523,13 +532,16 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 	if (!conn->transaction_started)
 		conn->ta_start_time = 0;
 
+	chk_quota = trans->node_created && domain_is_unprivileged(conn);
+
 	/* Attach transaction to ctx for auto-cleanup */
 	talloc_steal(ctx, trans);
 
 	if (streq(arg, "T")) {
 		if (trans->fail)
 			return ENOMEM;
-		ret = acc_fix_domains(&trans->changed_domains, false);
+		ret = acc_fix_domains(&trans->changed_domains, chk_quota,
+				      false);
 		if (ret)
 			return ret;
 		ret = finalize_transaction(conn, trans, &is_corrupt);
@@ -539,7 +551,7 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 		wrl_apply_debit_trans_commit(conn);
 
 		/* fix domain entry for each changed domain */
-		acc_fix_domains(&trans->changed_domains, true);
+		acc_fix_domains(&trans->changed_domains, false, true);
 
 		if (is_corrupt)
 			corrupt(conn, "transaction inconsistency");
diff --git a/tools/xenstore/xenstored_transaction.h b/tools/xenstore/xenstored_transaction.h
index b6f8cb7d0a..883145163f 100644
--- a/tools/xenstore/xenstored_transaction.h
+++ b/tools/xenstore/xenstored_transaction.h
@@ -36,6 +36,9 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 
 struct transaction *transaction_lookup(struct connection *conn, uint32_t id);
 
+/* Set flag for created node. */
+void ta_node_created(struct transaction *trans);
+
 /* This node was accessed. */
 int __must_check access_node(struct connection *conn, struct node *node,
                              enum node_access_type type, TDB_DATA *key);
-- 
2.35.3


