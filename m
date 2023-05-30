Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F6715863
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540791.842822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3ufP-0007do-LX; Tue, 30 May 2023 08:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540791.842822; Tue, 30 May 2023 08:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3ufP-0007bh-Ho; Tue, 30 May 2023 08:25:19 +0000
Received: by outflank-mailman (input) for mailman id 540791;
 Tue, 30 May 2023 08:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3ufO-0004aU-EG
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:25:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82059d2a-fec3-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:25:17 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1F1A321A59;
 Tue, 30 May 2023 08:25:17 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DF50F1342F;
 Tue, 30 May 2023 08:25:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id eDIuNeyydWRiEAAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:25:16 +0000
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
X-Inumbo-ID: 82059d2a-fec3-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685435117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=noF7ke7ifpEIxkUkKVhChZXs11mDKBANrUTCMXGJOiU=;
	b=tlgpDHdz8caNb34W8RIlsLAy26Sfgj7qJbgKucowy65/NRunvSG+57sum30JQySSNSLzgP
	XE+6r+9Wm/WSIem9S3/HVBbB8WMLJaG5ZMp9CWTzjzR8uAVkWyEprcpFgqUg1Onpgm6T9W
	ogJ6/qGAGrfLUFNZBoq5aY8uUxkndlA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 09/14] tools/xenstore: add TDB access trace support
Date: Tue, 30 May 2023 10:24:19 +0200
Message-Id: <20230530082424.32126-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530082424.32126-1-jgross@suse.com>
References: <20230530082424.32126-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new trace switch "tdb" and the related trace calls.

The "tdb" switch is off per default.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c        | 8 +++++++-
 tools/xenstore/xenstored_core.h        | 7 +++++++
 tools/xenstore/xenstored_transaction.c | 7 ++++++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index eb916b0647..069c03d4b0 100644
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
 
@@ -2756,7 +2762,7 @@ static void set_quota(const char *arg, bool soft)
 
 /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
 const char *const trace_switches[] = {
-	"obj", "io", "wrl", "acc",
+	"obj", "io", "wrl", "acc", "tdb",
 	NULL
 };
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 3e0734a6c6..5a11dc1231 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -303,9 +303,16 @@ extern unsigned int trace_flags;
 #define TRACE_IO	0x00000002
 #define TRACE_WRL	0x00000004
 #define TRACE_ACC	0x00000008
+#define TRACE_TDB	0x00000010
 extern const char *const trace_switches[];
 int set_trace_switch(const char *arg);
 
+#define trace_tdb(...)				\
+do {						\
+	if (trace_flags & TRACE_TDB)		\
+		trace("tdb: " __VA_ARGS__);	\
+} while (0)
+
 extern TDB_CONTEXT *tdb_ctx;
 extern int dom0_domid;
 extern int dom0_event;
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 2b15506953..11c8bcec84 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -374,8 +374,11 @@ static int finalize_transaction(struct connection *conn,
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
@@ -399,6 +402,8 @@ static int finalize_transaction(struct connection *conn,
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


