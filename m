Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B95E63E5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410160.653250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSJ-0006lX-DT; Thu, 22 Sep 2022 13:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410160.653250; Thu, 22 Sep 2022 13:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSJ-0006iL-9F; Thu, 22 Sep 2022 13:41:31 +0000
Received: by outflank-mailman (input) for mailman id 410160;
 Thu, 22 Sep 2022 13:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMSH-00041N-FM
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:29 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 402eff95-3a7c-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 15:41:25 +0200 (CEST)
Received: from DS7PR03CA0346.namprd03.prod.outlook.com (2603:10b6:8:55::9) by
 MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 13:41:20 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::15) by DS7PR03CA0346.outlook.office365.com
 (2603:10b6:8:55::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:20 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 06:41:19 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:18 -0500
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
X-Inumbo-ID: 402eff95-3a7c-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwdRX1cfYFqyB9Gc32o2mp4EKUOHxv7jLjxJGGVfnBsnvJibMaQtrctT9tGzVY8xlYyOURC73SDRDp23jeXer2kT1tdrLTBtXa12PSdQbHkHCjDy+JmB6fKuaF5yMEJ8n9BfuKW6TCaAf9oLCN9PvIj+kuL8MZ8uNf9VAo2OYo/nS2cyyqeCIgc84IevL19T76PBiQhV4BIFG/FvuGhxJ1EhLP69zFw+XuxbcAVkCyOYu1Vxw8gn0Nr5lILfqQPdJs3vN23XdGwtvyNW8SWo2WtL+n/PSGjp0nmJ66+OQKLcZow9EkeYXEYUnkYoEmEU8I1IvMXmdvDbG+qwHa8qfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lv2zvsIlsdyRqUjNOYL9flTtB4Uvfcd/mKIDBHTXVwY=;
 b=O8rt0iYU6TSja2TSRcW0xCKkSKv/C0nda/DICaakU7nVo54GyXt/QTV7vrQtUen2RP8MwdMR8xjt+OWypyx+KfkoaEmwBXYG6WI+bXSwD7iFjkqI8ChnKY8bgQzP++CKePvyimdKxpBHloiuT6+WGeklS9uJBLbKbKomYm7nFMH7/LHBA7AwOWQA/FXK2mrmQitPu9wnJ0/AMwxv5nanxRI6dccarC7iK9VGHK3gweZg07L0qTVWeOEaKYMUaJ8odhcfc2qzstyF+MauaQRDa6vNVQmWwp8iCuyu9kcsBB0zh72AbddOeNMQM8HBT6ikpknNj+ajRoHf+x4NbhrX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv2zvsIlsdyRqUjNOYL9flTtB4Uvfcd/mKIDBHTXVwY=;
 b=uq1XEbQy6DU3ANJNqLlIZHdEXGLsUx0gx1eG1+fGozE0QD5ZgZmU9/MJ3x6tfaY9TY9GWx1SgjG5kZqARAk3CPgxvcFsba0Eb5BFMTVPwHSFp2JNtuMEdjzq2wtrgfz8W385VC/RryZ6XwrZEwuXa+O7mgVPF7vDtHiMDfZ5esA=
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
Subject: [PATCH 8/9] automation: Rename qemu-alpine-arm64.sh to qemu-smoke-dom0-arm64.sh
Date: Thu, 22 Sep 2022 15:40:57 +0200
Message-ID: <20220922134058.1410-9-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922134058.1410-1-michal.orzel@amd.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT010:EE_|MN2PR12MB4079:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f703d4-d38f-47a9-e1f5-08da9ca021dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o4uLTELCsPvIF/8nsUQw61FDCkzyVO/GZl/PEoiOqVTQWvU15M4P4XGjshoDAuzxj1C7mlnryHUWJSnP8Qy2QzZWcRBgvO50P5Zc2xk2UZlSJE/kYt+5YF8eJrotI8E7rwio4r6FYXSbKmTMEaddDLnX4iNwinqpe+pNFx+IPIGm2vGKH2/9wLgg+RzYNo7r5dIONYhMt1tYSLN+1GOznc7iRHJrkzXD/Fzz88wEqr57iKaMhKfDSVEUY+2lqKE+/Hws2tt9Qs6WI32cjZZ/J6BqTwduDjXOaGnk6dvY+L30SqptZdNxJWLYBIpMufVwD64FivJZBE9wlxxwC2qwA8vf7qsSKOhvL5DCqpiKu/ALR/5CLDRP8oJfcAHSNvQ8ccDKGUDHSXxKmrmv4N5hyEBtDCWKg6KxzK/601UYgt6y3UME1WjPa1f6G6Rm7fP7zhUuCiEcp1Tsd7qm2v96GgyVGGnRtx0UuafNxf/k8xXPOxX+rLpEmbmikkYc7/BeNy/zGv2e9eQW5o0WaJE3tG2D2iu3q9QfjAjjq3qEv53l6NAlEPj2Y5qgXDkeXVpuhQ2dW6FiBiBVe9IM2jjekYIZa6sX0Ruw91fozLRaLgXIC3obfHvwFqfSqJTe5lZXbPqG3IpVk5iHsbwlf9c1BkANci9U0kIj2/4FEn3MToE34pv3byo3Ws19UVFShN4GG6yiJM/vujfii0pzOVcytdJBN65rBg8MRlPdptzm01d7K4MmpYvK44PJlNEPNRxvu65YW2qtl7qPhaUHE3pzjRfx1Tc/9217Ucirt3OzK9/ybvJALTsWzAg9JLMt2hHm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(478600001)(41300700001)(2616005)(1076003)(336012)(186003)(6666004)(40480700001)(40460700003)(36756003)(26005)(82310400005)(8676002)(83380400001)(70206006)(70586007)(4326008)(5660300002)(2906002)(44832011)(8936002)(316002)(54906003)(6916009)(81166007)(356005)(82740400003)(36860700001)(86362001)(426003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:20.2077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f703d4-d38f-47a9-e1f5-08da9ca021dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079

qemu-alpine-arm64.sh script is used to perform dom0 based testing.
Rename this script to qemu-smoke-dom0-arm64.sh to reflect its usage.
Also rename the corresponding test jobs.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
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


