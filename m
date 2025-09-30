Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C3BBABBCC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 09:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133744.1471811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3UQB-0000kD-0T; Tue, 30 Sep 2025 07:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133744.1471811; Tue, 30 Sep 2025 07:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3UQA-0000hF-TL; Tue, 30 Sep 2025 07:05:10 +0000
Received: by outflank-mailman (input) for mailman id 1133744;
 Tue, 30 Sep 2025 07:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v3UQ9-0008Ue-Np
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 07:05:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc1f23ff-9dcb-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 09:05:07 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D78EA1F898;
 Tue, 30 Sep 2025 07:05:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59B8813A3F;
 Tue, 30 Sep 2025 07:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1I8fFCCB22jcRwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 30 Sep 2025 07:05:04 +0000
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
X-Inumbo-ID: cc1f23ff-9dcb-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759215905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/gRu11gXgbmlZdLI3CmLMHqbiCSOdJDjKieoXm17Zs=;
	b=J4PQvC04B+PSPU5Qn0kbYDejEXysFawQCmfnFZpkuz+0XUVkV1HqUqBG3Il0Wo6kN6BnOg
	sajF6F2Ud8w6aYGOQkXNNJKhdJO1QQAPMKxREUCCe+yVhUdjy4ehAUGNrj9auqwNXf2E5c
	6TfBk+rIMkHcYuJlw6RXmLfymsIsER8=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=BlbtgpeX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759215904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/gRu11gXgbmlZdLI3CmLMHqbiCSOdJDjKieoXm17Zs=;
	b=BlbtgpeXbLF5152uqQWV0JAAKoFLaMKHAq6+2yypXHAlf+7CTkYb7c8skwiJxhzxfURFNY
	Mn+g8IuOXIJ+0XuhbydgFKILHbP8IRRGpTJsPFn/fTxM8Qdr4d+NYbJP6tntvKOL2tHQAT
	KCDiguuQTp2eUWCmNph/s5SLlhCYHVQ=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: xin@zytor.com,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 11/12] x86/paravirt: Don't use pv_ops vector for MSR access functions
Date: Tue, 30 Sep 2025 09:03:55 +0200
Message-ID: <20250930070356.30695-12-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930070356.30695-1-jgross@suse.com>
References: <20250930070356.30695-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D78EA1F898
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email]
X-Spam-Score: -3.01

Instead of using the pv_ops vector for RDMSR/WRMSR related functions,
use a more explicit approach allowing to inline the RDMSR/WRMSR
instructions directly when not running as a Xen PV guest.

By using cpu_feature_enabled(X86_FEATURE_XENPV) for the Xen PV case
the related calls to Xen specific code will be statically disabled via
runtime patching.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/include/asm/msr.h            | 57 ++++++++++++++++++++++-----
 arch/x86/include/asm/paravirt.h       | 45 ---------------------
 arch/x86/include/asm/paravirt_types.h | 13 ------
 arch/x86/kernel/paravirt.c            |  5 ---
 arch/x86/xen/enlighten_pv.c           | 20 ++++------
 arch/x86/xen/pmu.c                    |  1 +
 6 files changed, 57 insertions(+), 84 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index cc592611e333..d42cd2c19818 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -290,24 +290,22 @@ static __always_inline void native_wrmsr(u32 msr, u32 low, u32 high)
 	native_wrmsrq(msr, (u64)high << 32 | low);
 }
 
-static inline u64 native_read_msr(u32 msr)
+static __always_inline u64 native_read_msr(u32 msr)
 {
 	return native_rdmsrq(msr);
 }
 
-static inline int native_read_msr_safe(u32 msr, u64 *val)
+static __always_inline int native_read_msr_safe(u32 msr, u64 *val)
 {
 	return __rdmsr(msr, val, EX_TYPE_RDMSR_SAFE) ? -EIO : 0;
 }
 
-/* Can be uninlined because referenced by paravirt */
-static inline void notrace native_write_msr(u32 msr, u64 val)
+static __always_inline void native_write_msr(u32 msr, u64 val)
 {
 	native_wrmsrq(msr, val);
 }
 
