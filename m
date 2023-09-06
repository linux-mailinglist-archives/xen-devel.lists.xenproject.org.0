Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCD793AC2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 13:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596483.930407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdqPY-0005SN-Av; Wed, 06 Sep 2023 11:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596483.930407; Wed, 06 Sep 2023 11:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdqPY-0005Ku-6H; Wed, 06 Sep 2023 11:09:28 +0000
Received: by outflank-mailman (input) for mailman id 596483;
 Wed, 06 Sep 2023 11:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T1xS=EW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qdqPX-0005Hq-1g
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 11:09:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6b5866e-4ca5-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 13:09:25 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 1EBB94EE0739;
 Wed,  6 Sep 2023 13:09:24 +0200 (CEST)
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
X-Inumbo-ID: d6b5866e-4ca5-11ee-8783-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 1/2] xen: apply deviation for Rule 8.4 (asm-only definitions)
Date: Wed,  6 Sep 2023 13:09:08 +0200
Message-Id: <ef301ab9843d810a389f175bd8a204f362b58e27.1693998375.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693998375.git.nicola.vetrini@bugseng.com>
References: <cover.1693998375.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in 'docs/misra/rules.rst' the functions that are used only by
asm modules do not need to conform to MISRA C:2012 Rule 8.4.
The deviations are carried out with a SAF comment.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Removed deviations on variables
---
 docs/misra/safe.json        | 8 ++++++++
 xen/arch/arm/cpuerrata.c    | 1 +
 xen/arch/arm/setup.c        | 1 +
 xen/arch/arm/smpboot.c      | 1 +
 xen/arch/arm/traps.c        | 7 +++++++
 xen/arch/x86/boot/cmdline.c | 1 +
 xen/arch/x86/boot/reloc.c   | 1 +
 xen/arch/x86/extable.c      | 4 ++--
 xen/arch/x86/setup.c        | 1 +
 xen/arch/x86/traps.c        | 9 +++++++++
 xen/common/efi/boot.c       | 5 +++--
 11 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index e3c8a1d8eb36..39c5c056c7d4 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -12,6 +12,14 @@
         },
         {
             "id": "SAF-1-safe",
+            "analyser": {
+                "eclair": "MC3R1.R8.4"
+            },
+            "name": "Rule 8.4: asm-only definition",
+            "text": "Functions and variables used only by asm modules do not need to have a visible declaration prior to their definition."
+        },
+        {
+            "id": "SAF-2-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index fcf32892a7ef..9137958fb682 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -370,6 +370,7 @@ custom_param("spec-ctrl", parse_spec_ctrl);
 
 /* Arm64 only for now as for Arm32 the workaround is currently handled in C. */
 #ifdef CONFIG_ARM_64
+/* SAF-1-safe */
 void __init arm_enable_wa2_handling(const struct alt_instr *alt,
                                     const uint32_t *origptr,
                                     uint32_t *updptr, int nr_inst)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 44ccea03ca14..db748839d383 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1077,6 +1077,7 @@ static bool __init is_dom0less_mode(void)
 size_t __read_mostly dcache_line_bytes;
 
 /* C entry point for boot CPU */
+/* SAF-1-safe */
 void __init start_xen(unsigned long boot_phys_offset,
                       unsigned long fdt_paddr)
 {
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index e107b86b7b44..6efd17eb3500 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -302,6 +302,7 @@ smp_prepare_cpus(void)
 }
 
 /* Boot the current CPU */
+/* SAF-1-safe */
 void start_secondary(void)
 {
     unsigned int cpuid = init_data.cpuid;
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 46c9a4031b30..ce89f16404d9 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -161,6 +161,7 @@ void init_traps(void)
     isb();
 }
 
+/* SAF-1-safe */
 void __div0(void)
 {
     printk("Division by zero in hypervisor.\n");
@@ -1954,6 +1955,7 @@ static inline bool needs_ssbd_flip(struct vcpu *v)
  * Actions that needs to be done after entering the hypervisor from the
  * guest and before the interrupts are unmasked.
  */
+/* SAF-1-safe */
 void enter_hypervisor_from_guest_preirq(void)
 {
     struct vcpu *v = current;
@@ -1968,6 +1970,7 @@ void enter_hypervisor_from_guest_preirq(void)
  * guest and before we handle any request. Depending on the exception trap,
  * this may be called with interrupts unmasked.
  */
+/* SAF-1-safe */
 void enter_hypervisor_from_guest(void)
 {
     struct vcpu *v = current;
@@ -1996,6 +1999,7 @@ void enter_hypervisor_from_guest(void)
     vgic_sync_from_lrs(v);
 }
 
+/* SAF-1-safe */
 void do_trap_guest_sync(struct cpu_user_regs *regs)
 {
     const union hsr hsr = { .bits = regs->hsr };
@@ -2191,11 +2195,13 @@ void do_trap_guest_serror(struct cpu_user_regs *regs)
     __do_trap_serror(regs, true);
 }
 
+/* SAF-1-safe */
 void do_trap_irq(struct cpu_user_regs *regs)
 {
     gic_interrupt(regs, 0);
 }
 
+/* SAF-1-safe */
 void do_trap_fiq(struct cpu_user_regs *regs)
 {
     gic_interrupt(regs, 1);
@@ -2269,6 +2275,7 @@ static bool check_for_vcpu_work(void)
  *
  * The function will return with IRQ masked.
  */
+/* SAF-1-safe */
 void leave_hypervisor_to_guest(void)
 {
     local_irq_disable();
diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index 74997703b31e..f9eee756aaed 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -340,6 +340,7 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
 }
 #endif
 
+/* SAF-1-safe */
 void __stdcall cmdline_parse_early(const char *cmdline, early_boot_opts_t *ebo)
 {
     if ( !cmdline )
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e22bb974bf20..609b02cb73dc 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -347,6 +347,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     return mbi_out;
 }
 
+/* SAF-1-safe */
 void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
                       uint32_t video_info)
 {
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index c3771c2e3937..74b14246e9d8 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -194,8 +194,8 @@ static int __init cf_check stub_selftest(void)
 __initcall(stub_selftest);
 #endif
 
-unsigned long
-search_pre_exception_table(struct cpu_user_regs *regs)
+/* SAF-1-safe */
+unsigned long search_pre_exception_table(struct cpu_user_regs *regs)
 {
     unsigned long addr = regs->rip;
     unsigned long fixup = search_one_extable(
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3358d9a0ff63..08ba1f95d635 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -968,6 +968,7 @@ static struct domain *__init create_dom0(const module_t *image,
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
+/* SAF-1-safe */
 void __init noreturn __start_xen(unsigned long mbi_p)
 {
     const char *memmap_type = NULL;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a898e1f2d731..dead728ce329 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -833,6 +833,7 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
           (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
 }
 
+/* SAF-1-safe */
 void do_unhandled_trap(struct cpu_user_regs *regs)
 {
     unsigned int trapnr = regs->entry_vector;
@@ -920,6 +921,7 @@ static bool extable_fixup(struct cpu_user_regs *regs, bool print)
     return true;
 }
 
+/* SAF-1-safe */
 void do_trap(struct cpu_user_regs *regs)
 {
     unsigned int trapnr = regs->entry_vector;
@@ -1152,6 +1154,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
     }
 }
 
+/* SAF-1-safe */
 void do_invalid_op(struct cpu_user_regs *regs)
 {
     u8 bug_insn[2];
@@ -1197,6 +1200,7 @@ void do_invalid_op(struct cpu_user_regs *regs)
     panic("FATAL TRAP: vector = %d (invalid opcode)\n", X86_EXC_UD);
 }
 
+/* SAF-1-safe */
 void do_int3(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
@@ -1564,6 +1568,7 @@ static int fixup_page_fault(unsigned long addr, struct cpu_user_regs *regs)
     return 0;
 }
 
+/* SAF-1-safe */
 void do_page_fault(struct cpu_user_regs *regs)
 {
     unsigned long addr;
@@ -1641,6 +1646,7 @@ void do_page_fault(struct cpu_user_regs *regs)
  * during early boot (an issue was seen once, but was most likely a hardware
  * problem).
  */
+/* SAF-1-safe */
 void __init do_early_page_fault(struct cpu_user_regs *regs)
 {
     static unsigned int __initdata stuck;
@@ -1841,6 +1847,7 @@ void trigger_nmi_continuation(void)
     apic_wait_icr_idle();
 }
 
+/* SAF-1-safe */
 void do_device_not_available(struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_PV
@@ -1877,6 +1884,7 @@ void do_device_not_available(struct cpu_user_regs *regs)
 #endif
 }
 
+/* SAF-1-safe */
 void do_debug(struct cpu_user_regs *regs)
 {
     unsigned long dr6;
@@ -2002,6 +2010,7 @@ void do_debug(struct cpu_user_regs *regs)
     pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 }
 
+/* SAF-1-safe */
 void do_entry_CP(struct cpu_user_regs *regs)
 {
     static const char errors[][10] = {
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 79a654af69b0..99cb033e2a6f 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1253,8 +1253,9 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
     efi_fw_vendor = (void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
 }
 
-void EFIAPI __init noreturn
-efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
+/* SAF-1-safe */
+void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
+                                      EFI_SYSTEM_TABLE *SystemTable)
 {
     static EFI_GUID __initdata loaded_image_guid = LOADED_IMAGE_PROTOCOL;
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
-- 
2.34.1


