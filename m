Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED887DCDBC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625714.975274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiJ-00041D-Fs; Tue, 31 Oct 2023 13:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625714.975274; Tue, 31 Oct 2023 13:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiJ-0003wE-BX; Tue, 31 Oct 2023 13:23:23 +0000
Received: by outflank-mailman (input) for mailman id 625714;
 Tue, 31 Oct 2023 13:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qxoiI-0003rs-95
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:23:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a8173501-77f0-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 14:23:19 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EA2DDA7;
 Tue, 31 Oct 2023 06:24:00 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 428CF3F738;
 Tue, 31 Oct 2023 06:23:18 -0700 (PDT)
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
X-Inumbo-ID: a8173501-77f0-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v2 1/8] cppcheck: rework exclusion_file_list.py code
Date: Tue, 31 Oct 2023 13:22:57 +0000
Message-Id: <20231031132304.2573924-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031132304.2573924-1-luca.fancellu@arm.com>
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the exclusion_file_list.py code to have the function
load_exclusion_file_list() detached from the xen-analysis.py tool,
in a way so that other modules can use the function.
The xen-analysis tool and in particular its module cppcheck_analysis.py
will use a new function cppcheck_exclusion_file_list().

No functional changes are intended.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/scripts/xen_analysis/cppcheck_analysis.py |  6 ++--
 .../xen_analysis/exclusion_file_list.py       | 31 ++++++++++---------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index 8dc45e653b79..e54848aa5339 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -2,7 +2,8 @@
 
 import os, re, shutil
 from . import settings, utils, cppcheck_report_utils, exclusion_file_list
-from .exclusion_file_list import ExclusionFileListError
+from .exclusion_file_list import (ExclusionFileListError,
+                                  cppcheck_exclusion_file_list)
 
 class GetMakeVarsPhaseError(Exception):
     pass
@@ -54,8 +55,7 @@ def __generate_suppression_list(out_file):
             try:
                 exclusion_file = \
                     "{}/docs/misra/exclude-list.json".format(settings.repo_dir)
-                exclusion_list = \
-                    exclusion_file_list.load_exclusion_file_list(exclusion_file)
+                exclusion_list = cppcheck_exclusion_file_list(exclusion_file)
             except ExclusionFileListError as e:
                 raise CppcheckDepsPhaseError(
                     "Issue with reading file {}: {}".format(exclusion_file, e)
diff --git a/xen/scripts/xen_analysis/exclusion_file_list.py b/xen/scripts/xen_analysis/exclusion_file_list.py
index 871e480586bb..79ebd34f55ec 100644
--- a/xen/scripts/xen_analysis/exclusion_file_list.py
+++ b/xen/scripts/xen_analysis/exclusion_file_list.py
@@ -7,16 +7,24 @@ class ExclusionFileListError(Exception):
     pass
 
 
-def __cppcheck_path_exclude_syntax(path):
-    # Prepending * to the relative path to match every path where the Xen
-    # codebase could be
-    path = "*" + path
+def cppcheck_exclusion_file_list(input_file):
+    ret = []
+    excl_list = load_exclusion_file_list(input_file)
+
+    for entry in excl_list:
+        # Prepending * to the relative path to match every path where the Xen
+        # codebase could be
+        ret.append("*" + entry[0])
 
-    return path
+    return ret
 
 
-# Reads the exclusion file list and returns a list of relative path to be
-# excluded.
+# Reads the exclusion file list and returns an array containing a set where the
+# first entry is what was listed in the exclusion list file, and the second
+# entry is the absolute path of the first entry.
+# If the first entry contained a wildcard '*', the second entry will have an
+# array of the solved absolute path for that entry.
+# Returns [('path',[path,path,...]), ('path',[path,path,...]), ...]
 def load_exclusion_file_list(input_file):
     ret = []
     try:
@@ -58,13 +66,6 @@ def load_exclusion_file_list(input_file):
                     .format(path, filepath_object)
                 )
 
-        if settings.analysis_tool == "cppcheck":
-            path = __cppcheck_path_exclude_syntax(path)
-        else:
-            raise ExclusionFileListError(
-                "Unimplemented for {}!".format(settings.analysis_tool)
-            )
-
-        ret.append(path)
+        ret.append((path, check_path))
 
     return ret
-- 
2.34.1


