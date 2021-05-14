Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6CB381203
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127542.239730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhelY-0002E8-Tt; Fri, 14 May 2021 20:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127542.239730; Fri, 14 May 2021 20:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhelY-0002CF-Pe; Fri, 14 May 2021 20:50:36 +0000
Received: by outflank-mailman (input) for mailman id 127542;
 Fri, 14 May 2021 20:50:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lhelX-0002C3-0I
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:50:35 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef49ce06-6294-4d17-8298-3744182c9599;
 Fri, 14 May 2021 20:50:32 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025169173821.904720637283;
 Fri, 14 May 2021 13:46:09 -0700 (PDT)
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
X-Inumbo-ID: ef49ce06-6294-4d17-8298-3744182c9599
ARC-Seal: i=1; a=rsa-sha256; t=1621025170; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WYfknhhbYjCXw/qkEnWiNmLLk6PC2dW6zeHMKWEbxBG7wcEiKbiA1L+r5wCTiGxqhEkDT3WDQ+SluzNZwMadEpuZI9mcpE73pvXtFzEvf9oFoMXcVf/dZumvDvZfxx+CGqYCoYlc6gs3fAMOOcCh+MUSZO2N57aIV00s8zkOFSw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025170; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=pJEaYk4PqGj22W5R4j6dKlBEZIsaxzqHFKLwhENQhJk=; 
	b=B+MQuXd9SauNaU1dgYKfMWyUyZmuJ9836oKYzzSYU8h7i3vebUeuAa1U78TM/uDB3RHcYANEJ9xG6v6gLFGbrlEduVVNWEvX3u4j0k3vsipZ+FuFtler8LAmza7jZdqawXrqVRMUvSyHjXhAjVRw9A8K2PxdUYG4zk8q4gVfJKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025170;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pJEaYk4PqGj22W5R4j6dKlBEZIsaxzqHFKLwhENQhJk=;
	b=VodgGzU/hbSBFyvdaEE2s0/JT+nargFIK2QcTa3s+Ex6aVlXuMqn8j6aHh+wG6DQ
	EX2lDmWV8I64P2apF2Z7nQt+VZ3ps8TO3UtF5iAO2+VVoGOGDWa85dO/70bFOutGHuD
	HBCIecVtF8x1UWPVGW2PU0vQ8bniSzave4D4069o=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	wl@xen.org,
	roger.pau@citrix.com,
	tamas@tklengyel.com,
	tim@xen.org,
	jgross@suse.com,
	aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	dfaggioli@suse.com,
	paul@xen.org,
	kevin.tian@intel.com,
	dgdegra@tycho.nsa.gov,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [RFC PATCH 05/10] hardware domain: convert to domain roles
