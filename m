Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75523254A6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89894.169830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeZ-0006Hs-QQ; Thu, 25 Feb 2021 17:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89894.169830; Thu, 25 Feb 2021 17:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeZ-0006Gu-J2; Thu, 25 Feb 2021 17:42:19 +0000
Received: by outflank-mailman (input) for mailman id 89894;
 Thu, 25 Feb 2021 17:42:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFKeX-0006Eh-Lv
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:42:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeW-0005r7-OD; Thu, 25 Feb 2021 17:42:16 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeW-00032g-FC; Thu, 25 Feb 2021 17:42:16 +0000
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
	 bh=MOM7smBMP9BCXNrEE1hf8/uoWjibhwZ1Ud0ejevMQus=; b=KDNoJwOGHmFC6HUQafwmQtJ5i
	XDPpKCkfQVLho8V22Sg9WziAsyJSl7e3NsLAAAI97Z9jSnBWKKbhSdFJtPCRolByzOk9IccxFbe6Y
	xWgZ1G5RrcXTIjyNJck3YtCec6T2w7Ic4ndI9qwc9hFeUyCZ4rEhh5Mh/rT3ewGZeu1xY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 4/5] tools/xenstore-control: Don't leak buf in live_update_start()
Date: Thu, 25 Feb 2021 17:41:30 +0000
Message-Id: <20210225174131.10115-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225174131.10115-1-julien@xen.org>
References: <20210225174131.10115-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

All the error paths but one will free buf. Cover the remaining path so
buf can't be leaked.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Fixes: 7f97193e6aa8 ("tools/xenstore: add live update command to xenstore-control")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstore_control.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstore_control.c b/tools/xenstore/xenstore_control.c
index f6f4626c0656..548363ee7094 100644
--- a/tools/xenstore/xenstore_control.c
+++ b/tools/xenstore/xenstore_control.c
@@ -44,8 +44,10 @@ static int live_update_start(struct xs_handle *xsh, bool force, unsigned int to)
         return 1;
 
     ret = strdup("BUSY");
-    if (!ret)
+    if (!ret) {
+        free(buf);
         return 1;
+    }
 
     for (time_start = time(NULL); time(NULL) - time_start < to;) {
         free(ret);
-- 
2.17.1


