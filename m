Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26473B0F7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 08:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554236.865319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCahG-0000AR-CG; Fri, 23 Jun 2023 06:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554236.865319; Fri, 23 Jun 2023 06:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCahG-00008X-8Q; Fri, 23 Jun 2023 06:55:06 +0000
Received: by outflank-mailman (input) for mailman id 554236;
 Fri, 23 Jun 2023 06:55:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4arX=CL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qCahE-00008M-Sa
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 06:55:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e04f4137-1192-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 08:55:02 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.242.22])
 by support.bugseng.com (Postfix) with ESMTPSA id 3FE4D4EE0737;
 Fri, 23 Jun 2023 08:55:00 +0200 (CEST)
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
X-Inumbo-ID: e04f4137-1192-11ee-b237-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH v2] xen/arm: fix violations of MISRA C:2012 R8.3 on parameter names.
Date: Fri, 23 Jun 2023 08:54:49 +0200
Message-Id: <11c50030015014ff1a80dca849a4262133b2707a.1687502320.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To comply with Rule 8.3 ("All declarations of an object or function
shall use the same names and type qualifiers") change the parameter
names in order to have function declarations consistent with the
corresponding definitions.

Change the function identifier 'access_guest_memory_by_ipa' to
'access_guest_memory_by_gpa' in accordance with modifications on its
formal parameters: 'gpa' is used more frequently than 'ipa' and is
therefore preferable.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - adapted parameter names in function definitions to the names used
    in function declarations when the context requires it;
  - reflected changes to the function identifier in order to maintain
    consistency with modifications on parameter names;
  - extended changes to definitions under xen/arch/arm/vgic.
---
 xen/arch/arm/domain.c                   | 10 +++++-----
 xen/arch/arm/guest_walk.c               |  6 +++---
 xen/arch/arm/guestcopy.c                |  2 +-
 xen/arch/arm/include/asm/fixmap.h       |  2 +-
 xen/arch/arm/include/asm/gic.h          |  2 +-
 xen/arch/arm/include/asm/gic_v3_its.h   |  5 +++--
 xen/arch/arm/include/asm/grant_table.h  |  4 ++--
 xen/arch/arm/include/asm/guest_access.h |  4 ++--
 xen/arch/arm/include/asm/irq.h          |  2 +-
 xen/arch/arm/include/asm/regs.h         |  2 +-
 xen/arch/arm/include/asm/vgic.h         |  4 ++--
 xen/arch/arm/mm.c                       | 10 +++++-----
 xen/arch/arm/tee/optee.c                | 10 +++++-----
 xen/arch/arm/vgic-v3-its.c              | 16 ++++++++--------
 xen/arch/arm/vgic/vgic-init.c           | 12 ++++++------
 15 files changed, 46 insertions(+), 45 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index add9929b79..8c18e92079 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1155,15 +1155,15 @@ void vcpu_block_unless_event_pending(struct vcpu *v)
         vcpu_unblock(current);
 }
 
-void vcpu_kick(struct vcpu *vcpu)
+void vcpu_kick(struct vcpu *v)
 {
-    bool running = vcpu->is_running;
+    bool running = v->is_running;
 
-    vcpu_unblock(vcpu);
-    if ( running && vcpu != current )
+    vcpu_unblock(v);
+    if ( running && v != current )
     {
         perfc_incr(vcpu_kick);
-        smp_send_event_check_mask(cpumask_of(vcpu->processor));
+        smp_send_event_check_mask(cpumask_of(v->processor));
     }
 }
 
diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index c80a0ce55b..d99b411f3b 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -85,7 +85,7 @@ static bool guest_walk_sd(const struct vcpu *v,
     paddr |= (gva & mask) >> 18;
 
     /* Access the guest's memory to read only one PTE. */
-    ret = access_guest_memory_by_ipa(d, paddr, &pte, sizeof(short_desc_t), false);
+    ret = access_guest_memory_by_gpa(d, paddr, &pte, sizeof(short_desc_t), false);
     if ( ret )
         return false;
 
@@ -110,7 +110,7 @@ static bool guest_walk_sd(const struct vcpu *v,
         paddr = ((paddr_t)pte.walk.base << 10) | ((gva & mask) >> 10);
 
         /* Access the guest's memory to read only one PTE. */
-        ret = access_guest_memory_by_ipa(d, paddr, &pte, sizeof(short_desc_t), false);
+        ret = access_guest_memory_by_gpa(d, paddr, &pte, sizeof(short_desc_t), false);
         if ( ret )
             return false;
 
@@ -481,7 +481,7 @@ static bool guest_walk_ld(const struct vcpu *v,
         paddr |= LPAE_TABLE_INDEX_GS(grainsizes[gran], level, gva) << 3;
 
         /* Access the guest's memory to read only one PTE. */
-        ret = access_guest_memory_by_ipa(d, paddr, &pte, sizeof(lpae_t), false);
+        ret = access_guest_memory_by_gpa(d, paddr, &pte, sizeof(lpae_t), false);
         if ( ret )
             return false;
 
diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index 225fd343dd..6716b03561 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -142,7 +142,7 @@ unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
                       COPY_to_guest | COPY_ipa | COPY_flush_dcache);
 }
 
-int access_guest_memory_by_ipa(struct domain *d, paddr_t gpa, void *buf,
+int access_guest_memory_by_gpa(struct domain *d, paddr_t gpa, void *buf,
                                uint32_t size, bool is_write)
 {
     unsigned long left;
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index d0c9a52c8c..734eb9b1d4 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -30,7 +30,7 @@
 extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
 
 /* Map a page in a fixmap entry */
-extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int attributes);
+extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags);
 /* Remove a mapping from a fixmap entry */
 extern void clear_fixmap(unsigned int map);
 
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 76e3fa5dc4..f1ef347edc 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -257,7 +257,7 @@ int gic_remove_irq_from_guest(struct domain *d, unsigned int virq,
 extern void gic_clear_pending_irqs(struct vcpu *v);
 
 extern void init_maintenance_interrupt(void);
-extern void gic_raise_guest_irq(struct vcpu *v, unsigned int irq,
+extern void gic_raise_guest_irq(struct vcpu *v, unsigned int virtual_irq,
         unsigned int priority);
 extern void gic_raise_inflight_irq(struct vcpu *v, unsigned int virtual_irq);
 
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index fae3f6ecef..c24d4752d0 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -190,8 +190,9 @@ struct pending_irq *gicv3_its_get_event_pending_irq(struct domain *d,
                                                     uint32_t eventid);
 int gicv3_remove_guest_event(struct domain *d, paddr_t vdoorbell_address,
                                      uint32_t vdevid, uint32_t eventid);
-struct pending_irq *gicv3_assign_guest_event(struct domain *d, paddr_t doorbell,
-                                             uint32_t devid, uint32_t eventid,
+struct pending_irq *gicv3_assign_guest_event(struct domain *d,
+                                             paddr_t vdoorbell_address,
+                                             uint32_t vdevid, uint32_t eventid,
                                              uint32_t virt_lpi);
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index e13dfeefa5..c2b0dbc806 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -36,10 +36,10 @@ static inline bool gnttab_release_host_mappings(const struct domain *d)
     return true;
 }
 
-int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
+int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
                               unsigned int flags, unsigned int cache_flags);
 int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
-                               unsigned long new_gpaddr, unsigned int flags);
+                               unsigned long new_addr, unsigned int flags);
 
 /*
  * The region used by Xen on the memory will never be mapped in DOM0
diff --git a/xen/arch/arm/include/asm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
index 4421e43611..18c88b70d7 100644
--- a/xen/arch/arm/include/asm/guest_access.h
+++ b/xen/arch/arm/include/asm/guest_access.h
@@ -12,11 +12,11 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 
 /* Copy data to guest physical address, then clean the region. */
 unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
-                                              paddr_t phys,
+                                              paddr_t gpa,
                                               void *buf,
                                               unsigned int len);
 
-int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
+int access_guest_memory_by_gpa(struct domain *d, paddr_t gpa, void *buf,
                                uint32_t size, bool is_write);
 
 #define __raw_copy_to_guest raw_copy_to_guest
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index 11bc85d111..105b33b37d 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -76,7 +76,7 @@ void init_IRQ(void);
 
 int route_irq_to_guest(struct domain *d, unsigned int virq,
                        unsigned int irq, const char *devname);
-int release_guest_irq(struct domain *d, unsigned int irq);
+int release_guest_irq(struct domain *d, unsigned int virq);
 
 void arch_move_irqs(struct vcpu *v);
 
diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index 0693a68131..ef34b38aa1 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -58,7 +58,7 @@ static inline bool guest_mode(const struct cpu_user_regs *r)
 }
 
 register_t get_user_reg(struct cpu_user_regs *regs, int reg);
-void set_user_reg(struct cpu_user_regs *regs, int reg, register_t val);
+void set_user_reg(struct cpu_user_regs *regs, int reg, register_t value);
 
 #endif
 
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index 328fd46d1b..aa9f49409e 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -355,8 +355,8 @@ bool vgic_evtchn_irq_pending(struct vcpu *v);
 int domain_vgic_register(struct domain *d, int *mmio_count);
 int domain_vgic_init(struct domain *d, unsigned int nr_spis);
 void domain_vgic_free(struct domain *d);
