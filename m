Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1317571585F
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540780.842793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3ufA-0006BT-NV; Tue, 30 May 2023 08:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540780.842793; Tue, 30 May 2023 08:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3ufA-000678-H1; Tue, 30 May 2023 08:25:04 +0000
Received: by outflank-mailman (input) for mailman id 540780;
 Tue, 30 May 2023 08:25:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3uf8-0003jy-KJ
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:25:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77a45502-fec3-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 10:24:59 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4450D21A59;
 Tue, 30 May 2023 08:25:00 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 14CFD1342F;
 Tue, 30 May 2023 08:25:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 8THRA9yydWQ5EAAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:25:00 +0000
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
X-Inumbo-ID: 77a45502-fec3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685435100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7OuYOTisLhx5B5y8mrKkHc+fXyiK/HdjNpO3kbF28Fo=;
	b=Jc4/PTJUXoRQ1dIO1ufK/Dy4y8X58j0cJtjLgPzRWky/xTMGy/2MXALCkTAQxEb6BTqjYp
	pj4a+c3DKXpr6CdjBP4grNlwothY6QbrTNzbcQR6AB2CN2Mau83C0KIoIs8igOvV+KlkHF
	z1BrhW61IYQDNuR3JM3jDsisqt/LP+w=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 06/14] tools/xenstore: add current connection to domain_memory_add() parameters
Date: Tue, 30 May 2023 10:24:16 +0200
Message-Id: <20230530082424.32126-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530082424.32126-1-jgross@suse.com>
References: <20230530082424.32126-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to enable switching memory accounting to the generic array
based accounting, add the current connection to the parameters of
domain_memory_add().

This requires to add the connection to some other functions, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c   | 28 ++++++++++++++++------------
 tools/xenstore/xenstored_domain.c |  3 ++-
 tools/xenstore/xenstored_domain.h | 14 +++++++++-----
 tools/xenstore/xenstored_watch.c  | 11 ++++++-----
 4 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 0a9c88ca67..006ad9224c 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -246,7 +246,8 @@ static void free_buffered_data(struct buffered_data *out,
 		}
 	}
 
