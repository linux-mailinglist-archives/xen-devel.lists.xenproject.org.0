Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22986415E23
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193978.345633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfd-000180-L1; Thu, 23 Sep 2021 12:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193978.345633; Thu, 23 Sep 2021 12:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfd-000105-DD; Thu, 23 Sep 2021 12:17:45 +0000
Received: by outflank-mailman (input) for mailman id 193978;
 Thu, 23 Sep 2021 12:17:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNX7-0005KP-8s
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:08:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b15688bc-e809-4dae-a08b-8c83425a07b6;
 Thu, 23 Sep 2021 12:05:25 +0000 (UTC)
Received: from PR0P264CA0181.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::25)
 by VE1PR08MB4783.eurprd08.prod.outlook.com (2603:10a6:802:a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:05:20 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1c:cafe::f2) by PR0P264CA0181.outlook.office365.com
 (2603:10a6:100:1c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:05:20 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:05:20 +0000
Received: ("Tessian outbound 8b24208353e0:v103");
 Thu, 23 Sep 2021 12:05:18 +0000
Received: from 6415f6476d30.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D94C7F36-7225-4215-B3AD-7B66E54708FF.1; 
 Thu, 23 Sep 2021 12:04:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6415f6476d30.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:48 +0000
Received: from AM6P191CA0104.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::45)
 by AM9PR08MB6195.eurprd08.prod.outlook.com (2603:10a6:20b:284::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:04:46 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::8b) by AM6P191CA0104.outlook.office365.com
 (2603:10a6:209:8a::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:46 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:46 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:24 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:22 +0000
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
X-Inumbo-ID: b15688bc-e809-4dae-a08b-8c83425a07b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPyMh8kRm237dXS4GzraOVjqXtVF9dvrj+OlofkeXZM=;
 b=R98OGe1zJLc+wYDSRAf9OcKgXO/XUJs+TOE2xBq6X4ipvBp6vqLnzmLt5p/1Y3QHTbtsqzWLLKbYTS/xUjWaYl2i7HxAfh3iNH6nYVCngAYJR9XzB37UvcG9ynQm7wTTa05byGHJ6zdGM3m4PXODNi74+c8al0R+AMLTEKl4TwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c9621024c7910d2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCY5mjUjcTuUzD8QLUOTelv72R9wjbolCxbFuXZ+jjMlatXBZakjvHH0JRdPRU/3OTf2Q1Fk2n60UbGZFAYBPHp+5M2sudYuv+wtUINABvgQb3bXqyUfF4IkQ8jy+5KIn9NYLvdTHmSYJhucmp8vCo/VSNA3NRH5G8pIr6fWlpnw+lSdz2bkvw7eBYWF5fxBu4m+y4g0kMRC8ZqErfGDeir3itoaW2KEJCFgYskxmzjZUT7jJS85T/P31IBu49l/zSy9+GIUAKjmBPTKmJcWjzpsSU553HmSaHs9b/kYQReTaKGqm8ZWvDFGS1QqsckgXPgaGfJBA2kmbMuFT2yrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XPyMh8kRm237dXS4GzraOVjqXtVF9dvrj+OlofkeXZM=;
 b=kmO1HiqSCWFJKEtMN37vQMfcJuUEYfZ57Yl5U+0GMIpPxRaIuElEpFidVyqlWSIVwbGaSkWWaiO9wNTCsJ99S3HXOY3xA3iNVdIEHKLCRS472oAUzzafGaP7uwM8EeEfViyW6TPNjtN92VyA3KCbrTQ7P4uGd9k2tgmXzcA4Z1ycrrklqoKrtuusTRZZEYlHZIdtJsc8vBeFAuaQuvpGJvACLdkSClQT+ixvg4LG5UUJPCn+9Of/wBQ+sS/x8oKIVmKEkl+xin8uVelAzs/Sy9Yg6wez+2Ly84VVSo6Xvm81o8hoIJuDDFY+NUqPafwckzcnBTCFdsSiWKbNu60yvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPyMh8kRm237dXS4GzraOVjqXtVF9dvrj+OlofkeXZM=;
 b=R98OGe1zJLc+wYDSRAf9OcKgXO/XUJs+TOE2xBq6X4ipvBp6vqLnzmLt5p/1Y3QHTbtsqzWLLKbYTS/xUjWaYl2i7HxAfh3iNH6nYVCngAYJR9XzB37UvcG9ynQm7wTTa05byGHJ6zdGM3m4PXODNi74+c8al0R+AMLTEKl4TwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 34/37] xen/arm: enable device tree based NUMA in system init
