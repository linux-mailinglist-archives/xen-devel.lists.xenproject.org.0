Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE415702705
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 10:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534602.831757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTRV-0000tm-M7; Mon, 15 May 2023 08:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534602.831757; Mon, 15 May 2023 08:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTRV-0000rV-JD; Mon, 15 May 2023 08:20:29 +0000
Received: by outflank-mailman (input) for mailman id 534602;
 Mon, 15 May 2023 08:20:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWdR=BE=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1pyTRU-0000r2-BN
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:20:28 +0000
Received: from out0-203.mail.aliyun.com (out0-203.mail.aliyun.com
 [140.205.0.203]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55f924de-f2f9-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 10:20:23 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.T2DpdRe_1684138815) by smtp.aliyun-inc.com;
 Mon, 15 May 2023 16:20:16 +0800
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
X-Inumbo-ID: 55f924de-f2f9-11ed-8611-37d641c3527e
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047187;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---.T2DpdRe_1684138815;
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Lai Jiangshan" <jiangshan.ljs@antgroup.com>,
  "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Andy Lutomirski" <luto@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
   <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
  "Juergen Gross" <jgross@suse.com>,
  "=?UTF-8?B?U3JpdmF0c2EgUy4gQmhhdCAoVk13YXJlKQ==?=" <srivatsa@csail.mit.edu>,
  "Alexey Makhalov" <amakhalov@vmware.com>,
  "VMware PV-Drivers Reviewers" <pv-drivers@vmware.com>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Suren Baghdasaryan" <surenb@google.com>,
  "Andrew Morton" <akpm@linux-foundation.org>,
  "=?UTF-8?B?TWlrZSBSYXBvcG9ydCAoSUJNKQ==?=" <rppt@kernel.org>,
  "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
   <virtualization@lists.linux-foundation.org>,
   <xen-devel@lists.xenproject.org>
Subject: [PATCH RFC 1/4] x86/vsyscall: Don't use set_fixmap() to map vsyscall page
Date: Mon, 15 May 2023 16:19:32 +0800
Message-Id: <7453c8b3b3b273e45c2541d09b950ffc4a97189d.1684137557.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
References: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to unify FIXADDR_TOP for x86 and allow the fixmap area to be
movable, the vsyscall page should be mapped individually. However, for
XENPV guests, the vsyscall page needs to be mapped into the user
pagetable as well. Therefore, a new PVMMU operation is introduced to
assist in mapping the vsyscall page.

Suggested-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/entry/vsyscall/vsyscall_64.c |  3 +--
 arch/x86/include/asm/paravirt.h       |  7 +++++++
 arch/x86/include/asm/paravirt_types.h |  4 ++++
 arch/x86/include/asm/vsyscall.h       | 13 +++++++++++++
 arch/x86/kernel/paravirt.c            |  4 ++++
 arch/x86/xen/mmu_pv.c                 | 20 ++++++++++++++------
 6 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index e0ca8120aea8..4373460ebbde 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -385,8 +385,7 @@ void __init map_vsyscall(void)
 	 * page.
 	 */
 	if (vsyscall_mode == EMULATE) {
-		__set_fixmap(VSYSCALL_PAGE, physaddr_vsyscall,
-			     PAGE_KERNEL_VVAR);
+		__set_vsyscall_page(physaddr_vsyscall, PAGE_KERNEL_VVAR);
 		set_vsyscall_pgtable_user_bits(swapper_pg_dir);
 	}
 
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b49778664d2b..c9543d383df0 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -576,6 +576,13 @@ static inline void __set_fixmap(unsigned /* enum fixed_addresses */ idx,
 {
 	pv_ops.mmu.set_fixmap(idx, phys, flags);
 }
+
+#ifdef CONFIG_X86_VSYSCALL_EMULATION
+static inline void __set_vsyscall_page(phys_addr_t phys, pgprot_t flags)
+{
+	pv_ops.mmu.set_vsyscall_page(phys, flags);
+}
+#endif
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_PARAVIRT_SPINLOCKS)
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 4acbcddddc29..2dc9397e064d 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -224,6 +224,10 @@ struct pv_mmu_ops {
 	   an mfn.  We can tell which is which from the index. */
 	void (*set_fixmap)(unsigned /* enum fixed_addresses */ idx,
 			   phys_addr_t phys, pgprot_t flags);
+
+#ifdef CONFIG_X86_VSYSCALL_EMULATION
+	void (*set_vsyscall_page)(phys_addr_t phys, pgprot_t flags);
+#endif
 #endif
 } __no_randomize_layout;
 
