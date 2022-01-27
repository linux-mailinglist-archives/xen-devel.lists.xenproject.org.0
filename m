Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCAB49DC04
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:57:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261254.452161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzei-00076e-SR; Thu, 27 Jan 2022 07:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261254.452161; Thu, 27 Jan 2022 07:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzei-00074g-NO; Thu, 27 Jan 2022 07:57:20 +0000
Received: by outflank-mailman (input) for mailman id 261254;
 Thu, 27 Jan 2022 07:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYm-0000Xj-PX
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:51:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e37e206e-7f45-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 08:51:09 +0100 (CET)
Received: from DU2PR04CA0215.eurprd04.prod.outlook.com (2603:10a6:10:2b1::10)
 by AM0PR08MB3057.eurprd08.prod.outlook.com (2603:10a6:208:57::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:51:04 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::da) by DU2PR04CA0215.outlook.office365.com
 (2603:10a6:10:2b1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:51:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:51:04 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Thu, 27 Jan 2022 07:51:04 +0000
Received: from 76afdeb32a0b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A15F6C0-0970-4E25-AE5E-8A0214808630.1; 
 Thu, 27 Jan 2022 07:50:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 76afdeb32a0b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:58 +0000
Received: from DB6PR0301CA0050.eurprd03.prod.outlook.com (2603:10a6:4:54::18)
 by AM0PR08MB3954.eurprd08.prod.outlook.com (2603:10a6:208:130::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:50:56 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::2d) by DB6PR0301CA0050.outlook.office365.com
 (2603:10a6:4:54::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:55 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:55 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:49 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:47 +0000
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
X-Inumbo-ID: e37e206e-7f45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcniZhKAF+YlzkF8r4ObH2CSPPalx5peyg6qh95+h3o=;
 b=nqFHC9vBUa77Q7UdBVvDxOdQWJQWYZ1OmpOFVywIGQM+Eqvui3KLRBMOMBl/PXIMTvLRJfHYAkUhhsQqzd8UUYddLde4r6lECP0NqW0oK+y+7pV8VlPyXfkG+vwZXByCKE3k959hcka0a3T9rKfdx8DsCRjtDW9BuS/HdD/KrF0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2778a4c416ac9ed8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcOegVREa0pntX0NOkJU1LFEOGYnli6lJ9SkL0Q8LtHNDQrkeBZ+c2cBllZTgSLbFZI3ndqR2ZgvoGL686Oyi0xxx0vvIDaUJSYhzD81cbuBWVGE8Clc5mXJakY0POYDAEE0nbuTafQzsm/ygMh/FzE7Rk4RyaeYBVTQqa+qkLJwEIlNn0XjTj8u0CC5Irl33dp7hmQ1VKX84kvA1ztL9pO5wcfg21KZb5ipSNYyQuchbHB/HO6G4+AxluWSOlYv8dnLc30qzbVAJkXZLVm6SYw3B8VjCEK19aTEHxJwM5myfkpd/QzFaP+uXGe84j9Zb/MG8seKT/eeEvKiIjv8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcniZhKAF+YlzkF8r4ObH2CSPPalx5peyg6qh95+h3o=;
 b=Yz2JMyW4zY9JOG4QqpdM9nVgb75Ev+AxzoNrFgE4mmG6lrpdIvAGg0McsYevT0PKiYyJqf884GOXbyWNuWjY9F0rZ/kNmFBh/zwUvw1oniWdLkCQiOy0Mx/e3NUeLuGrT3eGDlSIsoKcMcOr9nhNluv+KBojguLNXFcRW3e8pk7CNmz8NSkC+0iBhmjuzWwUcr/6XEk+rm1hs9jp3kzz9pUhNKgZI8K9XKSnSsy5dHEhFJlFzyfwoeA1odhoErJ6wafyLHmaUGqAdLY2t74XZkf5DK8IbNfuQDgdJ0xhPz5eSfx3P6oY7aXMXPcqlVvVGYyO9wIraZ/My3k4MkNEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcniZhKAF+YlzkF8r4ObH2CSPPalx5peyg6qh95+h3o=;
 b=nqFHC9vBUa77Q7UdBVvDxOdQWJQWYZ1OmpOFVywIGQM+Eqvui3KLRBMOMBl/PXIMTvLRJfHYAkUhhsQqzd8UUYddLde4r6lECP0NqW0oK+y+7pV8VlPyXfkG+vwZXByCKE3k959hcka0a3T9rKfdx8DsCRjtDW9BuS/HdD/KrF0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v5 11/11] xen/docs: Document how to do passthrough without IOMMU
Date: Thu, 27 Jan 2022 07:49:29 +0000
Message-ID: <20220127074929.502885-12-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: c50995f4-530e-4289-e9b6-08d9e169c52e
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3954:EE_|DB5EUR03FT024:EE_|AM0PR08MB3057:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3057C7FFDC8596F6656A7BB4F7219@AM0PR08MB3057.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 exw++onWsfnf+UHypgGwng7/bYZn6bdN+YZiuQu30BYb6Rtd+c0A1se/Z31pDe8lfG/WOoU1YY1fyGkIkkWuzycLICjKBx03S9xuNxRSHYUQcBzDflVRN3JK3jLIz6+MLZmWviAPUkSk1gyRFRtNj8v3iu4z9obIR42gYphsdab4doBabvEZf8WxTGRYCk5D9+JTiPZOR46srYola/DW9RlpuDzNzgcafRskiZMuW6QHqNyTFu/iVEDHFyX6lb9WzmLoovwWA4TS9xsuki2JtzaR+cnZPdbiltWsg4/mu2ThnpswQRz+JBig5uvYsVwElzv5+qKoMcIUH/Zo+4+4TwOhsKvQHDjpIGBXTzHL3UIQXy2aBS3hzKtFr+NIGbgG6aTQaEqZ6BkCHtkiCgbhj128Em2bOQLOJYhdOW6Tq4OSABueZrgHI56MPclXGfVvDj4JA0ZBhWtanlkxyTVAGoTjbzfA8YWPqTNy9Gggkz2S5k4Mrc7XY82wXqVFH+2mVn5+4Lg2/962xFRuOQja3GcUc3im1dtxPVt3UMCLySzWam5RkecjL8Jhqal+kiSu0TDTunl1T923y1o559I3rqw3cOmiteaHQMSBdjCAC3sMM/a/G7DplLqidbC+bY5Hw5pI7wxFjo+emHskZ7BWGSbJzLT755rOrv83DthlZ2Arr4iIWAtRB37PoNGQHLUO2Zs9lJ+UCuvjchSYdAZSQA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(70206006)(4326008)(8676002)(81166007)(82310400004)(8936002)(426003)(5660300002)(336012)(356005)(83380400001)(2906002)(7696005)(40460700003)(6666004)(2616005)(110136005)(36756003)(54906003)(86362001)(1076003)(186003)(26005)(44832011)(36860700001)(508600001)(316002)(47076005)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3954
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc20f1f8-7c4a-4faa-22df-08d9e169c004
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SHK0EllLIpTGYsOG6CxGDsIpicmEt+LIQKgy8hfKpyoMkVW+bXoQkYhMteoeJjam0iQrzDzCj4Payqd4g8EUm+9jYRTpRGP1UiEb9RLd0nIGH5/HMVjpwZyHlzbuYiWE/RXkATeOdijBhthbA8LC4WBTLXow4+qRmIyvRF5r68zgnOjORZDsCbeoGY6HG9e5JLIJOha4//ttbPwrDPWChiursw9r9oaIt4j4KYY/TNoJW4A2TflC+BAKyRNIviU97LAx7+QPqQOupHhXuzbrLR+J1Ekyu2FBhr3KjPL5XsryIX65utaGO8ge4WlDUVcx6BT+CMuNnwdpETyDeIiu+kIJoui8ZMD5Wv7GVmSi+GJhM8aIyum3a3SS3erFKoH+slbM2RR8Na8xqEmYVhrVufs1M7T/rpEe2juUkeOP7Pao0CyVRAb7AO2c4ayWhw58VsqeCvX68Ru5afIraB9dTW0+D6YePTVES2lNYx5ISAqenUcXZlGV43AGU40k0MqWzYTLojqTD4S9v3AS9wA4tTzMhPQeU2caMHlkuhHVhFA76iSpmWf9kMfdT0N8cyFQIXRwwgnmDi6dav+ReNI+gMJkFFOvmUZW7eEi0LAu+8wVyzKdGVHtoSCWBk95qU7PGzs0MzZ6tD9mytFIyvM7Bt1McXzwghoek2p09CrGWptNZkkIqKgDp6gxpxzSMJST
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(36860700001)(5660300002)(2616005)(70206006)(70586007)(508600001)(6666004)(81166007)(36756003)(44832011)(7696005)(83380400001)(26005)(82310400004)(316002)(40460700003)(54906003)(110136005)(336012)(4326008)(8676002)(8936002)(47076005)(1076003)(186003)(426003)(86362001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:51:04.5481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c50995f4-530e-4289-e9b6-08d9e169c52e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3057

From: Stefano Stabellini <sstabellini@kernel.org>

This commit creates a new doc to document how to do passthrough without IOMMU.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 changes:
- nothing changed
---
v3 changes:
- nothing changed
---
v4 changes:
- nothing changed
---
v5 changes:
- nothing changed
---
 docs/misc/arm/passthrough-noiommu.txt | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 docs/misc/arm/passthrough-noiommu.txt

diff --git a/docs/misc/arm/passthrough-noiommu.txt b/docs/misc/arm/passthrough-noiommu.txt
new file mode 100644
index 0000000000..3e2ef21ad7
--- /dev/null
+++ b/docs/misc/arm/passthrough-noiommu.txt
@@ -0,0 +1,52 @@
+Request Device Assignment without IOMMU support
+===============================================
+
+*WARNING:
+Users should be aware that it is not always secure to assign a device without
+IOMMU protection.
+When the device is not protected by the IOMMU, the administrator should make
+sure that:
+ 1. The device is assigned to a trusted guest.
+ 2. Users have additional security mechanism on the platform.
+
+This document assumes that the IOMMU is absent from the system or it is
+disabled (status = "disabled" in device tree).
+
+Add xen,force-assign-without-iommu; to the device tree snippet:
+
+ethernet: ethernet@ff0e0000 {
+	compatible = "cdns,zynqmp-gem";
+	xen,path = "/amba/ethernet@ff0e0000";
+	xen,reg = <0x0 0xff0e0000 0x1000 0x0 0xff0e0000>;
+	xen,force-assign-without-iommu;
+};
+
+Request 1:1 memory mapping for the domain on static allocation
+==============================================================
+
+Add a direct-map property under the appropriate /chosen/domU node which
+is also statically allocated with physical memory ranges through
+xen,static-mem property as its guest RAM.
+
+Below is an example on how to specify the 1:1 memory mapping for the domain
+on static allocation in the device-tree:
+
+/ {
+	chosen {
+		domU1 {
+			compatible = "xen,domain";
+			#address-cells = <0x2>;
+			#size-cells = <0x2>;
+			cpus = <2>;
+			memory = <0x0 0x80000>;
+			#xen,static-mem-address-cells = <0x1>;
+			#xen,static-mem-size-cells = <0x1>;
+			xen,static-mem = <0x30000000 0x20000000>;
+			direct-map;
+			...
+		};
+	};
+};
+
+Besides reserving a 512MB region starting at the host physical address
+0x30000000 to DomU1, it also requests 1:1 memory mapping.
-- 
2.25.1


