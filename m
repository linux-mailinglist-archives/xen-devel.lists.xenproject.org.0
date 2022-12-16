Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB064EC1B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 14:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464702.723178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6AnE-0007j8-Rj; Fri, 16 Dec 2022 13:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464702.723178; Fri, 16 Dec 2022 13:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6AnE-0007gz-OZ; Fri, 16 Dec 2022 13:30:28 +0000
Received: by outflank-mailman (input) for mailman id 464702;
 Fri, 16 Dec 2022 13:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PP9E=4O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p6AnD-0007go-3A
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 13:30:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc57247a-7d45-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 14:30:25 +0100 (CET)
Received: from MW4PR03CA0096.namprd03.prod.outlook.com (2603:10b6:303:b7::11)
 by MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Fri, 16 Dec
 2022 13:30:22 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::31) by MW4PR03CA0096.outlook.office365.com
 (2603:10b6:303:b7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Fri, 16 Dec 2022 13:30:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 13:30:21 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 07:30:20 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 05:30:19 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 16 Dec 2022 07:30:18 -0600
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
X-Inumbo-ID: cc57247a-7d45-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+WgvbOzPiuzIs4qv4Ro2psvgsm/Uj/81IWY5EN66/6zlscmaN/5kHeCJ8ufc32IbGlpYXU/gz7jnUUc4MOwqQevkNL/RTHqt5O5En+swgUNDVdfJy5+TL1tVHHbo+FLPHWAgfzsBfKLg+AwKHb2wFaZ8j71jrzhJIxXiy3/dCcSfJ3rgo7woCAKROH86A9MgECrw6ujtFUmV2LRA+nYHrSb2jCJ1eJ4ED00HOza3oAPgJJgqFSmT2u+XbZ+XXfr1IdAQl7J6zINelwfEIQyn5saJLMVjfVAJJ2aYcf7AeuKjCH898QAwAvaqZ27kc5yFEDLBaTjyXu34wIKzY5NBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x1VTcoLIlQnPIWIeH4cQnCU8xlamHZDxOLmDEHwtrI=;
 b=PAl+BjCTB6CRcM7dxW4L1PyGdCo9/YBdVkSPXXDtf/7qvC7Hz3A/MssOXz+6nFjNCff8P5aOzoOkK7obDT9hC7xsPBps5dfR45j5RwlY0EiVMfrRb+B+OTiHlsTHHqaTx6/VVa2LYbSOyeTWxS/n0Scan3ptTvUUcLdgvc+ZeiN0M23VtvDhpH3ZlmLvgH2mntZw1y1wVkvgW1nr90H556uzsHF5RZ2QLL9TvfQXewjDTOQAbXbin/CCob/M0yWQ7ShRPqHgBigqAKs1ZrViQddL6OT288y2DFFsDIQrxFQcWyN3iYe7bxsJQKtliVMY4TSz27xSOBoiN2N9Oo69yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x1VTcoLIlQnPIWIeH4cQnCU8xlamHZDxOLmDEHwtrI=;
 b=Qf1kvb8WfVUK7sEKNU/EPVRH7UbO8Q3YB56dqqOSqD62SKQNJo8QReun1yHqdGkZ0sd7TJX7DWlEDDPT2ycVZjSxKR6GaSkTjDju8yzJuoL2nZ1vrbRQ6uphvSL71/GMoZb6UwyzFkuTt1Vi/I9Exqm5oOp0zgndWuj2N6wRqT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] XTF on arm64 support in CI
Date: Fri, 16 Dec 2022 14:30:10 +0100
Message-ID: <20221216133012.19927-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT097:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: eba77e9a-3b01-41f0-8633-08dadf69ae2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gBQqbxgA4LMaI8IAjYj4SeJcHLfo93V0TtxomdggtNinLnSj0iLvVTbWWX00IRxk/JQETgnZbtfvQFt7Y/iDeyG5b7O05uh4jl5xButv0e2h4RB1Z+MrmXGxSGr1dvNdrdNgWqHGU3Hv/tV/hJJwXsUMv9RkjPLKgtRJvjsg5U6Dcf9A5KDgB5VGbKUQ0mDCmUgvTe1DpkOR6u6pElK7PZqZPrboPsXBiez/znxaVt4LWyBLSFL00wLdvQ2Y1XEPBFoqXtMBnXo000bk8NJoNGQaSGN/tvNqFiISNpXqjE5iu69VVrVSH9leauLbw5q9XocxI6VcEepf6eYfkJGhRfdXKqd3N67BkbMlLJF/ZQLSG3OPDjoNoCd3Vr7C5pYXQ8ByyzMncdfl6OAJZpoMrE5gXzQMbMN6PQZiVXA4yuq8tp6Q1Blh00SnZddXGKVID1u1TM0ZM/MetB3cQES8SEdCwSW9DdggQh6rJgLC7YX0tFionbcXyaElHZk6ANDyY/IuQ9ld6W3f88/E7fww3d+rOSaPmAhspG0u5SZfxAPHQWG8tJ90WIjMgHTCxvUZ/Oa69xDRYgHAdMV4wiM3iVTWXOnzd0oYiMes0WYEiy/h0QT6MHF6l65kc97ucsV4PcSwmmb6d6/hhahXIMvBeS7BRZwHZDQVHCXOJekTZfiAsCUaSeEp1sGsFHc4RoDtI61AZ2ax+BFfzRgMhSa9wnc1aiTCTrDZifiylOhcZUY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(54906003)(356005)(86362001)(4744005)(44832011)(5660300002)(82740400003)(8936002)(81166007)(40460700003)(36860700001)(40480700001)(426003)(41300700001)(83380400001)(47076005)(478600001)(6916009)(70586007)(26005)(6666004)(82310400005)(4326008)(8676002)(186003)(70206006)(316002)(2616005)(1076003)(336012)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 13:30:21.1628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eba77e9a-3b01-41f0-8633-08dadf69ae2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054

This series adds support into our CI for using XTF to perform low-level
testing on arm64 (dom0less use case for now). For the purpose of the CI
testing, we are going to use XTF fork with implemented arm64 support.

This series populates the CI jobs to run hyp-xen-version XTF test to validate
some of the xen_version hypercall operations.

Changes in v2:
Let's take the opportunity to run XTF as a domU in pure dom0less configuration,
as this is something our testing do not cover at the moment.

Michal Orzel (2):
  automation: Add support for using XTF for arm64 testing
  automation: Add test jobs to run XTF hypercall xen_version test

 automation/gitlab-ci/test.yaml                | 16 +++++
 automation/scripts/qemu-xtf-dom0less-arm64.sh | 68 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh

-- 
2.25.1


