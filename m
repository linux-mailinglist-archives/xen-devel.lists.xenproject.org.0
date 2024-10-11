Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657A99A7A3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 17:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817224.1231310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHYY-0007WR-Fi; Fri, 11 Oct 2024 15:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817224.1231310; Fri, 11 Oct 2024 15:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHYY-0007TS-Cb; Fri, 11 Oct 2024 15:27:54 +0000
Received: by outflank-mailman (input) for mailman id 817224;
 Fri, 11 Oct 2024 15:27:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I9YX=RH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1szHYW-0007SS-Er
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 15:27:52 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2418::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e9855e1-87e5-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 17:27:51 +0200 (CEST)
Received: from BN7PR02CA0008.namprd02.prod.outlook.com (2603:10b6:408:20::21)
 by IA1PR12MB7639.namprd12.prod.outlook.com (2603:10b6:208:425::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 15:27:42 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:20:cafe::3c) by BN7PR02CA0008.outlook.office365.com
 (2603:10b6:408:20::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 15:27:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 15:27:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 10:27:41 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 10:27:40 -0500
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
X-Inumbo-ID: 5e9855e1-87e5-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVuecqEyK9QUPIM/OucNgwHJLHQqk9B2HELaqoNmi/PrRqgkHLFflWRpNamcapp+o7YKCasjXPEn1FPGlO4ymN5ZPuz8zRkA8/5cdzuDWzzNKMBBZxfFE+rXAZ5QEIbsRMmD7bugkOuV3MJuMQ60/MvyzeZ3WWLwZMux4L9KiTg1uE3i9b0Q7KHus5VslEdfDlOa561d8t73iXq1zkkfFvgM23+ERobLWRwBQbVrFhGAw5trMacoZMQq1gn+d2kBpb3be8fJ9vb1UrT1uyCUvT796VDfusUIkIgnQLpSl64Ij8qF59GrYFhxiBqF2gec2DzYUCW7r2qb8Fo05tbaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bae18Nq7AOaW1aZ8YIQKtu/Xs/0xVUuY6JnFn3meqtw=;
 b=PTP82t8gf/ZrirNSf48Hfa8MFV17jamp7YngmCIlwzNbcIQ4L5FavPPRIyhSNYkGIyL5mlnzEvBg/ClAM2toHAmLBR6tI4UwUDpHcQ2m4tckU31hcpOUwjJrVLP+4ESyDS0Gz0jnyC5ANZbzKirMRlWeUXo08t9513mjW/+ZhOBlQ/MkimcPLmeBH05LT59+lb0N5NbUqGJ8U3BAvaHv6q8WM/k7O3iIKzMZvTEX0VE0/PN81YyHDmSxANRjFVTJFPN8kubavth4a9lM21RjRHE/gOEcvre0oaDDa4PmypliyA7HICJvq1cb151dE40XjZcirTl0Ri/602CbIuFNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bae18Nq7AOaW1aZ8YIQKtu/Xs/0xVUuY6JnFn3meqtw=;
 b=XqoI5GEhYbqPzhOtXcYTs401jY++u3veKjDiOnUGKXUB3o6rVB7O4jVcd0u3ZVrYCi3ev9UELyQJHFbqjJjcBKzWRwsyjjJT0yISjF41YfPvAblrt15DG4HwPnSU4kv+tSZxjOA4hLf2nSyA0MX9zcaGCvl4lBZf64xOM6Qid+U=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 1/3] x86/msi: harden stale pdev handling
