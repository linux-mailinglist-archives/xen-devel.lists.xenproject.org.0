Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE7205520
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 16:51:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnkFv-00034U-2z; Tue, 23 Jun 2020 14:50:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClC/=AE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnkFt-00034P-OS
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 14:50:33 +0000
X-Inumbo-ID: e33c3cb0-b560-11ea-bf95-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e33c3cb0-b560-11ea-bf95-12813bfff9fa;
 Tue, 23 Jun 2020 14:50:32 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bcwLMcIj6TTlOhEnThpALzlm3WOZdDze10nc2384Hgqok2UEZwv32IVJtZC+TCDLG5ZTQh4NQ8
 /lDGD342TMpTJ2oxVQW1qP6V11ISGLjjffJUgwx1FLQLvEzLbzl2Ww9Vhy+mKjshSCKonU+qel
 fQxye3MOtbK8+HNFUf+fjT+LaZ6PWH0lN1IuqAd8F4b1sbO5E+5M/MmZ3A7XLP9DXiLtxS8O8n
 irsvs+Yscc+dJ8f3xudRLK8UTuccLOHapOEtKjphHKmSQ4yRmjUmqjes5InjZp+tPy8HwC/llM
 ge4=
X-SBRS: 2.7
X-MesageID: 21525805
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="21525805"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v2] x86/tlb: fix assisted flush usage
Date: Tue, 23 Jun 2020 16:50:06 +0200
Message-ID: <20200623145006.66723-1-roger.pau@citrix.com>
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
meaningfully defined when the hypervisor supports PV or shadow paging
mode, as otherwise hardware assisted paging domains are in charge of
their page tables and won't share page tables with Xen, thus not
influencing the result of page walks performed by the spurious fault
handler.

Just passing this new flag when calling flush_area_mask prevents the
usage of the assisted flush without any other side effects.

Note the flag is not defined on Arm, and the introduced helper is just
a dummy alias to the existing flush_tlb_mask.

Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add a comment describing the usage of FLUSH_FORCE_IPI (and why no
   modifications to flush_area_mask are required).
 - Use PGT_root_page_table instead of PGT_l4_page_table.
 - Also perform IPI flushes if configured with shadow paging support.
 - Use ifdef instead of if.
---
 xen/arch/x86/mm.c              | 12 +++++++++++-
 xen/common/memory.c            |  2 +-
 xen/common/page_alloc.c        |  2 +-
 xen/include/asm-arm/flushtlb.h |  1 +
 xen/include/asm-x86/flushtlb.h | 18 ++++++++++++++++++
 xen/include/xen/mm.h           |  8 ++++++--
 6 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c294092f93..47872dccd0 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2894,7 +2894,17 @@ static int _get_page_type(struct page_info *page, unsigned long type,
                       ((nx & PGT_type_mask) == PGT_writable_page)) )
                 {
                     perfc_incr(need_flush_tlb_flush);
-                    flush_tlb_mask(mask);
+                    if ( (x & PGT_type_mask) &&
+                         (x & PGT_type_mask) <= PGT_root_page_table )
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
index 8639427cce..9e12844111 100644
--- a/xen/include/asm-x86/flushtlb.h
+++ b/xen/include/asm-x86/flushtlb.h
@@ -126,6 +126,16 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
 #else
 #define FLUSH_HVM_ASID_CORE 0
 #endif
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
+/*
+ * Force an IPI to be sent. Note that adding this to the flags passed to
+ * flush_area_mask will prevent using the assisted flush without having any
+ * other side effect.
+ */
+# define FLUSH_FORCE_IPI 0x8000
+#else
+# define FLUSH_FORCE_IPI 0
+#endif
 
 /* Flush local TLBs/caches. */
 unsigned int flush_area_local(const void *va, unsigned int flags);
@@ -148,6 +158,14 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
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


