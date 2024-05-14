Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6E98C5810
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721579.1125105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tET-0004iY-Ko; Tue, 14 May 2024 14:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721579.1125105; Tue, 14 May 2024 14:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tET-0004gc-Hd; Tue, 14 May 2024 14:34:21 +0000
Received: by outflank-mailman (input) for mailman id 721579;
 Tue, 14 May 2024 14:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loUn=MR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s6tER-0004gW-QX
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:34:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0afddf13-11ff-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 16:34:17 +0200 (CEST)
Received: from DS7PR05CA0021.namprd05.prod.outlook.com (2603:10b6:5:3b9::26)
 by PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 14:34:12 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::17) by DS7PR05CA0021.outlook.office365.com
 (2603:10b6:5:3b9::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25 via Frontend
 Transport; Tue, 14 May 2024 14:34:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 14:34:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 09:34:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 09:34:09 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 09:34:07 -0500
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
X-Inumbo-ID: 0afddf13-11ff-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmthUKqMQFr48Wknm4hAQ0XQHwpk26eIfMCvjJSN53pzGqpMgCqm4au++4appPZkAsZKpdDLu5khOeiWiFLrNWl8Xj005GJatDXg5PDhDK9gkB/b1tn0EHO3PH5Zjyd0Cryhk0PDOM0yvY2SW8XqNsnuWyy6ijP9kyk94Cn7gCPS0QxeijEOeoMko8onEji/a4eZM/x5dyJfkT6L5T0IASDLNzGaiycozEI5pXVm5S7icdRhMi7lmQEYyDE1G2IrkH/yJ/d5paEvCM6IoNiAzVM7oxQGjYSKYk5nh0vtBH1fplHBOcUSP7w+tFvED/NKerSX4UdX06oUdQU2m68AoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoZFrLAdEXJwSYNJ8SgMjskivwX10Bp1KtaRk01l4qk=;
 b=AYO+yUPfjEIffC2D6jF/4gwS/ORsyXlb6QmuG1l10q6D3ZDmqrPqhV8N/3aZ0THsRLg+jluL8RWo8bZEDnhndG6vN85md0RnXHAQXFiE2bc6bbDhNecObia9Ilqvn/E2ItS9iVYi+5iBp3lSTbbA9jt/7pzCC6n1ssA6tvB/cvwiKpYIifmX6WYOgdEA6ctLN2dJ/nXGCMN7CkFn01yrlcVhA31AXSUzoqhxrn6E3fCC+s8o54fQqrJR3gbYDaOSTfAPe3WTURhD+aOBWBe3noePHKGFhLKtM1iw06NtB546SkBKp81zUU+EDRa2mxzvrPfxxbEW+yUsroe9yZw8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoZFrLAdEXJwSYNJ8SgMjskivwX10Bp1KtaRk01l4qk=;
 b=Z7hzp4jiK0Jxw8tQhcEB88a+1PgJbXqW3aZATfFGVd1UVwQuTQc+lpMmwslthst9HUJmYSHrDKFBI+J8qkRyuw9NY+FpXvgLNIu/ClixqbtPkj8YVjqqoup7GiPvQKnhEWM+fv9nofsOpl+gqrTbQl3enZVmvFKKUpjqScgoQ2E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v14 0/5] PCI devices passthrough on Arm, part 3
