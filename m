Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E029F2DB192
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54559.94999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJf-0007E5-Gt; Tue, 15 Dec 2020 16:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54559.94999; Tue, 15 Dec 2020 16:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJf-0007Cl-CC; Tue, 15 Dec 2020 16:36:47 +0000
Received: by outflank-mailman (input) for mailman id 54559;
 Tue, 15 Dec 2020 16:36:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJd-000667-HH
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:36:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38ce364d-e14c-46cd-9ae6-d9967ea60f23;
 Tue, 15 Dec 2020 16:36:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17BD8B279;
 Tue, 15 Dec 2020 16:36:11 +0000 (UTC)
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
X-Inumbo-ID: 38ce364d-e14c-46cd-9ae6-d9967ea60f23
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvZq9ug5KV3ON4auQi7iEvSAASMBEbL1LsbwM9uHXmI=;
	b=B7nClCsdmrLKxGBJ6gd7duXA25B84ZeoSzUu6hb/c+CMLVyISFs+6WNxo5kNJToq/IGVFk
	Ihz4nunmvkKBez8mZ0CY5v7y9AJNNzYUVQLsVoj/8yc54PrSJ3UJ7MD2/DNeBtETf7m3Tp
	nRnEW++D8SJzJ0z6n68OrOqmCvlTPKY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien.grall@amazon.com>
Subject: [PATCH v10 16/25] tools/xenstore: handle CLOEXEC flag for local files and pipes
Date: Tue, 15 Dec 2020 17:35:54 +0100
Message-Id: <20201215163603.21700-17-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For support of live update the locally used files need to have the
"close on exec" flag set. Fortunately the used Xen libraries are
already doing this, so only the logging and tdb related files and
pipes are affected. openlog() has the close on exec attribute, too.

In order to be able to keep the event channels open specify the
XENEVTCHN_NO_CLOEXEC flag when calling xenevtchn_open().

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <julien.grall@amazon.com>
---
V4:
- disable LU in case of O_CLOEXEC not supported (Julien Grall)

V5:
- add comment (Paul Durrant)

V7:
- set XENEVTCHN_NO_CLOEXEC

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_control.c |  6 ++++++
 tools/xenstore/xenstored_core.c    |  6 ++++--
 tools/xenstore/xenstored_core.h    |  8 ++++++++
 tools/xenstore/xenstored_domain.c  |  2 +-
 tools/xenstore/xenstored_posix.c   | 12 ++++++++++++
 5 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 38550a559e..437276de8d 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -41,6 +41,7 @@ Interactive commands for Xen Store Daemon.
 #define MAP_ANONYMOUS MAP_ANON
 #endif
 
+#ifndef NO_LIVE_UPDATE
 struct live_update {
 	/* For verification the correct connection is acting. */
 	struct connection *conn;
@@ -85,6 +86,7 @@ static const char *lu_begin(struct connection *conn)
 
 	return NULL;
 }
+#endif
 
 struct cmd_s {
 	char *cmd;
@@ -209,6 +211,7 @@ static int do_control_print(void *ctx, struct connection *conn,
 	return 0;
 }
 
+#ifndef NO_LIVE_UPDATE
 static const char *lu_abort(const void *ctx, struct connection *conn)
 {
 	syslog(LOG_INFO, "live-update: abort\n");
@@ -522,6 +525,7 @@ static int do_control_lu(void *ctx, struct connection *conn,
 	send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
 	return 0;
 }
+#endif
 
 static int do_control_help(void *, struct connection *, char **, int);
 
@@ -529,6 +533,7 @@ static struct cmd_s cmds[] = {
 	{ "check", do_control_check, "" },
 	{ "log", do_control_log, "on|off" },
 
+#ifndef NO_LIVE_UPDATE
 	/*
 	 * The parameters are those of the xenstore-control utility!
 	 * Depending on environment (Mini-OS or daemon) the live-update
@@ -548,6 +553,7 @@ static struct cmd_s cmds[] = {
 	{ "live-update", do_control_lu,
 		"[-c <cmdline>] [-F] [-t <timeout>] <file>\n"
 		"    Default timeout is 60 seconds.", 4 },
+#endif
 #ifdef __MINIOS__
 	{ "memreport", do_control_memreport, "" },
 #else
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 064109c393..0f4e10815a 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -197,7 +197,8 @@ void reopen_log(void)
 	if (tracefile) {
 		close_log();
 
-		tracefd = open(tracefile, O_WRONLY|O_CREAT|O_APPEND, 0600);
+		tracefd = open(tracefile,
+			       O_WRONLY | O_CREAT | O_APPEND | O_CLOEXEC, 0600);
 
 		if (tracefd < 0)
 			perror("Could not open tracefile");
@@ -1646,7 +1647,8 @@ static void setup_structure(void)
 	if (!(tdb_flags & TDB_INTERNAL))
 		unlink(tdbname);
 
-	tdb_ctx = tdb_open_ex(tdbname, 7919, tdb_flags, O_RDWR|O_CREAT|O_EXCL,
+	tdb_ctx = tdb_open_ex(tdbname, 7919, tdb_flags,
+			      O_RDWR | O_CREAT | O_EXCL | O_CLOEXEC,
 			      0640, &tdb_logger, NULL);
 	if (!tdb_ctx)
 		barf_perror("Could not create tdb file %s", tdbname);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 32b306e161..e40e0e6806 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -35,6 +35,14 @@
 #include "tdb.h"
 #include "hashtable.h"
 
+#ifndef O_CLOEXEC
+#define O_CLOEXEC 0
+/* O_CLOEXEC support is needed for Live Update in the daemon case. */
+#ifndef __MINIOS__
+#define NO_LIVE_UPDATE
+#endif
+#endif
+
 /* DEFAULT_BUFFER_SIZE should be large enough for each errno string. */
 #define DEFAULT_BUFFER_SIZE 16
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 919a4d98cf..38d250fbed 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -743,7 +743,7 @@ void domain_init(void)
 
 	talloc_set_destructor(xgt_handle, close_xgt_handle);
 
-	xce_handle = xenevtchn_open(NULL, 0);
+	xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
 
 	if (xce_handle == NULL)
 		barf_perror("Failed to open evtchn device");
diff --git a/tools/xenstore/xenstored_posix.c b/tools/xenstore/xenstored_posix.c
index 1f9603fea2..ae3e63e07f 100644
--- a/tools/xenstore/xenstored_posix.c
+++ b/tools/xenstore/xenstored_posix.c
@@ -90,9 +90,21 @@ void finish_daemonize(void)
 
 void init_pipe(int reopen_log_pipe[2])
 {
+	int flags;
+	unsigned int i;
+
 	if (pipe(reopen_log_pipe)) {
 		barf_perror("pipe");
 	}
+
+	for (i = 0; i < 2; i++) {
+		flags = fcntl(reopen_log_pipe[i], F_GETFD);
+		if (flags < 0)
+			barf_perror("pipe get flags");
+		flags |= FD_CLOEXEC;
+		if (fcntl(reopen_log_pipe[i],  F_SETFD, flags) < 0)
+			barf_perror("pipe set flags");
+	}
 }
 
 void unmap_xenbus(void *interface)
-- 
2.26.2


