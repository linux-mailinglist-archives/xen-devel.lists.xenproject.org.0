Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA3A5B17A3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 10:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402842.644767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDEG-00006F-UT; Thu, 08 Sep 2022 08:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402842.644767; Thu, 08 Sep 2022 08:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDEG-0008Up-Ob; Thu, 08 Sep 2022 08:49:44 +0000
Received: by outflank-mailman (input) for mailman id 402842;
 Thu, 08 Sep 2022 08:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWDEF-0006wz-Hi
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 08:49:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2da77711-2f53-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 10:49:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D26733FD7;
 Thu,  8 Sep 2022 08:49:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6A411322C;
 Thu,  8 Sep 2022 08:49:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GrDRNqSsGWOENgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 08 Sep 2022 08:49:40 +0000
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
X-Inumbo-ID: 2da77711-2f53-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662626981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRcRkPu/cuQ4+jb3CjHl7anl34sikWirFCSMb9iqjCw=;
	b=R9uWOsAcsHJO4ivmS1UTQAs2/ZkaDvtx2ZVDtw9cjBuHBZnAdWuQR8DkZDqn1+VPQuIJb9
	h5h+sqWJTurueXXqK75KSqnJjpUtM7er/fChqqs+53kWKhrP5yAAMVQCkrv3ypQy4k/2xA
	BR28K+3/v67yaL6xxiix+HOnbX1PqsU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 04/10] x86: move some code out of arch/x86/kernel/cpu/mtrr
Date: Thu,  8 Sep 2022 10:49:08 +0200
Message-Id: <20220908084914.21703-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220908084914.21703-1-jgross@suse.com>
References: <20220908084914.21703-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare making PAT and MTRR support independent from each other by
moving some code needed by both out of the MTRR specific sources.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- move code from cpu/common.c to cpu/cacheinfo.c (Boris Petkov)
---
 arch/x86/include/asm/cacheinfo.h   |  3 ++
 arch/x86/include/asm/mtrr.h        |  4 ++
 arch/x86/kernel/cpu/cacheinfo.c    | 77 ++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/mtrr/generic.c | 81 ++++--------------------------
 4 files changed, 93 insertions(+), 72 deletions(-)

diff --git a/arch/x86/include/asm/cacheinfo.h b/arch/x86/include/asm/cacheinfo.h
index 1aeafa9888f7..313a6920d0f9 100644
--- a/arch/x86/include/asm/cacheinfo.h
+++ b/arch/x86/include/asm/cacheinfo.h
@@ -10,4 +10,7 @@ extern unsigned int cache_generic;
 void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, int cpu);
 void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c, int cpu);
 
+void cache_disable(void);
+void cache_enable(void);
+
 #endif /* _ASM_X86_CACHEINFO_H */
diff --git a/arch/x86/include/asm/mtrr.h b/arch/x86/include/asm/mtrr.h
index 76d726074c16..12a16caed395 100644
--- a/arch/x86/include/asm/mtrr.h
+++ b/arch/x86/include/asm/mtrr.h
@@ -48,6 +48,8 @@ extern void mtrr_aps_init(void);
 extern void mtrr_bp_restore(void);
 extern int mtrr_trim_uncached_memory(unsigned long end_pfn);
 extern int amd_special_default_mtrr(void);
+void mtrr_disable(void);
+void mtrr_enable(void);
 #  else
 static inline u8 mtrr_type_lookup(u64 addr, u64 end, u8 *uniform)
 {
@@ -87,6 +89,8 @@ static inline void mtrr_centaur_report_mcr(int mcr, u32 lo, u32 hi)
 #define set_mtrr_aps_delayed_init() do {} while (0)
 #define mtrr_aps_init() do {} while (0)
 #define mtrr_bp_restore() do {} while (0)
+#define mtrr_disable() do {} while (0)
+#define mtrr_enable() do {} while (0)
 #  endif
 
 #ifdef CONFIG_COMPAT
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 3b05d3ade7a6..47e2c72fa8a4 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -20,6 +20,8 @@
 #include <asm/cacheinfo.h>
 #include <asm/amd_nb.h>
 #include <asm/smp.h>
+#include <asm/mtrr.h>
+#include <asm/tlbflush.h>
 
 #include "cpu.h"
 
@@ -1043,3 +1045,78 @@ int populate_cache_leaves(unsigned int cpu)
 
 	return 0;
 }
