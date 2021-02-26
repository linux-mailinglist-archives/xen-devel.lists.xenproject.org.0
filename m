Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694BC3266E1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 19:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90553.171465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFhpN-0005FX-OR; Fri, 26 Feb 2021 18:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90553.171465; Fri, 26 Feb 2021 18:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFhpN-0005FA-LG; Fri, 26 Feb 2021 18:27:01 +0000
Received: by outflank-mailman (input) for mailman id 90553;
 Fri, 26 Feb 2021 18:27:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFhpM-0005F5-4s
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 18:27:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFhpK-0001GE-TR; Fri, 26 Feb 2021 18:26:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFhpK-00089O-G4; Fri, 26 Feb 2021 18:26:58 +0000
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
	bh=iNuTvkc4LGs0VPE3lG554tVwPfj5Ug5Vg9CmENqGtyQ=; b=hMRJuUFgprHCGy+sCM2Y8Xqu4P
	7eMu2yWG4Z2lOPbCotS9SYYOcT3936s+7ChDl4mRUlLBOkiImdiDX8KL9toL+8Sqab5TYXzEbkFD9
	2KH1g2hRlSGKfFyfIeuEpkRAYitNcolXn/UeXX+aYI8Eps26/g52CDQlP+rKTN1cpMsw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15] tools/xenstored: Avoid dereferencing a NULL pointer if LiveUpdate is failing
Date: Fri, 26 Feb 2021 18:26:55 +0000
Message-Id: <20210226182655.2499-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

In case of failure in do_lu_start(), XenStored will first free lu_start
and then try to dereference it.

This will result to a NULL dereference as the destruction callback will
set lu_start to NULL.

The crash can be avoided by freeing lu_start *after* the reply has been
set.

Fixes: af216a99fb4a ("tools/xenstore: add the basic framework for doing the live update")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This is a bug fix candidate for 4.15. The easiest way to trigger it is
to have a XTF test that starts a transaction but never terminates it.

In this case, live-updating would fail and trigger a crash.
---
 tools/xenstore/xenstored_control.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 653890f2d9e0..766b2438396a 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -657,9 +657,8 @@ static bool do_lu_start(struct delayed_request *req)
 
 	/* We will reach this point only in case of failure. */
  out:
-	talloc_free(lu_status);
-
 	send_reply(lu_status->conn, XS_CONTROL, ret, strlen(ret) + 1);
+	talloc_free(lu_status);
 
 	return true;
 }
-- 
2.17.1


