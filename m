Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB1291DD98
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 13:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751473.1159460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOEwF-0002so-Nu; Mon, 01 Jul 2024 11:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751473.1159460; Mon, 01 Jul 2024 11:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOEwF-0002po-L1; Mon, 01 Jul 2024 11:11:15 +0000
Received: by outflank-mailman (input) for mailman id 751473;
 Mon, 01 Jul 2024 11:11:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOEwE-0002K1-84
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 11:11:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a043f2b6-379a-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 13:11:12 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 792724EE0747;
 Mon,  1 Jul 2024 13:11:09 +0200 (CEST)
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
X-Inumbo-ID: a043f2b6-379a-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH 02/17] misra: modify deviations for empty and generated headers
Date: Mon,  1 Jul 2024 13:10:20 +0200
Message-Id: <ec512e73b739d0d1c83de559bdab2e461a214644.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v4:
- rebased against current staging tree

Changes in v2:
- use the format introduced with doc/misra/safe.json instead of
  a file-based deviation for empty headers
- remove deviation for generated headers

The reason of moving the comment-based deviation in "runtime.h" is that
it should appear immediatly before the violation and, for files with no
tokens,	the location is the the last line of the file.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 -------
 docs/misra/safe.json                             | 8 ++++++++
 xen/arch/arm/efi/runtime.h                       | 1 +
 xen/include/Makefile                             | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 0af1cb93d1..1c39a9a16d 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -72,13 +72,6 @@ they are not instances of commented-out code."
 -config=MC3R1.D4.3,reports+={deliberate, "any_area(any_loc(file(arm64_bitops))&&context(name(int_clear_mask16)))"}
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
index b865caac73..282013aa4e 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -76,6 +76,14 @@
         },
         {
             "id": "SAF-9-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: empty headers",
+            "text": "Empty headers pose no risk if included more than once."
+        },
+        {
+            "id": "SAF-10-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/efi/runtime.h b/xen/arch/arm/efi/runtime.h
index 25afcebed1..4d2d40bf3c 100644
--- a/xen/arch/arm/efi/runtime.h
+++ b/xen/arch/arm/efi/runtime.h
@@ -1 +1,2 @@
 /* Placeholder for ARM-specific runtime include/declarations */
+/* SAF-9-safe empty header */
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 2e61b50139..058b0a566b 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -53,7 +53,7 @@ cmd_compat_h = \
     mv -f $@.new $@
 
 quiet_cmd_stub_h = GEN     $@
-cmd_stub_h = echo '/* empty */' >$@
+cmd_stub_h = echo '/* SAF-9-safe empty header */' >$@
 
 quiet_cmd_compat_i = CPP     $@
 cmd_compat_i = $(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
-- 
2.34.1