diff --git a/arch/x86/include/asm/vsyscall.h b/arch/x86/include/asm/vsyscall.h
index ab60a71a8dcb..73691fc60924 100644
--- a/arch/x86/include/asm/vsyscall.h
+++ b/arch/x86/include/asm/vsyscall.h
@@ -2,6 +2,7 @@
 #ifndef _ASM_X86_VSYSCALL_H
 #define _ASM_X86_VSYSCALL_H
 
+#include <asm/pgtable.h>
 #include <linux/seqlock.h>
 #include <uapi/asm/vsyscall.h>
 
@@ -15,6 +16,18 @@ extern void set_vsyscall_pgtable_user_bits(pgd_t *root);
  */
 extern bool emulate_vsyscall(unsigned long error_code,
 			     struct pt_regs *regs, unsigned long address);
+static inline void native_set_vsyscall_page(phys_addr_t phys, pgprot_t flags)
+{
+	pgprot_val(flags) &= __default_kernel_pte_mask;
+	set_pte_vaddr(VSYSCALL_ADDR, pfn_pte(phys >> PAGE_SHIFT, flags));
+}
+
+#ifndef CONFIG_PARAVIRT_XXL
+#define __set_vsyscall_page	native_set_vsyscall_page
+#else
+#include <asm/paravirt.h>
+#endif
+
 #else
 static inline void map_vsyscall(void) {}
 static inline bool emulate_vsyscall(unsigned long error_code,
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ac10b46c5832..13c81402f377 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -33,6 +33,7 @@
 #include <asm/tlb.h>
 #include <asm/io_bitmap.h>
 #include <asm/gsseg.h>
+#include <asm/vsyscall.h>
 
 /*
  * nop stub, which must not clobber anything *including the stack* to
@@ -357,6 +358,9 @@ struct paravirt_patch_template pv_ops = {
 	},
 
 	.mmu.set_fixmap		= native_set_fixmap,
+#ifdef CONFIG_X86_VSYSCALL_EMULATION
+	.mmu.set_vsyscall_page	= native_set_vsyscall_page,
+#endif
 #endif /* CONFIG_PARAVIRT_XXL */
 
 #if defined(CONFIG_PARAVIRT_SPINLOCKS)
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index b3b8d289b9ab..c42c60faa3bb 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -59,6 +59,7 @@
 
 #include <asm/tlbflush.h>
 #include <asm/fixmap.h>
+#include <asm/vsyscall.h>
 #include <asm/mmu_context.h>
 #include <asm/setup.h>
 #include <asm/paravirt.h>
@@ -2020,9 +2021,6 @@ static void xen_set_fixmap(unsigned idx, phys_addr_t phys, pgprot_t prot)
 
 	switch (idx) {
 	case FIX_BTMAP_END ... FIX_BTMAP_BEGIN:
-#ifdef CONFIG_X86_VSYSCALL_EMULATION
-	case VSYSCALL_PAGE:
-#endif
 		/* All local page mappings */
 		pte = pfn_pte(phys, prot);
 		break;
@@ -2058,14 +2056,21 @@ static void xen_set_fixmap(unsigned idx, phys_addr_t phys, pgprot_t prot)
 	vaddr = __fix_to_virt(idx);
 	if (HYPERVISOR_update_va_mapping(vaddr, pte, UVMF_INVLPG))
 		BUG();
+}
 
 #ifdef CONFIG_X86_VSYSCALL_EMULATION
+static void xen_set_vsyscall_page(phys_addr_t phys, pgprot_t prot)
+{
+	pte_t pte = pfn_pte(phys >> PAGE_SHIFT, prot);
+
+	if (HYPERVISOR_update_va_mapping(VSYSCALL_ADDR, pte, UVMF_INVLPG))
+		BUG();
+
 	/* Replicate changes to map the vsyscall page into the user
 	   pagetable vsyscall mapping. */
-	if (idx == VSYSCALL_PAGE)
-		set_pte_vaddr_pud(level3_user_vsyscall, vaddr, pte);
-#endif
+	set_pte_vaddr_pud(level3_user_vsyscall, VSYSCALL_ADDR, pte);
 }
+#endif
 
 static void __init xen_post_allocator_init(void)
 {
@@ -2156,6 +2161,9 @@ static const typeof(pv_ops) xen_mmu_ops __initconst = {
 		},
 
 		.set_fixmap = xen_set_fixmap,
+#ifdef CONFIG_X86_VSYSCALL_EMULATION
+		.set_vsyscall_page = xen_set_vsyscall_page,
+#endif
 	},
 };
 
-- 
2.31.1