Date: Fri, 14 May 2021 16:54:32 -0400
Message-Id: <20210514205437.13661-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This refactors the hardware_domain so that it is works within the
new domain roles construct.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/acpi/cpu_idle.c        |   3 +-
 xen/arch/x86/cpu/mcheck/vmce.h      |   3 +-
 xen/arch/x86/cpu/vpmu.c             |   7 +-
 xen/arch/x86/crash.c                |   2 +-
 xen/arch/x86/io_apic.c              |   9 ++-
 xen/arch/x86/mm.c                   |   2 +-
 xen/arch/x86/msi.c                  |   4 +-
 xen/arch/x86/nmi.c                  |   3 +-
 xen/arch/x86/setup.c                |   3 +
 xen/arch/x86/traps.c                |   2 +-
 xen/arch/x86/x86_64/mm.c            |  11 +--
 xen/common/domain.c                 | 114 ++++++++++++++++++++++------
 xen/common/event_channel.c          |   3 +-
 xen/common/kexec.c                  |   2 +-
 xen/common/keyhandler.c             |   4 +-
 xen/common/shutdown.c               |  14 ++--
 xen/common/vm_event.c               |   5 +-
 xen/common/xenoprof.c               |   3 +-
 xen/drivers/char/ns16550.c          |   3 +-
 xen/drivers/passthrough/pci.c       |  12 +--
 xen/drivers/passthrough/vtd/iommu.c |   2 +-
 xen/include/xen/sched.h             |   7 +-
 22 files changed, 152 insertions(+), 66 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index c092086b33..7a42c56944 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1206,7 +1206,8 @@ static void set_cx(
             cx->entry_method = ACPI_CSTATE_EM_HALT;
         break;
     case ACPI_ADR_SPACE_SYSTEM_IO:
-        if ( ioports_deny_access(hardware_domain, cx->address, cx->address) )
+        if ( ioports_deny_access(get_hardware_domain(),
+             cx->address, cx->address) )
             printk(XENLOG_WARNING "Could not deny access to port %04x\n",
                    cx->address);
         cx->entry_method = ACPI_CSTATE_EM_SYSIO;
diff --git a/xen/arch/x86/cpu/mcheck/vmce.h b/xen/arch/x86/cpu/mcheck/vmce.h
index 2e9b32a9bd..774cd8a5af 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.h
+++ b/xen/arch/x86/cpu/mcheck/vmce.h
@@ -6,8 +6,7 @@
 int vmce_init(struct cpuinfo_x86 *c);
 
 #define dom0_vmce_enabled() \
-    (hardware_domain && \
-     evtchn_virq_enabled(domain_vcpu(hardware_domain, 0), VIRQ_MCA))
+    (evtchn_virq_enabled(domain_vcpu(get_hardware_domain(), 0), VIRQ_MCA))
 
 int unmmap_broken_page(struct domain *d, mfn_t mfn, unsigned long gfn);
 
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 612b87526b..79715ce7e7 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -169,13 +169,14 @@ int vpmu_do_msr(unsigned int msr, uint64_t *msr_content,
 static inline struct vcpu *choose_hwdom_vcpu(void)
 {
     unsigned idx;
+    struct domain *hwdom = get_hardware_domain();
 
-    if ( hardware_domain->max_vcpus == 0 )
+    if ( hwdom->max_vcpus == 0 )
         return NULL;
 
-    idx = smp_processor_id() % hardware_domain->max_vcpus;
+    idx = smp_processor_id() % hwdom->max_vcpus;
 
-    return hardware_domain->vcpu[idx];
+    return hwdom->vcpu[idx];
 }
 
 void vpmu_do_interrupt(struct cpu_user_regs *regs)
diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 0611b4fb9b..e47f7da36d 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -210,7 +210,7 @@ void machine_crash_shutdown(void)
     info = kexec_crash_save_info();
     info->xen_phys_start = xen_phys_start;
     info->dom0_pfn_to_mfn_frame_list_list =
-        arch_get_pfn_to_mfn_frame_list_list(hardware_domain);
+        arch_get_pfn_to_mfn_frame_list_list(get_hardware_domain());
 }
 
 /*
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 58b26d962c..520dea2552 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2351,6 +2351,7 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
     struct IO_APIC_route_entry rte = { 0 };
     unsigned long flags;
     struct irq_desc *desc;
+    struct domain *hwdom = get_hardware_domain();
 
     if ( (apic = ioapic_physbase_to_id(physbase)) < 0 )
         return apic;
@@ -2401,7 +2402,7 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
     if ( !rte.mask )
     {
         pirq = (irq >= 256) ? irq : rte.vector;
-        if ( pirq >= hardware_domain->nr_pirqs )
+        if ( pirq >= hwdom->nr_pirqs )
             return -EINVAL;
     }
     else
@@ -2443,10 +2444,10 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
     }
     if ( pirq >= 0 )
     {
-        spin_lock(&hardware_domain->event_lock);
-        ret = map_domain_pirq(hardware_domain, pirq, irq,
+        spin_lock(&hwdom->event_lock);
+        ret = map_domain_pirq(hwdom, pirq, irq,
                               MAP_PIRQ_TYPE_GSI, NULL);
-        spin_unlock(&hardware_domain->event_lock);
+        spin_unlock(&hwdom->event_lock);
         if ( ret < 0 )
             return ret;
     }
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 8ecb982a84..7859eef303 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4917,7 +4917,7 @@ mfn_t alloc_xen_pagetable_new(void)
     {
         void *ptr = alloc_xenheap_page();
 
-        BUG_ON(!hardware_domain && !ptr);
+        BUG_ON(!ptr);
         return ptr ? virt_to_mfn(ptr) : INVALID_MFN;
     }
 
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 6d4a873130..ea8a9224ce 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -660,7 +660,7 @@ static int msi_capability_init(struct pci_dev *dev,
 
     *desc = entry;
     /* Restore the original MSI enabled bits  */
-    if ( !hardware_domain )
+    if ( !is_hardware_domain_started() )
     {
         /*
          * ..., except for internal requests (before Dom0 starts), in which
@@ -965,7 +965,7 @@ static int msix_capability_init(struct pci_dev *dev,
     ++msix->used_entries;
 
     /* Restore MSI-X enabled bits */
-    if ( !hardware_domain )
+    if ( !is_hardware_domain_started() )
     {
         /*
          * ..., except for internal requests (before Dom0 starts), in which
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index ab94a96c4d..61a083a836 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -594,7 +594,8 @@ static void do_nmi_stats(unsigned char key)
     for_each_online_cpu ( cpu )
         printk("%3u\t%3u\n", cpu, per_cpu(nmi_count, cpu));
 
-    if ( !hardware_domain || !(v = domain_vcpu(hardware_domain, 0)) )
+    if ( !is_hardware_domain_started() ||
+         !(v = domain_vcpu(get_hardware_domain(), 0)) )
         return;
 
     pend = v->arch.nmi_pending;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a6658d9769..e184f00117 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -776,6 +776,9 @@ static struct domain *__init create_dom0(const module_t *image,
     if ( IS_ERR(d) || (alloc_dom0_vcpu0(d) == NULL) )
         panic("Error creating domain 0\n");
 
+    /* Ensure the correct roles are assigned */
+    d->xsm_roles = CLASSIC_DOM0_PRIVS;
+
     /* Grab the DOM0 command line. */
     cmdline = image->string ? __va(image->string) : NULL;
     if ( cmdline || kextra )
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 3c2e563cce..dd47afe765 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1683,7 +1683,7 @@ static bool pci_serr_nmicont(void)
 
 static void nmi_hwdom_report(unsigned int reason_idx)
 {
-    struct domain *d = hardware_domain;
+    struct domain *d = get_hardware_domain();
 
     if ( !d || !d->vcpu || !d->vcpu[0] || !is_pv_domain(d) /* PVH fixme */ )
         return;
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index d7e67311fa..7bdb7a2487 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1198,6 +1198,7 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
     unsigned long old_max = max_page, old_total = total_pages;
     unsigned long old_node_start, old_node_span, orig_online;
     unsigned long i;
+    struct domain *hwdom = get_hardware_domain();
 
     dprintk(XENLOG_INFO, "memory_add %lx ~ %lx with pxm %x\n", spfn, epfn, pxm);
 
@@ -1280,12 +1281,12 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
      * shared or being kept in sync then newly added memory needs to be
      * mapped here.
      */
-    if ( is_iommu_enabled(hardware_domain) &&
-         !iommu_use_hap_pt(hardware_domain) &&
-         !need_iommu_pt_sync(hardware_domain) )
+    if ( is_iommu_enabled(hwdom) &&
+         !iommu_use_hap_pt(hwdom) &&
+         !need_iommu_pt_sync(hwdom) )
     {
         for ( i = spfn; i < epfn; i++ )
-            if ( iommu_legacy_map(hardware_domain, _dfn(i), _mfn(i),
+            if ( iommu_legacy_map(hwdom, _dfn(i), _mfn(i),
                                   1ul << PAGE_ORDER_4K,
                                   IOMMUF_readable | IOMMUF_writable) )
                 break;
@@ -1293,7 +1294,7 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
         {
             while (i-- > old_max)
                 /* If statement to satisfy __must_check. */
-                if ( iommu_legacy_unmap(hardware_domain, _dfn(i),
+                if ( iommu_legacy_unmap(hwdom, _dfn(i),
                                         1ul << PAGE_ORDER_4K) )
                     continue;
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index b3a3864421..d9b75bf835 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -45,6 +45,7 @@
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
+#include <asm/pv/shim.h>
 #endif
 
 /* Linux config option: propageted to domain0 */
@@ -302,23 +303,50 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     return NULL;
 }
 
-static int late_hwdom_init(struct domain *d)
+/* pivot_hw_ctl:
+ *  This is a one-way pivot from existing to new hardware domain. Upon success
+ *  the domain *next_hwdom will be in control of the hardware and domain
+ *  *curr_hwdom will no longer have access.
+ */
+static int pivot_hw_ctl(struct domain *next_hwdom)
 {
 #ifdef CONFIG_LATE_HWDOM
-    struct domain *dom0;
+    bool already_found = false;
+    struct domain **pd = &domain_list, *curr_hwdom = NULL;
+    domid_t dom0_id = 0;
     int rv;
 
-    if ( d != hardware_domain || d->domain_id == 0 )
+#ifdef CONFIG_PV_SHIM
+    /* On PV shim dom0 != 0 */
+    dom0_id = get_initial_domain_id();
+#endif
+
+    if ( !(next_hwdom->xsm_roles & XSM_HW_CTRL) &&
+         next_hwdom->domain_id == dom0_id )
         return 0;
 
-    rv = xsm_init_hardware_domain(XSM_NONE, d);
+    rv = xsm_init_hardware_domain(XSM_NONE, next_hwdom);
     if ( rv )
         return rv;
 
-    printk("Initialising hardware domain %d\n", hardware_domid);
+    spin_lock(&domlist_read_lock);
+
+    /* Walk whole list to ensure there is only one XSM_HW_CTRL domain */
+    for ( ; *pd != NULL; pd = &(*pd)->next_in_list )
+        if ( (*pd)->xsm_roles & XSM_HW_CTRL ) {
+            if ( !already_found )
+                panic("There should be only one domain with XSM_HW_CTRL\n");
+            already_found = true;
+            curr_hwdom = pd;
+        }
+
+    spin_unlock(&domlist_read_lock);
+
+    ASSERT(curr_hwdom != NULL);
+
+    printk("Initialising hardware domain %d\n", d->domain_id);
 
-    dom0 = rcu_lock_domain_by_id(0);
-    ASSERT(dom0 != NULL);
+    rcu_lock_domain(curr_hwdom);
     /*
      * Hardware resource ranges for domain 0 have been set up from
      * various sources intended to restrict the hardware domain's
@@ -331,17 +359,19 @@ static int late_hwdom_init(struct domain *d)
      * may be modified after this hypercall returns if a more complex
      * device model is desired.
      */
-    rangeset_swap(d->irq_caps, dom0->irq_caps);
-    rangeset_swap(d->iomem_caps, dom0->iomem_caps);
+    rangeset_swap(next_hwdom->irq_caps, curr_hwdom->irq_caps);
+    rangeset_swap(next_hwdom->iomem_caps, curr_hwdom->iomem_caps);
 #ifdef CONFIG_X86
-    rangeset_swap(d->arch.ioport_caps, dom0->arch.ioport_caps);
-    setup_io_bitmap(d);
-    setup_io_bitmap(dom0);
+    rangeset_swap(next_hwdom->arch.ioport_caps, curr_hwdom->arch.ioport_caps);
+    setup_io_bitmap(next_hwdom);
+    setup_io_bitmap(curr_hwdom);
 #endif
 
-    rcu_unlock_domain(dom0);
+    curr_hwdom->xsm_roles &= ! XSM_HW_CTRL;
 
-    iommu_hwdom_init(d);
+    rcu_unlock_domain(curr_hwdom);
+
+    iommu_hwdom_init(next_hwdom);
 
     return rv;
 #else
@@ -530,7 +560,7 @@ struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
                              bool is_priv)
 {
-    struct domain *d, **pd, *old_hwdom = NULL;
+    struct domain *d, **pd;
     enum { INIT_watchdog = 1u<<1,
            INIT_evtchn = 1u<<3, INIT_gnttab = 1u<<4, INIT_arch = 1u<<5 };
     int err, init_status = 0;
@@ -559,17 +589,19 @@ struct domain *domain_create(domid_t domid,
     /* Sort out our idea of is_control_domain(). */
     d->is_privileged = is_priv;
 
-    if (is_priv)
+    /* reality is that is_priv is only set when construction dom0 */
+    if (is_priv) {
         d->xsm_roles = CLASSIC_DOM0_PRIVS;
+        hardware_domain = d;
+    }
 
     /* Sort out our idea of is_hardware_domain(). */
-    if ( domid == 0 || domid == hardware_domid )
+    if ( domid == hardware_domid )
     {
         if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
             panic("The value of hardware_dom must be a valid domain ID\n");
 
-        old_hwdom = hardware_domain;
-        hardware_domain = d;
+        d->xsm_roles = CLASSIC_HWDOM_PRIVS;
     }
 
     TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
@@ -682,12 +714,14 @@ struct domain *domain_create(domid_t domid,
         if ( (err = sched_init_domain(d, 0)) != 0 )
             goto fail;
 
-        if ( (err = late_hwdom_init(d)) != 0 )
+        if ( (err = pivot_hw_ctl(d)) != 0 )
             goto fail;
 
         /*
          * Must not fail beyond this point, as our caller doesn't know whether
-         * the domain has been entered into domain_list or not.
+         * the domain has been entered into domain_list or not. Additionally
+         * if a hardware control pivot occurred then a failure will leave the
+         * platform without access to hardware.
          */
 
         spin_lock(&domlist_update_lock);
@@ -711,8 +745,6 @@ struct domain *domain_create(domid_t domid,
     err = err ?: -EILSEQ; /* Release build safety. */
 
     d->is_dying = DOMDYING_dead;
-    if ( hardware_domain == d )
-        hardware_domain = old_hwdom;
     atomic_set(&d->refcnt, DOMAIN_DESTROYED);
 
     sched_destroy_domain(d);
@@ -808,6 +840,42 @@ out:
 }
 
 
+bool is_hardware_domain_started()
+{
+    bool exists = false;
+    struct domain **pd = &domain_list;
+
+    if ( *pd != NULL) {
+        rcu_read_lock(&domlist_read_lock);
+
+        for ( ; *pd != NULL; pd = &(*pd)->next_in_list )
+            if ( (*pd)->xsm_roles & XSM_HW_CTRL )
+                break;
+
+        rcu_read_unlock(&domlist_read_lock);
+
+        if ( *pd != NULL )
+            exists = true;
+    }
+
+    if (exists)
+        ASSERT(*pd == hardware_domain);
+
+    return exists;
+}
+
+
+struct domain *get_hardware_domain()
+{
+    if (hardware_domain == NULL)
+        return NULL;
+
+    ASSERT(hardware_domain->xsm_roles & XSM_HW_CTRL);
+
+    return hardware_domain;
+}
+
+
 struct domain *get_domain_by_id(domid_t dom)
 {
     struct domain *d;
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 5c987096d9..775f7aa00c 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -904,7 +904,8 @@ void send_global_virq(uint32_t virq)
 {
     ASSERT(virq_is_global(virq));
 
-    send_guest_global_virq(global_virq_handlers[virq] ?: hardware_domain, virq);
+    send_guest_global_virq(
+        global_virq_handlers[virq] ?: get_hardware_domain(), virq);
 }
 
 int set_global_virq_handler(struct domain *d, uint32_t virq)
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 2d1d1ce205..f36d3f880c 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -903,7 +903,7 @@ static int kexec_load_slot(struct kexec_image *kimage)
 static uint16_t kexec_load_v1_arch(void)
 {
 #ifdef CONFIG_X86
-    return is_pv_32bit_domain(hardware_domain) ? EM_386 : EM_X86_64;
+    return is_pv_32bit_domain(get_hardware_domain()) ? EM_386 : EM_X86_64;
 #else
     return EM_NONE;
 #endif
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 8b9f378371..c22d02dea7 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -228,12 +228,12 @@ static void dump_hwdom_registers(unsigned char key)
 {
     struct vcpu *v;
 
-    if ( hardware_domain == NULL )
+    if ( is_hardware_domain_started() )
         return;
 
     printk("'%c' pressed -> dumping Dom0's registers\n", key);
 
-    for_each_vcpu ( hardware_domain, v )
+    for_each_vcpu ( get_hardware_domain(), v )
     {
         if ( alt_key_handling && softirq_pending(smp_processor_id()) )
         {
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index abde48aa4c..a8f475cc6f 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -32,43 +32,45 @@ static void noreturn maybe_reboot(void)
 
 void hwdom_shutdown(u8 reason)
 {
+    struct domain *hwdom = get_hardware_domain();
+
     switch ( reason )
     {
     case SHUTDOWN_poweroff:
         printk("Hardware Dom%u halted: halting machine\n",
-               hardware_domain->domain_id);
+               hwdom->domain_id);
         machine_halt();
         break; /* not reached */
 
     case SHUTDOWN_crash:
         debugger_trap_immediate();
-        printk("Hardware Dom%u crashed: ", hardware_domain->domain_id);
+        printk("Hardware Dom%u crashed: ", hwdom->domain_id);
         kexec_crash(CRASHREASON_HWDOM);
         maybe_reboot();
         break; /* not reached */
 
     case SHUTDOWN_reboot:
         printk("Hardware Dom%u shutdown: rebooting machine\n",
-               hardware_domain->domain_id);
+               hwdom->domain_id);
         machine_restart(0);
         break; /* not reached */
 
     case SHUTDOWN_watchdog:
         printk("Hardware Dom%u shutdown: watchdog rebooting machine\n",
-               hardware_domain->domain_id);
+               hwdom->domain_id);
         kexec_crash(CRASHREASON_WATCHDOG);
         machine_restart(0);
         break; /* not reached */
 
     case SHUTDOWN_soft_reset:
         printk("Hardware domain %d did unsupported soft reset, rebooting.\n",
-               hardware_domain->domain_id);
+               hwdom->domain_id);
         machine_restart(0);
         break; /* not reached */
 
     default:
         printk("Hardware Dom%u shutdown (unknown reason %u): ",
-               hardware_domain->domain_id, reason);
+               hwdom->domain_id, reason);
         maybe_reboot();
         break; /* not reached */
     }
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 103d0a207f..58cfcea056 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -577,6 +577,7 @@ void vm_event_cleanup(struct domain *d)
 int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec)
 {
     int rc;
+    struct domain *hwdom = get_hardware_domain();
 
     if ( vec->op == XEN_VM_EVENT_GET_VERSION )
     {
@@ -624,7 +625,7 @@ int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec)
         {
             rc = -EOPNOTSUPP;
             /* hvm fixme: p2m_is_foreign types need addressing */
-            if ( is_hvm_domain(hardware_domain) )
+            if ( is_hvm_domain(hwdom) )
                 break;
 
             rc = -ENODEV;
@@ -717,7 +718,7 @@ int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec)
         case XEN_VM_EVENT_ENABLE:
             rc = -EOPNOTSUPP;
             /* hvm fixme: p2m_is_foreign types need addressing */
-            if ( is_hvm_domain(hardware_domain) )
+            if ( is_hvm_domain(hwdom) )
                 break;
 
             rc = -ENODEV;
diff --git a/xen/common/xenoprof.c b/xen/common/xenoprof.c
index 4268c12e5d..bd8d17df1f 100644
--- a/xen/common/xenoprof.c
+++ b/xen/common/xenoprof.c
@@ -270,7 +270,8 @@ static int alloc_xenoprof_struct(
     bufsize = sizeof(struct xenoprof_buf);
     i = sizeof(struct event_log);
 #ifdef CONFIG_COMPAT
-    d->xenoprof->is_compat = is_pv_32bit_domain(is_passive ? hardware_domain : d);
+    d->xenoprof->is_compat =
+        is_pv_32bit_domain(is_passive ? get_hardware_domain() : d);
     if ( XENOPROF_COMPAT(d->xenoprof) )
     {
         bufsize = sizeof(struct compat_oprof_buf);
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 16a73d0c0e..e957b4732d 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -566,7 +566,8 @@ static void __init ns16550_endboot(struct serial_port *port)
 
     if ( uart->remapped_io_base )
         return;
-    rv = ioports_deny_access(hardware_domain, uart->io_base, uart->io_base + 7);
+    rv = ioports_deny_access(get_hardware_domain(),
+            uart->io_base, uart->io_base + 7);
     if ( rv != 0 )
         BUG();
 #endif
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index f9669c6afa..dcb1472e7e 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -776,7 +776,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     ret = 0;
     if ( !pdev->domain )
     {
-        pdev->domain = hardware_domain;
+        pdev->domain = get_hardware_domain();
         ret = iommu_add_device(pdev);
         if ( ret )
         {
@@ -784,7 +784,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
             goto out;
         }
 
-        list_add(&pdev->domain_list, &hardware_domain->pdev_list);
+        list_add(&pdev->domain_list, &pdev->domain->pdev_list);
     }
     else
         iommu_enable_device(pdev);
@@ -860,7 +860,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     /* De-assignment from dom_io should de-quarantine the device */
     target = ((pdev->quarantine || iommu_quarantine) &&
               pdev->domain != dom_io) ?
-        dom_io : hardware_domain;
+        dom_io : get_hardware_domain();
 
     while ( pdev->phantom_stride )
     {
@@ -879,7 +879,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     if ( ret )
         goto out;
 
-    if ( pdev->domain == hardware_domain  )
+    if ( is_hardware_domain(pdev->domain) )
         pdev->quarantine = false;
 
     pdev->fault.count = 0;
@@ -1403,7 +1403,7 @@ static int device_assigned(u16 seg, u8 bus, u8 devfn)
      * domain or dom_io then it must be assigned to a guest, or be
      * hidden (owned by dom_xen).
      */
-    else if ( pdev->domain != hardware_domain &&
+    else if ( !is_hardware_domain(pdev->domain) &&
               pdev->domain != dom_io )
         rc = -EBUSY;
 
@@ -1426,7 +1426,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     /* device_assigned() should already have cleared the device for assignment */
     ASSERT(pcidevs_locked());
     pdev = pci_get_pdev(seg, bus, devfn);
-    ASSERT(pdev && (pdev->domain == hardware_domain ||
+    ASSERT(pdev && (is_hardware_domain(pdev->domain) ||
                     pdev->domain == dom_io));
 
     if ( pdev->msix )
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index b2ca152e1f..580b329db9 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2358,7 +2358,7 @@ static int reassign_device_ownership(
      * can attempt to send arbitrary LAPIC/MSI messages. We are unprotected
      * by the root complex unless interrupt remapping is enabled.
      */
-    if ( (target != hardware_domain) && !iommu_intremap )
+    if ( (!is_hardware_domain(target)) && !iommu_intremap )
         untrusted_msi = true;
 
     /*
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 39681a5dff..55b7de93d2 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -475,6 +475,7 @@ struct domain
 #define XSM_XENSTORE  (1U<<31) /* Xenstore: domain that can do privileged operations on xenstore */
 #define CLASSIC_DOM0_PRIVS (XSM_PLAT_CTRL | XSM_DOM_BUILD | XSM_DOM_SUPER | \
 		XSM_DEV_EMUL | XSM_HW_CTRL | XSM_HW_SUPER | XSM_XENSTORE)
+#define CLASSIC_HWDOM_PRIVS (XSM_HW_CTRL | XSM_DEV_EMUL)
 /* Any access for which XSM_DEV_EMUL is the restriction, XSM_DOM_SUPER is an override */
 #define DEV_EMU_PRIVS (XSM_DOM_SUPER | XSM_DEV_EMUL)
 /* Anytime there is an XSM_TARGET check, XSM_SELF also applies, and XSM_DOM_SUPER is an override */
@@ -731,6 +732,10 @@ static inline struct domain *rcu_lock_current_domain(void)
     return /*rcu_lock_domain*/(current->domain);
 }
 
+bool is_hardware_domain_started(void);
+
+struct domain *get_hardware_domain(void);
+
 struct domain *get_domain_by_id(domid_t dom);
 
 struct domain *get_pg_owner(domid_t domid);
@@ -1048,7 +1053,7 @@ static always_inline bool is_hardware_domain(const struct domain *d)
     if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
         return false;
 
-    return evaluate_nospec(d == hardware_domain);
+    return evaluate_nospec(d->xsm_roles & XSM_HW_CTRL);
 }
 
 /* This check is for functionality specific to a control domain */
-- 
2.20.1


