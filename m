Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E521A5B187C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402996.644976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkD-0006tE-UD; Thu, 08 Sep 2022 09:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402996.644976; Thu, 08 Sep 2022 09:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkD-0006qG-PV; Thu, 08 Sep 2022 09:22:45 +0000
Received: by outflank-mailman (input) for mailman id 402996;
 Thu, 08 Sep 2022 09:22:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VI1a=ZL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oWDkC-00062t-MS
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:22:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cac4280c-2f57-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 11:22:43 +0200 (CEST)
Received: from MW4PR03CA0343.namprd03.prod.outlook.com (2603:10b6:303:dc::18)
 by DS0PR12MB7679.namprd12.prod.outlook.com (2603:10b6:8:134::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 09:22:40 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::eb) by MW4PR03CA0343.outlook.office365.com
 (2603:10b6:303:dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17 via Frontend
 Transport; Thu, 8 Sep 2022 09:22:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 09:22:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 04:22:39 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 8 Sep 2022 04:22:38 -0500
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
X-Inumbo-ID: cac4280c-2f57-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlxrDuuxlsysefRUm10G1uLEigfCDRc7H0kWIm3gC5c790A5mhnUCpET7UwSqdhdmenscxPeZSSTuj7bELnxTS552YQSsLEn2CNizm7Fn0HfEzncPrxBNXKM4OcmFqklHM1xTIS0XVQUDnEALr++o3TPJ0vHdrEN6BVy7TVd7rOUDr+JuIGuJC65uTvO6gkzwkGwcQivut8faVTGwqwttNwaas+hcCDu6IqS+2X23BX5oceR3Ugt3Brt/CqG0cvC7Fa/yiw3JC6SCQIaAz5k3fzsTuwC/9bJnoN7zRMS+Or7/7IM6GRCjxwnFcTPJW2hyvO+2HaAbN4qPKiwpwcTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/RWuT6WWjwt9nx2ahhlPfQEA0lD6Hh30SG14hqOTvI=;
 b=UNjxZe2DoC6G2ImPYoFSJF8QfkODX6+3vVNbc2rCaqZT23PKzTadRhQ88T1iaE41q7S6S+yOzFBdOD359MTQl0/OwOTwyXTTW9E6CuJ63dAcyXYCyBjgTiOu9j78sLWwyQNxHA4HNch8yAcSa7z4LpHuIMMc9VTrjpwh61LGNF/G5I6T1jsl5cVfWoANttbDXr1vfFdZ876x2d//DBICai6qIFchRhZHffR9wwwN7aaLPpmAYm5SYTxbt/dG/oJimiztYYTMNv/mVQsQT0mA5952V04z87KtKnOM7vo1059ZYALv+NZmc0woFX3sDChTbNqUJE41bIVYQKA8y+QM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/RWuT6WWjwt9nx2ahhlPfQEA0lD6Hh30SG14hqOTvI=;
 b=s2+Nm3rpAWGRAvGLa1msdTPDOSjGQJp4EququafMLpONtePkArdsdPg1W7D4bpplTO5llMNJ925QEw0HizCwNiNNr7fUpBabgPCjGCVyEBrHO6XMSVgCTTbS20GXxdZyXaYuXP4vwewOCeHXsNxdbHq3w+CoVD3CXYs+rK63wEU=
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
Subject: [for-4.17 v2 3/3] automation: Add a new job for testing boot time cpupools on arm64
Date: Thu, 8 Sep 2022 11:22:30 +0200
Message-ID: <20220908092230.21421-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908092230.21421-1-michal.orzel@amd.com>
References: <20220908092230.21421-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT064:EE_|DS0PR12MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cb52e7-1e79-48fe-7450-08da917bad95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xbJBGhi4WGsBxoxWU1sGB77/b7fURX5gCEqpN58THn8zSjcV4dIgBwyPnNVzzMBdEjZCBD9IVQw4elUXsramhbioyaqKQNH+4uHOhULDx2LiaAtILU7GkqsjKW/GTLEv9xs7GSxL1MPafHQZbqqTjmvjClfxDX69MMULY4eLdCU3wBJEpajNRdwHGdPj+8dIftl0NiXlZNm3m2yU4tmSAtxQJp3Kw2/FgoNyKkkem0MDsebSNejil3jfp3J++Y9kUg20cxDdSBHBJ+/Bcg0EuRm6Xzd8/zACokOafkA2Sx2snzHXAcsn6ObFZynZYwLymNdpgw7JREjBLQ88Ir8bphrmo+xw9BA6Y2xbx/3AXncRrraf1U4rLsll6dNMON3iOl+omM2VT/twdAX1sewGiUvajJAMeZC1Mhr4LQHZItOqNLnx+Ztmw4p2YT4ccfiuNj4OKICzKEx9cHLW4QaY5XYohc9xHYI7ugBBGLc4Ew7gn2d3EnRWf5wFsPMJIEWK4F5YHynQfTf286WTow6JSLp7BGXfleSQw/l66LnAfLbOVEeosNXvsX8bMOc/i1xqYSCkhksCHXHiCEQBpZok0KhZ+G+J+lmAjm9YeiRQrMTmPFb5blqKSanEKbt2HuOsIGTc8s1ykDPetOf+WyLKoeppMqw3/7tOi9venutwYmiHOu1Ja9BRhVrvjqqdlKj3ZgZuj/zayVpd8XrfH057YJbnGxrw94HslOU7J+cEsZm37/A285NHsYYjFLj/5aGuPfJVyKrFd1xeF9ISlSagjPJ+gZjjyb1jKhQ+C/ISjpjb2FzC+rAwx7DPg3hYL9uyUY0gdGEuu+oauEGjjkE5jnALRcLkJuezSTdidVVurKABpgXj9o4RW0ERmMKLrg7HsEZgFJYPsuKkHR5fvXT7GUjULqrazHb+vn8clOFSpck=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(40470700004)(36840700001)(316002)(83380400001)(8676002)(70206006)(4326008)(41300700001)(6666004)(6916009)(54906003)(82310400005)(2616005)(86362001)(36756003)(1076003)(336012)(426003)(186003)(26005)(70586007)(47076005)(8936002)(81166007)(44832011)(5660300002)(356005)(2906002)(36860700001)(40480700001)(478600001)(966005)(82740400003)(40460700003)(157313001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:22:40.3104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cb52e7-1e79-48fe-7450-08da917bad95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7679

Add a new test job qemu-smoke-arm64-gcc-boot-cpupools that will execute
script qemu-smoke-arm64.sh to test boot time cpupools feature.
Enable CONFIG_BOOT_TIME_CPUPOOLS for the arm64 build and add a new test
case in qemu-smoke-arm64.sh that if selected will make use of the
ImageBuilder feature to create cpupool with cpu@1, null scheduler and
assign it to domU. Add a check in dom0 xen.start to see if domU is
assigned a Pool-1 with null scheduler.

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
Changes in v2:
- use ImageBuilder feature to create boot-time cpupools
- also check if the scheduler is set up properly
---
 automation/gitlab-ci/test.yaml         | 19 ++++++++++++++
 automation/scripts/build               |  3 ++-
 automation/scripts/qemu-smoke-arm64.sh | 36 +++++++++++++++++++-------
 3 files changed, 48 insertions(+), 10 deletions(-)

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
index 7ac96027760d..f803835779f4 100755
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
@@ -26,6 +28,16 @@ fi
 "
 fi
 
+if [[ "${test_variant}" == "boot-cpupools" ]]; then
+    # Check if domU0 (id=1) is assigned to Pool-1 with null scheduler
+    passed="${test_variant} test passed"
+    dom0_check="
+if xl list -c 1 | grep -q Pool-1 && xl cpupool-list Pool-1 | grep -q Pool-1; then
+    echo ${passed}
+fi
+"
+fi
+
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
 apt-get -qy install --no-install-recommends u-boot-qemu \
@@ -42,11 +54,9 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
    -cpu cortex-a57 -machine type=virt \
    -m 1024 -smp 2 -display none \
    -machine dumpdtb=binaries/virt-gicv2.dtb
-# XXX disable pl061 to avoid Linux crash
-dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
-sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv2.dts > binaries/virt-gicv2-edited.dts
-dtc -I dts -O dtb binaries/virt-gicv2-edited.dts > binaries/virt-gicv2.dtb
 
+# XXX disable pl061 to avoid Linux crash
+fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
 
 # Busybox
 mkdir -p initrd
@@ -66,7 +76,7 @@ echo "#!/bin/sh
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
 mount -t devtmpfs devtmpfs /dev
-${check}
+${domU_check}
 /bin/sh" > initrd/init
 chmod +x initrd/init
 cd initrd
@@ -98,6 +108,7 @@ ifconfig xenbr0 up
 ifconfig xenbr0 192.168.0.1
 
 xl network-attach 1 type=vif
+${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
@@ -127,6 +138,13 @@ if [[ "${test_variant}" == "static-mem" ]]; then
     echo -e "\nDOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" >> binaries/config
 fi
 
+if [[ "${test_variant}" == "boot-cpupools" ]]; then
+    echo '
+CPUPOOL[0]="cpu@1 null"
+DOMU_CPUPOOL[0]=0
+NUM_CPUPOOLS=1' >> binaries/config
+fi
+
 rm -rf imagebuilder
 git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
@@ -148,5 +166,5 @@ timeout -k 1 240 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
 
 set -e
-(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
+(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
 exit 0
-- 
2.25.1


