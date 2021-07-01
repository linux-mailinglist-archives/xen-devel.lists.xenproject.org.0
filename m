Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37F83B92A5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148690.274777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxHe-0002r0-Hy; Thu, 01 Jul 2021 14:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148690.274777; Thu, 01 Jul 2021 14:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxHe-0002nr-EF; Thu, 01 Jul 2021 14:03:14 +0000
Received: by outflank-mailman (input) for mailman id 148690;
 Thu, 01 Jul 2021 14:03:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyxHd-0002nl-Gs
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:03:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyxHc-0006Gm-5r; Thu, 01 Jul 2021 14:03:12 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyxHb-0008GN-Sd; Thu, 01 Jul 2021 14:03:12 +0000
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
	bh=mC+UL4mB6P83vegs7bksrkog22RhQJHUhe6zIy+isK0=; b=YhkOwdPHoTuIAE0LUzHmnBJGbS
	Z0/Otu0JTPcagSPeuI7vAPr1+4ju6vqMCe6VbRq8Nh7gra46cpv9tLNOO52SddmwFeIR84LiAMtxz
	BHUKTKl0T8zDMoM9uC08oNDVSRo1hiAnajgdtK1bgbLaEBw2QnZDL1KJZ4v7HYCs+EdQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] tools/xenstored: Stash the correct request in lu_status->in
Date: Thu,  1 Jul 2021 15:03:07 +0100
Message-Id: <20210701140307.2516-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

When Live-Updating with some load, Xenstored may hit the assert
req->in == lu_status->in in do_lu_start().

This is happening because the request is stashed when Live-Update
begins. This happens in a different request (see call lu_begin()
when select the new binary) from the one performing Live-Update.

To avoid the problem, stash the request in lu_start().

Fixes: 65f19ed62aa1 ("tools/xenstore: Don't assume conn->in points to the LU request")
Reported-by: Michael Kurth <mku@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

This was sadly missed because the on my testing the 2 requests were
residing at the same place in memory.

This was reproduced by creating domain while Live-Updating. Without
the patch, Xenstored will crash.
---
 tools/xenstore/xenstored_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index a1b1bd5a718d..ff9863c17fa4 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -103,7 +103,6 @@ static const char *lu_begin(struct connection *conn)
 	if (!lu_status)
 		return "Allocation failure.";
 	lu_status->conn = conn;
-	lu_status->in = conn->in;
 	talloc_set_destructor(lu_status, lu_destroy);
 
 	return NULL;
@@ -757,6 +756,7 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 	lu_status->force = force;
 	lu_status->timeout = to;
 	lu_status->started_at = time(NULL);
+	lu_status->in = conn->in;
 
 	errno = delay_request(conn, conn->in, do_lu_start, conn, false);
 
-- 
2.17.1


