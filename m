Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172063AD2C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 17:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449050.705709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgZv-0002p7-Gt; Mon, 28 Nov 2022 16:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449050.705709; Mon, 28 Nov 2022 16:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgZv-0002m6-Da; Mon, 28 Nov 2022 16:01:55 +0000
Received: by outflank-mailman (input) for mailman id 449050;
 Mon, 28 Nov 2022 16:01:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgWP-0004G7-El
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:58:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77f06e64-6f35-11ed-8fd2-01056ac49cbb;
 Mon, 28 Nov 2022 16:58:16 +0100 (CET)
Received: from BN0PR02CA0037.namprd02.prod.outlook.com (2603:10b6:408:e5::12)
 by PH7PR12MB6763.namprd12.prod.outlook.com (2603:10b6:510:1ad::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:58:12 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::3) by BN0PR02CA0037.outlook.office365.com
 (2603:10b6:408:e5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:58:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Mon, 28 Nov 2022 15:58:12 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:58:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:56 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:55 -0600
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
X-Inumbo-ID: 77f06e64-6f35-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jW2Q9cKs+jrPVKxBDKZpd6DzqaPd+QRczDXCiI/PY036uNmX9sk2Pr3ilzyzGUal0pQ6PQTgKMu8eUqHaRvxFKb01fOKjRKoPn5vSN3fj0hThcPMWX02+jdoNRlwi9RH1DRq49tKx/Yn4jjz6bZ2ofbDuByA//0nxigctTvU+4qGquTCRwVG+e4sdrUg/27mqFWQGPt8QRV+6Lr2qvRzdU6ntL2LvLzWOJdRpuWw46ImmduVXGE0smf6YV0eKrXxVvu0ETArzU0LwSQ99DtLh100G7SM81TFIWhlPiv815gxwHDrrBDlez11kk4OcKlxKWerhuJuTDf5YleHPagZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyGm/Jre0Q1vTiMJDNnpqCY6vDpCkDbPz7cU2mXLLdo=;
 b=XrSh6C9r5TBelA0jZX/LbwHAznBWqqJkSk+/RfL27TNTapmwPSTd97hpZVKZNYzTZ3kRwbzpXtSyra1J6P/ZR/9gQE1h4bW1Swx6rIfl7bBl4yDtoWLJzxMolV7YgwnyVSBXZZuopiNSA/2FNcPbSRhPEvfEFT09qL2FKaJfS9q+5NOv8f8eIgiHf/w1Lti216w3ELNIbAGu9S6MsLum2pogxqoR0hgpONTtesDgeABwTeWxhbiRVAmzYWsTpPsLkId/BK+Hgntj/907bO9XVhlxswa8WMpUofawUJ+ILn8h+ukUEV8nnwtsbYjloH/mRErJo1yCZXDLketOcKA7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyGm/Jre0Q1vTiMJDNnpqCY6vDpCkDbPz7cU2mXLLdo=;
 b=c7rnJGYlLXnQoZ5sHHqduup8LzaKj1Oyu9U8TggVQgFBP70zJ1K329zvtyoR667wg3u0G4oCtNsVzYWnEwr5YK1pqvR9dlGs62MNlvMsovbyAjNqLhedXPB8Ez8Qy6j4SNrmM7BReleaAaKCY6b3zBl+xbBs4Hrdp43lkD64PuQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 11/11] xen/Arm: GICv3: Enable GICv3 for AArch32
Date: Mon, 28 Nov 2022 15:56:49 +0000
Message-ID: <20221128155649.31386-12-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT039:EE_|PH7PR12MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6de3ce-d86f-4be6-7ea7-08dad1595a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N3XnHb5ypUHskx86nuoIycheq9vw0svu0UNkbNi6VFVcaroOEWoJWZjnOgLE2fSiUaHB23XkTBDFp/XsE/Mzd8RlHrX3oOiiNr9c4LgjsY/2l/BolOkUqRNLpxSPffmNj79zBMMcJdMjqp7UhSOeVLS0R3+3AN4AbyEfzPu0vOwjndbJJ6/B/lD6u4ZX3C7TGtMtWYkjoyuDzo11CnezeIdQQyocTeY/kjVQkinWyf7kposbRoB3b9aP/shW9Sp+uKPPehbhWhI6CUo2n22U/t3BfQKApM7KdYiPmcloKfgE7Ybl+Pq+DgYNpRPCK3cT2lxsM3rRImwe8M1facZNQLwbemaVaMz7mlzWJykTMpcgcbo56uBOLmOhkA0n9lyzFR2KReJKsd1NRpx5rdVXHJDByRTLHdfj6TooJtJdLm8+K2XiBxXhl1tOKDyFkhWULGUL6Gsv+g7h77ZzXTtkyxYkv31IWtbc9YF/43E69io5Rm8+UUI5EwcsvQpVTY/KBhlyb4PPR2UCDjEHB+amsxhpJeazcDUabv9b4iNhtrIp10Jhp1MumJMYzZ0xO2HxaMBOtf9FkxMwbrHg6y1BDXdQOaxKBoKR8p0tTDx6gnZvCzOsB4jUrMQkz3mUM47YviD9wI2Ul8IhpozUADWMwuNW8gmCQZGZyAmpvWFVb6NYjO8bp6dTegF/cdmgPFpGcMmqXZQ8l5s5an1fdSbKEoxWp7yYrHY989XnZESX7r4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(82740400003)(356005)(82310400005)(81166007)(40480700001)(26005)(478600001)(6666004)(41300700001)(70206006)(70586007)(8676002)(40460700003)(86362001)(4326008)(316002)(54906003)(6916009)(5660300002)(103116003)(8936002)(186003)(336012)(426003)(47076005)(2616005)(1076003)(83380400001)(36860700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:58:12.1234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6de3ce-d86f-4be6-7ea7-08dad1595a2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6763

One can now use GICv3 on AArch32 systems. However, ITS is not supported.
The reason being currently we are trying to validate GICv3 on an AArch32_v8R
system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
"A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
implement LPI support."

By default GICv3 is disabled on AArch32 and enabled on AArch64.

Updated SUPPORT.md to state that GICv3 on Arm32 is not security supported.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changed from :-
v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
2. Updated SUPPORT.md.

v2 - 1. GICv3 is enabled by default only on ARM_64.
2. Updated SUPPORT.md.

v3 - 1. GICv3 is not selected by ARM_64. Rather, it is optionally
enabled. 
2. GICv3 is disabled by default on ARM_32.

 SUPPORT.md                            | 7 +++++++
 xen/arch/arm/Kconfig                  | 9 +++++----
 xen/arch/arm/include/asm/cpufeature.h | 1 +
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index ab71464cf6..295369998e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -76,6 +76,13 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
     Status, ARM SMMUv3: Tech Preview
     Status, Renesas IPMMU-VMSA: Supported, not security supported
 
+### ARM/GICv3
+
+GICv3 is an interrupt controller specification designed by Arm.
+
+    Status, Arm64: Security supported
+    Status, Arm32: Supported, not security supported
+
 ### ARM/GICv3 ITS
 
 Extension to the GICv3 interrupt controller to support MSI.
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 52a05f704d..9d0c45f892 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -41,16 +41,17 @@ config ARM_EFI
 
 config GICV3
 	bool "GICv3 driver"
-	depends on ARM_64 && !NEW_VGIC
-	default y
+	depends on !NEW_VGIC
+	default n if ARM_32
+	default y if ARM_64
 	---help---
 
 	  Driver for the ARM Generic Interrupt Controller v3.
-	  If unsure, say Y
+	  If unsure, say N for ARM_32 and Y for ARM_64
 
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


