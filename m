Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD228AF397
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710907.1110472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIk8-00010t-9B; Tue, 23 Apr 2024 16:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710907.1110472; Tue, 23 Apr 2024 16:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIk8-0000zK-5t; Tue, 23 Apr 2024 16:11:40 +0000
Received: by outflank-mailman (input) for mailman id 710907;
 Tue, 23 Apr 2024 16:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ID6+=L4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rzIk6-0000jr-DM
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:11:38 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28e8001a-018c-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 18:11:36 +0200 (CEST)
Received: from BL1PR13CA0270.namprd13.prod.outlook.com (2603:10b6:208:2ba::35)
 by DS7PR12MB8201.namprd12.prod.outlook.com (2603:10b6:8:ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 16:11:31 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::95) by BL1PR13CA0270.outlook.office365.com
 (2603:10b6:208:2ba::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21 via Frontend
 Transport; Tue, 23 Apr 2024 16:11:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Tue, 23 Apr 2024 16:11:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 11:11:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 09:11:24 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Tue, 23 Apr 2024 11:11:23 -0500
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
X-Inumbo-ID: 28e8001a-018c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFy4EEzZMNLkwyoUE/gOG0ZoZoFYyr1o26Ck3jFdExCTSrXz3R1yR54hW9ROWPlcmtx+Mq9q2RVlD5hxDvaLUGx2hqEX+m/88+BRs70oDyeSwPsEn7tb8p2EX1ej/GutScJqOA9NYhHcv/4F9QdHDYahetmdIuiRFPzjb+MwU/6E83I+4yEmFs7u6r7V7B7i42KWxH6QynsKvxCBbSOjN/pGfrCm+lEjfH32httLZzO1MsbcDWJqZmKIbYU3eiJjMkD8l4nsdlQYJovTaw779ksrcdCHV8mZM+I+gIePtLz79n178FOObIXOJW7FhxM6HZ/tR6GBumwOT8TGsg8lLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjdVbcN1C9Efa16EYslsbc9VOceVtWp5Bqy/1aQNcBs=;
 b=PTsDIO4+El0sCwidfqB4qCKjcbUsHFt9ihgw3ZQ6ZGB3+gMKdXo6jcvN0fm8sT3snfE/wD+LjyMTly9rFJcrEtZP/pw6lv8rnQJMrLVJ8HazTRxQVENVEPSZD3ereLbCjquxk2fZkowA1LUaKQJSSWLOLQbnW9RTe9QqggiuS4yJ4tA9PoOC7TjD5z6TF+onyFbDSd99nfLrVbM91cuz9qx6gvcS6odMfFTEY5eoj9hdLVPNOCf3YzP1GQS2K+40TZwff9eQWavaoKFn2Isv7VrAmuPjxPb3MSck4uJjr0f0BrL8oMILpVdxw1gEy0Q5lApmUnJryXty98N8LE9Dbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjdVbcN1C9Efa16EYslsbc9VOceVtWp5Bqy/1aQNcBs=;
 b=HLSoKL07HNT6dsRUzzcdBJ6+YcqfzPPluB4JKPyKORzqU3kVWkK/WrbsH1YbTgeYwmQDNT3J0FEs35ssgDkEdeG0GDjlk9u5twPrNMFUnm5hd/qxsrJQ+wQZLg2VOAlPkZl6OeixT0/zW+QlpPEGrU13d5dXOnMpHomGqsdrTtI=
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
Subject: [PATCH 1/3] automation: Drop some of the non-debug variants of the same Arm jobs
Date: Tue, 23 Apr 2024 18:11:19 +0200
Message-ID: <20240423161121.138536-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423161121.138536-1-michal.orzel@amd.com>
References: <20240423161121.138536-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|DS7PR12MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: aed470c3-b726-4ad1-f252-08dc63b0085d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EppKgblmDfnMuAGGpQPnF993bM7mlaSHPVIERaW1vIcIBjp8mOlfJgQaubD9?=
 =?us-ascii?Q?CR62B4qKx79l1aKrorjUgX85qv7+1KX/KcaM9VT0RWx+HOGemqqF0uTJN1xJ?=
 =?us-ascii?Q?R9l1mPAtPhBRp8Pmw7HIwaEGcM97PxBU7lakvHiAXzaWKASGItSRXmWKPCk4?=
 =?us-ascii?Q?fTiRtq7gmAdeCmiqnNaGN8ebaV6pgakAHdxY3EDcHOeUEwrQUD4hogPWy682?=
 =?us-ascii?Q?JVie6/5wF7UAJMYd47Ydb2HiFvcMbFh6UDh1VXGzAihh4c55Nb/zFbwRDcs0?=
 =?us-ascii?Q?K+PWoKUjSQWuf/CD+v9Kt2qLv3KK7IEocUL9hGR4TbpCXwjkpCPXfG2yRoMX?=
 =?us-ascii?Q?21CQQQv/+IjbIDuJ4wW2CLTXncIHSCQKEL1w1mUdGiAktduFlWCPLDmGTXTp?=
 =?us-ascii?Q?lrsmyHks7qJvega9xoXwL2pCzry4KIJa1WSGLbjrI9gQU/4JKQIgyoZl2YgY?=
 =?us-ascii?Q?R5vHxUVRLqcLoi5k8MDEpoDjmDBl4WF5+CCVh4AAOUcNjyTCeongtbgTN9MI?=
 =?us-ascii?Q?PKHKSDKcKFhSgPpT6v1guy+xgWYEHxRLbDXMCduN2WJ2YLu23wOvw1DrUzKU?=
 =?us-ascii?Q?9m7GltBvo42D2ijN+qR+3v6IagzGrP8kb/YMeXUtOxEP2E3unQdiGP20/LVU?=
 =?us-ascii?Q?Hf5kVMxEgJYgvGoZskVHQHDWqWNnpivQVXv6Cs0qf8zaUXTpciZ2qDlS0PKJ?=
 =?us-ascii?Q?/azVzw1rkdUcHY5Ngu+VsWTMy35+1jC5k2i8Jn/8otugu9U/WX7/NyIzmMGY?=
 =?us-ascii?Q?aLzzsQts2Mce2ziBq12KUjAk3hNgYHz7Zc0KxiX9pXWwEhjZY7FQ/GKgVnn8?=
 =?us-ascii?Q?rPluLBQeJVJkD4y4nKE5bAGTqWJgoacFcJ9jsga7VnTEVRL5OH+6l1fChmrm?=
 =?us-ascii?Q?rUtGnq+xKdZu3cdIxjZNPYM9Xdo850inJL+ZKJdOuecn+jo8GBRW8S60ytlp?=
 =?us-ascii?Q?gTAEpZGFJoMIX0ZxwOaRcQqc/qOV3ytSAg71N512XPyn3FOQompCyh/r/mrR?=
 =?us-ascii?Q?yl4RbuiLD1JBGJFBQA/AydZ2yX+91aVSV2Ue9xYG4117z41+vrndA6g5J0oq?=
 =?us-ascii?Q?HaDVpEEi4zIy4dzPq2FEVAHUH1WVAGdyXPcMCOygqkj6TLojYrrEdowXb2hl?=
 =?us-ascii?Q?W5fNaLgO9MmHx59QUdLO/oEAuRi4yOwWFoZSnK7J5QOjMR45d6PVZptL0Tpb?=
 =?us-ascii?Q?Wn6DvCsfaEbWg513nil8bM/fbBV5km81FiF+Xw3r+EX2+JvHp6TN/gMEF/co?=
 =?us-ascii?Q?ORL8WhUcETNGwRIaJtv5HmdrdlZeTNqhbF30kH9iIxiCQNfUH9BCwV7ytLWH?=
 =?us-ascii?Q?LJMkSKSCzONeRN7v8o8qBimSmPHq0Q7gkyBFFp7tBPU6DLQ0EOVguV9BVo3o?=
 =?us-ascii?Q?qfyze6qO3XdJrqRDkD7jOHm6j25F?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 16:11:28.5067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aed470c3-b726-4ad1-f252-08dc63b0085d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8201

To save some bandwith that can be later on used to increase the test
coverage by adding new tests, drop the following non-debug test/build
jobs existing in both debug and non-debug variants:
 - static memory (arm64, arm32)
 - static shared memory (arm64)
 - static heap (arm64)
 - boot cpupools (arm64)
 - gzip (arm32)

More generic tests existing in both variants were left unmodified.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/build.yaml | 38 --------------------------
 automation/gitlab-ci/test.yaml  | 48 ---------------------------------
 2 files changed, 86 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index aac29ee13ab6..f3c934471f32 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -392,16 +392,6 @@ debian-bookworm-gcc-arm32-debug-randconfig:
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
-debian-bookworm-gcc-arm32-staticmem:
-  extends: .gcc-arm32-cross-build
-  variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-
 debian-bookworm-gcc-arm32-debug-staticmem:
   extends: .gcc-arm32-cross-build-debug
   variables:
@@ -458,15 +448,6 @@ alpine-3.18-gcc-debug-arm64-randconfig:
     CONTAINER: alpine:3.18-arm64v8
     RANDCONFIG: y
 
-alpine-3.18-gcc-arm64-staticmem:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-
 alpine-3.18-gcc-debug-arm64-staticmem:
   extends: .gcc-arm64-build-debug
   variables:
@@ -476,15 +457,6 @@ alpine-3.18-gcc-debug-arm64-staticmem:
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
-alpine-3.18-gcc-arm64-static-shared-mem:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-      CONFIG_STATIC_SHM=y
-
 alpine-3.18-gcc-debug-arm64-static-shared-mem:
   extends: .gcc-arm64-build-debug
   variables:
@@ -494,16 +466,6 @@ alpine-3.18-gcc-debug-arm64-static-shared-mem:
       CONFIG_STATIC_MEMORY=y
       CONFIG_STATIC_SHM=y
 
-alpine-3.18-gcc-arm64-boot-cpupools:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_SCHED_NULL=y
-      CONFIG_BOOT_TIME_CPUPOOLS=y
-
 alpine-3.18-gcc-debug-arm64-boot-cpupools:
   extends: .gcc-arm64-build-debug
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8b7b2e4da92d..55a7831ad292 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -255,14 +255,6 @@ qemu-smoke-dom0less-arm64-gcc-debug:
     - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64
 
-qemu-smoke-dom0less-arm64-gcc-staticmem:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64-staticmem
-
 qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
   extends: .qemu-arm64
   script:
@@ -271,14 +263,6 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
     - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64-staticmem
 
-qemu-smoke-dom0less-arm64-gcc-staticheap:
- extends: .qemu-arm64
- script:
-   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
- needs:
-   - *arm64-test-needs
-   - alpine-3.18-gcc-arm64
-
 qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
  extends: .qemu-arm64
  script:
@@ -287,14 +271,6 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
    - *arm64-test-needs
    - alpine-3.18-gcc-debug-arm64
 
-qemu-smoke-dom0less-arm64-gcc-static-shared-mem:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64-static-shared-mem
-
 qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
   extends: .qemu-arm64
   script:
@@ -303,14 +279,6 @@ qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
     - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64-static-shared-mem
 
-qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64-boot-cpupools
-
 qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
   extends: .qemu-arm64
   script:
@@ -359,14 +327,6 @@ qemu-smoke-dom0less-arm32-gcc-debug:
     - *arm32-test-needs
     - debian-bookworm-gcc-arm32-debug
 
-qemu-smoke-dom0less-arm32-gcc-staticmem:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-staticmem
-
 qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
   extends: .qemu-arm32
   script:
@@ -375,14 +335,6 @@ qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
     - *arm32-test-needs
     - debian-bookworm-gcc-arm32-debug-staticmem
 
-qemu-smoke-dom0less-arm32-gcc-gzip:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-bookworm-gcc-arm32
-
 qemu-smoke-dom0less-arm32-gcc-debug-gzip:
   extends: .qemu-arm32
   script:
-- 
2.25.1