-/* Can be uninlined because referenced by paravirt */
-static inline int notrace native_write_msr_safe(u32 msr, u64 val)
+static __always_inline int native_write_msr_safe(u32 msr, u64 val)
 {
 	return __wrmsrq(msr, val, EX_TYPE_WRMSR_SAFE) ? -EIO : 0;
 }
@@ -325,8 +323,49 @@ static inline u64 native_read_pmc(int counter)
 	return EAX_EDX_VAL(val, low, high);
 }
 
-#ifdef CONFIG_PARAVIRT_XXL
-#include <asm/paravirt.h>
+#ifdef CONFIG_XEN_PV
+#include <asm/xen/msr.h>
+
+static __always_inline u64 read_msr(u32 msr)
+{
+	if (cpu_feature_enabled(X86_FEATURE_XENPV))
+		return xen_read_msr(msr);
+
+	return native_rdmsrq(msr);
+}
+
+static __always_inline int read_msr_safe(u32 msr, u64 *p)
+{
+	if (cpu_feature_enabled(X86_FEATURE_XENPV))
+		return xen_read_msr_safe(msr, p);
+
+	return native_read_msr_safe(msr, p);
+}
+
+static __always_inline void write_msr(u32 msr, u64 val)
+{
+	if (cpu_feature_enabled(X86_FEATURE_XENPV))
+		xen_write_msr(msr, val);
+	else
+		native_wrmsrq(msr, val);
+}
+
+static __always_inline int write_msr_safe(u32 msr, u64 val)
+{
+	if (cpu_feature_enabled(X86_FEATURE_XENPV))
+		return xen_write_msr_safe(msr, val);
+
+	return native_write_msr_safe(msr, val);
+}
+
+static __always_inline u64 rdpmc(int counter)
+{
+	if (cpu_feature_enabled(X86_FEATURE_XENPV))
+		return xen_read_pmc(counter);
+
+	return native_read_pmc(counter);
+}
+
 #else
 static __always_inline u64 read_msr(u32 msr)
 {
@@ -353,7 +392,7 @@ static __always_inline u64 rdpmc(int counter)
 	return native_read_pmc(counter);
 }
 
-#endif	/* !CONFIG_PARAVIRT_XXL */
+#endif	/* !CONFIG_XEN_PV */
 
 /*
  * Access to machine-specific registers (available on 586 and better only)
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index dc297f62b935..45f47b7d9f56 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -175,51 +175,6 @@ static inline void __write_cr4(unsigned long x)
 	PVOP_VCALL1(cpu.write_cr4, x);
 }
 
-static inline u64 paravirt_read_msr(u32 msr)
-{
-	return PVOP_CALL1(u64, cpu.read_msr, msr);
-}
-
-static inline void paravirt_write_msr(u32 msr, u64 val)
-{
-	PVOP_VCALL2(cpu.write_msr, msr, val);
-}
-
-static inline int paravirt_read_msr_safe(u32 msr, u64 *val)
-{
-	return PVOP_CALL2(int, cpu.read_msr_safe, msr, val);
-}
-
-static inline int paravirt_write_msr_safe(u32 msr, u64 val)
-{
-	return PVOP_CALL2(int, cpu.write_msr_safe, msr, val);
-}
-
-static __always_inline u64 read_msr(u32 msr)
-{
-	return paravirt_read_msr(msr);
-}
-
-static __always_inline int read_msr_safe(u32 msr, u64 *p)
-{
-	return paravirt_read_msr_safe(msr, p);
-}
-
-static __always_inline void write_msr(u32 msr, u64 val)
-{
-	paravirt_write_msr(msr, val);
-}
-
-static __always_inline int write_msr_safe(u32 msr, u64 val)
-{
-	return paravirt_write_msr_safe(msr, val);
-}
-
-static __always_inline u64 rdpmc(int counter)
-{
-	return PVOP_CALL1(u64, cpu.read_pmc, counter);
-}
-
 static inline void paravirt_alloc_ldt(struct desc_struct *ldt, unsigned entries)
 {
 	PVOP_VCALL2(cpu.alloc_ldt, ldt, entries);
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 37a8627d8277..0d03e658ea8f 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -90,19 +90,6 @@ struct pv_cpu_ops {
 	void (*cpuid)(unsigned int *eax, unsigned int *ebx,
 		      unsigned int *ecx, unsigned int *edx);
 
-	/* Unsafe MSR operations.  These will warn or panic on failure. */
-	u64 (*read_msr)(u32 msr);
-	void (*write_msr)(u32 msr, u64 val);
-
-	/*
-	 * Safe MSR operations.
-	 * Returns 0 or -EIO.
-	 */
-	int (*read_msr_safe)(u32 msr, u64 *val);
-	int (*write_msr_safe)(u32 msr, u64 val);
-
-	u64 (*read_pmc)(int counter);
-
 	void (*start_context_switch)(struct task_struct *prev);
 	void (*end_context_switch)(struct task_struct *next);
 #endif
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ab3e172dcc69..240eeb1beab5 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -129,11 +129,6 @@ struct paravirt_patch_template pv_ops = {
 	.cpu.read_cr0		= native_read_cr0,
 	.cpu.write_cr0		= native_write_cr0,
 	.cpu.write_cr4		= native_write_cr4,
-	.cpu.read_msr		= native_read_msr,
-	.cpu.write_msr		= native_write_msr,
-	.cpu.read_msr_safe	= native_read_msr_safe,
-	.cpu.write_msr_safe	= native_write_msr_safe,
-	.cpu.read_pmc		= native_read_pmc,
 	.cpu.load_tr_desc	= native_load_tr_desc,
 	.cpu.set_ldt		= native_set_ldt,
 	.cpu.load_gdt		= native_load_gdt,
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 26bbaf4b7330..df653099c567 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1160,15 +1160,16 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 	}
 }
 
