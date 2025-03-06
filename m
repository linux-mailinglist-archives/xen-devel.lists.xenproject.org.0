Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39493A559F9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904216.1312167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJtz-0007fA-UQ; Thu, 06 Mar 2025 22:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904216.1312167; Thu, 06 Mar 2025 22:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJtz-0007cX-Ph; Thu, 06 Mar 2025 22:41:15 +0000
Received: by outflank-mailman (input) for mailman id 904216;
 Thu, 06 Mar 2025 22:41:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJKO-0000Ss-EO
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:28 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3bc2bf9-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:20 +0100 (CET)
Received: from CH2PR18CA0044.namprd18.prod.outlook.com (2603:10b6:610:55::24)
 by CH3PR12MB9314.namprd12.prod.outlook.com (2603:10b6:610:1c5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 22:04:14 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::75) by CH2PR18CA0044.outlook.office365.com
 (2603:10b6:610:55::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 22:04:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 22:04:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:13 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:13 -0600
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
X-Inumbo-ID: f3bc2bf9-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUJDn5lI44BO4YdC/pW+R01M4NmMhS/tYq2hixFw7wGBpHGGcPjcFdPWOzeCxF82IRnI4y+xQfr6hG8Nmi2K93flr3wIREfN19hyTugNs8YDm3t2DHq8MXBj2KyF9g7KcFBxSL5ejaxRJW7UpKhJiqTB4MQ5hfIAci2Wsp9r36KFE7Wuv0H2X41VTx7072bJOLBIPKohYQX8x8YOBN5qWn41JUjnIIm2zMLSTbUiUnMfET0hJsL5EshDBqFe608XLBoLNXaP3OxHuFhRtYn0o1DaNTZG0eYBO0n2DdxsLX0if4q45Cmtz7FK9QAgUh6v8qSgqWSDeQnuUAmwOVjl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdj/omG7aNG4QUYzbT1Q3RmuRPZYorhXrmyOwRld3kU=;
 b=cpMn+kSeB9+M0IsBJrx6sVW8bOwXaMiij4oXA3igekbu70Hr2x1mkKjEBPOICUOrDrmlxX2hMT75ZJyFSAz07vSgbOF8bwgLUwr3nF8DlK95LjJHY/Y76BKke0deoM/n0R+mP+cz0rzOKuhBVpfZuau8pJb+5KZLFg0sK0CC4NVCP4mA8qH2UvbQB5XIJh2SPBX30KVQ7RJFBVwNAYkAWjEsnQayJZYwCgsEXXeKMcgW0xR42H/LChm3sKkqeXS6135AUJo7rSKZhpUXxKUBrTMFCKQbgTTtj6JbMmPLdCjF53ylJYYdxLWAAV+19NhihdChOHCw/b+JOmH7NgxKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdj/omG7aNG4QUYzbT1Q3RmuRPZYorhXrmyOwRld3kU=;
 b=cuxrcfp3/o+3bMTofiSP9+EEXs2xhHD+53XItarsjWuJQPpS/bKLmAxRKEOrTZ6LDWfyLhXCIFcWB+QdLUwD7UcnGLyAfEKx0n1lgR3FW17vdwXvWjUoCHX2HQvhaJouDp54z0YGKaGVeoR86jIOQTttIyLpWc+4Phx7mHpD+rE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 22/23] automation: Add arm64 hardware/control split test
