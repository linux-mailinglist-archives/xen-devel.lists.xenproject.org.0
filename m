Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831C23D8BBC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161431.296477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8goG-0007DA-J9; Wed, 28 Jul 2021 10:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161431.296477; Wed, 28 Jul 2021 10:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8goG-00078o-CF; Wed, 28 Jul 2021 10:29:08 +0000
Received: by outflank-mailman (input) for mailman id 161431;
 Wed, 28 Jul 2021 10:29:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8goE-0004GY-Db
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:29:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f30213a-ef8e-11eb-9786-12813bfff9fa;
 Wed, 28 Jul 2021 10:29:00 +0000 (UTC)
Received: from DB6PR0501CA0032.eurprd05.prod.outlook.com (2603:10a6:4:67::18)
 by DBBPR08MB4664.eurprd08.prod.outlook.com (2603:10a6:10:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Wed, 28 Jul
 2021 10:28:58 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::dc) by DB6PR0501CA0032.outlook.office365.com
 (2603:10a6:4:67::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:58 +0000
Received: ("Tessian outbound 4c02392472aa:v100");
 Wed, 28 Jul 2021 10:28:58 +0000
Received: from 0a90fa88718a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF3CE0E7-471F-436F-A75B-44B4148534DC.1; 
 Wed, 28 Jul 2021 10:28:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a90fa88718a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:52 +0000
Received: from AM5P194CA0014.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::24)
 by DBBPR08MB4396.eurprd08.prod.outlook.com (2603:10a6:10:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 10:28:49 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::2c) by AM5P194CA0014.outlook.office365.com
 (2603:10a6:203:8f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:48 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:46 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Wed, 28
 Jul 2021 10:28:46 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:43 +0000
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
X-Inumbo-ID: 9f30213a-ef8e-11eb-9786-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY6M4tUyN/50lC3m48HvlUq9t50qEgCk7Ith9fpSm7s=;
 b=nWfaews+3X11Kbpn1UT3p7oatmDZKFyHS7eJnr9NDci4Xn3QOUULzS7d6JLOkxGNyhsrEigEhkxbSBmf0ZtJDHblFkweB8oIPdizfXLQJQ/GanemQo2p/TsziVqPd/Ou/Nn8DFVR6fkZAmR5+76wlobB19/2WclNxNOVh2MGeBc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7c45a9ccae45962
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWKe90ax3Y/8iTcUHsN5DJHjyJ17nsuWnv98DKaqoo6oUvHwc/sNkfSKB94QJByWRfJFsjjY/aW/TSDejSfDLA4s/PvSoBWkKP190u9YxBOpGJyD40A1zoc+B25H2An+sGOHQBM3JF8ruCnkc/m5unoJNkeYC29Z/bXwBBJc2UceT4k3juhE1GofVQjuZUZ2buL8On+SH79GSC1xOC7vyI0AAzM2Ch+IuWoiAsaY95PA2jAX0ZU3OCucaPjcbgOdyPvlyHXQhL6iPPxdpGya+jL9JY9VcGfL4V76kawfCJ7rYK9MQiv2pwhRj+uS0qiw8cIuF8BcjDFxD8R9bm5NRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY6M4tUyN/50lC3m48HvlUq9t50qEgCk7Ith9fpSm7s=;
 b=mQP7zKs8FSuMjUkj9TN2gNf2IqhdiuvVW4ImmD702S7s19eVdWBSf3H7/vQZbqi0sZl+PKm0MfX8mq3ymDYlH1SZqgGsjbnIP0xS9V/ek1AjDHU9f5jMDCEQd+PmgBqZ8OtagvZqcO1d2gilYoVvxcTVoHkEso4ZJI02tghKM21GSM9XdDD7LdqBWOV8VyqkGTkqdLMw7FuVcJrw7NPxC+vMNIRFXWE/ECXxyBHM360/u0csF0sEoXZioDBZkKUlZLEV1JsNrxUdzKLEx9em64OW9IkRh5/e4geVv2z7Qk+u8NC+GNGLObHXMLxfJOQYnsvndQxwosQvFLuPy+YWKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY6M4tUyN/50lC3m48HvlUq9t50qEgCk7Ith9fpSm7s=;
 b=nWfaews+3X11Kbpn1UT3p7oatmDZKFyHS7eJnr9NDci4Xn3QOUULzS7d6JLOkxGNyhsrEigEhkxbSBmf0ZtJDHblFkweB8oIPdizfXLQJQ/GanemQo2p/TsziVqPd/Ou/Nn8DFVR6fkZAmR5+76wlobB19/2WclNxNOVh2MGeBc=
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
Subject: [PATCH V4 09/10] xen/arm: check "xen,static-mem" property during domain construction
Date: Wed, 28 Jul 2021 10:27:56 +0000
Message-ID: <20210728102758.3269446-10-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b83d1186-d625-47b0-dd4e-08d951b28293
X-MS-TrafficTypeDiagnostic: DBBPR08MB4396:|DBBPR08MB4664:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4664AA086166B12B6A30730AF7EA9@DBBPR08MB4664.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RjoxI3ZCuF1F94ievRPklFyIrC+PLMIVq8iOrRmBwO8bcA7/fEKkwKRCDYUx1haTe+8yXnMZoQe79g2IejrwkF8yF1Rt0dOY8nhanS3bXpzI3NNmFn1VUN2cNzwejwy9WZnFb3QfpYpfCf25/1Nw5yFvIwcLpIHJfJkd6d8q0uRt7ewVVx1UDz/7UP0wA7PZCDVPGuDYpmAnvzSX4p7DH68xNThZIVY2/Cvn6GlSPzDSKBeeCpfSO4EbAy3/TX+XorTCkRT6SOt+Ko1148ZxonBJ0pm2T5oZ004QZyb++1ad8/BahhF0IZvvyhniqLwmPbdhGq9vRzXOedw8b/CBWfRieDnVB4ZC8hZpYg3laT6zvJPuyVnpRDptKy+3AkOOlLKsrUHbZEDf7qAbAL6hmmWGgmMT27ifLwXTcsle1lUVzs1F+EAGTbuvwEMMq9Eoz+aefi344ONCCg5aGa96LRYpuHcNS8VUWFgn/ajVhZ0n+PedCOhhzeh9NHxpxnDtAdvYfbbJbwhYfbj8eySn7CFaAnwBLiXeZ7jKi4XU5ytBm821Dn5y33eZJ5/BjD275aBdRZa0FkGKkMf5A9dmsGKV/Nmsvng0v9639Ojx8SpLqoRPIDnCEfJOdCqzvSNQCnZGsdjrgYa2dGZqWBsFFYssHJKlYb+ogk1mkX+xRZ4I3EpL5MxMLjwe6Uj5iSgJ15lEHfysINwNFOlUCp4I9SkrohK1E+HL8XyY/lybLbA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(36840700001)(46966006)(1076003)(82740400003)(110136005)(8676002)(47076005)(86362001)(316002)(2906002)(336012)(36756003)(426003)(4326008)(44832011)(70586007)(70206006)(83380400001)(6666004)(26005)(7696005)(8936002)(36860700001)(478600001)(186003)(5660300002)(356005)(2616005)(82310400003)(54906003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4396
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fcf034b-7de1-4f83-356f-08d951b27ccc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xu78GFPTx02XKBUA0PYOQaBVH8fnAFmiodZ2GAJ4cHAebPDw0lUz2bsLBeq2qfcpewGue2DZRUUZ4QX/UoX+rz86b5kfCY0hNywJws3O3kjVHqaZWt/1B/uN6bWeSrr1IvT/u8RS+X8oZmj2vDJFFzGyNlbrQUKGforiXPU1NDoenBaud3KkX4nsoVVPRTu/7HRTKxTT2YYEpH6OuYeYYQQ8ygKx5iMbQJK7RYLlDHsur4o4esZ8avwV244XWfsX8D9/xyLawNuSZMDSidyuipjiBSDMAEFOLaeB4UF8L70ONx07IsYwLTkScvwprJwFLMEfkRWG6zixYQuwe+2K5H/LtTXaZNdomuVj3/gudUF5wYEcoGaBOrXbylzGwVmkWiXRGdh4JAArIxN6fYcmZVFcIRortoQepHX69YAHgRbQj8sWumVXp5bampgm8cyj7IIuACcVlK+vekwQhIXOZp3Mp3jWnCGvoKvOszQgSok0SUw2ozbt1TAtJb9ghnE6xD5i9ChUMLWOCtl+1z9QcFJqOksDsYTGeWtrA04x/Ysl1SYIM0nDACV/oELysxRpv5g+C4UpgZUcOpw5Jg7KjJlYGSHWFzQ+/VgchggoZkwbapRNNsA4x3i9YmyW2SS+64uAe3ta6QqKxjbiLeOVtdPdwMiY1iT/2u/E6ZUML6H8KE358WHFkxGGa19DsLVO496S3ZS7gTUpmP9TJf2CpQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966006)(36840700001)(44832011)(7696005)(81166007)(36756003)(70206006)(2906002)(6666004)(70586007)(336012)(36860700001)(26005)(82740400003)(426003)(2616005)(186003)(1076003)(110136005)(86362001)(82310400003)(47076005)(316002)(478600001)(8936002)(8676002)(83380400001)(4326008)(54906003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:58.6312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b83d1186-d625-47b0-dd4e-08d951b28293
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4664

This commit checks "xen,static-mem" device tree property in /domUx node,
to determine whether domain is on Static Allocation, when constructing
domain during boot-up.

Right now, the implementation of allocate_static_memory is missing, and
will be introduced later. It just BUG() out at the moment.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6c86d52781..cdb16f2086 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2425,6 +2425,37 @@ static int __init construct_domU(struct domain *d,
     struct kernel_info kinfo = {};
     int rc;
     u64 mem;
+    const struct dt_property *static_mem_prop;
+    u32 static_mem_addr_cells, static_mem_size_cells;
+    bool static_mem = false;
+
+    /*
+     * Guest RAM could be static memory which will be specified through
+     * "xen,static-mem" property.
+     */
+    static_mem_prop = dt_find_property(node, "xen,static-mem", NULL);
+    if ( static_mem_prop )
+    {
+        static_mem = true;
+
+        if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
+                                   &static_mem_addr_cells) )
+        {
+            printk("Error building DomU: cannot read "
+                   "\"#xen,static-mem-address-cells\" property\n");
+            return -EINVAL;
+        }
+
+        if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
+                                   &static_mem_size_cells) )
+        {
+            printk("Error building DomU: cannot read "
+                   "\"#xen,static-mem-size-cells\" property\n");
+            return -EINVAL;
+        }
+
+        BUG_ON(static_mem_size_cells > 2 || static_mem_addr_cells > 2);
+    }
 
     rc = dt_property_read_u64(node, "memory", &mem);
     if ( !rc )
@@ -2452,7 +2483,11 @@ static int __init construct_domU(struct domain *d,
     /* type must be set before allocate memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory(d, &kinfo);
+    if ( !static_mem )
+        allocate_memory(d, &kinfo);
+    else
+        /* TODO: allocate_static_memory(...). */
+        BUG();
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
-- 
2.25.1


