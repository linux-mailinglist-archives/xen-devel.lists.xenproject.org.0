Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1AB9A2AA4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820988.1234764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9d-00005O-Ri; Thu, 17 Oct 2024 17:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820988.1234764; Thu, 17 Oct 2024 17:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9d-0008T3-Mm; Thu, 17 Oct 2024 17:19:17 +0000
Received: by outflank-mailman (input) for mailman id 820988;
 Thu, 17 Oct 2024 17:19:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7jd=RN=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t1U9c-0007JO-Ki
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:19:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2414::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeea65ec-8cab-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:19:14 +0200 (CEST)
Received: from CH0PR04CA0087.namprd04.prod.outlook.com (2603:10b6:610:74::32)
 by DS0PR12MB7897.namprd12.prod.outlook.com (2603:10b6:8:146::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Thu, 17 Oct
 2024 17:19:09 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::8d) by CH0PR04CA0087.outlook.office365.com
 (2603:10b6:610:74::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19 via Frontend
 Transport; Thu, 17 Oct 2024 17:19:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 17:19:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 12:19:06 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 12:19:06 -0500
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
X-Inumbo-ID: eeea65ec-8cab-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSQwTVDn3dJDpvs1vHDnvGmFXyMMIaqkl/ljZMUhyUAVjKoEG3ak2QUg9zmsza2Eo6aJki8Pqd9Y07+Gemg+Wr84rRCItmciCQJZ+LIHvveg53xocSW0gYU5U/RmxqVatBKNr8guJGoOi/WqSD35UEX2zP6ZmaSiOP74d2ummAnjMsCDk5zMYUUYm0I1S1Edow9EK/PZW/t2Lm/VzDvhCFLGR36TY8kHGfKVXWVz8cR1is/MlbHVNOYLu+L4INA7COlvFxJBXfn4pHeGPqKOY5nhQx+A+8T2ZXacTKYC6YyQvavD1nna+uXB6TRQ9ZatdaMDfyo/uQ0J8pzyGIMf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gy3iCM2Pj8XFgiDVlyvkp+6fDd0KZqSJ0q+Uj82o+6g=;
 b=Vrvri066MB3HFwGUKJZHbalJUuygx6jPNjFCi+iOAlz7Yr0Z2AIqvlSxzCT0y35s4I6QRiIXxuq7vXShtdtRAAtbQ12sWXX74deHGieo83JCCU3sJUJMC1RxB84+KT0DciGw9m2fFJiCU4vu/OBFF9BkHN2xC5gD/YCHVvnC53eJ7e3GRO+wwXobz6S4a5Sgwi3GcmrOJ5ZWi6CkdRg58bGe/39EUVDpLrNn9vpr5Icy8J7FKl2X4V59QnnFUbfqTiEd/S0wtmBmX8sYftY8OJ90t9YQUbB3Az5ATe8o+UtEi3HX8Pxb0BxzoMJzSHx2dyluh0y3k+TWxap9tlJagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gy3iCM2Pj8XFgiDVlyvkp+6fDd0KZqSJ0q+Uj82o+6g=;
 b=YUfZ6jH385NEPZ24RHyCP7+nzntyhsZda3O/DzwC/WLD/QnVx5nVcotb+B+PeH50tEuyCHbaNW7B0jNWV1ATldvmB8Ex3QqcO7UGEd/piE9soh1QVIaic0KcaLfo3yYezFkKY7FxgbAR/0fWP90iomIW/saBSJKSGp+Hcn7DziU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 3/3] automation: add x86_64 test (linux argo)
