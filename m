Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04C3555F3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 16:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105994.202689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmHZ-0005U4-83; Tue, 06 Apr 2021 14:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105994.202689; Tue, 06 Apr 2021 14:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmHZ-0005Tf-37; Tue, 06 Apr 2021 14:02:17 +0000
Received: by outflank-mailman (input) for mailman id 105994;
 Tue, 06 Apr 2021 14:02:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTmHX-0005Sv-Sf
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:02:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a47c945-85f7-48a6-837b-9d027c5dec58;
 Tue, 06 Apr 2021 14:02:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92593B178;
 Tue,  6 Apr 2021 14:02:08 +0000 (UTC)
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
X-Inumbo-ID: 3a47c945-85f7-48a6-837b-9d027c5dec58
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617717728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2+SZoShJf96g9SNse0hjvg19m/VI9Uy4veE6w5iXx4=;
	b=TfuiLuZNikliXehi6l3SzMMrE+eMbJBu5938OBg9i52kth2DgpIQsaP06YffigpFJq7Lxb
	JgrglpVq3632Gb4yVclGqIgYGygnQ1HhZ2WdXEYEc6+bweBWsjuzJUAbDZMMAR6clwWhUh
	+4Q5VwHbyw8UTsQi5tOVXgvzS4ge1/k=
Subject: [PATCH v2 3/3] x86: avoid building COMPAT code when !HVM && !PV32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
Message-ID: <85b6edfc-9756-9dd0-c90f-f46dc120dade@suse.com>
Date: Tue, 6 Apr 2021 16:02:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It was probably a mistake to, over time, drop various CONFIG_COMPAT
conditionals from x86-specific code, as we now have a build
configuration again where we'd prefer this to be unset. Arrange for
CONFIG_COMPAT to actually be off in this case, dealing with fallout.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,7 +6,6 @@ config X86
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
 	select ARCH_SUPPORTS_INT128
-	select COMPAT
 	select CORE_PARKING
 	select HAS_ALTERNATIVE
 	select HAS_CPUFREQ
@@ -57,6 +56,7 @@ config PV32
 	bool "Support for 32bit PV guests"
 	depends on PV
 	default y
+	select COMPAT
 	---help---
 	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
 	  was deprecated and mostly removed in the AMD64 spec.  As a result,
@@ -91,6 +91,7 @@ config PV_LINEAR_PT
 
 config HVM
 	def_bool !PV_SHIM_EXCLUSIVE
+	select COMPAT
 	select IOREQ_SERVER
 	prompt "HVM support"
 	---help---
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -50,7 +50,8 @@ obj-y += nmi.o
 obj-y += numa.o
 obj-y += pci.o
 obj-y += percpu.o
-obj-y += physdev.o x86_64/physdev.o
+obj-y += physdev.o
+obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-y += psr.o
 obj-y += setup.o
 obj-y += shutdown.o
@@ -72,7 +73,8 @@ obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
-obj-y += platform_hypercall.o x86_64/platform_hypercall.o
+obj-y += platform_hypercall.o
+obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 obj-y += sysctl.o
 endif
 
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1291,6 +1291,8 @@ static void x86_mc_mceinject(void *data)
 #error BITS_PER_LONG definition absent
 #endif
 
+# ifdef CONFIG_COMPAT
+
 # include <compat/arch-x86/xen-mca.h>
 
 # define xen_mcinfo_msr              mcinfo_msr
@@ -1343,6 +1345,11 @@ CHECK_mcinfo_recovery;
 # undef xen_page_offline_action
 # undef xen_mcinfo_recovery
 
