Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C439E949F12
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 07:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773207.1183656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbZ6B-0007No-He; Wed, 07 Aug 2024 05:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773207.1183656; Wed, 07 Aug 2024 05:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbZ6B-0007Kc-EU; Wed, 07 Aug 2024 05:20:35 +0000
Received: by outflank-mailman (input) for mailman id 773207;
 Wed, 07 Aug 2024 05:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n6VL=PG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sbZ69-0007KW-Pi
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 05:20:33 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2414::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c418c1fb-547c-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 07:20:32 +0200 (CEST)
Received: from BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::14)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 05:20:29 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::21) by BL1P222CA0009.outlook.office365.com
 (2603:10b6:208:2c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Wed, 7 Aug 2024 05:20:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:20:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 00:20:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 00:20:27 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 00:20:27 -0500
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
X-Inumbo-ID: c418c1fb-547c-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNafmEuUyboh9fbDadnluUUS/jxtULnp6wIwpOI/D7iBTtJXPsNfVWyKwXp3ZZUGKYWz5ThJISnzrj1n4UT2aX3diVgrOjmUytIKui/CN1Tu0banalOYWFrGEKEg6Av4K/3Q5Nuja8UtCnLkIgglEpByT4fmtW5DIOAjVUxxg1iFYaPjrCEnX+enxjPfkJaQaHfS+grLriZzZKl+j7dBe47V51Lydq1Fkem9fWi1v5P2r5jAtI5ZA1970IwKNwycvgTNVW71ahYy5H8inAVo4NNx6LJp+PrIy74AAmnr6yLS4BrxA8D5hJ4dUS8ydAHuSYsiSc83PVG+kjlp2uu/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT5c0LeWRQMJB4XifmOf9ZnmeErl11LgIobwRxzYzNE=;
 b=dJlB307mu0I0LkmCoA7dFnSuqXnhUeEauSnIesHs3RxYKBSiJyOCgtB1OrEwrXWd/0+FmvWNytMoQbxWu+Ds0IHuVWDkj77YCWYWdUpVi4VG4qXbZIYM5hymK4F4TWywhBXvqvurmkXDFzTFAdj4Qy2PAzSAgQKaLC/ZTStcD1tMQK20rQoI01ToBAE1WuirXsblo8zzB9+I0/atN/25g9SzytZv2SY4m+Nycsbv7Obd9pdly0g3IxwShOvlyVaQf5Mt0bDU8Y3pvlendbpCRXx2RHckFX1VIoWkwinqwe8GeDoZ6zCqnEm8IWpic2CK9j4q2dn0jxn+z+xv9sgwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT5c0LeWRQMJB4XifmOf9ZnmeErl11LgIobwRxzYzNE=;
 b=xxmXf1jyA3ugZO+BLzy/rX2MOTVZF5NCZYBNiChy/Kp44tvXJmSzNZgdrmclM4AkE03BJnbX9QIF9y4ywcoT4lE7De41Rp0FmdtvVV7uKVuwZkN0GWJokOykf/B/kreM/YW4CHNNXhh2t3cEED+fP6PlcM8YbLeyPJ6J3NKVpKI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v2] x86/msi: fix locking for SR-IOV devices
