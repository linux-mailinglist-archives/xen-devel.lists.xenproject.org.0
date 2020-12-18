Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E02DE355
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 14:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56504.98958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqFqi-00070C-Bw; Fri, 18 Dec 2020 13:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56504.98958; Fri, 18 Dec 2020 13:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqFqi-0006zn-80; Fri, 18 Dec 2020 13:31:12 +0000
Received: by outflank-mailman (input) for mailman id 56504;
 Fri, 18 Dec 2020 13:31:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kqFqg-0006zi-Vz
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 13:31:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kqFqf-00088R-L5; Fri, 18 Dec 2020 13:31:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kqFqf-00037b-7v; Fri, 18 Dec 2020 13:31:09 +0000
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
	bh=78IRszokJjcwXWRlJq8XMydnKIcEdWhnJEaC/s7+CP4=; b=ta0capm8ycKAgPRg10EyVyYXOv
	Eq3yXoDsz5zRDR2pWtdnmZpkhBj5B2wrSZe8T/7LHXp8IlQUyeHykEoY+YgnNGWqEZR4vY8tuaj7b
	EHVTIh/qq0V9nxVpVYLYxQroVl+ew+/ezFN+501bbZmHhAmBd1ET6Cv0V3/U3kUZ9iCc=;
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
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] xen: Rework WARN_ON() to return whether a warning was triggered
Date: Fri, 18 Dec 2020 13:30:54 +0000
Message-Id: <20201218133054.7744-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

So far, our implementation of WARN_ON() cannot be used in the following
situation:

if ( WARN_ON() )
    ...

This is because WARN_ON() doesn't return whether a warning has been
triggered. Such construciton can be handy if you want to print more
information and also dump the stack trace.

Therefore, rework the WARN_ON() implementation to return whether a
warning was triggered. The idea was borrowed from Linux

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

---
    Changes in v2:
        - Rework the commit message
        - Don't use trailing underscore
        - Add Bertrand's and Juergen's reviewed-by
---
 xen/include/xen/lib.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 48429b69b8df..5841bd489c35 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -23,7 +23,13 @@
 #include <asm/bug.h>
 
 #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
-#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
+#define WARN_ON(p)  ({                  \
+    bool ret_warn_on_ = (p);            \
+                                        \
+    if ( unlikely(ret_warn_on_) )       \
+        WARN();                         \
+    unlikely(ret_warn_on_);             \
+})
 
 /* All clang versions supported by Xen have _Static_assert. */
 #if defined(__clang__) || \
-- 
2.17.1


