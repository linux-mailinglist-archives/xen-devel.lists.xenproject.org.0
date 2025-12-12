Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDABCB99F9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 20:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185741.1507744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8Wv-0006JH-0u; Fri, 12 Dec 2025 19:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185741.1507744; Fri, 12 Dec 2025 19:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8Wu-0006Gh-Tx; Fri, 12 Dec 2025 19:10:16 +0000
Received: by outflank-mailman (input) for mailman id 1185741;
 Fri, 12 Dec 2025 19:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tg47=6S=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1vU8Wt-0006Gb-Gg
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 19:10:15 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f143f7a-d78e-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 20:10:13 +0100 (CET)
Received: from BN9PR03CA0258.namprd03.prod.outlook.com (2603:10b6:408:ff::23)
 by SJ2PR12MB8718.namprd12.prod.outlook.com (2603:10b6:a03:540::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 19:10:09 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::3f) by BN9PR03CA0258.outlook.office365.com
 (2603:10b6:408:ff::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.11 via Frontend Transport; Fri,
 12 Dec 2025 19:10:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Fri, 12 Dec 2025 19:10:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 13:10:07 -0600
Received: from xsjvictlira01-ubuntu-0.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Dec 2025 11:10:07 -0800
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
X-Inumbo-ID: 2f143f7a-d78e-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLj2xpWHe5i6sdZ6x36wEogxqr4G1Xs0mO0Ju494WrRCUJC/Bb0e4bXRcOHv1NL4jMS4h5sXlHsrJX3XBWVQKfFNKUC3MAtdRjHqdTinA9JvuC17YFANQNPfrKa1xZ7I5q5JmaQbT1udmYAjm7jzTdijGc2sWdrSQwQ0RleUMVuoF+uRg4fW2hOrv6arGnlpKTlaXRbziuu2wOMOdBBohlRwiisaVAxTDbkT+Jg93WFKNZt3k0mMjF3EDtngsfAleEyU8pIT7tWdM2cVuNsquNQwYBMojQPHyPDGBGnFgXTu+PJ0SV0Xn3yUMIq7qunrXyeR7xmnfGJebY4r5i7HAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xvDFOX2ecMw9DO6uw62pl9vqwUUDOfta6wzTOha7sc=;
 b=qSfoGT2yhiUbBLf5iGGOH1vd4rTE74EhqczLH47QkD2Ik8VTlVBKU4siAWuWrvyRxBWXEPPWI66LtzT/38m1wnvRkRq3+aalr7iOIN494ydQyQbvBwzmaIaRzXu/OFMlaXpMcVNYZySLDu5ISGcCt8iRgU4l2lDiC9gPeg89eM0dTZH9Mi/UA0qeh6vAR3OTW0C6WhR4a2BUoltmCfzeyGbH25xtFZg1WcJyLrXz95vYzkIWgOA1MlTQpAn2UUAfoFV+2h+JHrmH6v8yuJp+NjFyoZu9Br+hg2/UFbgdSj4HcppkFpatD5MsCZ0ZxrKv0TJTrwoyT483lEkgiZSk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xvDFOX2ecMw9DO6uw62pl9vqwUUDOfta6wzTOha7sc=;
 b=AxyWHE3WWK/2yOvYcvaD6N8sS7hS3xINzwBHeJR86XOgPu2NhwklrZNadP6UarQbxHgFZ1coitzPH2q9Fmcwwld6aR46YaoYnfzWNXS7+pdvOYncG9M+oXG8DoGj0igry2joksJtWXQxsS8BZ1M7X1mrPNS4+1K0MyLJvHPlTGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Victor Lira <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v2] automation: edit pipeline to prevent running non-selected jobs
