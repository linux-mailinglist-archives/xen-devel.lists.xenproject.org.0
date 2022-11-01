Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB64E614EEF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435086.688171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optv6-00037h-Qn; Tue, 01 Nov 2022 16:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435086.688171; Tue, 01 Nov 2022 16:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optv6-000309-Kf; Tue, 01 Nov 2022 16:15:20 +0000
Received: by outflank-mailman (input) for mailman id 435086;
 Tue, 01 Nov 2022 16:15:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optlX-0003qE-QV
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:05:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffceadcf-59fe-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:05:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 94E931F8CA;
 Tue,  1 Nov 2022 16:05:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AB141346F;
 Tue,  1 Nov 2022 16:05:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GmSiGMZDYWOlcgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:05:26 +0000
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
X-Inumbo-ID: ffceadcf-59fe-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667318726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBkIMfoGbobN/afNSIa7avOizbXZzmTA3t+O9pWgXaQ=;
	b=kVOwyFJo3DnA+kTKMB5lSEkk6JlHtyREiXQqjwTuXmAoM+NmioSa5IpPJWNdzigKshqSNa
	83hAf7HwzIrLjJjIdEUM9Iwp/QdIgj5LccahQ/cioWnP0VJVa4w6vBaVcPr+zjTZhSInnz
	qfiwgba3DMNIokcjJM/jNt6N2AcqQL0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 11/12] tools/xenstore: use generic accounting for remaining quotas
Date: Tue,  1 Nov 2022 17:04:21 +0100
Message-Id: <20221101160422.7212-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101160422.7212-1-jgross@suse.com>
References: <20221101160422.7212-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The maxrequests, node size, number of node permissions, and path length
quota are a little bit special, as they are either active in
transactions only (maxrequests), or they are just per item instead of
count values. Nevertheless being able to know the maximum number of
those quota related values per domain would be beneficial, so add them
to the generic accounting.

The per domain value will never show current numbers other than zero,
but the maximum number seen can be gathered the same way as the number
of nodes during a transaction.

To be able to use the const qualifier for a new function switch
domain_is_unprivileged() to take a const pointer, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c        | 14 +++++------
 tools/xenstore/xenstored_core.h        |  2 +-
 tools/xenstore/xenstored_domain.c      | 34 +++++++++++++++++++++-----
 tools/xenstore/xenstored_domain.h      |  6 +++++
 tools/xenstore/xenstored_transaction.c |  4 +--
 tools/xenstore/xenstored_watch.c       |  2 +-
 6 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index f5933a900a..af16b18692 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -799,8 +799,8 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 		+ node->perms.num * sizeof(node->perms.p[0])
 		+ node->datalen + node->childlen;
 
-	if (!no_quota_check && domain_is_unprivileged(conn) &&
-	    data.dsize >= quota_max_entry_size) {
+	if (domain_max_chk(conn, ACC_NODESZ, data.dsize, quota_max_entry_size)
+	    && !no_quota_check) {
 		errno = ENOSPC;
 		return errno;
 	}
@@ -956,7 +956,7 @@ static struct node *get_node(struct connection *conn,
 {
 	struct node *node;
 
-	if (!name || !is_valid_nodename(name)) {
+	if (!name || !is_valid_nodename(conn, name)) {
 		errno = EINVAL;
 		return NULL;
 	}
@@ -1172,7 +1172,7 @@ static bool valid_chars(const char *node)
 		       "0123456789-/_@") == strlen(node));
 }
 
-bool is_valid_nodename(const char *node)
+bool is_valid_nodename(const struct connection *conn, const char *node)
 {
 	int local_off = 0;
 	unsigned int domid;
@@ -1192,7 +1192,8 @@ bool is_valid_nodename(const char *node)
 	if (sscanf(node, "/local/domain/%5u/%n", &domid, &local_off) != 1)
 		local_off = 0;
 
-	if (strlen(node) > local_off + quota_max_path_len)
+	if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off,
+			   quota_max_path_len))
 		return false;
 
 	return valid_chars(node);
@@ -1766,8 +1767,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 		return EINVAL;
 
 	perms.num--;
-	if (domain_is_unprivileged(conn) &&
-	    perms.num > quota_nb_perms_per_node)
+	if (domain_max_chk(conn, ACC_NPERM, perms.num, quota_nb_perms_per_node))
 		return ENOSPC;
 
 	permstr = in->buffer + strlen(in->buffer) + 1;
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index f51b8d1839..752c69d80f 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -252,7 +252,7 @@ void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
 
 /* Is this a valid node name? */
-bool is_valid_nodename(const char *node);
+bool is_valid_nodename(const struct connection *conn, const char *node);
 
 /* Get name of parent node. */
 char *get_parent(const void *ctx, const char *node);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 6464362299..2b4a551df5 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -435,7 +435,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 		return ENOMEM;
 
 #define ent(t, e) \
