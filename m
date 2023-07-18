Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886277577F3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565025.882851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgyz-0000s9-Uh; Tue, 18 Jul 2023 09:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565025.882851; Tue, 18 Jul 2023 09:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgyz-0000pq-RV; Tue, 18 Jul 2023 09:27:01 +0000
Received: by outflank-mailman (input) for mailman id 565025;
 Tue, 18 Jul 2023 09:27:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UwZh=DE=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qLgyy-0000LP-1t
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:27:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3df795e6-254d-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 11:26:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40931FEC;
 Tue, 18 Jul 2023 02:27:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 299CF3F67D;
 Tue, 18 Jul 2023 02:26:57 -0700 (PDT)
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
X-Inumbo-ID: 3df795e6-254d-11ee-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen/misra: diff-report.py: fix function invocation
Date: Tue, 18 Jul 2023 10:26:36 +0100
Message-Id: <20230718092637.2433974-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718092637.2433974-1-luca.fancellu@arm.com>
References: <20230718092637.2433974-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the invocation of invoke_command() that takes an optional
parameter for the exception type, but in the code the error
message template was passed instead, so fix it passing a new
exception type.

Fixes: 1d7c45f895b6 ("xen/misra: diff-report.py: add report patching feature")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/diff-report.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/scripts/diff-report.py b/xen/scripts/diff-report.py
index 636f98f5eebe..a1fe6bc2fccd 100755
--- a/xen/scripts/diff-report.py
+++ b/xen/scripts/diff-report.py
@@ -13,6 +13,10 @@ from xen_analysis.settings import repo_dir
 from xen_analysis.utils import invoke_command
 
 
+class DiffReportError(Exception):
+    pass
+
+
 def log_info(text, end='\n'):
     # type: (str, str) -> None
     global args
@@ -97,7 +101,7 @@ def main(argv):
             git_diff = invoke_command(
                 "git --git-dir={}/.git diff -C -C {}..{}"
                 .format(repo_dir, args.baseline_rev, args.report_rev),
-                True, "Error occured invoking:\n{}\n\n{}"
+                True, DiffReportError, "Error occured invoking:\n{}\n\n{}"
             )
             diff_source = git_diff.splitlines(keepends=True)
         if diff_source:
@@ -105,7 +109,7 @@ def main(argv):
             diffs = UnifiedFormatParser(diff_source)
             debug.debug_print_parsed_diff(diffs)
             log_info(" [OK]")
-    except (ReportError, UnifiedFormatParseError) as e:
+    except (DiffReportError, ReportError, UnifiedFormatParseError) as e:
         print("ERROR: {}".format(e))
         sys.exit(1)
 
-- 
2.34.1


