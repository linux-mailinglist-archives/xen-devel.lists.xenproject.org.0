Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E05EBEEF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412372.655713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bw-0007nP-Cl; Tue, 27 Sep 2022 09:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412372.655713; Tue, 27 Sep 2022 09:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bw-0007jg-5T; Tue, 27 Sep 2022 09:47:52 +0000
Received: by outflank-mailman (input) for mailman id 412372;
 Tue, 27 Sep 2022 09:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7Bu-00061O-Ki
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:50 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7213fbee-3e49-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 11:47:49 +0200 (CEST)
Received: from BN0PR07CA0012.namprd07.prod.outlook.com (2603:10b6:408:141::34)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:47:47 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::76) by BN0PR07CA0012.outlook.office365.com
 (2603:10b6:408:141::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:45 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:44 -0500
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
X-Inumbo-ID: 7213fbee-3e49-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik9zJ0NoiGfb2tDzREuIyXheKA+g+EE7LkOGUpQoS6xnMioLXTedlxajwlR7tSwjdRyMfpQzd13nlcFIKqdI7ce4Hn9vICFQerD+js3/GTN5qSwcqIYqAYC71lnh+lqDwL8LRUMu7CWOb4eTyAMFYg1pmDBhOXwOmQjeNKzc+oN4G3P2aUyuf8x/VlJBtFdyzThU/1lU76QTbB9mi5Ff/qHmsx1ESzP3LRVRWqOF/UTBpujWSsXmWkOcR7yAI8Nj5PgX4DiN8avGeiQueeJh2qYX5GcriR1GX+vevgh45F6R5PHm6uJWSUxpySJLoqVgEQfXwOyaob1+sSGqsdgFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0I9iQFSNIdWL0CuOjrMUz2Rkr4kshuH4vfebOra2RQ=;
 b=OFy3iW3e+0iBqiRlfqIzdU5tFurdQYW/NAamNBrGUDVodAsVZRgTyeLNHMO0i17KPXbsfXXLmYRYx4jjD0r8TBAV2oqqEhcDqTGf7ZvUR5dZk7qlwMNCxtoUirFADxF9OsAreu0V1yo1JaJliUI7wz0fbCwgpeFdExaD6DvLlfB4T9FRMfU0CAcJerpOjmW+VLTQ520e840Lz84YCcYfRX6IYvu98+tcbGttXu7y2v/fthuZ+sRqO5cDyQzm3GtQ5wt04CpXfKG36QevbveW+kXGtgNJz1pz951eNCoY1FY0Se5YJQ0qx0ck6diD6RqUe54m8kpfPHusrNlbRCoE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0I9iQFSNIdWL0CuOjrMUz2Rkr4kshuH4vfebOra2RQ=;
 b=Vm/Sg9nrnn7XPINCJpNTHhMvmqZCnTDpYmBkbzxpxGpOCcvSl8ihdcp5cXF41Q9eijNHuQXDvQtVsn6oxL687hBwea1ah5H2kfc18dNB3YV6E/Zn+JsOyWEKgNODj3MBFWCOiPcs+BqcrKKGZHAaTkvP3MmGRKXrSvb88iejS4M=
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
Subject: [PATCH v3 07/10] automation: qemu-alpine-arm64: Cleanup and fixes
Date: Tue, 27 Sep 2022 11:47:24 +0200
Message-ID: <20220927094727.12762-8-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b799ca-d58f-4e9a-8854-08daa06d54f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/qu75F1WalrHFrx4eMfjudBLas2V0NKI5FMohVGzqBDK1hcpXRRxBK2EnAQp/czaTYt2QAV+0OEwD6zpBGWEiwTxGEkHPvoAvxfipY703P4pEtJkxGPvxKkJwHRXpyRUS97c55klgK85hxdmDrwCu7+fsqlcss908TsaYa5A9vtqvbUleJ6M4OovH3eKlpkSUx8vDB9TSkfluGRMjRncEXHWjHDvyuVYFXwNZ5GM3ZBwII2kqvSkdrnfKtUDZh7RnYvfcamueTvO475U+n7Cj6gRd2T6iTl5/t/yCc4bKT7AdTnq4eyoXZa33qFGZ2phP6xWJwEQ0Wbmi7VvZfz4tUwMaP+1X20+C2vP9QOSFYsHkhvtM1SYlHnZncf82MFs9rr5QdFz8fvQHHGyzl1dp3Dsq9fKOC0RIatmD/Tm4C0LpAJ5Xgdmz7KNrWZSEGzGJfEQhc+9+H3C8LegzNMgd8gAF3SL+Gyua5k0pgzH4TllduinKgkTlKhSqp7S7h7GSC78VOUiJtNt+R76ZZFWGmnWAGTbXcLLyeozb11ZQydSiIlTPwMHwBNrXZM/ONRl3weiO1E1LBYGwr6ZINO12PrMwq+2UyiYuKP2uBjaRairD2hDH8wd3VQvJfXIiPMBzhvDins3EMa18WtXcrQckydIS0CzbObDZlc2Cd4waP1TDf9RDSrneiPcISaBiENLYK8XkDke2OWqxry6DtyxruaILohpytgvSuS77jb02luBL8Y29WqliKqv83wVuaGlx37+s0knJv/fFLbUlamzihUUq2XB2AiYrEC+Jw3NyipP/KrM54tLTEm3KTmPdnZEcCeWWeEWwZhd/bCPAeE2e8yNjCAqRvs4EDrzKDvreuU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(44832011)(26005)(5660300002)(8936002)(6666004)(40460700003)(83380400001)(41300700001)(82740400003)(36860700001)(1076003)(36756003)(2616005)(186003)(2906002)(82310400005)(81166007)(336012)(426003)(47076005)(356005)(6916009)(54906003)(40480700001)(4326008)(70206006)(70586007)(86362001)(478600001)(8676002)(316002)(966005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:46.2912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b799ca-d58f-4e9a-8854-08daa06d54f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

Perform the following cleanup:
- rename the device tree from virt-gicv3 to virt-gicv2 as the GIC version
  used in this test is v2,
- use fdtput to perform modifications on the dtb,
- use DEBIAN_FRONTEND=noninteractive to prevent interactive prompt being
  stuck waiting for answer other than "yes",
- fix the number of cpus in the device tree because currently we generate
  it with a single cpu and try to run QEMU with two,
- fix the memory size we pass when generating QEMU device tree as it does
  not match the memory size with what we run QEMU.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v3:
- s/DEBIAN_FRONTENT/DEBIAN_FRONTEND/, drop Ack
Changes in v2:
- none
---
 automation/scripts/qemu-alpine-arm64.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-alpine-arm64.sh
index f4ac2d856fa0..9004c537e325 100755
--- a/automation/scripts/qemu-alpine-arm64.sh
+++ b/automation/scripts/qemu-alpine-arm64.sh
@@ -2,6 +2,7 @@
 
 set -ex
 
+export DEBIAN_FRONTEND=noninteractive
 apt-get -qy update
 apt-get -qy install --no-install-recommends u-boot-qemu \
                                             u-boot-tools \
@@ -73,18 +74,17 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./binaries/qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
-   -m 1024 -display none \
-   -machine dumpdtb=binaries/virt-gicv3.dtb
+   -m 2048 -smp 2 -display none \
+   -machine dumpdtb=binaries/virt-gicv2.dtb
+
 # XXX disable pl061 to avoid Linux crash
-dtc -I dtb -O dts binaries/virt-gicv3.dtb > binaries/virt-gicv3.dts
-sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv3.dts > binaries/virt-gicv3-edited.dts
-dtc -I dts -O dtb binaries/virt-gicv3-edited.dts > binaries/virt-gicv3.dtb
+fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
 
 # ImageBuilder
 echo 'MEMORY_START="0x40000000"
-MEMORY_END="0x80000000"
+MEMORY_END="0xC0000000"
 
-DEVICE_TREE="virt-gicv3.dtb"
+DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
 DOM0_KERNEL="Image"
 DOM0_RAMDISK="xen-rootfs.cpio.gz"
-- 
2.25.1


