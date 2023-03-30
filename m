Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31BA6CFDFE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516465.800605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnTM-0004aP-Um; Thu, 30 Mar 2023 08:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516465.800605; Thu, 30 Mar 2023 08:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnTM-0004Wy-RB; Thu, 30 Mar 2023 08:17:28 +0000
Received: by outflank-mailman (input) for mailman id 516465;
 Thu, 30 Mar 2023 08:17:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phnTL-0001oz-Gr
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:17:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e560a79-ced3-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 10:17:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 835771FE98;
 Thu, 30 Mar 2023 08:17:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56E7D138FF;
 Thu, 30 Mar 2023 08:17:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id io/JE5ZFJWQgEgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:17:26 +0000
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
X-Inumbo-ID: 4e560a79-ced3-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680164246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNXsrJE+N9aDBptj7B9Vhh0EYd5gGZ8iu/7wLWa5UHk=;
	b=C+opYmfQ5OjBcKyclLFc9/3rVx2ep1f/eXg2dh8W0vhOunEQ42aieUffHSMD5kOilNYbao
	lo8qHjSBSjwFRuHY1IZ5NkRzfu7iisYvS4dLsSH8yQ9yA+GC2/GnVbRxPnvB/Vj2sKb8tj
	TujFAjwxuZqIMDbQabq3PAuqHVc4xtM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 07/13] tools/xenstore: use accounting data array for per-domain values
