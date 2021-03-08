Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B660633089A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 08:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94637.178200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJ9xK-0000wA-4w; Mon, 08 Mar 2021 07:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94637.178200; Mon, 08 Mar 2021 07:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJ9xK-0000vl-1p; Mon, 08 Mar 2021 07:05:30 +0000
Received: by outflank-mailman (input) for mailman id 94637;
 Mon, 08 Mar 2021 07:05:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3/5=IG=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lJ9xI-0000vg-M5
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 07:05:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad90e749-9b80-4c9a-b699-713a93406fc2;
 Mon, 08 Mar 2021 07:05:26 +0000 (UTC)
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
X-Inumbo-ID: ad90e749-9b80-4c9a-b699-713a93406fc2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615187126;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=x4vRChd+dxV6ytQmVNimD9wMQF8A2O4nUmILpIFlhaE=;
  b=Bp4SeloDpmcJqqyW5k+6Mmp+wYI8ePCS9VmLEGq+Bw1zvFkmrCj0eqB9
   uVhFpamRWNa01EFuF4pDmJLfbzXYaqL1FJBVGK7H6dOSG0mKPVtxEdcd8
   xWJzFe+jyrJiSpORYjWuACj28pcAUzTl2yD5ViPzM8V3DeR/sujZQQxhq
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: S0Auq6O8JXRFCVSQ8TIEKK7/1NXC+JYJu+7GeHjeY6QV500IefDMxiIlySK/pfC9ACCXiBi9TG
 YN9ePABBALOUcGESIVSCyQ2JVua0ycqumDkNYkWTnyrOW98w4NMleE1HxgLjxH76rhhWBJAmgH
 2x1wHejtWDfrM0Q/xOkPaOoVMdpL6imLdxgFurpzMq2DUuylu4aA3TGluVjAd50U8nJIVBlbKA
 SrYqjIFFerwwxj90I4E18H4Z0MHeAgXXjlwF719oy3oFtNrW2T3zwvIIZplfXSkFEYpc0RjmcA
 Iuo=
X-SBRS: 4.0
X-MesageID: 38926688
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,231,1610427600"; 
   d="scan'208";a="38926688"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <kevin.tian@intel.com>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
Subject: [PATCH for-4.15] vtd: make sure QI/IR are disabled before initialisation
Date: Mon, 8 Mar 2021 07:00:02 +0000
Message-ID: <1615186802-5908-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

BIOS might pass control to Xen leaving QI and/or IR in enabled and/or
partially configured state. In case of x2APIC code path where EIM is
enabled early in boot - those are correctly disabled by Xen before any
attempt to configure. But for xAPIC that step is missing which was
proven to cause QI initialization failures on some ICX based platforms
where QI is left pre-enabled and partially configured by BIOS.

Unify the behaviour between x2APIC and xAPIC code paths keeping that in
line with what Linux does.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 xen/arch/x86/apic.c                 |  2 +-
 xen/drivers/passthrough/vtd/iommu.c | 12 +++++++++++-
 xen/include/asm-x86/apic.h          |  1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 7497ddb..8ab8214 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -47,7 +47,7 @@ static bool __read_mostly tdt_enabled;
 static bool __initdata tdt_enable = true;
 boolean_param("tdt", tdt_enable);
 
-static bool __read_mostly iommu_x2apic_enabled;
+bool __read_mostly iommu_x2apic_enabled;
 
 static struct {
     int active;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index d136fe3..4aa7a31 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2080,7 +2080,7 @@ static int __must_check init_vtd_hw(void)
     u32 sts;
 
     /*
-     * Basic VT-d HW init: set VT-d interrupt, clear VT-d faults.  
+     * Basic VT-d HW init: set VT-d interrupt, clear VT-d faults, etc.
      */
     for_each_drhd_unit ( drhd )
     {
@@ -2090,6 +2090,16 @@ static int __must_check init_vtd_hw(void)
 
         clear_fault_bits(iommu);
 
+        /*
+         * Disable interrupt remapping and queued invalidation if
+         * already enabled by BIOS in case we've not initialized it yet.
+         */
+        if ( !iommu_x2apic_enabled )
+        {
+            disable_intremap(iommu);
+            disable_qinval(iommu);
+        }
+
         spin_lock_irqsave(&iommu->register_lock, flags);
         sts = dmar_readl(iommu->reg, DMAR_FECTL_REG);
         sts &= ~DMA_FECTL_IM;
diff --git a/xen/include/asm-x86/apic.h b/xen/include/asm-x86/apic.h
index 8ddb896..2fe54bb 100644
--- a/xen/include/asm-x86/apic.h
+++ b/xen/include/asm-x86/apic.h
@@ -24,6 +24,7 @@ enum apic_mode {
     APIC_MODE_X2APIC    /* x2APIC mode - common for large MP machines */
 };
 
+extern bool iommu_x2apic_enabled;
 extern u8 apic_verbosity;
 extern bool directed_eoi_enabled;
 
-- 
2.7.4


