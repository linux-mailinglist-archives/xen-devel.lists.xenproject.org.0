Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8F22DCE60
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 10:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55784.97300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdr-000727-D4; Thu, 17 Dec 2020 09:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55784.97300; Thu, 17 Dec 2020 09:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdr-00070m-4P; Thu, 17 Dec 2020 09:32:11 +0000
Received: by outflank-mailman (input) for mailman id 55784;
 Thu, 17 Dec 2020 09:32:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kppdo-0006RQ-UK
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 09:32:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8d3504b-9db0-4650-92c8-b11bf05e908e;
 Thu, 17 Dec 2020 09:31:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EA20B71A;
 Thu, 17 Dec 2020 09:31:48 +0000 (UTC)
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
X-Inumbo-ID: e8d3504b-9db0-4650-92c8-b11bf05e908e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608197508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TvIYSNPdBSefisWFtTOksv3sxjm38mYHs1Pyg9aHYqE=;
	b=nvEwT2oDeGIskBzFViVMmay8X7b3n/OSFIxRxooevtQ/kgewzkhr5nPy+Aucg2f9zx0LjE
	LFY8Mx3cQe3AWA7NjKrb3ADoMWFUoFwjFSWjiP+WM7y+OWTC91NI0Uj3Wvu5+bATZcNUQ4
	2Kw25F56RY3EpTGm9xoWP0r5mG7nFL8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 07/15] x86/alternative: support "not feature" and ALTERNATIVE_TERNARY
Date: Thu, 17 Dec 2020 10:31:25 +0100
Message-Id: <20201217093133.1507-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201217093133.1507-1-jgross@suse.com>
References: <20201217093133.1507-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of only supporting to modify instructions when a specific
feature is set, support doing so for the case a feature is not set.

As today a feature is specified using a 16 bit quantity and the highest
feature number in use is around 600, using a negated feature number for
specifying the inverted case seems to be appropriate.

  ALTERNATIVE "default_instr", "patched_instr", ~FEATURE_NR

will start with "default_instr" and patch that with "patched_instr" in
case FEATURE_NR is not set.

Using that add ALTERNATIVE_TERNARY:

  ALTERNATIVE_TERNARY "default_instr", FEATURE_NR,
                      "feature_on_instr", "feature_off_instr"

which will start with "default_instr" and at patch time will, depending
on FEATURE_NR being set or not, patch that with either
"feature_on_instr" or "feature_off_instr".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 arch/x86/include/asm/alternative-asm.h |  3 +++
 arch/x86/include/asm/alternative.h     |  7 +++++++
 arch/x86/kernel/alternative.c          | 17 ++++++++++++-----
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/alternative-asm.h b/arch/x86/include/asm/alternative-asm.h
index 464034db299f..b6989995fddf 100644
--- a/arch/x86/include/asm/alternative-asm.h
+++ b/arch/x86/include/asm/alternative-asm.h
@@ -109,6 +109,9 @@
 	.popsection
 .endm
 
+#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	\
+	ALTERNATIVE_2 oldinstr, newinstr1, feature, newinstr2, ~(feature)
+
 #endif  /*  __ASSEMBLY__  */
 
 #endif /* _ASM_X86_ALTERNATIVE_ASM_H */
diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 13adca37c99a..a0f8f33609aa 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -59,6 +59,7 @@ struct alt_instr {
 	s32 instr_offset;	/* original instruction */
 	s32 repl_offset;	/* offset to replacement instruction */
 	u16 cpuid;		/* cpuid bit set for replacement */
+#define ALT_INSTR_CPUID_INV	0x8000	/* patch if ~cpuid bit is NOT set */
 	u8  instrlen;		/* length of original instruction */
 	u8  replacementlen;	/* length of new instruction */
 	u8  padlen;		/* length of build-time padding */
@@ -175,6 +176,9 @@ static inline int alternatives_text_reserved(void *start, void *end)
 	ALTINSTR_REPLACEMENT(newinstr2, feature2, 2)			\
 	".popsection\n"
 
+#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	\
+	ALTERNATIVE_2(oldinstr, newinstr1, feature, newinstr2, ~(feature))
+
 #define ALTERNATIVE_3(oldinsn, newinsn1, feat1, newinsn2, feat2, newinsn3, feat3) \
 	OLDINSTR_3(oldinsn, 1, 2, 3)						\
 	".pushsection .altinstructions,\"a\"\n"					\
@@ -206,6 +210,9 @@ static inline int alternatives_text_reserved(void *start, void *end)
 #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
 	asm_inline volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1, newinstr2, feature2) ::: "memory")
 
+#define alternative_ternary(oldinstr, feature, newinstr1, newinstr2)	\
+	asm_inline volatile(ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2) ::: "memory")
+
 /*
  * Alternative inline assembly with input.
  *
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 8d778e46725d..0a904fb2678b 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -388,21 +388,28 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 	 */
 	for (a = start; a < end; a++) {
 		int insn_buff_sz = 0;
+		u16 feature;
+		bool not_feature;
 
 		instr = (u8 *)&a->instr_offset + a->instr_offset;
 		replacement = (u8 *)&a->repl_offset + a->repl_offset;
+		feature = a->cpuid;
+		not_feature = feature & ALT_INSTR_CPUID_INV;
+		if (not_feature)
+			feature = ~feature;
 		BUG_ON(a->instrlen > sizeof(insn_buff));
-		BUG_ON(a->cpuid >= (NCAPINTS + NBUGINTS) * 32);
-		if (!boot_cpu_has(a->cpuid)) {
+		BUG_ON(feature >= (NCAPINTS + NBUGINTS) * 32);
+		if (!!boot_cpu_has(feature) == not_feature) {
 			if (a->padlen > 1)
 				optimize_nops(a, instr);
 
 			continue;
 		}
 
-		DPRINTK("feat: %d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d), pad: %d",
-			a->cpuid >> 5,
-			a->cpuid & 0x1f,
+		DPRINTK("feat: %s%d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d), pad: %d",
+			not_feature ? "~" : "",
+			feature >> 5,
+			feature & 0x1f,
 			instr, instr, a->instrlen,
 			replacement, a->replacementlen, a->padlen);
 
-- 
2.26.2


