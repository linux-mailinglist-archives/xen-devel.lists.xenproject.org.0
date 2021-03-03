Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5E32B9B9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92922.175251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHUwI-00055A-Bw; Wed, 03 Mar 2021 17:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92922.175251; Wed, 03 Mar 2021 17:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHUwI-00054l-88; Wed, 03 Mar 2021 17:05:34 +0000
Received: by outflank-mailman (input) for mailman id 92922;
 Wed, 03 Mar 2021 17:05:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lHUwG-00054f-M4
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 17:05:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHUwF-0004yA-4M; Wed, 03 Mar 2021 17:05:31 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHUwE-0005q4-Ip; Wed, 03 Mar 2021 17:05:30 +0000
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
	bh=9yPzP18IxQGu4Rh4EpOr1irO50bzzkHI1YvhVzGWuy8=; b=TmaV2u0t8q9F/Mbs3Bj88nGH4o
	Z1RRUcYfDXy1PM2L4g096zfl4uEjtehqGrl/Yd279G+iwYw4IEkUiTx+Di/xiq09v0c8Cil4LsoPJ
	mmTZL/S/TVKUxB9E2kflpg2mJm8uc712hhgrDjN5bd8+7QRLKqxi0OnvuppxEHz1N0EQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Bjoern Doebel <doebel@amazon.de>
Subject: [PATCH for-4.15] tools/xenstored: liveupdate: Properly check long transaction
Date: Wed,  3 Mar 2021 17:05:26 +0000
Message-Id: <20210303170526.15903-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

As XenStored is single-threaded, conn->ta_start_time will always be
smaller than now. As we substract the latter from the former, it means
a transaction will never be considered long running.

Invert the two operands of the substraction in both lu_reject_reason()
and lu_check_allowed(). In addition to that, the former also needs to
check that conn->ta_start_time is not 0 (i.e the transaction is not
active).

Take the opportunity to document the return condition of
lu_check_allowed().

Fixes: e04e53a5be20 ("tools/xenstore: allow live update only with no transaction active")
Reported-by: Bjoern Doebel <doebel@amazon.de>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

I am a bit puzzled on how -F is implemented. From my understanding we
will force LiveUpdate when one of the following conditions is met:
  1) All the active transactions are long running
  2) If we didn't manage to LiveUpdate after N sec

It is not quite clear why we need the both as 2) would indirectly cover
1). However 2) is probably unsafe as we may reset transactions for
"well-behaving" guest.

So I am thinking to send a patch to drop 2). Any opinions?

This patch is candidate for 4.15. Without it, the long-running
transactions are not properly accounted.
---
 tools/xenstore/xenstored_control.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index d7ad112138b2..8e470f2b2056 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -459,11 +459,18 @@ static bool lu_check_lu_allowed(void)
 	list_for_each_entry(conn, &connections, list) {
 		if (conn->ta_start_time) {
 			ta_total++;
-			if (conn->ta_start_time - now >= lu_status->timeout)
+			if (now - conn->ta_start_time >= lu_status->timeout)
 				ta_long++;
 		}
 	}
 
+	/*
+	 * Allow LiveUpdate if one of the following conditions is met:
+	 *	- There is no active transactions
+	 *	- All transactions are long running (e.g. they have been
+	 *	active for more than lu_status->timeout sec) and the admin as
+	 *	requested to force the operation.
+	 */
 	return ta_total ? (lu_status->force && ta_long == ta_total) : true;
 }
 
@@ -474,11 +481,12 @@ static const char *lu_reject_reason(const void *ctx)
 	time_t now = time(NULL);
 
 	list_for_each_entry(conn, &connections, list) {
-		if (conn->ta_start_time - now >= lu_status->timeout) {
+		if (conn->ta_start_time &&
+		    (now - conn->ta_start_time >= lu_status->timeout)) {
 			ret = talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
 					      ret ? : "Domains with long running transactions:",
 					      conn->id,
-					      conn->ta_start_time - now);
+					      now - conn->ta_start_time);
 		}
 	}
 
-- 
2.17.1


