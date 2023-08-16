Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638677E90B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 20:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584852.915709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLbt-0004qO-Tl; Wed, 16 Aug 2023 18:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584852.915709; Wed, 16 Aug 2023 18:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLbt-0004nw-R0; Wed, 16 Aug 2023 18:51:13 +0000
Received: by outflank-mailman (input) for mailman id 584852;
 Wed, 16 Aug 2023 18:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5U+O=EB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qWLbr-0004nq-Kb
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 18:51:11 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f400:7eab::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8f8add5-3c65-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 20:51:04 +0200 (CEST)
Received: from PH8PR02CA0009.namprd02.prod.outlook.com (2603:10b6:510:2d0::22)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 18:50:59 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::32) by PH8PR02CA0009.outlook.office365.com
 (2603:10b6:510:2d0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Wed, 16 Aug 2023 18:50:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 18:50:58 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 13:50:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 11:50:57 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 13:50:56 -0500
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
X-Inumbo-ID: d8f8add5-3c65-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOKtxMNJCn38JdKW2M6F/rNBMRmczEXA/xR/SHtG/nBfICwPi/FUEDz3E/Ex78WICMhfrAN0rVuVdodTx9u3z3GBmnzPpdpNgXS/MjTUlEbxuzMWqDpoLtf/FGlBRCYk28+mRnNwMHtplmVEscrp5Ogxyh3QI9DOQKDyDOnIV74eXEosoi8Hj21EzRMDn8rEG5XD1xlxNAXa2QhrpiIw6aKp94HCQGX/espj9n+y+9vjbg52BcKEnlpYD3ag4ILqGFrqrURr6OwG2rBdO8549LKZUJtMsWoXXVqBz3lrMeXGUMhUUOM/z7yskPfddWviT3fl+UhC8fbAD043z6OxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PGoDvADY51VGKbLwJxx6+/FCUwpSHNVGhsNWRTkaIE=;
 b=Ac6jht2p1HzyAYWsk5zvED+9vIF42B58lOoLpoC7LxyqzwCw+6IaTBSL3oNXlaO8rYASNdTulozk+z2vC6zLbqkDkOamKFaYrXYfVNpJAEAGF7yN1bW72HjfkhYQO3YQtM/Prh8JJ5bJInTOtH9w6RmweD6n+9U6Athnxb0W6oCPPrIt4G1O6wD37BNaW3P1U05/y6Z54x6E4sSZjNKag8n+9zwAeTcpIu9c1v8NNKyIKgtJfOkSwKeYevdGdcoUiJjfuS8nxpzEZ5dvLWJxCNC7SQou/4PLNM16+3tB0NJHehjPIlNmzho9s/uNGOUVDSmEzNVSJPs9rYuzeKp7yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PGoDvADY51VGKbLwJxx6+/FCUwpSHNVGhsNWRTkaIE=;
 b=tFF6oBRnErm6vWpzQ3GHH5hIYpINyuZ7Jaq7BKeaLhjzTB9K+Cmnv2yHBJ+XCB0jgJp6kMAWMH5ri0A5U1U82qWmPJbe/ftgzzS86UsFbCMzGmp5Rd6WfI4kceJ8Ki5W+MPwaI8DSZE7RnyxIrzaCBqik4a1Zs8LHpsG1htOqoY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] vPCI capabilities filtering
Date: Wed, 16 Aug 2023 14:50:27 -0400
Message-ID: <20230816185035.82994-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|CYXPR12MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: df4e714a-f49c-460f-0e47-08db9e89baa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4VPaupVoSLXQ3+Kcr/csU/9j/kNiEbJuqsK3vj1gLGmewBgEp1uAvYNyMlJOJnWI0mWYmpB0B/WJwd88fFAQUIeT4jCMj8K6MWEN/9xEQgJzbYbhnhGWTKbwf43cj34aFpVuEoKzqBKv8JHxFPcxvZfG74xsRxk2Wj95umLGhly9f/SZ6jTnveHF9Tb7ziC+PJ2keRzCLeF0Gm1SfqmOG2rh2hbog7DZgeCTfhWsH5qb6OR97qE7S0iaZsweQFPuh5KGTSp4Z1gX4jio2JrjRcS/o6F3TgYete8y44lY3bGELoswQlA0Ix3lPFVDiVhJvjAGWYQre2fyGrNDlFlm0aivSH5s+dA/NCHlKOa97xqTXt3Z0T6OW2ifD9BE5PN0x1ydS1EyyLxq6bZeIlXU8vCWbdmz5ejRT/vGayklZdz/L5GlvS+8DeTL4xbMhrtQQkJNVMthOyi0zbzyDf79Bo1FTtKbwfd6wHUeTCHXsaVGS5tZ2dTVyldxzUQueQyeGZ4BgoUP9AQdt2y6NCLIs6+PslRhGQ9fw88Z9YL7fgMFE+NwnxzVmWflBSqTNpBOPOFqI+tKvgSeW9/6+n26TxYN99/uZDTDzmt2CRznCkmnJQFdOsbhqyq0gnQdTaMqc4iBQLg64XO8Um+iNavjYUKXzvo8xZ6hc8irkszP6I7py5rJP68ZlLstSB0QLfEOzwvqAk9l4MTBG9BTrOpEGocwlqHFsHb8yZ28cV3Ll437Nul350JB00WV0NPvLkkpttYgzCZQiqEwmezjV1OVSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(1800799009)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(83380400001)(66899024)(86362001)(40480700001)(478600001)(426003)(336012)(36756003)(2616005)(6666004)(1076003)(26005)(966005)(44832011)(5660300002)(36860700001)(41300700001)(356005)(54906003)(82740400003)(316002)(81166007)(70206006)(70586007)(6916009)(8676002)(8936002)(4326008)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 18:50:58.1741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df4e714a-f49c-460f-0e47-08db9e89baa6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337

This small series enables vPCI to filter which PCI capabilities we expose to a
domU. This series adds vPCI register handlers within
xen/drivers/vpci/header.c:init_bars(), along with some supporting functions.

Note there are minor rebase conflicts with the in-progress vPCI series [1].
These conflicts fall into the category of functions and code being added
adjacent to one another, so are easily resolved. I did not identify any
dependency on the vPCI locking work, and the two series deal with different
aspects of emulating the PCI header.

Future work may involve adding handlers for more registers in the vPCI header,
such as STATUS, VID/DID, etc. Future work may also involve exposing additional
capabilities to the guest for broader device/driver support.

v1->v2:
* squash helper functions into the patch where they are used to avoid transient
  dead code situation
* add new RFC patch, possibly throwaway, to get an idea of what it would look
  like to get rid of the (void *)(uintptr_t) cast by introducing a new memory
  allocation

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01281.html

Stewart Hildebrand (2):
  xen/vpci: header: filter PCI capabilities
  [RFC] xen/vpci: header: avoid cast for value passed to vpci_read_val

 xen/drivers/pci/pci.c     | 18 +++++-----
 xen/drivers/vpci/header.c | 73 +++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   | 18 ++++++++++
 xen/include/xen/pci.h     |  3 +-
 xen/include/xen/vpci.h    |  8 +++++
 5 files changed, 110 insertions(+), 10 deletions(-)


base-commit: d0eabe3eaf0db5b78843095a2918d50961e99e96
-- 
2.41.0


