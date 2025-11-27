Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE2C8D051
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 08:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173451.1498505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOW94-0007v6-Cb; Thu, 27 Nov 2025 07:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173451.1498505; Thu, 27 Nov 2025 07:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOW94-0007sn-9Y; Thu, 27 Nov 2025 07:10:26 +0000
Received: by outflank-mailman (input) for mailman id 1173451;
 Thu, 27 Nov 2025 07:10:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEk/=6D=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vOW93-0004TZ-9Q
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 07:10:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24330961-cb60-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 08:10:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3AF035BCC5;
 Thu, 27 Nov 2025 07:10:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D29E13EA63;
 Thu, 27 Nov 2025 07:10:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EzUDMl75J2nvXQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 27 Nov 2025 07:10:22 +0000
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
X-Inumbo-ID: 24330961-cb60-11f0-980a-7dc792cee155
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 16/21] x86/xen: Drop xen_cpu_ops
Date: Thu, 27 Nov 2025 08:08:39 +0100
Message-ID: <20251127070844.21919-17-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127070844.21919-1-jgross@suse.com>
References: <20251127070844.21919-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)]
X-Rspamd-Queue-Id: 3AF035BCC5
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Instead of having a pre-filled array xen_cpu_ops for Xen PV paravirt
functions, drop the array and assign each element individually.

This is in preparation of reducing the paravirt include hell by
splitting paravirt.h into multiple more fine grained header files,
which will in turn require to split up the pv_ops vector as well.
Dropping the pre-filled array makes life easier for objtool to
detect missing initializers in multiple pv_ops_ arrays.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/xen/enlighten_pv.c | 82 +++++++++++++++----------------------
 tools/objtool/check.c       |  1 -
 2 files changed, 33 insertions(+), 50 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4806cc28d7ca..65df3a0d9cf3 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1212,54 +1212,6 @@ static const struct pv_info xen_info __initconst = {
 	.name = "Xen",
 };
 
-static const typeof(pv_ops) xen_cpu_ops __initconst = {
-	.cpu = {
-		.cpuid = xen_cpuid,
-
-		.set_debugreg = xen_set_debugreg,
-		.get_debugreg = xen_get_debugreg,
-
-		.read_cr0 = xen_read_cr0,
-		.write_cr0 = xen_write_cr0,
-
-		.write_cr4 = xen_write_cr4,
-
-		.read_msr = xen_read_msr,
-		.write_msr = xen_write_msr,
-
-		.read_msr_safe = xen_read_msr_safe,
-		.write_msr_safe = xen_write_msr_safe,
-
-		.read_pmc = xen_read_pmc,
-
-		.load_tr_desc = paravirt_nop,
-		.set_ldt = xen_set_ldt,
-		.load_gdt = xen_load_gdt,
-		.load_idt = xen_load_idt,
-		.load_tls = xen_load_tls,
-		.load_gs_index = xen_load_gs_index,
-
-		.alloc_ldt = xen_alloc_ldt,
-		.free_ldt = xen_free_ldt,
-
-		.store_tr = xen_store_tr,
-
-		.write_ldt_entry = xen_write_ldt_entry,
-		.write_gdt_entry = xen_write_gdt_entry,
-		.write_idt_entry = xen_write_idt_entry,
-		.load_sp0 = xen_load_sp0,
-
-#ifdef CONFIG_X86_IOPL_IOPERM
-		.invalidate_io_bitmap = xen_invalidate_io_bitmap,
-		.update_io_bitmap = xen_update_io_bitmap,
-#endif
-		.io_delay = xen_io_delay,
-
-		.start_context_switch = xen_start_context_switch,
-		.end_context_switch = xen_end_context_switch,
-	},
-};
-
 static void xen_restart(char *msg)
 {
 	xen_reboot(SHUTDOWN_reboot);
@@ -1411,7 +1363,39 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 
 	/* Install Xen paravirt ops */
 	pv_info = xen_info;
-	pv_ops.cpu = xen_cpu_ops.cpu;
+
+	pv_ops.cpu.cpuid = xen_cpuid;
+	pv_ops.cpu.set_debugreg = xen_set_debugreg;
+	pv_ops.cpu.get_debugreg = xen_get_debugreg;
+	pv_ops.cpu.read_cr0 = xen_read_cr0;
+	pv_ops.cpu.write_cr0 = xen_write_cr0;
+	pv_ops.cpu.write_cr4 = xen_write_cr4;
+	pv_ops.cpu.read_msr = xen_read_msr;
+	pv_ops.cpu.write_msr = xen_write_msr;
+	pv_ops.cpu.read_msr_safe = xen_read_msr_safe;
+	pv_ops.cpu.write_msr_safe = xen_write_msr_safe;
+	pv_ops.cpu.read_pmc = xen_read_pmc;
+	pv_ops.cpu.load_tr_desc = paravirt_nop;
+	pv_ops.cpu.set_ldt = xen_set_ldt;
+	pv_ops.cpu.load_gdt = xen_load_gdt;
+	pv_ops.cpu.load_idt = xen_load_idt;
+	pv_ops.cpu.load_tls = xen_load_tls;
+	pv_ops.cpu.load_gs_index = xen_load_gs_index;
+	pv_ops.cpu.alloc_ldt = xen_alloc_ldt;
+	pv_ops.cpu.free_ldt = xen_free_ldt;
+	pv_ops.cpu.store_tr = xen_store_tr;
+	pv_ops.cpu.write_ldt_entry = xen_write_ldt_entry;
+	pv_ops.cpu.write_gdt_entry = xen_write_gdt_entry;
+	pv_ops.cpu.write_idt_entry = xen_write_idt_entry;
+	pv_ops.cpu.load_sp0 = xen_load_sp0;
+#ifdef CONFIG_X86_IOPL_IOPERM
+	pv_ops.cpu.invalidate_io_bitmap = xen_invalidate_io_bitmap;
+	pv_ops.cpu.update_io_bitmap = xen_update_io_bitmap;
+#endif
+	pv_ops.cpu.io_delay = xen_io_delay;
+	pv_ops.cpu.start_context_switch = xen_start_context_switch;
+	pv_ops.cpu.end_context_switch = xen_end_context_switch;
+
 	xen_init_irq_ops();
 
 	/*
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 3fd551c080ee..5c00bca8dc11 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -593,7 +593,6 @@ static int init_pv_ops(struct objtool_file *file)
 {
 	static const char *pv_ops_tables[] = {
 		"pv_ops",
-		"xen_cpu_ops",
 		"xen_mmu_ops",
 		NULL,
 	};
-- 
2.51.0


