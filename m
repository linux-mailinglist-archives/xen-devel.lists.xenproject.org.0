Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A83C983D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156293.288419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tlq-0008Pb-Kz; Thu, 15 Jul 2021 05:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156293.288419; Thu, 15 Jul 2021 05:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tlq-0008Mu-GW; Thu, 15 Jul 2021 05:18:50 +0000
Received: by outflank-mailman (input) for mailman id 156293;
 Thu, 15 Jul 2021 05:18:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tlp-00083i-C3
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:18:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21a0c45e-e52c-11eb-8891-12813bfff9fa;
 Thu, 15 Jul 2021 05:18:47 +0000 (UTC)
Received: from AM6P193CA0110.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::15)
 by DB8PR08MB4026.eurprd08.prod.outlook.com (2603:10a6:10:aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 15 Jul
 2021 05:18:40 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::c6) by AM6P193CA0110.outlook.office365.com
 (2603:10a6:209:85::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:39 +0000
Received: ("Tessian outbound ef2da60907d5:v99");
 Thu, 15 Jul 2021 05:18:39 +0000
Received: from 56eed0801f3b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3298B7CB-4162-490A-B382-5CD75E83B8DB.1; 
 Thu, 15 Jul 2021 05:18:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56eed0801f3b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:33 +0000
Received: from DB8PR06CA0038.eurprd06.prod.outlook.com (2603:10a6:10:120::12)
 by AM5PR0801MB1987.eurprd08.prod.outlook.com (2603:10a6:203:47::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Thu, 15 Jul
 2021 05:18:31 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::93) by DB8PR06CA0038.outlook.office365.com
 (2603:10a6:10:120::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:31 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:31 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:29 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:27 +0000
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
X-Inumbo-ID: 21a0c45e-e52c-11eb-8891-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqU3vVGiI7GLhNQwwAeYPut2BD+FA6nGju3mVA8aiz8=;
 b=sVo1DJ5oxew23bckWudEyHjTZUZag78PDOVGDXP+U21rhEoHYj7g06yTS6kZCBIsHZubuiATMAmbaRFqnd6eclxzZSaIjICDbCriq24loHbo3aiy1rsjBijk7Ye85i/oJFr7kz3/C17ALlal/PqE3HNBR9Q/8ddfRcPt79OiBtM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a954491ebf86a9d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtYhI0ms3t5Cpj/E5UC0T3oUQqY/SlvuRRG3uXDpT7g3rYjMAv5FojGnqLvksyw4IU8Mi3LI2vSXPKgJ2z1xCNitPygQpemgJo+qh9qmdodwfUYkNDWLdypNT7hIIjOjyBta3FBzQEkj75quKrxQ+7Ja4N+7HpkpFlphVs9FaAo/ucJC5hL867PQBy4OnmtO0vMl2RGChF9Q+nL2kcDE/jGVmVrWwPxMde70w4NivViAY2YNkdKJJOUX5Qn8J4XTBGWjCMHum9KFqlgtZNt4+O5f/USrm35kYbqULMP5pB80S4sWa92NBxyrjI/mfvmF1hsAoJ005gyQOzqd3mSPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqU3vVGiI7GLhNQwwAeYPut2BD+FA6nGju3mVA8aiz8=;
 b=iiNMZrZFXrcP+8EGTRbWGkHmQ2r3vMhuC0t0PJIlgCWpZNHTRZptiry4Gq9IA94MiUeWJnolouT8yurIwJMOi4BZrEUP6xu7i8PmLVKe7dcHz91vsllzcbkGOT6aPaJvbO7od/6q8uSy7LdIVLGii7XsEEkGKO6q8E70IlYaaMg+1LYUL24bq1hXx3vGdtqJBzoQTGN9h+Wknq3fkmN/GE/SCG/mOYPYWgZdtm7vS7AzJXoXAABGvJ2kRTt8gEdoXOUK481FkkmjTJ5hb7ftJ+uDjw36iw1EbvaSkqR91M0PtWaMXfXGzeKah5m8nCPA8s01VsC/1Ix3yx5OVbLZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqU3vVGiI7GLhNQwwAeYPut2BD+FA6nGju3mVA8aiz8=;
 b=sVo1DJ5oxew23bckWudEyHjTZUZag78PDOVGDXP+U21rhEoHYj7g06yTS6kZCBIsHZubuiATMAmbaRFqnd6eclxzZSaIjICDbCriq24loHbo3aiy1rsjBijk7Ye85i/oJFr7kz3/C17ALlal/PqE3HNBR9Q/8ddfRcPt79OiBtM=
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
	<jbeulich@suse.com>, <nd@arm.com>
Subject: [PATCH V3 02/10] xen/arm: introduce new helper device_tree_get_meminfo
Date: Thu, 15 Jul 2021 05:18:11 +0000
Message-ID: <20210715051819.3073628-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 183d19f4-f280-48b6-2cad-08d9475001a7
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1987:|DB8PR08MB4026:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4026D79633DD3CE4D6D8DFA6F7129@DB8PR08MB4026.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:580;OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fzOrV7tM06yzry1ig/XBIkBojH61BQmHn6rpxVnghWpYw5gZgR945/jeiMBGUlHEwia6O2LEw3TQS5Etcl85aOhZBSVIasa0p6f2m48zMxcojWpjzHGGkXx/qdRnwKJBVBceSdhd2rMPgfa1LkROBCtfjB4c1XNVMHaO2cCYaS0RqSRNqfrUZ8I8+xEOXKn+wc5T0r2L92CUnYsVmctsgnkfECPNjCCdWscTvisRlpWEpOApy9Ak/vs3H5bcsif1n/2iwuxH8zpcoDlJ1CkvmmPbvi0yseoIi0bT+YEVw4NW+QFuktY61dT/f5Yn9hQg2yGDmyzyiMcj47H+NHZEcDYzDm8CwKiucO9EzyhAqpvO9kuDp5zJ1WLFG8FNMCvLTB+eGcdCJhVeATwfH+Hk3dxtEwYj3BOZNqBxzQej1Q/oEhO/MzoThIEombiVq4VkCbmAf5CHpEx/jXsZmZJWWtIhdKfv1fR/iIpt7esUIA/U3i2hyBaPzIQVHWr9seYaKShaTG4BbDq3u8bY3fzU2/AfW02iTgLejE7N4GkA7dGMry201MtV68x9XD2F2JqJkQ3U2oTkdsStXyWXHSRFpYzz1ddEFdpS6n8rf9vZMhkhm9eMoJkw+dbJaBAtG5pCG5LkK1+F55EIONWZMZmV4shrlJ/m1kz+ZimJ7gEgjqP/QGGR0dEstgCLAWPLpdj3Ua3TM+oeVYJFkSPWqHQ3DzPGp960l/sAHqPrI7ufXH0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39850400004)(376002)(36840700001)(46966006)(1076003)(82740400003)(70586007)(83380400001)(36756003)(426003)(81166007)(70206006)(5660300002)(86362001)(8676002)(356005)(2906002)(110136005)(54906003)(8936002)(44832011)(47076005)(4326008)(6666004)(186003)(316002)(2616005)(36860700001)(82310400003)(478600001)(26005)(336012)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1987
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39325497-bbea-4953-c2c2-08d9474ffc6a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QTBIUY7ODNagrJNlGKaueIlXvXK58lQQhIEylNE6YThS6nxDwQGfirLzlaHZh3b6b7Ef+Ysd218E8253BCkl5f/HlXmFnUm3VGBOpiHQIde+Uo/H5k801LVp50BJunlrNxBCSOVvgnfVca5uMTl85QWD7seipELYCWMS6Tp6/k7jpJRcAf8EJxRsuBYxv/dTdSO7UaZT2Ah1qYM4sFJ5R5bXSU9Z/SmvQBlKgRv79JIFGaG/n7b3Z2p5iR7Hoh2DiOtaPEnsl+3QX1klzQy7wQKKdilwiFU+O7D2HXOLZck0l+zbFA/ocuj0SzBbvDXF+TxTmim21eMK3I34v1FYvBJjOfKTBX1i+56AepMwGxNU5PmP1PZr6Kywr2Y7+OO3mgbrUmueSlh1H3b32QauntZ3DHhH3A7FKp8tWJ7S/kwl5Ez/mJwh+cM5fFkc7eHWQmG2YoIsqJv2+HowT1X38cX0f1Gq3JuNf05owwrZFuYcn562WsYunxdALTqvCxsTItcvRQSs3/wm+7bZm2/TxQKxmAqTqhIvGlHv8WjFHiWNCC6+xPSHcY9MvYbz5LeFKibeDdOrhmNar9M/IXxsZpBJsWXKT5hXrNLD1FBAoBqlT9ejCDK8yPETWjugkEH6WAsHHLsoTDYZJfJRn3PHyk9sIVh63Z+mfPj23q7PDzBdfzBEBUHt+M8BDI1NAkSFytwHV7rI6iWplDkxKmCjdw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(136003)(346002)(36840700001)(46966006)(82310400003)(26005)(86362001)(70586007)(478600001)(7696005)(4326008)(186003)(36756003)(54906003)(426003)(2616005)(316002)(5660300002)(8676002)(336012)(110136005)(70206006)(1076003)(8936002)(82740400003)(47076005)(44832011)(36860700001)(2906002)(6666004)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:18:39.9705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 183d19f4-f280-48b6-2cad-08d9475001a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4026

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