Date: Fri, 12 Dec 2025 19:08:50 +0000
Message-ID: <20251212190850.1357779-2-victorm.lira@amd.com>
X-Mailer: git-send-email 2.51.GIT
In-Reply-To: <20251212190850.1357779-1-victorm.lira@amd.com>
References: <20251212190850.1357779-1-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SJ2PR12MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 1361b30a-64bc-4d80-b6cb-08de39b210e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dFFzjNoWoZNCJhpTLJaHyt/Ugx1OYdGNiQS75JXSPZ4OsEKBMOkOQfPZwwqe?=
 =?us-ascii?Q?nvR7Wjfla268rdXwPa48+YATIbYrJRrWjldjhYByaixG/UuyIOx2f2SXT/GN?=
 =?us-ascii?Q?JG4GoLxdShlaftLAV2D+TloVV7fbSG9Nb79MtOEQ0FmMNoC0lbneOGTW2qQC?=
 =?us-ascii?Q?MwUDxw9CiG8UOMIiWdPeiIC4XuLZwCGgYOVcc2Y0u4E6oy9sQ7/yKUhXw4CI?=
 =?us-ascii?Q?XC8pfBVXuKHvDjyUPwDJOtP62YyydH8+HzalPIWucKtAODR2IqLpSjF65qj6?=
 =?us-ascii?Q?L/xrGPno+FtclPJL5GRk1ka+QU40KONvBXdTDWExdBN85zt755hrUP+J306y?=
 =?us-ascii?Q?J//WbEJc3BAm+r6DzVCiZ2rfRyj9rd3nZjT+pdoGvEOlOzRHFoh1C5tBIUun?=
 =?us-ascii?Q?t1JTO95rrMc46gBgsiZOMGbrHpMa94coJQmYOz/kpUlHggSlCi/W9nu98VwB?=
 =?us-ascii?Q?NyZMBySf8KG1eHfECSlEYqOGisb+OuJwT3gC9sJFQCl7aRwZRnjf8RYRrt7W?=
 =?us-ascii?Q?G+1STzTnZMdw5qiHm9pSfdyoy4YewcEZHhWVNDNY/KLM8TgwVDmRQWwKmzvB?=
 =?us-ascii?Q?joPh1CWdSKUZJeJu6BZvrXFTj79n01D5Gl2mdr3k1Ff/Khyc4VjOdDZoHz9/?=
 =?us-ascii?Q?FfCClK+TpQDHQnG+dAjBYQjgQSQMWQDIR/rIkHZ0SslEJN5CeTBG9jzGLUhV?=
 =?us-ascii?Q?js0flRLBDozRrTLIw37veoDbjkD4nDRNVu/meWXZwRaYlhjPZUZsWdIylIAw?=
 =?us-ascii?Q?B3oFuS1RJWTHbLzwRCPjSw17Vj7tkDUMgtR4E6YQWQq7XXE91WuZkgH+vofs?=
 =?us-ascii?Q?EtzFch05H2jP44iS4uGXmkfttLGpgf1F3yO/pot2Hk/2xLaLyivLZ26AlrKJ?=
 =?us-ascii?Q?ctv9LRmMz1pQVOBUpKHOzdt8yUBDpOAGuQXYB1q7u6K0PgVJEQW86m2b9pZ2?=
 =?us-ascii?Q?Gwzjt70w4Y8lgD+rqntzzJOxECLEgRrAQapzcmEF5Sjc1WZELQbiDNnzl/kn?=
 =?us-ascii?Q?jcOoRBApCWlgHA5VKw9T6/I/Ilc/Go6gHLnfakhzPe0adKGQcwEUqLvQVbgr?=
 =?us-ascii?Q?SAOHwUuiwAnf+J3/NUPKkTw3gyRHn93P2zyiax9vOCCPXb2h+vazeeWrwQvl?=
 =?us-ascii?Q?ekPIctHJRHHCKAgp1y4GwJPMb7NOZUBVs6UFy8/Nt2Q6AIgbRS7TqJLswqls?=
 =?us-ascii?Q?dlmrBqxhJbBOrTxf31lNmcHVolG5714KT71NlPDZON0LD3HImz9DptFKCUZV?=
 =?us-ascii?Q?IXa6wNPo4kiHwWtoGc7rONtW2a1AcnJ3CGsD3iIVMqfdUM+CVwiJCVz/WRFa?=
 =?us-ascii?Q?glzr1ZyVaPoM3uR+LnaIzOgls/dCZazeEOj7cEwJ0FHKZGl60lcUSJpzrOVg?=
 =?us-ascii?Q?JN5fsw9DRCppRN97dA3faaeQDtQsyb0J8RU4b8szGn68R5i18VSDv0yVrK+B?=
 =?us-ascii?Q?CpvjJ54+IiYk0SCSpH0dDk9RBpHjGjuqGVutiXk97r2XAVmJWp8QCGvyJcX5?=
 =?us-ascii?Q?EoiWzItScnj5W8xgypYCBlAjJLtRzvxUeaG1kxre2gZeAxJkUAyGfV/Efo3c?=
 =?us-ascii?Q?yOJ+lZ2d2hotwjNtJnDW3HD28oPve/aRkBDEW57s?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:10:08.3347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1361b30a-64bc-4d80-b6cb-08de39b210e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8718

