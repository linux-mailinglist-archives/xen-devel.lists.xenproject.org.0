Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3D84982F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675832.1051422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfE-0001bq-RX; Mon, 05 Feb 2024 10:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675832.1051422; Mon, 05 Feb 2024 10:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfE-0001XS-Nu; Mon, 05 Feb 2024 10:57:24 +0000
Received: by outflank-mailman (input) for mailman id 675832;
 Mon, 05 Feb 2024 10:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwaE-0002wU-HF
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:52:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ea7bc5c-c414-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 11:52:13 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 736251F8BA;
 Mon,  5 Feb 2024 10:52:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41B7E132DD;
 Mon,  5 Feb 2024 10:52:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EQSNDt29wGXQNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:52:13 +0000
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
X-Inumbo-ID: 9ea7bc5c-c414-11ee-8a45-1f161083a0e0
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 23/32] tools/xenstored: move all log-pipe handling into posix.c
Date: Mon,  5 Feb 2024 11:49:52 +0100
Message-Id: <20240205105001.24171-24-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 736251F8BA
X-Spam-Flag: NO

All of the log-pipe handling is needed only when running as daemon.

Move it into posix.c. This requires to have a service function in the
main event loop for handling the related requests and one for setting
the fds[] array. Use a generic name for those functions, as socket
handling can be added to them later, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- rename fds to poll_fds (Julien Grall)
---
 tools/xenstored/core.c   | 69 +++++++++++-----------------------------
 tools/xenstored/core.h   | 11 ++++---
 tools/xenstored/minios.c | 14 ++++----
 tools/xenstored/posix.c  | 47 ++++++++++++++++++++++++++-
 4 files changed, 79 insertions(+), 62 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 7b5e1d0c0f..86ab330eaf 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -56,7 +56,7 @@
 
 extern xenevtchn_handle *xce_handle; /* in domain.c */
 static int xce_pollfd_idx = -1;
-static struct pollfd *fds;
+struct pollfd *poll_fds;
 static unsigned int current_array_size;
 static unsigned int nr_fds;
 static unsigned int delayed_requests;
@@ -69,8 +69,6 @@ char **orig_argv;
 LIST_HEAD(connections);
 int tracefd = -1;
 bool keep_orphans = false;
-int reopen_log_pipe[2];
-static int reopen_log_pipe0_pollfd_idx = -1;
 char *tracefile = NULL;
 static struct hashtable *nodes;
 unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
@@ -145,18 +143,6 @@ void trace_destroy(const void *data, const char *type)
 		trace("obj: DESTROY %s %p\n", type, data);
 }
 
-/**
- * Signal handler for SIGHUP, which requests that the trace log is reopened
- * (in the main loop).  A single byte is written to reopen_log_pipe, to awaken
- * the poll() in the main loop.
- */
-static void trigger_reopen_log(int signal __attribute__((unused)))
-{
-	char c = 'A';
-	int dummy;
-	dummy = write(reopen_log_pipe[1], &c, 1);
-}
-
 void close_log(void)
 {
 	if (tracefd >= 0)
@@ -467,7 +453,7 @@ static bool conn_can_write(struct connection *conn)
 }
 
 /* This function returns index inside the array if succeed, -1 if fail */
