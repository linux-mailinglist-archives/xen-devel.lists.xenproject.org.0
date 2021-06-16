Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D73A9DF2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143285.264183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlX-0006nS-Ed; Wed, 16 Jun 2021 14:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143285.264183; Wed, 16 Jun 2021 14:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlX-0006jk-6g; Wed, 16 Jun 2021 14:43:39 +0000
Received: by outflank-mailman (input) for mailman id 143285;
 Wed, 16 Jun 2021 14:43:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlV-0006Mk-5F
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlU-0004E6-6M; Wed, 16 Jun 2021 14:43:36 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlT-0007D0-U4; Wed, 16 Jun 2021 14:43:36 +0000
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
	 bh=ZvLpylj/UqcYoOOmC8VRLGxCMI8WwLt87nHoKc1byWA=; b=FYK8bYQfTjgnv0czNv4OhkHKe
	fPm5TAmEg1tQm63lBFvvY2P/mdoDDnRH6FLSvrv05vR38D2NXBtJ4nSrPYxW8I4anfx15txQMWTS5
	klUweyg5PW5A7yUraRaA0Qjd4mHPIcMDsq2hpu6Xo4882oi6ehJj45LJS4qxkH4Ac/tds=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 06/10] tools/xenstored: Introduce a wrapper for conn->funcs->can_{read, write}
Date: Wed, 16 Jun 2021 15:43:20 +0100
Message-Id: <20210616144324.31652-7-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Currently, the callbacks can_read and can_write are called directly. This
doesn't allow us to add generic check and therefore requires duplication.

At the moment, one check that could benefit to be common is whether the
connection should ignored. The position is slightly different between
domain and socket because for the latter we want to check the state of
the file descriptor first.

In follow-up patches, there will be more potential generic checks.

This patch provides wrappers to read/write a connection and move
the check ->is_ignored after the callback for everyone.

This also requires to replace the direct call to domain_can_read()
and domain_can_write() with the new wrapper. At the same time,
both functions can now be static. Note that the implementations need
to be moved earlier in the file xenstored_domain.c to avoid
declaring the prototype.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c   | 18 ++++++++++----
 tools/xenstore/xenstored_domain.c | 40 +++++++++++++------------------
 tools/xenstore/xenstored_domain.h |  4 ----
 3 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 51d210828922..2e5760fe4599 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -334,6 +334,16 @@ static int destroy_conn(void *_conn)
 	return 0;
 }
 
+static bool conn_can_read(struct connection *conn)
+{
+	return conn->funcs->can_read(conn) && !conn->is_ignored;
+}
+
+static bool conn_can_write(struct connection *conn)
+{
+	return conn->funcs->can_write(conn) && !conn->is_ignored;
+}
+
 /* This function returns index inside the array if succeed, -1 if fail */
 static int set_fd(int fd, short events)
 {
@@ -396,8 +406,8 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	list_for_each_entry(conn, &connections, list) {
 		if (conn->domain) {
 			wrl_check_timeout(conn->domain, now, ptimeout);
-			if (domain_can_read(conn) ||
-			    (domain_can_write(conn) &&
+			if (conn_can_read(conn) ||
+			    (conn_can_write(conn) &&
 			     !list_empty(&conn->out_list)))
 				*ptimeout = 0;
 		} else {
@@ -2325,14 +2335,14 @@ int main(int argc, char *argv[])
 			if (&next->list != &connections)
 				talloc_increase_ref_count(next);
 
-			if (conn->funcs->can_read(conn))
+			if (conn_can_read(conn))
 				handle_input(conn);
 			if (talloc_free(conn) == 0)
 				continue;
 
 			talloc_increase_ref_count(conn);
 
-			if (conn->funcs->can_write(conn))
+			if (conn_can_write(conn))
 				handle_output(conn);
 			if (talloc_free(conn) == 0)
 				continue;
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 6d8d29cbe41c..47e9107c144e 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -172,6 +172,23 @@ static int readchn(struct connection *conn, void *data, unsigned int len)
 	return len;
 }
 
+static bool domain_can_write(struct connection *conn)
+{
+	struct xenstore_domain_interface *intf = conn->domain->interface;
+
+	return ((intf->rsp_prod - intf->rsp_cons) != XENSTORE_RING_SIZE);
+}
+
+static bool domain_can_read(struct connection *conn)
+{
+	struct xenstore_domain_interface *intf = conn->domain->interface;
+
+	if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
+		return false;
+
+	return (intf->req_cons != intf->req_prod);
+}
+
 static const struct interface_funcs domain_funcs = {
 	.write = writechn,
 	.read = readchn,
@@ -290,19 +307,6 @@ void handle_event(void)
 		barf_perror("Failed to write to event fd");
 }
 
-bool domain_can_read(struct connection *conn)
-{
-	struct xenstore_domain_interface *intf = conn->domain->interface;
-
-	if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
-		return false;
-
-	if (conn->is_ignored)
-		return false;
-
-	return (intf->req_cons != intf->req_prod);
-}
-
 static bool domid_is_unprivileged(unsigned int domid)
 {
 	return domid != 0 && domid != priv_domid;
@@ -314,16 +318,6 @@ bool domain_is_unprivileged(struct connection *conn)
 	       domid_is_unprivileged(conn->domain->domid);
 }
 
-bool domain_can_write(struct connection *conn)
-{
-	struct xenstore_domain_interface *intf = conn->domain->interface;
-
-	if (conn->is_ignored)
-		return false;
-
-	return ((intf->rsp_prod - intf->rsp_cons) != XENSTORE_RING_SIZE);
-}
-
 static char *talloc_domain_path(void *context, unsigned int domid)
 {
 	return talloc_asprintf(context, "/local/domain/%u", domid);
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 62ee471ea6aa..1e929b8f8c6f 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -51,10 +51,6 @@ void domain_deinit(void);
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn);
 
-/* Can connection attached to domain read/write. */
-bool domain_can_read(struct connection *conn);
-bool domain_can_write(struct connection *conn);
-
 bool domain_is_unprivileged(struct connection *conn);
 
 /* Remove node permissions for no longer existing domains. */
-- 
2.17.1


