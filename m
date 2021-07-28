Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA123D8BB9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161427.296453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8go8-0005yf-9I; Wed, 28 Jul 2021 10:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161427.296453; Wed, 28 Jul 2021 10:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8go8-0005sT-0t; Wed, 28 Jul 2021 10:29:00 +0000
Received: by outflank-mailman (input) for mailman id 161427;
 Wed, 28 Jul 2021 10:28:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8go6-00040B-Im
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:28:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::623])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35944c1c-e9ef-422a-b0fa-98c4a03e87c6;
 Wed, 28 Jul 2021 10:28:50 +0000 (UTC)
Received: from DB9PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:1d9::14)
 by AM9PR08MB5905.eurprd08.prod.outlook.com (2603:10a6:20b:282::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 10:28:48 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::e2) by DB9PR02CA0009.outlook.office365.com
 (2603:10a6:10:1d9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:48 +0000
Received: ("Tessian outbound 31e6e3649d31:v100");
 Wed, 28 Jul 2021 10:28:48 +0000
Received: from e816462a8ab3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12E6E4CB-4FCE-4035-A7CA-30C622ABA7B7.1; 
 Wed, 28 Jul 2021 10:28:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e816462a8ab3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:41 +0000
Received: from AM6P194CA0036.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::49)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Wed, 28 Jul
 2021 10:28:38 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::37) by AM6P194CA0036.outlook.office365.com
 (2603:10a6:209:90::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:38 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:38 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:35 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Wed, 28
 Jul 2021 10:28:35 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:32 +0000
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
X-Inumbo-ID: 35944c1c-e9ef-422a-b0fa-98c4a03e87c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=039yhm0OXE63ZaHtdlaK4YptpkTMc2iTaBz36ataqqk=;
 b=p/JMgktVy1rZtUIcyO6VvlvmcGEr+elBd4eLcAejfdMYZ9oOLeGAY2OqYtdI354/PqArhTN2EhLV7XhJGSF0UBPvk42EmnSXyI2o4ME6us/K2404ENNf3uMhKVKO7bK0nLsLy/V1VdYo+pS2loVx1aEweA5uv3zYXF0HWD9TFX0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f09a9c1e3d445cc8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZafKQqpqRQ6bw/cQVGwJhOLQJWYSrE6GZLAaB2D3y2RWIfaun1ypntdIBScKWVmKYnFZKTqhtSl/E6X9iYHOAY+Y5CrkO31XNkcxPbFpED2WfmHEFFIoz0ONtDJXfneimWvsF8PyijpUciTiAPTyYm41FfB3W+d7/KytrBmw+u+OTh67v0LiHCjqGeMxLfq7APPgPK3O3sVhIFgWkh8PGOnNjxE5vZFEvW+nwilniC53U9gOYFaObmK4GcfPU4ONZodi5mwjyohl7rOfdj3drOagRpT6bckiP5hyUIhvVUdTn4mb7NMRLku1aIQZ9TTIxNNPVMm1rcnJcZ/lqjqtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=039yhm0OXE63ZaHtdlaK4YptpkTMc2iTaBz36ataqqk=;
 b=Vnjs7FlECBTvoa0B2PZrnD+OoTcf7PJCQlJiPlf7tDEZpK9Yi3Cket2WAcG+JxysaijVHpyZOVUfpR5mhm+UmsNkiNInsL2SoVIqUm/OmMuYvq27I3hrkdA3XPlOzmPteW3ONCCTpBj5GR+NVKc2k0ZRBnkkfSbKq+BgTKLcAEDIkldfiCqY076gX341kMOdVeMfU2Fs+TBjY+l1wSjrAx7VnLzozro8jJRQdXnSEEtN9uvpKID/x7W1NSLu3KvpnC4vjBD9tom1Lw75T4D6e3U6FcsJxm9fBfcvxjxAnjsKoqCARlRCwMn4G0kdFyWOKnhjG5zh60LhoKz8bb9APQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=039yhm0OXE63ZaHtdlaK4YptpkTMc2iTaBz36ataqqk=;
 b=p/JMgktVy1rZtUIcyO6VvlvmcGEr+elBd4eLcAejfdMYZ9oOLeGAY2OqYtdI354/PqArhTN2EhLV7XhJGSF0UBPvk42EmnSXyI2o4ME6us/K2404ENNf3uMhKVKO7bK0nLsLy/V1VdYo+pS2loVx1aEweA5uv3zYXF0HWD9TFX0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<nd@arm.com>
Subject: [PATCH V4 05/10] xen/arm: static memory initialization
Date: Wed, 28 Jul 2021 10:27:52 +0000
Message-ID: <20210728102758.3269446-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0fead5a-c03d-4fb3-7960-08d951b27c47
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:|AM9PR08MB5905:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB590596C1B2A3D16735CAFFDCF7EA9@AM9PR08MB5905.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:159;OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 79RzpEsb0lWGRVzdlwxRnTDECqQg3azhHdaYN6F5J++AcO0FwG/NYLRKZRYIdoJJHn44Xt+rGkw145pUVPgdlr8H3OG+CXnHezppwzalhm/Gc0gejVuP26uU3Wzy0+wtWBoG14x2XcGBnBmnZOXh7qNoGaN6B6p+cvpvzwujDbDragXmwBdYjM05nCmNiUWM4IChZKL+QTML+DD8fee14qRcpsFjadZEYvG0DYfnenN78LHwafCniKHEzWPGsxCaezQL40jGswxjY6TM4FtBTUzIOtpsGvtdfnmhNPZD49IdzH1TJkzV5W83AAyV8SvwutO3aFd1pGdivRcaVPZNINH8JeVljhU2qz9rxKomycEsKhDu+9c7x/8duxKIN0i/rEEQnkHnOPfR1rQlD8/xKPAn91/84NzUr1HOKHWYV1EK2O1xMlzNyuXBkhyp4cqacK8c6Y4zm6yceBAWbtF2bx9fjNxdjAm5TfVkjQNlIiStriU3Rm9XhodoaVoYdSWgWxsNkXh1utp9WzkWPFztgdjWsqgXUoC6RA6/a3tKdzZ7quzyMY1DwfFwJLJ2r2opvkHAlyqqdilL0PZJGfgpUB0YGzj1gV7u4EQtW0HwomKG9UAdpq/PMd49X2z78T1U1vY9WP9SO49nW+ubGYLK4rDSD89bZ+78KOmLZpOA11p9t+iDuGM3iWDpnCXkmrmUq68+yD7TbmV9f3hj/PUwWil5dDU1DwewJsRffi2KE9E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(82310400003)(7696005)(2906002)(36860700001)(81166007)(44832011)(47076005)(186003)(356005)(8936002)(1076003)(6666004)(26005)(336012)(2616005)(36756003)(426003)(4326008)(83380400001)(70586007)(5660300002)(54906003)(86362001)(316002)(110136005)(70206006)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef8c5ae4-cf28-40cc-e237-08d951b27657
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jeT0fkzksuiQjcfDR6AOkn8w6jdUuHnLRoHpLI1ROUNkc0c5v+4Fq3wLbN9/ym1ZTTjb3I5lfYJTYQNJrHe7o+LmFGODsyPKSS49kohzftOZnLC/HcfEQAI7Mhgs5/higk3koXFra7FTaP4xTELLGYvs3hzohZF6nGDArkJwP+ny8IgYie6TJQPB1bol0ssFKt2RzWV7QHrQ2xMt+WbH8dBbKXKN8HvvY21K5anLauwM1Tr21m8nQ9YG4rbOrAchBwwbztI79TTQcmEodPcqAuHOFVUHKjrB0YpKdsT38YsZmt/UpQVazNaXml6NTSIJuAurM41nGtQIRaUrXWFxap4q21yGnegLGqQ4J+bmgpILrDjt1kY+8R7FelAeQFQKT6wfPYclzajdfU612jGYckAF3Azk3gLdbGQierj3jryeROQG/vB4rz/jIRfLHUraNWNuNb27lnxNYO57DGnaCPbVsoU2M1AS+QZWMfrf83+qaN1eMZLMkJtJ4CMmQqIm4UpY+9XlmhlsL3GG+n2pI/Q6kJUNL9mG/f8Z+dez/ZDxILD8Vf9EEqAuuoFVvxKVoH7DTB9zq9eS9cenlas4/i5LKFZ7qU4k9RoCu9s6GIpiOxOZxV/1iXMl7u/ITfn4mdD4VniDL+E/JXLUxPiH4cZrxrbIqSSmtyQadFvx28HNj0rnlLGshQREuvtGy2vIKbxzvQalTrcyygxM5tlZvA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(136003)(376002)(46966006)(36840700001)(86362001)(8936002)(26005)(5660300002)(6666004)(54906003)(44832011)(82310400003)(8676002)(70586007)(82740400003)(83380400001)(36860700001)(47076005)(316002)(1076003)(81166007)(7696005)(186003)(2616005)(426003)(36756003)(70206006)(478600001)(110136005)(2906002)(4326008)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:48.0643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fead5a-c03d-4fb3-7960-08d951b27c47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5905

This patch introduces static memory initialization, during system boot up.

The new function init_staticmem_pages is responsible for static memory
initialization.

Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
nr_mfns pages of static memory.

This commit also introduces new CONFIG_STATIC_MEMORY to avoid bringing dead
codes in other archs.

Put asynchronous scrubbing for pages of static memory in TODO list.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v4 change:
- move the option CONFIG_STATIC_MEMORY to common code, and with Arm
"select"ing it
- replace round_pg{down,up}() with PFN_DOWN()/PFN_UP()
---
 xen/arch/arm/Kconfig    |  1 +
 xen/arch/arm/setup.c    | 24 ++++++++++++++++++++++++
 xen/common/Kconfig      |  3 +++
 xen/common/page_alloc.c | 20 ++++++++++++++++++++
 xen/include/xen/mm.h    |  6 ++++++
 5 files changed, 54 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..cc7a943d27 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select HAS_PASSTHROUGH
 	select HAS_PDX
 	select IOMMU_FORCE_PT_SHARE
+	select STATIC_MEMORY
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index f569134317..369f6631ee 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -622,6 +622,26 @@ static void __init init_pdx(void)
     }
 }
 
