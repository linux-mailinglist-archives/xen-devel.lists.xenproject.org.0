Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8967D9CAD
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 17:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624606.973180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwOV6-0006tu-0o; Fri, 27 Oct 2023 15:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624606.973180; Fri, 27 Oct 2023 15:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwOV5-0006s0-U2; Fri, 27 Oct 2023 15:11:51 +0000
Received: by outflank-mailman (input) for mailman id 624606;
 Fri, 27 Oct 2023 15:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwOV4-0006ru-BD
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 15:11:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25f7debd-74db-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 17:11:48 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D87094EE073E;
 Fri, 27 Oct 2023 17:11:45 +0200 (CEST)
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
X-Inumbo-ID: 25f7debd-74db-11ee-9b0e-b553b5be7939
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
Subject: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012 Rule 7.1
Date: Fri, 27 Oct 2023 17:11:43 +0200
Message-Id: <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com>
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
Changes in v4:
- updated deviation record comment.
Changes in v5:
- use octal-ok instead of keying the deviation to the file.
---
Indentation on svm.h has been modified to fit the whole line within
80 characters
---
 .../eclair_analysis/ECLAIR/deviations.ecl     |  7 ++--
 docs/misra/deviations.rst                     |  7 ++++
 docs/misra/safe.json                          |  8 ++++
 xen/arch/x86/hvm/svm/emulate.c                |  6 +--
 xen/arch/x86/hvm/svm/svm.h                    | 38 +++++++++----------
 xen/common/inflate.c                          |  4 +-
 6 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fa56e5c00a27..fabbf9d66330 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -85,10 +85,9 @@ conform to the directive."
 # Series 7.
 #
 
--doc_begin="Usage of the following constants is safe, since they are given as-is
-in the inflate algorithm specification and there is therefore no risk of them
-being interpreted as decimal constants."
--config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
+-doc_begin="It is safe to use certain octal constants the way they are defined
+in specifications, manuals, and algorithm descriptions."
+-config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(text(^.*octal-ok.*$))))"}
 -doc_end
 
 -doc_begin="Violations in files that maintainers have asked to not modify in the
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 8511a189253b..8aaaa1473fb4 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -90,6 +90,13 @@ Deviations related to MISRA C:2012 Rules:
          - __emulate_2op and __emulate_2op_nobyte
          - read_debugreg and write_debugreg
 
+   * - R7.1
+     - It is safe to use certain octal constants the way they are defined
+       in specifications, manuals, and algorithm descriptions. Such places
+       are marked safe with a /\* octal-ok \*/ in-code comment, or with a SAF
+       comment (see safe.json).
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
 
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index d2a781fc3fb5..8dbf37ff4961 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -53,25 +53,25 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
  */
 #define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
 
-#define INSTR_PAUSE       INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
-#define INSTR_INT3        INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
-#define INSTR_ICEBP       INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
-#define INSTR_HLT         INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
-#define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
-#define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
-#define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
-#define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
-#define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
-#define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
-#define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
-#define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
-#define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)
-#define INSTR_INVD        INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
-#define INSTR_WBINVD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
-#define INSTR_WRMSR       INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
-#define INSTR_RDTSC       INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
-#define INSTR_RDMSR       INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
-#define INSTR_CPUID       INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
+#define INSTR_PAUSE      INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
+#define INSTR_INT3       INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
+#define INSTR_ICEBP      INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
+#define INSTR_HLT        INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
+#define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
+#define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
+#define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
+#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
+#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
+#define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
+#define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
+#define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */
+#define INSTR_RDTSCP     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371) /* octal-ok */
+#define INSTR_INVD       INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
+#define INSTR_WBINVD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
+#define INSTR_WRMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
+#define INSTR_RDTSC      INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
+#define INSTR_RDMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
+#define INSTR_CPUID      INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
 
 unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc);
 unsigned int svm_get_task_switch_insn_len(void);
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

