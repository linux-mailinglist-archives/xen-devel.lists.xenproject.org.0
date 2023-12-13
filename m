Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED28C8118D3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 17:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654093.1020763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDRqD-0008GE-I6; Wed, 13 Dec 2023 16:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654093.1020763; Wed, 13 Dec 2023 16:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDRqD-0008DN-FU; Wed, 13 Dec 2023 16:12:09 +0000
Received: by outflank-mailman (input) for mailman id 654093;
 Wed, 13 Dec 2023 16:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCut=HY=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDRqC-0007yZ-9u
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 16:12:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c40281e-99d2-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 17:12:06 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id E527E4EE0738;
 Wed, 13 Dec 2023 17:12:05 +0100 (CET)
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
X-Inumbo-ID: 5c40281e-99d2-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH v2 1/2] x86/IOMMU: address violations of MISRA C:2012 Rule 14.4
Date: Wed, 13 Dec 2023 17:10:50 +0100
Message-Id: <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
headline states:
"The controlling expression of an if statement and the controlling
expression of an iteration-statement shall have essentially Boolean type".

Add comparisons to avoid using enum constants as controlling expressions
to comply with Rule 14.4.
No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
Changes in v2
- rename prefix from AMD/IOMMU to x86/IOMMU
- move changes on msi.c and hpet.c in this patch.
---
 xen/arch/x86/hpet.c                      | 6 +++---
 xen/arch/x86/msi.c                       | 4 ++--
 xen/drivers/passthrough/amd/iommu_init.c | 4 ++--
 xen/drivers/passthrough/vtd/iommu.c      | 4 ++--
 xen/drivers/passthrough/vtd/quirks.c     | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 7be26c6a9b..d1ddc8ddf6 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -279,7 +279,7 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
 {
     ch->msi.msg = *msg;
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         int rc = iommu_update_ire_from_msi(&ch->msi, msg);
 
@@ -353,7 +353,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
     u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
     irq_desc_t *desc = irq_to_desc(ch->msi.irq);
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         ch->msi.hpet_id = hpet_blockid;
         ret = iommu_setup_hpet_msi(&ch->msi);
@@ -372,7 +372,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
         ret = __hpet_setup_msi_irq(desc);
     if ( ret < 0 )
     {
-        if ( iommu_intremap )
+        if ( iommu_intremap != iommu_intremap_off )
             iommu_update_ire_from_msi(&ch->msi, NULL);
         return ret;
     }
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 7f8e794254..72dce2e4ab 100644
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
index 5515cb70fd..e02a09a9a7 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1480,7 +1480,7 @@ int __init amd_iommu_init(bool xt)
             goto error_out;
     }
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
         register_keyhandler('V', &amd_iommu_dump_intremap_tables,
                             "dump IOMMU intremap tables", 0);
 
@@ -1498,7 +1498,7 @@ int __init amd_iommu_init_late(void)
 
     /* Further initialize the device table(s). */
     pci_init = true;
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
         rc = iterate_ivrs_mappings(amd_iommu_setup_device_table);
 
     for_each_amd_iommu ( iommu )
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index e13b7d99db..bd6d69a6f5 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2543,7 +2543,7 @@ static int __must_check init_vtd_hw(bool resume)
     /*
      * Enable interrupt remapping
      */  
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         int apic;
         for ( apic = 0; apic < nr_ioapics; apic++ )
@@ -2559,7 +2559,7 @@ static int __must_check init_vtd_hw(bool resume)
             }
         }
     }
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         for_each_drhd_unit ( drhd )
         {
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index 5a56565ea8..950dcd56ef 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -392,7 +392,7 @@ void __init platform_quirks_init(void)
     map_igd_reg();
 
     /* Tylersburg interrupt remap quirk */
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
         tylersburg_intremap_quirk();
 }
 
-- 
2.40.0


