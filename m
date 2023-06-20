Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70363736A30
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551549.861196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ74-0000ni-P8; Tue, 20 Jun 2023 11:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551549.861196; Tue, 20 Jun 2023 11:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ74-0000Z6-CS; Tue, 20 Jun 2023 11:01:30 +0000
Received: by outflank-mailman (input) for mailman id 551549;
 Tue, 20 Jun 2023 10:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBYhv-0004Pq-MY
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:35:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2de375c1-0f56-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 12:35:30 +0200 (CEST)
Received: from beta.bugseng.com (93-40-74-174.ip37.fastwebnet.it
 [93.40.74.174])
 by support.bugseng.com (Postfix) with ESMTPSA id 694CC4EE0758;
 Tue, 20 Jun 2023 12:35:28 +0200 (CEST)
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
X-Inumbo-ID: 2de375c1-0f56-11ee-b234-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 07/13] xen/x86: fixed violations of MISRA C:2012 Rule 7.2
Date: Tue, 20 Jun 2023 12:34:59 +0200
Message-Id: <6c440188b0bdb58dc3e925788956b3d301d5a18b.1687250177.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
"A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".

I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/cpu/vpmu_intel.c           |  4 ++--
 xen/arch/x86/hvm/vmx/vmcs.c             |  6 ++---
 xen/arch/x86/hvm/vmx/vvmx.c             | 12 +++++-----
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  6 ++---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 32 ++++++++++++-------------
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 35e350578b..7a0ff76d8e 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -950,10 +950,10 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
        fixed_ctrl_mask |=
            (FIXED_CTR_CTRL_ANYTHREAD_MASK << (FIXED_CTR_CTRL_BITS * i));
 
-    fixed_counters_mask = ~((1ull << core2_get_bitwidth_fix_count()) - 1);
+    fixed_counters_mask = ~((1Ull << core2_get_bitwidth_fix_count()) - 1);
     global_ctrl_mask = ~((((1ULL << fixed_pmc_cnt) - 1) << 32) |
                          ((1ULL << arch_pmc_cnt) - 1));
-    global_ovf_ctrl_mask = ~(0xC000000000000000 |
+    global_ovf_ctrl_mask = ~(0xC000000000000000U |
                              (((1ULL << fixed_pmc_cnt) - 1) << 32) |
                              ((1ULL << arch_pmc_cnt) - 1));
     if ( version > 2 )
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index b209563625..d5a2b847a9 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -911,7 +911,7 @@ void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
         if ( type & VMX_MSR_W )
             clear_bit(msr, msr_bitmap->write_low);
     }
-    else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
+    else if ( (msr >= 0xc0000000U) && (msr <= 0xc0001fffU) )
     {
         msr &= 0x1fff;
         if ( type & VMX_MSR_R )
@@ -939,7 +939,7 @@ void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
         if ( type & VMX_MSR_W )
             set_bit(msr, msr_bitmap->write_low);
     }
