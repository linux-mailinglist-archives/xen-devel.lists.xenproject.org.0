Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF4A76DB30
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 01:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575864.901376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsI-0003e2-A2; Wed, 02 Aug 2023 23:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575864.901376; Wed, 02 Aug 2023 23:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsI-0003Yp-3C; Wed, 02 Aug 2023 23:03:26 +0000
Received: by outflank-mailman (input) for mailman id 575864;
 Wed, 02 Aug 2023 23:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qRKsF-0002Xg-L9
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 23:03:23 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6497382-3188-11ee-b265-6b7b168915f2;
 Thu, 03 Aug 2023 01:03:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7F86B82867D6;
 Wed,  2 Aug 2023 18:03:20 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5_ulkB8bEAwK; Wed,  2 Aug 2023 18:03:19 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 18B8682853DD;
 Wed,  2 Aug 2023 18:03:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PKJPQVnVlc8g; Wed,  2 Aug 2023 18:03:18 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A87368286988;
 Wed,  2 Aug 2023 18:03:18 -0500 (CDT)
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
X-Inumbo-ID: c6497382-3188-11ee-b265-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 18B8682853DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691017399; bh=1Z3BHp5C4S6qyWtJBZVL9zKOQ4J/V94ak8r3E6OfMhE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=OxSSE0AbnR2XSjQTFUqjkz660FTxvImjkTr0IhY5FmyQTiHcq2I12bHlbSICfLs8u
	 qISW10KsmeJ5MHH9muogX6u82BMmVh0MMDKfGBlpEtP1MCgDHNqrUNb39a24/nWMyv
	 hMyXh8BPQfu7Xbc0/7iaPfVYwpnqTkuuuTePSHO0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 8/9] xen/ppc: Add stub function and symbol definitions
Date: Wed,  2 Aug 2023 18:03:04 -0500
Message-Id: <2702cfa486aa92e82fccd6393519073f10f4c40c.1691016993.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1691016993.git.sanastasio@raptorengineering.com>
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add stub function and symbol definitions required by common code. If the
file that the definition is supposed to be located in doesn't already
exist yet, temporarily place its definition in the new stubs.c

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/Makefile   |   1 +
 xen/arch/ppc/mm-radix.c |  44 +++++
 xen/arch/ppc/setup.c    |  10 +-
 xen/arch/ppc/stubs.c    | 351 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 404 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/ppc/stubs.c

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index a059ac4c0a..969910b3b6 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.init.o
 obj-y +=3D mm-radix.o
 obj-y +=3D opal.o
 obj-y +=3D setup.o
+obj-y +=3D stubs.o
 obj-y +=3D tlb-radix.o
=20
 $(TARGET): $(TARGET)-syms
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 399898a36d..1ed6897366 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -266,3 +266,47 @@ void __init setup_initial_pagetables(void)
     /* Turn on the MMU */
     enable_mmu();
 }
+
+
+/*
+ * TODO: Implement the functions below
+ */
+unsigned long total_pages;
+unsigned long frametable_base_pdx __read_mostly;
+
+void put_page(struct page_info *p)
+{
+    BUG();
+}
+
+void arch_dump_shared_mem_info(void)
+{
+    BUG();
+}
+
+int xenmem_add_to_physmap_one(struct domain *d,
+                              unsigned int space,
+                              union add_to_physmap_extra extra,
+                              unsigned long idx,
+                              gfn_t gfn)
+{
+    BUG();
+}
+
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    BUG();
+}
+
+int map_pages_to_xen(unsigned long virt,
+                     mfn_t mfn,
+                     unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    BUG();
+}
+
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    BUG();
+}
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 466993987b..06c0a5fa80 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/lib.h>
 #include <xen/init.h>
+#include <xen/mm.h>
+#include <public/version.h>
 #include <asm/boot.h>
 #include <asm/early_printk.h>
 #include <asm/processor.h>
@@ -7,8 +10,6 @@
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZ=
E);
=20
-void __init setup_initial_pagetables(void);
-
 void __init noreturn start_xen(unsigned long r3, unsigned long r4,
                                unsigned long r5, unsigned long r6,
                                unsigned long r7)
@@ -39,3 +40,8 @@ void __init noreturn start_xen(unsigned long r3, unsign=
ed long r4,
=20
     unreachable();
 }
