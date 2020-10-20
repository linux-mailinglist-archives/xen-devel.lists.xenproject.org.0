Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F7293F85
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 17:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9696.25513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtV4-0000iw-62; Tue, 20 Oct 2020 15:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9696.25513; Tue, 20 Oct 2020 15:24:34 +0000
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
	id 1kUtV4-0000iZ-2f; Tue, 20 Oct 2020 15:24:34 +0000
Received: by outflank-mailman (input) for mailman id 9696;
 Tue, 20 Oct 2020 15:24:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF9C=D3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kUtV2-0000iT-BG
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:24:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28ede498-bd71-45bf-90ef-56d3858bae7d;
 Tue, 20 Oct 2020 15:24:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yF9C=D3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kUtV2-0000iT-BG
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:24:32 +0000
X-Inumbo-ID: 28ede498-bd71-45bf-90ef-56d3858bae7d
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 28ede498-bd71-45bf-90ef-56d3858bae7d;
	Tue, 20 Oct 2020 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603207471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=30VkK78JtXNGwhUSVQX7oNytWgBsewZox5IUkixUCTs=;
  b=e+o/x5VEfcI8ZhNJGLz9reDTh7IPk3EiSavfde2wz8ZN+Z6+fFSjyppu
   OKdp0zFWGE8iAYpQoo8WYjDfWvslQziiTVtsTj167dYvC6RvkGFUzkB+7
   JtzxxAYHVACPJzwABst5z5DDPmuCcp7ZNeLvwKprvc+orNjPG0iRQKh2B
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9Azn97UajB6MH1YkPTf0RwoEw/w5nb5V/YWz/UT3H5Db3EOmmI9yPVfzvDY+LWfdU5iuEM1sVe
 q6kXwROGKKpP6wxcAsdEIdtMBARiFJBXIhped5lg/e3LXTaDzE5jbpCzTA1+Bpd7ufdwzDB47s
 RSJ7mkB/l9GuU6oTgTvBfnr9EwA25VEiHoKruAn/fzPIPVNgd/TXSlKIty9/nPGhU6uUCSB1uu
 yfvMCAPGXnvyvr+JLjxFL50V4Huzxn9GQY857qCEz4DeeQglYSBNKKA3dJI/xfPV8kPmO16Hyl
 mno=
X-SBRS: None
X-MesageID: 29374181
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,397,1596513600"; 
   d="scan'208";a="29374181"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pv: Flush TLB in response to paging structure changes
Date: Tue, 20 Oct 2020 16:24:05 +0100
Message-ID: <20201020152405.26892-1-andrew.cooper3@citrix.com>
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

For all L2 and higher modifications, flush the full TLB.  (This could in
principle be an order 39 flush starting at LINEAR_PT_VIRT_START, but no such
mechanism exists in practice.)

As this combines with sync_guest for XPTI L4 "shadowing", replace the
sync_guest boolean with flush_flags and accumulate flags.  The sync_guest case
now always needs to flush, there is no point trying to exclude the current CPU
from the flush mask.  Use pt_owner->dirty_cpumask directly.

This is XSA-286.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

A couple of minor points.

 * PV guests can create global mappings.  I can't reason any safe way to relax
   FLUSH_TLB_GLOBAL to just FLUSH_TLB.

 * Performance tests are still ongoing, but so far is fairing better than the
   embargoed alternative.
---
 xen/arch/x86/mm.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 918ee2bbe3..a6a7fcb56c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3883,11 +3883,10 @@ long do_mmu_update(
     void *va = NULL;
     unsigned long gpfn, gmfn;
     struct page_info *page;
-    unsigned int cmd, i = 0, done = 0, pt_dom;
+    unsigned int cmd, i = 0, done = 0, pt_dom, flush_flags = 0;
     struct vcpu *curr = current, *v = curr;
     struct domain *d = v->domain, *pt_owner = d, *pg_owner;
     mfn_t map_mfn = INVALID_MFN, mfn;
-    bool sync_guest = false;
     uint32_t xsm_needed = 0;
     uint32_t xsm_checked = 0;
     int rc = put_old_guest_table(curr);
@@ -4037,6 +4036,8 @@ long do_mmu_update(
                         break;
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                    if ( !rc )
+                        flush_flags |= FLUSH_TLB_GLOBAL;
                     break;
 
                 case PGT_l3_page_table:
@@ -4044,6 +4045,8 @@ long do_mmu_update(
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                    if ( !rc )
+                        flush_flags |= FLUSH_TLB_GLOBAL;
                     break;
 
                 case PGT_l4_page_table:
@@ -4051,6 +4054,8 @@ long do_mmu_update(
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                    if ( !rc )
+                        flush_flags |= FLUSH_TLB_GLOBAL;
                     if ( !rc && pt_owner->arch.pv.xpti )
                     {
                         bool local_in_use = false;
@@ -4071,7 +4076,7 @@ long do_mmu_update(
                              (1 + !!(page->u.inuse.type_info & PGT_pinned) +
                               mfn_eq(pagetable_get_mfn(curr->arch.guest_table_user),
                                      mfn) + local_in_use) )
-                            sync_guest = true;
+                            flush_flags |= FLUSH_ROOT_PGTBL;
                     }
                     break;
 
@@ -4173,19 +4178,13 @@ long do_mmu_update(
     if ( va )
         unmap_domain_page(va);
 
-    if ( sync_guest )
-    {
-        /*
-         * Force other vCPU-s of the affected guest to pick up L4 entry
-         * changes (if any).
-         */
-        unsigned int cpu = smp_processor_id();
-        cpumask_t *mask = per_cpu(scratch_cpumask, cpu);
-
-        cpumask_andnot(mask, pt_owner->dirty_cpumask, cpumask_of(cpu));
-        if ( !cpumask_empty(mask) )
-            flush_mask(mask, FLUSH_TLB_GLOBAL | FLUSH_ROOT_PGTBL);
-    }
+    /*
+     * Flush TLBs if an L2 or higher was changed (invalidates the structure of
+     * the linear pagetables), or an L4 in use by other CPUs was made (needs
+     * to resync the XPTI copy of the table).
+     */
+    if ( flush_flags )
+        flush_mask(pt_owner->dirty_cpumask, flush_flags);
 
     perfc_add(num_page_updates, i);
 
-- 
2.11.0


