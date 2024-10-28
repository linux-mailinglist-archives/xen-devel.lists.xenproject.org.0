Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB94A9B3EB9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 00:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827022.1241501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Zal-0002vH-SJ; Mon, 28 Oct 2024 23:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827022.1241501; Mon, 28 Oct 2024 23:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Zal-0002se-PW; Mon, 28 Oct 2024 23:56:11 +0000
Received: by outflank-mailman (input) for mailman id 827022;
 Mon, 28 Oct 2024 23:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VaPr=RY=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t5Zak-0002sY-PU
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 23:56:10 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2417::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 333546a1-9588-11ef-a0c2-8be0dac302b0;
 Tue, 29 Oct 2024 00:56:09 +0100 (CET)
Received: from MW4PR03CA0292.namprd03.prod.outlook.com (2603:10b6:303:b5::27)
 by SA0PR12MB7074.namprd12.prod.outlook.com (2603:10b6:806:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 23:56:04 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::e0) by MW4PR03CA0292.outlook.office365.com
 (2603:10b6:303:b5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Mon, 28 Oct 2024 23:56:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 23:56:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 18:56:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 18:56:03 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Oct 2024 18:56:02 -0500
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
X-Inumbo-ID: 333546a1-9588-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWn0rpK3uan6G38113i16Rq710G/9BfZ1BM2i4Wzqi8rGjrEm/nVo58jKEHoBFaeFnKm6fHsmoA/SnINPI/ZCCAowfkMH0yDQfytaYzE00CxTRLJpA0QMf+C0Dx+ScMs4Fba+A54uzKJXLqNWQvNxW1ltjkxTFuVlhGfLElaS19U4TPlaROuprKTUcnRhb1vNnjbRM36VjEOhLiRAzGhg+2TtOCfsxwrYMD2yiR1lJwijrRxEzcxNyxDsd0eQF/F8NyM90fcdCjGCAUpPDIscCPRTqEp7CNg4A2ZOVMs4svyRgkWXwGBDiY0LHiq1PsFo7q2QVwcPOnCRMhh3ekQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+DL/Wrrq0G4yiAtlFhrGdcqSDgNOASsVVEneJ3JSYA=;
 b=c7r38SCcE1BrnvPHele64avKab1xkjCj0plYSNqDqq52V3tlgZ7Yq8lbiqo1+F46Qu2K0Fq1udnF9hNZZyZrOI24y+NmqoWx+2RNvFn4LK+aIEse/iBXFXAEPrUnF46QyGVMjNsURxrQ0oG3HRCnQOvuD02eFuA94Teg3sny8gRTXSaEZ8mjw3Utm8VcznF0rOP5wTXx9wB2MqNN5Qs050mDf32sGxo0dHLvr86Q9ldLtiEn/3GU6OdjsovkyqRCUJ3QwjgAiGsrn10BsjojpG/YsyAf8vMSqFbYlpn0hDNNL87D66UjtMENRN5q8G1xP3eP2SlgjIlOp5MlIq8CDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+DL/Wrrq0G4yiAtlFhrGdcqSDgNOASsVVEneJ3JSYA=;
 b=BcwfuvR1cVaWEmN968+4xe1AVI8F6+RfkoPzx8ml6sA5ThjL7Ng5WI/ChtwXfSoCWUpHYp5KR4CqkllMHf+BH7jjJq+8DChYhISA5IBPW21Ey8/LOPNYaRvDnJejgtNctVIH0bKrSr8q+pdZKGX2fXBGDJ+8w5psSaGSNa82AbA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v3] automation: add x86_64 test (linux argo)
