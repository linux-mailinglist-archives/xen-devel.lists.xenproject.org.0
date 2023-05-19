Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB270930F
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536849.835554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwRV-0003Ag-QU; Fri, 19 May 2023 09:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536849.835554; Fri, 19 May 2023 09:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwRV-00038n-MX; Fri, 19 May 2023 09:30:33 +0000
Received: by outflank-mailman (input) for mailman id 536849;
 Fri, 19 May 2023 09:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pzwRU-00038Z-ER
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:30:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cc6e24ca-f627-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 11:30:31 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEEC62F4;
 Fri, 19 May 2023 02:31:15 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D3123F73F;
 Fri, 19 May 2023 02:30:29 -0700 (PDT)
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
X-Inumbo-ID: cc6e24ca-f627-11ed-b22d-6b7b168915f2
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
Subject: [PATCH 1/3] xen/misra: xen-analysis.py: Improve the cppcheck version check
Date: Fri, 19 May 2023 10:30:17 +0100
Message-Id: <20230519093019.2131896-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519093019.2131896-1-luca.fancellu@arm.com>
References: <20230519093019.2131896-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use tuple comparison to check the cppcheck version.

Take the occasion to harden the regex, escaping the dots so that we
check for them instead of generic characters.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen_analysis/cppcheck_analysis.py | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index c8abbe0fca79..8dc45e653b79 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -157,7 +157,7 @@ def generate_cppcheck_deps():
             "Error occured retrieving cppcheck version:\n{}\n\n{}"
         )
 
-    version_regex = re.search('^Cppcheck (\d+).(\d+)(?:.\d+)?$',
+    version_regex = re.search('^Cppcheck (\d+)\.(\d+)(?:\.\d+)?$',
                               invoke_cppcheck, flags=re.M)
     # Currently, only cppcheck version >= 2.7 is supported, but version 2.8 is
     # known to be broken, please refer to docs/misra/cppcheck.txt
@@ -166,15 +166,10 @@ def generate_cppcheck_deps():
             "Can't find cppcheck version or version not identified: "
             "{}".format(invoke_cppcheck)
         )
-    major = int(version_regex.group(1))
-    minor = int(version_regex.group(2))
-    if major < 2 or (major == 2 and minor < 7):
+    version = (int(version_regex.group(1)), int(version_regex.group(2)))
+    if version < (2, 7) or version == (2, 8):
         raise CppcheckDepsPhaseError(
-            "Cppcheck version < 2.7 is not supported"
-        )
-    if major == 2 and minor == 8:
-        raise CppcheckDepsPhaseError(
-            "Cppcheck version 2.8 is known to be broken, see the documentation"
+            "Cppcheck version < 2.7 or 2.8 are not supported"
         )
 
     # If misra option is selected, append misra addon and generate cppcheck
-- 
2.34.1


