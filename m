Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9245E79D8C3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 20:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600739.936534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg8F9-0005Lh-30; Tue, 12 Sep 2023 18:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600739.936534; Tue, 12 Sep 2023 18:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg8F8-0005DL-UM; Tue, 12 Sep 2023 18:36:10 +0000
Received: by outflank-mailman (input) for mailman id 600739;
 Tue, 12 Sep 2023 18:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YY/q=E4=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qg8F7-0004gy-Es
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 18:36:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aef5145-519b-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 20:36:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 56062828588C;
 Tue, 12 Sep 2023 13:36:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id UyJ4rMT5KA0S; Tue, 12 Sep 2023 13:36:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 675458286999;
 Tue, 12 Sep 2023 13:36:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 28PoQVfEyAXc; Tue, 12 Sep 2023 13:36:02 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 1207C82869A9;
 Tue, 12 Sep 2023 13:36:02 -0500 (CDT)
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
X-Inumbo-ID: 3aef5145-519b-11ee-8786-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 675458286999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694543762; bh=6LM95rrDoqCiSn6LemOLiswbsaDeEh5eaAd90MA8xic=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=I8kABtDzdiCGYaKXRW+75tPCf/60BW7gNz2jXOBceZiShezZv0TPCEk7lYeLff1Pg
	 mXAGyspx8qBci3qd9Bpm4tvybIX0a2xmirIoHO2FGAJd2tPci31MkhlhlB99wYbKN/
	 aQGgLMmqqV3ai6pqWq+7BxIdpLiYH6RDXAq8nOhc=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v5 4/5] xen/ppc: Add stub function and symbol definitions
Date: Tue, 12 Sep 2023 13:35:53 -0500
Message-Id: <26d561b1878082a1666935fd8c9d477de423e8ed.1694543103.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1694543103.git.sanastasio@raptorengineering.com>
References: <cover.1694543103.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add stub function and symbol definitions required by common code. If the
file that the definition is supposed to be located in doesn't already
exist yet, temporarily place its definition in the new stubs.c

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v5: No changes.

v4: No changes.

v3:
  - (stubs.c) Drop ack_none hook definition

v2:
  - Use BUG_ON("unimplemented") instead of BUG() for unimplemented functions
    to make searching easier.
  - (mm-radix.c) Drop total_pages definition
  - (mm-radix.c) Move __read_mostly from after variable name to before it in
    declaration of `frametable_base_pdx`
  - (setup.c) Fix include order
  - (stubs.c) Drop stub .end hw_irq_controller hook

 xen/arch/ppc/Makefile   |   1 +
 xen/arch/ppc/mm-radix.c |  42 +++++
 xen/arch/ppc/setup.c    |   8 +
 xen/arch/ppc/stubs.c    | 339 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 390 insertions(+)
 create mode 100644 xen/arch/ppc/stubs.c

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index b3205b8f7a..6d5569ff64 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_EARLY_PRINTK) += early_printk.init.o
 obj-y += mm-radix.o
 obj-y += opal.o
 obj-y += setup.o
+obj-y += stubs.o
 obj-y += tlb-radix.o

 $(TARGET): $(TARGET)-syms
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 06129cef9c..11d0f27b60 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -265,3 +265,45 @@ void __init setup_initial_pagetables(void)
     /* Turn on the MMU */
     enable_mmu();
 }
+
+/*
+ * TODO: Implement the functions below
+ */
+unsigned long __read_mostly frametable_base_pdx;
+
+void put_page(struct page_info *p)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_dump_shared_mem_info(void)
+{
+    BUG_ON("unimplemented");
+}
+
+int xenmem_add_to_physmap_one(struct domain *d,
+                              unsigned int space,
+                              union add_to_physmap_extra extra,
+                              unsigned long idx,
+                              gfn_t gfn)
+{
+    BUG_ON("unimplemented");
+}
+
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    BUG_ON("unimplemented");
+}
+
+int map_pages_to_xen(unsigned long virt,
+                     mfn_t mfn,
+                     unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    BUG_ON("unimplemented");
+}
+
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    BUG_ON("unimplemented");
+}
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 3fc7705d9b..959c1454a0 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <public/version.h>
 #include <asm/boot.h>
 #include <asm/early_printk.h>
 #include <asm/mm.h>
@@ -33,3 +36,8 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,

     unreachable();
 }
