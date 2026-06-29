Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5XMzH0wXQmoo0AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 08:57:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6AD6D6A09
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 08:57:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1347188.1605063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we5vY-0005tx-07; Mon, 29 Jun 2026 06:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347188.1605063; Mon, 29 Jun 2026 06:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we5vX-0005rv-TJ; Mon, 29 Jun 2026 06:57:07 +0000
Received: by outflank-mailman (input) for mailman id 1347188;
 Mon, 29 Jun 2026 06:57:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1we5vW-0005qY-2X
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 06:57:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we5vV-00BYi9-Fb
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 08:57:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a421737-5cb7-0a2a0a5109dd-0a2a450bd058-32
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:57:05 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a42173d-ac48-0a2a450b0019-c387df82ae6c-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:57:02 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E042271266;
 Mon, 29 Jun 2026 06:57:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F47E779A8;
 Mon, 29 Jun 2026 06:57:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ktawGT0XQmp3QgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 29 Jun 2026 06:57:01 +0000
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
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 13/18] x86/paravirt: Split off MSR related hooks into new header
Date: Mon, 29 Jun 2026 08:55:39 +0200
Message-ID: <20260629065544.3643253-14-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629065544.3643253-1-jgross@suse.com>
References: <20260629065544.3643253-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-purgate-ID: tlsNG-42698a/1782716222-4054C220-1AC45F42/0/0
X-purgate-type: clean
X-purgate-size: 8115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:virtualization@lists.linux.dev,m:jgross@suse.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:jpoimboe@kernel.org,m:peterz@infradead.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA6AD6D6A09

Move the WRMSR, RDMSR and RDPMC related parts of paravirt.h and
paravirt_types.h into a new header file paravirt-msr.h.

Switch all moved helper functions to __always_inline.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- always use __always_inline
---
 arch/x86/include/asm/msr.h            |  2 +-
 arch/x86/include/asm/paravirt-msr.h   | 56 +++++++++++++++++++++++++++
 arch/x86/include/asm/paravirt.h       | 55 --------------------------
 arch/x86/include/asm/paravirt_types.h | 13 -------
 arch/x86/kernel/paravirt.c            | 14 ++++---
 arch/x86/xen/enlighten_pv.c           | 11 +++---
 tools/objtool/check.c                 |  1 +
 7 files changed, 73 insertions(+), 79 deletions(-)
 create mode 100644 arch/x86/include/asm/paravirt-msr.h

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 6a8af80305d1..b13b4a93673e 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -323,7 +323,7 @@ static inline u64 native_read_pmc(int counter)
 }
 
 #ifdef CONFIG_PARAVIRT_XXL
-#include <asm/paravirt.h>
+#include <asm/paravirt-msr.h>
 #else
 static __always_inline u64 read_msr(u32 msr)
 {
diff --git a/arch/x86/include/asm/paravirt-msr.h b/arch/x86/include/asm/paravirt-msr.h
new file mode 100644
index 000000000000..3e31648316a8
--- /dev/null
+++ b/arch/x86/include/asm/paravirt-msr.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_X86_PARAVIRT_MSR_H
+#define _ASM_X86_PARAVIRT_MSR_H
+
+#include <asm/paravirt_types.h>
+
+struct pv_msr_ops {
+	/* Unsafe MSR operations.  These will warn or panic on failure. */
+	u64 (*read_msr)(u32 msr);
+	void (*write_msr)(u32 msr, u64 val);
+
+	/* Safe MSR operations.  Returns 0 or -EIO. */
+	int (*read_msr_safe)(u32 msr, u64 *val);
+	int (*write_msr_safe)(u32 msr, u64 val);
+
+	u64 (*read_pmc)(int counter);
+} __no_randomize_layout;
+
+extern struct pv_msr_ops pv_ops_msr;
+
+static __always_inline u64 read_msr(u32 msr)
+{
+	return PVOP_CALL1(u64, pv_ops_msr, read_msr, msr);
+}
+
+static __always_inline void write_msr(u32 msr, u64 val)
+{
+	PVOP_VCALL2(pv_ops_msr, write_msr, msr, val);
+}
+
+static __always_inline void write_msrns(u32 msr, u64 val)
+{
+	PVOP_VCALL2(pv_ops_msr, write_msr, msr, val);
+}
+
+static __always_inline int read_msr_safe(u32 msr, u64 *val)
+{
+	return PVOP_CALL2(int, pv_ops_msr, read_msr_safe, msr, val);
+}
+
+static __always_inline int write_msr_safe(u32 msr, u64 val)
+{
+	return PVOP_CALL2(int, pv_ops_msr, write_msr_safe, msr, val);
+}
+
+static __always_inline int write_msrns_safe(u32 msr, u64 val)
+{
+	return PVOP_CALL2(int, pv_ops_msr, write_msr_safe, msr, val);
+}
+
+static __always_inline u64 rdpmc(int counter)
+{
+	return PVOP_CALL1(u64, pv_ops_msr, read_pmc, counter);
+}
+
+#endif /* _ASM_X86_PARAVIRT_MSR_H */
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b0c740316cf7..eb16d55f94d3 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -130,61 +130,6 @@ static inline void __write_cr4(unsigned long x)
 	PVOP_VCALL1(pv_ops, cpu.write_cr4, x);
 }
 
