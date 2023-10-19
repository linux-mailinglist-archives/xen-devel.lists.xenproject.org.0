Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915777CFA91
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 15:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619314.964182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSpA-0002O5-Rq; Thu, 19 Oct 2023 13:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619314.964182; Thu, 19 Oct 2023 13:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSpA-0002Kq-P8; Thu, 19 Oct 2023 13:12:28 +0000
Received: by outflank-mailman (input) for mailman id 619314;
 Thu, 19 Oct 2023 13:12:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=in48=GB=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qtSp9-0002Kc-8A
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 13:12:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25a21502-6e81-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 15:12:25 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 150304EE0741;
 Thu, 19 Oct 2023 15:12:25 +0200 (CEST)
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
X-Inumbo-ID: 25a21502-6e81-11ee-98d5-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v8 1/3] x86/vmx: address violations of MISRA C:2012 Rule 7.2
Date: Thu, 19 Oct 2023 15:11:50 +0200
Message-Id: <f060ac3b471528717550edb087a4ef85ca9a2e2b.1697720584.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697720584.git.simone.ballarin@bugseng.com>
References: <cover.1697720584.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

For the sake of uniformity, the following changes are made:
- add the 'U' suffix to macros near
  'CPU_BASED_ACTIVATE_SECONDARY_CONTROLS' and
  'SECONDARY_EXEC_NOTIFY_VM_EXITING' macros in 'vmcs.h'
- add the 'U' suffix to macros near 'INTR_INFO_VALID_MASK'
  macro in 'vmx.h'

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
No changes in v5, v6, v7 and v8.
Changes in v4:
- change commit headline

Changes in v3:
- change 'Signed-off-by' ordering
- change commit message
- remove unnecessary changes in 'vvmx.c'
- add 'uint32_t' casts in 'vvmx.c'
- add missing 'U' in 'vmcs.h' macros
- change macro to '(1u << 31)' in 'vmx.h'
- remove unnecessary changes to 'vmx.h'

Changes in v2:
- minor change to commit title
- change commit message
- remove unnecessary changes in 'vpmu_intel.c' and 'vmx.h'
- add 'ULL' suffix in 'vpmu_intel.c'
- add zero-padding to constants in 'vmx.h'
- add missing 'U' in 'vmx.h'
---
 xen/arch/x86/cpu/vpmu_intel.c           |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |  6 +-
 xen/arch/x86/hvm/vmx/vvmx.c             |  8 +--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 84 ++++++++++++-------------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 16 ++---
 5 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index fa5b40c65c..6330c89b47 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -945,7 +945,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
     fixed_counters_mask = ~((1ull << core2_get_bitwidth_fix_count()) - 1);
     global_ctrl_mask = ~((((1ULL << fixed_pmc_cnt) - 1) << 32) |
                          ((1ULL << arch_pmc_cnt) - 1));
-    global_ovf_ctrl_mask = ~(0xC000000000000000 |
+    global_ovf_ctrl_mask = ~(0xC000000000000000ULL |
                              (((1ULL << fixed_pmc_cnt) - 1) << 32) |
                              ((1ULL << arch_pmc_cnt) - 1));
     if ( version > 2 )
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 13719cc923..6cefb88aec 100644
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
index 16b0ef82b6..b7be424afb 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -263,7 +263,7 @@ uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)
             res >>= 32;
         break;
     case VVMCS_WIDTH_32:
-        res &= 0xffffffff;
+        res = (uint32_t)res;
         break;
     case VVMCS_WIDTH_NATURAL:
     default:
@@ -315,14 +315,14 @@ void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t val)
     case VVMCS_WIDTH_64:
         if ( enc.access_type )
         {
-            res &= 0xffffffff;
+            res = (uint32_t)res;
             res |= val << 32;
         }
         else
             res = val;
         break;
     case VVMCS_WIDTH_32:
-        res = val & 0xffffffff;
+        res = (uint32_t)val;
         break;
     case VVMCS_WIDTH_NATURAL:
     default:
@@ -2306,7 +2306,7 @@ int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
         break;
     case MSR_IA32_VMX_CR0_FIXED1:
         /* allow 0-settings for all bits */