Date: Thu, 6 Mar 2025 17:03:42 -0500
Message-ID: <20250306220343.203047-23-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|CH3PR12MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: be72176e-8657-4f62-3614-08dd5cfad54f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2nuEhZcpqroSMopm4vxSaunFX8gGXnbTweGQtAvDfObhbG/kTtUxIj+42Htf?=
 =?us-ascii?Q?lHN6sUUw7KaTZQV5MjM0QRfD0z9qL9HJHN1iCUdvcwv4bx48Iut0KBfq3WZx?=
 =?us-ascii?Q?Qc1FIQC22IK/nFPWqg6KAStQU1TcpkOeKZCxqfBke7NzvXk3OHjpoXQpihrU?=
 =?us-ascii?Q?a+X4/+MbGuFuLI7rslWJCiKAFr6RXBykAXEInJ2/hWRFn12v7/J/0YoLG3XI?=
 =?us-ascii?Q?knFFMzht5Hbxw7FguNKmYqBMNDKKVJ49Xc5MRfhFcPnTHX8NfLU32k5shgM9?=
 =?us-ascii?Q?4j6pvZkTGEzynUmSVefu3Ko8NrBNq4e2f6DtilxYcO7LgI0kg9YiG98UECWh?=
 =?us-ascii?Q?N9mYuaJpuWnVb177RDiqGjCB5QxFJLKQRaBmuPY0NuNazocJdnDRDeMxZeje?=
 =?us-ascii?Q?C/8Z6zuj7ObOrgNEzLySoGzyzMoPHMupE8rQH0BGKogNTqMgTn5qexZA363I?=
 =?us-ascii?Q?UmtnLb5jIDQbedg2B4TAYoVtygBH1rEInqwp0QAIOqg2NPPjaF5U8GjZQ7iS?=
 =?us-ascii?Q?RJzNfS/+yviy1ynqjuAYwdiSCprPMIueZkBZNPF/vGI8VQRuUeE9s/nkb2sO?=
 =?us-ascii?Q?5nSDM/jNcXmFnBTXtExHpKnBSBa87CvZBzv3xujthBpmdKhdYcO6TtoCYTBC?=
 =?us-ascii?Q?2FEYwlkmyB0qaoInQDh4f2Yg1CTyNa35qaD4L1aIglgrHB5liK/b1/+Z6sDv?=
 =?us-ascii?Q?qINCvXrvD4qx1VVENwEaoXt15YuQgNs2YJxpoTljBPUc1cqaH7pGnnbEpWm2?=
 =?us-ascii?Q?eGtgmJ6ehpDHX+i96icgehcKkfvfVHAniZVs0GMSmbdzV5sAeJIfQC7I/pkz?=
 =?us-ascii?Q?wijJlZaGwL+HKGS0StgWscJrvA1vB8kuXGXJkGXtkEKDdXv38IZ4MW16Us4W?=
 =?us-ascii?Q?y5b0cYU/koFgJJ2NyUKykdFtV+hsNggktTxSdWEQ+maL3h0bRmxBNp/9Tjtt?=
 =?us-ascii?Q?ar+zyuxmTP1TDtPcoQIFhzViJt2QODZv1+D5CH5ze6/53tcoh6AOpOzsLJ2G?=
 =?us-ascii?Q?Fm/X8MvXhjAb++4LAowfV9vAEh71HYwxSmFdzUcETSkyrR1t8vDFTh531Ymg?=
 =?us-ascii?Q?9GC9+EeddCsncAFFAV8T0yS3zFewwtu8pqrnwtLRVJUxOM8MSdgeMnVco16N?=
 =?us-ascii?Q?dJRA+g9Os5iJ+ixA12OLrIgV4mxiSHo8em6jO8PzsM9VboCawZT5k/DvJJTY?=
 =?us-ascii?Q?ZaJ9DVUdwxBclqfVBhTRUvlviDPCDVS6yqCPmJ//XWYUPGjeKp7PPJaehBgH?=
 =?us-ascii?Q?NXWGNpTngSB+/btSzrjmqbl9XhcENLvPRJRF4Y01jlHXYrqxqwbGZXjbupV+?=
 =?us-ascii?Q?6zjkAuO9jur2tktgOGlkBM8JfGODhn5wyLEnuCkDB6vz0O+aRI7MoOt3G2o2?=
 =?us-ascii?Q?aXizhERdoP/UfV8TWgFM5vQEOFRgxic4Kk01BU10eG7WSKSkFUKtABCR0M5k?=
 =?us-ascii?Q?i53xxLmT1PWHarM99/HLivm4YVH3dTBrC8nkRpCMu07eX0/52umpWfbs9dqb?=
 =?us-ascii?Q?xcmhyMlAbwBUJUQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:14.6171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be72176e-8657-4f62-3614-08dd5cfad54f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9314

Use dom0less to create a hardware+xenstore domain, a control domain,
and a regular domU.

Create a domU-rootfs that does not run the xen scripts, but does have
the xen tools installed.  The domU also uses a console on ttyAMA0
instead of hvc0.

We need to increate dom0less test memory or ImageBuilder fails with:
Error, not enough memory to load all binaries

Use C xenstored so hardware/xenstore can grant map control's xenstore
grant.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Initially, I tried to put xl list into control.  That executes before
dom0 runs init-dom0less, and it hangs.  I expected it to recover after
init-dom0less introduces it, but it does not.  That needs further
investigation.
---
 automation/gitlab-ci/test.yaml                |  8 +++
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 67 ++++++++++++++++---
 2 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9530e36e9a..a7f7fbb4bc 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -403,6 +403,14 @@ qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
     - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64
 
