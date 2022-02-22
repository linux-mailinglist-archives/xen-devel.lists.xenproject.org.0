Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D732C4BFC81
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276853.473174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4S-0006Ew-OO; Tue, 22 Feb 2022 15:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276853.473174; Tue, 22 Feb 2022 15:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4S-0006D3-LD; Tue, 22 Feb 2022 15:27:20 +0000
Received: by outflank-mailman (input) for mailman id 276853;
 Tue, 22 Feb 2022 15:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4R-0006Cs-7O
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea382491-93f3-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:27:17 +0100 (CET)
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
X-Inumbo-ID: ea382491-93f3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=bt4OX/67fRpjbPwMltvyGAYpZSijmRJZNzMcDVcps9k=;
  b=Gin1nKsn24MtUsdYUVAQe3JoEPsSmGWa6mx91S2IWMg2OdcqgKfdeN9p
   7AzY0utm9/xaKRWADwRcb6OJ5AYPKftCRx3Lf8wappBSVXCzFZT3BpR+W
   Xm9uGWdJ6SINh2vHaXqri9q7uz3ZCJgBQoti6bYo42pm4S7DxqTkWQvJ+
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64733393
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3wLknax91XTxUE1eK+R6t+dTxirEfRIJ4+MujC+fZmUNrF6WrkUPz
 WIaWT+Haf7YZ2v3Ld91PN+0phgEu8fcx9ZrTVM+/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy24LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljKGNVywOL7P3wO0ZVl55DC9XMaZZ5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5VCMmE+N3wsZTVGC0VIDqkngt2N3GP4Lx8F9FOT/vAotj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWYu9iN
 Wcz6zQV9aE28QuKUdfUUxanvyvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZWj81XHnid2lpAQ6QlqCZvvW07uUr/s2tEiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUHrlQQO/4uqvfbGSE6bKKI3XH3272k5JEVdoNiAyS2W8zappUEdMXS
 BW7VfxtCG97YyLxMP4fj3OZAMU216nwfekJpdiPBueilqNZLVfdlAk3PBb49zm0zCAEzPFuU
 b/GIJ3EJStLVsxaIM+eGr51PUkDnXtlmws+hPnTknya7FZpTCTLEexcaAPWNIjULsqs+W3oz
 jqWDOPSoz03bQE0SnC/HVI7RbzSEUUGOA==
IronPort-HdrOrdr: A9a23:P1jCwK2tojv49pNqu0W3OgqjBIMkLtp133Aq2lEZdPUnSL3gqy
 nOpoV+6faaskdzZJhNo7y90ey7IE80lqQFhLX5X43SPjUO0VHAROpfBMnZrQEIcBefygcp79
 YHT0ERMrLN5cERt6zHCSqDYq4dKaG8gceVbTmy9RpQcT0=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64733393"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 29/70] xen/misc: CFI hardening
Date: Tue, 22 Feb 2022 15:26:39 +0000
Message-ID: <20220222152645.8844-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3
 * Annotations for gcov
---
 xen/arch/x86/mm.c                        | 6 ++++--
 xen/arch/x86/setup.c                     | 4 ++--
 xen/common/coverage/gcov.c               | 8 ++++----
 xen/common/domain.c                      | 2 +-
 xen/common/gdbstub.c                     | 5 ++---
 xen/common/livepatch.c                   | 7 +++----
 xen/common/memory.c                      | 4 ++--
 xen/common/page_alloc.c                  | 2 +-
 xen/common/radix-tree.c                  | 4 ++--
 xen/common/rangeset.c                    | 2 +-
 xen/common/spinlock.c                    | 6 +++---
 xen/common/vm_event.c                    | 6 +++---
 xen/common/xmalloc_tlsf.c                | 4 ++--
 xen/drivers/passthrough/amd/iommu_init.c | 2 +-
 xen/include/xen/domain.h                 | 2 +-
 15 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a1b8737096c4..0665095d2309 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -835,7 +835,8 @@ struct mmio_emul_range_ctxt {
     unsigned long mfn;
 };
 
