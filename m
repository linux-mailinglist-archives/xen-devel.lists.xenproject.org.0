Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ABE8AF398
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710909.1110492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIkG-0001dU-Ts; Tue, 23 Apr 2024 16:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710909.1110492; Tue, 23 Apr 2024 16:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIkG-0001bL-Pv; Tue, 23 Apr 2024 16:11:48 +0000
Received: by outflank-mailman (input) for mailman id 710909;
 Tue, 23 Apr 2024 16:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ID6+=L4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rzIkF-0001Zp-Nd
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:11:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e88::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2df11c43-018c-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 18:11:46 +0200 (CEST)
Received: from BYAPR21CA0025.namprd21.prod.outlook.com (2603:10b6:a03:114::35)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 16:11:35 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::1e) by BYAPR21CA0025.outlook.office365.com
 (2603:10b6:a03:114::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.8 via Frontend
 Transport; Tue, 23 Apr 2024 16:11:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Tue, 23 Apr 2024 16:11:34 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 11:11:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 09:11:25 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Tue, 23 Apr 2024 11:11:25 -0500
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
X-Inumbo-ID: 2df11c43-018c-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igjo4Uzm6h2sHhG/pkSpdgG/XpaHs5UQ1VIXuwCreOasEZq0/PrnjmYGlCVQ5DkpPbnX7llcDsKYxXgLzAP/hZGBULgxlBUJRDRNfB3HEpIu7Ol9Akhpx1T+onwky5r3ckh9b1dSQx+IMBEg6+yfW0/LaskDnTYW/kMqKuxIRVl5i6w72FJW2QLOTCTmbQizofbd6FolDaC6oi+gJUe2Y1Ptt1+fJOBz+4vZie+XeKUfCd7AhCFQXAUmK0ziBw4ofAOtSRUMl6wBTQRkJ+Ns6rgzwE2aLFHKXT2ByTzTWu0mu1nDJF1gUedjKD/KVVadNYKr6pHsXYlYCAhmQ7El3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x02jqpzQR1c1xv7L9dBTsmFCQM3ycPibIahZ0tRyspE=;
 b=KH2m0rrkzyCUZXT1TE2sm8d58CnfLPoltCuaI1VxrLMzvWZn8On041hz14Aq5cKsNFBQsVtGRaAu4aeHhGOJ6vnb2Lu3jGT9EDobWDI0SsY01vmoXvfaJwzQcCsmDb3Ulx0EPLn99cLKDqZ4b+qhUg8hPryB8qIWKEQjKjXY+1ztP8oe/7mNhFj1DUwuaEYQJAQrlzhcliZJBfPaT+fXLemjcSgMYNxl+fLr+LcLnHasL6RGABQNLOh6HsQM/w3h/WR3KgJyVRw5n9Y9idEjAsxanzucvf+EbGtz+D0+oORg2iVGhcR+/ccNf+kPCg6ZcnAtZE4hqP6IY4UXF7k/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x02jqpzQR1c1xv7L9dBTsmFCQM3ycPibIahZ0tRyspE=;
 b=OJTygNL+aPE4CP+HizGt6zJv64WC+0DVtUEJUrdBB8Mp0GbfCPBiMTgxH7Clx4QyqfUrw1yxjumkcgsSiPQQOArfrR8wwWpCCsTuA/gGp9RFIYm40FYshB1/MQyfA2CT1qlQEBvpAt/S26zgflkNVN5J+f0yZ3+WB8apqmHxouI=
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
Subject: [PATCH 2/3] automation: Add arm{64,32} earlyprintk jobs
Date: Tue, 23 Apr 2024 18:11:20 +0200
Message-ID: <20240423161121.138536-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423161121.138536-1-michal.orzel@amd.com>
References: <20240423161121.138536-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 93faab0b-3499-4327-5573-08dc63b00c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uJikoYZvFIz2lMFagoqlgBgQh6O/uocdmSzim0m1MgNPMTG8BdRcJ0BB8gU8?=
 =?us-ascii?Q?F8nEmNj4B2wMeb5+PiE9pvzPqJfzbF4oYDTJ1/C/BInuFP7qwBkwRXVUsh8H?=
 =?us-ascii?Q?79FP29WOzsGrrDGBX4zgn5PyIQjAdXLuDYl7f2ymCvOmZHtokkaJwURGdg2O?=
 =?us-ascii?Q?qUtjyRMTaMgN3OfMCTe4w1kW//H6UP1fVKpeY2Y3OsFtIB10KaAcf7ugbUOw?=
 =?us-ascii?Q?H7u1eVMu84VMs6gs5cB+A7ezRV/2WpvxQGfPVqf+lGuzLnWajqmm4qHOXr4I?=
 =?us-ascii?Q?dkAXHjq3zSH4YVB506/pwsc2K07hj5zxxv1c30ATUL3Kf/EN2D8W+kiuNDWN?=
 =?us-ascii?Q?vklKiBMX/1nFQr9gaSd5yQaaK7chFdsYBvjb4KwyVr8jlJcSVVqi0M1rrfAC?=
 =?us-ascii?Q?ygsWRPAjj9NC0z5NS1e49vQLxp/GOLu6DzW4GXuH+n7c//p6gHPr/QD7TbBl?=
 =?us-ascii?Q?mjnFeKqQetgfZ3+1Kyjv6bkPgRHibYyoGVMdZ4xnOzJnqUH99mxhdJOTSnK3?=
 =?us-ascii?Q?vxjg57cPV7UHQLAL+NK3V91LJFIwrLk1XNVY9hW9ZsXm/G7poKrGfB4LifZ4?=
 =?us-ascii?Q?4CyjgQEanFutt448gOiKmblRjk+ZjrcLhiYMPMsPGpJtTwIQBFW8UZ3TmQzn?=
 =?us-ascii?Q?gGSNOmf6Lp5ZDcDQt1iOjiZ2CT216TtQVBKi9PfsT0nAVWDtS4MpSs6jF4hD?=
 =?us-ascii?Q?BSrv0gbe9E3UXEK3kMh6gW2dotXmAEbBsSWeAHRgGMnaEB5zz624K5JiO7wk?=
 =?us-ascii?Q?TbzzMzFoG2oZq/A5JpMrMdywW7oFWElZUkWJQ4Nv1EV9lxhl+6hGeErwp8nU?=
 =?us-ascii?Q?LqpSqVqUX/RUV2hADN1r344jMdTVbULx2O309Qgg1fnBIkpVdNsGD8FSE30j?=
 =?us-ascii?Q?lZ/MNZZnVpbsmpb7kZi47GCp7fB4hqHZgLXuYON8M4FlGeMugoMYXatdvfQy?=
 =?us-ascii?Q?ZRMlmHnUD/4SNU6goz34pGoVXjpox501QH6CRD4qYBI4y0rOZ6/3Teg4L+LX?=
 =?us-ascii?Q?YjvdnfBt2h9umbVrBFHqcJKSzCaUWr/FWaAmTsWp4V9fwCzyWB2dcsIfCNNo?=
 =?us-ascii?Q?YTBfdlZl1kuCT5RjuL5nAVLsSNrso8eUSEfq6VtoowWO4Ywa91qWb2Unqwh9?=
 =?us-ascii?Q?Vcpz5npgSfPgzeGVY3X8UCDz6uVqVrAGbLD69/6Z3zEnueBZmHGvNRUxN6oM?=
 =?us-ascii?Q?ug9g4DfRuNE3EbLDLulSDpiXHusUeB6DkrZPL7HpaI812ndWfpTaAyXJKVTl?=
 =?us-ascii?Q?XsGUvPu7KNh9Mf0GEOCbC5lsbkAOzq9AnRjPnnwWENe8KtBjIFt34N6Q8ZSL?=
 =?us-ascii?Q?d1A499yylc5+dp7NcxR1wzpcZDhPpDZgkVTeloWdSXByJgWk3OFxFv6ZbNo+?=
 =?us-ascii?Q?f0V2QmerGk1VOIklAFlcV6dHvrPw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 16:11:34.9847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93faab0b-3499-4327-5573-08dc63b00c46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926

Introduce qemu based Arm earlyprintk test and build jobs to cover this
feature in debug variant. The tests simply check for the presence of the
last message printed by the bootstrap code before entering the C world.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/build.yaml                 | 17 +++++++++++++++++
 automation/gitlab-ci/test.yaml                  | 16 ++++++++++++++++
 automation/scripts/qemu-smoke-dom0less-arm32.sh |  7 +++++++
 automation/scripts/qemu-smoke-dom0less-arm64.sh |  5 +++++
 4 files changed, 45 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f3c934471f32..49d6265ad5b4 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -402,6 +402,15 @@ debian-bookworm-gcc-arm32-debug-staticmem:
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
+debian-bookworm-gcc-arm32-debug-earlyprintk:
+  extends: .gcc-arm32-cross-build-debug
+  variables:
+    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EARLY_UART_CHOICE_PL011=y
+      CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
+
 # Arm builds
 
 debian-bookworm-gcc-arm64:
@@ -473,6 +482,14 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
     EXTRA_XEN_CONFIG: |
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
+alpine-3.18-gcc-debug-arm64-earlyprintk:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.18-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EARLY_UART_CHOICE_PL011=y
+      CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
+
 # RISC-V 64 cross-build
 .riscv-fixed-randconfig:
   variables: &riscv-fixed-randconfig
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 55a7831ad292..1e5d86763f6c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -287,6 +287,14 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
     - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64-boot-cpupools
 
+qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh earlyprintk 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.18-gcc-debug-arm64-earlyprintk
+
 qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
   extends: .qemu-arm64
   script:
@@ -359,6 +367,14 @@ qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
     - *arm32-test-needs
     - debian-bookworm-gcc-arm32-debug
 
+qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh earlyprintk 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-bookworm-gcc-arm32-debug-earlyprintk
+
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index e31b6b9014e1..1e2b939aadf7 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -53,6 +53,13 @@ echo \"${passed}\"
 "
 fi
 
+if [[ "${test_variant}" == "earlyprintk" ]]; then
+    # Clear dom0 prompt
+    dom0_prompt=""
+    # Last early printk message before entering C world
+    passed="\- Ready \-"
+fi
+
 # dom0/domU rootfs
 # We are using the same rootfs for dom0 and domU. The only difference is
 # that for the former, we set explictly rdinit to /bin/sh, whereas for the
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index e748b8ef1699..fc943a1a622c 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -61,6 +61,11 @@ fi
 "
 fi
 
+if [[ "${test_variant}" == "earlyprintk" ]]; then
+    # Last early printk message before entering C world
+    passed="\- Ready \-"
+fi
+
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
 curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./binaries/qemu-system-aarch64 \
-- 
2.25.1


