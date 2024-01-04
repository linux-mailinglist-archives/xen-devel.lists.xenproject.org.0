Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C3823E59
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661255.1030994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJl0-0002Nt-D2; Thu, 04 Jan 2024 09:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661255.1030994; Thu, 04 Jan 2024 09:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJl0-0002MA-8t; Thu, 04 Jan 2024 09:11:18 +0000
Received: by outflank-mailman (input) for mailman id 661255;
 Thu, 04 Jan 2024 09:11:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJdB-00085z-8T
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:03:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1695d1a6-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:03:12 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D54621EE1;
 Thu,  4 Jan 2024 09:03:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1272F13722;
 Thu,  4 Jan 2024 09:03:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VRIuA1B0lmVAWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:03:12 +0000
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
X-Inumbo-ID: 1695d1a6-aae0-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 24/33] tools/xenstored: move all log-pipe handling into posix.c
Date: Thu,  4 Jan 2024 10:00:46 +0100
Message-Id: <20240104090055.27323-25-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 3D54621EE1
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
---
 tools/xenstored/core.c   | 41 ++++-------------------------------
 tools/xenstored/core.h   | 11 ++++++----
 tools/xenstored/minios.c | 14 ++++++------
 tools/xenstored/posix.c  | 46 +++++++++++++++++++++++++++++++++++++++-
 4 files changed, 64 insertions(+), 48 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 7b5e1d0c0f..650c1d1574 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -56,7 +56,7 @@
 
 extern xenevtchn_handle *xce_handle; /* in domain.c */
 static int xce_pollfd_idx = -1;
-static struct pollfd *fds;
+struct pollfd *fds;
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
@@ -512,11 +498,9 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
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
 
@@ -2940,21 +2921,7 @@ int main(int argc, char *argv[])
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
 			if (fds[sock_pollfd_idx].revents & ~POLLIN) {
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 0de2d8a26e..6944f48719 100644
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
 
+extern struct pollfd *fds;
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
index 97c8dcaba3..2dbbef4a0b 100644
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
@@ -183,9 +199,37 @@ void early_init(bool live_update, bool dofork, const char *pidfile)
 
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
+		if (fds[reopen_log_pipe0_pollfd_idx].revents & ~POLLIN) {
+			close(reopen_log_pipe[0]);
+			close(reopen_log_pipe[1]);
+			init_pipe();
+		} else if (fds[reopen_log_pipe0_pollfd_idx].revents & POLLIN) {
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


