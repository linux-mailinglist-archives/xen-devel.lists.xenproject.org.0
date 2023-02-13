Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87F26947E0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494552.764655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZiq-000281-Qo; Mon, 13 Feb 2023 14:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494552.764655; Mon, 13 Feb 2023 14:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZiq-00025L-L6; Mon, 13 Feb 2023 14:22:24 +0000
Received: by outflank-mailman (input) for mailman id 494552;
 Mon, 13 Feb 2023 14:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfrU=6J=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRZio-0001qA-JC
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:22:22 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2e44241-aba9-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:22:20 +0100 (CET)
Received: from DM6PR18CA0005.namprd18.prod.outlook.com (2603:10b6:5:15b::18)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 14:22:17 +0000
Received: from DS1PEPF0000B074.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::a5) by DM6PR18CA0005.outlook.office365.com
 (2603:10b6:5:15b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Mon, 13 Feb 2023 14:22:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B074.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.8 via Frontend Transport; Mon, 13 Feb 2023 14:22:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 08:22:15 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 08:22:15 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 13 Feb 2023 08:22:14 -0600
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
X-Inumbo-ID: d2e44241-aba9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za9sOhlK1aV8/O1w5WEMl5McvGlCMtsGYBNHMjglaAqg4XBJSyc/p434mziu7MNt7z/N2Wixj2Sg1bQoohJdzBcx53DAwKD57dvXkCQVFAjJVJCDdtm1LSledaMjDPy26qURCyy6Ub/TrGA2FfYspKNTERQFzoTbGqBynwPQbrL9MbDBFFAICKmyQ6lcrxL9QFzbZ85VSRvhy6anMA4f+O6eXObCp9EQuKM9+H1f/ZdcmQr4eNWMPH7OzHKMzTD/zN4XT35qe5yDd0rnjtWTjnGBU4bjsixXcczlyT6ki++r0YcNXwfr4obZtZi6sVeF782N05Ea+fl4oLMyuWCfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81CL0P2OA/C5m54ZrKuh3FvynThfH/tSzp4cZrsFugY=;
 b=ep+NlUdC1C11bJRQydg3E8dmjVh1GZZdtjS8EQQD37KHp/WDCnqScXPmDGZSvbYKiC6iTuJUlGyZtvE2JbU53B/LpqOzfQNVsM9GsZk706l7ptznRepi4bfWGd6p//uyGHGh9DngPf7DfEPPQkPg0DbxtUyj5EwrVGMwzhF5as3zurW9+cemIqtduDRYaLuydfxYxJgXLmI2bS8/Ylew1amfTgsym29mE3Dius1gWOc0iylxhGfWa+I12B2BDfhTzflI1PMnrbtRuF/xRiVB8odZQlEEevCfPQdLXyIj/1gd7DxGlJJ6gWor/u/zYXZPWXLDDE/+b2KnBhlFPYgptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81CL0P2OA/C5m54ZrKuh3FvynThfH/tSzp4cZrsFugY=;
 b=WC5RkWPJtE7ZujQcv9P/MmhblI7ZKqHgUueQe59jAeEe0hYtO9lf2SlJMj/b2Wbg2DXizeUEtlRh3k7xAKnfzOEN2DFAxSZ+CwTofm5q9s+K7hDJfOXLNXTL2z3hEXJmzS4x2pRKinebNNcN/4057hfI25i4JocXFzRtSpQziMY=
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
Subject: [PATCH 1/3] automation: Add arm32 dom0less testing
Date: Mon, 13 Feb 2023 15:22:08 +0100
Message-ID: <20230213142210.11728-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213142210.11728-1-michal.orzel@amd.com>
References: <20230213142210.11728-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B074:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: d69c58c7-c461-49fa-0eaa-08db0dcdb55c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ns0xZX/gmg5QYyG8jExSVHZ8HKV2FNx0vieMngn+mlZSo6Ctz0tcM08svt22VfCvCZvCce6gDVbwsGbSYeLQiytMcvUaVHmb/+CyuiHRAklLuRuOBZb0o5Y27WjieCQ8/AuKpMl0vFWyoWGILyHcTjlYyVJWmSo+dUmrdjRTP7xUZLzt1WxbjcdQxWgPCq0EgfEkRheBsQC7A8l1ByUEwW4hgYl2ogZumdTU4sy7JgLWGjyCodh6mDUk3s9HDiJlYDYN0MrQ7PBOeQE1FZQX8td33BjVe2a2rC6ZPwVeqCExmwHxFUyDq7wh9EhMolI0c6HmtO4HQNku57E8wYtdn2cpKstt/i2ROEg4eylvwtBPARHZxVDXbK20jdn2PfsQNG+9SUMCS5966r3+TbKXFVffmwNx0PhopwgBsXy/DoevL77rWwMGvAzXYSeLnDUpN9GJQMnm9kDZ0Gp2w2EAUwJLjJenXw6QJTzA3rzeynRlEaxwszOyYeSPWfCvRvV4/8sdIwivj2Q4Y+KSkCKQPUuZD3zS+YGq3GyHjrqQOs40cXoAaivEq5FgRYGEEivsFoVkOe1zPGXMD+gb3rT/p3HR1GdiVXDJICEoTlPbMSIBTo0EP4A9EuEidQ6pycQWQuId4EJzZrYs4s9wV8wRQ002UbHJVxV9YIQwU9JhTcFGBAaUbs3b4za22s4BUgMiU/Mf2iI1lvjcgrQhHA0YEnuPq1QUGc/GKdW/hZ0AJICfvn7IyY3N46mOf95sDyBwbqVYVe9F75m+aFH3wDzTsUpujKAl/xWdsWh2wuUXYOkAQvkSaomdU3GJskqdA2RB5H0//SnBSFvbKPll8qlbsnp5gyXwVfJ0CSS8/2kIvnLtFSDpw0eQkZRFEEvvoRk
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199018)(40470700004)(36840700001)(46966006)(26005)(186003)(316002)(1076003)(2616005)(478600001)(966005)(70206006)(70586007)(8676002)(6916009)(4326008)(54906003)(6666004)(336012)(8936002)(426003)(44832011)(47076005)(41300700001)(5660300002)(83380400001)(356005)(40460700003)(2906002)(36860700001)(82740400003)(81166007)(36756003)(40480700001)(82310400005)(86362001)(21314003)(32563001)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:22:16.4441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d69c58c7-c461-49fa-0eaa-08db0dcdb55c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B074.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164

