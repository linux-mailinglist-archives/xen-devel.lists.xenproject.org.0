Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AA8614EC0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435039.688045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optkq-0004EV-OZ; Tue, 01 Nov 2022 16:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435039.688045; Tue, 01 Nov 2022 16:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optkq-0004Cb-LF; Tue, 01 Nov 2022 16:04:44 +0000
Received: by outflank-mailman (input) for mailman id 435039;
 Tue, 01 Nov 2022 16:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optkp-0003Iv-1P
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:04:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e530adac-59fe-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 17:04:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E95211F8CA;
 Tue,  1 Nov 2022 16:04:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEE201346F;
 Tue,  1 Nov 2022 16:04:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZO9nLZlDYWNBcgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:04:41 +0000
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
X-Inumbo-ID: e530adac-59fe-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667318681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+yCodySqCz3qBnau8fT3yGc+modYKUB87SWoIcrsUE=;
	b=qLOvDUMdu/eNdUOlaVuZeksxGBpQy7T0s2ZoHdhSU+mP1cuepJC/vojdBUpunc/xzli7Qn
	kvrCi27DyXKX2ZwH3YWn41Mk4sOjGEQY9wlhdLXXs9yAKZ3IIRKsRO7n741jPdYi053M98
	O26ySAu668YmT+PUDi0bk/1KpFO87v4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 03/12] tools/xenstore: add framework to commit accounting data on success only
Date: Tue,  1 Nov 2022 17:04:13 +0100
Message-Id: <20221101160422.7212-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101160422.7212-1-jgross@suse.com>
References: <20221101160422.7212-1-jgross@suse.com>
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
 tools/xenstore/xenstored_domain.c | 61 ++++++++++++++++++++++++++++---
 tools/xenstore/xenstored_domain.h |  5 ++-
 4 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index ea0e6292d3..d437149622 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1027,6 +1027,9 @@ static void send_error(struct connection *conn, int error)
 			break;
 		}
 	}
+
+	acc_drop(conn);
+
 	send_reply(conn, XS_ERROR, xsd_errors[i].errstring,
 			  strlen(xsd_errors[i].errstring) + 1);
 }
@@ -1064,6 +1067,7 @@ void send_reply(struct connection *conn, enum xsd_sockmsg_type type,
 	}
 
 	conn->in = NULL;
+	acc_commit(conn);
 
 	/* Update relevant header fields and fill in the message body. */
 	bdata->hdr.msg.type = type;
@@ -2186,6 +2190,7 @@ struct connection *new_connection(const struct interface_funcs *funcs)
 	new->is_stalled = false;
 	new->transaction_started = 0;
 	INIT_LIST_HEAD(&new->out_list);
+	INIT_LIST_HEAD(&new->acc_list);
 	INIT_LIST_HEAD(&new->ref_list);
 	INIT_LIST_HEAD(&new->watches);
 	INIT_LIST_HEAD(&new->transaction_list);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index c85b15515c..8223a49354 100644
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
index 9591a19189..7988125f71 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -100,7 +100,7 @@ struct changed_domain
 	unsigned int domid;
 
 	/* Accounting data. */
-	int acc[ACC_TR_N];
+	int acc[];
 };
 
 static struct hashtable *domhash;
@@ -585,6 +585,7 @@ static struct changed_domain *acc_find_changed_domain(struct list_head *head,
 
 static struct changed_domain *acc_get_changed_domain(const void *ctx,
 						     struct list_head *head,
+						     unsigned int acc_sz,
 						     unsigned int domid)
 {
 	struct changed_domain *cd;
@@ -593,7 +594,7 @@ static struct changed_domain *acc_get_changed_domain(const void *ctx,
 	if (cd)
 		return cd;
 
-	cd = talloc_zero(ctx, struct changed_domain);
+	cd = talloc_zero_size(ctx, sizeof(*cd) + acc_sz * sizeof(cd->acc[0]));
 	if (!cd)
 		return NULL;
 
@@ -604,11 +605,12 @@ static struct changed_domain *acc_get_changed_domain(const void *ctx,
 }
 
 static int acc_add_changed_dom(const void *ctx, struct list_head *head,
-			       unsigned int what, int val, unsigned int domid)
+			       unsigned int acc_sz, unsigned int what,
+			       int val, unsigned int domid)
 {
 	struct changed_domain *cd;
 
-	cd = acc_get_changed_domain(ctx, head, domid);
+	cd = acc_get_changed_domain(ctx, head, acc_sz, domid);
 	if (!cd)
 		return 0;
 
@@ -1067,6 +1069,7 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 			  unsigned int what, int add, bool dom_exists)
 {
 	struct domain *d;
+	struct changed_domain *cd;
 	struct list_head *head;
 	int ret;
 
@@ -1087,10 +1090,26 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
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
@@ -1103,6 +1122,36 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
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
+	unsigned int what;
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
index d2563d33e7..9959b2f2e4 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -20,7 +20,8 @@
 #define _XENSTORED_DOMAIN_H
 
 enum {
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


