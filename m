Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C818E847BAE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675238.1050593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Dx-0001i1-5S; Fri, 02 Feb 2024 21:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675238.1050593; Fri, 02 Feb 2024 21:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Dx-0001bw-0g; Fri, 02 Feb 2024 21:37:25 +0000
Received: by outflank-mailman (input) for mailman id 675238;
 Fri, 02 Feb 2024 21:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1Ce-0003tJ-Uy
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:36:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1041dd65-c213-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 22:36:03 +0100 (CET)
Received: from BY3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:254::10)
 by DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Fri, 2 Feb
 2024 21:36:00 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::2a) by BY3PR05CA0005.outlook.office365.com
 (2603:10b6:a03:254::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Fri, 2 Feb 2024 21:36:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 2 Feb 2024 21:35:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:35:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:35:59 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:35:57 -0600
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
X-Inumbo-ID: 1041dd65-c213-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNzwinYcJJSme46a4s+2b94tFowL2cHyt5VCYSpQoKQcfmj2TJwRIEklsjENqH//1ghEVxT6jJfsq1APAh2fawq8oTsH1R8HdwTTzNtxejL67M5U7iOY0xf1RsxjzT1m/J2ckE+pDIv4hZsbzSPvWGxv/kewE/cb0i+ccj1ZoA+UYNT1VlyZptSt+VS+qWe6BAB+6+VK7AMjxFsemZigZLvzR/wtCeQMbeUP5THvVjpzIb9LqLjYDMKy12Mowoy43fxxpAxDyxOVkm6WQsKGi/rQuQiLOYGflvPZQdm8ngAefmmc7fhqCA5zVY7lEIKWrYz1HEo0LvHY4QwjJ/ttvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhjSNHqgk5XVfapJjt8Oh6Wc0r8aqkJq3Ia//oNN7uA=;
 b=VRHaH297bBHkpV6L1/K1meALhKCHNchBqDpl8wgRg7u8e6sDNUWat4FdQH+TnCTAI92+SK/DnvmDLQ08HWYy5SpNParYvRuwfyeod22YpDuj4uCL+2USLhUhgODAAPb8xrA1dEk5+rSDLz1DJBaL/+aCDCy1tJRj5TLQo38gzDg5AQFFN1jb+pScRHpq7xRYjn3SEryst7CKIq0+MDMZFXzNN4Xjf8TkM8Jqkhidnu4vxztF7NlAx2otXIfO5fQY93QSWoG+llFH80dgwP78evDwt0Y6pPDOmZyAV+G6wygtlYZz2bQh9girWPOBrCjhL7ADXFIehe0BwallzkE8hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhjSNHqgk5XVfapJjt8Oh6Wc0r8aqkJq3Ia//oNN7uA=;
 b=TfKRBo/y1ROvr6RlmamvsDobCH6N1C4xZz72Im24s363UzPya9f/+J79xlXa4n/CPfdCAQpIEpbXWVg+gN9PozKuk/7RmakwSR/lp7GazetnovbfYcr0kIYI/KvZvb/h/p3WpdAkn3pHnMI85KQd6iWHCSvSrofwiSDVDuAxs1U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v13 10/14] vpci/header: emulate PCI_COMMAND register for guests
Date: Fri, 2 Feb 2024 16:33:14 -0500
Message-ID: <20240202213321.1920347-11-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b26f68-4d2e-4929-265e-08dc2436f2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ijowIiVS/xfTikK2Q9f1ShhLcqaELW+irl/FfF5KZpv3e7E7iYqkEeaDmn3VUiakugk2W0PM7soeVn3L75KOJquyC6YdEMJsjXCX10PrUYbKkPrb4abuk2H+oW9W8IXgTNI5kicAk2pfggpGlca/4rqz++Fed7BoXi0wkbY3nBHTmrbW+JZLV72nxGob81/G5eI1VnbE0LiB7ZJOdSMMoanzrtUWO93zz4h0MC81g5y4BTwY65B9MFHfZK9sh82QjcOkLTC7L7ZOc1TM6xeZdOJR3R1xt9YF6RR8OwxldG+T62EQ8y1oqZvMkjpEgyhwJwrOAZDzGakMzoKWzRk3nd/TYrbOzE7nrzAFVuddyUHm5ciPJ97dyOIdV7GRiKghESiHJnyiPtiiRYbuCtOXmWLp1BI1oLXTV8GbiMjA5np21mkcf+oCIH1IkJ6oP0X7rGlsW/fOEX92KR1GLzarjsLibV5Df9JicH0s2vzg6jpfKYxPN2GvvpprVu+2dCmiecfYYSEP+vfaJGIZZbutea5IejOOwtoqv3I2Yr4Mvqe0EJCJLYGQWbqVeZpKEkexhHQGfOgL4HLy4ijzLv5X5p0QfIt+WyTn6fCfmork79RWEiNzDK/V7R4VhSqrRsxTj/0LuuO3QT2rELBO1CncEdjAuh0EFLAGYnh0ei7Ye+4ZnhLcYA7MZQDEvPm1H9TNET9afsX8uoTWH+0tRiMS2xitUA24d16tSDyObQkQPKnQYKyvO+TMvBy2cZwIFETJbVnIooc3277cbFUbgVaQtA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230273577357003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(44832011)(82740400003)(54906003)(70586007)(8676002)(86362001)(2906002)(8936002)(30864003)(5660300002)(70206006)(4326008)(7416002)(36860700001)(478600001)(6916009)(36756003)(316002)(81166007)(966005)(6666004)(47076005)(356005)(83380400001)(26005)(336012)(41300700001)(40480700001)(40460700003)(1076003)(2616005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:35:59.9341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b26f68-4d2e-4929-265e-08dc2436f2d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838

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

[1] https://lore.kernel.org/xen-devel/86b25777-788c-4b9a-8166-a6f8174bedc9@suse.com/

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
 xen/drivers/vpci/header.c  | 57 ++++++++++++++++++++++++++++++++++----
 xen/drivers/vpci/msi.c     |  7 +++++
 xen/drivers/vpci/msix.c    |  7 +++++
 xen/include/xen/pci_regs.h |  1 +
 xen/include/xen/vpci.h     |  3 ++
 5 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 47648c395132..5d13ea975cc2 100644
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
 
@@ -836,9 +870,20 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( pdev->ignore_bars )
         return 0;
 
-    /* Disable memory decoding before sizing. */
     cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
-    if ( cmd & PCI_COMMAND_MEMORY )
+
+    /*
+     * Clear PCI_COMMAND_MEMORY and PCI_COMMAND_IO for DomUs, so they will
+     * always start with memory decoding disabled and to ensure that we will not
+     * call modify_bars() at the end of this function.
+     */
+    if ( !is_hwdom )
+        cmd &= ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
+
+    header->guest_cmd = cmd;
+
+    /* Disable memory decoding before sizing. */
+    if ( !is_hwdom || (cmd & PCI_COMMAND_MEMORY) )
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
 
     for ( i = 0; i < num_bars; i++ )
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index dc71938e23f5..1e747ad9bba8 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -70,6 +70,13 @@ static void cf_check control_write(
 
         if ( vpci_msi_arch_enable(msi, pdev, vectors) )
             return;
+
+        /* Make sure domU doesn't enable INTx while enabling MSI. */
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


