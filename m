Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C24C6FAF6F
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 13:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531445.827144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzUv-0003AO-Tc; Mon, 08 May 2023 11:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531445.827144; Mon, 08 May 2023 11:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzUv-00033Q-K9; Mon, 08 May 2023 11:57:45 +0000
Received: by outflank-mailman (input) for mailman id 531445;
 Mon, 08 May 2023 11:57:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pvzMi-0004FA-TZ
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 11:49:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b98b6ad-ed96-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 13:49:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74E341FE43;
 Mon,  8 May 2023 11:49:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 461631346B;
 Mon,  8 May 2023 11:49:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HLQAD7vhWGSvNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 11:49:15 +0000
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
X-Inumbo-ID: 5b98b6ad-ed96-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683546555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dcmeTEE9hVukRZJ0Dtyrk1eYeEJPS+eKlkdJh/h3FLo=;
	b=foQkqBNjW2yrIkKI/yb0yX2ZvZMZAlx7enzUVKzYjJUOtgnVknvq3iR4Cygv5DabFBLefC
	HTmKPZI7+zD+J8O/25xMjwx/1Yl8H/WPK3yyaf8/zkYhOQ4u0wlQe6gDDW8IUJUZosN1X4
	dAqYVbDZvlZg/eWYNa92WNjn4wkXJqA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 14/14] tools/xenstore: switch quota management to be table based
Date: Mon,  8 May 2023 13:47:54 +0200
Message-Id: <20230508114754.31514-15-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230508114754.31514-1-jgross@suse.com>
References: <20230508114754.31514-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having individual quota variables switch to a table based
approach like the generic accounting. Include all the related data in
the same table and add accessor functions.

This enables to use the command line --quota parameter for setting all
possible quota values, keeping the previous parameters for
compatibility.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
One further remark: it would be rather easy to add soft-quota for all
the other quotas (similar to the memory one). This could be used as
an early warning for the need to raise global quota.
V5:
- fix what_matches() (Julien Grall)
---
 tools/xenstore/xenstored_control.c     |  43 ++------
 tools/xenstore/xenstored_core.c        |  80 +++++++-------
 tools/xenstore/xenstored_core.h        |  10 --
 tools/xenstore/xenstored_domain.c      | 138 ++++++++++++++++---------
 tools/xenstore/xenstored_domain.h      |  12 ++-
 tools/xenstore/xenstored_transaction.c |   5 +-
 tools/xenstore/xenstored_watch.c       |   2 +-
 7 files changed, 152 insertions(+), 138 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 620a7da997..ed80924ee4 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -221,35 +221,6 @@ static int do_control_log(const void *ctx, struct connection *conn,
 	return 0;
 }
 
