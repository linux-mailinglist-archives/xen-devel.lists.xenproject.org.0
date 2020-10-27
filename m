Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F211029AF57
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 15:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12894.33358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPhE-00055Z-Qu; Tue, 27 Oct 2020 14:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12894.33358; Tue, 27 Oct 2020 14:11:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPhE-000551-N8; Tue, 27 Oct 2020 14:11:32 +0000
Received: by outflank-mailman (input) for mailman id 12894;
 Tue, 27 Oct 2020 14:11:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kXPhD-00053N-In
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:11:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24476384-a21d-491e-94b1-b4ca6fb47bf9;
 Tue, 27 Oct 2020 14:11:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kXPhD-00053N-In
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:11:31 +0000
X-Inumbo-ID: 24476384-a21d-491e-94b1-b4ca6fb47bf9
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 24476384-a21d-491e-94b1-b4ca6fb47bf9;
	Tue, 27 Oct 2020 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603807886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=569KM2uHTxkxXUk0wQS7+jSoZw4XOaNwLw4aKbluc9Q=;
  b=foyHneP8l7UvBClRox4rU4K7L0y+JXEHa+93fhIGjUYKW8zQb8D4TzKD
   hxFzE8KoWW4/wmu4Kti34uakVq+gWULmjVLnBlv4bqH4l844vcC2PSmUG
   my6n2axE4aMQwe32eUTeO+jD2USuSNObDgYbKMlVsRGMcv2udzyRXSF1M
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Y8PQGjjVLkgnsWJYE/hJLFKUz4ieiFNndYKnktFXYdCh6bRgaJtQzJtkmKMvO0dhyzd9F5++Kj
 Xjg2q7CoLK1lfPfo9gpuS/Osx0/q3Knt1GnyIBMRGs5Jq5qQs+iR8TfZtzaQ4wruwbM8DBC3Z0
 8rzv98DFLeo2g8ylDqPH3kR5cFpsQ1Q5NSkjSguGYvT3YGm0ZfAZoGj1SJ4u1mk2h5scMM5Ris
 5n/rw3FFC7rqAc+2FzP9BYs9a/062a2NAeIcH8Y0j4e0ZUQi1vzxM+AROOPwoaFHsCdaPgQOf6
 s74=
X-SBRS: None
X-MesageID: 30949886
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,424,1596513600"; 
   d="scan'208";a="30949886"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] x86/pv: Flush TLB in response to paging structure changes
Date: Tue, 27 Oct 2020 14:10:37 +0000
Message-ID: <20201027141037.27357-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201027141037.27357-1-andrew.cooper3@citrix.com>
References: <20201027141037.27357-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With MMU_UPDATE, a PV guest can make changes to higher level pagetables.  This
is safe from Xen's point of view (as the update only affects guest mappings),
and the guest is required to flush (if necessary) after making updates.

However, Xen's use of linear pagetables (UPDATE_VA_MAPPING, GNTTABOP_map,
writeable pagetables, etc.) is an implementation detail outside of the
API/ABI.

Changes in the paging structure require invalidations in the linear pagetable
range for subsequent accesses into the linear pagetables to access non-stale
mappings.  Xen must provide suitable flushing to prevent intermixed guest
actions from accidentally accessing/modifying the wrong pagetable.

For all L2 and higher modifications, flush the TLB.  PV guests cannot create
L2 or higher entries with the Global bit set, so no mappings established in
the linear range can be global.  (This could in principle be an order 39 flush
starting at LINEAR_PT_VIRT_START, but no such mechanism exists in practice.)

Express the necessary flushes as a set of booleans which accumulate across the
operation.  Comment the flushing logic extensively.

