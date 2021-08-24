Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D480A3F5B62
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 11:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170777.311687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5Z-0001cs-92; Tue, 24 Aug 2021 09:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170777.311687; Tue, 24 Aug 2021 09:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5Z-0001Zk-5h; Tue, 24 Aug 2021 09:51:25 +0000
Received: by outflank-mailman (input) for mailman id 170777;
 Tue, 24 Aug 2021 09:51:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jFgo=NP=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mIT5X-0001Ze-CJ
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 09:51:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e62dad9b-2c11-4df7-840c-2380c947c542;
 Tue, 24 Aug 2021 09:51:20 +0000 (UTC)
Received: from AM6P195CA0079.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::20)
 by VI1PR08MB3389.eurprd08.prod.outlook.com (2603:10a6:803:87::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:51:17 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::24) by AM6P195CA0079.outlook.office365.com
 (2603:10a6:209:86::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:16 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Tue, 24 Aug 2021 09:51:15 +0000
Received: from a5e976017d9c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF84A7BB-9503-4F41-9C11-AC0F90042E68.1; 
 Tue, 24 Aug 2021 09:51:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a5e976017d9c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 09:51:09 +0000
Received: from AM5PR0201CA0011.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::21) by AM0PR08MB3812.eurprd08.prod.outlook.com
 (2603:10a6:208:fd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 09:51:08 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::8) by AM5PR0201CA0011.outlook.office365.com
 (2603:10a6:203:3d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:08 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 24 Aug
 2021 09:51:07 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:05 +0000
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
X-Inumbo-ID: e62dad9b-2c11-4df7-840c-2380c947c542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYrQe6x6Dlk8l1vIqTVluKWnc7+Ol0QPjCsq0YGfsUo=;
 b=IIbgLhG0l+ea15w/s+y2UEVK+TyZYh2PMm/YH7brUklNRkXjrkAZgbU7IRMf119B0l5jPfyj2ntbcoIEfbIrKOPfPkC9D/6n4fBCcxQnhbOhzPkJmVp0Iqb6x7kxp5cpPhKBAs3+LaLWzh/cWT/bXhzUpF+VYN+4lrUJIM2jjGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05db3f125ba0b9b2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQxsA1fRx7Nw3n146ZTnO9dDBVjnyjtyD1s/KsMNpjmO1KhUS5Z0wZrwMy01niUJvIqnjVu5HKRa5PRm6Y/CMFUJpVMS2IXyfnRMb2lE8KJrJhTCrBdYqLiGZbXKMSz0d7TR6EXaPmtnYN40V3jV8U0CiDeYyWV9k4zNPGFqqFE2d9REWhFWJOAGN5VOSYuq5n2kOc1vt9iexlaJUPKfECQYjUCH/f0vl8bByIT4A9PaGbuGr0zSM84MafyHDZovoKsZp/aC3d3nU6Ob5m6gZ1v1FIHLGdk+2siW6puBnfXysBRPffCiAylHL0Jm+WSB7QxGmBJRAhU9cuK0TSRSwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYrQe6x6Dlk8l1vIqTVluKWnc7+Ol0QPjCsq0YGfsUo=;
 b=NJfYgo3po9pae2z6fVvKb6ZhwhFgzP8yQvHLTXF2qBRuU7FVu8njGPJXXXX+SOhs4D7KDlX4YaGR/9279D1r8JpPXhB5XvsFP8pyXai+jn0y9N2cPBYrSk8L+MmL0hhqVSCVHvxbwMB3ttP140w3pHS12BsXdwUQDNklsX+GIZTM5gZermGqBpAKw/cpNxwIbM4ycpSqfdDZTViWbwhDrgVipiwc1y1OqmbZR26ntC6Vwjta/F5wMl2FaOEfDBdDAhmQmK0NFWul8waUYsp3pPT7Htx2KikYnlnuVEyTihnVlTpwq8AG7jqQO8fG9kS4PgHQxxBF2Z8XsB5dftzjbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYrQe6x6Dlk8l1vIqTVluKWnc7+Ol0QPjCsq0YGfsUo=;
 b=IIbgLhG0l+ea15w/s+y2UEVK+TyZYh2PMm/YH7brUklNRkXjrkAZgbU7IRMf119B0l5jPfyj2ntbcoIEfbIrKOPfPkC9D/6n4fBCcxQnhbOhzPkJmVp0Iqb6x7kxp5cpPhKBAs3+LaLWzh/cWT/bXhzUpF+VYN+4lrUJIM2jjGI=
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
Subject: [PATCH v5 1/7] xen/arm: introduce new helper device_tree_get_meminfo
Date: Tue, 24 Aug 2021 09:50:39 +0000
Message-ID: <20210824095045.2281500-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824095045.2281500-1-penny.zheng@arm.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dcdf328-ea6d-4fe2-2d1f-08d966e4b771
X-MS-TrafficTypeDiagnostic: AM0PR08MB3812:|VI1PR08MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3389082C89520836F61BAC3BF7C59@VI1PR08MB3389.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:393;OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jpylx3nyKW4u59+xtGq21UIQ2/R8o0AybQe5KQIi51ZMxAt2qlMyS2AdHwXdnNIXlhl/wuAwnUC0lKZhNjWMMLQJi+j0nxJw+EAxcIiXkQ6daFo4d+r7AnVHoArrzZCu0GbiMmpplB6jXjL+956JVqkAKwgMQTBuBEudP1iTVceKfPAza25ap4cug7bKWccqaKwQZVgEkZBcrzCSiOtk5/Uk7MXDZagCagqiURLcnUJUREKnAOsLIbySk+U7xhD1bQv3P87l11MrhvvTBXRne+iCzCe/4rIX7cRqsSZlYGYU0ipLgP16wL+ct4mQ5k5z/iYW2P5rpigP+/oTwapMdzS5+oFXrow8FxSriL4xOoyjwaZzJ/FfqS/dmmhlap7/dgwwF54Cqz8/DqF5+a4qBxczWxndAhxDQShARdFSydexOjJKEHxXBQ5coiHeYKFsfTpi7TBYrUslqsAVmC2VVHrdOHuuBQ17co4IrpSUNSDfbBaYDWI6EhciOx39VnTcCwmDAbpXi0jmBGYG3jqPim3gI6dEVSnTMlI2F2Wb5kEeIa9o+cQL26bN0cwxzugIYrzxWDNnqRDqkqVZSPCEkI0MNMN7GvuiYp0fg6x9vAFFM/gGRN1jNrxbcyW3wwDBoWKSRM+/ZAcHwA8Byc51wvpEBwJf5GJIqx3kCF1emXN0+Gshl6GG8+LGcQXfzVn0k6doGkE9nDdI+TLJfdGrHycXMkWpSif4nizQ3fnc7yE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(336012)(26005)(426003)(186003)(86362001)(7696005)(82310400003)(83380400001)(47076005)(36860700001)(1076003)(2616005)(2906002)(44832011)(4326008)(316002)(70586007)(70206006)(6666004)(36756003)(8676002)(5660300002)(8936002)(478600001)(54906003)(110136005)(356005)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3812
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e79ea3f7-d44d-48ea-0b8b-08d966e4b2b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iiavaBXD+h6LtUXrFBJKyOqUcRWg1PsfHpio5b+HM5qQCNenZ1ZSYaRqpB4x6jHw2j5k1roh0LxIuePC5S6N++c/sn3FbdTKBncf0Y6vd/RqHnYqy3srUSY+ornD60x/5G0IwPycHNU4iZwT1OYwv3VwjNTcTOKQHb4UNcJtBsVGDpe8AY7f8vY5g256kBxsWjonFRYpAQiLoqWzrKbl2HrrTK4Ya7GzkmdkqhYQV6OX9pAiRjwu9PUDYsch9vVQYcmZyokec1T4iMhZ0GZL768VfQeQHs7vklT5wsYya2fY3VIBaxV9Ad/NB7Zhbw5VQAjEWh7jYIcHt633dBIG3dQuzeCDYtdAsCr66rBO7Hz6u46/z15ZT3+hxNmyVx6p52w0XK4/zrWVoTs7wzkd/A1xaSCrwCVHzILLX+1+6MJbs/bgB8yFct/l0af9N5JJiDHGwWH/3iJ7iIQ+nbwPBTXbM7wajuU2r+/hdIWnppJydk5e2lDr7iaF4ZWmKPphyd5XKC6ZnJVQXO9GGu9roybiSi8cIEUQ6oL1Cjs2BAQrQVal7EpcYh/POab0FZoTdDL4UP8BoWVycgSMI4kF8UMDb4r8rTdiVgulsWvaxij69JTyTrszbNJt8iPFBagawHIlF+Ze56BlEWnVskJf3xsQuEwb3tzdtq0YR0J4lFdsfZX8IPFMbv0UtsNagE+kCiT5rFBQRFt2/pLqJJPM2Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(70586007)(70206006)(26005)(6666004)(336012)(426003)(186003)(5660300002)(478600001)(47076005)(83380400001)(36860700001)(82310400003)(36756003)(8676002)(44832011)(2906002)(82740400003)(316002)(4326008)(8936002)(86362001)(1076003)(7696005)(110136005)(54906003)(2616005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:51:16.5290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcdf328-ea6d-4fe2-2d1f-08d966e4b771
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3389

A few functions iterate over the device tree property to get memory info,
like "reg" or the later "xen,static-mem", so this commit creates a new helper
device_tree_get_meminfo to extract the common codes.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/bootfdt.c | 68 ++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 476e32e0f5..8c81be3379 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -63,6 +63,44 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
     *size = dt_next_cell(size_cells, cell);
 }
 
+static int __init device_tree_get_meminfo(const void *fdt, int node,
+                                          const char *prop_name,
+                                          u32 address_cells, u32 size_cells,
+                                          void *data)
+{
+    const struct fdt_property *prop;
+    unsigned int i, banks;
+    const __be32 *cell;
+    u32 reg_cells = address_cells + size_cells;
+    paddr_t start, size;
+    struct meminfo *mem = data;
+
+    prop = fdt_get_property(fdt, node, prop_name, NULL);
+    if ( !prop )
+        return -ENOENT;
+
+    cell = (const __be32 *)prop->data;
+    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
+
+    for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
+    {
+        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        /* Some DT may describe empty bank, ignore them */
+        if ( !size )
+            continue;
+        mem->bank[mem->nr_banks].start = start;
+        mem->bank[mem->nr_banks].size = size;
+        mem->nr_banks++;
+    }
+
+    if ( i < banks )
+    {
+        printk("Warning: Max number of supported memory regions reached.\n");
+        return -ENOSPC;
+    }
+    return 0;
+}
+
 u32 __init device_tree_get_u32(const void *fdt, int node,
                                const char *prop_name, u32 dflt)
 {
@@ -139,14 +177,6 @@ static int __init process_memory_node(const void *fdt, int node,
                                       u32 address_cells, u32 size_cells,
                                       void *data)
 {
-    const struct fdt_property *prop;
-    int i;
-    int banks;
-    const __be32 *cell;
-    paddr_t start, size;
-    u32 reg_cells = address_cells + size_cells;
-    struct meminfo *mem = data;
-
     if ( address_cells < 1 || size_cells < 1 )
     {
         printk("fdt: node `%s': invalid #address-cells or #size-cells",
@@ -154,27 +184,7 @@ static int __init process_memory_node(const void *fdt, int node,
         return -EINVAL;
     }
 
-    prop = fdt_get_property(fdt, node, "reg", NULL);
-    if ( !prop )
-        return -ENOENT;
-
-    cell = (const __be32 *)prop->data;
-    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
-
-    for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
-    {
-        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-        /* Some DT may describe empty bank, ignore them */
-        if ( !size )
-            continue;
-        mem->bank[mem->nr_banks].start = start;
-        mem->bank[mem->nr_banks].size = size;
-        mem->nr_banks++;
-    }
-
-    if ( i < banks )
-        return -ENOSPC;
-    return 0;
+    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells, data);
 }
 
 static int __init process_reserved_memory_node(const void *fdt, int node,
-- 
2.25.1


