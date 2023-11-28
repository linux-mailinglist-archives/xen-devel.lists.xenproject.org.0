Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CC7FC463
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 20:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643447.1003673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r840k-0005E7-G9; Tue, 28 Nov 2023 19:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643447.1003673; Tue, 28 Nov 2023 19:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r840k-0005CV-DV; Tue, 28 Nov 2023 19:44:46 +0000
Received: by outflank-mailman (input) for mailman id 643447;
 Tue, 28 Nov 2023 19:44:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FWLy=HJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r840j-0005CM-BI
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 19:44:45 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 922adb6b-8e26-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 20:44:42 +0100 (CET)
Received: from SA9PR13CA0068.namprd13.prod.outlook.com (2603:10b6:806:23::13)
 by MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 19:44:38 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:23:cafe::2e) by SA9PR13CA0068.outlook.office365.com
 (2603:10b6:806:23::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Tue, 28 Nov 2023 19:44:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 19:44:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 13:44:36 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 13:44:36 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 13:44:34 -0600
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
X-Inumbo-ID: 922adb6b-8e26-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNyuvkqtH+RyK2xAiYftmGIJ5/93Odjh95wR8YpF56Tkj/s5W9GLAtCaiIwQOgQl4R7Il+3GsD3gY0l330edXnoMa29SlJ9+xaUqks2OckNPfmD9L4RRjrCu1gicNKftonzeyzFNuMxas/c6lGNJL6KCSL0SzEr2vvtYEhux+cNlg5Kp4W42jdR1fm23fBV2c9xa5nB7NYOGIoDTvvBVE8TseD46vscAf0Y4IN1vvsCQDna9GarI6S/W47kntvurP+dd9E6QNK6z8TarwpudRMCWZJZNisgIshe9/aB04FXCXweA1nUlUBA85YGVXh9+lyMYg+qiJ83VPrHHBIUdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uXUlNdzuoy+V/xqdDmeP61vCOVi61BDWDYruLA5SG8=;
 b=AVZdU1awjtdECQM7TZTr5j5W0TsdeL+xD03chLgxi+jiASa41z0KyDOwg0QZEf4kzRaw28BgSU6RBQXfAUFGDio2gzhs7o7ZVCXbao4ktWbngMYh8GpiBD3rRnghFEKpXOnsHftdY8TB3eVjQ65PqpB4WPB0kXYmuGpyzs6/SDQrtYRsHMRXqdQCwKQpVptx74jM5R/u25v5yFXkhN8xIK5N4rU1vpx4X1knslzptZrsiTUDroNFmMRmSeujJ/VgY9GIjL1Z3f6V+rypTtGo/mIydcJL7Y+vSwpaV610sIIF/78migWEa5EPGD23xstCLaKcfFAk4eTwDSSdqt8xiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uXUlNdzuoy+V/xqdDmeP61vCOVi61BDWDYruLA5SG8=;
 b=RvIEPCOKb9KdyBcFWj+Wab1cJJfIsRhRcpyUONSiRmelMEfz1H8ZZUJTmd0EYVls8EyvOvgYn8YNF5wRP4c83S+aelRNsAJB6HVj2iSfzT8HlYf4icqjTZBg0kkMvjhN8WCuSX4IzyF59hvuX+yLYF/PxEZCfucWJnquJNp/vyU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v8 0/2] vPCI capabilities filtering
Date: Tue, 28 Nov 2023 14:44:23 -0500
Message-ID: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|MW4PR12MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 183f4b58-989e-4723-d0fc-08dbf04a7474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M9HpDg21R8OJDeiYo19IKRhruF+uupDrMxw+x6T86KVa9MbndrpMwGAwfIrMQhsQfT4n0Vj8h+FndQ3Rg5Pw9v8XvVuJIbXuLCw0OR41kC4LQjuItTsfbXxujmaTi5x35QPfCufbHKaXC6ls01lh9K7ViI6z9RwhliJf3fMQGBGNrPFGetrCSZZhRuRgI9ySGCt+0J/0N0G6vYsXQ002xpZ7D1Bg1QbWca4laAYEil4JfFeY+clXhWWEYxTkqtmLa5SUeLoP9urw8KotX3DBq3dLmJ9n7EPqAHeTQtSakYueMjadsiiZZZhMh3wF+CmWjkgrlrLbM9wV4NrAx1pTN3snpOH7WoxJ+hFBX+pZJnL6y1UYDS0ylXLeQ/1JuDP09kvLyXE1RIo1v5Zur2/lS0G/K+SSsmj+g2tCu4xidYk9sD3wYaE4AO8zeHfb3qumJh4qQQKHLCMyQgQbpvl8WOvTvtwN8tF9rUTi8KFS+WznklXiEChOtujZwJNVNzaBNY5bU6ESxxKK2FqTgmd6C8a6Rz86bBk2+WsA2oW1e8VNVwf4pZ+9JO90jyXo3kX8vQEq3Aq1PeQh0rKEb7dPA2buSehA6HPxyDcPHproFwoT3/n7BqYdGg4fqdF9TFTmO6K9wFpQ6WxMJKd7E3apMknAMFPT20fO3hUkNk33m5UmSKcim3Fbqz+n0bHDz5r+SiaUEhoOortJbw6UaM1TtSDZk/YN4mtGwLcmLygrGK8TIhItHrjGqlaeg4a+GKYLbSEqVZ7ABFDe48ILsYTZeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(82310400011)(40470700004)(46966006)(36840700001)(6666004)(8936002)(4326008)(8676002)(66899024)(70586007)(70206006)(316002)(6916009)(54906003)(966005)(478600001)(40460700003)(81166007)(47076005)(36860700001)(356005)(41300700001)(36756003)(1076003)(86362001)(44832011)(26005)(40480700001)(2906002)(2616005)(83380400001)(426003)(336012)(5660300002)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 19:44:37.4491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 183f4b58-989e-4723-d0fc-08dbf04a7474
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974

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

v7->v8:
* address feedback

v6->v7:
* address feedback in ("xen/vpci: header: status register handler")
* drop ("xen/pci: convert pci_find_*cap* to pci_sbdf_t") and
  ("x86/msi: rearrange read_pci_mem_bar slightly") as they were committed

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

Stewart Hildebrand (2):
  xen/vpci: header: status register handler
  xen/vpci: header: filter PCI capabilities

 tools/tests/vpci/main.c    | 98 ++++++++++++++++++++++++++++++++++++++
 xen/drivers/pci/pci.c      | 31 ++++++++----
 xen/drivers/vpci/header.c  | 75 +++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c    | 74 +++++++++++++++++++++++-----
 xen/include/xen/pci.h      |  3 ++
 xen/include/xen/pci_regs.h |  9 ++++
 xen/include/xen/vpci.h     | 14 ++++++
 7 files changed, 282 insertions(+), 22 deletions(-)


base-commit: 18540a313cc66a04eb15a67d74c7992a8576fbec
-- 
2.43.0


