Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D847C64B938
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:05:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460774.718839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mK-0007eE-JS; Tue, 13 Dec 2022 16:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460774.718839; Tue, 13 Dec 2022 16:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mK-0007Zw-EW; Tue, 13 Dec 2022 16:05:12 +0000
Received: by outflank-mailman (input) for mailman id 460774;
 Tue, 13 Dec 2022 16:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57jc-0001ta-5C
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:02:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 876c238a-7aff-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 17:02:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E025522A3A;
 Tue, 13 Dec 2022 16:02:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9DAA2138EE;
 Tue, 13 Dec 2022 16:02:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PZIdJQ6imGNZKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:02:22 +0000
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
X-Inumbo-ID: 876c238a-7aff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYY4+JQatq0yxroA0693aBz8mhvS4scd7j3Blc0Yn4E=;
	b=GYM64a3cpem9iRuD8sGtzof/YFd03xbqX+pdsVvQ1eshRZaQFJIDD/sofQCFXOCXWBG9mR
	R9l0k+tncPopIm0f/kx6eVV5c8+dKv2XgslHq7ei8bBy+LWKYCZb2BkCQOK8jfN3cU45Ai
	PupFZPfiXEsfZ1I6KC4yC4w8/xeyVxc=
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
Subject: [PATCH v2 17/19] tools/xenstore: introduce trace classes
Date: Tue, 13 Dec 2022 17:00:43 +0100
Message-Id: <20221213160045.28170-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the xenstored internal trace configurable by adding classes
which can be switched on and off independently from each other.

Define the following classes:

- obj: Creation and deletion of interesting "objects" (watch,
  transaction, connection)
- io: incoming requests and outgoing responses
- wrl: write limiting

Per default "obj" and "io" are switched on.

Entries written via trace() will always be printed (if tracing is on
at all).

Add the capability to control the trace settings via the "log"
command and via a new "--log-control" command line option.

