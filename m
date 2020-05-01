Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881781C2115
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 01:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUehq-0001DA-Oz; Fri, 01 May 2020 23:04:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUehp-0001Cf-IW
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 23:04:29 +0000
X-Inumbo-ID: 18c43340-8c00-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18c43340-8c00-11ea-ae69-bc764e2007e4;
 Fri, 01 May 2020 23:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588374263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QQTKLF5FcqWscWYTybl+ldFADN5l5S3i4DlWR7dOp0U=;
 b=Bwi9hlB9twrgPWza/i/YntZ7SklkzWhK0zE/g/G/SlgHFMG1/egX3gKX
 pNcAshrDAbplO/4jVljkNkPC1zAWbTKDzYomEKd6oZtxIpiF20Y69E8TV
 QOJQ6WlGJkW5YTquqzoPxHYHHf/xIEr+FhrtMG06LTnJLim37yBAiurYE Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: warOANc0prrJjWlz01fdFNaC2VNLf73T7N7GydCNmFSXCFe6EDaDu2iZOgOD68YmWQ2GEUfuTM
 A3HcFFK3s9Rbp+jKi7I/QHNKpiiv3hEgRrValrt6B2uexJr9r9j2RQBlv18LDcAJN6qN82CoNV
 QwD4q0xFbOm8t9Xqc6X/l+FMOacKZQOIj+ynNDE/6wNHVHsEfc+Zezrmp0KIqz+NGH6XtijoDo
 Gq0NcGs3jzdFKwVRtlo9phZJaYJargH2g+P0H+mSlZWhbZTuT02AP6LyQn/c+u6tIXqkBeE+Wm
 eW4=
X-SBRS: 2.7
X-MesageID: 16855100
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16855100"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 16/16] x86/shstk: Activate Supervisor Shadow Stacks
Date: Fri, 1 May 2020 23:58:38 +0100
Message-ID: <20200501225838.9866-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With all other plumbing in place, activate shadow stacks when possible.

The BSP needs to wait until alternatives have run (to avoid interaction with
CR0.WP), and after the first reset_stack_and_jump() to avoid having a pristine
shadow stack interact in problematic ways with an in-use regular stack.
Activate shadow stack in reinit_bsp_stack().

APs have all infrastructure set up by the booting CPU, so enable shadow stacks
before entering C.  The S3 path needs save and restore SSP along side RSP.

The crash path needs to turn CET off to avoid interfereing with the kexec
kernel's environment.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/wakeup_prot.S | 56 +++++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/boot/x86_64.S      | 30 +++++++++++++++++++++-
 xen/arch/x86/cpu/common.c       |  5 ++++
 xen/arch/x86/crash.c            |  7 ++++++
 xen/arch/x86/setup.c            | 26 +++++++++++++++++++
 xen/arch/x86/spec_ctrl.c        |  8 ++++++
 xen/include/asm-x86/msr-index.h |  3 +++
 xen/include/asm-x86/x86-defns.h |  1 +
 8 files changed, 135 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 4dba6020a7..22c0f8cc79 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -1,3 +1,8 @@
+#include <asm/config.h>
+#include <asm/msr-index.h>
+#include <asm/page.h>
+#include <asm/processor.h>
+
         .file __FILE__
         .text
         .code64
@@ -15,6 +20,12 @@ ENTRY(do_suspend_lowlevel)
         mov     %cr0, %rax
         mov     %rax, saved_cr0(%rip)
 
+#ifdef CONFIG_XEN_SHSTK
+        mov     $1, %eax
+        rdsspq  %rax
+        mov     %rax, saved_ssp(%rip)
+#endif
+
         /* enter sleep state physically */
         mov     $3, %edi
         call    acpi_enter_sleep_state
@@ -48,6 +59,48 @@ ENTRY(s3_resume)
         pushq   %rax
         lretq
 1:
+#ifdef CONFIG_XEN_SHSTK
+	/*
+         * Restoring SSP is a little convoluted, because we are intercepting
+         * the middle of an in-use shadow stack.  Write a temporary supervisor
+         * token under the stack, so SETSSBSY takes us where we want, then
+         * reset MSR_PL0_SSP to its usual value and pop the temporary token.
+         */
+        mov     saved_rsp(%rip), %rdi
+        cmpq    $1, %rdi
+        je      .L_shstk_done
+
+        /* Write a supervisor token under SSP. */
+        sub     $8, %rdi
+        mov     %rdi, (%rdi)
+
+        /* Load it into MSR_PL0_SSP. */
+        mov     $MSR_PL0_SSP, %ecx
+        mov     %rdi, %rdx
+        shr     $32, %rdx
+        mov     %edi, %eax
+
+        /* Enable CET. */
+        mov     $MSR_S_CET, %ecx
+        xor     %edx, %edx
+        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
+        wrmsr
+
+        /* Activate our temporary token. */
+        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
+        mov     %rbx, %cr4
+        setssbsy
+
+        /* Reset MSR_PL0_SSP back to its expected value. */
+        and     $~(STACK_SIZE - 1), %eax
+        or      $0x5ff8, %eax
+        wrmsr
+
+        /* Pop the temporary token off the stack. */
+        mov     $2, %eax
+        incsspd %eax
+.L_shstk_done:
+#endif
 
         call    load_system_tables
 
@@ -65,6 +118,9 @@ ENTRY(s3_resume)
 
 saved_rsp:      .quad   0
 saved_cr0:      .quad   0
+#ifdef CONFIG_XEN_SHSTK
+saved_ssp:      .quad   0
+#endif
 
 GLOBAL(saved_magic)
         .long   0x9abcdef0
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 314a32a19f..59b770f955 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -28,8 +28,36 @@ ENTRY(__high_start)
         lretq
 1:
         test    %ebx,%ebx