+qemu-smoke-dom0less-arm64-gcc-debug-hwdom-control:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh hwdom-control 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.18-gcc-debug-arm64
+
 qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 439e07c90f..39614720a4 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -78,6 +78,12 @@ if [[ "${test_variant}" == "gicv3" ]]; then
     domU_check="echo \"${passed}\""
 fi
 
+if [[ "${test_variant}" == "hwdom-control" ]]; then
+    gic_version=3
+    passed="hardware xenstore"
+    dom0_check="xl list --verbose"
+fi
+
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
 curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./binaries/qemu-system-aarch64 \
@@ -114,7 +120,7 @@ cd initrd
 find . | cpio --create --format='newc' | gzip > ../binaries/initrd
 cd ..
 
-# DOM0 rootfs
+# DOM0/DOMU rootfs with Xen tools
 mkdir -p rootfs
 cd rootfs
 tar xzf ../binaries/initrd.tar.gz
@@ -125,6 +131,31 @@ mkdir sys
 rm var/run
 cp -ar ../binaries/dist/install/* .
 
+echo "rc_verbose=yes" >> etc/rc.conf
+
+# Create a domU variant
+if [ "$test_variant" = "hwdom-control" ] ; then
+	echo "domU" > etc/hostname
+	sed -i 's/hvc0/ttyAMA0/g' etc/inittab
+
+	echo "#!/bin/bash
+
+	export LD_LIBRARY_PATH=/usr/local/lib
+
+	${domCTL_check}
+	" > etc/local.d/xen.start
+	chmod +x etc/local.d/xen.start
+
+	find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+	# Restore hwdom console
+	sed -i 's/ttyAMA0/hvc0/g' etc/inittab
+
+	# For dom0 - must use xenstored for grant mapping
+	sed -i '/^#XENSTORED=/a XENSTORED=/usr/local/sbin/xenstored' \
+		etc/default/xencommons
+fi
+
+echo "dom0" > etc/hostname
 echo "#!/bin/bash
 
 export LD_LIBRARY_PATH=/usr/local/lib
@@ -142,27 +173,45 @@ xl network-attach 1 type=vif
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
 find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
+if [ "$test_variant" != "hwdom-control" ] ; then
+	IB_DOM0='DOM0_KERNEL="Image"
+DOM0_RAMDISK="dom0-rootfs.cpio.gz"'
+	IB_XEN_CMD='XEN_CMD="console=dtuart dom0_mem=512M console_timestamps=boot"'
+	IB_DOMU_EXTRA="DOMU_KERNEL[1]='Image'
+DOMU_RAMDISK[1]='initrd'
+DOMU_MEM[1]='256'"
+else
+	IB_DOM0=''
+	IB_XEN_CMD='XEN_CMD="console=dtuart console_timestamps=boot"'
+	IB_DOMU_EXTRA="DOMU_KERNEL[1]='Image'
+DOMU_RAMDISK[1]='dom0-rootfs.cpio.gz'
+DOMU_MEM[1]='700'
+DOMU_CAPS[1]='hardware|xenstore'
+DOMU_CMD[1]='console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused'
+DOMU_KERNEL[2]='Image'
+DOMU_RAMDISK[2]='domU-rootfs.cpio.gz'
+DOMU_MEM[2]='700'
+DOMU_CAPS[2]='control'
+DOMU_ENHANCED[2]=1
+NUM_DOMUS=3"
+fi
 # ImageBuilder
 echo "MEMORY_START='0x40000000'
-MEMORY_END='0x50000000'
+MEMORY_END='0x80000000'
 
 DEVICE_TREE='virt.dtb'
 XEN='xen'
-DOM0_KERNEL='Image'
-DOM0_RAMDISK='dom0-rootfs.cpio.gz'
-XEN_CMD='console=dtuart dom0_mem=512M console_timestamps=boot'
+$IB_XEN_CMD
+$IB_DOM0
 
 NUM_DOMUS=1
 DOMU_KERNEL[0]='Image'
 DOMU_RAMDISK[0]='initrd'
 DOMU_MEM[0]='256'
-DOMU_KERNEL[1]='Image'
-DOMU_RAMDISK[1]='initrd'
-DOMU_MEM[1]='256'
+$IB_DOMU_EXTRA
 
 LOAD_CMD='tftpb'
 UBOOT_SOURCE='boot.source'
-- 
2.48.1