+
+void arch_get_xen_caps(xen_capabilities_info_t *info)
+{
+    BUG_ON("unimplemented");
+}
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
new file mode 100644
index 0000000000..4c276b0e39
--- /dev/null
+++ b/xen/arch/ppc/stubs.c
@@ -0,0 +1,339 @@
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
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+/* time.c */
+
+s_time_t get_s_time(void)
+{
+    BUG_ON("unimplemented");
+}
+
+int reprogram_timer(s_time_t timeout)
+{
+    BUG_ON("unimplemented");
+}
+
+void send_timer_event(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+/* traps.c */
+
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_hypercall_tasklet_result(struct vcpu *v, long res)
+{
+    BUG_ON("unimplemented");
+}
+
+void vcpu_show_execution_state(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+/* shutdown.c */
+
+void machine_restart(unsigned int delay_millisecs)
+{
+    BUG_ON("unimplemented");
+}
+
+void machine_halt(void)
+{
+    BUG_ON("unimplemented");
+}
+
+/* vm_event.c */
+
+void vm_event_fill_regs(vm_event_request_t *req)
+{
+    BUG_ON("unimplemented");
+}
+
+void vm_event_set_registers(struct vcpu *v, vm_event_response_t *rsp)
+{
+    BUG_ON("unimplemented");
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
+    BUG_ON("unimplemented");
+}
+
+/* monitor.c */
+
+int arch_monitor_domctl_event(struct domain *d,
+                              struct xen_domctl_monitor_op *mop)
+{
+    BUG_ON("unimplemented");
+}
+
+/* smp.c */
+
+void arch_flush_tlb_mask(const cpumask_t *mask)
+{
+    BUG_ON("unimplemented");
+}
+
+void smp_send_event_check_mask(const cpumask_t *mask)
+{
+    BUG_ON("unimplemented");
+}
+
+void smp_send_call_function_mask(const cpumask_t *mask)
+{
+    BUG_ON("unimplemented");
+}
+
+/* irq.c */
+
+struct pirq *alloc_pirq_struct(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
+{
+    BUG_ON("unimplemented");
+}
+
+void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
+{
+    BUG_ON("unimplemented");
+}
+
+void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
+{
+    BUG_ON("unimplemented");
+}
+
+hw_irq_controller no_irq_type = {
+    .typename = "none",
+    .startup = irq_startup_none,
+    .shutdown = irq_shutdown_none,
+    .enable = irq_enable_none,
+    .disable = irq_disable_none,
+};
+
+int arch_init_one_irq_desc(struct irq_desc *desc)
+{
+    BUG_ON("unimplemented");
+}
+
+void smp_send_state_dump(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
+/* domain.c */
+
+DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
+unsigned long __per_cpu_offset[NR_CPUS];
+
+void context_switch(struct vcpu *prev, struct vcpu *next)
+{
+    BUG_ON("unimplemented");
+}
+
+void continue_running(struct vcpu *same)
+{
+    BUG_ON("unimplemented");
+}
+
+void sync_local_execstate(void)
+{
+    BUG_ON("unimplemented");
+}
+
+void sync_vcpu_execstate(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+void startup_cpu_idle_loop(void)
+{
+    BUG_ON("unimplemented");
+}
+
+void free_domain_struct(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+void dump_pageframe_info(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+void free_vcpu_struct(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+int arch_vcpu_create(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_vcpu_destroy(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+void vcpu_switch_to_aarch64_mode(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+{
+    BUG_ON("unimplemented");
+}
+
+int arch_domain_create(struct domain *d,
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
+{
+    BUG_ON("unimplemented");
+}
+
+int arch_domain_teardown(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_domain_destroy(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_domain_shutdown(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_domain_pause(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_domain_unpause(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+int arch_domain_soft_reset(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_domain_creation_finished(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
+{
+    BUG_ON("unimplemented");
+}
+
+int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    BUG_ON("unimplemented");
+}
+
+int arch_vcpu_reset(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+int domain_relinquish_resources(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_dump_domain_info(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_dump_vcpu_info(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+void vcpu_mark_events_pending(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+void vcpu_update_evtchn_irq(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+void vcpu_block_unless_event_pending(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+void vcpu_kick(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+struct domain *alloc_domain_struct(void)
+{
+    BUG_ON("unimplemented");
+}
+
+struct vcpu *alloc_vcpu_struct(const struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+unsigned long
+hypercall_create_continuation(unsigned int op, const char *format, ...)
+{
+    BUG_ON("unimplemented");
+}
+
+int __init parse_arch_dom0_param(const char *s, const char *e)
+{
+    BUG_ON("unimplemented");
+}
--
2.30.2


