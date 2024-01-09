Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB9828F6C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 23:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665092.1035324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKFD-0001yn-Tp; Tue, 09 Jan 2024 22:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665092.1035324; Tue, 09 Jan 2024 22:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNKFD-0001wl-Q2; Tue, 09 Jan 2024 22:06:47 +0000
Received: by outflank-mailman (input) for mailman id 665092;
 Tue, 09 Jan 2024 22:06:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK34-0007gG-3i
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:54:14 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f5ef59c-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:54:12 +0100 (CET)
Received: from SJ0PR03CA0046.namprd03.prod.outlook.com (2603:10b6:a03:33e::21)
 by CH0PR12MB5283.namprd12.prod.outlook.com (2603:10b6:610:d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:54:07 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::c6) by SJ0PR03CA0046.outlook.office365.com
 (2603:10b6:a03:33e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 21:54:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:54:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:54:06 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:54:04 -0600
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
X-Inumbo-ID: 9f5ef59c-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/jOB2IVHFoIb2RKQldmNTWHJY50uNdRs1wgRU2pMm0WcNKGI9r6fk0RrgKKAxr0E5naS3MeSfdXgDTvei9XE/OLs3mQjbDhxDnvJ7BGpSlRNLsWZwGj4YqLCvDCafbRIQvy8BSygo+1ouMk2fh4HDxHE52F1rAKNfIPlWhONVUK+hUrgPBuAgzswInE+Dkyfpvra1d0wmaCHaPOqiPOwyII0hYBURYuLNDevaKHRY3EHKH0Osg2U/k4HewPYGEk6Rn0OCrksBXIHh/KpQiN3WlZyzhEJO2xjemrJqScZ+WrdGzVrdrYPAxbO+sGtLNCmmpf6WeRX1j9JWO6U8IoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xDFu5KZSSDdncpc2mzzqE3hD5UQFFULxFo1QzgNY0Y=;
 b=au9aOPYYnfT7xgPmfgCOi83lHOmKU/18fCns6YLvy2sdFNBTJoWBSdL65ZMBHNKu3T9cYcwoLP/Q7ni5A+R7fz6jw+r0wmI+7ufGTJsRIJBULhWnMBOMgNq+MZXzTiD1IL9W1iqKxhyxbatKBsonnerRUobvQAUOv96/pxCytqnyHjksn0t4OOO1mpbclPlJcUVYMfmYd93iCpu9iiS0CWEG3BOZWWgOCOoZNdebCm1+ZqcmRGxm4jCqF5d5oBpxkLuc2Z0I3cXM5SDIkq4a/lSTTj1Q++Tvvss1S/kf+XGt5/k7jUNiOSC9xQq+nU6cSQagPE8N/3aVl65ZflkFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xDFu5KZSSDdncpc2mzzqE3hD5UQFFULxFo1QzgNY0Y=;
 b=vXz9QO25TmODe1fbtOuuf/834KfbD4gemYFKdyQpIz8KP6Cg6ur0U/CxGjmPPtFO8lU/Qkyed268scxdyibZyWSh1AT3M0kFa/BVcW0m3NEs6CRzJTVJB/uY5IaHeRZ+TmpSCZpcisOYok14qq5sm9vPSrUul9gVmdIA1g0oe3Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v12 10/15] vpci/header: emulate PCI_COMMAND register for guests
