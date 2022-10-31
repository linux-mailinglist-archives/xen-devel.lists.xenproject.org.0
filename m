Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA266139CA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433036.685952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUd-0003s6-OS; Mon, 31 Oct 2022 15:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433036.685952; Mon, 31 Oct 2022 15:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUd-0003nM-HS; Mon, 31 Oct 2022 15:14:27 +0000
Received: by outflank-mailman (input) for mailman id 433036;
 Mon, 31 Oct 2022 15:14:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUb-0001KF-Tt
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3f06997-592e-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 16:14:25 +0100 (CET)
Received: from BN9PR03CA0878.namprd03.prod.outlook.com (2603:10b6:408:13c::13)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 15:14:21 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::d6) by BN9PR03CA0878.outlook.office365.com
 (2603:10b6:408:13c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:21 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:19 -0500
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
X-Inumbo-ID: b3f06997-592e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzfLaBmB9hRMxjzUqTgLvUaZCKOkMk4+Bqa5VI6X/Qwbt2jJO/2A3Uekk5JJ8ia/G6BnqgfFE3Ef4LwpjPW24j2T3q+QpLjqZXAJMdzvdioJbruFG0kutOcOdkVaLY2q7L02J6/vzFUH4d9pXN3sNGEw/qkDTOc4nZ2BO1afDNWrHaxaS9sEbHK7pg04lDGs6GiYatRfBhIZXoJCRksPXlueu98nUQXIjP6epY6mkY1rA9yX1Tnw9cpsUEhVwcd3qeEnH2N/wjVZazTFSJ+jRwatIFjdEvH71WHfX26MzmdHG7DvsdmTTPVOR8vues4hO2tG6baPxQGaC0ouHFk4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thswsDnEpoVXekQFz2ERdchgMy9LbS20QZGymqiADZU=;
 b=H8jThX7ffAPSHjX/JHx2y7eQUeVDD1tg18ArZVZe6jb49I6QThM8Wje687UkpK51lSCYsPhB0hGJwdUpqB1bkz48pxyD483WGuzHEsgN/fz1YF4pH8F06yyjLoQ7WpQqGGd9xB2YLtymMKHmnRpJttJBP+fWrrp+IhDs6tomYA8adi82FYXIYQkqQO1hmbbC7Tg/i9PGobf1SwlceZEy3q7nkTYRoYKVxL+akRZm8LYrwYs3lFfc3bOzrXZios85hmIKkAqGGM0rVNi9oNwDDgSRIFYgCZXh1pQP3VrJUnEUuGpfykdCLbnJ8alqTc2k9mDhwjS1yqBSfK7ezF9w/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thswsDnEpoVXekQFz2ERdchgMy9LbS20QZGymqiADZU=;
 b=tYhr3ZvXLqJgmskhKO0GQ839rE+PbNl9WaY8bRovC0lJnUnai6pKDPCCt2b3Omt2P7ELE70CYQ3abohKgUC/UUeVK3h55BDFEvmJO+JYaetyB1zs4bf3ThlrL3UqeiSSB0zAtUI4r3+hesaInqY+1uwTOWO+G5m6+0KCN2jIieE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 12/12] xen/Arm: GICv3: Enable GICv3 for AArch32
