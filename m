Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023C49CF11A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 17:09:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837780.1253691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByt6-0002Xg-TR; Fri, 15 Nov 2024 16:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837780.1253691; Fri, 15 Nov 2024 16:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByt6-0002UB-PS; Fri, 15 Nov 2024 16:09:36 +0000
Received: by outflank-mailman (input) for mailman id 837780;
 Fri, 15 Nov 2024 16:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHts=SK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tByt4-0001uN-U3
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 16:09:35 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2416::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feca6756-a36b-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 17:09:32 +0100 (CET)
Received: from PH8PR07CA0035.namprd07.prod.outlook.com (2603:10b6:510:2cf::22)
 by SA3PR12MB9179.namprd12.prod.outlook.com (2603:10b6:806:3a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 16:09:25 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::5d) by PH8PR07CA0035.outlook.office365.com
 (2603:10b6:510:2cf::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 16:09:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 16:09:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 10:09:21 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 10:09:20 -0600
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
X-Inumbo-ID: feca6756-a36b-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjJjIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImZlY2E2NzU2LWEzNmItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjg2OTcyLjE5MjQ2OCwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAiXlm31YZH7uhosGjn+dZbcA/39X+vTk25+UA7ioXKsYS49bIxYpzV9aKhGT90OpxKV+4CFIyIRTCJq0KsUTV/mEkkqEwj6CjKtnUWL9jwZBx9OqtTZLpNzpLg5+lAwSw0f0fXwkFaH3qbH8ecwzyh1gbnvmI6WIbzYtEembFnwewDFnmU/gljqyQ3ZXTk9cx2udBxGN3jw0VvbHzi4m+t76UhlBwe5hDIZ97fjD47Jf5OmVXvrv0w9i63J+QbckAILc006SGtaOPPYzANR6ieGKmGDVg8UT8qeGgQUhJiLug82wH5lTMOjtIaShFuO2w/uDwkTjG402kX0w3iWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc/5DRjqwA6xYxjlvFn4FWVgoiHtyGlzz0R5Ezc9BLU=;
 b=psgN8ZWsIkMtfJAyA25Qn4y5nRNCg+29oVQ5Z6+zZLJ1/dO2hrWZhRMUNfbRXCmXOC+UL0QFCyFXfJh2RN8PiVSy91KUh8533NoLeaqXhBlo8GZ3Jqu+2TxFIZFwU6Yhqpr1jKNh9kafzYIH4gI/ZnkL5+Ky7EPtNdsTNtziVEJdOh4puBs6AytubLFK4/tX7ZFs0jUE6+MXXOm6CpPc8mFN4bw2zwGCx0p2d5YILxmfv5AxaN0e6xUek8j68a9pgXx1LT9A3JTy31edHlMy9M1DWNbJjx99RCj//bfnpYxGrsUXKJ3iTc08nKfvQPox2eMt3/1vsc29itTy0mi1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc/5DRjqwA6xYxjlvFn4FWVgoiHtyGlzz0R5Ezc9BLU=;
 b=hYg0pUmxOg1AGQYnptiNOoNpQfVvo6y5vNRdAryYs+Ut/dPutiBEpocxvgGwUoDRx/rl949nuuobp8IQ6LKi2D6rz0qvpyaNghb4Tq7HZJAVuqIAMH3Wq2NUBcFV2jyiTKHtUNLDKpFjokabW7KOPlyFGbiIaDKhkmKUck0TUXA=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v8 2/3] x86/msi: fix locking for SR-IOV devices
