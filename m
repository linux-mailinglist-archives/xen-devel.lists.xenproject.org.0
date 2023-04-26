Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A674F6EF28A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 12:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526624.818506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prcfH-0000CB-Ly; Wed, 26 Apr 2023 10:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526624.818506; Wed, 26 Apr 2023 10:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prcfH-00009W-JK; Wed, 26 Apr 2023 10:46:23 +0000
Received: by outflank-mailman (input) for mailman id 526624;
 Wed, 26 Apr 2023 10:46:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz9v=AR=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1prcfG-00009P-Bk
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 10:46:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9453c809-e41f-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 12:46:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0DEE4B3;
 Wed, 26 Apr 2023 03:47:03 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CB0D3F5A1;
 Wed, 26 Apr 2023 03:46:18 -0700 (PDT)
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
X-Inumbo-ID: 9453c809-e41f-11ed-b224-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/misra: xen-analysis.py: fix return error on PhaseExceptions
Date: Wed, 26 Apr 2023 11:46:05 +0100
Message-Id: <20230426104605.3447049-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the script return code is 0 even if an exception is
found, because the return code is written only if the exception
object has the errorcode member.

Fix the issue returning the errorcode member in case it exists,
otherwise use a generic value different from 0.

Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen-analysis.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/scripts/xen-analysis.py b/xen/scripts/xen-analysis.py
index 8e50c27cd898..7185c5a06d2c 100755
--- a/xen/scripts/xen-analysis.py
+++ b/xen/scripts/xen-analysis.py
@@ -26,8 +26,7 @@ def main(argv):
             cppcheck_analysis.generate_cppcheck_report()
     except PhaseExceptions as e:
         print("ERROR: {}".format(e))
-        if hasattr(e, "errorcode"):
-            ret_code = e.errorcode
+        ret_code = e.errorcode if hasattr(e, "errorcode") else 1
     finally:
         if settings.step_clean_analysis:
             cppcheck_analysis.clean_analysis_artifacts()
-- 
2.34.1


