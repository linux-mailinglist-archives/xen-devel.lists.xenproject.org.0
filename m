Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986A18BCBC4
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717443.1119759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNr-0005Nd-P4; Mon, 06 May 2024 10:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717443.1119759; Mon, 06 May 2024 10:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNr-00057F-9U; Mon, 06 May 2024 10:15:47 +0000
Received: by outflank-mailman (input) for mailman id 717443;
 Mon, 06 May 2024 10:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNo-0001n2-Bg
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:44 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97f52fc1-0b91-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 12:15:42 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59a934ad50so350968166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:42 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:40 -0700 (PDT)
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
X-Inumbo-ID: 97f52fc1-0b91-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990541; x=1715595341; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZjuT02oKj/RNzIaHenTN7083fSBrh0r9COrszoJb68=;
        b=A5Hz11eOC3hQKGxNNOjRL7rHfMa7POf+IQg/cdqc8uRNmxe33ta4hgqtm0fXXKQjC9
         a8dIzpe4+wHKkFArW+uo1ucmjplILbQ+3PBGdtotKjvYBw1DFH2VOnSK1UYIkQqZvdGx
         MKg+eV9A+7aXKhfpMUHMsum3h/EfoLCCUnFnkqUtxE5JOc9+xQ2qGVk8v9a+DDmdAfKN
         9WloPpLhLOhrxN8N5gw7MYw+0PcHPufBi+0MTv5O5fjzCDVjwknZHCgiJ5IC4uaYoCYJ
         w6aFOBeh2OQs+KnIajNWvQmgri0Bm6tHMMLZE4r0Oqh3rY2tPcJOGJM8kYfiDOdTaw6d
         3DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990541; x=1715595341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZjuT02oKj/RNzIaHenTN7083fSBrh0r9COrszoJb68=;
        b=nKPsZUk06hmfxb4N3qKB0wyNp+slp3xVOfZoQd2/8OdJrk00hPQ9UdIvVhxy1AECqb
         9P5SsA9irhjrJYzW04F/38Ubp+gqsRAbAkcYOV0ZVt7ZFKX7sn0Q4LAJIkBBPUWgCU/+
         0J0ihbYQOdMOF3Zsh7e76SnigqcrxN9Sx2GlSebNOSivKpKSv0I3Lkt9GstSE04tJcCJ
         i5qe+Q4/hX5Kye3zv3Hu+sI7q5ZJTSUQG6rZKqspeXPKEBFD89OKNxjv5LRJW1hXPiE4
         UdAzQh4MrKD4gpZUA1uX7wTY4XV4o4UhsEhzSF1C1j3FcTGiuaSzPgyNdqizdEbXNamX
         oVrA==
X-Gm-Message-State: AOJu0YxJHRz8O1TzQQOxEdGUh198zmI2Gis2Q/rt/Tx5Bib3DVSRdpnB
	7tGTi60NM4qlBb7cAWNxdXVS0EVKzjmvfbYBFj04mjnY1+eXzZNPWFVxcg==
X-Google-Smtp-Source: AGHT+IHluUVNcXc+vVe0Wb82E8iX3zqWdREVmUtANne8QryX8Kmk4y6OpJgoXRaajh9/5VbBYusxWQ==
X-Received: by 2002:a17:906:81d8:b0:a59:cd46:fe89 with SMTP id e24-20020a17090681d800b00a59cd46fe89mr1486001ejx.59.1714990541330;
        Mon, 06 May 2024 03:15:41 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 13/15] xen/riscv: add minimal amount of stubs to build full Xen
Date: Mon,  6 May 2024 12:15:22 +0200
Message-ID: <5a3c661c6d8623531fee9e13b32f8d38a4d390a8.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V7-V9:
 - Only rebase was done.
---
Changes in V6:
 - update the commit in stubs.c around /* ... common/irq.c ... */
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - drop unrelated changes
 - assert_failed("unimplmented...") change to BUG_ON()
---
Changes in V4:
  - added new stubs which are necessary for compilation after rebase: __cpu_up(), __cpu_disable(), __cpu_die()
    from smpboot.c
  - back changes related to printk() in early_printk() as they should be removed in the next patch to avoid
    compilation error.
  - update definition of cpu_khz: __read_mostly -> __ro_after_init.
  - drop vm_event_reset_vmtrace(). It is defibed in asm-generic/vm_event.h.
  - move vm_event_*() functions from stubs.c to riscv/vm_event.c.
  - s/BUG/BUG_ON("unimplemented") in stubs.c
  - back irq_actor_none() and irq_actor_none() as common/irq.c isn't compiled at this moment,
    so this function are needed to avoid compilation error.
  - defined max_page to avoid compilation error, it will be removed as soon as common/page_alloc.c will
    be compiled.
---
Changes in V3:
 - code style fixes.
 - update attribute for frametable_base_pdx  and frametable_virt_end to __ro_after_init.
   insteaf of read_mostly.
 - use BUG() instead of assert_failed/WARN for newly introduced stubs.
 - drop "#include <public/vm_event.h>" in stubs.c and use forward declaration instead.
 - drop ack_node() and end_node() as they aren't used now.
---
Changes in V2:
 - define udelay stub
 - remove 'select HAS_PDX' from RISC-V Kconfig because of
   https://lore.kernel.org/xen-devel/20231006144405.1078260-1-andrew.cooper3@citrix.com/
---
 xen/arch/riscv/Makefile |   1 +
 xen/arch/riscv/mm.c     |  50 +++++
 xen/arch/riscv/setup.c  |   8 +
 xen/arch/riscv/stubs.c  | 439 ++++++++++++++++++++++++++++++++++++++++
 xen/arch/riscv/traps.c  |  25 +++
 5 files changed, 523 insertions(+)
 create mode 100644 xen/arch/riscv/stubs.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 1ed1a8369b..60afbc0ad9 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -4,6 +4,7 @@ obj-y += mm.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
