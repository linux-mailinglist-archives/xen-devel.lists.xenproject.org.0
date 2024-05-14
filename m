Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8918C5811
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721580.1125114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tEe-00050v-Tt; Tue, 14 May 2024 14:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721580.1125114; Tue, 14 May 2024 14:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tEe-0004xv-QJ; Tue, 14 May 2024 14:34:32 +0000
Received: by outflank-mailman (input) for mailman id 721580;
 Tue, 14 May 2024 14:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loUn=MR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s6tEd-0004xK-7p
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:34:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11bd1953-11ff-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:34:29 +0200 (CEST)
Received: from BY5PR16CA0033.namprd16.prod.outlook.com (2603:10b6:a03:1a0::46)
 by DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 14:34:25 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::42) by BY5PR16CA0033.outlook.office365.com
 (2603:10b6:a03:1a0::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 14:34:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 14:34:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 09:34:23 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 09:34:21 -0500
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
X-Inumbo-ID: 11bd1953-11ff-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9xWYeEt/y4M2g1Rse67Wb5ca6ptMjIns5y2zTje/+qy5Spkml49G3GuqYnRSrIyx2OR86fKLTW1XqjMeoANHt4rSJqoVUrktFbfoxwop0ZtTZKrp+WJX34nEU/mQqxPS3viCqLdrVz5YjnfK7k5niWdV08SZEjtXfcw6/r0JcpyPFBmOulboPSkmufmiU1y5KNvO89slSvo7RJrtLQG4kGN2nZAaQbjGmErPTxQBAwnMg/YgwIqqonNUjh0q3bJ4ZkuAwT97MWOqC4eTFcxkU5IxYGhQP+anlDt4a1IDR88rE6yS3lhrB4znwyjH7/Bxt6cPe+S5CAoC68T62OyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUwBnsMoww8f8q0OFnkTt7/zeC8tzJGFYO6woXqxVXg=;
 b=VWgoFIpP8ruzJEm2eTp2Vo315U4r7BOWxnZmw+xOCyNB/gexT0Pdg1ft+yRnlhzR1LY8DXWUrEL2kkiThUrhoAkZEDDE5ZIKgGSRTTuvojYI0297veqo4uG0iJFtHGig8I704jQHv3gDYqPCodYonBXSq3c1jAZsQwgRULlYzajAfYfBSQcgYMfNtK69DF3URVHUWjqNgiQT/ej+Kj24dM1EOa+DksFbIbFAgm2QAgvwfEa/VXjiKc1lqhfX9ZS6Zcl7T1jTYXX8jD+8xY6HFibyDqjw1i0uy79Ubj03JKPMmf2TEBbaXp0ykksIaeIvzR53m8nLJs16Y5yyfw+sAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUwBnsMoww8f8q0OFnkTt7/zeC8tzJGFYO6woXqxVXg=;
 b=UwfE0G3R4vCNPgoz90RetIJrgQ/ceeqNn0fW2CU9UYs8//3Mwek02W9q8fLK5qfePXp+yHrmsX5Bzvd/cFtL2C5ccHpwC1Y3GGLXL+9dOTaCCbL3zyd69y8DF2pZrT9OHDHhCwMLhtQn7VNzcbcQZ+/y1IrhdoUtD1Ycrk98kxM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: [PATCH v14 1/5] vpci/header: emulate PCI_COMMAND register for guests
Date: Tue, 14 May 2024 10:33:53 -0400
Message-ID: <20240514143400.152280-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240514143400.152280-1-stewart.hildebrand@amd.com>
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|DM6PR12MB4057:EE_
X-MS-Office365-Filtering-Correlation-Id: 364e5c62-d5e9-4e98-1028-08dc7422f3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GtlWqU/re/zNBjVbhxZxiAoBPlVmZCANJkh6QxhvBUeEiljp51+ct6ltLQQS?=
 =?us-ascii?Q?Y/I3wKJmgjyeArBM1eUrJey6uMkMw9pnqhLewfpGhvvCmWKev+6D0/QiwWZ/?=
 =?us-ascii?Q?o7xKXsURKAH8Kfi8+ZIHdl2eZ7cyPh3BIO+gzh+C81qk3253a6Ru1veL9jPQ?=
 =?us-ascii?Q?E8RzSmH4XmIcDrkmJ5RYRmuIFaSh4tyuDIIjwfiyj//QpHFiut2fi80GLf8s?=
 =?us-ascii?Q?YBIQ0DM06cwiFPGpdBhH9L1C17SBJjNdFqgo1wYieYbntMLo6lwsybFf+8Fk?=
 =?us-ascii?Q?XdizuwkQkWeShl43Mgodr0lf6cXbFNd1NgzYp/P5xeGlq4xJBxb1VyWGry+E?=
 =?us-ascii?Q?JVa6HSAVsBgmE6xaPgCnBoc10iFexgoLmM8ThWWW7WgG+pRvT3fxW7+r+5K4?=
 =?us-ascii?Q?IqG1iacaeUhjZLJ8x2qvNyECViHMJHPv/TcGrm9kFErkTE2soZlJ7i2tOrLS?=
 =?us-ascii?Q?RjKOfHBsx3K0v4blxX7lPNpve92zyGVe5NgNvexsgNR4x7hNWzbilfEn4IJS?=
 =?us-ascii?Q?WAz1xq2CxvkvPikdhg35mdryg+0IquP63HcYk70/F60pucrkxQc3OykOfw1v?=
 =?us-ascii?Q?VTDbV8Ph1EknQ/Pvp5RwHZAymoOSCapTjmAFRuKkK/XgBPCdTZKFfEFmzuGK?=
 =?us-ascii?Q?ByMjHJdLRxy4EVAYqFFG1+ZeM+Aht6FGnFAcwO8lgKglHrWDs+acyUf7yABn?=
 =?us-ascii?Q?bfcNHcZlb9ntPr5hobgmhYQjLOIMDzPW8xntdYhGcA/s5UvQ83AWf+EMnGZt?=
 =?us-ascii?Q?mHS3c/++XJcYfh5QpwL6vSxdpDgZrFYWFFHTGnpp6MJHr0pcX+LNkVcj6wP3?=
 =?us-ascii?Q?2v2aE11hMiCCaeTvcJpHHqISmSt+jmqpWhtt4uB/ccDyVzvBjRmUHOW0G2YT?=
 =?us-ascii?Q?GoRXEGBLu+nPkuExaF+R23mL5Lw+1a0i6vIDaVc31UbB+wona8tMN01TBIKT?=
 =?us-ascii?Q?+YUbQGRoULMsCqdt2G3ojZ38eE5hlSk3tkARPPgmMtnB8L8g2NmDU1OtGQxu?=
 =?us-ascii?Q?bkbn5OSYJs9HIiH9pjLhCf18588/dxmaZiyS7/wKdC7lTa240C5h0nFLnqlH?=
 =?us-ascii?Q?IDDsO7za63NdwgxIefiHM3ma5f2GpTnyZJsDyZluoWB2cXlLGgdeeERWslMn?=
 =?us-ascii?Q?6ZR3ovikf0YWVFHceuXL9PrSvTXuiOKI3cTRP8SYQ9fXjD/mCMXYUuYuyfMM?=
 =?us-ascii?Q?wrZ0s0oyJGrvSgQ3x0vHZrRxVlADcZZyjtnQv3B3/FDKc9Ur59DDC810zw8y?=
 =?us-ascii?Q?UOrEeKQ7x9W1KqR7T8+j/bFI6e8lFouplEE8kVhyRfVD/0RhkTQgS/xOKx+9?=
 =?us-ascii?Q?yrFqgwowzTKvHIFahUHGVDnW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:34:24.5194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 364e5c62-d5e9-4e98-1028-08dc7422f3bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
guest's (domU) view of this will want to be zero (for now), the host
having set it to 1 should be preserved, or else we'd effectively be
giving the domU control of the bit. Thus, PCI_COMMAND register needs
proper emulation in order to honor host's settings.

According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
Device Control" the reset state of the command register is typically 0,
so when assigning a PCI device use 0 as the initial state for the
guest's (domU) view of the command register.

Here is the full list of command register bits with notes about
PCI/PCIe specification, and how Xen handles the bit. QEMU's behavior is
also documented here since that is our current reference implementation
for PCI passthrough.

PCI_COMMAND_IO (bit 0)
  PCIe 6.1: RW
  PCI LB 3.0: RW
  QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
    writes do not propagate to hardware. QEMU sets this bit to 1 in
    hardware if an I/O BAR is exposed to the guest.
  Xen domU: (rsvdp_mask) We treat this bit as RsvdP for now since we
    don't yet support I/O BARs for domUs.
  Xen dom0: We allow dom0 to control this bit freely.

PCI_COMMAND_MEMORY (bit 1)
  PCIe 6.1: RW
  PCI LB 3.0: RW
  QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
    writes do not propagate to hardware. QEMU sets this bit to 1 in
    hardware if a Memory BAR is exposed to the guest.
  Xen domU/dom0: We handle writes to this bit by mapping/unmapping BAR
    regions.
  Xen domU: For devices assigned to DomUs, memory decoding will be
    disabled at the time of initialization.

PCI_COMMAND_MASTER (bit 2)
  PCIe 6.1: RW
  PCI LB 3.0: RW
  QEMU: Pass through writes to hardware.
  Xen domU/dom0: Pass through writes to hardware.

PCI_COMMAND_SPECIAL (bit 3)
  PCIe 6.1: RO, hardwire to 0
  PCI LB 3.0: RW
  QEMU: Pass through writes to hardware.
  Xen domU/dom0: Pass through writes to hardware.

PCI_COMMAND_INVALIDATE (bit 4)
  PCIe 6.1: RO, hardwire to 0
  PCI LB 3.0: RW
  QEMU: Pass through writes to hardware.
  Xen domU/dom0: Pass through writes to hardware.

PCI_COMMAND_VGA_PALETTE (bit 5)
  PCIe 6.1: RO, hardwire to 0
  PCI LB 3.0: RW
  QEMU: Pass through writes to hardware.
  Xen domU/dom0: Pass through writes to hardware.

PCI_COMMAND_PARITY (bit 6)
  PCIe 6.1: RW
  PCI LB 3.0: RW
  QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
    writes do not propagate to hardware.
  Xen domU: (rsvdp_mask) We treat this bit as RsvdP.
  Xen dom0: We allow dom0 to control this bit freely.

PCI_COMMAND_WAIT (bit 7)
  PCIe 6.1: RO, hardwire to 0
  PCI LB 3.0: hardwire to 0
  QEMU: res_mask
  Xen domU: (rsvdp_mask) We treat this bit as RsvdP.
  Xen dom0: We allow dom0 to control this bit freely.

PCI_COMMAND_SERR (bit 8)
  PCIe 6.1: RW
  PCI LB 3.0: RW
  QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
    writes do not propagate to hardware.
  Xen domU: (rsvdp_mask) We treat this bit as RsvdP.
  Xen dom0: We allow dom0 to control this bit freely.

PCI_COMMAND_FAST_BACK (bit 9)
  PCIe 6.1: RO, hardwire to 0
  PCI LB 3.0: RW
  QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
    writes do not propagate to hardware.
  Xen domU: (rsvdp_mask) We treat this bit as RsvdP.
  Xen dom0: We allow dom0 to control this bit freely.

PCI_COMMAND_INTX_DISABLE (bit 10)
  PCIe 6.1: RW
  PCI LB 3.0: RW
  QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
    writes do not propagate to hardware. QEMU checks if INTx was mapped
    for a device. If it is not, then guest can't control
    PCI_COMMAND_INTX_DISABLE bit.
  Xen domU: We prohibit a guest from enabling INTx if MSI(X) is enabled.
  Xen dom0: We allow dom0 to control this bit freely.

Bits 11-15
  PCIe 6.1: RsvdP
  PCI LB 3.0: Reserved
  QEMU: res_mask
  Xen domU/dom0: rsvdp_mask

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
RFC: There is an unaddressed question for Roger: should we update the
     guest view of the PCI_COMMAND_INTX_DISABLE bit in
     msi.c/msix.c:control_write()? See prior discussion at [1].
     In my opinion, I think we should make sure that hardware state and
     the guest view are consistent (i.e. don't lie to the guest).

[1] https://lore.kernel.org/xen-devel/86b25777-788c-4b9a-8166-a6f8174bedc9@suse.com/

In v14:
- check for 0->1 transition in INTX_DISABLE-setting logic in
  msi.c:control_write() to match msix.c:control_write()
- clear domU-controllable bits in header.c:init_header()

In v13:
- Update right away (don't defer) PCI_COMMAND_MEMORY bit in guest_cmd
  variable in cmd_write()
- Make comment single line in xen/drivers/vpci/msi.c:control_write()
- Rearrange memory decoding disabling snippet in init_header()

In v12:
- Rework patch using vpci_add_register_mask()
- Add bitmask #define in pci_regs.h according to PCIe 6.1 spec, except
  don't add the RO bits because they were RW in PCI LB 3.0 spec.
- Move and expand TODO comment about properly emulating bits
- Update guest_cmd in msi.c/msix.c:control_write()
- Simplify cmd_write(), thanks to rsvdp_mask
- Update commit description

In v11:
- Fix copy-paste mistake: vpci->msi should be vpci->msix
- Handle PCI_COMMAND_IO
- Fix condition for disabling INTx in the MSI-X code
- Show domU changes to only allowed bits
- Show PCI_COMMAND_MEMORY write only after P2M was altered
- Update comments in the code
In v10:
- Added cf_check attribute to guest_cmd_read
- Removed warning about non-zero cmd
- Updated comment MSI code regarding disabling INTX
- Used ternary operator in vpci_add_register() call
- Disable memory decoding for DomUs in init_bars()
In v9:
- Reworked guest_cmd_read
- Added handling for more bits
Since v6:
- fold guest's logic into cmd_write
- implement cmd_read, so we can report emulated INTx state to guests
- introduce header->guest_cmd to hold the emulated state of the
  PCI_COMMAND register for guests
Since v5:
- add additional check for MSI-X enabled while altering INTX bit
- make sure INTx disabled while guests enable MSI/MSI-X
Since v3:
- gate more code on CONFIG_HAS_MSI
- removed logic for the case when MSI/MSI-X not enabled
---
 xen/drivers/vpci/header.c  | 60 ++++++++++++++++++++++++++++++++++----
 xen/drivers/vpci/msi.c     |  8 +++++
 xen/drivers/vpci/msix.c    |  7 +++++
 xen/include/xen/pci_regs.h |  1 +
 xen/include/xen/vpci.h     |  3 ++
 5 files changed, 73 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 47648c395132..2491dbae8901 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -524,9 +524,21 @@ static void cf_check cmd_write(
 {
     struct vpci_header *header = data;
 
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        const struct vpci *vpci = pdev->vpci;
+
+        if ( (vpci->msi && vpci->msi->enabled) ||
+             (vpci->msix && vpci->msix->enabled) )
+            cmd |= PCI_COMMAND_INTX_DISABLE;
+
+        header->guest_cmd = cmd;
+    }
+
     /*
      * Let Dom0 play with all the bits directly except for the memory
-     * decoding one.
+     * decoding one. Bits that are not allowed for DomU are already
+     * handled above and by the rsvdp_mask.
      */
     if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
         /*
@@ -540,6 +552,14 @@ static void cf_check cmd_write(
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
+static uint32_t cf_check guest_cmd_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
+{
+    const struct vpci_header *header = data;
+
+    return header->guest_cmd;
+}
+
 static void cf_check bar_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
@@ -754,9 +774,23 @@ static int cf_check init_header(struct pci_dev *pdev)
         return -EOPNOTSUPP;
     }
 
-    /* Setup a handler for the command register. */
-    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
-                           2, header);
+    /*
+     * Setup a handler for the command register.
+     *
+     * TODO: If support for emulated bits is added, re-visit how to handle
+     * PCI_COMMAND_PARITY, PCI_COMMAND_SERR, and PCI_COMMAND_FAST_BACK.
+     */
+    rc = vpci_add_register_mask(pdev->vpci,
+                                is_hwdom ? vpci_hw_read16 : guest_cmd_read,
+                                cmd_write, PCI_COMMAND, 2, header, 0, 0,
+                                PCI_COMMAND_RSVDP_MASK |
+                                    (is_hwdom ? 0
+                                              : PCI_COMMAND_IO |
+                                                PCI_COMMAND_PARITY |
+                                                PCI_COMMAND_WAIT |
+                                                PCI_COMMAND_SERR |
+                                                PCI_COMMAND_FAST_BACK),
+                                0);
     if ( rc )
         return rc;
 
@@ -836,9 +870,23 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( pdev->ignore_bars )
         return 0;
 
-    /* Disable memory decoding before sizing. */
     cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
-    if ( cmd & PCI_COMMAND_MEMORY )
+
+    /*
+     * For DomUs, clear PCI_COMMAND_{MASTER,MEMORY,IO} and other
+     * DomU-controllable bits in PCI_COMMAND. Devices assigned to DomUs will
+     * start with memory decoding disabled, and modify_bars() will not be called
+     * at the end of this function.
+     */
+    if ( !is_hwdom )
+        cmd &= ~(PCI_COMMAND_VGA_PALETTE | PCI_COMMAND_INVALIDATE |
+                 PCI_COMMAND_SPECIAL | PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY |
+                 PCI_COMMAND_IO);
+
+    header->guest_cmd = cmd;
+
+    /* Disable memory decoding before sizing. */
+    if ( !is_hwdom || (cmd & PCI_COMMAND_MEMORY) )
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
 
     for ( i = 0; i < num_bars; i++ )
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 30adcf7df05d..3e414e69a432 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -57,6 +57,7 @@ static void cf_check control_write(
 
     if ( new_enabled )
     {
+        bool old_enabled = msi->enabled;
         /*
          * If the device is already enabled it means the number of
          * enabled messages has changed. Disable and re-enable the
@@ -70,6 +71,13 @@ static void cf_check control_write(
 
         if ( vpci_msi_arch_enable(msi, pdev, vectors) )
             return;
+
+        /* Make sure domU doesn't enable INTx while enabling MSI. */
+        if ( !old_enabled && !is_hardware_domain(pdev->domain) )
+        {
+            pci_intx(pdev, false);
+            pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
+        }
     }
     else
         vpci_msi_arch_disable(msi, pdev);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 58c16ebdf283..fbe710ab92ef 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -135,6 +135,13 @@ static void cf_check control_write(
         }
     }
 
+    /* Make sure domU doesn't enable INTx while enabling MSI-X. */
+    if ( new_enabled && !msix->enabled && !is_hardware_domain(pdev->domain) )
+    {
+        pci_intx(pdev, false);
+        pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
+    }
+
     msix->masked = new_masked;
     msix->enabled = new_enabled;
 
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 0bc18efabb74..250ba106dbd3 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -48,6 +48,7 @@
 #define  PCI_COMMAND_SERR	0x100	/* Enable SERR */
 #define  PCI_COMMAND_FAST_BACK	0x200	/* Enable back-to-back writes */
 #define  PCI_COMMAND_INTX_DISABLE 0x400 /* INTx Emulation Disable */
+#define  PCI_COMMAND_RSVDP_MASK	0xf800
 
 #define PCI_STATUS		0x06	/* 16 bits */
 #define  PCI_STATUS_IMM_READY	0x01	/* Immediate Readiness */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 6e4c972f35ed..2064d9354f5b 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -107,6 +107,9 @@ struct vpci {
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
 
+        /* Guest (domU only) view of the PCI_COMMAND register. */
+        uint16_t guest_cmd;
+
         /*
          * Store whether the ROM enable bit is set (doesn't imply ROM BAR
          * is mapped into guest p2m) if there's a ROM BAR on the device.
-- 
2.43.2


