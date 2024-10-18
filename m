Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFE29A4841
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 22:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822149.1236122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1tl2-0001GT-6b; Fri, 18 Oct 2024 20:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822149.1236122; Fri, 18 Oct 2024 20:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1tl2-0001DE-3P; Fri, 18 Oct 2024 20:39:36 +0000
Received: by outflank-mailman (input) for mailman id 822149;
 Fri, 18 Oct 2024 20:39:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiWJ=RO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t1tl0-0001Cl-9l
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 20:39:34 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20627.outbound.protection.outlook.com
 [2a01:111:f403:2409::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12d601b8-8d91-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 22:39:31 +0200 (CEST)
Received: from CH2PR18CA0060.namprd18.prod.outlook.com (2603:10b6:610:55::40)
 by SA3PR12MB8046.namprd12.prod.outlook.com (2603:10b6:806:304::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 20:39:25 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::77) by CH2PR18CA0060.outlook.office365.com
 (2603:10b6:610:55::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21 via Frontend
 Transport; Fri, 18 Oct 2024 20:39:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 20:39:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 15:39:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 15:39:24 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Oct 2024 15:39:23 -0500
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
X-Inumbo-ID: 12d601b8-8d91-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OapSGjE5nWZCxDGN+2OXRd7fRBmd08+D3NDufWu31YYgq2tEpbi1pzJ8Lujwa3o8H+RBv8G93bm0K9fpJig1RSwL2RQ3lcdKYqQKtxH6z1Annh6icdySah7wKukabCpCqDZF5jAlH5QsWof2AI25WHSLaUO5i2v4sd2LHy/PsP/FXcrJMOETwuUcF/6oZSeQ+SMgbZelJn+ZoobkV45UltO8vA+mi3/B108ygt9yLHYKFC6rypbotVbPOLOniGbZpiIWUbO66F2j4LzIE2uRQZO3TWKBBn224ittJ+vEebAodRy6eViEcf7LVpIsVEZVWJ2PnnIQreluaYNL+Dzpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhSgenMyww7CPsK0AMuHmuq3dKJ97wqxyXgBiGyLZRY=;
 b=mCKeI1ODwPqiaGGahftuMIrTlamxcX5HeyBRGSQ7hZhtehq1bgHyUsHJrqRZFPDimOW43tlfOoplVzK/d4XoxtPOMQ4MmGEQoFBPdNg7oEpybvLGJ1Yo2kPHUs1z/LV0xkrj9vmzISb79ZXonfVtDcYhk/isz0QhLq6yHr1DFsH8pGS2bHNnc/9KTEHWl/2oMd25Z57qoCnykbvfEg71Gsl/pHJKOh1GlB8G2+7i1Ogve/BymLCOoyX6OfH0Pz2w7zBf60bLuezwdomGR1mSoFQxfZnGy2NnqORb4uFvbUASjvpBmryv44C8jic8LkzBMMZHqWU7x0Lr3OojbTDE0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhSgenMyww7CPsK0AMuHmuq3dKJ97wqxyXgBiGyLZRY=;
 b=Uh5v40aSuaDBvDWnZod0WmLMSbUPj+U1s+lZWlY7y2s7NTyZAyQMT2oNe4u+UlNGXLPU7z3w9NGqR0t2B9IJE1HK3YAPp+vhPTeDJ+nqJxubPo1TjnjYo7eSwEWUjPJA978G5b7sF1C1GpslDEZztOr4bcoRWB5fjAwYOYPbC9o=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 1/3] x86/msi: harden stale pdev handling
Date: Fri, 18 Oct 2024 16:39:08 -0400
Message-ID: <20241018203913.1162962-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|SA3PR12MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 576cb1c1-6113-4765-1066-08dcefb4f450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fN0Ewg4HcNoQ8V4Gyx1u1x5lqzJT3wbUmrBR3CG5Z2enm17SiI+hlVnoLsHf?=
 =?us-ascii?Q?l1om8OGtV6eP0LV0m7BcWAmcTLBcxQmQ1sQDtIWQ+Ob07i3dIv/5LW9yMUHp?=
 =?us-ascii?Q?B1Fhcw5hKYkHA9UklbbQO2Qlz6bMUkj9RkQmTOxHJCbT8gyFQVEL3+skLi6u?=
 =?us-ascii?Q?7nhTcfIrzwRviMVXvsepmVRXxq8wTQKwfC1cxGOIUpG4h3EGXG1y0yAGvhtR?=
 =?us-ascii?Q?HE8NsMh0jvwhGEkCElWbLLgLNZzEmnaERimI+qPc5KBNBGtiEZ/wXdixWLYa?=
 =?us-ascii?Q?e675mNoSOq71u/Kou5nxFHhO3m+CGHOPjoJkWVY+bCwvzLW7HmbaS9hIKxkj?=
 =?us-ascii?Q?aGVVqkLp2B1+/9KG7AYtuPEOMReEW06I5R1r9WC1yKDnWOh1ddKAuf2ytZmT?=
 =?us-ascii?Q?MMditvO9Lp224bRAABm0/rY6v/5XlLLayry+5LgC/8AxuWRYOftxrHESs5KS?=
 =?us-ascii?Q?4SMLDLsZ96yklGMXYfMXDDI6x5r/0vQ86/EQ5rKB/X7gs9r5RZAjOwLN0hzm?=
 =?us-ascii?Q?GoLHjyFW9x8TBjGegszvy/SOxPQrOo7E/n653UTJlIR6mlEHvxmj3XSR3qmS?=
 =?us-ascii?Q?NO4Qvcz0PgKdwI8F+LhHuyiE98lxbdKH3r4gi/k4eAxW9Nro0eTdBNPL6JD+?=
 =?us-ascii?Q?CjzUhzBYdMs+D6KD/X+MbMNgQKfHS0FmkXDksubwPCxDmIqQWSFVb8u3Rhr7?=
 =?us-ascii?Q?KOAlHwkzYuQajxPO/o0OPjNIbx5TzclwRo0y60FFNoaqmf+TwDX0BReePS0s?=
 =?us-ascii?Q?tyogP2Gcw0cbayjIgWaqSmsn+9Jsa/WYmk2me2/F+kh2SgCmUFQZRMcKM0lQ?=
 =?us-ascii?Q?zcrRoityj8rbiEa4xGBvd2VqhSxwyR+zm25vWOshHDZ3xgUFmd+KWOLa57Mm?=
 =?us-ascii?Q?Q0sM3EfB0wvrKL5SzYGikym8sV1RPz1bHIKEGljL1+wUKkaut4FS7iGWhNm+?=
 =?us-ascii?Q?HiQXkmaOt8n2yA6olEI2lAxIcY2CttggCb+07zef0z9j+wTQHS/vkKAQqMzH?=
 =?us-ascii?Q?mM8YwG6mZnLCVby0iJPfsaGeNkAR8iZBOc3IehxJX4OTu19kMg6if1cfLFpd?=
 =?us-ascii?Q?6B66HW5ouM8HE+ae9d7Be6zxioPOGvl6UxqhS/OJLip/gCnl3WWwQ55P9u30?=
 =?us-ascii?Q?afg95Q+/x8n/bKnwEOI+hhGV7/ApGKXarnL0RQgRzmbTvtjJgiwxPEjH5HaH?=
 =?us-ascii?Q?u65w2lZx04vQpDwIGhgmY1YJ+7Il1sXdaF8XEHILVnMXDMBRyLDHEwwWNB1P?=
 =?us-ascii?Q?Di24mDIZC1WNc6hxd6h5JBkA3+T+NSSoxJjAiG9008iqSrg1md7JEb0ui8/B?=
 =?us-ascii?Q?+1a/liwrNLwVJ3nzRckjhkOnSBJ66ikeeb4uRyQqNS/nrVNUENpmlPhGyU06?=
 =?us-ascii?Q?zWgB4ePZFyRuYMnEQqfVFKNaezYSm2XoDuZ+kzrE8Q4hPSGPog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 20:39:25.0869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 576cb1c1-6113-4765-1066-08dcefb4f450
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8046

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

These ASSERTs triggered because the MSI-X capability position can't be
found for a stale pdev.

Latch the capability positions of MSI and MSI-X during device init, and
replace instances of pci_find_cap_offset(..., PCI_CAP_ID_MSI{,X}) with
the stored value. Introduce one additional ASSERT, while the two
existing ASSERTs in question continue to work as intended, even with a
stale pdev.

Fixes: 484d7c852e4f ("x86/MSI-X: track host and guest mask-all requests separately")
Fixes: 575e18d54d19 ("pci: clear {host/guest}_maskall field on assign")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v5->v6;
* latch MSI/MSI-X capability position during device init

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
 xen/arch/x86/msi.c            | 19 +++++++++----------
 xen/drivers/passthrough/msi.c |  3 +++
 xen/drivers/vpci/msi.c        |  2 +-
 xen/drivers/vpci/msix.c       |  2 +-
 xen/include/xen/pci.h         |  3 +++
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index ff2e3d86878d..5e24df7be0c0 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -278,23 +278,21 @@ void __msi_set_enable(u16 seg, u8 bus, u8 slot, u8 func, int pos, int enable)
 
 static void msi_set_enable(struct pci_dev *dev, int enable)
 {
-    int pos;
+    int pos = dev->msi_pos;
     u16 seg = dev->seg;
     u8 bus = dev->bus;
     u8 slot = PCI_SLOT(dev->devfn);
     u8 func = PCI_FUNC(dev->devfn);
 
-    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
     if ( pos )
         __msi_set_enable(seg, bus, slot, func, pos, enable);
 }
 
 static void msix_set_enable(struct pci_dev *dev, int enable)
 {
-    int pos;
+    int pos = dev->msix_pos;
     uint16_t control;
 
-    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
     if ( pos )
     {
         control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
@@ -601,7 +599,7 @@ static int msi_capability_init(struct pci_dev *dev,
     uint16_t control;
 
     ASSERT_PDEV_LIST_IS_READ_LOCKED(dev->domain);
-    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
+    pos = dev->msi_pos;
     if ( !pos )
         return -ENODEV;
     control = pci_conf_read16(dev->sbdf, msi_control_reg(pos));
@@ -764,7 +762,7 @@ static int msix_capability_init(struct pci_dev *dev,
     u8 slot = PCI_SLOT(dev->devfn);
     u8 func = PCI_FUNC(dev->devfn);
     bool maskall = msix->host_maskall, zap_on_error = false;
-    unsigned int pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
+    unsigned int pos = dev->msix_pos;
 
     if ( !pos )
         return -ENODEV;
@@ -1133,11 +1131,13 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
 static void __pci_disable_msix(struct msi_desc *entry)
 {
     struct pci_dev *dev = entry->dev;
-    unsigned int pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
+    unsigned int pos = dev->msix_pos;
     u16 control = pci_conf_read16(dev->sbdf,
                                   msix_control_reg(entry->msi_attrib.pos));
     bool maskall = dev->msix->host_maskall;
 
+    ASSERT(pos);
+
     if ( unlikely(!(control & PCI_MSIX_FLAGS_ENABLE)) )
     {
         dev->msix->host_maskall = 1;
@@ -1241,7 +1241,7 @@ void pci_cleanup_msi(struct pci_dev *pdev)
 
 int pci_reset_msix_state(struct pci_dev *pdev)
 {
-    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
+    unsigned int pos = pdev->msix_pos;
 
     ASSERT(pos);
     /*
@@ -1269,8 +1269,7 @@ int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
     if ( pdev->msix )
     {
         entry = find_msi_entry(pdev, -1, PCI_CAP_ID_MSIX);
-        pos = entry ? entry->msi_attrib.pos
-                    : pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
+        pos = entry ? entry->msi_attrib.pos : pdev->msix_pos;
         ASSERT(pos);
 
         if ( reg >= pos && reg < msix_pba_offset_reg(pos) + 4 )
diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
index 13d904692ef8..ed2bc7ebe635 100644
--- a/xen/drivers/passthrough/msi.c
+++ b/xen/drivers/passthrough/msi.c
@@ -29,6 +29,7 @@ int pdev_msi_init(struct pci_dev *pdev)
     {
         uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
 
+        pdev->msi_pos = pos;
         pdev->msi_maxvec = multi_msi_capable(ctrl);
     }
 
@@ -41,6 +42,8 @@ int pdev_msi_init(struct pci_dev *pdev)
         if ( !msix )
             return -ENOMEM;
 
+        pdev->msix_pos = pos;
+
         spin_lock_init(&msix->table_lock);
 
         ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index dd6620ec5674..66e5a8a116be 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -195,7 +195,7 @@ static void cf_check mask_write(
 
 static int cf_check init_msi(struct pci_dev *pdev)
 {
-    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSI);
+    unsigned int pos = pdev->msi_pos;
     uint16_t control;
     int ret;
 
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 5bb4444ce21f..6bd8c55bb48e 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -711,7 +711,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
     struct vpci_msix *msix;
     int rc;
 
-    msix_offset = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
+    msix_offset = pdev->msix_pos;
     if ( !msix_offset )
         return 0;
 
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 63e49f0117e9..ef56e80651d6 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -113,6 +113,9 @@ struct pci_dev {
         pci_sbdf_t sbdf;
     };
 
+    unsigned int msi_pos;
+    unsigned int msix_pos;
+
     uint8_t msi_maxvec;
     uint8_t phantom_stride;
 
-- 
2.47.0