At the moment, we only perform a single arm32 test in our CI, checking
whether dom0 boots successfully or not. This is mostly because we do not
have any arm32 runners and we only execute a hypervisor only build.

In order not to leave the arm32 testing in such a poor state, add a
script qemu-smoke-dom0less-arm32.sh to start testing true dom0less
configuration, in which case we do not need a dom0 with a toolstack.

The script is mostly based on the one used for dom0 arm32 testing as well
as the one used for dom0less arm64 testing. We obtain Debian Bullseye
kernel and Alpine Linux busybox-based rootfs. Depending on the test
variant, we prepare a test case contained within domU_check variable,
that will be executed as part of /init script.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/test.yaml                | 16 ++++
 .../scripts/qemu-smoke-dom0less-arm32.sh      | 89 +++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-dom0less-arm32.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ce543ef5c0ef..84ab1fee50a4 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -210,6 +210,22 @@ qemu-smoke-dom0-arm32-gcc-debug:
     - *arm32-test-needs
     - debian-unstable-gcc-arm32-debug
 
+qemu-smoke-dom0less-arm32-gcc:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32
+
+qemu-smoke-dom0less-arm32-gcc-debug:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32-debug
+
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
new file mode 100755
index 000000000000..c81529cbbfd0
--- /dev/null
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -0,0 +1,89 @@
+#!/bin/bash
+
+set -ex
+
+test_variant=$1
+
+cd binaries
+# Use the kernel from Debian
+curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+# Use a tiny initrd based on busybox from Alpine Linux
+curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
+
+if [ -z "${test_variant}" ]; then
+    passed="generic test passed"
+    domU_check="
+echo \"${passed}\"
+"
+fi
+
+# domU rootfs
+mkdir rootfs
+cd rootfs
+tar xvzf ../initrd.tar.gz
+echo "#!/bin/sh
+
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devtmpfs devtmpfs /dev
+${domU_check}
+/bin/sh" > init
+chmod +x init
+find . | cpio -H newc -o | gzip > ../initrd.gz
+cd ..
+
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./qemu-system-arm \
+    -machine virt \
+    -machine virtualization=true \
+    -smp 4 \
+    -m 1024 \
+    -serial stdio \
+    -monitor none \
+    -display none \
+    -machine dumpdtb=virt.dtb
+
+# ImageBuilder
+echo 'MEMORY_START="0x40000000"
+MEMORY_END="0x80000000"
+
+DEVICE_TREE="virt.dtb"
+XEN="xen"
+XEN_CMD="console=dtuart bootscrub=0"
+
+DOMU_KERNEL[0]="vmlinuz"
+DOMU_RAMDISK[0]="initrd.gz"
+DOMU_MEM[0]="512"
+NUM_DOMUS=1
+
+LOAD_CMD="tftpb"
+BOOT_CMD="bootm"
+UBOOT_SOURCE="boot.source"
+UBOOT_SCRIPT="boot.scr"' > config
+
+rm -rf imagebuilder
+git clone https://gitlab.com/ViryaOS/imagebuilder
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
+
+# Run the test
+rm -f smoke.serial
+set +e
+echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
+timeout -k 1 240 \
+./qemu-system-arm \
+    -machine virt \
+    -machine virtualization=true \
+    -smp 4 \
+    -m 1024 \
+    -serial stdio \
+    -monitor none \
+    -display none \
+    -no-reboot \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=./ \
+    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
+
+set -e
+(grep -q "${passed}" smoke.serial) || exit 1
+exit 0
-- 
2.25.1


