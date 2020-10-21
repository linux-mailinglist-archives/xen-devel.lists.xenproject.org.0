Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070D0294946
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 10:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9892.26127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV9MH-0001YE-1T; Wed, 21 Oct 2020 08:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9892.26127; Wed, 21 Oct 2020 08:20:33 +0000
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
	id 1kV9MG-0001Xs-UI; Wed, 21 Oct 2020 08:20:32 +0000
Received: by outflank-mailman (input) for mailman id 9892;
 Wed, 21 Oct 2020 08:20:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kV9MF-0001Xn-DN
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 08:20:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53246437-3c70-48f1-91e9-8d68ad3dfce4;
 Wed, 21 Oct 2020 08:20:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kV9MF-0001Xn-DN
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 08:20:31 +0000
X-Inumbo-ID: 53246437-3c70-48f1-91e9-8d68ad3dfce4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 53246437-3c70-48f1-91e9-8d68ad3dfce4;
	Wed, 21 Oct 2020 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603268429;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y1DsProsd+NskXZ7WmI5xqqNUBFyInGW0t+Wre805Zk=;
  b=DUFW7vml8Hcz5+B42oaS/7HrXvFxhrS3H/sRMBqAZT4mBgS5frzwhZau
   KfgCsnGvSPu0Jk7KXeB2ZJxrNLwTdB5yJgKAY45Z8z4ApMiYja1rV8bIU
   6Z/TublxmrFiHrQPf6l1rdUJsU4xR/ICyUaFSWufDl56ojm76bnPR86ad
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5C733hWXykDkPs3r9anZHWXJn489rFYLVVlMW3rYOIs2sYhLzzkEalWK+2QkxYlnDGUGGP1yKw
 JS9016T5ZQcD/Y6d/ikMtintAYeGauk5cMhIMlmMsHUK6lutG9Bd3vBECyYzQFWjy6TtiXm73n
 Kri8kUEoJFPYwGMDVlLbQuKX/MVORFdxOaROemC1SaryRRpyqOUHUBfYkAeEQvQH8oCTljfLjI
 47ZSZZpMfgqJwY2ttMyP5UKpc+yycR/BFA6ceKAXjbq2jgqOIQ0uxSgKn6k7kzqAFFuryUMFR/
 TEw=
X-SBRS: 2.5
X-MesageID: 30513882
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,400,1596513600"; 
   d="scan'208";a="30513882"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] pci: cleanup MSI interrupts before removing device from IOMMU
Date: Wed, 21 Oct 2020 10:19:45 +0200
Message-ID: <20201021081945.28425-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Doing the MSI cleanup after removing the device from the IOMMU leads
to the following panic on AMD hardware:

Assertion 'table.ptr && (index < intremap_table_entries(table.ptr, iommu))' failed at iommu_intr.c:172
----[ Xen-4.13.1-10.0.3-d  x86_64  debug=y   Not tainted ]----
CPU:    3
RIP:    e008:[<ffff82d08026ae3c>] drivers/passthrough/amd/iommu_intr.c#get_intremap_entry+0x52/0x7b
[...]
Xen call trace:
   [<ffff82d08026ae3c>] R drivers/passthrough/amd/iommu_intr.c#get_intremap_entry+0x52/0x7b
   [<ffff82d08026af25>] F drivers/passthrough/amd/iommu_intr.c#update_intremap_entry_from_msi_msg+0xc0/0x342
   [<ffff82d08026ba65>] F amd_iommu_msi_msg_update_ire+0x98/0x129
   [<ffff82d08025dd36>] F iommu_update_ire_from_msi+0x1e/0x21
   [<ffff82d080286862>] F msi_free_irq+0x55/0x1a0
   [<ffff82d080286f25>] F pci_cleanup_msi+0x8c/0xb0
   [<ffff82d08025cf52>] F pci_remove_device+0x1af/0x2da
   [<ffff82d0802a42d1>] F do_physdev_op+0xd18/0x1187
   [<ffff82d080383925>] F pv_hypercall+0x1f5/0x567
   [<ffff82d08038a432>] F lstar_enter+0x112/0x120

That's because the call to iommu_remove_device on AMD hardware will
remove the per-device interrupt remapping table, and hence the call to
pci_cleanup_msi done afterwards will find a null intremap table and
crash.

Reorder the calls so that MSI interrupts are torn down before removing
the device from the IOMMU.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've discussed the issue with Andrew and maybe we should try to avoid
removing the interrupt remapping table on device removal, but then the
tables would have to be sized to support the maximum amount of
interrupts instead of the maximum supported by the device currently
plugged in.

I think the currently proposed fix can be easily backported. We can
see about improving the resilience going ahead.
---
 xen/drivers/passthrough/pci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index b035067975..64b8a77ce0 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -834,10 +834,15 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
+            /*
+             * Cleanup MSI interrupts before removing the device from the
+             * IOMMU, or else the internal IOMMU data used to track the device
+             * interrupts might be already gone.
+             */
+            pci_cleanup_msi(pdev);
             ret = iommu_remove_device(pdev);
             if ( pdev->domain )
                 list_del(&pdev->domain_list);
-            pci_cleanup_msi(pdev);
             printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
             free_pdev(pseg, pdev);
             break;
-- 
2.29.0


