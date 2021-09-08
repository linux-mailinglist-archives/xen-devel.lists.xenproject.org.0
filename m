Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB1740375F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181622.328881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuI0-0003Zp-Uk; Wed, 08 Sep 2021 09:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181622.328881; Wed, 08 Sep 2021 09:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuI0-0003VE-OP; Wed, 08 Sep 2021 09:54:44 +0000
Received: by outflank-mailman (input) for mailman id 181622;
 Wed, 08 Sep 2021 09:54:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEYe=N6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNuHz-0001EI-4x
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2f1fdc4-108a-11ec-b148-12813bfff9fa;
 Wed, 08 Sep 2021 09:54:31 +0000 (UTC)
Received: from AS8PR04CA0170.eurprd04.prod.outlook.com (2603:10a6:20b:331::25)
 by AM5PR0801MB1745.eurprd08.prod.outlook.com (2603:10a6:203:3a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.23; Wed, 8 Sep
 2021 09:54:20 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::10) by AS8PR04CA0170.outlook.office365.com
 (2603:10a6:20b:331::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:20 +0000
Received: ("Tessian outbound 0ec886cb54dd:v105");
 Wed, 08 Sep 2021 09:54:19 +0000
Received: from a14e68f2d9c3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD5C5540-293F-4767-9609-8CF34A47C456.1; 
 Wed, 08 Sep 2021 09:54:14 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a14e68f2d9c3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 09:54:14 +0000
Received: from PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::29)
 by PAXPR08MB7033.eurprd08.prod.outlook.com (2603:10a6:102:205::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Wed, 8 Sep
 2021 09:54:12 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1c:cafe::7) by PR0P264CA0185.outlook.office365.com
 (2603:10a6:100:1c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:12 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:12 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 8 Sep
 2021 09:54:16 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Sep 2021 09:54:08 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:13 +0000
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
X-Inumbo-ID: c2f1fdc4-108a-11ec-b148-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWaJ31sy4Cs8NaQhMRjrM5i+mYxMfjvIRjfogEWDwok=;
 b=ADdZ4P/coQ35CGkuuOyodRvhsQCgHL8tdCdcvXXTx/6Gxirwxr7u47BZk8+OQL8/CifC/xmi3e+1QRvl6kNR5TfC9LweWA7PFX0bZE11Vc8aUPsyJg1LKochit52pNyyv+qkCVQm1QuTDQlGz/kA5LarnRMuw4Czu74K43o9928=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b74c3c38bd22e03a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCGByYaeyKtAb8BiUooJCHGJJ8zpbkoev5qp1lgNYUHAKVyVKqcm9hkr6YVfp+fjkR66G19atRNAUiGq6ftwWCpbUioHJc601UD3+gDByhKbYco9PxARP75fFKwYYyoTZlU9mXiUrqtq8pUSzDaFe6a105BDVjV1vOX6XMe+BcaT1Sv0wUhiLcYg3Y+0GuD5kdq39fHIs+ZtmNtfadQ1ceu3HyQV/dkJk7GJQquAOwNcyP8ew44ZmM2ZBdu58Fg8J6AKqkCehSQVAlKiCZzKscvC8qR46dC4wsNbqb0Gdgjm4Isrs1DNNG9TugICsbmfbHI7w+cdnkQHlGc8xEAsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VWaJ31sy4Cs8NaQhMRjrM5i+mYxMfjvIRjfogEWDwok=;
 b=S2Kk/A4P1zrQSJjFJf8qln9Uur3sCwvsh1b8EeSGnd3kP5F3J4e0jR6wi7BitSaVrx/Y/Jjv6iZ7/to6uNBOMT1OuV9l9ZSu3Sd1QrzqwlA4NW0suItxdLXmBc3mED2vmndVoHd//2CMpxiJwgEHn8l5o21mbLLy/8NR7Fx7UZGOe3xl09YISM2tUQ5HPm0o4FpbrWBEUMbAy0y7NI5rBwTstujfERMpA7uZjxD+G5SiAiXB8jbFunFn4KrHvcsjnZrVtQ5cgjwzYSqBXbA5zKUDxGB7PVuMmS3O+9vq7SZWF/MsmFDKLdAzLh9dDD+kRlrCrrKhkOP3wZJ9xD5acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWaJ31sy4Cs8NaQhMRjrM5i+mYxMfjvIRjfogEWDwok=;
 b=ADdZ4P/coQ35CGkuuOyodRvhsQCgHL8tdCdcvXXTx/6Gxirwxr7u47BZk8+OQL8/CifC/xmi3e+1QRvl6kNR5TfC9LweWA7PFX0bZE11Vc8aUPsyJg1LKochit52pNyyv+qkCVQm1QuTDQlGz/kA5LarnRMuw4Czu74K43o9928=
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
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>, <jbeulich@suse.com>
Subject: [PATCH v6 4/7] xen/arm: static memory initialization
Date: Wed, 8 Sep 2021 09:52:45 +0000
Message-ID: <20210908095248.545981-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908095248.545981-1-penny.zheng@arm.com>
References: <20210908095248.545981-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d308a56e-e3b3-49a4-f2c7-08d972aea11b
X-MS-TrafficTypeDiagnostic: PAXPR08MB7033:|AM5PR0801MB1745:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1745BD025EB3A49EAC432360F7D49@AM5PR0801MB1745.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:207;OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ld7uyxPh7vBV7epAQhqr2GgiIKpuSfE7ghweRdu4B9JGWtPhndYkAchVe2lwHxGHNEitVqcvkwTqqv7bJz5pg7qxJ6gWEBjZpe6DoMDGzKqCaDOKpwDOiz58QvKJDtRTz22v6JyeDhal1AHMLiOV+yrXM3PiXQottMnBfxyDXYzhBk1vctIOgPdTjTaafqzM/d56Yl48GHplqCYdZtg+PiF7cRDWTRUOkAvWZmEVQmY/enZowlU8J33YcEzH+UD5XRn8BoRBlxc3Vrm3jFPEivIW4ziJQ6gpfO5zOLUa7FkjqMCYPdF32d7dJwjezJO16XHtEQPx5lva+9IJEWorDSIbxg+0zWuyaZya2P9fXuVM0yelBj/bqM6lEf27oLldbmTRRVeL5GQMNdzUlMntKXE7wCeI9loGmCoS8kriq7vXGCjlogPuUmqMRqbcyFpxzE+lo62mA/F8/Zz5elWJLTXlRSD3u7gA5j9vjzKV1bKoloJ2Z0Ronrwbu+j4urm0K14hYY0366wlsiio/14mpaiVTiAEsqNC8NdV7hlFZV16I9+WO2y1vsbffhI9lCom2CDACYilbZ4pWtQhRIbBJmZ1o7bPW6AoSjlvWMGoM/QEtR+EJmTEJv8ehNkjSBnxJ5L/zycBT1jcReiytxPeOilbSsi7srCDNBKFprAB35/vQeI6zYA4ikPe0fFs0u14wKgue8bznfX12p7YbM4DiAbTvkMcy4hdT3DNTPoy620=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(36840700001)(86362001)(316002)(82310400003)(26005)(70586007)(36860700001)(4326008)(336012)(8676002)(110136005)(82740400003)(8936002)(54906003)(186003)(6666004)(70206006)(426003)(1076003)(7696005)(356005)(47076005)(2906002)(36756003)(2616005)(83380400001)(5660300002)(478600001)(44832011)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7033
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea79c35b-fd2b-4ef4-cd5c-08d972ae9c9e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HY/1ydUxKveCzmZWY9DTLrajh29OLKuYP2XD/0JadVmUXkfVc4V/AiP0qsKhEvHCWXv0Y6ICjb/JEtOpyj0xOqBJgY1NWTQzNBAHfGWSGV3uPSKlvyhaLGaFLVV90BUrYxC6wUVqYq480td5vnRYWErSHjcT9Bnq8nHTceJ6lpyM/x4ZAa5FiqHKAxnPidc2mlzApJNr08ox4Jny51L9RE+B3di8T6s5X/cuGICNQ7N5MZGGGzFsSGyiIIY72WEJKb2ikafjY7WZTBCREhLKLrnhi2FpkBmt76CLpKiLHIXLGOphWuLkx9um+F0q3OdrN6vGlsQSBPSXRNzEPQ/ruCIdK0inYRoMRtIs9+97E2jv8fYY4+EJWBz7TYQZo89lqHkBs4IhI1ttBhZVAYVVJoLQHZIZ9SXn2RIuOOvdv/KCeJgWiWXG2VJqZTv43pHL+9SvIGwLGw+UBuXXyCavU0tAlOxt7Qzu30dYV4xzAXiMrrygo23eyRe9VsvxWp78cMJCguRvTv4gJBgznofhuIerARyGG5PM6dFIIXch37Mdb3VQHTmrUSYuLYrpezmfe6AFHFlEMzN56e/1lRob+aQr/bNtCmiKqRrp7wsgldVFrjj0RDKT1skec1nQlD4RymVF+680z8on7GJddNBkS05CQ9b609ZdSqYmDtSaheGz+HScSOQQwmxx+bGwEaVVzKvaq4hNLnZ1ey3WRSVJqw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(36840700001)(46966006)(26005)(2616005)(36860700001)(81166007)(82740400003)(6666004)(107886003)(336012)(36756003)(1076003)(83380400001)(47076005)(82310400003)(86362001)(426003)(7696005)(186003)(110136005)(8676002)(316002)(8936002)(478600001)(44832011)(70206006)(5660300002)(70586007)(2906002)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:54:20.1347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d308a56e-e3b3-49a4-f2c7-08d972aea11b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1745

This patch introduces static memory initialization, during system boot-up.

The new function init_staticmem_pages is responsible for static memory
initialization.

Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
nr_mfns pages of static memory.

This commit also introduces a new CONFIG_STATIC_MEMORY option to wrap all
static-allocation-related code.

Put asynchronously scrubbing pages of static memory in TODO list.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/setup.c    | 27 +++++++++++++++++++++++++++
 xen/common/Kconfig      | 13 +++++++++++++
 xen/common/page_alloc.c | 21 +++++++++++++++++++++
 xen/include/xen/mm.h    |  6 ++++++
 4 files changed, 67 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 63a908e325..5be7f2b0c2 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -609,6 +609,29 @@ static void __init init_pdx(void)
     }
 }
 
