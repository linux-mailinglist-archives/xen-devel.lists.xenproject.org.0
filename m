Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031218A992C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708259.1106994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQOP-0004J0-Ll; Thu, 18 Apr 2024 11:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708259.1106994; Thu, 18 Apr 2024 11:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQOP-0004HB-I1; Thu, 18 Apr 2024 11:57:29 +0000
Received: by outflank-mailman (input) for mailman id 708259;
 Thu, 18 Apr 2024 11:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUaF=LX=bounce.vates.tech=bounce-md_30504962.66210aa1.v1-31e15571ae734996912d46962dcf117b@srs-se1.protection.inumbo.net>)
 id 1rxQON-0003Zj-5U
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:57:27 +0000
Received: from mail145-32.atl61.mandrillapp.com
 (mail145-32.atl61.mandrillapp.com [198.2.145.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d25bd602-fd7a-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 13:57:25 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-32.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VKx8x3FbgzP0JyRw
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 11:57:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 31e15571ae734996912d46962dcf117b; Thu, 18 Apr 2024 11:57:21 +0000
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
X-Inumbo-ID: d25bd602-fd7a-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713441441; x=1713701941;
	bh=g2FeBMcF6WkciLZbXhA5HEE1g3wyv8w1asNrCrzF7bY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=coBZF80O9yoynJWCbhZ3cT9AQ5DSTosaqTonz8wyfxCjXRKBC3K7+UQSZp77IpSKe
	 Kwqthv3QlLg52mGPK/l/CnFputLByRSZbOc/HGNsekTqOZUjd3ncixr1wUlL4djSn9
	 aUTH6+0ZdOuU6CkiTsO2o8ftN2UNOGuyGwNily2ZGL+3fcvRuMnhQ+0yUk+ksoXMam
	 4K5dzXge5uFYiwZ9JWPBIks7OP327myD2fVkfnzowdX41dcL9ZPS8CFm7R8asMCAe0
	 nGA2FljLGvur8MzOTsXQr3bExOsgy6UynOWlWigWK9MhzRuznkVdMA/+EphvI5rRNV
	 cgReTwUPlTjjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713441441; x=1713701941; i=teddy.astie@vates.tech;
	bh=g2FeBMcF6WkciLZbXhA5HEE1g3wyv8w1asNrCrzF7bY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=taNy5na+IVuMGplkXZiWhjPuZBdNShE+7l6E5zUJw7rQLWKB4nhs1gpputVgo50n1
	 7PGCFwaegaH9kVOIGY5yKVOFed8bVY5FomUiDiMEzuTSafZgjaxEys4SbDnaSDO9GU
	 yFpy2hFKvg+6XE39f9+tD1WenWaD4NFnPAq+T0GgzOBi9vfHlxmH4K73We6bRNRWSX
	 1E4jpjBIZmH0k6Fz6IZyTBvrgSLYm8TAJtsGrCiJqJw3I0ZObChZFheXjtgVi6D7Gs
	 G2sIWWc6mwrd8fmPAZmjda6hrnpyir3xP+ci19JzEDx5nq1LkTZTg7u6TpHrpNTCc/
	 qGQY/YKGfMlSw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v5=203/3]=20x86/iommu:=20Disable=20intrerrupt=20remapping=20if=20cx16=20is=20not=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713441440470
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <1623ac82177790d57c6acce3b88ba2960ac11837.1713433029.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1713433029.git.teddy.astie@vates.tech>
References: <cover.1713433029.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.31e15571ae734996912d46962dcf117b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240418:md
Date: Thu, 18 Apr 2024 11:57:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All hardware with VT-d/AMD-Vi has CMPXCHG16B support.  Check this at
initialisation time, and remove the effectively-dead logic for the non-cx16
case.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/amd/iommu_intr.c |  6 ++
 xen/drivers/passthrough/vtd/intremap.c   | 70 +++++++-----------------
 xen/drivers/passthrough/vtd/iommu.c      |  7 +--
 3 files changed, 27 insertions(+), 56 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 7fc796dec2..9ab7c68749 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -649,6 +649,12 @@ bool __init cf_check iov_supports_xt(void)
     if ( !iommu_enable || !iommu_intremap )
         return false;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        AMD_IOMMU_WARN("CPU doesn't support CMPXCHG16B, disable interrupt remapping\n");
+        return false;
+    }
+
     if ( amd_iommu_prepare(true) )
         return false;
 
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