-    else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
+    else if ( (msr >= 0xc0000000U) && (msr <= 0xc0001fffU) )
     {
         msr &= 0x1fff;
         if ( type & VMX_MSR_R )
@@ -957,7 +957,7 @@ bool vmx_msr_is_intercepted(struct vmx_msr_bitmap *msr_bitmap,
     if ( msr <= 0x1fff )
         return test_bit(msr, is_write ? msr_bitmap->write_low
                                       : msr_bitmap->read_low);
-    else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
+    else if ( (msr >= 0xc0000000U) && (msr <= 0xc0001fffU) )
         return test_bit(msr & 0x1fff, is_write ? msr_bitmap->write_high
                                                : msr_bitmap->read_high);
     else
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 1034534c97..f59de0f124 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -257,14 +257,14 @@ uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)
 
     switch ( enc.width ) {
     case VVMCS_WIDTH_16:
-        res &= 0xffff;
+        res &= 0xffffU;
         break;
    case VVMCS_WIDTH_64:
         if ( enc.access_type )
             res >>= 32;
         break;
     case VVMCS_WIDTH_32:
-        res &= 0xffffffff;
+        res &= 0xffffffffU;
         break;
     case VVMCS_WIDTH_NATURAL:
     default:
@@ -311,19 +311,19 @@ void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t val)
 
     switch ( enc.width ) {
     case VVMCS_WIDTH_16:
-        res = val & 0xffff;
+        res = val & 0xffffU;
         break;
     case VVMCS_WIDTH_64:
         if ( enc.access_type )
         {
-            res &= 0xffffffff;
+            res &= 0xffffffffU;
             res |= val << 32;
         }
         else
             res = val;
         break;
     case VVMCS_WIDTH_32:
-        res = val & 0xffffffff;
+        res = val & 0xffffffffU;
         break;
     case VVMCS_WIDTH_NATURAL:
     default:
@@ -2307,7 +2307,7 @@ int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
         break;
     case MSR_IA32_VMX_CR0_FIXED1:
         /* allow 0-settings for all bits */
-        data = 0xffffffff;
+        data = 0xffffffffU;
         break;
     case MSR_IA32_VMX_CR4_FIXED0:
         /* VMXE bit must be 1 in VMX operation */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index d07fcb2bc9..4acf3970f5 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -207,7 +207,7 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define CPU_BASED_ACTIVATE_MSR_BITMAP         0x10000000
 #define CPU_BASED_MONITOR_EXITING             0x20000000
 #define CPU_BASED_PAUSE_EXITING               0x40000000
-#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
+#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U
 extern u32 vmx_cpu_based_exec_control;
 
 #define PIN_BASED_EXT_INTR_MASK         0x00000001
@@ -257,7 +257,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_XSAVES                   0x00100000
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
 #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
-#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
+#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
 extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -346,7 +346,7 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_notify_vm_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
 
-#define VMCS_RID_TYPE_MASK              0x80000000
+#define VMCS_RID_TYPE_MASK              0x80000000U
 
 /* GUEST_INTERRUPTIBILITY_INFO flags. */
 #define VMX_INTR_SHADOW_STI             0x00000001
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 36c108d879..b0a834d327 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -136,7 +136,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 /*
  * Exit Reasons
  */
-#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
+#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000U
 #define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)
 
 #define EXIT_REASON_EXCEPTION_NMI       0
@@ -208,17 +208,17 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
  * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
  * field for EPT violations, PML full and SPP-related event vmexits.
  */
-#define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
-#define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
-#define INTR_INFO_DELIVER_CODE_MASK     0x800           /* 11 */
-#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000          /* 12 */
-#define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
-#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
+#define INTR_INFO_VECTOR_MASK           0xffU            /* 7:0 */
+#define INTR_INFO_INTR_TYPE_MASK        0x700U           /* 10:8 */
+#define INTR_INFO_DELIVER_CODE_MASK     0x800U           /* 11 */
+#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000           /* 12 */
+#define INTR_INFO_VALID_MASK            0x80000000U      /* 31 */
+#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000U
 
 /*
  * Exit Qualifications for NOTIFY VM EXIT
  */
-#define NOTIFY_VM_CONTEXT_INVALID       1u
+#define NOTIFY_VM_CONTEXT_INVALID       1U
 
 /*
  * Exit Qualifications for MOV for Control Register Access
@@ -247,14 +247,14 @@ typedef union cr_access_qual {
  * Access Rights
  */
 #define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
-#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
+#define X86_SEG_AR_DESC_TYPE    (1U << 4)  /* 4, descriptor type */
 #define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege level */
-#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
-#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system software */
-#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS only) */
-#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation size */
-#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
-#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
+#define X86_SEG_AR_SEG_PRESENT  (1U << 7)  /* 7, segment present */
+#define X86_SEG_AR_AVL          (1U << 12) /* 12, available for system software */
+#define X86_SEG_AR_CS_LM_ACTIVE (1U << 13) /* 13, long mode active (CS only) */
+#define X86_SEG_AR_DEF_OP_SIZE  (1U << 14) /* 14, default operation size */
+#define X86_SEG_AR_GRANULARITY  (1U << 15) /* 15, granularity */
+#define X86_SEG_AR_SEG_UNUSABLE (1U << 16) /* 16, segment unusable */
 
 #define VMCALL_OPCODE   ".byte 0x0f,0x01,0xc1\n"
 #define VMCLEAR_OPCODE  ".byte 0x66,0x0f,0xc7\n"        /* reg/opcode: /6 */
@@ -606,7 +606,7 @@ static inline void vmx_pi_hooks_assign(struct domain *d) {}
 static inline void vmx_pi_hooks_deassign(struct domain *d) {}
 #endif
 
-#define APIC_INVALID_DEST           0xffffffff
+#define APIC_INVALID_DEST           0xffffffffU
 
 /* EPT violation qualifications definitions */
 typedef union ept_qual {
-- 
2.41.0