+obj-y += stubs.o
 obj-y += traps.o
 obj-y += vm_event.o
 
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index fe3a43be20..2c3fb7d72e 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/cache.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
@@ -14,6 +15,9 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 
+unsigned long __ro_after_init frametable_base_pdx;
+unsigned long __ro_after_init frametable_virt_end;
+
 struct mmu_desc {
     unsigned int num_levels;
     unsigned int pgtbl_count;
@@ -294,3 +298,49 @@ unsigned long __init calc_phys_offset(void)
     phys_offset = load_start - XEN_VIRT_START;
     return phys_offset;
 }
+
+void put_page(struct page_info *page)
+{
+    BUG_ON("unimplemented");
+}
+
+unsigned long get_upper_mfn_bound(void)
+{
+    /* No memory hotplug yet, so current memory limit is the final one. */
+    return max_page - 1;
+}
+
+void arch_dump_shared_mem_info(void)
+{
+    BUG_ON("unimplemented");
+}
+
+int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    BUG_ON("unimplemented");
+    return -1;
+}
+
+int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
+                              union add_to_physmap_extra extra,
+                              unsigned long idx, gfn_t gfn)
+{
+    BUG_ON("unimplemented");
+
+    return 0;
+}
+
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    BUG_ON("unimplemented");
+    return -1;
+}
+
+int map_pages_to_xen(unsigned long virt,
+                     mfn_t mfn,
+                     unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    BUG_ON("unimplemented");
+    return -1;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 98a94c4c48..8bb5bdb2ae 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,11 +1,19 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/compile.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 
+#include <public/version.h>
+
 #include <asm/early_printk.h>
 
+void arch_get_xen_caps(xen_capabilities_info_t *info)
+{
+    BUG_ON("unimplemented");
+}
+
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
new file mode 100644
index 0000000000..8285bcffef
--- /dev/null
+++ b/xen/arch/riscv/stubs.c
@@ -0,0 +1,439 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/cpumask.h>
+#include <xen/domain.h>
+#include <xen/irq.h>
+#include <xen/nodemask.h>
+#include <xen/time.h>
+#include <public/domctl.h>
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
+/*
+ * max_page is defined in page_alloc.c which isn't complied for now.
+ * definition of max_page will be remove as soon as page_alloc is built.
+ */
+unsigned long __read_mostly max_page;
+
+/* time.c */
+
+unsigned long __ro_after_init cpu_khz;  /* CPU clock frequency in kHz. */
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
+void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
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
+/* domctl.c */
+
+long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_get_domain_info(const struct domain *d,
+                          struct xen_domctl_getdomaininfo *info)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
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
+
+/* guestcopy.c */
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
+{
+    BUG_ON("unimplemented");
+}
+
+unsigned long raw_copy_from_guest(void *to, const void __user *from,
+                                  unsigned int len)
+{
+    BUG_ON("unimplemented");
+}
+
+/* sysctl.c */
+
+long arch_do_sysctl(struct xen_sysctl *sysctl,
+                    XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
+{
+    BUG_ON("unimplemented");
+}
+
+void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
+{
+    BUG_ON("unimplemented");
+}
+
+/* p2m.c */
+
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    BUG_ON("unimplemented");
+}
+
+int unmap_mmio_regions(struct domain *d,
+                       gfn_t start_gfn,
+                       unsigned long nr,
+                       mfn_t mfn)
+{
+    BUG_ON("unimplemented");
+}
+
+int map_mmio_regions(struct domain *d,
+                     gfn_t start_gfn,
+                     unsigned long nr,
+                     mfn_t mfn)
+{
+    BUG_ON("unimplemented");
+}
+
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
+{
+    BUG_ON("unimplemented");
+}
+
+/* Return the size of the pool, in bytes. */
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    BUG_ON("unimplemented");
+}
+
+/* delay.c */
+
+void udelay(unsigned long usecs)
+{
+    BUG_ON("unimplemented");
+}
+
+/* guest_access.h */ 
+
+static inline unsigned long raw_clear_guest(void *to, unsigned int len)
+{
+    BUG_ON("unimplemented");
+}
+
+/* smpboot.c */
+
+int __cpu_up(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
+void __cpu_disable(void)
+{
+    BUG_ON("unimplemented");
+}
+
+void __cpu_die(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
+/*
+ * The following functions are defined in common/irq.c, but common/irq.c isn't
+ * built for now. These changes will be removed there when common/irq.c is
+ * ready.
+ */
+
+void cf_check irq_actor_none(struct irq_desc *desc)
+{
+    BUG_ON("unimplemented");
+}
+
+unsigned int cf_check irq_startup_none(struct irq_desc *desc)
+{
+    BUG_ON("unimplemented");
+
+    return 0;
+}
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ccd3593f5a..5415cf8d90 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -4,6 +4,10 @@
  *
  * RISC-V Trap handlers
  */
+
+#include <xen/lib.h>
+#include <xen/sched.h>
+
 #include <asm/processor.h>
 #include <asm/traps.h>
 
@@ -11,3 +15,24 @@ void do_trap(struct cpu_user_regs *cpu_regs)
 {
     die();
 }
+
+void vcpu_show_execution_state(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    printk("implement show_execution_state(regs)\n");
+}
+
+void arch_hypercall_tasklet_result(struct vcpu *v, long res)
+{
+    BUG_ON("unimplemented");
+}
+
+enum mc_disposition arch_do_multicall_call(struct mc_state *state)
+{
+    BUG_ON("unimplemented");
+    return mc_continue;
+}
-- 
2.45.0