-static int print_mmio_emul_range(unsigned long s, unsigned long e, void *arg)
+static int cf_check print_mmio_emul_range(
+    unsigned long s, unsigned long e, void *arg)
 {
     const struct mmio_emul_range_ctxt *ctxt = arg;
 
@@ -4606,7 +4607,8 @@ static int _handle_iomem_range(unsigned long s, unsigned long e,
     return 0;
 }
 
-static int handle_iomem_range(unsigned long s, unsigned long e, void *p)
+static int cf_check handle_iomem_range(
+    unsigned long s, unsigned long e, void *p)
 {
     int err = 0;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3a4ec1fcfd04..a9a371336b36 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2021,8 +2021,8 @@ int __hwdom_init xen_in_range(unsigned long mfn)
     return 0;
 }
 
-static int __hwdom_init io_bitmap_cb(unsigned long s, unsigned long e,
-                                     void *ctx)
+static int __hwdom_init cf_check io_bitmap_cb(
+    unsigned long s, unsigned long e, void *ctx)
 {
     struct domain *d = ctx;
     unsigned int i;
diff --git a/xen/common/coverage/gcov.c b/xen/common/coverage/gcov.c
index 3cc98728bfce..327bf8d646c0 100644
--- a/xen/common/coverage/gcov.c
+++ b/xen/common/coverage/gcov.c
@@ -120,7 +120,7 @@ static int gcov_info_dump_payload(const struct gcov_info *info,
 
 }
 
-static uint32_t gcov_get_size(void)
+static uint32_t cf_check gcov_get_size(void)
 {
     uint32_t total_size = sizeof(uint32_t); /* Magic number XCOV */
     struct gcov_info *info = NULL;
@@ -140,7 +140,7 @@ static uint32_t gcov_get_size(void)
     return total_size;
 }
 
-static void gcov_reset_all_counters(void)
+static void cf_check gcov_reset_all_counters(void)
 {
     struct gcov_info *info = NULL;
 
@@ -172,8 +172,8 @@ static int gcov_dump_one_record(const struct gcov_info *info,
     return gcov_info_dump_payload(info, buffer, off);
 }
 
-static int gcov_dump_all(XEN_GUEST_HANDLE_PARAM(char) buffer,
-                         uint32_t *buffer_size)
+static int cf_check gcov_dump_all(
+    XEN_GUEST_HANDLE_PARAM(char) buffer, uint32_t *buffer_size)
 {
     uint32_t off;
     uint32_t magic = XEN_GCOV_FORMAT_MAGIC;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f3d06df76c33..351029f8b239 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1803,7 +1803,7 @@ static void cf_check _free_pirq_struct(struct rcu_head *head)
     xfree(container_of(head, struct pirq, rcu_head));
 }
 
-void free_pirq_struct(void *ptr)
+void cf_check free_pirq_struct(void *ptr)
 {
     struct pirq *pirq = ptr;
 
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
index 079c3ca9616a..d6872721dc0d 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -69,7 +69,7 @@ static void gdb_smp_resume(void);
 static char __initdata opt_gdb[30];
 string_param("gdb", opt_gdb);
 
-static void gdbstub_console_puts(const char *str, size_t nr);
+static void cf_check gdbstub_console_puts(const char *str, size_t nr);
 
 /* value <-> char (de)serialzers */
 static char
@@ -546,8 +546,7 @@ __gdb_ctx = {
 };
 static struct gdb_context *gdb_ctx = &__gdb_ctx;
 
-static void
-gdbstub_console_puts(const char *str, size_t nr)
+static void cf_check gdbstub_console_puts(const char *str, size_t nr)
 {
     const char *p;
 
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index e8714920dc8f..ec301a9f120c 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -157,10 +157,9 @@ unsigned long livepatch_symbols_lookup_by_name(const char *symname)
     return 0;
 }
 
-static const char *livepatch_symbols_lookup(unsigned long addr,
-                                            unsigned long *symbolsize,
-                                            unsigned long *offset,
-                                            char *namebuf)
+static const char *cf_check livepatch_symbols_lookup(
+    unsigned long addr, unsigned long *symbolsize, unsigned long *offset,
+    char *namebuf)
 {
     const struct payload *data;
     unsigned int i, best;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index ede45c4af9db..69b0cd1e50de 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1051,8 +1051,8 @@ struct get_reserved_device_memory {
     unsigned int used_entries;
 };
 
-static int get_reserved_device_memory(xen_pfn_t start, xen_ulong_t nr,
-                                      u32 id, void *ctxt)
+static int cf_check get_reserved_device_memory(
+    xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
 {
     struct get_reserved_device_memory *grdm = ctxt;
     uint32_t sbdf = PCI_SBDF3(grdm->map.dev.pci.seg, grdm->map.dev.pci.bus,
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 3caf5c954b24..46357182375a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1238,7 +1238,7 @@ struct scrub_wait_state {
     bool drop;
 };
 
-static void scrub_continue(void *data)
+static void cf_check scrub_continue(void *data)
 {
     struct scrub_wait_state *st = data;
 
diff --git a/xen/common/radix-tree.c b/xen/common/radix-tree.c
index 33b47748ae49..adc3034222dc 100644
--- a/xen/common/radix-tree.c
+++ b/xen/common/radix-tree.c
@@ -52,7 +52,7 @@ struct rcu_node {
 	struct rcu_head rcu_head;
 };
 
-static struct radix_tree_node *rcu_node_alloc(void *arg)
+static struct radix_tree_node *cf_check rcu_node_alloc(void *arg)
 {
 	struct rcu_node *rcu_node = xmalloc(struct rcu_node);
 	return rcu_node ? &rcu_node->node : NULL;
@@ -65,7 +65,7 @@ static void cf_check _rcu_node_free(struct rcu_head *head)
 	xfree(rcu_node);
 }
 
-static void rcu_node_free(struct radix_tree_node *node, void *arg)
+static void cf_check rcu_node_free(struct radix_tree_node *node, void *arg)
 {
 	struct rcu_node *rcu_node = container_of(node, struct rcu_node, node);
 	call_rcu(&rcu_node->rcu_head, _rcu_node_free);
diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 885b6b15c229..a6ef2640462a 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -384,7 +384,7 @@ int rangeset_consume_ranges(struct rangeset *r,
     return rc;
 }
 
-static int merge(unsigned long s, unsigned long e, void *data)
+static int cf_check merge(unsigned long s, unsigned long e, void *data)
 {
     struct rangeset *r = data;
 
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 25bfbf3c47f7..62c83aaa6a73 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -375,7 +375,7 @@ static void spinlock_profile_iterate(lock_profile_subfunc *sub, void *par)
     spin_unlock(&lock_profile_lock);
 }
 
-static void spinlock_profile_print_elem(struct lock_profile *data,
+static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
     int32_t type, int32_t idx, void *par)
 {
     struct spinlock *lock = data->lock;
@@ -404,7 +404,7 @@ void cf_check spinlock_profile_printall(unsigned char key)
     spinlock_profile_iterate(spinlock_profile_print_elem, NULL);
 }
 
-static void spinlock_profile_reset_elem(struct lock_profile *data,
+static void cf_check spinlock_profile_reset_elem(struct lock_profile *data,
     int32_t type, int32_t idx, void *par)
 {
     data->lock_cnt = 0;
@@ -428,7 +428,7 @@ typedef struct {
     int                      rc;
 } spinlock_profile_ucopy_t;
 
-static void spinlock_profile_ucopy_elem(struct lock_profile *data,
+static void cf_check spinlock_profile_ucopy_elem(struct lock_profile *data,
     int32_t type, int32_t idx, void *par)
 {
     spinlock_profile_ucopy_t *p = par;
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 70ab3ba406ff..84cf52636bc4 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -523,21 +523,21 @@ int __vm_event_claim_slot(struct domain *d, struct vm_event_domain *ved,
 
 #ifdef CONFIG_MEM_PAGING
 /* Registered with Xen-bound event channel for incoming notifications. */
-static void mem_paging_notification(struct vcpu *v, unsigned int port)
+static void cf_check mem_paging_notification(struct vcpu *v, unsigned int port)
 {
     vm_event_resume(v->domain, v->domain->vm_event_paging);
 }
 #endif
 
 /* Registered with Xen-bound event channel for incoming notifications. */
-static void monitor_notification(struct vcpu *v, unsigned int port)
+static void cf_check monitor_notification(struct vcpu *v, unsigned int port)
 {
     vm_event_resume(v->domain, v->domain->vm_event_monitor);
 }
 
 #ifdef CONFIG_MEM_SHARING
 /* Registered with Xen-bound event channel for incoming notifications. */
-static void mem_sharing_notification(struct vcpu *v, unsigned int port)
+static void cf_check mem_sharing_notification(struct vcpu *v, unsigned int port)
 {
     vm_event_resume(v->domain, v->domain->vm_event_share);
 }
diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index e3f6886e6b62..d2ad909502d0 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -512,13 +512,13 @@ int xmem_pool_maxalloc(struct xmem_pool *pool)
 
 static struct xmem_pool *xenpool;
 
-static void *xmalloc_pool_get(unsigned long size)
+static void *cf_check xmalloc_pool_get(unsigned long size)
 {
     ASSERT(size == PAGE_SIZE);
     return alloc_xenheap_page();
 }
 
-static void xmalloc_pool_put(void *p)
+static void cf_check xmalloc_pool_put(void *p)
 {
     free_xenheap_page(p);
 }
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 06b4d2b1fea0..cebcd68a6c04 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1073,7 +1073,7 @@ static void * __init allocate_ppr_log(struct amd_iommu *iommu)
 #define IVRS_MAPPINGS_DEVTAB(m) (m)[ivrs_bdf_entries].intremap_table
 
 /* Gets passed to radix_tree_destroy(), so its param needs to be void *. */
-static void __init free_ivrs_mapping_callback(void *ptr)
+static void __init cf_check free_ivrs_mapping_callback(void *ptr)
 {
     const struct ivrs_mappings *ivrs_mappings = ptr;
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 24eb4cc7d37e..1c3c88a14d6f 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -52,7 +52,7 @@ void free_vcpu_struct(struct vcpu *v);
 #ifndef alloc_pirq_struct
 struct pirq *alloc_pirq_struct(struct domain *);
 #endif
-void free_pirq_struct(void *);
+void cf_check free_pirq_struct(void *);
 
 /*
  * Initialise/destroy arch-specific details of a VCPU.
-- 
2.11.0


