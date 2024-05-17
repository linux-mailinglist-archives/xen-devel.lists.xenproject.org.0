Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B188C8A8A
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 19:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724354.1129586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s812Z-0005eF-0E; Fri, 17 May 2024 17:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724354.1129586; Fri, 17 May 2024 17:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s812Y-0005cb-S1; Fri, 17 May 2024 17:06:42 +0000
Received: by outflank-mailman (input) for mailman id 724354;
 Fri, 17 May 2024 17:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIA2=MU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s812X-0005cV-AE
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 17:06:41 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2aa98b3-146f-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 19:06:39 +0200 (CEST)
Received: from DM6PR13CA0056.namprd13.prod.outlook.com (2603:10b6:5:134::33)
 by PH7PR12MB5973.namprd12.prod.outlook.com (2603:10b6:510:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Fri, 17 May
 2024 17:06:32 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:5:134:cafe::b5) by DM6PR13CA0056.outlook.office365.com
 (2603:10b6:5:134::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.12 via Frontend
 Transport; Fri, 17 May 2024 17:06:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 17:06:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:06:31 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 17 May 2024 12:06:30 -0500
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
X-Inumbo-ID: d2aa98b3-146f-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CU3UhsL4EhL5lNaAHlC+trYba1yCRB+AuPvunvrBYe5kMPehpN5rpR6hY1olfUakwkFsJIbAlwBeZlJch/BOPAWqsoIhrB1SOD6iskCN3uU6f1Qa987lTbqGBwGjS5cAAIxegONrUeUSEM2GP/5R8517M8FhX+ebKVtixvzBvGgqhWF0hNOn4GJiD9+BrS4UD/9bIhrM+ExhYcMIrAXG3sZYEE+QpbPbWs0EZ96pTbKfm6ro3XVsfZ2S3+7ieVjIjanBnrTkmYAQQhgjbxU4aAancK+o44H/B1gdVLScvz2rlezapv14xbbJdfEilGFXXsth2ek3c3fD6quQtJPoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts3rSIFwmlBSfKyriMqkstTx6/HEQLoHhTNACy/CIpk=;
 b=fXnvFUkdzxRvAmg6AnypZeQFq/eHNIhKN8N1izwEbyu5rDsY5WESwo1YJyvUpaGHQ0Dk77WHzDfxtXEubM+IgcJA4PJcAJwPPc2r6dX5ZWt7vJmjr1LVNR+r13DIbsm5IQp1MuI4vyp+f8mAd7+CR4iHimV4PdTaMnC0mOHsro5LVV6C5I6vneXGCV9kiqm+/KuaHrITnR3+JDq7cCiBRZ7Qnz9QPP3KtVHO36rwx4jeULvCmevYlud1fnxEp7EpG3Dm/g1fiHFOo7k7Qbhn0poddTKF7SpKNkfKnKJuVHTFxxSUYiB+FKnuSozmq3pDTfv6OUmmp17S9ABMFFuQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts3rSIFwmlBSfKyriMqkstTx6/HEQLoHhTNACy/CIpk=;
 b=XG0QoieIBVKQavW2Vf5zVhGdqaG4GKjfNJlVYbjKSjdfwxo8ATLzqIfVNbMnFKX/Dsqyj6N8g8qa+r8brWfryXYmHtF+ilQFBnQWnXQJ98e2kZ6ToRhosrrsdqpEg/p+FZHrqCllV2q0sAM8kIYxi7QuF6ZppO+6hWaWpD/n8bY=
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
Subject: [PATCH v15 0/5] PCI devices passthrough on Arm, part 3
Date: Fri, 17 May 2024 13:06:10 -0400
Message-ID: <20240517170619.45088-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|PH7PR12MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: f914b54e-5342-46f4-e521-08dc7693b33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LJJIsOtYYUbaaHzzeninox/ve41NG42U245Ka5qyklHDVEbhsTyLWWy6wjZ3?=
 =?us-ascii?Q?0E2aLN8K9LmhKBzw7qzOizbIt0TJint+3PZiCOmCOl4ddooQioNC8StMKDuB?=
 =?us-ascii?Q?TCZD+12XI8rmOdNEloEu1GrQabhMaH5ZXRgOYJMOImC0loTnOA1A1vH9fySG?=
 =?us-ascii?Q?iE6ytamSVJSUaQnkTr7CD7FItbD3LWbPOXFxI42i32lXwUkebMhUnsbz7cEh?=
 =?us-ascii?Q?XYfmuZq8Cf19U++J+AuIznza5hiMFQZlGfFkH4vMoU1gqa1hc4v7Y5ORXezh?=
 =?us-ascii?Q?9cawcG3U54mPBJpZuGhBV+qzxppX38KZrMfmoiaubFrbnnLeJmYacJkjsFIL?=
 =?us-ascii?Q?Xn04SO8qzelMwrKBAEz9V52gZn0TN3gYtXUkUlWvp42WIieRa+4CkFcm2q3I?=
 =?us-ascii?Q?yWKFy83gcGfmDp3fTS9h9JEDJFLFKCdc98GHUxTWr0gCQ8jGf7c+ZB8GAt2F?=
 =?us-ascii?Q?ooy+QWpslyKcsJH2l7R5FCaBW+kXPe3rxJdcshBMJYvJX0rvppZifu7ce/Gc?=
 =?us-ascii?Q?Q+jfF1ZJHyM7hso+gJCGMYWqRrVHIVhEjj/3tlqlvQnO40zdxFmp+jk1trM2?=
 =?us-ascii?Q?tbsvm1+qSTNLLt/o1avR8uSnjhtzWnL9rzxfNpoj50Fv08z5wBNKZ2AcQ3rK?=
 =?us-ascii?Q?A5j+qq3raIUyTII5S1WKKJN26SJnL8KOVnPzmwobIemO2KdxN1eeyyH6fUeR?=
 =?us-ascii?Q?0cShChb+21GCfxL9d4MSOgRbsKB7Eo2jZRDqj7yLN8ElSkr3NZpI7nPv52CK?=
 =?us-ascii?Q?tRt0FyfYaWZsolHUvfj0bvgsRZdeifaoXCr7YXFZaN+uiJhoJYwpL4sSeLWu?=
 =?us-ascii?Q?FFAiFdjQrERr3uTZ0vOaa93e7NRwMI9GCpNtuD6QD8vf67ACeGeMkv/V2Q4R?=
 =?us-ascii?Q?FzLKwI0qLX0z9q6xnohMy5208xVUycKbXrppCePex7WKzGsVhZAtYGsEDhYQ?=
 =?us-ascii?Q?YlxuQQ8uJpawvtJH02kg4kdNtV1HIt7l19Uiy9gJxsxE5nSHKhLGc9gkzD/E?=
 =?us-ascii?Q?ieHVZ3IM1P9LARndJUBVt/vZop9x9I7yxlaDscjKW9QwYU1/jQ4m2btinOwl?=
 =?us-ascii?Q?3i6wmAfaFBzyQP4B7u+99DRLG0yhrLMVl/HcnwGY492dDmeu4Kgj6g2vRKX2?=
 =?us-ascii?Q?orda676gH0ZqLiiECgfmXcl0bSeDulYrpheZyfMZz5c4GfiXS9wJI36gFRpi?=
 =?us-ascii?Q?ute82BUdj25jWxvxKXIsrbepdZVSvVH2QtKhq7JksB1B8TFlL9X+pVlw5Xkt?=
 =?us-ascii?Q?iuNGfMYeFy4t0BoqS33lQ43ast72gGP+qYI7F8+x2OUTgy0GUQjwEs6LT/zl?=
 =?us-ascii?Q?me9TtV4YPrGm7ldkLABWsJWctQXZ3cxyV0U2bFVqxybBnObBJxicuqCqLZLp?=
 =?us-ascii?Q?OTtn7aCyybQiG9P9aIROQsAto5ph?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 17:06:31.8394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f914b54e-5342-46f4-e521-08dc7693b33a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5973

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

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
 xen/include/xen/vpci.h     | 27 +++++++++++++
 9 files changed, 243 insertions(+), 19 deletions(-)


base-commit: 21611c68702dae2e18cb519a6e166cdceeaff4ca
-- 
2.45.1


