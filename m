Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C6E8CC947
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 01:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727908.1132612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uwG-00005I-6T; Wed, 22 May 2024 23:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727908.1132612; Wed, 22 May 2024 23:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uwF-0008Sl-W1; Wed, 22 May 2024 23:00:03 +0000
Received: by outflank-mailman (input) for mailman id 727908;
 Wed, 22 May 2024 23:00:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=31Ro=MZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s9uwD-00085F-UR
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 23:00:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02b82ec6-188f-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 00:59:59 +0200 (CEST)
Received: from SA9PR13CA0006.namprd13.prod.outlook.com (2603:10b6:806:21::11)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 22:59:54 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:21:cafe::57) by SA9PR13CA0006.outlook.office365.com
 (2603:10b6:806:21::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 22:59:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:59:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:59:53 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 17:59:51 -0500
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
X-Inumbo-ID: 02b82ec6-188f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLwmS6ciPK4yUCw0wRhDKnGjjhzZjz0hp0ifIJLcg9rUv02fF0DTiadQNkJIwEbdTSCDpWKCsUbwkcmYIBh6/cpV81zgSmcNMMyCisp69TJUMDnJpGZmr5jJxKqmbSYLySlyga3dQsjipwPgSI1T1QPKwaT2QuJ+NOqMju4nxqZxyk28FXpJSfMs/Wg3wI03/6+01j5xfgTvd5c/RCGsQedApk+9hSQaXNPRCLSNTJnLFWENjcOciOt0yI/x5MausQ8jO5aQpghuYEDcxijcno9uFUT4WqYoVoIRcipEpDezuyyBfPYxgaJqZMI5jh1jyVlmxdfV2JP/VtoZnCRDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOnJWNfrhJ3Efv0BMkAnX4PfL/TY+zGAVYbpOc2ZfC8=;
 b=AKGmZa1jlzyD0w9esu1cSMwMrEEfdpGU3RZF0IgBCfjQ1u0w1sBWG0NM+7dAvdejPFDPsu4TOUCNMWW6QGREFyWmdxnw4hJXZ5xwQRk6ey+aLPZz5n0SbdexrLPVFuFkW/gPrAUJYS0fYYDzD1Zw775A7KldQHDzrGEJT3nEHZ8euj1gnXPG+dqxXQdLrwxywtpcS95hLCfBQZZBxOkdwoHirJYlDMePlvqGwcSFGR8Ybp/nwpaVL4Wrwfe26Zot/p6ibPVyHRJyccjKA2qYAr0ZUlNykOFiPyQjQKiZm9VbugdLsLS+8Ht9RLIr8p3uTYIk1c6k+YeZAC6to3lgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOnJWNfrhJ3Efv0BMkAnX4PfL/TY+zGAVYbpOc2ZfC8=;
 b=jV8F2kLA7ntBg3SHg5q2WDOmhI4OWfp47BHLr2dX1e0ogNVGZFxFr+R6I/3yMVeTG0k45XdRPWa3Z6cwiXAS1Vw0QK2cVOj2u5qtev+ON2oWl9JvrHFYn0XUxJZuFhbnCu3WcRz5qTxNCS1riEQljvre4GD3jetVUPY2NwlBkY8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: [PATCH v16 2/5] vpci/header: emulate PCI_COMMAND register for guests
Date: Wed, 22 May 2024 18:59:21 -0400
Message-ID: <20240522225927.77398-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522225927.77398-1-stewart.hildebrand@amd.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 151bd5f9-2278-4276-0408-08dc7ab2e48a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmF6M2czSU9YZU54QW9COVNzZFFjYUFRS0lTN3U4TlNRN2RuVUNoNW9zVjhT?=
 =?utf-8?B?dmt3NndwY0tmTmRxU0JmdDZGeW9sMDFYMGJZeFZmb2N3UWFEZ290S2M2dTJQ?=
 =?utf-8?B?azVqSmJxa2V1Z0UzNmlFK2IzOTZ0L2NnNXBDMCs3OEZZUmJHVk5mWVJhRUhN?=
 =?utf-8?B?WmRPOS9sTktGd1FMUXU1aU80ckhEbzl0ZkxTM0lTOUFmZ01rWVJ4azZYRFdq?=
 =?utf-8?B?eURVOGsxWFR6bk9EaStZalNsRFREUFNXandQY0lOT2d4bnVxUW1GQWpob3Mv?=
 =?utf-8?B?cFlXdnIvbU9tZG9Nd2JZTEFUZ3locGFVSnRhNWl6c2dxVUUwalNpeGJVOHVu?=
 =?utf-8?B?cEVIM0UxSEE1V2sxUi9pRHJaSHVwcnRCN1g0c05rZUg5K1gwdFV4UWROMW5N?=
 =?utf-8?B?dFF2T0ZCdGljbENpRlNhRmFhTTh1QjlpT0c2ZkpzMUpJNFp6RHlFMzJKTWZK?=
 =?utf-8?B?QkV0Q3R3azZ1V25sUG1hT3NEVFdrV0RSZ3lDQWZjenhTazhIb3R5VHdnOUw3?=
 =?utf-8?B?L01aU2FCbzhYN0JtTHJBUVkvNjNRaytwckNxOXUwdldpWklpNEd2TFN0a0pV?=
 =?utf-8?B?ZnQ0MisrcTc2bHdkbjVFTUpOT29naWdkalNZQjIvMmVmSDVVaSt4ckM5a3gr?=
 =?utf-8?B?RTdmbk9mN3JVaTdkZXJUQzlXRmd2ejN0NHhlSjlMQ25Kb2d4OUdndmkyT2Zk?=
 =?utf-8?B?aEdCaFpkdW9VWnNJVVd5VTJvRmU1blR0Sm4rc2N4NTc1TmFhMCt0ckU0MnV3?=
 =?utf-8?B?NHJhMzRvSUhnVitqMjlNVXdMVVJ2UnNLb0RIaU1lTjI5ckpmSG9Fc2hhNUFJ?=
 =?utf-8?B?cmtGSkNDWTVYSGdldXdJUDBwUXBOZWlSVVJ2MEhyVGZRWTlJd1cwQ1VrZFBm?=
 =?utf-8?B?d1ZnU1NVZXhqU0Z0d3NvdTlIYjVUUXdRMk5RQmRYVm04bXQxVC8ralZpUERO?=
 =?utf-8?B?Z2h1aHcyYnZrcWszNmE2c3lVaFZ2OVZaSGxsYnowOFlVSjRHV09wcmdxWUk5?=
 =?utf-8?B?aU5pVWJ2UjZreEhSSWc2V0pVSmpXdnp0VnR1T1VMZjhrc2hRcWE5WEx1YzA4?=
 =?utf-8?B?Um0yN0x1eHVVTmZja3V5cjVCblMxd1VZUXgxKzVHSCs3UzlNYWpWbW1WYng4?=
 =?utf-8?B?eDhabVplMlMvejViem9SUVhzNTRnRGhSOXBvY2dBZUJKSnM2VWpNeFFudmlx?=
 =?utf-8?B?Yy9NSXVVMHpXMWNvOHI0bnlKcUVmWkdjTDBYUklvSTZVNDI2bG1UekNoYVM5?=
 =?utf-8?B?NFRGeDV1a0ZJMEQ4UmR4cElCTGF5ZWlrVXo3cjFGT2NsY09UTmlZT3F1K0pl?=
 =?utf-8?B?V1NqUGM0SFdlM2k1L09xbDEvOFJ5UVFta2hyYjdZbHRRdmFvbFE1ek9HekxV?=
 =?utf-8?B?SXNXRHUwU3pOUmZ1K0lIRXhRQkJ0VVNJY09uS1ZJU3c5UWdTZktJOCtZTGV5?=
 =?utf-8?B?ZEZ2T1ExMnFMZzFmU3dSZURHKy9QT0twMzl3M2ZCbnRKTktFZzJSK0JETW56?=
 =?utf-8?B?aWhINnJqMS9nY1YyaStyQnB1eEp6Ym1oM01KallJZm9XWk9QNG5tUlVMOXZO?=
 =?utf-8?B?bkpQVDVJUFdWTDd2Uk14bDllYnFBUkhkd2d1cDM3QnlTYWRoV3lMOHlJS2J3?=
 =?utf-8?B?UThYbElJRWp6RVo3aWNMODdJNE5Dc0tSdlFPMHlMczNkMnRWYUFENm9nMmRu?=
 =?utf-8?B?U1J6dWR5Tm1lWXA2cDlyQ0JFVnZ2ZWxkcUI3R0xQMzF6dkpnSklYK0U5bG5i?=
 =?utf-8?B?QWVlMGZEcVl3Q1NDL2g2TFJ3MVZrNHUvbVkxLzVwWGFkcXZqU2ZnQTRJejBk?=
 =?utf-8?B?Y0xoRlZvU2Jrc2J6MnFhL1oxTGI2dUNTekR2VDloVExNOUUza3Y5OUZHZHVD?=
 =?utf-8?Q?9ZatuV2f1fTlU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:59:53.6160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 151bd5f9-2278-4276-0408-08dc7ab2e48a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133

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
  Xen domU: rsvdp_mask
  Xen dom0: We allow dom0 to control these bits freely.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
In v16:
- allow dom0 to freely control RsvdP bits (11-15)
- add Roger's R-b

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
index 47648c395132..ef6c965c081c 100644
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
+                                is_hwdom ? 0
+                                         : PCI_COMMAND_RSVDP_MASK |
+                                           PCI_COMMAND_IO |
+                                           PCI_COMMAND_PARITY |
+                                           PCI_COMMAND_WAIT |
+                                           PCI_COMMAND_SERR |
+                                           PCI_COMMAND_FAST_BACK,
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


