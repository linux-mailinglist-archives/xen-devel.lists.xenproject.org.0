Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995EE8052BF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647594.1010983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATYh-0004kd-Iz; Tue, 05 Dec 2023 11:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647594.1010983; Tue, 05 Dec 2023 11:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATYh-0004iR-F7; Tue, 05 Dec 2023 11:25:47 +0000
Received: by outflank-mailman (input) for mailman id 647594;
 Tue, 05 Dec 2023 11:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUp-0003dP-V6
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:47 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7383e649-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:36 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:25 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:24 -0800
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
X-Inumbo-ID: 7383e649-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775297; x=1733311297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P4BKwwxZjNA35zXhN23eflIGEejxxbnos06jsBzXQIU=;
  b=JBvzSrtfdcf7kbEjL6E5eq2ValttEHj4RuRfX6q7NYVqx06YibzOUoX8
   z3naSDu+3v9K6dmXiwqbRp+CCzHt7EuqBt8okUwH3c5GxaiHuA9t9IFi8
   hhm8HrZZd68Z4q+drqWhh3+rX461i0Ri2UQXF10b3YASw16wu4IfeGAR0
   zXvhlZMMh7DDgOf7vaz9ZnLQQ4BIA3z3yJmpEJtU0X/IMM6NPd/JQaCtb
   bH31XrNsmGjL1XrhdkH/oDCR8AgZVnPUzb/NXqcFdrs3gK0rDsu7fXzwJ
   5PVXg9VnD45uytzPtBgah1+VP/QGtiEhuzJ0XFAobF9UB+Fgmy+1rR3ik
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942632"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942632"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018192995"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018192995"
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
	nik.borisov@suse.com,
	shan.kang@intel.com
Subject: [PATCH v13 27/35] x86/traps: Add sysvec_install() to install a system interrupt handler
Date: Tue,  5 Dec 2023 02:50:16 -0800
Message-ID: <20231205105030.8698-28-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
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
index 215883e90f94..e80e3efbc057 100644
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
index 01fa06dd06b6..45e0e70e238c 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -539,19 +539,18 @@ static void __init ms_hyperv_init_platform(void)
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
index 0ddb3bd0f1aa..70d3aa717a29 100644
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
index b8cfea7812d6..e2813bac92d4 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -2216,7 +2216,7 @@ static __init void xen_alloc_callback_vector(void)
 		return;
 
 	pr_info("Xen HVM callback vector for event delivery is enabled\n");
-	alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, asm_sysvec_xen_hvm_callback);
+	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_xen_hvm_callback);
 }
 #else
 void xen_setup_callback_vector(void) {}
-- 
2.43.0


