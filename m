Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BAA76E5A6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576219.902140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVYG-0001ad-JW; Thu, 03 Aug 2023 10:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576219.902140; Thu, 03 Aug 2023 10:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVYG-0001XH-GQ; Thu, 03 Aug 2023 10:27:28 +0000
Received: by outflank-mailman (input) for mailman id 576219;
 Thu, 03 Aug 2023 10:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVYE-0008Qm-Iv
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:27:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56df6d5b-31e8-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:27:25 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id F3C004EE0737;
 Thu,  3 Aug 2023 12:27:24 +0200 (CEST)
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
X-Inumbo-ID: 56df6d5b-31e8-11ee-b268-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 11/13] xen/x86: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:26 +0200
Message-Id: <40f438ad05338dd86587eb469c7b0614e1d69462.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/cpu-policy.c            |  4 ++--
 xen/arch/x86/dom0_build.c            |  2 +-
 xen/arch/x86/e820.c                  |  2 +-
 xen/arch/x86/hpet.c                  |  2 +-
 xen/arch/x86/hvm/hpet.c              |  6 +++---
 xen/arch/x86/hvm/hvm.c               |  6 +++---
 xen/arch/x86/hvm/stdvga.c            |  2 +-
 xen/arch/x86/include/asm/apicdef.h   |  4 ++--
 xen/arch/x86/include/asm/debugreg.h  | 16 ++++++++--------
 xen/arch/x86/include/asm/guest_pt.h  | 16 ++++++++--------
 xen/arch/x86/include/asm/pv/domain.h |  2 +-
 xen/arch/x86/mm.c                    |  4 ++--
 xen/arch/x86/msr.c                   |  2 +-
 xen/arch/x86/nmi.c                   |  2 +-
 xen/arch/x86/psr.c                   |  8 ++++----
 xen/arch/x86/spec_ctrl.c             |  6 +++---
 xen/arch/x86/x86_64/mm.c             |  4 ++--
 xen/arch/x86/xstate.c                |  2 +-
 xen/lib/x86/cpuid.c                  |  4 ++--
 19 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 1f954d4e59..5fbb3602ae 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -250,9 +250,9 @@ static void recalculate_xstate(struct cpu_policy *p)
     else
         xstates &= ~XSTATE_XSAVES_ONLY;
 