+
+void arch_get_xen_caps(xen_capabilities_info_t *info)
+{
+    BUG();
+}
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
new file mode 100644
index 0000000000..2b3ee94115
--- /dev/null
+++ b/xen/arch/ppc/stubs.c
@@ -0,0 +1,351 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/cpumask.h>
+#include <xen/domain.h>
+#include <xen/irq.h>
+#include <xen/nodemask.h>
+#include <xen/time.h>
+#include <public/domctl.h>
+#include <public/vm_event.h>
+
+#include <asm/current.h>
+
+/* smpboot.c */
+
+cpumask_t cpu_online_map;
+cpumask_t cpu_present_map;
+cpumask_t cpu_possible_map;
+
+/* ID of the PCPU we're running on */
+DEFINE_PER_CPU(unsigned int, cpu_id);
+/* XXX these seem awfully x86ish... */
+/* representing HT siblings of each logical CPU */
+DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
+/* representing HT and core siblings of each logical CPU */
+DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
+
+nodemask_t __read_mostly node_online_map =3D { { [0] =3D 1UL } };
+
+/* time.c */
+
+s_time_t get_s_time(void)
+{
+    BUG();
+}
+
+int reprogram_timer(s_time_t timeout)
+{
+    BUG();
+}
+
+void send_timer_event(struct vcpu *v)
+{
+    BUG();
+}
+
+/* traps.c */
+
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    BUG();
+}
+
+void arch_hypercall_tasklet_result(struct vcpu *v, long res)
+{
+    BUG();
+}
+
+void vcpu_show_execution_state(struct vcpu *v)
+{
+    BUG();
+}
+
+/* shutdown.c */
+
+void machine_restart(unsigned int delay_millisecs)
+{
+    BUG();
+}
+
+void machine_halt(void)
+{
+    BUG();
+}
+
+/* vm_event.c */
+
+void vm_event_fill_regs(vm_event_request_t *req)
+{
+    BUG();
+}
+
+void vm_event_set_registers(struct vcpu *v, vm_event_response_t *rsp)
+{
+    BUG();
+}
+
+void vm_event_monitor_next_interrupt(struct vcpu *v)
+{
+    /* Not supported on PPC. */
+}
+
+/* domctl.c */
+void arch_get_domain_info(const struct domain *d,
+                          struct xen_domctl_getdomaininfo *info)
+{
+    BUG();
+}
+
+/* monitor.c */
+
+int arch_monitor_domctl_event(struct domain *d,
+                              struct xen_domctl_monitor_op *mop)
+{
+    BUG();
+}
+
+/* smp.c */
+
+void arch_flush_tlb_mask(const cpumask_t *mask)
+{
+    BUG();
+}
+
+void smp_send_event_check_mask(const cpumask_t *mask)
+{
+    BUG();
+}
+
+void smp_send_call_function_mask(const cpumask_t *mask)
+{
+    BUG();
+}
+
+/* irq.c */
+
+struct pirq *alloc_pirq_struct(struct domain *d)
+{
+    BUG();
+}
+
+int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
+{
+    BUG();
+}
+
+void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
+{
+    BUG();
+}
+
+void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask=
)
+{
+    BUG();
+}
+
+static void ack_none(struct irq_desc *irq)
+{
+    BUG();
+}
+
+static void end_none(struct irq_desc *irq)
+{
+    BUG();
+}
+
+hw_irq_controller no_irq_type =3D {
+    .typename =3D "none",
+    .startup =3D irq_startup_none,
+    .shutdown =3D irq_shutdown_none,
+    .enable =3D irq_enable_none,
+    .disable =3D irq_disable_none,
+    .ack =3D ack_none,
+    .end =3D end_none
+};
+
+int arch_init_one_irq_desc(struct irq_desc *desc)
+{
+    BUG();
+}
+
+void smp_send_state_dump(unsigned int cpu)
+{
+    BUG();
+}
+
+/* domain.c */
+
+DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
+unsigned long __per_cpu_offset[NR_CPUS];
+
+void context_switch(struct vcpu *prev, struct vcpu *next)
+{
+    BUG();
+}
+
+void continue_running(struct vcpu *same)
+{
+    BUG();
+}
+
+void sync_local_execstate(void)
+{
+    BUG();
+}
+
+void sync_vcpu_execstate(struct vcpu *v)
+{
+    BUG();
+}
+
+void startup_cpu_idle_loop(void)
+{
+    BUG();
+}
+
+void free_domain_struct(struct domain *d)
+{
+    BUG();
+}
+
+void dump_pageframe_info(struct domain *d)
+{
+    BUG();
+}
+
+void free_vcpu_struct(struct vcpu *v)
+{
+    BUG();
+}
+
+int arch_vcpu_create(struct vcpu *v)
+{
+    BUG();
+}
+
+void arch_vcpu_destroy(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_switch_to_aarch64_mode(struct vcpu *v)
+{
+    BUG();
+}
+
+int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+{
+    BUG();
+}
+
+int arch_domain_create(struct domain *d,
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
+{
+    BUG();
+}
+
+int arch_domain_teardown(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_destroy(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_shutdown(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_pause(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_unpause(struct domain *d)
+{
+    BUG();
+}
+
+int arch_domain_soft_reset(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_creation_finished(struct domain *d)
+{
+    BUG();
+}
+
+int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
+{
+    BUG();
+}
+
+int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) ar=
g)
+{
+    BUG();
+}
+
+int arch_vcpu_reset(struct vcpu *v)
+{
+    BUG();
+}
+
+int domain_relinquish_resources(struct domain *d)
+{
+    BUG();
+}
+
+void arch_dump_domain_info(struct domain *d)
+{
+    BUG();
+}
+
+void arch_dump_vcpu_info(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_mark_events_pending(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_update_evtchn_irq(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_block_unless_event_pending(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_kick(struct vcpu *v)
+{
+    BUG();
+}
+
+struct domain *alloc_domain_struct(void)
+{
+    BUG();
+}
+
+struct vcpu *alloc_vcpu_struct(const struct domain *d)
+{
+    BUG();
+}
+
+unsigned long
+hypercall_create_continuation(unsigned int op, const char *format, ...)
+{
+    BUG();
+}
+
+int __init parse_arch_dom0_param(const char *s, const char *e)
+{
+    BUG();
+}
--=20
2.30.2


