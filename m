Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9572F745B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67722.121099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KV9-0000Qx-Rm; Fri, 15 Jan 2021 08:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67722.121099; Fri, 15 Jan 2021 08:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KV9-0000PV-NP; Fri, 15 Jan 2021 08:30:35 +0000
Received: by outflank-mailman (input) for mailman id 67722;
 Fri, 15 Jan 2021 08:30:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KV8-0008Gh-Fe
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 825f997d-4020-4070-9318-28c754ee67cf;
 Fri, 15 Jan 2021 08:30:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63B1CB949;
 Fri, 15 Jan 2021 08:30:07 +0000 (UTC)
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
X-Inumbo-ID: 825f997d-4020-4070-9318-28c754ee67cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpjzbVCuzkXlVPcq4673SAaWIvU9rs1ug3Lwgronb5I=;
	b=S6I6Y+XcwGUyJ03kJ6Hnm3lKlIrBHZd63wbT0fkfEQdKbtIroo6z+Bj2JH+bEsMovyhdck
	baJdrd9r2lFj3T1Nv7evANo5WEpbspY1aylXsZIpRK/PNTvmizjRHufU50Jb7I+jz6Rwvu
	xCA7pk5r/hcTuvAWapaSmGo5ZJx4GjE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v12 20/27] tools/xenstore: evaluate the live update flag when starting
Date: Fri, 15 Jan 2021 09:29:53 +0100
Message-Id: <20210115083000.14186-21-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the live update case several initialization steps of xenstore must
be omitted or modified. Add the proper handling for that.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V4:
- set xprintf = trace in daemon case (Julien Grall)
- only update /tool/xenstored node contents

V7:
- some restructuring to enable keeping event channel fd

V8:
- pass evtfd to domain_init() as parameter (Julien Grall)
- call dom0_init() from main()

V10:
- remove support for remembering binary name (Andrew Cooper)
---
 tools/xenstore/xenstored_control.c |  5 ++++
 tools/xenstore/xenstored_control.h |  1 +
 tools/xenstore/xenstored_core.c    | 44 +++++++++++++++++++++---------
 tools/xenstore/xenstored_domain.c  | 26 ++++++++----------
 tools/xenstore/xenstored_domain.h  |  3 +-
 tools/xenstore/xenstored_posix.c   |  1 -
 6 files changed, 51 insertions(+), 29 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 63b1f9a8b7..5151c1448e 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -453,6 +453,11 @@ static const char *lu_dump_state(const void *ctx, struct connection *conn)
 	return ret;
 }
 
+void lu_read_state(void)
+{
+	xprintf("live-update: read state\n");
+}
+
 static const char *lu_activate_binary(const void *ctx)
 {
 	return "Not yet implemented.";
diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstored_control.h
index 207e0a6fa3..aac61f0590 100644
--- a/tools/xenstore/xenstored_control.h
+++ b/tools/xenstore/xenstored_control.h
@@ -17,3 +17,4 @@
 */
 
 int do_control(struct connection *conn, struct buffered_data *in);
+void lu_read_state(void);
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 2ef4534de7..4d88aeba3d 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1687,9 +1687,10 @@ static void tdb_logger(TDB_CONTEXT *tdb, int level, const char * fmt, ...)
 	}
 }
 
-static void setup_structure(void)
+static void setup_structure(bool live_update)
 {
 	char *tdbname;
+
 	tdbname = talloc_strdup(talloc_autofree_context(), xs_daemon_tdb());
 	if (!tdbname)
 		barf_perror("Could not create tdbname");
@@ -1703,14 +1704,17 @@ static void setup_structure(void)
 	if (!tdb_ctx)
 		barf_perror("Could not create tdb file %s", tdbname);
 
-	manual_node("/", "tool");
-	manual_node("/tool", "xenstored");
-	manual_node("/tool/xenstored", NULL);
+	if (live_update)
+		manual_node("/", NULL);
+	else {
+		manual_node("/", "tool");
+		manual_node("/tool", "xenstored");
+		manual_node("/tool/xenstored", NULL);
+	}
 
 	check_store();
 }
 
