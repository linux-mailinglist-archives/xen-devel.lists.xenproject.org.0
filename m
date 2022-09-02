Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D365AA88A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 09:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397376.637961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0o8-0001Bm-29; Fri, 02 Sep 2022 07:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397376.637961; Fri, 02 Sep 2022 07:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0o7-00019Q-UA; Fri, 02 Sep 2022 07:09:39 +0000
Received: by outflank-mailman (input) for mailman id 397376;
 Fri, 02 Sep 2022 07:09:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zTqM=ZF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oU0o6-0000Eo-6y
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 07:09:38 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3381c2e2-2a8e-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 09:09:37 +0200 (CEST)
Received: from DM6PR06CA0053.namprd06.prod.outlook.com (2603:10b6:5:54::30) by
 SJ1PR12MB6171.namprd12.prod.outlook.com (2603:10b6:a03:45a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Fri, 2 Sep
 2022 07:09:33 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::5d) by DM6PR06CA0053.outlook.office365.com
 (2603:10b6:5:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 07:09:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 07:09:32 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 2 Sep
 2022 02:09:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 2 Sep
 2022 00:09:31 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 2 Sep 2022 02:09:30 -0500
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
X-Inumbo-ID: 3381c2e2-2a8e-11ed-82f2-63bd783d45fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEpajqYunuTuHH/ySIE2/PshNvOgkgl2CC5k/2kj7ozgpkCLI3en23NO3TsG7nSxkM9eISxyDVaiMV5z41sxLgEOY+RPdYTWshXonKz/sLX5K8A4STRvHAyqh9YhcPN7SXS0Hyv55mZqicwzZsPLVKDbspF6+w8R5XqEUQulA/PdkXZtS0JZmMM/mmCKB7wviY/hRsqNE6wEbflP08Jj2BKx68aRU9yfg2VwrYG6qKvF9t8HKxmGgM12GWaul38iT9GZHWz5svvKZKP1Lg/TgUdMg85nKlkyZVgDyYf3ax1WFYdnf1IVMobYFDZa56pA5cD5cEnAdYoXGFxr22Mkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IybsSOGdqqAMIU/Bv0RNIgzKeODkE+cebiqQFF3IGf8=;
 b=BWCODGR7KRNE4ChXGSRyk96gyt6sOv3ma0aR/aq7S/m1Zw1qO6+GQSsVYVITDyXSIjldTxeKHh6fidxkz+HNNsPm4uOMGmDGoWGPJMCGc8hqLnofRsxEWAHIzW+pqgR+7hRddKp7VFa3152MPnL5gPEg+OS+HrO9lcQAe/Uxb9quHS6neS8VzH7IEfQjQswb6/G7KlwNBtpkCn2qJDmOoRLA0bALoFNuN8HsbdV/pAYNrQPNRRzGrMkQnyQceeAxp3ed142duoRFBYpoQ2yU9k34HMqWFYc7cznmoGNjcg1W7xkb9k0RYXbFZawZRE6BV8wpsLq/uVXxpP7z7g8cMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IybsSOGdqqAMIU/Bv0RNIgzKeODkE+cebiqQFF3IGf8=;
 b=hziqKBudyZVSMl2Oz06ne7JFP0PxqCIKq/C4t0btzjsNpNkiTgIQra5Do0WHMY3kjBJzJAKJwvqVyMM17y4Upo6WeLvHXoduDBmgEfqKuLUQ96BvoPXuu4Tn9AJCWPOia/FmFkhjn4se6Nt1e/84IhixlP1SR8eJSoIDaZdxDpY=
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
Subject: [for-4.17 3/3] automation: Add a new job for testing boot time cpupools on arm64
Date: Fri, 2 Sep 2022 09:09:05 +0200
Message-ID: <20220902070905.1262-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902070905.1262-1-michal.orzel@amd.com>
References: <20220902070905.1262-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef7c0f33-387c-4fb1-de35-08da8cb215fc
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6171:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZiZmBQOBAePezmI1Cdv7/SUoJNm/ZpQeUqiAnAGXz6Y6rP4tMZy8nsNfyOL+Rgh2QY0qnykmmV6qNX3TMSfSTlATvfD/N+nhVeBj6Euye4w8N37DHJEXGBit8H9jdBHfsjeyvKvlP2giT8N8xt7TXs/a2KrXC+hVlmqS4o2HW2AsPv5LqHopsRZkieQs46VOkMh1Jq7VXF2parN+pjzJlU3tPPiyrYG+7kwInoDULW3uyb26xni3FA9F5PFmg5ai3AJS27sAclbSA686aGSI0Bi/p7fnlrgTkAa5x74dHFQj6hfvsQ0JRThlzVwwHpGL6hafQfK5WZM7L4bKBclJN/ymrWEzvfo0SCd+FG/3P20qE3CPOL10UBE+HbwiVm1LO/YzY0dpHBOaKfH0y19ynqzEaxHTYE7wqMKQkTg81u68+XOc/PT4bbYrS1j0mYupJbjecFNiVwzZOVOJVB/0oN6nv+7ZW6wBOGzi/IcI4kArBWiZ0+vu96qbMYPUqaTSxr1aOq2zWVp+qFDCDhhrorzk6srGyNORFYI2BnWrg+8k4932KzZlt5Wh/fjIRbWM1vLmw5xWR97C/K4nWQTkRwEmyYFxy97ky8ya0h209zUlFuQDEafpCSNPwlr1Vua7VWWpVY17fVoJEw7mtq2iEC+1xabQuVPtif4wpZLZ6KOG/9/fPbHY29bTCwgknwsjMpPsDEc23xQZogZcfqS1xqUB0qsZcdQ0QgT0uTNXuud8coVPxs1n4ChJPEeMUvUv/PNovI5rzhxk+x+tDbs9hi/ZW9AILz0dsHRqg2JyfKVfiQ0NFmfD9jec4nEvn7ONZhypcSTivCLmAWi9Qn8SzZW/NPFC9FaaSUfAJLf+nn8y7dUyb/q1lRZqWuuLpXJu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(40470700004)(46966006)(36840700001)(8936002)(54906003)(70586007)(8676002)(966005)(70206006)(316002)(4326008)(6916009)(86362001)(478600001)(81166007)(41300700001)(36756003)(356005)(5660300002)(82310400005)(2616005)(44832011)(26005)(82740400003)(2906002)(6666004)(1076003)(36860700001)(40460700003)(40480700001)(83380400001)(426003)(336012)(47076005)(186003)(157313001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 07:09:32.6213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7c0f33-387c-4fb1-de35-08da8cb215fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6171

Add a new test job qemu-smoke-arm64-gcc-boot-cpupools that will execute
script qemu-smoke-arm64.sh to test boot time cpupools feature.
Enable CONFIG_BOOT_TIME_CPUPOOLS for the arm64 build and add a new test
case in qemu-smoke-arm64.sh that if selected will:
 - create a device tree cpupool node with cpu@1
 - assign created cpupool to domU0
 - add a check in dom0 xen.start to see if domU is assigned a Pool-1

Take the opportunity to refactor the qemu-smoke-arm64.sh script as
follows:
 - use domU_check to store the test's commands to be run from domU
 - use dom0_check to store the test's commands to be run from dom0
 - use fdtput instead of sed to perform dtb modifications
 - use more meaningful messages for "passed" variable. This way we can
   grep for messages reported either by domU or dom0 and get rid of
   assumption that tests can only be run from domU

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/test.yaml         | 19 +++++++++++++++
 automation/scripts/build               |  3 ++-
 automation/scripts/qemu-smoke-arm64.sh | 33 +++++++++++++++++++-------
 3 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 07209820b474..d899b3bdbf7a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -100,6 +100,25 @@ qemu-smoke-arm64-gcc-staticmem:
   tags:
     - arm64
 
+qemu-smoke-arm64-gcc-boot-cpupools:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
+  needs:
+    - alpine-3.12-gcc-arm64
+    - alpine-3.12-arm64-rootfs-export
+    - kernel-5.19-arm64-export
+    - qemu-system-aarch64-6.0.0-arm64-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+
 qemu-smoke-arm32-gcc:
   extends: .test-jobs-common
   variables:
diff --git a/automation/scripts/build b/automation/scripts/build
index 2b9f2d2b541a..2f15ab3198e6 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -19,7 +19,8 @@ else
         echo "
 CONFIG_EXPERT=y
 CONFIG_UNSUPPORTED=y
-CONFIG_STATIC_MEMORY=y" > xen/.config
+CONFIG_STATIC_MEMORY=y
+CONFIG_BOOT_TIME_CPUPOOLS=y" > xen/.config
         make -j$(nproc) -C xen olddefconfig
     else
         make -j$(nproc) -C xen defconfig
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 7ac96027760d..c2184850293c 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -4,20 +4,22 @@ set -ex
 
 test_variant=$1
 
-passed="passed"
-check="
+if [ -z "${test_variant}" ]; then
+    passed="ping test passed"
+    domU_check="
 until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
     sleep 30
 done
 echo \"${passed}\"
 "
+fi
 
 if [[ "${test_variant}" == "static-mem" ]]; then
     # Memory range that is statically allocated to DOM1
     domu_base="50000000"
     domu_size="10000000"
     passed="${test_variant} test passed"
-    check="
+    domU_check="
 current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
 expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
 if [[ \"\${expected}\" == \"\${current}\" ]]; then
@@ -42,11 +44,23 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
    -cpu cortex-a57 -machine type=virt \
    -m 1024 -smp 2 -display none \
    -machine dumpdtb=binaries/virt-gicv2.dtb
-# XXX disable pl061 to avoid Linux crash
-dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
-sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv2.dts > binaries/virt-gicv2-edited.dts
-dtc -I dts -O dtb binaries/virt-gicv2-edited.dts > binaries/virt-gicv2.dtb
 
+# XXX disable pl061 to avoid Linux crash
+fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
+
+if [[ "${test_variant}" == "boot-cpupools" ]]; then
+    # Create cpupool node and assign it to domU0
+    cpu_phandle="$(fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle)"
+    cpupool_phandle="0xffffff"
+    fdtput binaries/virt-gicv2.dtb -p -t s /chosen/cpupool compatible xen,cpupool
+    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool cpupool-cpus $cpu_phandle
+    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool phandle $cpupool_phandle
+    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/domU0 domain-cpupool $cpupool_phandle
+
+    # Check if domU0 (id=1) is assigned to Pool-1
+    passed="${test_variant} test passed"
+    dom0_check="if xl list -c 1 | grep -q Pool-1; then echo ${passed}; fi"
+fi
 
 # Busybox
 mkdir -p initrd
@@ -66,7 +80,7 @@ echo "#!/bin/sh
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
 mount -t devtmpfs devtmpfs /dev
-${check}
+${domU_check}
 /bin/sh" > initrd/init
 chmod +x initrd/init
 cd initrd
@@ -98,6 +112,7 @@ ifconfig xenbr0 up
 ifconfig xenbr0 192.168.0.1
 
 xl network-attach 1 type=vif
+${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
@@ -148,5 +163,5 @@ timeout -k 1 240 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
 
 set -e
-(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
+(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
 exit 0
-- 
2.25.1


