Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F8D1AC487
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 16:01:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP544-00059X-Iw; Thu, 16 Apr 2020 14:00:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8YfG=6A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jP543-00059P-Cw
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 14:00:23 +0000
X-Inumbo-ID: 9c73f7c4-7fea-11ea-8b99-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c73f7c4-7fea-11ea-8b99-12813bfff9fa;
 Thu, 16 Apr 2020 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587045621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DB5AJyccZDlAh+2LWwWKF7DT4f6pew9ftCx0h5I2CK8=;
 b=Xs8tFdpPHJ0WUxysjg1geYzTekUfprRYLfSkH3x/OGQY/fDc2KiHBYbI
 VWP5VuL6F5aM1LGXRN88kYwaKk3PX8A5g3NWPwuagN63a8MNRVpxeECZs
 32l1F4qtrSxO3jmgfIzzjGU2ADqox8E683pz6Ws4tSHxsRodu4NZEMk5G E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Hzylxg3N6Xk+QwNFfoLsMUKoV2ARTOgd9/mINNWWdgZ9WxsFaEBIH8eVSphwW7B2YqFrg38BO0
 cW4jcLD9Yxs9mDTzJuAGSeqdL0Iu6v3iPhbK26mWcNI7gocRCshPVFemBYPUtKjqemEVU8eXW2
 yXeRuMfoh9cVgOVf5K2PvfGXOjgCT1RyrR01JouGRnrv055Z3R/yarn7QUGTxMihdIEHVb9Ygd
 kAdb4k2QBwc9Os9esRCDthV94LX5DPer1aGnyexJlDBASeK9njEeUo/R2W+StHalqVsDtENybc
 9hQ=
X-SBRS: 2.7
X-MesageID: 15796806
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="15796806"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Date: Thu, 16 Apr 2020 15:59:07 +0200
Message-ID: <20200416135909.16155-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416135909.16155-1-roger.pau@citrix.com>
References: <20200416135909.16155-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Introduce a specific flag to request a HVM guest linear TLB flush,
which is an ASID/VPID tickle that forces a guest linear to guest
physical TLB flush for all HVM guests.

This was previously unconditionally done in each pre_flush call, but
that's not required: HVM guests not using shadow don't require linear
TLB flushes as Xen doesn't modify the guest page tables in that case
(ie: when using HAP). Note that shadow paging code already takes care
of issuing the necessary flushes when the shadow page tables are
modified.

In order to keep the previous behavior modify all shadow code TLB
flushes to also flush the guest linear to physical TLB if the guest is
HVM. I haven't looked at each specific shadow code TLB flush in order
to figure out whether it actually requires a guest TLB flush or not,
so there might be room for improvement in that regard.

Also perform ASID/VPID flushes when modifying the p2m tables as it's a
requirement for AMD hardware. Finally keep the flush in
switch_cr3_cr4, as it's not clear whether code could rely on
switch_cr3_cr4 also performing a guest linear TLB flush. A following
patch can remove the ASID/VPID tickle from switch_cr3_cr4 if found to
not be necessary.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v9:
 - Introduce and use guest_flush_tlb_mask and sh_flush_local.
 - Add a local domain variable to p2m_pt_change_entry_type_global.

Changes since v8:
 - Don't flush host TLB on HAP changes.
 - Introduce a helper for shadow changes that only flushes ASIDs/VPIDs
   when the guest is HVM.
 - Introduce a helper for HAP that only flushes ASIDs/VPIDs.

Changes since v7:
 - Do not perform an ASID flush in filtered_flush_tlb_mask: the
   requested flush is related to the page need_tlbflush field and not
   to p2m changes (applies to both callers).

Changes since v6:
 - Add ASID/VPID flushes when modifying the p2m.
 - Keep the ASID/VPID flush in switch_cr3_cr4.

Changes since v5:
 - Rename FLUSH_GUESTS_TLB to FLUSH_HVM_ASID_CORE.
 - Clarify commit message.
 - Define FLUSH_HVM_ASID_CORE to 0 when !CONFIG_HVM.
