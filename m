Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3FD30B379
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 00:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80193.146546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibi-0007el-4z; Mon, 01 Feb 2021 23:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80193.146546; Mon, 01 Feb 2021 23:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibi-0007dY-0V; Mon, 01 Feb 2021 23:27:46 +0000
Received: by outflank-mailman (input) for mailman id 80193;
 Mon, 01 Feb 2021 23:27:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6ibf-0007PB-SJ
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 23:27:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 537d15c5-bb30-4d98-9b4f-c825c6125c33;
 Mon, 01 Feb 2021 23:27:35 +0000 (UTC)
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
X-Inumbo-ID: 537d15c5-bb30-4d98-9b4f-c825c6125c33
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612222054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gjwIZ7tSRC53L46IQqr59AJJ4+W6spW+dFwdwkZvhUU=;
  b=B4oSTp8MF/rSgYgtGoYEqfIsPSii1Uw4J8TOdFTR3YyEoNLwLoWZFVQl
   Q0Mt96rOY2luWb+YSDCwBb9aF9UItv1aiYjfZXJSLvW099t6ddCETjOoQ
   XcTco8cLwssuxYMf051xfX7vfuKRO2w6ZOGU9kLgyfgfyHrzeGbHl7TFP
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +u4gKq1njIZq4gAJqR+TaWr7sQ2k0elD+4u8/m4xGO9B+F/HKIDmaKjAha0VOR3wqvIR/5cYZ3
 HvzpU6TRS/zfPlKF4jrk2IEeWU8DAIuAomqHevt8rpYcdr0M7w29hvrVQ+VxpS+AWdu0QG7wnL
 EVCHxvgJseACWphXAxAcP7nKsUUEdOaAFvfsrQXNraCsRts3nk68+TjOogGjHLOuy2YTatXmMX
 t3z1vpFA2iu2M0Gu7qZfkTqVnrD9q7Nm/6jTmg5FS4BWLkjTg6kPuGtXu3nnoVM3jjvIsxO//2
 3CE=
X-SBRS: 5.1
X-MesageID: 36319802
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36319802"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v9 05/11] x86/vmx: Add Intel Processor Trace support
Date: Mon, 1 Feb 2021 23:26:57 +0000
Message-ID: <20210201232703.29275-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210201232703.29275-1-andrew.cooper3@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

Add CPUID/MSR enumeration details for Processor Trace.  For now, we will only
support its use inside VMX operation.  Fill in the vmtrace_available boolean
to activate the newly introduced common infrastructure for allocating trace
buffers.

For now, Processor Trace is going to be operated in Single Output mode behind
the guests back.  Add the MSRs to struct vcpu_msrs, and set up the buffer
limit in vmx_init_ipt() as it is fixed for the lifetime of the domain.

Context switch the most of the MSRs in and out of vCPU context, but the main
control register needs to reside in the MSR load/save lists.  Explicitly pull
the msrs pointer out into a local variable, because the optimiser cannot keep
it live across the memory clobbers in the MSR accesses.

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v8:
 * Plumb bsp boolean down into vmx_init_vmcs_config()
 * Rename vmx_init_pt() to vmx_init_ipt()
 * Rebase over vmtrace_size/pg renames.

v7:
 * Major chop&change within the series.
 * Move MSRs to vcpu_msrs, which is where they'll definitely want to live when
   we offer PT to VMs for their own use.
---
 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c                 | 19 +++++++++++++---
 xen/arch/x86/hvm/vmx/vmx.c                  | 34 ++++++++++++++++++++++++++++-
 xen/include/asm-x86/cpufeature.h            |  1 +
 xen/include/asm-x86/hvm/vmx/vmcs.h          |  4 ++++
 xen/include/asm-x86/msr.h                   | 32 +++++++++++++++++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 8 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 259612834e..289c59c742 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -188,6 +188,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"avx512-ifma",  0x00000007,  0, CPUID_REG_EBX, 21,  1},
         {"clflushopt",   0x00000007,  0, CPUID_REG_EBX, 23,  1},
         {"clwb",         0x00000007,  0, CPUID_REG_EBX, 24,  1},