Add a missing trace_create() call for creating a transaction.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- keep "log" and "logfile" command names (Julien Grall)
---
 docs/misc/xenstore.txt                 | 10 +++--
 tools/xenstore/xenstored_control.c     | 31 +++++++++++++--
 tools/xenstore/xenstored_core.c        | 55 ++++++++++++++++++++++++--
 tools/xenstore/xenstored_core.h        |  6 +++
 tools/xenstore/xenstored_domain.c      | 27 +++++++------
 tools/xenstore/xenstored_transaction.c |  1 +
 6 files changed, 106 insertions(+), 24 deletions(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 44428ae3a7..8887e7df88 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -409,10 +409,12 @@ CONTROL			<command>|[<parameters>|]
 		error string in case of failure. -s can return "BUSY" in case
 		of an active transaction, a retry of -s can be done in that
 		case.
-	log|on
-		turn xenstore logging on
-	log|off
-		turn xenstore logging off
+	log|[on|off|+<switch>|-<switch>]
+		without parameters: show possible log switches
+		on: turn xenstore logging on
+		off: turn xenstore logging off
+		+<switch>: activates log entries for <switch>,
+		-<switch>: deactivates log entries for <switch>
 	logfile|<file-name>
 		log to specified file
 	memreport|[<file-name>]
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 41e6992591..000b2bb8c7 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -182,6 +182,28 @@ static int do_control_check(const void *ctx, struct connection *conn,
 static int do_control_log(const void *ctx, struct connection *conn,
 			  char **vec, int num)
 {
+	int ret;
+
+	if (num == 0) {
+		char *resp = talloc_asprintf(ctx, "Log switch settings:\n");
+		unsigned int idx;
+		bool on;
+
+		if (!resp)
+			return ENOMEM;
+		for (idx = 0; trace_switches[idx]; idx++) {
+			on = trace_flags & (1u << idx);
+			resp = talloc_asprintf_append(resp, "%-8s: %s\n",
+						      trace_switches[idx],
+						      on ? "on" : "off");
+			if (!resp)
+				return ENOMEM;
+		}
+
+		send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
+		return 0;
+	}
+
 	if (num != 1)
 		return EINVAL;
 
@@ -189,8 +211,11 @@ static int do_control_log(const void *ctx, struct connection *conn,
 		reopen_log();
 	else if (!strcmp(vec[0], "off"))
 		close_log();
-	else
-		return EINVAL;
+	else {
+		ret = set_trace_switch(vec[0]);
+		if (ret)
+			return ret;
+	}
 
 	send_ack(conn, XS_CONTROL);
 	return 0;
@@ -923,7 +948,7 @@ static int do_control_help(const void *, struct connection *, char **, int);
 
 static struct cmd_s cmds[] = {
 	{ "check", do_control_check, "" },
-	{ "log", do_control_log, "on|off" },
+	{ "log", do_control_log, "[on|off|+<switch>|-<switch>]" },
 
 #ifndef NO_LIVE_UPDATE
 	/*
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 48c2793aeb..0d5b5a0d82 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -85,6 +85,7 @@ static int reopen_log_pipe[2];
 static int reopen_log_pipe0_pollfd_idx = -1;
 char *tracefile = NULL;
 TDB_CONTEXT *tdb_ctx = NULL;
+unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type);
 
@@ -139,13 +140,13 @@ static void trace_io(const struct connection *conn,
 	time_t now;
 	struct tm *tm;
 
-	if (tracefd < 0)
+	if (tracefd < 0 || !(trace_flags & TRACE_IO))
 		return;
 
 	now = time(NULL);
 	tm = localtime(&now);
 
-	trace("%s %p %04d%02d%02d %02d:%02d:%02d %s (",
+	trace("io: %s %p %04d%02d%02d %02d:%02d:%02d %s (",
 	      out ? "OUT" : "IN", conn,
 	      tm->tm_year + 1900, tm->tm_mon + 1,
 	      tm->tm_mday, tm->tm_hour, tm->tm_min, tm->tm_sec,
@@ -158,12 +159,14 @@ static void trace_io(const struct connection *conn,
 
 void trace_create(const void *data, const char *type)
 {
-	trace("CREATE %s %p\n", type, data);
+	if (trace_flags & TRACE_OBJ)
+		trace("obj: CREATE %s %p\n", type, data);
 }
 
 void trace_destroy(const void *data, const char *type)
 {
-	trace("DESTROY %s %p\n", type, data);
+	if (trace_flags & TRACE_OBJ)
+		trace("obj: DESTROY %s %p\n", type, data);
 }
 
 /**
@@ -2599,6 +2602,8 @@ static void usage(void)
 "  -N, --no-fork           to request that the daemon does not fork,\n"
 "  -P, --output-pid        to request that the pid of the daemon is output,\n"
 "  -T, --trace-file <file> giving the file for logging, and\n"
+"      --trace-control=+<switch> activate a specific <switch>\n"
+"      --trace-control=-<switch> deactivate a specific <switch>\n"
 "  -E, --entry-nb <nb>     limit the number of entries per domain,\n"
 "  -S, --entry-size <size> limit the size of entry per domain, and\n"
 "  -W, --watch-nb <nb>     limit the number of watches per domain,\n"
@@ -2642,6 +2647,7 @@ static struct option options[] = {
 	{ "output-pid", 0, NULL, 'P' },
 	{ "entry-size", 1, NULL, 'S' },
 	{ "trace-file", 1, NULL, 'T' },
+	{ "trace-control", 1, NULL, 1 },
 	{ "transaction", 1, NULL, 't' },
 	{ "perm-nb", 1, NULL, 'A' },
 	{ "path-max", 1, NULL, 'M' },
@@ -2716,6 +2722,43 @@ static void set_quota(const char *arg, bool soft)
 		barf("unknown quota \"%s\"\n", arg);
 }
 
+/* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
+const char *trace_switches[] = {
+	"obj", "io", "wrl",
+	NULL
+};
+
+int set_trace_switch(const char *arg)
+{
+	bool remove = (arg[0] == '-');
+	unsigned int idx;
+
+	switch (arg[0]) {
+	case '-':
+		remove = true;
+		break;
+	case '+':
+		remove = false;
+		break;
+	default:
+		return EINVAL;
+	}
+
+	arg++;
+
+	for (idx = 0; trace_switches[idx]; idx++) {
+		if (!strcmp(arg, trace_switches[idx])) {
+			if (remove)
+				trace_flags &= ~(1u << idx);
+			else
+				trace_flags |= 1u << idx;
+			return 0;
+		}
+	}
+
+	return EINVAL;
+}
+
 int main(int argc, char *argv[])
 {
 	int opt;
@@ -2764,6 +2807,10 @@ int main(int argc, char *argv[])
 		case 'T':
 			tracefile = optarg;
 			break;
+		case 1:
+			if (set_trace_switch(optarg))
+				barf("Illegal trace switch \"%s\"\n", optarg);
+			break;
 		case 'I':
 			if (optarg && !strcmp(optarg, "off"))
 				tdb_flags = 0;
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 3b96ecd018..c85b15515c 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -287,6 +287,12 @@ extern char **orig_argv;
 
 extern char *tracefile;
 extern int tracefd;
+extern unsigned int trace_flags;
+#define TRACE_OBJ	0x00000001
+#define TRACE_IO	0x00000002
+#define TRACE_WRL	0x00000004
+extern const char *trace_switches[];
+int set_trace_switch(const char *arg);
 
 extern TDB_CONTEXT *tdb_ctx;
 extern int dom0_domid;
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 4d735a5951..28c58b5c6d 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1249,6 +1249,12 @@ static long wrl_ndomains;
 static wrl_creditt wrl_reserve; /* [-wrl_config_newdoms_dburst, +_gburst ] */
 static time_t wrl_log_last_warning; /* 0: no previous warning */
 
+#define trace_wrl(...)				\
+do {						\
+	if (trace_flags & TRACE_WRL)		\
+		trace("wrl: " __VA_ARGS__);	\
+} while (0)
+
 void wrl_gettime_now(struct wrl_timestampt *now_wt)
 {
 	struct timespec now_ts;
@@ -1354,12 +1360,9 @@ void wrl_credit_update(struct domain *domain, struct wrl_timestampt now)
 
 	domain->wrl_timestamp = now;
 
-	trace("wrl: dom %4d %6ld  msec  %9ld credit   %9ld reserve"
-	      "  %9ld discard\n",
-	      domain->domid,
-	      msec,
-	      (long)domain->wrl_credit, (long)wrl_reserve,
-	      (long)surplus);
+	trace_wrl("dom %4d %6ld msec %9ld credit %9ld reserve %9ld discard\n",
+		  domain->domid, msec, (long)domain->wrl_credit,
+		  (long)wrl_reserve, (long)surplus);
 }
 
 void wrl_check_timeout(struct domain *domain,
@@ -1391,10 +1394,9 @@ void wrl_check_timeout(struct domain *domain,
 	if (*ptimeout==-1 || wakeup < *ptimeout)
 		*ptimeout = wakeup;
 
-	trace("wrl: domain %u credit=%ld (reserve=%ld) SLEEPING for %d\n",
-	      domain->domid,
-	      (long)domain->wrl_credit, (long)wrl_reserve,
-	      wakeup);
+	trace_wrl("domain %u credit=%ld (reserve=%ld) SLEEPING for %d\n",
+		  domain->domid, (long)domain->wrl_credit, (long)wrl_reserve,
+		  wakeup);
 }
 
 #define WRL_LOG(now, ...) \
@@ -1412,9 +1414,8 @@ void wrl_apply_debit_actual(struct domain *domain)
 	wrl_credit_update(domain, now);
 
 	domain->wrl_credit -= wrl_config_writecost;
-	trace("wrl: domain %u credit=%ld (reserve=%ld)\n",
-	      domain->domid,
-	      (long)domain->wrl_credit, (long)wrl_reserve);
+	trace_wrl("domain %u credit=%ld (reserve=%ld)\n", domain->domid,
+		  (long)domain->wrl_credit, (long)wrl_reserve);
 
 	if (domain->wrl_credit < 0) {
 		if (!domain->wrl_delay_logged) {
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 82e5e66c18..1aa9d3cb3d 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -475,6 +475,7 @@ int do_transaction_start(const void *ctx, struct connection *conn,
 	if (!trans)
 		return ENOMEM;
 
+	trace_create(trans, "transaction");
 	INIT_LIST_HEAD(&trans->accessed);
 	INIT_LIST_HEAD(&trans->changed_domains);
 	trans->conn = conn;
-- 
2.35.3


