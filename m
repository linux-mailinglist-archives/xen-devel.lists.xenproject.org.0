Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA95F2816DF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 17:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2233.6619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONBx-00070i-Gc; Fri, 02 Oct 2020 15:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2233.6619; Fri, 02 Oct 2020 15:41:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONBx-000700-Bu; Fri, 02 Oct 2020 15:41:53 +0000
Received: by outflank-mailman (input) for mailman id 2233;
 Fri, 02 Oct 2020 15:41:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kONBv-0006v4-Lm
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6be06e3-4dd6-46e8-99d2-81f82e469325;
 Fri, 02 Oct 2020 15:41:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B62D0B26A;
 Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kONBv-0006v4-Lm
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:51 +0000
X-Inumbo-ID: d6be06e3-4dd6-46e8-99d2-81f82e469325
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d6be06e3-4dd6-46e8-99d2-81f82e469325;
	Fri, 02 Oct 2020 15:41:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601653305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVXyqd8+BJ9r6/80OoSoimGVYzfPs4ujpYo9jzSMuLs=;
	b=lGKrfw3ovFXY/f0HnxIqVDT9WUvjzxqKl5mkUEO2DdqbN7vwbeFGwpigFPMLDAIq8iQHxh
	2BgPOERbcaKx/yQJxlihiJIPA2K/9pohTxv68O+RxGDgtUBu8bnJ6DWOkbb59nQj8lUi1+
	MMCN6fS6iw7rzh31iqkZ/2m7gjLkzAQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B62D0B26A;
	Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] tools/xenstore: drop creation of read-only socket in xenstored
Date: Fri,  2 Oct 2020 17:41:41 +0200
Message-Id: <20201002154141.11677-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002154141.11677-1-jgross@suse.com>
References: <20201002154141.11677-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With xs_daemon_open_readonly() now no longer using the read-only socket
the creation of that socket can be dropped.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   | 55 +++++++------------------------
 tools/xenstore/xenstored_core.h   |  3 --
 tools/xenstore/xenstored_domain.c |  4 +--
 tools/xenstore/xs_lib.c           |  8 +----
 4 files changed, 14 insertions(+), 56 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 9700772d40..b4be374d3f 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -71,7 +71,6 @@ static unsigned int current_array_size;
 static unsigned int nr_fds;
 
 static int sock = -1;
-static int ro_sock = -1;
 
 static bool verbose = false;
 LIST_HEAD(connections);
@@ -311,8 +310,7 @@ fail:
 	return -1;
 }
 
-static void initialize_fds(int *p_sock_pollfd_idx, int *p_ro_sock_pollfd_idx,
-			   int *ptimeout)
+static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 {
 	struct connection *conn;
 	struct wrl_timestampt now;
@@ -325,8 +323,6 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *p_ro_sock_pollfd_idx,
 
 	if (sock != -1)
 		*p_sock_pollfd_idx = set_fd(sock, POLLIN|POLLPRI);
-	if (ro_sock != -1)
-		*p_ro_sock_pollfd_idx = set_fd(ro_sock, POLLIN|POLLPRI);
 	if (reopen_log_pipe[0] != -1)
 		reopen_log_pipe0_pollfd_idx =
 			set_fd(reopen_log_pipe[0], POLLIN|POLLPRI);
@@ -472,9 +468,6 @@ static enum xs_perm_type perm_for_conn(struct connection *conn,
 	unsigned int i;
 	enum xs_perm_type mask = XS_PERM_READ|XS_PERM_WRITE|XS_PERM_OWNER;
 
-	if (!conn->can_write)
-		mask &= ~XS_PERM_WRITE;
-
 	/* Owners and tools get it all... */
 	if (!domain_is_unprivileged(conn) || perms[0].id == conn->id
                 || (conn->target && perms[0].id == conn->target->id))
@@ -1422,7 +1415,6 @@ struct connection *new_connection(connwritefn_t *write, connreadfn_t *read)
 	new->pollfd_idx = -1;
 	new->write = write;
 	new->read = read;
-	new->can_write = true;
 	new->transaction_started = 0;
 	INIT_LIST_HEAD(&new->out_list);
 	INIT_LIST_HEAD(&new->watches);
@@ -1435,7 +1427,7 @@ struct connection *new_connection(connwritefn_t *write, connreadfn_t *read)
 }
 
 #ifdef NO_SOCKETS
-static void accept_connection(int sock, bool canwrite)
+static void accept_connection(int sock)
 {
 }
 #else
@@ -1477,7 +1469,7 @@ static int readfd(struct connection *conn, void *data, unsigned int len)
 	return rc;
 }
 
-static void accept_connection(int sock, bool canwrite)
+static void accept_connection(int sock)
 {
 	int fd;
 	struct connection *conn;
@@ -1487,10 +1479,9 @@ static void accept_connection(int sock, bool canwrite)
 		return;
 
 	conn = new_connection(writefd, readfd);
-	if (conn) {
+	if (conn)
 		conn->fd = fd;
-		conn->can_write = canwrite;
-	} else
+	else
 		close(fd);
 }
 #endif
