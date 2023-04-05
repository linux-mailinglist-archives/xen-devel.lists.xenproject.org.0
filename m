Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502F56D7500
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 09:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518260.804626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxGM-0007YR-Hw; Wed, 05 Apr 2023 07:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518260.804626; Wed, 05 Apr 2023 07:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxGM-0007ST-Ci; Wed, 05 Apr 2023 07:08:58 +0000
Received: by outflank-mailman (input) for mailman id 518260;
 Wed, 05 Apr 2023 07:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjxCL-0002Et-ML
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 07:04:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26c01ddb-d380-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 09:04:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA1E22058E;
 Wed,  5 Apr 2023 07:04:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B8FD13A31;
 Wed,  5 Apr 2023 07:04:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aC3eHI8dLWTyEwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 07:04:47 +0000
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
X-Inumbo-ID: 26c01ddb-d380-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680678287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+svNodvtqEzi347VmDVhAeqbmPB+a6CEyNMcH7A/78=;
	b=tnoiNvEK7wVRD3t0XP4Hb9wj9DRqF9BbSyC6DqYylJERvPZPE+SKEm+XT2wW86hDrWy8xB
	/v4wAUytR0s5QLSPDUknaFsDXTnPllXZP5H+DTDJbjKcl4L5+PBWKVbQU4+YHfxlPv2odP
	WPjJIR4tQYibRtvRn3i3I3iBFXgM4ig=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 10/13] tools/xenstore: switch transaction accounting to generic accounting
Date: Wed,  5 Apr 2023 09:03:46 +0200
Message-Id: <20230405070349.25293-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230405070349.25293-1-jgross@suse.com>
References: <20230405070349.25293-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As transaction accounting is active for unprivileged domains only, it
can easily be added to the generic per-domain accounting.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c        |  3 +--
 tools/xenstore/xenstored_core.h        |  1 -
 tools/xenstore/xenstored_domain.c      | 21 ++++++++++++++++++---
 tools/xenstore/xenstored_domain.h      |  4 ++++
 tools/xenstore/xenstored_transaction.c | 12 +++++-------
 5 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 2d481fcad9..88c569b7d5 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2083,7 +2083,7 @@ static void consider_message(struct connection *conn)
 	 * stalled. This will ignore new requests until Live-Update happened
 	 * or it was aborted.
 	 */
-	if (lu_is_pending() && conn->transaction_started == 0 &&
+	if (lu_is_pending() && conn->ta_start_time == 0 &&
 	    conn->in->hdr.msg.type == XS_TRANSACTION_START) {
 		trace("Delaying transaction start for connection %p req_id %u\n",
 		      conn, conn->in->hdr.msg.req_id);
@@ -2190,7 +2190,6 @@ struct connection *new_connection(const struct interface_funcs *funcs)
 	new->funcs = funcs;
 	new->is_ignored = false;
 	new->is_stalled = false;
-	new->transaction_started = 0;
 	INIT_LIST_HEAD(&new->out_list);
 	INIT_LIST_HEAD(&new->acc_list);
 	INIT_LIST_HEAD(&new->ref_list);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 5a11dc1231..3564d85d7d 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -151,7 +151,6 @@ struct connection
 	/* List of in-progress transactions. */
 	struct list_head transaction_list;
 	uint32_t next_transaction_id;
-	unsigned int transaction_started;
 	time_t ta_start_time;
 
 	/* List of delayed requests. */
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 1caa60bb14..40bcc1dbfa 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -419,12 +419,10 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 {
 	struct domain *d = find_domain_struct(domid);
 	char *resp;
-	int ta;
 
 	if (!d)
 		return ENOENT;
 
-	ta = d->conn ? d->conn->transaction_started : 0;
 	resp = talloc_asprintf(ctx, "Domain %u:\n", domid);
 	if (!resp)
 		return ENOMEM;
@@ -435,7 +433,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 
 	ent(nodes, d->acc[ACC_NODES]);
 	ent(watches, d->acc[ACC_WATCH]);
-	ent(transactions, ta);
+	ent(transactions, d->acc[ACC_TRANS]);
 	ent(outstanding, d->acc[ACC_OUTST]);
 	ent(memory, d->acc[ACC_MEM]);
 
@@ -1297,6 +1295,23 @@ void domain_outstanding_dec(struct connection *conn, unsigned int domid)
 	domain_acc_add(conn, domid, ACC_OUTST, -1, true);
 }
 
+void domain_transaction_inc(struct connection *conn)
+{
+	domain_acc_add(conn, conn->id, ACC_TRANS, 1, true);
+}
+
+void domain_transaction_dec(struct connection *conn)
+{
+	domain_acc_add(conn, conn->id, ACC_TRANS, -1, true);
+}
+
+unsigned int domain_transaction_get(struct connection *conn)
+{
+	return (domain_is_unprivileged(conn))
+		? domain_acc_add(conn, conn->id, ACC_TRANS, 0, true)
+		: 0;
+}
+
 static wrl_creditt wrl_config_writecost      = WRL_FACTOR;
 static wrl_creditt wrl_config_rate           = WRL_RATE   * WRL_FACTOR;
 static wrl_creditt wrl_config_dburst         = WRL_DBURST * WRL_FACTOR;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 0d61bf4344..abc766f343 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -31,6 +31,7 @@ enum accitem {
 	ACC_WATCH = ACC_TR_N,
 	ACC_OUTST,
 	ACC_MEM,
+	ACC_TRANS,
 	ACC_N,			/* Number of elements per domain. */
 };
 
@@ -112,6 +113,9 @@ void domain_watch_dec(struct connection *conn);
 int domain_watch(struct connection *conn);
 void domain_outstanding_inc(struct connection *conn, unsigned int domid);
 void domain_outstanding_dec(struct connection *conn, unsigned int domid);
+void domain_transaction_inc(struct connection *conn);
+void domain_transaction_dec(struct connection *conn);
+unsigned int domain_transaction_get(struct connection *conn);
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid);
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 11c8bcec84..1c14b8579a 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -479,8 +479,7 @@ int do_transaction_start(const void *ctx, struct connection *conn,
 	if (conn->transaction)
 		return EBUSY;
 
-	if (domain_is_unprivileged(conn) &&
-	    conn->transaction_started > quota_max_transaction)
+	if (domain_transaction_get(conn) > quota_max_transaction)
 		return ENOSPC;
 
 	/* Attach transaction to ctx for autofree until it's complete */
@@ -505,9 +504,9 @@ int do_transaction_start(const void *ctx, struct connection *conn,
 	list_add_tail(&trans->list, &conn->transaction_list);
 	talloc_steal(conn, trans);
 	talloc_set_destructor(trans, destroy_transaction);
-	if (!conn->transaction_started)
+	if (!conn->ta_start_time)
 		conn->ta_start_time = time(NULL);
-	conn->transaction_started++;
+	domain_transaction_inc(conn);
 	wrl_ntransactions++;
 
 	snprintf(id_str, sizeof(id_str), "%u", trans->id);
@@ -533,8 +532,8 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 
 	conn->transaction = NULL;
 	list_del(&trans->list);
-	conn->transaction_started--;
-	if (!conn->transaction_started)
+	domain_transaction_dec(conn);
+	if (list_empty(&conn->transaction_list))
 		conn->ta_start_time = 0;
 
 	chk_quota = trans->node_created && domain_is_unprivileged(conn);
@@ -588,7 +587,6 @@ void conn_delete_all_transactions(struct connection *conn)
 
 	assert(conn->transaction == NULL);
 
-	conn->transaction_started = 0;
 	conn->ta_start_time = 0;
 }
 
-- 
2.35.3


