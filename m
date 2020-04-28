Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4D11BC21E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 16:59:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTRh4-0001Hn-Q1; Tue, 28 Apr 2020 14:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DYx7=6M=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jTRh3-0001Hi-4D
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 14:58:41 +0000
X-Inumbo-ID: bebdd44c-8960-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bebdd44c-8960-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 14:58:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 77637ACC3;
 Tue, 28 Apr 2020 14:58:38 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] tools/xenstore: simplify socket initialization
Date: Tue, 28 Apr 2020 16:58:37 +0200
Message-Id: <20200428145837.6099-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The setup of file descriptors for the Xenstore sockets is needlessly
complicated: the space is allocated dynamically, while two static
variables really would do the job.

For tearing down the sockets it is easier to widen the scope of the
file descriptors from function to file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c | 69 ++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 42 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 551fe38f57..7bd959f28b 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -70,6 +70,9 @@ static struct pollfd *fds;
 static unsigned int current_array_size;
 static unsigned int nr_fds;
 
+static int sock = -1;
+static int ro_sock = -1;
+
 #define ROUNDUP(_x, _w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 
 static bool verbose = false;
@@ -310,8 +313,7 @@ fail:
 	return -1;
 }
 
-static void initialize_fds(int sock, int *p_sock_pollfd_idx,
-			   int ro_sock, int *p_ro_sock_pollfd_idx,
+static void initialize_fds(int *p_sock_pollfd_idx, int *p_ro_sock_pollfd_idx,
 			   int *ptimeout)
 {
 	struct connection *conn;
@@ -1789,43 +1791,29 @@ void corrupt(struct connection *conn, const char *fmt, ...)
 	check_store();
 }
 
-
-#ifdef NO_SOCKETS
-static void init_sockets(int **psock, int **pro_sock)
-{
-	static int minus_one = -1;
-	*psock = *pro_sock = &minus_one;
-}
-#else
-static int destroy_fd(void *_fd)
+#ifndef NO_SOCKETS
+static void destroy_fds(void)
 {
-	int *fd = _fd;
-	close(*fd);
-	return 0;
+	if (sock >= 0)
+		close(sock);
+	if (ro_sock >= 0)
+		close(ro_sock);
 }
 
-static void init_sockets(int **psock, int **pro_sock)
+static void init_sockets(void)
 {
 	struct sockaddr_un addr;
-	int *sock, *ro_sock;
 	const char *soc_str = xs_daemon_socket();
 	const char *soc_str_ro = xs_daemon_socket_ro();
 
 	/* Create sockets for them to listen to. */
-	*psock = sock = talloc(talloc_autofree_context(), int);
-	if (!sock)
-		barf_perror("No memory when creating sockets");
-	*sock = socket(PF_UNIX, SOCK_STREAM, 0);
-	if (*sock < 0)
+	atexit(destroy_fds);
+	sock = socket(PF_UNIX, SOCK_STREAM, 0);
+	if (sock < 0)
 		barf_perror("Could not create socket");
-	*pro_sock = ro_sock = talloc(talloc_autofree_context(), int);
-	if (!ro_sock)
-		barf_perror("No memory when creating sockets");
-	*ro_sock = socket(PF_UNIX, SOCK_STREAM, 0);
-	if (*ro_sock < 0)
+	ro_sock = socket(PF_UNIX, SOCK_STREAM, 0);
+	if (ro_sock < 0)
 		barf_perror("Could not create socket");
-	talloc_set_destructor(sock, destroy_fd);
-	talloc_set_destructor(ro_sock, destroy_fd);
 
 	/* FIXME: Be more sophisticated, don't mug running daemon. */
 	unlink(soc_str);
@@ -1836,24 +1824,21 @@ static void init_sockets(int **psock, int **pro_sock)
 	if(strlen(soc_str) >= sizeof(addr.sun_path))
 		barf_perror("socket string '%s' too long", soc_str);
 	strcpy(addr.sun_path, soc_str);
-	if (bind(*sock, (struct sockaddr *)&addr, sizeof(addr)) != 0)
+	if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) != 0)
 		barf_perror("Could not bind socket to %s", soc_str);
 
 	if(strlen(soc_str_ro) >= sizeof(addr.sun_path))
 		barf_perror("socket string '%s' too long", soc_str_ro);
 	strcpy(addr.sun_path, soc_str_ro);
-	if (bind(*ro_sock, (struct sockaddr *)&addr, sizeof(addr)) != 0)
+	if (bind(ro_sock, (struct sockaddr *)&addr, sizeof(addr)) != 0)
 		barf_perror("Could not bind socket to %s", soc_str_ro);
 
 	if (chmod(soc_str, 0600) != 0
 	    || chmod(soc_str_ro, 0660) != 0)
 		barf_perror("Could not chmod sockets");
 
-	if (listen(*sock, 1) != 0
-	    || listen(*ro_sock, 1) != 0)
+	if (listen(sock, 1) != 0 || listen(ro_sock, 1) != 0)
 		barf_perror("Could not listen on sockets");
-
-
 }
 #endif
 
@@ -1909,7 +1894,7 @@ int priv_domid = 0;
 
 int main(int argc, char *argv[])
 {
-	int opt, *sock = NULL, *ro_sock = NULL;
+	int opt;
 	int sock_pollfd_idx = -1, ro_sock_pollfd_idx = -1;
 	bool dofork = true;
 	bool outputpid = false;
@@ -1997,7 +1982,9 @@ int main(int argc, char *argv[])
 
 	talloc_enable_null_tracking();
 
-	init_sockets(&sock, &ro_sock);
+#ifndef NO_SOCKETS
+	init_sockets();
+#endif
 
 	init_pipe(reopen_log_pipe);
 
@@ -2025,8 +2012,7 @@ int main(int argc, char *argv[])
 		tracefile = talloc_strdup(NULL, tracefile);
 
 	/* Get ready to listen to the tools. */
-	initialize_fds(*sock, &sock_pollfd_idx, *ro_sock, &ro_sock_pollfd_idx,
-		       &timeout);
+	initialize_fds(&sock_pollfd_idx, &ro_sock_pollfd_idx, &timeout);
 
 	/* Tell the kernel we're up and running. */
 	xenbus_notify_running();
@@ -2067,7 +2053,7 @@ int main(int argc, char *argv[])
 				barf_perror("sock poll failed");
 				break;
 			} else if (fds[sock_pollfd_idx].revents & POLLIN) {
-				accept_connection(*sock, true);
+				accept_connection(sock, true);
 				sock_pollfd_idx = -1;
 			}
 		}
@@ -2077,7 +2063,7 @@ int main(int argc, char *argv[])
 				barf_perror("ro sock poll failed");
 				break;
 			} else if (fds[ro_sock_pollfd_idx].revents & POLLIN) {
-				accept_connection(*ro_sock, false);
+				accept_connection(ro_sock, false);
 				ro_sock_pollfd_idx = -1;
 			}
 		}
@@ -2144,8 +2130,7 @@ int main(int argc, char *argv[])
 			}
 		}
 
-		initialize_fds(*sock, &sock_pollfd_idx, *ro_sock,
-			       &ro_sock_pollfd_idx, &timeout);
+		initialize_fds(&sock_pollfd_idx, &ro_sock_pollfd_idx, &timeout);
 	}
 }
 
-- 
2.16.4


