Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1698B9483DB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 23:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772373.1182839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb4y2-0003Uf-Bk; Mon, 05 Aug 2024 21:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772373.1182839; Mon, 05 Aug 2024 21:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb4y2-0003SI-8T; Mon, 05 Aug 2024 21:10:10 +0000
Received: by outflank-mailman (input) for mailman id 772373;
 Mon, 05 Aug 2024 21:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Qdp=PE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sb4y0-0003B6-Mh
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 21:10:08 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16244e15-536f-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 23:10:06 +0200 (CEST)
Received: from BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 21:10:01 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:180:cafe::45) by BY5PR13CA0005.outlook.office365.com
 (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.11 via Frontend
 Transport; Mon, 5 Aug 2024 21:10:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7875.2 via Frontend Transport; Mon, 5 Aug 2024 21:10:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 16:09:59 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 16:09:58 -0500
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
X-Inumbo-ID: 16244e15-536f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1Bj48pacmz1xyGKhtOVTyDzej77INfe3oAwd2Sj3ll0MZYHgGoXROwX8u1SbmEesxl8Mfb/MJMJgMo7TSgiDcv0o6OVxIIl+9k0AQ2od5GYOyxKWdLO3vG4+fmdjipqwUQTKF7VJxoV5A8XAV/LXHmsuqF3fFAbsYANTdfcG0SwZCEKhZwC3q4iw3DcstTH5OkS4SCtuFNi04pV51GgnhgX+9uve3D2L8G1pXgjFHcAizUr5n4CK/aG0Z64PVFI7PjyT3Z6pk4JiYJTbHWnTosXRGi0IaB8jK2M8WjDWjHlOyNwLQVxjBA+LXR1CxMFQSlHk8MuuYR4a6fOTvYINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqFIWjOEcIiXGqrM6iqQTUtHFx+YHRZKkWFzqALMsCo=;
 b=le1fNnvgojvgciL60FER3PbMAfI0MPGCobCYs/Ik1yCB8n3Xle78/kD6NjkR8gPk1AKY0pHaVhg7NuzvYrNEdNXvm58PyCqFrVedLjD0Ll0Neepg5bJNRDdkgnRNy/6phERdPNKYEoyp+lRK8ji0cxLqco0sIRLbEYWZ6kGq3H3/MONPkCjW/Y5vcyltDybtm+4Z1ilUqpI/9UbjXZFg/J4qnN6OQGPjzxXuxn7KQDMDSPYpDzIufXpArBmRLaNUoAC0GcPxilYwAAjwdIanmW4Bv7A0AH6PDu5QjnLX9iNWr5PglNflPsJuObDrlY/YIha0SB8quosPgBMVM9RKFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqFIWjOEcIiXGqrM6iqQTUtHFx+YHRZKkWFzqALMsCo=;
 b=RbuykvQUiCPMb34AQlMUE1ySVOuok4hkq70nLYbHaLgGSMbQSAGYbzNFp1E8LfK2tkB0KCktE2TagXDV/eC9b7nPppio0LP5ZYdi1GJMZdvJSFC9eYMtwXQel6eaRwRGvVezvtE8otDwtmvrij/78K/nCDdkGF+a+FyguY5TRJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH] x86/msi: fix locking for SRIOV devices
