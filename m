Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC82BA97D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 12:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32031.62967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4sn-0005As-4L; Fri, 20 Nov 2020 11:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32031.62967; Fri, 20 Nov 2020 11:47:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4sm-00059h-T1; Fri, 20 Nov 2020 11:47:16 +0000
Received: by outflank-mailman (input) for mailman id 32031;
 Fri, 20 Nov 2020 11:47:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kg4sl-00048T-7C
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:47:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed6e6f4a-e6bf-40d0-86a5-06eeceed8e10;
 Fri, 20 Nov 2020 11:46:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 460FBADDB;
 Fri, 20 Nov 2020 11:46:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kg4sl-00048T-7C
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:47:15 +0000
X-Inumbo-ID: ed6e6f4a-e6bf-40d0-86a5-06eeceed8e10
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ed6e6f4a-e6bf-40d0-86a5-06eeceed8e10;
	Fri, 20 Nov 2020 11:46:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605872798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvGJzF3kLsbrT/VFYKE6yOfFu7G7ZuC1Hu1vcGbSYR0=;
	b=NFyZJJGo7Rm2MSDuNGewrxDAq0Ask4NpUk48WrgYcF0spwnkO34hJz75+m3ma+FokdkL1B
	FjiHGB8NlDkZCUw1tIyBMEPrKwaVIdnUxNewB8hbvR4fR/YO+4L1JfzR1I+w/zExML29M1
	AZGUh6y9Gai0RPBULFe19SmUiV2I40E=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 460FBADDB;
	Fri, 20 Nov 2020 11:46:38 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	luto@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 12/12] x86/paravirt: have only one paravirt patch function
Date: Fri, 20 Nov 2020 12:46:30 +0100
Message-Id: <20201120114630.13552-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120114630.13552-1-jgross@suse.com>
References: <20201120114630.13552-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need any longer to have different paravirt patch functions
for native and Xen. Eliminate native_patch() and rename
paravirt_patch_default() to paravirt_patch().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt_types.h | 19 +------------------
 arch/x86/kernel/Makefile              |  3 +--
 arch/x86/kernel/alternative.c         |  2 +-
 arch/x86/kernel/paravirt.c            |  7 ++-----
 arch/x86/kernel/paravirt_patch.c      | 11 -----------
 arch/x86/xen/enlighten_pv.c           |  1 -
 6 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 arch/x86/kernel/paravirt_patch.c

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 481d3b667005..bb79e21e1ead 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -74,19 +74,6 @@ struct pv_info {
 	const char *name;
 };
 
