Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F85EA247
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411616.654591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclug-0001C2-BM; Mon, 26 Sep 2022 11:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411616.654591; Mon, 26 Sep 2022 11:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclug-00019m-8R; Mon, 26 Sep 2022 11:04:38 +0000
Received: by outflank-mailman (input) for mailman id 411616;
 Mon, 26 Sep 2022 11:04:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oclue-00019b-BT
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:04:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00707dab-3d8b-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 13:04:34 +0200 (CEST)
Received: from BN9PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:fb::35)
 by SA1PR12MB6776.namprd12.prod.outlook.com (2603:10b6:806:25b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 11:04:31 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::d1) by BN9PR03CA0060.outlook.office365.com
 (2603:10b6:408:fb::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 11:04:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:04:30 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:04:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 04:04:26 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:04:25 -0500
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
X-Inumbo-ID: 00707dab-3d8b-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWebEt+yomU+3OM5Leo7hWsPfAvz4mpAWLEnOg6XA5SbnCVTtq/HOTmenWOmxE+LscmJ3FT69X6eUZkL+PUO6LDzyb1dTexiRQQGLUo9B1nzATYah2VV3T5hpUXfTbJZXiIKCnzrOQvqijK++YmJIkDYiNu7Wx9vFV4v3bg2ZqPdfETU0S7s68Dg+czdPKYqRz0wo+1hUNRgRDpLrJeEHgg9lCzWgPtPZfeYWnWbg4L+7pmF7YVhWnzp+5FwN3bviaaULCivfbdrVmWfbKhvjBtmlF984s796yHg3LcFGGA1ZvbN7wM97eFU0Yd46qvCBGq53VdmCsyROwMKNiIhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qYAjMu2SklZg1CLoLXnmRewVuZrNSTpNxiz/94OvhE=;
 b=ncQqtDGdFpzpGn1Q8xQVTISJPtbwXsl4IFawj3iUjE0D/s+us43j6tGDu56JDfJcmRoSHWcenEUgHZzBQ3tjWUQxPR3bXcty4oGavS69/KnUVR+TFk5Lrtsb6D2Miwcm3/ihrYiHg2VJPeUrXXIpNheV7jnzG+PCKz3RAX5GBwgkOWaU9TDh0rsW/npiGITfN1Wr6Kx6XsI+jfionVuMiUSRhCAtDUzZJue03XgI9q7koPzOfzMtZCFOSBuT+zCJI7gS8UOxsFyVrHncDxe6Bcg4AuTCA/+fgSnjdopgu42NYXqTyrbkmGQVXf6AnL9UPVqvIW1PLfj1de+ysgEVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qYAjMu2SklZg1CLoLXnmRewVuZrNSTpNxiz/94OvhE=;
 b=jrtTsHC6jBLiRj2UvAXSc2xqHMcTTss1wvXkmXKt+xXnrJzKIXEcVSL9/TYzzWpxGGxzQZ2IF5LOGQ6SjTDEReFhg/UWb6gS6aKkoDKwu/wZfdvmqr3+ODM/Y2JnN9JLgj1IwS9jLBrJe1tRYmIowcbPo0BFq5jorGSBm72uid0=
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
Subject: [PATCH v2 00/10] GitLab CI cleanup & improvements for Arm
Date: Mon, 26 Sep 2022 13:04:13 +0200
Message-ID: <20220926110423.26030-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|SA1PR12MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4a17dc-43fb-4f9a-60a4-08da9faee305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JaO0xUHiAA9ZSx1gDQ4rzYjtjV5x+SBBYFTrpUp30Unpkpl21Dd7xIEgINPWoaWGYyWUyeKiITp7mMuhTmCwH9dVdVgrgjNMHpabwAf7r3x7JSgqP8+lD+SO3ZSll5V+NHkXWQ5OTzH7ZIJxDYy8LE8ep8fxnLRZQT+5u4wVfIZ6XsjdvCW6f5GRUKSUexLf0n54ib0AQYXoUElDbEuJmPIbpTYT7TsucfZNWFbVdoSZmw9J0/6eXXpI3geO0gkQkCEqlUVD1IbqdneYQ0+TFs6L6IEg2QiqFYWE5OheiYp2MG0jMEt/uipfROjzkJ1kZe8vF6yYJqk29+ywJw79npfPlVpSD1QigYXhMQ6AP28se2ChU+0F9QvqJ6W1S4tbB4dTKa/ELdqfT1yB8iZ4XHhyj03wQoLNV5CGw4ME0auPGc6dTN7uEg9EgDyu1oS4AhimIUN6X8mI9j/YomJFvVg48KylS8Tv1wuZmWKaGYC7IGDOcComGhIBb7aQnfqRp5g+rPPdkc1Yc8O3levSmB9sHjT6c0iR18G/Y1If5P6CITBRGXx/AhpU3QogOHLs82XZ4fw/0VeASFxEOYhUgLYC+J2CIBvWzYK+juzEoNZhYM4m8nacDVui8efGkuJ1jcmcwtG8fA/sHenBD5a9k5KIjJ19aW9ZhkD96DWuvyDr0tQjQ0oPM4S/XMoCf9TRwvwUAx74tB3eUGJct6gGCu4Zzbo3LEcLy9MxRJbJsz/kB1fiIfBZxILxPMbZL2fQBa/gmysNsEEkGW/PD9Lo3UTtOlYnE5oij1NeplQJhsJnBWpZy7GS3oDUHB8+I54J
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(86362001)(81166007)(36756003)(356005)(36860700001)(2906002)(336012)(1076003)(186003)(2616005)(82310400005)(40460700003)(40480700001)(5660300002)(44832011)(6666004)(478600001)(41300700001)(26005)(83380400001)(47076005)(426003)(6916009)(54906003)(316002)(8676002)(4326008)(8936002)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:04:30.7627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4a17dc-43fb-4f9a-60a4-08da9faee305
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6776

This patch series performs necessary cleanup and improvements in our
GitLab CI automation for Arm. This is crucial so that in the future
we can focus on adding new tests instead of spending time to fix
issues, making the behavior consistent, removing ambiguity, etc.

With the increased interest in gitlab-ci and using it locally, there
is still some work to do mainly to improve documentation. This however,
will be handled in the future series.

Michal Orzel (10):
  automation: Use custom build jobs when extra config options are needed
  automation: Add randconfig build jobs for arm64 alpine container
  automation: qemu-smoke-arm64.sh: Increase RAM size
  automation: Add debug versions of Arm tests
  automation: Add Arm containers to containerize script
  automation: qemu-smoke-arm32.sh: Modify script to use ImageBuilder
  automation: qemu-alpine-arm64: Cleanup and fixes
  automation: Rename qemu-smoke-arm64.sh to qemu-smoke-dom0less-arm64.sh
  automation: Rename qemu-alpine-arm64.sh to qemu-smoke-dom0-arm64.sh
  automation: Rename qemu-smoke-arm32.sh to qemu-smoke-dom0-arm32.sh

 automation/gitlab-ci/build.yaml               |  43 +++++++
 automation/gitlab-ci/test.yaml                | 117 ++++++++++++++++--
 automation/scripts/build                      |   8 +-
 automation/scripts/containerize               |   3 +
 ...moke-arm32.sh => qemu-smoke-dom0-arm32.sh} |  57 ++++-----
 ...pine-arm64.sh => qemu-smoke-dom0-arm64.sh} |  14 +--
 ...-arm64.sh => qemu-smoke-dom0less-arm64.sh} |   6 +-
 7 files changed, 190 insertions(+), 58 deletions(-)
 rename automation/scripts/{qemu-smoke-arm32.sh => qemu-smoke-dom0-arm32.sh} (55%)
 rename automation/scripts/{qemu-alpine-arm64.sh => qemu-smoke-dom0-arm64.sh} (88%)
 rename automation/scripts/{qemu-smoke-arm64.sh => qemu-smoke-dom0less-arm64.sh} (97%)

-- 
2.25.1


