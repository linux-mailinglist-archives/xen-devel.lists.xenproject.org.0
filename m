Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F7B2F7475
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67782.121231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Kdb-0002Q4-3m; Fri, 15 Jan 2021 08:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67782.121231; Fri, 15 Jan 2021 08:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Kdb-0002PV-0H; Fri, 15 Jan 2021 08:39:19 +0000
Received: by outflank-mailman (input) for mailman id 67782;
 Fri, 15 Jan 2021 08:39:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KVX-0008Gh-Gk
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfca8c9a-1c8e-4685-90d1-f5bd52a73124;
 Fri, 15 Jan 2021 08:30:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC288B92C;
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
X-Inumbo-ID: cfca8c9a-1c8e-4685-90d1-f5bd52a73124
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGzuxQnYzfc8rJK8syvxEKqLLXp0M6fORQPHnjkOtYc=;
	b=LR+d8UFlv2UIVrBY1btxs0cNVe2HZDQ3e1uARlsjwrn766KER8RSRIffpO/qwERB4X0cz+
	ONoCICkJMlJvJAi5icHi6G3v1cKbhvI6GUQReLZISGoXGvbqAeXxIf7z/piZQ+CgY3M8HP
	I0yI3gyy0AYazVykbK056MIiR5kQ0VM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v12 27/27] tools/xenstore: activate new binary for live update
Date: Fri, 15 Jan 2021 09:30:00 +0100
Message-Id: <20210115083000.14186-28-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
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
---
 tools/xenstore/xenstored_control.c | 61 +++++++++++++++++++++++++++++-
 tools/xenstore/xenstored_core.c    |  5 +++
 tools/xenstore/xenstored_core.h    |  3 ++
 tools/xenstore/xenstored_domain.c  |  6 +++
 tools/xenstore/xenstored_domain.h  |  1 +
 5 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 3c212cc4d4..1f733e0a04 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -16,6 +16,7 @@ Interactive commands for Xen Store Daemon.
     along with this program; If not, see <http://www.gnu.org/licenses/>.
 */
 
+#include <ctype.h>
 #include <errno.h>
 #include <stdarg.h>
 #include <stdio.h>
@@ -335,6 +336,11 @@ static void lu_get_dump_state(struct lu_dump_state *state)
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
@@ -434,6 +440,14 @@ static void lu_close_dump_state(struct lu_dump_state *state)
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
 
 static bool lu_check_lu_allowed(void)
@@ -572,7 +586,52 @@ void lu_read_state(void)
 
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
 
 static bool do_lu_start(struct delayed_request *req)
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a5c1a56c6c..65ecdd0568 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -73,6 +73,9 @@ static unsigned int delayed_requests;
 
 static int sock = -1;
 
+int orig_argc;
+char **orig_argv;
+
 static bool verbose = false;
 LIST_HEAD(connections);
 int tracefd = -1;
@@ -2077,6 +2080,8 @@ int main(int argc, char *argv[])
 	const char *pidfile = NULL;
 	int timeout;
 
+	orig_argc = argc;
+	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv, "DE:F:HNPS:t:A:M:T:RVW:U", options,
 				  NULL)) != -1) {
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 6ac5a6fbfa..589699e833 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -222,6 +222,9 @@ void dtrace_io(const struct connection *conn, const struct buffered_data *data,
 void reopen_log(void);
 void close_log(void);
 
+extern int orig_argc;
+extern char **orig_argv;
+
 extern char *tracefile;
 extern int tracefd;
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index cbeb2a309c..3d4d0649a2 100644
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


