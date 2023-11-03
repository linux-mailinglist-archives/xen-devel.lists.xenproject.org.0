Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491447E07EA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 19:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627305.978260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyyY2-0001du-N2; Fri, 03 Nov 2023 18:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627305.978260; Fri, 03 Nov 2023 18:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyyY2-0001bh-K2; Fri, 03 Nov 2023 18:05:34 +0000
Received: by outflank-mailman (input) for mailman id 627305;
 Fri, 03 Nov 2023 18:05:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozhd=GQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qyyY1-0001bb-IE
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 18:05:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 938875be-7a73-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 19:05:31 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C5FBE4EE0744;
 Fri,  3 Nov 2023 19:05:29 +0100 (CET)
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
X-Inumbo-ID: 938875be-7a73-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH][for-4.19] xen: replace occurrences of SAF-1-safe with asmlinkage attribute
Date: Fri,  3 Nov 2023 19:05:27 +0100
Message-Id: <334b360fada7177e0b6e074fbdd33e02ce186b8f.1699034672.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
by the asmlinkage pseudo-attribute, for the sake of uniformity.
The deviation with a comment based on the SAF framework is also
mentioned as a last resort.

Add missing 'xen/compiler.h' #include-s where needed.

The text in docs/misra/deviations.rst is modified to reflect this change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/deviations.rst   |  6 +++---
 xen/arch/arm/cpuerrata.c    |  7 +++----
 xen/arch/arm/setup.c        |  5 ++---
 xen/arch/arm/smpboot.c      |  3 +--
 xen/arch/arm/traps.c        | 21 +++++++--------------
 xen/arch/x86/boot/cmdline.c |  5 +++--
 xen/arch/x86/boot/reloc.c   |  7 ++++---
 xen/arch/x86/extable.c      |  3 +--
 xen/arch/x86/setup.c        |  3 +--
 xen/arch/x86/traps.c        | 27 +++++++++------------------
 xen/common/efi/boot.c       |  5 ++---
 11 files changed, 36 insertions(+), 56 deletions(-)

diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index d468da2f5ce9..ed5d36c08647 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -134,9 +134,9 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `safe` for ECLAIR.
 
    * - R8.4
-     - Functions and variables used only by asm modules are either marked with
-       the `asmlinkage` macro or with a SAF-1-safe textual deviation
-       (see safe.json).
+     - Functions and variables used only to interface with asm modules should
+       be marked with the `asmlinkage` macro. If that's not possible, consider
+       using the SAF-1-safe textual deviation (see safe.json).
      - Tagged as `safe` for ECLAIR.
 
    * - R8.6
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 9137958fb682..a28fa6ac78cc 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -370,10 +370,9 @@ custom_param("spec-ctrl", parse_spec_ctrl);
 
 /* Arm64 only for now as for Arm32 the workaround is currently handled in C. */
 #ifdef CONFIG_ARM_64
