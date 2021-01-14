Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5CE2F6505
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:50:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67290.119989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04tH-0006mZ-MS; Thu, 14 Jan 2021 15:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67290.119989; Thu, 14 Jan 2021 15:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04tH-0006m6-IL; Thu, 14 Jan 2021 15:50:27 +0000
Received: by outflank-mailman (input) for mailman id 67290;
 Thu, 14 Jan 2021 15:50:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04iL-0002Sh-K8
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:39:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0c1634a-c2ba-430f-9cff-1b4cd6f169cd;
 Thu, 14 Jan 2021 15:38:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7312AAC24;
 Thu, 14 Jan 2021 15:38:10 +0000 (UTC)
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
X-Inumbo-ID: b0c1634a-c2ba-430f-9cff-1b4cd6f169cd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1D5oDSY8IZ5xFhSEZYcvdGWsAxGnd0iV4qxpJqrypD8=;
	b=AuAWNAilptXbhINgpMj6X/5mAzC4So8DCJ5V7bwG+8o+T7S5aYZJhD3oNhUDFdLucI8QkG
	XDQL/AQ+NfLfMnw72Fdirp/Qec1Q2G781KaKoqMLXrpLYuPpYYaCxXwasaHs/5kXDo7sP0
	j5uG1e+pTL+jAICH++hsYi7bEyQFb1E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien.grall@amazon.com>
Subject: [PATCH v11 18/27] tools/xenstore: handle CLOEXEC flag for local files and pipes
Date: Thu, 14 Jan 2021 16:37:54 +0100
Message-Id: <20210114153803.2591-19-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
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
---
 tools/xenstore/xenstored_control.c |  6 ++++++
 tools/xenstore/xenstored_core.c    |  6 ++++--
 tools/xenstore/xenstored_core.h    |  8 ++++++++
 tools/xenstore/xenstored_domain.c  |  2 +-
 tools/xenstore/xenstored_posix.c   | 12 ++++++++++++
 5 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 206948d7e5..25b407e153 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -41,6 +41,7 @@ Interactive commands for Xen Store Daemon.
 #define MAP_ANONYMOUS MAP_ANON
 #endif
 
+#ifndef NO_LIVE_UPDATE
 struct live_update {
 	/* For verification the correct connection is acting. */
 	struct connection *conn;
@@ -90,6 +91,7 @@ static const char *lu_begin(struct connection *conn)
 
 	return NULL;
 }
+#endif
 
 struct cmd_s {
 	char *cmd;
@@ -214,6 +216,7 @@ static int do_control_print(void *ctx, struct connection *conn,
 	return 0;
 }
 
+#ifndef NO_LIVE_UPDATE
 static const char *lu_abort(const void *ctx, struct connection *conn)
 {
 	syslog(LOG_INFO, "live-update: abort\n");
@@ -575,6 +578,7 @@ static int do_control_lu(void *ctx, struct connection *conn,
 	send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
 	return 0;
 }
+#endif
 
 static int do_control_help(void *, struct connection *, char **, int);
 
@@ -582,6 +586,7 @@ static struct cmd_s cmds[] = {
 	{ "check", do_control_check, "" },
 	{ "log", do_control_log, "on|off" },
 
+#ifndef NO_LIVE_UPDATE
 	/*
 	 * The parameters are those of the xenstore-control utility!
 	 * Depending on environment (Mini-OS or daemon) the live-update
@@ -601,6 +606,7 @@ static struct cmd_s cmds[] = {
 	{ "live-update", do_control_lu,
 		"[-c <cmdline>] [-F] [-t <timeout>] <file>\n"
 		"    Default timeout is 60 seconds.", 4 },
+#endif
 #ifdef __MINIOS__
 	{ "memreport", do_control_memreport, "" },
 #else
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 97e7277791..b0656eb3e4 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -198,7 +198,8 @@ void reopen_log(void)
 	if (tracefile) {
 		close_log();
 
-		tracefd = open(tracefile, O_WRONLY|O_CREAT|O_APPEND, 0600);
+		tracefd = open(tracefile,
+			       O_WRONLY | O_CREAT | O_APPEND | O_CLOEXEC, 0600);
 
 		if (tracefd < 0)
 			perror("Could not open tracefile");
@@ -1689,7 +1690,8 @@ static void setup_structure(void)
 	if (!(tdb_flags & TDB_INTERNAL))
 		unlink(tdbname);
 
-	tdb_ctx = tdb_open_ex(tdbname, 7919, tdb_flags, O_RDWR|O_CREAT|O_EXCL,
+	tdb_ctx = tdb_open_ex(tdbname, 7919, tdb_flags,
+			      O_RDWR | O_CREAT | O_EXCL | O_CLOEXEC,
 			      0640, &tdb_logger, NULL);
 	if (!tdb_ctx)
 		barf_perror("Could not create tdb file %s", tdbname);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 22287ddfe9..c7567eaf0b 100644
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


