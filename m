Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7628564EC1A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 14:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464704.723200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6AnG-0008DU-GV; Fri, 16 Dec 2022 13:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464704.723200; Fri, 16 Dec 2022 13:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6AnG-0008BU-D1; Fri, 16 Dec 2022 13:30:30 +0000
Received: by outflank-mailman (input) for mailman id 464704;
 Fri, 16 Dec 2022 13:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PP9E=4O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p6AnE-0007go-SL
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 13:30:28 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccbc070f-7d45-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 14:30:27 +0100 (CET)
Received: from MW4PR03CA0112.namprd03.prod.outlook.com (2603:10b6:303:b7::27)
 by SN7PR12MB6981.namprd12.prod.outlook.com (2603:10b6:806:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 13:30:23 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::b9) by MW4PR03CA0112.outlook.office365.com
 (2603:10b6:303:b7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Fri, 16 Dec 2022 13:30:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 13:30:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 07:30:22 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 05:30:22 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 16 Dec 2022 07:30:21 -0600
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
X-Inumbo-ID: ccbc070f-7d45-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GV62qyMfODAq9/LJMTIpzkqC8e03fCV8NeRb2foCfDu26WaSkr5Dt7HC8aQ/ocPIf6lp6kgp7Deb3xHs8RlbhVNFO5pVD3e0a7ixaXY20lSPQy2jgVeu2z4DxKTLq3GGTjJRdn+AHVI2pHYt2xU6SZvDNze/8J5GD3GU8WME0/bhFxI3bqN1n2cTbXrMUBp/cqJzQ2UY10AuoLY+i1Zz55XaxtqKvBohwjZw1iTCeXy7dO58/r46glzJgsRsuDk1hu1y/Ao+Ri/SJ3iqrHQI/JWWlsyolAInXWGyMm1WRVjHJ8rfAcu4tL5CcZ5Wnu0Ov5fNnJ5v2LHfhZdaxBhevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZBILgdEpcJ1YNOCDG5xLjBoP09KEkHNCmsLWra8eHA=;
 b=eBH+ZZi3ugRWW6aGYZPIqs7Dv1nZUwfIAxzvZoXs5fPa7S4TgLuTKWkODcfuM3rh0yHBAPuq1pcgpLaE5BTLYk1oiTrbl1zl+JkR+1xak8srsmQm4MdtcnLwkkz1pSi6lRfITBde07bQgkueA8VlZPIkR0Pcf4+c784FvGRBwMkUuyyS4IpXEYXxwbOX8EnIsLf1WooRMfrP5n+vWzjEZogl3LLgvt6J27SEHcjhICohzg8yOzKD5Hqp4W+9T9m4BS4XxS+FDpoyTPSctDY5vbfmMRAzKaDQj96PCMMbqT4FoRJ6UcjIbjCWCSL/eQl0hu+3W6O3ztWSO5yQpN6RaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZBILgdEpcJ1YNOCDG5xLjBoP09KEkHNCmsLWra8eHA=;
 b=LvKqcVl9GXHc0kg3M89eC3kAm90ducTxUNNrCHggzMAPC1quE2AlM3COKdRmctGnjGivAvSDXsDXI8i+nrFv8/MuCKRG1FBFGNhkK6pxrXGX6Aj6ZOsIMLQFXGXc8Vbkz7JYgv8Njbj+RZV1aPLYIsIdiS0yTigPHFJRU9X0e9o=
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
Subject: [PATCH v2 2/2] automation: Add test jobs to run XTF hypercall xen_version test
Date: Fri, 16 Dec 2022 14:30:12 +0100
Message-ID: <20221216133012.19927-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216133012.19927-1-michal.orzel@amd.com>
References: <20221216133012.19927-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT097:EE_|SN7PR12MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5ad4aa-dfdd-4a2c-4d18-08dadf69af3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JkmML2Urn5nXdEgZ3XwmreyX9rz9YE0t7OnlQyh4lzdFl8+0rtlefdvURHt6YZUqgOThtP8GxXig3WBKOUm0Pirl5ye53EG5hGQBLF1DZ5l9jrwkOUiDU4xL1G1aQ9W83BCsjg+pZikH/zwvNok74LErjzTby0c/tFMUQ32IsZCq7uNgoPfEAP9wEj0eNlvGNT+XslAbHE02cRCsqj+WK0mjaY3Zun8ZhwjVZlNtctIU3GflwU46KG41gVPkAKNY5l61L4kcS68gUsLi1hKwFrkyegyrLtmd9CASAVttIVm+nECHwX99tulR1duUALwfmZRzx6ZOOASPWxjWAQgXlS3iKGHkCrh6ivQyhLtnaprFcPIGPez1FLo4nNLnCKbNp+MyErDGSsVst9oDQa8riRY238z4OnHxR+oElT/GOV4Ef87m7BmnEtMpDacqSCPymLG0WuHaPwQaCgeZbfoTkc+TrznkPmT/07qgd+7b9yvBc/JlXVjS4n8PvV1XGkmVKnAq3t34Mzlmo8ctq2sF8k6TJYBGJp+d+D9e7Dn/tZJdMGLlG/eUbjOSx4Fw0yC/0gVDnEpzRFHyxmJUMLmihrZlUWkP0WasTo69448PsvLtnLjSPBR/fywBbNDyzhQoD3TQ70fdtvDDo9giIzcP491h74jcVANw8BnRdn6iaw1Lfre/ACxh7Jl2wKaJYiX3SZl6bqwYR6TLParRO27z1LxXIyazyBf6vqtYtjk27+E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(54906003)(6916009)(316002)(2906002)(47076005)(426003)(83380400001)(40460700003)(478600001)(86362001)(40480700001)(6666004)(2616005)(1076003)(336012)(26005)(186003)(82740400003)(41300700001)(8936002)(36860700001)(82310400005)(81166007)(44832011)(70586007)(70206006)(356005)(8676002)(5660300002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 13:30:22.9440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5ad4aa-dfdd-4a2c-4d18-08dadf69af3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6981

Add test jobs in both debug and non-debug versions to run hyp-xen-version
XTF test as a dom0less domU on arm64. The purpose of this test is to
validate the functional behavior of xen_version hypercall.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - as we are going to run XTF in pure dom0less configuration, specify only
   the need for Xen and Qemu
---
 automation/gitlab-ci/test.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2d57f4feb74a..afd80adfe17c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -165,6 +165,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
     - *arm64-test-needs
     - alpine-3.12-gcc-debug-arm64-boot-cpupools
 
+qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
+  needs:
+    - alpine-3.12-gcc-arm64
+    - qemu-system-aarch64-6.0.0-arm64-export
+
+qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
+  needs:
+    - alpine-3.12-gcc-debug-arm64
+    - qemu-system-aarch64-6.0.0-arm64-export
+
 qemu-smoke-dom0-arm32-gcc:
   extends: .qemu-arm32
   script:
-- 
2.25.1


