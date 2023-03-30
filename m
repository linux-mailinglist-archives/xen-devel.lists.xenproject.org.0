Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C2C6CFF1D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516527.800785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pho0D-00025i-SY; Thu, 30 Mar 2023 08:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516527.800785; Thu, 30 Mar 2023 08:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pho0D-00021d-PB; Thu, 30 Mar 2023 08:51:25 +0000
Received: by outflank-mailman (input) for mailman id 516527;
 Thu, 30 Mar 2023 08:51:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pho0C-0005Qp-Nk
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:51:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b916d88-ced8-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 10:51:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EE52A1FEAA;
 Thu, 30 Mar 2023 08:51:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9BB2138FF;
 Thu, 30 Mar 2023 08:51:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NbzmK4lNJWR3IwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:51:21 +0000
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
X-Inumbo-ID: 0b916d88-ced8-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680166281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HVRwBPRCNdBEJy67m+yudS9lbg/8d/q4E24a/0jlcgQ=;
	b=TyxL24SGpH8Y0jnXq6r4e3ftuV/ZYXbGpu2e0D06cGazE/vZLBU7JEHWtGfe8BVSL1vO4e
	mGf7A3cteP8pPVuQoJlKgwEUSYa8jDpyn/TQdBvmUZqO/GGuBBpaJbwLJ8rvCAYFpq6y6G
	HUIwcBQSQ1Jl3NRrAMyGFJc63+sCqW4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 12/13] tools/xenstore: split out rest of live update control code
Date: Thu, 30 Mar 2023 10:50:10 +0200
Message-Id: <20230330085011.9170-13-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330085011.9170-1-jgross@suse.com>
References: <20230330085011.9170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the rest of live update related code from xenstored_control.c to
a dedicated new source file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/Makefile.common     |   2 +-
 tools/xenstore/xenstored_control.c | 409 -----------------------------
 tools/xenstore/xenstored_control.h |   8 -
 tools/xenstore/xenstored_core.c    |   1 +
 tools/xenstore/xenstored_lu.c      | 401 ++++++++++++++++++++++++++++
 tools/xenstore/xenstored_lu.h      |  25 ++
 6 files changed, 428 insertions(+), 418 deletions(-)
 create mode 100644 tools/xenstore/xenstored_lu.c

diff --git a/tools/xenstore/Makefile.common b/tools/xenstore/Makefile.common
index dffab34603..2befede03d 100644
--- a/tools/xenstore/Makefile.common
+++ b/tools/xenstore/Makefile.common
@@ -1,7 +1,7 @@
 # Makefile shared with stubdom
 
 XENSTORED_OBJS-y := xenstored_core.o xenstored_watch.o xenstored_domain.o
-XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o
+XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o xenstored_lu.o
 XENSTORED_OBJS-y += xs_lib.o talloc.o utils.o tdb.o hashtable.o
 
 XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o xenstored_lu_daemon.o
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index c9e5766954..4d66e61b2c 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -16,21 +16,13 @@
     along with this program; If not, see <http://www.gnu.org/licenses/>.
 */
 
-#include <assert.h>
-#include <ctype.h>
 #include <errno.h>
 #include <stdarg.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <syslog.h>
-#include <time.h>
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include <fcntl.h>
 #include <unistd.h>
-#include <xenctrl.h>
 
 #include "utils.h"
 #include "talloc.h"
@@ -39,69 +31,6 @@
 #include "xenstored_control.h"
 #include "xenstored_domain.h"
 #include "xenstored_lu.h"