Date: Mon, 31 Oct 2022 15:13:26 +0000
Message-ID: <20221031151326.22634-13-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|MN2PR12MB4440:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f961f8-e35e-41ba-6937-08dabb5296b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ul05mLEvhkOfwIr2YqPl13UCqovYsIUmykUUKu2cZkhqMJO86zranB6C5qNzh0N+iCbXDUcE49uZ2Ork/uq4MkrlzI9Xj7J99I75biCeXZm849Dr3V0HAvLQDvhspr+0lD9i3Tsn5a1AWoooeDDyguYpWdgrVfco/FW4ovieKHUlBe/CmEyb/p9B17zHwt5UQgex7qfLVQox95oM6wexjX6GM7C6GiLE70AQH3Bp36Att9fSsgPLf/oyERQSie22slt5VZebyMOafKGsd2w21cbQYjrg8GwR54iyjlBABCJMR+gUObWyiqnRd0rYAuT84hu7LIOL40SGEWMOvTsax8Ms0UmGAyJDylU6bHSmoPLT6iPlD2fK540e6Rvd/sBHrhg00c66/iR1DHDAC4qU/Bn4Dwn6/Sqk9X0H72f40y6G1xJvLEwAohDjJfLIPT5dkzdUHHiSFIoKQ610g1H1IrheMV0z6xXL23sOX55OiCfViyeWJGHGtndw40nNItxziK3Kv//Ul+8h1iGff/kgluN8k7/uCxwh16gBNtMMIE2UHPivBXSqIphaq57/aqCOd2gk8cmY+XiCm/60IlTUf5lErp+NHU0DP7wmfbtz8v3mQcT8UVrt86IWnEXBmqrZhlf0/Uc3hPP/pLVgES+8tQy71AAWnnN7WZK/gkRyzhaC+DJd/FuFni90yFusUnqUisZs21SozGAxGzk1hGYZTJnPWuWcT+0+4IWzycnt4kMFDYqKla8qBperfTDXLOfJsyfsP0433GG6U0dotyEIcGuFLFs8Vt8oKSNjMbfG79jVQjksfgtNqwcP+WdecLVR
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(6916009)(36756003)(54906003)(316002)(478600001)(41300700001)(40480700001)(83380400001)(5660300002)(1076003)(186003)(40460700003)(356005)(26005)(426003)(47076005)(336012)(2906002)(36860700001)(82740400003)(2616005)(81166007)(6666004)(8936002)(8676002)(70206006)(70586007)(4326008)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:21.6192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f961f8-e35e-41ba-6937-08dabb5296b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440

Refer ARM DDI 0487G.b ID072021,
D13.2.86 -
ID_PFR1_EL1, AArch32 Processor Feature Register 1

GIC, bits[31:28] == 0b0001 for GIC3.0 on Aarch32

One can now enable GICv3 on AArch32 systems. However, ITS is not supported.
The reason being currently we are trying to validate GICv3 on an AArch32_v8R
system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
"A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
implement LPI support."

Updated SUPPORT.md.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changed from :-
v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
2. Updated SUPPORT.md.

 SUPPORT.md                            | 6 ++++++
 xen/arch/arm/Kconfig                  | 4 ++--
 xen/arch/arm/include/asm/cpufeature.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index cf2ddfacaf..0137855c66 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -82,6 +82,12 @@ Extension to the GICv3 interrupt controller to support MSI.
 
     Status: Experimental
 
+### ARM/GICv3 + AArch32 ARM v8
+
+GICv3 is supported on AArch32 ARMv8 (besides AArch64)
+
+    Status: Supported, not security supported
+
 ## Guest Type
 
 ### x86/PV
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 1fe5faf847..7c3c6eb3bd 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -41,7 +41,7 @@ config ARM_EFI
 
 config GICV3
 	bool "GICv3 driver"
-	depends on ARM_64 && !NEW_VGIC
+	depends on !NEW_VGIC
 	default y
 	---help---
 
@@ -50,7 +50,7 @@ config GICV3
 
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
-        depends on GICV3 && !NEW_VGIC
+        depends on GICV3 && !NEW_VGIC && !ARM_32
 
 config HVM
         def_bool y
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index c86a2e7f29..c62cf6293f 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -33,6 +33,7 @@
 #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
 
 #ifdef CONFIG_ARM_32
+#define cpu_has_gicv3     (boot_cpu_feature32(gic) >= 1)
 #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
 /*
  * On Armv7, the value 0 is used to indicate that PMUv2 is not
-- 
2.17.1


