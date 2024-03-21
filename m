Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C0D885792
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696304.1087157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrU-0003ZT-1L; Thu, 21 Mar 2024 10:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696304.1087157; Thu, 21 Mar 2024 10:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrT-0003Wm-SA; Thu, 21 Mar 2024 10:41:27 +0000
Received: by outflank-mailman (input) for mailman id 696304;
 Thu, 21 Mar 2024 10:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u/it=K3=bounce.vates.tech=bounce-md_30504962.65fc0bca.v1-b011fbae99164ddc94c4654e4770f1fb@srs-se1.protection.inumbo.net>)
 id 1rnFew-0007v6-ND
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:28:30 +0000
Received: from mail135-12.atl141.mandrillapp.com
 (mail135-12.atl141.mandrillapp.com [198.2.135.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1b71590-e76d-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 11:28:29 +0100 (CET)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-12.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4V0hWG40jdz705xhc
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 10:28:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b011fbae99164ddc94c4654e4770f1fb; Thu, 21 Mar 2024 10:28:26 +0000
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
X-Inumbo-ID: c1b71590-e76d-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1711016906; x=1711277406;
	bh=yNxbTqH2YJSkOiphdTLQC16uPnEcVvW/4yCo8FASxpc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GrXDwdCVooZpyvoMeitKyaQInEHVkymkKLBQm/8/YFPW1agW77sofv8ykeXjEho8g
	 u5SimoOzD2MoVVfYUSRwcqSgr4Fam1Ng0pi3BZB2o9NQfxijQV7BOKV06LZy2Cu+NU
	 NYeP87ojRy8A5zPoRQFh20LbtTWr887n1D1wtdInwzi3t2CQ+x1Pb2p3oOL6EV9jm0
	 pAbHMKWOLj3bzc/CnzE1uhctbPCVv5Hx51E7PzVeZnaAy4/WXI2sFgVSQpSIs0Xc5r
	 PfrLJOj5W49FZNJ+vgKoacoFnUaY/xhlX2NPKk7AdmNi13f3ylov/xuC1nImaMI/TN
	 NK7Kv4M3SV76g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1711016906; x=1711277406; i=teddy.astie@vates.tech;
	bh=yNxbTqH2YJSkOiphdTLQC16uPnEcVvW/4yCo8FASxpc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=etazsW80scRAm8wHgdOSjH8kDbgDAeyvUpZMos0tZ0mdDJ0LzAuy5cMyeZvH+WmCp
	 rOqPtGtgryoMAAUvO6DoxuB4N35asD8zQHbffmX+3n9mX2Sgv4pkKAKBjdqJWMavW1
	 1Oss5ZpBCetnSacpcTggDFiRBou0uv0KDxdGHVbGYgrE3SBOtDMuA99NMzvdR4HWDD
	 fpYwAhye6BnLblvkAU5RyH2n5Fj8QFTb/mRKIJ9+A6GR2WZ1M50137sbBmVtaeKc57
	 13QwqXX260rq3QXmdC4TPEjcTCEC1dmxuohLdSuj0+kXYHCwz70mLXZNuouybF+/m0
	 R/70vpZbnFc4Q==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=201/3]=20VT-d:=20Disable=20IOMMU=20if=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1711016905606
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Kevin Tian <kevin.tian@intel.com>
Message-Id: <d7f4916c3cfee5fc62b6384559b614f0a7e562f1.1711016106.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1711016106.git.teddy.astie@vates.tech>
References: <cover.1711016106.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b011fbae99164ddc94c4654e4770f1fb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240321:md
Date: Thu, 21 Mar 2024 10:28:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

No hardware has VT-d support while not having cx16 support, consider disabling IOMMU in this case to avoid potentially buggy code.

Now that IOMMU is only enabled if cx16 is supported, drop dead code that handles cases where cx16 isn't supported.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/vtd/intremap.c | 67 +++++----------------
 xen/drivers/passthrough/vtd/iommu.c    | 80 +++++++++-----------------
 2 files changed, 41 insertions(+), 106 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index c504852eb8..312b73e693 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -173,47 +173,26 @@ bool __init cf_check intel_iommu_supports_eim(void)
  * Assume iremap_lock has been acquired. It is to make sure software will not
  * change the same IRTE behind us. With this assumption, if only high qword or
  * low qword in IRTE is to be updated, this function's atomic variant can
- * present an atomic update to VT-d hardware even when cmpxchg16b
- * instruction is not supported.
+ * present an atomic update to VT-d hardware.
  */
 static void update_irte(struct vtd_iommu *iommu, struct iremap_entry *entry,
                         const struct iremap_entry *new_ire, bool atomic)
 {
-    ASSERT(spin_is_locked(&iommu->intremap.lock));
-
-    if ( cpu_has_cx16 )
-    {
-        __uint128_t ret;
-        struct iremap_entry old_ire;
+    __uint128_t ret;
+    struct iremap_entry old_ire;
 
-        old_ire = *entry;
-        ret = cmpxchg16b(entry, &old_ire, new_ire);
+    ASSERT(spin_is_locked(&iommu->intremap.lock));
+    
+    old_ire = *entry;
+    ret = cmpxchg16b(entry, &old_ire, new_ire);
 
-        /*
-         * In the above, we use cmpxchg16 to atomically update the 128-bit
-         * IRTE, and the hardware cannot update the IRTE behind us, so
-         * the return value of cmpxchg16 should be the same as old_ire.
-         * This ASSERT validate it.
-         */
-        ASSERT(ret == old_ire.val);
-    }
-    else
-    {
-        /*
-         * VT-d hardware doesn't update IRTEs behind us, nor the software
-         * since we hold iremap_lock. If the caller wants VT-d hardware to
-         * always see a consistent entry, but we can't meet it, a bug will
-         * be raised.
-         */
-        if ( entry->lo == new_ire->lo )
-            write_atomic(&entry->hi, new_ire->hi);
-        else if ( entry->hi == new_ire->hi )
-            write_atomic(&entry->lo, new_ire->lo);
-        else if ( !atomic )
-            *entry = *new_ire;
-        else
-            BUG();
-    }
+    /*
+     * In the above, we use cmpxchg16 to atomically update the 128-bit
+     * IRTE, and the hardware cannot update the IRTE behind us, so
+     * the return value of cmpxchg16 should be the same as old_ire.
+     * This ASSERT validate it.
+     */
+    ASSERT(ret == old_ire.val);
 }
 
 /* Mark specified intr remap entry as free */
@@ -394,8 +373,7 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
     remap_rte->reserved = 0;
     /* Indicate remap format. */
     remap_rte->format = 1;
-
-    /* If cmpxchg16b is not available the caller must mask the IO-APIC pin. */
+    
     update_irte(iommu, iremap_entry, &new_ire, !init && !masked);
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
@@ -437,21 +415,6 @@ void cf_check io_apic_write_remap_rte(
     bool masked = true;
     int rc;
 
-    if ( !cpu_has_cx16 )
-    {
-       /*
-        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
-        * avoid interrupts seeing an inconsistent IRTE entry.
-        */
-        old_rte = __ioapic_read_entry(apic, pin, true);
-        if ( !old_rte.mask )
-        {
-            masked = false;
-            old_rte.mask = 1;
-            __ioapic_write_entry(apic, pin, true, old_rte);
-        }
-    }
-
     /* Not the initializer, for old gcc to cope. */
     new_rte.raw = rte;
 
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index c7110af7c9..47b56f37a9 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1482,7 +1482,7 @@ int domain_context_mapping_one(
 {
     struct domain_iommu *hd = dom_iommu(domain);
     struct context_entry *context, *context_entries, lctxt;
-    __uint128_t old;
+    __uint128_t res, old;
     uint64_t maddr;
     uint16_t seg = iommu->drhd->segment, prev_did = 0;
     struct domain *prev_dom = NULL;
@@ -1580,55 +1580,23 @@ int domain_context_mapping_one(
         ASSERT(!context_fault_disable(lctxt));
     }
 
-    if ( cpu_has_cx16 )
-    {
-        __uint128_t res = cmpxchg16b(context, &old, &lctxt.full);
+    res = cmpxchg16b(context, &old, &lctxt.full);
 
-        /*
-         * Hardware does not update the context entry behind our backs,
-         * so the return value should match "old".
-         */
-        if ( res != old )
-        {
-            if ( pdev )
-                check_cleanup_domid_map(domain, pdev, iommu);
-            printk(XENLOG_ERR
-                   "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
-                   &PCI_SBDF(seg, bus, devfn),
-                   (uint64_t)(res >> 64), (uint64_t)res,
-                   (uint64_t)(old >> 64), (uint64_t)old);
-            rc = -EILSEQ;
-            goto unlock;
-        }
-    }
-    else if ( !prev_dom || !(mode & MAP_WITH_RMRR) )
-    {
-        context_clear_present(*context);
-        iommu_sync_cache(context, sizeof(*context));
-
-        write_atomic(&context->hi, lctxt.hi);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->lo, lctxt.lo);
-    }
-    else /* Best effort, updating DID last. */
+    /*
+     * Hardware does not update the context entry behind our backs,
+     * so the return value should match "old".
+     */
+    if ( res != old )
     {
-         /*
-          * By non-atomically updating the context entry's DID field last,
-          * during a short window in time TLB entries with the old domain ID
-          * but the new page tables may be inserted.  This could affect I/O
-          * of other devices using this same (old) domain ID.  Such updating
-          * therefore is not a problem if this was the only device associated
-          * with the old domain ID.  Diverting I/O of any of a dying domain's
-          * devices to the quarantine page tables is intended anyway.
-          */
-        if ( !(mode & (MAP_OWNER_DYING | MAP_SINGLE_DEVICE)) )
-            printk(XENLOG_WARNING VTDPREFIX
-                   " %pp: reassignment may cause %pd data corruption\n",
-                   &PCI_SBDF(seg, bus, devfn), prev_dom);
-
-        write_atomic(&context->lo, lctxt.lo);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->hi, lctxt.hi);
+        if ( pdev )
+            check_cleanup_domid_map(domain, pdev, iommu);
+        printk(XENLOG_ERR
+                "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
+                &PCI_SBDF(seg, bus, devfn),
+                (uint64_t)(res >> 64), (uint64_t)res,
+                (uint64_t)(old >> 64), (uint64_t)old);
+        rc = -EILSEQ;
+        goto unlock;
     }
 
     iommu_sync_cache(context, sizeof(struct context_entry));
@@ -2630,6 +2598,15 @@ static int __init cf_check vtd_setup(void)
     int ret;
     bool reg_inval_supported = true;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk(XENLOG_ERR VTDPREFIX
+               "IOMMU: CPU doesn't support CMPXCHG16B, disabling\n");
+
+        ret = -ENOSYS;
+        goto error;
+    }
+
     if ( list_empty(&acpi_drhd_units) )
     {
         ret = -ENODEV;
@@ -2692,12 +2669,7 @@ static int __init cf_check vtd_setup(void)
             iommu_intremap = iommu_intremap_off;
 
 #ifndef iommu_intpost
-        /*
-         * We cannot use posted interrupt if X86_FEATURE_CX16 is
-         * not supported, since we count on this feature to
-         * atomically update 16-byte IRTE in posted format.
-         */
-        if ( !cap_intr_post(iommu->cap) || !iommu_intremap || !cpu_has_cx16 )
+        if ( !cap_intr_post(iommu->cap) || !iommu_intremap )
             iommu_intpost = false;
 #endif
 
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

