Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70985EBEF0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412373.655730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bz-0008RA-Pk; Tue, 27 Sep 2022 09:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412373.655730; Tue, 27 Sep 2022 09:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bz-0008Ly-IR; Tue, 27 Sep 2022 09:47:55 +0000
Received: by outflank-mailman (input) for mailman id 412373;
 Tue, 27 Sep 2022 09:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7Bx-00061I-UE
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:54 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74035e37-3e49-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 11:47:53 +0200 (CEST)
Received: from BN8PR12CA0029.namprd12.prod.outlook.com (2603:10b6:408:60::42)
 by BY5PR12MB4952.namprd12.prod.outlook.com (2603:10b6:a03:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 09:47:49 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::aa) by BN8PR12CA0029.outlook.office365.com
 (2603:10b6:408:60::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:48 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:47 -0500
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
X-Inumbo-ID: 74035e37-3e49-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT6o+LJsS6dwgM6LG0gxJ0Ej5ZfilijKPH7Kp/q7Fe53uF4ZYc2xMt7IGt3cIVU8ejMsmhXqTYSSnD/0/Oh6ob1/1fDnFN2lidHp9spy9L9HVUgSMBQ5LHLABiBH7EucmByntXJfICww2Rg8eMH2L6ixlv4VMsFBHKSPbSTDRLpOcwgNqXDIdF3ypVgOksMx3OG+5C1zJa16ip8CrRIyT8CQQbSpsF0UfZU2kDGE9CM4UZsSRLULkiuR0k27R5o0EK/d6D0EwA5K8UQ65TLuZndROCnZWbwJBWY+5ZjQAcfiIu1TXdbKSULCOs6+j1GDAXTAUc4ZOeI45PmXjw3D/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qu1BpDynY88ojjM0e+raIHRg5HgHBs7rQp1cxTsj2bI=;
 b=heUhV9u5PHXPsrua/niLnEKwcVdFfYaFWxxS8ihlg2oJPYrtitREpJ2P2Q43OD9QNmxm1LfGXwVHUvS6PO548TxWIS78kAbdtiA362NjVTUIkvIjzfLaHhb9yCFjcLecEILGqOuOzXN9RG6RYc4zLeR4mBfgjIgz6Ivw7nk9pO9qqQC0qU0M3d2MFR0Kk3vGDOObJNt2vz9JKl41VXLhvlGeWEwJeDgiryfqowtVkkTsqTlhfkxYNxNqWpkmuU1MK8J56xWODZ+94Vf78hUynYcRKD1X46Nn28pq9dnFeuZMkM/1dAgVvtkvA3vCu2tkXFK63SuMZor0nl3pa5Homg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu1BpDynY88ojjM0e+raIHRg5HgHBs7rQp1cxTsj2bI=;
 b=D7rJK3eY8A4CetfUY4RjIdhRO9euges4BLMmA0JPW1p2W8TJjby4x4pZyG6JYSGu0agnUtjicI2UNbunRtSv0VTc3g2AIt1G4x1Osr1m6bXVrnH3RcLkOeTIm/Ix9fDZstOQMZpd6xXPfOB3t1pfQoRJPMc+cr6f962oVzv/Ocs=
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
Subject: [PATCH v3 09/10] automation: Rename qemu-alpine-arm64.sh to qemu-smoke-dom0-arm64.sh
Date: Tue, 27 Sep 2022 11:47:26 +0200
Message-ID: <20220927094727.12762-10-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT003:EE_|BY5PR12MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea4b70e-a898-411e-8bdb-08daa06d5683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EdKFDPKVqOhHQjIar8fsHgATpJdjii6cM+ogBCUHi8ds5hpQvc90h4BEnZ9HIDGbYjTi3JF+x29Ef6MHASXgUfCL1PTSco02vAzsteZ+UNCW2S5jtCuBeCVKrzcMwjKn81WLmLSrOVBRxjsnO/WK7NoIsom9blXccqsS6TEjQxUNdROwYdWyPMl1RYLC3Nl4VmOOpO569vb3HCIH/ID5N411KocvJT3wZCMj3VidLELxEnALQi7B5z9KjnhjX+Ld1XryXoMtVUM2iCqebvKDtwEBmzRsPpjJ4cz8CFIZLHAsvEwlLmrZ7/EAaj4YdXCoW/TAOBxiGFunVNEl91gzfedZNLWaxQGs7sPCJQKFaA8lORtXarlUg/qpfqE2Jc6vc1Q5V2RIWogRZrnPOp/z/d75YFJfeuNMePJdp1PbofSH8l+0o5RRFNK+kiZPOIuBCl/3h+TWBQPQcxubdOLyWqb5PxfVcuBayTtGUJyHco8Wsl8uQeIns0uXcwT+aG7RG9LSxUvFFm2Dcv4Hqygn7KJJwp1zn0JTqHvP6Ples0OnxEK1YTyIXqDlNT3DqnZrBSFPW7pecD2q/ByOC10BcWb9FymDHw83lhm2O5DRor+sslm3vhH84tM1hL5J96jbvJxXHK6NVgVbhW6o541Smxxw30h58xuNLeV25K86DH71Ylo0yR+lzQrIoowrDABm1pmrL2mnQ+RQpT307LW/N+ncyGaJPniei7zy47qUyFE8OPnFf2WpZSke6wa1wR6wi8e8lD/JUol3HejCcPHDWdxL1gtbzlMn325VGgKCCiZ0wfpN6sI9PQIVp3qe/wVA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(81166007)(356005)(82310400005)(70586007)(8676002)(70206006)(86362001)(82740400003)(8936002)(41300700001)(36756003)(40460700003)(478600001)(40480700001)(316002)(6916009)(54906003)(26005)(44832011)(83380400001)(5660300002)(36860700001)(186003)(1076003)(47076005)(336012)(426003)(2906002)(6666004)(2616005)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:48.9062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea4b70e-a898-411e-8bdb-08daa06d5683
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4952

qemu-alpine-arm64.sh script is used to perform dom0 based testing.
Rename this script to qemu-smoke-dom0-arm64.sh to reflect its usage.
Also rename the corresponding test jobs.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- none
Changes in v2:
- none
---
 automation/gitlab-ci/test.yaml                            | 8 ++++----
 .../{qemu-alpine-arm64.sh => qemu-smoke-dom0-arm64.sh}    | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename automation/scripts/{qemu-alpine-arm64.sh => qemu-smoke-dom0-arm64.sh} (100%)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index f620622671f8..3b147c88ab08 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -25,12 +25,12 @@ build-each-commit-gcc:
   tags:
     - x86_64
 
-qemu-alpine-arm64-gcc:
+qemu-smoke-dom0-arm64-gcc:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-arm64
     - alpine-3.12-arm64-rootfs-export
@@ -44,12 +44,12 @@ qemu-alpine-arm64-gcc:
   tags:
     - arm64
 
-qemu-alpine-arm64-gcc-debug:
+qemu-smoke-dom0-arm64-gcc-debug:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-debug-arm64
     - alpine-3.12-arm64-rootfs-export
diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
similarity index 100%
rename from automation/scripts/qemu-alpine-arm64.sh
rename to automation/scripts/qemu-smoke-dom0-arm64.sh
-- 
2.25.1


