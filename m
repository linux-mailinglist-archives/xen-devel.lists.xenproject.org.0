Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A26FAAF84F
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979267.1365936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCylk-0005qb-Ht; Thu, 08 May 2025 10:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979267.1365936; Thu, 08 May 2025 10:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCylk-0005o5-EN; Thu, 08 May 2025 10:46:24 +0000
Received: by outflank-mailman (input) for mailman id 979267;
 Thu, 08 May 2025 10:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uCylj-0005ny-2u
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:46:23 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2405::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc55900-2bf9-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 12:46:20 +0200 (CEST)
Received: from BL1PR13CA0439.namprd13.prod.outlook.com (2603:10b6:208:2c3::24)
 by DS7PR12MB8419.namprd12.prod.outlook.com (2603:10b6:8:e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 8 May
 2025 10:46:11 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::40) by BL1PR13CA0439.outlook.office365.com
 (2603:10b6:208:2c3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Thu,
 8 May 2025 10:46:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 10:46:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 05:46:10 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 05:46:09 -0500
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
X-Inumbo-ID: acc55900-2bf9-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maFqqtC+7liCX1VQ/HW7S00juE0jWdaUBBXMypuGBL+XnNINlOGtMjwlYVIzMpCoK/jzDgJBnyMYJuUZU+9a6LhLmOwH9x4rFYFqmj7ssShG9iIslqleq/k58gmZB7+LhpT8eStYe3KcgboXkQqC2H8hsS1C/fi9iBqihREe94s5IVocYRAMagAXQ9dNL1+odhJkq8rwwrzdp4z83qH8FtXtEfWaFwaedbfNx3I1erN6/zCNVWOVCnqtH83gKHitNpn7C6EPdWaexuQEd7jLt4tDFCgNXkmrqfLGl8GEIfpvBt6ej1b1wBtUuyJxwpaejiknwABUORpIzW2R6nCj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjhxUYigasu2Vr7pmkoEjJuoL8GkNXfVq3z6mzHd+so=;
 b=u8nmjNW3WtMiztz1+FkrB/vCmPjedYgbzlNB9aeyJ4AjSVZ+DK6IAwBE5QZQNcePdx1WJyMuv08ZpLU6ck+NQn1VETyy7X1/C5XDPSdy8H7xHs3oVr+lqV/J6KqrUgMsxLahJdAcn1jOCo1qu6/+ecWxrrFG7YPi/6ocTOBjAs38oeUewbamp/hewdI1AO/t7JvH9xdZ6+U0AIkNXh4+iSlodX75KsZ48ndcBzgwKrL1XM9xgEE1bb+7+rZ+72l1jIr5gyE5zN930kBzJZ3bxf/yUZ5UjXAe3j6uUZVOUv/STtyV/YphQeVjRdMy/WonGT3OyC7nmjRnUTBjOXNFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjhxUYigasu2Vr7pmkoEjJuoL8GkNXfVq3z6mzHd+so=;
 b=DZUr+jdsxiNzIQfthwjyDl1oBoIwrR07kzeBXcSGL3T82mzr9VgmHskj7pky2/HSqzsJZbAgSKpKplT2bzKmjCDDXPZkMC4lR6a4gO94LXtMvL57Dqk6Opx3uopj1wcAaM9+b4AiQGylQbf9ef6mvUxSlHmgqmwsJ5UDpJA/JYc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jiqian
 Chen" <Jiqian.Chen@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v21 0/2] PCI devices passthrough on Arm, part 3
Date: Thu, 8 May 2025 06:46:05 -0400
Message-ID: <20250508104608.531079-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DS7PR12MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: b70363d8-2627-4675-eaba-08dd8e1d8c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1tqacg/l6JR8zuqrjhZjgPyDJYIEeCDqADe7HVz2XoJIDQ7BvPNMnhB9JWCZ?=
 =?us-ascii?Q?URnyYJz+FZftjmsGYzQj3qaiClCt7xgBGaI7KE0YltVa3WECPEei7KWlu1Hi?=
 =?us-ascii?Q?PYbVot2e9noDyYEgcRCm9tNiomR+r1Rw0ACtyt+PCj1z6Six/d2VMO4wHq77?=
 =?us-ascii?Q?z7mZFr0o+fPjnwHsYyx1ly1KAkB9Fqu0LZ9Hw21mcuXZaw0RpBTegl7rsHif?=
 =?us-ascii?Q?O9Sqm+HZ0xee4jGD9ksmgW7vkj3ebSABExt+vxxDmK6oC3YOLSmFykXJPoWK?=
 =?us-ascii?Q?n2gfzZ0zAG8Gx8zvo0EngjeS8nB4CTfwj5ozpvPGi+1Yt7hMgQDfw5PpbmLE?=
 =?us-ascii?Q?8uYBtKTzTpxuB/uQ4BrEpYo29CJV7iBYlqKcXO3VzmC6WM36OzmiqUbqWI3q?=
 =?us-ascii?Q?MffLZsWPrBPPbNSc8uP0ohhZ9sOe0sXTpJt8i20Vm621y5zOriOclxJEvgV/?=
 =?us-ascii?Q?Z+ERQODQHrdePn05DMyt4QZfDstNGQiCXKvfngYx7bPfyUUsbRQ+Wa00LZYf?=
 =?us-ascii?Q?IUdwiKPaKPN18rg/UZ8PJ6Be6JGig8Br7ieNYkpBgDsuIgs4w0jyvQhT/Os/?=
 =?us-ascii?Q?4LmGGpOa3IAjg8IiUpCyu+n2GFmSfQL96W49VoS+jrIk+5C8cQC4uOHVrbFQ?=
 =?us-ascii?Q?Cj478R08CdwF4qQfviCrvGORJY2Ge9rjNkwm49tAUKuOrfB8ZGaYVkA805Oq?=
 =?us-ascii?Q?LWVoq7OIAbprCwb2KX7RK4jDetI36F5ktXnR0zTS/LJa6XCUsU36mJ4AIeEK?=
 =?us-ascii?Q?PLiGN2NGSuD4d6AOM9DeBfzINBk9JJYh/3FyRdpfDkwc+nzDiSbGFqmSjMmK?=
 =?us-ascii?Q?0AaybOh8EiwTFTTJKU3+sQuduL+eFLba6Yy/BHwBqPyYJ56642KIHRd7+jjw?=
 =?us-ascii?Q?5obzFd4kDdmyjNpYVtK6rqpLUvqT5cT0b0QPjt/uzdLXq/vxuUKGEZneNVqj?=
 =?us-ascii?Q?AYPqual41FqMr6iThEd3Sfz/c7ArCocwg+0JQI8bRJnDakjl7LmmYzad4Nnz?=
 =?us-ascii?Q?OWvg3VCqLTvgtZdy0PGWIi9bnGMQXK/MG6CsMuCgnhq6C9Jd/i5yjHUBRjbx?=
 =?us-ascii?Q?HQMxdB2jNR7uIH8cjkeIZDxoVN1R1bfkKLdObVHd51VjiwqozJsqVmnpj/u5?=
 =?us-ascii?Q?kvlv7RpJ7BTOwRKL50FcuMhGmvqJihO0V5fIdcOgp5EHnB7+ncb7slUI2K5p?=
 =?us-ascii?Q?Th1VWNXirowM7p1eGc5p9eR2xTxDmCu8oAh47Ru1PrmvHRbriCcIPf/aANBw?=
 =?us-ascii?Q?+eftzDBpWYD46mSfZgqb+z8Son18zJOLE8HzGRl+TOCRTLGVT71Bvl52Uq7E?=
 =?us-ascii?Q?dWUjHXIPAIUh0+SF73cSHFE94beLoRgl/T0YzRmzD46UvQC478rCcVYxXufE?=
 =?us-ascii?Q?Wd4Z+Og1pI54P7y2V0OxZFNpmr2zAFUGZMYzUT22dNe/aL1tq4KvYOjklx05?=
 =?us-ascii?Q?Dk9DizZxB/nw8rvF7h61sje/nnLX6pg2XLHHjxf8Mr79F9tfmK3lkjIN8DZK?=
 =?us-ascii?Q?IPLc3y7vOdEqWdsnOMni7L+Y1nkEMZ7Up0d5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:46:11.0487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70363d8-2627-4675-eaba-08dd8e1d8c06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8419

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

in v21:
* drop ("xen/arm: check read handler behavior") as it was committed
* add ("arm/vpci: mask off upper bits in vPCI read mmio handler")

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
  arm/vpci: mask off upper bits in vPCI read mmio handler

 tools/tests/vpci/emul.h |  2 +-
 xen/arch/arm/vpci.c     |  6 ++++-
 xen/drivers/vpci/vpci.c | 53 ++++++++++++++++++++++++++++++++++++-----
 3 files changed, 53 insertions(+), 8 deletions(-)


base-commit: aea52ce607fe716acc56ad89f07e1513c89018eb
-- 
2.49.0


