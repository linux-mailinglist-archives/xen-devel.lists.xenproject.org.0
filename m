Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F487159AA
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540972.843212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQh-00015E-FG; Tue, 30 May 2023 09:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540972.843212; Tue, 30 May 2023 09:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQh-00010D-CJ; Tue, 30 May 2023 09:14:11 +0000
Received: by outflank-mailman (input) for mailman id 540972;
 Tue, 30 May 2023 09:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3vQg-0006nv-Bf
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:14:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55e4061e-feca-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 11:14:09 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B26B21A78;
 Tue, 30 May 2023 09:14:09 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 61E351341B;
 Tue, 30 May 2023 09:14:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id MrCaFmG+dWT8IgAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 09:14:09 +0000
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
X-Inumbo-ID: 55e4061e-feca-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685438049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qS4AOkAcsCiQqUZmpFoLkz4Si4Jg5kN7awE7TAatN8=;
	b=G9Ai5i1flNhm3A3LcvbIXQk6brAg2AMTkkjRCmSvAElodZ4CWvFqAX1ztlU+5jTnscqsHQ
	FSaYfw2QQEw9ZBvTbvlyoJED30dvHjDYuSYcuFJWkR2qHwEWZHZZddu9FR4RAoyJwoNeid
	tt7i1/bo+HEf42H/BG/IU/79q5y0AZc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 06/11] tools/xenstore: switch get_acc_data() to use name instead of key
Date: Tue, 30 May 2023 11:13:28 +0200
Message-Id: <20230530091333.7678-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530091333.7678-1-jgross@suse.com>
References: <20230530091333.7678-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate further TDB_DATA usage by switching get_acc_data() and
get_acc_domid() from a TDB key to the name of the node in the data base
as a parameter.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 8fbf686331..522b2bbf5f 100644
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


