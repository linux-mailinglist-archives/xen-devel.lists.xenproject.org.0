Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DD76947DD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494553.764661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZir-0002At-3R; Mon, 13 Feb 2023 14:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494553.764661; Mon, 13 Feb 2023 14:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZiq-00028G-Tj; Mon, 13 Feb 2023 14:22:24 +0000
Received: by outflank-mailman (input) for mailman id 494553;
 Mon, 13 Feb 2023 14:22:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfrU=6J=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRZio-0001q4-GA
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:22:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d395d298-aba9-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 15:22:20 +0100 (CET)
Received: from DM6PR18CA0026.namprd18.prod.outlook.com (2603:10b6:5:15b::39)
 by DM6PR12MB4499.namprd12.prod.outlook.com (2603:10b6:5:2ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 14:22:17 +0000
Received: from DS1PEPF0000B074.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::cd) by DM6PR18CA0026.outlook.office365.com
 (2603:10b6:5:15b::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Mon, 13 Feb 2023 14:22:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B074.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.8 via Frontend Transport; Mon, 13 Feb 2023 14:22:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 08:22:17 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 08:22:16 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 13 Feb 2023 08:22:16 -0600
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
X-Inumbo-ID: d395d298-aba9-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lo9Wo3H21L8T3wnNJpzA46dqgk/I/Sb/E5pBcXiREJS2VSGk9aP4olix/L2fYa7HmwqzUqHESXBoU4A/wJP8EqvElhb61/TUmOyCguDNULw80kWe5YXBZKv3AX6TcQCkiLMNcaoNbPuHfFY3wZfyRxqsUKfdS2mWVm6pAZTL7Oc8b+Is92ovLr2xFqBFYVAt6Ka9O/0GtBP4I5rCDkEGHk/IyoAOTuHilyHd9s/JzySo/DHrnIazioLZMb+IfvtICE1bcKasM2PSOzv3T06XYnxMz9jUi92E9HhmpmNomJHbo7nz4Bb0lDVfiSS9fJzdnpaekPi/O/lKKGMp8hxkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waugRkicvl3llDUPWXOfeZQsUfMsP5ZBgCPpOe6boXo=;
 b=XAxkk3K80QSvDyxsIU18vahl7zgLmuUcO62L9R5EufxTEND/sbEowDTRFFuYHdAsLx/1YL1MtoyXEAspWbTrz3qsFjMZnOZ8WPKv+NtS6Xnw3UzSn3TUMNU7zpNyVgpR5+5GT9Dd/3CGo21K8so3DlT8loTYfL1SE3u4Zgo0hzhvg19hx40H7j/w0WPRu66ps1Atm54UddLxibEYiCJa9wtE5JVWeO//I2d8Tf7Nc/zy0kMSxcrFMwmjDgwzh2NqWVtxztsHACqf0WxqnnT2TyIdEtzuh9IOIv/z3gxOod++Chx1faX0vaKKIRD84ZI3IbeqjxRXwMqHfsvYGuQz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waugRkicvl3llDUPWXOfeZQsUfMsP5ZBgCPpOe6boXo=;
 b=AWt4BYhiUknKbxcSnJED3+SXxLF7XR+tEDi0o+MVMNqxr3Lf7ywZTfHEF6gIHABm0aVdIGMzhx1xwaMX/vBOE5HOQF2QR19oKv/qiUrevIXRBSWExytGHGz9NCMrGbsk8VSPb665h/FDR25HDBTm1kMXkzjK5OAfzrt/yVoS5cg=
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
Subject: [PATCH 2/3] automation: Add a static memory allocation test on arm32
Date: Mon, 13 Feb 2023 15:22:09 +0100
Message-ID: <20230213142210.11728-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213142210.11728-1-michal.orzel@amd.com>
References: <20230213142210.11728-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B074:EE_|DM6PR12MB4499:EE_
X-MS-Office365-Filtering-Correlation-Id: 28bad0fd-48df-44fd-7af3-08db0dcdb5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Q9hxa5rxIsGvNkjAMu8/WbwRPzwSuW30gmpY8UCj/Zb66uQoGHdMiNXJyYNQIzUNyTyQdZnnpYko1o/Wg7VO70dID+NLQ68RUwTgHtLu1ViRu0PPrxW3dhAnWWyilguIKnx15nO/UM7xEcZMcfAnojdxPG1ZhnXp8ECuVmGaVbfHDoy2X34INIwY/55rxt5GNhvGoR9fE+9V5B+CJlhv9Hj3VukEoBSGcqmw2x/mACxf0HblA5UUMBCLquBEPSPDxmLC7JOsUG3/GKvuRdvJwoFFCFU1QpdT6j4265l5MPkrX75QKpwfETWLDTT2JIKRarST84tP6rSvQMnzj6eI885dctB8Tj5JBXYm3Xb07daKZyDHHCYj95DV/Hf0hj/BzCgO+39ouSHoYP3pRtXOY/b9XGMrC8QKnpnqgA2t5bN1KTJ4QLrJzfPNfh4iKTKaERnt3OT591So2GEE1EPzfHjzf4x7p1UFfwvlOZ2KpfFWryE2KR5xxe6raTvezQOY1mO5ygewqBlSxRTqED+QPaZcRrfHznUSDGZRqD3BNFSI2SMgSOwggCbMkej83adEk2H+jTtbcTsK+dnJZPRpXMdSZxVYGvTpQW7dO//NObS1MeBa2nsT4PGEtS10GZq/PEhZT+Z6GCopl399eKy8mib1cseQZ21oXblcbOUyX+GE2JB5PfKTwOi4pWMfib/WA1V9Mx3It7O2SisLGots2poMvL47u25GNb7NwxFgRIGGRevRUihpBMYhzmuAupi73GMkhVVNVsghHDqD++wHwoqMLmBD649ALrRsp+iM/w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199018)(36840700001)(46966006)(40470700004)(40460700003)(70206006)(70586007)(316002)(54906003)(5660300002)(8936002)(4326008)(6916009)(8676002)(41300700001)(6666004)(2616005)(478600001)(1076003)(26005)(186003)(47076005)(426003)(336012)(966005)(356005)(36756003)(40480700001)(82310400005)(86362001)(2906002)(36860700001)(44832011)(81166007)(82740400003)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:22:17.3972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bad0fd-48df-44fd-7af3-08db0dcdb5ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B074.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4499

Add a new test job qemu-smoke-dom0less-arm32-gcc-staticmem in debug
and non-debug variant that will execute qemu-smoke-dom0less-arm32.sh
script to test static memory allocation feature. The test case itself
is directly taken from dom0less arm64 testing.

Populate build jobs to compile Xen with config options necessary to
enable static memory feature. Populate test jobs passing "static-mem"
as a test variant. The test configures domU with a static memory region
(direct-mapped) and adds a check using /proc/iomem to determine the
memory region marked as "System RAM".

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/build.yaml               | 20 +++++++++++++++++++
 automation/gitlab-ci/test.yaml                | 16 +++++++++++++++
 .../scripts/qemu-smoke-dom0less-arm32.sh      | 17 ++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index a053c5c7325d..166182bc595f 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -565,6 +565,26 @@ debian-unstable-gcc-arm32-debug-randconfig:
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
+debian-unstable-gcc-arm32-staticmem:
+  extends: .gcc-arm32-cross-build
+  variables:
+    CONTAINER: debian:unstable-arm32-gcc
+    HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
+
+debian-unstable-gcc-arm32-debug-staticmem:
+  extends: .gcc-arm32-cross-build-debug
+  variables:
+    CONTAINER: debian:unstable-arm32-gcc
+    HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
+
 # Arm builds
 
 debian-unstable-gcc-arm64:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 84ab1fee50a4..c2bcc5d4d3e5 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -226,6 +226,22 @@ qemu-smoke-dom0less-arm32-gcc-debug:
     - *arm32-test-needs
     - debian-unstable-gcc-arm32-debug
 
+qemu-smoke-dom0less-arm32-gcc-staticmem:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32-staticmem
+
+qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32-debug-staticmem
+
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index c81529cbbfd0..f89ee8b6464a 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -17,6 +17,19 @@ echo \"${passed}\"
 "
 fi
 
+if [[ "${test_variant}" == "static-mem" ]]; then
+    # Memory range that is statically allocated to domU1
+    domu_base="0x50000000"
+    domu_size="0x20000000"
+    passed="${test_variant} test passed"
+    domU_check="
+mem_range=$(printf \"%08x-%08x\" ${domu_base} $(( ${domu_base} + ${domu_size} - 1 )))
+if grep -q -x \"\${mem_range} : System RAM\" /proc/iomem; then
+    echo \"${passed}\"
+fi
+"
+fi
+
 # domU rootfs
 mkdir rootfs
 cd rootfs
@@ -62,6 +75,10 @@ BOOT_CMD="bootm"
 UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > config
 
+if [[ "${test_variant}" == "static-mem" ]]; then
+    echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> config
+fi
+
 rm -rf imagebuilder
 git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
-- 
2.25.1


