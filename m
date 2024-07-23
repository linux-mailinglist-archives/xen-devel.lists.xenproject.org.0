Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DE2939C55
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762675.1172902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgO-0008Qn-Qa; Tue, 23 Jul 2024 08:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762675.1172902; Tue, 23 Jul 2024 08:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgO-0008Ow-Ni; Tue, 23 Jul 2024 08:15:40 +0000
Received: by outflank-mailman (input) for mailman id 762675;
 Tue, 23 Jul 2024 08:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAgN-0008AN-JK
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:15:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be7d88b8-48cb-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 10:15:38 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id DF8D44EE0743;
 Tue, 23 Jul 2024 10:15:35 +0200 (CEST)
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
X-Inumbo-ID: be7d88b8-48cb-11ef-bbfe-fd08da9f4363
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
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH v5 02/17] misra: modify deviations for empty and generated headers
Date: Tue, 23 Jul 2024 10:14:54 +0200
Message-Id: <bbfc7ed03009f4061562525d2f736bb4816993ed.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
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
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

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
index 44d1c4890e..ffa8bfdc4a 100644
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


