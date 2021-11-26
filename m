Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BAA45EEA3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232788.403835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawU-0004oW-Vw; Fri, 26 Nov 2021 13:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232788.403835; Fri, 26 Nov 2021 13:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawT-0004aB-Uq; Fri, 26 Nov 2021 13:07:05 +0000
Received: by outflank-mailman (input) for mailman id 232788;
 Fri, 26 Nov 2021 13:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavE-0002zD-Bk
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9159b3dc-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:05:47 +0100 (CET)
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
X-Inumbo-ID: 9159b3dc-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UegzuZhXXHY5hqqFyS7Iw93YbL6XWSCZlaORkPJB840=;
  b=fmbPKmOdEx1a0pdUxgRngzqMFtlESNgNq7Wa9bTcjN8qetlQ7Pqn94ZV
   U93ba9rC3ODKmlCB/dpaP5tXZ65AYAGbltjzk7xSzuPtR2ypI043V63Kf
   xgOsVqhouqj8iMvslFJUSoaBt860UATHaVVGWLrYdtPWcLIt6u6em6i2H
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IdT3NFWX9Hj68kTd32brC/LgREC0HLKlW7vgt8jFLvL0zEByVHaP7ZDEBTQxPGVQjTVR3JclgH
 PNDH4cUqFWo3iNyQYRX0msWEosxO7IiYeZqW1QLrzwltlP1nFwJQ8rDbb3EhuDwn02oldn74ES
 vW/fR53wk0hHRg9jCBItk2BFp1iBL0XYGef94vIVmT27i4/XUy5Wwg6gWHDi+SolLHZsfZiTbf
 VG9suuoh/J8C9WkmuvB+E0GsIoVPTxYyYailt2gbbUHSzyAonUkv5tdaKd53hl3EgkuPOJDa23
 yUTIlp67WZnQ7Ge8AO6ThD1Y
X-SBRS: 5.1
X-MesageID: 58635033
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HpbFC69dDI9+AM7d51FEDrUDdXmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 2pKWG2EOPzZN2P0KIx+PYS/90JT6pfRy4JgSgI+qSs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdj3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhz0
 YhLmt+7Qz4jYJbXsrozDRlZGCBXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0eQ62DP
 5FCAdZpRBHlXD4QYGg0Mb8ZkcSR2Xr1SWdG72vA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/Xn9AxwcHMySz3yC6H3ErvTUgSrxVYYWFbu53v1nmluewioUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmL+MFHSytbyelDnsAjM/c0FcZS4PTCJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r8tlshDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGGD6bKMN8N4n9hIx5JFVdsLiN2ZDB00WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKNYUePMUuJVPZoHoGiausM4bFyxNEfUYXY
 8rzTCpRJSxCVfQPIMSeG4/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9yr2Vo
 yrjAxAAkzISRxTvcG23V5yqU5u3Nb4XkJ7xFXVE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:savNVKr5TE5rSQH0xT4iPqwaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58635033"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 26/65] xen/misc: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:07 +0000
Message-ID: <20211126123446.32324-27-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c                        | 6 ++++--
 xen/arch/x86/setup.c                     | 4 ++--
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
 13 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 35d000921795..5d7acf705fb8 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -811,7 +811,8 @@ struct mmio_emul_range_ctxt {
     unsigned long mfn;
 };
 
-static int print_mmio_emul_range(unsigned long s, unsigned long e, void *arg)
+static int cf_check print_mmio_emul_range(
+    unsigned long s, unsigned long e, void *arg)
 {
     const struct mmio_emul_range_ctxt *ctxt = arg;
 
@@ -4582,7 +4583,8 @@ static int _handle_iomem_range(unsigned long s, unsigned long e,
     return 0;
 }
 
-static int handle_iomem_range(unsigned long s, unsigned long e, void *p)
+static int cf_check handle_iomem_range(
+    unsigned long s, unsigned long e, void *p)
 {
     int err = 0;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f35f3cb899ab..9bd42a55f94b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2034,8 +2034,8 @@ int __hwdom_init xen_in_range(unsigned long mfn)
     return 0;
 }
 
-static int __hwdom_init io_bitmap_cb(unsigned long s, unsigned long e,
-                                     void *ctx)
+static int __hwdom_init cf_check io_bitmap_cb(
+    unsigned long s, unsigned long e, void *ctx)
 {
     struct domain *d = ctx;
     unsigned int i;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 4fcf9e23911f..de8208a6c797 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -370,7 +370,7 @@ static void cf_check _free_pirq_struct(struct rcu_head *head)
     xfree(container_of(head, struct pirq, rcu_head));
 }
 
-static void free_pirq_struct(void *ptr)
+static void cf_check free_pirq_struct(void *ptr)
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
index fbd2ebb3ba75..8146e1136a6c 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1033,8 +1033,8 @@ struct get_reserved_device_memory {
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
index 906bfb6679df..f878cd110d1e 100644
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
 
-- 
2.11.0


