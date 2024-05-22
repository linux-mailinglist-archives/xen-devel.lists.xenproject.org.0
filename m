Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE4A8CC945
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 01:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727903.1132592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uvq-0007Jc-DC; Wed, 22 May 2024 22:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727903.1132592; Wed, 22 May 2024 22:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uvq-0007HP-AT; Wed, 22 May 2024 22:59:38 +0000
Received: by outflank-mailman (input) for mailman id 727903;
 Wed, 22 May 2024 22:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=31Ro=MZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s9uvp-0007HJ-At
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 22:59:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f475f494-188e-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 00:59:35 +0200 (CEST)
Received: from MN2PR01CA0060.prod.exchangelabs.com (2603:10b6:208:23f::29) by
 SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Wed, 22 May
 2024 22:59:31 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::a8) by MN2PR01CA0060.outlook.office365.com
 (2603:10b6:208:23f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Wed, 22 May 2024 22:59:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:59:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:59:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:59:29 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 17:59:28 -0500
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
X-Inumbo-ID: f475f494-188e-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDQVcd/ZyW2nzp4S214UvjpaiC8CuSdExpQblx7tVbT8odBLTxxwLobBYbo2EtjjQdgVhQ103CQIxVTAc3G7USnvvG0Vj6cK/25LqBAGSxebACCnEBhC2MoShrWyqWEXVlrnhBecsABTtt2+Y4ziMnth09/LoPKVHCXvo1iDNSUgchmBOU2qJxcNsdyPkmRa5KaxRe8V6W6CU4rNAULfpEOnTQohiOUXBhUi8TDQ7Ii1QcUljMhHhWLkkM2PloNFDpQevEK1owDY0kCUeBgGU95VdgsWbbxtUi5I/GhGSkU+uPz58eXmML67mm+L2lWc1TSeKXEtG8HVqRlQwexJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTMLUqBpPTGO1t5D5YY5Wm1WqI3sQqiLCW/DYasj35w=;
 b=OZEZxrrg9LKrtnbG6BeGzcbPcQrZNdWnHpo3CgS6TAdSl7uLZ0uTEfwhz5z9RtSeGZFJWtL6JOJP5sxaD4eOkd9K6rYZ9FJHApp9yAhO8ybU5VDNOA8ab5YfgxM/S71/PDvgAX9KfKExTTqMwPUZzF21PUJ0BJ1+uxqVTrwqQ06rsoZPctv40piY0u4yMgmOVw+0b7BeQ0aeMwimZO8Oi8jVytsBQZ2bisv1jFFHuRpStSfB0JlGuDxu1Ws0ACww4Cv7lZxdr1xDRbE8bc1w57wBp+PFkogarVgN8DtqeHZIIm7lBaiDHcl0j9hXrHTyD8ccR0inRHSmnHizW4lWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTMLUqBpPTGO1t5D5YY5Wm1WqI3sQqiLCW/DYasj35w=;
 b=b5dPT2VsiUTDKuP3JTZmOt0DigkafYWXDNlZSn/fvRKLbBMrRHTPSIuSpNBM80OpY0AkI+vIuQwRzttCz5pN34yJdpNo1S5wogp3YAFgVR+Mdtde8E8MSWd/5VWdBm5mGeSWIC4t9AJh4fgBt2f1WSYjE16Bu1bp9I0LSvcY+mg=
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
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v16 0/5] PCI devices passthrough on Arm, part 3
Date: Wed, 22 May 2024 18:59:19 -0400
Message-ID: <20240522225927.77398-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|SJ1PR12MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 686bc822-8494-40b5-f345-08dc7ab2d6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXJneXF6SmxEaG03OW1qMEdWM05wRS9OSkVTQm1NT051Z2FsZHl5NmwrZ1Az?=
 =?utf-8?B?a2sxODd5cE14VU9XU0IyRFpjS1NQYTZzd24vSHYxN2g3TThRNW84aUZ3NGZ0?=
 =?utf-8?B?SHZhU0o4dnNwN2pTZVJGRSs0WDBmQ281cHVXY2IyNFg2R1cvN3ZsRy9WK1Rt?=
 =?utf-8?B?M2FhUzFNYnArTm83cVU0SisvQ1k0YU1EWjJJZGgzZ2txRFNpRWRhNnl1bklH?=
 =?utf-8?B?TnB0aXU5UFd3Q0RENGZSdVNkMm9MWFVxR2FtckVBcFhteGZBeXE5dmx2RkdK?=
 =?utf-8?B?ZythUExCc1hjRmQ4dzE3cG9SWmdoYTBZd21RMkFlL3dERG1lcG9ndTFjZi9t?=
 =?utf-8?B?VURjMVN0VVFCNC83bjhYMTN3WlNVYWdEK3daRGlLU1hjQ2FCL04rcysremFT?=
 =?utf-8?B?NGtXZ21XQXBPemx3dG5qdXdXdzlwRytYa2xURnd1L2lJV1hFMjdrSXloZzNN?=
 =?utf-8?B?bUhBSnY2bTRoZjhyOHRkeitkTENiRHZacmtSY0FQQjIzYnN2d3lJY2pMdGQy?=
 =?utf-8?B?RVFsMXE1Y0U1SHM1bjEydm8yZUU2aGYrdlVYNS82d2JySVp1VVhoc0Rxallz?=
 =?utf-8?B?NFBzbVhzZjVVbW1yaUlweGxZbnMxL2xLdGphMW5NSFVNYURZN0hKMmplamsv?=
 =?utf-8?B?eHlHcEFUTTJiR1J5MVU5SnRDWEl1d2lmbW5pZnpURXpvSmNnRUJ5d1BGNGx4?=
 =?utf-8?B?SjVPRFJkMm0rK1pIMThPMGRqVVJpQ2t5V3VrWHEzNTl3ZWRQMktJOGpUT1gr?=
 =?utf-8?B?blFQdDVvdlVVTzhWQkVSa2kvcFR4UGZqT0lSeDcrRURQWWZla3IwOEdVTmht?=
 =?utf-8?B?L1h3b1JYWm4wOXN6U0lyWmFyQkc0Z0lPMDBYcGgwZmVic1p5OFlDbmozZU5w?=
 =?utf-8?B?VVY1Z2xIYkdoRnRnaklrbURYK3RBcjFrMmd5RlRPN294SVlnbEFFU0ZwV2dh?=
 =?utf-8?B?emVVUnhDRDM3Q1docjFjOGsvTUxXOWJKN3FVWVRZbVNsZHpYZlVUMEZFaEN4?=
 =?utf-8?B?Z29GeDZzSVpYaFlZMTgvTnk2RkRnaHhSN2xLRWJDWnNwUzN0MHlod29pNnpt?=
 =?utf-8?B?QkdFYllHNmRVR2duYWZxNG4zWHN0NWZ4ZnFUY3JLaUY3UHZzak5sWVF4UDQw?=
 =?utf-8?B?b3hCaXUxNGlxZHV2RE1rMHQvUXRZYkJxbXlwTjhJZjlYL0VhbWFpNVp6cmhw?=
 =?utf-8?B?elRaQk80UlpoMXJmTDMwOVN0aVJTbHM2NGtBeEhtUTZzempxOFNtN0d0R09O?=
 =?utf-8?B?UkJxYmh2VHZDNHNVQUFrWjJFamx5cFlpVWt2dHZXUU84V0ZEWUdmVnBXczVn?=
 =?utf-8?B?QTRDTTdGUTRQN1puTTJuL3hmQVRXVS9hOFlURWtHNDZxQkZ0azR4aWM2QXc1?=
 =?utf-8?B?RmpGYnpKUTQ1RHROK00vanBhTFlZZlBHYm1KNG1NVEdLYkdmSTYwek9CL3RW?=
 =?utf-8?B?SHo4Sm5tUXpRbDBKY3BoVVVVV0l1eFlKMnNoZU0xN1pOR1hoSzJ1Q0lyOU1h?=
 =?utf-8?B?V1puMGp3Qlh4b3V6dlZHc2hDMUQxbGNITS9xTkRqbmtxZm1TNFplajg5MTZo?=
 =?utf-8?B?aFZTUnI1NzMzNTBYUXVxMThFbEJGMGlNQUdoUnZLdmRrSlRXSFNxMTZKNFYy?=
 =?utf-8?B?dDQ5TWo2QlF1UWVGSmMwMkcwV2ZURS9uTk4yRWVYQnRTR1pNb3ZLZStLVmdR?=
 =?utf-8?B?Yjg1Yk5wdGlJbS82WVRyUEZ0QnFlSWUxTFgrd1JuSDBsU05rV0NlQndzS2sv?=
 =?utf-8?B?TjVXa3RJdnFwOEpEdENxRFJKNzQxTkc1dmlJeEFsZ0Z4SXh0Sk9QeGtEckpH?=
 =?utf-8?B?MHJWM25QU0JrTmlFcEJQNFNXK01MTy94UjFtNjk2RGZjdHBGZnMyd29BZWNY?=
 =?utf-8?Q?bqCyfYE37wT51?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:59:30.5060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 686bc822-8494-40b5-f345-08dc7ab2d6be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

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

Oleksandr Andrushchenko (4):
  vpci/header: emulate PCI_COMMAND register for guests
  vpci: add initial support for virtual PCI bus topology
  xen/arm: translate virtual PCI bus topology for guests
  xen/arm: account IO handlers for emulated PCI MSI-X

Volodymyr Babchuk (1):
  arm/vpci: honor access size when returning an error

 xen/arch/arm/vpci.c        | 63 +++++++++++++++++++++++------
 xen/drivers/Kconfig        |  4 ++
 xen/drivers/vpci/header.c  | 60 +++++++++++++++++++++++++---
 xen/drivers/vpci/msi.c     |  9 +++++
 xen/drivers/vpci/msix.c    |  7 ++++
 xen/drivers/vpci/vpci.c    | 81 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  1 +
 xen/include/xen/sched.h    | 10 ++++-
 xen/include/xen/vpci.h     | 28 +++++++++++++
 9 files changed, 244 insertions(+), 19 deletions(-)


base-commit: ced21fbb2842ac4655048bdee56232974ff9ff9c
-- 
2.45.1