---
 xen/arch/x86/flushtlb.c          | 18 ++++++++++++++++--
 xen/arch/x86/mm/hap/hap.c        |  8 ++++----
 xen/arch/x86/mm/hap/nested_hap.c |  2 +-
 xen/arch/x86/mm/p2m-pt.c         |  5 +++--
 xen/arch/x86/mm/paging.c         |  2 +-
 xen/arch/x86/mm/shadow/common.c  | 18 +++++++++---------
 xen/arch/x86/mm/shadow/hvm.c     |  2 +-
 xen/arch/x86/mm/shadow/multi.c   | 16 ++++++++--------
 xen/arch/x86/mm/shadow/private.h |  6 ++++++
 xen/include/asm-x86/flushtlb.h   |  8 ++++++++
 10 files changed, 57 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 03f92c23dc..7d261aef32 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2003-2006, K A Fraser
  */
 
+#include <xen/paging.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
@@ -59,8 +60,6 @@ static u32 pre_flush(void)
         raise_softirq(NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ);
 
  skip_clocktick:
-    hvm_flush_guest_tlbs();
-
     return t2;
 }
 
@@ -118,6 +117,7 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4)
     local_irq_save(flags);
 
     t = pre_flush();
+    hvm_flush_guest_tlbs();
 
     old_cr4 = read_cr4();
     ASSERT(!(old_cr4 & X86_CR4_PCIDE) || !(old_cr4 & X86_CR4_PGE));
@@ -221,6 +221,9 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
             do_tlb_flush();
     }
 
+    if ( flags & FLUSH_HVM_ASID_CORE )
+        hvm_flush_guest_tlbs();
+
     if ( flags & FLUSH_CACHE )
     {
         const struct cpuinfo_x86 *c = &current_cpu_data;
@@ -254,3 +257,14 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
 
     return flags;
 }
+
+void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
+{
+    unsigned int flags = (is_pv_domain(d) || paging_mode_shadow(d) ? FLUSH_TLB
+                                                                   : 0) |
+                         (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
+                                                          : 0);
+
+    if ( flags )
+        flush_mask(mask, flags);
+}
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 052ae35c6f..f7218a86d6 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
             p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
                                   p2m_ram_rw, p2m_ram_logdirty);
 
-            flush_tlb_mask(d->dirty_cpumask);
+            guest_flush_tlb_mask(d, d->dirty_cpumask);
 
             memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
         }
@@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
          * to be read-only, or via hardware-assisted log-dirty.
          */
         p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
     }
     return 0;
 }
@@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
      * be read-only, or via hardware-assisted log-dirty.
      */
     p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
-    flush_tlb_mask(d->dirty_cpumask);
+    guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 /************************************************/
@@ -812,7 +812,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
 
     safe_write_pte(p, new);
     if ( old_flags & _PAGE_PRESENT )
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
 
     paging_unlock(d);
 
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index abe5958a52..f92ddc5206 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -84,7 +84,7 @@ nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
     safe_write_pte(p, new);
 
     if (old_flags & _PAGE_PRESENT)
