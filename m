Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73FFB41217
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 03:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107693.1457989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utcdj-0000ZR-PM; Wed, 03 Sep 2025 01:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107693.1457989; Wed, 03 Sep 2025 01:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utcdj-0000Xw-Mm; Wed, 03 Sep 2025 01:50:23 +0000
Received: by outflank-mailman (input) for mailman id 1107693;
 Wed, 03 Sep 2025 01:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3t=3O=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1utcdi-0000Xq-0v
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 01:50:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2414::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 584a930c-8868-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 03:50:19 +0200 (CEST)
Received: from BY5PR17CA0038.namprd17.prod.outlook.com (2603:10b6:a03:167::15)
 by CH3PR12MB9220.namprd12.prod.outlook.com (2603:10b6:610:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 01:50:14 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::67) by BY5PR17CA0038.outlook.office365.com
 (2603:10b6:a03:167::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.25 via Frontend Transport; Wed,
 3 Sep 2025 01:50:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 01:50:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 20:50:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 20:50:12 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 20:50:11 -0500
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
X-Inumbo-ID: 584a930c-8868-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gefUB+dyUt7T333RZVqrL3kGtc8QSLqXyEBT7WrOECZJ8yyhe8gLmeN7MdHX/VoaBXHRj3mZ/2wz0aR7iqqBYMCToKqFdzSijHenczN0NluCbnjx5jz9onpZG1C437CkcloQrVn9IZBnJSfLE6R3Gce8mrOvPPmvujlo54VIHPZbHyM9RwqmHfeVUBBY6UslrMYPuP1vX4Ft4gO9711o6rpuJUsZoC2HfOQT0scdcSqjU4KhP51GBF4oJFT7RuPivhIeI7ytADG6AerM0JGhB33vTq5gBSxO4hNRxKeTYcPzWD9+SglwbdJjGg0s4mMGGr351MRj3vLeYiJ/Pk7Lvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz2eaBwwwCZp211l/RyjUbSt3GFwVa8Bm/HnKDz3ZXc=;
 b=tixjQu9yyqVhFQpOQM5QuMyjnIjMc9o0B6w9JwnEooVco5UkOSHZVwFCbreyENTC+qFcBNDfVXrsOCp2FvXSNnyA/vZVjJUyNv9BoSRTILkriZu7IFLfw6n9i0dSW5rlSpBlsYZAyivcn4ZoskzR2rqlNPGYeU4MBrf0xdlnVZIU8v+IFTs0zCXNQ+8n9vaKdl2LYOL0n2jCZ6UpLDkwciBMj//LymCJ+0MDQxB9wRonk+JJ3scS+oTrhBR5vztvLsjyeeduKQslPwy/0f0PRCosN6rKnl+K2yKsWYBfVztOZFqiyE7GKRoOppRLo5iqIxllS3mK2Y/Fa4rYRtE/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz2eaBwwwCZp211l/RyjUbSt3GFwVa8Bm/HnKDz3ZXc=;
 b=f0BMjefRvX3cLCY8+XfLfyZhXXc6xu/LdCamqHmU2H77wX4V8uV4/aqgg4jpDT10a5M77+M1hPKu1+exEuOj7Zsn6OQrtoAUs4Fp4AUBRV4dsuUpjULyn4x6zNjnGVvO1bbfvqQOWZ9DTCJTbNLRSRFlTbfhEcQBTJdQH2BT7FI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v1] automation: edit pipeline to prevent running non-selected jobs
