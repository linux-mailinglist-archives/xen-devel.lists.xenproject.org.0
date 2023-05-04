Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB386F6CA9
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:13:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529726.824433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYlX-0004BX-NB; Thu, 04 May 2023 13:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529726.824433; Thu, 04 May 2023 13:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYlX-00049q-JD; Thu, 04 May 2023 13:12:59 +0000
Received: by outflank-mailman (input) for mailman id 529726;
 Thu, 04 May 2023 13:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZDr=AZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1puYlW-0003tK-9n
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:12:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 633d48c4-ea7d-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 15:12:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6418112FC;
 Thu,  4 May 2023 06:13:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E283A3F67D;
 Thu,  4 May 2023 06:12:55 -0700 (PDT)
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
X-Inumbo-ID: 633d48c4-ea7d-11ed-b226-6b7b168915f2
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
Subject: [PATCH 2/3] xen/misra: xen-analysis.py: allow cppcheck version above 2.7
Date: Thu,  4 May 2023 14:12:44 +0100
Message-Id: <20230504131245.2985400-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504131245.2985400-1-luca.fancellu@arm.com>
References: <20230504131245.2985400-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the use of Cppcheck version above 2.7, exception for 2.8 which
is known and documented do be broken.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen_analysis/cppcheck_analysis.py | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index 658795bb9f5b..c3783e8df343 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -157,13 +157,25 @@ def generate_cppcheck_deps():
             "Error occured retrieving cppcheck version:\n{}\n\n{}"
         )
 
-    version_regex = re.search('^Cppcheck (.*)$', invoke_cppcheck, flags=re.M)
+    version_regex = re.search('^Cppcheck (\d+).(\d+)(?:.\d+)?$',
+                              invoke_cppcheck, flags=re.M)
     # Currently, only cppcheck version >= 2.7 is supported, but version 2.8 is
     # known to be broken, please refer to docs/misra/cppcheck.txt
-    if (not version_regex) or (not version_regex.group(1).startswith("2.7")):
+    if (not version_regex) or len(version_regex.groups()) < 2:
         raise CppcheckDepsPhaseError(
-                "Can't find cppcheck version or version is not 2.7"
-              )
+            "Can't find cppcheck version or version not identified: "
+            "{}".format(invoke_cppcheck)
+        )
+    major = int(version_regex.group(1))
+    minor = int(version_regex.group(2))
+    if major < 2 or (major == 2 and minor < 7):
+        raise CppcheckDepsPhaseError(
+            "Cppcheck version < 2.7 is not supported"
+        )
+    if major == 2 and minor == 8:
+        raise CppcheckDepsPhaseError(
+            "Cppcheck version 2.8 is known to be broken, see the documentation"
+        )
 
     # If misra option is selected, append misra addon and generate cppcheck
     # files for misra analysis
-- 
2.34.1


