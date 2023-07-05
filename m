Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BC7487FB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559313.874263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pc-0003Qj-V9; Wed, 05 Jul 2023 15:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559313.874263; Wed, 05 Jul 2023 15:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pc-0003KV-Nh; Wed, 05 Jul 2023 15:27:24 +0000
Received: by outflank-mailman (input) for mailman id 559313;
 Wed, 05 Jul 2023 15:27:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yX3c=CX=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qH4Pa-0001jW-OY
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:27:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ef988ec-1b48-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 17:27:21 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.248.64])
 by support.bugseng.com (Postfix) with ESMTPSA id C4E454EE073E;
 Wed,  5 Jul 2023 17:27:19 +0200 (CEST)
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
X-Inumbo-ID: 6ef988ec-1b48-11ee-8611-37d641c3527e
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
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v2 07/13] x86/vmx: fix violations of MISRA C:2012 Rule 7.2
Date: Wed,  5 Jul 2023 17:26:29 +0200
Message-Id: <f30ef7c2cda2516d9ef07bb79e5da5513cd90c6c.1688559115.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688559115.git.gianluca.luparini@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
---
Changes in v2:
- minor change to commit title
- change commit message
- remove unnecessary changes in 'vpmu_intel.c' and 'vmx.h'
- add 'ULL' suffix in 'vpmu_intel.c'
- add zero-padding to constants in 'vmx.h'
- add missing 'U' in 'vmx.h'
---
 xen/arch/x86/cpu/vpmu_intel.c           |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |  6 ++---
 xen/arch/x86/hvm/vmx/vvmx.c             | 12 ++++-----
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  6 ++---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 34 ++++++++++++-------------
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index bda5d511ac..890c279310 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -946,7 +946,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
     fixed_counters_mask = ~((1ull << core2_get_bitwidth_fix_count()) - 1);
     global_ctrl_mask = ~((((1ULL << fixed_pmc_cnt) - 1) << 32) |
                          ((1ULL << arch_pmc_cnt) - 1));
-    global_ovf_ctrl_mask = ~(0xC000000000000000 |
+    global_ovf_ctrl_mask = ~(0xC000000000000000ULL |
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
index 36c108d879..6642688e1d 100644
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
@@ -208,12 +208,12 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
  * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
  * field for EPT violations, PML full and SPP-related event vmexits.
  */
-#define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
-#define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
-#define INTR_INFO_DELIVER_CODE_MASK     0x800           /* 11 */
-#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000          /* 12 */
-#define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
-#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
+#define INTR_INFO_VECTOR_MASK           0x000000ffU      /* 7:0 */
+#define INTR_INFO_INTR_TYPE_MASK        0x00000700U      /* 10:8 */
+#define INTR_INFO_DELIVER_CODE_MASK     0x00000800U      /* 11 */
+#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x00001000U      /* 12 */
+#define INTR_INFO_VALID_MASK            0x80000000U      /* 31 */
+#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000U
 
 /*
  * Exit Qualifications for NOTIFY VM EXIT
@@ -246,15 +246,15 @@ typedef union cr_access_qual {
 /*
  * Access Rights
  */
-#define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
-#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
-#define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege level */
-#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
-#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system software */
-#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS only) */
-#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation size */
-#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
-#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
+#define X86_SEG_AR_SEG_TYPE     0xfU       /* 3:0, segment type */
+#define X86_SEG_AR_DESC_TYPE    (1U << 4)  /* 4, descriptor type */
+#define X86_SEG_AR_DPL          0x60U      /* 6:5, descriptor privilege level */
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


