Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319706751F0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 11:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481568.746580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoCg-0002ni-TP; Fri, 20 Jan 2023 10:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481568.746580; Fri, 20 Jan 2023 10:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoCg-0002mG-Ob; Fri, 20 Jan 2023 10:00:58 +0000
Received: by outflank-mailman (input) for mailman id 481568;
 Fri, 20 Jan 2023 10:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYwS=5R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pIoCf-0001Kj-Hg
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 10:00:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5542034f-98a9-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 11:00:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7DBC922A09;
 Fri, 20 Jan 2023 10:00:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C7D51390C;
 Fri, 20 Jan 2023 10:00:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PnZbEVhmymMlRQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 20 Jan 2023 10:00:56 +0000
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
X-Inumbo-ID: 5542034f-98a9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674208856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6SkvS5Fu9OM2Kf47HsJ0nDTi/Ok9cmmcQuqSRDJBw2o=;
	b=bzFQhE1WUgL5EtLFJzBWllaQZzU2RpG1CMzah626tQD2uvhq2HfebGyttS6xsC3n+fk0Gl
	s/IxJMLAHAXV024MHkTIUrYAzpvOsDmbtuokT98CoP6fgdm58T3g1By6N3Mpdr2/v7oAG3
	9+jhc/UHRYAJy43kt8YgUkQPtxJNse8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 04/13] tools/xenstore: add framework to commit accounting data on success only
Date: Fri, 20 Jan 2023 11:00:19 +0100
Message-Id: <20230120100028.11142-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120100028.11142-1-jgross@suse.com>
References: <20230120100028.11142-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of modifying accounting data and undo those modifications in
case of an error during further processing, add a framework for
collecting the needed changes and commit them only when the whole
operation has succeeded.

This scheme can reuse large parts of the per transaction accounting.
The changed_domain handling can be reused, but the array size of the
accounting data should be possible to be different for both use cases.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   |  5 +++
 tools/xenstore/xenstored_core.h   |  3 ++
 tools/xenstore/xenstored_domain.c | 64 +++++++++++++++++++++++++++----
 tools/xenstore/xenstored_domain.h |  5 ++-
 4 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 27dfbe9593..2d10cacf35 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1023,6 +1023,9 @@ static void send_error(struct connection *conn, int error)
 			break;
 		}
 	}
+
+	acc_drop(conn);
+
 	send_reply(conn, XS_ERROR, xsd_errors[i].errstring,
 			  strlen(xsd_errors[i].errstring) + 1);
 }
@@ -1060,6 +1063,7 @@ void send_reply(struct connection *conn, enum xsd_sockmsg_type type,
 	}
 
 	conn->in = NULL;
+	acc_commit(conn);
 
 	/* Update relevant header fields and fill in the message body. */
 	bdata->hdr.msg.type = type;
@@ -2195,6 +2199,7 @@ struct connection *new_connection(const struct interface_funcs *funcs)
 	new->is_stalled = false;
 	new->transaction_started = 0;
 	INIT_LIST_HEAD(&new->out_list);
+	INIT_LIST_HEAD(&new->acc_list);
 	INIT_LIST_HEAD(&new->ref_list);
 	INIT_LIST_HEAD(&new->watches);
 	INIT_LIST_HEAD(&new->transaction_list);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index c59b06551f..1f811f38cb 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -139,6 +139,9 @@ struct connection
 	struct list_head out_list;
 	uint64_t timeout_msec;
 
+	/* Not yet committed accounting data (valid if in != NULL). */
+	struct list_head acc_list;
+
 	/* Referenced requests no longer pending. */
 	struct list_head ref_list;
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index f459c5aabb..33105dba8f 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -100,7 +100,7 @@ struct changed_domain
 	unsigned int domid;
 
 	/* Accounting data. */
-	int acc[ACC_TR_N];
+	int acc[];
 };
 
 static struct hashtable *domhash;
