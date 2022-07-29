Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73185848DD
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 02:07:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377232.610339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHDWN-0007z5-6h; Fri, 29 Jul 2022 00:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377232.610339; Fri, 29 Jul 2022 00:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHDWN-0007wE-3Z; Fri, 29 Jul 2022 00:06:27 +0000
Received: by outflank-mailman (input) for mailman id 377232;
 Fri, 29 Jul 2022 00:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wnh9=YC=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oHDWK-0007w8-Rc
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 00:06:24 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4725769b-0ed2-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 02:06:22 +0200 (CEST)
Received: from BN9P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::21)
 by CH0PR12MB5217.namprd12.prod.outlook.com (2603:10b6:610:d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 00:06:19 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::9c) by BN9P221CA0027.outlook.office365.com
 (2603:10b6:408:10a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Fri, 29 Jul 2022 00:06:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Fri, 29 Jul 2022 00:06:18 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 19:06:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 17:06:07 -0700
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 28 Jul 2022 19:06:06 -0500
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
X-Inumbo-ID: 4725769b-0ed2-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWoYlRmHAgFGozXYu5km7RdPbB+pxTJJXp6/qc7YN6aPupwqgQdbzLjJqfVhqavSYPfzjFAEwcKovTXMpIw67PvUHNNmmooMtFs/90VOAfbyyH2rby/KucB+ZC5UCCqLK3hshITUb7rfjy3jXAW8CubXbnQzfIP8AwvbAZhai0RaP8yOw5u/PpH1IsbEJtxZWvCtZ9CcOgRfJJygVRhPduu1fHRwD7hRlJHvvs/swkd6vOt6JpJ5akzcHEbucRQpcL3RXcFgelkYQNDceohTUElxgZiOa6LKEJb/Ab3FmOJVUSaXhHMIY9iaiL2R1mdKRnxUC+cYfvDFH17Cb+vlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsbdAz4BaOsLgxRST17tVlkNQiwdcVM3FUhlcg5CDhk=;
 b=QBFwlPx+P7/TOKBpYxZMzY+HPLSZcDK0TPTprlTGKVal/LX3vJN/P1iI1s40eNpExj1dRVLsLirDGXHYjuub0t/t7OjRnPr6JaPoP2RuPRRPVUi5A515S2Lg/Q6//j4SMskU5fYXQrAKkHVc8lKT6ShoEUAjUxZQ7dfKKo9yeb5s/bxQy/EGO5cxy9FGjZW8hi3+Yt+KmtNcNHlq8ARl/JgyM8eQFBi/qJ9lkaZN83/fsUOrnf86G4Y8GKA6peFPT1DvmYkcLwgK5oobxVESRdxxUjBfgQsOS8PqRJSl2IOkEnPF5BZARyMc457K/jNcmpbmhsCLhq0YrKVYjg538A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsbdAz4BaOsLgxRST17tVlkNQiwdcVM3FUhlcg5CDhk=;
 b=NyVm2dAgT7UBCJDhZ6rQQavQtYabGzABQuscavyPTAMzubnXebOZUuT/eoaJR4EK5Ny49txBW7NOxixGxVSSPO3XPpdjA2a9mvU1tM3w5TgmMd0pVcFffuz2iX2CQgsSSJLpfpb7/SGb09Ds7sG+a5ACNb8cnS7NeUiOqA4vwu0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, <burzalodowa@gmail.com>, <penny.zheng@arm.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] automation: disable xen,enhanced in qemu-smoke-arm64
Date: Thu, 28 Jul 2022 17:05:57 -0700
Message-ID: <20220729000557.2090845-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd2b9541-3c7e-4f96-65ff-08da70f629a0
X-MS-TrafficTypeDiagnostic: CH0PR12MB5217:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M1OaoKnAvDj7cQvxZGtox5z+ss4Vw/029ntEnVRuu2Fcf2wP44/MtqROre1O2/YtqQccj6f4n1/YyenDWHxmLuUX3oNjCbKCpujzXR7HyIsRHEuzgRaR/44XT3dEuRL35C5H8bUcaUzH3TZqq9tCeynU/jZygtSwkSJ4XcDPiPTHgxpZ9QVDVIsKeXUlW40nCmlqX18h3/aFT798rIJ7XzVvqReVdTQSC5Ckbp8qqGfogn+TEkjfeAAFDnygf4cVxf6O/zponf24sKg7lz/SsT1DA15RJGGVo7a2E4XW9c+war/jIpsY4E+ZUYu01uGYwMf8Bxqxv9GQfGY5GUrmyHk7lc7+J7aqNIwGKdJhkt+zJLKT5KvikiaXIs/7Oi63PhACjjYRDSa0V2x9HC4M/NalyQvtLnWrah2Dr739kMiAHa6c32JiqOMuasVDQCMR/wNPDG7nqkIsXemQcn7f8Iahs1ko7WZLtwa/y1gpGJO4t3Riyu+FreS8OVSKmuBfWTbYplWYo8AEoEeADmDEsLBUUFZL7syw64/rKuvKoKT2ZeHv09g1WUCJtF2DYE+l7MFkgA2pYps7eNGjraLomoS9w6bTfd4ZMuOLn9XCAEcU7kVidQ2gWQuRjb/EW2x9n6gKtdFubm/t+XzZ+x9d+VXQnfJDYgOuG3eRFLiYazZ7vUUb8dfE76NgS5HfHaLVU7ks1V4nmNpotE2Ppnea2n2URipaxvi60yRNqOd6Qa/ysnOr+nta7rnjx9RvMkoiomGwn4cXBvWvIQkzOPONOmJIo/ELOxlfvklpEupFeT1McQNlrdHMJg8gEe0OosC0DcKYv1HG5bGWANZP1LrteQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(36840700001)(40470700004)(46966006)(40460700003)(41300700001)(54906003)(478600001)(6666004)(6916009)(36860700001)(26005)(356005)(82740400003)(186003)(47076005)(336012)(2616005)(426003)(81166007)(44832011)(1076003)(4744005)(8936002)(5660300002)(316002)(2906002)(86362001)(82310400005)(70206006)(36756003)(40480700001)(4326008)(70586007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 00:06:18.8208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2b9541-3c7e-4f96-65ff-08da70f629a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5217

Disable xen,enhanced because we don't use PV drivers in this test and
also because the kernel used for testing is old and unpatched and would
break if xen,enhanced is passed.

This patch unbreaks gitlab-ci.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/scripts/qemu-smoke-arm64.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 898398196a..e6f1510c0f 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -84,6 +84,7 @@ NUM_DOMUS=1
 DOMU_KERNEL[0]="Image"
 DOMU_RAMDISK[0]="initrd"
 DOMU_MEM[0]="256"
+DOMU_ENHANCED[0]=0
 
 LOAD_CMD="tftpb"
 UBOOT_SOURCE="boot.source"
-- 
2.25.1