-static inline u64 paravirt_read_msr(u32 msr)
-{
-	return PVOP_CALL1(u64, pv_ops, cpu.read_msr, msr);
-}
-
-static inline void paravirt_write_msr(u32 msr, u64 val)
-{
-	PVOP_VCALL2(pv_ops, cpu.write_msr, msr, val);
-}
-
-static inline int paravirt_read_msr_safe(u32 msr, u64 *val)
-{
-	return PVOP_CALL2(int, pv_ops, cpu.read_msr_safe, msr, val);
-}
-
-static inline int paravirt_write_msr_safe(u32 msr, u64 val)
-{
-	return PVOP_CALL2(int, pv_ops, cpu.write_msr_safe, msr, val);
-}
-
-static __always_inline u64 read_msr(u32 msr)
-{
-	return paravirt_read_msr(msr);
-}
-
-static inline void write_msr(u32 msr, u64 val)
-{
-	paravirt_write_msr(msr, val);
-}
-
-static __always_inline void write_msrns(u32 msr, u64 val)
-{
-	paravirt_write_msr(msr, val);
-}
-
-static inline int write_msr_safe(u32 msr, u64 val)
-{
-	return paravirt_write_msr_safe(msr, val);
-}
-
-static __always_inline int write_msrns_safe(u32 msr, u64 val)
-{
-	return paravirt_write_msr_safe(msr, val);
-}
-
-static __always_inline int read_msr_safe(u32 msr, u64 *p)
-{
-	return paravirt_read_msr_safe(msr, p);
-}
-
-static __always_inline u64 rdpmc(int counter)
-{
-	return PVOP_CALL1(u64, pv_ops, cpu.read_pmc, counter);
-}
-
 static inline void paravirt_alloc_ldt(struct desc_struct *ldt, unsigned entries)
 {
 	PVOP_VCALL2(pv_ops, cpu.alloc_ldt, ldt, entries);
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index b4c4a23e77a1..2459163fa196 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -58,19 +58,6 @@ struct pv_cpu_ops {
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
index 00b59d774389..739dbfd8aadf 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -110,11 +110,6 @@ struct paravirt_patch_template pv_ops = {
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
@@ -212,6 +207,15 @@ struct paravirt_patch_template pv_ops = {
 };
 
 #ifdef CONFIG_PARAVIRT_XXL
+struct pv_msr_ops pv_ops_msr = {
+	.read_msr	= native_read_msr,
+	.write_msr	= native_write_msr,
+	.read_msr_safe	= native_read_msr_safe,
+	.write_msr_safe	= native_write_msr_safe,
+	.read_pmc	= native_read_pmc,
+};
+EXPORT_SYMBOL(pv_ops_msr);
+
 NOKPROBE_SYMBOL(native_load_idt);
 #endif
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c64b388f616..bf81e84ff261 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1360,11 +1360,6 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 	pv_ops.cpu.read_cr0 = xen_read_cr0;
 	pv_ops.cpu.write_cr0 = xen_write_cr0;
 	pv_ops.cpu.write_cr4 = xen_write_cr4;
-	pv_ops.cpu.read_msr = xen_read_msr;
-	pv_ops.cpu.write_msr = xen_write_msr;
-	pv_ops.cpu.read_msr_safe = xen_read_msr_safe;
-	pv_ops.cpu.write_msr_safe = xen_write_msr_safe;
-	pv_ops.cpu.read_pmc = xen_read_pmc;
 	pv_ops.cpu.load_tr_desc = paravirt_nop;
 	pv_ops.cpu.set_ldt = xen_set_ldt;
 	pv_ops.cpu.load_gdt = xen_load_gdt;
@@ -1385,6 +1380,12 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 	pv_ops.cpu.start_context_switch = xen_start_context_switch;
 	pv_ops.cpu.end_context_switch = xen_end_context_switch;
 
+	pv_ops_msr.read_msr = xen_read_msr;
+	pv_ops_msr.write_msr = xen_write_msr;
+	pv_ops_msr.read_msr_safe = xen_read_msr_safe;
+	pv_ops_msr.write_msr_safe = xen_write_msr_safe;
+	pv_ops_msr.read_pmc = xen_read_pmc;
+
 	xen_init_irq_ops();
 
 	/*
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 10b18cf9c360..2c91fcff77f4 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -525,6 +525,7 @@ static struct {
 } pv_ops_tables[] = {
 	{ .name = "pv_ops", },
 	{ .name = "pv_ops_lock", },
+	{ .name = "pv_ops_msr", },
 	{ .name = NULL, .idx_off = -1 }
 };
 
-- 
2.54.0