-        data = 0xffffffff;
+        data = 0xffffffffU;
         break;
     case MSR_IA32_VMX_CR4_FIXED0:
         /* VMXE bit must be 1 in VMX operation */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index d07fcb2bc9..e056643993 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -187,27 +187,27 @@ bool_t __must_check vmx_vmcs_try_enter(struct vcpu *v);
 void vmx_vmcs_exit(struct vcpu *v);
 void vmx_vmcs_reload(struct vcpu *v);
 
-#define CPU_BASED_VIRTUAL_INTR_PENDING        0x00000004
-#define CPU_BASED_USE_TSC_OFFSETING           0x00000008
-#define CPU_BASED_HLT_EXITING                 0x00000080
-#define CPU_BASED_INVLPG_EXITING              0x00000200
-#define CPU_BASED_MWAIT_EXITING               0x00000400
-#define CPU_BASED_RDPMC_EXITING               0x00000800
-#define CPU_BASED_RDTSC_EXITING               0x00001000
-#define CPU_BASED_CR3_LOAD_EXITING            0x00008000
-#define CPU_BASED_CR3_STORE_EXITING           0x00010000
-#define CPU_BASED_CR8_LOAD_EXITING            0x00080000
-#define CPU_BASED_CR8_STORE_EXITING           0x00100000
-#define CPU_BASED_TPR_SHADOW                  0x00200000
-#define CPU_BASED_VIRTUAL_NMI_PENDING         0x00400000
-#define CPU_BASED_MOV_DR_EXITING              0x00800000
-#define CPU_BASED_UNCOND_IO_EXITING           0x01000000
-#define CPU_BASED_ACTIVATE_IO_BITMAP          0x02000000
-#define CPU_BASED_MONITOR_TRAP_FLAG           0x08000000
-#define CPU_BASED_ACTIVATE_MSR_BITMAP         0x10000000
-#define CPU_BASED_MONITOR_EXITING             0x20000000
-#define CPU_BASED_PAUSE_EXITING               0x40000000
-#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
+#define CPU_BASED_VIRTUAL_INTR_PENDING        0x00000004U
+#define CPU_BASED_USE_TSC_OFFSETING           0x00000008U
+#define CPU_BASED_HLT_EXITING                 0x00000080U
+#define CPU_BASED_INVLPG_EXITING              0x00000200U
+#define CPU_BASED_MWAIT_EXITING               0x00000400U
+#define CPU_BASED_RDPMC_EXITING               0x00000800U
+#define CPU_BASED_RDTSC_EXITING               0x00001000U
+#define CPU_BASED_CR3_LOAD_EXITING            0x00008000U
+#define CPU_BASED_CR3_STORE_EXITING           0x00010000U
+#define CPU_BASED_CR8_LOAD_EXITING            0x00080000U
+#define CPU_BASED_CR8_STORE_EXITING           0x00100000U
+#define CPU_BASED_TPR_SHADOW                  0x00200000U
+#define CPU_BASED_VIRTUAL_NMI_PENDING         0x00400000U
+#define CPU_BASED_MOV_DR_EXITING              0x00800000U
+#define CPU_BASED_UNCOND_IO_EXITING           0x01000000U
+#define CPU_BASED_ACTIVATE_IO_BITMAP          0x02000000U
+#define CPU_BASED_MONITOR_TRAP_FLAG           0x08000000U
+#define CPU_BASED_ACTIVATE_MSR_BITMAP         0x10000000U
+#define CPU_BASED_MONITOR_EXITING             0x20000000U
+#define CPU_BASED_PAUSE_EXITING               0x40000000U
+#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U
 extern u32 vmx_cpu_based_exec_control;
 
 #define PIN_BASED_EXT_INTR_MASK         0x00000001
@@ -238,26 +238,26 @@ extern u32 vmx_vmexit_control;
 #define VM_ENTRY_LOAD_BNDCFGS           0x00010000
 extern u32 vmx_vmentry_control;
 
