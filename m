Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFDD7CFA94
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 15:13:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619315.964192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSpC-0002bz-3L; Thu, 19 Oct 2023 13:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619315.964192; Thu, 19 Oct 2023 13:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSpC-0002Ze-0B; Thu, 19 Oct 2023 13:12:30 +0000
Received: by outflank-mailman (input) for mailman id 619315;
 Thu, 19 Oct 2023 13:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=in48=GB=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qtSp9-0002Kc-SV
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 13:12:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25f26cc1-6e81-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 15:12:26 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id A0DF54EE0745;
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
X-Inumbo-ID: 25f26cc1-6e81-11ee-98d5-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Gianluca Luparini <gianluca.luparini@bugseng.com>
Subject: [XEN PATCH v8 2/3] x86/hvm: address violations of MISRA C:2012 Rule 7.2
Date: Thu, 19 Oct 2023 15:11:51 +0200
Message-Id: <e7b653d28632c8e198647e67d17c31d018f90d00.1697720584.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697720584.git.simone.ballarin@bugseng.com>
References: <cover.1697720584.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

For the sake of uniformity, the following change is made:
- add 'U' suffixes to 'mask16' in 'stdvga.c'

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v8:
- add U suffixes to macro MSR_AMD64_BP_CFG that has been
  introduced rebasing the patch
Changes in v7:
- add Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
- switch order of Signed-off-by tags
Changes in v6:
- new patch obtained by splitting HVM related changes from
"xen/x86: address violations of MISRA C:2012 Rule 7.2 (v5)"
- fix inadvertent changes to "sr_mask"
---
 xen/arch/x86/hvm/hypercall.c           |   2 +-
 xen/arch/x86/hvm/pmtimer.c             |   4 +-
 xen/arch/x86/hvm/stdvga.c              |  32 ++---
 xen/arch/x86/hvm/vlapic.c              |   6 +-
 xen/arch/x86/include/asm/apicdef.h     |   2 +-
 xen/arch/x86/include/asm/config.h      |   2 +-
 xen/arch/x86/include/asm/hpet.h        |   2 +-
 xen/arch/x86/include/asm/hvm/trace.h   |   4 +-
 xen/arch/x86/include/asm/hvm/vioapic.h |   2 +-
 xen/arch/x86/include/asm/msi.h         |   2 +-
 xen/arch/x86/include/asm/msr-index.h   | 184 ++++++++++++-------------
 xen/arch/x86/include/asm/pci.h         |   8 +-
 xen/arch/x86/include/asm/x86-defns.h   |  22 +--
 13 files changed, 136 insertions(+), 136 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 20d266ffd5..eeb73e1aa5 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -129,7 +129,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         break;
     }
 
