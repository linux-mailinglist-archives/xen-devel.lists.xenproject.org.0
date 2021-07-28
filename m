Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E879C3D8BB5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161422.296393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gnw-0004K7-0Q; Wed, 28 Jul 2021 10:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161422.296393; Wed, 28 Jul 2021 10:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gnv-0004Gx-Sv; Wed, 28 Jul 2021 10:28:47 +0000
Received: by outflank-mailman (input) for mailman id 161422;
 Wed, 28 Jul 2021 10:28:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8gnu-0004GY-Hb
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:28:46 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9578ea33-ef8e-11eb-9786-12813bfff9fa;
 Wed, 28 Jul 2021 10:28:44 +0000 (UTC)
Received: from AM6P193CA0077.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::18)
 by AM8PR08MB5571.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 28 Jul
 2021 10:28:42 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::f2) by AM6P193CA0077.outlook.office365.com
 (2603:10a6:209:88::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:42 +0000
Received: ("Tessian outbound 1942ea606101:v100");
 Wed, 28 Jul 2021 10:28:41 +0000
Received: from 96c23839c747.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 46857A04-0CDF-463C-9AFF-8E782B3B840F.1; 
 Wed, 28 Jul 2021 10:28:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96c23839c747.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:34 +0000
Received: from AS8P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::15)
 by AM8PR08MB6628.eurprd08.prod.outlook.com (2603:10a6:20b:362::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30; Wed, 28 Jul
 2021 10:28:31 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::6d) by AS8P189CA0029.outlook.office365.com
 (2603:10a6:20b:31f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:31 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:31 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:27 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Wed, 28
 Jul 2021 10:28:27 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:24 +0000
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
X-Inumbo-ID: 9578ea33-ef8e-11eb-9786-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqU3vVGiI7GLhNQwwAeYPut2BD+FA6nGju3mVA8aiz8=;
 b=v/8y4t/bifSMKGTTPX3Xy/F/Z/TG7fJwPgd0akk/ZqjY5u06yso8na+gjYQTWp7RY3qeuqLmUzXpwDBUDJQpp28LVXeGRHT72kvdQWcFmZ7WZzpSIjXIfSHRDcg1qfNRH2DQ1+jY63CVi+5n5tXzJaZTbbEbBP/AqicoMx4CVh0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ba852145f384422
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0NYC0C9feuFkWCcfk/PWM2fbFff2FkcNRoiqveR07oXIur81EcdthT1C7FGNSBgMtPJWtkOMhHf7dy/T/mc9X7aW51J5y0C6luSfLbuM8/vWzob3LPLdR91hCQLVvAYX7jAkf9aRHL7d25hyQw2jxhsj/pqDgP5cY4glCvZ7cr5Tgvw6HlScXSZN9+zi2Fr+grm1A57TO+jlhAhJ0222w4zKe5H5V4A9uhUlxF6hC4cjkKdYn/r0egWrUDD5wjj1k0tG9HXnWimWFj/KkvuxtmFMc8BK1GqlaQ/tmtTylFs9AQx/QwC/CHG2eM9aphJzpxP6TfCF5jFHuOUun7YPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqU3vVGiI7GLhNQwwAeYPut2BD+FA6nGju3mVA8aiz8=;
 b=FTidgiYjj/A9EQwfUT123JPTUVylAZv2dhjVnOmZMtkdvl2K5wiEQ9X1aWGR9mIV7oZUwSBcSc+rHV3CqeLEjJ9BwFKmU39vOI06KNFaKMGYDfH9akNS5N8s2Sz0Ya2BR+YejLrAJVRl745fjl+6DIZTLUOt+AHEVwQeDn0kE0wiHJ3OPHz8T4OECUe4vWfBHg10rCmqnorQl6r5lUQwVb+Kf1lEeJv4qyb8AKiMT+WWvkg12U4uEZspnhXd42XOIKgMbv3SjCls7630zsyRJYf70zI+j1Pzjt/fiPwtRJ5t+FreV9AiW2G8NfM7UBtOF4AvvUC//ojcCdaHe8XIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqU3vVGiI7GLhNQwwAeYPut2BD+FA6nGju3mVA8aiz8=;
 b=v/8y4t/bifSMKGTTPX3Xy/F/Z/TG7fJwPgd0akk/ZqjY5u06yso8na+gjYQTWp7RY3qeuqLmUzXpwDBUDJQpp28LVXeGRHT72kvdQWcFmZ7WZzpSIjXIfSHRDcg1qfNRH2DQ1+jY63CVi+5n5tXzJaZTbbEbBP/AqicoMx4CVh0=
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
Subject: [PATCH V4 02/10] xen/arm: introduce new helper device_tree_get_meminfo
Date: Wed, 28 Jul 2021 10:27:49 +0000
Message-ID: <20210728102758.3269446-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd0dbc63-ae5b-42ae-d62c-08d951b278cc
X-MS-TrafficTypeDiagnostic: AM8PR08MB6628:|AM8PR08MB5571:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB55716E6585385341CC7F9842F7EA9@AM8PR08MB5571.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:580;OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OZ9pX8zVLpZSiR/+hh4mwmZ6ZTKhOuW4umm3CNkEPEIuTaD05vhQVlplz2lAA5NdlAHXKR/KitOc7m52KOEEyMARWWx1fY52DMMHS4kSAZlYGHpWQqfBciTF6eNz3nlzeY8/BYrKs1RN7aAMdVSGccgL0+1+7sP8qbnTIR8IoE7wDwpdxBZLhpIo+o/U4DYUOmDpZkodUpGFI7lordYlpFMQVN79U/4zORzKAnAC4+VjSEXXpCkGi1ak6VBhqidIeeTstdhJXK1g+TQ7LT5RwlnbcJjaKr7gaO8JfwZyurfef0OPdyF24RHhda5inDnJwLpIzleVteF6LO7g+exUQ4lAXcVq0HhlaVg1ybUwRHZdtPZTwiq7xCyzRg6lYojjyW/LHhPGRxN99x/mIo3riDQEqB422/nJ+HA7eSFnaL+PuXzgoaAx3qxt6anqijLL7JTzhOpnLI8dM/QWaAXYsa99UbRJ2hnsZ3/3OJ61qQ0mCX5AE3bstCdaDgCmjuEJZJuBES9SxWIf4bJmdnqM4EO+6xgKg0cXW3i01p1nk9oid5p2qaWgFF05p9Ud2seRWIPf+UZagZhEqpiQ44OQvPevPHUbiTtF/VbB468DAL3JyV4uk6MBdjvb7N9vOFqv/hRuCErSOFr0xFAh6R0VnPaf7CgQzBerzGvKkcAHwSDSuEpC8/BV+mMW3EUFOUE0UXawrUBlUznyqZFvWLgJNrFyTi76Mdbg+5UvRy7DawM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39850400004)(46966006)(36840700001)(82740400003)(7696005)(36860700001)(81166007)(54906003)(8676002)(336012)(2906002)(44832011)(110136005)(8936002)(6666004)(36756003)(83380400001)(186003)(1076003)(70206006)(356005)(70586007)(5660300002)(2616005)(478600001)(426003)(4326008)(82310400003)(47076005)(86362001)(26005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6628
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27162d95-eb81-4835-f551-08d951b27276
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	40S0TjdiQ783TqZABys18xPHhdfQY1D0WT9/LpQMoaMPK+zCJG2AKUEaxB1eT9+gZwQWFG/K7tcNbzHlsPgBYxW/4sdAnVZuoJNLEBPnIwtoqvGnb+7GbUXvnzi6+HWQWBohMsbo6zdCy4SwhFOZiKbWP8b/svfR+WntrMVbX0cAxfETxUHDEG7sQthf9DWdCAsXXjylO41EddfnNDLO4lg/FXB0fnWORlmLAeSWFnaKjXsdFPjM5Ta1XurntAIKON1Xr1CS79JXyE3dbiH6F++xfskNWMtaWr+Dyt4vmCHZTWFSz68yK23PJZa1j67HhudJChDnIy6JimmfmSf6P14wQ9kKYfEJ98/Pw7Af34iRdhvACqN7oDSri2h9TDXpJpZ1LZklSb78sMLhKM1xLvGpyB8XCpVVl6b1KbKQ/ywGG7lP9iWxxiVFo3bz3H1D5Cu5dTk6SWE71B/IGYhe7ILy1aLZwBzVqmjCjHezlAScL0chG4U7NbxpGOSbO8LX8Lp7uJZCrno74uy/4FcIEe/vPT3GLp2hqMmO1WFSDtfRKX5Wi/r60saeC6EmAWXhNEjTiJ44HQHvbnu6OdndIglprSnyOmuxZyDHcMx8tb7F3xmlbz5UerzfDlGRDG60++tejulC+kqCBPQmFGj9UFMNxlG89fzor3fjhJlDET25CBG1kFqBpU6b7HiX/P1C/AcoQD8nZrlY4wMHgJHhCQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(136003)(376002)(36840700001)(46966006)(6666004)(82740400003)(54906003)(110136005)(426003)(36756003)(70206006)(44832011)(5660300002)(4326008)(83380400001)(336012)(86362001)(2616005)(81166007)(186003)(7696005)(1076003)(70586007)(8936002)(316002)(82310400003)(2906002)(8676002)(36860700001)(26005)(478600001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:42.1775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0dbc63-ae5b-42ae-d62c-08d951b278cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5571

A few functions iterate over the device tree property to get memory info,
like "reg" or "xen,static-mem", so this commit creates a new helper
device_tree_get_meminfo to extract the
common codes.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/bootfdt.c | 104 +++++++++++++++++------------------------
 1 file changed, 42 insertions(+), 62 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index d2714446e1..04210684c9 100644
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
@@ -195,13 +205,7 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
 
 static int __init process_static_memory(const void *fdt, int node, void *data)
 {
-    int i = 0, banks;
-    const __be32 *cell;
-    paddr_t start, size;
-    u32 address_cells, size_cells, reg_cells;
-    struct meminfo *mem = data;
-    const struct fdt_property *prop;
-
+    u32 address_cells, size_cells;
 
     address_cells = device_tree_get_u32(fdt, node,
                                         "#xen,static-mem-address-cells", 0);
@@ -213,33 +217,9 @@ static int __init process_static_memory(const void *fdt, int node, void *data)
                  "\"#xen,static-mem-address-cell\".\n");
          return -EINVAL;
     }
-    reg_cells = address_cells + size_cells;
-
-    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
-    /*
-     * Static memory shall belong to a specific domain, that is,
-     * its node `domUx` has compatible string "xen,domain".
-     */
-    if ( fdt_node_check_compatible(fdt, node, "xen,domain") != 0 )
-    {
-        printk("xen,static-mem property can only be located under /domUx node.\n");
-        return -EINVAL;
-    }
-
-    cell = (const __be32 *)prop->data;
-    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
-
-    for ( ; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
-    {
-        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-        mem->bank[mem->nr_banks].start = start;
-        mem->bank[mem->nr_banks].size = size;
-        mem->nr_banks++;
-    }
 
-    if ( i < banks )
-        return -ENOSPC;
-    return 0;
+    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
+                                   size_cells, data);
 }
 
 static int __init process_reserved_memory(const void *fdt, int node,
-- 
2.25.1


