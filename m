Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5FB5EA2D8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411688.654719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocm4k-0000Eq-8i; Mon, 26 Sep 2022 11:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411688.654719; Mon, 26 Sep 2022 11:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocm4k-0000AY-2B; Mon, 26 Sep 2022 11:15:02 +0000
Received: by outflank-mailman (input) for mailman id 411688;
 Mon, 26 Sep 2022 11:15:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oclva-00019b-7D
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:05:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 233857fe-3d8b-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 13:05:33 +0200 (CEST)
Received: from BN9PR03CA0526.namprd03.prod.outlook.com (2603:10b6:408:131::21)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 11:05:29 +0000
Received: from BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::4a) by BN9PR03CA0526.outlook.office365.com
 (2603:10b6:408:131::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 11:05:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT078.mail.protection.outlook.com (10.13.176.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:05:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:05:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 04:04:57 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:04:56 -0500
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
X-Inumbo-ID: 233857fe-3d8b-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwHG0Uw/YE/yIMCCE5Alr31ht846VmICjyZwcpHIpCCC+Yn55avaLQtJsujAKbdzR8ssyAUGIurigHUOydB/OK2Puub+dWtCjBX8aZL09DeVHn6GMh4s5tGDpVrf2FJYV1X7Y7f43O5X43zVQ4+NPbEOawHjaJxw+bI4gwpygr8nY/zJY94l9bpBqscuUrVu8H4sbCVY+xecgG+8CbMOS1ut44uFhknkcVYdz9jqMLmIUBxbuM7Qf/NVqpPGxGyrDmWWmCAnxpYGjiQn0w5N+p4di9ZMzx/BaYzGIxTRtoM7pBvxpGS37iEEl5ifX7s7AYRsLkQAvHHsHz6herwi6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qx4EC4KMsyhRnGE2453GEGKH2mT41/PmpiSKyiT7+AI=;
 b=b6ZaRJQSky7T11KAQPqAgsi8UcXEtAn7g6/AbdSANHRK4QQy/mqjnrdsoTrNQAGu5/iSZ47d9unfTVLP5U7pcP6kbR2HfhW03fEcn+Rnk58umZISL8xcZS0YFp5xFHYyiy2qLaL6JfIG8jK4tjI4PhayKNGccXCygS3sDHyOVjyNRNpzrHiSUnM2c1vbnj2SW6t1WO3MjlixJu7029JYX1ASjwC06xwgeAw/5gnKgIHFe51VZHLNxj2bfcl5dV3x2qR0DZAhkP25qLRvWfaSB/4D04L0AcSlY1TeZm1aO9Xtu4/ZqxEiYEjUuMqM2NvRdk7OwxDbQ6pKF8Cx/KZvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx4EC4KMsyhRnGE2453GEGKH2mT41/PmpiSKyiT7+AI=;
 b=pi0RQkFDspIRz0hdXd9sE1XjTZCjKnv7QqxthQe59dKl9wtv0O7bGyfakY8CKI3gsAWRCdDDI3kqW+Yf73H64Or05I9gZKoOyC6ONSd+HLMCL04ryVAueF5v41TaRoB4k30vB8RYatNkz8FrT4Fv6KjUYaz84GMZIyAjo1Dxnm4=
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
Subject: [PATCH v2 07/10] automation: qemu-alpine-arm64: Cleanup and fixes
Date: Mon, 26 Sep 2022 13:04:20 +0200
Message-ID: <20220926110423.26030-8-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT078:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: aaeddd57-f6ee-455c-50ab-08da9faf05ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IqQiqwIwZoQsoqYW6qhoFQtS+Gmx3JyIUd3rZyPuwX/yeZBYbI27udJmvp9s0EvOb4wPESk8O+22lme1zxBoDZEgD6ay9aYfLvP7LTkznUDLCN54QZMxSWUVtb1CVRNOL9X50HPWPp012XVGpScUrF++c4MBt9lvgnaFaFldb3zF7SnkaQCCVE7B/yPEyFjO2W/zAExJavuLk71xk6qozG3vNJlG+0/qBPM8PJ2jnNHMBPqDo0G5MPScw3N/6G9xogzfZUsUP+R7AGzCAevWqbNmfWN/rcrUAJGI+GbmC5bMrT8Xo+OouLWKOBKI409Xgvwh9CnYsEfc2ZxmTrZvV79aQ3jsilIeXyjsmYQHYXEOzWfWbZiM9lBPMFQRYGl26zZJgiskhbgBCo7F7bPU19QtXvJ1KZCG/pB/KaVKeWZL9K7l7KaCFzMBnNUlzCSFzEndv1Eh6ocG8+hZeMKEqxi7cfCRJortthwofQeHPSC2xHOSvNouO5qN7FVvqosM8/lY5R79QhKMPK6/xs2FWM7QVTTHHPN/FM3stBMeRFUF4jt9m0twJQVNc75UIG2N2UdrOXFrMWalPT4uvvGAZt/fXxBwKjG5WcPPtefuivq0Ht0TwPOT7ZKm/NE8bh5ygxOcVNEBEMLRpIj6K7twOfUdhXdeTz+1h8OoqK+08XWgXsF5swaMHps7wU01iy57j4bGVj60qucAHqhMpYA7OnnBh6GvgcOlSZ3tBtT3Shqustgb7lccrRmXtAlQf++KvuflJXFcppC3k++fAgtos4Xcw4My/ehIzS5RA4RUWLh69Du3PcRqpf7q8hjCslJByd0BOC4Pfavi364HQB+Xb+mhA3E9ErrzPFH9tjS9yPY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(966005)(6916009)(54906003)(83380400001)(478600001)(316002)(6666004)(70586007)(70206006)(8676002)(4326008)(41300700001)(5660300002)(2906002)(8936002)(36756003)(2616005)(26005)(44832011)(336012)(186003)(1076003)(36860700001)(47076005)(426003)(356005)(40460700003)(82310400005)(81166007)(82740400003)(86362001)(40480700001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:05:28.8993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaeddd57-f6ee-455c-50ab-08da9faf05ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684

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
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- none
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


