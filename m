Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25758040CB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 22:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647309.1010304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAGC2-0005aL-BE; Mon, 04 Dec 2023 21:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647309.1010304; Mon, 04 Dec 2023 21:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAGC2-0005XH-6n; Mon, 04 Dec 2023 21:09:30 +0000
Received: by outflank-mailman (input) for mailman id 647309;
 Mon, 04 Dec 2023 21:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y+Gv=HP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rAGC0-0005XB-4b
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 21:09:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 663a8085-92e9-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 22:09:24 +0100 (CET)
Received: from DS7PR05CA0021.namprd05.prod.outlook.com (2603:10b6:5:3b9::26)
 by MW6PR12MB8900.namprd12.prod.outlook.com (2603:10b6:303:244::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 21:09:21 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::d7) by DS7PR05CA0021.outlook.office365.com
 (2603:10b6:5:3b9::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.23 via Frontend
 Transport; Mon, 4 Dec 2023 21:09:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 21:09:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 15:09:20 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 15:09:18 -0600
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
X-Inumbo-ID: 663a8085-92e9-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfTOgl11OCcsHbXWqhRBShAyI/hcUpX26JL1ge1vMZ4hq9anKOVbp2vPb8PnYG1yzW8+HQPyR79iKOpaCjfBZPlw6ffFj/6JwUr1GKLNf9mKI1oRZYd3hMiEFaxErdowbdkeWLiTOBw1erheuJ8SCNEkcxjVCD9FUYpZBTa04aaox+s9m+Tn+J8krPoO7nj6NjEvhzqw5ssQAgCizJ6HgXRVlYtc0LpqmKo1U5EKA8UwUlL0KqysIE8BROcxKHFAm/ZVP5CWzOr2lFJzvVUa7fHmKqbqr1J2zRN2jbSHixDXYiMFiXlmhX3RTz5iuC2JABim1n1fpuyS0RLopATxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5zDZAQHtH5DU8J90znZ+kdopSo5KFgGnZOx3zB55d4=;
 b=LxkF8c9vKYPt84wqSHbAwln9hsHzFM6jHmaVAFcMs9PcYyxZZQSI5wwt5A/nyRZMbuaGCCvzxq+5eps63o6ZNCNvHsH6sesVI0YZwVE6QfhLm6X5U/iDAC1Tus5W1SpXBi9mrb+Y3MeSgoOff6e2UFzBNmMOkDYG0T0U7W996e2dAOYs994Z8bCK6YofPBSyFAzqjAIVZ+WUGakvZdNCkT/GYDkL6RxgsW2GoT0zjnNKPZHt6nIIBIs9cZU03vH3DUHTFloWIBSunH+YxXuATyHkpe5yw4YFJWZ9HSNYMY3s4AOWi6OQlEtkLcUNvD/aAsgaqWKHG+voYE3gKe+wSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5zDZAQHtH5DU8J90znZ+kdopSo5KFgGnZOx3zB55d4=;
 b=hdoUMXG1YVdFLVpBsa6Uyga/q/ZK6arSowIO7X/Av/adU7NB0yoC8dBws37q6ZC6vAAJwNTlAPNz8zsmOqh2RNs7+Zb++NY8ppsxFrGaUBk+6XjCz3UelkAK5tYczDbjzp2vxjtfmkEZW6bhP2gWsHialu7cygzmLINeXuCUTSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v10 0/2] vPCI capabilities filtering
Date: Mon, 4 Dec 2023 16:09:11 -0500
Message-ID: <20231204210916.3651999-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|MW6PR12MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: e741df0b-2c7b-48ef-03cc-08dbf50d48cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B6yAgD+h993/0SRSC7X42MifMibABnLzMhvT91yw+LUYbN12O0uOom33wnUxRRbYFSajKCY4wOnX+fnu5qVAaonYQ+prtVbwfANQP2AS2ylVvi+v0SsYHZUGyBeCVoGP0kNW4Sa2xZyZkgOVp8HWTQb2MlsVhb38wYYYyLH1FAOAnbtpURRJPjn1ATV3wysbSu6hVqdso3eBM1vUDP5thKqUhZS3ZCQu/UpezaMJIgg8k47fV+FxIFz7aD+sLaXSz/rchAEMYLtc8Gc2cJv969qcFSKaa1+CQRBjvHkQRubKocMMgP7ZdWYtTDs9qrID4UGwuACcJ+cCtZ5N9RzWMV0D2e0l6oFxYzBD6YceLq6zaH7BXkE2NyfbNyVXOX8Ox3aVKXT8hl2r4xSGYaqLxblf+yE+hSkOGgxsUvIBLtsnU2xDxAolx3dA2TmwCiq1IaoScigk6weMB2Z7MXyDU/9nF0a4DKCAAxZoQ4hqUDTO541a/JW7U0Dx3vvi+whnzN5HDUvXSVDOpbM4Ukxv/ZJ5nAzEGN66I/lRu8zwNE4hMI0kn8WWH7sbRqHIBiQT2owYL3RBa/FKzhDaaNOGEFvgEWZQoo1x6G8B8mBakmDLaM9OnAE7j9c6440gqXtQSM+YUQP/PmfTw5dyTXcU+ydGRkSYFDFv7cu6rpJv7AtZELli2jpyYIjk5aRUVFXT8LR2QaUxpSIHzxOuiHxrRYg1DkdhSXAOlYnFpC6y7jrwaBbyybb54Qk35HIy1PI/DRIe2ShAWkXEb4bjI1AO+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(5660300002)(40460700003)(44832011)(86362001)(4326008)(66899024)(8676002)(8936002)(2906002)(41300700001)(36756003)(2616005)(40480700001)(1076003)(426003)(81166007)(356005)(82740400003)(83380400001)(966005)(478600001)(336012)(26005)(6666004)(47076005)(36860700001)(316002)(54906003)(6916009)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 21:09:20.6985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e741df0b-2c7b-48ef-03cc-08dbf50d48cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8900

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

v9->v10:
* address feedback, add R-b tags

v8->v9:
* address feedback

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

 tools/tests/vpci/main.c    | 111 +++++++++++++++++++++++++++++++++++++
 xen/drivers/pci/pci.c      |  33 +++++++----
 xen/drivers/vpci/header.c  |  79 +++++++++++++++++++++++++-
 xen/drivers/vpci/vpci.c    |  64 ++++++++++++++++-----
 xen/include/xen/pci.h      |   3 +
 xen/include/xen/pci_regs.h |   9 +++
 xen/include/xen/vpci.h     |  30 ++++++++--
 7 files changed, 297 insertions(+), 32 deletions(-)


base-commit: 525c7c094b258e8a46b494488eef96f5670eb352
-- 
2.43.0


