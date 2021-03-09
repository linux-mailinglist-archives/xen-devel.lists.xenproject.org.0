Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F42332787
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 14:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95414.180100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcim-00040m-Cv; Tue, 09 Mar 2021 13:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95414.180100; Tue, 09 Mar 2021 13:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcim-00040B-89; Tue, 09 Mar 2021 13:48:24 +0000
Received: by outflank-mailman (input) for mailman id 95414;
 Tue, 09 Mar 2021 13:48:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jEQk=IH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJcik-0003zp-Fn
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 13:48:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a1860f4-6cbd-4df3-b717-955e83e439e5;
 Tue, 09 Mar 2021 13:48:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 403ECAD72;
 Tue,  9 Mar 2021 13:48:20 +0000 (UTC)
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
X-Inumbo-ID: 2a1860f4-6cbd-4df3-b717-955e83e439e5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615297700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahQRIjhdqXiMH7Gh0LbxfuU+coM2Xg7I375ydZ/1bFA=;
	b=GBMKwRz6DKjYuW/RxjuLrnbjyTUV/PQ2WKh98Pjh9rrIrjyiW1pF+Wgagq+0nKWLV7SuO6
	lu9xKibwmx5qj6ngBrEliMhnJA8Q2guu+e90vxKo523+I6F7J1s6WfUfLOPpxT4DdXK3BG
	OWEdwNxuKk3uNRro96+ZuX/fqMPmKzM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 04/12] x86/alternative: support not-feature
Date: Tue,  9 Mar 2021 14:48:05 +0100
Message-Id: <20210309134813.23912-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309134813.23912-1-jgross@suse.com>
References: <20210309134813.23912-1-jgross@suse.com>
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
---
 arch/x86/include/asm/alternative-asm.h |  3 +++
 arch/x86/include/asm/alternative.h     |  3 +++
 arch/x86/kernel/alternative.c          | 19 ++++++++++++++-----
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/alternative-asm.h b/arch/x86/include/asm/alternative-asm.h
index 464034db299f..3965daf0460e 100644
--- a/arch/x86/include/asm/alternative-asm.h
+++ b/arch/x86/include/asm/alternative-asm.h
@@ -6,6 +6,9 @@
 
 #include <asm/asm.h>
 
+#define ALTINSTR_FLAG_INV	(1 << 15)
+#define ALT_NOT(feat)		((feat) | ALTINSTR_FLAG_INV)
+
 #ifdef CONFIG_SMP
 	.macro LOCK_PREFIX
 672:	lock
diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 5753fb2ac489..89889618ae01 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -59,11 +59,14 @@ struct alt_instr {
 	s32 instr_offset;	/* original instruction */
 	s32 repl_offset;	/* offset to replacement instruction */
 	u16 cpuid;		/* cpuid bit set for replacement */
+#define ALTINSTR_FLAG_INV (1 << 15)
 	u8  instrlen;		/* length of original instruction */
 	u8  replacementlen;	/* length of new instruction */
 	u8  padlen;		/* length of build-time padding */
 } __packed;
 
+#define ALT_NOT(feat)	((feat) | ALTINSTR_FLAG_INV)
+
 /*
  * Debug flag that can be tested to see whether alternative
  * instructions were patched in already:
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 8d778e46725d..d8e669a1546f 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -388,21 +388,30 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
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
+		 * Drop out if either:
+		 * - feature not available, but required, or
+		 * - feature available, but NOT required
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