-#include "xenstored_watch.h"
-
-#ifndef NO_LIVE_UPDATE
-struct live_update *lu_status;
-
-const char *lu_begin(struct connection *conn)
-{
-	if (lu_status)
-		return "live-update session already active.";
-
-	lu_status = talloc_zero(conn, struct live_update);
-	if (!lu_status)
-		return "Allocation failure.";
-	lu_status->conn = conn;
-	talloc_set_destructor(lu_status, lu_destroy);
-
-	return NULL;
-}
-
-struct connection *lu_get_connection(void)
-{
-	return lu_status ? lu_status->conn : NULL;
-}
-
-unsigned int lu_write_response(FILE *fp)
-{
-	struct xsd_sockmsg msg;
-
-	assert(lu_status);
-
-	msg = lu_status->in->hdr.msg;
-
-	msg.len = sizeof("OK");
-	if (fp && fwrite(&msg, sizeof(msg), 1, fp) != 1)
-		return 0;
-	if (fp && fwrite("OK", msg.len, 1, fp) != 1)
-		return 0;
-
-	return sizeof(msg) + msg.len;
-}
-
-bool lu_is_pending(void)
-{
-	return lu_status != NULL;
-}
-
-#else
-struct connection *lu_get_connection(void)
-{
-	return NULL;
-}
-
-unsigned int lu_write_response(FILE *fp)
-{
-	/* Unsupported */
-	return 0;
-}
-
-bool lu_is_pending(void)
-{
-	return false;
-}
-#endif
 
 struct cmd_s {
 	char *cmd;
@@ -352,344 +281,6 @@ static int do_control_print(const void *ctx, struct connection *conn,
 	return 0;
 }
 
-#ifndef NO_LIVE_UPDATE
-static const char *lu_abort(const void *ctx, struct connection *conn)
-{
-	syslog(LOG_INFO, "live-update: abort\n");
-
-	if (!lu_status)
-		return "No live-update session active.";
-
-	/* Destructor will do the real abort handling. */
-	talloc_free(lu_status);
-
-	return NULL;
-}
-
-static const char *lu_cmdline(const void *ctx, struct connection *conn,
-			      const char *cmdline)
-{
-	syslog(LOG_INFO, "live-update: cmdline %s\n", cmdline);
-
-	if (!lu_status || lu_status->conn != conn)
-		return "Not in live-update session.";
-
-	lu_status->cmdline = talloc_strdup(lu_status, cmdline);
-	if (!lu_status->cmdline)
-		return "Allocation failure.";
-
-	return NULL;
-}
-
-static bool lu_check_lu_allowed(void)
-{
-	struct connection *conn;
-	time_t now = time(NULL);
-	unsigned int ta_total = 0, ta_long = 0;
-
-	list_for_each_entry(conn, &connections, list) {
-		if (conn->ta_start_time) {
-			ta_total++;
-			if (now - conn->ta_start_time >= lu_status->timeout)
-				ta_long++;
-		}
-	}
-
-	/*
-	 * Allow LiveUpdate if one of the following conditions is met:
-	 *	- There is no active transactions
-	 *	- All transactions are long running (e.g. they have been
-	 *	active for more than lu_status->timeout sec) and the admin as
-	 *	requested to force the operation.
-	 */
-	return ta_total ? (lu_status->force && ta_long == ta_total) : true;
-}
-
-static const char *lu_reject_reason(const void *ctx)
-{
-	char *ret = NULL;
-	struct connection *conn;
-	time_t now = time(NULL);
-
-	list_for_each_entry(conn, &connections, list) {
-		if (conn->ta_start_time &&
-		    (now - conn->ta_start_time >= lu_status->timeout)) {
-			ret = talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
-					      ret ? : "Domains with long running transactions:",
-					      conn->id,
-					      now - conn->ta_start_time);
-		}
-	}
-
-	return ret ? (const char *)ret : "Overlapping transactions";
-}
-
-static const char *lu_dump_state(const void *ctx, struct connection *conn)
-{
-	FILE *fp;
-	const char *ret;
-	struct xs_state_record_header end;
-	struct xs_state_preamble pre;
-
-	fp = lu_dump_open(ctx);
-	if (!fp)
-		return "Dump state open error";
-
-	memcpy(pre.ident, XS_STATE_IDENT, sizeof(pre.ident));
-	pre.version = htobe32(XS_STATE_VERSION);
-	pre.flags = XS_STATE_FLAGS;
-	if (fwrite(&pre, sizeof(pre), 1, fp) != 1) {
-		ret = "Dump write error";
-		goto out;
-	}
-
-	ret = dump_state_global(fp);
-	if (ret)
-		goto out;
-	ret = dump_state_connections(fp);
-	if (ret)
-		goto out;
-	ret = dump_state_nodes(fp, ctx);
-	if (ret)
-		goto out;
-
-	end.type = XS_STATE_TYPE_END;
-	end.length = 0;
-	if (fwrite(&end, sizeof(end), 1, fp) != 1)
-		ret = "Dump write error";
-
- out:
-	lu_dump_close(fp);
-
-	return ret;
-}
-
-void lu_read_state(void)
-{
-	struct lu_dump_state state = {};
-	struct xs_state_record_header *head;
-	void *ctx = talloc_new(NULL); /* Work context for subfunctions. */
-	struct xs_state_preamble *pre;
-
-	syslog(LOG_INFO, "live-update: read state\n");
-	lu_get_dump_state(&state);
-	if (state.size == 0)
-		barf_perror("No state found after live-update");
-
-	pre = state.buf;
-	if (memcmp(pre->ident, XS_STATE_IDENT, sizeof(pre->ident)) ||
-	    pre->version != htobe32(XS_STATE_VERSION) ||
-	    pre->flags != XS_STATE_FLAGS)
-		barf("Unknown record identifier");
-	for (head = state.buf + sizeof(*pre);
-	     head->type != XS_STATE_TYPE_END &&
-		(void *)head - state.buf < state.size;
-	     head = (void *)head + sizeof(*head) + head->length) {
-		switch (head->type) {
-		case XS_STATE_TYPE_GLOBAL:
-			read_state_global(ctx, head + 1);
-			break;
-		case XS_STATE_TYPE_CONN:
-			read_state_connection(ctx, head + 1);
-			break;
-		case XS_STATE_TYPE_WATCH:
-			read_state_watch(ctx, head + 1);
-			break;
-		case XS_STATE_TYPE_TA:
-			xprintf("live-update: ignore transaction record\n");
-			break;
-		case XS_STATE_TYPE_NODE:
-			read_state_node(ctx, head + 1);
-			break;
-		default:
-			xprintf("live-update: unknown state record %08x\n",
-				head->type);
-			break;
-		}
-	}
-
-	lu_close_dump_state(&state);
-
-	talloc_free(ctx);
-
-	/*
-	 * We may have missed the VIRQ_DOM_EXC notification and a domain may
-	 * have died while we were live-updating. So check all the domains are
-	 * still alive.
-	 */
-	check_domains();
-}
-
-static const char *lu_activate_binary(const void *ctx)
-{
-	int argc;
-	char **argv;
-	unsigned int i;
-
-	if (lu_status->cmdline) {
-		argc = 4;   /* At least one arg + progname + "-U" + NULL. */
-		for (i = 0; lu_status->cmdline[i]; i++)
-			if (isspace(lu_status->cmdline[i]))
-				argc++;
-		argv = talloc_array(ctx, char *, argc);
-		if (!argv)
-			return "Allocation failure.";
-
-		i = 0;
-		argc = 1;
-		argv[1] = strtok(lu_status->cmdline, " \t");
-		while (argv[argc]) {
-			if (!strcmp(argv[argc], "-U"))
-				i = 1;
-			argc++;
-			argv[argc] = strtok(NULL, " \t");
-		}
-
-		if (!i) {
-			argv[argc++] = "-U";
-			argv[argc] = NULL;
-		}
-	} else {
-		for (i = 0; i < orig_argc; i++)
-			if (!strcmp(orig_argv[i], "-U"))
-				break;
-
-		argc = orig_argc;
-		argv = talloc_array(ctx, char *, orig_argc + 2);
-		if (!argv)
-			return "Allocation failure.";
-
-		memcpy(argv, orig_argv, orig_argc * sizeof(*argv));
-		if (i == orig_argc)
-			argv[argc++] = "-U";
-		argv[argc] = NULL;
-	}
-
-	domain_deinit();
-
-	return lu_exec(ctx, argc, argv);
-}
-
-static bool do_lu_start(struct delayed_request *req)
-{
-	time_t now = time(NULL);
-	const char *ret;
-	struct buffered_data *saved_in;
-	struct connection *conn = req->data;
-
-	/*
-	 * Cancellation may have been requested asynchronously. In this
-	 * case, lu_status will be NULL.
-	 */
-	if (!lu_status) {
-		ret = "Cancellation was requested";
-		goto out;
-	}
-
-	assert(lu_status->conn == conn);
-
-	if (!lu_check_lu_allowed()) {
-		if (now < lu_status->started_at + lu_status->timeout)
-			return false;
-		if (!lu_status->force) {
-			ret = lu_reject_reason(req);
-			goto out;
-		}
-	}
-
-	assert(req->in == lu_status->in);
-	/* Dump out internal state, including "OK" for live update. */
-	ret = lu_dump_state(req->in, conn);
-	if (!ret) {
-		/* Perform the activation of new binary. */
-		ret = lu_activate_binary(req->in);
-	}
-
-	/* We will reach this point only in case of failure. */
- out:
-	/*
-	 * send_reply() will send the response for conn->in. Save the current
-	 * conn->in and restore it afterwards.
-	 */
-	saved_in = conn->in;
-	conn->in = req->in;
-	send_reply(conn, XS_CONTROL, ret, strlen(ret) + 1);
-	conn->in = saved_in;
-	talloc_free(lu_status);
-
-	return true;
-}
-
-static const char *lu_start(const void *ctx, struct connection *conn,
-			    bool force, unsigned int to)
-{
-	syslog(LOG_INFO, "live-update: start, force=%d, to=%u\n", force, to);
-
-	if (!lu_status || lu_status->conn != conn)
-		return "Not in live-update session.";
-
-#ifdef __MINIOS__
-	if (lu_status->kernel_size != lu_status->kernel_off)
-		return "Kernel not complete.";
-#endif
-
-	lu_status->force = force;
-	lu_status->timeout = to;
-	lu_status->started_at = time(NULL);
-	lu_status->in = conn->in;
-
-	errno = delay_request(conn, conn->in, do_lu_start, conn, false);
-
-	return NULL;
-}
-
-static int do_control_lu(const void *ctx, struct connection *conn,
-			 char **vec, int num)
-{
-	const char *ret = NULL;
-	unsigned int i;
-	bool force = false;
-	unsigned int to = 0;
-
-	if (num < 1)
-		return EINVAL;
-
-	if (!strcmp(vec[0], "-a")) {
-		if (num == 1)
-			ret = lu_abort(ctx, conn);
-		else
-			return EINVAL;
-	} else if (!strcmp(vec[0], "-c")) {
-		if (num == 2)
-			ret = lu_cmdline(ctx, conn, vec[1]);
-		else
-			return EINVAL;
-	} else if (!strcmp(vec[0], "-s")) {
-		for (i = 1; i < num; i++) {
-			if (!strcmp(vec[i], "-F"))
-				force = true;
-			else if (!strcmp(vec[i], "-t") && i < num - 1) {
-				i++;
-				to = atoi(vec[i]);
-			} else
-				return EINVAL;
-		}
-		ret = lu_start(ctx, conn, force, to);
-		if (!ret)
-			return errno;
-	} else {
-		ret = lu_arch(ctx, conn, vec, num);
-		if (!ret && errno)
-			return errno;
-	}
-
-	if (!ret)
-		ret = "OK";
-	send_reply(conn, XS_CONTROL, ret, strlen(ret) + 1);
-	return 0;
-}
-#endif
-
 static int do_control_help(const void *, struct connection *, char **, int);
 
 static struct cmd_s cmds[] = {
diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstored_control.h
index a8cb76559b..faa955968d 100644
--- a/tools/xenstore/xenstored_control.h
+++ b/tools/xenstore/xenstored_control.h
@@ -18,11 +18,3 @@
 
 int do_control(const void *ctx, struct connection *conn,
 	       struct buffered_data *in);
-void lu_read_state(void);
-
-struct connection *lu_get_connection(void);
-
-/* Write the "OK" response for the live-update command */
-unsigned int lu_write_response(FILE *fp);
-
-bool lu_is_pending(void);
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index e16d0a6d53..3842e122ce 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -52,6 +52,7 @@
 #include "xenstored_transaction.h"
 #include "xenstored_domain.h"
 #include "xenstored_control.h"
+#include "xenstored_lu.h"
 #include "tdb.h"
 
 #ifndef NO_SOCKETS
diff --git a/tools/xenstore/xenstored_lu.c b/tools/xenstore/xenstored_lu.c
new file mode 100644
index 0000000000..cfd6d5cee2
--- /dev/null
+++ b/tools/xenstore/xenstored_lu.c
@@ -0,0 +1,401 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * Live Update interfaces for Xen Store Daemon.
+ * Copyright (C) 2022 Juergen Gross, SUSE LLC
+ */
+
+#include <assert.h>
+#include <ctype.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <syslog.h>
+#include <time.h>
+
+#include "talloc.h"
+#include "xs_lib.h"
+#include "xenstored_core.h"
+#include "xenstored_domain.h"
+#include "xenstored_lu.h"
+#include "xenstored_watch.h"
+
+#ifndef NO_LIVE_UPDATE
+struct live_update *lu_status;
+
+const char *lu_begin(struct connection *conn)
+{
+	if (lu_status)
+		return "live-update session already active.";
+
+	lu_status = talloc_zero(conn, struct live_update);
+	if (!lu_status)
+		return "Allocation failure.";
+	lu_status->conn = conn;
+	talloc_set_destructor(lu_status, lu_destroy);
+
+	return NULL;
+}
+
+struct connection *lu_get_connection(void)
+{
+	return lu_status ? lu_status->conn : NULL;
+}
+
+unsigned int lu_write_response(FILE *fp)
+{
+	struct xsd_sockmsg msg;
+
+	assert(lu_status);
+
+	msg = lu_status->in->hdr.msg;
+
+	msg.len = sizeof("OK");
+	if (fp && fwrite(&msg, sizeof(msg), 1, fp) != 1)
+		return 0;
+	if (fp && fwrite("OK", msg.len, 1, fp) != 1)
+		return 0;
+
+	return sizeof(msg) + msg.len;
+}
+
+bool lu_is_pending(void)
+{
+	return lu_status != NULL;
+}
+
+void lu_read_state(void)
+{
+	struct lu_dump_state state = {};
+	struct xs_state_record_header *head;
+	void *ctx = talloc_new(NULL); /* Work context for subfunctions. */
+	struct xs_state_preamble *pre;
+
+	syslog(LOG_INFO, "live-update: read state\n");
+	lu_get_dump_state(&state);
+	if (state.size == 0)
+		barf_perror("No state found after live-update");
+
+	pre = state.buf;
+	if (memcmp(pre->ident, XS_STATE_IDENT, sizeof(pre->ident)) ||
+	    pre->version != htobe32(XS_STATE_VERSION) ||
+	    pre->flags != XS_STATE_FLAGS)
+		barf("Unknown record identifier");
+	for (head = state.buf + sizeof(*pre);
+	     head->type != XS_STATE_TYPE_END &&
+		(void *)head - state.buf < state.size;
+	     head = (void *)head + sizeof(*head) + head->length) {
+		switch (head->type) {
+		case XS_STATE_TYPE_GLOBAL:
+			read_state_global(ctx, head + 1);
+			break;
+		case XS_STATE_TYPE_CONN:
+			read_state_connection(ctx, head + 1);
+			break;
+		case XS_STATE_TYPE_WATCH:
+			read_state_watch(ctx, head + 1);
+			break;
+		case XS_STATE_TYPE_TA:
+			xprintf("live-update: ignore transaction record\n");
+			break;
+		case XS_STATE_TYPE_NODE:
+			read_state_node(ctx, head + 1);
+			break;
+		default:
+			xprintf("live-update: unknown state record %08x\n",
+				head->type);
+			break;
+		}
+	}
+
+	lu_close_dump_state(&state);
+
+	talloc_free(ctx);
+
+	/*
+	 * We may have missed the VIRQ_DOM_EXC notification and a domain may
+	 * have died while we were live-updating. So check all the domains are
+	 * still alive.
+	 */
+	check_domains();
+}
+
+static const char *lu_abort(const void *ctx, struct connection *conn)
+{
+	syslog(LOG_INFO, "live-update: abort\n");
+
+	if (!lu_status)
+		return "No live-update session active.";
+
+	/* Destructor will do the real abort handling. */
+	talloc_free(lu_status);
+
+	return NULL;
+}
+
+static const char *lu_cmdline(const void *ctx, struct connection *conn,
+			      const char *cmdline)
+{
+	syslog(LOG_INFO, "live-update: cmdline %s\n", cmdline);
+
+	if (!lu_status || lu_status->conn != conn)
+		return "Not in live-update session.";
+
+	lu_status->cmdline = talloc_strdup(lu_status, cmdline);
+	if (!lu_status->cmdline)
+		return "Allocation failure.";
+
+	return NULL;
+}
+
+static bool lu_check_lu_allowed(void)
+{
+	struct connection *conn;
+	time_t now = time(NULL);
+	unsigned int ta_total = 0, ta_long = 0;
+
+	list_for_each_entry(conn, &connections, list) {
+		if (conn->ta_start_time) {
+			ta_total++;
+			if (now - conn->ta_start_time >= lu_status->timeout)
+				ta_long++;
+		}
+	}
+
+	/*
+	 * Allow LiveUpdate if one of the following conditions is met:
+	 *	- There is no active transactions
+	 *	- All transactions are long running (e.g. they have been
+	 *	active for more than lu_status->timeout sec) and the admin as
+	 *	requested to force the operation.
+	 */
+	return ta_total ? (lu_status->force && ta_long == ta_total) : true;
+}
+
+static const char *lu_reject_reason(const void *ctx)
+{
+	char *ret = NULL;
+	struct connection *conn;
+	time_t now = time(NULL);
+
+	list_for_each_entry(conn, &connections, list) {
+		if (conn->ta_start_time &&
+		    (now - conn->ta_start_time >= lu_status->timeout)) {
+			ret = talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
+					      ret ? : "Domains with long running transactions:",
+					      conn->id,
+					      now - conn->ta_start_time);
+		}
+	}
+
+	return ret ? (const char *)ret : "Overlapping transactions";
+}
+
+static const char *lu_dump_state(const void *ctx, struct connection *conn)
+{
+	FILE *fp;
+	const char *ret;
+	struct xs_state_record_header end;
+	struct xs_state_preamble pre;
+
+	fp = lu_dump_open(ctx);
+	if (!fp)
+		return "Dump state open error";
+
+	memcpy(pre.ident, XS_STATE_IDENT, sizeof(pre.ident));
+	pre.version = htobe32(XS_STATE_VERSION);
+	pre.flags = XS_STATE_FLAGS;
+	if (fwrite(&pre, sizeof(pre), 1, fp) != 1) {
+		ret = "Dump write error";
+		goto out;
+	}
+
+	ret = dump_state_global(fp);
+	if (ret)
+		goto out;
+	ret = dump_state_connections(fp);
+	if (ret)
+		goto out;
+	ret = dump_state_nodes(fp, ctx);
+	if (ret)
+		goto out;
+
+	end.type = XS_STATE_TYPE_END;
+	end.length = 0;
+	if (fwrite(&end, sizeof(end), 1, fp) != 1)
+		ret = "Dump write error";
+
+ out:
+	lu_dump_close(fp);
+
+	return ret;
+}
+
+static const char *lu_activate_binary(const void *ctx)
+{
+	int argc;
+	char **argv;
+	unsigned int i;
+
+	if (lu_status->cmdline) {
+		argc = 4;   /* At least one arg + progname + "-U" + NULL. */
+		for (i = 0; lu_status->cmdline[i]; i++)
+			if (isspace(lu_status->cmdline[i]))
+				argc++;
+		argv = talloc_array(ctx, char *, argc);
+		if (!argv)
+			return "Allocation failure.";
+
+		i = 0;
+		argc = 1;
+		argv[1] = strtok(lu_status->cmdline, " \t");
+		while (argv[argc]) {
+			if (!strcmp(argv[argc], "-U"))
+				i = 1;
+			argc++;
+			argv[argc] = strtok(NULL, " \t");
+		}
+
+		if (!i) {
+			argv[argc++] = "-U";
+			argv[argc] = NULL;
+		}
+	} else {
+		for (i = 0; i < orig_argc; i++)
+			if (!strcmp(orig_argv[i], "-U"))
+				break;
+
+		argc = orig_argc;
+		argv = talloc_array(ctx, char *, orig_argc + 2);
+		if (!argv)
+			return "Allocation failure.";
+
+		memcpy(argv, orig_argv, orig_argc * sizeof(*argv));
+		if (i == orig_argc)
+			argv[argc++] = "-U";
+		argv[argc] = NULL;
+	}
+
+	domain_deinit();
+
+	return lu_exec(ctx, argc, argv);
+}
+
+static bool do_lu_start(struct delayed_request *req)
+{
+	time_t now = time(NULL);
+	const char *ret;
+	struct buffered_data *saved_in;
+	struct connection *conn = req->data;
+
+	/*
+	 * Cancellation may have been requested asynchronously. In this
+	 * case, lu_status will be NULL.
+	 */
+	if (!lu_status) {
+		ret = "Cancellation was requested";
+		goto out;
+	}
+
+	assert(lu_status->conn == conn);
+
+	if (!lu_check_lu_allowed()) {
+		if (now < lu_status->started_at + lu_status->timeout)
+			return false;
+		if (!lu_status->force) {
+			ret = lu_reject_reason(req);
+			goto out;
+		}
+	}
+
+	assert(req->in == lu_status->in);
+	/* Dump out internal state, including "OK" for live update. */
+	ret = lu_dump_state(req->in, conn);
+	if (!ret) {
+		/* Perform the activation of new binary. */
+		ret = lu_activate_binary(req->in);
+	}
+
+	/* We will reach this point only in case of failure. */
+ out:
+	/*
+	 * send_reply() will send the response for conn->in. Save the current
+	 * conn->in and restore it afterwards.
+	 */
+	saved_in = conn->in;
+	conn->in = req->in;
+	send_reply(conn, XS_CONTROL, ret, strlen(ret) + 1);
+	conn->in = saved_in;
+	talloc_free(lu_status);
+
+	return true;
+}
+
+static const char *lu_start(const void *ctx, struct connection *conn,
+			    bool force, unsigned int to)
+{
+	syslog(LOG_INFO, "live-update: start, force=%d, to=%u\n", force, to);
+
+	if (!lu_status || lu_status->conn != conn)
+		return "Not in live-update session.";
+
+#ifdef __MINIOS__
+	if (lu_status->kernel_size != lu_status->kernel_off)
+		return "Kernel not complete.";
+#endif
+
+	lu_status->force = force;
+	lu_status->timeout = to;
+	lu_status->started_at = time(NULL);
+	lu_status->in = conn->in;
+
+	errno = delay_request(conn, conn->in, do_lu_start, conn, false);
+
+	return NULL;
+}
+
+int do_control_lu(const void *ctx, struct connection *conn, char **vec,
+		  int num)
+{
+	const char *ret = NULL;
+	unsigned int i;
+	bool force = false;
+	unsigned int to = 0;
+
+	if (num < 1)
+		return EINVAL;
+
+	if (!strcmp(vec[0], "-a")) {
+		if (num == 1)
+			ret = lu_abort(ctx, conn);
+		else
+			return EINVAL;
+	} else if (!strcmp(vec[0], "-c")) {
+		if (num == 2)
+			ret = lu_cmdline(ctx, conn, vec[1]);
+		else
+			return EINVAL;
+	} else if (!strcmp(vec[0], "-s")) {
+		for (i = 1; i < num; i++) {
+			if (!strcmp(vec[i], "-F"))
+				force = true;
+			else if (!strcmp(vec[i], "-t") && i < num - 1) {
+				i++;
+				to = atoi(vec[i]);
+			} else
+				return EINVAL;
+		}
+		ret = lu_start(ctx, conn, force, to);
+		if (!ret)
+			return errno;
+	} else {
+		ret = lu_arch(ctx, conn, vec, num);
+		if (!ret && errno)
+			return errno;
+	}
+
+	if (!ret)
+		ret = "OK";
+	send_reply(conn, XS_CONTROL, ret, strlen(ret) + 1);
+	return 0;
+}
+#endif
diff --git a/tools/xenstore/xenstored_lu.h b/tools/xenstore/xenstored_lu.h
index d2f8e4e57c..7aa524a07e 100644
--- a/tools/xenstore/xenstored_lu.h
+++ b/tools/xenstore/xenstored_lu.h
@@ -43,6 +43,16 @@ struct lu_dump_state {
 
 extern struct live_update *lu_status;
 
+struct connection *lu_get_connection(void);
+bool lu_is_pending(void);
+void lu_read_state(void);
+
+/* Write the "OK" response for the live-update command */
+unsigned int lu_write_response(FILE *fp);
+
+int do_control_lu(const void *ctx, struct connection *conn, char **vec,
+		  int num);
+
 /* Live update private interfaces. */
 void lu_get_dump_state(struct lu_dump_state *state);
 void lu_close_dump_state(struct lu_dump_state *state);
@@ -53,4 +63,19 @@ const char *lu_arch(const void *ctx, struct connection *conn, char **vec,
 		    int num);
 const char *lu_begin(struct connection *conn);
 int lu_destroy(void *data);
+#else
+static inline struct connection *lu_get_connection(void)
+{
+	return NULL;
+}
+
+static inline unsigned int lu_write_response(FILE *fp)
+{
+	return 0;
+}
+
+static inline bool lu_is_pending(void)
+{
+	return false;
+}
 #endif
-- 
2.35.3


