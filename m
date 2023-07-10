Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251A874CDCA
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560948.877144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksT-0004UY-Bx; Mon, 10 Jul 2023 07:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560948.877144; Mon, 10 Jul 2023 07:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksT-0004SM-7M; Mon, 10 Jul 2023 07:00:09 +0000
Received: by outflank-mailman (input) for mailman id 560948;
 Mon, 10 Jul 2023 07:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIksS-0002xd-CK
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:00:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 676f134e-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:00:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 904E921E97;
 Mon, 10 Jul 2023 07:00:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 537C71361C;
 Mon, 10 Jul 2023 07:00:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Afj2Enesq2StYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:00:07 +0000
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
X-Inumbo-ID: 676f134e-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZ3QkIbfe9/RFlUdF2rbK/pn4dQLdQYEQ838CQ5c7JM=;
	b=jpqktDvbyx541fU5KQztWpDkZnrOt8ulOrNzkJjycn8dGFTtVOEoIXGoP/IjzJ3/RLznTj
	eqrOeGhP/o4nhBF0CSYSA86iJbOoX4Dp+jyCENU8V1RwRKcTKfSage9dE5BCNP2guHZrrl
	nIvA/wbfBnfNZDm/MxsRIWCtlIeDewA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 03/18] tools/xenstore: let transaction_prepend() return the name for access
Date: Mon, 10 Jul 2023 08:59:32 +0200
Message-Id: <20230710065947.4201-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of setting the TDB key for accessing the node in the data base,
let transaction_prepend() return the associated name instead.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c        |  4 +++-
 tools/xenstore/xenstored_transaction.c | 11 ++++-------
 tools/xenstore/xenstored_transaction.h |  3 +--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 521ce1a70e..6d7f002b54 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -695,6 +695,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	TDB_DATA key, data;
 	struct xs_tdb_record_hdr *hdr;
 	struct node *node;
+	const char *db_name;
 	int err;
 
 	node = talloc(ctx, struct node);
@@ -709,7 +710,8 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		return NULL;
 	}
 
-	transaction_prepend(conn, name, &key);
+	db_name = transaction_prepend(conn, name);
+	set_tdb_key(db_name, &key);
 
 	data = tdb_fetch(tdb_ctx, key);
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 9dab0cd165..1646c07040 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -196,20 +196,17 @@ static char *transaction_get_node_name(void *ctx, struct transaction *trans,
  * Prepend the transaction to name if node has been modified in the current
  * transaction.
  */
-void transaction_prepend(struct connection *conn, const char *name,
-			 TDB_DATA *key)
+const char *transaction_prepend(struct connection *conn, const char *name)
 {
 	struct accessed_node *i;
 
 	if (conn && conn->transaction) {
 		i = find_accessed_node(conn->transaction, name);
-		if (i) {
-			set_tdb_key(i->trans_name, key);
-			return;
-		}
+		if (i)
+			return i->trans_name;
 	}
 
-	set_tdb_key(name, key);
+	return name;
 }
 
 /*
diff --git a/tools/xenstore/xenstored_transaction.h b/tools/xenstore/xenstored_transaction.h
index f6a2e2f7f5..b196b1ab07 100644
--- a/tools/xenstore/xenstored_transaction.h
+++ b/tools/xenstore/xenstored_transaction.h
@@ -47,8 +47,7 @@ int __must_check access_node(struct connection *conn, struct node *node,
 void queue_watches(struct connection *conn, const char *name, bool watch_exact);
 
 /* Prepend the transaction to name if appropriate. */
-void transaction_prepend(struct connection *conn, const char *name,
-                         TDB_DATA *key);
+const char *transaction_prepend(struct connection *conn, const char *name);
 
 /* Mark the transaction as failed. This will prevent it to be committed. */
 void fail_transaction(struct transaction *trans);
-- 
2.35.3


