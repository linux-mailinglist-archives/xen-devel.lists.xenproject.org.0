Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A2E7ABFEC
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:16:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607136.945404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzgb-0000Dg-Im; Sat, 23 Sep 2023 10:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607136.945404; Sat, 23 Sep 2023 10:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzgb-00006e-Aw; Sat, 23 Sep 2023 10:16:29 +0000
Received: by outflank-mailman (input) for mailman id 607136;
 Sat, 23 Sep 2023 10:16:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzcU-0000Pn-8l
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:12:14 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2ed6d3e-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:12:01 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:50 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:50 -0700
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
X-Inumbo-ID: a2ed6d3e-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463921; x=1726999921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PKEOP4k0ZbBHtG5Hiii+7GvY74WaZh+swnEHI3cDOxs=;
  b=nDRAOnZYhl93bIpMazs6GYbgSzHhOQUjx6gNfR4xU8hecu1x9xOXFGTB
   d7PxGHSsnpwRq4kStLIXaSiVUxOc5XO49HiRHg4ofojAH0AAoJeFmtmlJ
   bFStKQOTEBKUwxiFvkS3ygZdHVqogVgyhEMp0IdlkFXpVOEOPQvKAyxU8
   OuhVzZVbcSWQHwnNt2ngh9OekzpX3ouRJ2PCwHElNe+3bWZZwQs6iMuH5
   HC5nsrHEBIeGGMgtju7+kx7G79lhmc6WxKWmo14HwIvL0TsK++qvbgCZo
   gly5i1ilpXXpoSLGx0o4xKbN5q/5LRblSs7GfhRsxbvMA/GLsgEYYu5OR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492424"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492424"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388203"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388203"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	peterz@infradead.org,
	jgross@suse.com,
	ravi.v.shankar@intel.com,
	mhiramat@kernel.org,
	andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com,
	nik.borisov@suse.com
Subject: [PATCH v11 29/37] x86/traps: Add sysvec_install() to install a system interrupt handler
Date: Sat, 23 Sep 2023 02:42:04 -0700
Message-Id: <20230923094212.26520-30-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sysvec_install() to install a system interrupt handler into the IDT
or the FRED system interrupt handler table.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v8:
* Introduce a macro sysvec_install() to derive the asm handler name from
  a C handler, which simplifies the code and avoids an ugly typecast
  (Thomas Gleixner).
---
 arch/x86/entry/entry_fred.c      | 14 ++++++++++++++
 arch/x86/include/asm/desc.h      |  2 --
 arch/x86/include/asm/idtentry.h  | 15 +++++++++++++++
 arch/x86/kernel/cpu/acrn.c       |  4 ++--
 arch/x86/kernel/cpu/mshyperv.c   | 15 +++++++--------
 arch/x86/kernel/idt.c            |  4 ++--
 arch/x86/kernel/kvm.c            |  2 +-
 drivers/xen/events/events_base.c |  2 +-
 8 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index 68bec3888a36..97e2552d6951 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -126,6 +126,20 @@ static idtentry_t sysvec_table[NR_SYSTEM_VECTORS] __ro_after_init = {
 	SYSVEC(POSTED_INTR_NESTED_VECTOR,	kvm_posted_intr_nested_ipi),
 };
 
+static bool fred_setup_done __initdata;
+
+void __init fred_install_sysvec(unsigned int sysvec, idtentry_t handler)
+{
+	if (WARN_ON_ONCE(sysvec < FIRST_SYSTEM_VECTOR))
+		return;
+
+	if (WARN_ON_ONCE(fred_setup_done))
+		return;
+
+	if (!WARN_ON_ONCE(sysvec_table[sysvec - FIRST_SYSTEM_VECTOR]))
+		 sysvec_table[sysvec - FIRST_SYSTEM_VECTOR] = handler;
+}
+
 static noinstr void fred_extint(struct pt_regs *regs)
 {
 	unsigned int vector = regs->fred_ss.vector;
diff --git a/arch/x86/include/asm/desc.h b/arch/x86/include/asm/desc.h
index ab97b22ac04a..ec95fe44fa3a 100644
--- a/arch/x86/include/asm/desc.h
+++ b/arch/x86/include/asm/desc.h
@@ -402,8 +402,6 @@ static inline void set_desc_limit(struct desc_struct *desc, unsigned long limit)
 	desc->limit1 = (limit >> 16) & 0xf;
 }
 