-	resp = talloc_asprintf_append(resp, "%-16s: %8u (max: %8u\n", #t, \
+	resp = talloc_asprintf_append(resp, "%-17s: %8u (max: %8u\n", #t, \
 				      d->acc[e].val, d->acc[e].max); \
 	if (!resp) return ENOMEM
 
@@ -444,6 +444,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 	ent(transactions, ACC_TRANS);
 	ent(outstanding, ACC_OUTST);
 	ent(memory, ACC_MEM);
+	ent(transaction-nodes, ACC_TRANSNODES);
 
 #undef ent
 
@@ -461,7 +462,7 @@ int domain_max_global_acc(const void *ctx, struct connection *conn)
 		return ENOMEM;
 
 #define ent(t, e) \
-	resp = talloc_asprintf_append(resp, "%-16s: %8u\n", #t,   \
+	resp = talloc_asprintf_append(resp, "%-17s: %8u\n", #t,   \
 				      acc_global_max[e]);         \
 	if (!resp) return ENOMEM
 
@@ -470,6 +471,7 @@ int domain_max_global_acc(const void *ctx, struct connection *conn)
 	ent(transactions, ACC_TRANS);
 	ent(outstanding, ACC_OUTST);
 	ent(memory, ACC_MEM);
+	ent(transaction-nodes, ACC_TRANSNODES);
 
 #undef ent
 
@@ -1084,6 +1086,15 @@ int domain_adjust_node_perms(struct node *node)
 	return 0;
 }
 
+static void domain_acc_chk_max(struct domain *d, unsigned int what,
+			       unsigned int val, unsigned int domid)
+{
+	if (val > d->acc[what].max)
+		d->acc[what].max = val;
+	if (val > acc_global_max[what] && domid_is_unprivileged(domid))
+		acc_global_max[what] = val;
+}
+
 static int domain_acc_add_chk(struct domain *d, unsigned int what, int add,
 			      unsigned int domid)
 {
@@ -1097,10 +1108,7 @@ static int domain_acc_add_chk(struct domain *d, unsigned int what, int add,
 	}
 
 	val = d->acc[what].val + add;
-	if (val > d->acc[what].max)
-		d->acc[what].max = val;
-	if (val > acc_global_max[what] && domid_is_unprivileged(domid))
-		acc_global_max[what] = val;
+	domain_acc_chk_max(d, what, val, domid);
 
 	return val;
 }
@@ -1216,6 +1224,20 @@ void domain_reset_global_acc(void)
 	hashtable_iterate(domhash, domain_reset_global_acc_sub, NULL);
 }
 
+bool domain_max_chk(const struct connection *conn, unsigned int what,
+		    unsigned int val, unsigned int quota)
+{
+	if (!conn || !conn->domain)
+		return false;
+
+	if (domain_is_unprivileged(conn) && val > quota)
+		return true;
+
+	domain_acc_chk_max(conn->domain, what, val, conn->id);
+
+	return false;
+}
+
 int domain_nbentry_inc(struct connection *conn, unsigned int domid)
 {
 	return (domain_acc_add(conn, domid, ACC_NODES, 1, false) < 0)
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index b5f0b9a591..2bf9b0d87b 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -27,6 +27,10 @@ enum {
 	ACC_OUTST,
 	ACC_MEM,
 	ACC_TRANS,
+	ACC_TRANSNODES,
+	ACC_NPERM,
+	ACC_PATHLEN,
+	ACC_NODESZ,
 	ACC_N            /* Number of elements per domain. */
 };
 
@@ -118,6 +122,8 @@ void acc_drop(struct connection *conn);
 void acc_commit(struct connection *conn);
 int domain_max_global_acc(const void *ctx, struct connection *conn);
 void domain_reset_global_acc(void);
+bool domain_max_chk(const struct connection *conn, unsigned int what,
+		    unsigned int val, unsigned int quota);
 
 /* Write rate limiting */
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index ce6a12b576..7967770ca2 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -244,8 +244,8 @@ int access_node(struct connection *conn, struct node *node,
 
 	i = find_accessed_node(trans, node->name);
 	if (!i) {
-		if (trans->nodes >= quota_trans_nodes &&
-		    domain_is_unprivileged(conn)) {
+		if (domain_max_chk(conn, ACC_TRANSNODES, trans->nodes + 1,
+				   quota_trans_nodes)) {
 			ret = ENOSPC;
 			goto err;
 		}
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index ed742de936..4deef21c4c 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -176,7 +176,7 @@ static int check_watch_path(struct connection *conn, const void *ctx,
 		*path = canonicalize(conn, ctx, *path);
 		if (!*path)
 			return errno;
-		if (!is_valid_nodename(*path))
+		if (!is_valid_nodename(conn, *path))
 			goto inval;
 	}
 
-- 
2.35.3


