Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566315EA259
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411645.654680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclwC-00058B-Ap; Mon, 26 Sep 2022 11:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411645.654680; Mon, 26 Sep 2022 11:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclwC-00054y-6H; Mon, 26 Sep 2022 11:06:12 +0000
Received: by outflank-mailman (input) for mailman id 411645;
 Mon, 26 Sep 2022 11:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oclwA-0004X6-BT
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:06:10 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 350254da-3d8b-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 13:06:02 +0200 (CEST)
Received: from BN9PR03CA0799.namprd03.prod.outlook.com (2603:10b6:408:13f::24)
 by PH7PR12MB7377.namprd12.prod.outlook.com (2603:10b6:510:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 11:05:59 +0000
Received: from BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::e2) by BN9PR03CA0799.outlook.office365.com
 (2603:10b6:408:13f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 11:05:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT088.mail.protection.outlook.com (10.13.177.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:05:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:05:25 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:05:24 -0500
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
X-Inumbo-ID: 350254da-3d8b-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mhdt0DPx2hVrLkrDlnl19Dq7u3wsevucKM2T+jLHpJa2L55mJDbGD30Hqo633oNzXufx2dJN01Q6duwtq5Kcg+9OepR3HX7oqcwlxYJBZicItPPykYuxmj3aRCPUKNLnvC3r3L93jLuMZ2KUxBO3noxIC1ggGu9RwyvHii+v2KwmpwFcLZk938Il9qe1GvavmxkMPM1Se3mnFJk0fFEKCj3yydJkWcUW4b915kehr3oGYwl80I6+OUW1DKJYXk+u4rJyLcFSuoX6sXL7WNQyr/AdpGTcj9OozFji7mHevekBDbEE49diP1yZBDsoSNyTdyljV2rQr4IhjbUKevGf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBbxrf3OGmi5kmC0blOEMBhohXAO6yhvPt8yeU+u8o8=;
 b=UDRBGs4un3+jZGoOAU95l2CsUh60EEyWLYIO1NavgQp7d1ZUmahtO43VROax0i6KCJbZncQsjAARJjeF3UaLRbk29eeBigXGqnAPUAkHth5qH+8nIKhxNMbV291/0g8RT7+TTvCqUCqF0sAe5YL3v/TOutR5Z7NryEeMFghf4Q9iAMmTwWI1CIll3YlhjMgvqSPpSmXuYRM1po3GZt03GQ1V8OHeNipR4rWqAMvGR6LIDVew/f+StGne/uSC8rAPR+U8TimDydSkG/67gWLfx6l71WGIJKEMN4gFGOwpLCifLatqQv406GqcT6pTB/MmVowfOLRMRQiKmk7Q8IjnOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBbxrf3OGmi5kmC0blOEMBhohXAO6yhvPt8yeU+u8o8=;
 b=QXuX+5GQW5ECPBXeE+ToUaNEKJ2pBKwiyEuH8YLdNf5YS1jpafMhxN5fG8TLOH1z4iefb1YmGP0TWMwraDSLd9SbYCmSFNnSBM1Te00Vs7zPFaMYVBcQA6mhTKlVi7rnjZhK5mABGSIILC5szyf9IKhLHsQczR1jmQztU2JeAOo=
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
Subject: [PATCH v2 08/10] automation: Rename qemu-smoke-arm64.sh to qemu-smoke-dom0less-arm64.sh
Date: Mon, 26 Sep 2022 13:04:21 +0200
Message-ID: <20220926110423.26030-9-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT088:EE_|PH7PR12MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: ba530dc5-3b39-4828-6c06-08da9faf17b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ndkkxzio2O8LjIqyPX7dWnja58+0qv1QpG9UgG/EFJwhhHu5fdUgKdHCIGwo9N9oL1/hyPLBzBcdMUFizbbx2MQNTCrubtjM+Qwq6VVmsOSy6GSeM25HTQC0HqBXhsuvXT1dvHAQXreWJDwfSQht5zNUnOP/oxUNTfcO8UR9V4QOH0cN2CyLqjXSOL81ch4JyEKxFmY/cnjRVVjxdqa3osXyomJu+lNhsZ1fX3vqZCXw7sF54bv0UB9S+yjro1+Dgc0gPs44ZZnSkW2VbmHgDNtzJEzsUiDpHRbdnzlXHkxQRtBLupguGvSS/gOdNbJC/Rs5gmAXSMTj96WABOQ0XFAyub7dFP664CJeEN+a2xRJaxQJVoUTPnj+kbCMVPF5HSLH5mxXdG6z35X483pKUalZ92np1UG4IdcC9kYgffK6BmbyiikJVo3aZpxprE7MNjgJpA8OIckBNP3mL8pwx8+dD0Cp7yQEgcX52F2hTU2XlzyqTAEQZFZkTDze1MHyE1eEdVtYcRDFU4Eo2nDz1I6isWQ4rCa7hi+VarTi0DfwN29PUEv9WxH/sEj5E7Nx7gmQYaXVLQMIvBXuCgLnHOrwce1p1A6K0I/wEFYpHj+0RJvap+pCv+8IxaGANFmlET7G/J5vtbp3MIDJn1nk5/A4YGNgYzMQuRqSqIK1T2YoM1WeHtoU004P/WeWCj8cvmkwmQvlIGZO+Nl09TDPlNGg1urO67jfbYtGE5nJOx1rWY+JqOIPY5Lta92AthlPHRtP+aDlAueExtZF/C4mYCjfwl+EeCKUgn+TUSSRfAtUvEWczPSub/NnNocx/SFi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(86362001)(81166007)(36756003)(356005)(36860700001)(2906002)(336012)(1076003)(186003)(5660300002)(26005)(40460700003)(82310400005)(40480700001)(44832011)(6666004)(41300700001)(478600001)(47076005)(83380400001)(426003)(2616005)(316002)(54906003)(6916009)(8676002)(4326008)(8936002)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:05:59.1842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba530dc5-3b39-4828-6c06-08da9faf17b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7377

Testing arm64 is done using the qemu-alpine-arm64.sh and
qemu-smoke-arm64.sh scripts. These scripts are executed with exactly
the same artifacts (container, rootfs, kernel, qemu) and the only
difference is that the former is used to perform dom0 based testing
and the latter - dom0less based testing.

Because the current naming is quite umbiguous, rename qemu-smoke-arm64.sh
script to qemu-smoke-dom0less-arm64.sh to reflect its usage.

qemu-alpine-arm64.sh will be renamed in the follow-up patch.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
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