Date: Fri, 15 Nov 2024 11:09:03 -0500
Message-ID: <20241115160905.551224-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115160905.551224-1-stewart.hildebrand@amd.com>
References: <20241115160905.551224-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|SA3PR12MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: ae102f74-b2c1-4093-9fab-08dd058fde9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CubGn6RcsopyhL1Yor2h03Bh11s6+4lar56+TdvJftFTOSAckCLCIDRkAmxy?=
 =?us-ascii?Q?J5nUXbQIVeoubZqM0Zo+Fel7dRb0ptXCQX2QMI4t9iLuT5APNh3KpQNMBsOW?=
 =?us-ascii?Q?me1j7FnCM225gq+EXdtHk30i6+CVzBYS7p9skVuned67tnX2iCz6Ru5PDr1E?=
 =?us-ascii?Q?uqj2Uz8zYJ781X3eZaxa2LzZlxYsXVXK0SbRum/MZWEuIDEV4vZZL/5ZLnDi?=
 =?us-ascii?Q?dCLZhd/aqHZSoUOzZV3S/1bvOHQU7aCpkqwhjPe8l6ds7VhBC7aZfTVWIm4R?=
 =?us-ascii?Q?sMu0F4Y4ETDGTQWKAxJxM58a4zsUO6QFqD58ILbqinhyM1zCn7FiXvMmNzjG?=
 =?us-ascii?Q?WXQZPx6d9EGfcYAmTFYJPu84sdWJCfsO9voqPb0IgrnZKRBxG02hV7xTP8+Y?=
 =?us-ascii?Q?wILVUbpuN/I9l7s6eUTIAztC4/plAEy/zqZIeuhsJNol0Hy4f47c0tjm/EEh?=
 =?us-ascii?Q?aEg0MZhT3IFLiht8uldMtx2+EelfDq17XUZqPM+8xiGg/wma0tSbdtmN15dn?=
 =?us-ascii?Q?ckxyGymHEaJhh7n7tpbeE0czTCEUw2dadG+S3YKwk3c57u1bpHCRfLC/VoSv?=
 =?us-ascii?Q?0K+lcs0eeNlJ4JkPh0wCyA2hYvXO+TNkQSQAU6hUCbm8ERUBxzmi4j7iCONI?=
 =?us-ascii?Q?WrEMdf3rVlRrX9gqTNMbKufQtmpCC5kjCoNFHyQ8nFBjKyuVBLOvfXiN/8eA?=
 =?us-ascii?Q?OBTuQq8RGMgUkTLoCStIqXS5OPUSCaekGWwPnXGXO9yzJvSeaovosrjeUljL?=
 =?us-ascii?Q?X6HndrFuMAl4+WnEKxp2+SQWmpPj/QupPQdNHhpe0rvcwQPGtu34CJb7seB0?=
 =?us-ascii?Q?q0aG3+Ui/imLZ+hVMBBf78R5GDQn9dmYxZPT4aZ7tidm+G0ZCZX9s/nECk7z?=
 =?us-ascii?Q?u5OqCYlovWcUTE/tI7aHPo3i51+906wx7VTLEeQCg6MmA99RSUn2meg9Cykm?=
 =?us-ascii?Q?XnMxpDrbmS5ItvfvU2Apbqz0FyexwJY65QvoLMJpeJJjiUpFDTHyKqJrr8yF?=
 =?us-ascii?Q?CE9SEsEWVz8J4EzoRfxTVIcLmtlpqzk0uKlYf50HKmZeEaS6D0XRgrI1SKet?=
 =?us-ascii?Q?edu22+/qk+20+3Im6UCnnar8OasgCn+FO4WXXZMgMZ3gkjSFbLSC4U0ZRctg?=
 =?us-ascii?Q?XYV/jq/Br0t0zNtU0GMZ5gX2aOTdxSBKewjMiz7zsPg/FNRhuuCsbfygnJ53?=
 =?us-ascii?Q?XVTnYIgSh3aUeYyn4lzrctyq0ocKrmthC7tnWtUXPazNPanZlJXye1IDy0Or?=
 =?us-ascii?Q?d3xV6gSZBwMJ40qfb04QyhZX2SUn5fc/xjbUd1rWoS9TdgXgDPedPQHuJpCT?=
 =?us-ascii?Q?pPKXAW60SU+ClBrOUtAQb66Wx0Qg/mkTc9d3F8vQDfRRJdCD4ah2xPGJxYbf?=
 =?us-ascii?Q?OSLfkzakGlvHPjZ/nCpfkgz1jEj08V0HveIo9kRVvLLwmmn2fw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 16:09:22.8965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae102f74-b2c1-4093-9fab-08dd058fde9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9179

In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
structure") a lock was moved from allocate_and_map_msi_pirq() to the
caller and changed from pcidevs_lock() to read_lock(&d->pci_lock).
However, one call path wasn't updated to reflect the change, leading to
a failed assertion observed under the following conditions:

* PV dom0
* Debug build (CONFIG_DEBUG=y) of Xen
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

In read_pci_mem_bar(), the VF obtains the struct pci_dev pointer for its
associated PF to access the vf_rlen array. This array is initialized in
pci_add_device() and is only populated in the associated PF's struct
pci_dev.

Access the vf_rlen array via the link to the PF, and remove the
troublesome call to pci_get_pdev().

Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Candidate for backport to 4.19
Patch #1 ("xen/pci: introduce PF<->VF links") is pre-requisite

v7->v8:
* no change

v6->v7:
* turn NULL-check into ASSERT
* adjust commentary in struct pf_info

v5->v6:
* add Jan's R-b

v4->v5:
* split the PF<->VF links to a pre-requisite patch
* pass pci_sbdf_t to read_pci_mem_bar()
* use stdint.h types on changed lines
* re-add NULL check for pf_info in read_pci_mem_bar(), as pf_info could
  be NULL

v3->v4:
* handle case when PF is removed with VFs enabled, then re-added with
  VFs disabled

v2->v3:
* link from VF to PF's struct pci_dev *

v1->v2:
* remove call to pci_get_pdev()
---
 xen/arch/x86/msi.c            | 36 ++++++++++++++++++++---------------
 xen/drivers/passthrough/pci.c |  8 +++++---
 xen/include/xen/pci.h         | 11 ++++++++---
 3 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index fa724911928e..e2360579deda 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -663,34 +663,34 @@ static int msi_capability_init(struct pci_dev *dev,
     return 0;
 }
 