-struct pv_init_ops {
-	/*
-	 * Patch may replace one of the defined code sequences with
-	 * arbitrary code, subject to the same register constraints.
-	 * This generally means the code is not free to clobber any
-	 * registers other than EAX.  The patch function should return
-	 * the number of bytes of code generated, as we nop pad the
-	 * rest in generic code.
-	 */
-	unsigned (*patch)(u8 type, void *insn_buff,
-			  unsigned long addr, unsigned len);
-} __no_randomize_layout;
-
 #ifdef CONFIG_PARAVIRT_XXL
 struct pv_lazy_ops {
 	/* Set deferred update mode, used for batching operations. */
@@ -282,7 +269,6 @@ struct pv_lock_ops {
  * number for each function using the offset which we use to indicate
  * what to patch. */
 struct paravirt_patch_template {
-	struct pv_init_ops	init;
 	struct pv_cpu_ops	cpu;
 	struct pv_irq_ops	irq;
 	struct pv_mmu_ops	mmu;
@@ -323,10 +309,7 @@ extern void (*paravirt_iret)(void);
 /* Simple instruction patching code. */
 #define NATIVE_LABEL(a,x,b) "\n\t.globl " a #x "_" #b "\n" a #x "_" #b ":\n\t"
 
-unsigned paravirt_patch_default(u8 type, void *insn_buff, unsigned long addr, unsigned len);
-unsigned paravirt_patch_insns(void *insn_buff, unsigned len, const char *start, const char *end);
-
-unsigned native_patch(u8 type, void *insn_buff, unsigned long addr, unsigned len);
+unsigned paravirt_patch(u8 type, void *insn_buff, unsigned long addr, unsigned len);
 
 int paravirt_disable_iospace(void);
 
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 68608bd892c0..61f52f95670b 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -35,7 +35,6 @@ KASAN_SANITIZE_sev-es.o					:= n
 KCSAN_SANITIZE := n
 
 OBJECT_FILES_NON_STANDARD_test_nx.o			:= y
-OBJECT_FILES_NON_STANDARD_paravirt_patch.o		:= y
 
 ifdef CONFIG_FRAME_POINTER
 OBJECT_FILES_NON_STANDARD_ftrace_$(BITS).o		:= y
@@ -122,7 +121,7 @@ obj-$(CONFIG_AMD_NB)		+= amd_nb.o
 obj-$(CONFIG_DEBUG_NMI_SELFTEST) += nmi_selftest.o
 
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvmclock.o
-obj-$(CONFIG_PARAVIRT)		+= paravirt.o paravirt_patch.o
+obj-$(CONFIG_PARAVIRT)		+= paravirt.o
 obj-$(CONFIG_PARAVIRT_SPINLOCKS)+= paravirt-spinlocks.o
 obj-$(CONFIG_PARAVIRT_CLOCK)	+= pvclock.o
 obj-$(CONFIG_X86_PMEM_LEGACY_DEVICE) += pmem.o
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index f8f9700719cf..7ed2c3992eb3 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -617,7 +617,7 @@ void __init_or_module apply_paravirt(struct paravirt_patch_site *start,
 		BUG_ON(p->len > MAX_PATCH_LEN);
 		/* prep the buffer with the original instructions */
 		memcpy(insn_buff, p->instr, p->len);
-		used = pv_ops.init.patch(p->type, insn_buff, (unsigned long)p->instr, p->len);
+		used = paravirt_patch(p->type, insn_buff, (unsigned long)p->instr, p->len);
 
 		BUG_ON(used > p->len);
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index db6ae7f7c14e..f05404844245 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -99,8 +99,8 @@ void __init native_pv_lock_init(void)
 		static_branch_disable(&virt_spin_lock_key);
 }
 
-unsigned paravirt_patch_default(u8 type, void *insn_buff,
-				unsigned long addr, unsigned len)
+unsigned paravirt_patch(u8 type, void *insn_buff, unsigned long addr,
+			unsigned len)
 {
 	/*
 	 * Neat trick to map patch type back to the call within the
@@ -255,9 +255,6 @@ struct pv_info pv_info = {
 #define PTE_IDENT	__PV_IS_CALLEE_SAVE(_paravirt_ident_64)
 
 struct paravirt_patch_template pv_ops = {
-	/* Init ops. */
-	.init.patch		= native_patch,
-
 	/* Cpu ops. */
 	.cpu.io_delay		= native_io_delay,
 
diff --git a/arch/x86/kernel/paravirt_patch.c b/arch/x86/kernel/paravirt_patch.c
deleted file mode 100644
index 10543dcc8211..000000000000
--- a/arch/x86/kernel/paravirt_patch.c
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/stringify.h>
-
-#include <asm/paravirt.h>
-#include <asm/asm-offsets.h>
-
-unsigned int native_patch(u8 type, void *insn_buff, unsigned long addr,
-			  unsigned int len)
-{
-	return paravirt_patch_default(type, insn_buff, addr, len);
-}
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4716383c64a9..66f83de4d9e0 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1218,7 +1218,6 @@ asmlinkage __visible void __init xen_start_kernel(void)
 
 	/* Install Xen paravirt ops */
 	pv_info = xen_info;
-	pv_ops.init.patch = paravirt_patch_default;
 	pv_ops.cpu = xen_cpu_ops;
 	paravirt_iret = xen_iret;
 	xen_init_irq_ops();
-- 
2.26.2


