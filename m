Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6C95EBEEA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412368.655669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Br-0006f0-Aq; Tue, 27 Sep 2022 09:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412368.655669; Tue, 27 Sep 2022 09:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Br-0006Yh-5b; Tue, 27 Sep 2022 09:47:47 +0000
Received: by outflank-mailman (input) for mailman id 412368;
 Tue, 27 Sep 2022 09:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7Bp-00061I-Qf
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:45 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f4eed5d-3e49-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 11:47:44 +0200 (CEST)
Received: from BN9PR03CA0718.namprd03.prod.outlook.com (2603:10b6:408:ef::33)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:47:42 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::5) by BN9PR03CA0718.outlook.office365.com
 (2603:10b6:408:ef::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.27 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:41 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 02:47:40 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:39 -0500
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
X-Inumbo-ID: 6f4eed5d-3e49-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql16UGpPEA3xyGtwRFmtmbmCJqfgcBgKUVX5q+5/YHUSi74a0ny5dMWIErzMhc1/NnQY8zeoxaRlusygXC79MIWBfbqevqvIAfiW2NSahQcB14bWdVetIN79vJxXIWvkojs2WEjlNBY1X2rMDguX4XtevzM/eET1srBy/guIKYTL3Cz37pn5XKAsy+JJwzv59ct1fdmsWJh3gRwB/P1EXPRtoTx6Mq2MUeUO2A/5lK2xlXHhBBBIatb96u6LfwAs+1UuDRjInxMnrrLnPRchn6JRmCYDyRYLl5xQKyn+kYnirP+pF0X1AsnXnZjPQ6y7MnqGoXSHXU6ezAy8WFeVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fY5JlIKf+ph5S89SuUOmRzi2nm3ceC5eVYCGsXFJMeo=;
 b=bnI+N7MdzMDifH8u5/4XO8gI3V6tIQDrEVWESFX+/YPDn0pqyOZgcWF1iuIj95J0JdK0L4nafN7XnfmgZth/ip4NBNSoWfiUKeVOWSta8D+akVgGs1TpBDAy0IV3H62zaMdR5Phg8mHIFQbe5RrDlqgbqNpsoIjrCH0h2rntRElIYLFwACJsetDKWGEqxWCJUK5aE5lq6vW9RoLnr2eL2G57JgwJ0RRr2hHY/VW7gFSZklsX4MhbHFvqOjU5PbSUuQ5lsGJoiE2CT0TCTvBZpEBKGPqVwyAXAr2qcw4T8uiwApotUCGaerNAZLVYKk9j52nhFHCzf/fJiwj5Qn3vsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fY5JlIKf+ph5S89SuUOmRzi2nm3ceC5eVYCGsXFJMeo=;
 b=XIVCjx0z7b8jz5V3ANAaECA1c5TaJoheHFGOlcyyDSCnGy4TvvAAKbn6f7Cj7NCYl/cNhvizgkj26zWAVd43GJXzI/1Y29QzwmG7p3QiAzl3yPBAoBiFSC0zEUIXIRVY56RXIzrSTIIYnyKYG07iAJw878n9qV9mmULgJfklS6g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH v3 03/10] automation: qemu-smoke-arm64.sh: Increase RAM size
Date: Tue, 27 Sep 2022 11:47:20 +0200
Message-ID: <20220927094727.12762-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT048:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 17234022-4544-45cc-193f-08daa06d5244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vS07UslcptDDVnrgl9V/BBPAq9w6O+aD6su/2zIodvsXQnacfJDVcqYVi4BcbqfTT3rjvy+pjfV9vveh2HdJw42kUPCm33Dl5As04EVyaecCtdTwCsbADVBheQfeotwgYKdebEqoqGYcILRK7xG4YOwn/hGjm++pVLFmu7SebOQnZ2Jw9F8MXHcKQ1Rpqb2uvBEw4DaLofqJoRCaLt3Yq7eSo82KPTuPBJ7GBlGZM3ulNjH7iUttVIK1NZVr0e9x4d+BzTsWZAAa+KE8qb+s7qkb8ATeUcx6349q+xt7GxcaVydB4OTqyvEAWaNGOA7c3yeh+o2/Makcbw7WgwWUV9iPjTLO5UtGymCmv5vZZtj0eHbmIKFws3WoVRomlpIQVh/Ygv67C33ngNupwIrE9HUAK02X7nUTsV0sMgYKDziaEdzGvkQMn1X2B4iD5cZxgktfzFBCuVYYsGxInHAUmoL1cG3/4748RfERTlfXHRyyq8eZoYD5WxVYYrua1xqtWx+KhcDNFYf5iy8PoQnEF2QwffuRi9uJtSz5gCpvukfMvD0bcdJTYBkmNMTvUb+a9ffhT0jmybjqHYFOqcvZqEoS2DNJ8PTKQ6NvGB+JKJM17JfXdCIRJ18Nr657ontfvH+fMeB+AoXI1ywz5a5eiwcr5mqVQWsQi5apg05kd9vCO4drQu6c2EUlGcwcYd2iA6zvYG0LWIWYr0weo+DxyvAdXvnifS/FlP94FhDSpxYGB+qrjkz31MU7M8+/ZVoMmHJq1RFWURzw/8uLyna2s+Fsdwd5ZlksZ4rzy+FCQpQLQthBq3VLb0OKlTZG0RMcQCHsjZ9QlWU6r3MgmqdGOtPgjouFYnOX+qBe//4/iz4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(70586007)(70206006)(8936002)(5660300002)(40460700003)(81166007)(36756003)(86362001)(44832011)(2906002)(356005)(8676002)(2616005)(336012)(186003)(478600001)(41300700001)(1076003)(26005)(6666004)(83380400001)(426003)(54906003)(4326008)(316002)(82310400005)(40480700001)(36860700001)(6916009)(966005)(47076005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:41.7639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17234022-4544-45cc-193f-08daa06d5244
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202

In the follow-up patch we will add new jobs using debug Xen builds.
Because the debug builds take more space and we might end up in
a situation when there is not enough free space (especially during
a static memory test that reserves some region in the middle), increase
RAM size for QEMU from 1GB to 2GB.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v3:
- none
Changes in v2:
- new patch carved out from previous v1 [3/9] patch
---
 automation/scripts/qemu-smoke-arm64.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 5b566072f72a..933209e2e01e 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -52,7 +52,7 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./binaries/qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
-   -m 1024 -smp 2 -display none \
+   -m 2048 -smp 2 -display none \
    -machine dumpdtb=binaries/virt-gicv2.dtb
 
 # XXX disable pl061 to avoid Linux crash
@@ -117,7 +117,7 @@ cd ..
 
 # ImageBuilder
 echo 'MEMORY_START="0x40000000"
-MEMORY_END="0x80000000"
+MEMORY_END="0xC0000000"
 
 DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
@@ -158,7 +158,7 @@ timeout -k 1 240 \
 ./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
-    -m 1024 -monitor none -serial stdio \
+    -m 2048 -monitor none -serial stdio \
     -smp 2 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
-- 
2.25.1


