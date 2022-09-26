Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A825EA246
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411620.654636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocluj-0002CU-Mg; Mon, 26 Sep 2022 11:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411620.654636; Mon, 26 Sep 2022 11:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocluj-0002A7-Hg; Mon, 26 Sep 2022 11:04:41 +0000
Received: by outflank-mailman (input) for mailman id 411620;
 Mon, 26 Sep 2022 11:04:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ocluh-00019b-JU
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:04:39 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01f854ad-3d8b-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 13:04:37 +0200 (CEST)
Received: from BN9PR03CA0059.namprd03.prod.outlook.com (2603:10b6:408:fb::34)
 by BL1PR12MB5351.namprd12.prod.outlook.com (2603:10b6:208:317::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 26 Sep
 2022 11:04:31 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::6) by BN9PR03CA0059.outlook.office365.com
 (2603:10b6:408:fb::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 11:04:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:04:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:04:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:04:30 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:04:29 -0500
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
X-Inumbo-ID: 01f854ad-3d8b-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPWotNZqldA204miG2KMgcabAzWqAfh9VmuNcFasGdyWMnT2uKoJxeGtJFJgdVCJXUs08s3fBsJ1+euPjeyCpVKcooffraFmtFm0GDbHdqWCu/yrsw6JgwR21D3RKELzY9MCqAv4LeuRYMRUfthdrKXvDfvshT0h9Q1WXXxNsEzHiQtIlAHPxdVm2yoCX4mlTL5Z4Wecp0ajTRJf9lwRxMCUkb/KCAjNl0MO/m/VqKj7dfzwAIOt0vWB+J05ZGU1pnd8SmOL8r+F5GbCnGp/D8Oi7xbBk5oePUaC4zHVEeAedzc5I7rmCeyAXqsjckejohNwbE5Y1bwZMyQhX+5azw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhykJUo9YFworA8q6pNfA9PuivCZjxRRVKJJQTCPJoI=;
 b=PGZClx1V0u8wxsIE0z6HXWHniIacSDTUD+OztuMglCYYfcqX6VJSn+SGIous0Izsg4/oVzN6KDBXBFP0/i8SsPF732If5Djb7haFAXZXFBW/mOLFCIUWIt6O1OHzfJqjaL1cCabA3Nfi0ZWwE3giuRry+RDK9Cm8zr4t3NcCOGLaAxXbe5wCDBaUzLROjNdLbm0Wi1LO5oMqW2f4ckw79O12EPkUZE/I3J7gFlMnwMCMxK81zbitvwGvjYz1Y3yaoh6FUV0sgtHMcAwgXO5BIdLY3VLED9u188J53vRaJ50q6SkxWNVFaxkNlVpIN1v91vOc2Ly2HztlOlDosW+2Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhykJUo9YFworA8q6pNfA9PuivCZjxRRVKJJQTCPJoI=;
 b=mUPgaM6TDP7okXCbHeZ34SWCuAySQyYSRo4S9Oe8F2wvwjwUMhqZ39m9YMX1tAqVcRFsANJLucmiw4fVuqOjZUsmUG3o861t3ljTBi4p6SNTHQHbNfCbVuTjb55+hfiQYWaohKGNl8zU21lLO433Bi3Q0sAcaSqM9kmJfk93wBQ=
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
Subject: [PATCH v2 03/10] automation: qemu-smoke-arm64.sh: Increase RAM size
Date: Mon, 26 Sep 2022 13:04:16 +0200
Message-ID: <20220926110423.26030-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|BL1PR12MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: c27f0036-780d-433e-7f2b-08da9faee388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nmPVktz8wTV7Lsz5ZSGfXtG2sFT7zugObt9sxjzMjWcD2AK2Llzk+82km9qXTWGZAFQSiYiLGAfJie+wOWUN0EgcExxurItF0tDziJ4kzkggKBCpKXiGz6juOTLusjwxeIBN3G4B917W4rPoYt8XWNKXXpFAShwmTTxGSfw1ueXSc8frr8Z65RzljzFDWRepIkXyZI4Qw95plpZMeHJz6x+nYzYV7wodn1tKy2mQc+zpDbHREP1Cdrl5mVgynGFtwsPQ2THHnSnPjZlopOcjWj/2zkluhoWJKBtnqG0lTv3DAzAOH1c5q5BoZLEmsF9AYEy3uUmvVdoJMeRynDT5y0IHT4xShaLLV0mtH6GbWgmFF0U/FA9XkQaKxnM7+d/rMjnYxcpvVi5pWqZ9RktY+ZTfQwdBD7xMGWoMmPU2P2/PCUIj1fP8U8y9YZJCXShwRy7sqE3oJi/pcKXTVBBsg4PfPb+bkwmwcR4Zqa3355SZwtCM1mVYLDd3mAfo20CrPKwqXwe6A32LQHf9WvLRmp8ksYMXQpuewvluvylGxSg3Y/lcsnWoIMuoGOG6jfzxB7CVJ6PsrTl3OI2cOXyw8UCpqdLjaPQCTcQ2/0ZOzNSpFJ844bpgwMHWKXXfYA2BMe64pS36GOLGAZOTfuB6t6aWGjLmoIA50STX9LfJSEwBNH+0lGtvsAF1W/mNEQbgLq1CqFhGbP6e3twmkbX8dv5KorykrBkoV5tlK4apM4IVd/jG4Sxc22CUBteaf+utIjhP9NGIv1UOl3BRCaMKdMt30GBh+H2RB8gP9H4I357Tt96vJN2Hq8hsv+1Siz/V9y6zF9tCvXV/Uxq4r7HV4lz73E3718rtbSAmfGztjRY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(6666004)(41300700001)(26005)(478600001)(966005)(5660300002)(44832011)(2906002)(40460700003)(82310400005)(40480700001)(36756003)(86362001)(54906003)(6916009)(316002)(8936002)(4326008)(8676002)(70586007)(70206006)(47076005)(81166007)(356005)(2616005)(1076003)(82740400003)(36860700001)(83380400001)(426003)(336012)(186003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:04:31.6064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c27f0036-780d-433e-7f2b-08da9faee388
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5351

In the follow-up patch we will add new jobs using debug Xen builds.
Because the debug builds take more space and we might end up in
a situation when there is not enough free space (especially during
a static memory test that reserves some region in the middle), increase
RAM size for QEMU from 1GB to 2GB.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- new patch carved out from previous v1 [3/9] patch
---
 automation/scripts/qemu-smoke-arm64.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index f803835779f4..dea26c6c0a8f 100755
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


