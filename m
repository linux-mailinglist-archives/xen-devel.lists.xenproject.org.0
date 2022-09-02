Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A72F5AA888
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 09:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397373.637927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0nx-0000Ht-3P; Fri, 02 Sep 2022 07:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397373.637927; Fri, 02 Sep 2022 07:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0nx-0000Ev-0Z; Fri, 02 Sep 2022 07:09:29 +0000
Received: by outflank-mailman (input) for mailman id 397373;
 Fri, 02 Sep 2022 07:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zTqM=ZF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oU0nv-0000Eo-9e
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 07:09:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cb586e7-2a8e-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 09:09:25 +0200 (CEST)
Received: from BN9PR03CA0501.namprd03.prod.outlook.com (2603:10b6:408:130::26)
 by SJ0PR12MB5406.namprd12.prod.outlook.com (2603:10b6:a03:3ae::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 07:09:21 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::2c) by BN9PR03CA0501.outlook.office365.com
 (2603:10b6:408:130::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 07:09:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 07:09:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 2 Sep
 2022 02:09:20 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 2 Sep 2022 02:09:19 -0500
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
X-Inumbo-ID: 2cb586e7-2a8e-11ed-82f2-63bd783d45fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8Mqk9Cw70LhzI4O9hPQ5FD+jnmcsk2QqVOPv/A/b7Nqnrk9Yi33BZeKLZ3qGcaRsTL7FZDdJph5fQY2BXB5IjzfrAZyPgnhOTv1dwv3FREhuZNY/GiTU1AU86wuP97gyhIloqQMq5yqnnjB2HxYqvWQS+nQapeye/az02yLbpyLgfp8FxyOnye5arh34sbR5GloFBNzjEW7zP/SpgJLzVbrvYnN0zsyb3Y7deM5ft4X1mHHxztrc8NjKSL4IkM63A4c76lCu9KUoC/VSOglk68tOPG1KNg41xk4ctxCrkXuLykKkeR/Ooa/t4EUQDyHXKavuRAnqAHGFDrwe/NiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zRZxMNvqrK8pNAflLJKCEsa1l9+8J4LDGYuY4EXPXI=;
 b=SXxKOdjBEsiLvqlfR+X7Z8F7UUdx6UR80pInifvKrXWMyWPu2yHSYPmr9RH7Dkcs5kftm19It+wr5iU1tKqqm4SEPCmwe4N1ELmYVkl5bp3CqE1zYczzI/v877PW/lZVa7EbVd+FyoeXcdlX1dZeqsKqSn11Ye8kcIaBjSVSLza2Ki8A187Tq9rJV1/ilET7J3ZT1tz5Q5kfxvoKl9+1b8FidVvlRpNgfnAyXI8/Lvsrx6nULfr3AUMPdDxbW1QmQFuVxLzWXafRuc9xquJAyUxsFx+p7xxwqjjfG7wgFhuXFzFkm6pEbbSAQZnGAZdJcdDVD6EALQJF7Tl8FdTLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zRZxMNvqrK8pNAflLJKCEsa1l9+8J4LDGYuY4EXPXI=;
 b=bERAnf871mD/sQaWH2uFkKkbfMRjI2TxaBO2Jj2xLq6UpGmdGmN7/IdAeOGdJau4Hi0GCBjyiXgrGvg3477CtvTmylmInKkcYvQPRhJA9JqqpmeVNSqsyVjc7D179hdfOpQt+1jPxfESzY5lHLlonavQH+e63+SSD9jT2q2yN+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [for-4.17 0/3] GitLab CI cleanup and boot time cpupools test
Date: Fri, 2 Sep 2022 09:09:02 +0200
Message-ID: <20220902070905.1262-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5647ed1e-b148-4ddf-7534-08da8cb20f3c
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5406:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rZK17z+F2C/dbh+O0laK3D9m9x+2IxInpuxKqX2hayMBM3tm1jF7g20f8Mxjj9gRHoSf23zD4LTMDcXgmMHBzpC+o+QHA+cQcZAVZI5NsTBN3eKnXcvz77q9MPleOwGF2Ajy7KgGDwi93n7r5B88fLX99ja+AracCTWWQee0zhIGdIvPl1VMFp00o+Ky4w5L1pYwdUbPzEZ9kQZz4cJxjN22Qqfo1BVwkL6hrgM+/KrFH0D07imRaXLyucFldtF2oPaX6JUX2FOptuE7zWCD+5ZZEJd8caAPrYWNsV2ctrCxJZJaWEva/HY+wqLwlyyfKl/m4FZLbeT0VpwOl9NitDThvJE2Y+enj0h37FrCW5W29gF99CLH/iFZZfPvjcRlVUmiMGQ/4xf+elHVrNFhbay1PZftMSTEe5MCKXHOaQGiEupB/ttozobjPO4MtVdQVVrN50e4pjnwPKO9KsZEJO2C4giuPA//CwzerU/dVtwF7Ecm/NKdPCeNWQTK3lIwmTVqIno3Y5wflsbRiKCMmGCh160xsRqdfFsieJOydnX7O7b9pxL00USrJE+cdY4cHOucP7lxyYJUJZ3YbPlb5gbuYeoXhlogKqJFl3zMxayVQmJitapDkDPkKDwtgun2nJHEmGNDpuOJ4q/pKWE5m3V3gmMCuhYMW/llTrEPF+znE8dKzWz8ZjOUzj7Xv+NCqf0Pyp2vGunlKvnVSFBZ0Xgi0U0NKIeu0Z5WeU1wRVUhOLafZhAQfVTyfyNP8zgvxEVi9IptVm8k1HcxUBDJbyyS8sTkPJ5xcZkPB9GTLngZt/1g5hrvzj8eRX8TXZBm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(40470700004)(54906003)(6916009)(41300700001)(336012)(36860700001)(6666004)(82740400003)(8676002)(4326008)(4744005)(5660300002)(44832011)(36756003)(8936002)(70586007)(70206006)(47076005)(356005)(1076003)(2616005)(86362001)(40460700003)(478600001)(2906002)(316002)(26005)(82310400005)(83380400001)(426003)(186003)(40480700001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 07:09:21.3409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5647ed1e-b148-4ddf-7534-08da8cb20f3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5406

This patch series performs a small cleanup before the release and adds
a test for validating boot time cpupools feature introduced in 4.17.

Notes for the release manager:
Benefits:
 - improved dom0less test coverage
 - tested feature that is introduced in 4.17
Risks:
 - CI pipeline failure

Michal Orzel (3):
  automation: qemu-alpine-arm64-gcc: Use kernel 5.19
  automation: qemu-smoke-arm64: Silence ifconfig error messages
  automation: Add a new job for testing boot time cpupools on arm64

 automation/gitlab-ci/build.yaml               | 11 ------
 automation/gitlab-ci/test.yaml                | 21 ++++++++++-
 automation/scripts/build                      |  3 +-
 automation/scripts/qemu-smoke-arm64.sh        | 35 +++++++++++++------
 .../kernel/5.9.9-arm64v8.dockerfile           | 34 ------------------
 5 files changed, 47 insertions(+), 57 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile

-- 
2.25.1


