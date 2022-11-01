Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E4614EF3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435075.688132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optv0-0001pI-23; Tue, 01 Nov 2022 16:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435075.688132; Tue, 01 Nov 2022 16:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optuz-0001mR-TF; Tue, 01 Nov 2022 16:15:13 +0000
Received: by outflank-mailman (input) for mailman id 435075;
 Tue, 01 Nov 2022 16:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optlG-0003qE-OW
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:05:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5c39eb7-59fe-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:05:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA5F31F8CA;
 Tue,  1 Nov 2022 16:05:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DBAA1346F;
 Tue,  1 Nov 2022 16:05:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2go9IbVDYWN/cgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:05:09 +0000
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
X-Inumbo-ID: f5c39eb7-59fe-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667318709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ex16tXxYUWTa8wrIuGo+oPYlqG5C+9YpA2AwG1Rpfyo=;
	b=nAw8jCn3lUB78s8xN/MoFeZL168qrdvi58IqMzzBHtTRXHhYLxtvbatvLdAKqR9tR0BHtE
	lK1tK/LEfJoB893kvzMcdn1/5jqwfiVaOBv8nbik6SdPv74yvepZQ/FUAZyK6F08DV8e9T
	ASWkrIEbIbZl2/ULG09qwkASkcwtqRM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 08/12] tools/xenstore: add TDB access trace support
Date: Tue,  1 Nov 2022 17:04:18 +0100
Message-Id: <20221101160422.7212-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101160422.7212-1-jgross@suse.com>
References: <20221101160422.7212-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new trace switch "tdb" and the related trace calls.

The "tdb" switch is off per default.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c        | 8 +++++++-
 tools/xenstore/xenstored_core.h        | 6 ++++++
 tools/xenstore/xenstored_transaction.c | 7 ++++++-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index be3c2aba77..f07398e2cf 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -589,6 +589,8 @@ static void get_acc_data(TDB_DATA *key, struct node_account_data *acc)
 		if (old_data.dptr == NULL) {
 			acc->memory = 0;
 		} else {
+			trace_tdb("read %s size %zu\n", key->dptr,
+				  old_data.dsize + key->dsize);
 			hdr = (void *)old_data.dptr;
 			acc->memory = old_data.dsize;
 			acc->domid = hdr->perms[0].id;
@@ -655,6 +657,7 @@ int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
 		errno = EIO;
 		return errno;
 	}
+	trace_tdb("store %s size %zu\n", key->dptr, data->dsize + key->dsize);
 
 	if (acc) {
 		/* Don't use new_domid, as it might be a transaction node. */
@@ -682,6 +685,7 @@ int do_tdb_delete(struct connection *conn, TDB_DATA *key,
 		errno = EIO;
 		return errno;
 	}
+	trace_tdb("delete %s\n", key->dptr);
 
 	if (acc->memory) {
 		domid = get_acc_domid(conn, key, acc->domid);
@@ -731,6 +735,8 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		goto error;
 	}
 
+	trace_tdb("read %s size %zu\n", key.dptr, data.dsize + key.dsize);
+
 	node->parent = NULL;
 	talloc_steal(node, data.dptr);
 
@@ -2737,7 +2743,7 @@ static void set_quota(const char *arg, bool soft)
 
 /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
 const char *trace_switches[] = {
-	"obj", "io", "wrl", "acc",
+	"obj", "io", "wrl", "acc", "tdb",
 	NULL
 };
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index e17bd4c268..d3a17a6ce1 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -295,8 +295,14 @@ extern unsigned int trace_flags;
 #define TRACE_IO	0x00000002
 #define TRACE_WRL	0x00000004
 #define TRACE_ACC	0x00000008
+#define TRACE_TDB	0x00000010
 extern const char *trace_switches[];
 int set_trace_switch(const char *arg);
+#define trace_tdb(...)				\
+do {						\
+	if (trace_flags & TRACE_TDB)		\
+		trace("tdb: " __VA_ARGS__);	\
+} while (0)
 
 extern TDB_CONTEXT *tdb_ctx;
 extern int dom0_domid;
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 1aa9d3cb3d..19a1175d1b 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -366,8 +366,11 @@ static int finalize_transaction(struct connection *conn,
 				if (tdb_error(tdb_ctx) != TDB_ERR_NOEXIST)
 					return EIO;
 				gen = NO_GENERATION;
-			} else
+			} else {
+				trace_tdb("read %s size %zu\n", key.dptr,
+					  key.dsize + data.dsize);
 				gen = hdr->generation;
+			}
 			talloc_free(data.dptr);
 			if (i->generation != gen)
 				return EAGAIN;
@@ -391,6 +394,8 @@ static int finalize_transaction(struct connection *conn,
 			set_tdb_key(i->trans_name, &ta_key);
 			data = tdb_fetch(tdb_ctx, ta_key);
 			if (data.dptr) {
+				trace_tdb("read %s size %zu\n", ta_key.dptr,
+					  ta_key.dsize + data.dsize);
 				hdr = (void *)data.dptr;
 				hdr->generation = ++generation;
 				*is_corrupt |= do_tdb_write(conn, &key, &data,
-- 
2.35.3


