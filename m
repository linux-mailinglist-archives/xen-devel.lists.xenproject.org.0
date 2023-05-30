Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF9715869
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540797.842842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3ufa-0000KH-6G; Tue, 30 May 2023 08:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540797.842842; Tue, 30 May 2023 08:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3ufa-0000GV-36; Tue, 30 May 2023 08:25:30 +0000
Received: by outflank-mailman (input) for mailman id 540797;
 Tue, 30 May 2023 08:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3ufZ-0004aU-Cy
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:25:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88c648e3-fec3-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:25:28 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6EA42219FE;
 Tue, 30 May 2023 08:25:28 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 25B181342F;
 Tue, 30 May 2023 08:25:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id NDPPB/iydWR7EAAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:25:28 +0000
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
X-Inumbo-ID: 88c648e3-fec3-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685435128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ia066ss6DTXiD5PD3QIOik+sQxxMkgbmr/cEVOihzyk=;
	b=evEyQlHIjl/Ewq3mKgq5PhhYfh0V/g3t7Dmfb4m4TObb+r6mzLKlg+hbUwObTz5Th3vdKm
	Nj/yprAgVJ+b1RPOngdZAEVAQnxXtA8h7Dm4ll6+rpEJirP+4i871wU8OmyJIaoFt5ap/i
	CLvjnyMx9olMLg2F4YhO+W3z0AYEsFo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 11/14] tools/xenstore: remember global and per domain max accounting values
Date: Tue, 30 May 2023 10:24:21 +0200
Message-Id: <20230530082424.32126-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530082424.32126-1-jgross@suse.com>
References: <20230530082424.32126-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add saving the maximum values of the different accounting data seen
per domain and (for unprivileged domains) globally, and print those
values via the xenstore-control quota command. Add a sub-command for
resetting the global maximum values seen.

