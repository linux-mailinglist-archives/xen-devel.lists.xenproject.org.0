Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C67C9E13CF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 08:16:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847268.1262381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIN8Y-0006uB-Lo; Tue, 03 Dec 2024 07:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847268.1262381; Tue, 03 Dec 2024 07:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIN8Y-0006rI-IZ; Tue, 03 Dec 2024 07:15:58 +0000
Received: by outflank-mailman (input) for mailman id 847268;
 Tue, 03 Dec 2024 07:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pQ6z=S4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tIN8X-0006rC-Es
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 07:15:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6feb9826-b146-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 08:15:55 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ED95D2116D;
 Tue,  3 Dec 2024 07:15:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E6A8139C2;
 Tue,  3 Dec 2024 07:15:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id abvvGCqwTmeVJwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 03 Dec 2024 07:15:54 +0000
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
X-Inumbo-ID: 6feb9826-b146-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1733210155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YteXmpzJovraoUH7Bk6Fvs0Z1YQksr+1l5QkNJPajMU=;
	b=S/nw+k6yAnLTqZGvI+KqLMq9SD/ydjeYjWSkKssGFQ5/wmKWcKZAc0hdpWkm5il70c5Wtr
	oMTbYJC1dGwwa+hXGAppeD1nq5eMoWerYwtTzeInPPkovaKmiQia53Rj0Tl0ks8dbR5ABl
	8Hrg+j0bW5/3hcrY8zfcspXZzGbEhp0=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="S/nw+k6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1733210155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YteXmpzJovraoUH7Bk6Fvs0Z1YQksr+1l5QkNJPajMU=;
	b=S/nw+k6yAnLTqZGvI+KqLMq9SD/ydjeYjWSkKssGFQ5/wmKWcKZAc0hdpWkm5il70c5Wtr
	oMTbYJC1dGwwa+hXGAppeD1nq5eMoWerYwtTzeInPPkovaKmiQia53Rj0Tl0ks8dbR5ABl
	8Hrg+j0bW5/3hcrY8zfcspXZzGbEhp0=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/paravirt: remove the wbinvd hook
Date: Tue,  3 Dec 2024 08:15:50 +0100
Message-ID: <20241203071550.26487-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ED95D2116D
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The wbinvd paravirt hook is a leftover of lguest times. Today it is
no longer needed, as all users use the native wbinvd implementation.

Remove the hook and rename native_wbinvd() to wbinvd().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt.h           | 7 -------
 arch/x86/include/asm/paravirt_types.h     | 2 --
 arch/x86/include/asm/special_insns.h      | 8 +-------
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 2 +-
 arch/x86/kernel/paravirt.c                | 6 ------
 arch/x86/kernel/process.c                 | 4 ++--
 arch/x86/xen/enlighten_pv.c               | 2 --
 7 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index d4eb9e1d61b8..041aff51eb50 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -180,13 +180,6 @@ static inline void halt(void)
 	PVOP_VCALL0(irq.halt);
 }
 
-extern noinstr void pv_native_wbinvd(void);
-
-static __always_inline void wbinvd(void)
-{
-	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT_XEN);
-}
-
 static inline u64 paravirt_read_msr(unsigned msr)
 {
 	return PVOP_CALL1(u64, cpu.read_msr, msr);
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 8d4fbe1be489..fea56b04f436 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -86,8 +86,6 @@ struct pv_cpu_ops {
 	void (*update_io_bitmap)(void);
 #endif
 
-	void (*wbinvd)(void);
-
 	/* cpuid emulation, mostly so that caps bits can be disabled */
 	void (*cpuid)(unsigned int *eax, unsigned int *ebx,
 		      unsigned int *ecx, unsigned int *edx);
diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
index aec6e2d3aa1d..fab7c8af27a4 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -115,7 +115,7 @@ static inline void wrpkru(u32 pkru)
 }
 #endif
 
-static __always_inline void native_wbinvd(void)
+static __always_inline void wbinvd(void)
 {
 	asm volatile("wbinvd": : :"memory");
 }
@@ -167,12 +167,6 @@ static inline void __write_cr4(unsigned long x)
 {
 	native_write_cr4(x);
 }
-
-static __always_inline void wbinvd(void)
-{
-	native_wbinvd();
-}
-
 #endif /* CONFIG_PARAVIRT_XXL */
 
 static __always_inline void clflush(volatile void *__p)
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 972e6b6b0481..b72f7e91387e 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -459,7 +459,7 @@ static int pseudo_lock_fn(void *_rdtgrp)
 	 * increase likelihood that allocated cache portion will be filled
 	 * with associated memory.
 	 */
-	native_wbinvd();
+	wbinvd();
 
 	/*
 	 * Always called with interrupts enabled. By disabling interrupts
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index fec381533555..927e33e6843a 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -116,11 +116,6 @@ static noinstr void pv_native_set_debugreg(int regno, unsigned long val)
 	native_set_debugreg(regno, val);
 }
 
-noinstr void pv_native_wbinvd(void)
-{
-	native_wbinvd();
-}
-
 static noinstr void pv_native_safe_halt(void)
 {
 	native_safe_halt();
@@ -148,7 +143,6 @@ struct paravirt_patch_template pv_ops = {
 	.cpu.read_cr0		= native_read_cr0,
 	.cpu.write_cr0		= native_write_cr0,
 	.cpu.write_cr4		= native_write_cr4,
-	.cpu.wbinvd		= pv_native_wbinvd,
 	.cpu.read_msr		= native_read_msr,
 	.cpu.write_msr		= native_write_msr,
 	.cpu.read_msr_safe	= native_read_msr_safe,
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index f63f8fd00a91..58ead05a1c29 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -825,7 +825,7 @@ void __noreturn stop_this_cpu(void *dummy)
 	 * X86_FEATURE_SME due to cmdline options.
 	 */
 	if (c->extended_cpuid_level >= 0x8000001f && (cpuid_eax(0x8000001f) & BIT(0)))
-		native_wbinvd();
+		wbinvd();
 
 	/*
 	 * This brings a cache line back and dirties it, but
@@ -846,7 +846,7 @@ void __noreturn stop_this_cpu(void *dummy)
 		/*
 		 * Use native_halt() so that memory contents don't change
 		 * (stack usage and variables) after possibly issuing the
-		 * native_wbinvd() above.
+		 * wbinvd() above.
 		 */
 		native_halt();
 	}
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index d6818c6cafda..fd2169063480 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1161,8 +1161,6 @@ static const typeof(pv_ops) xen_cpu_ops __initconst = {
 
 		.write_cr4 = xen_write_cr4,
 
-		.wbinvd = pv_native_wbinvd,
-
 		.read_msr = xen_read_msr,
 		.write_msr = xen_write_msr,
 
-- 
2.43.0


