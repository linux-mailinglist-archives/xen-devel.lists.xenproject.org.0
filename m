Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A0C3254A5
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89892.169805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeX-0006Cg-0k; Thu, 25 Feb 2021 17:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89892.169805; Thu, 25 Feb 2021 17:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeW-0006By-RW; Thu, 25 Feb 2021 17:42:16 +0000
Received: by outflank-mailman (input) for mailman id 89892;
 Thu, 25 Feb 2021 17:42:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFKeV-0006A2-F1
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:42:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeU-0005qs-Fw; Thu, 25 Feb 2021 17:42:14 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeU-00032g-7E; Thu, 25 Feb 2021 17:42:14 +0000
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
	 bh=JuTt5+fVqpN12bzr+SQUOtZ9U/AniX5wCdCX0Q2WLao=; b=5i5uy41NOnXHp39CeUAjMnJZn
	Jvu+LoaUW7sd/DbtG/GNjoJ1frUp/JDVUQlRXaPw328ObUdirePteN4lkVfScrXb3vgH5ys6nglEN
	kSG18A/Lwbx+m4L4u7aikIeWRoTxrC5zcrBBL7Mo8C53CVi76QpxC5nlhHEXnptLGPIek=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 2/5] tools/xenstored: Avoid unnecessary talloc_strdup() in do_lu_start()
Date: Thu, 25 Feb 2021 17:41:28 +0000
Message-Id: <20210225174131.10115-3-julien@xen.org>
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

Fixes: af216a99fb4a ("tools/xenstore: add the basic framework for doing the live update")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index e8a501acdb62..8eb57827765c 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -638,7 +638,6 @@ static bool do_lu_start(struct delayed_request *req)
 {
 	time_t now = time(NULL);
 	const char *ret;
-	char *resp;
 
 	if (!lu_check_lu_allowed()) {
 		if (now < lu_status->started_at + lu_status->timeout)
@@ -660,8 +659,7 @@ static bool do_lu_start(struct delayed_request *req)
  out:
 	talloc_free(lu_status);
 
-	resp = talloc_strdup(req->in, ret);
-	send_reply(lu_status->conn, XS_CONTROL, resp, strlen(resp) + 1);
+	send_reply(lu_status->conn, XS_CONTROL, ret, strlen(ret) + 1);
 
 	return true;
 }
-- 
2.17.1


