Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B87159A8
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:14:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540964.843183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQQ-0007xT-CW; Tue, 30 May 2023 09:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540964.843183; Tue, 30 May 2023 09:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQQ-0007up-8K; Tue, 30 May 2023 09:13:54 +0000
Received: by outflank-mailman (input) for mailman id 540964;
 Tue, 30 May 2023 09:13:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3vQP-0006nv-Gl
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:13:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4be8ab9d-feca-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 11:13:53 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B862121AC5;
 Tue, 30 May 2023 09:13:52 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 89F981341B;
 Tue, 30 May 2023 09:13:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 56orIFC+dWTiIgAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 09:13:52 +0000
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
X-Inumbo-ID: 4be8ab9d-feca-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685438032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LaigVqKga5DdOUggEAXiuJzbZ/VBvKJTFm/Qf2fJTXM=;
	b=suJmawvgPL32cthBV2CL4Jm3HF+dPY+NmhUQT7AcVgmXFdxKlAMvQbpYmlXtb0HIZ49TVu
	B+guJMw4FLRODOtsKtw0KdKXhSzg9sOGbW4nTXkydWTFxlDj8t+GqEynI3P+oyiBZdyyHP
	l1J0m368p8h7hUqkDij2ZmZwcXNiKro=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 03/11] tools/xenstore: let transaction_prepend() return the name for access
Date: Tue, 30 May 2023 11:13:25 +0200
Message-Id: <20230530091333.7678-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530091333.7678-1-jgross@suse.com>
References: <20230530091333.7678-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of setting the TDB key for accessing the node in the data base,
let transaction_prepend() return the associated name instead.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c        |  4 +++-
 tools/xenstore/xenstored_transaction.c | 11 ++++-------
 tools/xenstore/xenstored_transaction.h |  3 +--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a1d5d4a419..239f8c6bc4 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -694,6 +694,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	TDB_DATA key, data;
 	struct xs_tdb_record_hdr *hdr;
 	struct node *node;
+	const char *db_name;
 	int err;
 
 	node = talloc(ctx, struct node);
@@ -708,7 +709,8 @@ struct node *read_node(struct connection *conn, const void *ctx,
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


