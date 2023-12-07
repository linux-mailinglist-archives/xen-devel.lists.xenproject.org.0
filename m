Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BC68084F7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649722.1014537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBB28-0004CF-FY; Thu, 07 Dec 2023 09:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649722.1014537; Thu, 07 Dec 2023 09:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBB28-00049Q-Cs; Thu, 07 Dec 2023 09:51:04 +0000
Received: by outflank-mailman (input) for mailman id 649722;
 Thu, 07 Dec 2023 09:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TliB=HS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rBB26-00048w-EC
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:51:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f34fa2d-94e6-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 10:50:58 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id B5F134EE073A;
 Thu,  7 Dec 2023 10:50:57 +0100 (CET)
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
X-Inumbo-ID: 1f34fa2d-94e6-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 1/3] AMD/IOMMU: address violations of MISRA C:2012 Rule 14.4
Date: Thu,  7 Dec 2023 10:48:42 +0100
Message-Id: <097df7703c372a687206251fe97bfc5df18222b6.1701941924.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
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
 xen/drivers/passthrough/amd/iommu_init.c | 4 ++--
 xen/drivers/passthrough/vtd/iommu.c      | 4 ++--
 xen/drivers/passthrough/vtd/quirks.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

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


