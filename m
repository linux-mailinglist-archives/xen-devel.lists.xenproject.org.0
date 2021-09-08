Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA322403758
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181610.328804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHa-0000f5-Uu; Wed, 08 Sep 2021 09:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181610.328804; Wed, 08 Sep 2021 09:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHa-0000bi-RV; Wed, 08 Sep 2021 09:54:18 +0000
Received: by outflank-mailman (input) for mailman id 181610;
 Wed, 08 Sep 2021 09:54:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEYe=N6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNuHZ-0000bc-I7
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7b15bec-2067-4a9e-95f2-30d0d984b939;
 Wed, 08 Sep 2021 09:54:14 +0000 (UTC)
Received: from AM5PR0701CA0057.eurprd07.prod.outlook.com (2603:10a6:203:2::19)
 by AM4PR08MB2884.eurprd08.prod.outlook.com (2603:10a6:205:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 09:54:13 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::f6) by AM5PR0701CA0057.outlook.office365.com
 (2603:10a6:203:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.8 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:12 +0000
Received: ("Tessian outbound 7a08471b1ef6:v105");
 Wed, 08 Sep 2021 09:54:12 +0000
Received: from f9cb34ce38a9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E3D35D93-00F2-4BFD-944C-AECC6C0EEA11.1; 
 Wed, 08 Sep 2021 09:54:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9cb34ce38a9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 09:54:06 +0000
Received: from AM0PR10CA0063.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::16)
 by VI1PR0801MB2110.eurprd08.prod.outlook.com (2603:10a6:800:88::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Wed, 8 Sep
 2021 09:54:05 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::2b) by AM0PR10CA0063.outlook.office365.com
 (2603:10a6:208:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:05 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:05 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 8 Sep
 2021 09:54:08 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:06 +0000
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
X-Inumbo-ID: b7b15bec-2067-4a9e-95f2-30d0d984b939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atD+jn23OE3UfPIAVyiiv0CU9p/Xc0KpqFQDOZmE+ro=;
 b=xDzMJJMeRGJQCDwVvReAfHVMVZWV5kkt1k/IaREBFsU0uWfazkma23ZCFC+VLoAvBjVEFTHThicE7LUMUoSNItl+eKZSMVAe9OBlpcz1iAJ91ZNiTIWzPv7OdBuBwHCKsD7z4IVhaJuc5kr0kj03Dxbl+1uL+FaghgWwjGdKwOE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d66a6ad96b4563a5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cs5964ruU/zXdVU2Oti8ZONkQoqxdfDsQ+Ad4dLFvz2eAtl4pgTmcOLaso7sj9c3sbBOFcGrie54bNiuF2TJ5pD1vRikS3RlmZEUBMjuz2POHlb8YHXryV4E5UkcUUq9wwIG5ylvNC/biNvCacVz5aqtFrQiGEbxrjc80xFjeBNE+JmlGPjGzDBGUsIcWGijeJE9dQFoZkADAhTdOQMzHNDOOULJmOiuQuGdagP1koNzi4X/sUt41+iy8Dv0u7YBbtDNROsm4DZim33kY0IeMu2nq+CXC7saPIzkuRunhZgg8wY75B/bNsfW6Mpu6H49YtcVGdsoUZv+d0VfMXcfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=atD+jn23OE3UfPIAVyiiv0CU9p/Xc0KpqFQDOZmE+ro=;
 b=UNrFUXPtXXZnq8HhBCkoJokrXzibv+rbk8wPPYZXDvDTQh+SUQOhstHSKVNshg5L+um69/b+DMelqE92erxWyl70ukq7jK3mfO6BRb3lTasxk/F8yg96ph/HHHgjP+Ky8y4YsF2P1QgqpbAZSnMOr9dMr7n1qhBjWOtt/1F2P+vqeylPDG8jQgfgy16QlGOQiBf/4P7f0vBgfPUT77gV2TtUWxFx+K3EN+5Rnoty0BYM/82His+M9No2oq+TPcX2NhnMI0p+gtE89/K6P6AG41LPXKOtkmmR30JM8rpBLLUw8UrgWDGaZDWs3oziWXs7bosBGAP5xdffFhVwl/N9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atD+jn23OE3UfPIAVyiiv0CU9p/Xc0KpqFQDOZmE+ro=;
 b=xDzMJJMeRGJQCDwVvReAfHVMVZWV5kkt1k/IaREBFsU0uWfazkma23ZCFC+VLoAvBjVEFTHThicE7LUMUoSNItl+eKZSMVAe9OBlpcz1iAJ91ZNiTIWzPv7OdBuBwHCKsD7z4IVhaJuc5kr0kj03Dxbl+1uL+FaghgWwjGdKwOE=
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
Subject: [PATCH v6 1/7] xen/arm: introduce new helper device_tree_get_meminfo
Date: Wed, 8 Sep 2021 09:52:42 +0000
Message-ID: <20210908095248.545981-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908095248.545981-1-penny.zheng@arm.com>
References: <20210908095248.545981-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ea29876-98fb-4e87-885c-08d972ae9cae
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2110:|AM4PR08MB2884:
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB28841439D86E26D4DB9337A5F7D49@AM4PR08MB2884.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:41;OLM:41;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GKdMi4ctUd5Xo6YEnZLv4p3v89P/yqnvqJ6+XsyQ6aBjkV3uPeh9BZe4vMYtc5Naum4aPMkRtLp5JoIGUlRFvEG/1poEW1Jwwjlj+e6pOUbajb5zoLKlztI+gxxdph58fZkcG8yUyhFqhNainvmMNExqUpWarbA/3cXBgo7zLE8z49xvQ4QzLlzIqbxNwCy0HtQ/SoHL3RxOC4XgXBrZ6p46Vg78RoXywPOHzvsJA/IiOPu8S5YVYwjHjrSh+GRLgA51Jsn3WkdiV0g3fH9Hv6S4zLpBVg8eg6Czvokwd46t+cmtBzFlucV8W+i6JJeq4hB8zC2oLoK2q3rmviSbzOprJ6LlBTFoMhIlmi5CwUDmOAPf1lIX3QlkZ5u/IuSznqukeFW80wXfQ4lOe2UDEnw4RmbTtARUhFo3KhkRmir4zDdVXSKbL9jztG0YVdQdwkfIwkP1ngJNGxHz/2Ahv87osJA9jmgQNOxV70P4N1ZDD55aZcyyRjN3jVtRUIQzjYu+FE8GQ/6rIdP+AgOkmkU2aofwXcBMrjdFNQOfJDQdl6c1BM/IoVqBmoh9KvI60d4qc266hcU7zli7WKKsjVD438ZGWVNVxKLLzC6nd6Tjp7mf8NWolpRHsSUBbrexKO8c4x0lSvhFj0pxii9ZjA5eqauWsJvH8Azhxg+mK+Ww9TWxz5oslGTbuBEDgwKTKB7Psr7dP/Ah5aBTzjpvZILETyYvxTz9PrFTCK9gnyA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(5660300002)(2906002)(336012)(478600001)(2616005)(7696005)(316002)(86362001)(47076005)(83380400001)(36756003)(6666004)(26005)(81166007)(82310400003)(1076003)(44832011)(8676002)(82740400003)(4326008)(426003)(110136005)(36860700001)(70206006)(70586007)(8936002)(54906003)(356005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2110
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a22bcb71-7aec-41fa-0708-08d972ae981d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4YCmS1+/kYlhRhk0d0qPdxTIYUZkNOq+LhvbJQPjFpoP/PK3JqfOqQ5X/A0anWOmlhiXB8FgeuT+AxOd9Nxh3Iv5jpbx/NEl3ay8wcehhyWpx6CZ8tPYnvqNZCapMEebc6IzCSpy6enV03j+tWKEbx0fQiSf1kKKBu2uRhMb9DILiYK5RZrvuFmek4JK2YOEHet2gib97doolQWaU3pT/jf6ah+XnWPZRUvxHunu2phfNW8W5n8KqHvNMgSQFxgT4XY8gqDg1aSUviCV0K/X1mSF3MhWOeQxei8YvIniEE0d7H8KAnMgQ75RiiGswYZI2PPAPZwuARwwMkWWb1QgpvsCYunitHgZjhCoqi0BnYgOWSktVjhLgGnHwa4v8xtCZykzNPDkmz/b8KW9X2LNfM3p0fPI+Ou4EjGSAkxd1bC07hNvbY6j5biyDQt95QvuJeipeEbtoxChYItvyg0R7JdS53cdAnVy90vQISVRDP5xFwfWmBA+N2WIkQWqm6udpRvK6oaaOraKusANoQ4mWqODhVrr50qWD79yk90B4cMtpWp3AStgGGlDprzzOdTJoY7URX73WQZfYjGLCK7I2xxzo+9LgIS2W1rQVJOvxMt51U8599bi0HmsyALmF6WetZrQJSBi6zqmtSV13lHeHiRlAI/OyiF9iAPGvLwUgBKSOwXCoEprhimzBmJRso5e2yGtsyUUyVkJ2FSyKFxCzw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(36840700001)(7696005)(2906002)(82310400003)(86362001)(5660300002)(8676002)(478600001)(70206006)(70586007)(26005)(186003)(47076005)(36860700001)(336012)(8936002)(54906003)(1076003)(316002)(6666004)(2616005)(44832011)(82740400003)(36756003)(83380400001)(4326008)(110136005)(107886003)(81166007)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:54:12.7096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea29876-98fb-4e87-885c-08d972ae9cae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2884

This commit creates a new helper device_tree_get_meminfo to iterate over a
device tree property to get memory info, like "reg".

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
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


