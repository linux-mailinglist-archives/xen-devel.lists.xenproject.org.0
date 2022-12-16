Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C243364EC1E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 14:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464703.723185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6AnF-0007ql-B1; Fri, 16 Dec 2022 13:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464703.723185; Fri, 16 Dec 2022 13:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6AnF-0007nL-5x; Fri, 16 Dec 2022 13:30:29 +0000
Received: by outflank-mailman (input) for mailman id 464703;
 Fri, 16 Dec 2022 13:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PP9E=4O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p6AnD-0007go-SF
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 13:30:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccb17f61-7d45-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 14:30:26 +0100 (CET)
Received: from MW4P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::32)
 by DS0PR12MB8220.namprd12.prod.outlook.com (2603:10b6:8:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 13:30:23 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::84) by MW4P222CA0027.outlook.office365.com
 (2603:10b6:303:114::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 13:30:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 13:30:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 07:30:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 05:30:20 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 16 Dec 2022 07:30:20 -0600
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
X-Inumbo-ID: ccb17f61-7d45-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky5HVGVGmpqXttryjNfWL2mrFZSy7DJ4hnX5anR4ETG6Og/ydnxbLxAY5LF3cmZrB3wvaFIUD8pqB7F/V5LswUJgzyUvktUOWoacvVTF4E1mUydOqkfhgJTeUEukHNKv9otdv9eLa4973xMxT63x2KiPNxf6LSGjszy9NS2o0EWKJY86eXTmCBgZu1DoRBgCj6coJdp/+18DLwZRnULIM07eFaUgBmCaHFmx8z7s74IaJOijCc8MOdahRUAwCBpck40bWue55gZ0wiDu8vFWYmju6dx0sJdeWhRF4vnmiQ3aFWimBVYDeTHhbR/bLTGJ1gjdswx0cTGeF0twyr6QkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmEwVKVFHGB3eYR4WpZEJ4xQiKOmYLMi+3waBFqTc7g=;
 b=P439mvSm7YNYsfME+a0T0WQWQZtzutd/S4sC5VFLJSdXHgHoKkjqLCyTGSrNg9oJlPG6YVN09qLJq8g3aWtxVRcW9iIMdhWSThTa21u/M5RSlGM8vVa/Ojv/jzRhNUkJGCr4yQ3BLbssLoQb+7jXbwN2dyXlM2ZIfM9K819Onf9fuQbpHZJVvwW6tHd87ujM2K6c2SMCXWKO2sRLUfrY7wpcXLHCErYOpnEIpzr2jp5hWjVQGTV0A/cOdDERzFX79LmmB17HsuU6Cw+ktBSoYUuXrggVJlbasbZV2TBp0PwEFYQuXhKN2vjpbLXQySPZ/O3Ows46yyWdckLrQQfUQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmEwVKVFHGB3eYR4WpZEJ4xQiKOmYLMi+3waBFqTc7g=;
 b=J7GL34fVLV5DRmpZulTjgplPiFB9NceitEme9beOq0Nwy8LLt1dAcG+9cnzDzEM7o1m1an/CfUl+6k2krsCIiXSUJV3jcORwLT1cx8xdBGuBuIuexRBRAmFD7i0IvLxfKV6p21uHSsAnOo/ggkyPpYDbZOEWDn5QkbsFuic0yZM=
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
Subject: [PATCH v2 1/2] automation: Add support for using XTF for arm64 testing
Date: Fri, 16 Dec 2022 14:30:11 +0100
Message-ID: <20221216133012.19927-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216133012.19927-1-michal.orzel@amd.com>
References: <20221216133012.19927-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT045:EE_|DS0PR12MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 6260f1f3-ab13-40a8-3e85-08dadf69aef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hV6jDaNzFS1zM6W4RlhpIdMFQsGn9e1gP9E3Bn1ZBKZGcR9UD6y9PgfzU3e7rCxrtTtgrmPyA3AL0fnYufOI8YY3lsLWqO9mJTBtuhulku+qfRs5OnRMZGwSdQBdvDmj+cnyggFpjFd04jWJ9mdLgZD/YpEVfg773ER47hXRTtGGUPVecftz7bA//bqGPvAhHXJNDtytcetlOaZgdHDbVMFgMsQ9JWwXCetiixHTfO0oZtcDEeOSDwxhQ1SBkfXPllsboAJM7QHMzUAu5P9oRGYvFraRqhQnlNTptpC3rjrRmNgrVxf2a1wkiux2W6hkjGie9XFO/1hfn1zPVExnJEDb9+sdeyEv651uD6fTFKYA3H+6vObc7AqV2WdFqlhtq5It2GIGbdBKJNYXS5mQCgbkcFbedmi/pogzXdbDeBw1J1SQefQ6qBbTR0mA2nXM1Glk6WY3cNF7zC0gRQmxZuG/p+DLdin4qkWRBPZsiWFY8lYE33GJXocAodCmGGND80UvFVjGvjXRkVK0HyK2B+2EsbccyYEleqU4xIDG7oV2Y88mwGMI2PwtlpHpsZj7/x1KpdXf5q2y+55KrV8/hSN3D1vJ492xvxHgyIxDXTrCBjGwfxHS4LL+Ax6A2bO4maRdNPamtgfK+tL70Q7ukUPN8YeuXNXYVyAo4DsyEedQozQbfH9Fk5rUbetUoLq1TEIISeT8mLqNH6B+ILoYBpdZmmYZiL/rpQSpECz/kDm759iy1vb37WOD6n0dHMnAqaIwtrme2zht59FGqd11MhnvSdxzXeLOQoKLYJ8qCoaQBJEllicJ/xOugmGunzuO8ZzOPYFW8mOJMYKkfEqaOE6IDb4KeoDFshxsV6Gbi+8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(2616005)(82740400003)(1076003)(336012)(36860700001)(86362001)(47076005)(426003)(40480700001)(83380400001)(40460700003)(81166007)(356005)(36756003)(44832011)(316002)(41300700001)(2906002)(8936002)(70206006)(70586007)(4326008)(8676002)(5660300002)(54906003)(186003)(478600001)(26005)(6666004)(966005)(6916009)(21314003)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 13:30:22.4692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6260f1f3-ab13-40a8-3e85-08dadf69aef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8220

Introduce support for using XTF on Arm to perform low-level testing.
For the purpose of the CI testing, let's use the fork [1] from upstream
XTF with implemented support for arm64 (the upstream XTF only supports
x86).

Add a new script under automation/scripts to be used by the CI XTF test
jobs to perform the following tasks:
 - Compiling XTF,
 - Generating u-boot script using ImageBuilder,
 - Running Xen with XTF as domU in pure dom0less configuration using Qemu,
 - Checking test result.

The script takes the name of the XTF test to run as a first parameter.

[1] https://gitlab.com/xen-project/fusa/xtf.git (branch xtf-arm)

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - run XTF in pure dom0less configuration
---
 automation/scripts/qemu-xtf-dom0less-arm64.sh | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh

diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
new file mode 100755
index 000000000000..3ec9cf74e129
--- /dev/null
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -0,0 +1,68 @@
+#!/bin/bash
+
+set -ex
+
+# Name of the XTF test
+xtf_test=$1
+
+# Message returned by XTF in case of success
+passed="Test result: SUCCESS"
+
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./binaries/qemu-system-aarch64 \
+   -machine virtualization=true \
+   -cpu cortex-a57 -machine type=virt \
+   -m 2048 -smp 2 -display none \
+   -machine dumpdtb=binaries/virt-gicv2.dtb
+
+# XTF
+# Build a single XTF test passed as a first parameter to the script.
+# Build XTF with GICv2 support to match Qemu configuration and with SBSA UART
+# support, so that the test will use an emulated UART for printing messages.
+# This will allow us to run the test on both debug and non-debug Xen builds.
+rm -rf xtf
+git clone https://gitlab.com/xen-project/fusa/xtf.git -b xtf-arm
+make -C xtf TESTS=tests/${xtf_test} CONFIG_SBSA_UART=y CONFIG_GICV2=y -j$(nproc)
+cp xtf/tests/${xtf_test}/test-mmu64le-${xtf_test} binaries/xtf-test
+
+# ImageBuilder
+echo 'MEMORY_START="0x40000000"
+MEMORY_END="0xC0000000"
+
+XEN="xen"
+DEVICE_TREE="virt-gicv2.dtb"
+
+XEN_CMD="console=dtuart"
+
+DOMU_KERNEL[0]="xtf-test"
+DOMU_MEM[0]="128"
+
+NUM_DOMUS=1
+
+LOAD_CMD="tftpb"
+UBOOT_SOURCE="boot.source"
+UBOOT_SCRIPT="boot.scr"' > binaries/config
+
+rm -rf imagebuilder
+git clone https://gitlab.com/ViryaOS/imagebuilder
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
+
+# Run the test
+rm -f smoke.serial
+set +e
+echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
+timeout -k 1 120 \
+./binaries/qemu-system-aarch64 \
+    -machine virtualization=true \
+    -cpu cortex-a57 -machine type=virt \
+    -m 2048 -monitor none -serial stdio \
+    -smp 2 \
+    -no-reboot \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=binaries \
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
+
+set -e
+(grep -q "${passed}" smoke.serial) || exit 1
+exit 0
-- 
2.25.1


