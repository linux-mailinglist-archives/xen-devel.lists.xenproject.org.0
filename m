Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58BA9A4844
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 22:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822152.1236142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1tlF-0001vg-SQ; Fri, 18 Oct 2024 20:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822152.1236142; Fri, 18 Oct 2024 20:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1tlF-0001u9-P0; Fri, 18 Oct 2024 20:39:49 +0000
Received: by outflank-mailman (input) for mailman id 822152;
 Fri, 18 Oct 2024 20:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiWJ=RO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t1tlE-0001Cl-CZ
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 20:39:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2415::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c11bab8-8d91-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 22:39:46 +0200 (CEST)
Received: from SJ0PR13CA0217.namprd13.prod.outlook.com (2603:10b6:a03:2c1::12)
 by MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Fri, 18 Oct
 2024 20:39:40 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::fc) by SJ0PR13CA0217.outlook.office365.com
 (2603:10b6:a03:2c1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.8 via Frontend
 Transport; Fri, 18 Oct 2024 20:39:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 20:39:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 15:39:39 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Oct 2024 15:39:38 -0500
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
X-Inumbo-ID: 1c11bab8-8d91-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHxmXdiw5IU7oEfNP0HaZXGgUZId99mv4mG3SeZCS2GgBPUynfPwoUGS7BVFpFgSvV6no9aVFdQxlTSTWN/WhmI2kuJXf2E0NzvaDO5AY05hLNRuysAgyukOv/s0rdPsC8N1H9OTHSgt2VpYBZvjRTmOJXFkGIRdJdeGPpMQld8AyqQYpeO3sYaO/V/8OaD3XmxtD7XqnoAH0qLZ7Phah+N1PKeTgJ552rdASgOMo4oGE+plqNDVvim39xGLMLmxmqro6l/qhw7EnlmhttfKRPWfXj082Y3iKb37ygh26W2nZpdnx6ntiN+I2cEfaR273obH7Btv7GNzelf88wnHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYAsN6CZPwERab7Ma9P37546OYVBrhDtCRKV6N+OMD0=;
 b=wpZcka6lRPbwqkN1O7JFMWLQvhXi0u2dukNDCTzFcufw3LOh0jivqV4KQSNLzScDgtKrRisKHSWFc2Xa18yjblrONvd6ZkPTzZy5EhvG4HRSMIDp067VW208/o1a6Z4aOnU7KQudQ1eq2rR3g1bvQIYLHuS18RuzeA9RZiYAGEodTOdF2Ixd9HeXqt4vIvy21+yu83Gkz1yOnBVqyxAR4eb0OreCGpuA9hYg9trU0NKbPQCzC4MO0ioQ4S8BjKlaWpydmqFPUIjbfAjEZYR2aGbVRFzVrK6eXZoW0cEtZy+sZS2wqiF5bFtxE1zN9gFqSk3lPCxFNpORHpFj0Vn19w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYAsN6CZPwERab7Ma9P37546OYVBrhDtCRKV6N+OMD0=;
 b=qJrLA6fbYJXB5DF5u5hmqnMjzO7t7L5UqsP7FbZGVktZbEeAK8TyvOx51r7Eno3D0PvbMD1HF9dat1MMT/Gv/zy/w0yBKU/uBPePMNfsY+20T5f8brxa/hSzbGvfduom2OJo4ljUWF0//mZwwAcQa7ldK10NW4yShlUrsJMiVsE=
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
Subject: [PATCH v6 3/3] x86/msi: fix locking for SR-IOV devices
Date: Fri, 18 Oct 2024 16:39:10 -0400
Message-ID: <20241018203913.1162962-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|MW4PR12MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: 2694bcef-708d-4ff1-2a94-08dcefb4fd85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oe5+MRPL6/ZqUvsviAbciql0oRQEzSLi3j3jH7CLofKauSjF+Ah6WujdgLst?=
 =?us-ascii?Q?V3xKwshuT0KFfBx3t2BVFT03aTimJr5n9rQDDciv+sjQhFYlpv4XqChLV5yb?=
 =?us-ascii?Q?Lg3hFO2SU1oEtCjIWDjPKfYsxWZRY82tOjaxQ6eIWBirURE4j/XF/RTYUUY7?=
 =?us-ascii?Q?LfGqorhgKIKkXIzmoBhaQM05nrmrCfjRq4FbebNb4brZD7gXsvyFNq1+wjHJ?=
 =?us-ascii?Q?D2VvHxMAS1ZPI9o0uDdJ9TsjoCESDnPBI8kQV/IQ+p3zYSPqvW6dQH2HUJjK?=
 =?us-ascii?Q?gupL7xTwPLVqcZlMeVJZFS3HOuIB+DRQQkuedhu89t8w0Y3bf7nMoABub79G?=
 =?us-ascii?Q?yNdaFN11lmvfoKz9YxicrHNQvKvf1EDjP9fpHsEwJPql9s6eQVRGva8NEASC?=
 =?us-ascii?Q?2rhw0Y9Ci0C4Fu6kECh7HOz1IV7Zntiwa8S6VxXPbdNIzBMhHWdGg4oUSPGn?=
 =?us-ascii?Q?vyBkNioH+d94O6Dge4aoQqa8Vtl6HZt5wBbQobs9a76bQziSTHo5vt0l3Ji3?=
 =?us-ascii?Q?Z9p0kiRcLsnkHM3TyIMMEGp3UwXCuT4vcT4aGNs3B7Mm14HsYVfBenZav6Vg?=
 =?us-ascii?Q?9EZd7FnxzDYgS/JTjOP5L1cSRNdOHLpgt2y04ZjPPlAM5/60jUQKtxv30IQf?=
 =?us-ascii?Q?CVvIrffLi13YWEZBne5dvWuupHQgHH691vXmTp2uV6KBZfC9jj8veJ7m9kVZ?=
 =?us-ascii?Q?xbJOox1vziSNRggzEikYvv8FHufR0l/rh1XkdtmdV4OFBmSI3Dtcr40XG5CX?=
 =?us-ascii?Q?9wVtm8M8eC+VMojfhavFfVmQ//XHjXZjaaaqOGj+Uk7OivwD6/82xqz6ottu?=
 =?us-ascii?Q?rEcLDHdJBOcHz4BBzURoDc/VsNxNLbGbYuerjCZCbk5ujqQkfDa0xecNqZr2?=
 =?us-ascii?Q?566Ox8B3MGL6ClBV0Abq9W3dmAnF5ePMeEPqceYLLL6Rv6Op3d2sljr5R2r+?=
 =?us-ascii?Q?egoebmWZt6WJTc34ITj3OqLhNehHlSTdORv/0ZlcUTV4uCFdFsjEXdnbFtfR?=
 =?us-ascii?Q?RCf+449sgkonIyXrHWR7coMjuOoKQm5leyetGlETM6bKBOaaYBJYNsCPBdVv?=
 =?us-ascii?Q?VYYP5bl0ybvppkzNIHAtUe2bJfKzc8XHzDZwgts9kElGd+nqf4GroFje4ST2?=
 =?us-ascii?Q?d0PT7pi3AEVZ/yahhDOzeVTr+KEBLQh6zlYYLBYuKyYKPEGYSovHj2w74igT?=
 =?us-ascii?Q?gf+pj6B7nC7XTq2deYuHWX3WoGCNxuZ0VgzcZjm63m03yHPvJICCKUOmjjdI?=
 =?us-ascii?Q?NiSG9cGa3V2s+tXqtxHIbfqeDquVymKJPUmG1yl9GHjnCwdgkUiQONlGWUnm?=
 =?us-ascii?Q?805th9Hxl0v/ZGgMb3pCyRZ20gW0xyuWPAUGMoA4iiu0LGkGh46FqDLJ8Vec?=
 =?us-ascii?Q?Tai2v1huY0JK6hwVByTOEQywKhvoaTta1Z3BpMkSI4eLLe/eNw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 20:39:40.4876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2694bcef-708d-4ff1-2a94-08dcefb4fd85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667

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
Patch #2 ("xen/pci: introduce PF<->VF links") is pre-requisite

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
 xen/arch/x86/msi.c            | 37 ++++++++++++++++++++++-------------
 xen/drivers/passthrough/pci.c |  8 +++++---
 xen/include/xen/pci.h         | 15 +++++++++-----
 3 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5e24df7be0c0..79fff9de4305 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -660,34 +660,35 @@ static int msi_capability_init(struct pci_dev *dev,
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
@@ -701,8 +702,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
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
@@ -811,6 +812,7 @@ static int msix_capability_init(struct pci_dev *dev,
         int vf;
         paddr_t pba_paddr;
         unsigned int pba_offset;
+        const struct pf_info *pf_info;
 
         if ( !dev->info.is_virtfn )
         {
@@ -818,6 +820,7 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = slot;
             pfunc = func;
             vf = -1;
+            pf_info = NULL;
         }
         else
         {
@@ -825,9 +828,14 @@ static int msix_capability_init(struct pci_dev *dev,
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
@@ -850,7 +858,8 @@ static int msix_capability_init(struct pci_dev *dev,
 
         pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
         bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
-        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        pba_paddr = read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc), bir, vf,
+                                     pf_info);
         WARN_ON(!pba_paddr);
         pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index fe31255b1207..9182723ece1b 100644
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
index 2ea168d5f914..e961a3c66799 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -159,11 +159,16 @@ struct pci_dev {
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


