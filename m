Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB4645A6E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 14:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456301.714090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8w-0004tx-PI; Wed, 07 Dec 2022 13:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456301.714090; Wed, 07 Dec 2022 13:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8w-0004mH-Kd; Wed, 07 Dec 2022 13:07:22 +0000
Received: by outflank-mailman (input) for mailman id 456301;
 Wed, 07 Dec 2022 13:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbZ5=4F=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p2u8u-0004CY-6F
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 13:07:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1485c9e6-7630-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 14:07:19 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C48A013D5;
 Wed,  7 Dec 2022 05:07:25 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2F173F73D;
 Wed,  7 Dec 2022 05:07:17 -0800 (PST)
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
X-Inumbo-ID: 1485c9e6-7630-11ed-8fd2-01056ac49cbb
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
Subject: [PATCH v3 4/5] tools/misra: fix skipped rule numbers
Date: Wed,  7 Dec 2022 13:07:03 +0000
Message-Id: <20221207130704.20573-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207130704.20573-1-luca.fancellu@arm.com>
References: <20221207130704.20573-1-luca.fancellu@arm.com>

MISRA rules are in the format Rule X.Y, currently the script
convert_misra_doc.py is using two nested loop through range(1,22) to
enumerate rules that needs to be skipped, using combination of X.Y in
that range, however there are two issues in the code:
 - rule 22 is never included because the range(1,22) produces a range
   in [1..21]
 - the second issue is that the code is producing invalid MISRA C 2012
   rules, for example 1.21 and so on

Fix the issue using a dictionary that list the rules in misra c2012.

Fixes: 57caa5375321 ("xen: Add MISRA support to cppcheck make rule")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 changes:
 - none
Changes in v2:
 - modified commit message, add R-by (Stefano)
---
---
 xen/tools/convert_misra_doc.py | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/xen/tools/convert_misra_doc.py b/xen/tools/convert_misra_doc.py
index caa4487f645f..13074d8a2e91 100755
--- a/xen/tools/convert_misra_doc.py
+++ b/xen/tools/convert_misra_doc.py
@@ -14,6 +14,34 @@ Usage:
 
 import sys, getopt, re
 
+# MISRA rule are identified by two numbers, e.g. Rule 1.2, the main rule number
+# and a sub-number. This dictionary contains the number of the MISRA rule as key
+# and the maximum sub-number for that rule as value.
+misra_c2012_rules = {
+    1:4,
+    2:7,
+    3:2,
+    4:2,
+    5:9,
+    6:2,
+    7:4,
+    8:14,
+    9:5,
+    10:8,
+    11:9,
+    12:5,
+    13:6,
+    14:4,
+    15:7,
+    16:7,
+    17:8,
+    18:8,
+    19:2,
+    20:14,
+    21:21,
+    22:10
+}
+
 def main(argv):
     infile = ''
     outfile = ''
@@ -142,8 +170,8 @@ def main(argv):
     skip_list = []
 
     # Search for missing rules and add a dummy text with the rule number
-    for i in list(range(1,22)):
-        for j in list(range(1,22)):
+    for i in misra_c2012_rules:
+        for j in list(range(1,misra_c2012_rules[i]+1)):
             if str(i) + '.' + str(j) not in rule_list:
                 outstr.write('Rule ' + str(i) + '.' + str(j) + '\n')
                 outstr.write('No description for rule ' + str(i) + '.' + str(j)
-- 
2.17.1


