Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81DD3E8E93
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165667.302769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQn-0007Mv-Dk; Wed, 11 Aug 2021 10:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165667.302769; Wed, 11 Aug 2021 10:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQn-0007HU-69; Wed, 11 Aug 2021 10:25:53 +0000
Received: by outflank-mailman (input) for mailman id 165667;
 Wed, 11 Aug 2021 10:25:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQl-0002Qj-FY
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:51 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 761e8696-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:25:34 +0000 (UTC)
Received: from PR3P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::18)
 by AM5PR0802MB2417.eurprd08.prod.outlook.com (2603:10a6:203:9c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:25:33 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:b6:cafe::b8) by PR3P195CA0013.outlook.office365.com
 (2603:10a6:102:b6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:32 +0000
Received: ("Tessian outbound d9f41274f41a:v101");
 Wed, 11 Aug 2021 10:25:32 +0000
Received: from f06cc1c132ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 818B36B5-F871-4F84-A4B3-FA7113A418E4.1; 
 Wed, 11 Aug 2021 10:25:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f06cc1c132ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:26 +0000
Received: from DB9PR06CA0026.eurprd06.prod.outlook.com (2603:10a6:10:1db::31)
 by VE1PR08MB4656.eurprd08.prod.outlook.com (2603:10a6:802:a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 10:25:23 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::66) by DB9PR06CA0026.outlook.office365.com
 (2603:10a6:10:1db::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:23 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:23 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:13 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:11 +0000
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
X-Inumbo-ID: 761e8696-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SbFnreLB3IizsJ3DjqNZm/eCO7EB4EsDPVZsBU4wsY=;
 b=YmvlLPcmkIyGG31nDBHMyKSwhBbeQwaqQBaG6SS8N9IGIewfTaLd0/RHLBeXdiQGO1TfoVZWU42x77dOy/lRgtnzCHfKH8XjXIZNgSq4uycFJZyZFKdmZxi2MgDigpuqdhClyhsQqM8nhkwpgkXe3LWst+XqcUX519W2/CuLBSU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a0fe43bf5988e56
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQ+RBwdFlSVVVPpbdZqHDCmKFycjWqM6DyzKsBZXTF/tagjQPs4zwMqzZO8/s94jgvKLSli7/qi2xwdmQMOScaIKStTl0FUKAMw+izz3YWH/RWkB4Uc7oUTU8yHcPZbXYx5CnXT2joxUhPbhauzrNVl9lp0xH5zrabI4jHEURqiMGURTo9Hhv8Ra9mjKejDGYQxc1opcAn0ph3dMf6MaKxcgHMa29zo+5rGdf8zSu3xvV4WnKjmcwMXabjrWwnIc5QXOogAi5DQ9ShXLvb2QODpgEt73nee+HlWLS4mJinEM9RjDHy+hl2N4duOA6OSq4IoAnL2ObyXKpwLfg8izcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SbFnreLB3IizsJ3DjqNZm/eCO7EB4EsDPVZsBU4wsY=;
 b=H3EfLvwR6tkPFcBj1XiqLTVOTG4YXFn+ErTmePLpuBi/ix9PEd1JGvyPC1ynOfi2omX0k73bp5/dvIaGdAs2wAe5X7CtTVKg32xBYQq6t066+H5KbuOTRfx1z9tedGAl/AzeZ5uq0gwkvUFY53CdJJz/aK0m06wNEccSqoI81d9AKIRp2jy0gtvEi/fiT0sm6MxX6WGMIJeHh14L/gbtbo2xD0Kj9DBg8abtzHiJ5D68cBJMmm8PpfkgE+FnHZb8EOtWGrvN1X+FTK1XSMSP3N8vA+fES+dQzByiNggdIwcUAM68FsTOmPk76588mL200iJ15Q1vEOHNQmXWA7MbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SbFnreLB3IizsJ3DjqNZm/eCO7EB4EsDPVZsBU4wsY=;
 b=YmvlLPcmkIyGG31nDBHMyKSwhBbeQwaqQBaG6SS8N9IGIewfTaLd0/RHLBeXdiQGO1TfoVZWU42x77dOy/lRgtnzCHfKH8XjXIZNgSq4uycFJZyZFKdmZxi2MgDigpuqdhClyhsQqM8nhkwpgkXe3LWst+XqcUX519W2/CuLBSU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA Kconfig for arm64
Date: Wed, 11 Aug 2021 18:24:00 +0800
Message-ID: <20210811102423.28908-18-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1793903a-3972-476f-19f5-08d95cb259b3
X-MS-TrafficTypeDiagnostic: VE1PR08MB4656:|AM5PR0802MB2417:
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2417404226897D98498069199EF89@AM5PR0802MB2417.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SGYAQWt69RrMhW52qM1XE2li1PgonbUUsOvDHGBWzwVSsOktKRHXEzY+3eTP92mRZVHJbAGsrC3JCo+NhQggm5E/RP8Igyx3drygBS4mixytqIR6qbqxmn06SyjLd7PgrXnnEth9WUNivPmkDC3kY0PU9mdjw9MG9VdWB50LC+Vf/srSgXxPo3OlWcV02k1TWfRKXnvod2vNhITyQQHoVflcDJWcwOPS5nVo3vFh+X9+LCjdRqayfzSdzaFrztDRJppR0JoC0eLulHrh7Po7pR80bCYdpwLCmGlOmcSITpfQSvndowLcshyORYemL9hkbOBvCgtBMmHIU9+vCXAELXy9J2d4RS6mwzt/LavSSm4eVNZlZZkZEzdCz/TT/mcx2LBZwPmlWu0bJIX5NOcptTSYp5QZ76Gk/TPxZQAOXjUu/bVWrCOnDG0JMF37zuXc3f1QBo8d5jivMlP8Lu5f81S7ko8WX8KpiyNCVytAR+0O1DXhT46jKL7Izm5XXwUmAQ1YdelTm+l5Z9c3Eun5WWT5O4rrS91yBBDAJhwNH7J5bqwId8UOpVX8DHu8TrJ3mZEym9uYK454PTy2G7ym3a+Q6cZ6cUvN+icWSlUZE3e/W3q57wpCuSyskvyCLcHa49wNDrk+8GybTZGFiJc71pEi5b+7fXr9i38W8lb6z89CkJYFR3SO+WwxjibXxKfjPMnXAYgcJHsOAjHrywoLDq/6AR5Wnz5RhlCFzDMXqgheNCZlZGt+sCpVqpZZ0u0+7bJ6kVM8g2udTBT0XA/Nldj/xvEVghgm2ZWTRPgZL3w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(7696005)(8936002)(44832011)(8676002)(70586007)(70206006)(47076005)(336012)(82310400003)(83380400001)(356005)(6666004)(86362001)(34070700002)(186003)(316002)(36756003)(26005)(478600001)(81166007)(36860700001)(2906002)(2616005)(5660300002)(1076003)(4326008)(426003)(82740400003)(4744005)(110136005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4656
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ca383ecd-c552-4858-cbc6-08d95cb253de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JApGZ+xvMc3gm3muVEsoVlySeRxwGdISNcB3i+8aIq3//dn8Qi/GAOhxo9hilyy+oYAr0fP6krRFbsOhgjbu2lkghXF91tiJetig/2H1Kb9/XGjNq7+gQMkngOXG6rxn4USZZbQOkpwDY9DXdPnxAKith0TrdULkKgC4ZbcvfVhe9yon005rcL/maLNcQJfH+TRF7yteYZrEZRnzPKMdO4muq9iXRSvdDoPl863t9Fr4lZYRwHo3bKJmpuU0EtOfEB//FynqNS4JkyiGxT69ByGC48DEAqxZreacLuYQwuJbSA7AmwppguWIpCa9REJyy+KshtJRoDDI/hf9bMGmwiB5jYAhpLr12+lKkfQM16jWLYtozlYgkiCpLRUuxCGpGhW08vGXNOixMfL+kHE3SnbLT2zW4hfIsmiRiOUybcZzSwESnWpkO1HLqBuDvpJAJGVX6u2jsJ/KEMFkH0AydB8FWd1MDAOPS6BPuFUXMZVR6tqJc8oAdKJdtiISCBs6H2QAIJSpes5vkyFXDbD9YuELcnVltkBng+T6nAwCEqn7lJL2Q8wzBgvAUUURy+KCHq0pdd2lz53ULUJGcFPqGuBVMw97a6JDpcIBmJKmIdslVeqSLaZpwlYpKyUJcdLTA8YqG7uT39HThik0cTivaBKeYUlK5KlO+Y93TOTizArX39S/4Qye72ec9+BVyn/5MB5etV8b84hNWPKbz6kuMQ1txBiZJsSHq/NH0vZVxk0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39850400004)(376002)(46966006)(36840700001)(36860700001)(70206006)(47076005)(8676002)(336012)(70586007)(186003)(4326008)(2906002)(2616005)(478600001)(426003)(81166007)(6666004)(8936002)(44832011)(36756003)(86362001)(7696005)(83380400001)(5660300002)(1076003)(82310400003)(110136005)(4744005)(316002)(82740400003)(26005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:32.6910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1793903a-3972-476f-19f5-08d95cb259b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2417

We need a Kconfig option to distinguish with ACPI based
NUMA. So we introduce the new Kconfig option:
DEVICE_TREE_NUMA in this patch for Arm64.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..678cc98ea3 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -33,6 +33,16 @@ config ACPI
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
 
+config DEVICE_TREE_NUMA
+	bool "NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if UNSUPPORTED
+	depends on ARM_64
+	select NUMA
+	---help---
+
+	  Non-Uniform Memory Access (NUMA) is a computer memory design used in
+	  multiprocessing, where the memory access time depends on the memory
+	  location relative to the processor.
+
 config GICV3
 	bool "GICv3 driver"
 	depends on ARM_64 && !NEW_VGIC
-- 
2.25.1