-/* SAF-1-safe */
-void __init arm_enable_wa2_handling(const struct alt_instr *alt,
-                                    const uint32_t *origptr,
-                                    uint32_t *updptr, int nr_inst)
+void asmlinkage __init arm_enable_wa2_handling(const struct alt_instr *alt,
+                                               const uint32_t *origptr,
+                                               uint32_t *updptr, int nr_inst)
 {
     BUG_ON(nr_inst != 1);
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3f3a45719ccb..bedbce3c0d37 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1077,9 +1077,8 @@ static bool __init is_dom0less_mode(void)
 size_t __read_mostly dcache_line_bytes;
 
 /* C entry point for boot CPU */
-/* SAF-1-safe */
-void __init start_xen(unsigned long boot_phys_offset,
-                      unsigned long fdt_paddr)
+void asmlinkage __init start_xen(unsigned long boot_phys_offset,
+                                 unsigned long fdt_paddr)
 {
     size_t fdt_size;
     const char *cmdline;
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index ec76de3cac12..a32f610b47d9 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -303,8 +303,7 @@ smp_prepare_cpus(void)
 }
 
 /* Boot the current CPU */
-/* SAF-1-safe */
-void start_secondary(void)
+void asmlinkage start_secondary(void)
 {
     unsigned int cpuid = init_data.cpuid;
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 5aa14d470791..63d3bc7bd67b 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -161,8 +161,7 @@ void init_traps(void)
     isb();
 }
 
-/* SAF-1-safe */
-void __div0(void)
+void asmlinkage __div0(void)
 {
     printk("Division by zero in hypervisor.\n");
     BUG();
@@ -1955,8 +1954,7 @@ static inline bool needs_ssbd_flip(struct vcpu *v)
  * Actions that needs to be done after entering the hypervisor from the
  * guest and before the interrupts are unmasked.
  */
-/* SAF-1-safe */
-void enter_hypervisor_from_guest_preirq(void)
+void asmlinkage enter_hypervisor_from_guest_preirq(void)
 {
     struct vcpu *v = current;
 
@@ -1970,8 +1968,7 @@ void enter_hypervisor_from_guest_preirq(void)
  * guest and before we handle any request. Depending on the exception trap,
  * this may be called with interrupts unmasked.
  */
-/* SAF-1-safe */
-void enter_hypervisor_from_guest(void)
+void asmlinkage enter_hypervisor_from_guest(void)
 {
     struct vcpu *v = current;
 
@@ -1999,8 +1996,7 @@ void enter_hypervisor_from_guest(void)
     vgic_sync_from_lrs(v);
 }
 
-/* SAF-1-safe */
-void do_trap_guest_sync(struct cpu_user_regs *regs)
+void asmlinkage do_trap_guest_sync(struct cpu_user_regs *regs)
 {
     const union hsr hsr = { .bits = regs->hsr };
 
@@ -2195,14 +2191,12 @@ void do_trap_guest_serror(struct cpu_user_regs *regs)
     __do_trap_serror(regs, true);
 }
 
-/* SAF-1-safe */
-void do_trap_irq(struct cpu_user_regs *regs)
+void asmlinkage do_trap_irq(struct cpu_user_regs *regs)
 {
     gic_interrupt(regs, 0);
 }
 
-/* SAF-1-safe */
-void do_trap_fiq(struct cpu_user_regs *regs)
+void asmlinkage do_trap_fiq(struct cpu_user_regs *regs)
 {
     gic_interrupt(regs, 1);
 }
@@ -2275,8 +2269,7 @@ static bool check_for_vcpu_work(void)
  *
  * The function will return with IRQ masked.
  */
-/* SAF-1-safe */
-void leave_hypervisor_to_guest(void)
+void asmlinkage leave_hypervisor_to_guest(void)
 {
     local_irq_disable();
 
diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index f9eee756aaed..93c6b68ed909 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -31,6 +31,7 @@ asm (
     );
 
 #include <xen/kconfig.h>
+#include <xen/compiler.h>
 #include "defs.h"
 #include "video.h"
 
@@ -340,8 +341,8 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
 }
 #endif
 
-/* SAF-1-safe */
-void __stdcall cmdline_parse_early(const char *cmdline, early_boot_opts_t *ebo)
+void asmlinkage __stdcall cmdline_parse_early(const char *cmdline,
+                                              early_boot_opts_t *ebo)
 {
     if ( !cmdline )
         return;
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 609b02cb73dc..668918db879a 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -33,6 +33,8 @@ asm (
 #include "../../../include/xen/kconfig.h"
 #include <public/arch-x86/hvm/start_info.h>
 
+#include <xen/compiler.h>
+
 #ifdef CONFIG_VIDEO
 # include "video.h"
 
@@ -347,9 +349,8 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     return mbi_out;
 }
 
-/* SAF-1-safe */
-void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
-                      uint32_t video_info)
+void *asmlinkage __stdcall reloc(uint32_t magic, uint32_t in,
+                                 uint32_t trampoline, uint32_t video_info)
 {
     alloc = trampoline;
 
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 74b14246e9d8..51245221ec03 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -194,8 +194,7 @@ static int __init cf_check stub_selftest(void)
 __initcall(stub_selftest);
 #endif
 
-/* SAF-1-safe */
-unsigned long search_pre_exception_table(struct cpu_user_regs *regs)
+unsigned asmlinkage long search_pre_exception_table(struct cpu_user_regs *regs)
 {
     unsigned long addr = regs->rip;
     unsigned long fixup = search_one_extable(
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d70ad1e44a60..958ebeeef0c3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -970,8 +970,7 @@ static struct domain *__init create_dom0(const module_t *image,
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
-/* SAF-1-safe */
-void __init noreturn __start_xen(unsigned long mbi_p)
+void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 {
     const char *memmap_type = NULL;
     char *cmdline, *kextra, *loader;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 6393467b06fd..2c2e19fe8964 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -833,8 +833,7 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
           (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
 }
 
-/* SAF-1-safe */
-void do_unhandled_trap(struct cpu_user_regs *regs)
+void asmlinkage do_unhandled_trap(struct cpu_user_regs *regs)
 {
     unsigned int trapnr = regs->entry_vector;
 
@@ -921,8 +920,7 @@ static bool extable_fixup(struct cpu_user_regs *regs, bool print)
     return true;
 }
 
-/* SAF-1-safe */
-void do_trap(struct cpu_user_regs *regs)
+void asmlinkage do_trap(struct cpu_user_regs *regs)
 {
     unsigned int trapnr = regs->entry_vector;
 
@@ -1154,8 +1152,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
     }
 }
 
-/* SAF-1-safe */
-void do_invalid_op(struct cpu_user_regs *regs)
+void asmlinkage do_invalid_op(struct cpu_user_regs *regs)
 {
     u8 bug_insn[2];
     const void *eip = (const void *)regs->rip;
@@ -1200,8 +1197,7 @@ void do_invalid_op(struct cpu_user_regs *regs)
     panic("FATAL TRAP: vector = %d (invalid opcode)\n", X86_EXC_UD);
 }
 
-/* SAF-1-safe */
-void do_int3(struct cpu_user_regs *regs)
+void asmlinkage do_int3(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
 
@@ -1568,8 +1564,7 @@ static int fixup_page_fault(unsigned long addr, struct cpu_user_regs *regs)
     return 0;
 }
 
-/* SAF-1-safe */
-void do_page_fault(struct cpu_user_regs *regs)
+void asmlinkage do_page_fault(struct cpu_user_regs *regs)
 {
     unsigned long addr;
     unsigned int error_code;
@@ -1646,8 +1641,7 @@ void do_page_fault(struct cpu_user_regs *regs)
  * during early boot (an issue was seen once, but was most likely a hardware
  * problem).
  */
-/* SAF-1-safe */
-void __init do_early_page_fault(struct cpu_user_regs *regs)
+void asmlinkage __init do_early_page_fault(struct cpu_user_regs *regs)
 {
     static unsigned int __initdata stuck;
     static unsigned long __initdata prev_eip, prev_cr2;
@@ -1847,8 +1841,7 @@ void trigger_nmi_continuation(void)
     apic_wait_icr_idle();
 }
 
-/* SAF-1-safe */
-void do_device_not_available(struct cpu_user_regs *regs)
+void asmlinkage do_device_not_available(struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_PV
     struct vcpu *curr = current;
@@ -1884,8 +1877,7 @@ void do_device_not_available(struct cpu_user_regs *regs)
 #endif
 }
 
-/* SAF-1-safe */
-void do_debug(struct cpu_user_regs *regs)
+void asmlinkage do_debug(struct cpu_user_regs *regs)
 {
     unsigned long dr6;
     struct vcpu *v = current;
@@ -2010,8 +2002,7 @@ void do_debug(struct cpu_user_regs *regs)
     pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 }
 
-/* SAF-1-safe */
-void do_entry_CP(struct cpu_user_regs *regs)
+void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
 {
     static const char errors[][10] = {
         [1] = "near ret",
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e5e86f22b2b2..bc58dfce2f6c 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1254,9 +1254,8 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
     efi_fw_vendor = (void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
 }
 
-/* SAF-1-safe */
-void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
-                                      EFI_SYSTEM_TABLE *SystemTable)
+void asmlinkage EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
+                                                 EFI_SYSTEM_TABLE *SystemTable)
 {
     static EFI_GUID __initdata loaded_image_guid = LOADED_IMAGE_PROTOCOL;
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
-- 
2.34.1


