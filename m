Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD48337566
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96574.182838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMDn-0003bF-8O; Thu, 11 Mar 2021 14:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96574.182838; Thu, 11 Mar 2021 14:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMDm-0003a2-Up; Thu, 11 Mar 2021 14:23:26 +0000
Received: by outflank-mailman (input) for mailman id 96574;
 Thu, 11 Mar 2021 14:23:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+5TX=IJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lKMDl-0003YP-FS
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:23:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5bc6b17-7e05-4e8c-962b-b42beaf96281;
 Thu, 11 Mar 2021 14:23:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3D90AD74;
 Thu, 11 Mar 2021 14:23:23 +0000 (UTC)
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
X-Inumbo-ID: a5bc6b17-7e05-4e8c-962b-b42beaf96281
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615472604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qh1g08GhFm6ePTkeeFW/Xy4vYX6kKi58igyTMiHJm8U=;
	b=WfQsdvmtX5iJzk4B1I5YaGG3Gs9euDnfi9U+jiaEOfoTQuIrA29bkaQ58hpLJAtP6YrNJd
	bvqAftjelQYv2S8BiBeoS4GAB4iWy+Z/dDgftaAibgQsbuhZ1c5Vo69JErGX4e05UqA+bJ
	e5igTzFMS+NDNRRCpaVu9taTTRtTx28=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v7 05/14] x86/alternative: support not-feature
Date: Thu, 11 Mar 2021 15:23:10 +0100
Message-Id: <20210311142319.4723-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311142319.4723-1-jgross@suse.com>
References: <20210311142319.4723-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for alternative patching for the case a feature is not
present on the current cpu.

For users of ALTERNATIVE() and friends an inverted feature is specified
by applying the ALT_NOT() macro to it, e.g.:

ALTERNATIVE(old, new, ALT_NOT(feature))

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- split off from next patch
- reworked to use flag byte (Boris Petkov)
V6:
- rework again to not use flag byte (Boris Petkov)
V7:
- minor tweaks: move defines up, comment wording (Boris Petkov)
---
 arch/x86/include/asm/alternative.h |  3 +++
 arch/x86/kernel/alternative.c      | 20 +++++++++++++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 53f295f41c34..649e56f70889 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -6,6 +6,9 @@
 #include <linux/stringify.h>
 #include <asm/asm.h>
 
+#define ALTINSTR_FLAG_INV	(1 << 15)
+#define ALT_NOT(feat)		((feat) | ALTINSTR_FLAG_INV)
+
 #ifndef __ASSEMBLY__
 
 #include <linux/stddef.h>
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 8d778e46725d..133b549dc091 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -388,21 +388,31 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 	 */
 	for (a = start; a < end; a++) {
 		int insn_buff_sz = 0;
+		/* Mask away "NOT" flag bit for feature to test. */
+		u16 feature = a->cpuid & ~ALTINSTR_FLAG_INV;
 
 		instr = (u8 *)&a->instr_offset + a->instr_offset;
 		replacement = (u8 *)&a->repl_offset + a->repl_offset;
 		BUG_ON(a->instrlen > sizeof(insn_buff));
-		BUG_ON(a->cpuid >= (NCAPINTS + NBUGINTS) * 32);
-		if (!boot_cpu_has(a->cpuid)) {
+		BUG_ON(feature >= (NCAPINTS + NBUGINTS) * 32);
+
+		/*
+		 * Patch if either:
+		 * - feature is present
+		 * - feature not present but ALTINSTR_FLAG_INV is set to mean,
+		 *   patch if feature is *NOT* present.
+		 */
+		if (!boot_cpu_has(feature) == !(a->cpuid & ALTINSTR_FLAG_INV)) {
 			if (a->padlen > 1)
 				optimize_nops(a, instr);
 
 			continue;
 		}
 
-		DPRINTK("feat: %d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d), pad: %d",
-			a->cpuid >> 5,
-			a->cpuid & 0x1f,
+		DPRINTK("feat: %s%d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d), pad: %d",
+			(a->cpuid & ALTINSTR_FLAG_INV) ? "!" : "",
+			feature >> 5,
+			feature & 0x1f,
 			instr, instr, a->instrlen,
 			replacement, a->replacementlen, a->padlen);
 
-- 
2.26.2


