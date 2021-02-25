Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E83254A7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89891.169794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeV-0006Aa-OP; Thu, 25 Feb 2021 17:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89891.169794; Thu, 25 Feb 2021 17:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeV-00069p-Jl; Thu, 25 Feb 2021 17:42:15 +0000
Received: by outflank-mailman (input) for mailman id 89891;
 Thu, 25 Feb 2021 17:42:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFKeU-000690-CY
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:42:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeT-0005qk-EC; Thu, 25 Feb 2021 17:42:13 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeT-00032g-3I; Thu, 25 Feb 2021 17:42:13 +0000
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
	 bh=AsXl1Pz/JngLBcmlXDlPm3M/+CU4TVWFsS8Ry3xt94k=; b=qIWgFwpRYq59HKUUqTUo+Gbls
	+bPbBxsbcwnQaXp8Y88/l2MGQ+hjpYH0x3IFMNPsdVzhXnYboqliZC3qdrXnPvuvHwjD6wC6eGYsC
	VLfHHzToFtXLrgGUHI7eIWU+DoPmXWl4EjxCu1s1eZXOS0HHvw7JvTG82PRo+YSgOtsBU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 1/5] tools/xenstored: Avoid unnecessary talloc_strdup() in do_control_lu()
Date: Thu, 25 Feb 2021 17:41:27 +0000
Message-Id: <20210225174131.10115-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225174131.10115-1-julien@xen.org>
References: <20210225174131.10115-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, the return of talloc_strdup() is not checked. This means
we may dereference a NULL pointer if the allocation failed.

However, it is pointless to allocate the memory as send_reply() will
copy the data to a different buffer. So drop the use of talloc_strdup().

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Fixes: fecab256d474 ("tools/xenstore: add basic live-update command parsing")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index f10beaf85eb4..e8a501acdb62 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -691,7 +691,6 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 static int do_control_lu(void *ctx, struct connection *conn,
 			 char **vec, int num)
 {
-	const char *resp;
 	const char *ret = NULL;
 	unsigned int i;
 	bool force = false;
@@ -734,8 +733,7 @@ static int do_control_lu(void *ctx, struct connection *conn,
 
 	if (!ret)
 		ret = "OK";
-	resp = talloc_strdup(ctx, ret);
-	send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
+	send_reply(conn, XS_CONTROL, ret, strlen(ret) + 1);
 	return 0;
 }
 #endif
-- 
2.17.1


