Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945344CDC1F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284471.483955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUu-0005Nz-P1; Fri, 04 Mar 2022 18:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284471.483955; Fri, 04 Mar 2022 18:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUs-0004Wf-Kc; Fri, 04 Mar 2022 18:17:46 +0000
Received: by outflank-mailman (input) for mailman id 284471;
 Fri, 04 Mar 2022 17:56:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2Q-0005R5-K7
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:22 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48543e68-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:21 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2P-0000Es-0H; Fri, 04 Mar 2022 18:48:21 +0100
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
X-Inumbo-ID: 48543e68-9be3-11ec-8539-5f4723681683
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 28/36] xen/arm: introduce xen_map_text_rw
Date: Fri,  4 Mar 2022 18:46:53 +0100
Message-Id: <20220304174701.1453977-29-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Introduce two new arm specific functions to temporarily map/unmap the
Xen text read-write (the Xen text is mapped read-only by default by
setup_pagetables): xen_map_text_rw and xen_unmap_text_rw.

There is only one caller in the alternative framework.

The non-colored implementation simply uses __vmap to do the mapping. In
other words, there are no changes to the non-colored case.

The colored implementation calculates Xen text physical addresses
appropriately, according to the coloring configuration.

Export vm_alloc because it is needed by the colored implementation of
xen_map_text_rw.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
---
 xen/arch/arm/alternative.c    |  8 ++------
 xen/arch/arm/include/asm/mm.h |  3 +++
 xen/arch/arm/mm.c             | 38 +++++++++++++++++++++++++++++++++++
 xen/common/vmap.c             |  4 ++--
 xen/include/xen/vmap.h        |  2 ++
 5 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index 237c4e5642..2481521c9c 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -185,9 +185,6 @@ static int __apply_alternatives_multi_stop(void *unused)
     {
         int ret;
         struct alt_region region;
-        mfn_t xen_mfn = virt_to_mfn(_start);
-        paddr_t xen_size = _end - _start;
-        unsigned int xen_order = get_order_from_bytes(xen_size);
         void *xenmap;
 
         BUG_ON(patched);
@@ -196,8 +193,7 @@ static int __apply_alternatives_multi_stop(void *unused)
          * The text and inittext section are read-only. So re-map Xen to
          * be able to patch the code.
          */
-        xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
-                        VMAP_DEFAULT);
+        xenmap = xen_map_text_rw();
         /* Re-mapping Xen is not expected to fail during boot. */
         BUG_ON(!xenmap);
 
@@ -208,7 +204,7 @@ static int __apply_alternatives_multi_stop(void *unused)
         /* The patching is not expected to fail during boot. */
         BUG_ON(ret != 0);
 
-        vunmap(xenmap);
+        xen_unmap_text_rw(xenmap);
 
         /* Barriers provided by the cache flushing */
         write_atomic(&patched, 1);
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 1422091436..defb1efaad 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -195,6 +195,9 @@ extern void mmu_init_secondary_cpu(void);
 extern void setup_xenheap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
 /* Map a frame table to cover physical addresses ps through pe */
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
+/* Create temporary Xen text read-write mapping */
+extern void *xen_map_text_rw(void);
+extern void xen_unmap_text_rw(void *va);
 /* Map a 4k page in a fixmap entry */
 extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
 /* Remove a mapping from a fixmap entry */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 53ea13641b..b18c7cd373 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -637,6 +637,31 @@ static void clear_table(void *table)
 }
 
 #ifdef CONFIG_COLORING
+void* __init xen_map_text_rw(void)
+{
+    paddr_t xen_paddr = __pa(_start);
+    unsigned int xen_size = 1 << get_order_from_bytes(_end - _start);
+    void *va = vm_alloc(xen_size, 1, VMAP_DEFAULT);
+    unsigned long cur = (unsigned long)va;
+    mfn_t mfn_col;
+    unsigned int i;
+
+    for ( i = 0; i < xen_size; i++, cur += PAGE_SIZE )
+    {
+        xen_paddr = next_xen_colored(xen_paddr);
+        mfn_col = maddr_to_mfn(xen_paddr);
+        if ( map_pages_to_xen(cur, mfn_col, 1, PAGE_HYPERVISOR) )
+            return NULL;
+        xen_paddr += PAGE_SIZE;
+    }
+    return va;
+}
+
+void __init xen_unmap_text_rw(void *va)
+{
+    vunmap(va);
+}
+
 /*
  * Translate a Xen (.text) virtual address to the colored physical one
  * depending on the hypervisor configuration.
@@ -796,6 +821,19 @@ void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
     xen_pt_enforce_wnx();
 }
 #else
+void* __init xen_map_text_rw(void)
+{
+    unsigned int xen_order = get_order_from_bytes(_end - _start);
+    mfn_t xen_mfn = virt_to_mfn(_start);
+    return __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
+                  VMAP_DEFAULT);
+}
+
+void __init xen_unmap_text_rw(void *va)
+{
+    vunmap(va);
+}
+
 /* Boot-time pagetable setup.
  * Changes here may need matching changes in head.S */
 void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 4fd6b3067e..bedfc9d418 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -45,8 +45,8 @@ void __init vm_init_type(enum vmap_region type, void *start, void *end)
     populate_pt_range(va, vm_low[type] - nr);
 }
 
-static void *vm_alloc(unsigned int nr, unsigned int align,
-                      enum vmap_region t)
+void *vm_alloc(unsigned int nr, unsigned int align,
+               enum vmap_region t)
 {
     unsigned int start, bit;
 
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index b0f7632e89..dcf2be692f 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -12,6 +12,8 @@ enum vmap_region {
 
 void vm_init_type(enum vmap_region type, void *start, void *end);
 
+void *vm_alloc(unsigned int nr, unsigned int align,
+               enum vmap_region t);
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
              unsigned int align, unsigned int flags, enum vmap_region);
 void *vmap(const mfn_t *mfn, unsigned int nr);
-- 
2.30.2


