Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C651C7D5263
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622001.969041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHkp-0005gU-MB; Tue, 24 Oct 2023 13:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622001.969041; Tue, 24 Oct 2023 13:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHkp-0005dq-JY; Tue, 24 Oct 2023 13:47:31 +0000
Received: by outflank-mailman (input) for mailman id 622001;
 Tue, 24 Oct 2023 13:47:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CvU=GG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvHko-0005dk-NP
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:47:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfce70c6-7273-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 15:47:29 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C7B9B4EE0739;
 Tue, 24 Oct 2023 15:47:27 +0200 (CEST)
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
X-Inumbo-ID: dfce70c6-7273-11ee-98d5-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-4.19 v3] xen: Add deviations for MISRA C:2012 Rule 7.1
Date: Tue, 24 Oct 2023 15:47:24 +0200
Message-Id: <5e0f1bcd7b4325141e64a3c2d581034956b42293.1698136547.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As specified in rules.rst, these constants can be used
in the code.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- replace some SAF deviations with configurations
Changes in v3:
- refine configurations and justifications
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++----
 docs/misra/deviations.rst                        |  5 +++++
 docs/misra/safe.json                             |  8 ++++++++
 xen/arch/x86/hvm/svm/emulate.c                   |  6 +++---
 xen/common/inflate.c                             |  4 ++--
 5 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fa56e5c00a27..ea5e0eb1813f 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -85,10 +85,12 @@ conform to the directive."
 # Series 7.
 #
 
--doc_begin="Usage of the following constants is safe, since they are given as-is
-in the inflate algorithm specification and there is therefore no risk of them
-being interpreted as decimal constants."
--config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
+-doc_begin="It is safe to use certain octal constants the way they are defined in
+specifications, manuals, and algorithm descriptions."
+-file_tag+={x86_svm_h, "^xen/arch/x86/hvm/svm/svm\\.h$"}
+-file_tag+={x86_emulate_c, "^xen/arch/x86/hvm/svm/emulate\\.c$"}
+-config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(file(x86_svm_h)&&macro(^INSTR_ENC$))))"}
+-config=MC3R1.R7.1,reports+={safe, "any_area(text(^.*octal-ok.*$)&&any_loc(any_exp(file(x86_emulate_c)&&macro(^MASK_EXTR$))))"}
 -doc_end
 
 -doc_begin="Violations in files that maintainers have asked to not modify in the
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 8511a189253b..26c6dbbc9ffe 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -90,6 +90,11 @@ Deviations related to MISRA C:2012 Rules:
          - __emulate_2op and __emulate_2op_nobyte
          - read_debugreg and write_debugreg
 
+   * - R7.1
+     - It is safe to use certain octal constants the way they are defined in
+       specifications, manuals, and algorithm descriptions.
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
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index aa2c61c433b3..93ac1d3435f9 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
         if ( !instr_modrm )
             return emul_len;
 
-        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) &&
-             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
-             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )
+        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) && /* octal-ok */
+             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* octal-ok */
+             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )  /* octal-ok */
             return emul_len;
     }
 
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


