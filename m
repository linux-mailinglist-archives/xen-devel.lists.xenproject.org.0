Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD74065D2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 04:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183854.332239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWer-0004V6-D7; Fri, 10 Sep 2021 02:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183854.332239; Fri, 10 Sep 2021 02:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWer-0004Ss-85; Fri, 10 Sep 2021 02:52:53 +0000
Received: by outflank-mailman (input) for mailman id 183854;
 Fri, 10 Sep 2021 02:52:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6Hc=OA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mOWep-0004S2-Ss
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 02:52:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11f5d985-b6c4-409f-a054-1cb3dd7e8314;
 Fri, 10 Sep 2021 02:52:49 +0000 (UTC)
Received: from AM6PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:20b:b2::20)
 by AM4PR08MB2883.eurprd08.prod.outlook.com (2603:10a6:205:9::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 02:52:45 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::c5) by AM6PR08CA0008.outlook.office365.com
 (2603:10a6:20b:b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 02:52:45 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Fri, 10 Sep 2021 02:52:45 +0000
Received: from aef7096e1d60.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18FEB2E9-24A8-463E-B391-F094B9E62699.1; 
 Fri, 10 Sep 2021 02:52:38 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aef7096e1d60.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 02:52:38 +0000
Received: from AS9PR06CA0175.eurprd06.prod.outlook.com (2603:10a6:20b:45c::25)
 by VE1PR08MB4653.eurprd08.prod.outlook.com (2603:10a6:802:b1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 02:52:36 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::f5) by AS9PR06CA0175.outlook.office365.com
 (2603:10a6:20b:45c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:36 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:36 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Fri, 10 Sep
 2021 02:52:42 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 10
 Sep 2021 02:52:34 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:39 +0000
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
X-Inumbo-ID: 11f5d985-b6c4-409f-a054-1cb3dd7e8314
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWGJef8NpyPIjTGv5tGyQyanogwWdxG4O/jjsJWp4l8=;
 b=rdwRP2BhnFfHzdTn+7NGASRkWhm5/2ij8A894nlkuam8MHwmn6bRXbSjDtfPvZxhjd9CJ+pPjQ5sXjkwJrYEEPnLGCEVgnua+ghmnyKkU7wV3vh86rIfgogruZ59V/CXQwz3ld9YBNO0NG6eOwFVEIZE37tJPj1Hhk61/7cfOv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f99e22bbac556734
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADzIWDzld4KnCWL311lXNKsj/TuZveQVZ4KazgGdVeHwnRsdJ0VRg632zUCty45wCztYJjWjyF+Wpuefgd7Ce4LVUpPdj7XqY9WLgRoH7eeHs6UgV0LwqA+oO+EiPNAOBSQqu2MkELusZaBa0jIgq8wwfvML1B/oWebsj68axdk7Wvp8Ggm8NChPeGUWTFuCvBclRJHOR1I1pYJFgOQryDbaFxNqWbe2J+fNCOcx18mZqBmieOGeCLQ/4k4azahfRx6RwLq1jyolv4tpB8ajV5jLy6Y6NdPM1yktB72UNpSOUvc1QN0f3w0f5rYHCAplBh//iKULNd10eMkC4rJCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qWGJef8NpyPIjTGv5tGyQyanogwWdxG4O/jjsJWp4l8=;
 b=PN3wBOnBN1+6JIPSXfAXS5Hr0rdwDaPLtZ4Ae1w8HeI9pgGAGT5wd3WnBANlpsoSYMN0jMLtuTBfA+uHvTWPvcZlpnUYSqbiiUfTuUfwS8A8jH0BNL8J+Gpmr1Gi/AES/ZGLsiI0zhjI7KA3Ba5ZXNmsIr+cemhRh9j4RWXJKCbTi1TGvmfDBLZnEWD70YpmBxQ0y5q9QGD29cGdYElirodgqr0RyipRgL53HpMZzr7gpxZDUonijYe6rmt08VVjrpoz2aRPlkM1c8r5+b4vOyuJNePSkQ92y2kEM+fhNK/iKrBhO7pgk/eIOOlcnlhBSywdq1spM0hCpzPcfuKNhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWGJef8NpyPIjTGv5tGyQyanogwWdxG4O/jjsJWp4l8=;
 b=rdwRP2BhnFfHzdTn+7NGASRkWhm5/2ij8A894nlkuam8MHwmn6bRXbSjDtfPvZxhjd9CJ+pPjQ5sXjkwJrYEEPnLGCEVgnua+ghmnyKkU7wV3vh86rIfgogruZ59V/CXQwz3ld9YBNO0NG6eOwFVEIZE37tJPj1Hhk61/7cfOv8=
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
Subject: [PATCH v7 1/7] xen/arm: introduce new helper device_tree_get_meminfo
Date: Fri, 10 Sep 2021 02:52:09 +0000
Message-ID: <20210910025215.1671073-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910025215.1671073-1-penny.zheng@arm.com>
References: <20210910025215.1671073-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6514ac7-b076-4b74-7ebd-08d9740610f0
X-MS-TrafficTypeDiagnostic: VE1PR08MB4653:|AM4PR08MB2883:
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB2883AA29A43B8FE2F467CB28F7D69@AM4PR08MB2883.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:41;OLM:41;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j6TPtWGBobWDt2nNwtZp72ov6yuFpO7z45+5tXGNUAcDlGzxHVOdajsumaFTyM6JxFCvrdyF+qB3AqYFM3lESGT3XY32wbTpoa76sp9NxtB4ETT7RUNutIa931ujmrGuSW/zPdvaz+H7I5wZbNcW4qEjEJtoK01HV8YN8ra+r4ACLoEE7d1aSR3bR0/bBGUdqOEkx90q+oUD9kB6YNriSEpiVfNaS0Yf1BbcN01NWHZJlbgrnwimN8Bkfq0vjr/UessQ7uXjw2vThtvDoc4kMV5rd3LyaMfek2bJuz0KApxBp1LmrKhF4Rfz/T77HbHCbSiqwZNiU7XDWS2e1g2ASdcxZtKrIQqT2ehTNwQAmxFqxu8JwOUlY8TdFPqKuxlo+TBxKt7FmRNoeBuuPo82CtaZ7RU089yLGBBjkBaVzRvCWHUJuSTwQXJKAynSrlBoroXzUASvD1Kf9/b49ZyZe1aasHS6NApACVIOizOD6/xoRxp22DUFyS1hvmf+jZ00JmecMqPQZNZY6C7HyGshoOvez1TplKDN/8k2Tm2EtEBsU6i3cSxvaBLgPOGR2EaD1cCf7ACWKWsnrbJE3axOuIkptxGOE7lzvokUrretzEj3H/Naa3Wp2z5ryQdrd8zd2Zl+9AGxh37LWLuyYYw3wdr7mUWfKsOePWCn+ut/stf+Z9Spsx5EgkzsmWq74Bq8d7lb/MN0qsCZBoVJBMooc96O6kotRzGk+iGzEMV+GNM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7696005)(8676002)(70206006)(1076003)(36860700001)(70586007)(83380400001)(44832011)(82310400003)(81166007)(2616005)(426003)(336012)(356005)(86362001)(2906002)(4326008)(316002)(36756003)(54906003)(110136005)(5660300002)(26005)(508600001)(6666004)(186003)(8936002)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4653
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7277bf9-ea7f-4f1b-1d4c-08d974060b9c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xf6oME0yBKglru7326W8HRM+P/Cd6K9bVlaxburBsdEBtwHVFcJyiCLeLnyM0vHjQVch8aLVQVPe19TTDnWA4vi8OkAQsEXF+wxPgMbvMmQt2upHA1XTX0Wv4PLaDj5xftvrWGcLkpebKMfuwcqVV8eqkWrsUDENEOiKol6PWQNDaIHDYXVN7Wez/VjB9BiQzpHT7XilNeaU3hgrJyuT3dKf0ysFTNG0ZyKB/4qx9UCVGYYULDd/2U9WWbyBCx75HZs2tVNbv0cwjxR7sl6n5poXpWCoje3sCmHXV6arh11eaGHVeEoLcJ87zoxnHE50Ousx4CIODKZDyu4/3i30TmLKYvl0x3kieVRkkpqcUdYNRsQuq2un0vIc9nAqLEVn6OeMogt6Ln7yn2b81/5NiBCHQTZMxVu7vOQbEGOQ+szjvUeMUKkUlvjJzVjD/TjkbFJVC6A5oQt8Aki8yQLYfdg/aEPQ2eAP1zUMOreN8DN2F7Ka7yobh4AP22AE0+VN06+Da3erTCvGNjjUT63m72W5q3jjGcbvBAhzdggkc+sz0pWosH3EkiYhA27xVKHC86XXtdmyTSLcomNTzK3Z8UogpFH06RRtprITZNX7uN+mhx08DqHuNEjqsLv6hHMPcTYIbvaitVMgMnmHzu5SCJS1sLyzmNstjOMFGHXYh0aUFiqNUcwiVR6NNPg+2FH6QfUpXKvPFM8qKPhKp9v5bA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(1076003)(2906002)(110136005)(26005)(316002)(4326008)(6666004)(107886003)(478600001)(82310400003)(83380400001)(54906003)(81166007)(70206006)(5660300002)(47076005)(2616005)(336012)(44832011)(426003)(8676002)(82740400003)(8936002)(186003)(86362001)(36756003)(36860700001)(70586007)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 02:52:45.1908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6514ac7-b076-4b74-7ebd-08d9740610f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2883

This commit creates a new helper device_tree_get_meminfo to iterate over a
device tree property to get memory info, like "reg".

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/bootfdt.c | 83 ++++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 476e32e0f5..b01badda3e 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -63,6 +63,52 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
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
+    if ( address_cells < 1 || size_cells < 1 )
+    {
+        printk("fdt: property `%s': invalid #address-cells or #size-cells",
+               prop_name);
+        return -EINVAL;
+    }
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
+
+    return 0;
+}
+
 u32 __init device_tree_get_u32(const void *fdt, int node,
                                const char *prop_name, u32 dflt)
 {
@@ -139,42 +185,7 @@ static int __init process_memory_node(const void *fdt, int node,
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
-    if ( address_cells < 1 || size_cells < 1 )
-    {
-        printk("fdt: node `%s': invalid #address-cells or #size-cells",
-               name);
-        return -EINVAL;
-    }
-
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


