Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB766D74FD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 09:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518261.804632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxGM-0007gD-Sh; Wed, 05 Apr 2023 07:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518261.804632; Wed, 05 Apr 2023 07:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxGM-0007Xk-OP; Wed, 05 Apr 2023 07:08:58 +0000
Received: by outflank-mailman (input) for mailman id 518261;
 Wed, 05 Apr 2023 07:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjxCR-0002Et-GC
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 07:04:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a24292f-d380-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 09:04:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B43C229D0;
 Wed,  5 Apr 2023 07:04:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 183F713A31;
 Wed,  5 Apr 2023 07:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y9STBJUdLWT9EwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 07:04:53 +0000
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
X-Inumbo-ID: 2a24292f-d380-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680678293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ZcKfGTywyhrwZZUE2CTmIRIHQZRyLmi1TNVZ6l6MAw=;
	b=J85PbfdL8z3iCw2B4Q1bk3oMnyCK50oEidaoR42ZPYCoHHWj/yqLNNp6LOgrjYls97N18/
	HkhQHaOPux3ZgThOWGXZFOewgIISa3eegqDDkkgUuomSi7g5tmcBvk97MQJ7ZTrK/9OCsv
	JTZWK5b6oNvQifldTqW7itnzi5IUMd8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 11/13] tools/xenstore: remember global and per domain max accounting values
Date: Wed,  5 Apr 2023 09:03:47 +0200
Message-Id: <20230405070349.25293-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230405070349.25293-1-jgross@suse.com>
References: <20230405070349.25293-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add saving the maximum values of the different accounting data seen
per domain and (for unprivileged domains) globally, and print those
values via the xenstore-control quota command. Add a sub-command for
resetting the global maximum values seen.

This should help for a decision how to set the related quotas.

Signed-off-by: Juergen Gross <jgross@suse.com>
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
index cbd62556c3..a2ba64a15c 100644
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
index 40bcc1dbfa..d21f31da92 100644
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
@@ -201,9 +206,9 @@ static bool domain_can_read(struct connection *conn)
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
@@ -266,7 +271,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 		ret = WALK_TREE_SKIP_CHILDREN;
 	}
 
-	return domain->acc[ACC_NODES] ? ret : WALK_TREE_SUCCESS_STOP;
+	return domain->acc[ACC_NODES].val ? ret : WALK_TREE_SUCCESS_STOP;
 }
 
 static void domain_tree_remove(struct domain *domain)
@@ -274,7 +279,7 @@ static void domain_tree_remove(struct domain *domain)
 	int ret;
 	struct walk_funcs walkfuncs = { .enter = domain_tree_remove_sub };
 
-	if (domain->acc[ACC_NODES]) {
+	if (domain->acc[ACC_NODES].val) {
 		ret = walk_node_tree(domain, NULL, "/", &walkfuncs, domain);
 		if (ret == WALK_TREE_ERROR_STOP)
 			syslog(LOG_ERR,
@@ -428,14 +433,41 @@ int domain_get_quota(const void *ctx, struct connection *conn,
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
 
@@ -1051,10 +1083,12 @@ int domain_adjust_node_perms(struct node *node)
 
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
@@ -1065,7 +1099,13 @@ static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
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
@@ -1121,10 +1161,10 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
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
@@ -1159,6 +1199,28 @@ void acc_commit(struct connection *conn)
 	}
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
@@ -1659,7 +1721,7 @@ static int domain_check_acc_init_sub(const void *k, void *v, void *arg)
 	 * If everything is correct incrementing the value for each node will
 	 * result in dom->nodes being 0 at the end.
 	 */
-	dom->nodes = -d->acc[ACC_NODES];
+	dom->nodes = -d->acc[ACC_NODES].val;
 
 	if (!hashtable_insert(domains, &dom->domid, dom)) {
 		talloc_free(dom);
@@ -1714,7 +1776,7 @@ static int domain_check_acc_cb(const void *k, void *v, void *arg)
 	if (!d)
 		return 0;
 
-	d->acc[ACC_NODES] += dom->nodes;
+	d->acc[ACC_NODES].val += dom->nodes;
 
 	return 0;
 }
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index abc766f343..b55c9bcc2d 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -126,6 +126,8 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 int acc_fix_domains(struct list_head *head, bool chk_quota, bool update);
 void acc_drop(struct connection *conn);
 void acc_commit(struct connection *conn);
+int domain_max_global_acc(const void *ctx, struct connection *conn);
+void domain_reset_global_acc(void);
 
 /* Write rate limiting */
 
-- 
2.35.3


