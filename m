Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C46F054A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 14:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526970.819055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0Nu-0000Jq-QI; Thu, 27 Apr 2023 12:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526970.819055; Thu, 27 Apr 2023 12:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0Nu-0000GU-NE; Thu, 27 Apr 2023 12:06:02 +0000
Received: by outflank-mailman (input) for mailman id 526970;
 Thu, 27 Apr 2023 12:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3s=AS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ps0Nt-0000GO-1K
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 12:06:01 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df67b3c9-e4f3-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 14:05:59 +0200 (CEST)
Received: from BN0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:408:e8::13)
 by PH7PR12MB7454.namprd12.prod.outlook.com (2603:10b6:510:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Thu, 27 Apr
 2023 12:05:56 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::fe) by BN0PR04CA0038.outlook.office365.com
 (2603:10b6:408:e8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 12:05:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.23 via Frontend Transport; Thu, 27 Apr 2023 12:05:55 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 07:05:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 05:05:55 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 27 Apr 2023 07:05:54 -0500
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
X-Inumbo-ID: df67b3c9-e4f3-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLyQvTiFOx3zbzKzJWO9buaNmgMKh6SDfYR31QU3FKoZjY1YLNJiURqqs2ClTihGfAp/ikFalfk+btmh0BDP8OCX8wmswSckKRrkxvhzJhY7g2iQvCb1wJ+zmIVj42AR+Q75s2gtPRjo/o3rvc62T8U28Fp48reysJF48DECmwAoLyr4ten+cDpvuAIXZDCKcS0xypP0YgfA2UEcAiJ654ZwXHGawj+FTMD3JSsGQC8SKG2C0gx55cPXFf8NIvDjuhml8f51vyj5A5GUIVB2WIUxk1lMuw3spanW9FxyNFoQGm3ZjqZ+R4n2l2yS0QzSYjqulmbHcPnX832QNuKgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLRSRq4DYXabUfbBLLYypaisVz196Xrufh+Q8gdSKGM=;
 b=Q7hOCsZxCF6MzDa6WilSTC/dTthxUE/8WJ3X86izk7tglnyNZZrg0n7oelnGSpFUtSY8iyQvUhEwv8BdRzoDtzJBj/fSUVgNrEP/r+8aLAHRJY5vGgcOXnRhvsiy7uJk/xkQCXRETdOC7LWr/uoVVfJsEmWPD+qLjc62YaLR+eQGXiShoUkwpfADnIPFHjrfa50FQcNBgLJrJ77KscwCbxRo3elBWCE6CqZ4GiUSSnOTOLjFj53kwEKj1XoJbShE2YoRdzbGzUDruvppePwcSUkzSWkAboEVcOn9gWkaQy61JSbQJDQ4eXWctjJfdmLw0NWK6Xbm+7C+cBch+9YAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLRSRq4DYXabUfbBLLYypaisVz196Xrufh+Q8gdSKGM=;
 b=T4quccLzDqpSe+Ci3HkFWY2m0heE8wlPGwqcLGERG4fmbpXRM5dMakv9ZspLQXkU201Vyc38eugFNuikL0fjKYfafhPGxvnkI+o0/IYy7i5LJ5jLsSYMUC/nqJmVq+F1kKMDPwG9tfs4mbr2Q3oVT+Iqo4sC5vatFH1+x4eTUUQ=
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
Subject: [PATCH 0/2] automation: xilinx: GEM passthrough
Date: Thu, 27 Apr 2023 14:05:51 +0200
Message-ID: <20230427120553.18088-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT007:EE_|PH7PR12MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe32b8b-0266-4305-6128-08db4717c183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MTPx3aPdGORHLiS5YTx5VdXp4ql2SCmJfEfwWBi+REIJIp5i5V8siog7cHiWb9bfHl87hwCu20VIZNzBhqYZTnYaI+vigFVTVHNo0DH4Cga8HzdGAVplurtmxBVKE1vpzuoJRGG+sCW/hpKDqmdl9n1KEmzIQicIhW70xz4t366l5BF+EAlcozcmMvrVJlPAvMhEGV6p9K+jlo8z6/YfrvwsJbkdzoewOYrb8clMe12gnaraCZfFQqvPAYx0hPdav3sEN/vJS8XmoTM8T/nXRWCllPMqf78ZQr2eBHjmB6t1fQ9UKRIELGz+ZKynGwnwDWVmpru9b1jReiJT6r4BhaLzryr8o4mlAMEQBBlwT6g80Zmoi4qLaKFqRPNPn6IziF00O54AYYYJLbpfIhxaC7fyuXD7epBkAnW9NibDVZVWfPVj6eh6q4CEho8t5oAOqnzq5YdlaE9NP3MMWcJNzYhAypRUV55lbUzdBGvCG/dhqdkTA0oVO3kQYJBx+yyOpMwUYBhSNrIO5eC5JnH1EH0zpfGBPk36n22tQF16gSn8P7ENQstdkRR6rd/1Ju2RSywLCslyIQNeoYOswzxipGXdUUlQIMRadJD4EBoh7UMTZMH/qUB2DP8TuSPpQI3XCPGJJESC8Djmafvbt2j+exzDjTLQvAQ6gTmuhybJ/Smuqr0zZzbFxsw6ZJwYg5VeQODYHuTzp4JQcJEKM8W/7tFqh1ivNhbAdyuqw4fR1yU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(40470700004)(46966006)(36840700001)(478600001)(83380400001)(36860700001)(2616005)(1076003)(26005)(40480700001)(6666004)(70586007)(54906003)(70206006)(186003)(47076005)(336012)(426003)(81166007)(41300700001)(40460700003)(356005)(5660300002)(316002)(44832011)(82740400003)(4326008)(6916009)(86362001)(4744005)(2906002)(8676002)(8936002)(82310400005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:05:55.9021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe32b8b-0266-4305-6128-08db4717c183
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7454

Small series to add a GEM passthrough test on a Xilinx HW.

Michal Orzel (2):
  automation: xilinx: Set up bridging only for a default test case
  automation: xilinx: Add GEM passthrough test

 automation/gitlab-ci/test.yaml                |  8 ++++
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 40 +++++++++++++++----
 2 files changed, 41 insertions(+), 7 deletions(-)

-- 
2.25.1