+
+/*
+ * Disable and enable caches. Needed for changing MTRRs and the PAT MSR.
+ *
+ * Since we are disabling the cache don't allow any interrupts,
+ * they would run extremely slow and would only increase the pain.
+ *
+ * The caller must ensure that local interrupts are disabled and
+ * are reenabled after cache_enable() has been called.
+ */
+static unsigned long saved_cr4;
+static DEFINE_RAW_SPINLOCK(cache_disable_lock);
+
+void cache_disable(void) __acquires(cache_disable_lock)
+{
+	unsigned long cr0;
+
+	/*
+	 * Note that this is not ideal
+	 * since the cache is only flushed/disabled for this CPU while the
+	 * MTRRs are changed, but changing this requires more invasive
+	 * changes to the way the kernel boots
+	 */
+
+	raw_spin_lock(&cache_disable_lock);
+
+	/* Enter the no-fill (CD=1, NW=0) cache mode and flush caches. */
+	cr0 = read_cr0() | X86_CR0_CD;
+	write_cr0(cr0);
+
+	/*
+	 * Cache flushing is the most time-consuming step when programming
+	 * the MTRRs. Fortunately, as per the Intel Software Development
+	 * Manual, we can skip it if the processor supports cache self-
+	 * snooping.
+	 */
+	if (!static_cpu_has(X86_FEATURE_SELFSNOOP))
+		wbinvd();
+
+	/* Save value of CR4 and clear Page Global Enable (bit 7) */
+	if (boot_cpu_has(X86_FEATURE_PGE)) {
+		saved_cr4 = __read_cr4();
+		__write_cr4(saved_cr4 & ~X86_CR4_PGE);
+	}
+
+	/* Flush all TLBs via a mov %cr3, %reg; mov %reg, %cr3 */
+	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
+	flush_tlb_local();
+
+	if (boot_cpu_has(X86_FEATURE_MTRR))
+		mtrr_disable();
+
+	/* Again, only flush caches if we have to. */
+	if (!static_cpu_has(X86_FEATURE_SELFSNOOP))
+		wbinvd();
+}
+
+void cache_enable(void) __releases(cache_disable_lock)
+{
+	/* Flush TLBs (no need to flush caches - they are disabled) */
+	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
+	flush_tlb_local();
+
+	if (boot_cpu_has(X86_FEATURE_MTRR))
+		mtrr_enable();
+
+	/* Enable caches */
+	write_cr0(read_cr0() & ~X86_CR0_CD);
+
+	/* Restore value of CR4 */
+	if (boot_cpu_has(X86_FEATURE_PGE))
+		__write_cr4(saved_cr4);
+
+	raw_spin_unlock(&cache_disable_lock);
+}
diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 81742870ecc5..5ed397f03a87 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 
 #include <asm/processor-flags.h>
+#include <asm/cacheinfo.h>
 #include <asm/cpufeature.h>
 #include <asm/tlbflush.h>
 #include <asm/mtrr.h>
@@ -396,9 +397,6 @@ print_fixed(unsigned base, unsigned step, const mtrr_type *types)
 	}
 }
 
-static void prepare_set(void);
-static void post_set(void);
-
 static void __init print_mtrr_state(void)
 {
 	unsigned int i;
@@ -450,11 +448,11 @@ void __init mtrr_bp_pat_init(void)
 	unsigned long flags;
 
 	local_irq_save(flags);
-	prepare_set();
+	cache_disable();
 
 	pat_init();
 
-	post_set();
+	cache_enable();
 	local_irq_restore(flags);
 }
 
@@ -718,80 +716,19 @@ static unsigned long set_mtrr_state(void)
 	return change_mask;
 }
 
