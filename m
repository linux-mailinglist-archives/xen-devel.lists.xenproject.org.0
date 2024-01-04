Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F36823E5B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661273.1031004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJm6-0003GU-LV; Thu, 04 Jan 2024 09:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661273.1031004; Thu, 04 Jan 2024 09:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJm6-0003Ek-IB; Thu, 04 Jan 2024 09:12:26 +0000
Received: by outflank-mailman (input) for mailman id 661273;
 Thu, 04 Jan 2024 09:12:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJd0-00085z-4d
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:03:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10047a47-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:03:01 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 38B011F7F8;
 Thu,  4 Jan 2024 09:03:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0523813722;
 Thu,  4 Jan 2024 09:03:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BooHAEV0lmUrWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:03:01 +0000
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
X-Inumbo-ID: 10047a47-aae0-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 22/33] tools/xenstored: add early_init() function
Date: Thu,  4 Jan 2024 10:00:44 +0100
Message-Id: <20240104090055.27323-23-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 38B011F7F8
X-Spam-Flag: NO

Some xenstored initialization needs to be done in the daemon case only,
so split it out into a new early_init() function being a stub in the
stubdom case.

Remove the call of talloc_enable_leak_report_full(), as it serves no
real purpose: the daemon only ever exits due to a crash, in which case
a log of talloc()ed memory hardly has any value.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rename function
- move patch earlier in the series
V3:
- add more init code for the daemon to early_init()
- move mkdir(XENSTORE_LIB_DIR) into a later patch (Julien Grall)
- remove stale stubs in minios.c
---
 tools/xenstored/core.c   | 30 +++---------------------------
 tools/xenstored/core.h   |  7 +++----
 tools/xenstored/minios.c | 11 +++--------
 tools/xenstored/posix.c  | 31 +++++++++++++++++++++++++++++--
 4 files changed, 38 insertions(+), 41 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index d4c76d71dc..eba7744fde 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -79,7 +79,7 @@ char **orig_argv;
 LIST_HEAD(connections);
 int tracefd = -1;
 bool keep_orphans = false;
-static int reopen_log_pipe[2];
+int reopen_log_pipe[2];
 static int reopen_log_pipe0_pollfd_idx = -1;
 char *tracefile = NULL;
 static struct hashtable *nodes;
@@ -2612,7 +2612,7 @@ static void destroy_fds(void)
 		close(sock);
 }
 
-static void init_sockets(void)
+void init_sockets(void)
 {
 	struct sockaddr_un addr;
 	const char *soc_str = xenstore_daemon_path();
@@ -2903,34 +2903,10 @@ int main(int argc, char *argv[])
 	if (optind != argc)
 		barf("%s: No arguments desired", argv[0]);
 
-	reopen_log();
-
-	/* Make sure xenstored directory exists. */
-	/* Errors ignored here, will be reported when we open files */
-	mkdir(xenstore_daemon_rundir(), 0755);
-
-	if (dofork) {
-		openlog("xenstored", 0, LOG_DAEMON);
-		if (!live_update)
-			daemonize();
-	}
-	if (pidfile)
-		write_pidfile(pidfile);
-
-	/* Talloc leak reports go to stderr, which is closed if we fork. */
-	if (!dofork)
-		talloc_enable_leak_report_full();
-
-	/* Don't kill us with SIGPIPE. */
-	signal(SIGPIPE, SIG_IGN);
+	early_init(live_update, dofork, pidfile);
 
 	talloc_enable_null_tracking();
 
-#ifndef NO_SOCKETS
-	if (!live_update)
-		init_sockets();
-#endif
-
 	init_pipe(reopen_log_pipe);
 
 	/* Listen to hypervisor. */
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 480b0f5f7b..72173f1684 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -384,12 +384,11 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
 
 /* Return the event channel used by xenbus. */
 evtchn_port_t get_xenbus_evtchn(void);
+void early_init(bool live_update, bool dofork, const char *pidfile);
 
-/* Write out the pidfile */
-void write_pidfile(const char *pidfile);
+void init_sockets(void);
+extern int reopen_log_pipe[2];
 
-/* Fork but do not close terminal FDs */
-void daemonize(void);
 /* Close stdin/stdout/stderr to complete daemonize */
 void finish_daemonize(void);
 
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 0779efbf91..4f48f63083 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -20,14 +20,6 @@
 #include "core.h"
 #include <xen/grant_table.h>
 
-void write_pidfile(const char *pidfile)
-{
-}
-
-void daemonize(void)
-{
-}
-
 void finish_daemonize(void)
 {
 }
@@ -54,3 +46,6 @@ void unmap_xenbus(void *interface)
 	xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
+void early_init(bool live_update, bool dofork, const char *pidfile)
+{
+}
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 7e03dd982d..9463ef5c8d 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -20,14 +20,17 @@
 #include <sys/stat.h>
 #include <unistd.h>
 #include <fcntl.h>
+#include <signal.h>
 #include <stdlib.h>
+#include <syslog.h>
 #include <sys/mman.h>
+#include <xen-tools/xenstore-common.h>
 
 #include "utils.h"
 #include "core.h"
 #include "osdep.h"
 
-void write_pidfile(const char *pidfile)
+static void write_pidfile(const char *pidfile)
 {
 	char buf[100];
 	int len;
@@ -49,7 +52,7 @@ void write_pidfile(const char *pidfile)
 }
 
 /* Stevens. */
-void daemonize(void)
+static void daemonize(void)
 {
 	pid_t pid;
 
@@ -157,3 +160,27 @@ void *xenbus_map(void)
 
 	return addr;
 }
+
+void early_init(bool live_update, bool dofork, const char *pidfile)
+{
+	reopen_log();
+
+	/* Make sure xenstored directory exists. */
+	/* Errors ignored here, will be reported when we open files */
+	mkdir(xenstore_daemon_rundir(), 0755);
+
+	if (dofork) {
+		openlog("xenstored", 0, LOG_DAEMON);
+		if (!live_update)
+			daemonize();
+	}
+
+	if (pidfile)
+		write_pidfile(pidfile);
+
+	/* Don't kill us with SIGPIPE. */
+	signal(SIGPIPE, SIG_IGN);
+
+	if (!live_update)
+		init_sockets();
+}
-- 
2.35.3


