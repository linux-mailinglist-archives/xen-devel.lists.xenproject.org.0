Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191BE823E4C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661206.1030943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJja-0006t1-QG; Thu, 04 Jan 2024 09:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661206.1030943; Thu, 04 Jan 2024 09:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJja-0006rM-Mf; Thu, 04 Jan 2024 09:09:50 +0000
Received: by outflank-mailman (input) for mailman id 661206;
 Thu, 04 Jan 2024 09:09:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJdG-00085z-Vu
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:03:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19e4093b-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:03:18 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C16FD21EE1;
 Thu,  4 Jan 2024 09:03:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 928C513722;
 Thu,  4 Jan 2024 09:03:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rZKNIlV0lmVEWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:03:17 +0000
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
X-Inumbo-ID: 19e4093b-aae0-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 25/33] tools/xenstored: move all socket handling into posix.c
Date: Thu,  4 Jan 2024 10:00:47 +0100
Message-Id: <20240104090055.27323-26-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: C16FD21EE1

All of the socket handling is needed only when running as daemon.

Move it into posix.c, allowing to remove the NO_SOCKETS macro.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 tools/xenstored/Makefile.common |   4 -
 tools/xenstored/core.c          | 156 +-------------------------------
 tools/xenstored/core.h          |   8 +-
 tools/xenstored/domain.c        |   9 +-
 tools/xenstored/minios.c        |   6 ++
 tools/xenstored/posix.c         | 153 +++++++++++++++++++++++++++++++
 6 files changed, 167 insertions(+), 169 deletions(-)

diff --git a/tools/xenstored/Makefile.common b/tools/xenstored/Makefile.common
index 189ab81b8d..ef63ef650c 100644
--- a/tools/xenstored/Makefile.common
+++ b/tools/xenstored/Makefile.common
@@ -16,10 +16,6 @@ CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenguest)
 CFLAGS += $(CFLAGS_libxentoolcore)
 
-ifdef CONFIG_STUBDOM
-CFLAGS += -DNO_SOCKETS=1
-endif
-
 $(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
 
 xenstored.a: $(XENSTORED_OBJS-y)
diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 650c1d1574..8ff1faccef 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -20,10 +20,6 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <poll.h>
-#ifndef NO_SOCKETS
-#include <sys/socket.h>
-#include <sys/un.h>
-#endif
 #include <sys/time.h>
 #include <time.h>
 #include <unistd.h>
@@ -61,7 +57,7 @@ static unsigned int current_array_size;
 static unsigned int nr_fds;
 static unsigned int delayed_requests;
 
-static int sock = -1;
+int sock = -1;
 
 int orig_argc;
 char **orig_argv;
@@ -486,7 +482,7 @@ fail:
 	return -1;
 }
 