Date: Mon, 28 Oct 2024 16:55:35 -0700
Message-ID: <d477c784381a5bee7a81cdb596eed7dab353ac5c.1730158540.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <43ef31aa-15d6-434f-82e6-dc88c2e89309@amd.com>
References: <43ef31aa-15d6-434f-82e6-dc88c2e89309@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|SA0PR12MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff981ab-be8f-4433-e93f-08dcf7ac1548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w3AoCniB8v9Tdi7o2CDhyLCeghFYRDopwVUXTZcG0gfgh+FvM6j9loezOSuX?=
 =?us-ascii?Q?/J1MFyIDWE9hbJO3fPpN84BS0TxUiOhWP6YtFRPgSMLnPzqN4ZRNJyrFJrmN?=
 =?us-ascii?Q?6j4jxVg7S2aN25xY/uuIfrc0l6hIErRnvlM0tl+wJxq3aNvmrbB/9u6i3pGX?=
 =?us-ascii?Q?5kCHopy5Q7UKeYWRZNR5wMF8jKVYlu95TqnW+jv6PsrHXFcabXy5sjhJS58w?=
 =?us-ascii?Q?chQbAcuLQEz5frhFAsqlN/v1P77ZBZZjGDONOL6rpzeNbyZ6FvriZxNZZl6n?=
 =?us-ascii?Q?UTWyBnVpBDtwBYMntXXhkxj6AZHF2rFhV0nU8OTYp4PUvxE0paOlHwbpIfDA?=
 =?us-ascii?Q?n2RZ/ERDbrC1A9mtO91pmGwPDvIF1uqsR9gKA/WDQs4I7dWz43B47bw/06QO?=
 =?us-ascii?Q?4qpVumZGa0xtuwrkL3qDUn1yiKdJOrh9ORy47sbF+VigRt05WZTR+hUsbRkm?=
 =?us-ascii?Q?ynykm1mlwYEJ8fwunMSWRgNrUZ6llCWsX12JRL7bKVzGZQudIn0tn2DwBxJ3?=
 =?us-ascii?Q?Zospa266/wJzIBcrDRfCqHpVh4D6PUkgwJG7yQDnGn2kTMIg47A5WLCyKWQL?=
 =?us-ascii?Q?k6JPcWe1QXhYjfmPYa04+7Fnq7zfcA9hkx4ax+BXHBRuz6Tzq07aN1UJSbB6?=
 =?us-ascii?Q?YZGQdkIGvStJVO8+rfm2dmaCw8IRippVdZm3gdsO3Hpr9xZ/9fTDcQLP8+kB?=
 =?us-ascii?Q?BuYpmj9TKrZoUoOrljJME2GtiS2XUaGrOJYq81/ooXWyFEoYyelse5lzYq/u?=
 =?us-ascii?Q?kAou5JyNq+sG+4bI2VO9aAM3OEPBVuuz9qiAd2u7PypeuYOLhxMTTsggeiQa?=
 =?us-ascii?Q?XM67g/MicJ767q+ScfoQ+in5fvM71J0lsYggkmdTHR7XRqCFOxmoO6Qp1DWh?=
 =?us-ascii?Q?CoDvSVV0vf3Re3aAj8QQUPM9xmn+XXwaaOkg1zo8Ef3Z47Z3DmJJF1uh1Eko?=
 =?us-ascii?Q?BZu5ncfB8vgBrUs5ePk5eqRlBp4JzSKc3Th3Ue01MnfXBDhCPVeupOYO+6iv?=
 =?us-ascii?Q?WtdpgstJc6eLoNXBIAVVKQUhTqtklsmnEOgj6jfRlc5f+JKG9TchxumGXkme?=
 =?us-ascii?Q?+XNMBO046xUcjLxGSzDphM5CCoIw1PDw6Ri+zniDq9oD4IdpN7qzldjDzXiE?=
 =?us-ascii?Q?Y7Ia7fH96juthNqX/B71xMw5bSYIeiiDjKB2GbgiYyok/6bZDjlxUCRq9g5t?=
 =?us-ascii?Q?1CWB8Ywpg7dWS7TCGTCGlKaiuLlxJ3u8olvew9BWqsgjZYu/+6JLhcisMx9V?=
 =?us-ascii?Q?Dc/Y+QaaRA3678WpcIHz8JPyitQztNMtE7Okj8dO89pX62xTVr6yK3lyiW3/?=
 =?us-ascii?Q?ejHJhlfepnrUGlg3JQkH756vEBfqoEsg0tbm0Jrx2YWfk5zKakuYPPpwuU4n?=
 =?us-ascii?Q?cVWWhByg8ueX0M7LakgImnaB26+Cimfj1hoJZoed9UQ2Fjgt9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 23:56:04.1740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff981ab-be8f-4433-e93f-08dcf7ac1548
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7074

From: Victor Lira <victorm.lira@amd.com>

Add x86_64 hardware test that creates a Xen Argo communication
connection between two PVH domains. In the test, dom0 creates a domU and
listens for messages sent by the domU through Argo.

To accomplish this, build Xen with CONFIG_ARGO=y and create a CI test job.

Update the xilinx x86_64 test script to support the new test, and add
"sync_console" to command line to avoid an issue with console messages
being lost.

Requested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Changes v2:
- update test job to use binaries from "test-artifacts" repository
- add argo config to existing alpine build instead of separate job
Changes v3:
- add back CONFIG_UNSUPPORTED=y
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 automation/gitlab-ci/build.yaml               |  4 +
 automation/gitlab-ci/test.yaml                | 16 ++++
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 76 +++++++++++++------
 3 files changed, 71 insertions(+), 25 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 09dd9e6ccb..af2b1ceba3 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -340,6 +340,10 @@ alpine-3.18-gcc-debug:
   variables:
     CONTAINER: alpine:3.18
     BUILD_QEMU_XEN: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_ARGO=y

 debian-bookworm-gcc-debug:
   extends: .gcc-x86-64-build-debug
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index e76a37bef3..e8f57e87bd 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -192,6 +192,22 @@ xilinx-smoke-dom0-x86_64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug

+xilinx-smoke-dom0-x86_64-gcc-debug-argo:
+  extends: .xilinx-x86_64
+  script:
+    - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh argo 2>&1 | tee ${LOGFILE}
+  needs:
+    - alpine-3.18-gcc-debug
+    - project: xen-project/hardware/test-artifacts
+      job: x86_64-kernel-linux-6.6.56
+      ref: master
+    - project: xen-project/hardware/test-artifacts
+      job: x86_64-rootfs-alpine-3.18
+      ref: master
+    - project: xen-project/hardware/test-artifacts
+      job: x86_64-argo-linux-6.6.56
+      ref: master
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

