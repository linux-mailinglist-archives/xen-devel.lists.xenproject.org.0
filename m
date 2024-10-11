Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A899A7A2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 17:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817227.1231330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHYi-00088x-3L; Fri, 11 Oct 2024 15:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817227.1231330; Fri, 11 Oct 2024 15:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHYh-00086N-VG; Fri, 11 Oct 2024 15:28:03 +0000
Received: by outflank-mailman (input) for mailman id 817227;
 Fri, 11 Oct 2024 15:28:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I9YX=RH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1szHYg-0007SS-BX
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 15:28:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 660d22e1-87e5-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 17:28:01 +0200 (CEST)
Received: from BL1PR13CA0263.namprd13.prod.outlook.com (2603:10b6:208:2ba::28)
 by PH7PR12MB6955.namprd12.prod.outlook.com (2603:10b6:510:1b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 15:27:57 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::54) by BL1PR13CA0263.outlook.office365.com
 (2603:10b6:208:2ba::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.12 via Frontend
 Transport; Fri, 11 Oct 2024 15:27:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 15:27:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 10:27:55 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 10:27:54 -0500
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
X-Inumbo-ID: 660d22e1-87e5-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwyIC8+3adm599ynvdRaYap1uzZK6fVFCY/ENpRkwuJJkUSBtdwhadjrxhLJCF/IGEOxuLuA0CdKvQ1+iqM1A4EpxX4SHCG/fVPifyTPv7qAY3lOxBPLrjOSJGrvyjyDMLotefYOCJFJIx6oZeIvW/w/FFkhBpJ4ZOfSaCklTRoiuUjIBorJIINVPrYOx9qr5Hn73xqQll27hB9QIJAMqtvgPrI2LP7C1eQrhr2i8SdXymfucZhHFyqgzWdNCf0epTogenSGmBArEvoLhzdfz8AKzvqHH2/Xd42vYybmFkDzvL4hlwU9fSg5YdGw8ad8jJFJ7oC5r0qS5iTptCp8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoaEQUmZyPk/7lddPfXAooR8DtejrJ8pV0FXtQo30ts=;
 b=TTeE0mfofZhndQAj3DuR4GcsgcBHjkeL0QXIQ/gWZNj5p7kheOj4tszI4tnfxeJy0tvMCJdm/K77RtvqP0on81WLH7bUxvZb3qNXximTZVkr4rhoNGi/CvH+9UR1cHALxvjCyNRDmj3XaOOxSPEjG+aiNoMsbI5ZnJ13kpDn5yBlXKgDkFXEpw/Nesd9OYhxtE3nXGN5wSHISIJYcAC32+BdJR3J86/soeVhjLvkifOdeLlKHACaJNTfNvCm/q6+14bZuSQxQEyhU8MnfvqXc8ceCgS7yjguNsJaV6t+uac+14/I33zUDBCadnqWIYzIu8RuGEuwdcPUUh1470YI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoaEQUmZyPk/7lddPfXAooR8DtejrJ8pV0FXtQo30ts=;
 b=ASzh3HtiwofGi0mVNp3ZEFarWgicRpayCdmO7IojO4tgzOa42n5HfFGKNWCcd/1RhfnG67goX0tfvlvU5DAFSAC303H6CMHl+UoG2LE6XEX7FBVQ7vSSP0fRlvTMpm6NNZQbfNxV0Pmp+31EhzjeKdo7EOcX9CbslSNdSxemPi8=
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
Subject: [PATCH v5 3/3] x86/msi: fix locking for SR-IOV devices
Date: Fri, 11 Oct 2024 11:27:08 -0400
Message-ID: <20241011152727.366770-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011152727.366770-1-stewart.hildebrand@amd.com>
References: <20241011152727.366770-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|PH7PR12MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 087b2fa2-2eaf-485e-02a3-08dcea0947b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bGIMa8YoU+u/7eiEe75cVEqeB/NEZQ83Uh30EzkNI0vyjDBzVbwbRLlyIPj+?=
 =?us-ascii?Q?cn109ayVPkOc4NV0FzGf0qYXw2Ivp8Vo0LEF4ywuyzddcn9g7BhfyFHTyaEX?=
 =?us-ascii?Q?gNPWcpmNuKZeYxiRugOpzSNshiEfAOkZuGzEiS0hRAadPqeayd77JztTIq8E?=
 =?us-ascii?Q?Pz8+QvZqTsAj7adIqbGUhrv4aksKG+LP/i6Zv3wLxQtGVhBq4qhX1MFy2uUl?=
 =?us-ascii?Q?Cz1EOG2RddJBZl6k067O0IR9PJ2NvJVuW+E271rRtfYKR9mkmPn/hCEYn0YM?=
 =?us-ascii?Q?DPwSCvHyhEOAXq40dhCdhnaQHw6ymFGH84hrvQS0HNswmRcD2Hm2IudGsSw3?=
 =?us-ascii?Q?TDBZsTBxBX3Bccw6Pe6w4hPRblprh5zSAlOHTeyTjbhP4XNhNXtDN2+hGS8M?=
 =?us-ascii?Q?dgPKhr3jhWkUHmKe2ntf2c4Bm394pYY8bzuhBc6s2t7Z/r4Yp1S/lkDqrqQj?=
 =?us-ascii?Q?cGoQw0Q4i96MROw7aK9Na3Vi441XVcGX0Ue10p2FYggPOx3VNyLszZd90rkJ?=
 =?us-ascii?Q?SPMW1Mw+LxPxYHK3RVZ8loElFUR/8AjrUTzH420I5hvN4LK3Ib3R5jTZwAWw?=
 =?us-ascii?Q?E9zosvJfQnVSOe6JtNw9QEQ5jFuXstQ5z0Ovm83FmA8aqz4DQc14OullUs5s?=
 =?us-ascii?Q?q8r12JSwzbP28aY7BYC7kFzprHzk5SxMBzCBkp4llVW338ctSQMUdSHM07qm?=
 =?us-ascii?Q?h3xlt2RuRgnIihuU5J4FG4WUPGfbeAZp2/s5eDYz/11anO0eYKXMI0JK+MK/?=
 =?us-ascii?Q?3T0IJlIPl66WnxdtG3yUl67s/IqflsiowNxu5aPhR00VI2wy7czjcP8oXckC?=
 =?us-ascii?Q?LGolulpaTN+s+QJbzk9bWeYf3m9gV3kzO8E/2tklBPB3tZ2fc0WaxnaNgcY3?=
 =?us-ascii?Q?cvC9EgktFWujJuiZNlj//X0lkhl99fyxPqPVu+0e7vZ0GcFJygvcfFKLV6CD?=
 =?us-ascii?Q?ntV8KRkeQ1LUc3zCwVjgSTW/r6Z9LzBW/ULltYXSwWreKQjKV+8fWLZldvfz?=
 =?us-ascii?Q?v/pbgVJ1+Fwj6DI42NsTYhHbPeehLwYdH04laxwbt/+3BH0bCXYe8sy5qmMe?=
 =?us-ascii?Q?GpiIaELoZWVfDfoAtXtg3AtmM3UKrOLofxny5cvgrVLNjyNzinpXjtq1BQjP?=
 =?us-ascii?Q?Te/A9L3umY5EdBHZAIfKmNK/jNFb0Nh9UgPXTWJX3OZFeRzRM+1yN5yNy9A7?=
 =?us-ascii?Q?ey0lZIWHhVkykfhdfydTU2/gQbydEZDi0IVYJIlCSpH22e5yglACOF3lNadj?=
 =?us-ascii?Q?XcE4Bj6AfMyh2BPnW8y+aqP6XOS3H0wkw+EbCwELOVXNnpt41OrSZ2nJm9yl?=
 =?us-ascii?Q?Unw5B+Eq0kdZJj1aSFGj8j/7sDFAZsJqMOyCGpzmF2tSVHI+7qVjqdv4ZHAk?=
 =?us-ascii?Q?OSzEVWceHAGeyNZrfG6DNX0aE9mf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:27:55.7662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 087b2fa2-2eaf-485e-02a3-08dcea0947b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6955

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
---
Candidate for backport to 4.19
Patch #2 ("xen/pci: introduce PF<->VF links") is pre-requisite

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
 xen/arch/x86/msi.c            | 37 ++++++++++++++++++++++-------------
 xen/drivers/passthrough/pci.c |  8 +++++---
 xen/include/xen/pci.h         | 15 +++++++++-----
 3 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index fbb07fe821b5..254a403dfb51 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -662,34 +662,35 @@ static int msi_capability_init(struct pci_dev *dev,
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
+        if ( !pf_info )
             return 0;
 
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
@@ -703,8 +704,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
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
@@ -813,6 +814,7 @@ static int msix_capability_init(struct pci_dev *dev,
         int vf;
         paddr_t pba_paddr;
         unsigned int pba_offset;
+        const struct pf_info *pf_info;
 
         if ( !dev->info.is_virtfn )
         {
@@ -820,6 +822,7 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = slot;
             pfunc = func;
             vf = -1;
+            pf_info = NULL;
         }
         else
         {
@@ -827,9 +830,14 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = PCI_SLOT(dev->info.physfn.devfn);
             pfunc = PCI_FUNC(dev->info.physfn.devfn);
             vf = dev->sbdf.bdf;
+            if ( dev->virtfn.pf_pdev )
+                pf_info = &dev->virtfn.pf_pdev->physfn;
+            else
+                pf_info = NULL;
         }
 
-        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        table_paddr = read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc), bir,
+                                       vf, pf_info);
         WARN_ON(msi && msi->table_base != table_paddr);
         if ( !table_paddr )
         {
@@ -852,7 +860,8 @@ static int msix_capability_init(struct pci_dev *dev,
 
         pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
         bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
-        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        pba_paddr = read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc), bir, vf,
+                                     pf_info);
         WARN_ON(!pba_paddr);
         pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 95a8ed850efd..8209efdebecf 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -736,7 +736,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         }
     }
 
