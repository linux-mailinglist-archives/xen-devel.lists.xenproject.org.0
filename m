Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B162DCE63
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 10:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55792.97335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppe0-0007LC-EM; Thu, 17 Dec 2020 09:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55792.97335; Thu, 17 Dec 2020 09:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppe0-0007Jp-6n; Thu, 17 Dec 2020 09:32:20 +0000
Received: by outflank-mailman (input) for mailman id 55792;
 Thu, 17 Dec 2020 09:32:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kppdy-0006RQ-Uf
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 09:32:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35757d51-ae9f-4cd8-aa7a-80281bd7c06d;
 Thu, 17 Dec 2020 09:31:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61530B71F;
 Thu, 17 Dec 2020 09:31:49 +0000 (UTC)
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
X-Inumbo-ID: 35757d51-ae9f-4cd8-aa7a-80281bd7c06d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608197509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vphHwpXezua84krOfCT11+alhrY3VVaGyL69tPWeylA=;
	b=bUa7hVCyoXmHPiGDed/ghKsn7GGpxXtsDkS8xb01htJcWJnJ4lCDcjVj1847aJLcWSe7H1
	Bwe8lVvtktasRFWmyF5E/leiVb8mmTZB5gyKPxVD4ya64lWx1MHZlYlWCXXgCME2qCQtFH
	I6tNJH8Qfdxao0YTT2gcLliqw9LTFMs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 11/15] x86/paravirt: switch iret pvops to ALTERNATIVE
Date: Thu, 17 Dec 2020 10:31:29 +0100
Message-Id: <20201217093133.1507-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201217093133.1507-1-jgross@suse.com>
References: <20201217093133.1507-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The iret paravirt op is rather special as it is using a jmp instead
of a call instruction. Switch it to ALTERNATIVE.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- use ALTERNATIVE_TERNARY
---
 arch/x86/include/asm/paravirt.h       |  6 +++---
 arch/x86/include/asm/paravirt_types.h |  5 +----
 arch/x86/kernel/asm-offsets.c         |  5 -----
 arch/x86/kernel/paravirt.c            | 26 ++------------------------
 arch/x86/xen/enlighten_pv.c           |  3 +--
 5 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 1dd30c95505d..49a823abc0e1 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -720,9 +720,9 @@ extern void default_banner(void);
 #define PARA_INDIRECT(addr)	*addr(%rip)
 
 #define INTERRUPT_RETURN						\
-	PARA_SITE(PARA_PATCH(PV_CPU_iret),				\
-		  ANNOTATE_RETPOLINE_SAFE;				\
-		  jmp PARA_INDIRECT(pv_ops+PV_CPU_iret);)
+	ANNOTATE_RETPOLINE_SAFE;					\
+	ALTERNATIVE_TERNARY("jmp *paravirt_iret(%rip);",		\
+		X86_FEATURE_XENPV, "jmp xen_iret;", "jmp native_iret;")
 
 #ifdef CONFIG_DEBUG_ENTRY
 #define SAVE_FLAGS(clobbers)                                        \
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index a9efd4dad820..5d6de014d2f6 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -151,10 +151,6 @@ struct pv_cpu_ops {
 
 	u64 (*read_pmc)(int counter);
 
-	/* Normal iret.  Jump to this with the standard iret stack
-	   frame set up. */
-	void (*iret)(void);
-
 	void (*start_context_switch)(struct task_struct *prev);
 	void (*end_context_switch)(struct task_struct *next);
 #endif
@@ -294,6 +290,7 @@ struct paravirt_patch_template {
 
 extern struct pv_info pv_info;
 extern struct paravirt_patch_template pv_ops;
+extern void (*paravirt_iret)(void);
 
 #define PARAVIRT_PATCH(x)					\
 	(offsetof(struct paravirt_patch_template, x) / sizeof(void *))
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 736508004b30..ecd3fd6993d1 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -61,11 +61,6 @@ static void __used common(void)
 	OFFSET(IA32_RT_SIGFRAME_sigcontext, rt_sigframe_ia32, uc.uc_mcontext);
 #endif
 
-#ifdef CONFIG_PARAVIRT_XXL
-	BLANK();
-	OFFSET(PV_CPU_iret, paravirt_patch_template, cpu.iret);
-#endif
-
 #ifdef CONFIG_XEN
 	BLANK();
 	OFFSET(XEN_vcpu_info_mask, vcpu_info, evtchn_upcall_mask);
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 9f8aa18aa378..2ab547dd66c3 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -86,25 +86,6 @@ u64 notrace _paravirt_ident_64(u64 x)
 {
 	return x;
 }
-
-static unsigned paravirt_patch_jmp(void *insn_buff, const void *target,
-				   unsigned long addr, unsigned len)
-{
-	struct branch *b = insn_buff;
-	unsigned long delta = (unsigned long)target - (addr+5);
-
-	if (len < 5) {
-#ifdef CONFIG_RETPOLINE
-		WARN_ONCE(1, "Failing to patch indirect JMP in %ps\n", (void *)addr);
-#endif
-		return len;	/* call too long for patch site */
-	}
-
-	b->opcode = 0xe9;	/* jmp */
-	b->delta = delta;
-
-	return 5;
-}
 #endif
 
 DEFINE_STATIC_KEY_TRUE(virt_spin_lock_key);
@@ -136,9 +117,6 @@ unsigned paravirt_patch_default(u8 type, void *insn_buff,
 	else if (opfunc == _paravirt_ident_64)
 		ret = paravirt_patch_ident_64(insn_buff, len);
 
-	else if (type == PARAVIRT_PATCH(cpu.iret))
-		/* If operation requires a jmp, then jmp */
-		ret = paravirt_patch_jmp(insn_buff, opfunc, addr, len);
 #endif
 	else
 		/* Otherwise call the function. */
@@ -316,8 +294,6 @@ struct paravirt_patch_template pv_ops = {
 
 	.cpu.load_sp0		= native_load_sp0,
 
-	.cpu.iret		= native_iret,
-
 #ifdef CONFIG_X86_IOPL_IOPERM
 	.cpu.invalidate_io_bitmap	= native_tss_invalidate_io_bitmap,
 	.cpu.update_io_bitmap		= native_tss_update_io_bitmap,
@@ -422,6 +398,8 @@ struct paravirt_patch_template pv_ops = {
 NOKPROBE_SYMBOL(native_get_debugreg);
 NOKPROBE_SYMBOL(native_set_debugreg);
 NOKPROBE_SYMBOL(native_load_idt);
+
+void (*paravirt_iret)(void) = native_iret;
 #endif
 
 EXPORT_SYMBOL(pv_ops);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 32b295cc2716..4716383c64a9 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1057,8 +1057,6 @@ static const struct pv_cpu_ops xen_cpu_ops __initconst = {
 
 	.read_pmc = xen_read_pmc,
 
-	.iret = xen_iret,
-
 	.load_tr_desc = paravirt_nop,
 	.set_ldt = xen_set_ldt,
 	.load_gdt = xen_load_gdt,
@@ -1222,6 +1220,7 @@ asmlinkage __visible void __init xen_start_kernel(void)
 	pv_info = xen_info;
 	pv_ops.init.patch = paravirt_patch_default;
 	pv_ops.cpu = xen_cpu_ops;
+	paravirt_iret = xen_iret;
 	xen_init_irq_ops();
 
 	/*
-- 
2.26.2


