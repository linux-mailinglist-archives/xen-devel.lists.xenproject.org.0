Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D956F0698
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 15:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527006.819135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps1dY-0004Cv-DH; Thu, 27 Apr 2023 13:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527006.819135; Thu, 27 Apr 2023 13:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps1dY-0004BD-8f; Thu, 27 Apr 2023 13:26:16 +0000
Received: by outflank-mailman (input) for mailman id 527006;
 Thu, 27 Apr 2023 13:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X9G0=AS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1ps1dW-0004B7-Rv
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 13:26:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1278e750-e4ff-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 15:26:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40FD62F4;
 Thu, 27 Apr 2023 06:26:53 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A48C43F587;
 Thu, 27 Apr 2023 06:26:08 -0700 (PDT)
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
X-Inumbo-ID: 1278e750-e4ff-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH v2] xen/misra: xen-analysis.py: fix return error on PhaseExceptions
Date: Thu, 27 Apr 2023 14:25:59 +0100
Message-Id: <20230427132559.14712-1-luca.fancellu@arm.com>
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
Change-Id: I1b76b8fa4668bef49da3282339fca3052e3379cd
---
Changes from v1:
 - use getattr() (Andrew)
---
 xen/scripts/xen-analysis.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/scripts/xen-analysis.py b/xen/scripts/xen-analysis.py
index 8e50c27cd898..5e8f2910cd72 100755
--- a/xen/scripts/xen-analysis.py
+++ b/xen/scripts/xen-analysis.py
@@ -26,8 +26,7 @@ def main(argv):
             cppcheck_analysis.generate_cppcheck_report()
     except PhaseExceptions as e:
         print("ERROR: {}".format(e))
-        if hasattr(e, "errorcode"):
-            ret_code = e.errorcode
+        ret_code = getattr(e, "errorcode", 1)
     finally:
         if settings.step_clean_analysis:
             cppcheck_analysis.clean_analysis_artifacts()
-- 
2.34.1