-
 static unsigned int hash_from_key_fn(void *k)
 {
 	char *str = k;
@@ -2116,7 +2120,8 @@ int main(int argc, char *argv[])
 
 	if (dofork) {
 		openlog("xenstored", 0, LOG_DAEMON);
-		daemonize();
+		if (!live_update)
+			daemonize();
 	}
 	if (pidfile)
 		write_pidfile(pidfile);
@@ -2131,17 +2136,20 @@ int main(int argc, char *argv[])
 	talloc_enable_null_tracking();
 
 #ifndef NO_SOCKETS
-	init_sockets();
+	if (!live_update)
+		init_sockets();
 #endif
 
 	init_pipe(reopen_log_pipe);
 
 	/* Setup the database */
-	setup_structure();
+	setup_structure(live_update);
 
 	/* Listen to hypervisor. */
-	if (!no_domain_init)
-		domain_init();
+	if (!no_domain_init && !live_update) {
+		domain_init(-1);
+		dom0_init();
+	}
 
 	if (outputpid) {
 		printf("%ld\n", (long)getpid());
@@ -2149,13 +2157,21 @@ int main(int argc, char *argv[])
 	}
 
 	/* redirect to /dev/null now we're ready to accept connections */
-	if (dofork)
+	if (dofork && !live_update)
 		finish_daemonize();
+#ifndef __MINIOS__
+	if (dofork)
+		xprintf = trace;
+#endif
 
 	signal(SIGHUP, trigger_reopen_log);
 	if (tracefile)
 		tracefile = talloc_strdup(NULL, tracefile);
 
+	/* Read state in case of live update. */
+	if (live_update)
+		lu_read_state();
+
 	/* Get ready to listen to the tools. */
 	initialize_fds(&sock_pollfd_idx, &timeout);
 
@@ -2163,8 +2179,10 @@ int main(int argc, char *argv[])
 	xenbus_notify_running();
 
 #if defined(XEN_SYSTEMD_ENABLED)
-	sd_notify(1, "READY=1");
-	fprintf(stderr, SD_NOTICE "xenstored is ready\n");
+	if (!live_update) {
+		sd_notify(1, "READY=1");
+		fprintf(stderr, SD_NOTICE "xenstored is ready\n");
+	}
 #endif
 
 	/* Main loop. */
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 71b078caf3..775546757b 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -706,29 +706,23 @@ bool check_perms_special(const char *name, struct connection *conn)
 	return perm_for_conn(conn, p) & XS_PERM_READ;
 }
 
-static int dom0_init(void) 
-{ 
+void dom0_init(void)
+{
 	evtchn_port_t port;
 	struct domain *dom0;
 
 	port = xenbus_evtchn();
 	if (port == -1)
-		return -1;
+		barf_perror("Failed to initialize dom0 port");
 
 	dom0 = introduce_domain(NULL, xenbus_master_domid(), port);
 	if (!dom0)
-		return -1;
+		barf_perror("Failed to initialize dom0");
 
 	xenevtchn_notify(xce_handle, dom0->port);
-
-	if (set_dom_perms_default(&dom_release_perms) ||
-	    set_dom_perms_default(&dom_introduce_perms))
-		return -1;
-
-	return 0; 
 }
 
-void domain_init(void)
+void domain_init(int evtfd)
 {
 	int rc;
 
@@ -758,13 +752,17 @@ void domain_init(void)
 
 	talloc_set_destructor(xgt_handle, close_xgt_handle);
 
-	xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
+	if (evtfd < 0)
+		xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
+	else
+		xce_handle = xenevtchn_fdopen(NULL, evtfd, 0);
 
 	if (xce_handle == NULL)
 		barf_perror("Failed to open evtchn device");
 
-	if (dom0_init() != 0) 
-		barf_perror("Failed to initialize dom0 state"); 
+	if (set_dom_perms_default(&dom_release_perms) ||
+	    set_dom_perms_default(&dom_introduce_perms))
+		barf_perror("Failed to set special permissions");
 
 	if ((rc = xenevtchn_bind_virq(xce_handle, VIRQ_DOM_EXC)) == -1)
 		barf_perror("Failed to bind to domain exception virq port");
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 413b974375..b20269b038 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -42,7 +42,8 @@ int do_get_domain_path(struct connection *conn, struct buffered_data *in);
 /* Allow guest to reset all watches */
 int do_reset_watches(struct connection *conn, struct buffered_data *in);
 
-void domain_init(void);
+void domain_init(int evtfd);
+void dom0_init(void);
 
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn);
diff --git a/tools/xenstore/xenstored_posix.c b/tools/xenstore/xenstored_posix.c
index ae3e63e07f..48c37ffe3e 100644
--- a/tools/xenstore/xenstored_posix.c
+++ b/tools/xenstore/xenstored_posix.c
@@ -85,7 +85,6 @@ void finish_daemonize(void)
 	dup2(devnull, STDOUT_FILENO);
 	dup2(devnull, STDERR_FILENO);
 	close(devnull);
-	xprintf = trace;
 }
 
 void init_pipe(int reopen_log_pipe[2])
-- 
2.26.2


