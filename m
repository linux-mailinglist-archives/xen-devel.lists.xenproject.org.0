Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFE99B3E4E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 00:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827001.1241472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5YrG-0003yw-Ui; Mon, 28 Oct 2024 23:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827001.1241472; Mon, 28 Oct 2024 23:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5YrG-0003wD-S4; Mon, 28 Oct 2024 23:09:10 +0000
Received: by outflank-mailman (input) for mailman id 827001;
 Mon, 28 Oct 2024 23:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VaPr=RY=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t5YrF-0003w7-Fk
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 23:09:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2416::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a135d0d0-9581-11ef-a0c2-8be0dac302b0;
 Tue, 29 Oct 2024 00:09:07 +0100 (CET)
Received: from BYAPR01CA0018.prod.exchangelabs.com (2603:10b6:a02:80::31) by
 DS0PR12MB8248.namprd12.prod.outlook.com (2603:10b6:8:f3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.25; Mon, 28 Oct 2024 23:09:00 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::67) by BYAPR01CA0018.outlook.office365.com
 (2603:10b6:a02:80::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Mon, 28 Oct 2024 23:08:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 23:08:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 18:08:58 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Oct 2024 18:08:57 -0500
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
X-Inumbo-ID: a135d0d0-9581-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WehzsIJYEUOYJdD3c6yJ4D0SkS8e9PXXkppolUdkK4niXC+2w7/4yt3zzYuE1cUpr63dMHDAJlWlaNU9YfIu1zEqW0OUR6p9UkPh9coPFWR9+xFGt6rPEhDvgBbvfT1lw4r/9BMRz+is4siFb60yobzC72jDPz6vrOzmGUFrIQqaxiz8Gbd9/RaPVjY19pe6AjXzbSvJVSPvSXJ2aHnQvjuOJZ1uLWhhfixfHIzehjaDK314wVy5C2XQ/CmzUGghwQB9txjYBELTmGerLWupQFe47St78ykn/c+FmrtUDsGTK8WTR+pydLw6nj45CgPb/grImddC9PvZgmLfDpGXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49iLJukz9UNxQWS01r9649PK6eWsAsYnFJWFukHNgAs=;
 b=iQLoVYsyqQSVbeil8I22fY+m+ozcZEFhOVpmfZdfOOoAwkfc5vTWtH7xGdgjejIXyHlS/l0mNMX3ZaEt5QSGK+gVk3jHWpepNkLz3/d46CC+qhWwbujrYaDab/cANwJnYBJCIH/laUwk0hPOutV3UNXbRuWVOhWX2dQyJ0TyzCp9pHflzrv+sw56R0148OdyrID64xOYPqcOJPF5YHV0IrCTqFOXQVxQyeJqESpJ13+30V+Jazv6iSQElFCVOdVKQeWVuKV0o82UFP6v3yerUWMSDokrc/9zqRdEQSMh96TIBjJP4MwGBNgHpSkxoM0Ba3yZzyKhxqaCelZsuCmUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49iLJukz9UNxQWS01r9649PK6eWsAsYnFJWFukHNgAs=;
 b=NhL3r0VmiU+6Soieiaw5vnrLu1qUezPOhmQNG2NPor1jZM3tWxJ40XooUUKe1nJQo9fDV9HdaS5y+Tz8r2cMSIKPPiRnZkV3zaQ8Ll7W7R+Nvmw7ZI939cGzK77UAuJZjgnkSvYO67E8VE2STeQFeBZSc8swNVk020Qg8fzI2LE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2] automation: add x86_64 test (linux argo)