-static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
+static void initialize_fds(int *ptimeout)
 {
 	struct connection *conn;
 	uint64_t msecs;
@@ -499,8 +495,6 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	*ptimeout = delayed_requests ? 1000 : -1;
 
 	set_special_fds();
-	if (sock != -1)
-		*p_sock_pollfd_idx = set_fd(sock, POLLIN|POLLPRI);
 
 	if (xce_handle != NULL)
 		xce_pollfd_idx = set_fd(xenevtchn_fd(xce_handle),
@@ -2260,97 +2254,6 @@ struct connection *get_connection_by_id(unsigned int conn_id)
 	return NULL;
 }
 
-#ifdef NO_SOCKETS
-static void accept_connection(int sock)
-{
-}
-#else
-static int writefd(struct connection *conn, const void *data, unsigned int len)
-{
-	int rc;
-
-	while ((rc = write(conn->fd, data, len)) < 0) {
-		if (errno == EAGAIN) {
-			rc = 0;
-			break;
-		}
-		if (errno != EINTR)
-			break;
-	}
-
-	return rc;
-}
-
-static int readfd(struct connection *conn, void *data, unsigned int len)
-{
-	int rc;
-
-	while ((rc = read(conn->fd, data, len)) < 0) {
-		if (errno == EAGAIN) {
-			rc = 0;
-			break;
-		}
-		if (errno != EINTR)
-			break;
-	}
-
-	/* Reading zero length means we're done with this connection. */
-	if ((rc == 0) && (len != 0)) {
-		errno = EBADF;
-		rc = -1;
-	}
-
-	return rc;
-}
-
-static bool socket_can_process(struct connection *conn, int mask)
-{
-	if (conn->pollfd_idx == -1)
-		return false;
-
-	if (fds[conn->pollfd_idx].revents & ~(POLLIN | POLLOUT)) {
-		talloc_free(conn);
-		return false;
-	}
-
-	return (fds[conn->pollfd_idx].revents & mask);
-}
-
-static bool socket_can_write(struct connection *conn)
-{
-	return socket_can_process(conn, POLLOUT);
-}
-
-static bool socket_can_read(struct connection *conn)
-{
-	return socket_can_process(conn, POLLIN);
-}
-
-const struct interface_funcs socket_funcs = {
-	.write = writefd,
-	.read = readfd,
-	.can_write = socket_can_write,
-	.can_read = socket_can_read,
-};
-
-static void accept_connection(int sock)
-{
-	int fd;
-	struct connection *conn;
-
-	fd = accept(sock, NULL, NULL);
-	if (fd < 0)
-		return;
-
-	conn = new_connection(&socket_funcs);
-	if (conn) {
-		conn->fd = fd;
-		conn->id = dom0_domid;
-	} else
-		close(fd);
-}
-#endif
-
 /* We create initial nodes manually. */
 static void manual_node(const char *name, const char *child)
 {
@@ -2579,46 +2482,6 @@ void corrupt(struct connection *conn, const char *fmt, ...)
 	errno = saved_errno;
 }
 
-#ifndef NO_SOCKETS
-static void destroy_fds(void)
-{
-	if (sock >= 0)
-		close(sock);
-}
-
-void init_sockets(void)
-{
-	struct sockaddr_un addr;
-	const char *soc_str = xenstore_daemon_path();
-
-	if (!soc_str)
-		barf_perror("Failed to obtain xs domain socket");
-
-	/* Create sockets for them to listen to. */
-	atexit(destroy_fds);
-	sock = socket(PF_UNIX, SOCK_STREAM, 0);
-	if (sock < 0)
-		barf_perror("Could not create socket");
-
-	/* FIXME: Be more sophisticated, don't mug running daemon. */
-	unlink(soc_str);
-
-	addr.sun_family = AF_UNIX;
-
-	if(strlen(soc_str) >= sizeof(addr.sun_path))
-		barf_perror("socket string '%s' too long", soc_str);
-	strcpy(addr.sun_path, soc_str);
-	if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) != 0)
-		barf_perror("Could not bind socket to %s", soc_str);
-
-	if (chmod(soc_str, 0600) != 0)
-		barf_perror("Could not chmod sockets");
-
-	if (listen(sock, 1) != 0)
-		barf_perror("Could not listen on sockets");
-}
-#endif
-
 static void usage(void)
 {
 	fprintf(stderr,
@@ -2796,7 +2659,6 @@ int set_trace_switch(const char *arg)
 int main(int argc, char *argv[])
 {
 	int opt;
-	int sock_pollfd_idx = -1;
 	bool dofork = true;
 	bool live_update = false;
 	const char *pidfile = NULL;
@@ -2907,7 +2769,7 @@ int main(int argc, char *argv[])
 	check_store();
 
 	/* Get ready to listen to the tools. */
-	initialize_fds(&sock_pollfd_idx, &timeout);
+	initialize_fds(&timeout);
 
 	late_init(live_update);
 
@@ -2923,16 +2785,6 @@ int main(int argc, char *argv[])
 
 		handle_special_fds();
 
-		if (sock_pollfd_idx != -1) {
-			if (fds[sock_pollfd_idx].revents & ~POLLIN) {
-				barf_perror("sock poll failed");
-				break;
-			} else if (fds[sock_pollfd_idx].revents & POLLIN) {
-				accept_connection(sock);
-				sock_pollfd_idx = -1;
-			}
-		}
-
 		if (xce_pollfd_idx != -1) {
 			if (fds[xce_pollfd_idx].revents & ~POLLIN) {
 				barf_perror("xce_handle poll failed");
@@ -2986,7 +2838,7 @@ int main(int argc, char *argv[])
 			}
 		}
 
-		initialize_fds(&sock_pollfd_idx, &timeout);
+		initialize_fds(&timeout);
 	}
 }
 
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 6944f48719..ddc345050c 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -301,6 +301,7 @@ int rm_node(struct connection *conn, const void *ctx, const char *name);
 
 void setup_structure(bool live_update);
 struct connection *new_connection(const struct interface_funcs *funcs);
+struct connection *add_socket_connection(int fd);
 struct connection *get_connection_by_id(unsigned int conn_id);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
@@ -335,6 +336,8 @@ void close_log(void);
 		errno = _saved_errno;					\
 	} while (0)
 
