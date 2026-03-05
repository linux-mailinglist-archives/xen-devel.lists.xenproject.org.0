Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGlLEqWKqWl3/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26AB212C94
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246668.1545801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97u-0000lt-52; Thu, 05 Mar 2026 13:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246668.1545801; Thu, 05 Mar 2026 13:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97u-0000kE-11; Thu, 05 Mar 2026 13:52:30 +0000
Received: by outflank-mailman (input) for mailman id 1246668;
 Thu, 05 Mar 2026 13:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy97s-0008Mq-Hu
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:52:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bc0ae45-189a-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 14:52:27 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B596E3F81C;
 Thu,  5 Mar 2026 13:52:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 942643EA76;
 Thu,  5 Mar 2026 13:52:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ihr/IpqKqWlwTgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:26 +0000
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
X-Inumbo-ID: 8bc0ae45-189a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjwrLXJ76lcdkEfVRZ/NYlU2XuS/dX5LsghDgLcjKFI=;
	b=WW5hCUJF2RbKUTrdp2XBfBvlZD2C+g7/HirdVoXWthwOXuyv9WRF2c0ZO+YVwGifjsDPVT
	5mBsCYIb5uwbWelmDYzTAPfzD1VkZqy+shM/tHsvnR6Hupo6vVATSYH/M465w6D4CXwyDH
	V+8bWa+x2Q1pmi/UwGQwy/blGQOV7BU=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjwrLXJ76lcdkEfVRZ/NYlU2XuS/dX5LsghDgLcjKFI=;
	b=B/fb8AgINJwxqJ7DX8HAqVCjEjPowW5GiuHwhbxHf+bquF1jQH/3f1ueHNLfAWzmcGorTk
	b5KT17AsBdPluqaprR5WtwUOc7xtm5ek93qAawrFXgbFM9dWhqVq+c0Uh71toYkLQ0bGis
	YrTJcvbQfFebmrUS+R/HN8He2QK27Ss=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 03/11] tools/xenstored: rework hard_quotas and soft_quotas arrays
Date: Thu,  5 Mar 2026 14:52:00 +0100
Message-ID: <20260305135208.2208663-4-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.79
X-Spam-Level: 
X-Rspamd-Queue-Id: F26AB212C94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Instead of having one array for hard quotas and one for soft quotas,
split them differently: have one array with the quota names and
descriptions, and one with the quota values (soft and hard) and the
maximum value so far.

This is in preparation of supporting per-domain quotas, as the layout
of the second array elements will be reused in the domain data.

While at it add an accessor for getting a soft quota value, as this
will be needed for per-domain quotas, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/control.c | 24 ++++++++-------
 tools/xenstored/core.c    | 33 +++++++++++---------
 tools/xenstored/domain.c  | 65 +++++++++++++++++++++------------------
 tools/xenstored/domain.h  | 15 +++++----
 4 files changed, 76 insertions(+), 61 deletions(-)

