Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0479394F858
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 22:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775753.1185936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdbpe-000797-Mx; Mon, 12 Aug 2024 20:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775753.1185936; Mon, 12 Aug 2024 20:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdbpe-00076G-Jz; Mon, 12 Aug 2024 20:39:58 +0000
Received: by outflank-mailman (input) for mailman id 775753;
 Mon, 12 Aug 2024 20:39:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WK61=PL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sdbpd-00076A-DV
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 20:39:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2414::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 074610f0-58eb-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 22:39:54 +0200 (CEST)
Received: from SN7P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::23)
 by SJ2PR12MB8012.namprd12.prod.outlook.com (2603:10b6:a03:4c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Mon, 12 Aug
 2024 20:39:49 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:123:cafe::c1) by SN7P220CA0018.outlook.office365.com
 (2603:10b6:806:123::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Mon, 12 Aug 2024 20:39:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 20:39:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 15:39:47 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 15:39:46 -0500
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
X-Inumbo-ID: 074610f0-58eb-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBa6hHVl6eylOhP+iv7lQl4BiKB8hN9QGmdblv6o/OFgtj4RAQex5fPPwEzCVG7Uos6maLWxuWfSdUXuMqlBVXO4r6x5P5wyQT9zWoKy8B61wNNJ1fQzAVdxEx5ISXR/z2OT4EfpmDu5n5sFk3PexUY3jKor1Ax4NYbRJ8PYnGw+/I8xcg2oBwETKO5b8W0KKTEaVeR26g0ObkU5LVceQyWsUBDfjHA6cRFYbAvhIxhtuNm1gMNqDabiweE9BRaYMTLq353Ny2P5WAl5E5YAiHOVERrpqhcLaptbTM2zXnooBjxYRfhhbg9J7vT12s1ysrPzGhzfjtw6/GM0m2w0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhOdXzqVyJvfvUeiucIa5BHdjzCCqp6qsxsfKPppPlk=;
 b=Tgn4+JGOlVKETpBAOU++y4Im2P4rDzoSHdiuQyssHYiRUMAvNehXml7G/g7cD6fnmIuxsyxxMRAsLn6yUo5lARQRTz+JnB1odoSZQuFQRL5e8nP46Y74Yu76rG+Kn19x8zSmBx8OU57jxgJKjHbDxxwW6g46C6gzV5DL/iJbyf/+DQ8TmnCc+IwJbZPXbeadGRol2H0Al89/ykxHO+6tM8UBYRvVEhASvkzxCcGyF3F4SrZWwe7eK9Tr0ek9KBbSPtoDRS/pLu2b2KF2fdP3GUvA9IIhRAbhvFFMKqhkR1UfzMBawf0JURNJF0nNOZJ8cpzkyY1nJ7PbGF2DJ/hfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhOdXzqVyJvfvUeiucIa5BHdjzCCqp6qsxsfKPppPlk=;
 b=zN8Ly/KvDx4VPi0S9z6tuA0dvdieIhTyY4ju5tsNJGX/3YXCarKJ5L5i+69oHH4UoAx5H8FQroetTerFY/+aXhZo5Ne+anNtF6p8rTzq95zvWVYhFWj3irjumDGScRteCT/bso9lx5dgJyR6PVJYbvr25s2oXHsjP9j+g9B0td0=
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
Subject: [PATCH v3] x86/msi: fix locking for SR-IOV devices
Date: Mon, 12 Aug 2024 16:39:09 -0400
Message-ID: <20240812203938.981588-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|SJ2PR12MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: e89596d8-1989-4418-8c9d-08dcbb0ee87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?up0cV/lXKLUEyqGLtajczwejqHHVL5lZXg93E3frzUKInUl6z7qHM/5Xnrss?=
 =?us-ascii?Q?Dkhp5x0o4E58WGk2s4tadOIwtXy8CiV+1XcKs3J+rxHZEAtwwWxDa3tHg6s0?=
 =?us-ascii?Q?Ag8U8GDA2BmA+WVwt87g2rAytEeytEWbR5dTcTR1anUux7vEWSWQD2tPiJx0?=
 =?us-ascii?Q?AZkfDq2+QzBq0pCVgyOvrhjtjTMUVZHq4V9chYvzJbgTx/t8RzmoUu4G9QvT?=
 =?us-ascii?Q?FgO0V4buwmm4wnUZchq54NSomzgKpz1C5NhnGWuipLlgia8jjTOsaTnYq020?=
 =?us-ascii?Q?Dxz3HF34GRytmet5v6lQp18/09ppp1d3xK2EfRUcix/KcK7PU1OFNAKgTS94?=
 =?us-ascii?Q?aZ5XUB7Ht2xxVPLu5b7hg7pViGfC6YY3r5scTHx9p/vWjgoRkwb9YT3HOUpJ?=
 =?us-ascii?Q?YNBnESrRa3G/Drc08tN83InFlTCIdrONbetIk0VbJ6cewtDqSWuGQsulluw9?=
 =?us-ascii?Q?TOInlSJbdkEjKNhZ6inisFzeMApPwO3yqfbK5Fedz7ONvn6st0yOkBWY62lg?=
 =?us-ascii?Q?/uHtauWxZHy88q3B6jYdMIhLFYREB9N25bbLKrSPOFT5NNsad4Cc2cB/iet6?=
 =?us-ascii?Q?YzNFwcnjwiTK+iYq+Mt/SLvnp3jjXH3sx0scMzVMjMjjVayalKYiHJse/1ov?=
 =?us-ascii?Q?WsaSwHM7Woo+X1dIXuHHw7NF/il2NZ/xB+usFmqfIeFEWT3qO+9ERpV4435R?=
 =?us-ascii?Q?7cNkHd1oMzSDmBGoNAba/UOZnsbiHLLmCXnT7MEw2geq1Bnttml0pDFoBTUD?=
 =?us-ascii?Q?N/i1gttGz0LGvBhwFIfoOEmxHr09mK6xaaHjwx9tGIUz1fIUg9zdS4QHT/lV?=
 =?us-ascii?Q?6ql3R+4OSTZ8rqlc85NkrlxKSwErJGhUh7nC2roGlpiYgLVT5+c6L+6Bt3RO?=
 =?us-ascii?Q?Bv1GBYDVuio2xGj92zzeqVPULQdxEdBlkhUu3HAT4DGVQLTsq/FZ8mN96mcT?=
 =?us-ascii?Q?Ycb1Z8fzDsxMfYJcXAegs7cFZwYQJr/gNDz/yYcFjD0lzXaE8sgLER5c94lo?=
 =?us-ascii?Q?xO0ccBGQ/+LN09sXnAerILHA7NlyOOtfgHZxQnog41gkZRwHmC5N3FnqoUzU?=
 =?us-ascii?Q?aB37Mk9rEXax2P3PlhpkazNAbO99hbmQT91kARV074OeFX7TTwE6VBChudsj?=
 =?us-ascii?Q?5CXX3EfAr9sL37MAaMDWUJzPUtoi8fHk1ZqgLLzwrsl4JpZ/grEXCHhgPZnq?=
 =?us-ascii?Q?15fOC4AXLWofRetqj16IL7R09NPnOMV8h9i4S5MyyRSsLCToe3GQQO6Z1oBk?=
 =?us-ascii?Q?YVCc7KkNBxskv0GaagA9iRvCXRNM5D6QG9uTGltuxaYk9mSJ9xGhdVzEFsHT?=
 =?us-ascii?Q?mzJEsjokcrVhgeon4jM74rqN37ueSK/tL+WRQq1qIf7FZafK2U7EmVBAegMl?=
 =?us-ascii?Q?OYmeI4h+mUXeLD2cwplvMrhFGWp5jvpTsphAlWdZesxsorGrbwb9mFnWOUYw?=
 =?us-ascii?Q?5YJv/P+XMZ6bTIvWb/kr8+ZxNfsX3ZrU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 20:39:48.3464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e89596d8-1989-4418-8c9d-08dcbb0ee87d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8012

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

In read_pci_mem_bar(), the VF obtains the struct pci_dev pointer for its
associated PF to access the vf_rlen array. This array is initialized in
pci_add_device() and is only populated in the associated PF's struct
pci_dev.

Add a link from the VF's struct pci_dev to the associated PF struct
pci_dev, ensuring the PF's struct doesn't get deallocated until all its
VFs have gone away. Access the vf_rlen array via the new link to the PF,
and remove the troublesome call to pci_get_pdev().

Add a call to pci_get_pdev() inside the pcidevs_lock()-locked section of
pci_add_device() to set up the link from VF to PF. In case the new
pci_add_device() invocation fails to find the associated PF (returning
NULL), we are no worse off than before: read_pci_mem_bar() will still
return 0 in that case.

Note that currently the only way for Xen to know if a device is a VF is
if the toolstack tells Xen about it. Using PHYSDEVOP_manage_pci_add for
a VF is not a case that Xen handles.

Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Candidate for backport to 4.19

v2->v3:
* link from VF to PF's struct pci_dev *

v1->v2:
* remove call to pci_get_pdev()
---
 xen/arch/x86/msi.c            | 34 ++++++++++++++-------------
 xen/drivers/passthrough/pci.c | 44 +++++++++++++++++++++++++++++++----
 xen/include/xen/pci.h         | 12 +++++++++-
 3 files changed, 69 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 0c97fbb3fc03..1e3a0c450224 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -662,34 +662,32 @@ static int msi_capability_init(struct pci_dev *dev,
     return 0;
 }
 
-static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
+static u64 read_pci_mem_bar(struct pf_info *pf_info, u16 seg, u8 bus, u8 slot,
+                            u8 func, u8 bir, int vf)
 {
+    pci_sbdf_t sbdf = PCI_SBDF(seg, bus, slot, func);
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
-
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
+             !pf_info ||
+             !pf_info->vf_rlen[bir] )
             return 0;
         base = pos + PCI_SRIOV_BAR;
         vf -= PCI_BDF(bus, slot, func) + offset;
@@ -703,8 +701,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
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
@@ -813,6 +811,7 @@ static int msix_capability_init(struct pci_dev *dev,
         int vf;
         paddr_t pba_paddr;
         unsigned int pba_offset;
+        struct pf_info *pf_info = NULL;
 
         if ( !dev->info.is_virtfn )
         {
@@ -827,9 +826,12 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = PCI_SLOT(dev->info.physfn.devfn);
             pfunc = PCI_FUNC(dev->info.physfn.devfn);
             vf = dev->sbdf.bdf;
+            if ( dev->virtfn.pf_pdev )
+                pf_info = &dev->virtfn.pf_pdev->physfn;
         }
 
-        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        table_paddr = read_pci_mem_bar(pf_info, seg, pbus, pslot, pfunc, bir,
+                                       vf);
         WARN_ON(msi && msi->table_base != table_paddr);
         if ( !table_paddr )
         {
@@ -852,7 +854,7 @@ static int msix_capability_init(struct pci_dev *dev,
 
         pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
         bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
-        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        pba_paddr = read_pci_mem_bar(pf_info, seg, pbus, pslot, pfunc, bir, vf);
         WARN_ON(!pba_paddr);
         pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 5a446d3dcee0..1294836bca44 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -341,6 +341,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
 
     list_add(&pdev->alldevs_list, &pseg->alldevs_list);
 
+    INIT_LIST_HEAD(&pdev->physfn.vf_list);
+
     /* update bus2bridge */
     switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
     {
@@ -446,7 +448,27 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
 
     list_del(&pdev->alldevs_list);
     pdev_msi_deinit(pdev);
-    xfree(pdev);
+
+    if ( pdev->info.is_virtfn )
+    {
+        struct pci_dev *pf_pdev = pdev->virtfn.pf_pdev;
+
+        if ( pf_pdev )
+        {
+            list_del(&pdev->virtfn.next);
+            if ( pf_pdev->physfn.dealloc_pending &&
+                 list_empty(&pf_pdev->physfn.vf_list) )
+                xfree(pf_pdev);
+        }
+        xfree(pdev);
+    }
+    else
+    {
+        if ( list_empty(&pdev->physfn.vf_list) )
+            xfree(pdev);
+        else
+            pdev->physfn.dealloc_pending = true;
+    }
 }
 
 static void __init _pci_hide_device(struct pci_dev *pdev)
@@ -700,10 +722,22 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
          * extended function.
          */
         if ( pdev->info.is_virtfn )
+        {
+            struct pci_dev *pf_pdev;
+
             pdev->info.is_extfn = pf_is_extfn;
+            pf_pdev = pci_get_pdev(NULL,
+                                   PCI_SBDF(seg, info->physfn.bus,
+                                            info->physfn.devfn));
+            if ( pf_pdev )
+            {
+                pdev->virtfn.pf_pdev = pf_pdev;
+                list_add(&pdev->virtfn.next, &pf_pdev->physfn.vf_list);
+            }
+        }
     }
 
-    if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
+    if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
     {
         unsigned int pos = pci_find_ext_capability(pdev->sbdf,
                                                    PCI_EXT_CAP_ID_SRIOV);
@@ -715,7 +749,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         {
             unsigned int i;
 
-            BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
+            BUILD_BUG_ON(ARRAY_SIZE(pdev->physfn.vf_rlen) !=
+                                    PCI_SRIOV_NUM_BARS);
+
             for ( i = 0; i < PCI_SRIOV_NUM_BARS; )
             {
                 unsigned int idx = pos + PCI_SRIOV_BAR + i * 4;
@@ -730,7 +766,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                     continue;
                 }
                 ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
-                                       &pdev->vf_rlen[i],
+                                       &pdev->physfn.vf_rlen[i],
                                        PCI_BAR_VF |
                                        ((i == PCI_SRIOV_NUM_BARS - 1) ?
                                         PCI_BAR_LAST : 0));
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 63e49f0117e9..5bb6fef3934b 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -150,7 +150,17 @@ struct pci_dev {
         unsigned int count;
 #define PT_FAULT_THRESHOLD 10
     } fault;
-    u64 vf_rlen[6];
+    struct pf_info {
+        /* Only populated for PFs (info.is_virtfn == false) */
+        uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
+        struct list_head vf_list;             /* List head */
+        bool dealloc_pending;
+    } physfn;
+    struct {
+        /* Only populated for VFs (info.is_virtfn == true) */
+        struct pci_dev *pf_pdev;              /* Link from VF to PF */
+        struct list_head next;                /* Entry in vf_list */
+    } virtfn;
 
     /* Data for vPCI. */
     struct vpci *vpci;

base-commit: d61248b0fa2cdfc0be1d806c43d1b211a72b5d49
-- 
2.46.0