-int vcpu_vgic_init(struct vcpu *vcpu);
-int vcpu_vgic_free(struct vcpu *vcpu);
+int vcpu_vgic_init(struct vcpu *v);
+int vcpu_vgic_free(struct vcpu *v);
 
 void vgic_inject_irq(struct domain *d, struct vcpu *v, unsigned int virq,
                      bool level);
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index e460249736..2e9860a754 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -736,10 +736,10 @@ void *__init arch_vmap_virt_end(void)
  * This function should only be used to remap device address ranges
  * TODO: add a check to verify this assumption
  */
-void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
+void *ioremap_attr(paddr_t start, size_t len, unsigned int attributes)
 {
-    mfn_t mfn = _mfn(PFN_DOWN(pa));
-    unsigned int offs = pa & (PAGE_SIZE - 1);
+    mfn_t mfn = _mfn(PFN_DOWN(start));
+    unsigned int offs = start & (PAGE_SIZE - 1);
     unsigned int nr = PFN_UP(offs + len);
     void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
 
@@ -1579,7 +1579,7 @@ void put_page_type(struct page_info *page)
     return;
 }
 
-int create_grant_host_mapping(unsigned long addr, mfn_t frame,
+int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
                               unsigned int flags, unsigned int cache_flags)
 {
     int rc;
@@ -1591,7 +1591,7 @@ int create_grant_host_mapping(unsigned long addr, mfn_t frame,
     if ( flags & GNTMAP_readonly )
         t = p2m_grant_map_ro;
 
-    rc = guest_physmap_add_entry(current->domain, gaddr_to_gfn(addr),
+    rc = guest_physmap_add_entry(current->domain, gaddr_to_gfn(gpaddr),
                                  frame, 0, t);
 
     if ( rc )
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 9cb9f16d43..301d205a36 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -951,7 +951,7 @@ static bool copy_std_request(struct cpu_user_regs *regs,
 
     map_xen_arg(call);
 
-    if ( access_guest_memory_by_ipa(current->domain, call->guest_arg_ipa,
+    if ( access_guest_memory_by_gpa(current->domain, call->guest_arg_ipa,
                                     call->xen_arg,
                                     OPTEE_MSG_NONCONTIG_PAGE_SIZE, false) )
     {
@@ -1106,7 +1106,7 @@ static int handle_rpc_return(struct optee_domain *ctx,
 
         shm_rpc->xen_arg = __map_domain_page(shm_rpc->xen_arg_pg);
 
-        if ( access_guest_memory_by_ipa(current->domain,
+        if ( access_guest_memory_by_gpa(current->domain,
                         gfn_to_gaddr(shm_rpc->gfn),
                         shm_rpc->xen_arg,
                         OPTEE_MSG_GET_ARG_SIZE(shm_rpc->xen_arg->num_params),
@@ -1329,7 +1329,7 @@ static bool issue_rpc_cmd_free(struct optee_domain *ctx,
     shm_rpc->xen_arg->params[0].u.value.a = call->rpc_buffer_type;
     shm_rpc->xen_arg->params[0].u.value.b = cookie;
 
-    if ( access_guest_memory_by_ipa(current->domain,
+    if ( access_guest_memory_by_gpa(current->domain,
                                     gfn_to_gaddr(shm_rpc->gfn),
                                     shm_rpc->xen_arg,
                                     OPTEE_MSG_GET_ARG_SIZE(1),
@@ -1462,7 +1462,7 @@ static void handle_rpc_cmd(struct optee_domain *ctx, struct cpu_user_regs *regs,
     shm_rpc->xen_arg = __map_domain_page(shm_rpc->xen_arg_pg);
 
     /* First, copy only header to read number of arguments */
-    if ( access_guest_memory_by_ipa(current->domain,
+    if ( access_guest_memory_by_gpa(current->domain,
                                     gfn_to_gaddr(shm_rpc->gfn),
                                     shm_rpc->xen_arg,
                                     sizeof(struct optee_msg_arg),
@@ -1480,7 +1480,7 @@ static void handle_rpc_cmd(struct optee_domain *ctx, struct cpu_user_regs *regs,
     }
 
     /* Read the whole command structure */
-    if ( access_guest_memory_by_ipa(current->domain, gfn_to_gaddr(shm_rpc->gfn),
+    if ( access_guest_memory_by_gpa(current->domain, gfn_to_gaddr(shm_rpc->gfn),
                                     shm_rpc->xen_arg, arg_size, false) )
     {
         shm_rpc->xen_arg->ret = TEEC_ERROR_GENERIC;
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 299b384250..05429030b5 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -121,7 +121,7 @@ static int its_set_collection(struct virt_its *its, uint16_t collid,
     if ( collid >= its->max_collections )
         return -ENOENT;
 
-    return access_guest_memory_by_ipa(its->d,
+    return access_guest_memory_by_gpa(its->d,
                                       addr + collid * sizeof(coll_table_entry_t),
                                       &vcpu_id, sizeof(vcpu_id), true);
 }
@@ -139,7 +139,7 @@ static struct vcpu *get_vcpu_from_collection(struct virt_its *its,
     if ( collid >= its->max_collections )
         return NULL;
 
-    ret = access_guest_memory_by_ipa(its->d,
+    ret = access_guest_memory_by_gpa(its->d,
                                      addr + collid * sizeof(coll_table_entry_t),
                                      &vcpu_id, sizeof(coll_table_entry_t), false);
     if ( ret )
@@ -161,7 +161,7 @@ static int its_set_itt_address(struct virt_its *its, uint32_t devid,
     if ( devid >= its->max_devices )
         return -ENOENT;
 
-    return access_guest_memory_by_ipa(its->d,
+    return access_guest_memory_by_gpa(its->d,
                                       addr + devid * sizeof(dev_table_entry_t),
                                       &itt_entry, sizeof(itt_entry), true);
 }
@@ -179,7 +179,7 @@ static int its_get_itt(struct virt_its *its, uint32_t devid,
     if ( devid >= its->max_devices )
         return -EINVAL;
 
-    return access_guest_memory_by_ipa(its->d,
+    return access_guest_memory_by_gpa(its->d,
                                       addr + devid * sizeof(dev_table_entry_t),
                                       itt, sizeof(*itt), false);
 }
@@ -226,7 +226,7 @@ static bool read_itte(struct virt_its *its, uint32_t devid, uint32_t evid,
     if ( addr == INVALID_PADDR )
         return false;
 
-    if ( access_guest_memory_by_ipa(its->d, addr, &itte, sizeof(itte), false) )
+    if ( access_guest_memory_by_gpa(its->d, addr, &itte, sizeof(itte), false) )
         return false;
 
     vcpu = get_vcpu_from_collection(its, itte.collection);
@@ -260,7 +260,7 @@ static bool write_itte(struct virt_its *its, uint32_t devid,
     itte.collection = collid;
     itte.vlpi = vlpi;
 
-    if ( access_guest_memory_by_ipa(its->d, addr, &itte, sizeof(itte), true) )
+    if ( access_guest_memory_by_gpa(its->d, addr, &itte, sizeof(itte), true) )
         return false;
 
     return true;
@@ -405,7 +405,7 @@ static int update_lpi_property(struct domain *d, struct pending_irq *p)
 
     addr = d->arch.vgic.rdist_propbase & GENMASK(51, 12);
 
-    ret = access_guest_memory_by_ipa(d, addr + p->irq - LPI_OFFSET,
+    ret = access_guest_memory_by_gpa(d, addr + p->irq - LPI_OFFSET,
                                      &property, sizeof(property), false);
     if ( ret )
         return ret;
@@ -910,7 +910,7 @@ static int vgic_its_handle_cmds(struct domain *d, struct virt_its *its)
     {
         int ret;
 
-        ret = access_guest_memory_by_ipa(d, addr + its->creadr,
+        ret = access_guest_memory_by_gpa(d, addr + its->creadr,
                                          command, sizeof(command), false);
         if ( ret )
             return ret;
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index ea739d081e..76b85ea823 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -196,16 +196,16 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
  * vcpu_vgic_init() - Register VCPU-specific KVM iodevs
  * was: kvm_vgic_vcpu_init()
  * Xen: adding vgic_vx_enable() call
- * @vcpu: pointer to the VCPU being created and initialized
+ * @v: pointer to the VCPU being created and initialized
  */
-int vcpu_vgic_init(struct vcpu *vcpu)
+int vcpu_vgic_init(struct vcpu *v)
 {
     int ret = 0;
 
-    vgic_vcpu_early_init(vcpu);
+    vgic_vcpu_early_init(v);
 
     if ( gic_hw_version() == GIC_V2 )
-        vgic_v2_enable(vcpu);
+        vgic_v2_enable(v);
     else
         ret = -ENXIO;
 
@@ -239,9 +239,9 @@ void domain_vgic_free(struct domain *d)
     dist->nr_spis = 0;
 }
 
-int vcpu_vgic_free(struct vcpu *vcpu)
+int vcpu_vgic_free(struct vcpu *v)
 {
-    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
+    struct vgic_cpu *vgic_cpu = &v->arch.vgic;
 
     INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
 
-- 
2.34.1


