Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4BF7CF619
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619188.963854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQpq-00031H-Fa; Thu, 19 Oct 2023 11:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619188.963854; Thu, 19 Oct 2023 11:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQpq-0002xy-Cq; Thu, 19 Oct 2023 11:05:02 +0000
Received: by outflank-mailman (input) for mailman id 619188;
 Thu, 19 Oct 2023 11:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtQpo-0002xs-W0
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:05:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 581d8bfe-6e6f-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:04:59 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 83A5F4EE073D;
 Thu, 19 Oct 2023 13:04:57 +0200 (CEST)
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
X-Inumbo-ID: 581d8bfe-6e6f-11ee-98d5-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v2] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Date: Thu, 19 Oct 2023 13:04:54 +0200
Message-Id: <a9c52c943380f2c35f0a6ccab8215c03e87c99dc.1697712857.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As specified in rules.rst, these constants can be used
in the code. Suitable deviations records are added in deviations.rst

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- replace some SAF deviations with configurations
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++----
 docs/misra/deviations.rst                        | 6 ++++++
 docs/misra/safe.json                             | 8 ++++++++
 xen/common/inflate.c                             | 4 ++--
 4 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fa56e5c00a27..3bf8e8b8fdec 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -85,10 +85,10 @@ conform to the directive."
 # Series 7.
 #

--doc_begin="Usage of the following constants is safe, since they are given as-is
-in the inflate algorithm specification and there is therefore no risk of them
-being interpreted as decimal constants."
--config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
+-doc_begin="Octal constants used as arguments to macro INSTR_ENC or MASK_EXTR
+can be used, because they appear as is in specifications, manuals, and
+algorithm descriptions."
+-config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(macro(^(INSTR_ENC|MASK_EXTR)$))))"}
 -doc_end

 -doc_begin="Violations in files that maintainers have asked to not modify in the
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 8511a189253b..f26eb371f3e4 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -90,6 +90,12 @@ Deviations related to MISRA C:2012 Rules:
          - __emulate_2op and __emulate_2op_nobyte
          - read_debugreg and write_debugreg

+   * - R7.1
+     - It is safe to use certain octal constants the way they are defined in
+       specifications, manuals, and algorithm descriptions as arguments to
+       macros 'INSTR_ENC' and 'MASK_EXTR'.
+     - Tagged as `safe` for ECLAIR.
+
    * - R7.2
      - Violations caused by __HYPERVISOR_VIRT_START are related to the
        particular use of it done in xen_mk_ulong.
diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 39c5c056c7d4..7ea47344ffcc 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -20,6 +20,14 @@
         },
         {
             "id": "SAF-2-safe",
+            "analyser": {
+                "eclair": "MC3R1.R7.1"
+            },
+            "name": "Rule 7.1: constants defined in specifications, manuals, and algorithm descriptions",
+            "text": "It is safe to use certain octal constants the way they are defined in specifications, manuals, and algorithm descriptions."
+        },
+        {
+            "id": "SAF-3-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/common/inflate.c b/xen/common/inflate.c
index 8fa4b96d12a3..be6a9115187e 100644
--- a/xen/common/inflate.c
+++ b/xen/common/inflate.c
@@ -1201,8 +1201,8 @@ static int __init gunzip(void)
     magic[1] = NEXTBYTE();
     method   = NEXTBYTE();

-    if (magic[0] != 037 ||
-        ((magic[1] != 0213) && (magic[1] != 0236))) {
+    /* SAF-2-safe */
+    if (magic[0] != 037 || ((magic[1] != 0213) && (magic[1] != 0236))) {
         error("bad gzip magic numbers");
         return -1;
     }
--
2.34.1