Date: Mon, 5 Aug 2024 17:09:54 -0400
Message-ID: <20240805210956.364624-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7e27f2-e02f-4bd6-ec4d-08dcb592f7d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6fh09ovxl4iv8+rb7b1ecvY+LxW18p08ghfHXmbZVdYSamL9c5amW8wbYw3W?=
 =?us-ascii?Q?AYGxNf38CyNfQvmI8yuQjT5cdd+tbPKsp8f2MO+iloDFdhA2QBRz1uYJxaGw?=
 =?us-ascii?Q?vkBoK5ZsFT8B7IrFUo+BhxiZ/iqG1dwk+QfXZVaU7o5a2qybXv4vHPljfA3E?=
 =?us-ascii?Q?0MkJH3mX5eEpa11S1qSs7/RzYbhWuOpMIQgwJkv4uNsG2UujvT2WZQCZFvYJ?=
 =?us-ascii?Q?eIZReFxy+igaOOD079KZ+Ku/CVt2LgHjxiNt/KGUh4RB/SG0qrzVrAyPYuMa?=
 =?us-ascii?Q?qCku72BbqKI9bKbAwD5Llf6QgIIvT0gQOg1u/wvFAzHdqly3qFDviwAg3PKR?=
 =?us-ascii?Q?ncUfaCuHLvSPwA0cWwtBMFc4DrTbbo2vFoXnvVchROQsAo2cWyS2NjCxPvma?=
 =?us-ascii?Q?D1rceXrVKbnfMygsvnIeljuuBqIx2JXwEIkp4d9IimPQbACOLm86MzKTQu2E?=
 =?us-ascii?Q?EdGuQI+rw6HVsYu8x0e5WQunfgFUGPBWytvJPe/6HU/vjXt2uDUEre7xc6/2?=
 =?us-ascii?Q?YjA5uk5TdoLbt9ztyr6Nkl8+klOOPnUlQ1swZzw+yOa3iTcd/9xPwnuVfcR7?=
 =?us-ascii?Q?eNSVaYO5vWMF46fNAx4W6ike1g1zslt25KGkbx+DkANsAkCKv5jNx/J5oyrb?=
 =?us-ascii?Q?sJjSNZnCZJSuV6NRpBII5X4FjNH/r6taRT4GNnA+siqzmn1iU1iv8+XaBY2K?=
 =?us-ascii?Q?JU3u+Mfm/3TByU0+qKkpXndbZzKdsjJBshRD4OrTZD1kwr19KOr+BzTqio8F?=
 =?us-ascii?Q?4YwyVb2Z6fGp+2mnLcAHCQIxF+qt4+VpdsK0nmNhDgGHpM9EOYqVzFCW2G5I?=
 =?us-ascii?Q?lNrLhsxCZetZRYdHc0mMPefxVKIJ6Q99T+tKl+cVU4rgBgU8qhMMyh/IbzgX?=
 =?us-ascii?Q?SloCO0dTvYfB9YRp8xPbTgGNqwQ6/zui1WpNPhYMd8EdNfF7GcGkFayWEeF0?=
 =?us-ascii?Q?AV87fnJF0pz6AIKGOwJc3sqxCIbg8eavNyOnJJbvuXp5pb0vDP7/RqLsTwTc?=
 =?us-ascii?Q?T1brw5YNuPQBVjvW3NS0M7AzSB4T64ueYsKduYUrgWkj5uxcYmNY1w2wMFku?=
 =?us-ascii?Q?1MmO+mssxhHgJXE5xdnffd4kC7Pad6sOBTdP5Z19dhSPfcwBorBAhojC5YoE?=
 =?us-ascii?Q?FjfZTus5YJaCRzTtoQbqBREG0Dv/IfSY6dftE95EuoZ31zoWBi3kQoLRc/0I?=
 =?us-ascii?Q?Z3ZI2r06YjZZkDO1+Rf1wekJ6mkCXuz1CRUTo4cmwa1eL3tF/p3c0OvEyJVC?=
 =?us-ascii?Q?XMy/sAlX53fa8ijS46ytXLVqNyazsvyu24OWy6ovuqU7AEpEb6SYXG5RL6sE?=
 =?us-ascii?Q?hB07R6UYzBo+keTssAvKFF+4hDNdM2L/AEDf9c7ohzjmVNEvaniZdOWJ+Wj9?=
 =?us-ascii?Q?c9SWJ/ha7sKd7JUCbdzroWOwgEriYF06bDM/gkfusowymv9zszudFxvfE/qG?=
 =?us-ascii?Q?C95CJyo2Wkjjshb9WNhRdGthVAp34WB1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 21:10:00.5984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7e27f2-e02f-4bd6-ec4d-08dcb592f7d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908

In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
structure") a lock moved from allocate_and_map_msi_pirq() to the caller
and changed from pcidevs_lock() to read_lock(&d->pci_lock). However, one
call path wasn't updated to reflect the change, leading to a failed
assertion observed on debug builds of Xen when an SRIOV device is
present with one or more VFs enabled:

(XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:535
(XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040284da8>] R pci_get_pdev+0x4c/0xab
(XEN)    [<ffff82d040344f5c>] F arch/x86/msi.c#read_pci_mem_bar+0x58/0x272
(XEN)    [<ffff82d04034530e>] F arch/x86/msi.c#msix_capability_init+0x198/0x755
(XEN)    [<ffff82d040345dad>] F arch/x86/msi.c#__pci_enable_msix+0x82/0xe8
(XEN)    [<ffff82d0403463e5>] F pci_enable_msi+0x3f/0x78
(XEN)    [<ffff82d04034be2b>] F map_domain_pirq+0x2a4/0x6dc
(XEN)    [<ffff82d04034d4d5>] F allocate_and_map_msi_pirq+0x103/0x262
(XEN)    [<ffff82d04035da5d>] F physdev_map_pirq+0x210/0x259
(XEN)    [<ffff82d04035e798>] F do_physdev_op+0x9c3/0x1454
(XEN)    [<ffff82d040329475>] F pv_hypercall+0x5ac/0x6af
(XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150

Fix it by passing the struct domain pointer to pci_get_pdev() in this
call path.

Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Candidate for backport to 4.19
---
 xen/arch/x86/msi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 0c97fbb3fc03..95a48615a1a4 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -662,7 +662,8 @@ static int msi_capability_init(struct pci_dev *dev,
     return 0;
 }
 
-static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
+static u64 read_pci_mem_bar(struct domain *d, u16 seg, u8 bus, u8 slot, u8 func,
+                            u8 bir, int vf)
 {
     u8 limit;
     u32 addr, base = PCI_BASE_ADDRESS_0;
@@ -670,8 +671,7 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
 
     if ( vf >= 0 )
     {
-        struct pci_dev *pdev = pci_get_pdev(NULL,
-                                            PCI_SBDF(seg, bus, slot, func));
+        struct pci_dev *pdev = pci_get_pdev(d, PCI_SBDF(seg, bus, slot, func));
         unsigned int pos;
         uint16_t ctrl, num_vf, offset, stride;
 
@@ -829,7 +829,8 @@ static int msix_capability_init(struct pci_dev *dev,
             vf = dev->sbdf.bdf;
         }
 
-        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        table_paddr = read_pci_mem_bar(dev->domain, seg, pbus, pslot, pfunc,
+                                       bir, vf);
         WARN_ON(msi && msi->table_base != table_paddr);
         if ( !table_paddr )
         {
@@ -852,7 +853,8 @@ static int msix_capability_init(struct pci_dev *dev,
 
         pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
         bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
-        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        pba_paddr = read_pci_mem_bar(dev->domain, seg, pbus, pslot, pfunc, bir,
+                                     vf);
         WARN_ON(!pba_paddr);
         pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
 
-- 
2.46.0


