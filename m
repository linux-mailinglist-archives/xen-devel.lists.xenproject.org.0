Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CBD5E63E6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410158.653219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSD-0005bs-GN; Thu, 22 Sep 2022 13:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410158.653219; Thu, 22 Sep 2022 13:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSD-0005V0-6E; Thu, 22 Sep 2022 13:41:25 +0000
Received: by outflank-mailman (input) for mailman id 410158;
 Thu, 22 Sep 2022 13:41:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMSB-00041N-F8
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:23 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c627172-3a7c-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 15:41:19 +0200 (CEST)
Received: from DS7PR05CA0035.namprd05.prod.outlook.com (2603:10b6:8:2f::18) by
 CH0PR12MB5123.namprd12.prod.outlook.com (2603:10b6:610:be::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.18; Thu, 22 Sep 2022 13:41:19 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::a8) by DS7PR05CA0035.outlook.office365.com
 (2603:10b6:8:2f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.7 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:18 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:17 -0500
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
X-Inumbo-ID: 3c627172-3a7c-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nj1bYLM4cL7qGRtuz7ajqF39O6V+PQn5H59rRVoNF3/ePaY4egyDZH4n5RsuKL7YZLT2NYOWNfbqRzwW8EctU8QNkIGJAVaUXYOtDj8CidSKz/10Dnw/iIzlAUFMxDhiqYZm+uc6ArIyN+ZLuK33hq8P75ejkwPD3CHZPSVsEc5iZCKTn5o6O0WBjcTh6p5oB80vo1vnAegcqJqOSmPZBHZgM5iJ+xuuFi3BSTvBn35g6btrOpcoxuwWBkTVrpNjiIfTn8ZzbqfUU2ztTKFPGEOT/HPQoMKRvU5C/rMB0HcoOQT7s1oKpLIWCL8hqsJJD+ICtuouEyESLMcOidIxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKNU8RodtxiS9iEytnYZZrKwRk5SeAtglDgJxAkPQy0=;
 b=ltY3hsrIbDZll8M9dXH37YgQM1t0g7ydd5Ub0is793MIzLIPyO+tAUWx/FV6jaAY+wvytcEniZzzKTuk6sh8+yK0x0Rkp/BTLwooPGqzyf/QxbdBWrs0oshJOVNjpDU9XKx7OWgD4cY337xEabMKgCfHZRpItPgXGukLKKs4rQr/ZdhQvcVHLbTm+Ug/b+sF2ioJ2GxbWOVg8k0FW948qIxyxzJESRT3OvRKKe13l2Se1ECKHaym1LC9lKvyq79FJTaVkhnFjCDWLsSF1MZDbu7PAMCTJP+RNmUv0sAt8ncjNupYZi5JshBIOoN9DD3X4ymvfl/vSU16wnGyodhsKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKNU8RodtxiS9iEytnYZZrKwRk5SeAtglDgJxAkPQy0=;
 b=BavXqMm0hTdJNfbTprtQp6kcNlZ6QeNk7oEyLYZTLKf7SkbosBJJwZNEZdyaUeUuLYeg++R/EEOtg5HmpMYmlnDSoXZilUWPOFacLp+PA51QZjMGb1LXH+m13fIdmcDcrHrpn6pl+aUMQ0+Q1Def2g1nX18u8xIuruCIOuiTQIw=
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
Subject: [PATCH 7/9] automation: Rename qemu-smoke-arm64.sh to qemu-smoke-dom0less-arm64.sh
Date: Thu, 22 Sep 2022 15:40:56 +0200
Message-ID: <20220922134058.1410-8-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922134058.1410-1-michal.orzel@amd.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT049:EE_|CH0PR12MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: 110b979b-dd79-481b-2a92-08da9ca02118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ziSjeD10SDEkBH7Gf9m0sGpWF18Ih09pFO/RkWSyD62K2exE9Ak33pjWWS0X80sLN/7uPW3M+N/DRA4sp9dGHO0G5BkP7zXRzh2iV5ok07GkzcTAyug9TO7Uork32xKUQfqbUBZg2A4hUHmnVUyvYrFWq5qkVE1w0FChGTWJuUfvHgb//JurffZKJEG+lh/nC8DJjiIi4Lq1oFM/zevhHZMGbhtr84XTumZsDv7/Qa3v6VAflsbzg6OfydwYTqZ9xypBkjNZbDj/d5UTmG2LSSejNk2zFqbdOJPOs1e6cLzjpqXGT8btdxVX8WA6EpG6rx81Z0gl0yr2IRBxz0Pn314XePNmcqFMupphISYhA0PWU2dT8u+TySMtmL3kJDrJzqNyqa/6AIfejyBu2BWx1VJO/ja8prK5AKFn4LDpROZ/2rFxMyWxJ+4JWgt2DbtSljJF/li8gXeS3lB+zlYVKSS76VbAkPM16iQG7PL218S9pdeovzSZEOWrCPY/cBWVPyVBmYnz8H0hCVQt1o97ffgoCFDRDsv0Lj/Efiuqb+sKSkpZJOCgE3cBoJlU5u1FskKH0IeOMfUQhuZadTkK+0NM1UPxa1BAaEtrJxN0ExHILIwsWmlA9TjVM8qTOUOeyTd1zDdMIJR1nZB42/sViemTaRfNERotpWgxPrPBNQgO8cxPsCnq66R1WUi1rA5dlohM0Jv8vn5Gknm+ziSCkkjI1IGlGe9NWmxUYL7ySoNKtV3QWyW71FgZTO7xKYJfHm1anlwXjK/hoZyXGEUjZRfazfbI0PCpGjmdIiNWNwDTVLC/zW+8/sw5uu+9KS2x
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(478600001)(36756003)(5660300002)(6666004)(54906003)(2616005)(316002)(40480700001)(26005)(8936002)(36860700001)(41300700001)(40460700003)(86362001)(8676002)(82740400003)(6916009)(2906002)(186003)(356005)(47076005)(83380400001)(44832011)(1076003)(336012)(426003)(81166007)(82310400005)(70206006)(70586007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:18.9341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110b979b-dd79-481b-2a92-08da9ca02118
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5123

Testing arm64 is done using the qemu-alpine-arm64.sh and
qemu-smoke-arm64.sh scripts. These scripts are executed with exactly
the same artifacts (container, rootfs, kernel, qemu) and the only
difference is that the former is used to perform dom0 based testing
and the latter - dom0less based testing.

Because the current naming is quite umbiguous, rename qemu-smoke-arm64.sh
script to qemu-smoke-dom0less-arm64.sh to reflect its usage.

qemu-alpine-arm64.sh will be renamed in the follow-up patch.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
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


