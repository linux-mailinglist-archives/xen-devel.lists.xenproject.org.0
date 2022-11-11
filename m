Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47076625CD1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442585.696961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrh-00037E-IR; Fri, 11 Nov 2022 14:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442585.696961; Fri, 11 Nov 2022 14:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrh-00031J-Ei; Fri, 11 Nov 2022 14:18:41 +0000
Received: by outflank-mailman (input) for mailman id 442585;
 Fri, 11 Nov 2022 14:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUrf-00085I-No
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbe728aa-61cb-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 15:18:39 +0100 (CET)
Received: from DS7PR03CA0145.namprd03.prod.outlook.com (2603:10b6:5:3b4::30)
 by DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 14:18:35 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::1d) by DS7PR03CA0145.outlook.office365.com
 (2603:10b6:5:3b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:34 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:18:32 -0600
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
X-Inumbo-ID: bbe728aa-61cb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUusyGVrtXgm3jfhJhYpk/ozrC3Ol+6ckGPap16FHNK0ba2z6kqBOTb+NrYpAPcFea8TETzThNqE73psy3xSqWcs9kWKOcbzGA5eJ/2gpsGrJB/Gd4SS22TELMBvLzYHK2MDWIH9aW5mhaAb7lCKZhwR77exFirE4cryN/pTRLX77PMi1hsUJNgYYi+RWxDW2CCqynFIzgdvp5r/bXXuwAmE+i9HdbYvCkzhI70XWKlie7ahEeRkP/QI8H54iAOhE4jtKMV0bqfXpe4S9DTySIQRVarbbZfdj5DYXjnBILZyl1H4cHQjjRY7zzW82cH/dw/WyJ+ZkeNWzQ7/3pDPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rC2CEEelnbLAOBw163E+15A6DiW8jj2UsQYupwZAM2g=;
 b=VrudPAi4VpiDe30AjvxZbeaHW4Bek0PUq3BLpSldrtc9iA575JkIPo1G0aM3w0yBttGbpM8XV9mw9RfpM8NKm6NR0txfeci9FcaWDeof1otUsywWAxWXaXDsC01zrhjSG4R8yzOcPM8qkp5vofKXVFFtxsn1Mj8OMEd4k3vb2cZCduX8e35O1S7jUqRBjZ6qiYbfayITZNnRt0MN+l561AOxRWicj+qBsF+kf8bd5MZRd2p/8uZiJb+ztRDS7Wfsnf6jhcauReH3gD/60Qugt1t800enDnFRQ1WggqHXFS8btXRiIRyuFktvdnm7vOklf4OhSm9TSVzIwP8EWrauag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC2CEEelnbLAOBw163E+15A6DiW8jj2UsQYupwZAM2g=;
 b=TJULe66gespsRJW/aAzmTJEukRVB7dG5pEzYRxW2Os8K0bYhe01Ut2YT86Z6N/2XR87RFYwIBqIZkhxdQpNN2+Cyr+repK00F7rSbcZMyC6qSCOq83cnLflUg/xA7JN+cQue1RQpXsP2mTMFV8M91VwO5SMbbB9uiRN/CDyHGGE=
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
Subject: [XEN v3 12/12] xen/Arm: GICv3: Enable GICv3 for AArch32
Date: Fri, 11 Nov 2022 14:17:39 +0000
Message-ID: <20221111141739.2872-13-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT023:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f5c4d0-fe23-4473-d92a-08dac3ef9ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aqB9KHBg2QXaAO7xJlTW79jqgvm85wELiz0N3uG5Bs+gicghnCa6F9H9hxxet7cVoVL/nYJqltUNgeC+5bdyhHsV0+8dgcpgrM+EKw8E6VF1lFLhZHFT9aiotBWBkVCkmURSACz+IgdoTJqsDq5vORmok3D7i1jyG2gmutkM9UObf7KPal9Si72eE6b3jWlzhudWISGpuxmLPhSmS02WIL+iGGQg+hBsIAs7mln8nNAPGzfTI3mCIMHbjVDwZwi4Qti3DepVgLbsCmpwmwBsTB6pZGy6AWjf/FShpTFGVxng68NE92HCqR8m7pZC7udltYFeFi1ieFBpDlp8R5NfvuGMxH0zO9T2qxGN8IuHNLg2dt68LUj1/euLND7feZ9gUtYTgMUD/MqXQdDnYZOkeq6qdT0wQd/bnvFC3lT85vZYfUJLwwlnIi+F3/Edb2TyrCOYZUDvOtt3h8UK8wyjY4k7ZhQoPws1/QGoO0x2wS6bJ26YE+E5r9nxkqnVcbF9ssQR0LH3LFaQ0F0L5E3qyQqCa19Fg2E1rICA/TeNemmY5oHRf3PafUkuzs0tQ1IQgBFPhXlEX/4WgeLSE7udYXeeS1XuN8D9c2O80dUKf2OHaS+vrqAph1ArIiuNnjQpfvma3PH8WXEU3YlMQ/A3AhS/dmfhHh9mhOIZqO2u9RCj91NuXWtxPdU4qhd5OrBmHcbcB8rZK6Bl3WQg6H+1GF+Rv9cr76X7jIaGZSAyLDjrE09GlpgK9Jo8lfxSwKdTqsEZPrcnNNF47QoWwy0Fv5fKd6CepjaaKkhFUK+4/ik7y2t8hQ41z7bcLZfziVvm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(356005)(36860700001)(6916009)(81166007)(2906002)(82740400003)(86362001)(316002)(82310400005)(54906003)(5660300002)(426003)(70586007)(336012)(70206006)(4326008)(1076003)(2616005)(186003)(8676002)(47076005)(41300700001)(40460700003)(8936002)(83380400001)(478600001)(26005)(40480700001)(103116003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:35.2157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f5c4d0-fe23-4473-d92a-08dac3ef9ebd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504

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

 SUPPORT.md                            | 7 +++++++
 xen/arch/arm/Kconfig                  | 9 +++++----
 xen/arch/arm/include/asm/cpufeature.h | 1 +
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index ab71464cf6..3f16d83191 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -82,6 +82,13 @@ Extension to the GICv3 interrupt controller to support MSI.
 
     Status: Experimental
 
+### ARM/GICv3
+
+GICv3 is an interrupt controller specification designed by Arm.
+
+    Status, Arm64: Security supported
+    Status, Arm32: Supported, not security supported
+
 ## Guest Type
 
 ### x86/PV
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 1fe5faf847..b90930955b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select ARM_EFI
 	select HAS_FAST_MULTIPLY
+	select GICV3
 
 config ARM
 	def_bool y
@@ -41,16 +42,16 @@ config ARM_EFI
 
 config GICV3
 	bool "GICv3 driver"
-	depends on ARM_64 && !NEW_VGIC
-	default y
+	depends on !NEW_VGIC
+	default n
 	---help---
 
 	  Driver for the ARM Generic Interrupt Controller v3.
-	  If unsure, say Y
+	  If unsure, say N
 
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