-struct quota {
-	const char *name;
-	int *quota;
-	const char *descr;
-};
-
-static const struct quota hard_quotas[] = {
-	{ "nodes", &quota_nb_entry_per_domain, "Nodes per domain" },
-	{ "watches", &quota_nb_watch_per_domain, "Watches per domain" },
-	{ "transactions", &quota_max_transaction, "Transactions per domain" },
-	{ "outstanding", &quota_req_outstanding,
-		"Outstanding requests per domain" },
-	{ "transaction-nodes", &quota_trans_nodes,
-		"Max. number of accessed nodes per transaction" },
-	{ "memory", &quota_memory_per_domain_hard,
-		"Total Xenstore memory per domain (error level)" },
-	{ "node-size", &quota_max_entry_size, "Max. size of a node" },
-	{ "path-max", &quota_max_path_len, "Max. length of a node path" },
-	{ "permissions", &quota_nb_perms_per_node,
-		"Max. number of permissions per node" },
-	{ NULL, NULL, NULL }
-};
-
-static const struct quota soft_quotas[] = {
-	{ "memory", &quota_memory_per_domain_soft,
-		"Total Xenstore memory per domain (warning level)" },
-	{ NULL, NULL, NULL }
-};
-
 static int quota_show_current(const void *ctx, struct connection *conn,
 			      const struct quota *quotas)
 {
@@ -260,9 +231,11 @@ static int quota_show_current(const void *ctx, struct connection *conn,
 	if (!resp)
 		return ENOMEM;
 
-	for (i = 0; quotas[i].quota; i++) {
+	for (i = 0; i < ACC_N; i++) {
+		if (!quotas[i].name)
+			continue;
 		resp = talloc_asprintf_append(resp, "%-17s: %8d %s\n",
-					      quotas[i].name, *quotas[i].quota,
+					      quotas[i].name, quotas[i].val,
 					      quotas[i].descr);
 		if (!resp)
 			return ENOMEM;
@@ -274,7 +247,7 @@ static int quota_show_current(const void *ctx, struct connection *conn,
 }
 
 static int quota_set(const void *ctx, struct connection *conn,
-		     char **vec, int num, const struct quota *quotas)
+		     char **vec, int num, struct quota *quotas)
 {
 	unsigned int i;
 	int val;
@@ -286,9 +259,9 @@ static int quota_set(const void *ctx, struct connection *conn,
 	if (val < 1)
 		return EINVAL;
 
-	for (i = 0; quotas[i].quota; i++) {
-		if (!strcmp(vec[0], quotas[i].name)) {
-			*quotas[i].quota = val;
+	for (i = 0; i < ACC_N; i++) {
+		if (quotas[i].name && !strcmp(vec[0], quotas[i].name)) {
+			quotas[i].val = val;
 			send_ack(conn, XS_CONTROL);
 			return 0;
 		}
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 86ec7ab446..4ebb75e5e9 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -89,17 +89,6 @@ unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type);
 
-int quota_nb_entry_per_domain = 1000;
-int quota_nb_watch_per_domain = 128;
-int quota_max_entry_size = 2048; /* 2K */
-int quota_max_transaction = 10;
-int quota_nb_perms_per_node = 5;
-int quota_trans_nodes = 1024;
-int quota_max_path_len = XENSTORE_REL_PATH_MAX;
-int quota_req_outstanding = 20;
-int quota_memory_per_domain_soft = 2 * 1024 * 1024; /* 2 MB */
-int quota_memory_per_domain_hard = 2 * 1024 * 1024 + 512 * 1024; /* 2.5 MB */
-
 unsigned int timeout_watch_event_msec = 20000;
 
 void trace(const char *fmt, ...)
@@ -800,8 +789,7 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 		+ node->datalen + node->childlen;
 
 	/* Call domain_max_chk() in any case in order to record max values. */
-	if (domain_max_chk(conn, ACC_NODESZ, data.dsize, quota_max_entry_size)
-	    && !no_quota_check) {
+	if (domain_max_chk(conn, ACC_NODESZ, data.dsize) && !no_quota_check) {
 		errno = ENOSPC;
 		return errno;
 	}
@@ -1191,8 +1179,7 @@ bool is_valid_nodename(const struct connection *conn, const char *node)
 	if (sscanf(node, "/local/domain/%5u/%n", &domid, &local_off) != 1)
 		local_off = 0;
 
-	if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off,
-			   quota_max_path_len))
+	if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off))
 		return false;
 
 	return valid_chars(node);
@@ -1504,7 +1491,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 	for (i = node; i; i = i->parent) {
 		/* i->parent is set for each new node, so check quota. */
 		if (i->parent &&
-		    domain_nbentry(conn) >= quota_nb_entry_per_domain) {
+		    domain_nbentry(conn) >= hard_quotas[ACC_NODES].val) {
 			ret = ENOSPC;
 			goto err;
 		}
@@ -1780,7 +1767,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 		return EINVAL;
 
 	perms.num--;
-	if (domain_max_chk(conn, ACC_NPERM, perms.num, quota_nb_perms_per_node))
+	if (domain_max_chk(conn, ACC_NPERM, perms.num))
 		return ENOSPC;
 
 	permstr = in->buffer + strlen(in->buffer) + 1;
@@ -2649,7 +2636,16 @@ static void usage(void)
 "                          memory: total used memory per domain for nodes,\n"
 "                                  transactions, watches and requests, above\n"
 "                                  which Xenstore will stop talking to domain\n"
+"                          nodes: number nodes owned by a domain\n"
+"                          node-permissions: number of access permissions per\n"
+"                                            node\n"
+"                          node-size: total size of a node (permissions +\n"
+"                                     children names + content)\n"
 "                          outstanding: number of outstanding requests\n"
+"                          path-length: length of a node path\n"
+"                          transactions: number of concurrent transactions\n"
+"                                        per domain\n"
+"                          watches: number of watches per domain"
 "  -q, --quota-soft <what>=<nb> set a soft quota <what> to the value <nb>,\n"
 "                          causing a warning to be issued via syslog() if the\n"
 "                          limit is violated, allowed quotas are:\n"
@@ -2714,15 +2710,19 @@ static unsigned int get_optval_uint(const char *arg)
 
 static bool what_matches(const char *arg, const char *what)
 {
-	unsigned int what_len = strlen(what);
+	unsigned int what_len;
+
+	if (!what)
+		return false;
 
+	what_len = strlen(what);
 	return !strncmp(arg, what, what_len) && arg[what_len] == '=';
 }
 
 static void set_timeout(const char *arg)
 {
 	const char *eq = strchr(arg, '=');
-	int val;
+	unsigned int val;
 
 	if (!eq)
 		barf("quotas must be specified via <what>=<seconds>\n");
@@ -2736,22 +2736,22 @@ static void set_timeout(const char *arg)
 static void set_quota(const char *arg, bool soft)
 {
 	const char *eq = strchr(arg, '=');
-	int val;
+	struct quota *q = soft ? soft_quotas : hard_quotas;
+	unsigned int val;
+	unsigned int i;
 
 	if (!eq)
 		barf("quotas must be specified via <what>=<nb>\n");
 	val = get_optval_uint(eq + 1);
-	if (what_matches(arg, "outstanding") && !soft)
-		quota_req_outstanding = val;
-	else if (what_matches(arg, "transaction-nodes") && !soft)
-		quota_trans_nodes = val;
-	else if (what_matches(arg, "memory")) {
-		if (soft)
-			quota_memory_per_domain_soft = val;
-		else
-			quota_memory_per_domain_hard = val;
-	} else
-		barf("unknown quota \"%s\"\n", arg);
+
+	for (i = 0; i < ACC_N; i++) {
+		if (what_matches(arg, q[i].name)) {
+			q[i].val = val;
+			return;
+		}
+	}
+
+	barf("unknown quota \"%s\"\n", arg);
 }
 
 /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
@@ -2813,7 +2813,7 @@ int main(int argc, char *argv[])
 			no_domain_init = true;
 			break;
 		case 'E':
-			quota_nb_entry_per_domain = strtol(optarg, NULL, 10);
+			hard_quotas[ACC_NODES].val = strtoul(optarg, NULL, 10);
 			break;
 		case 'F':
 			pidfile = optarg;
@@ -2831,10 +2831,10 @@ int main(int argc, char *argv[])
 			recovery = false;
 			break;
 		case 'S':
-			quota_max_entry_size = strtol(optarg, NULL, 10);
+			hard_quotas[ACC_NODESZ].val = strtoul(optarg, NULL, 10);
 			break;
 		case 't':
-			quota_max_transaction = strtol(optarg, NULL, 10);
+			hard_quotas[ACC_TRANS].val = strtoul(optarg, NULL, 10);
 			break;
 		case 'T':
 			tracefile = optarg;
@@ -2854,15 +2854,17 @@ int main(int argc, char *argv[])
 			verbose = true;
 			break;
 		case 'W':
-			quota_nb_watch_per_domain = strtol(optarg, NULL, 10);
+			hard_quotas[ACC_WATCH].val = strtoul(optarg, NULL, 10);
 			break;
 		case 'A':
-			quota_nb_perms_per_node = strtol(optarg, NULL, 10);
+			hard_quotas[ACC_NPERM].val = strtoul(optarg, NULL, 10);
 			break;
 		case 'M':
-			quota_max_path_len = strtol(optarg, NULL, 10);
-			quota_max_path_len = min(XENSTORE_REL_PATH_MAX,
-						 quota_max_path_len);
+			hard_quotas[ACC_PATHLEN].val =
+				strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_PATHLEN].val =
+				 min((unsigned int)XENSTORE_REL_PATH_MAX,
+				     hard_quotas[ACC_PATHLEN].val);
 			break;
 		case 'Q':
 			set_quota(optarg, false);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 9339820156..92d5b50f3c 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -316,16 +316,6 @@ extern TDB_CONTEXT *tdb_ctx;
 extern int dom0_domid;
 extern int dom0_event;
 extern int priv_domid;
-extern int quota_nb_watch_per_domain;
-extern int quota_max_transaction;
-extern int quota_max_entry_size;
-extern int quota_nb_perms_per_node;
-extern int quota_max_path_len;
-extern int quota_nb_entry_per_domain;
-extern int quota_req_outstanding;
-extern int quota_trans_nodes;
-extern int quota_memory_per_domain_soft;
-extern int quota_memory_per_domain_hard;
 extern bool keep_orphans;
 
 extern unsigned int timeout_watch_event_msec;
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index b3a719569e..04f911b111 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -43,7 +43,61 @@ static evtchn_port_t virq_port;
 
 xenevtchn_handle *xce_handle = NULL;
 
-static unsigned int acc_global_max[ACC_N];
+struct quota hard_quotas[ACC_N] = {
+	[ACC_NODES] = {
+		.name = "nodes",
+		.descr = "Nodes per domain",
+		.val = 1000,
+	},
+	[ACC_WATCH] = {
+		.name = "watches",
+		.descr = "Watches per domain",
+		.val = 128,
+	},
+	[ACC_OUTST] = {
+		.name = "outstanding",
+		.descr = "Outstanding requests per domain",
+		.val = 20,
+	},
+	[ACC_MEM] = {
+		.name = "memory",
+		.descr = "Total Xenstore memory per domain (error level)",
+		.val = 2 * 1024 * 1024 + 512 * 1024,	/* 2.5 MB */
+	},
+	[ACC_TRANS] = {
+		.name = "transactions",
+		.descr = "Active transactions per domain",
+		.val = 10,
+	},
+	[ACC_TRANSNODES] = {
+		.name = "transaction-nodes",
+		.descr = "Max. number of accessed nodes per transaction",
+		.val = 1024,
+	},
+	[ACC_NPERM] = {
+		.name = "node-permissions",
+		.descr = "Max. number of permissions per node",
+		.val = 5,
+	},
+	[ACC_PATHLEN] = {
+		.name = "path-max",
+		.descr = "Max. length of a node path",
+		.val = XENSTORE_REL_PATH_MAX,
+	},
+	[ACC_NODESZ] = {
+		.name = "node-size",
+		.descr = "Max. size of a node",
+		.val = 2048,
+	},
+};
+
+struct quota soft_quotas[ACC_N] = {
+	[ACC_MEM] = {
+		.name = "memory",
+		.descr = "Total Xenstore memory per domain (warning level)",
+		.val = 2 * 1024 * 1024,			/* 2.0 MB */
+	},
+};
 
 struct domain
 {
@@ -204,10 +258,10 @@ static bool domain_can_read(struct connection *conn)
 	if (domain_is_unprivileged(conn)) {
 		if (domain->wrl_credit < 0)
 			return false;
-		if (domain->acc[ACC_OUTST].val >= quota_req_outstanding)
+		if (domain->acc[ACC_OUTST].val >= hard_quotas[ACC_OUTST].val)
 			return false;
-		if (domain->acc[ACC_MEM].val >= quota_memory_per_domain_hard &&
-		    quota_memory_per_domain_hard)
+		if (domain->acc[ACC_MEM].val >= hard_quotas[ACC_MEM].val &&
+		    hard_quotas[ACC_MEM].val)
 			return false;
 	}
 
@@ -422,6 +476,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 {
 	struct domain *d = find_domain_struct(domid);
 	char *resp;
+	unsigned int i;
 
 	if (!d)
 		return ENOENT;
@@ -430,22 +485,15 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 	if (!resp)
 		return ENOMEM;
 
-#define ent(t, e) \
-	resp = talloc_asprintf_append(resp, "%-17s: %8u (max: %8u\n", #t, \
-				      d->acc[e].val, d->acc[e].max); \
-	if (!resp) return ENOMEM
-
-	ent(nodes, ACC_NODES);
-	ent(watches, ACC_WATCH);
-	ent(transactions, ACC_TRANS);
-	ent(outstanding, ACC_OUTST);
-	ent(memory, ACC_MEM);
-	ent(transaction-nodes, ACC_TRANSNODES);
-	ent(node-permissions, ACC_NPERM);
-	ent(path-length, ACC_PATHLEN);
-	ent(node-size, ACC_NODESZ);
-
-#undef ent
+	for (i = 0; i < ACC_N; i++) {
+		if (!hard_quotas[i].name)
+			continue;
+		resp = talloc_asprintf_append(resp, "%-17s: %8u (max %8u)\n",
+					      hard_quotas[i].name,
+					      d->acc[i].val, d->acc[i].max);
+		if (!resp)
+			return ENOMEM;
+	}
 
 	send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
 
@@ -455,27 +503,21 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 int domain_max_global_acc(const void *ctx, struct connection *conn)
 {
 	char *resp;
+	unsigned int i;
 
 	resp = talloc_asprintf(ctx, "Max. seen accounting values:\n");
 	if (!resp)
 		return ENOMEM;
 
-#define ent(t, e) \
-	resp = talloc_asprintf_append(resp, "%-17s: %8u\n", #t,   \
-				      acc_global_max[e]);         \
-	if (!resp) return ENOMEM
-
-	ent(nodes, ACC_NODES);
-	ent(watches, ACC_WATCH);
-	ent(transactions, ACC_TRANS);
-	ent(outstanding, ACC_OUTST);
-	ent(memory, ACC_MEM);
-	ent(transaction-nodes, ACC_TRANSNODES);
-	ent(node-permissions, ACC_NPERM);
-	ent(path-length, ACC_PATHLEN);
-	ent(node-size, ACC_NODESZ);
-
-#undef ent
+	for (i = 0; i < ACC_N; i++) {
+		if (!hard_quotas[i].name)
+			continue;
+		resp = talloc_asprintf_append(resp, "%-17s: %8u\n",
+					      hard_quotas[i].name,
+					      hard_quotas[i].max);
+		if (!resp)
+			return ENOMEM;
+	}
 
 	send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
 
@@ -590,7 +632,7 @@ int acc_fix_domains(struct list_head *head, bool chk_quota, bool update)
 	list_for_each_entry(cd, head, list) {
 		cnt = domain_nbentry_fix(cd->domid, cd->acc[ACC_NODES], update);
 		if (!update) {
-			if (chk_quota && cnt >= quota_nb_entry_per_domain)
+			if (chk_quota && cnt >= hard_quotas[ACC_NODES].val)
 				return ENOSPC;
 			if (cnt < 0)
 				return ENOMEM;
@@ -1091,12 +1133,12 @@ static void domain_acc_valid_max(struct domain *d, enum accitem what,
 				 unsigned int val)
 {
 	assert(what < ARRAY_SIZE(d->acc));
-	assert(what < ARRAY_SIZE(acc_global_max));
+	assert(what < ARRAY_SIZE(hard_quotas));
 
 	if (val > d->acc[what].max)
 		d->acc[what].max = val;
-	if (val > acc_global_max[what] && domid_is_unprivileged(d->domid))
-		acc_global_max[what] = val;
+	if (val > hard_quotas[what].max && domid_is_unprivileged(d->domid))
+		hard_quotas[what].max = val;
 }
 
 static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
@@ -1231,19 +1273,19 @@ void domain_reset_global_acc(void)
 	unsigned int i;
 
 	for (i = 0; i < ACC_N; i++)
-		acc_global_max[i] = 0;
+		hard_quotas[i].max = 0;
 
 	/* Set current max values seen. */
 	hashtable_iterate(domhash, domain_reset_global_acc_sub, NULL);
 }
 
 bool domain_max_chk(const struct connection *conn, enum accitem what,
-		    unsigned int val, unsigned int quota)
+		    unsigned int val)
 {
 	if (!conn || !conn->domain)
 		return false;
 
-	if (domain_is_unprivileged(conn) && val > quota)
+	if (domain_is_unprivileged(conn) && val > hard_quotas[what].val)
 		return true;
 
 	domain_acc_valid_max(conn->domain, what, val);
@@ -1292,8 +1334,7 @@ static bool domain_chk_quota(struct connection *conn, unsigned int mem)
 	domain = conn->domain;
 	now = time(NULL);
 
-	if (mem >= quota_memory_per_domain_hard &&
-	    quota_memory_per_domain_hard) {
+	if (mem >= hard_quotas[ACC_MEM].val && hard_quotas[ACC_MEM].val) {
 		if (domain->hard_quota_reported)
 			return true;
 		syslog(LOG_ERR, "Domain %u exceeds hard memory quota, Xenstore interface to domain stalled\n",
@@ -1310,15 +1351,14 @@ static bool domain_chk_quota(struct connection *conn, unsigned int mem)
 			syslog(LOG_INFO, "Domain %u below hard memory quota again\n",
 			       domain->domid);
 		}
-		if (mem >= quota_memory_per_domain_soft &&
-		    quota_memory_per_domain_soft &&
-		    !domain->soft_quota_reported) {
+		if (mem >= soft_quotas[ACC_MEM].val &&
+		    soft_quotas[ACC_MEM].val && !domain->soft_quota_reported) {
 			domain->mem_last_msg = now;
 			domain->soft_quota_reported = true;
 			syslog(LOG_WARNING, "Domain %u exceeds soft memory quota\n",
 			       domain->domid);
 		}
-		if (mem < quota_memory_per_domain_soft &&
+		if (mem < soft_quotas[ACC_MEM].val &&
 		    domain->soft_quota_reported) {
 			domain->mem_last_msg = now;
 			domain->soft_quota_reported = false;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 78ca434531..5123453f6c 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -40,6 +40,16 @@ enum accitem {
 	ACC_N,			/* Number of elements per domain. */
 };
 
+struct quota {
+	const char *name;
+	const char *descr;
+	unsigned int val;
+	unsigned int max;
+};
+
+extern struct quota hard_quotas[ACC_N];
+extern struct quota soft_quotas[ACC_N];
+
 void handle_event(void);
 
 void check_domains(void);
@@ -134,7 +144,7 @@ void acc_commit(struct connection *conn);
 int domain_max_global_acc(const void *ctx, struct connection *conn);
 void domain_reset_global_acc(void);
 bool domain_max_chk(const struct connection *conn, unsigned int what,
-		    unsigned int val, unsigned int quota);
+		    unsigned int val);
 
 /* Write rate limiting */
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index cecaf27018..f2650f5d05 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -252,8 +252,7 @@ int access_node(struct connection *conn, struct node *node,
 
 	i = find_accessed_node(trans, node->name);
 	if (!i) {
-		if (domain_max_chk(conn, ACC_TRANSNODES, trans->nodes + 1,
-				   quota_trans_nodes)) {
+		if (domain_max_chk(conn, ACC_TRANSNODES, trans->nodes + 1)) {
 			ret = ENOSPC;
 			goto err;
 		}
@@ -479,7 +478,7 @@ int do_transaction_start(const void *ctx, struct connection *conn,
 	if (conn->transaction)
 		return EBUSY;
 
-	if (domain_transaction_get(conn) > quota_max_transaction)
+	if (domain_transaction_get(conn) > hard_quotas[ACC_TRANS].val)
 		return ENOSPC;
 
 	/* Attach transaction to ctx for autofree until it's complete */
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 61b1e3421e..e8eb35de02 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -239,7 +239,7 @@ int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
 			return EEXIST;
 	}
 
-	if (domain_watch(conn) > quota_nb_watch_per_domain)
+	if (domain_watch(conn) > hard_quotas[ACC_WATCH].val)
 		return E2BIG;
 
 	watch = add_watch(conn, vec[0], vec[1], relative, false);
-- 
2.35.3