-void alloc_intr_gate(unsigned int n, const void *addr);
-
 static inline void init_idt_data(struct idt_data *data, unsigned int n,
 				 const void *addr)
 {
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 4f26ee9b8b74..650c98160152 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -459,6 +459,21 @@ __visible noinstr void func(struct pt_regs *regs,			\
 #define DEFINE_FREDENTRY_DEBUG		DEFINE_FREDENTRY_RAW
 #endif
 
+void idt_install_sysvec(unsigned int n, const void *function);
+
+#ifdef CONFIG_X86_FRED
+void fred_install_sysvec(unsigned int vector, const idtentry_t function);
+#else
+static inline void fred_install_sysvec(unsigned int vector, const idtentry_t function) { }
+#endif
+
+#define sysvec_install(vector, function) {				\
+	if (cpu_feature_enabled(X86_FEATURE_FRED))			\
+		fred_install_sysvec(vector, function);			\
+	else								\
+		idt_install_sysvec(vector, asm_##function);		\
+}
+
 #else /* !__ASSEMBLY__ */
 
 /*
diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index bfeb18fad63f..2c5b51aad91a 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -26,8 +26,8 @@ static u32 __init acrn_detect(void)
 
 static void __init acrn_init_platform(void)
 {
-	/* Setup the IDT for ACRN hypervisor callback */
-	alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, asm_sysvec_acrn_hv_callback);
+	/* Install system interrupt handler for ACRN hypervisor callback */
+	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
 
 	x86_platform.calibrate_tsc = acrn_get_tsc_khz;
 	x86_platform.calibrate_cpu = acrn_get_tsc_khz;
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index e6bba12c759c..3403880c3e09 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -536,19 +536,18 @@ static void __init ms_hyperv_init_platform(void)
 	 */
 	x86_platform.apic_post_init = hyperv_init;
 	hyperv_setup_mmu_ops();
-	/* Setup the IDT for hypervisor callback */
-	alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, asm_sysvec_hyperv_callback);
 
-	/* Setup the IDT for reenlightenment notifications */
+	/* Install system interrupt handler for hypervisor callback */
+	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_hyperv_callback);
+
+	/* Install system interrupt handler for reenlightenment notifications */
 	if (ms_hyperv.features & HV_ACCESS_REENLIGHTENMENT) {
-		alloc_intr_gate(HYPERV_REENLIGHTENMENT_VECTOR,
-				asm_sysvec_hyperv_reenlightenment);
+		sysvec_install(HYPERV_REENLIGHTENMENT_VECTOR, sysvec_hyperv_reenlightenment);
 	}
 
-	/* Setup the IDT for stimer0 */
+	/* Install system interrupt handler for stimer0 */
 	if (ms_hyperv.misc_features & HV_STIMER_DIRECT_MODE_AVAILABLE) {
-		alloc_intr_gate(HYPERV_STIMER0_VECTOR,
-				asm_sysvec_hyperv_stimer0);
+		sysvec_install(HYPERV_STIMER0_VECTOR, sysvec_hyperv_stimer0);
 	}
 
 # ifdef CONFIG_SMP
diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
index 8857abc706e4..2b734927eec1 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -337,7 +337,7 @@ void idt_invalidate(void)
 	load_idt(&idt);
 }
 
-void __init alloc_intr_gate(unsigned int n, const void *addr)
+void __init idt_install_sysvec(unsigned int n, const void *function)
 {
 	if (WARN_ON(n < FIRST_SYSTEM_VECTOR))
 		return;
@@ -346,5 +346,5 @@ void __init alloc_intr_gate(unsigned int n, const void *addr)
 		return;
 
 	if (!WARN_ON(test_and_set_bit(n, system_vectors)))
-		set_intr_gate(n, addr);
+		set_intr_gate(n, function);
 }
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index b8ab9ee5896c..eabf03813a5c 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -829,7 +829,7 @@ static void __init kvm_guest_init(void)
 
 	if (kvm_para_has_feature(KVM_FEATURE_ASYNC_PF_INT) && kvmapf) {
 		static_branch_enable(&kvm_async_pf_enabled);
-		alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, asm_sysvec_kvm_asyncpf_interrupt);
+		sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_kvm_asyncpf_interrupt);
 	}
 
 #ifdef CONFIG_SMP
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 3bdd5b59661d..c54123ca7b1a 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -2243,7 +2243,7 @@ static __init void xen_alloc_callback_vector(void)
 		return;
 
 	pr_info("Xen HVM callback vector for event delivery is enabled\n");
-	alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, asm_sysvec_xen_hvm_callback);
+	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_xen_hvm_callback);
 }
 #else
 void xen_setup_callback_vector(void) {}
-- 
2.34.1


