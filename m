Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D14E433756C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96576.182862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMDr-0003i3-Un; Thu, 11 Mar 2021 14:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96576.182862; Thu, 11 Mar 2021 14:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMDr-0003h4-NM; Thu, 11 Mar 2021 14:23:31 +0000
Received: by outflank-mailman (input) for mailman id 96576;
 Thu, 11 Mar 2021 14:23:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+5TX=IJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lKMDq-0003YP-0q
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:23:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b1e2756-5198-491c-adc8-52829afa8eb9;
 Thu, 11 Mar 2021 14:23:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77C2FAE15;
 Thu, 11 Mar 2021 14:23:24 +0000 (UTC)
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
X-Inumbo-ID: 9b1e2756-5198-491c-adc8-52829afa8eb9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615472604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S/Hw0vtaVCt5Q8AUk38dcwkbjEUX9MJeJ6rLGSeuHTY=;
	b=AIWlxQodTp3rSWpRjpyD2QKynNPXIqp8KJDeYNu/pIm6h4OSZ0twcrJuDUgD9CjM2FLcQJ
	U2cTTyE1+iKEcQwXKEoqXbFYTzra498/X7s1CDYkGRVb8Kn4ezHq2XBzYwURb2G7r3sm+S
	XPZPmF+zEnBBjCaewCm3iO0+UWzWjx0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v7 07/14] x86/alternative: don't open code ALTERNATIVE_TERNARY() in _static_cpu_has()
Date: Thu, 11 Mar 2021 15:23:12 +0100
Message-Id: <20210311142319.4723-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311142319.4723-1-jgross@suse.com>
References: <20210311142319.4723-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_static_cpu_has() contains a completely open coded version of
ALTERNATIVE_TERNARY(). Replace that with the macro instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V6:
- new patch
V7:
- moved patch earlier in series (Boris Petkov)
---
 arch/x86/include/asm/cpufeature.h | 41 +++++++------------------------
 1 file changed, 9 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 1728d4ce5730..16a51e7288d5 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -8,6 +8,7 @@
 
 #include <asm/asm.h>
 #include <linux/bitops.h>
+#include <asm/alternative.h>
 
 enum cpuid_leafs
 {
@@ -175,39 +176,15 @@ extern void clear_cpu_cap(struct cpuinfo_x86 *c, unsigned int bit);
  */
 static __always_inline bool _static_cpu_has(u16 bit)
 {
-	asm_volatile_goto("1: jmp 6f\n"
-		 "2:\n"
-		 ".skip -(((5f-4f) - (2b-1b)) > 0) * "
-			 "((5f-4f) - (2b-1b)),0x90\n"
-		 "3:\n"
-		 ".section .altinstructions,\"a\"\n"
-		 " .long 1b - .\n"		/* src offset */
-		 " .long 4f - .\n"		/* repl offset */
-		 " .word %P[always]\n"		/* always replace */
-		 " .byte 3b - 1b\n"		/* src len */
-		 " .byte 5f - 4f\n"		/* repl len */
-		 " .byte 3b - 2b\n"		/* pad len */
-		 ".previous\n"
-		 ".section .altinstr_replacement,\"ax\"\n"
-		 "4: jmp %l[t_no]\n"
-		 "5:\n"
-		 ".previous\n"
-		 ".section .altinstructions,\"a\"\n"
-		 " .long 1b - .\n"		/* src offset */
-		 " .long 0\n"			/* no replacement */
-		 " .word %P[feature]\n"		/* feature bit */
-		 " .byte 3b - 1b\n"		/* src len */
-		 " .byte 0\n"			/* repl len */
-		 " .byte 0\n"			/* pad len */
-		 ".previous\n"
-		 ".section .altinstr_aux,\"ax\"\n"
-		 "6:\n"
-		 " testb %[bitnum],%[cap_byte]\n"
-		 " jnz %l[t_yes]\n"
-		 " jmp %l[t_no]\n"
-		 ".previous\n"
+	asm_volatile_goto(
+		ALTERNATIVE_TERNARY("jmp 6f", %P[feature], "", "jmp %l[t_no]")
+		".section .altinstr_aux,\"ax\"\n"
+		"6:\n"
+		" testb %[bitnum],%[cap_byte]\n"
+		" jnz %l[t_yes]\n"
+		" jmp %l[t_no]\n"
+		".previous\n"
 		 : : [feature]  "i" (bit),
-		     [always]   "i" (X86_FEATURE_ALWAYS),
 		     [bitnum]   "i" (1 << (bit & 7)),
 		     [cap_byte] "m" (((const char *)boot_cpu_data.x86_capability)[bit >> 3])
 		 : : t_yes, t_no);
-- 
2.26.2