Date: Thu, 17 Oct 2024 10:18:28 -0700
Message-ID: <59ac55effa57b2046576b01bd4bc279369735e05.1729183051.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1729183051.git.victorm.lira@amd.com>
References: <cover.1729183051.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DS0PR12MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6129b2-dfa9-4fcd-b2cb-08dceecfd021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e2njL6VdiYCxtDQvHgBGTNieKhkt/EIlru23Oo5/+DWQCdaspL7Pae6UVAhI?=
 =?us-ascii?Q?n3Vxe2LjVznj+5Sd1mhnCbbaMgpfDi860WySEsIxthElNVuhvfsUI8PRqrD0?=
 =?us-ascii?Q?nSsTXKHpyaD/pE7/LdMMH44h+USZTNqh5xyBInlxkzgpGGpUNhlq+0X7RmkJ?=
 =?us-ascii?Q?euEXrPGIuhE9wHONFllW7Ko3ocrPP61MYf59I8YrsBexxe7iJW/5UoJECMQU?=
 =?us-ascii?Q?a+h2NV8KPdlswven6lPjrmHV3I16OnowWCbNUztvbuont3x7Zb8ZiEgywXEp?=
 =?us-ascii?Q?NAG8feXk5fInHOPcKHSOKjG1DTRswR89zd7PIP1JzpHY8gUC4A5SZeC6vAAr?=
 =?us-ascii?Q?z1M0wQtGcfSAdZxvwP6tWzePElAs37Lhj2/O59fFyR24wxEhInHu9BaiNQoa?=
 =?us-ascii?Q?yu5s635a3dkvljJd1Swzi76AgQLiYu8p5BB4dg2VOk+kdANQZjvoVDM7FtSJ?=
 =?us-ascii?Q?qkhPkGBFIhIGn4NrlmOFmvdxNkNBYkypzujmDVspjbn2NlXK+CkTM7D/xsR+?=
 =?us-ascii?Q?7PcA2eHFN1oM2x+95c/exN1umCEGDZD+3918JtJGdQfTDNiEMhYgcA4Hmzzb?=
 =?us-ascii?Q?CCpfFU3VjdrC4Eps3bLWvYBhKJAYUPbObyMBayhUpUBhVmpOQubi6uFmAtjK?=
 =?us-ascii?Q?f2TaK7dHYoZQx9PDhIgjGuW5ybzaL3hIQY/kRgZsStNWnBFY14gd1vZ6Ztc8?=
 =?us-ascii?Q?x9DGm6t0rTkht9M8X0RIsbWArkH0S2KCeBiAtlm6hYkG1eH05s4xqDqhIcvA?=
 =?us-ascii?Q?B7B3g5rNnshUJzAAcnTJDP0QOEdTDHYbu/7cLx7KQ5YLIX16Xvo982q/PuYh?=
 =?us-ascii?Q?pgqPPKTLEXJDJZeqqMS0P15cIgEcJ4e0EHwEnDw13DKS8/RMp8HH6v96NnU5?=
 =?us-ascii?Q?CTZO1Bob6ULwQgLEdC72AERYku4hf6XTA1D6sCyAkZG2fHn7zHfnxmIChrzq?=
 =?us-ascii?Q?MbQ5SXW7Hz1uwiVR8YmToFttaayuUYd8qsMMimsVZOGxEHu2skJy9sr+sRxd?=
 =?us-ascii?Q?LWYavTB52ECnP5pUaPM7mF64GLLWe2+OKhLKH61eqfcLuBFUwwjwHFDzejfq?=
 =?us-ascii?Q?zOzRH8k5OUgNufaz+PysrXKNu4OWoHNMPmVYaq3iBZLalTxOZa4T1+J9IaS4?=
 =?us-ascii?Q?C18p9rEFHsNR0L0gvNmIYJL70vhkmFTRE27BEMZH9YySK+5K0ZfCciJZga8v?=
 =?us-ascii?Q?KbyePkhhQ30xGaaYMikhrsWJwXtYK6wPhr3VCRmytZbkvgoREt3dGIIoAe4W?=
 =?us-ascii?Q?jUzPCE1LWwM0cJjX2GtRsH4bUIth0ZVii2mR/2pfGt1hyCXqifb76vIDb1oV?=
 =?us-ascii?Q?mT0gNG16FakIwOopZHrHucOaeyJvBSs3U6tKLWXuqEVGuDTn2XylLYMqhlD5?=
 =?us-ascii?Q?b9nlfak=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 17:19:09.6340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6129b2-dfa9-4fcd-b2cb-08dceecfd021
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7897

From: Victor Lira <victorm.lira@amd.com>

Add x86_64 hardware test that creates a Xen Argo communication
connection between two PVH domains. In the test, dom0 creates a domU and
listens for messages sent by the domU through Argo.

To accomplish this, add Xen build jobs to export Linux and argo artifacts,
and build Xen with CONFIG_ARGO=y.

Update the xilinx x86_64 test script to support the new test, and add
"sync_console" to command line to avoid an issue with console messages
being lost.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 automation/gitlab-ci/build.yaml               | 34 +++++++++
 automation/gitlab-ci/test.yaml                | 10 +++
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 76 +++++++++++++------
 3 files changed, 95 insertions(+), 25 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c2db69ecf8..827759fb7b 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -326,6 +326,30 @@ kernel-6.1.19-export:
   tags:
     - x86_64

