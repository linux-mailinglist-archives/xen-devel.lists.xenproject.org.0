Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A25B59C2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 13:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405735.648165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXi6K-0002xG-4g; Mon, 12 Sep 2022 11:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405735.648165; Mon, 12 Sep 2022 11:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXi6K-0002tv-1G; Mon, 12 Sep 2022 11:59:44 +0000
Received: by outflank-mailman (input) for mailman id 405735;
 Mon, 12 Sep 2022 11:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y9l=ZP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oXi6I-0002ar-Gc
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 11:59:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bb4e861-3292-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 13:59:31 +0200 (CEST)
Received: from DM5PR06CA0089.namprd06.prod.outlook.com (2603:10b6:3:4::27) by
 BY5PR12MB4855.namprd12.prod.outlook.com (2603:10b6:a03:1dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Mon, 12 Sep
 2022 11:59:37 +0000
Received: from DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::39) by DM5PR06CA0089.outlook.office365.com
 (2603:10b6:3:4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Mon, 12 Sep 2022 11:59:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT081.mail.protection.outlook.com (10.13.172.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Mon, 12 Sep 2022 11:59:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 06:59:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 04:59:36 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 12 Sep 2022 06:59:35 -0500
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
X-Inumbo-ID: 5bb4e861-3292-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4V5KrNzU1EkpuV5w91+bSgm1hytTwF/Ib8Hzi+Z7StE1aMJF4AdCsVL0hJNNZcbs1cIx8U/5X5FeeYjH5g0fhc7ZF6dmUsdxmcymfr2lmcrgaRLHR4ZmjKWeAkDIYWLP45uUhpUQKiKQl+2como7Xch+DoG7b9pZ7isFlAV6mp2p5ImwYczRNId6HP2ns9/3gtFJKpsmbe4Sf/uOq331UpUxqeOpA8DA/+u2igsdtC97sJUJATn/ehGa75qI2Zsjb/Nq/kSZ+avdH7GJRFlXhIKMEaucCdFWetTalUUEqihoxI5N8/U4Swn8YJH7zV1v/JLHYj8S2kVg/CUflPrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TOAwYTze3mjvpIMtporCy8pJQTnjRW/arh7mPjxADM=;
 b=VMfkaVtdX2LlV33FD/QUg5HjIa2fwM0EX9Cr9gY4ab8mUBfkDxr9WnWLG5PPXjcf8n3DZnzIhAHyStCKz61pGGoDEBhcYPZ1w8Yw345TA0ifUzSDBnSVsnYSc9qbcrqoAxgba8/u33B7oP3HtYoSKTkLt27gx30g0pt/vyjps4NSglC2F8uQPbK2RJkRmMDbCD8oKLDbCW/jBH2p0oJPVc0b0dYukvqyBmUhuIjzoJxg+v5f6OkLha6f6CJmgIb+hWUFoZW8ccDzbnWy7p0x4QcOky/1LT4QipRyVe4itFhdzvZRkSDmZwoyA0c6fkSg8WBtvOef0s60SsJrRevktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TOAwYTze3mjvpIMtporCy8pJQTnjRW/arh7mPjxADM=;
 b=aQrxpUJxJW+R0GhR4Z1tD/Wd7/JAKSz/AJnxSu2DUPqoFHbavpXNjstpcaDZJykJeh0aTIk8fDPPWYwOO+K/ALZXAFamxJbHzkesrLSw4c8qMPB1rzaIQxkgkSc+CvKccJ4nnFX8orKJ/HhSG5KsWUmCegExy7Yq0qNtRsDBTLY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder 0/2] Use lopper to generate partial dts
Date: Mon, 12 Sep 2022 13:59:32 +0200
Message-ID: <20220912115934.19552-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT081:EE_|BY5PR12MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: b2392cac-3c7c-4f4b-c38e-08da94b6440e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OKzx2IDP9QwGFAPvASKdTSXULuct5SN9JixE0aBl+NnoWbbMJwliJs2pW7AF+3W0AWIuaHqa35Q4nfnyy1QdjJX0OayUo2tmFzOfiGNMd9VBq4MbmGWoQvAasJpkmCm153W5k/y9EXbh1olulJiO+I9i1NCth1Ntwqt814OQSasriRvsWuoKA8826a/JN/0l1NlPKVzdic9qrCt+s2RCOg7DsXkC3BwFlcsxZ0zjCLpsbGQMubH+uPtJEpALVBCATnNp9Mn5xrqbbpsYat3iuS/ZiFxdzFYCmqJDjxdsBbY7oPnYm8LbukvgEIiciYLzeQGjjKShHCRUj+qugQp45Lhwa3sLjtErsMu9PzuN5FmAJiD1LPAqzRQ3Dfi1Go6JzOR7tbX5a2NuV4s081epDl9km0UCSL0itAsWxKPdNRzgmpogU6oDE0xuTe1ExOwUTjKQvmerFaRCBS5QnbfNxTsUGq+IrlSnjmrnr2zwWLryQTBQ1rrfVIh3cfCvz87VlweLW2uDztMqybFqcrqMtYFF989BP+EgG++/nYTkU4eNuc+QxS0c8s2S5407fyWrqZHyl24MjLaIlkzF0qh+J0heRTZ42d1gOczx8HxJBpAksWwVP5GCZEFO3AjH3BB+PhEvLoc10E3hVr9zcEYd3IWZKjkPFCbixTsVEaPBjsiDDRTTH0DE7/R7ofeTpBWi3nq8bfjBKWEleEynDG64JbMBq6fqXVFOKAvwD6SdLzkpiWC4UmGckTpc79iRPcdKi0np4JGG5M3VPIVu+xVpVBvYkBJvj7tqGt9LtNZ+B05nL+5OJtDGDoPscoApcePLnboFQk9ycWk/pPVie7GXrg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(40470700004)(46966006)(36840700001)(40480700001)(8936002)(186003)(5660300002)(82310400005)(316002)(44832011)(2906002)(4744005)(41300700001)(2616005)(1076003)(6666004)(26005)(478600001)(336012)(47076005)(966005)(83380400001)(6916009)(426003)(54906003)(40460700003)(81166007)(356005)(70206006)(70586007)(86362001)(8676002)(4326008)(36756003)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:59:37.2029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2392cac-3c7c-4f4b-c38e-08da94b6440e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4855

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

 README.md                | 22 ++++++++++--
 scripts/common           | 73 +++++++++++++++++++++++++++++-----------
 scripts/uboot-script-gen | 17 ++++++++--
 3 files changed, 88 insertions(+), 24 deletions(-)

-- 
2.25.1


