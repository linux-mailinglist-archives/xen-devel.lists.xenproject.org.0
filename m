Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC46751F2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 11:01:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481577.746600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoCu-0003uq-Kp; Fri, 20 Jan 2023 10:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481577.746600; Fri, 20 Jan 2023 10:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoCu-0003rZ-GZ; Fri, 20 Jan 2023 10:01:12 +0000
Received: by outflank-mailman (input) for mailman id 481577;
 Fri, 20 Jan 2023 10:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYwS=5R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pIoCt-0001Kj-Hn
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 10:01:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5be466a6-98a9-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 11:01:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BC6522A04;
 Fri, 20 Jan 2023 10:01:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FF211390C;
 Fri, 20 Jan 2023 10:01:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oi66GWNmymM5RQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 20 Jan 2023 10:01:07 +0000
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
X-Inumbo-ID: 5be466a6-98a9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674208867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zwrTl2/5uOzPJK/703a+MTcvbAcwTPMWIDw3qiSNqIA=;
	b=gi7x5zNiJvQrmI8N/9pjlDwBGDSJK1dqCTvnBxW5qnWJfj1YenK2gbxQWIiqLvSrRaybOf
	j7qmtmAXtwvopmHA3vdpy02nMAR83BQ5WTaKjRMNeME37ywN6grQ8N4Ub9xLEpy6PY7Ul/
	hzB4bzMIJlvYkYeeAJSZhBj0X4hq6Uk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 06/13] tools/xenstore: add current connection to domain_memory_add() parameters
Date: Fri, 20 Jan 2023 11:00:21 +0100
Message-Id: <20230120100028.11142-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120100028.11142-1-jgross@suse.com>
References: <20230120100028.11142-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to enable switching memory accounting to the generic array
based accounting, add the current connection to the parameters of
domain_memory_add().

This requires to add the connection to some other functions, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   | 28 ++++++++++++++++------------
 tools/xenstore/xenstored_domain.c |  3 ++-
 tools/xenstore/xenstored_domain.h | 14 +++++++++-----
 tools/xenstore/xenstored_watch.c  | 11 ++++++-----
 4 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 250ecd1199..1958df9147 100644
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
@@ -1052,11 +1054,13 @@ void send_reply(struct connection *conn, enum xsd_sockmsg_type type,
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
@@ -1122,7 +1126,7 @@ void send_event(struct buffered_data *req, struct connection *conn,
 		}
 	}
 
-	if (domain_memory_add_chk(conn->id, len + sizeof(bdata->hdr))) {
+	if (domain_memory_add_chk(conn, conn->id, len + sizeof(bdata->hdr))) {
 		talloc_free(bdata);
 		return;
 	}
@@ -3307,7 +3311,7 @@ static void add_buffered_data(struct buffered_data *bdata,
 	 * be smaller. So ignore it. The limit will be applied for any resource
 	 * after the state has been fully restored.
 	 */
-	domain_memory_add_nochk(conn->id, len + sizeof(bdata->hdr));
+	domain_memory_add_nochk(conn, conn->id, len + sizeof(bdata->hdr));
 }
 
 void read_state_buffered_data(const void *ctx, struct connection *conn,
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 33105dba8f..9e7252372d 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1233,7 +1233,8 @@ static bool domain_chk_quota(struct domain *domain, int mem)
 	return false;
 }
 
-int domain_memory_add(unsigned int domid, int mem, bool no_quota_check)
+int domain_memory_add(struct connection *conn, unsigned int domid, int mem,
+		      bool no_quota_check)
 {
 	struct domain *domain;
 
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 5df6ae72f8..11569dbd1b 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -75,25 +75,29 @@ int domain_nbentry_inc(struct connection *conn, unsigned int domid);
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


