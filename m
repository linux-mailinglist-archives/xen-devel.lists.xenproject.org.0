Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD0B68EE7D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491727.761047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDQ-0007m8-S1; Wed, 08 Feb 2023 12:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491727.761047; Wed, 08 Feb 2023 12:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDQ-0007ft-JL; Wed, 08 Feb 2023 12:06:20 +0000
Received: by outflank-mailman (input) for mailman id 491727;
 Wed, 08 Feb 2023 12:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjDO-0006aK-Ui
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:06:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eab::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd543b58-a7a8-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 13:06:18 +0100 (CET)
Received: from MW4P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::27)
 by SN7PR12MB7155.namprd12.prod.outlook.com (2603:10b6:806:2a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 12:06:11 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::a) by MW4P223CA0022.outlook.office365.com
 (2603:10b6:303:80::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 12:06:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.16 via Frontend Transport; Wed, 8 Feb 2023 12:06:11 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 04:06:07 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:06:06 -0600
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
X-Inumbo-ID: fd543b58-a7a8-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COcPuaPp9+IoaUReWusIqsRDXHkg/TjPwlLUFoxP/TEGdnyevhxkMyoXYwHPYLWHzPCcycBYote+SQf2sBGJo2RawLk9tzXGCAjSx3Ah0Lpb1qF4a11oiRmXi3rc7WvpfvLPPAs4EJf5qFydjZKrVmIai07izO8rmNE0LQw6+XNdBkZqQ3mwvsIkqnS3zbxwQ7Js9x3Yc2Tb2qqgB97TEhnmBW2XVg7Cs9G781XFCry6POXp4CUusNC9lCyitmvEySef7cmOBwRFWA8Mr/qJwWgQUdVxRGzshC3RMSSwmtty7u+yu+TPa6VsutFhc849hMkmBaDuy7QkN/cWZRveMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2VJmiFZsrpDpPGNogHFDiYO4zGiLQ4UiSa+V9iwHmw=;
 b=J9qW61yVr3zympsBHiPnNj9Vy57je2TxStAoV8/p1BkkSFzEtbMC8fbBZgr5a1ltW0twUgtucwVwonUdoGdqHXV0qAM1M/iPn+coiDYIvzNQCiaUwB0EaSIzDoar5XsaVSlzihbqq5uubYftXk17QO64N0BhxPq0NsWMSVhZ3+hBDS6qLdXffRWt2jgXd8tw6BEQTnuYAkXH+S5lQ0kc3V4Gm0j10234Ito2amqL+OQjytdwWAf6EVEHg2d6bZcxoJfoPN07fG0vO4QLNfCs/nwnXj3oqEGvwPGLKnm9cA1r8PMl6ItRo/YfTUDylQikkzrGCxTEE3HGitvPlCaj8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2VJmiFZsrpDpPGNogHFDiYO4zGiLQ4UiSa+V9iwHmw=;
 b=zUlzT1qF3JNeDtu5CSpfKvgAEaJkusMXWCwW4ga0vTKitWoW3uEeHICuRE5Vnv1veuIUbe41dzBOYSfTNLKFvPF6FXxIvuxs7SALMLg8lOuAEwtIhEBFjEngs2Y6YvdMu2RqT6CI8bn7wbrvcHNaTtlFR62vjvEcSKjPwYSskwQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 6/9] xen/arm: Introduce choice to enable 64/32 bit physical addressing
Date: Wed, 8 Feb 2023 12:05:26 +0000
Message-ID: <20230208120529.22313-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|SN7PR12MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: e982044b-afe5-4289-dbf4-08db09ccdeb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+PGHHTJ4b9SFgIcUt5sKm9Vgn228H0EgmqZgQdjTZ6bTyfybN2/etL1CQVFkh0w3yvn5TDDB0M4ydK9eCsOziVR/iBE+LG0dCZhfN8PceRLMRUovr2BoHGEd9Df0J5M8hkk82md9+0+jQgVf5k3FA4gxyAJNYzub4jDgP3Ifo1UvWnC2TAjpvTBn1enFzkOwSipjfky4EooGyfVPueGQ692M+WcZVBuERYsItHn6UgqA8TW5VRUA4J+RgkB3E0v0Fx9yd3nhklarOP4fdbtt75uH1i6VvGMEOyHXtff+utepMiGr621a0HLdnCc2qkK/bbGQUf6IdEJEqEckWDttv8OYIOI7ysuV6i65h9lUdkjaxxpvbZaiGJMq9srpSCRgB3uzdzUVoavZvzHY5TbjTJ04g+kRznk1O4R6V9IUMizijNbjosdv9NunmD2g8iq7K56T5UoNQ6WAzwIBpAL10Nvml13aF0zYugs8TImz297mAAnQGKzjyxwycFXTPNF9PNRkjglQu3nnX9Is1wdrTo7EYwuEYEy8jmJDkEU+Wk9T7sGHs2KaQ9pcMb5n7D7p7YSknHOboFVW0M5OGAJEmwuvbE3VJuoex0oDA5MOLuc7jxwbSPEavs6v8ixgrz3aA5dunImiYHcaUXM2G20Q/e8Y3jqgreaCzdNW539+3x2BbOcKWODlkmJJum+rfuflsOPZnhWvo4nlC2asYwW6LRk+GHKMZ9BV9Z6UD3j2Lho=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(8936002)(7416002)(5660300002)(2906002)(36860700001)(336012)(426003)(47076005)(40480700001)(356005)(82740400003)(86362001)(81166007)(36756003)(54906003)(316002)(41300700001)(8676002)(70206006)(70586007)(6916009)(186003)(26005)(2616005)(1076003)(103116003)(478600001)(6666004)(40460700003)(4326008)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:06:11.6130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e982044b-afe5-4289-dbf4-08db09ccdeb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7155

