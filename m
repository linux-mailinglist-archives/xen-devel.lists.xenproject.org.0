Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4E57AB74
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 03:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371276.603102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDyG0-00046q-QX; Wed, 20 Jul 2022 01:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371276.603102; Wed, 20 Jul 2022 01:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDyG0-00044T-Nr; Wed, 20 Jul 2022 01:12:08 +0000
Received: by outflank-mailman (input) for mailman id 371276;
 Wed, 20 Jul 2022 01:12:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/117=XZ=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1oDyFz-00044I-A5
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 01:12:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7f77d53-07c8-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 03:12:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B1951B81DE4;
 Wed, 20 Jul 2022 01:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CD9C341C6;
 Wed, 20 Jul 2022 01:12:01 +0000 (UTC)
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
X-Inumbo-ID: f7f77d53-07c8-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658279523;
	bh=VoMl3IiXADXOrzYUU30d8G4boCKSZdvtXjRJJHHaY44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TDcie2KO3OBwvTT5O2M6l0j6f99DtbItqm2N3h8YB/Me2Xcsc4j83RP1GoDGwj2+6
	 996/g2aEZyU/RDVPXWHAqY/bE1z+B9P7/vTCiL+rBlMw75lgevexKtO9bav68aAxPs
	 uZNh/k32ik3JWvRKKpinpUbo7MYP9Xgp7bvW3pOtqPxOOcFneLyo6ZKsGp7BxM4oGA
	 M7g094X8ECOWxiyfjKXNBtoPwk7dY6j13mbIVBAjBMuGgiy8p37HE9AQnnX36IQhKD
	 oiChHPykcF/xJToKcZxD6+lxZNtJ+h+FQaVg+AIAfAC7Y1cfXLN/RBT/WlYVYrm7WF
	 9dOlq8GtfsnEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@suse.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	luto@kernel.org,
	jgross@suse.com,
	pawan.kumar.gupta@linux.intel.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.18 20/54] objtool: Update Retpoline validation
Date: Tue, 19 Jul 2022 21:09:57 -0400
Message-Id: <20220720011031.1023305-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011031.1023305-1-sashal@kernel.org>
References: <20220720011031.1023305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Peter Zijlstra <peterz@infradead.org>

[ Upstream commit 9bb2ec608a209018080ca262f771e6a9ff203b6f ]

Update retpoline validation with the new CONFIG_RETPOLINE requirement of
not having bare naked RET instructions.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/include/asm/nospec-branch.h |  6 ++++++
 arch/x86/mm/mem_encrypt_boot.S       |  2 ++
 arch/x86/xen/xen-head.S              |  1 +
 tools/objtool/check.c                | 19 +++++++++++++------
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
index 92290b4f1c96..a790109f9337 100644
--- a/arch/x86/include/asm/nospec-branch.h
+++ b/arch/x86/include/asm/nospec-branch.h
@@ -75,6 +75,12 @@
 	.popsection
 .endm
 
+/*
+ * (ab)use RETPOLINE_SAFE on RET to annotate away 'bare' RET instructions
+ * vs RETBleed validation.
+ */
+#define ANNOTATE_UNRET_SAFE ANNOTATE_RETPOLINE_SAFE
+
 /*
  * JMP_NOSPEC and CALL_NOSPEC macros can be used instead of a simple
  * indirect jmp/call which may be susceptible to the Spectre variant 2
diff --git a/arch/x86/mm/mem_encrypt_boot.S b/arch/x86/mm/mem_encrypt_boot.S
index d94dea450fa6..9de3d900bc92 100644
--- a/arch/x86/mm/mem_encrypt_boot.S
+++ b/arch/x86/mm/mem_encrypt_boot.S
@@ -66,6 +66,7 @@ SYM_FUNC_START(sme_encrypt_execute)
 	pop	%rbp
 
 	/* Offset to __x86_return_thunk would be wrong here */
+	ANNOTATE_UNRET_SAFE
 	ret
 	int3
 SYM_FUNC_END(sme_encrypt_execute)
@@ -154,6 +155,7 @@ SYM_FUNC_START(__enc_copy)
 	pop	%r15
 
 	/* Offset to __x86_return_thunk would be wrong here */
+	ANNOTATE_UNRET_SAFE
 	ret
 	int3
 .L__enc_copy_end:
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 3a2cd93bf059..fa884fc73e07 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -26,6 +26,7 @@ SYM_CODE_START(hypercall_page)
 	.rept (PAGE_SIZE / 32)
 		UNWIND_HINT_FUNC
 		ANNOTATE_NOENDBR
+		ANNOTATE_UNRET_SAFE
 		ret
 		/*
 		 * Xen will write the hypercall page, and sort out ENDBR.
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 204519704f3b..2daa0dce199b 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2097,8 +2097,9 @@ static int read_retpoline_hints(struct objtool_file *file)
 		}
 
 		if (insn->type != INSN_JUMP_DYNAMIC &&
-		    insn->type != INSN_CALL_DYNAMIC) {
-			WARN_FUNC("retpoline_safe hint not an indirect jump/call",
+		    insn->type != INSN_CALL_DYNAMIC &&
+		    insn->type != INSN_RETURN) {
+			WARN_FUNC("retpoline_safe hint not an indirect jump/call/ret",
 				  insn->sec, insn->offset);
 			return -1;
 		}
@@ -3631,7 +3632,8 @@ static int validate_retpoline(struct objtool_file *file)
 
 	for_each_insn(file, insn) {
 		if (insn->type != INSN_JUMP_DYNAMIC &&
-		    insn->type != INSN_CALL_DYNAMIC)
+		    insn->type != INSN_CALL_DYNAMIC &&
+		    insn->type != INSN_RETURN)
 			continue;
 
 		if (insn->retpoline_safe)
@@ -3646,9 +3648,14 @@ static int validate_retpoline(struct objtool_file *file)
 		if (!strcmp(insn->sec->name, ".init.text") && !module)
 			continue;
 
-		WARN_FUNC("indirect %s found in RETPOLINE build",
-			  insn->sec, insn->offset,
-			  insn->type == INSN_JUMP_DYNAMIC ? "jump" : "call");
+		if (insn->type == INSN_RETURN) {
+			WARN_FUNC("'naked' return found in RETPOLINE build",
+				  insn->sec, insn->offset);
+		} else {
+			WARN_FUNC("indirect %s found in RETPOLINE build",
+				  insn->sec, insn->offset,
+				  insn->type == INSN_JUMP_DYNAMIC ? "jump" : "call");
+		}
 
 		warnings++;
 	}
-- 
2.35.1


