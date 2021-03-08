Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23E330D7F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94854.178732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF0R-0004yy-9c; Mon, 08 Mar 2021 12:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94854.178732; Mon, 08 Mar 2021 12:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF0R-0004y9-50; Mon, 08 Mar 2021 12:29:03 +0000
Received: by outflank-mailman (input) for mailman id 94854;
 Mon, 08 Mar 2021 12:29:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7wcm=IG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJF0P-0004nW-AA
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:29:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65108507-ec09-4e9a-b903-90b38b0bb3b9;
 Mon, 08 Mar 2021 12:28:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A636AD73;
 Mon,  8 Mar 2021 12:28:50 +0000 (UTC)
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
X-Inumbo-ID: 65108507-ec09-4e9a-b903-90b38b0bb3b9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615206530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=256H1k7Fa3HpWRn/najlrX8F12wVH//y72/kSGmicik=;
	b=kIBCYqb5tkrSpCJXtvHEorRcAyKDGDZaB27lX6JiUAOPpHakZWRFRvonM0e4PMNt4G44vO
	dfR8a2VElVq4arTI9m2rHkQ9dbNnqpAHSybQ58sX5ryEoDSA8FXmjo5dyX1EqjtbupnKcA
	bRXYdPfhmTmZbiCkN9Pg8AULDdXLaqw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v5 04/12] x86/alternative: support not-feature
Date: Mon,  8 Mar 2021 13:28:36 +0100
Message-Id: <20210308122844.30488-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308122844.30488-1-jgross@suse.com>
References: <20210308122844.30488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for alternative patching for the case a feature is not
present on the current cpu.

For this purpose add a flag byte to struct alt_instr adding the
information that the inverted feature should be used.

For users of ALTERNATIVE() and friends an inverted feature is specified
by negating it, e.g.:

ALTERNATIVE(old, new, ~feature)

This requires adapting the objtool information for struct alt_instr.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- split off from next patch
- reworked to use flag byte (Boris Petkov)
---
 arch/x86/include/asm/alternative-asm.h        | 6 ++++++
 arch/x86/include/asm/alternative.h            | 8 ++++++++
 arch/x86/include/asm/cpufeature.h             | 2 ++
 arch/x86/kernel/alternative.c                 | 5 +++--
 tools/objtool/arch/x86/include/arch/special.h | 6 +++---
 5 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/alternative-asm.h b/arch/x86/include/asm/alternative-asm.h
index 464034db299f..9a1763550217 100644
--- a/arch/x86/include/asm/alternative-asm.h
+++ b/arch/x86/include/asm/alternative-asm.h
@@ -39,7 +39,13 @@
 .macro altinstruction_entry orig alt feature orig_len alt_len pad_len
 	.long \orig - .
 	.long \alt - .
+	.iflt \feature
+	.word ~(\feature)
+	.byte 1
+	.else
 	.word \feature
+	.byte 0
+	.endif
 	.byte \orig_len
 	.byte \alt_len
 	.byte \pad_len
diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 5753fb2ac489..b9749cf21ada 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -59,6 +59,8 @@ struct alt_instr {
 	s32 instr_offset;	/* original instruction */
 	s32 repl_offset;	/* offset to replacement instruction */
 	u16 cpuid;		/* cpuid bit set for replacement */
+	u8  flag;		/* flag byte */
+#define ALTINSTR_FLAG_INV	0x01
 	u8  instrlen;		/* length of original instruction */
 	u8  replacementlen;	/* length of new instruction */
 	u8  padlen;		/* length of build-time padding */
@@ -145,7 +147,13 @@ static inline int alternatives_text_reserved(void *start, void *end)
 #define ALTINSTR_ENTRY(feature, num)					      \
 	" .long 661b - .\n"				/* label           */ \
 	" .long " b_replacement(num)"f - .\n"		/* new instruction */ \
+	" .iflt " __stringify(feature) "\n"		/* inverted?       */ \
+	" .word ~(" __stringify(feature) ")\n"		/* feature bit     */ \
+	" .byte " __stringify(ALTINSTR_FLAG_INV) "\n"	/* flag byte       */ \
+	" .else\n"							      \
 	" .word " __stringify(feature) "\n"		/* feature bit     */ \
+	" .byte 0\n"					/* flag byte       */ \
+	" .endif\n"							      \
 	" .byte " alt_total_slen "\n"			/* source len      */ \
 	" .byte " alt_rlen(num) "\n"			/* replacement len */ \
 	" .byte " alt_pad_len "\n"			/* pad len */
diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 1728d4ce5730..f060d3186ee4 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -184,6 +184,7 @@ static __always_inline bool _static_cpu_has(u16 bit)
 		 " .long 1b - .\n"		/* src offset */
 		 " .long 4f - .\n"		/* repl offset */
 		 " .word %P[always]\n"		/* always replace */
+		 " .byte 0\n"			/* flag byte */
 		 " .byte 3b - 1b\n"		/* src len */
 		 " .byte 5f - 4f\n"		/* repl len */
 		 " .byte 3b - 2b\n"		/* pad len */
@@ -196,6 +197,7 @@ static __always_inline bool _static_cpu_has(u16 bit)
 		 " .long 1b - .\n"		/* src offset */
 		 " .long 0\n"			/* no replacement */
 		 " .word %P[feature]\n"		/* feature bit */
+		 " .byte 0\n"			/* flag byte */
 		 " .byte 3b - 1b\n"		/* src len */
 		 " .byte 0\n"			/* repl len */
 		 " .byte 0\n"			/* pad len */
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 8d778e46725d..1296a90aa5b8 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -393,14 +393,15 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 		replacement = (u8 *)&a->repl_offset + a->repl_offset;
 		BUG_ON(a->instrlen > sizeof(insn_buff));
 		BUG_ON(a->cpuid >= (NCAPINTS + NBUGINTS) * 32);
-		if (!boot_cpu_has(a->cpuid)) {
+		if (!boot_cpu_has(a->cpuid) == !(a->flag & ALTINSTR_FLAG_INV)) {
 			if (a->padlen > 1)
 				optimize_nops(a, instr);
 
 			continue;
 		}
 
-		DPRINTK("feat: %d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d), pad: %d",
+		DPRINTK("feat: %s%d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d), pad: %d",
+			(a->flag & ALTINSTR_FLAG_INV) ? "~" : "",
 			a->cpuid >> 5,
 			a->cpuid & 0x1f,
 			instr, instr, a->instrlen,
diff --git a/tools/objtool/arch/x86/include/arch/special.h b/tools/objtool/arch/x86/include/arch/special.h
index d818b2bffa02..afde39063963 100644
--- a/tools/objtool/arch/x86/include/arch/special.h
+++ b/tools/objtool/arch/x86/include/arch/special.h
@@ -10,11 +10,11 @@
 #define JUMP_ORIG_OFFSET	0
 #define JUMP_NEW_OFFSET		4
 
-#define ALT_ENTRY_SIZE		13
+#define ALT_ENTRY_SIZE		14
 #define ALT_ORIG_OFFSET		0
 #define ALT_NEW_OFFSET		4
 #define ALT_FEATURE_OFFSET	8
-#define ALT_ORIG_LEN_OFFSET	10
-#define ALT_NEW_LEN_OFFSET	11
+#define ALT_ORIG_LEN_OFFSET	11
+#define ALT_NEW_LEN_OFFSET	12
 
 #endif /* _X86_ARCH_SPECIAL_H */
-- 
2.26.2


