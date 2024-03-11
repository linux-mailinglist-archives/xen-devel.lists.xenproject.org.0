Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B5F877C17
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691263.1077065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW4-0007SF-0K; Mon, 11 Mar 2024 09:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691263.1077065; Mon, 11 Mar 2024 09:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW3-0007QK-R4; Mon, 11 Mar 2024 09:00:15 +0000
Received: by outflank-mailman (input) for mailman id 691263;
 Mon, 11 Mar 2024 09:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW2-0006j9-0I
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4c1e773-df85-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:00:12 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 4BD344EE0C98;
 Mon, 11 Mar 2024 10:00:11 +0100 (CET)
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
X-Inumbo-ID: c4c1e773-df85-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3 02/16] misra: modify deviations for empty and generated headers
Date: Mon, 11 Mar 2024 09:59:11 +0100
Message-Id: <8a491f641a8931b6ccc91fca1da6cdfa090c5b36.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch modifies deviations for Directive 4.10:
"Precautions shall be taken in order to prevent the contents of
a header file being included more than once"

This patch avoids the file-based deviation for empty headers, and
replaces it with a comment-based one using the format specified in
docs/misra/safe.json.

Generated headers are not generally safe against multi-inclusions,
whether a header is safe depends on the nature of the generated code
in the header. For that reason, this patch drops the deviation for
generated headers.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- use the format introduced with doc/misra/safe.json instead of
  a file-based deviation for empty headers
- remove deviation for generated headers

The reason of moving the comment-based deviation in "runtime.h" is that
it should appear immediatly before the violation and, for files with no
tokens,	the location is the the last line of the file.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  7 -------
 docs/misra/safe.json                             | 13 ++++++++++---
 xen/arch/arm/efi/runtime.h                       |  1 +
 xen/include/Makefile                             |  2 +-
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 9ac3ee4dfd..039ffaf52a 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -63,13 +63,6 @@ they are not instances of commented-out code."
 -config=MC3R1.D4.3,reports+={disapplied,"!(any_area(any_loc(file(^xen/arch/arm/arm64/.*$))))"}
 -doc_end
 
--doc_begin="This header file is autogenerated or empty, therefore it poses no
-risk if included more than once."
--file_tag+={empty_header, "^xen/arch/arm/efi/runtime\\.h$"}
--file_tag+={autogen_headers, "^xen/include/xen/compile\\.h$||^xen/include/generated/autoconf.h$||^xen/include/xen/hypercall-defs.h$"}
--config=MC3R1.D4.10,reports+={safe, "all_area(all_loc(file(empty_header||autogen_headers)))"}
--doc_end
-
 -doc_begin="Files that are intended to be included more than once do not need to
 conform to the directive."
 -config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* This file is legitimately included multiple times\\. \\*/$, begin-4))"}
diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index e98956d604..d2489379a7 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -33,10 +33,17 @@
             },
             "name": "Dir 4.10: headers that leave it up to the caller to include them correctly",
             "text": "Headers that deliberatively avoid inclusion guards explicitly leaving responsibility to the caller are allowed."
-
-            },
-            {
+        },
+        {
             "id": "SAF-4-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: empty headers",
+            "text": "Empty headers pose no risk if included more than once."
+        },
+        {
+            "id": "SAF-5-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/efi/runtime.h b/xen/arch/arm/efi/runtime.h
index 25afcebed1..732bf4a18c 100644
--- a/xen/arch/arm/efi/runtime.h
+++ b/xen/arch/arm/efi/runtime.h
@@ -1 +1,2 @@
 /* Placeholder for ARM-specific runtime include/declarations */
+/* SAF-4-safe empty header */
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 2e61b50139..a77c9ffb7e 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -53,7 +53,7 @@ cmd_compat_h = \
     mv -f $@.new $@
 
 quiet_cmd_stub_h = GEN     $@
-cmd_stub_h = echo '/* empty */' >$@
+cmd_stub_h = echo '/* SAF-4-safe empty header */' >$@
 
 quiet_cmd_compat_i = CPP     $@
 cmd_compat_i = $(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
-- 
2.34.1


