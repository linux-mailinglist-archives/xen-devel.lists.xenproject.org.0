Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F05B187D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402993.644943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkA-00065H-Vy; Thu, 08 Sep 2022 09:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402993.644943; Thu, 08 Sep 2022 09:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkA-000634-SA; Thu, 08 Sep 2022 09:22:42 +0000
Received: by outflank-mailman (input) for mailman id 402993;
 Thu, 08 Sep 2022 09:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VI1a=ZL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oWDk9-00062s-GL
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:22:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c85641d1-2f57-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 11:22:40 +0200 (CEST)
Received: from MW4PR03CA0359.namprd03.prod.outlook.com (2603:10b6:303:dc::34)
 by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 09:22:35 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::18) by MW4PR03CA0359.outlook.office365.com
 (2603:10b6:303:dc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Thu, 8 Sep 2022 09:22:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 09:22:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 04:22:33 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 8 Sep 2022 04:22:32 -0500
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
X-Inumbo-ID: c85641d1-2f57-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TStrnrH/6K159MtoqzHrAFPgpk3OdA5BOebRW8diHyQXrpaY6jOFPC2MJDrTbryp/ixVl5DTZBuXFwwpLn9T1Vvo2Ir2akC9UCyJd7YfZYAr1p+2ASwVMfGq7NqN703Kt3DFMVmsc1O1MsfCJzrnrxfe6iV7WJo+AtwuC7TvoaSzlc3rRK1jBkskC96lCXG2cKUNz8QaANlKujmSitJtXvZlVoUPKauaKmvVZ597Lh6dvM2RK2rxL/wa7i2cl4Bmwf+O8rXpN2jkYO8ZWSVv860E7t4Sk05qU/WrtZmaWXg/Mqyep2zWaEbj6AmbGvlxpl29/0FCOPS5oh19vVqUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGowwKByJkESWe8YZ9ffA5s4KxBegBee6qfPCvv+E9A=;
 b=Lpk6BjNS/AVSej1MXxO12LFjBAA45X209i3sLjnEPDN3HSjRBIc2rdW4wezDiBkNiPbvsMYb+CfodquxuSRhB4mTiUD8eo5ZEK246jvCrrOgNLYb5xtmE4qP3yFOc1dA6Riv6bMTief63n9u5wnLO+JO3NmGRNnzoiRft8u84Fg3BqDIVw+V1YxSWj2M7v+MbxNRLVD9AjZoRnCW2Z8DowAX3kme+L1pH88x8Ezwxz+uG4Pv/kYTAN68h1RiU3GzIRz/L19n6CTsP55f6gSST6GmXCWQDHklDdqmjhtmPcSjxgRc7e5EtoztbwNpRhqDz5TNRiOZj3Iu+cU03hzaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGowwKByJkESWe8YZ9ffA5s4KxBegBee6qfPCvv+E9A=;
 b=DKuSAc34xG/xs/gVNJKqt3alVesE45ss+dkbqw6iUJplWyCzhcAjAhggoAaOVy6rmITofcQRkab7bkxuLtNxiFTvHYkmGsdx9R8IYripiRr0LOeGQRncKBRpoWXQgcJrII8TRgUrUfNkYIrOpB9Ro36pPbDsid4mxfslCjzKIvg=
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
Subject: [for-4.17 v2 0/3] GitLab CI cleanup and boot time cpupools test
Date: Thu, 8 Sep 2022 11:22:27 +0200
Message-ID: <20220908092230.21421-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT028:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b116774-f8a7-42c7-967a-08da917baa25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CoGr8mqAxUQOWJzM8xOHDgNolweEE6FTO+WUTBcy8RRQo/Tbn6gLVK6VoVa9fHhX/BykKE1MMTw0L7FQrq+NYAfuFmLHHfE9Ekv6IIsRnqAAkiyI3GrtK2rf9xTR0PpFSeT1xnCJnx0m/Ar4QK0i0bTCyxf0ItAv5tT1VF46moP8qqsTG4f1I+qjss89AioXAWBO86iPaTqX/BgBeTo796YJYBzXR5Vzd0uAMIrrf9O7E1Zi2SA+nENM9tzRC8mWBbjAyyiQ1EF4kdoKp257T7jNtsCXFFrXXbiujKpzF1CsbDlHAd16azt3872Mmq+k3QFZgdMDpiAdFt9osJe3iu7rrHaTaeZ8JDFD0fbd1O0pNDESgT9RT5+QYHwBpvu6JI7FUHnvQcZUs4EHj9nZW5+iBgUxSVnUdvuCs+cDN7X8jnOcoped8wzdYZTzmS3CC2sb5jdEXF78fBbf5nQOr+15ZaHHY7ymMVUSDt/F1h1WLIVX+bMYXvH9rb5+zbh6OIU/T4w5Fvn1sZGfo6uLRsWvtEZFg+NMOiUzmP+s3+4WYmetn6EcjFhYqxRJEcEOJ0dbG6WbWBJT2mc4NjW9DscNWm/+vRel6HUrooMzly+z1qcGxt1HWV/inWkH1H9ItnFxVf3f8je4CFwnGdBQEcz/KLyHAFqoqvBIznyWKBdz6S04KoOAiWIz4PPGlBlXM+I72P/r1feJBcRY1AU7FXdsXkWJsboLl0bTjmU0fNLCeOK+ZKOgY7w0aQe9WSNxssYFsVxJ0Fr09/urGiI42Xs9EqBCH4oQ2g7bRHQqiZ3HQ4333rA/ShMwiw7TJudv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(40470700004)(46966006)(478600001)(336012)(426003)(47076005)(186003)(83380400001)(4326008)(6666004)(1076003)(8676002)(2616005)(36756003)(41300700001)(26005)(86362001)(2906002)(82310400005)(70206006)(6916009)(316002)(40460700003)(36860700001)(54906003)(4744005)(5660300002)(44832011)(70586007)(8936002)(356005)(82740400003)(40480700001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:22:34.6066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b116774-f8a7-42c7-967a-08da917baa25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154

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
 automation/gitlab-ci/test.yaml                | 21 +++++++++-
 automation/scripts/build                      |  3 +-
 automation/scripts/qemu-smoke-arm64.sh        | 38 ++++++++++++++-----
 .../kernel/5.9.9-arm64v8.dockerfile           | 34 -----------------
 5 files changed, 50 insertions(+), 57 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile

-- 
2.25.1