-	domain_memory_add_nochk(conn->id, -out->hdr.msg.len - sizeof(out->hdr));
+	domain_memory_add_nochk(conn, conn->id,
+				-out->hdr.msg.len - sizeof(out->hdr));
 
 	if (out->hdr.msg.type == XS_WATCH_EVENT) {
 		req = out->pend.req;
@@ -631,24 +632,25 @@ int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
 	 * nodes to new owners.
 	 */
 	if (old_acc.memory)
-		domain_memory_add_nochk(old_domid,
+		domain_memory_add_nochk(conn, old_domid,
 					-old_acc.memory - key->dsize);
-	ret = domain_memory_add(new_domid, data->dsize + key->dsize,
-				no_quota_check);
+	ret = domain_memory_add(conn, new_domid,
+				data->dsize + key->dsize, no_quota_check);
 	if (ret) {
 		/* Error path, so no quota check. */
 		if (old_acc.memory)
-			domain_memory_add_nochk(old_domid,
+			domain_memory_add_nochk(conn, old_domid,
 						old_acc.memory + key->dsize);
 		return ret;
 	}
 
 	/* TDB should set errno, but doesn't even set ecode AFAICT. */
 	if (tdb_store(tdb_ctx, *key, *data, TDB_REPLACE) != 0) {
-		domain_memory_add_nochk(new_domid, -data->dsize - key->dsize);
+		domain_memory_add_nochk(conn, new_domid,
+					-data->dsize - key->dsize);
 		/* Error path, so no quota check. */
 		if (old_acc.memory)
-			domain_memory_add_nochk(old_domid,
+			domain_memory_add_nochk(conn, old_domid,
 						old_acc.memory + key->dsize);
 		errno = EIO;
 		return errno;
@@ -683,7 +685,7 @@ int do_tdb_delete(struct connection *conn, TDB_DATA *key,
 
 	if (acc->memory) {
 		domid = get_acc_domid(conn, key, acc->domid);
-		domain_memory_add_nochk(domid, -acc->memory - key->dsize);
+		domain_memory_add_nochk(conn, domid, -acc->memory - key->dsize);
 	}
 
 	return 0;
@@ -1055,11 +1057,13 @@ void send_reply(struct connection *conn, enum xsd_sockmsg_type type,
 	if (len <= DEFAULT_BUFFER_SIZE) {
 		bdata->buffer = bdata->default_buffer;
 		/* Don't check quota, path might be used for returning error. */
-		domain_memory_add_nochk(conn->id, len + sizeof(bdata->hdr));
+		domain_memory_add_nochk(conn, conn->id,
+					len + sizeof(bdata->hdr));
 	} else {
 		bdata->buffer = talloc_array(bdata, char, len);
 		if (!bdata->buffer ||
-		    domain_memory_add_chk(conn->id, len + sizeof(bdata->hdr))) {
+		    domain_memory_add_chk(conn, conn->id,
+					  len + sizeof(bdata->hdr))) {
 			send_error(conn, ENOMEM);
 			return;
 		}
@@ -1124,7 +1128,7 @@ void send_event(struct buffered_data *req, struct connection *conn,
 		}
 	}
 
-	if (domain_memory_add_chk(conn->id, len + sizeof(bdata->hdr))) {
+	if (domain_memory_add_chk(conn, conn->id, len + sizeof(bdata->hdr))) {
 		talloc_free(bdata);
 		return;
 	}
@@ -3332,7 +3336,7 @@ static void add_buffered_data(struct buffered_data *bdata,
 	 * be smaller. So ignore it. The limit will be applied for any resource
 	 * after the state has been fully restored.
 	 */
-	domain_memory_add_nochk(conn->id, len + sizeof(bdata->hdr));
+	domain_memory_add_nochk(conn, conn->id, len + sizeof(bdata->hdr));
 }
 
 void read_state_buffered_data(const void *ctx, struct connection *conn,
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index e59e40088e..7770c4f395 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1236,7 +1236,8 @@ static bool domain_chk_quota(struct domain *domain, int mem)
 	return false;
 }
 
-int domain_memory_add(unsigned int domid, int mem, bool no_quota_check)
+int domain_memory_add(struct connection *conn, unsigned int domid, int mem,
+		      bool no_quota_check)
 {
 	struct domain *domain;
 
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 466549709f..b94548fd7d 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -81,25 +81,29 @@ int domain_nbentry_inc(struct connection *conn, unsigned int domid);
 int domain_nbentry_dec(struct connection *conn, unsigned int domid);
 int domain_nbentry_fix(unsigned int domid, int num, bool update);
 unsigned int domain_nbentry(struct connection *conn);
-int domain_memory_add(unsigned int domid, int mem, bool no_quota_check);
+int domain_memory_add(struct connection *conn, unsigned int domid, int mem,
+		      bool no_quota_check);
 
 /*
  * domain_memory_add_chk(): to be used when memory quota should be checked.
  * Not to be used when specifying a negative mem value, as lowering the used
  * memory should always be allowed.
  */
-static inline int domain_memory_add_chk(unsigned int domid, int mem)
+static inline int domain_memory_add_chk(struct connection *conn,
+					unsigned int domid, int mem)
 {
-	return domain_memory_add(domid, mem, false);
+	return domain_memory_add(conn, domid, mem, false);
 }
+
 /*
  * domain_memory_add_nochk(): to be used when memory quota should not be
  * checked, e.g. when lowering memory usage, or in an error case for undoing
  * a previous memory adjustment.
  */
-static inline void domain_memory_add_nochk(unsigned int domid, int mem)
+static inline void domain_memory_add_nochk(struct connection *conn,
+					   unsigned int domid, int mem)
 {
-	domain_memory_add(domid, mem, true);
+	domain_memory_add(conn, domid, mem, true);
 }
 void domain_watch_inc(struct connection *conn);
 void domain_watch_dec(struct connection *conn);
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 8ad0229df6..e30cd89be3 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -199,7 +199,7 @@ static struct watch *add_watch(struct connection *conn, char *path, char *token,
 	watch->token = talloc_strdup(watch, token);
 	if (!watch->node || !watch->token)
 		goto nomem;
-	if (domain_memory_add(conn->id, strlen(path) + strlen(token),
+	if (domain_memory_add(conn, conn->id, strlen(path) + strlen(token),
 			      no_quota_check))
 		goto nomem;
 
@@ -274,8 +274,9 @@ int do_unwatch(const void *ctx, struct connection *conn,
 	list_for_each_entry(watch, &conn->watches, list) {
 		if (streq(watch->node, node) && streq(watch->token, vec[1])) {
 			list_del(&watch->list);
-			domain_memory_add_nochk(conn->id, -strlen(watch->node) -
-							  strlen(watch->token));
+			domain_memory_add_nochk(conn, conn->id,
+						-strlen(watch->node) -
+						strlen(watch->token));
 			talloc_free(watch);
 			domain_watch_dec(conn);
 			send_ack(conn, XS_UNWATCH);
@@ -291,8 +292,8 @@ void conn_delete_all_watches(struct connection *conn)
 
 	while ((watch = list_top(&conn->watches, struct watch, list))) {
 		list_del(&watch->list);
-		domain_memory_add_nochk(conn->id, -strlen(watch->node) -
-						  strlen(watch->token));
+		domain_memory_add_nochk(conn, conn->id, -strlen(watch->node) -
+							strlen(watch->token));
 		talloc_free(watch);
 		domain_watch_dec(conn);
 	}
-- 
2.35.3


