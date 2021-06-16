Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714423A9E25
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143346.264247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWue-0004tH-SQ; Wed, 16 Jun 2021 14:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143346.264247; Wed, 16 Jun 2021 14:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWue-0004qs-P1; Wed, 16 Jun 2021 14:53:04 +0000
Received: by outflank-mailman (input) for mailman id 143346;
 Wed, 16 Jun 2021 14:53:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWud-0004qk-Hr
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:53:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWuc-0004SR-Hr; Wed, 16 Jun 2021 14:53:02 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlZ-0007D0-DF; Wed, 16 Jun 2021 14:43:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Vb1oaoq7rCyl8ROu/TuBrNZhgyUJCaVoNnm3GNRQzS4=; b=p1H5ZlKe0o33n7Y6Jw6qdCJfi
	lCvnJmoLm7XvEURSpqGX7ozQUOxBvRPyBKO9y9zdBhJLGULKpSi7TlK5VROa9Jn3s2bnzFBc/F+oX
	38pKHjDTyjAWlZl4hrqjMKRl+VYTcckleX02VhdzhAB9+2icGQsW8t3Gfw5gvdTER27Iw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 10/10] tools/xenstored: Delay new transaction while Live-Update is pending
Date: Wed, 16 Jun 2021 15:43:24 +0100
Message-Id: <20210616144324.31652-11-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, Live-Update will, by default, not proceed if there are
in-flight transactions. It is possible force it by passing -F but this
will break any connection with in-flight transactions.

There are PV drivers out that may never terminate some transaction. On
host running such guest, we would need to use -F. Unfortunately, this
also risks to break well-behaving guests (and even dom0) because
Live-Update will happen as soon as the timeout is hit.

Ideally, we would want to preserve transactions but this requires
some work and a lot of testing to be able to use it in production.

As a stop gap, we want to limit the damage of -F. This patch will delay
any transactions that are started after Live-Update has been requested.

If the request cannot be delayed, the connection will be stalled to
avoid loosing requests.

If the connection has already a pending transaction before Live-Update,
then new transaction will not be delayed. This is to avoid the connection
to stall.

With this stop gap in place, domains with long running transactions will
still break when using -F, but other domains which starts a transaction
in the middle of Live-Update will continue to work.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 10 ++++++
 tools/xenstore/xenstored_control.h |  2 ++
 tools/xenstore/xenstored_core.c    | 49 +++++++++++++++++++++++++++++-
 tools/xenstore/xenstored_core.h    |  3 ++
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 1c24d4869eab..a045f102a420 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -131,6 +131,11 @@ unsigned int lu_write_response(FILE *fp)
 	return sizeof(msg) + msg.len;
 }
 
+bool lu_is_pending(void)
+{
+	return lu_status != NULL;
+}
+
 #else
 struct connection *lu_get_connection(void)
 {
@@ -142,6 +147,11 @@ unsigned int lu_write_response(FILE *fp)
 	/* Unsupported */
 	return 0;
 }
+
+bool lu_is_pending(void)
+{
+	return false;
+}
 #endif
 
 struct cmd_s {
diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstored_control.h
index 27d7f19e4b7f..98b6fbcea2b1 100644
--- a/tools/xenstore/xenstored_control.h
+++ b/tools/xenstore/xenstored_control.h
@@ -23,3 +23,5 @@ struct connection *lu_get_connection(void);
 
 /* Write the "OK" response for the live-update command */
 unsigned int lu_write_response(FILE *fp);
+
+bool lu_is_pending(void);
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 9eca58682b51..10b53af76ac5 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -338,7 +338,20 @@ static int destroy_conn(void *_conn)
 
 static bool conn_can_read(struct connection *conn)
 {
-	return conn->funcs->can_read(conn) && !conn->is_ignored;
+	if (!conn->funcs->can_read(conn))
+		return false;
+
+	if (conn->is_ignored)
+		return false;
+
+	/*
+	 * For stalled connection, we want to process the pending
+	 * command as soon as live-update has aborted.
+	 */
+	if (conn->is_stalled)
+		return !lu_is_pending();
+
+	return true;
 }
 
 static bool conn_can_write(struct connection *conn)
@@ -417,6 +430,12 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 			if (!list_empty(&conn->out_list))
 				events |= POLLOUT;
 			conn->pollfd_idx = set_fd(conn->fd, events);
+			/*
+			 * For stalled connection, we want to process the
+			 * pending command as soon as live-update has aborted.
+			 */
+			if (conn->is_stalled && !lu_is_pending())
+				*ptimeout = 0;
 		}
 	}
 }
@@ -1524,6 +1543,9 @@ static bool process_delayed_message(struct delayed_request *req)
 	struct connection *conn = req->data;
 	struct buffered_data *saved_in = conn->in;
 
+	if (lu_is_pending())
+		return false;
+
 	/*
 	 * Part of process_message() expects conn->in to contains the
 	 * processed response. So save the current conn->in and restore it
@@ -1543,6 +1565,30 @@ static void consider_message(struct connection *conn)
 			sockmsg_string(conn->in->hdr.msg.type),
 			conn->in->hdr.msg.len, conn);
 
+	conn->is_stalled = false;
+	/*
+	 * Currently, Live-Update is not supported if there is active
+	 * transactions. In order to reduce the number of retry, delay
+	 * any new request to start a transaction if Live-Update is pending
+	 * and there are no transactions in-flight.
+	 *
+	 * If we can't delay the request, then mark the connection as
+	 * stalled. This will ignore new requests until Live-Update happened
+	 * or it was aborted.
+	 */
+	if (lu_is_pending() && conn->transaction_started == 0 &&
+	    conn->in->hdr.msg.type == XS_TRANSACTION_START) {
+		trace("Delaying transaction start for connection %p req_id %u\n",
+		      conn, conn->in->hdr.msg.req_id);
+
+		if (delay_request(conn, conn->in, process_delayed_message,
+				  conn, false) != 0) {
+			trace("Stalling connection %p\n", conn);
+			conn->is_stalled = true;
+		}
+		return;
+	}
+
 	process_message(conn, conn->in);
 
 	assert(conn->in == NULL);
@@ -1629,6 +1675,7 @@ struct connection *new_connection(const struct interface_funcs *funcs)
 	new->pollfd_idx = -1;
 	new->funcs = funcs;
 	new->is_ignored = false;
+	new->is_stalled = false;
 	new->transaction_started = 0;
 	INIT_LIST_HEAD(&new->out_list);
 	INIT_LIST_HEAD(&new->watches);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index dac517156993..258f6ff38279 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -110,6 +110,9 @@ struct connection
 	/* Is this connection ignored? */
 	bool is_ignored;
 
+	/* Is the connection stalled? */
+	bool is_stalled;
+
 	/* Buffered incoming data. */
 	struct buffered_data *in;
 
-- 
2.17.1


