Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB974CDCF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560958.877174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksl-00060f-61; Mon, 10 Jul 2023 07:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560958.877174; Mon, 10 Jul 2023 07:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksl-0005yh-2S; Mon, 10 Jul 2023 07:00:27 +0000
Received: by outflank-mailman (input) for mailman id 560958;
 Mon, 10 Jul 2023 07:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIksj-0002xd-Uu
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:00:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 717eb1f8-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:00:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 747381F747;
 Mon, 10 Jul 2023 07:00:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3BC6D1361C;
 Mon, 10 Jul 2023 07:00:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2sUrDYisq2TdYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:00:24 +0000
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
X-Inumbo-ID: 717eb1f8-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzvJEgIn/rZaTJd+/fCRGx2LuqccSDVwxNp6blv09EQ=;
	b=p2ykWYe6hEf9TmuI1G2oXvEdrA7uNc8uVO1XMXXjWbuLNvdDTcOWoU5ipYscRN2LRiAK+v
	6vu3n557Odvyk6M9ZVXfrYsCdj7Sxhqh03wFAohGrE5JneZx7xmvbKbayzNxMvMhXSplgN
	8c0U45JwzDdbKHh/lvrQKcljDxb+zO4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 06/18] tools/xenstore: switch get_acc_data() to use name instead of key
Date: Mon, 10 Jul 2023 08:59:35 +0200
Message-Id: <20230710065947.4201-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate further TDB_DATA usage by switching get_acc_data() and
get_acc_domid() from a TDB key to the name of the node in the data base
as a parameter.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 9bcff43e21..170181d8e6 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -566,19 +566,20 @@ void set_tdb_key(const char *name, TDB_DATA *key)
 	key->dsize = strlen(name);
 }
 
-static void get_acc_data(TDB_DATA *key, struct node_account_data *acc)
+static void get_acc_data(const char *name, struct node_account_data *acc)
 {
-	TDB_DATA old_data;
+	TDB_DATA key, old_data;
 	struct xs_tdb_record_hdr *hdr;
 
 	if (acc->memory < 0) {
-		old_data = tdb_fetch(tdb_ctx, *key);
+		set_tdb_key(name, &key);
+		old_data = tdb_fetch(tdb_ctx, key);
 		/* No check for error, as the node might not exist. */
 		if (old_data.dptr == NULL) {
 			acc->memory = 0;
 		} else {
-			trace_tdb("read %s size %zu\n", key->dptr,
-				  old_data.dsize + key->dsize);
+			trace_tdb("read %s size %zu\n", name,
+				  old_data.dsize + key.dsize);
 			hdr = (void *)old_data.dptr;
 			acc->memory = old_data.dsize;
 			acc->domid = hdr->perms[0].id;
@@ -593,11 +594,10 @@ static void get_acc_data(TDB_DATA *key, struct node_account_data *acc)
  * count prepended (e.g. 123/local/domain/...). So testing for the node's
  * key not to start with "/" or "@" is sufficient.
  */
-static unsigned int get_acc_domid(struct connection *conn, TDB_DATA *key,
+static unsigned int get_acc_domid(struct connection *conn, const char *name,
 				  unsigned int domid)
 {
-	return (!conn || key->dptr[0] == '/' || key->dptr[0] == '@')
-	       ? domid : conn->id;
+	return (!conn || name[0] == '/' || name[0] == '@') ? domid : conn->id;
 }
 
 int db_write(struct connection *conn, const char *db_name, void *data,
@@ -618,9 +618,9 @@ int db_write(struct connection *conn, const char *db_name, void *data,
 	else
 		old_acc = *acc;
 
-	get_acc_data(&key, &old_acc);
-	old_domid = get_acc_domid(conn, &key, old_acc.domid);
-	new_domid = get_acc_domid(conn, &key, hdr->perms[0].id);
+	get_acc_data(db_name, &old_acc);
+	old_domid = get_acc_domid(conn, db_name, old_acc.domid);
+	new_domid = get_acc_domid(conn, db_name, hdr->perms[0].id);
 
 	/*
 	 * Don't check for ENOENT, as we want to be able to switch orphaned
@@ -675,7 +675,7 @@ int db_delete(struct connection *conn, const char *name,
 		acc->memory = -1;
 	}
 
-	get_acc_data(&key, acc);
+	get_acc_data(name, acc);
 
 	if (tdb_delete(tdb_ctx, key)) {
 		errno = EIO;
@@ -684,7 +684,7 @@ int db_delete(struct connection *conn, const char *name,
 	trace_tdb("delete %s\n", name);
 
 	if (acc->memory) {
-		domid = get_acc_domid(conn, &key, acc->domid);
+		domid = get_acc_domid(conn, name, acc->domid);
 		domain_memory_add_nochk(conn, domid, -acc->memory - key.dsize);
 	}
 
-- 
2.35.3