Date: Tue, 9 Jan 2024 16:51:25 -0500
Message-ID: <20240109215145.430207-11-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|CH0PR12MB5283:EE_
X-MS-Office365-Filtering-Correlation-Id: 72bf7f9d-e407-4aa4-1f37-08dc115d812b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UplPkD0BSlNmzrFH/GBY+acm9DEHZHSCB+famK1O433/KKF46MZTSxwK3b2x+Cf4tCfuD/yhwsKj8T7R217Wy4ljZ5HXAFzPygz2BWgrE7NIkzgdjP3lMGyE5BizYLsMprrl9eLTr2weH9RrSIdosX9tEcF/Etgr2eGT0u6uqMafg/T3fjslmzql5ruV7zIaSRiKRq6m1+Ho6TMvh/YW3YmdD3ZeWgx+r84UHThOaeDnmE2WPIAiijJAgL3QOtOe1rwoZBrdpb0OQTTErDezvuUp2L0qknGBiJd0bs1tPcqhFs0vqmWgaYoQqhByyjLmhbmFdiH4dgXNw7NGKWYZQQUwxV5dc/l4CiIlAw/aXU54/CaECrkZY0bU7vQ3wYDQTWc8f/jxgCRrgMHTFnqzXK+R5VKw2JkVyM9GB4zJeDu7dKpDOHMGrFRrcpAB1x0YExmrBa8gV7uRruw0g59H4QXAvMpwsiCidm0qGdg7u6c8UKtw9h/I9b3/2f0DecM6DoPQAP9Ck2L4w/wbnVX8hjxZS+G6Qklz4wVFGzXfXAMG/eoVZWSwGgNRF42/OMEK66bfNAe7Q7n0bCvGzxtah/7NzGWqIw615IX7Kde7lsHc1iYCp6OvHe1j8GziTCH3vn9JaK0TXkrCHt4F1p9tBaRvjnwZdfy7h+ZIdEeWdI9buRSjO02K0KLDhfUVc2byfLjgCtWpw0PNWlDhyq+td2KuB5dgfckBTn2kYxNvv5nm6YesESyl6VkzhSLAvB+zDC8+B05GxiDfB5dPQHnmOTMcO4cWuJLtEXlaUfcaYEU3whmnDpDTxlyNVXscHD1C
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(1800799012)(451199024)(82310400011)(186009)(36840700001)(40470700004)(46966006)(2616005)(41300700001)(1076003)(478600001)(426003)(26005)(336012)(6666004)(36860700001)(81166007)(86362001)(36756003)(82740400003)(356005)(47076005)(83380400001)(70586007)(30864003)(2906002)(40460700003)(7416002)(8676002)(8936002)(70206006)(40480700001)(316002)(54906003)(5660300002)(44832011)(4326008)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:54:07.5235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bf7f9d-e407-4aa4-1f37-08dc115d812b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5283

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
 xen/drivers/vpci/header.c  | 59 +++++++++++++++++++++++++++++++++++---
 xen/drivers/vpci/msi.c     |  9 ++++++
 xen/drivers/vpci/msix.c    |  7 +++++
 xen/include/xen/pci_regs.h |  1 +
 xen/include/xen/vpci.h     |  3 ++
 5 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f0b0b64b0929..374e8e119231 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -168,6 +168,9 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
     if ( !rom_only )
     {
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+        /* Show DomU that we updated P2M */
+        header->guest_cmd &= ~PCI_COMMAND_MEMORY;
+        header->guest_cmd |= cmd & PCI_COMMAND_MEMORY;
         header->bars_mapped = map;
     }
     else
@@ -524,9 +527,26 @@ static void cf_check cmd_write(
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
+        /*
+         * Do not show change to PCI_COMMAND_MEMORY bit until we finish
+         * modifying P2M mappings.
+         */
+        header->guest_cmd = (cmd & ~PCI_COMMAND_MEMORY) |
+                            (header->guest_cmd & PCI_COMMAND_MEMORY);
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
@@ -540,6 +560,14 @@ static void cf_check cmd_write(
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
@@ -756,9 +784,23 @@ static int cf_check init_header(struct pci_dev *pdev)
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
 
@@ -843,6 +885,15 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( cmd & PCI_COMMAND_MEMORY )
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
 
+    /*
+     * Clear PCI_COMMAND_MEMORY and PCI_COMMAND_IO for DomUs, so they will
+     * always start with memory decoding disabled and to ensure that we will not
+     * call modify_bars() at the end of this function.
+     */
+    if ( !is_hwdom )
+        cmd &= ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
+    header->guest_cmd = cmd;
+
     for ( i = 0; i < num_bars; i++ )
     {
         uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 6ff71e5f9ab7..aae8055ce92d 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -70,6 +70,15 @@ static void cf_check control_write(
 
         if ( vpci_msi_arch_enable(msi, pdev, vectors) )
             return;
+
+        /*
+         * Make sure domU doesn't enable INTx while enabling MSI.
+         */
+        if ( !is_hardware_domain(pdev->domain) )
+        {
+            pci_intx(pdev, false);
+            pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
+        }
     }
     else
         vpci_msi_arch_disable(msi, pdev);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index b6abab47efdd..d4f756ce287a 100644
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
index 9909b27425a5..b2f2e43e864d 100644
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
index e89c571890b2..77320a667e55 100644
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
2.43.0