-static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
+static uint64_t read_pci_mem_bar(pci_sbdf_t sbdf, uint8_t bir, int vf,
+                                 const struct pf_info *pf_info)
 {
+    uint16_t seg = sbdf.seg;
+    uint8_t bus = sbdf.bus, slot = sbdf.dev, func = sbdf.fn;
     u8 limit;
     u32 addr, base = PCI_BASE_ADDRESS_0;
     u64 disp = 0;
 
     if ( vf >= 0 )
     {
-        struct pci_dev *pdev = pci_get_pdev(NULL,
-                                            PCI_SBDF(seg, bus, slot, func));
         unsigned int pos;
         uint16_t ctrl, num_vf, offset, stride;
 
-        if ( !pdev )
-            return 0;
+        ASSERT(pf_info);
 
-        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
-        ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
-        num_vf = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
-        offset = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET);
-        stride = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE);
+        pos = pci_find_ext_capability(sbdf, PCI_EXT_CAP_ID_SRIOV);
+        ctrl = pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);
+        num_vf = pci_conf_read16(sbdf, pos + PCI_SRIOV_NUM_VF);
+        offset = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_OFFSET);
+        stride = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_STRIDE);
 
         if ( !pos ||
              !(ctrl & PCI_SRIOV_CTRL_VFE) ||
              !(ctrl & PCI_SRIOV_CTRL_MSE) ||
              !num_vf || !offset || (num_vf > 1 && !stride) ||
              bir >= PCI_SRIOV_NUM_BARS ||
-             !pdev->vf_rlen[bir] )
+             !pf_info->vf_rlen[bir] )
             return 0;
         base = pos + PCI_SRIOV_BAR;
         vf -= PCI_BDF(bus, slot, func) + offset;
@@ -704,8 +704,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
         }
         if ( vf >= num_vf )
             return 0;
-        BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
-        disp = vf * pdev->vf_rlen[bir];
+        BUILD_BUG_ON(ARRAY_SIZE(pf_info->vf_rlen) != PCI_SRIOV_NUM_BARS);
+        disp = vf * pf_info->vf_rlen[bir];
         limit = PCI_SRIOV_NUM_BARS;
     }
     else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
@@ -814,6 +814,7 @@ static int msix_capability_init(struct pci_dev *dev,
         int vf;
         paddr_t pba_paddr;
         unsigned int pba_offset;
+        const struct pf_info *pf_info;
 
         if ( !dev->info.is_virtfn )
         {
@@ -821,6 +822,7 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = slot;
             pfunc = func;
             vf = -1;
+            pf_info = NULL;
         }
         else
         {
@@ -828,9 +830,12 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = PCI_SLOT(dev->info.physfn.devfn);
             pfunc = PCI_FUNC(dev->info.physfn.devfn);
             vf = dev->sbdf.bdf;
+            ASSERT(dev->pf_pdev);
+            pf_info = &dev->pf_pdev->physfn;
         }
 
-        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        table_paddr = read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc), bir,
+                                       vf, pf_info);
         WARN_ON(msi && msi->table_base != table_paddr);
         if ( !table_paddr )
         {
@@ -853,7 +858,8 @@ static int msix_capability_init(struct pci_dev *dev,
 
         pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
         bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
-        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        pba_paddr = read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc), bir, vf,
+                                     pf_info);
         WARN_ON(!pba_paddr);
         pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3fe2e7884f45..6af1136b6350 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -735,7 +735,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         }
     }
 
-    if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
+    if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
     {
         unsigned int pos = pci_find_ext_capability(pdev->sbdf,
                                                    PCI_EXT_CAP_ID_SRIOV);
@@ -747,7 +747,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         {
             unsigned int i;
 
-            BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
+            BUILD_BUG_ON(ARRAY_SIZE(pdev->physfn.vf_rlen) !=
+                                    PCI_SRIOV_NUM_BARS);
+
             for ( i = 0; i < PCI_SRIOV_NUM_BARS; )
             {
                 unsigned int idx = pos + PCI_SRIOV_BAR + i * 4;
@@ -762,7 +764,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                     continue;
                 }
                 ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
-                                       &pdev->vf_rlen[i],
+                                       &pdev->physfn.vf_rlen[i],
                                        PCI_BAR_VF |
                                        ((i == PCI_SRIOV_NUM_BARS - 1) ?
                                         PCI_BAR_LAST : 0));
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 977c0d08f78a..f784e9116059 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -159,9 +159,14 @@ struct pci_dev {
      * List entry if VF.
      */
     struct list_head vf_list;
-    u64 vf_rlen[6];
-    /* Link from VF to PF. Only populated for VFs. */
-    const struct pci_dev *pf_pdev;
+    union {
+        struct pf_info {
+            /* Only populated for PFs. */
+            uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
+        } physfn;
+        /* Link from VF to PF. Only populated for VFs. */
+        const struct pci_dev *pf_pdev;
+    };
 
     /* Data for vPCI. */
     struct vpci *vpci;
-- 
2.47.0