Date: Tue, 2 Sep 2025 18:49:44 -0700
Message-ID: <1437334569e10b76d1d7dc4e9fca7c25606855fb.1756862843.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.50.GIT
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|CH3PR12MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: afc7bb58-6eb9-4c72-2cbd-08ddea8c397c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFZsbFVzWW1TZVlvUCtvZ29hNm1vVUNnVkZMdThkdzZqUlVwUkVWZGs1bGVp?=
 =?utf-8?B?UW82M3VpcC9LV3FGaU5DSFlUVDM5SndkVHFkYWQ4UnNzQ0M4Wm9MUWZVS3p1?=
 =?utf-8?B?UGdZQ2JtOXYwSVV2Y3FGMGYxWkt1YnUyWVBnMGpPUVBucmtrdGY1bzcvbTN6?=
 =?utf-8?B?a3RJS3gyMXk1ZCtHeURDaVRtdENmK2NzUkpKSDA2cTFTMmYvR3h6djJDQndy?=
 =?utf-8?B?T1h5S0hQTkVTQWVVSSs0TFZSUUVzUXcwOUdicTFkWXVCYnhMYTdYb1NQTDQz?=
 =?utf-8?B?aVpyLzF1aFhycE92b3dmbjBvSng4VGZ2bjF6N3NleEZ2b1NHampTL1ZTYjdp?=
 =?utf-8?B?VGtaSWIwZzl4TGVXTkV3bDFFYjlJdnI5cGxFVkdIM1JNcG1kYmFWUkhtaGtO?=
 =?utf-8?B?cnJjNklESG9EYldQOGp2bEJxbFpFYkpocG5hY2pBQS9NUFRCZm1YNVNTTzNv?=
 =?utf-8?B?cm5QbUNPMmNldmltSitzV0VtSVF6N0xHRk5FRHVzNW9ONFRNeU1xRnp1dTZu?=
 =?utf-8?B?QjNPVE5rRXVJZkZCR3FKUWViMUxwVkd4Z0ZZeE12WDNxY3JkUlIwZDdML0tt?=
 =?utf-8?B?UWVYZGVJUGZsd1RXUzZ5R2h1T1RhTjdwUDJxSXJvSVFSYlJ0ZnQ0K0ZhTFQw?=
 =?utf-8?B?UGpSQlo5T1V0WmRrclZUMDROY0V5aThhaGIyN2VRMmhrdHptMVU0a3ovN2E5?=
 =?utf-8?B?U2NXSEsxT2kwRXVzVzZpSTE4OFhHTzEvN3RpY2lucndlR0FMMUhYYjhkendU?=
 =?utf-8?B?QjBIK1UwdzJHQ1FQQWV5U3A5OGlyRlJ2R3g3dzhUbnFIYmdpTEdtWGN3WVdF?=
 =?utf-8?B?TElJS3VJUksyakxyRHRxNW43Y0h0bmo4bEduUURQcmI1c0FIOEJ0L203MWtD?=
 =?utf-8?B?QngrZG9lNE1ESkNmT1M3ZzJoc2pKMTR3eU9VbDlMMFdPazllTk5LNXNDTmkz?=
 =?utf-8?B?SDlYNEJ5cnd3LzJjL3I0aHEyVUdqZ0lZbFdZSmZSSW1nSU4vK0RhQmczYVVx?=
 =?utf-8?B?ZENZOGdNUTFBYkh2QzFUdWNiTUl3bkFwK3hxZkNqM0llQ2o3TFdoRGxGNFNV?=
 =?utf-8?B?WVpOU1pzcm1ycUJMVlRncnIyU0FxTU9YOFB3cFB6akFWS0tYN2xjejJrTW1S?=
 =?utf-8?B?Q1VQZ0VYcXUzRGdpTjdGK2NSOEpIM0FWTWI0djZaeEwxck1SUFpVZlc3a1g5?=
 =?utf-8?B?RmtVWUFmOVhuZG1mb3JiQU1yNm9ZU2lrKzRvNE15NkhtWXQvdUZNOEJzV25w?=
 =?utf-8?B?eUN4ZkEzVmZPWm52UDFMWVhhZ1RyeTdWSjVEbmV5RDZrSjZQTHNwYXdXbStq?=
 =?utf-8?B?d2xGcTJHLy9wYlJSNWVHUUxOdkVFM2dqTTQ4Y3pubzFLblZMZTZUdzI5ek1E?=
 =?utf-8?B?TlJwTzcxMmlaanlZMXlLbEo0b0ROQkpraUJOSVFLc1dKeTF4U3lCWTJTN2Yz?=
 =?utf-8?B?ZnNGd0xLeGd2MUZsTXFRNCtsY3JicTJKZk14ZjR5RG81NGJ1Mk9sOXJJdXBP?=
 =?utf-8?B?OWEvQ1JQQmN6ay9TUy9KYTZDQVl4eGg3RlNNQjlMR0hRZlJyTHZqelJEY3Ew?=
 =?utf-8?B?MjVteCtST3laZXcraEpNdnA2UEMwMHhkMmg0RWdoUWxQWEpvY2NGMWd3RFhO?=
 =?utf-8?B?cGxWa3RiYUtHWVpCOWJxMjZpdURiWHI0NmNhOUFTVk9FcUhyd0RBT05OeWw3?=
 =?utf-8?B?Q3pyOGxwaitmbVUzNlU5TGIxcTF6TE9vclRNeW9iVkhBNW5QOURsdi93OEFt?=
 =?utf-8?B?cDVIaXlPa2d2dUZ0aThjWU44M0xNeHVKU1Y3cnprODkxN2lZczNmL3dqSXJC?=
 =?utf-8?B?aUNwdXhqUDBYaU9jNnpNbnZEa3h5UllzT3hYLzdKTlhxRklPbDdoZ1A2aUlC?=
 =?utf-8?B?ckxkY0RtMm9XdUE5VnVBZ2M1UmVmbnhDd1dMOUpOekprWHJOUmlJRnZwanBx?=
 =?utf-8?B?cmpRYTBlbmEyMWVHUHd4WUJJeVJ6ajVOQVp6dGZGdnZuWk83Z1ZMd0ppcW9l?=
 =?utf-8?B?V0RuT2Y3Wk9BPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:50:13.6400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc7bb58-6eb9-4c72-2cbd-08ddea8c397c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9220

From: Victor Lira <victorm.lira@amd.com>

Filtering jobs using the selected jobs regex is missing for
qemu-export/yocto- jobs when running regular pipelines and eclair jobs
when running scheduled pipelines.

Add the missing rules to filter out those jobs, and set a default value
for the selected jobs regex to remove the need to always check if the
variable is empty.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
example of the problem:
  - https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2018353899
  - SELECTED_JOBS_ONLY=/alpine-3.18-gcc$/ should produce 1 job only
note:
  - I tested only on sstabellini but the logic should work for hardware/staging
    too
---
Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
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
index d507210067..1f58e13cb2 100644
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
@@ -126,6 +125,8 @@ eclair-ARM64:
   rules:
     - if: $CI_PIPELINE_SOURCE != "schedule"
       when: never
+    - if: $CI_JOB_NAME !~ $SELECTED_JOBS_ONLY
+      when: never
     - !reference [.eclair-analysis, rules]

 eclair-x86_64:on-schedule:
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ab5211f77e..b2f96c1fe0 100644
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
2.50.GIT

