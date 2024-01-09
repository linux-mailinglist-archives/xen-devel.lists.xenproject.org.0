Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B4828F3E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665009.1035174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK0x-0007OW-Tm; Tue, 09 Jan 2024 21:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665009.1035174; Tue, 09 Jan 2024 21:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK0x-0007Mf-PT; Tue, 09 Jan 2024 21:52:03 +0000
Received: by outflank-mailman (input) for mailman id 665009;
 Tue, 09 Jan 2024 21:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK0v-0007MZ-Va
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:52:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50036820-af39-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 22:52:00 +0100 (CET)
Received: from SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16)
 by BN9PR12MB5321.namprd12.prod.outlook.com (2603:10b6:408:102::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:51:55 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::34) by SJ0PR03CA0281.outlook.office365.com
 (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 21:51:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:51:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:51:53 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:51:53 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:51:51 -0600
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
X-Inumbo-ID: 50036820-af39-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evffYdFnsPwji8kK+v+DrGfj/PaSmACNduw4L8DLALLiUIg6MEuQxwZVCMOsxDXFGBd8AEgD9YB14PTZ73fPlPIPi10pGdez0ZxAR3xrEBIYXUFuVAsJ3Tfd4CHgq0j+3XdE2B37qIIKPaKUhQTR0pzGINqhowMylIJTlK4Qu4J3V3s23MlZHecI6e0urDXKcZBQbeoh4ug3nFogATUwYR+U7Ow7ICmKqQOi2kMJv2RC3dXtTJZYyJb5e7qxGpm+6I5uZSmkkSzWzyw+j7RVoOXvO7SPHnOttD4/P+nqfyhlbKcgQz4K0xyLuWDLeSztpq4XKkiE8NdxpwO5NTGPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iFXtgdIVWCHpihKA9LGQ1gsHtm+B14AwR4IHl5tTVo=;
 b=abHG/L6iZJZ0GDLsPxWH+xnwSHNFzgZBbH5hRpEU9yitjlut8n1XaleDAtnhZ2Q9W586abhk+zJItcAspIMBqWqmBmABlqpuo7I9oQCtAPBPSGGu31cI0lZ/HTRa9HnJiD5bP59qKbGbXX2p4HDZjNtgCdEH6Sznsv2ph9aAUSl5VIEtTfxrYjExLSDifevXT5e6I6EOhoZ/gL6x8R2SD04ksP0IBxfaAbzl0SRHtwP9fo3p5ti969c3yLqFWrbDN0dLiYVjNcSD+329Qxj1DITFxcxQWpzuiPzuGFyeq4RKf9W3tCVa1whxBhaxyebLQb5BQyAYwURURZCpE7XIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iFXtgdIVWCHpihKA9LGQ1gsHtm+B14AwR4IHl5tTVo=;
 b=RYtggHpkVjOV+Tyw7D/EddEbxwcJtmm+siqzO/bDVRqUHpRxbYdWqWzrQjx/8R6sWqjYS5Ky//drs15QsUrGxIyeD69IvWB/TbiIQQQOqVFjswYYCPxnuLS7Nn0t3MPMK8yVMbYv0+tjDB+hwvifHKbHM5Xs90fovwI6IdEU8Zc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Paul Durrant
	<paul@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v12 00/15] PCI devices passthrough on Arm, part 3