@@ -1794,28 +1785,21 @@ static void destroy_fds(void)
 {
 	if (sock >= 0)
 		close(sock);
-	if (ro_sock >= 0)
-		close(ro_sock);
 }
 
 static void init_sockets(void)
 {
 	struct sockaddr_un addr;
 	const char *soc_str = xs_daemon_socket();
-	const char *soc_str_ro = xs_daemon_socket_ro();
 
 	/* Create sockets for them to listen to. */
 	atexit(destroy_fds);
 	sock = socket(PF_UNIX, SOCK_STREAM, 0);
 	if (sock < 0)
 		barf_perror("Could not create socket");
-	ro_sock = socket(PF_UNIX, SOCK_STREAM, 0);
-	if (ro_sock < 0)
-		barf_perror("Could not create socket");
 
 	/* FIXME: Be more sophisticated, don't mug running daemon. */
 	unlink(soc_str);
-	unlink(soc_str_ro);
 
 	addr.sun_family = AF_UNIX;
 
@@ -1825,17 +1809,10 @@ static void init_sockets(void)
 	if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) != 0)
 		barf_perror("Could not bind socket to %s", soc_str);
 
-	if(strlen(soc_str_ro) >= sizeof(addr.sun_path))
-		barf_perror("socket string '%s' too long", soc_str_ro);
-	strcpy(addr.sun_path, soc_str_ro);
-	if (bind(ro_sock, (struct sockaddr *)&addr, sizeof(addr)) != 0)
-		barf_perror("Could not bind socket to %s", soc_str_ro);
-
-	if (chmod(soc_str, 0600) != 0
-	    || chmod(soc_str_ro, 0660) != 0)
+	if (chmod(soc_str, 0600) != 0)
 		barf_perror("Could not chmod sockets");
 
-	if (listen(sock, 1) != 0 || listen(ro_sock, 1) != 0)
+	if (listen(sock, 1) != 0)
 		barf_perror("Could not listen on sockets");
 }
 #endif
@@ -1893,7 +1870,7 @@ int priv_domid = 0;
 int main(int argc, char *argv[])
 {
 	int opt;
-	int sock_pollfd_idx = -1, ro_sock_pollfd_idx = -1;
+	int sock_pollfd_idx = -1;
 	bool dofork = true;
 	bool outputpid = false;
 	bool no_domain_init = false;
@@ -2010,7 +1987,7 @@ int main(int argc, char *argv[])
 		tracefile = talloc_strdup(NULL, tracefile);
 
 	/* Get ready to listen to the tools. */
-	initialize_fds(&sock_pollfd_idx, &ro_sock_pollfd_idx, &timeout);
+	initialize_fds(&sock_pollfd_idx, &timeout);
 
 	/* Tell the kernel we're up and running. */
 	xenbus_notify_running();
@@ -2051,21 +2028,11 @@ int main(int argc, char *argv[])
 				barf_perror("sock poll failed");
 				break;
 			} else if (fds[sock_pollfd_idx].revents & POLLIN) {
-				accept_connection(sock, true);
+				accept_connection(sock);
 				sock_pollfd_idx = -1;
 			}
 		}
 
-		if (ro_sock_pollfd_idx != -1) {
-			if (fds[ro_sock_pollfd_idx].revents & ~POLLIN) {
-				barf_perror("ro sock poll failed");
-				break;
-			} else if (fds[ro_sock_pollfd_idx].revents & POLLIN) {
-				accept_connection(ro_sock, false);
-				ro_sock_pollfd_idx = -1;
-			}
-		}
-
 		if (xce_pollfd_idx != -1) {
 			if (fds[xce_pollfd_idx].revents & ~POLLIN) {
 				barf_perror("xce_handle poll failed");
@@ -2128,7 +2095,7 @@ int main(int argc, char *argv[])
 			}
 		}
 
-		initialize_fds(&sock_pollfd_idx, &ro_sock_pollfd_idx, &timeout);
+		initialize_fds(&sock_pollfd_idx, &timeout);
 	}
 }
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index c4c32bc88f..1df6ad94ab 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -77,9 +77,6 @@ struct connection
 	/* Who am I? 0 for socket connections. */
 	unsigned int id;
 
-	/* Is this a read-only connection? */
-	bool can_write;
-
 	/* Buffered incoming data. */
 	struct buffered_data *in;
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 0d5495745b..a2f144f6dd 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -372,7 +372,7 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
 		return EINVAL;
 
-	if (domain_is_unprivileged(conn) || !conn->can_write)
+	if (domain_is_unprivileged(conn))
 		return EACCES;
 
 	domid = atoi(vec[0]);
@@ -438,7 +438,7 @@ int do_set_target(struct connection *conn, struct buffered_data *in)
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
 		return EINVAL;
 
-	if (domain_is_unprivileged(conn) || !conn->can_write)
+	if (domain_is_unprivileged(conn))
 		return EACCES;
 
 	domid = atoi(vec[0]);
diff --git a/tools/xenstore/xs_lib.c b/tools/xenstore/xs_lib.c
index 3e43f8809d..9f1dc6d559 100644
--- a/tools/xenstore/xs_lib.c
+++ b/tools/xenstore/xs_lib.c
@@ -63,13 +63,7 @@ const char *xs_daemon_socket(void)
 
 const char *xs_daemon_socket_ro(void)
 {
-	static char buf[PATH_MAX];
-	const char *s = xs_daemon_path();
-	if (s == NULL)
-		return NULL;
-	if (snprintf(buf, sizeof(buf), "%s_ro", s) >= PATH_MAX)
-		return NULL;
-	return buf;
+	return xs_daemon_path();
 }
 
 const char *xs_domain_dev(void)
-- 
2.26.2


