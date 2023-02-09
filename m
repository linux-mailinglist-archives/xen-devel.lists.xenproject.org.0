Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4574690F31
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492819.762559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAih-0004hy-Ib; Thu, 09 Feb 2023 17:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492819.762559; Thu, 09 Feb 2023 17:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAih-0004eg-El; Thu, 09 Feb 2023 17:28:27 +0000
Received: by outflank-mailman (input) for mailman id 492819;
 Thu, 09 Feb 2023 17:28:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQAif-0004YW-Gz
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:28:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAif-0003RV-2l; Thu, 09 Feb 2023 17:28:25 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAie-0002Aq-QI; Thu, 09 Feb 2023 17:28:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=mAbwzoszS/MgYnUjT1K/UPIKO2jAFGSyw2bBiFLt0Ao=; b=k5CGVjwmjsftboZcTKxfJETw4n
	6AJW2Mzxpfg6Jk9Qa8TKFJ3t5CANWhkI4XQ2jFbiKpHcLDrRSiBXJnhVU748kO7uWea4q9E+t4Q2q
	biGrnDhL2oDTOhZkpBZI/vgCduwpYiotQHDXoZl/5aFbS50UILoYrJVtZKd5skxNg4UI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/4] docs/process: branching-checklist: Reword the section about Config.mk
Date: Thu,  9 Feb 2023 17:28:17 +0000
Message-Id: <20230209172820.56292-2-julien@xen.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209172820.56292-1-julien@xen.org>
References: <20230209172820.56292-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Since at least Xen 4.12, the revision for external trees don't contain
the word "unstable". So explicitely list the *_REVISION variables that
need to be updated as part of the branching process.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        * Explain what should be the tag format for each variables
---
 docs/process/branching-checklist.txt | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index d1550385c96e..7c4c107c250c 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -69,11 +69,12 @@ ov=4.0
     git add versions
     git commit -m "Branch for $v"
 
-Ensure references to qemu trees in xen.git's Config.mk are updated.
-Check this with
-    grep unstable Config.mk
-which should produce no output.  Replace as necessary.
-(There may well be none.)
+Ensure references to qemu trees and Mini-OS in xen.git's Config.mk are updated.
+The variables and there content should be:
+  * QEMU_UPSTREAM_REVISION: qemu-xen-X.Y.0
+  * QEMU_TRADITIONAL_REVISION: xen-X.Y.0
+  * MINIOS_UPSTREAM_REVISION: xen-RELEASE-X.Y.0
+Where X.Y is the release version (e.g. 4.17).
 
 Update newly diverging staging (unstable) according to
 release-technician-checklist.txt section re README etc.
-- 
2.39.1