diff --git a/tools/xenstored/control.c b/tools/xenstored/control.c
index 2611a6fade..ca59d30d05 100644
--- a/tools/xenstored/control.c
+++ b/tools/xenstored/control.c
@@ -101,7 +101,7 @@ static int do_control_log(const void *ctx, struct connection *conn,
 }
 
 static int quota_show_current(const void *ctx, struct connection *conn,
-			      const struct quota *quotas)
+			      unsigned int idx)
 {
 	char *resp;
 	unsigned int i;
@@ -111,11 +111,12 @@ static int quota_show_current(const void *ctx, struct connection *conn,
 		return ENOMEM;
 
 	for (i = 0; i < ACC_N; i++) {
-		if (!quotas[i].name)
+		if (!quota_adm[i].name || quotas[i].val[idx] == Q_VAL_DISABLED)
 			continue;
 		resp = talloc_asprintf_append(resp, "%-17s: %8d %s\n",
-					      quotas[i].name, quotas[i].val,
-					      quotas[i].descr);
+					      quota_adm[i].name,
+					      quotas[i].val[idx],
+					      quota_adm[i].descr);
 		if (!resp)
 			return ENOMEM;
 	}
@@ -126,7 +127,7 @@ static int quota_show_current(const void *ctx, struct connection *conn,
 }
 
 static int quota_set(const void *ctx, struct connection *conn,
-		     const char **vec, int num, struct quota *quotas)
+		     const char **vec, int num, unsigned int idx)
 {
 	unsigned int i;
 	int val;
@@ -139,8 +140,9 @@ static int quota_set(const void *ctx, struct connection *conn,
 		return EINVAL;
 
 	for (i = 0; i < ACC_N; i++) {
-		if (quotas[i].name && !strcmp(vec[0], quotas[i].name)) {
-			quotas[i].val = val;
+		if (quota_adm[i].name && !strcmp(vec[0], quota_adm[i].name) &&
+		    quotas[i].val[idx] != Q_VAL_DISABLED) {
+			quotas[i].val[idx] = val;
 			send_ack(conn, XS_CONTROL);
 			return 0;
 		}
@@ -178,10 +180,10 @@ static int do_control_quota(const void *ctx, struct connection *conn,
 			    const char **vec, int num)
 {
 	if (num == 0)
-		return quota_show_current(ctx, conn, hard_quotas);
+		return quota_show_current(ctx, conn, Q_IDX_HARD);
 
 	if (!strcmp(vec[0], "set"))
-		return quota_set(ctx, conn, vec + 1, num - 1, hard_quotas);
+		return quota_set(ctx, conn, vec + 1, num - 1, Q_IDX_HARD);
 
 	if (!strcmp(vec[0], "max"))
 		return quota_max(ctx, conn, vec + 1, num - 1);
@@ -193,10 +195,10 @@ static int do_control_quota_s(const void *ctx, struct connection *conn,
 			      const char **vec, int num)
 {
 	if (num == 0)
-		return quota_show_current(ctx, conn, soft_quotas);
+		return quota_show_current(ctx, conn, Q_IDX_SOFT);
 
 	if (!strcmp(vec[0], "set"))
-		return quota_set(ctx, conn, vec + 1, num - 1, soft_quotas);
+		return quota_set(ctx, conn, vec + 1, num - 1, Q_IDX_SOFT);
 
 	return EINVAL;
 }
diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 5a4bf3e302..8a06b35808 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2613,10 +2613,9 @@ static void set_timeout(const char *arg)
 		barf("unknown timeout \"%s\"\n", arg);
 }
 
-static void set_quota(const char *arg, bool soft)
+static void set_quota(const char *arg, unsigned int idx)
 {
 	const char *eq = strchr(arg, '=');
-	struct quota *q = soft ? soft_quotas : hard_quotas;
 	unsigned int val;
 	unsigned int i;
 
@@ -2625,8 +2624,9 @@ static void set_quota(const char *arg, bool soft)
 	val = get_optval_uint(eq + 1);
 
 	for (i = 0; i < ACC_N; i++) {
-		if (what_matches(arg, q[i].name)) {
-			q[i].val = val;
+		if (what_matches(arg, quota_adm[i].name) &&
+		    quotas[i].val[idx] != Q_VAL_DISABLED) {
+			quotas[i].val[idx] = val;
 			return;
 		}
 	}
@@ -2634,6 +2634,11 @@ static void set_quota(const char *arg, bool soft)
 	barf("unknown quota \"%s\"\n", arg);
 }
 
+static void set_one_quota(const char *arg, unsigned int idx, enum accitem what)
+{
+	quotas[what].val[idx] = get_optval_uint(arg);
+}
+
 /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
 const char *const trace_switches[] = {
 	"obj", "io", "wrl", "acc", "tdb",
@@ -2687,7 +2692,7 @@ int main(int argc, char *argv[])
 				  options, NULL)) != -1) {
 		switch (opt) {
 		case 'E':
-			hard_quotas[ACC_NODES].val = get_optval_uint(optarg);
+			set_one_quota(optarg, Q_IDX_HARD, ACC_NODES);
 			break;
 		case 'F':
 			pidfile = optarg;
@@ -2699,10 +2704,10 @@ int main(int argc, char *argv[])
 			dofork = false;
 			break;
 		case 'S':
-			hard_quotas[ACC_NODESZ].val = get_optval_uint(optarg);
+			set_one_quota(optarg, Q_IDX_HARD, ACC_NODESZ);
 			break;
 		case 't':
-			hard_quotas[ACC_TRANS].val = get_optval_uint(optarg);
+			set_one_quota(optarg, Q_IDX_HARD, ACC_TRANS);
 			break;
 		case 'T':
 			tracefile = optarg;
@@ -2715,22 +2720,22 @@ int main(int argc, char *argv[])
 			keep_orphans = true;
 			break;
 		case 'W':
-			hard_quotas[ACC_WATCH].val = get_optval_uint(optarg);
+			set_one_quota(optarg, Q_IDX_HARD, ACC_WATCH);
 			break;
 		case 'A':
-			hard_quotas[ACC_NPERM].val = get_optval_uint(optarg);
+			set_one_quota(optarg, Q_IDX_HARD, ACC_NPERM);
 			break;
 		case 'M':
-			hard_quotas[ACC_PATHLEN].val = get_optval_uint(optarg);
-			hard_quotas[ACC_PATHLEN].val =
+			set_one_quota(optarg, Q_IDX_HARD, ACC_PATHLEN);
+			quotas[ACC_PATHLEN].val[Q_IDX_HARD] =
 				 min((unsigned int)XENSTORE_REL_PATH_MAX,
-				     hard_quotas[ACC_PATHLEN].val);
+				     quotas[ACC_PATHLEN].val[Q_IDX_HARD]);
 			break;
 		case 'Q':
-			set_quota(optarg, false);
+			set_quota(optarg, Q_IDX_HARD);
 			break;
 		case 'q':
-			set_quota(optarg, true);
+			set_quota(optarg, Q_IDX_SOFT);
 			break;
 		case 'w':
 			set_timeout(optarg);
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 1df9265ad5..acdcaa769e 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -51,60 +51,60 @@ static evtchn_port_t virq_port;
 
 xenevtchn_handle *xce_handle = NULL;
 
-struct quota hard_quotas[ACC_N] = {
+struct quotaadm quota_adm[ACC_N] = {
 	[ACC_NODES] = {
 		.name = "nodes",
 		.descr = "Nodes per domain",
-		.val = 1000,
 	},
 	[ACC_WATCH] = {
 		.name = "watches",
 		.descr = "Watches per domain",
-		.val = 128,
 	},
 	[ACC_OUTST] = {
 		.name = "outstanding",
 		.descr = "Outstanding requests per domain",
-		.val = 20,
 	},
 	[ACC_MEM] = {
 		.name = "memory",
-		.descr = "Total Xenstore memory per domain (error level)",
-		.val = 2 * 1024 * 1024 + 512 * 1024,	/* 2.5 MB */
+		.descr = "Total Xenstore memory per domain",
 	},
 	[ACC_TRANS] = {
 		.name = "transactions",
 		.descr = "Active transactions per domain",
-		.val = 10,
 	},
 	[ACC_TRANSNODES] = {
 		.name = "transaction-nodes",
 		.descr = "Max. number of accessed nodes per transaction",
-		.val = 1024,
 	},
 	[ACC_NPERM] = {
 		.name = "node-permissions",
 		.descr = "Max. number of permissions per node",
-		.val = 5,
 	},
 	[ACC_PATHLEN] = {
 		.name = "path-max",
 		.descr = "Max. length of a node path",
-		.val = XENSTORE_REL_PATH_MAX,
 	},
 	[ACC_NODESZ] = {
 		.name = "node-size",
 		.descr = "Max. size of a node",
-		.val = 2048,
 	},
 };
 
-struct quota soft_quotas[ACC_N] = {
-	[ACC_MEM] = {
-		.name = "memory",
-		.descr = "Total Xenstore memory per domain (warning level)",
-		.val = 2 * 1024 * 1024,			/* 2.0 MB */
+struct quota quotas[ACC_N] = {
+	[ACC_NODES] =      { .val = { 1000, Q_VAL_DISABLED }, },
+	[ACC_WATCH] =      { .val = {  128, Q_VAL_DISABLED }, },
+	[ACC_OUTST] =      { .val = {   20, Q_VAL_DISABLED }, },
+	[ACC_MEM] =        {
+		.val = { 2 * 1024 * 1024 + 512 * 1024,	/* 2.5 MB */
+			 2 * 1024 * 1024		/* 2.0 MB */ },
 	},
+	[ACC_TRANS] =      { .val = {   10, Q_VAL_DISABLED }, },
+	[ACC_TRANSNODES] = { .val = { 1024, Q_VAL_DISABLED }, },
+	[ACC_NPERM] =      { .val = {    5, Q_VAL_DISABLED }, },
+	[ACC_PATHLEN] =    {
+		.val = { XENSTORE_REL_PATH_MAX, Q_VAL_DISABLED },
+	},
+	[ACC_NODESZ] =     { .val = { 2048, Q_VAL_DISABLED }, },
 };
 
 typedef int32_t wrl_creditt;
@@ -389,10 +389,15 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
 	wrl_apply_debit_actual(conn->domain);
 }
 
+static unsigned int domain_get_soft_quota(struct domain *d, enum accitem what)
+{
+	return quotas[what].val[Q_IDX_SOFT];
+}
+
 static bool domain_check_quota_val(struct domain *d, enum accitem what,
 				   unsigned int val)
 {
-	unsigned int quota = hard_quotas[what].val;
+	unsigned int quota = quotas[what].val[Q_IDX_HARD];
 
 	if (!quota || !domid_is_unprivileged(d->domid))
 		return false;
@@ -765,10 +770,10 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 		return ENOMEM;
 
 	for (i = 0; i < ACC_N; i++) {
-		if (!hard_quotas[i].name)
+		if (!quota_adm[i].name)
 			continue;
 		resp = talloc_asprintf_append(resp, "%-17s: %8u (max %8u)\n",
-					      hard_quotas[i].name,
+					      quota_adm[i].name,
 					      d->acc[i].val, d->acc[i].max);
 		if (!resp)
 			return ENOMEM;
@@ -789,11 +794,10 @@ int domain_max_global_acc(const void *ctx, struct connection *conn)
 		return ENOMEM;
 
 	for (i = 0; i < ACC_N; i++) {
-		if (!hard_quotas[i].name)
+		if (!quota_adm[i].name)
 			continue;
 		resp = talloc_asprintf_append(resp, "%-17s: %8u\n",
-					      hard_quotas[i].name,
-					      hard_quotas[i].max);
+					      quota_adm[i].name, quotas[i].max);
 		if (!resp)
 			return ENOMEM;
 	}
@@ -1600,12 +1604,12 @@ static void domain_acc_valid_max(struct domain *d, enum accitem what,
 				 unsigned int val)
 {
 	assert(what < ARRAY_SIZE(d->acc));
-	assert(what < ARRAY_SIZE(hard_quotas));
+	assert(what < ARRAY_SIZE(quotas));
 
 	if (val > d->acc[what].max)
 		d->acc[what].max = val;
-	if (val > hard_quotas[what].max && domid_is_unprivileged(d->domid))
-		hard_quotas[what].max = val;
+	if (val > quotas[what].max && domid_is_unprivileged(d->domid))
+		quotas[what].max = val;
 }
 
 static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
@@ -1742,7 +1746,7 @@ void domain_reset_global_acc(void)
 	unsigned int i;
 
 	for (i = 0; i < ACC_N; i++)
-		hard_quotas[i].max = 0;
+		quotas[i].max = 0;
 
 	/* Set current max values seen. */
 	hashtable_iterate(domhash, domain_reset_global_acc_sub, NULL);
@@ -1802,21 +1806,22 @@ static bool domain_chk_quota(struct connection *conn, unsigned int mem)
 	}
 
 	if (now - domain->mem_last_msg >= MEM_WARN_MINTIME_SEC) {
+		unsigned int soft_mem = domain_get_soft_quota(domain, ACC_MEM);
+
 		if (domain->hard_quota_reported) {
 			domain->mem_last_msg = now;
 			domain->hard_quota_reported = false;
 			syslog(LOG_INFO, "Domain %u below hard memory quota again\n",
 			       domain->domid);
 		}
-		if (mem >= soft_quotas[ACC_MEM].val &&
-		    soft_quotas[ACC_MEM].val && !domain->soft_quota_reported) {
+		if (mem >= soft_mem && soft_mem &&
+		    !domain->soft_quota_reported) {
 			domain->mem_last_msg = now;
 			domain->soft_quota_reported = true;
 			syslog(LOG_WARNING, "Domain %u exceeds soft memory quota\n",
 			       domain->domid);
 		}
-		if (mem < soft_quotas[ACC_MEM].val &&
-		    domain->soft_quota_reported) {
+		if (mem < soft_mem && domain->soft_quota_reported) {
 			domain->mem_last_msg = now;
 			domain->soft_quota_reported = false;
 			syslog(LOG_INFO, "Domain %u below soft memory quota again\n",
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index b229f6f4e0..a6db358fdc 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -40,15 +40,18 @@ enum accitem {
 	ACC_N,			/* Number of elements per domain. */
 };
 
-struct quota {
+extern struct quotaadm {
 	const char *name;
 	const char *descr;
-	unsigned int val;
-	unsigned int max;
-};
+} quota_adm[ACC_N];
 
-extern struct quota hard_quotas[ACC_N];
-extern struct quota soft_quotas[ACC_N];
+extern struct quota {
+	unsigned int val[2];
+#define Q_IDX_HARD      0
+#define Q_IDX_SOFT      1
+#define Q_VAL_DISABLED  UINT_MAX
+	unsigned int max;
+} quotas[ACC_N];
 
 void handle_event(void);
 
-- 
2.53.0


