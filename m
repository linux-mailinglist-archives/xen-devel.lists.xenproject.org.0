Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779760784E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 15:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427688.676982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olrzW-0007s9-QQ; Fri, 21 Oct 2022 13:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427688.676982; Fri, 21 Oct 2022 13:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olrzW-0007pM-NU; Fri, 21 Oct 2022 13:23:14 +0000
Received: by outflank-mailman (input) for mailman id 427688;
 Fri, 21 Oct 2022 13:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNjg=2W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1olrzV-0007pE-6k
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 13:23:13 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2082.outbound.protection.outlook.com [40.107.212.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7916f7c9-5143-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 15:22:56 +0200 (CEST)
Received: from BN8PR07CA0007.namprd07.prod.outlook.com (2603:10b6:408:ac::20)
 by BY5PR12MB4885.namprd12.prod.outlook.com (2603:10b6:a03:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 13:23:07 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::d4) by BN8PR07CA0007.outlook.office365.com
 (2603:10b6:408:ac::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Fri, 21 Oct 2022 13:23:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 13:23:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 08:23:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 06:23:05 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 08:23:04 -0500
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
X-Inumbo-ID: 7916f7c9-5143-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCWgwozbxZ61cm9wexhEIwNLK8exdWF/0CdKzbEFbLYX5yhYjBjNm2NnggzbZiLK7WkqOOZsUmwQ+S2Ge4qeknxsDWGVvHDR4cKFKy03W9BemixnMiVnFACj2SvRkvmu/zCNp3OKF+9F0S4O8T+QpX6yXsalWj1zvTOmoeP4LUYzrcH9U7bNx2ZqAtnTz79AWM8ZIlOnx97H2eDjgy9tSS7O0y9MpUzM3k6O/epYZWDvSw5wHZqGKwWRaqQVyVsonp6yf4zKrGn7FvJgTL4SQKv7dtPpZ9vlEU/xQw5A9KDVCtSoioxs0J+52avmLDSpzJoPf3jgn+YDtQYXF+bNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42HDqeoTp2iFQDneQaRiYdhWYX5iZ0QaGLIVWemtNg4=;
 b=nSInzib65va4t/vWxrTOvR1iuY6YBESJr+rpjNDonsyktP/Ez8inFKDfBtmS0NWMBATxJzi485cS7SVf2luA01F7k1taln0yVPJscFypeAJl4rmDP4kF7dlsf9entpnTKPrYZ+INpEI9/rN3foDFuZLgvYjlGySVJgf7WwdfD+Obsg5PrIs+MQpRiSiF71uK/AJfvZlZQrWukQvnjHu1EoVe/e+r7B0nry7ka/VlSKe80GxZHOmhWPsOvEh67Ok0/0uEOHjg82BTpVEr3uEMV0Btc3zykVanWpoDeTPdn1B8xtNCSGcF2/p6FcAVDImL9UfAMu5ouAG1mrzIDy+Ihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42HDqeoTp2iFQDneQaRiYdhWYX5iZ0QaGLIVWemtNg4=;
 b=G9GquSI3rmYHLfZvRTA1PELyOoImejWPeSUV0CdfJKOB2XsuLmMmPwbpNSj4SyBDW2EhNCGbfbbo/YIITZoVkb3UaKPOZgMZF7xazDbxRCEvziD/3cr87FzyaS5Md5KI2aR+/GrQcf2gHm8YDinGQorw3te3mGPath7iSw3zy3w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [for-4.17] automation: Build Xen according to the type of the job
Date: Fri, 21 Oct 2022 15:22:38 +0200
Message-ID: <20221021132238.16056-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT038:EE_|BY5PR12MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ea1f3a-1545-48e4-cf98-08dab36763fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rkiNPgVjpEQ+A4x31gGDp0V+wdvxji3zX8SEBBLXv0xOiSihLt7ZR5aTmK+D4GIDApusfL0sDaxOKV0bBh/dX6PYalANTR+V9G5eyUoGF+G6antxwygopSgqjVRsFhc8NF+DUb1imhkQcyF9qcNXjvT5IVqKkk8K87nJQAkx/wuKvO3i27lQkRSUIPDIZLFINClrm86qC39qRW3MefOh+FsJWzrrXOFdVdSpjGJf3IpEghQM9gm4aQ+1cAqU8bcE03doUPffemBswYo+pog+au4M4H/h0CK5Tg4o+mw8T/yTnU1RPM78q4ZPoEWKU2gSsOHDL8auK8a2UbGG6PRYGYT8rvTlxK+IyLIHvyK1EAhYylo/2IDsxtEZjDkJTxSK+eus/n62d2xvKYfWoRXWfbFt2xYIhw7v9p2u67X01J1Mb3Ki0pfj53MjMKzXnguLckXgWOuBsbui2hpSMU1hcBUn/E1mQedIPZj4NpTh1gFXshDNSG/HfbRctbgEdSwiWUj9zpX89wKQZKjLA11tmlGeP/qq6ua++YTDl6XGhdjYFf4Q2D0oG6SIONBtV9T8dvDP+prLjuUdk+dZ6kxTRsiCkKP10SGdsKPF6J5DJ4NhyaEGkGPnUWD0RSRgLIJ5k2YpTNJ1R5lyHIPLBN1MWsjJoKtoImQ3jtOzXK3CjlH5YKMEigIb5D5AbgveLuZGRM9RMEMMDSr8GvUvuptQGrkViWBNIg8m1Tvn2u19tmdaLIwwysb1MaM+n5H0r2gk1jPJVLG3k5qGVfenjHrniG8zd844rNk+RgZ8vEaDZn1pp0OJtANkmdEgsyjqv7M7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(356005)(47076005)(6666004)(81166007)(86362001)(316002)(5660300002)(8676002)(8936002)(41300700001)(70206006)(26005)(40460700003)(70586007)(4326008)(40480700001)(186003)(336012)(2906002)(426003)(54906003)(6916009)(1076003)(82310400005)(44832011)(2616005)(36756003)(36860700001)(478600001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 13:23:06.6171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ea1f3a-1545-48e4-cf98-08dab36763fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4885

All the build jobs exist in two flavors: debug and non-debug, where the
former sets 'debug' variable to 'y' and the latter to 'n'. This variable
is only being recognized by the toolstack, because Xen requires
enabling/disabling debug build via e.g. menuconfig/config file.
As a corollary, we end up building/testing Xen with CONFIG_DEBUG always
set to a default value ('y' for unstable and 'n' for stable branches),
regardless of the type of the build job.

Fix this behavior by setting CONFIG_DEBUG according to the 'debug' value.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Xen used debug variable to control the build type before switching to Kconfig.
Support for GitLab CI was added later, which means that this issue was always
present. This is a low risk for 4.17 with a benefit of being able to test Xen
in both debug and non-debug versions.
---
 automation/scripts/build | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 8c0882f3aa33..a5934190634b 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -21,12 +21,13 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
     hypervisor_only="y"
 else
+    echo "CONFIG_DEBUG=${debug}" > xen/.config
+
     if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
-        echo "${EXTRA_XEN_CONFIG}" > xen/.config
-        make -j$(nproc) -C xen olddefconfig
-    else
-        make -j$(nproc) -C xen defconfig
+        echo "${EXTRA_XEN_CONFIG}" >> xen/.config
     fi
+
+    make -j$(nproc) -C xen olddefconfig
 fi
 
 # Save the config file before building because build failure causes the script
-- 
2.25.1