-static int set_fd(int fd, short events)
+int set_fd(int fd, short events)
 {
 	int ret;
 	if (current_array_size < nr_fds + 1) {
@@ -479,18 +465,18 @@ static int set_fd(int fd, short events)
 		 */
 		newsize = ROUNDUP(nr_fds + 1, 8);
 
-		new_fds = realloc(fds, sizeof(struct pollfd)*newsize);
+		new_fds = realloc(poll_fds, sizeof(struct pollfd)*newsize);
 		if (!new_fds)
 			goto fail;
-		fds = new_fds;
+		poll_fds = new_fds;
 
-		memset(&fds[0] + current_array_size, 0,
+		memset(&poll_fds[0] + current_array_size, 0,
 		       sizeof(struct pollfd ) * (newsize-current_array_size));
 		current_array_size = newsize;
 	}
 
-	fds[nr_fds].fd = fd;
-	fds[nr_fds].events = events;
+	poll_fds[nr_fds].fd = fd;
+	poll_fds[nr_fds].events = events;
 	ret = nr_fds;
 	nr_fds++;
 
@@ -505,18 +491,16 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	struct connection *conn;
 	uint64_t msecs;
 
-	if (fds)
-		memset(fds, 0, sizeof(struct pollfd) * current_array_size);
+	if (poll_fds)
+		memset(poll_fds, 0, sizeof(struct pollfd) * current_array_size);
 	nr_fds = 0;
 
 	/* In case of delayed requests pause for max 1 second. */
 	*ptimeout = delayed_requests ? 1000 : -1;
 
+	set_special_fds();
 	if (sock != -1)
 		*p_sock_pollfd_idx = set_fd(sock, POLLIN|POLLPRI);
-	if (reopen_log_pipe[0] != -1)
-		reopen_log_pipe0_pollfd_idx =
-			set_fd(reopen_log_pipe[0], POLLIN|POLLPRI);
 
 	if (xce_handle != NULL)
 		xce_pollfd_idx = set_fd(xenevtchn_fd(xce_handle),
@@ -2324,12 +2308,12 @@ static bool socket_can_process(struct connection *conn, int mask)
 	if (conn->pollfd_idx == -1)
 		return false;
 
-	if (fds[conn->pollfd_idx].revents & ~(POLLIN | POLLOUT)) {
+	if (poll_fds[conn->pollfd_idx].revents & ~(POLLIN | POLLOUT)) {
 		talloc_free(conn);
 		return false;
 	}
 
-	return (fds[conn->pollfd_idx].revents & mask);
+	return (poll_fds[conn->pollfd_idx].revents & mask);
 }
 
 static bool socket_can_write(struct connection *conn)
@@ -2897,8 +2881,6 @@ int main(int argc, char *argv[])
 
 	talloc_enable_null_tracking();
 
-	init_pipe(reopen_log_pipe);
-
 	/* Listen to hypervisor. */
 	if (!live_update) {
 		domain_init(-1);
@@ -2913,7 +2895,6 @@ int main(int argc, char *argv[])
 		xprintf = trace;
 #endif
 
-	signal(SIGHUP, trigger_reopen_log);
 	if (tracefile)
 		tracefile = talloc_strdup(NULL, tracefile);
 
@@ -2934,43 +2915,29 @@ int main(int argc, char *argv[])
 	for (;;) {
 		struct connection *conn, *next;
 
-		if (poll(fds, nr_fds, timeout) < 0) {
+		if (poll(poll_fds, nr_fds, timeout) < 0) {
 			if (errno == EINTR)
 				continue;
 			barf_perror("Poll failed");
 		}
 
-		if (reopen_log_pipe0_pollfd_idx != -1) {
-			if (fds[reopen_log_pipe0_pollfd_idx].revents
-			    & ~POLLIN) {
-				close(reopen_log_pipe[0]);
-				close(reopen_log_pipe[1]);
-				init_pipe(reopen_log_pipe);
-			} else if (fds[reopen_log_pipe0_pollfd_idx].revents
-				   & POLLIN) {
-				char c;
-				if (read(reopen_log_pipe[0], &c, 1) != 1)
-					barf_perror("read failed");
-				reopen_log();
-			}
-			reopen_log_pipe0_pollfd_idx = -1;
-		}
+		handle_special_fds();
 
 		if (sock_pollfd_idx != -1) {
-			if (fds[sock_pollfd_idx].revents & ~POLLIN) {
+			if (poll_fds[sock_pollfd_idx].revents & ~POLLIN) {
 				barf_perror("sock poll failed");
 				break;
-			} else if (fds[sock_pollfd_idx].revents & POLLIN) {
+			} else if (poll_fds[sock_pollfd_idx].revents & POLLIN) {
 				accept_connection(sock);
 				sock_pollfd_idx = -1;
 			}
 		}
 
 		if (xce_pollfd_idx != -1) {
-			if (fds[xce_pollfd_idx].revents & ~POLLIN) {
+			if (poll_fds[xce_pollfd_idx].revents & ~POLLIN) {
 				barf_perror("xce_handle poll failed");
 				break;
-			} else if (fds[xce_pollfd_idx].revents & POLLIN) {
+			} else if (poll_fds[xce_pollfd_idx].revents & POLLIN) {
 				handle_event();
 				xce_pollfd_idx = -1;
 			}
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 0de2d8a26e..44c4d0f8b8 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -25,6 +25,7 @@
 #include <sys/types.h>
 #include <dirent.h>
 #include <fcntl.h>
+#include <poll.h>
 #include <stdbool.h>
 #include <stdint.h>
 #include <time.h>
@@ -361,6 +362,8 @@ extern int dom0_event;
 extern int priv_domid;
 extern bool keep_orphans;
 
+extern struct pollfd *poll_fds;
+
 extern unsigned int timeout_watch_event_msec;
 
 /* Get internal time in milliseconds. */
@@ -387,15 +390,15 @@ evtchn_port_t get_xenbus_evtchn(void);
 void early_init(bool live_update, bool dofork, const char *pidfile);
 void late_init(bool live_update);
 
+int set_fd(int fd, short events);
+void set_special_fds(void);
+void handle_special_fds(void);
+
 void init_sockets(void);
-extern int reopen_log_pipe[2];
 
 /* Close stdin/stdout/stderr to complete daemonize */
 void finish_daemonize(void);
 
-/* Open a pipe for signal handling */
-void init_pipe(int reopen_log_pipe[2]);
-
 #ifndef NO_SOCKETS
 extern const struct interface_funcs socket_funcs;
 #endif
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 45bb0440be..3208169187 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -24,12 +24,6 @@ void finish_daemonize(void)
 {
 }
 
-void init_pipe(int reopen_log_pipe[2])
-{
-	reopen_log_pipe[0] = -1;
-	reopen_log_pipe[1] = -1;
-}
-
 evtchn_port_t get_xenbus_evtchn(void)
 {
 	return dom0_event;
@@ -53,3 +47,11 @@ void early_init(bool live_update, bool dofork, const char *pidfile)
 void late_init(bool live_update)
 {
 }
+
+void set_special_fds(void)
+{
+}
+
+void handle_special_fds(void)
+{
+}
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 97c8dcaba3..1ea8475293 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -33,6 +33,9 @@
 #include "core.h"
 #include "osdep.h"
 
+static int reopen_log_pipe0_pollfd_idx = -1;
+static int reopen_log_pipe[2];
+
 static void write_pidfile(const char *pidfile)
 {
 	char buf[100];
@@ -82,6 +85,19 @@ static void daemonize(void)
 	umask(0);
 }
 
+/*
+ * Signal handler for SIGHUP, which requests that the trace log is reopened
+ * (in the main loop).  A single byte is written to reopen_log_pipe, to awaken
+ * the poll() in the main loop.
+ */
+static void trigger_reopen_log(int signal __attribute__((unused)))
+{
+	char c = 'A';
+	int dummy;
+
+	dummy = write(reopen_log_pipe[1], &c, 1);
+}
+
 void finish_daemonize(void)
 {
 	int devnull = open("/dev/null", O_RDWR);
@@ -93,7 +109,7 @@ void finish_daemonize(void)
 	close(devnull);
 }
 
-void init_pipe(int reopen_log_pipe[2])
+static void init_pipe(void)
 {
 	int flags;
 	unsigned int i;
@@ -183,9 +199,38 @@ void early_init(bool live_update, bool dofork, const char *pidfile)
 
 	/* Don't kill us with SIGPIPE. */
 	signal(SIGPIPE, SIG_IGN);
+	signal(SIGHUP, trigger_reopen_log);
 
 	if (!live_update)
 		init_sockets();
+
+	init_pipe();
+}
+
+void set_special_fds(void)
+{
+	if (reopen_log_pipe[0] != -1)
+		reopen_log_pipe0_pollfd_idx =
+			set_fd(reopen_log_pipe[0], POLLIN|POLLPRI);
+}
+
+void handle_special_fds(void)
+{
+	if (reopen_log_pipe0_pollfd_idx != -1) {
+		if (poll_fds[reopen_log_pipe0_pollfd_idx].revents & ~POLLIN) {
+			close(reopen_log_pipe[0]);
+			close(reopen_log_pipe[1]);
+			init_pipe();
+		} else if (poll_fds[reopen_log_pipe0_pollfd_idx].revents &
+			   POLLIN) {
+			char c;
+
+			if (read(reopen_log_pipe[0], &c, 1) != 1)
+				barf_perror("read failed");
+			reopen_log();
+		}
+		reopen_log_pipe0_pollfd_idx = -1;
+	}
 }
 
 void late_init(bool live_update)
-- 
2.35.3