Date: Mon, 28 Oct 2024 16:08:19 -0700
Message-ID: <379776d8c059d457a3be03e7701f24dc4f8bda81.1730155685.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|DS0PR12MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a1ebe3-8f85-4eae-5246-08dcf7a58125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5isV4vx8MEHxhjAyyWZRfkDCdey/4BF0jBkOoRkyp2dJeFyjw4BvYm4j3BFS?=
 =?us-ascii?Q?tVAo63bdkdp5mTehGMcQzDJMoP/nNijNsh2Ma4IWz2i5xaBKw11Gnv66cDRd?=
 =?us-ascii?Q?lb4IK6aovTL0JmvDtf0WnDb9FyY35S/782JW7bA0s45/UjJvwQNwl6gipUmt?=
 =?us-ascii?Q?Evicf7K7XyqUNWt+sorVM5F6x8uIY0qbgvAvxG19tCkRjbhcmXmK5jl3Nxf3?=
 =?us-ascii?Q?8jZP9U+AgXrMdJ7et7Uf69kgEYyxgxLhfVEaHAxiVd+AgUwMfu5mWITI81un?=
 =?us-ascii?Q?KAkDZmIq3H8XbAh09oIHnACQjKWneYp1jEuFY5q5Ti+vpEtJ8VXPj4NOjLaU?=
 =?us-ascii?Q?dx9vmRMqzTQ/0sEYkaBNtH0S5/iffjcNi7Qn1nYvOaJ4n2/PkU0+pe2ateyZ?=
 =?us-ascii?Q?ClGuVfCvomoD3+/uh6c1w8v8ge+tZ6J05KhftS4SQXl8Rz1kFiF7fT/yeSdm?=
 =?us-ascii?Q?DGZtrK/uMy4bZZIApo6SuHBkCHZZ7oIV1ADRNjt30mZjKfuzXLRRVXAZLqlV?=
 =?us-ascii?Q?Izbi4bLdZSJv5iChE1W6Cw/SSyVbveovNmgbDtD7Z1ksUq0vZVPxUBFb+TDV?=
 =?us-ascii?Q?0QBRY1gSdTyRgXFSiGB84TLRP/OGCtbYg3alivSux58V8kPRrHiK4EpxuFTz?=
 =?us-ascii?Q?qXaZlJWMuYm7fE2T+SRR9U9FQGWT5M3ztuDf398KeeH+woDuMc73aPxZzRdJ?=
 =?us-ascii?Q?XjNGUGKI/l0dd6TPSuU5y6ZUMZUOF9xblvEUNQYOy6LlSDQiBQzAjMSk4afQ?=
 =?us-ascii?Q?4LUtsDx7rRWIQr1EbUlOp5nIRGdKzs4h3e3H3VOTQ70K8IqbuKUsB+Os58ye?=
 =?us-ascii?Q?G6u3z7KuPQmYo8Ky6Z3X+DoJ9E9RRtz+j8eGYWmMyjmMg0mGKwjTbJVREKHd?=
 =?us-ascii?Q?xOXK/UwsjmpZfaL76uEL98D0ymKaPYTduD7Pd94zzGG+qah7JXdqgmFsyQf6?=
 =?us-ascii?Q?i7MCSU01iyPMGb+FTVX1b3a7S+MRVopkR9W0jq4UZSoDaEJ8haBru0USc1cN?=
 =?us-ascii?Q?GsCaeNHGs33/p8151lfWUf4tjjM9nwwY2wntDMXpAuBH6+/YZioLraU9bi96?=
 =?us-ascii?Q?zxZx+beMgFpBuCT8vhSiX8RDp2hJwdVOadssLXEdFgHtQEl3NMf75KhD30Zk?=
 =?us-ascii?Q?lzM2hraZOkHwRJlq6lxn9wfOOiOGikmRePpGEDyuqqMAfQPEUb/lmnj0pLMO?=
 =?us-ascii?Q?LP3DyvvU+7YTgZYsIXpzOkuoK8n38yXcUG8Hw2/DzEJb3ECwlGXoU4z/z+Ks?=
 =?us-ascii?Q?YSxG7kkPLKFQTaz/xqgYkehnT5R3TP8OzlO9U+WvvrZkoVhZ8ZO4bWwxR+Si?=
 =?us-ascii?Q?rXO1Z75uDu0tUBeGDCvITTWOEq3l3o2FbFi+HoqGR1NIfGcdGxpWFqA38HSm?=
 =?us-ascii?Q?zOC3T+RDoUbxBFPClXuT2c2+gIY5tn3TZDlnRNbeyZz+iMrC8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 23:08:58.6576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a1ebe3-8f85-4eae-5246-08dcf7a58125
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248

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
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 automation/gitlab-ci/build.yaml               |  3 +
 automation/gitlab-ci/test.yaml                | 16 ++++
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 76 +++++++++++++------
 3 files changed, 70 insertions(+), 25 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 09dd9e6ccb..b56ace69a0 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -340,6 +340,9 @@ alpine-3.18-gcc-debug:
   variables:
     CONTAINER: alpine:3.18
     BUILD_QEMU_XEN: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
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

