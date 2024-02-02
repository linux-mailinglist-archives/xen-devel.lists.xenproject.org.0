Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E5B847B91
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675206.1050472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Ag-0003vJ-Pd; Fri, 02 Feb 2024 21:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675206.1050472; Fri, 02 Feb 2024 21:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Ag-0003tP-L5; Fri, 02 Feb 2024 21:34:02 +0000
Received: by outflank-mailman (input) for mailman id 675206;
 Fri, 02 Feb 2024 21:34:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1Ae-0003tJ-Pg
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:34:00 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c590aee7-c212-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 22:33:58 +0100 (CET)
Received: from DM6PR02CA0142.namprd02.prod.outlook.com (2603:10b6:5:332::9) by
 SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Fri, 2 Feb
 2024 21:33:54 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::67) by DM6PR02CA0142.outlook.office365.com
 (2603:10b6:5:332::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30 via Frontend
 Transport; Fri, 2 Feb 2024 21:33:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 21:33:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:33:53 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:33:52 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:33:51 -0600
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
X-Inumbo-ID: c590aee7-c212-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqZg1QjxG6gen1ImyHBNAgwJZWsdiV8Ybz9BdoletmRz6J6SFmo8RiV6phBysyVlDqybpjoEtA9JnZn1ihaIbfmDG8tBWpFhZMxhZXtgUd8Nz2R4XZdoGGiw16c4VGQ2chVm/8/97KHvehY3GsEYhyf1CeQIbhCpkkdKg8YfK8X6piJiN+r/TubOr4XfimUOkfEyRKsUXkqYycgOgPnSMp+AYmzXW9c24rZOfJHKnXPJdEtnsbhSngLy1uI0IDKHvGmrNDPWyiRBZ1ivYctqVnlNvBiPDixkbqRUiTRoiOU+BahqJNilTELVNk000VrQA4ni8pOyAW8DBBdlrk1NLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZoKI2DoN+ryFAYH0HfQvHMden9FV5PzUplCnc4MtLE=;
 b=g3s3+ivk6PTR9k15CWvapG/bB1lNwaBAKXbmIAulPol5lrVPPAdqkdVaFHjMG0RXXWQ9W2Ydb3eXwlJqqZqJxyd58Yd5/NngB7G7j9jbdK2YMwizDtDyjXY8UqOEweA2AQ9ungceYsUirwkSTYPJooK26w90pZo81jl6K5ZxB9D0QG8ZY0emJh8JjF3KEDQi0nZeOUEuKzstfySmel4XyqSE184RevUUheLn0kjtP1TtiFiB/uQDiLPd83LLFE4LKBs3hwwJQTyFd2tbVX0nTdBB4CLyQ094PZZ962mj48yJGwfR2hc1SCYOZxvs5SPZRGnVDWLo7ubEJGZmpiNR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZoKI2DoN+ryFAYH0HfQvHMden9FV5PzUplCnc4MtLE=;
 b=v18zJVGPGPyBhzbdp3qTTA8zQoybFVaOk/2E1PTC9QuckMvquo9XZiJ7uc2kGufqdfuyZt4x3r+baTkXuSBIItHKF4o89+AGoLqSJ+ag6xybwmssWNNBaGS/aJhnEFMdsquW+g+1XWRCGH/flKgXOVotOMHRNdHY+n7aF/cccPA=
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
Subject: [PATCH v13 00/14] PCI devices passthrough on Arm, part 3
Date: Fri, 2 Feb 2024 16:33:04 -0500
Message-ID: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: a8090217-e44a-41c2-9df9-08dc2436a7a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	75tiX/DzmopYVrcNiO7o6GccTayUcd19i3hPfxJgnTvCYM878jsu36rlNolnAtmqJXfzHtnk+U0KRnYWy095NQlBvs9KNy2Dac785L3aqhAV5rk6v7e1y2bIoMdmklq+k2Q2dgNxxTpA5VKDYYdEUDmS5zrcZKGeF2bnJRv+ECUGEASzfwYAtmg7XqeHWZJ2VvZv7Lk/N1ldXdYcFt4nEpYiz6C6pgVbGOeKf01Y7XlhI6banw9zNql9szk6T0ihbYH8S6353wgvjnw2ykT7cJt4umFoqaP6YHEwXoFAyESdgFkSObE5pfrZxcww6GZ0DV+xH9ZHCKQpoKApdtAYEomPatXs1FfEeO7HgH61NnYStX8qKl9YgLg9eog1giVeK5xF+ooe5VIt1ss2j+GUPGqOqoVWf4ACGl5XWkMig9BXCtVMJyK25vwAHrefXAflkvMsf7KpJc7akr5qkektC5N5g8pXI5NuFmTBkSDKceNl5hVRadQeoe1O4PvWgJfO5jIyY7Ku1c5Ofb0rqvURE85WWfQXBU7CcO7lC20CQLJP9hJVeh5fsnFE9KGiTHq6RogKkIT1/LrGiIOBI5RbBZCbNWXBqhaeC2RhYPQq3SXtLg44JYSNOqa+pEkKEczvzf/Hokw7QZAJwYftFGISM+pKnLdkZNATELznnFfiRRLdPlFd7j6zEj8J2yYu7Ax/iA58J4dsiqaC/XlvrM7Z+fAxjEZ1Hhy+YyT4VR1jBIUOjAvQvpiO+GjLTCSVs3TDj15zaGF0Ff7U20cp6OcpKQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(26005)(336012)(1076003)(426003)(6666004)(478600001)(36860700001)(82740400003)(41300700001)(2616005)(8676002)(44832011)(4326008)(70586007)(6916009)(8936002)(70206006)(5660300002)(54906003)(316002)(2906002)(83380400001)(7416002)(40480700001)(36756003)(356005)(40460700003)(81166007)(86362001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:33:53.7960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8090217-e44a-41c2-9df9-08dc2436a7a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

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

Volodymyr Babchuk (3):
  vpci/header: rework exit path in init_header()
  rangeset: add rangeset_purge() function
  arm/vpci: honor access size when returning an error

 xen/arch/arm/vpci.c           |  63 ++++-
 xen/arch/x86/hvm/vmsi.c       |  31 ++-
 xen/arch/x86/hvm/vmx/vmx.c    |   2 +-
 xen/arch/x86/irq.c            |   8 +-
 xen/arch/x86/msi.c            |  20 +-
 xen/arch/x86/physdev.c        |   2 +
 xen/common/rangeset.c         |  21 +-
 xen/drivers/Kconfig           |   4 +
 xen/drivers/passthrough/pci.c |  35 ++-
 xen/drivers/vpci/header.c     | 495 +++++++++++++++++++++++++++-------
 xen/drivers/vpci/msi.c        |  37 ++-
 xen/drivers/vpci/msix.c       |  59 +++-
 xen/drivers/vpci/vpci.c       | 125 ++++++++-
 xen/include/xen/pci_regs.h    |   1 +
 xen/include/xen/rangeset.h    |   8 +-
 xen/include/xen/sched.h       |  25 +-
 xen/include/xen/vpci.h        |  45 +++-
 17 files changed, 808 insertions(+), 173 deletions(-)


base-commit: 3f819af8a796c0e2f798dd301ec8c3f8cccbc9fc
-- 
2.43.0


