Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDE16F6CAA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:13:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529728.824448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYlZ-0004YT-9p; Thu, 04 May 2023 13:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529728.824448; Thu, 04 May 2023 13:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYlZ-0004SZ-6l; Thu, 04 May 2023 13:13:01 +0000
Received: by outflank-mailman (input) for mailman id 529728;
 Thu, 04 May 2023 13:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZDr=AZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1puYlX-0003tK-OS
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:12:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 64104f88-ea7d-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 15:12:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC979139F;
 Thu,  4 May 2023 06:13:42 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56C753F67D;
 Thu,  4 May 2023 06:12:57 -0700 (PDT)
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
X-Inumbo-ID: 64104f88-ea7d-11ed-b226-6b7b168915f2
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
Subject: [PATCH 3/3] xen/misra: xen-analysis.py: use the relative path from the ...
Date: Thu,  4 May 2023 14:12:45 +0100
Message-Id: <20230504131245.2985400-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504131245.2985400-1-luca.fancellu@arm.com>
References: <20230504131245.2985400-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

repository in the reports

Currently the cppcheck report entries shows the relative file path
from the /xen folder of the repository instead of the base folder.
In order to ease the checks, for example, when looking a git diff
output and the report, use the repository folder as base.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen_analysis/cppcheck_analysis.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index c3783e8df343..c8abbe0fca79 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -149,7 +149,7 @@ def generate_cppcheck_deps():
  --suppress='unusedStructMember:*'
  --include={}/include/xen/config.h
  -DCPPCHECK
-""".format(settings.xen_dir, settings.outdir, settings.xen_dir)
+""".format(settings.repo_dir, settings.outdir, settings.xen_dir)
 
     invoke_cppcheck = utils.invoke_command(
             "{} --version".format(settings.cppcheck_binpath),
@@ -240,7 +240,7 @@ def generate_cppcheck_report():
     try:
         cppcheck_report_utils.cppcheck_merge_txt_fragments(fragments,
                                                            report_filename,
-                                                           [settings.xen_dir])
+                                                           [settings.repo_dir])
     except cppcheck_report_utils.CppcheckTXTReportError as e:
         raise CppcheckReportPhaseError(e)
 
@@ -257,7 +257,7 @@ def generate_cppcheck_report():
         try:
             cppcheck_report_utils.cppcheck_merge_xml_fragments(fragments,
                                                                xml_filename,
-                                                               settings.xen_dir,
+                                                               settings.repo_dir,
                                                                settings.outdir)
         except cppcheck_report_utils.CppcheckHTMLReportError as e:
             raise CppcheckReportPhaseError(e)
@@ -265,7 +265,7 @@ def generate_cppcheck_report():
         utils.invoke_command(
             "{} --file={} --source-dir={} --report-dir={}/html --title=Xen"
                 .format(settings.cppcheck_htmlreport_binpath, xml_filename,
-                        settings.xen_dir, html_report_dir),
+                        settings.repo_dir, html_report_dir),
             False, CppcheckReportPhaseError,
             "Error occured generating Cppcheck HTML report:\n{}"
         )
@@ -273,7 +273,7 @@ def generate_cppcheck_report():
         html_files = utils.recursive_find_file(html_report_dir, r'.*\.html$')
         try:
             cppcheck_report_utils.cppcheck_strip_path_html(html_files,
-                                                           (settings.xen_dir,
+                                                           (settings.repo_dir,
                                                             settings.outdir))
         except cppcheck_report_utils.CppcheckHTMLReportError as e:
             raise CppcheckReportPhaseError(e)
-- 
2.34.1


