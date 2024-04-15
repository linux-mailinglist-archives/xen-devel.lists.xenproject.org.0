Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A260D8A4EBB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 14:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706124.1103186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGE-0006xJ-2L; Mon, 15 Apr 2024 12:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706124.1103186; Mon, 15 Apr 2024 12:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGD-0006vY-Ue; Mon, 15 Apr 2024 12:16:33 +0000
Received: by outflank-mailman (input) for mailman id 706124;
 Mon, 15 Apr 2024 12:16:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO1z=LU=bounce.vates.tech=bounce-md_30504962.661d1a9b.v1-5940a3e6221749998ac9aca906e84254@srs-se1.protection.inumbo.net>)
 id 1rwLGB-0006Sb-Ji
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 12:16:31 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fca20e38-fb21-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 14:16:29 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VJ5kN0Q8xzDRHx8L
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 12:16:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5940a3e6221749998ac9aca906e84254; Mon, 15 Apr 2024 12:16:27 +0000
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
X-Inumbo-ID: fca20e38-fb21-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713183388; x=1713443888;
	bh=N55hC69B7xJL3Kv7A7B9tNKAYd1n2HnGpDoxaSJnBes=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bcY4bLo6Tngd9910qD9P9AuopNav7PQ3rhdRCf277Ef/iWENJfyn0w4cbxgwTlX2V
	 sSUVq5UahlurNBJcLnKcYpIr2mSsoQcA0CJ8MYmlHb/P/25caGhu/ZKA0NCjqVr5JR
	 8OxI7fiu5UXgNXjnvFO8UpKOZpv8VJerPemUVLFqe2ZAz5Uy+1bA/VgRFKGWYL/xuo
	 3B8BxJgM/YP+SgPzdzfVejnct3LTHEtWmXV5FJ88YgHlsgRIJPRqMg56j5dhrQLshe
	 PXdO+rHBRdGBSW4h2No0ymisKG/IyVEfU71JqwaidvwxLC9BWWCnl6Qa0eDjwvfqRw
	 KtNDR+0uKZlUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713183388; x=1713443888; i=teddy.astie@vates.tech;
	bh=N55hC69B7xJL3Kv7A7B9tNKAYd1n2HnGpDoxaSJnBes=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=v2SfJIbwokjLYSpPyKgyooUHE1MuI9xbjPbqmGhGmHTGthMRTx3+gU1l23OAkuSS2
	 hA9Wb0YBDOZ3aOH83JXFXzn+oe3ecmfrPiZONqYFHUuiswpIciaHWKkvJ/UfS4ybs9
	 JlOKYRYhS1eUesqZgMrvHZFAIZCB9ogkUhBe8QQdLixbr2kWATp6wLDMlV161lLBv4
	 WUfeRzj1MNbzB1zaWLOpUZfo/tDYSEE2SrAPsKD1BB8T+nJ3YYnoWlLxIBzPYJGKq8
	 HlLaxycuDdVxp8nZwU/my09g84TPf5cScroQKX8DJDZeByiTKlzwaZlG6zxbcXDplz
	 MPxI/0aSnaNFw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v4=204/5]=20VT-d:=20Disable=20intrerrupt=20remapping=20if=20cx16=20is=20not=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713183387080
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <e08d65ded9f82a837f9f0f5cbcd1533018571ebf.1713174878.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1713174878.git.teddy.astie@vates.tech>
References: <cover.1713174878.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5940a3e6221749998ac9aca906e84254?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240415:md
Date: Mon, 15 Apr 2024 12:16:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All hardware with VT-d has CMPXCHG16B support.  Check this at initialisation
time, and remove the effectively-dead logic for the non-cx16 case.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/vtd/intremap.c | 70 ++++++++------------------
 xen/drivers/passthrough/vtd/iommu.c    |  7 +--
 2 files changed, 21 insertions(+), 56 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index c504852eb8..7d4d907b4f 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -150,6 +150,13 @@ bool __init cf_check intel_iommu_supports_eim(void)
     if ( !iommu_qinval || !iommu_intremap || list_empty(&acpi_drhd_units) )
         return false;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk(XENLOG_WARNING VTDPREFIX
+               "CPU doesn't support CMPXCHG16B, disable interrupt remapping\n");
+        return false;
+    }
+
     /* We MUST have a DRHD unit for each IOAPIC. */
     for ( apic = 0; apic < nr_ioapics; apic++ )
         if ( !ioapic_to_drhd(IO_APIC_ID(apic)) )
@@ -173,47 +180,26 @@ bool __init cf_check intel_iommu_supports_eim(void)
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
+    __uint128_t ret;
+    struct iremap_entry old_ire;
 
-    if ( cpu_has_cx16 )
-    {
-        __uint128_t ret;
-        struct iremap_entry old_ire;
+    ASSERT(spin_is_locked(&iommu->intremap.lock));
 
-        old_ire = *entry;
-        ret = cmpxchg16b(entry, &old_ire, new_ire);
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
@@ -395,7 +381,6 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
     /* Indicate remap format. */
     remap_rte->format = 1;
 
-    /* If cmpxchg16b is not available the caller must mask the IO-APIC pin. */
     update_irte(iommu, iremap_entry, &new_ire, !init && !masked);
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
@@ -437,21 +422,6 @@ void cf_check io_apic_write_remap_rte(
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
index 7c6bae0256..a1bd3c5ff6 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2663,12 +2663,7 @@ static int __init cf_check vtd_setup(void)
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

