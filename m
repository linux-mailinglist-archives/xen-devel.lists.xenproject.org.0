Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ADA5EBEF4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412374.655739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7C1-0000LZ-Bj; Tue, 27 Sep 2022 09:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412374.655739; Tue, 27 Sep 2022 09:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7C1-0000Dd-36; Tue, 27 Sep 2022 09:47:57 +0000
Received: by outflank-mailman (input) for mailman id 412374;
 Tue, 27 Sep 2022 09:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7By-00061I-U7
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 745c243d-3e49-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 11:47:53 +0200 (CEST)
Received: from BN9PR03CA0473.namprd03.prod.outlook.com (2603:10b6:408:139::28)
 by SJ1PR12MB6362.namprd12.prod.outlook.com (2603:10b6:a03:454::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:47:48 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::6b) by BN9PR03CA0473.outlook.office365.com
 (2603:10b6:408:139::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:47 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:46 -0500
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
X-Inumbo-ID: 745c243d-3e49-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nR6JZypfQIHZO9kIEbO+ju/uktDkfpMsh+wn2w7feCJu9eRWp9m5rS3t0nD6M7NeJUeso0hLYBKatswZicKpyKfRFr50WBmyJtuJqJppwuIeDyx1TUD1yRb2nS/6j/8DIEiUo3ua1Z1moV9DCp1Ll97JGmdfi0CltOKM2iuG7YQPqYY914wzCVS2cFj53JG48knRu8bfbjvWGhAwVBkvKag+fGPyLFf/Bxg9LmECE+MqFgbk17eYqtyX89W2+al4MmOQsV6oWrPP//Kx/caUtFmF0R7t8CteCZ4dK4q/JoLvzrxanDgPJ8FfsAh400fgbTPAzx+T3CvpIPOpB29JZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2EPOBm4fZ6viSD0xpr1lnHb5byGce7/kHznjulrx2U=;
 b=VFVarXiP7aey29T1z7K3pP/LabPWcwRN30cLwhY542byzKjEbQIfi1Oq0kpScglw/03g10xfeKebHXqi7VjHMX4x/dxoQFR33CUg9GrsoVBicK43iCbXyQnm2MK3LMCJUf1jkSj+0pqfG+TBUiE0m/hrHsj6+A+fdzJdTMmGpf5yvR2M1Kd9JGnPCZQsBBx1tjva3nDA9BUkJO945BQIV/ubjavHxjL0pAybU06biVSDJg3lDzMFQy0lf5qu6bekNwmaxUR2ARj5IYX2GMYPHbTqtzB2lQyqyPW8/eWmfE/2SZr3Xwoj3DUnqMO41FhWfaUp+Ys7FWeTghG42pK6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2EPOBm4fZ6viSD0xpr1lnHb5byGce7/kHznjulrx2U=;
 b=ah7FSZP5frM/MbR/U9jt6AWbBg53IUsRBkvNDv3n8svcuuu8/qDAcZA9yX0M+p2DDQQAPIapOD+1IuiytJ2KoFwqVQ3Negxad21R+1pMisGqf0YL2tn6KdnERBn7tVHl1yAg+Hb3llK5kfnGv+RxwSnpfOQeiEHCRHywJkpKLdk=
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
Subject: [PATCH v3 08/10] automation: Rename qemu-smoke-arm64.sh to qemu-smoke-dom0less-arm64.sh
Date: Tue, 27 Sep 2022 11:47:25 +0200
Message-ID: <20220927094727.12762-9-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|SJ1PR12MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 104c7605-9fdd-42d4-7e29-08daa06d55bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vYWm78kANCmajEzzCnoKiUa2UOFJy9hXpty1GZcSDmj93a9q1EC7Sy+ir6MKzUraLsk7Jc7mewONJZ9Lfxa5eN4wXJWbSqTncOrWNlVGjDFxecpK4uAi4Na1kD0fj6Prqx/4LYTX48x3CJKGXYdMReCN4f6DdJZ0S9REl+fkWAsxKfwjWyn7vgy89SlHAsqZenSjXDsHZoUnmBRT+mBkwgkja2x7CWEtUPnikuuzPJalVr9wnu51WE7YuMQkGf7ct/IyRzKSfL30BEDhlj5HbyhLvtrxT0+aXgCDtX9d2nTXJkuKzgW9dzrm6+wdEY+zvEZC8dTN/5Lsom6wyjo43P2RKwN9Dr1UG8wYPjFaSpYSP0auomkG0EgAzoYjmc8QIhL7HyPh4oa4xSF0EX/hoRNH7cEtjFXtDeEIrUk6vMEImwB93mHLvGMbMNQ72JVTNvinqLOXA5xcN4Dv/eBIth/IUMwYycrEXrB3xx0rpuM9ouD9pfzlRoD1PV0u2wpObqnZ3CVYSFXVSfDe/OjqjTJXM/MIucZ+eMn2M38JBcrQtqlRa+J6DtyTwZJZXVR1m5RcNd7Y1wigkIDqoTaeI1HeHXl8bn1bWOzAGtNZP042dd8ZXGEbUb5B5UAWNbsgvaweM26mo77ga51E+tUnozoWU53AxBB07o7U2xwlSqLVIpiup9DZVPZiolivETbY2+n4xSjiSYxvCk2ACFf6RoY8fZ0U3bNKWuxbu8Hk0s2dshnzFTlFdGAz6HHU3I8I3q2a3POrGC0qApuVVuWQWcLF4i5cYQ7D9FLS1tyXLazRAqYgwPVcfq2vF3w7W/PD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(1076003)(336012)(356005)(82740400003)(426003)(2616005)(186003)(86362001)(40480700001)(81166007)(83380400001)(47076005)(36860700001)(5660300002)(70206006)(70586007)(44832011)(41300700001)(4326008)(8676002)(82310400005)(2906002)(26005)(6916009)(6666004)(40460700003)(316002)(8936002)(54906003)(478600001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:47.5795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 104c7605-9fdd-42d4-7e29-08daa06d55bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6362

Testing arm64 is done using the qemu-alpine-arm64.sh and
qemu-smoke-arm64.sh scripts. These scripts are executed with exactly
the same artifacts (container, rootfs, kernel, qemu) and the only
difference is that the former is used to perform dom0 based testing
and the latter - dom0less based testing.

Because the current naming is quite ambiguous, rename qemu-smoke-arm64.sh
script to qemu-smoke-dom0less-arm64.sh to reflect its usage.

qemu-alpine-arm64.sh will be renamed in the follow-up patch.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- commit msg: s/umbiguous/ambiguous/
Changes in v2:
- none
---
 automation/gitlab-ci/test.yaml                | 24 +++++++++----------
 ...-arm64.sh => qemu-smoke-dom0less-arm64.sh} |  0
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename automation/scripts/{qemu-smoke-arm64.sh => qemu-smoke-dom0less-arm64.sh} (100%)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1b51030c6175..f620622671f8 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -81,12 +81,12 @@ qemu-alpine-x86_64-gcc:
   tags:
     - x86_64
 
-qemu-smoke-arm64-gcc:
+qemu-smoke-dom0less-arm64-gcc:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-arm64
     - alpine-3.12-arm64-rootfs-export
@@ -100,12 +100,12 @@ qemu-smoke-arm64-gcc:
   tags:
     - arm64
 
-qemu-smoke-arm64-gcc-debug:
+qemu-smoke-dom0less-arm64-gcc-debug:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-debug-arm64
     - alpine-3.12-arm64-rootfs-export
@@ -119,12 +119,12 @@ qemu-smoke-arm64-gcc-debug:
   tags:
     - arm64
 
-qemu-smoke-arm64-gcc-staticmem:
+qemu-smoke-dom0less-arm64-gcc-staticmem:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-arm64-staticmem
     - alpine-3.12-arm64-rootfs-export
@@ -138,12 +138,12 @@ qemu-smoke-arm64-gcc-staticmem:
   tags:
     - arm64
 
-qemu-smoke-arm64-gcc-debug-staticmem:
+qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-debug-arm64-staticmem
     - alpine-3.12-arm64-rootfs-export
@@ -157,12 +157,12 @@ qemu-smoke-arm64-gcc-debug-staticmem:
   tags:
     - arm64
 
-qemu-smoke-arm64-gcc-boot-cpupools:
+qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-arm64-boot-cpupools
     - alpine-3.12-arm64-rootfs-export
@@ -176,12 +176,12 @@ qemu-smoke-arm64-gcc-boot-cpupools:
   tags:
     - arm64
 
-qemu-smoke-arm64-gcc-debug-boot-cpupools:
+qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-debug-arm64-boot-cpupools
     - alpine-3.12-arm64-rootfs-export
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
similarity index 100%
rename from automation/scripts/qemu-smoke-arm64.sh
rename to automation/scripts/qemu-smoke-dom0less-arm64.sh
-- 
2.25.1