-    if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
+    if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
     {
         unsigned int pos = pci_find_ext_capability(pdev->sbdf,
                                                    PCI_EXT_CAP_ID_SRIOV);
@@ -748,7 +748,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         {
             unsigned int i;
 
-            BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
+            BUILD_BUG_ON(ARRAY_SIZE(pdev->physfn.vf_rlen) !=
+                                    PCI_SRIOV_NUM_BARS);
+
             for ( i = 0; i < PCI_SRIOV_NUM_BARS; )
             {
                 unsigned int idx = pos + PCI_SRIOV_BAR + i * 4;
@@ -763,7 +765,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                     continue;
                 }
                 ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
-                                       &pdev->vf_rlen[i],
+                                       &pdev->physfn.vf_rlen[i],
                                        PCI_BAR_VF |
                                        ((i == PCI_SRIOV_NUM_BARS - 1) ?
                                         PCI_BAR_LAST : 0));
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index f9435b7f4eb9..12f1c599e467 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -156,11 +156,16 @@ struct pci_dev {
      * List entry if info.is_virtfn == true
      */
     struct list_head vf_list;
-    u64 vf_rlen[6];
-    struct {
-        /* Only populated for VFs (info.is_virtfn == true) */
-        const struct pci_dev *pf_pdev;        /* Link from VF to PF */
-    } virtfn;
+    union {
+        struct pf_info {
+            /* Only populated for PFs (info.is_virtfn == false) */
+            uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
+        } physfn;
+        struct {
+            /* Only populated for VFs (info.is_virtfn == true) */
+            const struct pci_dev *pf_pdev;        /* Link from VF to PF */
+        } virtfn;
+    };
 
     /* Data for vPCI. */
     struct vpci *vpci;
-- 
2.47.0


