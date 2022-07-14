Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151C857426C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 06:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367034.598070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBqO5-00063R-K5; Thu, 14 Jul 2022 04:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367034.598070; Thu, 14 Jul 2022 04:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBqO5-00061I-Gn; Thu, 14 Jul 2022 04:23:41 +0000
Received: by outflank-mailman (input) for mailman id 367034;
 Thu, 14 Jul 2022 04:23:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LdTb=XT=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1oBqO3-00061C-9p
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 04:23:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9ff4dce-032c-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 06:23:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7C5761E17;
 Thu, 14 Jul 2022 04:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE62C34114;
 Thu, 14 Jul 2022 04:23:32 +0000 (UTC)
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
X-Inumbo-ID: b9ff4dce-032c-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657772614;
	bh=J6mQcvC53lBuEVQf65dBBXN3IvFoM94h34szXqWSThQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k3i2Un4GLreSEo1+VkGbpqoeS6wAYqATuUIn88w7Uodjc/p3oi6431Xg+g/oljAeh
	 K3ybYB6Q4Q87A/lD7SBI3p2MbadnKVIBRckiitUdkUdPydBNBIJmnSrzpfX/Wi5S5g
	 XtH4ebpA0+BUQuobX4/Smn23cNFtY4SgQyrpzCoVz2pKErgpRFivjriRMYJL0Kd5qZ
	 SH0XIWEDW8aFTGMdTyV9hjDHkmd7grj2UzNucKB+0Aj9OuytuijA7RPmc4xIfZ0t6W
	 0iI0S4KJeEBy2qmZ3h4FFmlSsHoPKOLQgiswk3Y8cl3jrXN17n07auyV8tzVxF/14M
	 6ogZ1VjMSKg1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Borislav Petkov <bp@suse.de>,
	Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	michael.roth@amd.com,
	brijesh.singh@amd.com,
	kirill.shutemov@linux.intel.com,
	ak@linux.intel.com,
	thomas.lendacky@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.18 28/41] x86/xen: Use clear_bss() for Xen PV guests
Date: Thu, 14 Jul 2022 00:22:08 -0400
Message-Id: <20220714042221.281187-28-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 96e8fc5818686d4a1591bb6907e7fdb64ef29884 ]

Instead of clearing the bss area in assembly code, use the clear_bss()
function.

This requires to pass the start_info address as parameter to
xen_start_kernel() in order to avoid the xen_start_info being zeroed
again.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/r/20220630071441.28576-2-jgross@suse.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/include/asm/setup.h |  3 +++
 arch/x86/kernel/head64.c     |  2 +-
 arch/x86/xen/enlighten_pv.c  |  8 ++++++--
 arch/x86/xen/xen-head.S      | 10 +---------
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 896e48d45828..bccc84de7ff2 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -132,6 +132,9 @@ void *extend_brk(size_t size, size_t align);
 	}
 
 extern void probe_roms(void);
+
+void clear_bss(void);
+
 #ifdef __i386__
 
 asmlinkage void __init i386_start_kernel(void);
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 4f5ecbbaae77..2e10a33778cf 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -421,7 +421,7 @@ void __init do_early_exception(struct pt_regs *regs, int trapnr)
 
 /* Don't add a printk in there. printk relies on the PDA which is not initialized 
    yet. */
-static void __init clear_bss(void)
+void __init clear_bss(void)
 {
 	memset(__bss_start, 0,
 	       (unsigned long) __bss_stop - (unsigned long) __bss_start);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 5038edb79ad5..b55de4ad685c 100644
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
2.35.1