+/* Static memory initialization */
+static void __init init_staticmem_pages(void)
+{
+#ifdef CONFIG_STATIC_MEMORY
+    unsigned int bank;
+
+    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    {
+        if ( bootinfo.reserved_mem.bank[bank].xen_domain )
+        {
+            mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
+            unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
+            mfn_t bank_end = mfn_add(bank_start, bank_pages);
+
+            if ( mfn_x(bank_end) <= mfn_x(bank_start) )
+                return;
+
+            free_staticmem_pages(mfn_to_page(bank_start), bank_pages, false);
+        }
+    }
+#endif
+}
+
 #ifdef CONFIG_ARM_32
 static void __init setup_mm(void)
 {
@@ -736,6 +759,8 @@ static void __init setup_mm(void)
     /* Add xenheap memory that was not already added to the boot allocator. */
     init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
                        mfn_to_maddr(xenheap_mfn_end));
+
+    init_staticmem_pages();
 }
 #else /* CONFIG_ARM_64 */
 static void __init setup_mm(void)
@@ -789,6 +814,8 @@ static void __init setup_mm(void)
 
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
+
+    init_staticmem_pages();
 }
 #endif
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11a..3558be0dbc 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -67,6 +67,19 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
+config STATIC_MEMORY
+	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
+	depends on ARM
+	help
+	  Static Allocation refers to system or sub-system(domains) for
+	  which memory areas are pre-defined by configuration using physical
+	  address ranges.
+
+	  When enabled, memory can be statically allocated to a domain using
+	  the property "xen,static-mem" defined in the domain configuration.
+
+	  If unsure, say N.
+
 menu "Speculative hardening"
 
 config SPECULATIVE_HARDEN_ARRAY
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index a3ee5eca9e..ba7adc80db 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2604,6 +2604,27 @@ struct domain *get_pg_owner(domid_t domid)
     return pg_owner;
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
+
 /*
  * Local variables:
  * mode: C
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