-        flush_tlb_mask(p2m->dirty_cpumask);
+        guest_flush_tlb_mask(d, p2m->dirty_cpumask);
 
     paging_unlock(d);
 
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index eb66077496..5c0501794e 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -866,11 +866,12 @@ static void p2m_pt_change_entry_type_global(struct p2m_domain *p2m,
     l1_pgentry_t *tab;
     unsigned long gfn = 0;
     unsigned int i, changed;
+    const struct domain *d = p2m->domain;
 
     if ( pagetable_get_pfn(p2m_get_pagetable(p2m)) == 0 )
         return;
 
-    ASSERT(hap_enabled(p2m->domain));
+    ASSERT(hap_enabled(d));
 
     tab = map_domain_page(pagetable_get_mfn(p2m_get_pagetable(p2m)));
     for ( changed = i = 0; i < (1 << PAGETABLE_ORDER); ++i )
@@ -896,7 +897,7 @@ static void p2m_pt_change_entry_type_global(struct p2m_domain *p2m,
     unmap_domain_page(tab);
 
     if ( changed )
-         flush_tlb_mask(p2m->domain->dirty_cpumask);
+         guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 static int p2m_pt_change_entry_type_range(struct p2m_domain *p2m,
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 469bb76429..fd3175bd3e 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -613,7 +613,7 @@ void paging_log_dirty_range(struct domain *d,
 
     p2m_unlock(p2m);
 
-    flush_tlb_mask(d->dirty_cpumask);
+    guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 /*
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 75dd414a6e..f8168b210a 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -363,7 +363,7 @@ static int oos_remove_write_access(struct vcpu *v, mfn_t gmfn,
     }
 
     if ( ftlb )
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
 
     return 0;
 }
@@ -939,7 +939,7 @@ static void _shadow_prealloc(struct domain *d, unsigned int pages)
                 /* See if that freed up enough space */
                 if ( d->arch.paging.shadow.free_pages >= pages )
                 {
-                    flush_tlb_mask(d->dirty_cpumask);
+                    guest_flush_tlb_mask(d, d->dirty_cpumask);
                     return;
                 }
             }
@@ -993,7 +993,7 @@ static void shadow_blow_tables(struct domain *d)
                                pagetable_get_mfn(v->arch.shadow_table[i]), 0);
 
     /* Make sure everyone sees the unshadowings */
-    flush_tlb_mask(d->dirty_cpumask);
+    guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 void shadow_blow_tables_per_domain(struct domain *d)
@@ -1102,7 +1102,7 @@ mfn_t shadow_alloc(struct domain *d,
         if ( unlikely(!cpumask_empty(&mask)) )
         {
             perfc_incr(shadow_alloc_tlbflush);
-            flush_tlb_mask(&mask);
+            guest_flush_tlb_mask(d, &mask);
         }
         /* Now safe to clear the page for reuse */
         clear_domain_page(page_to_mfn(sp));
@@ -2293,7 +2293,7 @@ void sh_remove_shadows(struct domain *d, mfn_t gmfn, int fast, int all)
 
     /* Need to flush TLBs now, so that linear maps are safe next time we
      * take a fault. */
-    flush_tlb_mask(d->dirty_cpumask);
+    guest_flush_tlb_mask(d, d->dirty_cpumask);
 
     paging_unlock(d);
 }
@@ -3008,7 +3008,7 @@ static void sh_unshadow_for_p2m_change(struct domain *d, unsigned long gfn,
         {
             sh_remove_all_shadows_and_parents(d, mfn);
             if ( sh_remove_all_mappings(d, mfn, _gfn(gfn)) )
-                flush_tlb_mask(d->dirty_cpumask);
+                guest_flush_tlb_mask(d, d->dirty_cpumask);
         }
     }
 
@@ -3048,7 +3048,7 @@ static void sh_unshadow_for_p2m_change(struct domain *d, unsigned long gfn,
                 }
                 omfn = mfn_add(omfn, 1);
             }
-            flush_tlb_mask(&flushmask);
+            guest_flush_tlb_mask(d, &flushmask);
 
             if ( npte )
                 unmap_domain_page(npte);
@@ -3335,7 +3335,7 @@ int shadow_track_dirty_vram(struct domain *d,
         }
     }
     if ( flush_tlb )
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
     goto out;
 
 out_sl1ma:
@@ -3405,7 +3405,7 @@ bool shadow_flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
     }
 
     /* Flush TLBs on all CPUs with dirty vcpu state. */
-    flush_tlb_mask(mask);
+    guest_flush_tlb_mask(d, mask);
 
     /* Done. */
     for_each_vcpu ( d, v )
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 1e6024c71f..608360daec 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -591,7 +591,7 @@ static void validate_guest_pt_write(struct vcpu *v, mfn_t gmfn,
 
     if ( rc & SHADOW_SET_FLUSH )
         /* Need to flush TLBs to pick up shadow PT changes */
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
 
     if ( rc & SHADOW_SET_ERROR )
     {
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index f6b1628742..d3f6a9216f 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3067,7 +3067,7 @@ static int sh_page_fault(struct vcpu *v,
         perfc_incr(shadow_rm_write_flush_tlb);
         smp_wmb();
         atomic_inc(&d->arch.paging.shadow.gtable_dirty_version);
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
     }
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
@@ -3576,7 +3576,7 @@ static bool sh_invlpg(struct vcpu *v, unsigned long linear)
     if ( mfn_to_page(sl1mfn)->u.sh.type
          == SH_type_fl1_shadow )
     {
-        flush_tlb_local();
+        sh_flush_local(v->domain);
         return false;
     }
 
@@ -3811,7 +3811,7 @@ sh_update_linear_entries(struct vcpu *v)
          * table entry. But, without this change, it would fetch the wrong
          * value due to a stale TLB.
          */
-        flush_tlb_local();
+        sh_flush_local(d);
     }
 }
 
