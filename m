Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50DB642ABC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:53:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453827.711444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cqf-0005JO-Ec; Mon, 05 Dec 2022 14:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453827.711444; Mon, 05 Dec 2022 14:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cqf-0005DV-B1; Mon, 05 Dec 2022 14:53:37 +0000
Received: by outflank-mailman (input) for mailman id 453827;
 Mon, 05 Dec 2022 14:53:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2Cqe-0005AC-Di
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:53:36 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe59::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 972fd834-74ac-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 15:53:35 +0100 (CET)
Received: from DM6PR03CA0071.namprd03.prod.outlook.com (2603:10b6:5:100::48)
 by CH0PR12MB5219.namprd12.prod.outlook.com (2603:10b6:610:d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 14:53:32 +0000
Received: from DS1PEPF0000E631.namprd02.prod.outlook.com
 (2603:10b6:5:100:cafe::d3) by DM6PR03CA0071.outlook.office365.com
 (2603:10b6:5:100::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 14:53:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E631.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Mon, 5 Dec 2022 14:53:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:30:01 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 05:29:59 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:29:58 -0600
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
X-Inumbo-ID: 972fd834-74ac-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAQAdLU26zmxe102BZwnjzzvkYKXZ8J465eHsHC6cUq7/DJI4yOKx0+uWb2uCGN+VD2uP/IBgwv1PBHSuIlUjMmL7iWpwQTt4z2VAfLYmQWGGzCHvFA7INNB5mK3jicBZOkAsNLg206cSEiP40EWl/Epsr+eaAxdA4bkRmgz2knkYzvLlEsJEGY7uRsB2fbVEIeJqyu+ssyLEGQQkR44GSp4RTRtNciIciKaw/ijCxkSuadagob0ZZXWhV8B8UUmsiTfMpyOtmXM2TTMgsJuTVjPqbjCr88ODDrrTh4yIU8pFrENql9YYc80GjkjzOZxVCM7PUqZWL3vYEWGHuBWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTKYXoGyAgkPR5zIiQZmjQ3vxNlnyj3UelY+os3E+uM=;
 b=L9LKkvSrvjYAYk9da6QFbDai1iEikNO0ej6917bbokxN6k/b0uEYMfzfIxZRXXGpDHrQtXLGd5h/dHK3jTtk8NoXaPy0D/++OzwQUq1A+ILEPXWCNNvDOglZc/oQoDvrwF6MpQycL5MMLlCg4ayUFy4AvDE7Qv7k2YfWw6PkoGFMVi7VNS1k1PIDe7o1QuLmdACVygtxafCKQ4zpZBjZai35ohwAmSjPmpGcIgkLppoI5LNvGjcrLse64h/CD7ApypuJQ2v7frHxTL1EcGcJjfgnNKjFT0KlhAczs72G3v0PTnHcBmifVP0D30k4BK0YraMM0RFW0/UHixVVQ+V/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTKYXoGyAgkPR5zIiQZmjQ3vxNlnyj3UelY+os3E+uM=;
 b=iIWX9p+gXLY2YgmB+2ePmtH2XvGKyintclYB0VGmW8Y9pUlM3IDgMZFEO5sAMrg/I9gShhHwLYGf30hx9j7h4AB5a5UTrBdRQ0XW443ggi1IEWIXivZD/ZrCSdcT/cIvZPOHEHZKq6JUONof1P7zWa7whSGFWSBfQpY/FFuir/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 11/11] xen/Arm: GICv3: Enable GICv3 for AArch32
Date: Mon, 5 Dec 2022 13:26:37 +0000
Message-ID: <20221205132637.26775-12-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E631:EE_|CH0PR12MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 452f5bd8-0cc1-4595-c4f6-08dad6d07a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BwNWk3zIIyeBRgo+cBkIwlyf3aIS/gQTZxQatgKh6Nz8yqvr1rTDwkZHgiFCIGKEQRKHZotzSx4r21FEt8VvY07YEJbEhIvsfAyyr7Hnu+PEB/pzXqnzXksKXQhadAke4xQAnv52Ye7XU5KNmKI5ASHVRNU69IVCC6NAbsYOUTy7jh2iYLpr7/svHeSIwi4Hxka2xtUIEfUnzx2ciQ7+k2W5/SK43vwr+Vw3i2qPqhDQr3vRL5J/1heP7U34ikRKVS2WNm8bc4yJvwbApo+oyzlUMEqziLFGAyt6BC/cUHlQpmAODO5a35OVqnjOmuSjLL7j8dIiVszahg5nwgu2Sq56Sa4aJiI6fLjDwizKw/Wc0F9QWnsv6KJAssal+oq/A1Y84U45awJTURH8lj179PhwrHt8LjdOKbU22k+HBXLMWwJloeBUFjz9OqNPBzboluMNYagdE9hj/hIvVwNoS8rK9afF6xr7wGvE3wWHDyKDbffeAC7cxQgGanWVUmowstHKrf0xHg1YQnVUikBeVc8CsIinquFVNF6mNUTvBE4fmeP94vrYySM6VdAlW7Pof7jI5njTpG3H/zzCon+YaRRmEdgTCNY/mHDWBa0WYjrkZV6xS223VNZHPwK1n6/+S6t6YiXz0gOBGPpl78SaG2kYwvPBrHAShOqDNXfZKWAXwANBLy1W1Wjly0LkaULVsrfZ2m2UsgK1yz+9mXU+nJHlFcoJcg5oiAj1K3T+Anc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(36860700001)(103116003)(356005)(86362001)(81166007)(82740400003)(5660300002)(41300700001)(40460700003)(8936002)(2906002)(4326008)(82310400005)(8676002)(40480700001)(186003)(26005)(336012)(47076005)(426003)(1076003)(6666004)(54906003)(316002)(2616005)(6916009)(70586007)(478600001)(70206006)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:53:31.5812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452f5bd8-0cc1-4595-c4f6-08dad6d07a1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E631.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5219

One can now use GICv3 on AArch32 systems. However, ITS is not supported.
The reason being currently we are trying to validate GICv3 on an AArch32_v8R
system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
"A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
implement LPI support."

By default GICv3 is disabled on AArch32 and enabled on AArch64.

Updated SUPPORT.md to state that GICv3 on Arm32 is not security supported.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changed from :-
v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
2. Updated SUPPORT.md.

v2 - 1. GICv3 is enabled by default only on ARM_64.
2. Updated SUPPORT.md.

v3 - 1. GICv3 is not selected by ARM_64. Rather, it is optionally
enabled. 
2. GICv3 is disabled by default on ARM_32.

v4 - 1. Updated the help message for GICV3.
2. I have kept the Rb given on v4 as the change looks trivial.

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
index 52a05f704d..239d3aed3c 100644
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
+	  If unsure, use the default setting.
 
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