Date: Wed, 7 Aug 2024 01:20:08 -0400
Message-ID: <20240807052011.582099-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 936c4f55-bf2c-4be9-8988-08dcb6a0a69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yLxxZ3cqf+Kwd7RZMyc5p0LegCXN/gfwbGQKBWCrlMnO/x1xAulk6yxIDq21?=
 =?us-ascii?Q?hibHxYtNC4HOHgXSBWiJKzgdn5QKqhNvByWLSj+ew4EcJDGQo0/N+oGYGtms?=
 =?us-ascii?Q?afFPg4z5R2CkF7rQQlEnbtLYkHrPFqkotGeEGRJQu0czbAxS/JCbBNpI5d7A?=
 =?us-ascii?Q?N8+4p56AT6F7i/sGYUegg8KJNVDrUSWzBB9babJYNKZe5dvE2m882BMqCkQo?=
 =?us-ascii?Q?ImT90bWNbAp4hEl6gB19vKcz6RDhoF6dhBn4CgOAdUcGmOxg6XDQNHuxTHcB?=
 =?us-ascii?Q?S6l8duK7M4znu5ByBgRZQbyWaDnuzrFwCaQ+3n5FMrINwW8Q9QdjjxB/fb0L?=
 =?us-ascii?Q?wx2faGXyMxoog+qom+gb08JGWKpYzfiTlEmqNmeKsNa3OjnV1xnAXttf/YDE?=
 =?us-ascii?Q?T7EqZfBJ3ncmhMLgSDpyZQeB3rrvJxIzPRpmh901BpgGazogYS4sXTzRK2fx?=
 =?us-ascii?Q?NSFFvAN6OxbbAdFeApL/htrbU0NBKKR4W8WqvT3R1/D8rGee2avsd+rHnRJu?=
 =?us-ascii?Q?D7ryYFHDbnL8V9kvYWUOOvUM7+5EBDpkoC30SqwYvYSTofSECPgX+xA4O7r+?=
 =?us-ascii?Q?HfpSHNnblWONFtROpBjXdmbCST65C0RbZAIgqtd92kjKGoUl7sBSJe0113T2?=
 =?us-ascii?Q?rTzYiPagSdHh/uti9HIZ3TxboPZsmu8JelDf5tS20+jXWv90U29gcSAIoKgf?=
 =?us-ascii?Q?kPnnPjVjELJ2oN4r3AOucsvs4AHlLvzQp6DXrZw9SLoiHsP1NFZ9Ca3GgXTJ?=
 =?us-ascii?Q?ej8Bt5u67YfihWZ9Q3Hr4+WMgqfndlzERf2w8iONyCvZcJK016R91sIlZUT8?=
 =?us-ascii?Q?+M6SQo5FmzN2HFK2cUfNyax+YkH5D8OXfEbqF4TFWG0R+8B5B4R7C4QgftPU?=
 =?us-ascii?Q?mvN63o14mn/nmAbh3qJdeP8xKYsGsA18cTXYfo7Rwczq99uifbmA7BEywscM?=
 =?us-ascii?Q?wTAzQR//gEI2lg5SLnm7u3ArxRDDPsxfgYuM7bRTZfkv5AgJqQV3vA3i2OOI?=
 =?us-ascii?Q?Kd/hs1dUjcJ62/4OLJ1ZpfusllRrwp20/++BdxGsFYrEfXoypt4iTV4u1sAZ?=
 =?us-ascii?Q?X/H/BiriEMzoX2gsGe51GIPiG5SXHOUHwaYUk4fMqeKztqfthebXiIUKvE23?=
 =?us-ascii?Q?SYXXgpe/zq0zxj2THOKoNGf23J7VTnPwtOkELotLaEbN86oJWIouDRe6pu+c?=
 =?us-ascii?Q?69G+G+UsnVmMnr4Hmcu4JUAvvtbA4VSiJ0/9kPjRF7De43+CWAihd8G3cdLq?=
 =?us-ascii?Q?Z4vaC5bUxhQxVHmsg/pXq3IrD4HD2qkrxhTV93e9DfVnP9RFvH3p+lB15e6n?=
 =?us-ascii?Q?P0WeR/KJLPSQcWGtmM0sQoDG8LzFfIwEbVO8OwZAehSTbJbWg5K778j3qvzS?=
 =?us-ascii?Q?1ximmPMQI1zGsylacBuytp7tqYkHI1Vcs/Tv/A8zcq2DO4z+FR/hrcJ8//RO?=
 =?us-ascii?Q?gsKzKKKmc/MG5pXhQHgbrewa1mGBmIOf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:20:28.5507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 936c4f55-bf2c-4be9-8988-08dcb6a0a69d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476

In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
structure") a lock moved from allocate_and_map_msi_pirq() to the caller
and changed from pcidevs_lock() to read_lock(&d->pci_lock). However, one
call path wasn't updated to reflect the change, leading to a failed
assertion observed under the following conditions:

* PV dom0
* Debug build (debug=y) of Xen
* There is an SR-IOV device in the system with one or more VFs enabled
* Dom0 has loaded the driver for the VF and enabled MSI-X

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

In read_pci_mem_bar(), the VF obtains the pdev pointer for its
associated PF to access the vf_rlen array. This array is initialized in
pci_add_device() and doesn't change afterwards. Copy the array to the
pdev of the VF, and remove the troublesome call to pci_get_pdev().

Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Candidate for backport to 4.19

v1->v2:
* remove call to pci_get_pdev()
---
 xen/arch/x86/msi.c            | 23 ++++++++++-------------
 xen/drivers/passthrough/pci.c |  7 +++++++
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 0c97fbb3fc03..5b28fb19b78f 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -662,7 +662,8 @@ static int msi_capability_init(struct pci_dev *dev,
     return 0;
 }
 
-static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
+static u64 read_pci_mem_bar(struct pci_dev *pdev, u16 seg, u8 bus, u8 slot,
+                            u8 func, u8 bir, int vf)
 {
     u8 limit;
     u32 addr, base = PCI_BASE_ADDRESS_0;
@@ -670,19 +671,15 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
 
     if ( vf >= 0 )
     {
-        struct pci_dev *pdev = pci_get_pdev(NULL,
-                                            PCI_SBDF(seg, bus, slot, func));
+        pci_sbdf_t pf_sbdf = PCI_SBDF(seg, bus, slot, func);
         unsigned int pos;
         uint16_t ctrl, num_vf, offset, stride;
 
-        if ( !pdev )
-            return 0;
-
-        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
-        ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
-        num_vf = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
-        offset = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET);
-        stride = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE);
+        pos = pci_find_ext_capability(pf_sbdf, PCI_EXT_CAP_ID_SRIOV);
+        ctrl = pci_conf_read16(pf_sbdf, pos + PCI_SRIOV_CTRL);
+        num_vf = pci_conf_read16(pf_sbdf, pos + PCI_SRIOV_NUM_VF);
+        offset = pci_conf_read16(pf_sbdf, pos + PCI_SRIOV_VF_OFFSET);
+        stride = pci_conf_read16(pf_sbdf, pos + PCI_SRIOV_VF_STRIDE);
 
         if ( !pos ||
              !(ctrl & PCI_SRIOV_CTRL_VFE) ||
@@ -829,7 +826,7 @@ static int msix_capability_init(struct pci_dev *dev,
             vf = dev->sbdf.bdf;
         }
 
-        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        table_paddr = read_pci_mem_bar(dev, seg, pbus, pslot, pfunc, bir, vf);
         WARN_ON(msi && msi->table_base != table_paddr);
         if ( !table_paddr )
         {
@@ -852,7 +849,7 @@ static int msix_capability_init(struct pci_dev *dev,
 
         pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
         bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
-        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        pba_paddr = read_pci_mem_bar(dev, seg, pbus, pslot, pfunc, bir, vf);
         WARN_ON(!pba_paddr);
         pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 5a446d3dcee0..3a6a6abe205e 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -654,6 +654,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     const char *type;
     int ret;
     bool pf_is_extfn = false;
+    uint64_t vf_rlen[6] = { 0 };
 
     if ( !info )
         type = "device";
@@ -664,7 +665,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                             PCI_SBDF(seg, info->physfn.bus,
                                      info->physfn.devfn));
         if ( pdev )
+        {
             pf_is_extfn = pdev->info.is_extfn;
+            memcpy(vf_rlen, pdev->vf_rlen, sizeof(pdev->vf_rlen));
+        }
         pcidevs_unlock();
         if ( !pdev )
             pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
@@ -700,7 +704,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
          * extended function.
          */
         if ( pdev->info.is_virtfn )
+        {
             pdev->info.is_extfn = pf_is_extfn;
+            memcpy(pdev->vf_rlen, vf_rlen, sizeof(pdev->vf_rlen));
+        }
     }
 
     if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )

base-commit: 6b9b96ddebf269579730ff2a65f324505bc2aba9
-- 
2.46.0