+/* Static memory initialization */
+static void __init init_staticmem_pages(void)
+{
+    unsigned int bank;
+
+    /* TODO: Considering NUMA-support scenario. */
+    for ( bank = 0 ; bank < bootinfo.static_mem.nr_banks; bank++ )
+    {
+        unsigned long bank_start = PFN_UP(bootinfo.static_mem.bank[bank].start);
+        unsigned long bank_size = PFN_DOWN(bootinfo.static_mem.bank[bank].size);
+        unsigned long bank_end = bank_start + bank_size;
+
+        if ( bank_end <= bank_start )
+            return;
+
+        free_staticmem_pages(mfn_to_page(_mfn(bank_start)),
+                             bank_size, false);
+    }
+}
+
 #ifdef CONFIG_ARM_32
 static void __init setup_mm(void)
 {
@@ -749,6 +769,8 @@ static void __init setup_mm(void)
     /* Add xenheap memory that was not already added to the boot allocator. */
     init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
                        mfn_to_maddr(xenheap_mfn_end));
+
+    init_staticmem_pages();
 }
 #else /* CONFIG_ARM_64 */
 static void __init setup_mm(void)
@@ -802,6 +824,8 @@ static void __init setup_mm(void)
 
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
+
+    init_staticmem_pages();
 }
 #endif
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11a..8f736eea82 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -67,6 +67,9 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
+config STATIC_MEMORY
+	bool
+
 menu "Speculative hardening"
 
 config SPECULATIVE_HARDEN_ARRAY
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index a3ee5eca9e..2acb73e323 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1519,6 +1519,26 @@ static void free_heap_pages(
     spin_unlock(&heap_lock);
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
+void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                                 bool need_scrub)
+{
+    mfn_t mfn = page_to_mfn(pg);
+    unsigned long i;
+
+    for ( i = 0; i < nr_mfns; i++ )
+    {
+        mark_page_free(&pg[i], mfn_add(mfn, i));
+
+        if ( need_scrub )
+        {
+            /* TODO: asynchronous scrubbing for pages of static memory. */
+            scrub_one_page(pg);
+        }
+    }
+}
+#endif
 
 /*
  * Following rules applied for page offline:
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 667f9dac83..8e8fb5a615 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -85,6 +85,12 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
+#ifdef CONFIG_STATIC_MEMORY
+/* These functions are for static memory */
+void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                          bool need_scrub);
+#endif
+
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
     unsigned long virt,
-- 
2.25.1