Date: Thu, 30 Mar 2023 10:16:38 +0200
Message-Id: <20230330081644.11480-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330081644.11480-1-jgross@suse.com>
References: <20230330081644.11480-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the accounting of per-domain usage of Xenstore memory, watches, and
outstanding requests to the array based mechanism.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   |   8 +--
 tools/xenstore/xenstored_domain.c | 111 +++++++++++-------------------
 tools/xenstore/xenstored_domain.h |  10 +--
 3 files changed, 52 insertions(+), 77 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 88ae674523..67aa7c1578 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -255,7 +255,7 @@ static void free_buffered_data(struct buffered_data *out,
 			req->pend.ref.event_cnt--;
 			if (!req->pend.ref.event_cnt && !req->on_out_list) {
 				if (req->on_ref_list) {
-					domain_outstanding_domid_dec(
+					domain_outstanding_dec(conn,
 						req->pend.ref.domid);
 					list_del(&req->list);
 				}
@@ -271,7 +271,7 @@ static void free_buffered_data(struct buffered_data *out,
 		out->on_ref_list = true;
 		return;
 	} else
-		domain_outstanding_dec(conn);
+		domain_outstanding_dec(conn, conn->id);
 
 	talloc_free(out);
 }
@@ -1077,7 +1077,7 @@ void send_reply(struct connection *conn, enum xsd_sockmsg_type type,
 	/* Queue for later transmission. */
 	list_add_tail(&bdata->list, &conn->out_list);
 	bdata->on_out_list = true;
-	domain_outstanding_inc(conn);
+	domain_outstanding_inc(conn, conn->id);
 }
 
 /*
@@ -3320,7 +3320,7 @@ static void add_buffered_data(struct buffered_data *bdata,
 	 * request have been delivered.
 	 */
 	if (bdata->hdr.msg.type != XS_WATCH_EVENT)
-		domain_outstanding_inc(conn);
+		domain_outstanding_inc(conn, conn->id);
 	/*
 	 * We are restoring the state after Live-Update and the new quota may
 	 * be smaller. So ignore it. The limit will be applied for any resource
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index aab23a2506..9e816c5a4b 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -72,19 +72,12 @@ struct domain
 	/* Accounting data for this domain. */
 	unsigned int acc[ACC_N];
 
-	/* Amount of memory allocated for this domain. */
-	int memory;
+	/* Memory quota data for this domain. */
 	bool soft_quota_reported;
 	bool hard_quota_reported;
 	time_t mem_last_msg;
 #define MEM_WARN_MINTIME_SEC 10
 
-	/* number of watch for this domain */
-	int nbwatch;
-
-	/* Number of outstanding requests. */
-	int nboutstanding;
-
 	/* write rate limit */
 	wrl_creditt wrl_credit; /* [ -wrl_config_writecost, +_dburst ] */
 	struct wrl_timestampt wrl_timestamp;
@@ -202,14 +195,15 @@ static bool domain_can_write(struct connection *conn)
 
 static bool domain_can_read(struct connection *conn)
 {
-	struct xenstore_domain_interface *intf = conn->domain->interface;
+	struct domain *domain = conn->domain;
+	struct xenstore_domain_interface *intf = domain->interface;
 
 	if (domain_is_unprivileged(conn)) {
-		if (conn->domain->wrl_credit < 0)
+		if (domain->wrl_credit < 0)
 			return false;
-		if (conn->domain->nboutstanding >= quota_req_outstanding)
+		if (domain->acc[ACC_OUTST] >= quota_req_outstanding)
 			return false;
-		if (conn->domain->memory >= quota_memory_per_domain_hard &&
+		if (domain->acc[ACC_MEM] >= quota_memory_per_domain_hard &&
 		    quota_memory_per_domain_hard)
 			return false;
 	}
@@ -440,10 +434,10 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 	if (!resp) return ENOMEM
 
 	ent(nodes, d->acc[ACC_NODES]);
-	ent(watches, d->nbwatch);
+	ent(watches, d->acc[ACC_WATCH]);
 	ent(transactions, ta);
-	ent(outstanding, d->nboutstanding);
-	ent(memory, d->memory);
+	ent(outstanding, d->acc[ACC_OUTST]);
+	ent(memory, d->acc[ACC_MEM]);
 
 #undef ent
 
@@ -1186,14 +1180,16 @@ unsigned int domain_nbentry(struct connection *conn)
 	       ? domain_acc_add(conn, conn->id, ACC_NODES, 0, true) : 0;
 }
 
-static bool domain_chk_quota(struct domain *domain, int mem)
+static bool domain_chk_quota(struct connection *conn, unsigned int mem)
 {
 	time_t now;
+	struct domain *domain;
 
-	if (!domain || !domid_is_unprivileged(domain->domid) ||
-	    (domain->conn && domain->conn->is_ignored))
+	if (!conn || !domid_is_unprivileged(conn->id) ||
+	    conn->is_ignored)
 		return false;
 
+	domain = conn->domain;
 	now = time(NULL);
 
 	if (mem >= quota_memory_per_domain_hard &&
@@ -1238,80 +1234,57 @@ static bool domain_chk_quota(struct domain *domain, int mem)
 int domain_memory_add(struct connection *conn, unsigned int domid, int mem,
 		      bool no_quota_check)
 {
-	struct domain *domain;
+	int ret;
 
-	domain = find_domain_struct(domid);
-	if (domain) {
-		/*
-		 * domain_chk_quota() will print warning and also store whether
-		 * the soft/hard quota has been hit. So check no_quota_check
-		 * *after*.
-		 */
-		if (domain_chk_quota(domain, domain->memory + mem) &&
-		    !no_quota_check)
-			return ENOMEM;
-		domain->memory += mem;
-	} else {
-		/*
-		 * The domain the memory is to be accounted for should always
-		 * exist, as accounting is done either for a domain related to
-		 * the current connection, or for the domain owning a node
-		 * (which is always existing, as the owner of the node is
-		 * tested to exist and deleted or replaced by domid 0 if not).
-		 * So not finding the related domain MUST be an error in the
-		 * data base.
-		 */
-		errno = ENOENT;
-		corrupt(NULL, "Accounting called for non-existing domain %u\n",
-			domid);
-		return ENOENT;
-	}
+	ret = domain_acc_add(conn, domid, ACC_MEM, 0, true);
+	if (ret < 0)
+		return -ret;
+
+	/*
+	 * domain_chk_quota() will print warning and also store whether the
+	 * soft/hard quota has been hit. So check no_quota_check *after*.
+	 */
+	if (domain_chk_quota(conn, ret + mem) && !no_quota_check)
+		return ENOMEM;
+
+	/*
+	 * The domain the memory is to be accounted for should always exist,
+	 * as accounting is done either for a domain related to the current
+	 * connection, or for the domain owning a node (which is always
+	 * existing, as the owner of the node is tested to exist and deleted
+	 * or replaced by domid 0 if not).
+	 * So not finding the related domain MUST be an error in the data base.
+	 */
+	domain_acc_add(conn, domid, ACC_MEM, mem, true);
 
 	return 0;
 }
 
 void domain_watch_inc(struct connection *conn)
 {
-	if (!conn || !conn->domain)
-		return;
-	conn->domain->nbwatch++;
+	domain_acc_add(conn, conn->id, ACC_WATCH, 1, true);
 }
 
 void domain_watch_dec(struct connection *conn)
 {
-	if (!conn || !conn->domain)
-		return;
-	if (conn->domain->nbwatch)
-		conn->domain->nbwatch--;
+	domain_acc_add(conn, conn->id, ACC_WATCH, -1, true);
 }
 
 int domain_watch(struct connection *conn)
 {
 	return (domain_is_unprivileged(conn))
-		? conn->domain->nbwatch
+		? domain_acc_add(conn, conn->id, ACC_WATCH, 0, true)
 		: 0;
 }
 
-void domain_outstanding_inc(struct connection *conn)
+void domain_outstanding_inc(struct connection *conn, unsigned int domid)
 {
-	if (!conn || !conn->domain)
-		return;
-	conn->domain->nboutstanding++;
+	domain_acc_add(conn, domid, ACC_OUTST, 1, true);
 }
 
-void domain_outstanding_dec(struct connection *conn)
+void domain_outstanding_dec(struct connection *conn, unsigned int domid)
 {
-	if (!conn || !conn->domain)
-		return;
-	conn->domain->nboutstanding--;
-}
-
-void domain_outstanding_domid_dec(unsigned int domid)
-{
-	struct domain *d = find_domain_by_domid(domid);
-
-	if (d)
-		d->nboutstanding--;
+	domain_acc_add(conn, domid, ACC_OUTST, -1, true);
 }
 
 static wrl_creditt wrl_config_writecost      = WRL_FACTOR;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 5cfd730cf6..0d61bf4344 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -28,7 +28,10 @@ enum accitem {
 	ACC_NODES,
 	ACC_REQ_N,		/* Number of elements per request. */
 	ACC_TR_N = ACC_REQ_N,	/* Number of elements per transaction. */
-	ACC_N = ACC_TR_N,	/* Number of elements per domain. */
+	ACC_WATCH = ACC_TR_N,
+	ACC_OUTST,
+	ACC_MEM,
+	ACC_N,			/* Number of elements per domain. */
 };
 
 void handle_event(void);
@@ -107,9 +110,8 @@ static inline void domain_memory_add_nochk(struct connection *conn,
 void domain_watch_inc(struct connection *conn);
 void domain_watch_dec(struct connection *conn);
 int domain_watch(struct connection *conn);
-void domain_outstanding_inc(struct connection *conn);
-void domain_outstanding_dec(struct connection *conn);
-void domain_outstanding_domid_dec(unsigned int domid);
+void domain_outstanding_inc(struct connection *conn, unsigned int domid);
+void domain_outstanding_dec(struct connection *conn, unsigned int domid);
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid);
 
-- 
2.35.3


