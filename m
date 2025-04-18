Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3110AA93E13
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 21:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959321.1351710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5qvT-0000tA-T0; Fri, 18 Apr 2025 18:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959321.1351710; Fri, 18 Apr 2025 18:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5qvT-0000qY-Pe; Fri, 18 Apr 2025 18:58:59 +0000
Received: by outflank-mailman (input) for mailman id 959321;
 Fri, 18 Apr 2025 18:58:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHr6=XE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u5qvS-0000qS-RQ
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 18:58:59 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d8968e1-1c87-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 20:58:56 +0200 (CEST)
Received: from CH0PR04CA0077.namprd04.prod.outlook.com (2603:10b6:610:74::22)
 by MW4PR12MB7167.namprd12.prod.outlook.com (2603:10b6:303:225::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 18 Apr
 2025 18:58:49 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::5b) by CH0PR04CA0077.outlook.office365.com
 (2603:10b6:610:74::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Fri,
 18 Apr 2025 18:58:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 18:58:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 13:58:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 13:58:48 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Apr 2025 13:58:47 -0500
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
X-Inumbo-ID: 2d8968e1-1c87-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zABPivWNnMYZMbfKrJViTa9zVambY0sy8eQupY2q5FpxN+oBaEsEsekAy+IslUZY/5OJ7VcuxSEQaH5aA9AhvBvYt4ASFJ/24g7UP9sNCXTJGRDg6zjmMKVjR6wqqDaJrNBHVBYHAAxRzbnVAfIh2qH7qoPEG3om0ExtH8lUr1fRctwMw9aRt6ImAhkQ/eW5mKPrh1mEzk2zWf9V9FtZ92NKD/qfPo8vi3C1RGhQiROnu+ze6jfzNK4ZVNc5YenfDu03CDbcqAOwuVDRZOI5oVoFPJjb5/Dnz4MwvOrxT6vRAj8qvgIY4+VAbJtwIMtcMTPLppxTPhD09px1Z4YOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3XYn9iftCQ0xSKBwK8jUjDuq6/npPWK5ey/U8R0amE=;
 b=T8Zw6qMYPpHl2mBGPq1fwrZQcKIW/c82kKtX2mXb32EU9DdgBTjPk7PnaU0LMjPaMDNXYIJW1EYCOZuNH0xNxsHCcJOxDzo5Y1D+YvNiwJ74i8AmSmYSJx8a5mgE5taIIbbG0KDriUM9QY5c9DETKFiwCuSu1Losg0Vj7GCW+4Qn51ZiQRAC5bjQ39FpksVeWl1dEr0MtVblVxqXA1haaP3lDEB3L43sPs/0AQ3zNSl78mgqoO3s1D5nWuL4iBAkiDTkgbKmk9QQEKmDi4+8noBgJHSSjJsedvJWjGfZrfLVZ6cvZbS7qisCOVYOtpGvcVq8Uh6bbVmypZDlreBXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3XYn9iftCQ0xSKBwK8jUjDuq6/npPWK5ey/U8R0amE=;
 b=HXYv0WoSCRbipT7tU/Rh+FjxeMpbbim0ErJwABWiEKcGZliBgSFuVtLO2gkrWTqBYfIBbLg6lQpwx/n12bhyIZn4kN008h3aSOrVkh03NueVTZwDJxeSRWPZqdN4dupVk0vbhjwZHUTWgbqEf2sJ8XGMkZNr+UdTGNPl82DEJ7g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jiqian
 Chen" <Jiqian.Chen@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v20 0/2] PCI devices passthrough on Arm, part 3
Date: Fri, 18 Apr 2025 14:58:35 -0400
Message-ID: <20250418185840.335816-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|MW4PR12MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c28c3c-ccab-47e9-de6b-08dd7eab0dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmU5aXVzQXpjUlhyZnRrcExENE9aVlY2cUF3QjJYSS9Wekc4WDNRNU1HdDdR?=
 =?utf-8?B?emhVVjZkajdOeDBEUWluMS9TTTlpWjV1VDdLSklVbHRlYis2MWlKREplVXNk?=
 =?utf-8?B?OVlSUzJxUE15Q2hIbm42UjBvOHU0WVFCTXdwWU5mV29VZGVvUTJFMjFCd3hv?=
 =?utf-8?B?bHBsVVIrd1dEQktvVmZZMk03NUZiZVd5dDQ2eW00cXpOSFJsb2pZRzgrTXhy?=
 =?utf-8?B?WG92bXRTaXZqU1dwT3FFdUE2a3FlTW9QV3hXeUt1TVFURDFGT1QzUnI2UzNK?=
 =?utf-8?B?eFB4ZDE5UGVCREVlQU8rMzhjVUlUdmtMTU9JUnU3c2tUMjdGcDgrdm5nU0hD?=
 =?utf-8?B?S3FJeEVpK2s3OEkza1hBRENMUWF1bkkxcUxFZjdwSFBWZkRNQzh6emEvV2p1?=
 =?utf-8?B?NmxDZzZSdjVMTTNDblRMSDVlbDdOTWVFc3hIT3MzdmRrZHBvbm45Q0tWZFNs?=
 =?utf-8?B?RTlCSjQvV1pBb0c5Rk1rNUp2UDExUjcvb1NTTjJoeVdCR1VJVnc4K1FpajVL?=
 =?utf-8?B?QnZFcWV0a2UwUzY0UGhPbi9SNVpkbnpOMXppRmszdmtwd0JIdmVQOEQzYTNL?=
 =?utf-8?B?NUVqeVFhSW5ldE1SR3JMZmlUTFZ5SGVKaDdqbnNrMEIydEFkY2RKQjJVNTR1?=
 =?utf-8?B?Z2lhanZuaXhleG9iQmN0ckQ2MU4weVRHSS94YlhneFZIVXI1MUxuMVltMU9O?=
 =?utf-8?B?QnBRZXFUK0s4WkVtQzY3YXJXQmVrUUgrMmhxSUJpWmVWZHdvTE1IZlI3YUJC?=
 =?utf-8?B?d0VXdTd4amtLMmIzSDNDekVZUDI2NWg1QmhyaTloMC9CaFN2cThMazh0Y0Vn?=
 =?utf-8?B?YjMxWlZiRlg1UHpKQmVzV2xodHh0RnhDTnBucjdkYVdJOWRtalVyTEIvc0JO?=
 =?utf-8?B?UzI0MTM1Y1dQNEZxNmFiSThjTnlBcnJiSXc2dzBCMEJiYlZxU2ZGYmNvV2hV?=
 =?utf-8?B?TUY0UERHa0g0bm4wTHlYenlTNXpKWGcybDdUOWViMWk1cXNjdUtmZGNrc0JU?=
 =?utf-8?B?ZEpOYjkyallPRGIyb0k1aTNGZENUWjlyTVNEek1oOWtQc2luRjFZZG0zSzVB?=
 =?utf-8?B?dHdQcWhvR3VyNldHbHVNc0VIT29abHFhOXArU1ZON1p5eGFPajF4bzVtcnUw?=
 =?utf-8?B?Mlp1dmdmakpPZGI0VWJQSFo2NDRzWXVzRHJBODBBODE4SDRYYWt1TWVrYVFi?=
 =?utf-8?B?NmVGOTFIZ05yL2xzS0RnRXhLQzhvR3pWQjErTmpIZGxyY3B4czZFcXZSUW8v?=
 =?utf-8?B?NEY0ZURocGpVSllNa2RBMHR6TWN3clk1M243UmRZSXluU1ZoTDBEamZwQlVD?=
 =?utf-8?B?M0lobWNYamtERExDZmxrTWY1WHpvUm1CUjBOQUh5L1NtSUc1em9mV25xbkpn?=
 =?utf-8?B?RXVLamZEK1hDRFJpNmRQUUNNaWJUc2JGQkhCSHJ4M01DTGs5UW1wQTFnMDVH?=
 =?utf-8?B?L09ITTB6eXk2UHJhVDY1L1FVci94aEtOMVE1TXNuZ1lHdzFCR2NiK2tWZVd4?=
 =?utf-8?B?T0pnKzRINHlMMjRRRnl3eXE5QnlMQVFBMHk0ZkNhWUNNUWl0cDhFWUlhcGdi?=
 =?utf-8?B?R2F0VndtN01Hdk5UUi9xYW84dWx5cnowY2krRE5kd05MdXBsMGNIUmlYbVkx?=
 =?utf-8?B?eG1VSURKYlNvYjRORjRQc3JkRXp5c013cTdzUXJxaG5uZW9pcjlZTHZMS3BJ?=
 =?utf-8?B?cDRsaHc3cnlFQk16dkVMa29QMjRSR2owdGl4UWFlS2d5WEgzVVRWSUJHYlpQ?=
 =?utf-8?B?SlI0b1hKeEM2c3lEeEZRVW90UjZFWnFJeUZZTnJnRExZdmR5RkQrd3l4TzVB?=
 =?utf-8?B?RVM1UDZZbWFHaFl5R0NIZ2NnQkhtL0MySGkyUit2V3l6OFdaK0xneFRuOHdm?=
 =?utf-8?B?YWR6ZHZ4b2didFZ3V3dsVkdQc3BiQkhlQUhRSWFRUC9SbWs0L29DQ3l2aVlX?=
 =?utf-8?B?Q2FpQWp0TjBCUGFFNHlzZ0Nyd2pCRmNKM3ZSMnl0L0VJb2VtcDJ3S0RpVlZP?=
 =?utf-8?B?RytmSGg3dG1VVjlEc2tBU3NiZlArNk5jMWpTRUhSdmJoaGZQRGVJczRWeUR3?=
 =?utf-8?Q?F/DIuM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 18:58:48.9728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c28c3c-ccab-47e9-de6b-08dd7eab0dab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7167

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

in v20:
 - drop ("vpci: acquire d->pci_lock in I/O handlers") as it was
   unnecessary

in v19:
 - ("xen/arm: check read handler behavior") is ready to be committed
 - add ("vpci: acquire d->pci_lock in I/O handlers")

in v18:
 - address warning in vpci test suite

in v17:
 - add ("xen/arm: check read handler behavior")
 - drop ("xen/arm: account IO handlers for emulated PCI MSI-X") as it
   should wait for future work
 - drop committed patches

in v16:
 - minor updates - see individual patches

in v15:
 - reorder so ("arm/vpci: honor access size when returning an error")
   comes first

in v14:
 - drop first 9 patches as they were committed
 - updated ("vpci/header: emulate PCI_COMMAND register for guests")

in v13:
 - drop ("xen/arm: vpci: permit access to guest vpci space") as it was
   unnecessary

in v12:
 - I (Stewart) coordinated with Volodomyr to send this whole series. So,
   add my (Stewart) Signed-off-by to all patches.
 - The biggest change is to re-work the PCI_COMMAND register patch.
   Additional feedback has also been addressed - see individual patches.
 - Drop ("pci: msi: pass pdev to pci_enable_msi() function") and
   ("pci: introduce per-domain PCI rwlock") as they were committed
 - Rename ("rangeset: add rangeset_empty() function")
       to ("rangeset: add rangeset_purge() function")
 - Rename ("vpci/header: rework exit path in init_bars")
       to ("vpci/header: rework exit path in init_header()")

in v11:
 - Added my (Volodymyr) Signed-off-by tag to all patches
 - Patch "vpci/header: emulate PCI_COMMAND register for guests" is in
   intermediate state, because it was agreed to rework it once Stewart's
   series on register handling are in.
 - Addressed comments, please see patch descriptions for details.

in v10:

 - Removed patch ("xen/arm: vpci: check guest range"), proper fix
   for the issue is part of ("vpci/header: emulate PCI_COMMAND
   register for guests")
 - Removed patch ("pci/header: reset the command register when adding
   devices")
 - Added patch ("rangeset: add rangeset_empty() function") because
   this function is needed in ("vpci/header: handle p2m range sets
   per BAR")
 - Added ("vpci/header: handle p2m range sets per BAR") which addressed
   an issue discovered by Andrii Chepurnyi during virtio integration
 - Added ("pci: msi: pass pdev to pci_enable_msi() function"), which is
   prereq for ("pci: introduce per-domain PCI rwlock")
 - Fixed "Since v9/v8/... " comments in changelogs to reduce confusion.
   I left "Since" entries for older versions, because they were added
   by original author of the patches.

in v9:

v9 includes addressed commentes from a previous one. Also it
introduces a couple patches from Stewart. This patches are related to
vPCI use on ARM. Patch "vpci/header: rework exit path in init_bars"
was factored-out from "vpci/header: handle p2m range sets per BAR".

in v8:

The biggest change from previous, mistakenly named, v7 series is how
locking is implemented. Instead of d->vpci_rwlock we introduce
d->pci_lock which has broader scope, as it protects not only domain's
vpci state, but domain's list of PCI devices as well.

As we discussed in IRC with Roger, it is not feasible to rework all
the existing code to use the new lock right away. It was agreed that
any write access to d->pdev_list will be protected by **both**
d->pci_lock in write mode and pcidevs_lock(). Read access on other
hand should be protected by either d->pci_lock in read mode or
pcidevs_lock(). It is expected that existing code will use
pcidevs_lock() and new users will use new rw lock. Of course, this
does not mean that new users shall not use pcidevs_lock() when it is
appropriate.

Changes from previous versions are described in each separate patch.

Oleksandr Andrushchenko (1):
  vpci: translate virtual PCI bus topology for guests

Stewart Hildebrand (1):
  xen/arm: check read handler behavior

 tools/tests/vpci/emul.h |  2 +-
 xen/arch/arm/io.c       |  2 ++
 xen/arch/arm/vpci.c     |  4 +++
 xen/drivers/vpci/vpci.c | 73 +++++++++++++++++++++++++++++++++++++----
 4 files changed, 73 insertions(+), 8 deletions(-)


base-commit: 64cf7a80a17a017a6b88ea17c7f490e42baefcca
-- 
2.49.0


