Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3D709312
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536852.835583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwRY-0003xE-Pa; Fri, 19 May 2023 09:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536852.835583; Fri, 19 May 2023 09:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwRY-0003uo-Mx; Fri, 19 May 2023 09:30:36 +0000
Received: by outflank-mailman (input) for mailman id 536852;
 Fri, 19 May 2023 09:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pzwRX-00038Z-3N
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:30:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ce3f963c-f627-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 11:30:34 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1CD615DB;
 Fri, 19 May 2023 02:31:18 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84D9D3F73F;
 Fri, 19 May 2023 02:30:32 -0700 (PDT)
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
X-Inumbo-ID: ce3f963c-f627-11ed-b22d-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 3/3] xen/misra: xen-analysis.py: Fix cppcheck report relative paths
Date: Fri, 19 May 2023 10:30:19 +0100
Message-Id: <20230519093019.2131896-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519093019.2131896-1-luca.fancellu@arm.com>
References: <20230519093019.2131896-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the generation of the relative path from the repo, for cppcheck
reports, when the script is launching make with in-tree build.

Fixes: b046f7e37489 ("xen/misra: xen-analysis.py: use the relative path from the ...")
Reported-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .../xen_analysis/cppcheck_report_utils.py     | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
index fdc299c7e029..10100f6c6a57 100644
--- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
+++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
@@ -1,6 +1,7 @@
 #!/usr/bin/env python3
 
-import os
+import os, re
+from . import settings
 from xml.etree import ElementTree
 
 class CppcheckHTMLReportError(Exception):
@@ -101,12 +102,28 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
             text_report_content = list(text_report_content)
             # Strip path from report lines
             for i in list(range(0, len(text_report_content))):
-                for path in strip_paths:
-                    text_report_content[i] = text_report_content[i].replace(
-                                                                path + "/", "")
                 # Split by : separator
                 text_report_content[i] = text_report_content[i].split(":")
 
+                for path in strip_paths:
+                    text_report_content[i][0] = \
+                        text_report_content[i][0].replace(path + "/", "")
+
+                # When the compilation is in-tree, the makefile places
+                # the directory in /xen/xen, making cppcheck produce
+                # relative path from there, so check if "xen/" is a prefix
+                # of the path and if it's not, check if it can be added to
+                # have a relative path from the repository instead of from
+                # /xen/xen
+                if not text_report_content[i][0].startswith("xen/"):
+                    # cppcheck first entry is in this format:
+                    # path/to/file(line,cols), remove (line,cols)
+                    cppcheck_file = re.sub(r'\(.*\)', '',
+                                           text_report_content[i][0])
+                    if os.path.isfile(settings.xen_dir + "/" + cppcheck_file):
+                        text_report_content[i][0] = \
+                            "xen/" + text_report_content[i][0]
+
             # sort alphabetically for second field (misra rule) and as second
             # criteria for the first field (file name)
             text_report_content.sort(key = lambda x: (x[1], x[0]))
-- 
2.34.1


