Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79528C8A8B
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 19:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724356.1129606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s812p-0006GO-LD; Fri, 17 May 2024 17:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724356.1129606; Fri, 17 May 2024 17:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s812p-0006DB-I3; Fri, 17 May 2024 17:06:59 +0000
Received: by outflank-mailman (input) for mailman id 724356;
 Fri, 17 May 2024 17:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIA2=MU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s812n-0006C6-Rw
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 17:06:57 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc2c6de2-146f-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 19:06:55 +0200 (CEST)
Received: from CH0PR03CA0197.namprd03.prod.outlook.com (2603:10b6:610:e4::22)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 17:06:51 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::af) by CH0PR03CA0197.outlook.office365.com
 (2603:10b6:610:e4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30 via Frontend
 Transport; Fri, 17 May 2024 17:06:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 17:06:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:06:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:06:50 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 17 May 2024 12:06:49 -0500
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
X-Inumbo-ID: dc2c6de2-146f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcbDXjw5RSNAYliHXmmL/eqO5RfXY9IbNuSe8qlKjtSoYq0y2fsiMvDOojx7O5RcPSeoD/wg8vmrA1qelY6AfgAevW8i/uaUXPK/GmYsSoYRwm6R+XH/mwKb/naLoBT74UKvcnKn8bd+fmSB97dpUXzHOzAT1nCgjY6ycnRTUYBoKzPFUMlx4mOJuzii4EYVlzw/z9ULkKHtYNuEQKoqbPk9Ne1gSQhgQXRGyRzb/fK39JAejuGTgcSC/JBsJOSuRhI82SIbgTWK2nWSmu5beSIVDXvrcpJoeTJ/eYbbBT5xC7SuDv0zX+Izhk8oiGanVfd810lAe6MMINgDgkU2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUlhftlOCNqSzK4Q7JMuj42oNyZSiQtLeJCRs2LCTBA=;
 b=MWhKriMgg5Qwmjoe+zPyTTvDpvDlNxCfqaa2qjOvmA1oiDesjxZtLGttVbLQJaqN6SQ0j8YfSAnElcWv9FqYYPw4JjiSU2sRZ2C81fzF3dxUWzXMYsTqYcoaPZWry/h3qB8zHaNU2BUrvhU1DI6OJ5KCw/2zWQBTZ+A77fKCBTgo0odLAZ7wcPLeJegc88uFXSvp78Mm6ANfv2vC7gwcue7j+yBIiqF9aInTDefdxPXazATiKlt46RLllbmuxt7s37k1UJLAHKPS2jq/WfSQ0WuuMrjlUgBolPe/qGpyDnb48poCK6qnBnUX2uJGHit8r1iA0/74xapPvNUKaSs+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUlhftlOCNqSzK4Q7JMuj42oNyZSiQtLeJCRs2LCTBA=;
 b=R42IKjJRy4Duzqziy8v6jDlUawoVM9bh6g7XCK0KKlBju54DUDbmNGuiFTklTqU3psmC+MubvW0d5ZSrIbcCZ3iiq31nAkn6BADEh2VZ5sktVgsb4x1jas3dYj5Q/uBf5aRahAbdhWS1nRqUHj9mVyTLmvauXz+as0jBOvuWwgQ=
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
Subject: [PATCH v15 2/5] vpci/header: emulate PCI_COMMAND register for guests
Date: Fri, 17 May 2024 13:06:12 -0400
Message-ID: <20240517170619.45088-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517170619.45088-1-stewart.hildebrand@amd.com>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: cc549463-26a4-4999-a970-08dc7693bee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0rRgFlFW7quJWwFnx8/5onH2wBWgvczo2wc3R79RSU+m/X2pMZsXWpfNpTMQ?=
 =?us-ascii?Q?+zKKahfxiwL90yV0nm8TPegP2Hl2Q2fNYWdfPpYXkAPLXyx1D5+cl/8ysMSW?=
 =?us-ascii?Q?xLOzPRHrnwM2719vdv1RiQXrsssfZXxGfYBR5ZCQjdyhrFt3eplOFhl19upE?=
 =?us-ascii?Q?1EyFqUwfT+4l+o/uzNxM9IqRHv/t93cKcnt7SwXcMBwMZmbAZ2+B8smcXHf9?=
 =?us-ascii?Q?1FhVK0rNpcs/9/AiehMby1FPuUpfSizo32YRS8o7TWlo2d3xI0FhEM2m+9de?=
 =?us-ascii?Q?0gGEzfIPmJFjwoVkTCvn7HHDVUyf7/u7bv7h7jSbtxv2Rdls/dJ0gHN4cHLW?=
 =?us-ascii?Q?sv0KjPPvFS/SYTqTamK3BD/V56MmMT/dR93dnNRnUisyrVUyPN7oiRpnowZ5?=
 =?us-ascii?Q?YJW0TK7mbTqvEmgTQjag+Ly8saEI40DnrPnoDwmCtgux99oR2wtz6l7UjIIx?=
 =?us-ascii?Q?ReHzuxPQYM+iPssrmfit1PivByOWuLqn3jiIzadFkFyJIc44rGWVbaZbfvhe?=
 =?us-ascii?Q?GX6JA4iYTwIr3tBJmrb1k+stZsvQW056BpWgZjs4wyH/xqBpKtPLUFN+KSqe?=
 =?us-ascii?Q?k+l5vcMhZhDQ9ph8t6gJKwjkRLSRdPUGtywuSoqExz/2O6RK8IQJqeMDqX4o?=
 =?us-ascii?Q?js7WOEfAy99Ac28sxcCsWdag0XBI06epNFtATXlPC1rwuqVISTUmhoCBP6oi?=
 =?us-ascii?Q?bAcKmSm5ADM0S3ygLVe1TI0S96EkSeCQvCJckUGeHlI4E59ymoh2MYwWpsm5?=
 =?us-ascii?Q?LiQ/se9GhtP11jB0m9JgaKPjHOkUm4fDYAXZy3bokWvqclsjMykIjvvEB2ZR?=
 =?us-ascii?Q?1g7LuqZe5Aq0LhtIv4mqTivBgsFKTHDiOoWAvwtW1dyaf6IICxaURIgs+HV0?=
 =?us-ascii?Q?GOtoxx0g9j7q5EJx1LdDUtpke/MG9z1pnF8xITfVBsqykYSCl2B8NSNwwqFM?=
 =?us-ascii?Q?hz384Ebx8srC+RZYtCDs4o5XlPAPp1UL890IIcgI6TPXFLlb1eiwUIWspumq?=
 =?us-ascii?Q?WvmstMYde7/0zSQZ6KxYq3Rllsn4MUuGWrX8pA5KgOvc+/UkTw4ej0Bfeoni?=
 =?us-ascii?Q?pTSDBIjSSN9XO7Rhi8zk7cu0yK76k9gJib557lAQBpTUfejc/r6F73fmlWE3?=
 =?us-ascii?Q?Akb41n+ewzE5renkL7+wdQXBd8kaXdDjiZbmVDA/ZBL4EKy0Y29OHZ6O5Z9t?=
 =?us-ascii?Q?PUppmBQIwhgdvabKPvzoFS+utXDr04W8zlb39/NN1jfuCWJlUo3Av0biqpem?=
 =?us-ascii?Q?nAldOgz6pLUkmJzmipWeMWLF2kILty9AAhAoT7b+z7l4ph5+IGcca0EbH/TX?=
 =?us-ascii?Q?BiQS3NzsBJcPZZtBj4ZmYaw0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 17:06:51.4331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc549463-26a4-4999-a970-08dc7693bee8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430

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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
RFC: There is an unaddressed question for Roger: should we update the
     guest view of the PCI_COMMAND_INTX_DISABLE bit in
     msi.c/msix.c:control_write()? See prior discussion at [1].
     In my opinion, I think we should make sure that hardware state and
     the guest view are consistent (i.e. don't lie to the guest).

[1] https://lore.kernel.org/xen-devel/86b25777-788c-4b9a-8166-a6f8174bedc9@suse.com/

In v15:
- add Jan's R-b
- add blank line after declaration in msi.c:control_write()

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
 xen/drivers/vpci/msi.c     |  9 ++++++
 xen/drivers/vpci/msix.c    |  7 +++++
 xen/include/xen/pci_regs.h |  1 +
 xen/include/xen/vpci.h     |  3 ++
 5 files changed, 74 insertions(+), 6 deletions(-)

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
index 30adcf7df05d..dd6620ec5674 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -57,6 +57,8 @@ static void cf_check control_write(
 
     if ( new_enabled )
     {
+        bool old_enabled = msi->enabled;
+
         /*
          * If the device is already enabled it means the number of
          * enabled messages has changed. Disable and re-enable the
@@ -70,6 +72,13 @@ static void cf_check control_write(
 
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
2.45.1