Some Arm based hardware platforms which does not support LPAE
(eg Cortex-R52), uses 32 bit physical addresses.
Also, users may choose to use 32 bits to represent physical addresses
for optimization.

To support the above use cases, we have introduced arch independent
configs to choose if the physical address can be represented using
32 bits (PHYS_ADDR_32) or 64 bits (PHYS_ADDR_64).
For now only ARM_32 provides support to enable 32 bit physical
addressing.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -
v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".

v2 - 1. Introduced Kconfig choice. ARM_64 can select PHYS_ADDR_64 only whereas
ARM_32 can select PHYS_ADDR_32 or PHYS_ADDR_64.
2. For CONFIG_ARM_PA_32, paddr_t is defined as 'unsigned long'.

(Jan,Julien please let me know if I understood your suggestion about Kconfig correctly).

 xen/arch/Kconfig                     | 12 +++++++++++
 xen/arch/arm/Kconfig                 | 31 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/page-bits.h |  2 ++
 xen/arch/arm/include/asm/types.h     |  6 ++++++
 4 files changed, 51 insertions(+)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 7028f7b74f..1eff312b51 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -1,6 +1,18 @@
 config 64BIT
 	bool
 
+config PHYS_ADDR_32
+	bool
+	help
+	  Select this option if the physical addresses can be represented by
+	  32 bits.
+
+config PHYS_ADDR_64
+	bool
+	help
+	  Select this option if the physical addresses can be represented
+	  64 bits.
+
 config NR_CPUS
 	int "Maximum number of CPUs"
 	range 1 4095
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..0955891e86 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -18,6 +18,37 @@ config ARM
 	select HAS_PDX
 	select HAS_PMAP
 	select IOMMU_FORCE_PT_SHARE
+	choice
+		bool "Representative width for any physical address (default 64bit)"
+		optional
+		---help---
+		  You may want to specify the width to represent the physical
+		  address space.
+		  By default, the physical addresses are represented using
+		  64 bits.
+
+		  However in certain platforms, the physical addresses may be
+		  represented using 32 bits.
+		  Also, the user may decide that the physical addresses can be
+		  represented using 32 bits for a given SoC. In those cases,
+		  user may want to enable 32 bit physical address for
+		  optimization.
+		  For now, we have enabled this choice for ARM_32 only.
+
+		config ARM_PA_64
+			select PHYS_ADDR_64
+			bool "Select 64 bits to represent physical address"
+			---help---
+			  Use 64 bits to represent physical address.
+
+		config ARM_PA_32
+			select PHYS_ADDR_32
+			depends on ARM_32
+			bool "Select 32 bits to represent physical address"
+			---help---
+			  Use 32 bits to represent physical address.
+
+    endchoice
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
index 5d6477e599..8f4dcebcfd 100644
--- a/xen/arch/arm/include/asm/page-bits.h
+++ b/xen/arch/arm/include/asm/page-bits.h
@@ -5,6 +5,8 @@
 
 #ifdef CONFIG_ARM_64
 #define PADDR_BITS              48
+#elif CONFIG_ARM_PA_32
+#define PADDR_BITS              32
 #else
 #define PADDR_BITS              40
 #endif
diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
index e218ed77bd..26144bc87e 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -34,9 +34,15 @@ typedef signed long long s64;
 typedef unsigned long long u64;
 typedef u32 vaddr_t;
 #define PRIvaddr PRIx32
+#if defined(CONFIG_ARM_PA_32)
+typedef unsigned long paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PRIpaddr "08lx"
+#else
 typedef u64 paddr_t;
 #define INVALID_PADDR (~0ULL)
 #define PRIpaddr "016llx"
+#endif
 typedef u32 register_t;
 #define PRIregister "08x"
 #elif defined (CONFIG_ARM_64)
-- 
2.17.1


