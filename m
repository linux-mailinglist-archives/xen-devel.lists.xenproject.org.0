Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F05578A7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 13:24:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354831.582145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Kwc-0000fC-5f; Thu, 23 Jun 2022 11:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354831.582145; Thu, 23 Jun 2022 11:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Kwc-0000cz-2v; Thu, 23 Jun 2022 11:24:18 +0000
Received: by outflank-mailman (input) for mailman id 354831;
 Thu, 23 Jun 2022 11:24:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4Kwa-0000ct-O6
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 11:24:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4Kwa-0003UT-JK; Thu, 23 Jun 2022 11:24:16 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4Kwa-0001It-A7; Thu, 23 Jun 2022 11:24:16 +0000
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
	Subject:Cc:To:From; bh=48pd6qT6ElSdCjI12mEb8x+anpsLHh/bkyVkl9bWtvE=; b=S/QWtA
	Pd932QAyJKv2pvGMz5HdLQm+zyKJzWxCuubDwmIHDP/2X472orvJO4sfQlVoEQb7019+m0E8Ci7hy
	YyHnZx8gp1GCLvgHLC1wZUDC6V7jdCoWqw6OJgl/PmI7x3wYVdMxGmyYagPNt1Ku/nS+bwFzYIQHl
	LXLinF78L00=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstored: Harden corrupt()
Date: Thu, 23 Jun 2022 12:24:07 +0100
Message-Id: <20220623112407.13604-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, corrupt() is neither checking for allocation failure
nor freeing the allocated memory.

Harden the code by printing ENOMEM if the allocation failed and
free 'str' after the last use.

This is not considered to be a security issue because corrupt() should
only be called when Xenstored thinks the database is corrupted. Note
that the trigger (i.e. a guest reliably provoking the call) would be
a security issue.

Fixes: 06d17943f0cd ("Added a basic integrity checker, and some basic ability to recover from store")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index fa733e714e9a..b6279bdfe229 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2065,7 +2065,11 @@ void corrupt(struct connection *conn, const char *fmt, ...)
 	va_end(arglist);
 
 	log("corruption detected by connection %i: err %s: %s",
-	    conn ? (int)conn->id : -1, strerror(saved_errno), str);
+	    conn ? (int)conn->id : -1, strerror(saved_errno),
+	    str ? str : "ENOMEM");
+
+	if (str)
+		talloc_free(str);
 
 	check_store();
 }
-- 
2.32.0


