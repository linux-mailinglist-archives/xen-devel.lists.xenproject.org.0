Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849A3220A51
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:42:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jverL-0002EI-J9; Wed, 15 Jul 2020 10:41:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jverK-0002E5-3W
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:41:54 +0000
X-Inumbo-ID: cbaa3308-c687-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbaa3308-c687-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 10:41:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9EAFEB56F;
 Wed, 15 Jul 2020 10:41:55 +0000 (UTC)
Subject: [PATCH 8/8] x86: don't include domctl and alike in shim-exclusive
 builds
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Message-ID: <56a60744-8046-e90c-d6fa-9c7392d83c51@suse.com>
Date: Wed, 15 Jul 2020 12:41:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There is no need for platform-wide, system-wide, or per-domain control
in this case. Hence avoid including this dead code in the build.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_GDBSX) += debug.o
 obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
-obj-y += domctl.o
 obj-y += domain.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
@@ -51,7 +50,6 @@ obj-y += numa.o
 obj-y += pci.o
 obj-y += percpu.o
 obj-y += physdev.o x86_64/physdev.o
-obj-y += platform_hypercall.o x86_64/platform_hypercall.o
 obj-y += psr.o
 obj-y += setup.o
 obj-y += shutdown.o
@@ -60,7 +58,6 @@ obj-y += smpboot.o
 obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
-obj-y += sysctl.o
 obj-y += time.o
 obj-y += trace.o
 obj-y += traps.o
@@ -71,6 +68,13 @@ obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += hpet.o
 obj-y += vm_event.o
 obj-y += xstate.o
+
+ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
+obj-y += domctl.o
+obj-y += platform_hypercall.o x86_64/platform_hypercall.o
+obj-y += sysctl.o
+endif
+
 extra-y += asm-macros.i
 
 ifneq ($(CONFIG_HVM),y)
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -47,6 +47,8 @@
 /* Per-CPU variable for enforcing the lock ordering */
 DEFINE_PER_CPU(int, mm_lock_level);
 
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+
 /************************************************/
 /*              LOG DIRTY SUPPORT               */
 /************************************************/
@@ -628,6 +630,8 @@ void paging_log_dirty_init(struct domain
     d->arch.paging.log_dirty.ops = ops;
 }
 
+#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
+
 /************************************************/
 /*           CODE FOR PAGING SUPPORT            */
 /************************************************/
@@ -667,7 +671,7 @@ void paging_vcpu_init(struct vcpu *v)
         shadow_vcpu_init(v);
 }
 
-
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
                   XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl,
                   bool_t resuming)
@@ -788,6 +792,7 @@ long paging_domctl_continuation(XEN_GUES
 
     return ret;
 }
+#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
 
 /* Call when destroying a domain */
 int paging_teardown(struct domain *d)
@@ -803,10 +808,12 @@ int paging_teardown(struct domain *d)
     if ( preempted )
         return -ERESTART;
 
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
     /* clean up log dirty resources. */
     rc = paging_free_log_dirty_bitmap(d, 0);
     if ( rc == -ERESTART )
         return rc;
+#endif
 
     /* Move populate-on-demand cache back to domain_list for destruction */
     rc = p2m_pod_empty_cache(d);
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -42,7 +42,9 @@ const hypercall_table_t pv_hypercall_tab
     COMPAT_CALL(set_callbacks),
     HYPERCALL(fpu_taskswitch),
     HYPERCALL(sched_op_compat),
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
     COMPAT_CALL(platform_op),
+#endif
     HYPERCALL(set_debugreg),
     HYPERCALL(get_debugreg),
     COMPAT_CALL(update_descriptor),
@@ -72,8 +74,10 @@ const hypercall_table_t pv_hypercall_tab
 #endif
     HYPERCALL(event_channel_op),
     COMPAT_CALL(physdev_op),
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
     HYPERCALL(sysctl),
     HYPERCALL(domctl),
+#endif
 #ifdef CONFIG_KEXEC
     COMPAT_CALL(kexec_op),
 #endif
@@ -89,7 +93,9 @@ const hypercall_table_t pv_hypercall_tab
     HYPERCALL(hypfs_op),
 #endif
     HYPERCALL(mca),
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
     HYPERCALL(arch_1),
+#endif
 };
 
 #undef do_arch_1
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -6,7 +6,6 @@ obj-$(CONFIG_CORE_PARKING) += core_parki
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
-obj-y += domctl.o
 obj-y += domain.o
 obj-y += event_2l.o
 obj-y += event_channel.o
@@ -26,7 +25,6 @@ obj-$(CONFIG_NEEDS_LIST_SORT) += list_so
 obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
-obj-y += monitor.o
 obj-y += multicall.o
 obj-y += notifier.o
 obj-y += page_alloc.o
@@ -47,7 +45,6 @@ obj-y += spinlock.o
 obj-y += stop_machine.o
 obj-y += string.o
 obj-y += symbols.o
-obj-y += sysctl.o
 obj-y += tasklet.o
 obj-y += time.o
 obj-y += timer.o
@@ -66,6 +63,12 @@ obj-bin-$(CONFIG_X86) += $(foreach n,dec
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o kernel.o memory.o multicall.o xlat.o)
 
+ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
+obj-y += domctl.o
+obj-y += monitor.o
+obj-y += sysctl.o
+endif
+
 extra-y := symbols-dummy.o
 
 obj-$(CONFIG_COVERAGE) += coverage/
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -154,6 +154,8 @@ struct paging_mode {
 /*****************************************************************************
  * Log dirty code */
 
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+
 /* get the dirty bitmap for a specific range of pfns */
 void paging_log_dirty_range(struct domain *d,
                             unsigned long begin_pfn,
@@ -202,6 +204,15 @@ struct sh_dirty_vram {
     s_time_t last_dirty;
 };
 
+#else /* !CONFIG_PV_SHIM_EXCLUSIVE */
+
+static inline void paging_log_dirty_init(struct domain *d,
+                                         const struct log_dirty_ops *ops) {}
+static inline void paging_mark_dirty(struct domain *d, mfn_t gmfn) {}
+static inline void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn) {}
+
+#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
+
 /*****************************************************************************
  * Entry points into the paging-assistance code */
 
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -130,6 +130,10 @@ struct vnuma_info {
     struct xen_vmemrange *vmemrange;
 };
 
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 void vnuma_destroy(struct vnuma_info *vnuma);
+#else
+static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
+#endif
 
 #endif /* __XEN_DOMAIN_H__ */


