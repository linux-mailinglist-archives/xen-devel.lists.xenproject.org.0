Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1424065D6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 04:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183860.332283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWf6-0006Au-B7; Fri, 10 Sep 2021 02:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183860.332283; Fri, 10 Sep 2021 02:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWf6-00064R-61; Fri, 10 Sep 2021 02:53:08 +0000
Received: by outflank-mailman (input) for mailman id 183860;
 Fri, 10 Sep 2021 02:53:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6Hc=OA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mOWf4-0004S2-Rj
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 02:53:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18b20c5c-a14e-4c69-a699-0e31d94047d8;
 Fri, 10 Sep 2021 02:52:57 +0000 (UTC)
Received: from AM0PR10CA0043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::23)
 by VI1PR08MB5358.eurprd08.prod.outlook.com (2603:10a6:803:13c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 02:52:55 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:150:cafe::a9) by AM0PR10CA0043.outlook.office365.com
 (2603:10a6:20b:150::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 02:52:54 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Fri, 10 Sep 2021 02:52:54 +0000
Received: from 467429ba86a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD9D45A3-6A48-45DF-8B9B-50F3A0CE39CE.1; 
 Fri, 10 Sep 2021 02:52:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 467429ba86a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 02:52:47 +0000
Received: from AS8PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:20b:313::15)
 by AM0PR08MB5060.eurprd08.prod.outlook.com (2603:10a6:208:15e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 02:52:46 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::f9) by AS8PR04CA0070.outlook.office365.com
 (2603:10a6:20b:313::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:45 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:44 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 10 Sep
 2021 02:52:48 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:46 +0000
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
X-Inumbo-ID: 18b20c5c-a14e-4c69-a699-0e31d94047d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YidLo1ofxwAYNecKLtQzrrxTjqkOLuglQ7KQpw39T7U=;
 b=rvDi12Z9MGGj2E5HXuHnfM+VUtvlasDQioIhYxX58L+3aUr7eZ/gueqLFbLLjGPj2IACBOGDISnQ80ciw4E8cmJF9OrNITnKgg4CSNtNxne3obR3Kfmq/3m+wOPbdIJ8426XQs5wkZNXJHSrVzwucfZgrUuuaIwgMT+FRtMR6og=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a20cb15cde3001a7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvLWhXzjfi4T5GeKjASTGUQgMXOMfbgIpDR7BUBmBxnaL4PAaDo8SU5rhqvcBlSrc582nRkpRNHpfdxGHPOjBjNOSfgnRcLFimgGzzke4z5merUBaHkRS0iXpNQNSGmiWacvVzKLcJGUbUqW7rtVZxd7CnWYlA06L3E/OHcfMINWj9IC9mHuGTGuILenk/tzyvUJC0j8JtYG0t6+Ozltge9tq16Q52IIn5RrNwOwjwncGZapsZjI2UStJysd2DriwSDjH8j4WwMBUmKEW7qa4J9OqQuroicQsXCU7cRQCTshWzBmlTQ3+EgYNRNiKQcZOrzUj5pohWcbx+ZHCths5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YidLo1ofxwAYNecKLtQzrrxTjqkOLuglQ7KQpw39T7U=;
 b=dBJfV9Uzw20+GbqZPr5l4heFWrNdmQxrZGt+jUPbt3BzHkRXBTOzBnb4kFbyMIXRWx6oDV+gPJs/akqfVJ9QBRjkGFZ1MSQI7kt2mbP8DEetXvBCDbON9TKMaen4QMk02OKwiwBer+HPmuAEjcdL7hpZmwdArsRrBNjd4lZvVI6NeZsFo5GYetkOeYM68hdzPNiGV9mfSdy0951EM0IpJE5hAxgQR9PUmbkGuzYFLly064so8gTia1tsE+j4q3pzt5rXyhl1B5FdjXHJhUNO0idBoNPcwzjrBaS83J1m0bC1bdaK2/pnvSVc320NoxfUMfqQbxziNifLfuTYQTBnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YidLo1ofxwAYNecKLtQzrrxTjqkOLuglQ7KQpw39T7U=;
 b=rvDi12Z9MGGj2E5HXuHnfM+VUtvlasDQioIhYxX58L+3aUr7eZ/gueqLFbLLjGPj2IACBOGDISnQ80ciw4E8cmJF9OrNITnKgg4CSNtNxne3obR3Kfmq/3m+wOPbdIJ8426XQs5wkZNXJHSrVzwucfZgrUuuaIwgMT+FRtMR6og=
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
Subject: [PATCH v7 4/7] xen/arm: static memory initialization
Date: Fri, 10 Sep 2021 02:52:12 +0000
Message-ID: <20210910025215.1671073-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910025215.1671073-1-penny.zheng@arm.com>
References: <20210910025215.1671073-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee647ff8-e2cd-4225-f2b6-08d9740616b5
X-MS-TrafficTypeDiagnostic: AM0PR08MB5060:|VI1PR08MB5358:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5358872452B2CA37800519BAF7D69@VI1PR08MB5358.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:207;OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SMAmA19PCuYGuHyg9GzYGzyS/auodm99njZ/jgVio1hA/CqYLFMhJOCdSusERoF4Pnuf/0n/brQjw3kY1y5MQ1Pnj5+kisfA51cYUFJ8RN+GySXUnVZHHDc9tKs9FVZIGmKEZIcU3Fw6DDePXZ8f7GVUATgXsTO1K37dYYg3e4X0u/cmCt1hnnHogXe8jvCetNPvt6nn/1wVLsX0qB5hk+Tn4nWms/Wz1hblh1KYpS0ppIJynm56rMNxgcg+ZROmWtaSZlUT+k1bJouhC9FwogW/vq6vncubiqBwxcSfea7LVRBJaayDlpNsTNudlqNAIzl4p+V9+7D6yCeWhaJAJSxMgllispR2Gtcvp6WJiIJUERLuxQr2fJYVVzJROiSUS3yY5iTj0dlbR2LcMU/TLYC4omt+ofdZblHlygKLM6ENThi+6g6zmXKAS0at3zfpq6FH5r5+lwLsz6ROX3o3m0NPF5oHVacl8524w04Nvsqq8SeVfj6OhMgTAvr96QGoUSHXSaSkg+8wQZDfZKDnEuEQM0iEMuBpCvv3STQlroeZGUHgfor6PGPiVR50XYWTuGXmsL4tD53i3z9YIkL7KHQURxFk0I6PKa02WQCNcMkgpTvE65gBss/H4Ijdf4Rsr9wiFJA+kIy4XMyQ33AUdPjZggD7b4UaH9MBaDjajwOCeK98Z1tp8TaIYQIoNk6ncC36KTdtCevo9+qpi/3aXCuBLX+z6vY74lQg/UUcVTc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(7696005)(316002)(5660300002)(426003)(82740400003)(6666004)(36756003)(81166007)(82310400003)(356005)(110136005)(54906003)(478600001)(4326008)(70586007)(1076003)(2616005)(8936002)(186003)(336012)(26005)(70206006)(83380400001)(8676002)(2906002)(86362001)(47076005)(44832011)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5060
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee39b5d5-4f95-42c8-b97b-08d9740610aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dRgEMkURts6a72aqC7g80Vi9W0NfFmyXWDkIRfMhH2xbpZ2ERnFEMI5pGfvoJQW2Bq4UsXW8pH85YgfnLPihFV4mBT4Smv6rhSJz9JsmKhVwl7AdJcOQFubdnUm63IFN6Q7XYUCV4y3w1wPsyjw3uV5PnifzmQZUdHyOu2cUnsj0McOfyT2aXC6uHbjykdqOk+mIzVyCSPh1WA2mcG64utXAG3MkEZ7XBRw1KAFPopKcg+NhwdkasPK0xf516PbOZAVnYkVOnxX45p8tzFOMBceqABnvXjQ7f8054QwlSOMBWpGLW0W4ZcXe1PVXEafticCUhN83EZrs8TW6LT0e2y51wwbZZen/YqQTCmYWzXd8H5Cd1hxoF2TgXn0PhecjHQC5UE8NnE3iB08/oIAGm7rFMIcfl6VkOIJt6OeKfDnf+JP2Q0wRRMBBWlwoHKb6vZitVP32Jl/FdzoOQr3llFDgKcj15JByPGEMzMMkUKxJZpZdgrtNuAwnSqIN1ILcn13f7BjxSVTMmhXJ/w8+2/dTMwCEKy2z+XZs9ml49PS0tskxHt9W7v2Svt4g1928kxragHjB2JgScn0D0g7vR4z2NJ1gG/Eg2McPi5j/+BTtm7qFzeYeW03nwEdm8Xc/1e4K6a4e2eF2uC/AulXEyQmld8oEk13egCICi9AaIlVaMSvmcIjVUffzdPBTJclbTUhz6SVX6zYgJ9TvO0HCxw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(316002)(107886003)(54906003)(47076005)(336012)(2906002)(508600001)(426003)(81166007)(4326008)(36756003)(83380400001)(86362001)(8936002)(7696005)(110136005)(5660300002)(8676002)(186003)(1076003)(82310400003)(36860700001)(44832011)(70206006)(70586007)(6666004)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 02:52:54.8145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee647ff8-e2cd-4225-f2b6-08d9740616b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5358

This patch introduces static memory initialization, during system boot-up.

The new function init_staticmem_pages is responsible for static memory
initialization.

Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
nr_mfns pages of static memory.

This commit also introduces a new CONFIG_STATIC_MEMORY option to wrap all
static-allocation-related code.

Put asynchronously scrubbing pages of static memory in TODO list.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


