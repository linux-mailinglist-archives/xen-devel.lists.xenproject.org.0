Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0327995EC
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 04:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598341.933067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenXv-0002ym-4C; Sat, 09 Sep 2023 02:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598341.933067; Sat, 09 Sep 2023 02:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenXu-0002vv-W0; Sat, 09 Sep 2023 02:18:02 +0000
Received: by outflank-mailman (input) for mailman id 598341;
 Sat, 09 Sep 2023 02:18:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbb/=EZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qenXt-0002vo-RG
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 02:18:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 182d66c0-4eb7-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 04:17:59 +0200 (CEST)
Received: from SA0PR11CA0010.namprd11.prod.outlook.com (2603:10b6:806:d3::15)
 by SJ2PR12MB8944.namprd12.prod.outlook.com (2603:10b6:a03:53e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Sat, 9 Sep
 2023 02:17:54 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:d3:cafe::5e) by SA0PR11CA0010.outlook.office365.com
 (2603:10b6:806:d3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Sat, 9 Sep 2023 02:17:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sat, 9 Sep 2023 02:17:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 21:17:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 21:17:07 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 21:17:05 -0500
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
X-Inumbo-ID: 182d66c0-4eb7-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfUZhPpqKshtU5uCMD03+Lf2Rjpc2iv+vka2WOMVqK5/phJyRjffb/ukI1e+LdeNdFRzkLtIPerwNdqyciYuKtaxXUUTWvmaY3b0B2EQyPsEWDuQRvj/cz6rGUgW2N/KdTYQpNMyumgiK+8noVaQ/VhE6KhcqkXnGQiIhxJ8BlUYvWNwDg2vukqVYhrzxy/z+PXD74kqVBpX4l207wvLie7i4YURDcQY0O7tDLBlkf5h13NcQejlS/3OEG3CjDekVhHrLeoHLG2MhrFppasS5aWTQB/hU+Qaa2omS9aysYReTsn2KEomy7F48w6zfw2p7N1d1QSQgTAbpUtdiIv86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+Q2vwNFkt9nN2RnNSQpAPJeDq3PF7nllByiHIMEpXc=;
 b=idQUZiKkGBWSsjRU6jrOoDpLhNmVd82TN3BKTpXHbuOpz4K2oNZyhgaWpXxsE6oTQQZZc60rTE4qzv0TzrGizH2Y8kLSSB76mPTgdUoWXt3Dtfn71NxvQtjxMc0iAJHLhhsxz0GdlSRKOw85cqN7jZJvHB47SnaujUMD+Nv1nqr9868wASYf8LpF79TTkcR3pQSJckpI27mUMC/5GQli+ArqpGXPlYdRxqdih1GXWBmS05OXxCtBIJ2DELy+IPmOJGT3k3OfoDL0reAWr6kQZjC5oS/QO0PwQSpHPPt3b/NCcPq58O8BnLP9q3IQ9C71D7+AByHcuuVVp9JTKIZKRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+Q2vwNFkt9nN2RnNSQpAPJeDq3PF7nllByiHIMEpXc=;
 b=yu7m/KBjblhOFUYz7BXmVRDQ07V165j7Y9ad9QRb3WLkPWnF6cvJ5WetByshBGhHNbxo3WkE4N4cvKpl1YSLwaA33L+GF52If5JP0GfpWAPg6IDJ8FRgoMlhAZTUxFYzNQ+mbcIyWDCGt0iiL5uYee+q2nM0NttrbZUClx+NfY8=
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
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v6 0/4] vPCI capabilities filtering
Date: Fri, 8 Sep 2023 22:16:24 -0400
Message-ID: <20230909021647.558115-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|SJ2PR12MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db006a1-9537-4e41-8516-08dbb0daf969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B6MdNbBEEpTsspuShIpKxM25dvi+yxdWLKfqHywvVc/B1iLr8v/9QR4/wjbE57wwmNqfBaHtCnV3iti8qWue3IzV18TArNs8mfX76NqvOPTKxIAg3ncnJB+UWmgAA0ep8xmXI1BujKo01X1U9hM4B+Dk5yr9px6W3apwe4svTwehqrsZ4G3IgLBqTG+HyXrBPpC6EFip04oWU7fwNe6H6VlJ/FJNR8gQx6ez2nDRUOn9YNr2x4LvcJMB+RDixqvj6rVfPNuDBaBmmrIdmldRL5RBbUuM6H+XwINzxmWwzvaXc/jR+sS0MapCi+nJk/N6x6/dmACDCYA/oMrs2DLC/SI0wNfGm7Uf04Xishne+dshiDLUkLXivZSSzjfK23hZj6pTJ+JbzzoC87v7z4PEKh14afVork6P6ELBqzbigE9LbLFlk5qCZiX3omjZ3sgkwH0UCARqN3hr0vtCXek7RMOiMleSkZLDRZAtbr9vfonFYoEmhRhbsrlc5d/iFrKhZCB6tEbTK+KlUzqn/WWyGY0hPja2ouGuW4/GmXsGWs6ebAy/Sw7Hwpu18ims/7I7Nir9sb2dqeKFXrVcIVNGUoCGuyO80K0/Kx2zS5h4dEULEtG7Yt/f1Vpr8sRL5Ulv0oft1roaVgphsde9Zz4iPsDOgpBNeEx+8LM5PdwicX2GwyR8UyY+JnpVH+OiEgKAvVomvQAuKe+hNu9kDBMH5TRh7aPQwu/xpZ/PCBzjSNG0JXNajc10jaBO2KWI9/xlDuTIE8PJ03A/iIRFjmnbjQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199024)(82310400011)(186009)(1800799009)(36840700001)(46966006)(40470700004)(5660300002)(70206006)(44832011)(8676002)(8936002)(41300700001)(70586007)(54906003)(6916009)(2906002)(478600001)(6666004)(316002)(966005)(4326008)(36860700001)(336012)(1076003)(26005)(426003)(2616005)(47076005)(7416002)(83380400001)(81166007)(82740400003)(356005)(66899024)(40460700003)(40480700001)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 02:17:53.6233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db006a1-9537-4e41-8516-08dbb0daf969
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8944