This should help for a decision how to set the related quotas.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 docs/misc/xenstore.txt             |   5 +-
 tools/xenstore/xenstored_control.c |  22 ++++++-
 tools/xenstore/xenstored_domain.c  | 100 +++++++++++++++++++++++------
 tools/xenstore/xenstored_domain.h  |   2 +
 4 files changed, 108 insertions(+), 21 deletions(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index d807ef0709..38015835b1 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -426,7 +426,7 @@ CONTROL			<command>|[<parameters>|]
 	print|<string>
 		print <string> to syslog (xenstore runs as daemon) or
 		to console (xenstore runs as stubdom)
-	quota|[set <name> <val>|<domid>]
+	quota|[set <name> <val>|<domid>|max [-r]]
 		without parameters: print the current quota settings
 		with "set <name> <val>": set the quota <name> to new value
 		<val> (The admin should make sure all the domain usage is
@@ -435,6 +435,9 @@ CONTROL			<command>|[<parameters>|]
 		violating the new quota setting isn't increased further)
 		with "<domid>": print quota related accounting data for
 		the domain <domid>
+		with "max [-r]": show global per-domain maximum values of all
+		unprivileged domains, optionally reset the values by adding
+		"-r"
 	quota-soft|[set <name> <val>]
 		like the "quota" command, but for soft-quota.
 	help			<supported-commands>
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 403295788a..620a7da997 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -306,6 +306,22 @@ static int quota_get(const void *ctx, struct connection *conn,
 	return domain_get_quota(ctx, conn, atoi(vec[0]));
 }
 
+static int quota_max(const void *ctx, struct connection *conn,
+		     char **vec, int num)
+{
+	if (num > 1)
+		return EINVAL;
+
+	if (num == 1) {
+		if (!strcmp(vec[0], "-r"))
+			domain_reset_global_acc();
+		else
+			return EINVAL;
+	}
+
+	return domain_max_global_acc(ctx, conn);
+}
+
 static int do_control_quota(const void *ctx, struct connection *conn,
 			    char **vec, int num)
 {
@@ -315,6 +331,9 @@ static int do_control_quota(const void *ctx, struct connection *conn,
 	if (!strcmp(vec[0], "set"))
 		return quota_set(ctx, conn, vec + 1, num - 1, hard_quotas);
 
+	if (!strcmp(vec[0], "max"))
+		return quota_max(ctx, conn, vec + 1, num - 1);
+
 	return quota_get(ctx, conn, vec, num);
 }
 
@@ -978,7 +997,8 @@ static struct cmd_s cmds[] = {
 	{ "memreport", do_control_memreport, "[<file>]" },
 #endif
 	{ "print", do_control_print, "<string>" },
-	{ "quota", do_control_quota, "[set <name> <val>|<domid>]" },
+	{ "quota", do_control_quota,
+		"[set <name> <val>|<domid>|max [-r]]" },
 	{ "quota-soft", do_control_quota_s, "[set <name> <val>]" },
 	{ "help", do_control_help, "" },
 };
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 25c6d20036..6f3a27765a 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -43,6 +43,8 @@ static evtchn_port_t virq_port;
 
 xenevtchn_handle *xce_handle = NULL;
 
+static unsigned int acc_global_max[ACC_N];
+
 struct domain
 {
 	/* The id of this domain */
@@ -70,7 +72,10 @@ struct domain
 	bool introduced;
 
 	/* Accounting data for this domain. */
-	unsigned int acc[ACC_N];
+	struct acc {
+		unsigned int val;
+		unsigned int max;
+	} acc[ACC_N];
 
 	/* Memory quota data for this domain. */
 	bool soft_quota_reported;
@@ -199,9 +204,9 @@ static bool domain_can_read(struct connection *conn)
 	if (domain_is_unprivileged(conn)) {
 		if (domain->wrl_credit < 0)
 			return false;
-		if (domain->acc[ACC_OUTST] >= quota_req_outstanding)
+		if (domain->acc[ACC_OUTST].val >= quota_req_outstanding)
 			return false;
-		if (domain->acc[ACC_MEM] >= quota_memory_per_domain_hard &&
+		if (domain->acc[ACC_MEM].val >= quota_memory_per_domain_hard &&
 		    quota_memory_per_domain_hard)
 			return false;
 	}
@@ -264,7 +269,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 		ret = WALK_TREE_SKIP_CHILDREN;
 	}
 
-	return domain->acc[ACC_NODES] ? ret : WALK_TREE_SUCCESS_STOP;
+	return domain->acc[ACC_NODES].val ? ret : WALK_TREE_SUCCESS_STOP;
 }
 
 static void domain_tree_remove(struct domain *domain)
@@ -272,7 +277,7 @@ static void domain_tree_remove(struct domain *domain)
 	int ret;
 	struct walk_funcs walkfuncs = { .enter = domain_tree_remove_sub };
 
-	if (domain->acc[ACC_NODES]) {
+	if (domain->acc[ACC_NODES].val) {
 		ret = walk_node_tree(domain, NULL, "/", &walkfuncs, domain);
 		if (ret == WALK_TREE_ERROR_STOP)
 			syslog(LOG_ERR,
@@ -426,14 +431,41 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 		return ENOMEM;
 
 #define ent(t, e) \
-	resp = talloc_asprintf_append(resp, "%-16s: %8d\n", #t, e); \
+	resp = talloc_asprintf_append(resp, "%-16s: %8u (max: %8u\n", #t, \
+				      d->acc[e].val, d->acc[e].max); \
+	if (!resp) return ENOMEM
+
+	ent(nodes, ACC_NODES);
+	ent(watches, ACC_WATCH);
+	ent(transactions, ACC_TRANS);
+	ent(outstanding, ACC_OUTST);
+	ent(memory, ACC_MEM);
+
+#undef ent
+
+	send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
+
+	return 0;
+}
+
+int domain_max_global_acc(const void *ctx, struct connection *conn)
+{
+	char *resp;
+
+	resp = talloc_asprintf(ctx, "Max. seen accounting values:\n");
+	if (!resp)
+		return ENOMEM;
+
+#define ent(t, e) \
+	resp = talloc_asprintf_append(resp, "%-16s: %8u\n", #t,   \
+				      acc_global_max[e]);         \
 	if (!resp) return ENOMEM
 
-	ent(nodes, d->acc[ACC_NODES]);
-	ent(watches, d->acc[ACC_WATCH]);
-	ent(transactions, d->acc[ACC_TRANS]);
-	ent(outstanding, d->acc[ACC_OUTST]);
-	ent(memory, d->acc[ACC_MEM]);
+	ent(nodes, ACC_NODES);
+	ent(watches, ACC_WATCH);
+	ent(transactions, ACC_TRANS);
+	ent(outstanding, ACC_OUTST);
+	ent(memory, ACC_MEM);
 
 #undef ent
 
@@ -1049,10 +1081,12 @@ int domain_adjust_node_perms(struct node *node)
 
 static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
 {
+	unsigned int val;
+
 	assert(what < ARRAY_SIZE(d->acc));
 
-	if ((add < 0 && -add > d->acc[what]) ||
-	    (add > 0 && (INT_MAX - d->acc[what]) < add)) {
+	if ((add < 0 && -add > d->acc[what].val) ||
+	    (add > 0 && (INT_MAX - d->acc[what].val) < add)) {
 		/*
 		 * In a transaction when a node is being added/removed AND the
 		 * same node has been added/removed outside the transaction in
@@ -1063,7 +1097,13 @@ static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
 		return (add < 0) ? 0 : INT_MAX;
 	}
 
-	return d->acc[what] + add;
+	val = d->acc[what].val + add;
+	if (val > d->acc[what].max)
+		d->acc[what].max = val;
+	if (val > acc_global_max[what] && domid_is_unprivileged(d->domid))
+		acc_global_max[what] = val;
+
+	return val;
 }
 
 static int domain_acc_add(struct connection *conn, unsigned int domid,
@@ -1119,10 +1159,10 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 	}
 
 	trace_acc("global change domid %u: what=%u %u add %d\n", domid, what,
-		  d->acc[what], add);
-	d->acc[what] = domain_acc_add_valid(d, what, add);
+		  d->acc[what].val, add);
+	d->acc[what].val = domain_acc_add_valid(d, what, add);
 
-	return d->acc[what];
+	return d->acc[what].val;
 }
 
 void acc_drop(struct connection *conn)
@@ -1160,6 +1200,28 @@ void acc_commit(struct connection *conn)
 	conn->in = in;
 }
 
+static int domain_reset_global_acc_sub(const void *k, void *v, void *arg)
+{
+	struct domain *d = v;
+	unsigned int i;
+
+	for (i = 0; i < ACC_N; i++)
+		d->acc[i].max = d->acc[i].val;
+
+	return 0;
+}
+
+void domain_reset_global_acc(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < ACC_N; i++)
+		acc_global_max[i] = 0;
+
+	/* Set current max values seen. */
+	hashtable_iterate(domhash, domain_reset_global_acc_sub, NULL);
+}
+
 int domain_nbentry_inc(struct connection *conn, unsigned int domid)
 {
 	return (domain_acc_add(conn, domid, ACC_NODES, 1, false) < 0)
@@ -1660,7 +1722,7 @@ static int domain_check_acc_init_sub(const void *k, void *v, void *arg)
 	 * If everything is correct incrementing the value for each node will
 	 * result in dom->nodes being 0 at the end.
 	 */
-	dom->nodes = -d->acc[ACC_NODES];
+	dom->nodes = -d->acc[ACC_NODES].val;
 
 	if (!hashtable_insert(domains, &dom->domid, dom)) {
 		talloc_free(dom);
@@ -1715,7 +1777,7 @@ static int domain_check_acc_cb(const void *k, void *v, void *arg)
 	if (!d)
 		return 0;
 
-	d->acc[ACC_NODES] += dom->nodes;
+	d->acc[ACC_NODES].val += dom->nodes;
 
 	return 0;
 }
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 01b6f1861b..416df25cb2 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -127,6 +127,8 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 int acc_fix_domains(struct list_head *head, bool chk_quota, bool update);
 void acc_drop(struct connection *conn);
 void acc_commit(struct connection *conn);
+int domain_max_global_acc(const void *ctx, struct connection *conn);
+void domain_reset_global_acc(void);
 
 /* Write rate limiting */
 
-- 
2.35.3


