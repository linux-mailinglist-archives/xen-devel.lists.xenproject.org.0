Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEEF2DB1AF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:43:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54635.95120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDQG-0001Dv-Up; Tue, 15 Dec 2020 16:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54635.95120; Tue, 15 Dec 2020 16:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDQG-0001DE-R4; Tue, 15 Dec 2020 16:43:36 +0000
Received: by outflank-mailman (input) for mailman id 54635;
 Tue, 15 Dec 2020 16:43:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJx-000667-I9
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:37:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65e45a5a-a94f-4d2b-a23f-d4e6af217605;
 Tue, 15 Dec 2020 16:36:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8CA2B715;
 Tue, 15 Dec 2020 16:36:12 +0000 (UTC)
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
X-Inumbo-ID: 65e45a5a-a94f-4d2b-a23f-d4e6af217605
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gn9Ko+vbBsxqvm4ELhEm2wkUmTVMxNSsUGTqvo8dVao=;
	b=HQOiAwmVAVhRyZkRDCOtMIU1txAyo1OIOL30TBdZ9o4wI6JPtKkxenKBYo48XWrdEghoPn
	SPO1ewuhITE3gTSfbjwt93c4bj4vYlk4Qz6A6zBby7GFPKgwUKI1pWp4XBDeUvml0TqCg+
	1jzuKAQkI6BA0oCPoA67OoIXbUTwQNk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 25/25] tools/xenstore: activate new binary for live update
Date: Tue, 15 Dec 2020 17:36:03 +0100
Message-Id: <20201215163603.21700-26-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add activation of the new binary for live update. The daemon case is
handled completely, while for stubdom we only add stubs.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V7:
- added unbinding dom0 and virq event channels

V8:
- no longer close dom0 evtchn (Julien Grall)

V10:
- remember original argc and argv (taken from deleted patch)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_control.c | 61 +++++++++++++++++++++++++++++-
 tools/xenstore/xenstored_core.c    |  5 +++
 tools/xenstore/xenstored_core.h    |  3 ++
 tools/xenstore/xenstored_domain.c  |  6 +++
 tools/xenstore/xenstored_domain.h  |  1 +
 5 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index dee55de264..a5d8185c41 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -16,6 +16,7 @@ Interactive commands for Xen Store Daemon.
     along with this program; If not, see <http://www.gnu.org/licenses/>.
 */
 
+#include <ctype.h>
 #include <errno.h>
 #include <stdarg.h>
 #include <stdio.h>
@@ -330,6 +331,11 @@ static void lu_get_dump_state(struct lu_dump_state *state)
 static void lu_close_dump_state(struct lu_dump_state *state)
 {
 }
+
+static char *lu_exec(const void *ctx, int argc, char **argv)
+{
+	return "NYI";
+}
 #else
 static const char *lu_binary(const void *ctx, struct connection *conn,
 			     const char *filename)
@@ -429,6 +435,14 @@ static void lu_close_dump_state(struct lu_dump_state *state)
 	unlink(filename);
 	talloc_free(filename);
 }
+
+static char *lu_exec(const void *ctx, int argc, char **argv)
+{
+	argv[0] = lu_status->filename;
+	execvp(argv[0], argv);
+
+	return "Error activating new binary.";
+}
 #endif
 
 static const char *lu_check_lu_allowed(const void *ctx, bool force,
@@ -555,7 +569,52 @@ void lu_read_state(void)
 
 static const char *lu_activate_binary(const void *ctx)
 {
-	return "Not yet implemented.";
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
 }
 
 static const char *lu_start(const void *ctx, struct connection *conn,
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 649dfb534a..7174a9288a 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -72,6 +72,9 @@ static unsigned int nr_fds;
 
 static int sock = -1;
 
+int orig_argc;
+char **orig_argv;
+
 static bool verbose = false;
 LIST_HEAD(connections);
 int tracefd = -1;
@@ -2026,6 +2029,8 @@ int main(int argc, char *argv[])
 	const char *pidfile = NULL;
 	int timeout;
 
+	orig_argc = argc;
+	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv, "DE:F:HNPS:t:A:M:T:RVW:U", options,
 				  NULL)) != -1) {
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 0af2f364bf..91e036f49f 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -201,6 +201,9 @@ void dtrace_io(const struct connection *conn, const struct buffered_data *data,
 void reopen_log(void);
 void close_log(void);
 
+extern int orig_argc;
+extern char **orig_argv;
+
 extern char *tracefile;
 extern int tracefd;
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index dfda90c791..317427b7cb 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -783,6 +783,12 @@ void domain_init(int evtfd)
 	virq_port = rc;
 }
 
+void domain_deinit(void)
+{
+	if (virq_port)
+		xenevtchn_unbind(xce_handle, virq_port);
+}
+
 void domain_entry_inc(struct connection *conn, struct node *node)
 {
 	struct domain *d;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 1cc1c03ed8..dc97591713 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -46,6 +46,7 @@ int do_reset_watches(struct connection *conn, struct buffered_data *in);
 
 void domain_init(int evtfd);
 void dom0_init(void);
+void domain_deinit(void);
 
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn);
-- 
2.26.2


