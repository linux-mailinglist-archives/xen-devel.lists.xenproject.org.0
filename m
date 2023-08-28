Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FE878B6DE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 20:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591732.924204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagWn-0007fp-Eo; Mon, 28 Aug 2023 17:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591732.924204; Mon, 28 Aug 2023 17:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagWn-0007e5-Bi; Mon, 28 Aug 2023 17:59:53 +0000
Received: by outflank-mailman (input) for mailman id 591732;
 Mon, 28 Aug 2023 17:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+nU3=EN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qagWm-0007dz-3u
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 17:59:52 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad710ae7-45cc-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 19:59:49 +0200 (CEST)
Received: from SJ0PR05CA0096.namprd05.prod.outlook.com (2603:10b6:a03:334::11)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 17:59:44 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::9f) by SJ0PR05CA0096.outlook.office365.com
 (2603:10b6:a03:334::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.17 via Frontend
 Transport; Mon, 28 Aug 2023 17:59:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 17:59:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 12:59:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 12:59:08 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 28 Aug 2023 12:59:07 -0500
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
X-Inumbo-ID: ad710ae7-45cc-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+Bpo83tx/Z1caqP0mPlEHqvbjit2FK4urndUtdFvfSjZzrvoQUeFwsRUc3G5hl9YBgbx2/1PG/uFKuHhehlfqzu3+5Acugfro2VJYmslLAp858HCDJqYWU0//nZkooPU5wlH4vIl67GyatLeljVz+rg7Xci7TW77LesKPDnyQePcFa5DzINo4H32X7MHYIXNsfiGAPqDCXpNgwwVnyNQ4tqKeWA5msOnijm01EcyXU9oXq66NxHGpA+hipj0kOlMqe56x47k+zJgb/EXMii0ET9L5Fxr5Gr2bXQpkLZvqOtQ8jHdhSw59lZZT8wEQFH2pA5wyC1T07ZzsvzulA4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUozxZeVfn9OYMAx1ezaDtTVAJSbVBVK6DzcB6ND8Uo=;
 b=Ny6uStKx/VjkvbL5qQ51RFB5VJBIfOkP9IDKc7L8KOvCoi0ZTXa9v2mpfNvLpuUG6tYrnpz9GU0g2Uj7369X1VUI+jsCbBKQtTRvyPA0hxxIaA+SgZaWky5VdRxMfOD0Ppvt0QnBiCwL0VZEDOUczJnW7TV0cy0H0sehvd5Sq/FeMN9WB7FHiqa7CyJfY27E/7F/dpdcWgtjzURk0Cbm+y98L4P/cgTpAGsbPEzye65HxycVKa9mfE7ggPpSLXSG4UDL8tv4W5I9JKhTroAI/nQZiOmjTr/SEL4UboXLp7CfiEYyMOqM1AToVO7WLmqR0dRWRWJbxz0SYNBfz0azEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUozxZeVfn9OYMAx1ezaDtTVAJSbVBVK6DzcB6ND8Uo=;
 b=LQZRodBMgIZDryYeYr5FkuYiRaG5SqV2oLAVF+OSRsMrwq7TpddUnd0JDe5hHkVxKoKXI1ofZmwVVHv/S/xcNRVJopkts0eERssFkQWgCJ+S09/hxZtlzspacA7LoixilzfkSD6G7Om7FOPUCNsJQGORgYdqrmBppEKvILuFVGg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v4 0/6] vPCI capabilities filtering
Date: Mon, 28 Aug 2023 13:56:48 -0400
Message-ID: <20230828175858.30780-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|DM6PR12MB4217:EE_
X-MS-Office365-Filtering-Correlation-Id: 883ec453-7fbd-45d8-1e74-08dba7f08edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OfJar2/OIWQy+isFieDv20X/VKjcbVdsbslbHpLwfNFYlUYkFnVd827cfx/vTrA6jLLlqWE0/sqAIMgfZiGUHXzucIvFcVK8sovcpIMevzeSDAQxe8+cKeONSAxuMPIj6C+uR3zgJopxwpKD0gJv7RFWVI3BWZH+nY670gaDBcUScKoWRadMjI/0L/3cwhsEtwy1rlBsFOkPoMt+l725++WIXlSwoXOaIKDbcDcdMZGV7sKTPCr9b0YUED04pNEQC5GQs3f6lTl8GeIgS/zX91KITJYLeLMu9s0FyHH7ra1kheoMBvCykbf6ZW1mDAsfOjqTBYCSKiRwucUiArq3jLMQSAalKLcseBm6isarfEptXLn/g6MdXbG97KI3gkmyVHt7Ci5RJUS/bV9G5YsOaraRdcE9Toe8ATgpICmF+e85UWyN11vkt0D50VbvQLiXnauinZQgMuCpvoyZooXalKztHJ3FoMSbI3J8fHjCjDf8diOHF6r0PQGJLtic8M420kFAV0EvloPBctVrhouuzewRmsbY5NsVeYRKex1YAAJVlE0TI6aP+nF7jj2ujmA+UWnSrU6RyX7AspqD5CvnjRVsr9NNrjM4ef11xixssQb9PMwFIXscHgWcpJvodRNxKCLVNW2eUM95qRUz/N1Eg2aL4CthsRUeCfDqbaMH0ZWGqICgLvQYV3iXZvD0RBaWAuFlY/MPsMk2sH2cvc7jv2zGPM+rUc9Dv9mlrWWQzZa2oBgKwKxmvF0X0XF1iV2+fcM6Kt18ndym64JXRZF4qQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(82740400003)(66899024)(6666004)(40460700003)(36756003)(86362001)(356005)(81166007)(40480700001)(36860700001)(47076005)(2616005)(1076003)(2906002)(426003)(336012)(26005)(83380400001)(966005)(478600001)(41300700001)(70586007)(70206006)(4326008)(8676002)(8936002)(5660300002)(44832011)(54906003)(7416002)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 17:59:43.2340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 883ec453-7fbd-45d8-1e74-08dba7f08edd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217

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

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01281.html

Stewart Hildebrand (6):
  x86/msi: remove some unused-but-set-variables
  xen/pci: convert pci_find_*cap* to pci_sbdf_t
  x86/msi: rearrange read_pci_mem_bar slightly
  xen/vpci: header: status register handler
  xen/vpci: support ro mask
  xen/vpci: header: filter PCI capabilities

 xen/arch/x86/msi.c                         | 69 ++++++----------
 xen/drivers/char/ehci-dbgp.c               |  3 +-
 xen/drivers/passthrough/amd/iommu_detect.c |  2 +-
 xen/drivers/passthrough/ats.c              |  4 +-
 xen/drivers/passthrough/ats.h              |  6 +-
 xen/drivers/passthrough/msi.c              |  6 +-
 xen/drivers/passthrough/pci.c              | 21 ++---
 xen/drivers/passthrough/vtd/quirks.c       | 10 +--
 xen/drivers/passthrough/vtd/x86/ats.c      |  3 +-
 xen/drivers/pci/pci.c                      | 57 ++++++++-----
 xen/drivers/vpci/header.c                  | 94 ++++++++++++++++++++++
 xen/drivers/vpci/msi.c                     |  4 +-
 xen/drivers/vpci/msix.c                    |  4 +-
 xen/drivers/vpci/vpci.c                    | 53 ++++++++++--
 xen/include/xen/pci.h                      | 14 ++--
 xen/include/xen/vpci.h                     | 15 ++++
 16 files changed, 246 insertions(+), 119 deletions(-)


base-commit: 067f18c3a72d8f0acccab831083b8518f0832d81
-- 
2.42.0


