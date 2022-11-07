Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C016761F121
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:48:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439286.693344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzfX-0002q3-GX; Mon, 07 Nov 2022 10:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439286.693344; Mon, 07 Nov 2022 10:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzfX-0002nC-DD; Mon, 07 Nov 2022 10:47:55 +0000
Received: by outflank-mailman (input) for mailman id 439286;
 Mon, 07 Nov 2022 10:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=or3T=3H=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1orzfW-0002FR-1m
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:47:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a168385b-5e89-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 11:47:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A62EA113E;
 Mon,  7 Nov 2022 02:47:58 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 514C43F73D;
 Mon,  7 Nov 2022 02:47:51 -0800 (PST)
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
X-Inumbo-ID: a168385b-5e89-11ed-91b5-6bf2151ebd3b
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
Subject: [RFC PATCH 3/4] tools/misra: fix skipped rule numbers
Date: Mon,  7 Nov 2022 10:47:38 +0000
Message-Id: <20221107104739.10404-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221107104739.10404-1-luca.fancellu@arm.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>

Currently the script convert_misra_doc.py is using a loop through
range(1,22) to enumerate rules that needs to be skipped, however
range function does not include the stop counter in the enumeration
ending up into list rules until 21.21 instead of including rule 22.

Fix the issue using a dictionary that list the rules in misra c2012.

Fixes: 57caa5375321 ("xen: Add MISRA support to cppcheck make rule")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
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


