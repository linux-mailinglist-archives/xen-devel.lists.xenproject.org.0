Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C820B576
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 17:58:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joqjO-0000Jc-Lc; Fri, 26 Jun 2020 15:57:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q51=AH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1joqjM-0000JX-Ru
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 15:57:32 +0000
X-Inumbo-ID: bd824f0d-b7c5-11ea-82d9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd824f0d-b7c5-11ea-82d9-12813bfff9fa;
 Fri, 26 Jun 2020 15:57:31 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NbxHtEEkbYRjSxsaWR38jTk6lww7B8//41qY6kd6S13uNNPoQSX3fNmAf1/89F42zJJFzc++ED
 jV0Shb0Nwv/J0BC3mRIQwX74B1Uv3iRwPbuQ85+fXc5/GBDVyKfV8Q7LVHqgJ1viQllDrcWRDe
 pxYdZdDs7E/ILD7pRGeDkp6exf5XNXB0mPkNH7qw+Dq5sv8idPD3D4oviTjg8Jl6J1s1GsjhHJ
 6heInIqUhEEasv4N6w4RzqRFIRfncvxlOem0OervtZHx81KvL1v4k7Plb9YnEteXmxpWNFIvSd
 G8c=
X-SBRS: 2.7
X-MesageID: 21381968
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,284,1589256000"; d="scan'208";a="21381968"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v4] x86/tlb: fix assisted flush usage
Date: Fri, 26 Jun 2020 17:57:23 +0200
Message-ID: <20200626155723.91558-1-roger.pau@citrix.com>
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
can be used. Note the flush in grant-table code is also switched to
use an IPI even when not strictly needed. This is done so that a
common arch_flush_tlb_mask can be introduced and always used in common
code.

Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
using an IPI (flush_tlb_mask_sync, x86 only). Note that the flag is
only meaningfully defined when the hypervisor supports PV or shadow
paging mode, as otherwise hardware assisted paging domains are in
charge of their page tables and won't share page tables with Xen, thus
not influencing the result of page walks performed by the spurious
fault handler.

Just passing this new flag when calling flush_area_mask prevents the
usage of the assisted flush without any other side effects.

Note the flag is not defined on Arm.

Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Introduce arch_flush_tlb_mask.

Changes since v2:
 - Always do a physical IPI triggered flush in
   filtered_flush_tlb_mask, since it's always required by the current
   callers of the function.

Changes since v1:
 - Add a comment describing the usage of FLUSH_FORCE_IPI (and why no
   modifications to flush_area_mask are required).
 - Use PGT_root_page_table instead of PGT_l4_page_table.
 - Also perform IPI flushes if configured with shadow paging support.
 - Use ifdef instead of if.
---
 xen/arch/arm/smp.c             |  2 +-
 xen/arch/x86/mm.c              | 12 +++++++++++-
 xen/common/grant_table.c       |  2 +-
 xen/include/asm-arm/flushtlb.h |  2 +-
 xen/include/asm-x86/flushtlb.h | 25 +++++++++++++++++++++++++
 xen/include/xen/mm.h           |  2 +-
 6 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index ce1fcc8ef9..5823a69d3e 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -5,7 +5,7 @@
 #include <asm/gic.h>
 #include <asm/flushtlb.h>
 
-void flush_tlb_mask(const cpumask_t *mask)
+void arch_flush_tlb_mask(const cpumask_t *mask)
 {
     /* No need to IPI other processors on ARM, the processor takes care of it. */
     flush_all_guests_tlb();
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e376fc7e8f..a0568a9346 100644
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
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ece670e484..9f0cae52c0 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -393,7 +393,7 @@ static inline void grant_write_unlock(struct grant_table *gt)
 static inline void gnttab_flush_tlb(const struct domain *d)
 {
     if ( !paging_mode_external(d) )
-        flush_tlb_mask(d->dirty_cpumask);
+        arch_flush_tlb_mask(d->dirty_cpumask);
 }
 
 static inline unsigned int
diff --git a/xen/include/asm-arm/flushtlb.h b/xen/include/asm-arm/flushtlb.h
index ab1aae5c90..125a141975 100644
--- a/xen/include/asm-arm/flushtlb.h
+++ b/xen/include/asm-arm/flushtlb.h
@@ -26,7 +26,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
 #endif
 
 /* Flush specified CPUs' TLBs */
-void flush_tlb_mask(const cpumask_t *mask);
+void arch_flush_tlb_mask(const cpumask_t *mask);
 
 /*
  * Flush a range of VA's hypervisor mappings from the TLB of the local
diff --git a/xen/include/asm-x86/flushtlb.h b/xen/include/asm-x86/flushtlb.h
index 8639427cce..6a107470e5 100644
--- a/xen/include/asm-x86/flushtlb.h
+++ b/xen/include/asm-x86/flushtlb.h
@@ -126,6 +126,16 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
 #else
 #define FLUSH_HVM_ASID_CORE 0
 #endif
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
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
@@ -148,9 +158,24 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
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
 
+/*
+ * Alias the common code TLB flush helper to the sync one in order to be on the
+ * safe side. Note that not all calls from common code strictly require the
+ * _sync variant.
+ */
+#define arch_flush_tlb_mask flush_tlb_mask_sync
+
 /* Flush all CPUs' TLBs */
 #define flush_tlb_all()                         \
     flush_tlb_mask(&cpu_online_map)
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 9b62087be1..1061765bcd 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -648,7 +648,7 @@ static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
     if ( !cpumask_empty(&mask) )
     {
         perfc_incr(need_flush_tlb_flush);
-        flush_tlb_mask(&mask);
+        arch_flush_tlb_mask(&mask);
     }
 }
 
-- 
2.26.2


