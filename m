Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182CF773929
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 10:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579453.907435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIR2-0002ya-Ns; Tue, 08 Aug 2023 08:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579453.907435; Tue, 08 Aug 2023 08:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIR2-0002vN-Kd; Tue, 08 Aug 2023 08:51:24 +0000
Received: by outflank-mailman (input) for mailman id 579453;
 Tue, 08 Aug 2023 08:51:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psPu=DZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qTIR1-0002vH-IH
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 08:51:23 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be8e1956-35c8-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 10:51:21 +0200 (CEST)
Received: from SJ0PR03CA0111.namprd03.prod.outlook.com (2603:10b6:a03:333::26)
 by DM4PR12MB5133.namprd12.prod.outlook.com (2603:10b6:5:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:51:11 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::a2) by SJ0PR03CA0111.outlook.office365.com
 (2603:10b6:a03:333::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Tue, 8 Aug 2023 08:51:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Tue, 8 Aug 2023 08:51:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 03:51:14 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Tue, 8 Aug 2023 03:51:13 -0500
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
X-Inumbo-ID: be8e1956-35c8-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZADm3QZPm9kXFgl+5vip5eDaY/WxIebd0+dBAcyUQMI/P6qFkjvSCbPo2HSJrSfLRIcU0Lx9TpuuASGsi2KYI/0ihcJkkXCCE9hPlZFjwd8qDQNFP+VFPDkEs9NhWQoiP9mrrGKK/v/V9bfPp95zFezkXfDPA+VLm6XNXaKNJlh3mBBXoYuD3wFvgjHsNzuIeFBZTikPt/UNU4es6ClHX/VyROYqEFSxjW4HRx5VY84SxUu7fi4dL+0t3a08zaRCZyl1KVT/uWSTVK0retABdg45iKj3rGkdozi9MG/C3KHmdywEPt/w0uhnsekQcQClPXjmDxDXDeCMeyGINRXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pE2YST4ruG9R8GnmQ8+4KZbvCk2XZ3h2oHzBJBNFzrc=;
 b=UhScKq5cwgJjEwe0rGDBNF+kOBAOp+gtIGkW4Of0V1v0VHBEVsexPtEhYOjm5naQWf8ejLXUTFua37dMy110O/uuAnMHci0UobT60bZdUqpMGV4q6QodphX5whfxzwokJ413qgLZMlf8rVMl768H8PV/7PDX6/OkM74HrC7ud/3H9zYYjkBklk+lCplT719+UnXy8W2dBjIMrhRlB0NCvuYTRdc/9cQclEi+nlp236bC8cdtoFF/MdcN1yxGtZDcseUAFUJUytS6gM0tcQAeIF/LPf3UHIYlpVYPuLgFeKMZPkR9d0KB/AcgVsm+oOVh5jptLeusEIfjcpEqb3Vdew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pE2YST4ruG9R8GnmQ8+4KZbvCk2XZ3h2oHzBJBNFzrc=;
 b=pNECnW5xPOP7vWkthaWftm3RwLAE6URuf2/EmqeFQQHXK72cbYXRB29GWyQyiYN6uPLvjLCz6SCRU2C+tpc3zcxQZ3Lmi3FM7acNk/ikH6rHnW8VGb5+wQkekewIbxAa7IvAxW7pcr6yzlPADjdfjTsVQYFgvLFRKI6P/Bisr1U=
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
Subject: [PATCH] automation: Fix missing smoke.serial in artifacts of qemu arm32 jobs
Date: Tue, 8 Aug 2023 10:50:59 +0200
Message-ID: <20230808085059.13112-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|DM4PR12MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 88153766-55c6-42ee-ef97-08db97ec9fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R76gCFZeY5wJF+pMmdKA6F0hJGTPTHTtzv2h4VWaSu//QUZwCLXt5ixWWcf8/6iK0spLZtoVDHcDexUaJx4Xl+hraMmRmc4B3zRirAQ+hQVahvJgGGEatt06W+JD/gpFV8Oy1YLZ3bS41Hg/VPXYaXqWDMCiVe+RIH3DMnoqb+u7WP0Jz4fnUS0foMmU495dusV3FQmeEjKObHc2L0v+78ShV8yLzw7LwAPn5grU8ObyCKb/ow2iQDTlhffzfVYe/eU/g/Pay+q+bPIdy2BEVsUtd+2X+MTzrVjN9EnEsBHoKvR2vEtmS/VIramuYxN3CIzBO3ZDvFoEVhGbiqXm5hQxnqlaZoR1VvmrZPwggJC1jVa8Nw3gkQ47IKJbPHIWw+9BmdaCZRYsk8MAwpd5eH7FOqpvauQDgyuPQ2eK+o8bmllQ/ue5a0GSxvMp6Lq/Cer30vaFQeyR39bUWdLSUzrsBS23FNmThgyDXpO3lH5vwVl2jlc6g7Jaa/GcWqvs6DeseF27wskrritdBiGIu6ePDnXBA4snu0TBwDeFpGQu9tvOJ4CRrxxRYZnjsPqe17nuQ6JiHcMXsnOomTxQ3CE2mFrOtZo1PScRG7H4ar5mTmq1VgAyziYDIoUTJ1+wg2FDA0DZtf+b6+ddCR6aXu6qHd4qE9NtzWOjRIi9+i/+TuhkHW6VINsw2FrLFfpQ2eLUVYO9RtUIW3A7hkeaFehfHT+FTpNC8+bMzhw+gcKLhPdiZpnqw5teqVfv/jrjrH2hbLNDTeSQi10hOdd6bA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(82310400008)(451199021)(1800799003)(186006)(46966006)(40470700004)(36840700001)(47076005)(83380400001)(426003)(36860700001)(40480700001)(316002)(41300700001)(70586007)(70206006)(6916009)(44832011)(4326008)(1076003)(8936002)(8676002)(26005)(6666004)(5660300002)(966005)(478600001)(54906003)(86362001)(2616005)(40460700003)(356005)(81166007)(36756003)(336012)(82740400003)(2906002)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:51:15.2307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88153766-55c6-42ee-ef97-08db97ec9fe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5133

It was observed that smoke.serial file (used to store boot logs) is
missing in artifacts of qemu based arm32 jobs. This is because the
artifacts:paths listing smoke.serial specifies paths relative to the
project directory but the qemu-smoke-dom0{less}-arm32.sh scripts create
this file under binaries/. Fix it so that smoke.serial gets created in
project directory just like for every other test job.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/scripts/qemu-smoke-dom0-arm32.sh     | 8 +++++---
 automation/scripts/qemu-smoke-dom0less-arm32.sh | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 2c80df089f23..e6f303064a83 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -2,6 +2,8 @@
 
 set -ex
 
+serial_log="$(pwd)/smoke.serial"
+
 cd binaries
 
 mkdir rootfs
@@ -74,7 +76,7 @@ rm -rf imagebuilder
 git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
-rm -f smoke.serial
+rm -f ${serial_log}
 set +e
 echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
 timeout -k 1 720 \
@@ -89,8 +91,8 @@ timeout -k 1 720 \
    -no-reboot \
    -device virtio-net-pci,netdev=n0 \
    -netdev user,id=n0,tftp=./ \
-   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
+   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee ${serial_log}
 
 set -e
-(grep -q "Domain-0" smoke.serial && grep -q "^/ #" smoke.serial) || exit 1
+(grep -q "Domain-0" ${serial_log} && grep -q "^/ #" ${serial_log}) || exit 1
 exit 0
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index cc91238f4222..fb8f044a51f6 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -7,6 +7,8 @@ test_variant=$1
 # Prompt to grep for to check if dom0 booted successfully
 dom0_prompt="^/ #"
 
+serial_log="$(pwd)/smoke.serial"
+
 cd binaries
 # Use the kernel from Debian
 curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
@@ -120,7 +122,7 @@ git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 # Run the test
-rm -f smoke.serial
+rm -f ${serial_log}
 set +e
 echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
 timeout -k 1 240 \
@@ -135,8 +137,8 @@ timeout -k 1 240 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=./ \
-    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
+    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee ${serial_log}
 
 set -e
-(grep -q "${dom0_prompt}" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
+(grep -q "${dom0_prompt}" ${serial_log} && grep -q "${passed}" ${serial_log}) || exit 1
 exit 0
-- 
2.25.1