Date: Thu, 23 Sep 2021 20:02:33 +0800
Message-ID: <20210923120236.3692135-35-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7524a0dc-3fde-42ba-3ca9-08d97e8a6a36
X-MS-TrafficTypeDiagnostic: AM9PR08MB6195:|VE1PR08MB4783:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB4783DABE82EFA9FE47EFEAE79EA39@VE1PR08MB4783.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9nSKCTMaejQPMJJ+ZfEY7qDHpNBGYij1umBDDjqV+RVOaCyvJh66HoljiVU1dRVizGISfHk6Eizp9wavF7aPt1+1XV5PxsPhFko7SUH8ZRZk7F81as3i9bzNbIAUtGwZ3t7Tn6twkWRQKmUaqeerboNeBj5YCHlq68SvTlwYhMFHBZsJ1hdPq7ydWiNzYvSL6xqZI8lCjCk8s7VmXOOzG8beBJi04/+UIt/WM4TNNQ5DS9YeY1ao51khGuAGsEg0hLIVveV7nBqPmSaf8Yo+Wpb3zlfjnHIVtYCNcGk7ULzB0PUGYlflvEwAtXmKJYWngFJFgQG28/YpOcnYWnyyxazoNaH5OdqTQxVERcnC89OtFWYiElXGHzWQvZ5Xrs9mx+YrgpNQgM51R1rGogv+Ez8f5PGMRgulXqkhMsgMniaBzroDs99NRIeuYGQbukqJlfM6WXI4fPfSEpdRdKJK4YW8swMSaQVMI/B3Mo/pRrF+6Mdyk88IuFaUv0IEgvpCn1huKyg9oHJbpdHx/t5Lpbk7ko3IZp6OARDK8tnrQPQNmg4xSOTm+VmeZlU+6M5sV03OJKbtcqqVV4fDqslHhIYCMoAX7IpoBiQUwYTjCF945ypt0etZd6if8H7prIzBjwMb3wp/5ZamehRgwEVnPUywt/lnTnssCiHKkFn3+KZmH4OxNoGlTLRC47EaZhlqeDWZM+9DB9HclbsCCSGaWwlJLhpXvpo539XMx71rku8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(82310400003)(47076005)(2906002)(336012)(186003)(8676002)(8936002)(316002)(2616005)(1076003)(508600001)(83380400001)(356005)(36860700001)(86362001)(70206006)(5660300002)(81166007)(36756003)(110136005)(6666004)(70586007)(4326008)(426003)(26005)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6195
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8d5cfd0-76b2-4e3c-fcc9-08d97e8a5628
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oGvCla2hn4nMMulmYaoufQDU01V5N5XzqSOHDfjXLLMGhx0ZbgRIEmDG9K0+7uDJgeMiQlYj6HX2chynuhwEk7RxdK7NeJeUENYGtXS0mvCrs7haj1qPIGUc646w0OFCJ/zgqB//U+QO5QKGb+t99uZyHH+cVORLF5lueAONLiRCrDcknCO5r1+WP/FXViVF/53bavSdb0B9EW4rbANwhT/KxhIlB7ibNSVhDfBFC/zaxSXeJ6ST7EX8dr1kQxCbHyoGlevjhZCgS1xbuCb6wkMMguBO1FicVX+n249PtFR3TSjcBzj/A0Piov5pviCEBX69cUNNk90ChFu9RX5D+Wrp3H72bK+yVbKLj5yG1jx/Ma/xghhuEZz+ZUhLer3Tx1TGXPI6UoYs8lox8WxHtvsX7BdVhmD5PDqPwpnukfeQhrGj6wPrT4z8lD5nz8d0ZUvWOOaaJA07E68YS9/g1VQWe1lm2BK2PM736cbpKX3kI0c24nCNhHCgF/EvxBsPhz6iRu0CP+a9NWNikmmYvyT9NGXInSBQ2LoTKk6ippCjHMNWI2L4BJWjaeAtprETR11Jun1azm9LbFuG9+sUrBH9vVTNUtX6Om1ykjHkAWryy9irFuI/ly+PNyUcqiKizeI6LppKFkS6GPu0VmqDqZomhbe9LAmMh+sB1Q4GtUFNFEh4eEO7HpD4Y2DUr92spd9tRC/V3uX4uvxxAax/JQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(110136005)(36756003)(336012)(426003)(86362001)(83380400001)(36860700001)(186003)(47076005)(8936002)(1076003)(4326008)(70586007)(7696005)(2906002)(81166007)(26005)(70206006)(82310400003)(316002)(6666004)(508600001)(8676002)(5660300002)(2616005)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:05:20.1072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7524a0dc-3fde-42ba-3ca9-08d97e8a6a36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4783

