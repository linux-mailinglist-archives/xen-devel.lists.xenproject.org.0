Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A593816CF4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655903.1023801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCAB-00058q-G2; Mon, 18 Dec 2023 11:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655903.1023801; Mon, 18 Dec 2023 11:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCAB-00055m-CH; Mon, 18 Dec 2023 11:51:59 +0000
Received: by outflank-mailman (input) for mailman id 655903;
 Mon, 18 Dec 2023 11:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MePR=H5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rFCA9-00055g-S0
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:51:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7eeb694-9d9b-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 12:51:56 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.210.165.135])
 by support.bugseng.com (Postfix) with ESMTPSA id B5A034EE0742;
 Mon, 18 Dec 2023 12:51:53 +0100 (CET)
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
X-Inumbo-ID: d7eeb694-9d9b-11ee-98eb-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] docs/misra: add entries to exclude-list
Date: Mon, 18 Dec 2023 12:51:45 +0100
Message-Id: <5df2a8c3c6daa0bec1b38f440fcd8fa3a380a1f6.1702900114.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exclude efibind.h for all the architectures: it is used to build the
efi stub, which is a separate entry point for Xen when booted from EFI
firmware.
Remove redundant entries from out_of_scope.ecl.

Exclude common/coverage: it is code to support gcov, hence it is part
of the testing machinery.

Exclude decompress.h: file ported from Linux that defines a unique and
documented interface towards all the (adopted) decompress functions.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/out_of_scope.ecl      |  5 -----
 docs/misra/exclude-list.json                     | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
index fd870716cf..9bcec4c69d 100644
--- a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
+++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
@@ -17,11 +17,6 @@
 -file_tag+={out_of_scope,"^xen/arch/x86/include/asm/intel-family\\.h$"}
 -doc_end
 
--doc_begin="Files imported from the gnu-efi package"
--file_tag+={adopted,"^xen/include/efi/.*$"}
--file_tag+={adopted,"^xen/arch/x86/include/asm/x86_64/efibind\\.h$"}
--doc_end
-
 -doc_begin="Build tools are out of scope."
 -file_tag+={out_of_scope_tools,"^xen/tools/.*$"}
 -file_tag+={out_of_scope_tools,"^xen/arch/x86/efi/mkreloc\\.c$"}
diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 48f671c548..83fae0b4a4 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -1,6 +1,10 @@
 {
     "version": "1.0",
     "content": [
+        {
+            "rel_path": "arch/*/include/asm/*/efibind.h",
+            "comment": "Imported from gnu-efi package, ignore for now"
+        },
         {
             "rel_path": "arch/arm/arm64/cpufeature.c",
             "comment": "Imported from Linux, ignore for now"
@@ -97,6 +101,10 @@
             "rel_path": "arch/x86/efi/check.c",
             "comment": "The resulting code is not included in the final Xen binary, ignore for now"
         },
+        {
+            "rel_path": "common/coverage/*",
+            "comment": "Files to support gcov, ignore for now"
+        },
         {
             "rel_path": "common/bitmap.c",
             "comment": "Imported from Linux, ignore for now"
@@ -213,6 +221,14 @@
             "rel_path": "include/xen/acpi.h",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "include/efi/*",
+            "comment": "Imported from gnu-efi package, ignore for now"
+        },
+        {
+            "rel_path": "include/xen/decompress.h",
+            "comment": "Imported from Linux, ignore for now"
+        },
         {
             "rel_path": "lib/list-sort.c",
             "comment": "Imported from Linux, ignore for now"
-- 
2.34.1