-    if ( (eax & 0x80000000) && is_viridian_domain(currd) )
+    if ( (eax & 0x80000000U) && is_viridian_domain(currd) )
     {
         int ret;
 
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 2145c531b6..eb4a455763 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -40,8 +40,8 @@
 #define SCI_IRQ 9
 
 /* We provide a 32-bit counter (must match the TMR_VAL_EXT bit in the FADT) */
-#define TMR_VAL_MASK  (0xffffffff)
-#define TMR_VAL_MSB   (0x80000000)
+#define TMR_VAL_MASK  (0xffffffffU)
+#define TMR_VAL_MSB   (0x80000000U)
 
 /* Dispatch SCIs based on the PM1a_STS and PM1a_EN registers */
 static void pmt_update_sci(PMTState *s)
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index 2586891863..8da07ff8a2 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -39,22 +39,22 @@
 
 #define PAT(x) (x)
 static const uint32_t mask16[16] = {
-    PAT(0x00000000),
-    PAT(0x000000ff),
-    PAT(0x0000ff00),
-    PAT(0x0000ffff),
-    PAT(0x00ff0000),
-    PAT(0x00ff00ff),
-    PAT(0x00ffff00),
-    PAT(0x00ffffff),
-    PAT(0xff000000),
-    PAT(0xff0000ff),
-    PAT(0xff00ff00),
-    PAT(0xff00ffff),
-    PAT(0xffff0000),
-    PAT(0xffff00ff),
-    PAT(0xffffff00),
-    PAT(0xffffffff),
+    PAT(0x00000000U),
+    PAT(0x000000ffU),
+    PAT(0x0000ff00U),
+    PAT(0x0000ffffU),
+    PAT(0x00ff0000U),
+    PAT(0x00ff00ffU),
+    PAT(0x00ffff00U),
+    PAT(0x00ffffffU),
+    PAT(0xff000000U),
+    PAT(0xff0000ffU),
+    PAT(0xff00ff00U),
+    PAT(0xff00ffffU),
+    PAT(0xffff0000U),
+    PAT(0xffff00ffU),
+    PAT(0xffffff00U),
+    PAT(0xffffffffU),
 };
 
 /* force some bits to zero */
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index c7ce82d064..a8e87c4446 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -237,7 +237,7 @@ bool_t vlapic_match_dest(
     case APIC_DEST_NOSHORT:
         if ( dest_mode )
             return vlapic_match_logical_addr(target, dest);
-        return (dest == _VLAPIC_ID(target, 0xffffffff)) ||
+        return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
                (dest == VLAPIC_ID(target));
 
     case APIC_DEST_SELF:
@@ -467,7 +467,7 @@ static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
         return short_hand != APIC_DEST_SELF;
 
     if ( vlapic_x2apic_mode(vlapic) )
-        return dest_mode ? hweight16(dest) > 1 : dest == 0xffffffff;
+        return dest_mode ? hweight16(dest) > 1 : dest == 0xffffffffU;
 
     if ( dest_mode )
         return hweight8(dest &
@@ -831,7 +831,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
         break;
 
     case APIC_ICR2:
-        vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000);
+        vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000U);
         break;
 
     case APIC_LVTT:         /* LVT Timer Reg */
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
index a261436993..8d1b0087d4 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -8,7 +8,7 @@
  * Ingo Molnar <mingo@redhat.com>, 1999, 2000
  */
 
-#define		APIC_DEFAULT_PHYS_BASE	0xfee00000
+#define		APIC_DEFAULT_PHYS_BASE	0xfee00000U
  
 #define		APIC_ID		0x20
 #define			APIC_ID_MASK		(0xFFu<<24)
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index fbc4bb3416..bbced338be 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -257,7 +257,7 @@ extern unsigned char boot_edid_info[128];
 #endif /* CONFIG_PV32 */
 
 #define MACH2PHYS_COMPAT_VIRT_START    HYPERVISOR_COMPAT_VIRT_START
-#define MACH2PHYS_COMPAT_VIRT_END      0xFFE00000
+#define MACH2PHYS_COMPAT_VIRT_END      0xFFE00000U
 #define MACH2PHYS_COMPAT_NR_ENTRIES(d) \
     ((MACH2PHYS_COMPAT_VIRT_END-MACH2PHYS_COMPAT_VIRT_START(d))>>2)
 
diff --git a/xen/arch/x86/include/asm/hpet.h b/xen/arch/x86/include/asm/hpet.h
index 9919f74730..c5e8e9c8db 100644
--- a/xen/arch/x86/include/asm/hpet.h
+++ b/xen/arch/x86/include/asm/hpet.h
@@ -41,7 +41,7 @@
 #define HPET_TN_ROUTE		0x3e00
 #define HPET_TN_FSB		0x4000
 #define HPET_TN_FSB_CAP		0x8000
-#define HPET_TN_RESERVED	0xffff0081
+#define HPET_TN_RESERVED	0xffff0081U
 #define HPET_TN_INT_ROUTE_CAP	(0xffffffffULL << 32)
 
 
diff --git a/xen/arch/x86/include/asm/hvm/trace.h b/xen/arch/x86/include/asm/hvm/trace.h
index 696e42eb94..22eadbdd47 100644
--- a/xen/arch/x86/include/asm/hvm/trace.h
+++ b/xen/arch/x86/include/asm/hvm/trace.h
@@ -58,7 +58,7 @@
 #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
 
 
-#define TRC_PAR_LONG(par) ((par)&0xFFFFFFFF),((par)>>32)
+#define TRC_PAR_LONG(par) ((uint32_t)(par)), ((par) >> 32)
 
 #define TRACE_2_LONG_2D(_e, d1, d2, ...) \
     TRACE_4D(_e, d1, d2)
@@ -93,7 +93,7 @@
     HVMTRACE_ND(evt, 0, 0)
 
 #define HVMTRACE_LONG_1D(evt, d1)                  \
-                   HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFF, (d1) >> 32)
+                   HVMTRACE_2D(evt ## 64, (uint32_t)(d1), (d1) >> 32)
 #define HVMTRACE_LONG_2D(evt, d1, d2, ...)              \
                    HVMTRACE_3D(evt ## 64, d1, d2)
 #define HVMTRACE_LONG_3D(evt, d1, d2, d3, ...)      \
diff --git a/xen/arch/x86/include/asm/hvm/vioapic.h b/xen/arch/x86/include/asm/hvm/vioapic.h
index 2944ec20dd..68af6dce79 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic.h
+++ b/xen/arch/x86/include/asm/hvm/vioapic.h
@@ -32,7 +32,7 @@
 #define VIOAPIC_EDGE_TRIG  0
 #define VIOAPIC_LEVEL_TRIG 1
 
-#define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000
+#define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000U
 #define VIOAPIC_MEM_LENGTH            0x100
 
 /* Direct registers. */
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index a53ade95c9..d89723d009 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -37,7 +37,7 @@
  */
 
 #define MSI_ADDR_BASE_HI            0
-#define MSI_ADDR_BASE_LO            0xfee00000
+#define MSI_ADDR_BASE_LO            0xfee00000U
 #define MSI_ADDR_BASE_MASK          (~0xfffff)
 #define MSI_ADDR_HEADER             MSI_ADDR_BASE_LO
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 82a81bd0a2..492699c1b4 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -22,7 +22,7 @@
 #define  APIC_BASE_BSP                      (_AC(1, ULL) <<  8)
 #define  APIC_BASE_EXTD                     (_AC(1, ULL) << 10)
 #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
-#define  APIC_BASE_ADDR_MASK                0x000ffffffffff000ULL
+#define  APIC_BASE_ADDR_MASK                _AC(0x000ffffffffff000, ULL)
 
 #define MSR_TEST_CTRL                       0x00000033
 #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
@@ -30,7 +30,7 @@
 
 #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035
 #define  MSR_CTC_THREAD_MASK                0x0000ffff
-#define  MSR_CTC_CORE_MASK                  0xffff0000
+#define  MSR_CTC_CORE_MASK                  _AC(0xffff0000, U)
 
 #define MSR_SPEC_CTRL                       0x00000048
 #define  SPEC_CTRL_IBRS                     (_AC(1, ULL) <<  0)
@@ -191,7 +191,7 @@
 #define MSR_UARCH_MISC_CTRL                 0x00001b01
 #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
 
-#define MSR_EFER                            0xc0000080 /* Extended Feature Enable Register */
+#define MSR_EFER                            _AC(0xc0000080, U) /* Extended Feature Enable Register */
 #define  EFER_SCE                           (_AC(1, ULL) <<  0) /* SYSCALL Enable */
 #define  EFER_LME                           (_AC(1, ULL) <<  8) /* Long Mode Enable */
 #define  EFER_LMA                           (_AC(1, ULL) << 10) /* Long Mode Active */
@@ -204,35 +204,35 @@
     (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE | \
      EFER_AIBRSE)
 
-#define MSR_STAR                            0xc0000081 /* legacy mode SYSCALL target */
-#define MSR_LSTAR                           0xc0000082 /* long mode SYSCALL target */
-#define MSR_CSTAR                           0xc0000083 /* compat mode SYSCALL target */
-#define MSR_SYSCALL_MASK                    0xc0000084 /* EFLAGS mask for syscall */
-#define MSR_FS_BASE                         0xc0000100 /* 64bit FS base */
-#define MSR_GS_BASE                         0xc0000101 /* 64bit GS base */
-#define MSR_SHADOW_GS_BASE                  0xc0000102 /* SwapGS GS shadow */
-#define MSR_TSC_AUX                         0xc0000103 /* Auxiliary TSC */
+#define MSR_STAR                            _AC(0xc0000081, U) /* legacy mode SYSCALL target */
+#define MSR_LSTAR                           _AC(0xc0000082, U) /* long mode SYSCALL target */
+#define MSR_CSTAR                           _AC(0xc0000083, U) /* compat mode SYSCALL target */
+#define MSR_SYSCALL_MASK                    _AC(0xc0000084, U) /* EFLAGS mask for syscall */
+#define MSR_FS_BASE                         _AC(0xc0000100, U) /* 64bit FS base */
+#define MSR_GS_BASE                         _AC(0xc0000101, U) /* 64bit GS base */
+#define MSR_SHADOW_GS_BASE                  _AC(0xc0000102, U) /* SwapGS GS shadow */
+#define MSR_TSC_AUX                         _AC(0xc0000103, U) /* Auxiliary TSC */
 
-#define MSR_K8_SYSCFG                       0xc0010010
+#define MSR_K8_SYSCFG                       _AC(0xc0010010, U)
 #define  SYSCFG_MTRR_FIX_DRAM_EN            (_AC(1, ULL) << 18)
 #define  SYSCFG_MTRR_FIX_DRAM_MOD_EN        (_AC(1, ULL) << 19)
 #define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
 #define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
 #define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
 
-#define MSR_K8_IORR_BASE0                   0xc0010016
-#define MSR_K8_IORR_MASK0                   0xc0010017
-#define MSR_K8_IORR_BASE1                   0xc0010018
-#define MSR_K8_IORR_MASK1                   0xc0010019
+#define MSR_K8_IORR_BASE0                   _AC(0xc0010016, U)
+#define MSR_K8_IORR_MASK0                   _AC(0xc0010017, U)
+#define MSR_K8_IORR_BASE1                   _AC(0xc0010018, U)
+#define MSR_K8_IORR_MASK1                   _AC(0xc0010019, U)
 
-#define MSR_K8_TSEG_BASE                    0xc0010112 /* AMD doc: SMMAddr */
-#define MSR_K8_TSEG_MASK                    0xc0010113 /* AMD doc: SMMMask */
+#define MSR_K8_TSEG_BASE                    _AC(0xc0010112, U) /* AMD doc: SMMAddr */
+#define MSR_K8_TSEG_MASK                    _AC(0xc0010113, U) /* AMD doc: SMMMask */
 
-#define MSR_K8_VM_CR                        0xc0010114
+#define MSR_K8_VM_CR                        _AC(0xc0010114, U)
 #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
 #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
 
-#define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout matches MSR_SPEC_CTRL */
+#define MSR_VIRT_SPEC_CTRL                  _AC(0xc001011f, U) /* Layout matches MSR_SPEC_CTRL */
 
 #define MSR_AMD_CSTATE_CFG                  0xc0010296
 
@@ -318,7 +318,7 @@
 #define CMCI_EN 			(1UL<<30)
 #define CMCI_THRESHOLD_MASK		0x7FFF
 
-#define MSR_AMD64_MC0_MASK		0xc0010044
+#define MSR_AMD64_MC0_MASK		0xc0010044U
 
 #define MSR_IA32_MCx_CTL(x)		(MSR_IA32_MC0_CTL + 4*(x))
 #define MSR_IA32_MCx_STATUS(x)		(MSR_IA32_MC0_STATUS + 4*(x))
@@ -350,83 +350,83 @@
 
 /* K7/K8 MSRs. Not complete. See the architecture manual for a more
    complete list. */
-#define MSR_K7_EVNTSEL0			0xc0010000
-#define MSR_K7_PERFCTR0			0xc0010004
-#define MSR_K7_EVNTSEL1			0xc0010001
-#define MSR_K7_PERFCTR1			0xc0010005
-#define MSR_K7_EVNTSEL2			0xc0010002
-#define MSR_K7_PERFCTR2			0xc0010006
-#define MSR_K7_EVNTSEL3			0xc0010003
-#define MSR_K7_PERFCTR3			0xc0010007
-#define MSR_K8_TOP_MEM1			0xc001001a
-#define MSR_K8_TOP_MEM2			0xc001001d
-
-#define MSR_K8_HWCR			0xc0010015
+#define MSR_K7_EVNTSEL0			0xc0010000U
+#define MSR_K7_PERFCTR0			0xc0010004U
+#define MSR_K7_EVNTSEL1			0xc0010001U
+#define MSR_K7_PERFCTR1			0xc0010005U
+#define MSR_K7_EVNTSEL2			0xc0010002U
+#define MSR_K7_PERFCTR2			0xc0010006U
+#define MSR_K7_EVNTSEL3			0xc0010003U
+#define MSR_K7_PERFCTR3			0xc0010007U
+#define MSR_K8_TOP_MEM1			0xc001001aU
+#define MSR_K8_TOP_MEM2			0xc001001dU
+
+#define MSR_K8_HWCR			0xc0010015U
 #define K8_HWCR_TSC_FREQ_SEL		(1ULL << 24)
 #define K8_HWCR_CPUID_USER_DIS		(1ULL << 35)
 
-#define MSR_K7_FID_VID_CTL		0xc0010041
-#define MSR_K7_FID_VID_STATUS		0xc0010042
-#define MSR_K8_PSTATE_LIMIT		0xc0010061
-#define MSR_K8_PSTATE_CTRL		0xc0010062
-#define MSR_K8_PSTATE_STATUS		0xc0010063
-#define MSR_K8_PSTATE0			0xc0010064
-#define MSR_K8_PSTATE1			0xc0010065
-#define MSR_K8_PSTATE2			0xc0010066
-#define MSR_K8_PSTATE3			0xc0010067
-#define MSR_K8_PSTATE4			0xc0010068
-#define MSR_K8_PSTATE5			0xc0010069
-#define MSR_K8_PSTATE6			0xc001006A
-#define MSR_K8_PSTATE7			0xc001006B
-#define MSR_K8_ENABLE_C1E		0xc0010055
-#define MSR_K8_VM_HSAVE_PA		0xc0010117
-
-#define MSR_AMD_FAM15H_EVNTSEL0		0xc0010200
-#define MSR_AMD_FAM15H_PERFCTR0		0xc0010201
-#define MSR_AMD_FAM15H_EVNTSEL1		0xc0010202
-#define MSR_AMD_FAM15H_PERFCTR1		0xc0010203
-#define MSR_AMD_FAM15H_EVNTSEL2		0xc0010204
-#define MSR_AMD_FAM15H_PERFCTR2		0xc0010205
-#define MSR_AMD_FAM15H_EVNTSEL3		0xc0010206
-#define MSR_AMD_FAM15H_PERFCTR3		0xc0010207
-#define MSR_AMD_FAM15H_EVNTSEL4		0xc0010208
-#define MSR_AMD_FAM15H_PERFCTR4		0xc0010209
-#define MSR_AMD_FAM15H_EVNTSEL5		0xc001020a
-#define MSR_AMD_FAM15H_PERFCTR5		0xc001020b
-
-#define MSR_AMD_L7S0_FEATURE_MASK	0xc0011002
-#define MSR_AMD_THRM_FEATURE_MASK	0xc0011003
-#define MSR_K8_FEATURE_MASK		0xc0011004
-#define MSR_K8_EXT_FEATURE_MASK		0xc0011005
+#define MSR_K7_FID_VID_CTL		0xc0010041U
+#define MSR_K7_FID_VID_STATUS		0xc0010042U
+#define MSR_K8_PSTATE_LIMIT		0xc0010061U
+#define MSR_K8_PSTATE_CTRL		0xc0010062U
+#define MSR_K8_PSTATE_STATUS		0xc0010063U
+#define MSR_K8_PSTATE0			0xc0010064U
+#define MSR_K8_PSTATE1			0xc0010065U
+#define MSR_K8_PSTATE2			0xc0010066U
+#define MSR_K8_PSTATE3			0xc0010067U
+#define MSR_K8_PSTATE4			0xc0010068U
+#define MSR_K8_PSTATE5			0xc0010069U
+#define MSR_K8_PSTATE6			0xc001006AU
+#define MSR_K8_PSTATE7			0xc001006BU
+#define MSR_K8_ENABLE_C1E		0xc0010055U
+#define MSR_K8_VM_HSAVE_PA		0xc0010117U
+
+#define MSR_AMD_FAM15H_EVNTSEL0		0xc0010200U
+#define MSR_AMD_FAM15H_PERFCTR0		0xc0010201U
+#define MSR_AMD_FAM15H_EVNTSEL1		0xc0010202U
+#define MSR_AMD_FAM15H_PERFCTR1		0xc0010203U
+#define MSR_AMD_FAM15H_EVNTSEL2		0xc0010204U
+#define MSR_AMD_FAM15H_PERFCTR2		0xc0010205U
+#define MSR_AMD_FAM15H_EVNTSEL3		0xc0010206U
+#define MSR_AMD_FAM15H_PERFCTR3		0xc0010207U
+#define MSR_AMD_FAM15H_EVNTSEL4		0xc0010208U
+#define MSR_AMD_FAM15H_PERFCTR4		0xc0010209U
+#define MSR_AMD_FAM15H_EVNTSEL5		0xc001020aU
+#define MSR_AMD_FAM15H_PERFCTR5		0xc001020bU
+
+#define MSR_AMD_L7S0_FEATURE_MASK	0xc0011002U
+#define MSR_AMD_THRM_FEATURE_MASK	0xc0011003U
+#define MSR_K8_FEATURE_MASK			0xc0011004U
+#define MSR_K8_EXT_FEATURE_MASK		0xc0011005U
 
 /* AMD64 MSRs */
-#define MSR_AMD64_NB_CFG		0xc001001f
+#define MSR_AMD64_NB_CFG		0xc001001fU
 #define AMD64_NB_CFG_CF8_EXT_ENABLE_BIT	46
-#define MSR_AMD64_LS_CFG		0xc0011020
-#define MSR_AMD64_IC_CFG		0xc0011021
-#define MSR_AMD64_DC_CFG		0xc0011022
-#define MSR_AMD64_DE_CFG		0xc0011029
+#define MSR_AMD64_LS_CFG		0xc0011020U
+#define MSR_AMD64_IC_CFG		0xc0011021U
+#define MSR_AMD64_DC_CFG		0xc0011022U
+#define MSR_AMD64_DE_CFG		0xc0011029U
 #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
-#define MSR_AMD64_EX_CFG		0xc001102c
-#define MSR_AMD64_BP_CFG		0xc001102e
-#define MSR_AMD64_DE_CFG2		0xc00110e3
+#define MSR_AMD64_EX_CFG		0xc001102cU
+#define MSR_AMD64_BP_CFG		0xc001102eU
+#define MSR_AMD64_DE_CFG2		0xc00110e3U
 
-#define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027
-#define MSR_AMD64_DR1_ADDRESS_MASK	0xc0011019
-#define MSR_AMD64_DR2_ADDRESS_MASK	0xc001101a
-#define MSR_AMD64_DR3_ADDRESS_MASK	0xc001101b
+#define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027U
+#define MSR_AMD64_DR1_ADDRESS_MASK	0xc0011019U
+#define MSR_AMD64_DR2_ADDRESS_MASK	0xc001101aU
+#define MSR_AMD64_DR3_ADDRESS_MASK	0xc001101bU
 
 /* AMD Family10h machine check MSRs */
-#define MSR_F10_MC4_MISC1		0xc0000408
-#define MSR_F10_MC4_MISC2		0xc0000409
-#define MSR_F10_MC4_MISC3		0xc000040A
+#define MSR_F10_MC4_MISC1		0xc0000408U
+#define MSR_F10_MC4_MISC2		0xc0000409U
+#define MSR_F10_MC4_MISC3		0xc000040AU
 
 /* AMD Family10h Bus Unit MSRs */
-#define MSR_F10_BU_CFG 		0xc0011023
-#define MSR_F10_BU_CFG2		0xc001102a
+#define MSR_F10_BU_CFG 		0xc0011023U
+#define MSR_F10_BU_CFG2		0xc001102aU
 
 /* Other AMD Fam10h MSRs */
-#define MSR_FAM10H_MMIO_CONF_BASE	0xc0010058
+#define MSR_FAM10H_MMIO_CONF_BASE	0xc0010058U
 #define FAM10H_MMIO_CONF_ENABLE         (1<<0)
 #define FAM10H_MMIO_CONF_BUSRANGE_MASK	0xf
 #define FAM10H_MMIO_CONF_BUSRANGE_SHIFT 2
@@ -435,22 +435,22 @@
 
 /* AMD Microcode MSRs */
 #define MSR_AMD_PATCHLEVEL		0x0000008b
-#define MSR_AMD_PATCHLOADER		0xc0010020
+#define MSR_AMD_PATCHLOADER		0xc0010020U
 
 /* AMD TSC RATE MSR */
-#define MSR_AMD64_TSC_RATIO		0xc0000104
+#define MSR_AMD64_TSC_RATIO		0xc0000104U
 
 /* AMD Lightweight Profiling MSRs */
-#define MSR_AMD64_LWP_CFG		0xc0000105
-#define MSR_AMD64_LWP_CBADDR		0xc0000106
+#define MSR_AMD64_LWP_CFG		0xc0000105U
+#define MSR_AMD64_LWP_CBADDR		0xc0000106U
 
 /* AMD OS Visible Workaround MSRs */
-#define MSR_AMD_OSVW_ID_LENGTH          0xc0010140
-#define MSR_AMD_OSVW_STATUS             0xc0010141
+#define MSR_AMD_OSVW_ID_LENGTH          0xc0010140U
+#define MSR_AMD_OSVW_STATUS             0xc0010141U
 
 /* AMD Protected Processor Inventory Number */
-#define MSR_AMD_PPIN_CTL                0xc00102f0
-#define MSR_AMD_PPIN                    0xc00102f1
+#define MSR_AMD_PPIN_CTL                0xc00102f0U
+#define MSR_AMD_PPIN                    0xc00102f1U
 
 /* VIA Cyrix defined MSRs*/
 #define MSR_VIA_FCR			0x00001107
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index f4a58c8acf..e1dd12eb19 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -3,10 +3,10 @@
 
 #include <xen/mm.h>
 
-#define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00) >> 8)
-#define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fc)
-#define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
-#define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
+#define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00U) >> 8)
+#define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fcU)
+#define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000U) >> 16)
+#define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000U))
 
 #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
                         || id == 0x01268086 || id == 0x01028086 \
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 5838631ef6..48d7a3b7af 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -30,17 +30,17 @@
 /*
  * Intel CPU flags in CR0
  */
-#define X86_CR0_PE              0x00000001 /* Enable Protected Mode    (RW) */
-#define X86_CR0_MP              0x00000002 /* Monitor Coprocessor      (RW) */
-#define X86_CR0_EM              0x00000004 /* Require FPU Emulation    (RO) */
-#define X86_CR0_TS              0x00000008 /* Task Switched            (RW) */
-#define X86_CR0_ET              0x00000010 /* Extension type           (RO) */
-#define X86_CR0_NE              0x00000020 /* Numeric Error Reporting  (RW) */
-#define X86_CR0_WP              0x00010000 /* Supervisor Write Protect (RW) */
-#define X86_CR0_AM              0x00040000 /* Alignment Checking       (RW) */
-#define X86_CR0_NW              0x20000000 /* Not Write-Through        (RW) */
-#define X86_CR0_CD              0x40000000 /* Cache Disable            (RW) */
-#define X86_CR0_PG              0x80000000 /* Paging                   (RW) */
+#define X86_CR0_PE              _AC(0x00000001, UL) /* Enable Protected Mode    (RW) */
+#define X86_CR0_MP              _AC(0x00000002, UL) /* Monitor Coprocessor      (RW) */
+#define X86_CR0_EM              _AC(0x00000004, UL) /* Require FPU Emulation    (RO) */
+#define X86_CR0_TS              _AC(0x00000008, UL) /* Task Switched            (RW) */
+#define X86_CR0_ET              _AC(0x00000010, UL) /* Extension type           (RO) */
+#define X86_CR0_NE              _AC(0x00000020, UL) /* Numeric Error Reporting  (RW) */
+#define X86_CR0_WP              _AC(0x00010000, UL) /* Supervisor Write Protect (RW) */
+#define X86_CR0_AM              _AC(0x00040000, UL) /* Alignment Checking       (RW) */
+#define X86_CR0_NW              _AC(0x20000000, UL) /* Not Write-Through        (RW) */
+#define X86_CR0_CD              _AC(0x40000000, UL) /* Cache Disable            (RW) */
+#define X86_CR0_PG              _AC(0x80000000, UL) /* Paging                   (RW) */
 
 /*
  * Intel CPU flags in CR3
-- 
2.34.1


