Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28025E63DD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410157.653210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSC-0005Uv-VO; Thu, 22 Sep 2022 13:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410157.653210; Thu, 22 Sep 2022 13:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSC-0005Kx-ME; Thu, 22 Sep 2022 13:41:24 +0000
Received: by outflank-mailman (input) for mailman id 410157;
 Thu, 22 Sep 2022 13:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMS9-0004DO-W7
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:22 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2061.outbound.protection.outlook.com [40.107.212.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ce1f13a-3a7c-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 15:41:19 +0200 (CEST)
Received: from BN9PR03CA0189.namprd03.prod.outlook.com (2603:10b6:408:f9::14)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Thu, 22 Sep
 2022 13:41:17 +0000
Received: from BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::e4) by BN9PR03CA0189.outlook.office365.com
 (2603:10b6:408:f9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT088.mail.protection.outlook.com (10.13.177.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:17 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 06:41:16 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:15 -0500
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
X-Inumbo-ID: 3ce1f13a-3a7c-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vt4KOlHJAS9iaDkANyHSTnKDH6+L0usSGCNRJiwo+nJaIDnqe9D1qDQM8/SpXMJeU7Dc3EOG5OHhsqsX1PImpcTKtDMNHtxI9w6geCdTCOIiYpmbOeeky+PioW3kXqsTfNFLHuLu2emtppXIKtqHHfqKrdLOIknVIUolT+bn0QldtXeRNEq8nZ2vjw2Wfk0o1t/IRRFVS54GzjSIhIn0l6Ycbn3xjDEefnghCQxioOgRmi2Bn0GZZpFipuOcYIJbeyRgm4bse9N7PxTttKl/+ep21pLDPqk8H5uWr1FZ/32grFqeuPVGo5ovVDfrJavssLO3hgKZPmaJ6fJJTLbEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oj0Jye2TY14wGofloU/Wk7Zk6VQgePIK69TIoc4uMt4=;
 b=AiOV4U8lEi0x4qYGlInNKZ+LC5bcYe+DmmlrEHZuZCsHN3LG+cnf63TpQ4Y+KMLCGa0VQVSjR1GefYf1rcA/HFWkSK06CWdqbH7o63G33khH9ce0w9gysB6uufSZLr5+yiWGqOa+8xyOdlqKK1Jq/c8ufrvXbXwVNOhkok/C/WPHudohmOqAsNusiOLJUKKUbiBTOL4y7LEyqKeUD0+ip5PT3NcSJ7kDsvWTDPPUFHJu+DJrzL46BN/V4ccOjBKP02Tdk0sJDfC3XDb4alYLUhzL7B9EDj9wA8sFSOOL5l4pXqzBajTMZMEvbud2BdHSKekew3Q1X8020U/iSkuGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oj0Jye2TY14wGofloU/Wk7Zk6VQgePIK69TIoc4uMt4=;
 b=qGOqMD8q3oP4w9iDEh1zv2z33B77R7Yo3nlN9ZEgSpS1f8RrP6NJVCq9pr8nfxH8i7wSC+UXgv/zs07f3/BF0TOY+2FjBetuCduAnv0kG5Xe1oRLXRiBS/N+1PdbKU8YKft2O//O7K+sFxLCdpR+aHhwAHMzrIr8E7ea0PaMBXg=
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
Subject: [PATCH 6/9] automation: qemu-alpine-arm64: Cleanup and fixes
Date: Thu, 22 Sep 2022 15:40:55 +0200
Message-ID: <20220922134058.1410-7-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922134058.1410-1-michal.orzel@amd.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT088:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2ffa87-a8b1-442d-b167-08da9ca02037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FuMNJ0vtmgrfYOieFi0CHMg+t2HEcA5Sa/Gf4TjLp0k5geelq9TT3wxbBl35aN57GgcVNkJqD5DN6pZC0jEI/KvGVcwkqeTap25iQettNYuJAgngSSazqzYDAG7Ub9k0wnjvBQ/yDiVYvD56V8QOb+L+KcDZhyI7e6ZF0nNNr5KIuOui0vf+U13CwWLPeyMHlyHhg7l1EW5ZqpLM/6s/KQd3gh33ZAsww0TuLp0j6bZvQD6OCLfeEvrKlnjcxDBMY9r6V3NTtdkLbO6+xOR5vTm9o8ihOZLXkV9LA9LrgISje/q4yoc5c3pX+WdodFMGlVyE418KTuLtVEexvledr68mMXnV6weAmEPZI0/hwap2IrVPfQhqULOnABw8yBJNi0Ba5M2YDjIPMBKMuEYbNsYjbZ5Cv8KUAi8y70CMt6QFFkzC3FcSpx4kZsGJprZKdusvi6h82ix2M4pq6lOHfBjGSABknSCF0K8EGZjRr0AH34o0FoNN/+j/mQ3/ys1K3VxsVvhqUaNgkhC8U0LBtPcqXWNGmyXc8DlsVfA7u0t+FuZ/V+TfUUl11GMdrkZjf8IhoGjurRAe5dn5aWNobjI6L8FOnuS3D0T5zZyC9024sx22SCUXBDztjXoNmHd97mxgteP3JRPb5cN04qg1o5xFerVz/KRrR3BCdMFL7WwBuXv974qMGpbRSP5trFtaioE8XOVMJJNLyRSMlyACNjCoYwreufG2DSPSXDoxhaZbM6qmBhz/hMxWABD3f+8Gkm9GlOKQ99jt/sVr9baDh11D45OcBtUKVM2gKqvtBWnyJK9RHY6Py7Oj5o96bhXDzqbaW6o6i0oF4EQb83H6aIqHzBnytIsAkr3ERofh7gA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(2616005)(26005)(5660300002)(81166007)(966005)(478600001)(44832011)(2906002)(356005)(36860700001)(40460700003)(82310400005)(86362001)(8936002)(6666004)(336012)(426003)(83380400001)(47076005)(1076003)(41300700001)(40480700001)(6916009)(82740400003)(186003)(316002)(70586007)(70206006)(4326008)(54906003)(36756003)(8676002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:17.4942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2ffa87-a8b1-442d-b167-08da9ca02037
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474

Perform the following cleanup:
- rename the device tree from virt-gicv3 to virt-gicv2 as the GIC version
  used in this test is v2,
- use fdtput to perform modifications on the dtb,
- use DEBIAN_FRONTENT=noninteractive to prevent interactive prompt being
  stuck waiting for answer other than "yes",
- fix the number of cpus in the device tree because currently we generate
  it with a single cpu and try to run QEMU with two,
- fix the memory size we pass when generating QEMU device tree as it does
  not match the memory size with what we run QEMU.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/scripts/qemu-alpine-arm64.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-alpine-arm64.sh
index f4ac2d856fa0..7b52d77d3c84 100755
--- a/automation/scripts/qemu-alpine-arm64.sh
+++ b/automation/scripts/qemu-alpine-arm64.sh
@@ -2,6 +2,7 @@
 
 set -ex
 
+export DEBIAN_FRONTENT=noninteractive
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