-static int xen_read_msr_safe(u32 msr, u64 *val)
+int xen_read_msr_safe(u32 msr, u64 *val)
 {
 	int err = 0;
 
 	*val = xen_do_read_msr(msr, &err);
 	return err;
 }
+EXPORT_SYMBOL(xen_read_msr_safe);
 
-static int xen_write_msr_safe(u32 msr, u64 val)
+int xen_write_msr_safe(u32 msr, u64 val)
 {
 	int err = 0;
 
@@ -1176,20 +1177,23 @@ static int xen_write_msr_safe(u32 msr, u64 val)
 
 	return err;
 }
+EXPORT_SYMBOL(xen_write_msr_safe);
 
-static u64 xen_read_msr(u32 msr)
+u64 xen_read_msr(u32 msr)
 {
 	int err = 0;
 
 	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
 }
+EXPORT_SYMBOL(xen_read_msr);
 
-static void xen_write_msr(u32 msr, u64 val)
+void xen_write_msr(u32 msr, u64 val)
 {
 	int err;
 
 	xen_do_write_msr(msr, val, xen_msr_safe ? &err : NULL);
 }
+EXPORT_SYMBOL(xen_write_msr);
 
 /* This is called once we have the cpu_possible_mask */
 void __init xen_setup_vcpu_info_placement(void)
@@ -1225,14 +1229,6 @@ static const typeof(pv_ops) xen_cpu_ops __initconst = {
 
 		.write_cr4 = xen_write_cr4,
 
-		.read_msr = xen_read_msr,
-		.write_msr = xen_write_msr,
-
-		.read_msr_safe = xen_read_msr_safe,
-		.write_msr_safe = xen_write_msr_safe,
-
-		.read_pmc = xen_read_pmc,
-
 		.load_tr_desc = paravirt_nop,
 		.set_ldt = xen_set_ldt,
 		.load_gdt = xen_load_gdt,
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index d49a3bdc448b..d0dea950cd4f 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -370,6 +370,7 @@ u64 xen_read_pmc(int counter)
 	else
 		return xen_intel_read_pmc(counter);
 }
+EXPORT_SYMBOL(xen_read_pmc);
 
 int pmu_apic_update(uint32_t val)
 {
-- 
2.51.0


