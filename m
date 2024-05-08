Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BFF8C0494
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 20:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718920.1121466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4mJD-0001tC-Rk; Wed, 08 May 2024 18:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718920.1121466; Wed, 08 May 2024 18:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4mJD-0001qR-Nb; Wed, 08 May 2024 18:46:31 +0000
Received: by outflank-mailman (input) for mailman id 718920;
 Wed, 08 May 2024 18:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CW/7=ML=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s4mJC-0001qL-In
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 18:46:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 468dae99-0d6b-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 20:46:27 +0200 (CEST)
Received: from nico.home-life.hub (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id 311884EE0753;
 Wed,  8 May 2024 20:46:25 +0200 (CEST)
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
X-Inumbo-ID: 468dae99-0d6b-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	andrew.cooper3@citrix.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v3] x86/IOMMU: address violations of MISRA C:2012 Rule 14.4
Date: Wed,  8 May 2024 20:46:21 +0200
Message-Id: <eb64431143014d80e387861825df9e6d058e2a2d.1715193515.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
headline states:
"The controlling expression of an if statement and the controlling
expression of an iteration-statement shall have essentially Boolean type".

Add comparisons to avoid using enum constants as controlling expressions
to comply with Rule 14.4.

Amend the comment in the enum definition to reflect the fact that
boolean uses of iommu_intremap are no longer allowed.

No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
Signed-off-by: Nicola Vetrini  <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini  <sstabellini@kernel.org>
---
Changes in v2
- rename prefix from AMD/IOMMU to x86/IOMMU
- move changes on msi.c and hpet.c in this patch.
Changes in v3:
- amend comment in iommu_intremap definition
- add Stefano's R-by
---
 xen/arch/x86/hpet.c                      | 6 +++---
 xen/arch/x86/msi.c                       | 4 ++--
 xen/drivers/passthrough/amd/iommu_init.c | 4 ++--
 xen/drivers/passthrough/vtd/iommu.c      | 4 ++--
 xen/drivers/passthrough/vtd/quirks.c     | 2 +-
 xen/include/xen/iommu.h                  | 4 ----
 6 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 0759eae055ce..2f54d3188966 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -278,7 +278,7 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
 {
     ch->msi.msg = *msg;
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         int rc = iommu_update_ire_from_msi(&ch->msi, msg);
 
@@ -352,7 +352,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
     u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
     irq_desc_t *desc = irq_to_desc(ch->msi.irq);
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         ch->msi.hpet_id = hpet_blockid;
         ret = iommu_setup_hpet_msi(&ch->msi);
@@ -371,7 +371,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
         ret = __hpet_setup_msi_irq(desc);
     if ( ret < 0 )
     {
-        if ( iommu_intremap )
+        if ( iommu_intremap != iommu_intremap_off )
             iommu_update_ire_from_msi(&ch->msi, NULL);
         return ret;
     }
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index e721aaf5c001..3009ce109f5e 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -189,7 +189,7 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 {
     entry->msg = *msg;
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         int rc;
 
@@ -555,7 +555,7 @@ int msi_free_irq(struct msi_desc *entry)
             destroy_irq(entry[nr].irq);
 
         /* Free the unused IRTE if intr remap enabled */
-        if ( iommu_intremap )
+        if ( iommu_intremap != iommu_intremap_off )
             iommu_update_ire_from_msi(entry + nr, NULL);
     }
 
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 358c8cbad99c..6c0dc2d5cb69 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1483,7 +1483,7 @@ int __init amd_iommu_init(bool xt)
             goto error_out;
     }
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
         register_keyhandler('V', &amd_iommu_dump_intremap_tables,
                             "dump IOMMU intremap tables", 0);
 
@@ -1501,7 +1501,7 @@ int __init amd_iommu_init_late(void)
 
     /* Further initialize the device table(s). */
     pci_init = true;
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
         rc = iterate_ivrs_mappings(amd_iommu_setup_device_table);
 
     for_each_amd_iommu ( iommu )
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index c7110af7c9cd..e13be244c130 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2540,7 +2540,7 @@ static int __must_check init_vtd_hw(bool resume)
     /*
      * Enable interrupt remapping
      */  
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         int apic;
         for ( apic = 0; apic < nr_ioapics; apic++ )
@@ -2556,7 +2556,7 @@ static int __must_check init_vtd_hw(bool resume)
             }
         }
     }
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         for_each_drhd_unit ( drhd )
         {
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index 5a56565ea883..950dcd56ef8a 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -392,7 +392,7 @@ void __init platform_quirks_init(void)
     map_igd_reg();
 
     /* Tylersburg interrupt remap quirk */
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
         tylersburg_intremap_quirk();
 }
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 92db6f124f13..442ae5322d34 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -60,10 +60,6 @@ extern uint8_t iommu_quarantine;
 
 #ifdef CONFIG_X86
 extern enum __packed iommu_intremap {
-   /*
-    * In order to allow traditional boolean uses of the iommu_intremap
-    * variable, the "off" value has to come first (yielding a value of zero).
-    */
    iommu_intremap_off,
    /*
     * Interrupt remapping enabled, but only able to generate interrupts
-- 
2.34.1