This is XSA-286

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * Rework from scratch vs v2.
---
 xen/arch/x86/mm.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 38168189aa..a3704ef648 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3891,7 +3891,8 @@ long do_mmu_update(
     struct vcpu *curr = current, *v = curr;
     struct domain *d = v->domain, *pt_owner = d, *pg_owner;
     mfn_t map_mfn = INVALID_MFN, mfn;
-    bool sync_guest = false;
+    bool flush_linear_pt = false, flush_root_pt_local = false,
+        flush_root_pt_others = false;
     uint32_t xsm_needed = 0;
     uint32_t xsm_checked = 0;
     int rc = put_old_guest_table(curr);
@@ -4041,6 +4042,8 @@ long do_mmu_update(
                         break;
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                    if ( !rc )
+                        flush_linear_pt = true;
                     break;
 
                 case PGT_l3_page_table:
@@ -4048,6 +4051,8 @@ long do_mmu_update(
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                    if ( !rc )
+                        flush_linear_pt = true;
                     break;
 
                 case PGT_l4_page_table:
@@ -4055,6 +4060,8 @@ long do_mmu_update(
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                    if ( !rc )
+                        flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
                     {
                         bool local_in_use = false;
@@ -4063,7 +4070,7 @@ long do_mmu_update(
                                     mfn) )
                         {
                             local_in_use = true;
-                            get_cpu_info()->root_pgt_changed = true;
+                            flush_root_pt_local = true;
                         }
 
                         /*
@@ -4075,7 +4082,7 @@ long do_mmu_update(
                              (1 + !!(page->u.inuse.type_info & PGT_pinned) +
                               mfn_eq(pagetable_get_mfn(curr->arch.guest_table_user),
                                      mfn) + local_in_use) )
-                            sync_guest = true;
+                            flush_root_pt_others = true;
                     }
                     break;
 
@@ -4177,19 +4184,61 @@ long do_mmu_update(
     if ( va )
         unmap_domain_page(va);
 
-    if ( sync_guest )
+    /*
+     * Perform required TLB maintenance.
+     *
+     * This logic currently depend on flush_linear_pt being a superset of the
+     * flush_root_pt_* conditions.
+     *
+     * pt_owner may not be current->domain.  This may occur during
+     * construction of 32bit PV guests, or debugging of PV guests.  The
+     * behaviour cannot be correct with domain unpaused.  We therefore expect
+     * pt_owner->dirty_cpumask to be empty, but it is a waste of effort to
+     * explicitly check for an exclude this corner case.
+     *
+     * flush_linear_pt requires a FLUSH_TLB to all dirty CPUs.  The flush must
+     * be performed now to maintain correct behaviour across a multicall.
+     * i.e. we cannot relax FLUSH_TLB to FLUSH_ROOT_PGTBL, given that the
+     * former is a side effect of the latter, because the resync (which is in
+     * the return-to-guest path) happens too late.
+     *
+     * flush_root_pt_* requires FLUSH_ROOT_PGTBL on either the local CPU
+     * (implies pt_owner == current->domain and current->processor set in
+     * pt_owner->dirty_cpumask), and/or all *other* dirty CPUs as there are
+     * references we can't account for locally.
+     */
+    if ( flush_linear_pt /* || flush_root_pt_local || flush_root_pt_others */ )
     {
+        unsigned int cpu = smp_processor_id();
+        cpumask_t *mask = pt_owner->dirty_cpumask;
+
         /*
-         * Force other vCPU-s of the affected guest to pick up L4 entry
-         * changes (if any).
+         * Always handle local flushing separately (if applicable), to
+         * separate the flush invocations appropriately for scope of the two
+         * flush_root_pt_* variables.
          */
-        unsigned int cpu = smp_processor_id();
-        cpumask_t *mask = per_cpu(scratch_cpumask, cpu);
+        if ( likely(cpumask_test_cpu(cpu, mask)) )
+        {
+            mask = per_cpu(scratch_cpumask, cpu);
 
-        cpumask_andnot(mask, pt_owner->dirty_cpumask, cpumask_of(cpu));
+            cpumask_copy(mask, pt_owner->dirty_cpumask);
+            __cpumask_clear_cpu(cpu, mask);
+
+            flush_local(FLUSH_TLB |
+                        (flush_root_pt_local ? FLUSH_ROOT_PGTBL : 0));
+        }
+        else
+            /* Sanity check.  flush_root_pt_local implies local cpu is dirty. */
+            ASSERT(!flush_root_pt_local);
+
+        /* Flush the remote dirty CPUs.  Does not include the local CPU. */
         if ( !cpumask_empty(mask) )
-            flush_mask(mask, FLUSH_ROOT_PGTBL);
+            flush_mask(mask, FLUSH_TLB |
+                       (flush_root_pt_others ? FLUSH_ROOT_PGTBL : 0));
     }
+    else
+        /* Sanity check.  flush_root_pt_* implies flush_linear_pt. */
+        ASSERT(!flush_root_pt_local && !flush_root_pt_others);
 
     perfc_add(num_page_updates, i);
 
-- 
2.11.0


