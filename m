Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037601FF886
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 18:04:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlx1Z-00042K-Cc; Thu, 18 Jun 2020 16:04:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlx1X-00042D-Ac
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 16:04:19 +0000
X-Inumbo-ID: 5c3de826-b17d-11ea-bab3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c3de826-b17d-11ea-bab3-12813bfff9fa;
 Thu, 18 Jun 2020 16:04:16 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tzvRTewNofvhfiPxTGCJNfeG0dDxnhB/rgCyeCmChpF4gw5vhgIeWeblUHzWdizrIQb8HSypUh
 tM8S0HnT/fK5Qu4LnZIrCXILThjEso64ra9hHZKjq5LceA871Lb37LzhlgooSeynRPPj78IIZM
 mZdxRACPyWQKRWWNsZCakvx5G87MxY3BlAL8TIfiMQpTiWRylxFzU79hB5Oa7kW8iLAptJzj/k
 Yrl4qgEEa5eZWy1H4hq3ca5y+hVuB48PjtcffyoSaSlCbAEWS5jJgCT046YigveeEmVhXaV778
 KKw=
X-SBRS: 2.7
X-MesageID: 20734531
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20734531"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] x86/tlb: fix assisted flush usage
Date: Thu, 18 Jun 2020 18:04:03 +0200
Message-ID: <20200618160403.35199-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit e9aca9470ed86 introduced a regression when avoiding sending
IPIs for certain flush operations. Xen page fault handler
(spurious_page_fault) relies on blocking interrupts in order to
prevent handling TLB flush IPIs and thus preventing other CPUs from
removing page tables pages. Switching to assisted flushing avoided such
IPIs, and thus can result in pages belonging to the page tables being
removed (and possibly re-used) while __page_fault_type is being
executed.

Force some of the TLB flushes to use IPIs, thus avoiding the assisted
TLB flush. Those selected flushes are the page type change (when
switching from a page table type to a different one, ie: a page that
has been removed as a page table) and page allocation. This sadly has
a negative performance impact on the pvshim, as less assisted flushes
can be used.

Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
using an IPI (flush_tlb_mask_sync). Note that the flag is only
meaningfully defined when the hypervisor supports PV mode, as
otherwise translated domains are in charge of their page tables and
won't share page tables with Xen, thus not influencing the result of
page walks performed by the spurious fault handler.

Note the flag is not defined on Arm, and the introduced helper is just
a dummy alias to the existing flush_tlb_mask.

Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
It's my understanding that not doing such IPI flushes could lead to
the pages tables being read by __page_fault_type being modified by a
third party, which could make them point to other mfns out of the
scope of the guest allowed physical memory addresses. However those
accesses would be limited to __page_fault_type, and hence the main
worry would be that a guest could make it point to read from a
physical memory region that has side effects?

Given that pvshim doesn't support passthrough devices, I'm not aware
of any such region being part of the physmap in the specific pvshim
case, so I wonder if it would be fine to remove the restriction for
the pvshim only case?
---
 xen/arch/x86/mm.c              | 12 +++++++++++-
 xen/common/memory.c            |  2 +-
 xen/common/page_alloc.c        |  2 +-
 xen/include/asm-arm/flushtlb.h |  1 +
 xen/include/asm-x86/flushtlb.h | 14 ++++++++++++++
 xen/include/xen/mm.h           |  8 ++++++--
 6 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c294092f93..0be6b38769 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2894,7 +2894,17 @@ static int _get_page_type(struct page_info *page, unsigned long type,
                       ((nx & PGT_type_mask) == PGT_writable_page)) )
                 {
                     perfc_incr(need_flush_tlb_flush);
-                    flush_tlb_mask(mask);
+                    if ( (x & PGT_type_mask) &&
+                         (x & PGT_type_mask) <= PGT_l4_page_table )
+                        /*
+                         * If page was a page table make sure the flush is
+                         * performed using an IPI in order to avoid changing
+                         * the type of a page table page under the feet of
+                         * spurious_page_fault.
+                         */
+                        flush_tlb_mask_sync(mask);
+                    else
+                        flush_tlb_mask(mask);
                 }
 
                 /* We lose existing type and validity. */
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 714077c1e5..0d224d6675 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -278,7 +278,7 @@ static void populate_physmap(struct memop_args *a)
 
 out:
     if ( need_tlbflush )
-        filtered_flush_tlb_mask(tlbflush_timestamp);
+        filtered_flush_tlb_mask(tlbflush_timestamp, false);
 
     if ( a->memflags & MEMF_no_icache_flush )
         invalidate_icache();
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 10b7aeca48..765f8d8e78 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1060,7 +1060,7 @@ static struct page_info *alloc_heap_pages(
     }
 
     if ( need_tlbflush )
-        filtered_flush_tlb_mask(tlbflush_timestamp);
+        filtered_flush_tlb_mask(tlbflush_timestamp, true);
 
     return pg;
 }
diff --git a/xen/include/asm-arm/flushtlb.h b/xen/include/asm-arm/flushtlb.h
index ab1aae5c90..7ae0543885 100644
--- a/xen/include/asm-arm/flushtlb.h
+++ b/xen/include/asm-arm/flushtlb.h
@@ -27,6 +27,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
 
 /* Flush specified CPUs' TLBs */
 void flush_tlb_mask(const cpumask_t *mask);
+#define flush_tlb_mask_sync flush_tlb_mask
 
 /*
  * Flush a range of VA's hypervisor mappings from the TLB of the local
diff --git a/xen/include/asm-x86/flushtlb.h b/xen/include/asm-x86/flushtlb.h
index 8639427cce..3650a822ac 100644
--- a/xen/include/asm-x86/flushtlb.h
+++ b/xen/include/asm-x86/flushtlb.h
@@ -126,6 +126,12 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
 #else
 #define FLUSH_HVM_ASID_CORE 0
 #endif
+#if CONFIG_PV
+/* Force an IPI to be sent */
+# define FLUSH_FORCE_IPI 0x8000
+#else
+# define FLUSH_FORCE_IPI 0
+#endif
 
 /* Flush local TLBs/caches. */
 unsigned int flush_area_local(const void *va, unsigned int flags);
@@ -148,6 +154,14 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
 /* Flush specified CPUs' TLBs */
 #define flush_tlb_mask(mask)                    \
     flush_mask(mask, FLUSH_TLB)
+/*
+ * Flush specified CPUs' TLBs and force the usage of an IPI to do so. This is
+ * required for certain operations that rely on page tables themselves not
+ * being freed and reused when interrupts are blocked, as the flush IPI won't
+ * be fulfilled until exiting from that critical region.
+ */
+#define flush_tlb_mask_sync(mask)               \
+    flush_mask(mask, FLUSH_TLB | FLUSH_FORCE_IPI)
 #define flush_tlb_one_mask(mask,v)              \
     flush_area_mask(mask, (const void *)(v), FLUSH_TLB|FLUSH_ORDER(0))
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 9b62087be1..f360166f00 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -639,7 +639,8 @@ static inline void accumulate_tlbflush(bool *need_tlbflush,
     }
 }
 
-static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
+static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp,
+                                           bool sync)
 {
     cpumask_t mask;
 
@@ -648,7 +649,10 @@ static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
     if ( !cpumask_empty(&mask) )
     {
         perfc_incr(need_flush_tlb_flush);
-        flush_tlb_mask(&mask);
+        if ( sync )
+            flush_tlb_mask_sync(&mask);
+        else
+            flush_tlb_mask(&mask);
     }
 }
 
-- 
2.26.2