-#define SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES 0x00000001
-#define SECONDARY_EXEC_ENABLE_EPT               0x00000002
-#define SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING 0x00000004
-#define SECONDARY_EXEC_ENABLE_RDTSCP            0x00000008
-#define SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE   0x00000010
-#define SECONDARY_EXEC_ENABLE_VPID              0x00000020
-#define SECONDARY_EXEC_WBINVD_EXITING           0x00000040
-#define SECONDARY_EXEC_UNRESTRICTED_GUEST       0x00000080
-#define SECONDARY_EXEC_APIC_REGISTER_VIRT       0x00000100
-#define SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY    0x00000200
-#define SECONDARY_EXEC_PAUSE_LOOP_EXITING       0x00000400
-#define SECONDARY_EXEC_ENABLE_INVPCID           0x00001000
-#define SECONDARY_EXEC_ENABLE_VM_FUNCTIONS      0x00002000
-#define SECONDARY_EXEC_ENABLE_VMCS_SHADOWING    0x00004000
-#define SECONDARY_EXEC_ENABLE_PML               0x00020000
-#define SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS   0x00040000
-#define SECONDARY_EXEC_XSAVES                   0x00100000
-#define SECONDARY_EXEC_TSC_SCALING              0x02000000
-#define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
-#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
+#define SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES 0x00000001U
+#define SECONDARY_EXEC_ENABLE_EPT               0x00000002U
+#define SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING 0x00000004U
+#define SECONDARY_EXEC_ENABLE_RDTSCP            0x00000008U
+#define SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE   0x00000010U
+#define SECONDARY_EXEC_ENABLE_VPID              0x00000020U
+#define SECONDARY_EXEC_WBINVD_EXITING           0x00000040U
+#define SECONDARY_EXEC_UNRESTRICTED_GUEST       0x00000080U
+#define SECONDARY_EXEC_APIC_REGISTER_VIRT       0x00000100U
+#define SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY    0x00000200U
+#define SECONDARY_EXEC_PAUSE_LOOP_EXITING       0x00000400U
+#define SECONDARY_EXEC_ENABLE_INVPCID           0x00001000U
+#define SECONDARY_EXEC_ENABLE_VM_FUNCTIONS      0x00002000U
+#define SECONDARY_EXEC_ENABLE_VMCS_SHADOWING    0x00004000U
+#define SECONDARY_EXEC_ENABLE_PML               0x00020000U
+#define SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS   0x00040000U
+#define SECONDARY_EXEC_XSAVES                   0x00100000U
+#define SECONDARY_EXEC_TSC_SCALING              0x02000000U
+#define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000U
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
index c84acc221d..d4b335a2bc 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -137,7 +137,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 /*
  * Exit Reasons
  */
-#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
+#define VMX_EXIT_REASONS_FAILED_VMENTRY (1u << 31)
 #define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)
 
 #define EXIT_REASON_EXCEPTION_NMI       0
@@ -209,12 +209,12 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
  * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
  * field for EPT violations, PML full and SPP-related event vmexits.
  */
-#define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
-#define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
-#define INTR_INFO_DELIVER_CODE_MASK     0x800           /* 11 */
-#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000          /* 12 */
-#define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
-#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
+#define INTR_INFO_VECTOR_MASK           0x000000ffU     /* 7:0 */
+#define INTR_INFO_INTR_TYPE_MASK        0x00000700U     /* 10:8 */
+#define INTR_INFO_DELIVER_CODE_MASK     0x00000800U     /* 11 */
+#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x00001000U     /* 12 */
+#define INTR_INFO_VALID_MASK            0x80000000U     /* 31 */
+#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000U
 
 /*
  * Exit Qualifications for NOTIFY VM EXIT
@@ -607,7 +607,7 @@ static inline void vmx_pi_hooks_assign(struct domain *d) {}
 static inline void vmx_pi_hooks_deassign(struct domain *d) {}
 #endif
 
-#define APIC_INVALID_DEST           0xffffffff
+#define APIC_INVALID_DEST           0xffffffffU
 
 /* EPT violation qualifications definitions */
 typedef union ept_qual {
-- 
2.34.1


