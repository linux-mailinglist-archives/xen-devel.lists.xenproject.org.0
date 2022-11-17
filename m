Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6D62E15C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 17:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445282.700402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhZk-0001r3-5J; Thu, 17 Nov 2022 16:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445282.700402; Thu, 17 Nov 2022 16:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhZk-0001oV-1S; Thu, 17 Nov 2022 16:17:16 +0000
Received: by outflank-mailman (input) for mailman id 445282;
 Thu, 17 Nov 2022 16:17:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovhZi-0001oG-GF
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 16:17:14 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aad52d7-6693-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 17:17:12 +0100 (CET)
Received: from BN7PR06CA0070.namprd06.prod.outlook.com (2603:10b6:408:34::47)
 by IA1PR12MB6625.namprd12.prod.outlook.com (2603:10b6:208:3a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 16:17:09 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::b3) by BN7PR06CA0070.outlook.office365.com
 (2603:10b6:408:34::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 16:17:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 16:17:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 10:17:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 10:17:08 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 17 Nov 2022 10:17:07 -0600
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
X-Inumbo-ID: 4aad52d7-6693-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlXfzg68BpxYKEWuMM7SvbZQiPQWAt7f15r6nyxApd01MYgAuWFbtg2Hq0LzISManbC61JRuO6ZFttSXPU4ah8un0u2xQrPNVgbiWNzI9day22lg1l0R6wBzK1S4uBGQBNRQ3B3CIskDXVow/IhOpvDlAEqpgU3WbuBt9L/LN2btUiOiQ6kPMr4/WbIK3MKHiQ+AAQRGc6uHx0zbSNqzIIYbj8fPdSnyhbDF9+Kjz+xa/MtifuPIYhq6DulHsYpUBi1/CdoumhfwPlLJasMGAUO7pCsNihNQw/1lKN8hu96Yl/AFYPbAwMgg4Qi1ECYxNASw3bCRWia53bLHp6Ozzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PykDC6RlR5P0Fh4XODBld9/bS/82sULTw8zRdzeWUZk=;
 b=QgGbgk5Uak9NK6L/7S06bZiFfb20vlVVlKNKRL2Krq1ZF8cCX0lABQLaENsHQ8ECX5ciwoRMkndqeBN7RtYX7BGNgEIikIJxau0he/eIz+ZjnZqsbaCyfUqA1WjZeuoB5QHmE8MJaB/KQYF6ElnY7WFPb/Nk3GzzRMSBkwf+AnHuUBQAVoJd6QLyxe5LVeMunMjfw2HegZr7TTFF367cy+feEBB+wIS3GfBf/jHXqlNgzfJOJd7/H8d7wmsBgMofyZkujaSQcJuPrw+gZOs+HyGT1s0Hqb7GaEk5AI0EWYcxKYhTHF5GG9NlNm8Aniad82u6p/ARNteMIAy4JWEf5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PykDC6RlR5P0Fh4XODBld9/bS/82sULTw8zRdzeWUZk=;
 b=nEj5/X003KXT+4ZmITI0LTUtGeWxEN7F+LJUQhqwswsH9BCqR8c3gG07gY+TnH0EJTAcIWxcQopWxe0FkLIJ+rurugciIn1Wr9+8dYqQeaBBM2xyfCZBHpJFKQLTeJ82dID81NaypwUVmmsw/FzP9aCz0ugigaYSZlqu9VuvkN4=
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
Subject: [PATCH 2/2] automation: Remove installation of packages from test scripts
Date: Thu, 17 Nov 2022 17:16:43 +0100
Message-ID: <20221117161643.3351-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117161643.3351-1-michal.orzel@amd.com>
References: <20221117161643.3351-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|IA1PR12MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e54a16e-779b-474d-edaf-08dac8b72d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TTx8PD3pf3artX4Uy3kyCBy0fOzWYJC8h63n4Xs8o5f74V2iGCjPFg4QehzXIjBovBj/CtSonQjzSO3jRg0YI9CLC5B05FfeGvasgI7NzK8wiuYCQXNWbhhLSVldzcLEAQ9YB2fg1uQ5lKgQEjxMWYRCzD7RQlfIfhVCJlg5qMRwO9YF309Hita36tvqopPOEGNhbwPxC0z/3Fra10i6oPh8kz1ManWAUZlFtpgcL/ID7n1P0ifXJ5zob2i+FZk7lGB7+YrC5p3NdeQ5n542j59Y4l9au867GAINvBbZxWd476Z90Vlx7zTL7JVS2kbtZgATGSuSba4xv/WZysgouVAXoa9OpVgd1aebNQzCVkrwI/zLPz17uwycl00m1mHcSgi3kVcdm2/4xiKnJ/puc8aoTs3cDhJIiqzccOkKbxVQJKZnXc8YsFMkUtCXwh5T+vFhL3h5ryZ9DWymX28qM4Ki5+19rAe4HeePCyf+Qn+whPCrg/zwiBkXXbB2ReAA052gEoQIO3HL2te+FRCNfS0I/HSq1ST9RlntwaLxhIk9PkXiRcWFJZhVEbZBZIKIU+VAoTE0tRPUgIHVWbDl7DRoZmqDvz7qGWA22fJvuEVLaGsLdpN+9giCYBl9rmbiGHiuefErwyF0eYa/lQ2BcAjU3Nxd4+3Zpj02KDgcLHMyqFBDpHPdFOq2GOakkXUFX7xYP9aaYCy+SgolwDMWFIXqKb4NFmdn8Y/IW4wlZHPaukbuDCjpNUkcugaUCEQTwuiCqldzqOwkkQkalp+BOeyCIwEQScr729199OEGwfX7A8322Rzo+LvZ+C7joraKiiab+SlBIMJ8xe18hD/D1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(2906002)(4326008)(81166007)(356005)(8936002)(86362001)(36860700001)(83380400001)(70586007)(316002)(1076003)(6916009)(54906003)(426003)(186003)(2616005)(336012)(36756003)(966005)(47076005)(478600001)(40480700001)(44832011)(8676002)(41300700001)(82310400005)(40460700003)(5660300002)(26005)(6666004)(70206006)(1910800001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 16:17:09.4396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e54a16e-779b-474d-edaf-08dac8b72d88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6625

Now, when these packages are already installed in the respective
containers, we can remove them from the test scripts.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/scripts/qemu-alpine-x86_64.sh        | 4 ----
 automation/scripts/qemu-smoke-dom0-arm32.sh     | 8 --------
 automation/scripts/qemu-smoke-dom0-arm64.sh     | 9 ---------
 automation/scripts/qemu-smoke-dom0less-arm64.sh | 9 ---------
 4 files changed, 30 deletions(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 2e9625109c56..8c8d0b0cd759 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -2,10 +2,6 @@
 
 set -ex
 
-apt-get -qy update
-apt-get -qy install --no-install-recommends cpio \
-                                            busybox-static
-
 # DomU Busybox
 cd binaries
 mkdir -p initrd
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index ef19b988c2c4..98e4d481f65c 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -2,14 +2,6 @@
 
 set -ex
 
-export DEBIAN_FRONTEND=noninteractive
-apt-get -qy update
-apt-get -qy install --no-install-recommends u-boot-qemu \
-                                            u-boot-tools \
-                                            device-tree-compiler \
-                                            curl \
-                                            cpio
-
 cd binaries
 # Use the kernel from Debian
 curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 9004c537e325..0bf5cfdc61f9 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -2,15 +2,6 @@
 
 set -ex
 
-export DEBIAN_FRONTEND=noninteractive
-apt-get -qy update
-apt-get -qy install --no-install-recommends u-boot-qemu \
-                                            u-boot-tools \
-                                            device-tree-compiler \
-                                            cpio \
-                                            curl \
-                                            busybox-static
-
 # DomU Busybox
 cd binaries
 mkdir -p initrd
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 933209e2e01e..2b59346fdcfd 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -38,15 +38,6 @@ fi
 "
 fi
 
-export DEBIAN_FRONTEND=noninteractive
-apt-get -qy update
-apt-get -qy install --no-install-recommends u-boot-qemu \
-                                            u-boot-tools \
-                                            device-tree-compiler \
-                                            busybox-static \
-                                            cpio \
-                                            curl
-
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
 curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./binaries/qemu-system-aarch64 \
-- 
2.25.1


