Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A02D5550E9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 18:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354196.581262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42wQ-0002dO-R2; Wed, 22 Jun 2022 16:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354196.581262; Wed, 22 Jun 2022 16:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42wQ-0002bB-Nh; Wed, 22 Jun 2022 16:10:54 +0000
Received: by outflank-mailman (input) for mailman id 354196;
 Wed, 22 Jun 2022 16:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o42wP-0002LP-HH
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 16:10:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3204999-f245-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 18:10:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C43681F8E0;
 Wed, 22 Jun 2022 16:10:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E999134A9;
 Wed, 22 Jun 2022 16:10:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8GO1GQs/s2JzCwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Jun 2022 16:10:51 +0000
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
X-Inumbo-ID: e3204999-f245-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655914251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZVsJ9w6p52CGnx+whse0Q5jtOMx+D4jAJ62tq6HNaI=;
	b=cd42wzcG9qaMXbWjJjPT6DeqeIeIraiBDdVXY8uFDunVR1bsFtlTkWabujY1sWEZYk3rPh
	g4T4IjxBOE8PIn0qEs6huxZI6p+qO7eNMCH7djqwSi30jRTgnY3Cy3I7CN1UN56ydHzj/A
	48WC5iBIXNOX5SPuKT343/uLBidXZg0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH 1/2] x86/xen: use clear_bss() for Xen PV guests
Date: Wed, 22 Jun 2022 18:10:47 +0200
Message-Id: <20220622161048.4483-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622161048.4483-1-jgross@suse.com>
References: <20220622161048.4483-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of clearing the bss area in assembly code, use the clear_bss()
function.

This requires to pass the start_info address as parameter to
xen_start_kernel() in order to avoid the xen_start_info being zeroed
again.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/setup.h |  3 +++
 arch/x86/kernel/head64.c     |  2 +-
 arch/x86/xen/enlighten_pv.c  |  8 ++++++--
 arch/x86/xen/xen-head.S      | 10 +---------
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index f8b9ee97a891..f37cbff7354c 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -120,6 +120,9 @@ void *extend_brk(size_t size, size_t align);
 	static char __brk_##name[size]
 
 extern void probe_roms(void);
+
+void clear_bss(void);
+
 #ifdef __i386__
 
 asmlinkage void __init i386_start_kernel(void);
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index bd4a34100ed0..e7e233209a8c 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -426,7 +426,7 @@ void __init do_early_exception(struct pt_regs *regs, int trapnr)
 
 /* Don't add a printk in there. printk relies on the PDA which is not initialized 
    yet. */
-static void __init clear_bss(void)
+void __init clear_bss(void)
 {
 	memset(__bss_start, 0,
 	       (unsigned long) __bss_stop - (unsigned long) __bss_start);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index e3297b15701c..70fb2ea85e90 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1183,15 +1183,19 @@ static void __init xen_domu_set_legacy_features(void)
 extern void early_xen_iret_patch(void);
 
 /* First C function to be called on Xen boot */
-asmlinkage __visible void __init xen_start_kernel(void)
+asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 {
 	struct physdev_set_iopl set_iopl;
 	unsigned long initrd_start = 0;
 	int rc;
 
-	if (!xen_start_info)
+	if (!si)
 		return;
 
+	clear_bss();
+
+	xen_start_info = si;
+
 	__text_gen_insn(&early_xen_iret_patch,
 			JMP32_INSN_OPCODE, &early_xen_iret_patch, &xen_iret,
 			JMP32_INSN_SIZE);
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 3a2cd93bf059..13af6fe453e3 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -48,15 +48,6 @@ SYM_CODE_START(startup_xen)
 	ANNOTATE_NOENDBR
 	cld
 
-	/* Clear .bss */
-	xor %eax,%eax
-	mov $__bss_start, %rdi
-	mov $__bss_stop, %rcx
-	sub %rdi, %rcx
-	shr $3, %rcx
-	rep stosq
-
-	mov %rsi, xen_start_info
 	mov initial_stack(%rip), %rsp
 
 	/* Set up %gs.
@@ -71,6 +62,7 @@ SYM_CODE_START(startup_xen)
 	cdq
 	wrmsr
 
+	mov	%rsi, %rdi
 	call xen_start_kernel
 SYM_CODE_END(startup_xen)
 	__FINIT
-- 
2.35.3