+extern int sock;
+
 extern int orig_argc;
 extern char **orig_argv;
 
@@ -394,14 +397,9 @@ int set_fd(int fd, short events);
 void set_special_fds(void);
 void handle_special_fds(void);
 
-void init_sockets(void);
-
 /* Close stdin/stdout/stderr to complete daemonize */
 void finish_daemonize(void);
 
-#ifndef NO_SOCKETS
-extern const struct interface_funcs socket_funcs;
-#endif
 extern xengnttab_handle **xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 6ef136e01f..040df98b8c 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1739,14 +1739,7 @@ void read_state_connection(const void *ctx, const void *state)
 	struct domain *domain, *tdomain;
 
 	if (sc->conn_type == XS_STATE_CONN_TYPE_SOCKET) {
-#ifdef NO_SOCKETS
-		barf("socket based connection without sockets");
-#else
-		conn = new_connection(&socket_funcs);
-		if (!conn)
-			barf("error restoring connection");
-		conn->fd = sc->spec.socket_fd;
-#endif
+		conn = add_socket_connection(sc->spec.socket_fd);
 	} else {
 		domain = introduce_domain(ctx, sc->spec.ring.domid,
 					  sc->spec.ring.evtchn, true);
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 3208169187..5d59cc90cc 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -18,12 +18,18 @@
 #include <sys/types.h>
 #include <sys/mman.h>
 #include "core.h"
+#include "utils.h"
 #include <xen/grant_table.h>
 
 void finish_daemonize(void)
 {
 }
 
+struct connection *add_socket_connection(int fd)
+{
+	barf("socket based connection without sockets");
+}
+
 evtchn_port_t get_xenbus_evtchn(void)
 {
 	return dom0_event;
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 2dbbef4a0b..f72c8406d2 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -24,6 +24,8 @@
 #include <stdlib.h>
 #include <syslog.h>
 #include <sys/mman.h>
+#include <sys/socket.h>
+#include <sys/un.h>
 #if defined(HAVE_SYSTEMD)
 #include <systemd/sd-daemon.h>
 #endif
@@ -32,10 +34,13 @@
 #include "utils.h"
 #include "core.h"
 #include "osdep.h"
+#include "talloc.h"
 
 static int reopen_log_pipe0_pollfd_idx = -1;
 static int reopen_log_pipe[2];
 
+static int sock_pollfd_idx = -1;
+
 static void write_pidfile(const char *pidfile)
 {
 	char buf[100];
@@ -180,6 +185,142 @@ void *xenbus_map(void)
 	return addr;
 }
 
+static int writefd(struct connection *conn, const void *data, unsigned int len)
+{
+	int rc;
+
+	while ((rc = write(conn->fd, data, len)) < 0) {
+		if (errno == EAGAIN) {
+			rc = 0;
+			break;
+		}
+		if (errno != EINTR)
+			break;
+	}
+
+	return rc;
+}
+
+static int readfd(struct connection *conn, void *data, unsigned int len)
+{
+	int rc;
+
+	while ((rc = read(conn->fd, data, len)) < 0) {
+		if (errno == EAGAIN) {
+			rc = 0;
+			break;
+		}
+		if (errno != EINTR)
+			break;
+	}
+
+	/* Reading zero length means we're done with this connection. */
+	if ((rc == 0) && (len != 0)) {
+		errno = EBADF;
+		rc = -1;
+	}
+
+	return rc;
+}
+
+static bool socket_can_process(struct connection *conn, int mask)
+{
+	if (conn->pollfd_idx == -1)
+		return false;
+
+	if (fds[conn->pollfd_idx].revents & ~(POLLIN | POLLOUT)) {
+		talloc_free(conn);
+		return false;
+	}
+
+	return (fds[conn->pollfd_idx].revents & mask);
+}
+
+static bool socket_can_write(struct connection *conn)
+{
+	return socket_can_process(conn, POLLOUT);
+}
+
+static bool socket_can_read(struct connection *conn)
+{
+	return socket_can_process(conn, POLLIN);
+}
+
+static const struct interface_funcs socket_funcs = {
+	.write = writefd,
+	.read = readfd,
+	.can_write = socket_can_write,
+	.can_read = socket_can_read,
+};
+
+static void accept_connection(int sock)
+{
+	int fd;
+	struct connection *conn;
+
+	fd = accept(sock, NULL, NULL);
+	if (fd < 0)
+		return;
+
+	conn = new_connection(&socket_funcs);
+	if (conn) {
+		conn->fd = fd;
+		conn->id = dom0_domid;
+	} else
+		close(fd);
+}
+
+static void destroy_fds(void)
+{
+	if (sock >= 0)
+		close(sock);
+}
+
+static void init_sockets(void)
+{
+	struct sockaddr_un addr;
+	const char *soc_str = xenstore_daemon_path();
+
+	if (!soc_str)
+		barf_perror("Failed to obtain xs domain socket");
+
+	/* Create sockets for them to listen to. */
+	atexit(destroy_fds);
+	sock = socket(PF_UNIX, SOCK_STREAM, 0);
+	if (sock < 0)
+		barf_perror("Could not create socket");
+
+	/* FIXME: Be more sophisticated, don't mug running daemon. */
+	unlink(soc_str);
+
+	addr.sun_family = AF_UNIX;
+
+	if (strlen(soc_str) >= sizeof(addr.sun_path))
+		barf_perror("socket string '%s' too long", soc_str);
+	strcpy(addr.sun_path, soc_str);
+	if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) != 0)
+		barf_perror("Could not bind socket to %s", soc_str);
+
+	if (chmod(soc_str, 0600) != 0)
+		barf_perror("Could not chmod sockets");
+
+	if (listen(sock, 1) != 0)
+		barf_perror("Could not listen on sockets");
+}
+
+
+struct connection *add_socket_connection(int fd)
+{
+	struct connection *conn;
+
+	conn = new_connection(&socket_funcs);
+	if (!conn)
+		barf("error restoring connection");
+	conn->fd = fd;
+
+	return conn;
+}
+
 void early_init(bool live_update, bool dofork, const char *pidfile)
 {
 	reopen_log();
@@ -212,6 +353,9 @@ void set_special_fds(void)
 	if (reopen_log_pipe[0] != -1)
 		reopen_log_pipe0_pollfd_idx =
 			set_fd(reopen_log_pipe[0], POLLIN|POLLPRI);
+
+	if (sock != -1)
+		sock_pollfd_idx = set_fd(sock, POLLIN|POLLPRI);
 }
 
 void handle_special_fds(void)
@@ -230,6 +374,15 @@ void handle_special_fds(void)
 		}
 		reopen_log_pipe0_pollfd_idx = -1;
 	}
+
+	if (sock_pollfd_idx != -1) {
+		if (fds[sock_pollfd_idx].revents & ~POLLIN) {
+			barf_perror("sock poll failed");
+		} else if (fds[sock_pollfd_idx].revents & POLLIN) {
+			accept_connection(sock);
+			sock_pollfd_idx = -1;
+		}
+	}
 }
 
 void late_init(bool live_update)
-- 
2.35.3