-        jnz     start_secondary
+        jz      .L_bsp
 
+        /* APs.  Set up shadow stacks before entering C. */
+
+        testl   $cpufeat_mask(X86_FEATURE_XEN_SHSTK), \
+                CPUINFO_FEATURE_OFFSET(X86_FEATURE_XEN_SHSTK) + boot_cpu_data(%rip)
+        je      .L_ap_shstk_done
+
+        mov     $MSR_S_CET, %ecx
+        xor     %edx, %edx
+        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
+        wrmsr
+
+        mov     $MSR_PL0_SSP, %ecx
+        mov     %rsp, %rdx
+        shr     $32, %rdx
+        mov     %esp, %eax
+        and     $~(STACK_SIZE - 1), %eax
+        or      $0x5ff8, %eax
+        wrmsr
+
+        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
+        mov     %rcx, %cr4
+        setssbsy
+
+.L_ap_shstk_done:
+        call    start_secondary
+        BUG     /* start_secondary() shouldn't return. */
+
+.L_bsp:
         /* Pass off the Multiboot info structure to C land (if applicable). */
         mov     multiboot_ptr(%rip),%edi
         call    __start_xen
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 3962717aa5..a77be36349 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -323,6 +323,11 @@ void __init early_cpu_init(void)
 	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
 	       c->x86_model, c->x86_model, c->x86_mask, eax);
 
+	if (c->cpuid_level >= 7) {
+		cpuid_count(7, 0, &eax, &ebx, &ecx, &edx);
+		c->x86_capability[cpufeat_word(X86_FEATURE_CET_SS)] = ecx;
+	}
+
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
 		eax = cpuid_eax(0x80000008);
diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 450eecd46b..0611b4fb9b 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -200,6 +200,13 @@ void machine_crash_shutdown(void)
     /* Reset CPUID masking and faulting to the host's default. */
     ctxt_switch_levelling(NULL);
 
+    /* Disable shadow stacks. */
+    if ( cpu_has_xen_shstk )
+    {
+        wrmsrl(MSR_S_CET, 0);
+        write_cr4(read_cr4() & ~X86_CR4_CET);
+    }
+
     info = kexec_crash_save_info();
     info->xen_phys_start = xen_phys_start;
     info->dom0_pfn_to_mfn_frame_list_list =
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index aa21201507..5c574b2035 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -664,6 +664,13 @@ static void __init noreturn reinit_bsp_stack(void)
     stack_base[0] = stack;
     memguard_guard_stack(stack);
 
+    if ( cpu_has_xen_shstk )
+    {
+        wrmsrl(MSR_PL0_SSP, (unsigned long)stack + 0x5ff8);
+        wrmsrl(MSR_S_CET, CET_SHSTK_EN | CET_WRSS_EN);
+        asm volatile ("setssbsy" ::: "memory");
+    }
+
     reset_stack_and_jump_nolp(init_done);
 }
 
@@ -985,6 +992,21 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     /* This must come before e820 code because it sets paddr_bits. */
     early_cpu_init();
 
+    /* Choose shadow stack early, to set infrastructure up appropriately. */
+    if ( opt_xen_shstk && boot_cpu_has(X86_FEATURE_CET_SS) )
+    {
+        printk("Enabling Supervisor Shadow Stacks\n");
+
+        setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
+#ifdef CONFIG_PV32
+        if ( opt_pv32 )
+        {
+            opt_pv32 = 0;
+            printk("  - Disabling PV32 due to Shadow Stacks\n");
+        }
+#endif
+    }
+
     /* Sanitise the raw E820 map to produce a final clean version. */
     max_page = raw_max_page = init_e820(memmap_type, &e820_raw);
 
@@ -1721,6 +1743,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     alternative_branches();
 
+    /* Defer CR4.CET until alternatives have finished playing with CR4.WP */
+    if ( cpu_has_xen_shstk )
+        set_in_cr4(X86_CR4_CET);
+
     /*
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
      * physical cpu_add/remove functions, so launch the guest with only
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index c5d8e587a8..a94be2d594 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -882,6 +882,14 @@ void __init init_speculation_mitigations(void)
     hw_smt_enabled = check_smt_enabled();
 
     /*
+     * First, disable the use of retpolines if Xen is using shadow stacks, as
+     * they are incompatible.
+     */
+    if ( cpu_has_xen_shstk &&
+         (opt_thunk == THUNK_DEFAULT || opt_thunk == THUNK_RETPOLINE) )
+        thunk = THUNK_JMP;
+
+    /*
      * Has the user specified any custom BTI mitigations?  If so, follow their
      * instructions exactly and disable all heuristics.
      */
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index 85c5f20b76..cdfb7b047b 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -68,6 +68,9 @@
 
 #define MSR_U_CET                           0x000006a0
 #define MSR_S_CET                           0x000006a2
+#define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
+#define  CET_WRSS_EN                        (_AC(1, ULL) <<  1)
+
 #define MSR_PL0_SSP                         0x000006a4
 #define MSR_PL1_SSP                         0x000006a5
 #define MSR_PL2_SSP                         0x000006a6
diff --git a/xen/include/asm-x86/x86-defns.h b/xen/include/asm-x86/x86-defns.h
index 84e15b15be..4051a80485 100644
--- a/xen/include/asm-x86/x86-defns.h
+++ b/xen/include/asm-x86/x86-defns.h
@@ -73,6 +73,7 @@
 #define X86_CR4_SMEP       0x00100000 /* enable SMEP */
 #define X86_CR4_SMAP       0x00200000 /* enable SMAP */
 #define X86_CR4_PKE        0x00400000 /* enable PKE */
+#define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
 
 /*
  * XSTATE component flags in XCR0
-- 
2.11.0


