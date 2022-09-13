Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4595B6CCD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 14:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406345.648723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY4jO-0002Iq-H4; Tue, 13 Sep 2022 12:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406345.648723; Tue, 13 Sep 2022 12:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY4jO-0002Fu-Dq; Tue, 13 Sep 2022 12:09:34 +0000
Received: by outflank-mailman (input) for mailman id 406345;
 Tue, 13 Sep 2022 12:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWZA=ZQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oY4jM-0002Fj-O2
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 12:09:32 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb2a4e1e-335c-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 14:09:30 +0200 (CEST)
Received: from BN9PR03CA0149.namprd03.prod.outlook.com (2603:10b6:408:fe::34)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 12:09:27 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::88) by BN9PR03CA0149.outlook.office365.com
 (2603:10b6:408:fe::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 13 Sep 2022 12:09:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Tue, 13 Sep 2022 12:09:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 07:09:25 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 13 Sep 2022 07:09:24 -0500
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
X-Inumbo-ID: eb2a4e1e-335c-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYgGOZugHoEZZaYF9qAyXULMUxHs0qLBN4IpoVQd4+RbG1wFo2irk//yx8KQwpmeWiq0pHA+OKxW0KEQ+WUO0c5UCZArkdI22sX8WQaKispLuuMdsu37/FA1PlxsDFtVzGswqTO++7RuDTQ/5/SCK++wMQpwtd+GF9KscqCpS4y/cl77GuDp7HeRBdPzXnQGlZGtEGVms1TJqcfxKiBO5In3Knce49Y7o4+huK7vebB3uivwNCnr9QW1zCmgQoG9yzOJBLIst7jHNDr9dJLfsDiVzwlUEFdfqest9h2ox8szUizk8fU9woO4W9GimwZYodOBPV1lyjGX7H00GSNOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyF0tR4xMYoYLzt3LlDRj6edeOruHgGGdZEG6tiK4DY=;
 b=ddgApKUMm4RJ0A8xNwECxajjS5GXYla2kuQDMxMlIDHy5S2V+uLp+nTm7x7oALt3N7OxSKOBdEip1WcRu7ah/4/RVdntY58HcNzmx/kJYHSceyjtPZZbVryBI8uRlQRI5V80gkfGH5NDFGrqRdgtHhlgbkJWU02dHo3kHBNQeHJ7wUOEIndYVQXpQlvsxNT83Ze4xXsaqmyjFrRN790REuXKe8U1OdwK006f52zUI3X32M4TS3H30czvrduORT+fswymLZCRriAcD7LSqzEapqAOpa8wlI0is91ToA2fdQsQY01d//ikdTOQ5kqJrhmOwXQRf0gMxG79B1ulDMfJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyF0tR4xMYoYLzt3LlDRj6edeOruHgGGdZEG6tiK4DY=;
 b=YSQwUULqZpJx203u/5HVVqRNJWZxyvBjf+xQkoyuJO8aS9FImgBs5nfrvMT2ehP74D1VI8RhRomRKAmNU9IYt9O2faT8aPyh4ja1yu+nuY/dPB4BSWaVQUfUfnHvG7gW3SFrBtazR+AHh6eeP7tAaardxevCpHwMVLpNSUU6miU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder v2 0/2] Use lopper to generate partial dts
Date: Tue, 13 Sep 2022 14:09:16 +0200
Message-ID: <20220913120918.31162-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT044:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b6f2bd-b6fd-4935-8c5e-08da9580cdee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ymfNSf79p5/1jx1uVyv5gcouwSfsN6ibaMP63tJBYgtNMEBzg9uipLp/4Do6W3VnXoNBUwI9c/R7Bx0+7xf4YApzwBy71yI9NFL+yLU/6DWWvw+K07G5vSU0sPpFjT8zztPriav6rdpkqUkMGZTBnyoUnpclAxqro2nQ0Cf2Owg71AJecVTUpb7s/eD49OP/x3ODrTj6pwTKGozhGQDKozUpc95KCMhORuWmTiQyed/NpDkia2A2h5ao2iybF8ae9gtqFz/BPTCLSU1j5mhQgrS1dIg74lM0ohZGqGkRfuJ464rkN8qs8oNnbN0SX0ir/GQSTcbC6ltLadGN3+b+RhT/9hO7tJ6O7aG8/riI6ygevSDWhr+uLRPji8EbT3o7IJTcEFFFT9ST7mgidK8q90QTrh6ZZ6D/cgsajDOEDY5BhU3UJ4aemJI3I05xnRr3ZjVYAAXT0qgNe3ilUAmNpv0c4qKnoVuXiOdLJJV1TRMFUD+Hrr6zi98EfxNfhos3O8zz1sZNiZGSWke7flqHYZAuRJrV+n1M357iX6mEAxpJ6PaXyv6Btb4W1OLfCiZKq/aM8oOZB3SBWzAKi43aNA8Ob7GQ5tdp2775LQg/s7YcsPLsX2IF+HWcUKnW4Pr4xcH6UjaN5WuJKGxkRK9wPWeLHhd4rxSQ9JXRcaBPDU7MbwgvLcL4+aM9ajN0njOMYyNtgLfUS/h47VuFRwS5aGPgD/JEnCZQSjVsbwZTcUOcJQDHW/4IqlHcglOmJ9m4iZmr/fl10PRWqgrZjvjG7ulEpACIwH8OrSLX87Z9Pm8way0mwiLJPCbFRABdAu+FSoZq/gqT/RO9Pefhkal2uQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(4326008)(8676002)(41300700001)(70586007)(86362001)(36756003)(6666004)(478600001)(356005)(40460700003)(40480700001)(6916009)(186003)(82310400005)(966005)(47076005)(54906003)(5660300002)(2906002)(70206006)(316002)(8936002)(81166007)(82740400003)(4744005)(36860700001)(83380400001)(426003)(336012)(44832011)(26005)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 12:09:26.9036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b6f2bd-b6fd-4935-8c5e-08da9580cdee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

This patch series introduces support to generate automatically passthrough
device trees using lopper. This feature should be used with care as the
corresponding lopper changes are still in an early support state. Current
integration has been tested with several devices from ZynqMP ZCU102 board
e.g. serial, spi, ahci, mmc.

When using this feature, make sure to use the latest lopper's master branch
status [1].

[1] https://github.com/devicetree-org/lopper

Michal Orzel (2):
  Refactor sanity_check_partial_dts
  Add support for lopper to generate partial dts

 README.md                | 23 ++++++++++-
 scripts/common           | 84 ++++++++++++++++++++++++++++++----------
 scripts/uboot-script-gen | 22 ++++++++++-
 3 files changed, 104 insertions(+), 25 deletions(-)

-- 
2.25.1