Date: Tue, 9 Jan 2024 16:51:15 -0500
Message-ID: <20240109215145.430207-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|BN9PR12MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: 751d9517-fcae-48b0-9160-08dc115d31af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XBQ0gAw6/GalKPHDl1OA52KWA2nAEdkGkg6WTtsFM3rLmHq0rb09+7ULNORBfZtFmxEp0YEW2qvTpVkkWnuLue11tsjSzlMNf65AEZ6nPgddbr2Ra5LGWcQb6z3q0oPPuJN1ShVvFHLHADrw3DtKz7q+dzrAbQ/VHq1E2VtE1hmo+duT8ztWjHtThLp5PR16sXNuHDFWgJuEen/X221dhcGXgrS2DwkhDc2h6pDYPSRmBBhISoPuZ26uxyYuN+OXjG8GrkFjyRAFhMFYVJEM+grifa8zRKuR2/53hQoJA2CtTGJ+wVUfRHHXNJgFO79kSrnKsxHUZaMVqwPtj5AmTtrlvo+OOMzGWilXvzrWzPLeuhdSAlPoz6JQRh11PA2HW7KaE0pvXUrHN3C3GFZfmpzzByV9CopnO/komIW8Iwkat/gYPuMeINtVmZUl0poyBI3bBUGGkSP9DxgYrQd7b84gLwRrcVo2hIkaAFOft0oy1fdFueQ+iPgsOPtfZKhYil+E6Ie+yT6486a9c0uMYs9CqHR5SnuhU5bczoe5uyaNHGV3GP09oQ9hU51oB1C4L7yX5tPoM8nz9bYOydBnfuDb5lmRDz9KO7ivpurKmCStpabeZo7QpdBACsKcsPvpcXdzAX7jbga1FdyU57mB8nrhCFDVibLErbmzMt6A+acTxDiwkQ4GTSUuNThLtxMNCvlFp6JtVCxAdQYq80rHw08va5aE7Amk3PqxLDOn2ZSfEThjxM/+YTczYCaY5l46KRMBwd5I+Ec0o3r7/TTN2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(83380400001)(26005)(426003)(1076003)(336012)(2616005)(5660300002)(82740400003)(47076005)(36860700001)(44832011)(8936002)(4326008)(8676002)(7416002)(2906002)(478600001)(54906003)(6666004)(6916009)(316002)(70206006)(70586007)(41300700001)(356005)(36756003)(86362001)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:51:54.1738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 751d9517-fcae-48b0-9160-08dc115d31af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5321

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

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

Oleksandr Andrushchenko (11):
  vpci: use per-domain PCI lock to protect vpci structure
  vpci: restrict unhandled read/write operations for guests
  vpci: add hooks for PCI device assign/de-assign
  vpci/header: implement guest BAR register handlers
  rangeset: add RANGESETF_no_print flag
  vpci/header: handle p2m range sets per BAR
  vpci/header: program p2m with guest BAR view
  vpci/header: emulate PCI_COMMAND register for guests
  vpci: add initial support for virtual PCI bus topology
  xen/arm: translate virtual PCI bus topology for guests
  xen/arm: account IO handlers for emulated PCI MSI-X

Stewart Hildebrand (1):
  xen/arm: vpci: permit access to guest vpci space

Volodymyr Babchuk (3):
  vpci/header: rework exit path in init_header()
  rangeset: add rangeset_purge() function
  arm/vpci: honor access size when returning an error

 xen/arch/arm/vpci.c           |  72 ++++-
 xen/arch/x86/hvm/vmsi.c       |  22 +-
 xen/arch/x86/hvm/vmx/vmx.c    |   2 +-
 xen/arch/x86/irq.c            |   8 +-
 xen/arch/x86/msi.c            |  14 +-
 xen/arch/x86/physdev.c        |   2 +
 xen/common/domain.c           |  12 +-
 xen/common/rangeset.c         |  21 +-
 xen/drivers/Kconfig           |   4 +
 xen/drivers/passthrough/pci.c |  32 ++-
 xen/drivers/vpci/header.c     | 495 +++++++++++++++++++++++++++-------
 xen/drivers/vpci/msi.c        |  37 ++-
 xen/drivers/vpci/msix.c       |  59 +++-
 xen/drivers/vpci/vpci.c       | 129 ++++++++-
 xen/include/xen/pci_regs.h    |   1 +
 xen/include/xen/rangeset.h    |   8 +-
 xen/include/xen/sched.h       |  11 +-
 xen/include/xen/vpci.h        |  44 ++-
 18 files changed, 798 insertions(+), 175 deletions(-)


base-commit: c27c8922f2c6995d688437b0758cec6a27d18320
-- 
2.43.0


