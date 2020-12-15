Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F38D2DABE8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 12:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53076.92612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8TC-00075F-Aq; Tue, 15 Dec 2020 11:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53076.92612; Tue, 15 Dec 2020 11:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8TC-00074q-7u; Tue, 15 Dec 2020 11:26:18 +0000
Received: by outflank-mailman (input) for mailman id 53076;
 Tue, 15 Dec 2020 11:26:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kp8TA-00074l-Vz
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 11:26:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kp8T9-0004m3-FH; Tue, 15 Dec 2020 11:26:15 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kp8T9-0001LQ-3h; Tue, 15 Dec 2020 11:26:15 +0000
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
	bh=sB/iBnj0bJve+Wg4G7UTvwAVqmPKendEle03M+qjOgU=; b=Ah/gYRk7Gh0WQvkJ/ew6otrLIp
	qOBaS8XDJjypfsCXaZgll5zJAkMdhICrix/KcW1jlxgi2FtpmIXZnbve7ph4wx3bHyV03yazQgSyn
	xLf5bavMizsqLEbKxyuOoZztNOYzYsBTwfdsQGyFv5FoIQhPi6oyS/L3ppYJFOC7mCJE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen: Rework WARN_ON() to return whether a warning was triggered
Date: Tue, 15 Dec 2020 11:26:10 +0000
Message-Id: <20201215112610.1986-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

So far, our implementation of WARN_ON() cannot be used in the following
situation:

if ( WARN_ON() )
    ...

This is because the WARN_ON() doesn't return whether a warning. Such
construction can be handy to have if you have to print more information
and now the stack track.

Rework the WARN_ON() implementation to return whether a warning was
triggered. The idea was borrowed from Linux.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This will be used in the SMMUv3 driver (see [1]).
---
 xen/include/xen/lib.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index a9679c913d5c..d10c68aa3c07 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -23,7 +23,13 @@
 #include <asm/bug.h>
 
 #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
-#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
+#define WARN_ON(p)  ({                  \
+    bool __ret_warn_on = (p);           \
+                                        \
+    if ( unlikely(__ret_warn_on) )      \
+        WARN();                         \
+    unlikely(__ret_warn_on);            \
+})
 
 /* All clang versions supported by Xen have _Static_assert. */
 #if defined(__clang__) || \
-- 
2.17.1