Date: Tue, 14 May 2024 10:33:52 -0400
Message-ID: <20240514143400.152280-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: dea21605-5bf5-46ef-46e7-08dc7422ec15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iIupmQriX3tfPajaHjlgKwFqTMvtw4anvV3tbF5vNLvZaAluITx5q/ItxAQb?=
 =?us-ascii?Q?ZpKRJIuO8Hnx1v2HRKCECHYtxAw/lkpP2R+dSzv6nLEg9E5sh401qziNxoA1?=
 =?us-ascii?Q?jnKjp/RyT2fsX2yD9vFFGfGEAeE0g3atAfY45v+znjFlSr8hp9O7HyTq/hry?=
 =?us-ascii?Q?pG2uihtLUgPuMWjYzBzIegULv8YODuX0/NxvCR6Pd7dRD+Z5rsPFpQdDsbrl?=
 =?us-ascii?Q?cK5i5EjOGcI/4Jyhf4cSlLmZACBzVjxRxToqufiBPa58JN0C7WcXT7WPTr02?=
 =?us-ascii?Q?DRHhjoj+ubkoMhb4XDM42zn1cy1kHyParBbg3geqSlvfl2vroa+woM/e8d8r?=
 =?us-ascii?Q?vJ9bDScNl9orXJm8DVnjdfjGl/Fz0HgvyJxCHbouRAafDN07KU4AISrsV3cp?=
 =?us-ascii?Q?iokeetGVfsnV5h60HUUeUKluRSr6LEJNFNEnsdT+986yjM0sMB3yDExqwPU0?=
 =?us-ascii?Q?FtNV05MMhqrka07SdFkdWw+jg9SD44JyE5VLONOAfA6BmrKml8kIkLmqR3eh?=
 =?us-ascii?Q?0BxxQ7NaCy7E1p5YC9iHDNLYlcQ/J8UOsYhXL8zP7naq2iMjs7PF6xyuu/2E?=
 =?us-ascii?Q?fJal8132tBpe+tnQmIlB2Zum8p7t3Tq2QUgfApQXFkwdEx/pR2zlIK5C8tVK?=
 =?us-ascii?Q?XhhWkWJ4UObAS4ze4DgcujUc4qP6FYC8xtSlQhoIksqmeH6kkL4G1dieeUDH?=
 =?us-ascii?Q?3BegtLw4fVcfgxwOfmwoVRnWOmCnZk2MNB4i2Jh4iRyVNakmdENNkqJT3iSB?=
 =?us-ascii?Q?yn9yE3oYkq4AW5bXwTUrNdSBlKWSab3Vpx+fS7CC14NRXKYfbf5h6d/pCDNj?=
 =?us-ascii?Q?0Cs9GP7Lrtq7N5jRvVTxnrVbL+6Vqo7pvPe1/r9ZYtlUejfMBFxjfZa+Y97c?=
 =?us-ascii?Q?47TMmtRakJ9fMSnjU5REkDEwJH1hcNjJ8MlThfo773pFnz1jgPhnDTZuaK9K?=
 =?us-ascii?Q?0lDc5ZxEnNQqHLybq06o0k1OZ+se0KXiXgxHUfr50Kf9uj/GXuefkfIhT4GY?=
 =?us-ascii?Q?fpPMACDLAvtFwPX1njDVFSgxz7vjI9Luyr+wOYsUUysrQ2Cd6bqwEBM2o15A?=
 =?us-ascii?Q?RR2kVXsMOSklwkEGXcVDowRfEGwl13D5sKO22bc5+uiPffq/vUsM4yW0EL3V?=
 =?us-ascii?Q?fp9nbsJkpJMaJTHSrgzqvOMKAaBx1pxBDP6/sxPs52LGepUx5GY9yIlUQe01?=
 =?us-ascii?Q?/3U1HHjyot23oZSl8kjlDi6Ow6qX+u9hJTA45nbkR7SHe132CRi1IEyBlaue?=
 =?us-ascii?Q?DJ3mGiQiB2sJ+HZ/AaZOzJKaI1wI2w3j2GhZZNPnJcGyYeV9IU1xCn6+n2Lr?=
 =?us-ascii?Q?UDJU1+zq80ZPIHv88PG2mOkV5f+y0JeMVXdTRklkE29yajWGrG0Nkbgloywb?=
 =?us-ascii?Q?SeQ1C0NoYvuXuYxhnjMuK04BUl0s?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:34:11.7201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dea21605-5bf5-46ef-46e7-08dc7422ec15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

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
 xen/drivers/vpci/msi.c     |  8 ++++
 xen/drivers/vpci/msix.c    |  7 ++++
 xen/drivers/vpci/vpci.c    | 81 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  1 +
 xen/include/xen/sched.h    | 10 ++++-
 xen/include/xen/vpci.h     | 27 +++++++++++++
 9 files changed, 242 insertions(+), 19 deletions(-)


base-commit: 46aa3031ae89ac1771f4159972edab65710e7349
-- 
2.43.2


