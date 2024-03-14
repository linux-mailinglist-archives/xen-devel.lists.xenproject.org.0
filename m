Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35687C22A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 18:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693420.1081467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkp3G-0001fn-5z; Thu, 14 Mar 2024 17:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693420.1081467; Thu, 14 Mar 2024 17:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkp3G-0001dT-3F; Thu, 14 Mar 2024 17:39:34 +0000
Received: by outflank-mailman (input) for mailman id 693420;
 Thu, 14 Mar 2024 17:39:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rkp3E-0001dN-Jh
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 17:39:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkp3E-0005rG-G1; Thu, 14 Mar 2024 17:39:32 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkp3E-0004iJ-0P; Thu, 14 Mar 2024 17:39:32 +0000
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
	Subject:Cc:To:From; bh=BBgVk/VxeF7lwwDF6FtK4BZYXcyviQU7xqFnvHmS8gE=; b=bE0tlc
	T0dnTLLEvNSaaiQgANhXPn/XlTa4yPmFhySjKkZrU/aYXt5IE0GQNmmLv9WctXPExUOim5e/Z+e3s
	dtAqKB4reKQBSgk2A6hOSpnRp6At5O0YJmtpx0wC04+oqOHHBTIo4aD/emdedj2QRcY91ZZZbvQe0
	F6Kpzuo2msM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	ayan.kumar.halder@amd.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] SUPPORT.MD: Fix matrix generation after 43c416d0d819 and 77c39a53cf5b
Date: Thu, 14 Mar 2024 17:39:29 +0000
Message-Id: <20240314173929.12040-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The script docs/support-matrix-generate throw the following error on the
latest staging.

MDCCSR_EL0
DBGDTR_EL0
DBGDTRTX_EL0
DBGDTRRX_EL0
DBGDSCRINT
DBGDTRTXINT
DBGDTRRXINT
^ cannot parse status codeblock line:
MDCCSR_EL0
 ? at docs/parse-support-md line 172, <F> chunk 1.

With the current indentation, it looks like the script thinks this is
a status code block.

Solve the issue by switching to a bullet list.

Fixes: 43c416d0d819 ("xen/arm: arm64: Add emulation of Debug Data Transfer Registers")
Fixes: 77c39a53cf5b ("xen/arm: arm32: Add emulation of Debug Data Transfer Registers")
---
 SUPPORT.md | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 58f075538f73..e10d46d924a4 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -111,13 +111,13 @@ that would normally trigger a fault injection.
 
 Only the following system registers are security supported:
 
-    MDCCSR_EL0
-    DBGDTR_EL0
-    DBGDTRTX_EL0
-    DBGDTRRX_EL0
-    DBGDSCRINT
-    DBGDTRTXINT
-    DBGDTRRXINT
+  * MDCCSR_EL0
+  * DBGDTR_EL0
+  * DBGDTRTX_EL0
+  * DBGDTRRX_EL0
+  * DBGDSCRINT
+  * DBGDTRTXINT
+  * DBGDTRRXINT
 
 ### ARM Scalable Vector Extension (SVE/SVE2)
 
-- 
2.40.1