-    for ( i = 2; i < min(63ul, ARRAY_SIZE(p->xstate.comp)); ++i )
+    for ( i = 2; i < min(63UL, ARRAY_SIZE(p->xstate.comp)); ++i )
     {
-        uint64_t curr_xstate = 1ul << i;
+        uint64_t curr_xstate = 1UL << i;
 
         if ( !(xstates & curr_xstate) )
             continue;
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8b1fcc6471..09fb8b063a 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -537,7 +537,7 @@ int __init dom0_setup_permissions(struct domain *d)
     for ( i = 0; i < e820.nr_map; i++ )
     {
         unsigned long sfn, efn;
-        sfn = max_t(unsigned long, paddr_to_pfn(e820.map[i].addr), 0x100ul);
+        sfn = max_t(unsigned long, paddr_to_pfn(e820.map[i].addr), 0x100UL);
         efn = paddr_to_pfn(e820.map[i].addr + e820.map[i].size - 1);
         if ( (e820.map[i].type == E820_UNUSABLE) &&
              (e820.map[i].size != 0) &&
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index 0b89935510..4911e64b8c 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -450,7 +450,7 @@ static uint64_t __init mtrr_top_of_ram(void)
 
     /* paddr_bits must have been set at this point */
     ASSERT(paddr_bits);
-    addr_mask = ((1ull << paddr_bits) - 1) & PAGE_MASK;
+    addr_mask = ((1ULL << paddr_bits) - 1) & PAGE_MASK;
 
     rdmsrl(MSR_MTRRcap, mtrr_cap);
     rdmsrl(MSR_MTRRdefType, mtrr_def);
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index bc164dd82c..a2df1c7df4 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -619,7 +619,7 @@ void __init cf_check hpet_broadcast_init(void)
          * math multiplication factor for nanosecond to hpet tick conversion.
          */
         hpet_events[i].mult = div_sc((unsigned long)hpet_rate,
-                                     1000000000ul, 32);
+                                     1000000000UL, 32);
         hpet_events[i].shift = 32;
         hpet_events[i].next_event = STIME_MAX;
         spin_lock_init(&hpet_events[i].lock);
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index dff27b760e..80f323316c 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -161,7 +161,7 @@ static int cf_check hpet_read(
 
     if ( !v->domain->arch.hvm.params[HVM_PARAM_HPET_ENABLED] )
     {
-        result = ~0ul;
+        result = ~0UL;
         goto out;
     }
 
@@ -169,7 +169,7 @@ static int cf_check hpet_read(
 
     if ( hpet_check_access_length(addr, length) != 0 )
     {
-        result = ~0ul;
+        result = ~0UL;
         goto out;
     }
 
@@ -486,7 +486,7 @@ static int cf_check hpet_write(
         if ( timer_is_periodic(h, tn) &&
              !(h->hpet.timers[tn].config & HPET_TN_SETVAL) )
         {
-            uint64_t max_period = (timer_is_32bit(h, tn) ? ~0u : ~0ull) >> 1;
+            uint64_t max_period = (timer_is_32bit(h, tn) ? ~0u : ~0ULL) >> 1;
 
             /*
              * Clamp period to reasonable min/max values:
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2180abeb33..3a99c0ff20 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -294,7 +294,7 @@ void hvm_get_guest_pat(struct vcpu *v, uint64_t *guest_pat)
 static bool pat_valid(uint64_t val)
 {
     /* Yields a non-zero value in any lane which had value greater than 7. */
-    uint64_t any_gt_7   =  val & 0xf8f8f8f8f8f8f8f8ull;
+    uint64_t any_gt_7   =  val & 0xf8f8f8f8f8f8f8f8ULL;
 
     /*
      * With the > 7 case covered, identify lanes with the value 0-3 by finding
@@ -302,7 +302,7 @@ static bool pat_valid(uint64_t val)
      *
      * Yields bit 2 set in each lane which has a value <= 3.
      */
-    uint64_t any_le_3   = ~val & 0x0404040404040404ull;
+    uint64_t any_le_3   = ~val & 0x0404040404040404ULL;
 
     /*
      * Logically, any_2_or_3 is "any_le_3 && bit 1 set".
@@ -3626,7 +3626,7 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 
  gp_fault:
     ret = X86EMUL_EXCEPTION;
-    *msr_content = -1ull;
+    *msr_content = -1ULL;
     goto out;
 }
 
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index 798a9a0549..2586891863 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -305,7 +305,7 @@ static int cf_check stdvga_mem_read(
     const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
     uint64_t *p_data)
 {
-    uint64_t data = ~0ul;
+    uint64_t data = ~0UL;
 
     switch ( size )
     {
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
index 2440d83c8d..a261436993 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -34,8 +34,8 @@
 #define			SET_xAPIC_LOGICAL_ID(x)	(((x)<<24))
 #define			APIC_ALL_CPUS		0xFF
 #define		APIC_DFR	0xE0
-#define			APIC_DFR_CLUSTER		0x0FFFFFFFul
-#define			APIC_DFR_FLAT			0xFFFFFFFFul
+#define			APIC_DFR_CLUSTER		0x0FFFFFFFUL
+#define			APIC_DFR_FLAT			0xFFFFFFFFUL
 #define		APIC_SPIV	0xF0
 #define			APIC_SPIV_FOCUS_DISABLED	(1<<9)
 #define			APIC_SPIV_APIC_ENABLED		(1<<8)
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index c57914efc6..86aa6d7143 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -21,8 +21,8 @@
 #define DR_STEP         (0x4000)        /* single-step */
 #define DR_SWITCH       (0x8000)        /* task switch */
 #define DR_NOT_RTM      (0x10000)       /* clear: #BP inside RTM region */
-#define DR_STATUS_RESERVED_ZERO (~0xffffeffful) /* Reserved, read as zero */
-#define DR_STATUS_RESERVED_ONE  0xffff0ff0ul /* Reserved, read as one */
+#define DR_STATUS_RESERVED_ZERO (~0xffffefffUL) /* Reserved, read as zero */
+#define DR_STATUS_RESERVED_ONE  0xffff0ff0UL /* Reserved, read as one */
 
 /* Now define a bunch of things for manipulating the control register.
    The top two bytes of the control register consist of 4 fields of 4
@@ -61,12 +61,12 @@
    We can slow the instruction pipeline for instructions coming via the
    gdt or the ldt if we want to.  I am not sure why this is an advantage */
 
-#define DR_CONTROL_RESERVED_ZERO (~0xffff27fful) /* Reserved, read as zero */
-#define DR_CONTROL_RESERVED_ONE  (0x00000400ul) /* Reserved, read as one */
-#define DR_LOCAL_EXACT_ENABLE    (0x00000100ul) /* Local exact enable */
-#define DR_GLOBAL_EXACT_ENABLE   (0x00000200ul) /* Global exact enable */
-#define DR_RTM_ENABLE            (0x00000800ul) /* RTM debugging enable */
-#define DR_GENERAL_DETECT        (0x00002000ul) /* General detect enable */
+#define DR_CONTROL_RESERVED_ZERO (~0xffff27ffUL) /* Reserved, read as zero */
+#define DR_CONTROL_RESERVED_ONE  (0x00000400UL) /* Reserved, read as one */
+#define DR_LOCAL_EXACT_ENABLE    (0x00000100UL) /* Local exact enable */
+#define DR_GLOBAL_EXACT_ENABLE   (0x00000200UL) /* Global exact enable */
+#define DR_RTM_ENABLE            (0x00000800UL) /* RTM debugging enable */
+#define DR_GENERAL_DETECT        (0x00002000UL) /* General detect enable */
 
 #define write_debugreg(reg, val) do {                       \
     unsigned long __val = val;                              \
diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index bde7588342..bc312343cd 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -32,15 +32,15 @@ gfn_to_paddr(gfn_t gfn)
 
 /* Mask covering the reserved bits from superpage alignment. */
 #define SUPERPAGE_RSVD(bit)                                             \
-    (((1ul << (bit)) - 1) & ~(_PAGE_PSE_PAT | (_PAGE_PSE_PAT - 1ul)))
+    (((1UL << (bit)) - 1) & ~(_PAGE_PSE_PAT | (_PAGE_PSE_PAT - 1UL)))
 
 static inline uint32_t fold_pse36(uint64_t val)
 {
-    return (val & ~(0x1fful << 13)) | ((val & (0x1fful << 32)) >> (32 - 13));
+    return (val & ~(0x1ffUL << 13)) | ((val & (0x1ffUL << 32)) >> (32 - 13));
 }
 static inline uint64_t unfold_pse36(uint32_t val)
 {
-    return (val & ~(0x1fful << 13)) | ((val & (0x1fful << 13)) << (32 - 13));
+    return (val & ~(0x1ffUL << 13)) | ((val & (0x1ffUL << 13)) << (32 - 13));
 }
 
 /* Types of the guest's page tables and access functions for them */
@@ -99,10 +99,10 @@ static inline guest_l2e_t guest_l2e_from_gfn(gfn_t gfn, u32 flags)
 #define GUEST_L2_PAGETABLE_SHIFT         21
 #define GUEST_L3_PAGETABLE_SHIFT         30
 
-#define GUEST_L1_PAGETABLE_RSVD            0x7ff0000000000000ul
-#define GUEST_L2_PAGETABLE_RSVD            0x7ff0000000000000ul
+#define GUEST_L1_PAGETABLE_RSVD            0x7ff0000000000000UL
+#define GUEST_L2_PAGETABLE_RSVD            0x7ff0000000000000UL
 #define GUEST_L3_PAGETABLE_RSVD                                      \
-    (0xfff0000000000000ul | _PAGE_GLOBAL | _PAGE_PSE | _PAGE_DIRTY | \
+    (0xfff0000000000000UL | _PAGE_GLOBAL | _PAGE_PSE | _PAGE_DIRTY | \
      _PAGE_ACCESSED | _PAGE_USER | _PAGE_RW)
 
 #else /* GUEST_PAGING_LEVELS == 4 */
@@ -281,7 +281,7 @@ static always_inline bool guest_pks_enabled(const struct vcpu *v)
 static always_inline uint64_t guest_rsvd_bits(const struct vcpu *v)
 {
     return ((PADDR_MASK &
-             ~((1ul << v->domain->arch.cpuid->extd.maxphysaddr) - 1)) |
+             ~((1UL << v->domain->arch.cpuid->extd.maxphysaddr) - 1)) |
             (guest_nx_enabled(v) ? 0 : put_pte_flags(_PAGE_NX_BIT)));
 }
 
@@ -301,7 +301,7 @@ static always_inline bool guest_l2e_rsvd_bits(const struct vcpu *v,
             ((l2e.l2 & _PAGE_PSE) &&
              (l2e.l2 & ((GUEST_PAGING_LEVELS == 2 && guest_can_use_pse36(v->domain))
                           /* PSE36 tops out at 40 bits of address width. */
-                        ? (fold_pse36(rsvd_bits | (1ul << 40)))
+                        ? (fold_pse36(rsvd_bits | (1UL << 40)))
                         : SUPERPAGE_RSVD(GUEST_L2_PAGETABLE_SHIFT)))));
 }
 
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index db7a40f68e..75a6b9e5c7 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -93,7 +93,7 @@ static inline int pv_vcpu_initialise(struct vcpu *v) { return -EOPNOTSUPP; }
 static inline void pv_domain_destroy(struct domain *d) {}
 static inline int pv_domain_initialise(struct domain *d) { return -EOPNOTSUPP; }
 
-static inline unsigned long pv_make_cr4(const struct vcpu *v) { return ~0ul; }
+static inline unsigned long pv_make_cr4(const struct vcpu *v) { return ~0UL; }
 
 static inline uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
 {
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index be2b10a391..ad0eafc900 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3057,10 +3057,10 @@ static int _get_page_type(struct page_info *page, unsigned long type,
 
             if ( (x & PGT_type_mask) == PGT_writable_page )
                 rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)),
-                                        1ul << PAGE_ORDER_4K);
+                                        1UL << PAGE_ORDER_4K);
             else
                 rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn,
-                                      1ul << PAGE_ORDER_4K,
+                                      1UL << PAGE_ORDER_4K,
                                       IOMMUF_readable | IOMMUF_writable);
 
             if ( unlikely(rc) )
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ecf126566d..ef55498c1a 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -431,7 +431,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     {
         bool old_cpuid_faulting = msrs->misc_features_enables.cpuid_faulting;
 
-        rsvd = ~0ull;
+        rsvd = ~0ULL;
         if ( cp->platform_info.cpuid_faulting )
             rsvd &= ~MSR_MISC_FEATURES_CPUID_FAULTING;
 
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 7656023748..c5c28300b0 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -205,7 +205,7 @@ void __init check_nmi_watchdog(void)
      * (Intel SDM, section 18.22.2)
      */
     if ( nmi_watchdog == NMI_LOCAL_APIC )
-        nmi_hz = max(1ul, cpu_khz >> 20);
+        nmi_hz = max(1UL, cpu_khz >> 20);
 
     return;
 }
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 90bcb25e60..4c01813c4b 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -289,7 +289,7 @@ static bool cf_check cat_check_cbm(const struct feat_node *feat, uint32_t *val)
     unsigned long cbm = *val;
 
     /* Set bits should only in the range of [0, cbm_len). */
-    if ( cbm & (~0ul << cbm_len) )
+    if ( cbm & (~0UL << cbm_len) )
         return false;
 
     /* At least one bit need to be set. */
@@ -360,7 +360,7 @@ static bool cat_init_feature(const struct cpuid_leaf *regs,
         wrmsrl(MSR_IA32_PSR_L3_MASK(1), cat_default_val(feat->cat.cbm_len));
         rdmsrl(MSR_IA32_PSR_L3_QOS_CFG, val);
         wrmsrl(MSR_IA32_PSR_L3_QOS_CFG,
-               val | (1ull << PSR_L3_QOS_CDP_ENABLE_BIT));
+               val | (1ULL << PSR_L3_QOS_CDP_ENABLE_BIT));
 
         break;
     }
@@ -636,7 +636,7 @@ static void __init init_psr_cmt(unsigned int rmid_max)
 
     psr_cmt->features = edx;
     psr_cmt->rmid_max = min(rmid_max, ebx);
-    rmid_mask = ~(~0ull << get_count_order(ebx));
+    rmid_mask = ~(~0ULL << get_count_order(ebx));
 
     if ( psr_cmt->features & PSR_RESOURCE_TYPE_L3 )
     {
@@ -738,7 +738,7 @@ static void psr_assoc_init(void)
         unsigned int cos_max = get_max_cos_max(info);
 
         if ( info->feat_init )
-            psra->cos_mask = ((1ull << get_count_order(cos_max)) - 1) <<
+            psra->cos_mask = ((1ULL << get_count_order(cos_max)) - 1) <<
                              ASSOC_REG_SHIFT;
     }
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 4081cef200..bc50173620 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1047,7 +1047,7 @@ static __init void l1tf_calculations(void)
      * The address mask which the L1D cache uses, which might be wider than
      * the CPUID-reported maxphysaddr.
      */
-    l1tf_addr_mask = ((1ul << l1d_maxphysaddr) - 1) & PAGE_MASK;
+    l1tf_addr_mask = ((1UL << l1d_maxphysaddr) - 1) & PAGE_MASK;
 
     /*
      * To be safe, l1tf_safe_maddr must be above the highest cacheable entity
@@ -1087,8 +1087,8 @@ static __init void l1tf_calculations(void)
      *   information is in terms of guest physical layout.
      */
     l1tf_safe_maddr = max(l1tf_safe_maddr, ((l1d_maxphysaddr > paddr_bits)
-                                            ? (1ul << paddr_bits)
-                                            : (3ul << (paddr_bits - 2))));
+                                            ? (1UL << paddr_bits)
+                                            : (3UL << (paddr_bits - 2))));
 }
 
 /* Calculate whether this CPU is vulnerable to MDS. */
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 60db439af3..15b36e332d 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1313,7 +1313,7 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
     {
         for ( i = spfn; i < epfn; i++ )
             if ( iommu_legacy_map(hardware_domain, _dfn(i), _mfn(i),
-                                  1ul << PAGE_ORDER_4K,
+                                  1UL << PAGE_ORDER_4K,
                                   IOMMUF_readable | IOMMUF_writable) )
                 break;
         if ( i != epfn )
@@ -1321,7 +1321,7 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
             while (i-- > old_max)
                 /* If statement to satisfy __must_check. */
                 if ( iommu_legacy_unmap(hardware_domain, _dfn(i),
-                                        1ul << PAGE_ORDER_4K) )
+                                        1UL << PAGE_ORDER_4K) )
                     continue;
 
             goto destroy_m2p;
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 92496f3795..3062c28219 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -150,7 +150,7 @@ static void setup_xstate_comp(uint16_t *comp_offsets,
     offset = comp_offsets[2];
     for ( i = 2; i < xstate_features; i++ )
     {
-        if ( (1ul << i) & xcomp_bv )
+        if ( (1UL << i) & xcomp_bv )
         {
             if ( test_bit(i, &xstate_align) )
                 offset = ROUNDUP(offset, 64);
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 07e5501914..2006cbaa1c 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -211,7 +211,7 @@ void x86_cpu_policy_fill_native(struct cpu_policy *p)
         for ( i = 2; i < min_t(unsigned int, 63,
                                ARRAY_SIZE(p->xstate.raw)); ++i )
         {
-            if ( xstates & (1ull << i) )
+            if ( xstates & (1ULL << i) )
                 cpuid_count_leaf(0xd, i, &p->xstate.raw[i]);
         }
     }
@@ -419,7 +419,7 @@ int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
               &(struct cpuid_leaf){ p->hv2_limit });
 
     /* Extended leaves. */
-    for ( leaf = 0; leaf <= MIN(p->extd.max_leaf & 0xfffful,
+    for ( leaf = 0; leaf <= MIN(p->extd.max_leaf & 0xffffUL,
                                 ARRAY_SIZE(p->extd.raw) - 1); ++leaf )
         COPY_LEAF(0x80000000 | leaf, XEN_CPUID_NO_SUBLEAF, &p->extd.raw[leaf]);
 
-- 
2.34.1