Filtering jobs using the selected jobs regex is missing for
qemu-export + yocto jobs when running regular pipelines and eclair jobs
when running scheduled pipelines.

First, set a default value for the selected jobs regex to remove the
need to always check if the variable is empty.

Then add the missing rules to filter out those jobs.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
changes v2:
  - rebase onto staging

with SELECTED_JOBS_ONLY="/alpine-3.18-gcc$/" ...
before push: https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2212050840
after push: https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2212063969
before schedule: https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2212068543
after schedule: https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2212066703

Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 .gitlab-ci.yml                    | 1 +
 automation/gitlab-ci/analyze.yaml | 5 +++--
 automation/gitlab-ci/build.yaml   | 9 ++++++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7974ac4e82..64bed300a6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -2,6 +2,7 @@ variables:
   XEN_REGISTRY: registry.gitlab.com/xen-project/xen
   SELECTED_JOBS_ONLY:
     description: "Regex to select only some jobs, must be enclosed with /. For example /job1|job2/"
+    value: "/.*/"

 workflow:
   name: "$CI_PIPELINE_SCHEDULE_DESCRIPTION"
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index e9a8f9d544..a472692fcb 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -31,8 +31,7 @@
   rules:
     - if: $CI_PIPELINE_SOURCE == "schedule"
       when: never
-    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
-    - if: $SELECTED_JOBS_ONLY
+    - if: $CI_JOB_NAME !~ $SELECTED_JOBS_ONLY
       when: never
     - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
       when: manual
@@ -172,6 +171,8 @@ eclair-ARM64-amd:
   rules:
     - if: $CI_PIPELINE_SOURCE != "schedule"
       when: never
+    - if: $CI_JOB_NAME !~ $SELECTED_JOBS_ONLY
+      when: never
     - !reference [.eclair-analysis, rules]

 eclair-x86_64-allrules:on-schedule:
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 4cb52fe597..e9e04e37d4 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -226,6 +226,9 @@
       - binaries/
     when: always
   needs: []
+  rules:
+    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+      when: manual

 .yocto-test-arm64:
   extends: .yocto-test
@@ -261,6 +264,9 @@
 .test-jobs-artifact-common:
   stage: build
   needs: []
+  rules:
+    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+      when: on_success

 # Arm test artifacts

@@ -468,20 +474,17 @@ yocto-qemuarm64:
   extends: .yocto-test-arm64
   variables:
     YOCTO_BOARD: qemuarm64
-  when: manual

 yocto-qemuarm:
   extends: .yocto-test-arm64
   variables:
     YOCTO_BOARD: qemuarm
     YOCTO_OUTPUT: --copy-output
-  when: manual

 yocto-qemux86-64:
   extends: .yocto-test-x86-64
   variables:
     YOCTO_BOARD: qemux86-64
-  when: manual

 # Cppcheck analysis jobs

--
2.51.GIT