+kernel-6.6.56-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.6.56
+  script:
+    - mkdir binaries && cp /bzImage binaries/bzImage
+  artifacts:
+    paths:
+      - binaries/bzImage
+  tags:
+    - x86_64
+
+argo-6.6.56-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/argo:6.6.56
+  script:
+    - mkdir binaries && cp -ar /artifacts/* binaries
+  artifacts:
+    paths:
+      - binaries/xen-argo.ko
+      - binaries/lib/
+      - binaries/argo-exec
+  tags:
+    - x86_64
+
 # Jobs below this line

 # Build jobs needed for tests
@@ -341,6 +365,16 @@ alpine-3.18-gcc-debug:
     CONTAINER: alpine:3.18
     BUILD_QEMU_XEN: y

+alpine-3.18-gcc-debug-argo:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: alpine:3.18
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_ARGO=y
+    BUILD_QEMU_XEN: n
+
 debian-bookworm-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index b27c2be174..849860627d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -192,6 +192,16 @@ xilinx-smoke-dom0-x86_64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug

+xilinx-smoke-dom0-x86_64-gcc-debug-argo:
+  extends: .xilinx-x86_64
+  script:
+    - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh argo 2>&1 | tee ${LOGFILE}
+  needs:
+    - alpine-3.18-gcc-debug-argo
+    - kernel-6.6.56-export
+    - alpine-3.18-rootfs-export
+    - argo-6.6.56-export
+
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
   script:
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 7027f083ba..f70cfdc155 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -9,6 +9,8 @@ fatal() {
     exit 1
 }

+WORKDIR="${PWD}"
+
 # Test parameter defaults.
 TEST="$1"
 PASS_MSG="Test passed: ${TEST}"
@@ -24,9 +26,10 @@ kernel = "/boot/vmlinuz"
 ramdisk = "/boot/initrd-domU"
 extra = "root=/dev/ram0 console=hvc0"
 memory = 512
-vif = [ "bridge=xenbr0", ]
-disk = [ ]
 '
+DOMU_CFG_EXTRA=""
+copy_domU_files () { :; }
+copy_dom0_files () { :; }

 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
@@ -39,6 +42,14 @@ done
 echo \"${DOMU_MSG}\"
 "
     DOM0_CMD="
+brctl addbr xenbr0
+brctl addif xenbr0 eth0
+ifconfig eth0 up
+ifconfig xenbr0 up
+ifconfig xenbr0 192.168.0.1
+# get domU console content into test log
+tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
+xl create /etc/xen/domU.cfg
 set +x
 until grep -q \"${DOMU_MSG}\" /var/log/xen/console/guest-domU.log; do
     sleep 1
@@ -46,6 +57,34 @@ done
 set -x
 echo \"${PASS_MSG}\"
 "
+    DOMU_CFG_EXTRA='
+vif = [ "bridge=xenbr0", ]
+disk = [ ]
+'
+elif [ "${TEST}" = "argo" ]
+then
+    PASS_MSG="TEST: Message from DOMU"
+    XEN_CMD_EXTRA="argo=1,mac-permissive=1"
+    DOMU_CMD="
+insmod /root/xen-argo.ko
+until false
+do
+  echo \"${PASS_MSG}\"
+  sleep 1
+done | argo-exec -p 28333 -d 0 -- /bin/echo
+"
+    DOM0_CMD="
+insmod /root/xen-argo.ko
+xl create /etc/xen/domU.cfg
+argo-exec -l -p 28333 -- /bin/echo
+"
+copy_dom0_files ()
+{
+    cp "${WORKDIR}/binaries/xen-argo.ko" "root/"
+    cp -ar "${WORKDIR}/binaries/lib/"* "usr/local/lib/"
+    cp "${WORKDIR}/binaries/argo-exec" "usr/local/bin/"
+}
+copy_domU_files () { copy_dom0_files; }
 else
     fatal "Unknown test: ${TEST}"
 fi
@@ -54,18 +93,18 @@ fi
 mkdir -p rootfs
 cd rootfs
 tar xzf ../binaries/initrd.tar.gz
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
+mkdir proc run srv sys
 rm var/run
 echo "#!/bin/sh
-
+set -x
+export LD_LIBRARY_PATH=/usr/local/lib
+PATH=/usr/local/bin:/usr/local/sbin:\$PATH
 ${DOMU_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
 sed -i -e 's/^Welcome/domU \0/' etc/issue
+copy_domU_files
 find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
@@ -74,37 +113,24 @@ rm -rf rootfs
 mkdir -p rootfs
 cd rootfs
 tar xzf ../binaries/initrd.tar.gz
-mkdir boot
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
+mkdir boot proc run srv sys
 rm var/run
 cp -ar ../binaries/dist/install/* .
 echo "#!/bin/bash
-
+set -x
 export LD_LIBRARY_PATH=/usr/local/lib
 bash /etc/init.d/xencommons start
-
-brctl addbr xenbr0
-brctl addif xenbr0 eth0
-ifconfig eth0 up
-ifconfig xenbr0 up
-ifconfig xenbr0 192.168.0.1
-
-# get domU console content into test log
-tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
-xl create /etc/xen/domU.cfg
 ${DOM0_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "${DOMU_CFG}" > etc/xen/domU.cfg
+echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
 echo "rc_verbose=yes" >> etc/rc.conf
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
 cp ../binaries/bzImage boot/vmlinuz
 cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+copy_dom0_files
 find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
 cd ..

@@ -116,7 +142,7 @@ cp -f binaries/bzImage ${TFTP}/${TEST_BOARD}/vmlinuz
 cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/${TEST_BOARD}/initrd-dom0
 echo "
 net_default_server=10.0.6.1
-multiboot2 (tftp)/${TEST_BOARD}/xen ${XEN_CMDLINE}
+multiboot2 (tftp)/${TEST_BOARD}/xen ${XEN_CMDLINE} sync_console
 module2 (tftp)/${TEST_BOARD}/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 (tftp)/${TEST_BOARD}/initrd-dom0
 boot
--
2.25.1


