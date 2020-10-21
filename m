Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC88294D38
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 15:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10077.26559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVDpv-00056q-P1; Wed, 21 Oct 2020 13:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10077.26559; Wed, 21 Oct 2020 13:07:27 +0000
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
	id 1kVDpv-00056R-Ll; Wed, 21 Oct 2020 13:07:27 +0000
Received: by outflank-mailman (input) for mailman id 10077;
 Wed, 21 Oct 2020 13:07:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kVDpu-00056M-Ok
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 13:07:26 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aebc959f-3077-4a61-8964-2c036dc670c6;
 Wed, 21 Oct 2020 13:07:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kVDpu-00056M-Ok
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 13:07:26 +0000
X-Inumbo-ID: aebc959f-3077-4a61-8964-2c036dc670c6
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aebc959f-3077-4a61-8964-2c036dc670c6;
	Wed, 21 Oct 2020 13:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603285645;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ClnLEGNUPj+vWOEdbAhPiu3vVyLMnxIDNxKGoCjlfbk=;
  b=LLL5yGPthG6e8IeidMRCp7Innmm0SGzrg4+ZWD1ARqirX69uB4xCA3M2
   Q4JmvAmxylZk1YX6yHl3vefte7LLgmGVKO34NUlxbwFRrUv0IUmXbu32U
   NVx9y5Ewdwkm1ttqNpNE+qnFWAR0JfoAyRRXffarP4mtC+oRjw40JkEFp
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QzQyDFug2bnDXNed5yYiXo+hSko/zYmU8QQ2+xRD9bJ0g7yu6l7W1VzEcalKqPv3t+mat6uoQl
 bAoB+L4QBLt0rFPJTY3oYhL9DylF0ab4g3tKffZDd6XH5p6HJybUD3u/5Gxjfz/hDvuoLPfzTd
 rVAYeESMVoxulph7lOXVN6VYo1fsXrQoy6aspq2zNrTELMbMTLujkr0XoBpHv4EGG4FJZZNAau
 8VLiMYevf1MZpEVD3oArMdy2qO4fKLyJR+yoYBAmu+RpmRUKWIXGjmeJX7cKzk/vKkbJAiRHfX
 t3Q=
X-SBRS: 2.5
X-MesageID: 30534304
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="30534304"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pv: Flush TLB in response to paging structure changes
Date: Wed, 21 Oct 2020 14:07:08 +0100
Message-ID: <20201021130708.12249-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With MMU_UPDATE, a PV guest can make changes to higher level pagetables.  This
is from Xen's point of view (as the update only affects guest mappings), and
the guest is required to flush suitably after making updates.

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

This combines with sync_guest for XPTI L4 "shadowing", but has some asymmetry
between local and remote flush requirements.  Replace the sync_guest boolean
with flush_flags_{local,all} and accumulate flags, performing all required
flushing at the end.

This is XSA-286.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Use two separate flush flags.
 * Use non-global flushes.
---
 xen/arch/x86/mm.c | 61 +++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 918ee2bbe3..87860c2ca3 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3887,7 +3887,7 @@ long do_mmu_update(
     struct vcpu *curr = current, *v = curr;
     struct domain *d = v->domain, *pt_owner = d, *pg_owner;
     mfn_t map_mfn = INVALID_MFN, mfn;
-    bool sync_guest = false;
+    unsigned int flush_flags_local = 0, flush_flags_all = 0;
     uint32_t xsm_needed = 0;
     uint32_t xsm_checked = 0;
     int rc = put_old_guest_table(curr);
@@ -4037,6 +4037,9 @@ long do_mmu_update(
                         break;
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                    /* Paging structure maybe changed.  Flush linear range. */
+                    if ( !rc )
+                        flush_flags_all |= FLUSH_TLB;
                     break;
 
                 case PGT_l3_page_table:
@@ -4044,6 +4047,9 @@ long do_mmu_update(
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                    /* Paging structure maybe changed.  Flush linear range. */
+                    if ( !rc )
+                        flush_flags_all |= FLUSH_TLB;
                     break;
 
                 case PGT_l4_page_table:
@@ -4051,27 +4057,28 @@ long do_mmu_update(
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
-                    if ( !rc && pt_owner->arch.pv.xpti )
+                    /* Paging structure maybe changed.  Flush linear range. */
+                    if ( !rc )
                     {
-                        bool local_in_use = false;
+                        bool local_in_use = mfn_eq(
+                            pagetable_get_mfn(curr->arch.guest_table), mfn);
 
-                        if ( mfn_eq(pagetable_get_mfn(curr->arch.guest_table),
-                                    mfn) )
-                        {
-                            local_in_use = true;
-                            get_cpu_info()->root_pgt_changed = true;
-                        }
+                        flush_flags_all |= FLUSH_TLB;
+
+                        if ( local_in_use )
+                            flush_flags_local |= FLUSH_TLB | FLUSH_ROOT_PGTBL;
 
                         /*
                          * No need to sync if all uses of the page can be
                          * accounted to the page lock we hold, its pinned
                          * status, and uses on this (v)CPU.
                          */
-                        if ( (page->u.inuse.type_info & PGT_count_mask) >
+                        if ( pt_owner->arch.pv.xpti &&
+                             (page->u.inuse.type_info & PGT_count_mask) >
                              (1 + !!(page->u.inuse.type_info & PGT_pinned) +
                               mfn_eq(pagetable_get_mfn(curr->arch.guest_table_user),
                                      mfn) + local_in_use) )
-                            sync_guest = true;
+                            flush_flags_all |= FLUSH_ROOT_PGTBL;
                     }
                     break;
 
@@ -4173,18 +4180,36 @@ long do_mmu_update(
     if ( va )
         unmap_domain_page(va);
 
-    if ( sync_guest )
+    /*
+     * Flushing needs to occur for one of several reasons.
+     *
+     * 1) An update to an L2 or higher occured.  This potentially changes the
+     *    pagetable structure, requiring a flush of the linear range.
+     * 2) An update to an L4 occured, and XPTI is enabled.  All CPUs running
+     *    on a copy of this L4 need refreshing.
+     */
+    if ( flush_flags_all || flush_flags_local )
     {
+        cpumask_t *mask = pt_owner->dirty_cpumask;
+
         /*
-         * Force other vCPU-s of the affected guest to pick up L4 entry
-         * changes (if any).
+         * Local flushing may be asymmetric with remote.  If there is local
+         * flushing to do, perform it separately and omit the current CPU from
+         * pt_owner->dirty_cpumask.
          */
-        unsigned int cpu = smp_processor_id();
-        cpumask_t *mask = per_cpu(scratch_cpumask, cpu);
+        if ( flush_flags_local )
+        {
+            unsigned int cpu = smp_processor_id();
+
+            mask = per_cpu(scratch_cpumask, cpu);
+            cpumask_copy(mask, pt_owner->dirty_cpumask);
+            __cpumask_clear_cpu(cpu, mask);
+
+            flush_local(flush_flags_local);
+        }
 
-        cpumask_andnot(mask, pt_owner->dirty_cpumask, cpumask_of(cpu));
         if ( !cpumask_empty(mask) )
-            flush_mask(mask, FLUSH_TLB_GLOBAL | FLUSH_ROOT_PGTBL);
+            flush_mask(mask, flush_flags_all);
     }
 
     perfc_add(num_page_updates, i);
-- 
2.11.0