Date: Fri, 11 Oct 2024 11:27:06 -0400
Message-ID: <20241011152727.366770-2-stewart.hildebrand@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|IA1PR12MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b1eea3-583b-4af9-a953-08dcea093f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ScdZELdIUTo+L1yeaV1r4m9phOlErMBPrkEA3RznZclUiCyJY6ukI4UIXovs?=
 =?us-ascii?Q?6QvCMCMayECi6La05VwbD5QdFtSl5NSaDWqTkQrq6IpObSosFLHzgKW6dX7e?=
 =?us-ascii?Q?6AX7wrrNxKeLcVkO7B2HddhOB2PKkXAC9izAeNlZdiUprEQJuGnbyBLjDCo3?=
 =?us-ascii?Q?c/venKIyRs/xbxffLMa8q3PDnSSNDoea8zkmUxYY6CBPzK1/+HTnyccDGZ/e?=
 =?us-ascii?Q?Kq3RPEncr9NCuVrIAoYyYqB9TDcI1rTirMHCNy9lxnUL4oi3MCzdVh7ar2fb?=
 =?us-ascii?Q?vOO8H9R1R0JnZKZj+dJo0y3TLc2Kpqu5LDIDpl8NqPPprJctJQ0eoUs3vmeW?=
 =?us-ascii?Q?tA9z1J1USeHtA4OwWtL5cn3bPpSR+M0bg32rBZ3zyVRGHCUlSzWPZD9vg7Fz?=
 =?us-ascii?Q?jzEaSo7vHWddZuRPS9cXYXjxS9F0jA86bhPKWKQw4AK4Mz0FGEwQi+a4SwWJ?=
 =?us-ascii?Q?ZLsf5g/sxE782WggHjv2B3xV+5gyNFIR7/Huz4KBBX5ARhevRjor5nMebtWr?=
 =?us-ascii?Q?grnJvCPjh92xFtYXnIJRDuZJal0peMIq833Q4TMXR6rMqxa9AWG+9ZWSQ4tA?=
 =?us-ascii?Q?cDh1n/GuqANiDaXa7PU3iDNvI45jTbxDKxc1XZSKsJrIOeNBOSSu2q1arrAo?=
 =?us-ascii?Q?+UQWeQO/RoaCUOrv3ZYvgitVwr104YRcOps9gL4ggLyC/88klss3t7uD1xPv?=
 =?us-ascii?Q?sKBYRQopfCIpMUb46Xrk9QWW4Y7sjcnn80HqKd8ponDXKOn+o7dG1i8BFA4X?=
 =?us-ascii?Q?HZAs0MRLqk7XLaIut6PMYXb5cly+zbU0tazAAvTQsDJbpEamytAhqbtXkJr0?=
 =?us-ascii?Q?P5Be3BFmZaZCUNS3asmrUIZi1QVhPMyJ0X/G38XDeadKgvHBC6mQoukAhoNn?=
 =?us-ascii?Q?8rwmrPIrPZ91od/jjwwE6MEy4jUoSl88UwdPWVL46deEobwrh88rhOjP1wG4?=
 =?us-ascii?Q?KDeIyc0JUFv8dsFMY4XANZBsr6viwUvG6zHuQITM6EihXEoaclxWwtFOvayF?=
 =?us-ascii?Q?b7VZYCw9C26KqZDfaqXE7IEWzhHYuDfx+5IUuYG786UoYWwIuaQbr5dysT+K?=
 =?us-ascii?Q?q/K3uJfdthaG9R+XVtRrkH8gng+cbOPTU7JhjK5Y8gh5MnHOdeuiDGWtQymd?=
 =?us-ascii?Q?6J1iD084uJuqoN70fPrmSbX9hWgeXBGsZs2e11A4Aq/J6e4o6tLIr/mD8dij?=
 =?us-ascii?Q?xlfAy7WQAYzsaOBxGTj9TVjqhUreK41UzW9xlNyfKrFZHbLmXueAvCG99tsF?=
 =?us-ascii?Q?7e/NyD7kz3+CCLDfSbVr7sgbW3hjAef9zhAJynaKP1+XU3AxOcPy4oNkHFr+?=
 =?us-ascii?Q?ayxwz8fA8DvgOQ+nHXGnpvcJ436Rsm/5cMA7OTWHXAAxbDZPapzUZDe1466j?=
 =?us-ascii?Q?Q0wstyJkvQyl5CDCBCSJRxx30bSc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:27:41.7392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b1eea3-583b-4af9-a953-08dcea093f56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7639

Dom0 normally informs Xen of PCI device removal via
PHYSDEVOP_pci_device_remove, e.g. in response to SR-IOV disable or
hot-unplug. We might find ourselves with stale pdevs if a buggy dom0
fails to report removal via PHYSDEVOP_pci_device_remove. In this case,
attempts to access the config space of the stale pdevs would be invalid
and return all 1s.

Some possible conditions leading to this are:

1. Dom0 disables SR-IOV without reporting VF removal to Xen.

The Linux SR-IOV subsystem normally reports VF removal when a PF driver
disables SR-IOV. In case of a buggy dom0 SR-IOV subsystem, SR-IOV could
become disabled with stale dangling VF pdevs in both dom0 Linux and Xen.

2. Dom0 reporting PF removal without reporting VF removal.

During SR-IOV PF removal (hot-unplug), a buggy PF driver may fail to
disable SR-IOV, thus failing to remove the VFs, leaving stale dangling
VFs behind in both Xen and Linux. At least Linux warns in this case:

[  100.000000]  0000:01:00.0: driver left SR-IOV enabled after remove

In either case, Xen is left with stale VF pdevs, risking invalid PCI
config space accesses.

When Xen is built with CONFIG_DEBUG=y, the following Xen crashes were
observed when dom0 attempted to access the config space of a stale VF:

(XEN) Assertion 'pos' failed at arch/x86/msi.c:1274
(XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040346834>] R pci_msi_conf_write_intercept+0xa2/0x1de
(XEN)    [<ffff82d04035d6b4>] F pci_conf_write_intercept+0x68/0x78
(XEN)    [<ffff82d0403264e5>] F arch/x86/pv/emul-priv-op.c#pci_cfg_ok+0xa0/0x114
(XEN)    [<ffff82d04032660e>] F arch/x86/pv/emul-priv-op.c#guest_io_write+0xb5/0x1c8
(XEN)    [<ffff82d0403267bb>] F arch/x86/pv/emul-priv-op.c#write_io+0x9a/0xe0
(XEN)    [<ffff82d04037c77a>] F x86_emulate+0x100e5/0x25f1e
(XEN)    [<ffff82d0403941a8>] F x86_emulate_wrapper+0x29/0x64
(XEN)    [<ffff82d04032802b>] F pv_emulate_privileged_op+0x12e/0x217
(XEN)    [<ffff82d040369f12>] F do_general_protection+0xc2/0x1b8
(XEN)    [<ffff82d040201aa7>] F x86_64/entry.S#handle_exception_saved+0x2b/0x8c

(XEN) Assertion 'pos' failed at arch/x86/msi.c:1246
(XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040346b0a>] R pci_reset_msix_state+0x47/0x50
(XEN)    [<ffff82d040287eec>] F pdev_msix_assign+0x19/0x35
(XEN)    [<ffff82d040286184>] F drivers/passthrough/pci.c#assign_device+0x181/0x471
(XEN)    [<ffff82d040287c36>] F iommu_do_pci_domctl+0x248/0x2ec
(XEN)    [<ffff82d040284e1f>] F iommu_do_domctl+0x26/0x44
(XEN)    [<ffff82d0402483b8>] F do_domctl+0x8c1/0x1660
(XEN)    [<ffff82d04032977e>] F pv_hypercall+0x5ce/0x6af
(XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150

Replace the ASSERT(s) with an error, and mark the device broken to
disallow passthrough to domUs.

Fixes: 484d7c852e4f ("x86/MSI-X: track host and guest mask-all requests separately")
Fixes: 575e18d54d19 ("pci: clear {host/guest}_maskall field on assign")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* new patch, independent of the rest of the series
* new approach to fixing the issue: don't rely on dom0 to report any
  sort of device removal; rather, fix the condition directly

---
Instructions to reproduce
Requires Xen with CONFIG_DEBUG=y
Tested with Linux 6.11

1. Dom0 disables SR-IOV without reporting VF removal to Xen.

* Hack the Linux SR-IOV subsystem to remove the call to
  pci_stop_and_remove_bus_device() in
  drivers/pci/iov.c:pci_iov_remove_virtfn().

* Enable SR-IOV, then disable SR-IOV
  echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs
  echo 0 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs

* Now we have a stale VF. We can trigger the ASSERT either by unbinding
  the VF driver and issuing a reset...

  echo 0000\:01\:10.0 > /sys/bus/pci/devices/0000\:01\:10.0/driver/unbind
  echo 1 > /sys/bus/pci/devices/0000\:01\:10.0/reset

  ... or by doing xl pci-assignable-add

  xl pci-assignable-add 01:10.0

2. Dom0 reporting PF removal without reporting VF removal.

* Hack your PF driver to leave SR-IOV enabled when removing the device

* Enable SR-IOV

  echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs

* Unplug the PCI device

  (qemu) device_del mydev

* Now we have a stale VF. We can trigger the ASSERT either by re-adding
  the PF device with SR-IOV disabled...

  echo 0000\:01\:10.0 > /sys/bus/pci/devices/0000\:01\:10.0/driver/unbind
  (qemu) device_add igb,id=mydev,bus=pcie.1,netdev=net1

  ... or by reset / xl pci-assignable-add as above.
---
 xen/arch/x86/msi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index ff2e3d86878d..fbb07fe821b5 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1243,7 +1243,12 @@ int pci_reset_msix_state(struct pci_dev *pdev)
 {
     unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
 
-    ASSERT(pos);
+    if ( !pos )
+    {
+        pdev->broken = true;
+        return -EFAULT;
+    }
+
     /*
      * Xen expects the device state to be the after reset one, and hence
      * host_maskall = guest_maskall = false and all entries should have the
@@ -1271,7 +1276,12 @@ int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
         entry = find_msi_entry(pdev, -1, PCI_CAP_ID_MSIX);
         pos = entry ? entry->msi_attrib.pos
                     : pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
-        ASSERT(pos);
+
+        if ( !pos )
+        {
+            pdev->broken = true;
+            return -EFAULT;
+        }
 
         if ( reg >= pos && reg < msix_pba_offset_reg(pos) + 4 )
         {
-- 
2.47.0