+        {"proc-trace",   0x00000007,  0, CPUID_REG_EBX, 25,  1},
         {"avx512pf",     0x00000007,  0, CPUID_REG_EBX, 26,  1},
         {"avx512er",     0x00000007,  0, CPUID_REG_EBX, 27,  1},
         {"avx512cd",     0x00000007,  0, CPUID_REG_EBX, 28,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index c81aa93055..2d04162d8d 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -106,7 +106,7 @@ static const char *const str_7b0[32] =
     [18] = "rdseed",   [19] = "adx",
     [20] = "smap",     [21] = "avx512-ifma",
     [22] = "pcommit",  [23] = "clflushopt",
-    [24] = "clwb",     [25] = "pt",
+    [24] = "clwb",     [25] = "proc-trace",
     [26] = "avx512pf", [27] = "avx512er",
     [28] = "avx512cd", [29] = "sha",
     [30] = "avx512bw", [31] = "avx512vl",
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 164535f8f0..f9f9bc18cd 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -243,7 +243,7 @@ static bool_t cap_check(const char *name, u32 expected, u32 saw)
     return saw != expected;
 }
 
-static int vmx_init_vmcs_config(void)
+static int vmx_init_vmcs_config(bool bsp)
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     u32 _vmx_pin_based_exec_control;
@@ -291,6 +291,20 @@ static int vmx_init_vmcs_config(void)
         _vmx_cpu_based_exec_control &=
             ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
 
+    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
+
+    /* Check whether IPT is supported in VMX operation. */
+    if ( bsp )
+        vmtrace_available = cpu_has_proc_trace &&
+                            (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
+    else if ( vmtrace_available &&
+              !(_vmx_misc_cap & VMX_MISC_PROC_TRACE) )
+    {
+        printk("VMX: IPT capabilities differ between CPU%u and BSP\n",
+               smp_processor_id());
+        return -EINVAL;
+    }
+
     if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
     {
         min = 0;
@@ -305,7 +319,6 @@ static int vmx_init_vmcs_config(void)
                SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
                SECONDARY_EXEC_XSAVES |
                SECONDARY_EXEC_TSC_SCALING);
-        rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
         if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
             opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
         if ( opt_vpid_enabled )
@@ -715,7 +728,7 @@ static int _vmx_cpu_up(bool bsp)
         wrmsr(MSR_IA32_FEATURE_CONTROL, eax, 0);
     }
 
-    if ( (rc = vmx_init_vmcs_config()) != 0 )
+    if ( (rc = vmx_init_vmcs_config(bsp)) != 0 )
         return rc;
 
     INIT_LIST_HEAD(&this_cpu(active_vmcs_list));
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 2d4475ee3d..12b961113e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -428,6 +428,20 @@ static void vmx_domain_relinquish_resources(struct domain *d)
     vmx_free_vlapic_mapping(d);
 }
 
+static void vmx_init_ipt(struct vcpu *v)
+{
+    unsigned int size = v->domain->vmtrace_size;
+
+    if ( !size )
+        return;
+
+    /* Checked by domain creation logic. */
+    ASSERT(v->vmtrace.pg);
+    ASSERT(size >= PAGE_SIZE && (size & (size - 1)) == 0);
+
+    v->arch.msrs->rtit.output_limit = size - 1;
+}
+
 static int vmx_vcpu_initialise(struct vcpu *v)
 {
     int rc;
@@ -470,6 +484,7 @@ static int vmx_vcpu_initialise(struct vcpu *v)
     }
 
     vmx_install_vlapic_mapping(v);
+    vmx_init_ipt(v);
 
     return 0;
 }
