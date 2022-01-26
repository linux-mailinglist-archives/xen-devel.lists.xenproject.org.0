Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7C49C727
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 11:10:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260765.450823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCfFt-0007Uf-G1; Wed, 26 Jan 2022 10:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260765.450823; Wed, 26 Jan 2022 10:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCfFt-0007Rp-CT; Wed, 26 Jan 2022 10:10:21 +0000
Received: by outflank-mailman (input) for mailman id 260765;
 Wed, 26 Jan 2022 10:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9ay=SK=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCfFs-0007Rj-59
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 10:10:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28a7b1dd-7e90-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 11:10:17 +0100 (CET)
Received: from DU2P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::12)
 by DBBPR08MB4506.eurprd08.prod.outlook.com (2603:10a6:10:d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Wed, 26 Jan
 2022 10:10:07 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::71) by DU2P251CA0001.outlook.office365.com
 (2603:10a6:10:230::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Wed, 26 Jan 2022 10:10:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 10:10:06 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Wed, 26 Jan 2022 10:10:06 +0000
Received: from 80889583d841.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D306829-1A37-4A85-B1E7-98D053B76851.1; 
 Wed, 26 Jan 2022 10:10:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 80889583d841.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Jan 2022 10:10:00 +0000
Received: from AM5PR0201CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::11) by VI1PR08MB4302.eurprd08.prod.outlook.com
 (2603:10a6:803:fb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 26 Jan
 2022 10:09:52 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::ab) by AM5PR0201CA0001.outlook.office365.com
 (2603:10a6:203:3d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Wed, 26 Jan 2022 10:09:51 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 10:09:51 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 26 Jan
 2022 10:09:48 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Wed, 26
 Jan 2022 10:09:47 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Wed, 26 Jan 2022 10:09:46 +0000
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
X-Inumbo-ID: 28a7b1dd-7e90-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKV00kB8E2lb3zvCouyq6z5byuuEBhVPh2iHKLoEKXw=;
 b=OzZy5Zr6lfdEc44ggIerMUpXp2iPKoIhjTBe0IauKLvhNbzUtkCafEotkXEvDE942SivRnfIm0xF6Wo7kOeC7NmGjGeqXUsq8JqR8LI9fDAXTTi7kx4PlYjx2QMWgITs6yUEl7+VDSGTGYNiWyV6E3sIG/i27hxzFVvqFhZoz2Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00f79546d79046fe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alNhyWf5wX8AUKH9KTfdg1EPCrHy37vJAHENqzaDR/md3bLsAzldTnYHgqviNZfQwBropo2xViibocBTRgxaIbhXXDMMU/u+V8zmB8y5ZuY+xSZGe4Kj6IQsn+K/HnX1AwXTDA59o/L0TDxZBQ14Eu3+VuFCSCOrOXuYOYZBppgSw343fZRkgq0h51ZhGEPJhT1WPJ1gQfUoCbQ6bYHltngEGL0jt7/eEYMsjE+JndxlHRM9L0C8MMpKnue5vPp00jKm4wuIN8dDxHPWU8lZJ3cx0x5XurMFqOsrSyw84H1BGohQHdio5gcR6e+ZCbIV0TIVDe6HKxT8GtSKWA3mSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKV00kB8E2lb3zvCouyq6z5byuuEBhVPh2iHKLoEKXw=;
 b=Vi8xFxZBiGJyY4XIarCXauzzfIpZLJzdX0O5o7HO5YVyvF/hdTNf2GZEXRbCTzl3VW1E9X22OTnAXCC3G7zUgUFQ06AmJCKT82JlOejORSnHU++S60mQ9nQtlNJx4RBTuweRQ9B7+hc38ONeGefH2UWygYP2wMTLYLQsucL7yVffcWCHNZ2rDNg6EyUgPuwCVddnEdSFZfNxsIP7F9d2Nc60Tj6FZmTaeyqGuExzv3MYtUvRUm5DCixiqH6ceJv9lAD2N9QJkmJ6+7eVUEYHsd5j0FATDINl670rKiNlEjz7hvhBDteP1OkGTcxNYEa8ATKyXveZ/V1443l+dTKKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKV00kB8E2lb3zvCouyq6z5byuuEBhVPh2iHKLoEKXw=;
 b=OzZy5Zr6lfdEc44ggIerMUpXp2iPKoIhjTBe0IauKLvhNbzUtkCafEotkXEvDE942SivRnfIm0xF6Wo7kOeC7NmGjGeqXUsq8JqR8LI9fDAXTTi7kx4PlYjx2QMWgITs6yUEl7+VDSGTGYNiWyV6E3sIG/i27hxzFVvqFhZoz2Y=
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
Subject: [PATCH] design: design doc for shared memory on a dom0less system
Date: Wed, 26 Jan 2022 10:09:43 +0000
Message-ID: <20220126100943.4086208-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 43e1d97c-2ebc-4cc1-3a32-08d9e0b40732
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB4302:EE_|DB5EUR03FT018:EE_|DBBPR08MB4506:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4506329CCAA8252F78027F8DF7209@DBBPR08MB4506.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 U92ytrhpGRWzvtB3lIXI1QCP/y6MQs3GbM95xlUT9/n7TCahiIIjwmsBSwieIgGL7Q7n082KsvQgSB7/j7B6IDOYQy1zoZK0+TSIq7W1riiiGpAZYWi6AvdcwZ6jqu8+2p6Qc/CNjEkVdGKYeXGusA4euQVmddMKpR6MeB1XTKu4Gu9Iz9yP1s1ttXYqy6ZQJ9PvRaTV8+0irtMydc+S3KUwKHvBdZQSLjC6ZRvWiHxYeKCZAH6egzDxuKgJjTUYzxqseoZ6PMDGfaKwzNM3C3yUi9K4B1CLmvOIO5/2ghow77gVbx7BF7SIfAszsSfuX9/XXc+EI+DID1n6RXnbWDiykJ1Llfgo1uynqbjUi/93f/mKqdD5xt6Cu/Gp9lKM5p5eEnPMf9eYL8/W5ecf3yPm0tFuAgXRPZ0LPeKdlm/j3nEETyE0J92I93dlW3dsplhDmeEu+31usM9PQ/3ahEmrFuhXygJVeIYwB21QsaYwjrvp3CGQxTnAkPa8XCnMpeikwDcyvKcN4Dej4OJt85qSOl4T809VvYb0NRdqIzN4LloynKzXJD6YtYxceiJGJAIjL/QAzAzCobprEYVLjgqW4BbH7b3X+FbRv6JTaxbSL6m8NKrcbO9vSAWsGcgjINm9IS53fBt54TjPlHromxSbo7SUukqCeKzoJm30LLeeb6Vd3Xy4cOk+QGvYZ12X7NPWdUDPtUa2aIKUYQ9C7T4aP0WxFxUrnW4VhpeweANL15oA9Oz8W+uNuxLAV6XXahW4E89LXP7FzB/udt6GJpt3Yk46BnbYdcCBtkksCfaQ/80tAKdVsf3Ci2E0wFOWO3cCEDYf95lJY4untWt4fSElo/sPtwE1Q8BJforAzVB//pp8nnv/OinIEbKPnCKDfpz5YV49/hmkweDmVfd4FA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(40460700003)(110136005)(47076005)(316002)(44832011)(5660300002)(54906003)(86362001)(7696005)(4326008)(1076003)(8936002)(36860700001)(83380400001)(186003)(966005)(336012)(2906002)(26005)(70206006)(36756003)(2616005)(6666004)(426003)(8676002)(81166007)(70586007)(356005)(508600001)(82310400004)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4302
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eda53f6b-49af-4fa8-3f70-08d9e0b3fdca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ts+rVBwmXpXQEjLeT4g4KK8zCssecbxT7QpYTbpltrXCMmVDG49wk71JQfKjVkebBfVn9wf2jrjj/LoRM62cSAG9z0HGGduOt4fF0XU/VOKnihjQF/pdEv1d7lBp0sEMRwSwpHJyj4zDPNntiuSdznV1pOQWkEYDzWMhgA/Nkh53d6j+1VG9u6Zd1PzcKhwvLptaaUbscJkpLJvQqyiXiu6ykVS3y5AXBMaA0wT6j21gdcUISuzFoG92tV0HlU1dDhtpWj95XOuBcAFxRVKAxUmTXlehw0zeMyCQ12rkIOezTCGVKCsle8wEeQdpOJAbs0p6P2+XCbOx+WqG/IVahqpzkDq65R7AqykY0CyQrha9uEQT1EUjKWPSXzrkBry9MkNx0WI0Z3dePw6VH8G40jqh2IeuB8VzgWoCXIbuyPR3x4oc1dUpZu8oyR/k5JDm+lQOHkvhBZsTvPlP1HQdNGegWfUiCmHL8Y+9EiUAViIYvnXfqPU4m5k4I7CmD9s9L7p7xJcLyj4XbStnyuU0s1xcXYHxja7uYcQQyyy70xCTVBljjHpvWbPOLeGpwmIe0Lz+qH5cQk/F1b31IX2uQ3BNFHdPxDOaEv+q1p5dAA/qGaTrZ626AaZCmrhPpPQNKvhRMi0e2sOKGQbYdHaVIWbzk4ZP6KXNIwk9fK2B14BqlaODDgBOVp6ubCl4eQrXp+ALMzGE9TdyvcidPAwtR/e0ObBAJR22F1gm/ALtohbnudkYjRrrV696Nvy/eTZi+hF3M9iGKz3oFw8kLKqLFpbkoHZ3ynlk7+qEzdPv6y7BEeM0Pi2axQuaKFZKGKo7oNfxhVfgsXZOnwOXtdna5XeOh4avUDJCW/VP+9YKosmxVPqZzVJfyoMZ33tebsWW
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(26005)(336012)(2906002)(316002)(82310400004)(186003)(966005)(83380400001)(36756003)(70586007)(5660300002)(81166007)(1076003)(8936002)(508600001)(70206006)(40460700003)(8676002)(426003)(36860700001)(110136005)(47076005)(2616005)(86362001)(4326008)(6666004)(7696005)(54906003)(44832011)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 10:10:06.9018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e1d97c-2ebc-4cc1-3a32-08d9e0b40732
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4506

This commit provides a design doc for static shared memory
on a dom0less system.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 design/shm-dom0less.md | 182 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 design/shm-dom0less.md

diff --git a/design/shm-dom0less.md b/design/shm-dom0less.md
new file mode 100644
index 0000000..b46199d
--- /dev/null
+++ b/design/shm-dom0less.md
@@ -0,0 +1,182 @@
+# Static Shared Memory between domains on a dom0less system
+
+This design aims to provide an overview of the new feature: setting up static
+shared memory between domains on a dom0less system, through device tree
+configuration.
+
+The new feature is driven by the need of finding a way to build up
+communication channels on dom0less system, since the legacy ways including
+grant table, etc are all absent there.
+
+It was inspired by the patch serie of "xl/libxl-based shared memory", see
+[1] for more details.
+
+# Static Shared Memory Device Tree Configuration
+
+The static shared memory device tree nodes allow users to statically set up
+shared memory among a group of dom0less DomUs and Dom0, enabling domains
+to do shm-based communication.
+
+- compatible
+
+    "xen,domain-shared-memory-v1"
+
+- xen,shm-id
+
+    An u32 value represents the unique identifier of the shared memory region.
+    User valuing per shared memory region shall follow the ascending order,
+    starting from xen,shm-id = <0x0>, to the maximum identifier
+    xen,shm-id = <0x126>. The special xen,shm-id = <0x127> is reserved for
+    INVALID_SHMID.
+
+- xen,shared-mem
+
+    An array takes a physical address, which is the base address of the
+    shared memory region in host physical address space, a size, and a guest
+    physical address, as the target address of the mapping.
+
+- role(Optional)
+
+    A string property specifying the ownership of a shared memory region,
+    the value must be one of the following: "owner", or "borrower"
+    A shared memory region could be explicitly backed by one domain, which is
+    called "owner domain", and all the other domains who are also sharing
+    this region are called "borrower domain".
+    If not specified, the default value is "borrower" and owner is
+    "dom_shared", a system domain.
+
+## Example
+
+chosen {
+    #address-cells = <0x1>;
+    #size-cells = <0x1>;
+    xen,xen-bootargs = "console=dtuart dtuart=serial0 bootscrub=0";
+
+    ......
+
+    /* this is for Dom0 */
+    dom0-shared-mem@10000000 {
+        compatible = "xen,domain-shared-memory-v1";
+        xen,shm-id = <0x0>;
+        role = "owner";
+        xen,shared-mem = <0x10000000 0x10000000 0x10000000>;
+    }
+
+    domU1 {
+        compatible = "xen,domain";
+        #address-cells = <0x1>;
+        #size-cells = <0x1>;
+        memory = <0 131072>;
+        cpus = <2>;
+        vpl011;
+
+        /*
+         * shared memory region identified as 0x0(xen,shm-id = <0x0>)
+         * shared between dom0.
+         */
+        domU1-shared-mem@10000000 {
+            compatible = "xen,domain-shared-memory-v1";
+            xen,shm-id = <0x0>;
+            role = "borrower";
+            xen,shared-mem = <0x10000000 0x10000000 0x50000000>;
+        }
+
+        domU1-shared-mem@50000000 {
+            compatible = "xen,domain-shared-memory-v1";
+            xen,shm-id = <0x1>;
+            xen,shared-mem = <0x50000000 0x20000000 0x60000000>;
+        }
+
+        ......
+
+    };
+
+    domU2 {
+        compatible = "xen,domain";
+        #address-cells = <0x1>;
+        #size-cells = <0x1>;
+        memory = <0 65536>;
+        cpus = <1>;
+
+        /*
+         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
+         * shared between domU1.
+         */
+        domU2-shared-mem@50000000 {
+            compatible = "xen,domain-shared-memory-v1";
+            xen,shm-id = <0x1>;
+            xen,shared-mem = <0x50000000 0x20000000 0x70000000>;
+        }
+
+        ......
+    };
+};
+
+It is the example of two static shared memory regions.
+
+In terms of shared memory region identified as 0x0, host physical address
+starting at 0x10000000 of 256MB will be reserved to be shared between Dom0
+and DomU1. It will get mapped at 0x10000000 in Dom0 guest physical address
+space, and at 0x50000000 in DomU1 guest physical address space. Dom0 is the
+owner domain, and domU1 is the borrower domain.
+
+And in terms of shared memory region identified as 0x1, host physical address
+starting at 0x50000000 of 512MB will be reserved to be shared between DomU1
+and DomU2. It will get mapped at 0x60000000 in DomU1 guest physical address
+space, and at 0x70000000 in DomU2 guest physical address space. Since no owner
+domain is explicitly defined, the default "dom_shared" is the owner domain,
+and both domU1 and domU2 are the borrower domains.
+
+# Overview of Static Shared Memory Flow
+
+Static Shared Memory working flow could be classified into the following
+steps:
+ - Carve out a range of memory in host physical address space to be used
+for sharing. Define it in device tree configuration, then parse and reserve
+it to avoid other use.
+ - Create a special domain "dom_shared". It will be the owner domain which
+is owning the statically shared pages, if "role" property is not specified.
+ - Per shared memory region could be shared with multiple domains. For
+owner domain, it acquires statically shared pages and assign them to itself,
+in the same way with static memory. And other than owner domain, the others
+who are also sharing are called "borrower domain", for which foreign memory
+map of statically shared pages is required.
+ - Expose the shared memory to the domU using the "xen,shared-memory-v1"
+reserved-memory binding. See
+Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
+in Linux for the corresponding device tree binding.
+
+# Memory management of Shared Memory Region
+
+Each memory page needs to have an "owner" and it is likely that in many cases
+the user don't care who the owner is, so it makes sense that users don't
+need to specify the "role" in device tree if they don't want to, in which
+scenario, a default domain shall be the owner domain.
+
+We propose a new system domain "dom_shared" to be the default domain owning all
+statically unowned shared pages, assigning it dom_id 0x7FF5(DOMID_SHARED).
+
+"dom_shared" domain shall get constructed before domain construction and after
+"setup_virt_paging", during system boot-time, so it could successfully do
+p2m initialization.
+
+Owner domain acquires statically shared pages and assign them to itself,
+while borrower domains get and take reference of them, then do foreign memory
+map of these statically shared pages.
+
+When destroying or rebooting a domain, if it is a borrower domain, other than
+removing foreign memory map of statically shared pages in P2M table, we also
+need to drop according gained reference. And if it is an owner domain, since
+statically shared pages are allocated as guest normal ram, it is not needed to
+do extra removing.
+
+However if owner domain is not the default "dom_shared" domain, but specified
+explicitly in device tree, stopping itself will make shared memory region
+unaccessible to all borrower domains, so we need to remove foreign memory map
+for all borrower domains. Notice that all borrowers domains should be stopped
+before stopping the owner domain.
+
+"dom_shared" domain is destroyed when the whole system shuts down, so its
+owning statically shared pages are only freed at system shutdown.
+
+[1] https://marc.info/?l=xen-devel&m=154404821731186
-- 
2.25.1