In this patch, we can start to create NUMA system that is
based on device tree.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa.c        | 55 ++++++++++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c       |  7 +++++
 xen/include/asm-arm/numa.h |  6 +++++
 3 files changed, 68 insertions(+)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 7f05299b76..d7a3d32d4b 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -18,8 +18,10 @@
  *
  */
 #include <xen/init.h>
+#include <xen/device_tree.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
+#include <xen/pfn.h>
 
 static uint8_t __read_mostly
 node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
@@ -85,6 +87,59 @@ uint8_t __node_distance(nodeid_t from, nodeid_t to)
 }
 EXPORT_SYMBOL(__node_distance);
 
+void __init numa_init(bool acpi_off)
+{
+    uint32_t idx;
+    paddr_t ram_start = ~0;
+    paddr_t ram_size = 0;
+    paddr_t ram_end = 0;
+
+    /* NUMA has been turned off through Xen parameters */
+    if ( numa_off )
+        goto mem_init;
+
+    /* Initialize NUMA from device tree when system is not ACPI booted */
+    if ( acpi_off )
+    {
+        int ret = numa_device_tree_init(device_tree_flattened);
+        if ( ret )
+        {
+            printk(XENLOG_WARNING
+                   "Init NUMA from device tree failed, ret=%d\n", ret);
+            numa_off = true;
+        }
+    }
+    else
+    {
+        /* We don't support NUMA for ACPI boot currently */
+        printk(XENLOG_WARNING
+               "ACPI NUMA has not been supported yet, NUMA off!\n");
+        numa_off = true;
+    }
+
+mem_init:
+    /*
+     * Find the minimal and maximum address of RAM, NUMA will
+     * build a memory to node mapping table for the whole range.
+     */
+    ram_start = bootinfo.mem.bank[0].start;
+    ram_size  = bootinfo.mem.bank[0].size;
+    ram_end   = ram_start + ram_size;
+    for ( idx = 1 ; idx < bootinfo.mem.nr_banks; idx++ )
+    {
+        paddr_t bank_start = bootinfo.mem.bank[idx].start;
+        paddr_t bank_size = bootinfo.mem.bank[idx].size;
+        paddr_t bank_end = bank_start + bank_size;
+
+        ram_size  = ram_size + bank_size;
+        ram_start = min(ram_start, bank_start);
+        ram_end   = max(ram_end, bank_end);
+    }
+
+    numa_initmem_init(PFN_UP(ram_start), PFN_DOWN(ram_end));
+    return;
+}
+
 uint32_t __init arch_meminfo_get_nr_bank(void)
 {
 	return bootinfo.mem.nr_banks;
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 1f0fbc95b5..6097850682 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -905,6 +905,13 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
+    /*
+     * Try to initialize NUMA system, if failed, the system will
+     * fallback to uniform system which means system has only 1
+     * NUMA node.
+     */
+    numa_init(acpi_disabled);
+
     end_boot_allocator();
 
     /*
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index f46e8e2935..5b03dde87f 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -24,6 +24,7 @@ typedef u8 nodeid_t;
 
 extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
 extern int numa_device_tree_init(const void *fdt);
+extern void numa_init(bool acpi_off);
 
 #else
 
@@ -47,6 +48,11 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+static inline void numa_init(bool acpi_off)
+{
+
+}
+
 static inline void numa_add_cpu(int cpu)
 {
 
-- 
2.25.1


