Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A141E4E3E
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:34:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1on-0006Zx-FV; Wed, 27 May 2020 19:34:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1om-0006Zk-GC
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:34:24 +0000
X-Inumbo-ID: 0faab7f6-a051-11ea-9947-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0faab7f6-a051-11ea-9947-bc764e2007e4;
 Wed, 27 May 2020 19:34:20 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 63PRrOCGIORe2oeMNymVJruyxbUTOeT4sjMpQqtroN19UX8P7qCkVtoTz54iDIaAiqLt8qi9Mt
 /mY5IUfUBqYTY0xurY8LU5jdhtOp6HuTYlEiklfG2DC9LhZY0K3tUy6xmWj8ODIDd1+1pljwbE
 J0alG1ldPodeuqZw1ayxiyajiThrKxl/Yfsk9Yvwobj9x3FG8Oag6vtyxB+8BDQ/rV4DJ0Mpy3
 ktkAj6jGI3H2I4XnI6XxUP8E6NFqbejvopVIRC3Kd3z7D47rXDJtqwsnXGYxIGD+f/2mpjbITz
 QWA=
X-SBRS: 2.7
X-MesageID: 18890129
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18890129"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 14/14] x86/shstk: Activate Supervisor Shadow Stacks
Date: Wed, 27 May 2020 20:18:47 +0100
Message-ID: <20200527191847.17207-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
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

With all other plumbing in place, activate shadow stacks when possible.  Note
that this requires prohibiting the use of PV32.  Compatibility can be
maintained if necessary via PV-Shim.

The BSP needs to wait until alternatives have run (to avoid interaction with
CR0.WP), and after the first reset_stack_and_jump() to avoid having a pristine
shadow stack interact in problematic ways with an in-use regular stack.
Activate shadow stack in reinit_bsp_stack().

APs have all infrastructure set up by the booting CPU, so enable shadow stacks
before entering C.  Adjust the logic to call start_secondary rather than jump
to it, so stack traces make more sense.

The crash path needs to turn CET off to avoid interfering with the crash
kernel's environment.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Split S3 out into earlier patch.
 * Discuss CET-SS disabling PV32, and start_secondary to be a call.
---
 docs/misc/xen-command-line.pandoc |  8 ++++++++
 xen/arch/x86/boot/x86_64.S        | 35 +++++++++++++++++++++++++++++++++--
 xen/arch/x86/cpu/common.c         |  5 +++++
 xen/arch/x86/crash.c              |  7 +++++++
 xen/arch/x86/setup.c              | 26 ++++++++++++++++++++++++++
 xen/arch/x86/spec_ctrl.c          |  8 ++++++++
 6 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index d4934eabb7..9892c57ee9 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -287,6 +287,10 @@ call/jmp COP/JOP) attacks.
     `cet=no-shstk` will cause Xen not to use Shadow Stacks even when support
     is available in hardware.
 
+    Shadow Stacks are incompatible with 32bit PV guests.  This option will
+    override the `pv=32` boolean to false.  Backwards compatibility can be
+    maintained with the `pv-shim` mechanism.
+
 ### clocksource (x86)
 > `= pit | hpet | acpi | tsc`
 
@@ -1726,6 +1730,10 @@ Controls for aspects of PV guest support.
 *   The `32` boolean controls whether 32bit PV guests can be created.  It
     defaults to `true`, and is ignored when `CONFIG_PV32` is compiled out.
 
+    32bit PV guests are incompatible with CET Shadow Stacks.  If Xen is using
+    shadow stacks, this option will be overridden to `false`.  Backwards
+    compatibility can be maintained with the `pv-shim` mechanism.
+
 ### pv-linear-pt (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 314a32a19f..551acd9e94 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -28,8 +28,39 @@ ENTRY(__high_start)
         lretq
 1:
         test    %ebx,%ebx
-        jnz     start_secondary
-
+        jz      .L_bsp
+
+        /* APs.  Set up shadow stacks before entering C. */
+
+        testl   $cpufeat_mask(X86_FEATURE_XEN_SHSTK), \
+                CPUINFO_FEATURE_OFFSET(X86_FEATURE_XEN_SHSTK) + boot_cpu_data(%rip)
+        je      .L_ap_shstk_done
+
+        /* Set up MSR_S_CET. */
+        mov     $MSR_S_CET, %ecx
+        xor     %edx, %edx
+        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
+        wrmsr
+
+        /* Derive MSR_PL0_SSP from %rsp (token written when stack is allocated). */
+        mov     $MSR_PL0_SSP, %ecx
+        mov     %rsp, %rdx
+        shr     $32, %rdx
+        mov     %esp, %eax
+        and     $~(STACK_SIZE - 1), %eax
+        or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %eax
+        wrmsr
+
+        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
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
index dcc9ee08de..b4416f941c 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -329,6 +329,11 @@ void __init early_cpu_init(void)
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
index 584589baff..0c4fd8c6a8 100644
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
 
@@ -1065,6 +1072,21 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
 
@@ -1801,6 +1823,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
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
-- 
2.11.0


