Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E2573DBD2
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 11:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555380.867114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDito-0000ho-FY; Mon, 26 Jun 2023 09:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555380.867114; Mon, 26 Jun 2023 09:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDito-0000fd-Bz; Mon, 26 Jun 2023 09:52:44 +0000
Received: by outflank-mailman (input) for mailman id 555380;
 Mon, 26 Jun 2023 09:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDFh=CO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qDitn-0000Ov-1P
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 09:52:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30c1f93d-1407-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 11:52:41 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.27.55])
 by support.bugseng.com (Postfix) with ESMTPSA id C6D044EE0739;
 Mon, 26 Jun 2023 11:52:39 +0200 (CEST)
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
X-Inumbo-ID: 30c1f93d-1407-11ee-8611-37d641c3527e
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
Subject: [XEN PATCH v3 1/6] xen/arm: change names in function access_guest_memory_by_ipa().
Date: Mon, 26 Jun 2023 11:52:13 +0200
Message-Id: <89e96c5d4b95a35540757235e838fd65f5e4077e.1687771796.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687771796.git.federico.serafini@bugseng.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the function name 'access_guest_memory_by_ipa' to
'access_guest_memory_by_gpa' and change its formal parameter name from
'ipa' to 'gpa' because of the following:
1) 'gpa' is used more frequently and therefore is preferable;
2) changing parameter name makes the declaration consistent with the
   corresponding definition thus fixing a violation of MISRA C:2012 Rule
   8.3.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/guest_walk.c               |  6 +++---
 xen/arch/arm/guestcopy.c                |  2 +-
 xen/arch/arm/include/asm/guest_access.h |  2 +-
 xen/arch/arm/tee/optee.c                | 10 +++++-----
 xen/arch/arm/vgic-v3-its.c              | 16 ++++++++--------
 5 files changed, 18 insertions(+), 18 deletions(-)

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
diff --git a/xen/arch/arm/include/asm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
index 4421e43611..8278a45dbf 100644
--- a/xen/arch/arm/include/asm/guest_access.h
+++ b/xen/arch/arm/include/asm/guest_access.h
@@ -16,7 +16,7 @@ unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
                                               void *buf,
                                               unsigned int len);
 
-int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
+int access_guest_memory_by_gpa(struct domain *d, paddr_t gpa, void *buf,
                                uint32_t size, bool is_write);
 
 #define __raw_copy_to_guest raw_copy_to_guest
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
-- 
2.34.1