@@ -577,6 +577,7 @@ static struct changed_domain *acc_find_changed_domain(struct list_head *head,
 
 static struct changed_domain *acc_get_changed_domain(const void *ctx,
 						     struct list_head *head,
+						     enum accitem acc_sz,
 						     unsigned int domid)
 {
 	struct changed_domain *cd;
@@ -585,7 +586,7 @@ static struct changed_domain *acc_get_changed_domain(const void *ctx,
 	if (cd)
 		return cd;
 
-	cd = talloc_zero(ctx, struct changed_domain);
+	cd = talloc_zero_size(ctx, sizeof(*cd) + acc_sz * sizeof(cd->acc[0]));
 	if (!cd)
 		return NULL;
 
@@ -596,13 +597,13 @@ static struct changed_domain *acc_get_changed_domain(const void *ctx,
 }
 
 static int acc_add_changed_dom(const void *ctx, struct list_head *head,
-			       enum accitem what, int val, unsigned int domid)
+			       enum accitem acc_sz, enum accitem what,
+			       int val, unsigned int domid)
 {
 	struct changed_domain *cd;
 
-	assert(what < ARRAY_SIZE(cd->acc));
-
-	cd = acc_get_changed_domain(ctx, head, domid);
+	assert(what < acc_sz);
+	cd = acc_get_changed_domain(ctx, head, acc_sz, domid);
 	if (!cd)
 		return 0;
 
@@ -1071,6 +1072,7 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 			  enum accitem what, int add, bool no_dom_alloc)
 {
 	struct domain *d;
+	struct changed_domain *cd;
 	struct list_head *head;
 	int ret;
 
@@ -1091,10 +1093,26 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 		}
 	}
 
+	/* Temporary accounting data until final commit? */
+	if (conn && conn->in && what < ACC_REQ_N) {
+		/* Consider transaction local data. */
+		ret = 0;
+		if (conn->transaction && what < ACC_TR_N) {
+			head = transaction_get_changed_domains(
+				conn->transaction);
+			cd = acc_find_changed_domain(head, domid);
+			if (cd)
+				ret = cd->acc[what];
+		}
+		ret += acc_add_changed_dom(conn->in, &conn->acc_list, ACC_REQ_N,
+					  what, add, domid);
+		return errno ? -1 : domain_acc_add_chk(d, what, ret, domid);
+	}
+
 	if (conn && conn->transaction && what < ACC_TR_N) {
 		head = transaction_get_changed_domains(conn->transaction);
-		ret = acc_add_changed_dom(conn->transaction, head, what,
-					  add, domid);
+		ret = acc_add_changed_dom(conn->transaction, head, ACC_TR_N,
+					  what, add, domid);
 		if (errno) {
 			fail_transaction(conn->transaction);
 			return -1;
@@ -1107,6 +1125,36 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 	return d->acc[what];
 }
 
+void acc_drop(struct connection *conn)
+{
+	struct changed_domain *cd;
+
+	while ((cd = list_top(&conn->acc_list, struct changed_domain, list))) {
+		list_del(&cd->list);
+		talloc_free(cd);
+	}
+}
+
+void acc_commit(struct connection *conn)
+{
+	struct changed_domain *cd;
+	struct buffered_data *in = conn->in;
+	enum accitem what;
+
+	conn->in = NULL; /* Avoid recursion. */
+	while ((cd = list_top(&conn->acc_list, struct changed_domain, list))) {
+		list_del(&cd->list);
+		for (what = 0; what < ACC_REQ_N; what++)
+			if (cd->acc[what])
+				domain_acc_add(conn, cd->domid, what,
+					       cd->acc[what], true);
+
+		talloc_free(cd);
+	}
+
+	conn->in = in;
+}
+
 int domain_nbentry_inc(struct connection *conn, unsigned int domid)
 {
 	return (domain_acc_add(conn, domid, ACC_NODES, 1, false) < 0)
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 8259c114b0..cd85bd0cad 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -20,7 +20,8 @@
 #define _XENSTORED_DOMAIN_H
 
 enum accitem {
-	ACC_NODES,
+	ACC_REQ_N,       /* Number of elements per request and domain. */
+	ACC_NODES = ACC_REQ_N,
 	ACC_TR_N,        /* Number of elements per transaction and domain. */
 	ACC_N = ACC_TR_N /* Number of elements per domain. */
 };
@@ -103,6 +104,8 @@ void domain_outstanding_domid_dec(unsigned int domid);
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid);
 int acc_fix_domains(struct list_head *head, bool update);
+void acc_drop(struct connection *conn);
+void acc_commit(struct connection *conn);
 
 /* Write rate limiting */
 
-- 
2.35.3