@@ -508,22 +523,39 @@ static void vmx_restore_host_msrs(void)
 
 static void vmx_save_guest_msrs(struct vcpu *v)
 {
+    struct vcpu_msrs *msrs = v->arch.msrs;
+
     /*
      * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
      * be updated at any time via SWAPGS, which we cannot trap.
      */
     v->arch.hvm.vmx.shadow_gs = read_gs_shadow();
+
+    if ( v->arch.hvm.vmx.ipt_active )
+    {
+        rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
+        rdmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
+    }
 }
 
 static void vmx_restore_guest_msrs(struct vcpu *v)
 {
+    const struct vcpu_msrs *msrs = v->arch.msrs;
+
     write_gs_shadow(v->arch.hvm.vmx.shadow_gs);
     wrmsrl(MSR_STAR,           v->arch.hvm.vmx.star);
     wrmsrl(MSR_LSTAR,          v->arch.hvm.vmx.lstar);
     wrmsrl(MSR_SYSCALL_MASK,   v->arch.hvm.vmx.sfmask);
 
     if ( cpu_has_msr_tsc_aux )
-        wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+        wrmsr_tsc_aux(msrs->tsc_aux);
+
+    if ( v->arch.hvm.vmx.ipt_active )
+    {
+        wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
+        wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
+        wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
+    }
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index f62e526a96..33b2257888 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -105,6 +105,7 @@
 #define cpu_has_clwb            boot_cpu_has(X86_FEATURE_CLWB)
 #define cpu_has_avx512er        boot_cpu_has(X86_FEATURE_AVX512ER)
 #define cpu_has_avx512cd        boot_cpu_has(X86_FEATURE_AVX512CD)
+#define cpu_has_proc_trace      boot_cpu_has(X86_FEATURE_PROC_TRACE)
 #define cpu_has_sha             boot_cpu_has(X86_FEATURE_SHA)
 #define cpu_has_avx512bw        boot_cpu_has(X86_FEATURE_AVX512BW)
 #define cpu_has_avx512vl        boot_cpu_has(X86_FEATURE_AVX512VL)
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 906810592f..8073af323b 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -156,6 +156,9 @@ struct vmx_vcpu {
     /* Do we need to tolerate a spurious EPT_MISCONFIG VM exit? */
     bool_t               ept_spurious_misconfig;
 
+    /* Processor Trace configured and enabled for the vcpu. */
+    bool                 ipt_active;
+
     /* Is the guest in real mode? */
     uint8_t              vmx_realmode;
     /* Are we emulating rather than VMENTERing? */
@@ -283,6 +286,7 @@ extern u32 vmx_secondary_exec_control;
 #define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000ULL
 extern u64 vmx_ept_vpid_cap;
 
+#define VMX_MISC_PROC_TRACE                     0x00004000
 #define VMX_MISC_CR3_TARGET                     0x01ff0000
 #define VMX_MISC_VMWRITE_ALL                    0x20000000
 
diff --git a/xen/include/asm-x86/msr.h b/xen/include/asm-x86/msr.h
index 16f95e7344..1d3eca9063 100644
--- a/xen/include/asm-x86/msr.h
+++ b/xen/include/asm-x86/msr.h
@@ -306,6 +306,38 @@ struct vcpu_msrs
         };
     } misc_features_enables;
 
+    /*
+     * 0x00000560 ... 57x - MSR_RTIT_*
+     *
+     * "Real Time Instruction Trace", now called Processor Trace.
+     *
+     * These MSRs are not exposed to guests.  They are controlled by Xen
+     * behind the scenes, when vmtrace is enabled for the domain.
+     *
+     * MSR_RTIT_OUTPUT_BASE not stored here.  It is fixed per vcpu, and
+     * derived from v->vmtrace.buf.
+     */
+    struct {
+        /*
+         * Placed in the MSR load/save lists.  Only modified by hypercall in
+         * the common case.
+         */
+        uint64_t ctl;
+
+        /*
+         * Updated by hardware in non-root mode.  Synchronised here on vcpu
+         * context switch.
+         */
+        uint64_t status;
+        union {
+            uint64_t output_mask;
+            struct {
+                uint32_t output_limit;
+                uint32_t output_offset;
+            };
+        };
+    } rtit;
+
     /* 0x00000da0 - MSR_IA32_XSS */
     struct {
         uint64_t raw;
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 6f7efaad6d..a501479820 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -217,6 +217,7 @@ XEN_CPUFEATURE(SMAP,          5*32+20) /*S  Supervisor Mode Access Prevention */
 XEN_CPUFEATURE(AVX512_IFMA,   5*32+21) /*A  AVX-512 Integer Fused Multiply Add */
 XEN_CPUFEATURE(CLFLUSHOPT,    5*32+23) /*A  CLFLUSHOPT instruction */
 XEN_CPUFEATURE(CLWB,          5*32+24) /*A  CLWB instruction */
+XEN_CPUFEATURE(PROC_TRACE,    5*32+25) /*   Processor Trace */
 XEN_CPUFEATURE(AVX512PF,      5*32+26) /*A  AVX-512 Prefetch Instructions */
 XEN_CPUFEATURE(AVX512ER,      5*32+27) /*A  AVX-512 Exponent & Reciprocal Instrs */
 XEN_CPUFEATURE(AVX512CD,      5*32+28) /*A  AVX-512 Conflict Detection Instrs */
-- 
2.11.0


