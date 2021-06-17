Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B03ABAB9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 19:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144104.265302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltvz0-0006Dx-Rt; Thu, 17 Jun 2021 17:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144104.265302; Thu, 17 Jun 2021 17:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltvz0-0006C0-Nr; Thu, 17 Jun 2021 17:39:14 +0000
Received: by outflank-mailman (input) for mailman id 144104;
 Thu, 17 Jun 2021 17:39:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltvyy-0006Bt-NB
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 17:39:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltvyw-0006QJ-Tj; Thu, 17 Jun 2021 17:39:10 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltvyw-0005rm-J9; Thu, 17 Jun 2021 17:39:10 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=YCJ6YwBhcj+J/NT2ZL9DliHisUCCsiW9BvW2U/IOO7k=; b=QTV/RS55dT4GgwXF8tblze5OSE
	U2AqSOWtgWVKQgfEGN6Re+9h6/+uSY5EXdR5Wf1Fxht3k3u2EDhq19hsE5HMNKgFsOTTEajJBE6nR
	WVqQaqoQD3/nnlsnFv1d8Z/jcHBRtcKvc4fH05jgy4X1bSKPgQUPG8lL362vBm4WOZS8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien GralL <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] tools/xenstored: Don't crash xenstored when Live-Update is cancelled
Date: Thu, 17 Jun 2021 18:38:57 +0100
Message-Id: <20210617173857.6450-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien GralL <jgrall@amazon.com>

As Live-Update is asynchronous, it is possible to receive a request to
cancel it (either on the same connection or from a different one).

Currently, this will crash xenstored because do_lu_start() assumes
lu_status will be valid. This is not the case when Live-Update has been
cancelled. This will result to dereference a NULL pointer and
crash Xenstored.

Rework do_lu_start() to check if lu_status is NULL and return an
error in this case.

Fixes: af216a99fb ("tools/xenstore: add the basic framework for doing the live update")
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

This is currently based on top of:

https://lore.kernel.org/xen-devel/20210616144324.31652-1-julien@xen.org

This can be re-ordered if necessary.
---
 tools/xenstore/xenstored_control.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index a045f102a420..37a3d39f20b5 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -696,7 +696,18 @@ static bool do_lu_start(struct delayed_request *req)
 	time_t now = time(NULL);
 	const char *ret;
 	struct buffered_data *saved_in;
-	struct connection *conn = lu_status->conn;
+	struct connection *conn = req->data;
+
+	/*
+	 * Cancellation may have been requested asynchronously. In this
+	 * case, lu_status will be NULL.
+	 */
+	if (!lu_status) {
+		ret = "Cancellation was requested";
+		conn = req->data;
+		goto out;
+	} else
+		assert(lu_status->conn == conn);
 
 	if (!lu_check_lu_allowed()) {
 		if (now < lu_status->started_at + lu_status->timeout)
@@ -747,7 +758,7 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 	lu_status->timeout = to;
 	lu_status->started_at = time(NULL);
 
-	errno = delay_request(conn, conn->in, do_lu_start, NULL, false);
+	errno = delay_request(conn, conn->in, do_lu_start, conn, false);
 
 	return NULL;
 }
-- 
2.17.1


