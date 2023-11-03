Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC0F7E04FD
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 15:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627195.978104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyvVV-0002WS-Dl; Fri, 03 Nov 2023 14:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627195.978104; Fri, 03 Nov 2023 14:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyvVV-0002U6-B7; Fri, 03 Nov 2023 14:50:45 +0000
Received: by outflank-mailman (input) for mailman id 627195;
 Fri, 03 Nov 2023 14:50:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozhd=GQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qyvVT-0002Ty-QN
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 14:50:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c484d21-7a58-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 15:50:42 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 0E91A4EE0744;
 Fri,  3 Nov 2023 15:50:39 +0100 (CET)
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
X-Inumbo-ID: 5c484d21-7a58-11ee-98d8-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-4.19 v6] xen: Add deviations for MISRA C:2012 Rule 7.1
Date: Fri,  3 Nov 2023 15:50:36 +0100
Message-Id: <3646e75ebfc8b78d44578e3303bfa1660e0b684b.1699022991.git.nicola.vetrini@bugseng.com>
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
Changes in v6:
- use octal-ok everywhere; remove SAF-2-safe
---
 .../eclair_analysis/ECLAIR/deviations.ecl     |  7 ++--
 docs/misra/deviations.rst                     |  6 +++
 xen/arch/x86/hvm/svm/emulate.c                |  6 +--
 xen/arch/x86/hvm/svm/svm.h                    | 38 +++++++++----------
 xen/common/inflate.c                          |  4 +-
 5 files changed, 33 insertions(+), 28 deletions(-)

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
index 8511a189253b..3a214d66eb37 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -90,6 +90,12 @@ Deviations related to MISRA C:2012 Rules:
          - __emulate_2op and __emulate_2op_nobyte
          - read_debugreg and write_debugreg
 
+   * - R7.1
+     - It is safe to use certain octal constants the way they are defined
+       in specifications, manuals, and algorithm descriptions. Such places
+       are marked safe with a /\* octal-ok \*/ in-code comment.
+     - Tagged as `safe` for ECLAIR.
+
    * - R7.2
      - Violations caused by __HYPERVISOR_VIRT_START are related to the
        particular use of it done in xen_mk_ulong.
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
index 8fa4b96d12a3..58f263d9e852 100644
--- a/xen/common/inflate.c
+++ b/xen/common/inflate.c
@@ -1201,8 +1201,8 @@ static int __init gunzip(void)
     magic[1] = NEXTBYTE();
     method   = NEXTBYTE();
 
-    if (magic[0] != 037 ||
-        ((magic[1] != 0213) && (magic[1] != 0236))) {
+    if (magic[0] != 037 ||                            /* octal-ok */
+        ((magic[1] != 0213) && (magic[1] != 0236))) { /* octal-ok */
         error("bad gzip magic numbers");
         return -1;
     }
-- 
2.34.1