@@ -4012,7 +4012,7 @@ sh_update_cr3(struct vcpu *v, int do_locking, bool noflush)
      * (old) shadow linear maps in the writeable mapping heuristics. */
 #if GUEST_PAGING_LEVELS == 2
     if ( sh_remove_write_access(d, gmfn, 2, 0) != 0 )
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
     sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l2_shadow);
 #elif GUEST_PAGING_LEVELS == 3
     /* PAE guests have four shadow_table entries, based on the
@@ -4036,7 +4036,7 @@ sh_update_cr3(struct vcpu *v, int do_locking, bool noflush)
             }
         }
         if ( flush )
-            flush_tlb_mask(d->dirty_cpumask);
+            guest_flush_tlb_mask(d, d->dirty_cpumask);
         /* Now install the new shadows. */
         for ( i = 0; i < 4; i++ )
         {
@@ -4057,7 +4057,7 @@ sh_update_cr3(struct vcpu *v, int do_locking, bool noflush)
     }
 #elif GUEST_PAGING_LEVELS == 4
     if ( sh_remove_write_access(d, gmfn, 4, 0) != 0 )
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
     sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l4_shadow);
     if ( !shadow_mode_external(d) && !is_pv_32bit_domain(d) )
     {
@@ -4503,7 +4503,7 @@ static void sh_pagetable_dying(paddr_t gpa)
         }
     }
     if ( flush )
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
 
     /* Remember that we've seen the guest use this interface, so we
      * can rely on it using it in future, instead of guessing at
@@ -4540,7 +4540,7 @@ static void sh_pagetable_dying(paddr_t gpa)
         mfn_to_page(gmfn)->pagetable_dying = true;
         shadow_unhook_mappings(d, smfn, 1/* user pages only */);
         /* Now flush the TLB: we removed toplevel mappings. */
-        flush_tlb_mask(d->dirty_cpumask);
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
     }
 
     /* Remember that we've seen the guest use this interface, so we
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index e8b028a365..82735e35ef 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -818,6 +818,12 @@ static inline int sh_check_page_has_no_refs(struct page_info *page)
 bool shadow_flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
                       void *ctxt);
 
+static inline void sh_flush_local(const struct domain *d)
+{
+    flush_local(FLUSH_TLB |
+                (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE : 0));
+}
+
 #endif /* _XEN_SHADOW_PRIVATE_H */
 
 /*
diff --git a/xen/include/asm-x86/flushtlb.h b/xen/include/asm-x86/flushtlb.h
index 2cfe4e6e97..50df468c16 100644
--- a/xen/include/asm-x86/flushtlb.h
+++ b/xen/include/asm-x86/flushtlb.h
@@ -105,6 +105,12 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
 #define FLUSH_VCPU_STATE 0x1000
  /* Flush the per-cpu root page table */
 #define FLUSH_ROOT_PGTBL 0x2000
+#if CONFIG_HVM
+ /* Flush all HVM guests linear TLB (using ASID/VPID) */
+#define FLUSH_HVM_ASID_CORE 0x4000
+#else
+#define FLUSH_HVM_ASID_CORE 0
+#endif
 
 /* Flush local TLBs/caches. */
 unsigned int flush_area_local(const void *va, unsigned int flags);
@@ -159,4 +165,6 @@ static inline int clean_dcache_va_range(const void *p, unsigned long size)
     return clean_and_invalidate_dcache_va_range(p, size);
 }
 
+void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
+
 #endif /* __FLUSHTLB_H__ */
-- 
2.26.0