-
-static unsigned long cr4;
-static DEFINE_RAW_SPINLOCK(set_atomicity_lock);
-
-/*
- * Since we are disabling the cache don't allow any interrupts,
- * they would run extremely slow and would only increase the pain.
- *
- * The caller must ensure that local interrupts are disabled and
- * are reenabled after post_set() has been called.
- */
-static void prepare_set(void) __acquires(set_atomicity_lock)
+void mtrr_disable(void)
 {
-	unsigned long cr0;
-
-	/*
-	 * Note that this is not ideal
-	 * since the cache is only flushed/disabled for this CPU while the
-	 * MTRRs are changed, but changing this requires more invasive
-	 * changes to the way the kernel boots
-	 */
-
-	raw_spin_lock(&set_atomicity_lock);
-
-	/* Enter the no-fill (CD=1, NW=0) cache mode and flush caches. */
-	cr0 = read_cr0() | X86_CR0_CD;
-	write_cr0(cr0);
-
-	/*
-	 * Cache flushing is the most time-consuming step when programming
-	 * the MTRRs. Fortunately, as per the Intel Software Development
-	 * Manual, we can skip it if the processor supports cache self-
-	 * snooping.
-	 */
-	if (!static_cpu_has(X86_FEATURE_SELFSNOOP))
-		wbinvd();
-
-	/* Save value of CR4 and clear Page Global Enable (bit 7) */
-	if (boot_cpu_has(X86_FEATURE_PGE)) {
-		cr4 = __read_cr4();
-		__write_cr4(cr4 & ~X86_CR4_PGE);
-	}
-
-	/* Flush all TLBs via a mov %cr3, %reg; mov %reg, %cr3 */
-	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
-	flush_tlb_local();
-
 	/* Save MTRR state */
 	rdmsr(MSR_MTRRdefType, deftype_lo, deftype_hi);
 
 	/* Disable MTRRs, and set the default type to uncached */
 	mtrr_wrmsr(MSR_MTRRdefType, deftype_lo & ~0xcff, deftype_hi);
-
-	/* Again, only flush caches if we have to. */
-	if (!static_cpu_has(X86_FEATURE_SELFSNOOP))
-		wbinvd();
 }
 
-static void post_set(void) __releases(set_atomicity_lock)
+void mtrr_enable(void)
 {
-	/* Flush TLBs (no need to flush caches - they are disabled) */
-	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
-	flush_tlb_local();
-
 	/* Intel (P6) standard MTRRs */
 	mtrr_wrmsr(MSR_MTRRdefType, deftype_lo, deftype_hi);
-
-	/* Enable caches */
-	write_cr0(read_cr0() & ~X86_CR0_CD);
-
-	/* Restore value of CR4 */
-	if (boot_cpu_has(X86_FEATURE_PGE))
-		__write_cr4(cr4);
-	raw_spin_unlock(&set_atomicity_lock);
 }
 
 static void generic_set_all(void)
@@ -800,7 +737,7 @@ static void generic_set_all(void)
 	unsigned long flags;
 
 	local_irq_save(flags);
-	prepare_set();
+	cache_disable();
 
 	/* Actually set the state */
 	mask = set_mtrr_state();
@@ -808,7 +745,7 @@ static void generic_set_all(void)
 	/* also set PAT */
 	pat_init();
 
-	post_set();
+	cache_enable();
 	local_irq_restore(flags);
 
 	/* Use the atomic bitops to update the global mask */
@@ -839,7 +776,7 @@ static void generic_set_mtrr(unsigned int reg, unsigned long base,
 	vr = &mtrr_state.var_ranges[reg];
 
 	local_irq_save(flags);
-	prepare_set();
+	cache_disable();
 
 	if (size == 0) {
 		/*
@@ -858,7 +795,7 @@ static void generic_set_mtrr(unsigned int reg, unsigned long base,
 		mtrr_wrmsr(MTRRphysMask_MSR(reg), vr->mask_lo, vr->mask_hi);
 	}
 
-	post_set();
+	cache_enable();
 	local_irq_restore(flags);
 }
 
-- 
2.35.3


