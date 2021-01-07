Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B192ED73D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 20:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63080.111976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxae3-0001nR-On; Thu, 07 Jan 2021 19:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63080.111976; Thu, 07 Jan 2021 19:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxae3-0001n2-Ls; Thu, 07 Jan 2021 19:08:27 +0000
Received: by outflank-mailman (input) for mailman id 63080;
 Thu, 07 Jan 2021 19:08:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t0oO=GK=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1kxae1-0001mx-Hk
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 19:08:26 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2d62946-5a90-4a96-ab96-19dc9a7f43ba;
 Thu, 07 Jan 2021 19:08:22 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0e34005e2f215eecf886db.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:3400:5e2f:215e:ecf8:86db])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7AAC11EC050F;
 Thu,  7 Jan 2021 20:08:20 +0100 (CET)
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
X-Inumbo-ID: b2d62946-5a90-4a96-ab96-19dc9a7f43ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1610046500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=6cwuYFjoWQh7xmJwCqv3CgUnkbMPBYdgvYWzEx8gX2c=;
	b=Vqa1M56mL1rBFbPywsBlI85YsN5Moft5ShL31cNQ9IpiOS2HDpmyqdF1mZCIe+Qx00zB7R
	fS2KK7tRP6yBwUIgj+f/h3igNzPXwEW4Oo6YHzPFUde6I67UbB8EZFPewMOa0ysAbpylrD
	c50AKkloFp3zzdyCWhqu2o5bONGltvE=
Date: Thu, 7 Jan 2021 20:08:19 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 07/15] x86/alternative: support "not feature" and
 ALTERNATIVE_TERNARY
Message-ID: <20210107190819.GI14697@zn.tnic>
References: <20201217093133.1507-1-jgross@suse.com>
 <20201217093133.1507-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201217093133.1507-8-jgross@suse.com>

On Thu, Dec 17, 2020 at 10:31:25AM +0100, Juergen Gross wrote:
> Instead of only supporting to modify instructions when a specific
> feature is set, support doing so for the case a feature is not set.
> 
> As today a feature is specified using a 16 bit quantity and the highest
> feature number in use is around 600, using a negated feature number for
> specifying the inverted case seems to be appropriate.
> 
>   ALTERNATIVE "default_instr", "patched_instr", ~FEATURE_NR
> 
> will start with "default_instr" and patch that with "patched_instr" in
> case FEATURE_NR is not set.
> 
> Using that add ALTERNATIVE_TERNARY:
> 
>   ALTERNATIVE_TERNARY "default_instr", FEATURE_NR,
>                       "feature_on_instr", "feature_off_instr"
> 
> which will start with "default_instr" and at patch time will, depending
> on FEATURE_NR being set or not, patch that with either
> "feature_on_instr" or "feature_off_instr".

How about an even simpler one (only build-tested):

---
diff --git a/arch/x86/include/asm/alternative-asm.h b/arch/x86/include/asm/alternative-asm.h
index 464034db299f..d52b423d3cab 100644
--- a/arch/x86/include/asm/alternative-asm.h
+++ b/arch/x86/include/asm/alternative-asm.h
@@ -109,6 +109,9 @@
 	.popsection
 .endm
 
+#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	\
+	ALTERNATIVE_2 oldinstr, newinstr1, feature, newinstr2, X86_FEATURE_TERNARY
+
 #endif  /*  __ASSEMBLY__  */
 
 #endif /* _ASM_X86_ALTERNATIVE_ASM_H */
diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 13adca37c99a..f170cbe89539 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -175,6 +175,9 @@ static inline int alternatives_text_reserved(void *start, void *end)
 	ALTINSTR_REPLACEMENT(newinstr2, feature2, 2)			\
 	".popsection\n"
 
+#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	\
+	ALTERNATIVE_2(oldinstr, newinstr1, feature, newinstr2, X86_FEATURE_TERNARY)
+
 #define ALTERNATIVE_3(oldinsn, newinsn1, feat1, newinsn2, feat2, newinsn3, feat3) \
 	OLDINSTR_3(oldinsn, 1, 2, 3)						\
 	".pushsection .altinstructions,\"a\"\n"					\
@@ -206,6 +209,9 @@ static inline int alternatives_text_reserved(void *start, void *end)
 #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
 	asm_inline volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1, newinstr2, feature2) ::: "memory")
 
+#define alternative_ternary(oldinstr, feature, newinstr1, newinstr2)	\
+	asm_inline volatile(ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2) ::: "memory")
+
 /*
  * Alternative inline assembly with input.
  *
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 84b887825f12..cc634db0b91f 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -108,7 +108,7 @@
 #define X86_FEATURE_EXTD_APICID		( 3*32+26) /* Extended APICID (8 bits) */
 #define X86_FEATURE_AMD_DCM		( 3*32+27) /* AMD multi-node processor */
 #define X86_FEATURE_APERFMPERF		( 3*32+28) /* P-State hardware coordination feedback capability (APERF/MPERF MSRs) */
-/* free					( 3*32+29) */
+#define X86_FEATURE_TERNARY		( 3*32+29) /* "" Synthetic bit for ALTERNATIVE_TERNARY() */
 #define X86_FEATURE_NONSTOP_TSC_S3	( 3*32+30) /* TSC doesn't stop in S3 state */
 #define X86_FEATURE_TSC_KNOWN_FREQ	( 3*32+31) /* TSC has known frequency */
 
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 8d778e46725d..2cb29d4d8dd9 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -393,7 +393,7 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 		replacement = (u8 *)&a->repl_offset + a->repl_offset;
 		BUG_ON(a->instrlen > sizeof(insn_buff));
 		BUG_ON(a->cpuid >= (NCAPINTS + NBUGINTS) * 32);
-		if (!boot_cpu_has(a->cpuid)) {
+		if (!boot_cpu_has(a->cpuid) && (a->cpuid != X86_FEATURE_TERNARY)) {
 			if (a->padlen > 1)
 				optimize_nops(a, instr);
 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

