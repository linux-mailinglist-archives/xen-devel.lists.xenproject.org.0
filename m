Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0166434E2F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 16:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213971.372356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdCqK-0004b2-HU; Wed, 20 Oct 2021 14:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213971.372356; Wed, 20 Oct 2021 14:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdCqK-0004YY-EX; Wed, 20 Oct 2021 14:45:24 +0000
Received: by outflank-mailman (input) for mailman id 213971;
 Wed, 20 Oct 2021 14:45:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdCqI-0004YS-OB
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 14:45:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdCqI-0007QL-2C; Wed, 20 Oct 2021 14:45:22 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdCqH-0005JQ-PP; Wed, 20 Oct 2021 14:45:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=mVYo4Q7l4H9spSVZovOiFSmUubsQkmmQfLszDEMKxKM=; b=VCjpvG
	Hq7+LupIfT9soPhBI4afqXvUT5iyzhD7HdwMNiIzPflys+KO9FB4Fdz9vPw8e7J6TZ7oOJ/OrmyoC
	Lk5Ei6mz5x8NowDR/lw5kc/s/OhiX4psixI3Jvdn0U0rIjxsLB+qm4f1F1S6UwsUfi4iUFeVOIvaQ
	XAurETVkrRc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.16] tools/xenstored: Ignore domain we were unable to restore
Date: Wed, 20 Oct 2021 14:45:19 +0000
Message-Id: <20211020144519.10362-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit 939775cfd3 "handle dying domains in live update" was meant to
handle gracefully dying domain. However, the @releaseDomain watch
will end up to be sent as soon as we finished to restore Xenstored
state.

This may be before Xen reports the domain to be dying (such as if
the guest decided to revoke access to the xenstore page). Consequently
daemon like xenconsoled will not clean-up the domain and it will be
left as a zombie.

To avoid the problem, mark the connection as ignored. This also
requires to tweak conn_can_write() and conn_can_read() to prevent
dereferencing a NULL pointer (the interface will not mapped).

The check conn->is_ignored was originally added after the callbacks
because the helpers for a socket connection may close the fd. However,
ignore_connection() will close a socket connection directly. So it is
fine to do the re-order.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This issue was originally found when developping commit 939775cfd3.
Unfortunately, due to some miscommunication the wrong patch was sent
upstream. The approach is re-using the one we discussed back then.

This was tested by modifying Linux to revoke the Xenstore grant during
boot. Without this patch, the domain will be left after Live-Update. Note
that on a basic setup (only xenconsoled and xl watch @releaseDomain),
the domain may be cleaned on the next domain shutdown/start.

Xenstore Live-Update is so far a tech preview feature. But I would still
like to request this patch to be included in 4.16 as this was meant to
be part of the original work.
---
 tools/xenstore/xenstored_core.c   |  8 ++++----
 tools/xenstore/xenstored_core.h   |  1 +
 tools/xenstore/xenstored_domain.c | 21 ++++++++++++---------
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 0d4c73d6e20c..91d093a12ea6 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -338,10 +338,10 @@ static int destroy_conn(void *_conn)
 
 static bool conn_can_read(struct connection *conn)
 {
-	if (!conn->funcs->can_read(conn))
+	if (conn->is_ignored)
 		return false;
 
-	if (conn->is_ignored)
+	if (!conn->funcs->can_read(conn))
 		return false;
 
 	/*
@@ -356,7 +356,7 @@ static bool conn_can_read(struct connection *conn)
 
 static bool conn_can_write(struct connection *conn)
 {
-	return conn->funcs->can_write(conn) && !conn->is_ignored;
+	return !conn->is_ignored && conn->funcs->can_write(conn);
 }
 
 /* This function returns index inside the array if succeed, -1 if fail */
@@ -1466,7 +1466,7 @@ static struct {
  *
  * All watches, transactions, buffers will be freed.
  */
-static void ignore_connection(struct connection *conn)
+void ignore_connection(struct connection *conn)
 {
 	struct buffered_data *out, *tmp;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 258f6ff38279..07d861d92499 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -206,6 +206,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 
 struct connection *new_connection(const struct interface_funcs *funcs);
 struct connection *get_connection_by_id(unsigned int conn_id);
+void ignore_connection(struct connection *conn);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 47e9107c144e..d03c7d93a9e7 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -268,14 +268,7 @@ void check_domains(void)
 				domain->shutdown = true;
 				notify = 1;
 			}
-			/*
-			 * On Restore, we may have been unable to remap the
-			 * interface and the port. As we don't know whether
-			 * this was because of a dying domain, we need to
-			 * check if the interface and port are still valid.
-			 */
-			if (!dominfo.dying && domain->port &&
-			    domain->interface)
+			if (!dominfo.dying)
 				continue;
 		}
 		if (domain->conn) {
@@ -1303,6 +1296,17 @@ void read_state_connection(const void *ctx, const void *state)
 		if (!domain)
 			barf("domain allocation error");
 
+		conn = domain->conn;
+
+		/*
+		 * We may not have been able to restore the domain (for
+		 * instance because it revoked the Xenstore grant). We need
+		 * to keep it around to send @releaseDomain when it is
+		 * dead. So mark it as ignored.
+		 */
+		if (!domain->port || !domain->interface)
+			ignore_connection(conn);
+
 		if (sc->spec.ring.tdomid != DOMID_INVALID) {
 			tdomain = find_or_alloc_domain(ctx,
 						       sc->spec.ring.tdomid);
@@ -1311,7 +1315,6 @@ void read_state_connection(const void *ctx, const void *state)
 			talloc_reference(domain->conn, tdomain->conn);
 			domain->conn->target = tdomain->conn;
 		}
-		conn = domain->conn;
 	}
 
 	conn->conn_id = sc->conn_id;
-- 
2.32.0


