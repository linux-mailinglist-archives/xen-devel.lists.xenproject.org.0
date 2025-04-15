Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E33A8A4B1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 18:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954252.1348555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jYE-00075H-9z; Tue, 15 Apr 2025 16:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954252.1348555; Tue, 15 Apr 2025 16:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jYE-000736-72; Tue, 15 Apr 2025 16:54:22 +0000
Received: by outflank-mailman (input) for mailman id 954252;
 Tue, 15 Apr 2025 16:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o4sU=XB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u4jYC-000730-U4
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 16:54:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43fb7895-1a1a-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 18:54:18 +0200 (CEST)
Received: from SN7PR04CA0052.namprd04.prod.outlook.com (2603:10b6:806:120::27)
 by SA5PPF06C91DA0C.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 16:54:13 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:120:cafe::bc) by SN7PR04CA0052.outlook.office365.com
 (2603:10b6:806:120::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Tue,
 15 Apr 2025 16:54:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 16:54:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 11:54:12 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 15 Apr 2025 11:54:10 -0500
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
X-Inumbo-ID: 43fb7895-1a1a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoSQ1c9DiXU7ORApkphSVsqQP48bESca7lZKySy7SJsBESolauoFxypFv4/4ruTZy8XI7JKz+Rv8FLLwr9wwIk9yjJwQEI5s9TWpgJw7zr1aQSg049irUKIv50TeHf6faUltVeJ+Wk0ekgxW9saepWY/8xx2jfzeaD82FGjKInbZiS3RU3+kzZzFAtGPJ9ANCQoWA1+2LrWIfDfzTM5yAe99LYDbfdRyN119ux1j4HB3606gcFOZr2JFIwv+JsNX82MUN9M/qtzWNlW5rHyB2M8zC3g3U2GsWUdzi5M9axHQqUNJXnNKFWa0qwhncwCZOZFLstjE3L6Hdg3RuWF6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfR3p4suQBhzf9heVNfDd7t/UrQFVH0/FQ/kI3/lr/A=;
 b=PzwbL3iQjed6P3GO3Na2i2ABou94dOnouA3wTc3gEPf/PYSxKVCdtRF2DVw9lFhby1JICZvp3iO54jxtITQaSTfphK3xhHBgJ2mS8WsI3A9Hglo4PtxrPZLqa2GiquOiiS/98o51za/1bH9+HnvfwDAiFehBvuOcx4x2sU8FTJkNnM9nKCGsKFa24KPJ4ANe3Fskcn+X/R4qSsFFq73AlMW7+Tkm1Ni+3En0Dig3wa1oL2nhD2aDok/w3uciGLdAIfFzSBdhSf1hTty3Ifin4ZPhZ7k++gXfgnfYlbZLpSmwF1W83vjo1OZpamIINOGN2VyIk3H+W8xc2ZNmWZ1ZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfR3p4suQBhzf9heVNfDd7t/UrQFVH0/FQ/kI3/lr/A=;
 b=z9BK+JeOThFBki4VMROyeStu2vl4uoasSJ3TRyDnD2NaD7UqzzvRvF9awakUuRr9z87oT3laJsaLw7M4uSDClI7l8ZVKGnT27rlkSYt5SyIonYTA0cYSh0rQU3CJPgOwv0mVVRdeIPnZgCVmanqnfMRerDhh87IBZaPb/HAQYc4=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Jiqian Chen" <Jiqian.Chen@amd.com>, Mykyta
 Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v19 0/3] PCI devices passthrough on Arm, part 3
