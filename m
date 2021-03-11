Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779933757D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96586.182984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMEH-0004Vn-Bc; Thu, 11 Mar 2021 14:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96586.182984; Thu, 11 Mar 2021 14:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMEG-0004Tq-Nl; Thu, 11 Mar 2021 14:23:56 +0000
Received: by outflank-mailman (input) for mailman id 96586;
 Thu, 11 Mar 2021 14:23:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+5TX=IJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lKMEF-0003YP-1f
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:23:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1913793a-6d5f-44d8-8116-55c006ffdd1e;
 Thu, 11 Mar 2021 14:23:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DCB1DAEB9;
 Thu, 11 Mar 2021 14:23:26 +0000 (UTC)
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
X-Inumbo-ID: 1913793a-6d5f-44d8-8116-55c006ffdd1e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615472607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvXQTESbVUUOQpFJd4LhMV3VKc6mx7G3lPEDouvn7/Q=;
	b=A2MqvoaMzklSqcNTeBXk2kflS403fWIJC9sIvKki9e7vDRDj/KTOuCpv4Z+584oPSA5ATI
	3F++3hvQYEWrizvNx61DF752xGRQ0M17sWCHmk5ZlIfACe2Cywo8BhCPZoSs+kXwGZdmdu
	e24EKv/4wiw5ZPf9k6THVpERSo1huRs=
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v7 14/14] x86/paravirt: have only one paravirt patch function
Date: Thu, 11 Mar 2021 15:23:19 +0100
Message-Id: <20210311142319.4723-15-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311142319.4723-1-jgross@suse.com>
References: <20210311142319.4723-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need any longer to have different paravirt patch functions
for native and Xen. Eliminate native_patch() and rename
paravirt_patch_default() to paravirt_patch().

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V3:
- remove paravirt_patch_insns() (kernel test robot)
---
 arch/x86/include/asm/paravirt_types.h | 19 +------------------
 arch/x86/kernel/Makefile              |  3 +--
 arch/x86/kernel/alternative.c         |  2 +-
 arch/x86/kernel/paravirt.c            | 20 ++------------------
 arch/x86/kernel/paravirt_patch.c      | 11 -----------
 arch/x86/xen/enlighten_pv.c           |  1 -
 6 files changed, 5 insertions(+), 51 deletions(-)
 delete mode 100644 arch/x86/kernel/paravirt_patch.c

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 588ff14ce969..9d1ddb7b4350 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -68,19 +68,6 @@ struct pv_info {
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
@@ -276,7 +263,6 @@ struct pv_lock_ops {
  * number for each function using the offset which we use to indicate
  * what to patch. */
 struct paravirt_patch_template {
-	struct pv_init_ops	init;
 	struct pv_cpu_ops	cpu;
 	struct pv_irq_ops	irq;
 	struct pv_mmu_ops	mmu;
@@ -317,10 +303,7 @@ extern void (*paravirt_iret)(void);
 /* Simple instruction patching code. */
 #define NATIVE_LABEL(a,x,b) "\n\t.globl " a #x "_" #b "\n" a #x "_" #b ":\n\t"
 
-unsigned paravirt_patch_default(u8 type, void *insn_buff, unsigned long addr, unsigned len);
-unsigned paravirt_patch_insns(void *insn_buff, unsigned len, const char *start, const char *end);
-
-unsigned native_patch(u8 type, void *insn_buff, unsigned long addr, unsigned len);
+unsigned int paravirt_patch(u8 type, void *insn_buff, unsigned long addr, unsigned int len);
 
 int paravirt_disable_iospace(void);
 
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 2ddf08351f0b..0704c2a94272 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -35,7 +35,6 @@ KASAN_SANITIZE_sev-es.o					:= n
 KCSAN_SANITIZE := n
 
 OBJECT_FILES_NON_STANDARD_test_nx.o			:= y
-OBJECT_FILES_NON_STANDARD_paravirt_patch.o		:= y
 
 ifdef CONFIG_FRAME_POINTER
 OBJECT_FILES_NON_STANDARD_ftrace_$(BITS).o		:= y
@@ -121,7 +120,7 @@ obj-$(CONFIG_AMD_NB)		+= amd_nb.o
 obj-$(CONFIG_DEBUG_NMI_SELFTEST) += nmi_selftest.o
 
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvmclock.o
-obj-$(CONFIG_PARAVIRT)		+= paravirt.o paravirt_patch.o
+obj-$(CONFIG_PARAVIRT)		+= paravirt.o
 obj-$(CONFIG_PARAVIRT_SPINLOCKS)+= paravirt-spinlocks.o
 obj-$(CONFIG_PARAVIRT_CLOCK)	+= pvclock.o
 obj-$(CONFIG_X86_PMEM_LEGACY_DEVICE) += pmem.o
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 76ad4ce454c0..f810e6fececd 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -616,7 +616,7 @@ void __init_or_module apply_paravirt(struct paravirt_patch_site *start,
 		BUG_ON(p->len > MAX_PATCH_LEN);
 		/* prep the buffer with the original instructions */
 		memcpy(insn_buff, p->instr, p->len);
-		used = pv_ops.init.patch(p->type, insn_buff, (unsigned long)p->instr, p->len);
+		used = paravirt_patch(p->type, insn_buff, (unsigned long)p->instr, p->len);
 
 		BUG_ON(used > p->len);
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 855ae08a05a1..d0730264786b 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -99,8 +99,8 @@ void __init native_pv_lock_init(void)
 		static_branch_disable(&virt_spin_lock_key);
 }
 
-unsigned paravirt_patch_default(u8 type, void *insn_buff,
-				unsigned long addr, unsigned len)
+unsigned int paravirt_patch(u8 type, void *insn_buff, unsigned long addr,
+			    unsigned int len)
 {
 	/*
 	 * Neat trick to map patch type back to the call within the
@@ -121,19 +121,6 @@ unsigned paravirt_patch_default(u8 type, void *insn_buff,
 	return ret;
 }
 
-unsigned paravirt_patch_insns(void *insn_buff, unsigned len,
-			      const char *start, const char *end)
-{
-	unsigned insn_len = end - start;
-
-	/* Alternative instruction is too large for the patch site and we cannot continue: */
-	BUG_ON(insn_len > len || start == NULL);
-
-	memcpy(insn_buff, start, insn_len);
-
-	return insn_len;
-}
-
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
@@ -252,9 +239,6 @@ struct pv_info pv_info = {
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
index 08dca7bebb30..4f18cd9eacd8 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1231,7 +1231,6 @@ asmlinkage __visible void __init xen_start_kernel(void)
 
 	/* Install Xen paravirt ops */
 	pv_info = xen_info;
-	pv_ops.init.patch = paravirt_patch_default;
 	pv_ops.cpu = xen_cpu_ops;
 	paravirt_iret = xen_iret;
 	xen_init_irq_ops();
-- 
2.26.2


