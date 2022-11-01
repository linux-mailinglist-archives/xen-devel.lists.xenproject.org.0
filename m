Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5869B614EED
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435071.688121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optuy-0001Ts-Ip; Tue, 01 Nov 2022 16:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435071.688121; Tue, 01 Nov 2022 16:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optuy-0001RW-DV; Tue, 01 Nov 2022 16:15:12 +0000
Received: by outflank-mailman (input) for mailman id 435071;
 Tue, 01 Nov 2022 16:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optlS-0003qE-Ba
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:05:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc7b1ad5-59fe-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:05:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 05F921F8CA;
 Tue,  1 Nov 2022 16:05:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B58871346F;
 Tue,  1 Nov 2022 16:05:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 73wIK8BDYWOYcgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:05:20 +0000
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
X-Inumbo-ID: fc7b1ad5-59fe-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667318721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2q+bzKJwqxVNaXxCMgH7XK7Vg2XGJN/yW7eJYqIUWtA=;
	b=kY9fUxff56SHHUTCsUXg+fjZsQukQrKVZpMqHwqzdq8HqER9E7HL3At5QCPyST88IXUfjo
	O33Af+MmYBz/w+Tkmqq25S/0X7Fb7NtA7tMs9TFuQ0dRBY9RsOjDd6sS8VsCrHaiP+FWsH
	/PMee7RLt/5ql+Kfq1I7Ydh19dVxTl4=
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
Subject: [PATCH 10/12] tools/xenstore: remember global and per domain max accounting values
Date: Tue,  1 Nov 2022 17:04:20 +0100
Message-Id: <20221101160422.7212-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101160422.7212-1-jgross@suse.com>
References: <20221101160422.7212-1-jgross@suse.com>
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
 tools/xenstore/xenstored_domain.c  | 102 +++++++++++++++++++++++------
 tools/xenstore/xenstored_domain.h  |   2 +
 4 files changed, 109 insertions(+), 22 deletions(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 9db0385120..da47d7bb16 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -415,7 +415,7 @@ CONTROL			<command>|[<parameters>|]
 	print|<string>
 		print <string> to syslog (xenstore runs as daemon) or
 		to console (xenstore runs as stubdom)
-	quota|[set <name> <val>|<domid>]
+	quota|[set <name> <val>|<domid>|max [-r]]
 		without parameters: print the current quota settings
 		with "set <name> <val>": set the quota <name> to new value
 		<val> (The admin should make sure all the domain usage is
@@ -424,6 +424,9 @@ CONTROL			<command>|[<parameters>|]
 		violating the new quota setting isn't increased further)
 		with "<domid>": print quota related accounting data for
 		the domain <domid>
+		with "max [-r]": show global per-domain maximum values of all
+		unprivileged domains, optionally reset the values by adding
+		"-r"
 	quota-soft|[set <name> <val>]
 		like the "quota" command, but for soft-quota.
 	trace|[+|-<switch>]
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 0a985a1faa..23098917ec 100644
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
index 274ea72741..6464362299 100644
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
@@ -430,14 +435,41 @@ int domain_get_quota(const void *ctx, struct connection *conn,
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
 
@@ -1055,14 +1087,22 @@ int domain_adjust_node_perms(struct node *node)
 static int domain_acc_add_chk(struct domain *d, unsigned int what, int add,
 			      unsigned int domid)
 {
-	if ((add < 0 && -add > d->acc[what]) ||
-	    (d->acc[what] + add) > INT_MAX) {
+	unsigned int val;
+
+	if ((add < 0 && -add > d->acc[what].val) ||
+	    (d->acc[what].val + add) > INT_MAX) {
 		syslog(LOG_ERR, "Accounting error: domain %u type %u val %u\n",
-		       domid, what, d->acc[what] + add);
+		       domid, what, d->acc[what].val + add);
 		return (add < 0) ? 0 : INT_MAX;
 	}
 
-	return d->acc[what] + add;
+	val = d->acc[what].val + add;
+	if (val > d->acc[what].max)
+		d->acc[what].max = val;
+	if (val > acc_global_max[what] && domid_is_unprivileged(domid))
+		acc_global_max[what] = val;
+
+	return val;
 }
 
 static int domain_acc_add(struct connection *conn, unsigned int domid,
@@ -1118,10 +1158,10 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 	}
 
 	trace_acc("global change domid %u: what=%u %u add %d\n", domid, what,
-		  d->acc[what], add);
-	d->acc[what] = domain_acc_add_chk(d, what, add, domid);
+		  d->acc[what].val, add);
+	d->acc[what].val = domain_acc_add_chk(d, what, add, domid);
 
-	return d->acc[what];
+	return d->acc[what].val;
 }
 
 void acc_drop(struct connection *conn)
@@ -1154,6 +1194,28 @@ void acc_commit(struct connection *conn)
 	conn->in = in;
 }
 
+static int domain_reset_global_acc_sub(void *k, void *v, void *arg)
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
@@ -1654,7 +1716,7 @@ static int domain_check_acc_init_sub(void *k, void *v, void *arg)
 	 * If everything is correct incrementing the value for each node will
 	 * result in dom->nodes being 0 at the end.
 	 */
-	dom->nodes = -d->acc[ACC_NODES];
+	dom->nodes = -d->acc[ACC_NODES].val;
 
 	if (!hashtable_insert(domains, &dom->domid, dom)) {
 		talloc_free(dom);
@@ -1709,7 +1771,7 @@ static int domain_check_acc_sub(void *k, void *v, void *arg)
 	if (!d)
 		return 0;
 
-	d->acc[ACC_NODES] += dom->nodes;
+	d->acc[ACC_NODES].val += dom->nodes;
 
 	return 0;
 }
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 5005850dd3..b5f0b9a591 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -116,6 +116,8 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 int acc_fix_domains(struct list_head *head, bool update);
 void acc_drop(struct connection *conn);
 void acc_commit(struct connection *conn);
+int domain_max_global_acc(const void *ctx, struct connection *conn);
+void domain_reset_global_acc(void);
 
 /* Write rate limiting */
 
-- 
2.35.3


