Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F70ECBA292
	for <lists+xen-devel@lfdr.de>; Sat, 13 Dec 2025 02:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186035.1507933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUETH-00032M-4n; Sat, 13 Dec 2025 01:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186035.1507933; Sat, 13 Dec 2025 01:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUETH-000308-20; Sat, 13 Dec 2025 01:30:55 +0000
Received: by outflank-mailman (input) for mailman id 1186035;
 Sat, 13 Dec 2025 01:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO9D=6T=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1vUETF-000302-Mi
 for xen-devel@lists.xenproject.org; Sat, 13 Dec 2025 01:30:53 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 581388b0-d7c3-11f0-9cce-f158ae23cfc8;
 Sat, 13 Dec 2025 02:30:46 +0100 (CET)
Received: from BL1PR13CA0003.namprd13.prod.outlook.com (2603:10b6:208:256::8)
 by SA5PPFEC2853BA9.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Sat, 13 Dec
 2025 01:30:38 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:256:cafe::9a) by BL1PR13CA0003.outlook.office365.com
 (2603:10b6:208:256::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Sat,
 13 Dec 2025 01:30:38 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Sat, 13 Dec 2025 01:30:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 19:30:37 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 19:30:37 -0600
Received: from xsjvictlira01-ubuntu-0.mshome.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Dec 2025 17:30:37 -0800
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
X-Inumbo-ID: 581388b0-d7c3-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqTungroLBtN+QooGCK7e4tg757DBivz3Tvr7q45uHN+SYYIxTDxbsxWb1kDYpA8TkphJrcHWmgTJZS+w/hl1RPj52Zl7tnnROBN7yZA7H8rOXbAZet7WfTdCpRzyxeYzTpaGrSpEBhDNYlTY4HSnFANlVSeiXFkQsKxTOBRnE2RkQCBN8Ic/jNUC4052GIrUb5PNMKDq3zy0h26LYTCi566duCca7mS4O46i+tllqawssCVJtW0bbSOY0bPbDgwkKHfGRDVbNiHPHBdBMDamVzHqJH1ofDKigZd2UuKkUQNpfUNndOOMwFClztKeLT5AMZGnNK5uIncnRZTbDMtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJdGCH4izyTSU4OZpCLzbXqEW3naQ64qURwgV6ErX7Y=;
 b=EXIwHKJnxcaszidyKkWm7quzWJN2BnwRFvTEP3cJKHmJP4FOW4/QOvHD17brh8NA1YWTmGTe8Flt9WrEk1RlRm3GOXTx3R0awnd7MsNUVUiliYIqUToCFzkU0658UMxtYB7IZrmHNSOZdISMLFBUGIhzqHLX7DS2UGZj8UOh/8QMa3oHF8rhD1FZ0X1MPx2zxDazTJk7Xve1anfIhYWolQ1FT1RjySW8NCLDGoicg9s9CDWzN/6SwSwDMKHjCdeE3IckpGKPqgxNrTjPkpjD3dffjNrFo0zWlHbpCCaaVWmHRC2PQpcEnnJoGdC1NzlVh6Tv0TqZUntPDs3PdloVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJdGCH4izyTSU4OZpCLzbXqEW3naQ64qURwgV6ErX7Y=;
 b=03MUB3YiIJIU0H7tMaeOPsQ3Xtjh3NiMaGEdyEP4r+JufQx3bqaQDUBIIuyeSakGA2bmUVlBbMbiZLzJ6ZMl1uI4uNGfCP1v7bpUz739kwqmU9VOEbAspgPjJg18wYM+7aiRmjmIOKJlRhvD4wDKSHVjl6YnQZCbInQ7BC7bMUg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Victor Lira <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>
Subject: [XEN PATCH v1] automation: edit pipeline to fix hardware jobs running by mistake
Date: Sat, 13 Dec 2025 01:30:28 +0000
Message-ID: <20251213013028.1382461-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.51.GIT
In-Reply-To: <20251212235727.1377099-1-victorm.lira@amd.com>
References: <20251212235727.1377099-1-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|SA5PPFEC2853BA9:EE_
X-MS-Office365-Filtering-Correlation-Id: 122b9c37-f124-48eb-a019-08de39e7386f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VgCBJAADhSNVLZk40WfsbsApLFF2CE6oKkmqk4E5YwZiIvO4+ov42yYSPmis?=
 =?us-ascii?Q?Q2KccRk/MlMe/xZa1wweIR1FurMIiy94xL093ATaH9WD7ICzV0dXLjkpsFG8?=
 =?us-ascii?Q?XBD3LYwTZD/fcfqXmdb7sZNvwrGb+4FflmodlR3Wkh9qQL8wgfXGDBt1eoUQ?=
 =?us-ascii?Q?4rBxBudP2YzFisHUi6S7ybUaxF0NJq32o3LZh8JIZM2n9NMAxvAjq9dtjkiu?=
 =?us-ascii?Q?IgINlX9UaIDJZ0ESjXI1CjofOucE+rY5Pmc7GuLa9SfNez4l2QEuMvH0Di2M?=
 =?us-ascii?Q?bCyD74kcxp8Ouyrx6OsKP7HjULLU1vmmSVFLffDcb1h3zUdoY1qfKlnPr9i9?=
 =?us-ascii?Q?NFhwIba2q8L5X+nBV1yZg8Ui32vEKduv5MCCnBLUZyqpPRZ+Ul2PEAkVdSgT?=
 =?us-ascii?Q?ki1voX3gmZgXAh5lhSdRRtIyD/OIw8VFO8tfHI9fLUPlzpdapw4PyaOOIO90?=
 =?us-ascii?Q?PaIk0PGWTeWMAGK7uW9Qdqd8Nj7PCZiCKA6cuudzwAK286ZEg1o6FNxBtjja?=
 =?us-ascii?Q?+lbYlgCLOkj3G9A5NcS4Avsx56Lt5QKINCIORUgMhY96MTNTFOYLEsw/TP8E?=
 =?us-ascii?Q?NDbDpXlqSUrYA0cuRlk+NPNkf4DGR6u7xl+O7wNOiaa/vdd0fGw96DPe9HYQ?=
 =?us-ascii?Q?QYC8TTcgc0g24Rak7krSFnQKrzJ8cBUChDvaYssiOsccG3YfZQjEvFssbZzZ?=
 =?us-ascii?Q?HwTPKkUpwv9uTmd9ASzW3wATn1X1kqDV13fr6MXSHd527tkH/yF00EIeV3K5?=
 =?us-ascii?Q?Jx76/aSObycEIaF7Cm5S5iR93DD1s4X9z1l9uU6MNyz88wk79PGV1chciare?=
 =?us-ascii?Q?DW5bywGRGudIpU68C67SNizoWLsG0xwPfm07oL0x4wWP/St5EA+/hYB6obkE?=
 =?us-ascii?Q?roxrdFIucQn2zO1u2px69xYmE8fY2bYm0ibsj32jaer3LQACFCciIFYnv3/6?=
 =?us-ascii?Q?bIdt4ZLv5wpFP+kXNGapA7iSpNPCAZltZNddusfED256wY7wK9MEOpE4vkbk?=
 =?us-ascii?Q?MLyGCuPq0TwqQtt5LzElLp/+rhMzLQVrR9hqo/ddjERpIZy+qJzK68AIILbX?=
 =?us-ascii?Q?Rhz5dN92U2FkLzKSU8ZIAH73zCQW2G0aZJb5g8ruERZTq5MSHQJIhS1+t1OR?=
 =?us-ascii?Q?AZwxJje0/IWS47oPaRdtChSwzmhVZ9XTSYo3GkUPfT14++n1GQlv8aYYfTJi?=
 =?us-ascii?Q?a1eOb7smVDDaZGHRtxHAyDOepXsvdgrieJxDMvyxJYuydDfjufd3Zj2Hz0MM?=
 =?us-ascii?Q?rBVl4iIgVkgygAwQJJs0J1YVPdICdz63/5OlT0Vew+Sxmump6ZrTPX3ucyKA?=
 =?us-ascii?Q?TW7sgODbT5U9lMAIgEXL9I63fnKrjE6oodBXyyzzH3GdNrycasL+WpuT1Bim?=
 =?us-ascii?Q?BcVnLrJqFNwC5TS/TwYNY5wuOqzH+sfegU2gafrKpPuQiuzW7f6sZT2wY+9a?=
 =?us-ascii?Q?h7vtVv8jsZVsZgN1N6oSG6lW6AoCLNNyUU3Eqb2zi61cZJKsI/jGLDoE7nDM?=
 =?us-ascii?Q?MqAKZM9HT6KYVpqNI4XO9Xm4PbE86Mcp9wj5UJwklKDDySPao8tTAgt1ClsN?=
 =?us-ascii?Q?p2GTi7O9pU3r15ZnHW3RrVGSAOd1MC2+gtsu9k97?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 01:30:37.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 122b9c37-f124-48eb-a019-08de39e7386f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFEC2853BA9

The selected jobs regex was assumed to be possibly empty in some places
and setting a default value for the regex caused the hardware jobs to
bypass some rules checks.

To fix this, adjust the rules to remove the check for empty and
instead just match the regex.

Fixes: 485ab1b5db0f358625fafe2df4e41e3ef008aed8
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2212446508
https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2212446409
---
 automation/gitlab-ci/build.yaml |  7 ++-----
 automation/gitlab-ci/test.yaml  | 27 +++++++++++----------------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f7e032320a..a6fc55c2d5 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -13,11 +13,8 @@
     when: always
   needs: []
   rules:
-  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
-    when: always
-  - if: $SELECTED_JOBS_ONLY
-    when: never
-  - when: on_success
+    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+      when: on_success

 .gcc-tmpl:
   variables: &gcc
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8d8f62c8d0..338fc99a8a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -2,10 +2,8 @@
   stage: test
   image: ${XEN_REGISTRY}/${CONTAINER}
   rules:
-  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
-  - if: $SELECTED_JOBS_ONLY
-    when: never
-  - when: on_success
+  - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+    when: on_success

 .arm64-test-needs: &arm64-test-needs
   - project: xen-project/hardware/test-artifacts
@@ -113,10 +111,9 @@
       - '*.dtb'
     when: always
   rules:
-    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
-    - if: $SELECTED_JOBS_ONLY
-      when: never
-    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $XILINX_JOBS == "true"
+          && $CI_COMMIT_REF_PROTECTED == "true"
+      when: on_success
   tags:
     - xilinx

@@ -134,10 +131,9 @@
       - '*.log'
     when: always
   rules:
-    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
-    - if: $SELECTED_JOBS_ONLY
-      when: never
-    - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $XILINX_JOBS == "true"
+          && $CI_COMMIT_REF_PROTECTED == "true"
+      when: on_success
   tags:
     - xilinx

@@ -157,10 +153,9 @@
       - '*.log'
     when: always
   rules:
-    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
-    - if: $SELECTED_JOBS_ONLY
-      when: never
-    - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $QUBES_JOBS == "true"
+          && $CI_COMMIT_REF_PROTECTED == "true"
+      when: on_success
   tags:
     - qubes-hw2

--
2.51.GIT