This small series enables vPCI to filter which PCI capabilities we expose to a
domU. This series adds vPCI register handlers within
xen/drivers/vpci/header.c:init_bars(), along with some supporting functions.

Note there are minor rebase conflicts with the in-progress vPCI series [1].
These conflicts fall into the category of functions and code being added
adjacent to one another, so are easily resolved. I did not identify any
dependency on the vPCI locking work, and the two series deal with different
aspects of emulating the PCI header.

Future work may involve adding handlers for more registers in the vPCI header,
such as VID/DID, etc. Future work may also involve exposing additional
capabilities to the guest for broader device/driver support.

v5->v6:
* drop ("xen/pci: update PCI_STATUS_* constants") as it has been committed

v4->v5:
* drop ("x86/msi: remove some unused-but-set-variables") as it has been
  committed
* add ("xen/pci: update PCI_STATUS_* constants")
* squash ro_mask patch

v3->v4:
* drop "xen/pci: address a violation of MISRA C:2012 Rule 8.3" as it has been
  committed
* re-order status register handler and capabilities filtering patches
* split an unrelated change from ("xen/pci: convert pci_find_*cap* to pci_sbdf_t")
  into its own patch
* add new patch ("x86/msi: rearrange read_pci_mem_bar slightly") based on
  feedback
* add new RFC patch ("xen/vpci: support ro mask")

v2->v3:
* drop RFC "xen/vpci: header: avoid cast for value passed to vpci_read_val"
* minor misra C violation fixup in preparatory patch
* switch to pci_sbdf_t in preparatory patch
* introduce status handler

v1->v2:
* squash helper functions into the patch where they are used to avoid transient
  dead code situation
* add new RFC patch, possibly throwaway, to get an idea of what it would look
  like to get rid of the (void *)(uintptr_t) cast by introducing a new memory
  allocation

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html

Stewart Hildebrand (4):
  xen/pci: convert pci_find_*cap* to pci_sbdf_t
  x86/msi: rearrange read_pci_mem_bar slightly
  xen/vpci: header: status register handler
  xen/vpci: header: filter PCI capabilities

 xen/arch/x86/msi.c                         | 62 ++++++---------
 xen/drivers/char/ehci-dbgp.c               |  3 +-
 xen/drivers/passthrough/amd/iommu_detect.c |  2 +-
 xen/drivers/passthrough/ats.c              |  4 +-
 xen/drivers/passthrough/ats.h              |  6 +-
 xen/drivers/passthrough/msi.c              |  6 +-
 xen/drivers/passthrough/pci.c              | 21 ++---
 xen/drivers/passthrough/vtd/quirks.c       | 10 +--
 xen/drivers/passthrough/vtd/x86/ats.c      |  3 +-
 xen/drivers/pci/pci.c                      | 52 ++++++++-----
 xen/drivers/vpci/header.c                  | 89 ++++++++++++++++++++++
 xen/drivers/vpci/msi.c                     |  4 +-
 xen/drivers/vpci/msix.c                    |  4 +-
 xen/drivers/vpci/vpci.c                    | 67 +++++++++++++---
 xen/include/xen/pci.h                      | 14 ++--
 xen/include/xen/pci_regs.h                 |  9 +++
 xen/include/xen/vpci.h                     | 13 ++++
 17 files changed, 252 insertions(+), 117 deletions(-)


base-commit: 49b2d6a529122f10e17a17f807d8d51154b5ba14
-- 
2.42.0