+# else
+#  define compat_handle_is_null(h) true
+#  define copy_to_compat(h, p, n)  true /* really (-EFAULT), but gcc chokes */
+# endif /* CONFIG_COMPAT */
+
 /* Machine Check Architecture Hypercall */
 long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
 {
@@ -1351,11 +1358,15 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_m
     struct vcpu *v = current;
     union {
         struct xen_mc_fetch *nat;
+#ifdef CONFIG_COMPAT
         struct compat_mc_fetch *cmp;
+#endif
     } mc_fetch;
     union {
         struct xen_mc_physcpuinfo *nat;
+#ifdef CONFIG_COMPAT
         struct compat_mc_physcpuinfo *cmp;
+#endif
     } mc_physcpuinfo;
     uint32_t flags, cmdflags;
     int nlcpu;
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -39,10 +39,12 @@
 #include <public/pmu.h>
 #include <xsm/xsm.h>
 
+#ifdef CONFIG_COMPAT
 #include <compat/pmu.h>
 CHECK_pmu_cntr_pair;
 CHECK_pmu_data;
 CHECK_pmu_params;
+#endif
 
 static unsigned int __read_mostly opt_vpmu_enabled;
 unsigned int __read_mostly vpmu_mode = XENPMU_MODE_OFF;
@@ -232,6 +234,7 @@ void vpmu_do_interrupt(struct cpu_user_r
             domid = sampled->domain->domain_id;
 
         /* Store appropriate registers in xenpmu_data */
+#ifdef CONFIG_COMPAT
         /* FIXME: 32-bit PVH should go here as well */
         if ( is_pv_32bit_vcpu(sampling) )
         {
@@ -254,6 +257,7 @@ void vpmu_do_interrupt(struct cpu_user_r
                 *flags |= PMU_SAMPLE_USER;
         }
         else
+#endif
         {
             struct xen_pmu_regs *r = &vpmu->xenpmu_data->pmu.r.regs;
 
@@ -448,7 +452,9 @@ static int vpmu_arch_initialise(struct v
     BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
     BUILD_BUG_ON(sizeof(struct xen_pmu_amd_ctxt) > XENPMU_CTXT_PAD_SZ);
     BUILD_BUG_ON(sizeof(struct xen_pmu_regs) > XENPMU_REGS_PAD_SZ);
+#ifdef CONFIG_COMPAT
     BUILD_BUG_ON(sizeof(struct compat_pmu_regs) > XENPMU_REGS_PAD_SZ);
+#endif
 
     ASSERT(!(vpmu->flags & ~VPMU_AVAILABLE) && !vpmu->context);
 
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -64,7 +64,9 @@
 #include <asm/amd.h>
 #include <xen/numa.h>
 #include <xen/iommu.h>
+#ifdef CONFIG_COMPAT
 #include <compat/vcpu.h>
+#endif
 #include <asm/psr.h>
 #include <asm/pv/domain.h>
 #include <asm/pv/mm.h>
@@ -1020,11 +1022,13 @@ void arch_domain_creation_finished(struc
         hvm_domain_creation_finished(d);
 }
 
+#ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
 CHECK_FIELD_(struct, vcpu_guest_context, fpu_ctxt);
 #undef fpu_ctxt
 #undef xen_vcpu_guest_context
+#endif
 
 /* Called by XEN_DOMCTL_setvcpucontext and VCPUOP_initialise. */
 int arch_set_info_guest(
@@ -1045,7 +1049,11 @@ int arch_set_info_guest(
      * we expect the tools to DTRT even in compat-mode callers. */
     compat = is_pv_32bit_domain(d);
 
+#ifdef CONFIG_COMPAT
 #define c(fld) (compat ? (c.cmp->fld) : (c.nat->fld))
+#else
+#define c(fld) (c.nat->fld)
+#endif
     flags = c(flags);
 
     if ( is_pv_domain(d) )
@@ -1078,6 +1086,7 @@ int arch_set_info_guest(
             if ( !__addr_ok(c.nat->ldt_base) )
                 return -EINVAL;
         }
+#ifdef CONFIG_COMPAT
         else
         {
             fixup_guest_stack_selector(d, c.cmp->user_regs.ss);
@@ -1089,6 +1098,7 @@ int arch_set_info_guest(
             for ( i = 0; i < ARRAY_SIZE(c.cmp->trap_ctxt); i++ )
                 fixup_guest_code_selector(d, c.cmp->trap_ctxt[i].cs);
         }
+#endif
 
         /* LDT safety checks. */
         if ( ((c(ldt_base) & (PAGE_SIZE - 1)) != 0) ||
@@ -1119,6 +1129,7 @@ int arch_set_info_guest(
             memcpy(v->arch.pv.trap_ctxt, c.nat->trap_ctxt,
                    sizeof(c.nat->trap_ctxt));
     }
+#ifdef CONFIG_COMPAT
     else
     {
         XLAT_cpu_user_regs(&v->arch.user_regs, &c.cmp->user_regs);
@@ -1129,6 +1140,7 @@ int arch_set_info_guest(
                                c.cmp->trap_ctxt + i);
         }
     }
+#endif
 
     if ( v->vcpu_id == 0 && (c(vm_assist) & ~arch_vm_assist_valid_mask(d)) )
         return -EINVAL;
@@ -1184,13 +1196,17 @@ int arch_set_info_guest(
                 pfn = pagetable_get_pfn(v->arch.guest_table_user);
                 fail |= xen_pfn_to_cr3(pfn) != c.nat->ctrlreg[1];
             }
-        } else {
+        }
+#ifdef CONFIG_COMPAT
+        else
+        {
             l4_pgentry_t *l4tab = map_domain_page(_mfn(pfn));
 
             pfn = l4e_get_pfn(*l4tab);
             unmap_domain_page(l4tab);
             fail = compat_pfn_to_cr3(pfn) != c.cmp->ctrlreg[3];
         }
+#endif
 
         fail |= v->arch.pv.gdt_ents != c(gdt_ents);
         for ( i = 0; !fail && i < nr_gdt_frames; ++i )
@@ -1293,6 +1309,7 @@ int arch_set_info_guest(
 
     if ( !compat )
         rc = pv_set_gdt(v, c.nat->gdt_frames, c.nat->gdt_ents);
+#ifdef CONFIG_COMPAT
     else
     {
         unsigned long gdt_frames[ARRAY_SIZE(v->arch.pv.gdt_frames)];
@@ -1302,6 +1319,7 @@ int arch_set_info_guest(
 
         rc = pv_set_gdt(v, gdt_frames, c.cmp->gdt_ents);
     }
+#endif
     if ( rc != 0 )
         return rc;
 
@@ -1309,8 +1327,10 @@ int arch_set_info_guest(
 
     if ( !compat )
         cr3_mfn = _mfn(xen_cr3_to_pfn(c.nat->ctrlreg[3]));
+#ifdef CONFIG_COMPAT
     else
         cr3_mfn = _mfn(compat_cr3_to_pfn(c.cmp->ctrlreg[3]));
+#endif
     cr3_page = get_page_from_mfn(cr3_mfn, d);
 
     if ( !cr3_page )
@@ -1817,9 +1837,13 @@ bool update_runstate_area(struct vcpu *v
 
     if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
+#ifdef CONFIG_COMPAT
         guest_handle = has_32bit_shinfo(v->domain)
             ? &v->runstate_guest.compat.p->state_entry_time + 1
             : &v->runstate_guest.native.p->state_entry_time + 1;
+#else
+        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
+#endif
         guest_handle--;
         runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
         __raw_copy_to_guest(guest_handle,
@@ -1827,6 +1851,7 @@ bool update_runstate_area(struct vcpu *v
         smp_wmb();
     }
 
+#ifdef CONFIG_COMPAT
     if ( has_32bit_shinfo(v->domain) )
     {
         struct compat_vcpu_runstate_info info;
@@ -1836,6 +1861,7 @@ bool update_runstate_area(struct vcpu *v
         rc = true;
     }
     else
+#endif
         rc = __copy_to_guest(runstate_guest(v), &runstate, 1) !=
              sizeof(runstate);
 
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1384,18 +1384,24 @@ long arch_do_domctl(
     return ret;
 }
 
+#ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
 CHECK_FIELD_(struct, vcpu_guest_context, fpu_ctxt);
 #undef fpu_ctxt
 #undef xen_vcpu_guest_context
+#endif
 
 void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 {
     unsigned int i;
     const struct domain *d = v->domain;
     bool compat = is_pv_32bit_domain(d);
+#ifdef CONFIG_COMPAT
 #define c(fld) (!compat ? (c.nat->fld) : (c.cmp->fld))
+#else
+#define c(fld) (c.nat->fld)
+#endif
 
     memcpy(&c.nat->fpu_ctxt, v->arch.fpu_ctxt, sizeof(c.nat->fpu_ctxt));
     if ( is_pv_domain(d) )
@@ -1413,6 +1419,7 @@ void arch_get_info_guest(struct vcpu *v,
             memcpy(c.nat->trap_ctxt, v->arch.pv.trap_ctxt,
                    sizeof(c.nat->trap_ctxt));
     }
+#ifdef CONFIG_COMPAT
     else
     {
         XLAT_cpu_user_regs(&c.cmp->user_regs, &v->arch.user_regs);
@@ -1423,6 +1430,7 @@ void arch_get_info_guest(struct vcpu *v,
                                v->arch.pv.trap_ctxt + i);
         }
     }
+#endif
 
     for ( i = 0; i < ARRAY_SIZE(v->arch.dr); ++i )
         c(debugreg[i] = v->arch.dr[i]);
@@ -1468,8 +1476,10 @@ void arch_get_info_guest(struct vcpu *v,
         c(ldt_ents = v->arch.pv.ldt_ents);
         for ( i = 0; i < ARRAY_SIZE(v->arch.pv.gdt_frames); ++i )
             c(gdt_frames[i] = v->arch.pv.gdt_frames[i]);
+#ifdef CONFIG_COMPAT
         BUILD_BUG_ON(ARRAY_SIZE(c.nat->gdt_frames) !=
                      ARRAY_SIZE(c.cmp->gdt_frames));
+#endif
         for ( ; i < ARRAY_SIZE(c.nat->gdt_frames); ++i )
             c(gdt_frames[i] = 0);
         c(gdt_ents = v->arch.pv.gdt_ents);
@@ -1504,6 +1514,7 @@ void arch_get_info_guest(struct vcpu *v,
                 pagetable_is_null(v->arch.guest_table_user) ? 0
                 : xen_pfn_to_cr3(pagetable_get_pfn(v->arch.guest_table_user));
         }
+#ifdef CONFIG_COMPAT
         else
         {
             const l4_pgentry_t *l4e =
@@ -1512,6 +1523,7 @@ void arch_get_info_guest(struct vcpu *v,
             c.cmp->ctrlreg[3] = compat_pfn_to_cr3(l4e_get_pfn(*l4e));
             unmap_domain_page(l4e);
         }
+#endif
 
         if ( guest_kernel_mode(v, &v->arch.user_regs) )
             c(flags |= VGCF_in_kernel);
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -8,13 +8,14 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex
 
 boot.init.o: buildid.o
 
-EFIOBJ := boot.init.o pe.init.o ebmalloc.o compat.o runtime.o
+EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
+EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
-$(EFIOBJ): CFLAGS-stack-boundary := $(cflags-stack-boundary)
+$(EFIOBJ-y): CFLAGS-stack-boundary := $(cflags-stack-boundary)
 
 obj-y := stub.o
-obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ))
-obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ))
+obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
+obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
 extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
 nocov-$(XEN_BUILD_EFI) += stub.o
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -21,10 +21,15 @@
 
 #include <xen/hypercall.h>
 
+#ifdef CONFIG_COMPAT
 #define ARGS(x, n)                              \
     [ __HYPERVISOR_ ## x ] = { n, n }
 #define COMP(x, n, c)                           \
     [ __HYPERVISOR_ ## x ] = { n, c }
+#else
+#define ARGS(x, n)    [ __HYPERVISOR_ ## x ] = { n }
+#define COMP(x, n, c) ARGS(x, n)
+#endif
 
 const hypercall_args_t hypercall_args_table[NR_hypercalls] =
 {
@@ -113,7 +118,11 @@ unsigned long hypercall_create_continuat
 
         regs->rax = op;
 
+#ifdef CONFIG_COMPAT
         if ( !curr->hcall_compat )
+#else
+        if ( true )
+#endif
         {
             for ( i = 0; *p != '\0'; i++ )
             {
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -877,9 +877,11 @@ int __init dom0_construct_pv(struct doma
         pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
                           vphysmap_start, si);
 
+#ifdef CONFIG_COMPAT
     if ( is_pv_32bit_domain(d) )
         xlat_start_info(si, pv_shim ? XLAT_start_info_console_domU
                                     : XLAT_start_info_console_dom0);
+#endif
 
     /* Return to idle domain's page tables. */
     mapcache_override_current(NULL);
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -27,8 +27,10 @@
 #include <xen/virtual_region.h>
 #include <xen/watchdog.h>
 #include <public/version.h>
+#ifdef CONFIG_COMPAT
 #include <compat/platform.h>
 #include <compat/xen.h>
+#endif
 #include <xen/bitops.h>
 #include <asm/smp.h>
 #include <asm/processor.h>
@@ -1615,10 +1617,12 @@ void __init noreturn __start_xen(unsigne
     BUILD_BUG_ON(sizeof(shared_info_t) > PAGE_SIZE);
     BUILD_BUG_ON(sizeof(struct vcpu_info) != 64);
 
+#ifdef CONFIG_COMPAT
     BUILD_BUG_ON(sizeof_field(struct compat_platform_op, u) !=
                  sizeof_field(struct compat_platform_op, u.pad));
     BUILD_BUG_ON(sizeof(start_info_compat_t) > PAGE_SIZE);
     BUILD_BUG_ON(sizeof(struct compat_vcpu_info) != 64);
+#endif
 
     /* Check definitions in public headers match internal defs. */
     BUILD_BUG_ON(__HYPERVISOR_VIRT_START != HYPERVISOR_VIRT_START);
--- a/xen/arch/x86/oprofile/backtrace.c
+++ b/xen/arch/x86/oprofile/backtrace.c
@@ -27,7 +27,6 @@ struct __packed frame_head_32bit {
     uint32_t ret;
 };
 typedef struct frame_head_32bit frame_head32_t;
-DEFINE_COMPAT_HANDLE(frame_head32_t);
 
 static struct frame_head *
 dump_hypervisor_backtrace(struct vcpu *vcpu, const struct frame_head *head,
@@ -58,8 +57,10 @@ dump_guest_backtrace(struct vcpu *vcpu,
 {
     frame_head_t bufhead;
 
+#ifdef CONFIG_COMPAT
     if ( is_32bit_vcpu(vcpu) )
     {
+        DEFINE_COMPAT_HANDLE(frame_head32_t);
         __compat_handle_const_frame_head32_t guest_head =
             { .c = (unsigned long)head };
         frame_head32_t bufhead32;
@@ -73,6 +74,7 @@ dump_guest_backtrace(struct vcpu *vcpu,
         bufhead.ret = bufhead32.ret;
     }
     else
+#endif
     {
         XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
             const_guest_handle_from_ptr(head, frame_head_t);
--- a/xen/arch/x86/oprofile/xenoprof.c
+++ b/xen/arch/x86/oprofile/xenoprof.c
@@ -12,7 +12,6 @@
 #include <xen/sched.h>
 #include <xen/xenoprof.h>
 #include <public/xenoprof.h>
-#include <compat/xenoprof.h>
 #include <asm/hvm/support.h>
 
 #include "op_counter.h"
@@ -54,6 +53,9 @@ int xenoprof_arch_ibs_counter(XEN_GUEST_
     return 0;
 }
 
+#ifdef CONFIG_COMPAT
+#include <compat/xenoprof.h>
+
 int compat_oprof_arch_counter(XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct compat_oprof_counter counter;
@@ -73,6 +75,7 @@ int compat_oprof_arch_counter(XEN_GUEST_
 
     return 0;
 }
+#endif
 
 int xenoprofile_get_mode(struct vcpu *curr, const struct cpu_user_regs *regs)
 {
--- a/xen/arch/x86/x86_64/Makefile
+++ b/xen/arch/x86/x86_64/Makefile
@@ -8,9 +8,9 @@ obj-y += acpi_mmcfg.o
 obj-y += mmconf-fam10h.o
 obj-y += mmconfig_64.o
 obj-y += mmconfig-shared.o
-obj-y += domain.o
-obj-y += cpu_idle.o
-obj-y += cpufreq.o
+obj-$(CONFIG_COMPAT) += domain.o
+obj-$(CONFIG_COMPAT) += cpu_idle.o
+obj-$(CONFIG_COMPAT) += cpufreq.o
 obj-bin-$(CONFIG_KEXEC) += kexec_reloc.o
 
 obj-$(CONFIG_CRASH_DEBUG)   += gdbstub.o
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1347,7 +1347,9 @@ void set_gpfn_from_mfn(unsigned long mfn
     machine_to_phys_mapping[mfn] = entry;
 }
 
+#ifdef CONFIG_COMPAT
 #include "compat/mm.c"
+#endif
 
 /*
  * Local variables:
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -108,7 +108,7 @@ void update_domain_wallclock_time(struct
     sec = wc_sec + d->time_offset.seconds;
     shared_info(d, wc_sec)    = sec;
     shared_info(d, wc_nsec)   = wc_nsec;
-#ifdef CONFIG_X86
+#if defined(CONFIG_X86) && defined(CONFIG_COMPAT)
     if ( likely(!has_32bit_shinfo(d)) )
         d->shared_info->native.wc_sec_hi = sec >> 32;
     else
--- a/xen/include/asm-x86/compat.h
+++ b/xen/include/asm-x86/compat.h
@@ -2,11 +2,15 @@
  * compat.h
  */
 
+#ifdef CONFIG_COMPAT
+
 #define COMPAT_BITS_PER_LONG 32
 
 typedef uint32_t compat_ptr_t;
 typedef unsigned long full_ptr_t;
 
+#endif
+
 struct domain;
 #ifdef CONFIG_PV32
 int switch_compat(struct domain *);
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -23,7 +23,10 @@ typedef struct {
 } hypercall_table_t;
 
 typedef struct {
-    uint8_t native, compat;
+    uint8_t native;
+#ifdef CONFIG_COMPAT
+    uint8_t compat;
+#endif
 } hypercall_args_t;
 
 extern const hypercall_args_t hypercall_args_table[NR_hypercalls];
--- a/xen/include/asm-x86/shared.h
+++ b/xen/include/asm-x86/shared.h
@@ -1,6 +1,8 @@
 #ifndef __XEN_X86_SHARED_H__
 #define __XEN_X86_SHARED_H__
 
+#ifdef CONFIG_COMPAT
+
 #define nmi_reason(d) (!has_32bit_shinfo(d) ?                             \
                        (u32 *)&(d)->shared_info->native.arch.nmi_reason : \
                        (u32 *)&(d)->shared_info->compat.arch.nmi_reason)
@@ -37,6 +39,34 @@ static inline void arch_set_##field(stru
         v->vcpu_info->compat.arch.field = val;                  \
 }
 
+#else
+
+#define nmi_reason(d) (&(d)->shared_info->arch.nmi_reason)
+
+#define GET_SET_SHARED(type, field)                         \
+static inline type arch_get_##field(const struct domain *d) \
+{                                                           \
+    return d->shared_info->arch.field;                      \
+}                                                           \
+static inline void arch_set_##field(struct domain *d,       \
+                                    type val)               \
+{                                                           \
+    d->shared_info->arch.field = val;                       \
+}
+
+#define GET_SET_VCPU(type, field)                           \
+static inline type arch_get_##field(const struct vcpu *v)   \
+{                                                           \
+    return v->vcpu_info->arch.field;                        \
+}                                                           \
+static inline void arch_set_##field(struct vcpu *v,         \
+                                    type val)               \
+{                                                           \
+    v->vcpu_info->arch.field = val;                         \
+}
+
+#endif
+
 GET_SET_SHARED(unsigned long, max_pfn)
 GET_SET_SHARED(xen_pfn_t, pfn_to_mfn_frame_list_list)
 GET_SET_SHARED(unsigned long, nmi_reason)
--- a/xen/include/xen/compat.h
+++ b/xen/include/xen/compat.h
@@ -5,10 +5,11 @@
 #ifndef __XEN_COMPAT_H__
 #define __XEN_COMPAT_H__
 
-#ifdef CONFIG_COMPAT
-
 #include <xen/types.h>
 #include <asm/compat.h>
+
+#ifdef CONFIG_COMPAT
+
 #include <compat/xlat.h>
 
 #define __DEFINE_COMPAT_HANDLE(name, type) \
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1047,7 +1047,6 @@ static always_inline bool is_pv_vcpu(con
     return is_pv_domain(v->domain);
 }
 
-#ifdef CONFIG_COMPAT
 static always_inline bool is_pv_32bit_domain(const struct domain *d)
 {
 #ifdef CONFIG_PV32
@@ -1078,7 +1077,7 @@ static always_inline bool is_pv_64bit_vc
 {
     return is_pv_64bit_domain(v->domain);
 }
-#endif
+
 static always_inline bool is_hvm_domain(const struct domain *d)
 {
     return IS_ENABLED(CONFIG_HVM) &&


