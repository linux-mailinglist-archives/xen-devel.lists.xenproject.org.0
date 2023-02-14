Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1377696841
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 16:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495213.765498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOT-0001ad-Qr; Tue, 14 Feb 2023 15:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495213.765498; Tue, 14 Feb 2023 15:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOT-0001XE-Ns; Tue, 14 Feb 2023 15:38:57 +0000
Received: by outflank-mailman (input) for mailman id 495213;
 Tue, 14 Feb 2023 15:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRxOR-0001Wn-H1
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 15:38:55 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af75abb3-ac7d-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 16:38:54 +0100 (CET)
Received: from BN8PR07CA0020.namprd07.prod.outlook.com (2603:10b6:408:ac::33)
 by PH7PR12MB7844.namprd12.prod.outlook.com (2603:10b6:510:27b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 15:38:50 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::3a) by BN8PR07CA0020.outlook.office365.com
 (2603:10b6:408:ac::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26 via Frontend
 Transport; Tue, 14 Feb 2023 15:38:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.26 via Frontend Transport; Tue, 14 Feb 2023 15:38:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 09:38:49 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 14 Feb 2023 09:38:48 -0600
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
X-Inumbo-ID: af75abb3-ac7d-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l76iyEkYIughuGzCdunfHXJJDhYmt9tTpraRDyFf5LbzYUY/SJZI1CHz4aeDBthRZNhv8dx4TMJwipE7OcSaeotw4sH+U3P9RFr7XF6QkvxOKH5sDkklbDILiLO12HI0IowsUMUh0I/E99x2RvBpl1CZBilVv/kSXLzXT0HjXNhIK9mdBcvuXfKq6lEQEKxiTNiuY856XIxV+8LAFNzMlMXncrUZbXFVW89iVKJIZE6YaqVymxpSPgKLZhgQpELDknx+aI0lTN8TcJqs7gDGjKEONGQpo7TbzmEGjWBT1rTmNk2rIPrcsnB+Iq5G0vJLliAwes2uh8bsW2kUDHU0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0EpUoqR8Ti6mMX8h1TX8yK7lQ2ly00UlOlPVf05D8M=;
 b=czo20orL9s8AmhbE3L5FxpS7UVgk0utDi8z3rbqWjdOMnfUj588cJrOC2LzqsmFe0pstcHGWsSilJFV7wPp7gEXflXZy2DWB9tzGhNx4QtL1UpCMg8gns6yzeZl1NAtoGlfPb4doK/76mEZdmpCy/U6zR2/HiyxkOSZ8bTQaQqBxrkhRoilz+jrqPwDJfUUcN1ZU6D3kzuIHbVmOvPTTN+PMU52H9UG8IrpeBAjXeBFkGF7UXfveBk6m2q649/fuzyD8V0uSL3cVEWFY0r0bvLBnYxDJIhR1MLzClk07dzpQCTMeQjIqcFCSEKGMniVukmf7V8r0cINDvFm8/XMB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0EpUoqR8Ti6mMX8h1TX8yK7lQ2ly00UlOlPVf05D8M=;
 b=AcxtLSPSg+WzlrhYkiwSTxzJPIjZReHAzDdciY8sl8skDH7fXdLQ9qno7xkrDrQCUeC8FTM6V1E8h8yHqSPGXHGHerZ6b4Tcj5bExgsiuzil0YjSzapWkdtUQ7F7polm2DDz/HIoUlLt/4mAp0GPdyCZw6NXbrm3clQiCKLn26E=
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
Subject: [PATCH v2 3/5] automation: Add a static memory allocation test on arm32
Date: Tue, 14 Feb 2023 16:38:40 +0100
Message-ID: <20230214153842.15637-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214153842.15637-1-michal.orzel@amd.com>
References: <20230214153842.15637-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT016:EE_|PH7PR12MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: a850e441-3bab-4253-0c6d-08db0ea191c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tAI1zthRDMO5RkWh29zxkBPijJagfdHvAcwxWx5N0EyRJmEs9bN32OB2oMswlzp5qWpdx7rjO1SE4gUpYJLc5N1Boh3EUTxgaWYWVv9posXW/6aPPgLfzq8t7acl3WBrixe36ikxNx6nfdbJ60vufY1mkvTBIbKxN4ZwuniU/WqYkVuSBzasnJQOvoc8uf2lB+D9zXsKQ/K4yP5ADizja/aMtrB+EDlEuLemdaYSaE7iYvscdHgp3tRnxzHtyUQEqhc/F+jYqK4jrDLald1QHOBUJRf8V6mUOcyEY+sFRZflHEKiKF9jB9lBGeepSAs/s+gauMxtTogjT8eNP7FtWknqhzM5d24wjEia1zSpuk4tsZztc+gv9/P1qITsHFc213QWU2ZVbV+BRXJWtIhi3q8SRKUdj9VNcnVGAEdURg3lAnBkEJLBOhzAKayhWmyBJX6jyXsj5JxpVdWKEjvARWY8N3DyPJww6EywOuczEfJsDTiNZ0nKW1nZEZn/v+HxqijREIbu7rS4r464MZxvydZbHkQgfZJ6b74ZBOuNSS2tevYlQMg5VgPltg1dp93hzu3yglP6wtF2L7wVGyhkyuCG8UTWAvlT1/+rJsxPL0KRDNat3SmHY1RNgh6crQxovFAjyIBMrHI0xqlRlaNO8TQmkJN7/uCm1X9vUGSorVByGJAAnxdR9yH67v2olZWLBHW0P3aQbnW5H6MznBxsFxJpW+x+uDKLK+vCWX5Aui9JmKi4OtTH+3os/EtmZCID
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(82310400005)(40460700003)(478600001)(966005)(6666004)(26005)(2616005)(40480700001)(1076003)(41300700001)(186003)(6916009)(70206006)(356005)(8676002)(70586007)(4326008)(316002)(8936002)(82740400003)(86362001)(47076005)(81166007)(83380400001)(426003)(36756003)(36860700001)(54906003)(5660300002)(44832011)(2906002)(336012)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 15:38:50.0616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a850e441-3bab-4253-0c6d-08db0ea191c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7844

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
Changes in v2:
 - take into account new container for arm32 cross builds
 - drop Rb as a result of code changes
---
 automation/gitlab-ci/build.yaml               | 20 +++++++++++++++++++
 automation/gitlab-ci/test.yaml                | 16 +++++++++++++++
 .../scripts/qemu-smoke-dom0less-arm32.sh      | 17 ++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f8e156e0a994..079e9b73f659 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -565,6 +565,26 @@ debian-unstable-gcc-arm32-debug-randconfig:
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
+debian-unstable-gcc-arm32-staticmem:
+  extends: .gcc-arm32-cross-build
+  variables:
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
+
+debian-unstable-gcc-arm32-debug-staticmem:
+  extends: .gcc-arm32-cross-build-debug
+  variables:
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
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
index e3f2b28f3f89..bd89a3f8b45e 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -20,6 +20,19 @@ echo \"${passed}\"
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
 # dom0/domU rootfs
 # We are using the same rootfs for dom0 and domU. The only difference is
 # that for the former, we set explictly rdinit to /bin/sh, whereas for the
@@ -72,6 +85,10 @@ BOOT_CMD="bootm"
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


