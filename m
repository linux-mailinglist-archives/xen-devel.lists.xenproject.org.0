Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DE2FF72D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72421.130379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUT-0004yJ-CA; Thu, 21 Jan 2021 21:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72421.130379; Thu, 21 Jan 2021 21:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUT-0004xu-8Y; Thu, 21 Jan 2021 21:27:41 +0000
Received: by outflank-mailman (input) for mailman id 72421;
 Thu, 21 Jan 2021 21:27:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hUR-0004xj-IN
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:27:39 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0aeb351d-c53c-4014-95d2-625cc86d0797;
 Thu, 21 Jan 2021 21:27:37 +0000 (UTC)
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
X-Inumbo-ID: 0aeb351d-c53c-4014-95d2-625cc86d0797
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611264457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wc3FEvOvDDgeHoKwLAGPw5KnMsVxUDgNrcW7jjtvYnA=;
  b=f2iH52La3CAkdlG4f14y1ml+AXdQwD5WZtkZhrB9h0OkEPGvrdittjEP
   Hk2ZRc80ddxKWHJRcLExVQj95Lnn2Ga/nv+BxN9/a4B4ImwijoQSvTcyW
   CpRPs+I5taM8VlS6sfWlJMy3eoNDJVL3N7mYCBq88xVzLXrD4mt3RHgeB
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gQCoibysz3Y2cMDVmBNNrwewFxcfjaxB7dDpMPt+Jas6aw4Dt4V1G4ddmDxeN15mX4bah9p143
 QA7lh1vvwD/28Kd3G2DlaPomGSWXfOhFfpKm68GjvFYkwvIzJDnGR0NrG9D0kZnhC5avUuzD3X
 AMgwCEp2ZFPT4sqC5keONMaWNsFtz64IkIqgmnQ3XljKQkSVDTqloGzyUzXsdbwc5IA5e84WMd
 D4rx/lbgVpsZaQK1HFle5ELas97NSAk8jztSxxxT4ngsEimgpOnKdtVtBFzdVqnE7K1U9SlNTa
 G8I=
X-SBRS: 5.1
X-MesageID: 35815967
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="35815967"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v7 05/10] x86/vmx: Add Intel Processor Trace support
Date: Thu, 21 Jan 2021 21:27:13 +0000
Message-ID: <20210121212718.2441-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210121212718.2441-1-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
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
limit in vmx_init_pt() as it is fixed for the lifetime of the domain.

Context switch the most of the MSRs in and out of vCPU context switch, but the
main control register needs to reside in the MSR load/save lists.  Explicitly
pull the msrs pointer out into a local variable, because the optimiser cannot
keep it live across the memory clobbers in the MSR accesses.

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v7:
 * Major chop&change within the series.
 * Move MSRs to vcpu_msrs, which is where they'll definitely want to live when
   we offer PT to VMs for their own use.
---
 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c                 | 15 ++++++++++++-
 xen/arch/x86/hvm/vmx/vmx.c                  | 34 ++++++++++++++++++++++++++++-
 xen/include/asm-x86/cpufeature.h            |  1 +
 xen/include/asm-x86/hvm/vmx/vmcs.h          |  4 ++++
 xen/include/asm-x86/msr.h                   | 32 +++++++++++++++++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 8 files changed, 87 insertions(+), 3 deletions(-)

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
index 164535f8f0..5576caad8e 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -291,6 +291,20 @@ static int vmx_init_vmcs_config(void)
         _vmx_cpu_based_exec_control &=
             ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
 
+    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
+
+    /* Check whether IPT is supported in VMX operation. */
+    if ( !smp_processor_id() )
+        vmtrace_available = cpu_has_proc_trace &&
+                            (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
+    else if ( vmtrace_available &&
+              !(_vmx_misc_cap & VMX_MISC_PROC_TRACE) )
+    {
+        printk("VMX: IPT capabilities differ between CPU%u and CPU0\n",
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
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4120234c15..93121fbf27 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -428,6 +428,20 @@ static void vmx_domain_relinquish_resources(struct domain *d)
     vmx_free_vlapic_mapping(d);
 }
 
+static void vmx_init_pt(struct vcpu *v)
+{
+    unsigned int frames = v->domain->vmtrace_frames;
+
+    if ( !frames )
+        return;
+
+    /* Checked by domain creation logic. */
+    ASSERT(v->vmtrace.buf);
+    ASSERT(frames <= (GB(4) >> PAGE_SHIFT) && (frames & (frames - 1)) == 0);
+
+    v->arch.msrs->rtit.output_limit = (frames << PAGE_SHIFT) - 1;
+}
+
 static int vmx_vcpu_initialise(struct vcpu *v)
 {
     int rc;
@@ -470,6 +484,7 @@ static int vmx_vcpu_initialise(struct vcpu *v)
     }
 
     vmx_install_vlapic_mapping(v);
+    vmx_init_pt(v);
 
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
+        wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.buf));
+        wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
+        wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
+    }
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index ad3d84bdde..8ad658be1b 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -104,6 +104,7 @@
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