Date: Tue, 15 Apr 2025 12:53:59 -0400
Message-ID: <20250415165404.435506-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|SA5PPF06C91DA0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5765e403-ee9d-4779-ea25-08dd7c3e2656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXhoUEpTcE1NRHFXMlRuVzJVQ3NnYUdiQStuQVNFTXcrd0ZpTDN6RVNtcURR?=
 =?utf-8?B?L01YWng3REJsSExId0lkOXRKay9QVGwyOEdaN1pLSEpVMTlpYS8vSzlIZFhj?=
 =?utf-8?B?RFFrbEtoMDVabk5ZTVdnV1pEa2ZNQVFScktCTHZ1RnBwKytOTlJVdEpPRnlt?=
 =?utf-8?B?c3Rqa3RWNCt0NTQ4bnpoTVJqVCtUdXNvdCt2eVZRMEhIbkNXUmN4NG1xa0NL?=
 =?utf-8?B?dy92eVRyME8zd2NjWmZlZWU0NE1tRmpFMzRwVGdQaEVFZm9ITWs4cEhVZytn?=
 =?utf-8?B?VFc2WVNhTjYwVDBlVFlLRmlpeXltME5PWFFNcFVheHZaZVA3NVhBMzBHQTYw?=
 =?utf-8?B?cXc4SS9TcTlHT0dyK0xSMGVld1BwdWR6VmJCMDdxQTNGVit6SXhsRVNDM1Jt?=
 =?utf-8?B?U21CUGwyaDdJNDBMS2p4Sm1xdklrU1hrb2QxTWZGN1BnNGJFVlVrRXliUzJE?=
 =?utf-8?B?Z1V0OFp4UEU2ZjhobUx3V0w5eGxYV1BhdUN2RlFxVWpWU25Rd2s3WDdjcUx6?=
 =?utf-8?B?RXRPSW5CdU1zRTgvS0dHTG53bnJ2ZkNXdy9NcVNrQXE4TFVyZ0xIWVE0YkZj?=
 =?utf-8?B?bGVQVFhmNkRYZWJzNkJJY2ZlVWpmM1BLREplQ1VuQktwMkh4UUtBMCtQL2o0?=
 =?utf-8?B?eHpBVllxSHZPSDduOGNnT0xxdlVPK3JQazdadEs3U0RGMjBEY3lIT2pvdUZQ?=
 =?utf-8?B?cXhOYk9XUnV6UGcxam1rVTdzVytuRnpuRW8vWkhyQStkY2s2MWJMQ05FREhs?=
 =?utf-8?B?cGNBMms0MGhkS0VZaGVNenJQWlBhY2IxZ3NSRHUxYVRCNng4a0hOTXphMGpF?=
 =?utf-8?B?R3lKaTc2d0N5Zm1QL09ReEI2Tm5jR3lyM21NUkt1NnNHeHh6dFBKbTdaMGNV?=
 =?utf-8?B?TVpkUG9GL1YyV0hoTzFDemY0NFJ5RTg4cWZoUy84WHJzZis5V3N3WHRIOWhJ?=
 =?utf-8?B?WTZncDRNSWJ1THdCN0M0NFZzKzVpanVsOW5yWkZkbXBvelRtWE14OURsbHV3?=
 =?utf-8?B?MGhvL25KbEI0SjViVEpHRVF1bnBTN2tjS2xOVXFWaDY0bGJPQ3VlWDExVHdn?=
 =?utf-8?B?YTNQMVM3V3hONmh5Ym1VUE5LK0g0SUk4d240alliSWYvbWRzaGFYUGw0Zjk1?=
 =?utf-8?B?N25oUnFLd0dWMHZSTElDcU9uMCtYdk44KzIxaGZJenB1a09JNDFqNU5FMll0?=
 =?utf-8?B?ZndtM2J2SSt4NG9zTVJFOHJPcFlQbGswWHhWQys3bjV4T2NxYXFUTXZncWpL?=
 =?utf-8?B?bGdyajhuWG02NVVjbjBieEJtb0hXRElTR216cUlqbW1XNTdQWW9xdDN1MTNG?=
 =?utf-8?B?QVJQVWVyUDhRckI4djZLRVgyUDVxOEd6Q0xqYnJnK2hYclVySGtJUFIxS25N?=
 =?utf-8?B?UnRvMUV3Yzg0cncxdzhobFdCVXFiaUlvVzJKUkhWR3ZRTml3ODh5Y3MxSWw0?=
 =?utf-8?B?bjZMbWVCNUJzSDRsa3IraFJMZnZha0wrUmNoQVBSdzlWTHN3cTI1bzNMZGNu?=
 =?utf-8?B?ZHd4SW5XYTYvQnE1SFlHQnFpYit5SVZIMEozZ0ZBRnNsekIrOVQ4RzdrUWU5?=
 =?utf-8?B?N1JmUkJQV0RSMGU1MVBRd3drUXE1OVl5SDNIK1pwMXVLSUZJUlJxSTZJUDda?=
 =?utf-8?B?NU0ySE5qbEFvZ3lBeXh5RTBhUi9HMko4TS8wdlJBamJIWGJ1eEliRUp3L0Q1?=
 =?utf-8?B?em5TQ2hUcVI3bU1VQ0pvUmM0RzhIVUorTDhIc0psUjA4YXhBU2VTTnNjc1pY?=
 =?utf-8?B?R25jRTBxbEtnY0JuMHdHNkdMbERYdS9kbHM4VVpScHlxQUQyVkNiZEloNUpD?=
 =?utf-8?B?SXlLNGliSi9pbDZpd2dENjQvRXlaL0Y1Tzcxb3VIc29CMFRuOFZZd2RRSVlo?=
 =?utf-8?B?S3d5ckpDQS9hR0tpemF2NWt4U1F5M3ZCTEY0c2FGaFF6S3kzaGdYUi9Waytv?=
 =?utf-8?B?T0FpekdRRWR2dk8vWURDSlRuWFBuRTVlemNMbmhiMTZ2OHpvZW54MzNjNVk3?=
 =?utf-8?B?VDdhZ3lxbjZtKytLZUVKeW9lZEt4VDlnbDlXdzBjcHpFM2ttVjlzMWtvZWFS?=
 =?utf-8?Q?3cDvCy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:54:12.8900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5765e403-ee9d-4779-ea25-08dd7c3e2656
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF06C91DA0C

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

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
  xen/arm: translate virtual PCI bus topology for guests

Stewart Hildebrand (2):
  xen/arm: check read handler behavior
  vpci: acquire d->pci_lock in I/O handlers

 tools/tests/vpci/emul.h |  7 ++---
 xen/arch/arm/io.c       |  2 ++
 xen/arch/arm/vpci.c     | 59 ++++++++++++++++++++++++++++++++---------
 xen/arch/x86/hvm/io.c   | 10 ++++++-
 xen/drivers/vpci/vpci.c | 45 +++++++++++++++++++++++--------
 xen/include/xen/vpci.h  | 12 +++++++++
 6 files changed, 108 insertions(+), 27 deletions(-)


base-commit: 38d07809794e3c723a4de7e10c25c1f6cb590dc6
-- 
2.49.0


