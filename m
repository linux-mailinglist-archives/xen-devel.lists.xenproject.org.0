Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED178AF395
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710906.1110462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIk5-0000mK-3K; Tue, 23 Apr 2024 16:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710906.1110462; Tue, 23 Apr 2024 16:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIk4-0000kJ-Vr; Tue, 23 Apr 2024 16:11:36 +0000
Received: by outflank-mailman (input) for mailman id 710906;
 Tue, 23 Apr 2024 16:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ID6+=L4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rzIk3-0000jr-6E
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:11:35 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25f64e7f-018c-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 18:11:33 +0200 (CEST)
Received: from BL0PR0102CA0065.prod.exchangelabs.com (2603:10b6:208:25::42) by
 CY8PR12MB8215.namprd12.prod.outlook.com (2603:10b6:930:77::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.44; Tue, 23 Apr 2024 16:11:29 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:25:cafe::3b) by BL0PR0102CA0065.outlook.office365.com
 (2603:10b6:208:25::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Tue, 23 Apr 2024 16:11:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Tue, 23 Apr 2024 16:11:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 11:11:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 09:11:27 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Tue, 23 Apr 2024 11:11:26 -0500
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
X-Inumbo-ID: 25f64e7f-018c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GL1MXw3v3krDKeXNohm5oVubMUFY4YgPWIAb6SBNxqgipah2RfAHj+ET9aWj72uBakS0OfNbWdQtADLXzMvU0w+e4dAycuqGVtE0BrJexZxG3V/fiBMpjPLXOhnINIPE9vc8aE3I7cvy1VYLd9t7FCx0Trg0fwnJxbSnQMrmMNq1EzCA02lGUpardRueam+Mc5Uyk9VssKXNH9V13M33js4OXEi32d+C/PeGkiYboqhQw/r/QVBsGXXATHEpkV4bOncQCvxPUzts8xc0/MQtjIzNwKfu7K8JJiTGGBZCsPqdPCJXId+jzU1KwgG8gdsgT4dkblb6MCCbfvm4ADFgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2zWqE04jldfd294CAby8dj98qrqQ+RxFMatI9jhagI=;
 b=oclH5efEiNTlQywMfRD28meMUxm8nkPJwzzBcNzFAK/xWWicRxA13134tcKvSoJ6w+Xg8EGj+U0kKIvPJQCO0JhhJBQ4Ey1vV7dyUfyiDzCpeu7PuLlcm1lVmqH97xJeMGWf9W8y3Vftvy427eC0MYuGGTdCXa+BK0+PBnuJJOpYAaXJ5ZbKmNGHjnjvBCytG0x+8JWNKnMi1oRzsDahqsNxohzMtdY9/9flcXYBYKweI9WR77/4XlG09v26iqZiLOuQ/hnaptkPzyQNbdRA71ElaQXeBbrSsJoeGxvaK3r23pAlg+quoTotQZCF1S3OEiI08VYec5XtpWhfhf6eJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2zWqE04jldfd294CAby8dj98qrqQ+RxFMatI9jhagI=;
 b=lRAFrthl8yE+PyPV/0F8U2CsCzWZ+brvFrTQdZ/1Cy4ZqTnYGsp74ftUbfTPigiF2sj9HAnzuQL6A+QejHt7quuC0hAV4IJz4Z7YBdX7QHPxTT1QBHnmiRiEljz8PgqgLFVTp9tYJjUHBr79lI3pO5t3jyVIwjzTGxfhzw0J0eA=
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
Subject: [PATCH 3/3] automation: Add arm64 test for running Xen with GICv3
Date: Tue, 23 Apr 2024 18:11:21 +0200
Message-ID: <20240423161121.138536-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423161121.138536-1-michal.orzel@amd.com>
References: <20240423161121.138536-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|CY8PR12MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d1dc0f-25d2-4bc7-9f72-08dc63b0086e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tz5biQftIAWAfIAS7xWVGRRZ4DTSF+xwPXp76iFbWIxa+P2yeJR0zVKT4o6k?=
 =?us-ascii?Q?hcpBNcYl7SrDL06cVu3F/2CcBJZWxvUNQ6ACshd+MEcJ2Hg3zaRTD3XLAeSf?=
 =?us-ascii?Q?tAoJkZLyvmRt8r39Zfac4x1voI98qwhzr3zkmlfYnRlee2nS/6pjY6IRb4T+?=
 =?us-ascii?Q?ZxitD9urmWI3osLzj+elyzh0jy3TpaA7IwvaFM3jCPN8yyOEZ7HS8dsvCsAT?=
 =?us-ascii?Q?fMvrp6u+fHNV68Yjxr0byI+hPJvJWztKfefhiIWEJCuv1/mHLD5cpL/HOrZ3?=
 =?us-ascii?Q?mugJOPKW6gu4mBcMxK9pq6WHW+YJHUle5Ahp30OFF5vO4uSldX3ygaaUIoQ3?=
 =?us-ascii?Q?ZckRZ14sUQ3YE5VzvfC9+Tg5kf2VLBhbj01DeMYXiQJjEE6vdrmAgL91VtFE?=
 =?us-ascii?Q?gJfg6nxdh7TdDZUKHWzAIF8qDUHkQdMxwQigX7GwYmJnaCHejUxA26yUmjtv?=
 =?us-ascii?Q?V6kCGYUGkKX+BRbMKNzlFLT8vs+OEIBajaLRMJuQsGXeyHBPVPJAV9/kXyyT?=
 =?us-ascii?Q?RitkECLWQkxchtkTainHwfkCMn1UDiSPFHuzgIiq7Pokas6GoQMPUv+S6aun?=
 =?us-ascii?Q?THZLmzTtW315AHyzkCuSAINyElomFZFSuNDkSBHQjusEFYCQqt2MSGFfEI2+?=
 =?us-ascii?Q?Z3Qql2ADq4IOXH5YstOTHC/KdT2/n7RBCD3VQeAZboW18X6YA8dbM3/+w/tF?=
 =?us-ascii?Q?GvgzwNwbaLa2dft6X/tinIf7lAFHE4H7hdSQvhHTJnijSolBI8qALuzVMg5F?=
 =?us-ascii?Q?fWWJOjHssKaofcf3dnrmeSuymtP2/uAL584GF27xhzQyQAl9ZaPm1FhjhcIO?=
 =?us-ascii?Q?ZlUD9CCHKuQUaeX269G0sfpsesY5SzZ6QV3GJJSIMXvO+1IpQc34OPTWFZPX?=
 =?us-ascii?Q?xAAkuTS2uCYbkW8ZgG6xlgnWQC1BL23qywCFLuFFocPn1cxF1SIImwf5RnR/?=
 =?us-ascii?Q?bzUkovewGe9xKA64/VVy5eSDd/UErSZdgVJipvTTqCyNu/1M8iD+Pk09lz/w?=
 =?us-ascii?Q?Qgiy93livRIahh+x6Eeow5ymjk+7epsRBKlnwiOAUZ5z0GaL7pMNdmgG35fR?=
 =?us-ascii?Q?NES14ZZ3FptbzmFzaT+L6EBSr41355qX4YWlJfZGKbNZvskbXCZOa2B/IA0D?=
 =?us-ascii?Q?rbEUCoXKFP/nEx8UFu3R1zKU6Pt/pGrb4zRGlYeyjOmXjA03nMcv5E5smKbt?=
 =?us-ascii?Q?IpUwS0E80EdnjEMWyRSbwzyl6VMy2UVvg6q9Vc9P2k5q2FoWx7mHI/33Owjl?=
 =?us-ascii?Q?5X/SjD5vw412CAkavNlZPPYpByaitxzCENZtTjjHwk7n8Gs8Hd31Co0zdVSG?=
 =?us-ascii?Q?km8mkngWiCisyz1db0DXoGRoDpUsLjb7NDEPNzlxtF5NAzzY91knvxDr7Qmr?=
 =?us-ascii?Q?TgGlTU/53/RuvjfSrmDHOKo7AUKA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 16:11:28.6316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d1dc0f-25d2-4bc7-9f72-08dc63b0086e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8215

At the moment, all the Arm64 Qemu tests use GICv2 which is the default
GIC version used by Qemu. Improve the coverage by adding a new test in
which Qemu will be configured to have GICv3.

Rename host device tree name to "virt.dtb" to be GIC version agnostic.
Use "gic-version" Qemu option to select the version to use. Unless the
test variant is set to "gicv3", version 2 will be used.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/test.yaml                |  8 ++++++++
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 19 ++++++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1e5d86763f6c..ad249fa0a5d9 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -255,6 +255,14 @@ qemu-smoke-dom0less-arm64-gcc-debug:
     - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64
 
+qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh gicv3 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.18-gcc-debug-arm64
+
 qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index fc943a1a622c..292c38a56147 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -4,6 +4,9 @@ set -ex
 
 test_variant=$1
 
+# Default GIC version
+gic_version="2"
+
 if [ -z "${test_variant}" ]; then
     passed="ping test passed"
     domU_check="
@@ -66,16 +69,22 @@ if [[ "${test_variant}" == "earlyprintk" ]]; then
     passed="\- Ready \-"
 fi
 
+if [[ "${test_variant}" == "gicv3" ]]; then
+    gic_version=3
+    passed="${test_variant} test passed"
+    domU_check="echo \"${passed}\""
+fi
+
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
 curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./binaries/qemu-system-aarch64 \
    -machine virtualization=true \
-   -cpu cortex-a57 -machine type=virt \
+   -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
    -m 2048 -smp 2 -display none \
-   -machine dumpdtb=binaries/virt-gicv2.dtb
+   -machine dumpdtb=binaries/virt.dtb
 
 # XXX disable pl061 to avoid Linux crash
-fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
+fdtput binaries/virt.dtb -p -t s /pl061@9030000 status disabled
 
 # Busybox
 mkdir -p initrd
@@ -138,7 +147,7 @@ cd ..
 echo 'MEMORY_START="0x40000000"
 MEMORY_END="0x50000000"
 
-DEVICE_TREE="virt-gicv2.dtb"
+DEVICE_TREE="virt.dtb"
 XEN="xen"
 DOM0_KERNEL="Image"
 DOM0_RAMDISK="dom0-rootfs.cpio.gz"
@@ -200,7 +209,7 @@ echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
 timeout -k 1 240 \
 ./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
-    -cpu cortex-a57 -machine type=virt \
+    -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
     -m 2048 -monitor none -serial stdio \
     -smp 2 \
     -no-reboot \
-- 
2.25.1


