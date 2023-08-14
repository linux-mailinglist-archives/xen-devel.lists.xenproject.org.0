Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BD077B2E7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583325.913510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIk-0004aK-7C; Mon, 14 Aug 2023 07:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583325.913510; Mon, 14 Aug 2023 07:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIk-0004XQ-3F; Mon, 14 Aug 2023 07:47:46 +0000
Received: by outflank-mailman (input) for mailman id 583325;
 Mon, 14 Aug 2023 07:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSIi-0002SK-PE
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:47:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da82ddac-3a76-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:47:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 12F881FD60;
 Mon, 14 Aug 2023 07:47:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4574138EE;
 Mon, 14 Aug 2023 07:47:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T/+PMh/c2WTiQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:47:43 +0000
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
X-Inumbo-ID: da82ddac-3a76-11ee-b288-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BG6qvkTJomUkTWnj+OlsG8s/EdIwcHngnOtZ7JpxP6M=;
	b=dToHoiLXuAix5YyO8lKnbdWE4Jd2JYRLWh79ZyMjzSTiUP12YZ3x//MMfL5c0lK2au+RdH
	8Wz1CvYlgC8thJb7onpGoEmboATAIS6E56tPE4O8VwtfTEUDaTR4u4dZ8BKqqzD1m5PZm4
	1N518dXE6J2m8YqR3qE2JXMDz6Az2IM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 06/19] tools/xenstore: let db_delete() return void
Date: Mon, 14 Aug 2023 09:46:54 +0200
Message-Id: <20230814074707.27696-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

db_delete() only ever is returning 0. Switch it to return void and
remove all the error handling dealing wit a non-zero return value.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- new patch
---
 tools/xenstore/xenstored_core.c        | 11 ++++-------
 tools/xenstore/xenstored_core.h        |  4 ++--
 tools/xenstore/xenstored_transaction.c | 14 +++++---------
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 2b94392fd4..a08962c3ea 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -677,8 +677,8 @@ int db_write(struct connection *conn, const char *db_name, void *data,
 	return 0;
 }
 
-int db_delete(struct connection *conn, const char *name,
-	      struct node_account_data *acc)
+void db_delete(struct connection *conn, const char *name,
+	       struct node_account_data *acc)
 {
 	struct node_account_data tmp_acc;
 	unsigned int domid;
@@ -698,8 +698,6 @@ int db_delete(struct connection *conn, const char *name,
 		domain_memory_add_nochk(conn, domid,
 					-acc->memory - strlen(name));
 	}
-
-	return 0;
 }
 
 /*
@@ -1670,9 +1668,8 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 	if (domain_nbentry_dec(conn, get_node_owner(node)))
 		return WALK_TREE_ERROR_STOP;
 
-	/* In case of error stop the walk. */
-	if (!ret && db_delete(conn, db_name, &node->acc))
-		return WALK_TREE_ERROR_STOP;
+	if (!ret)
+		db_delete(conn, db_name, &node->acc);
 
 	/*
 	 * Fire the watches now, when we can still see the node permissions.
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index ce40c61f44..e1aeb4aecd 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -366,8 +366,8 @@ struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size);
 int db_write(struct connection *conn, const char *db_name, void *data,
 	     size_t size, struct node_account_data *acc,
 	     enum write_node_mode mode, bool no_quota_check);
-int db_delete(struct connection *conn, const char *name,
-	      struct node_account_data *acc);
+void db_delete(struct connection *conn, const char *name,
+	       struct node_account_data *acc);
 
 void conn_free_buffered_data(struct connection *conn);
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 378fe79763..fbcea3663e 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -377,10 +377,8 @@ static int finalize_transaction(struct connection *conn,
 
 		/* Entries for unmodified nodes can be removed early. */
 		if (!i->modified) {
-			if (i->ta_node) {
-				if (db_delete(conn, i->trans_name, NULL))
-					return EIO;
-			}
+			if (i->ta_node)
+				db_delete(conn, i->trans_name, NULL);
 			list_del(&i->list);
 			talloc_free(i);
 		}
@@ -397,8 +395,7 @@ static int finalize_transaction(struct connection *conn,
 				       ? NODE_CREATE : NODE_MODIFY;
 				*is_corrupt |= db_write(conn, i->node, hdr,
 							size, NULL, mode, true);
-				if (db_delete(conn, i->trans_name, NULL))
-					*is_corrupt = true;
+				db_delete(conn, i->trans_name, NULL);
 			} else {
 				*is_corrupt = true;
 			}
@@ -408,9 +405,8 @@ static int finalize_transaction(struct connection *conn,
 			 * in this transaction will have no generation
 			 * information stored.
 			 */
-			*is_corrupt |= (i->generation == NO_GENERATION)
-				       ? false
-				       : db_delete(conn, i->node, NULL);
+			if (i->generation != NO_GENERATION)
+				db_delete(conn, i->node, NULL);
 		}
 		if (i->fire_watch)
 			fire_watches(conn, trans, i->node, NULL, i->watch_exact,
-- 
2.35.3


