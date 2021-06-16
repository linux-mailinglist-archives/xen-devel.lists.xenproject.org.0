Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BC3A9DEF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143283.264159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlU-0006BI-JA; Wed, 16 Jun 2021 14:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143283.264159; Wed, 16 Jun 2021 14:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlU-000673-FM; Wed, 16 Jun 2021 14:43:36 +0000
Received: by outflank-mailman (input) for mailman id 143283;
 Wed, 16 Jun 2021 14:43:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlS-0005nk-El
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlR-0004DX-Ey; Wed, 16 Jun 2021 14:43:33 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlR-0007D0-6H; Wed, 16 Jun 2021 14:43:33 +0000
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
	 bh=JWVgF6QLGsEmGe+em+lI3NsrndUxxF4I6/J85EZgUFY=; b=h5Gm1UgtjuzByYBGo/uL1qERD
	AQ6/Ty3bvZNqIFGvz4uzKFSq678gloxDxx0aUTyDcS0wasJkoZU0LMceRM2U/xBk9hxhC1hrvrlYS
	a2Lxgoy+JUaD6DGl+LXH67uFsAXRmV118MeIXQDj1l/zvOfaxUIqSpS8RETriuWbq2R1I=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 04/10] tools/xenstored: Limit the number of requests a connection can delay
Date: Wed, 16 Jun 2021 15:43:18 +0100
Message-Id: <20210616144324.31652-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Currently, only liveupdate request can be delayed. The request can only
be performed by a privileged connection (e.g. dom0). So it is fine to
have no limits.

In a follow-up patch we will want to delay request for unprivileged
connection as well. So it is best to apply a limit.

For now and for simplicity, only a single request can be delayed
for a given unprivileged connection.

Take the opportunity to tweak the prototype and provide a way to
bypass the quota check. This would be useful when the function
is called from the restore code.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c |  2 +-
 tools/xenstore/xenstored_core.c    | 11 ++++++++++-
 tools/xenstore/xenstored_core.h    |  3 ++-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 7acc2d134f9f..1c24d4869eab 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -737,7 +737,7 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 	lu_status->timeout = to;
 	lu_status->started_at = time(NULL);
 
-	errno = delay_request(conn, conn->in, do_lu_start, NULL);
+	errno = delay_request(conn, conn->in, do_lu_start, NULL, false);
 
 	return NULL;
 }
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 41b26d7094c8..51d210828922 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -279,10 +279,19 @@ static void call_delayed(struct connection *conn, struct delayed_request *req)
 }
 
 int delay_request(struct connection *conn, struct buffered_data *in,
-		  bool (*func)(struct delayed_request *), void *data)
+		  bool (*func)(struct delayed_request *), void *data,
+		  bool no_quota_check)
 {
 	struct delayed_request *req;
 
+	/*
+	 * Only allow one request can be delayed for an unprivileged
+	 * connection.
+	 */
+	if (!no_quota_check && domain_is_unprivileged(conn) &&
+	    !list_empty(&conn->delayed))
+		return ENOSPC;
+
 	req = talloc(in, struct delayed_request);
 	if (!req)
 		return ENOMEM;
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 89ce155e755b..34839b34f6e9 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -213,7 +213,8 @@ char *get_parent(const void *ctx, const char *node);
 
 /* Delay a request. */
 int delay_request(struct connection *conn, struct buffered_data *in,
-		  bool (*func)(struct delayed_request *), void *data);
+		  bool (*func)(struct delayed_request *), void *data,
+		  bool no_quota_check);
 
 /* Tracing infrastructure. */
 void trace_create(const void *data, const char *type);
-- 
2.17.1


