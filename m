Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0D5EA258
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411643.654658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclw9-0004ZZ-HT; Mon, 26 Sep 2022 11:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411643.654658; Mon, 26 Sep 2022 11:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclw9-0004XY-EO; Mon, 26 Sep 2022 11:06:09 +0000
Received: by outflank-mailman (input) for mailman id 411643;
 Mon, 26 Sep 2022 11:06:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oclw8-0004X6-I7
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:06:08 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35b3f7a9-3d8b-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 13:06:05 +0200 (CEST)
Received: from BN9PR03CA0058.namprd03.prod.outlook.com (2603:10b6:408:fb::33)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 11:06:01 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::a4) by BN9PR03CA0058.outlook.office365.com
 (2603:10b6:408:fb::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Mon, 26 Sep 2022 11:06:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:06:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:05:28 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:05:27 -0500
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
X-Inumbo-ID: 35b3f7a9-3d8b-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpR3qIUqEnvab4Q4jS7aFNbjd09dWNfzw98TA7r+jYqNRJizKU4mMldvUaFDbuHn2F0/wNTe9D4I/TN4wxkL7dLUn/AetHJpbuJaiElqEY3Q1AEUlcn3VGaJuHDqBEG8IwPOLKV6WcfvOfnLpJfW2XRgl7AGTTHwAPBtAvI/2gGfOPI8wxn36hMHvw8yHODLJjiXw86LB8ZlXkkVHdnckT+S7hBoe8pJgUQiiillKXGQeVV5gUtVwyejT8tTtRVtOVZzzVsvmQKhKN6YUc13U0tDAnD++FLXAH+BMF7yXNkVMJ/hVN8TjvrkeflC5Hc0zv7i75CjUwdNgkPzkYyMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nm2GB71Av9Lfb7OcaO5zjKxQmHNj/cnStyksFxhKYP0=;
 b=iiV3yTKhtSmaswn0zZV72XJDNqk6cmZW0+Ta0ChDTUUUZ1F1srvR8c4EeURu9/5mkvDA2oeEKn1USSmzyQbF/3oll6DABdmko+4MY8dsisB5fpnMabiYeboXRmBkgLecfisHE/0ml6KUTivPeXEhyAoFV6Bl3hiuKqnxGf9Zhn2q9h/DFxk2yisdYEItBo6Kxt2vj4D49MseEjM1iLlEfKU/pniFeRKWdShSt4vZoOa5VgFeAQ7RvwKCurso8gAEWEXLZVut8k9WlcKBtEQQwW4w6vpa7gwpuxmSnuia8DHtTFZF6upUZlcWY2aMLjOTueXqXDh6xW/m+Ro1ftx7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm2GB71Av9Lfb7OcaO5zjKxQmHNj/cnStyksFxhKYP0=;
 b=41CP7794EaWlR2JNzbM8OdXiepWtiJNP17xdNpKNpL5GETShCVQIGIjBJ02XRhFnYiGDKabAEz2F5woEBApEqvwaWxL9rwHjXOX4pRGVuPQ34VtGSG/WMlE1DR2cV70L8KqNd1uT/6tHRtTE1tYk0NMLcuR/VF3qGxvEVWn6IXo=
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
Subject: [PATCH v2 10/10] automation: Rename qemu-smoke-arm32.sh to qemu-smoke-dom0-arm32.sh
Date: Mon, 26 Sep 2022 13:04:23 +0200
Message-ID: <20220926110423.26030-11-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT028:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 70640995-7621-4cdc-e943-08da9faf18b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0nGaKP+YZ7UB2c56B1ITZGDtifEmYrxvF16UI1OGDrIHBsybAwSURRxrP9v5UBHfX7/GRWAckpPGuHo2lNH9PLk+9nnGa2hJX+ivlW+OUX0lYkI+3A2mVrsKztV3fOVZ4QRhOrZWaZ4nPavyJWv6Js4mWpuyq2hJT9zKgIYV/i2KPioJgQsOiHkP3mDaJEPiqSZjjpKkyrWyAzqWJXYO0Cip/S4pMykF/6/VImSlwIW8Yjm65k9RCpJMNmnNDpemFZiVwPc+0xy3Ef+EJ0+dg1Y7wsACGfHE6lC8YmimWArHboyPXHxfoBZX26r6VtujmnV/2Nm2/ykbRX5jFj5rp08+bGY63uFpKEmseUb3iBX76w6Dhqr6UplhPvt/U1CumNj5Hj6IZQ3A+t+s78ZLzrdBQm5wFcquGKt0gDaH53OYREZhlQexUGfKfoILLC+j6P5qhZw+BhPFvU96XMuhj/gqJ0SVdUr8zSKiiNYLL1Jx3GJ74AKv/bU5wb+5/XYHrDXfxB5W1QUqVq2zeP78kPwlkJ67P8O6A69nXB54FUPFLYDFrFCnqLvCx+9OevnUn/IN5FHG9/LEsJyg2DHfb+gSO/rgzQcpVjPKXmbXUoaSyRdL2wJTRpUuwTSdAxV4P0pTn+gmU+nyHHcqpuDu/0FqKcRgCk2rRDMAysTVmKmhDlSzdwqEFQJHTVlpz9KLLrfi9AW4NrRKH15M4rHlYk/yQ3bd0V+nPVU/6sl7eSexbSWLE43XPMlnD+S7/z1TI4OomgvYPGTlBaNowLmfY6GjgBNNK2tf/ORa8trqEpjYBPEFWmscz4lOwB6qTPIQ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(2616005)(26005)(44832011)(41300700001)(6666004)(36756003)(2906002)(316002)(82740400003)(8676002)(70586007)(40480700001)(336012)(8936002)(70206006)(47076005)(4326008)(82310400005)(426003)(83380400001)(5660300002)(81166007)(478600001)(54906003)(1076003)(186003)(86362001)(6916009)(356005)(40460700003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:06:00.8389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70640995-7621-4cdc-e943-08da9faf18b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308

After qemu arm64 test scripts had been renamed to reflect their
usage, do the same for the qemu arm32 test script. Currently it only
boots dom0, so we can assume that this script will be used to perform
dom0 based testing. In the future we will be able to create corresponding
script qemu-smoke-dom0less-arm32.sh to perform dom0less based testing.
This is the last step to get rid of ambiguity with regards to naming
of Arm test scripts.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- none
---
 automation/gitlab-ci/test.yaml                            | 8 ++++----
 .../{qemu-smoke-arm32.sh => qemu-smoke-dom0-arm32.sh}     | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename automation/scripts/{qemu-smoke-arm32.sh => qemu-smoke-dom0-arm32.sh} (100%)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 3b147c88ab08..92e0a1f7c510 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -195,12 +195,12 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
   tags:
     - arm64
 
-qemu-smoke-arm32-gcc:
+qemu-smoke-dom0-arm32-gcc:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
   needs:
     - debian-unstable-gcc-arm32
     - qemu-system-aarch64-6.0.0-arm32-export
@@ -212,12 +212,12 @@ qemu-smoke-arm32-gcc:
   tags:
     - arm64
 
-qemu-smoke-arm32-gcc-debug:
+qemu-smoke-dom0-arm32-gcc-debug:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
   needs:
     - debian-unstable-gcc-arm32-debug
     - qemu-system-aarch64-6.0.0-arm32-export
diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
similarity index 100%
rename from automation/scripts/qemu-smoke-arm32.sh
rename to automation/scripts/qemu-smoke-dom0-arm32.sh
-- 
2.25.1


