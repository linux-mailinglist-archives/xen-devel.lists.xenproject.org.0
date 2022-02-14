Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69F4B403F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271078.465501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvi-0002AV-Tb; Mon, 14 Feb 2022 03:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271078.465501; Mon, 14 Feb 2022 03:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvi-0001vp-HQ; Mon, 14 Feb 2022 03:21:34 +0000
Received: by outflank-mailman (input) for mailman id 271078;
 Mon, 14 Feb 2022 03:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRvf-0007B4-6i
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3366048f-8d45-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 04:21:30 +0100 (CET)
Received: from AS8PR04CA0182.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::7)
 by DU2PR08MB7311.eurprd08.prod.outlook.com (2603:10a6:10:2e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Mon, 14 Feb
 2022 03:21:28 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::a) by AS8PR04CA0182.outlook.office365.com
 (2603:10a6:20b:2f3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.17 via Frontend Transport; Mon, 14 Feb 2022 03:21:27 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Mon, 14 Feb 2022 03:21:27 +0000
Received: from c188c6299f47.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6604294-B868-450D-BE46-4DF1C63FEED2.1; 
 Mon, 14 Feb 2022 03:21:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c188c6299f47.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:21 +0000
Received: from AS9PR06CA0332.eurprd06.prod.outlook.com (2603:10a6:20b:466::11)
 by VE1PR08MB5743.eurprd08.prod.outlook.com (2603:10a6:800:1b2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 03:21:18 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::a1) by AS9PR06CA0332.outlook.office365.com
 (2603:10a6:20b:466::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:17 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:21 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:20 +0000
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
X-Inumbo-ID: 3366048f-8d45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d4IKv3T5/Hx+dqQ3Y2Ud1C+n1KbiL2IC5h2n3T2Clw=;
 b=8QGPLPeWSQYc+vJdmdH/ZbZiK+Y48Dq3ktEpUJqc+/JAVbibI6qsAjrCa/RU97Bzy6DX/ZbxfsIrdobbmZrPFh0V5BuRvGLUX3Y8y2Oo76R253udOyutw5ajyIHQUIDQQDwY3QPr2yEGiVaOverr/TVoKXNfYNeeaXSTPdIeZhQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4c5b5180ddb3c01
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/6Hi8rKArxLn20nBH1w4wA/pmdRyOCbk4QbSuEmQR4NKTqiedXz2Lf3QDxDz3PJQft7bdf5BW10bSu5jswvqqZQOte//bggJUbRoxbiLJpEACoe95uXK6Hao8qZzvjAyykJ+qQENGWeDvyGnQieockVzA3QbRUNnYK/h81ENXvFIS4U+uZtXzDFhW4DGexSTm+sfetpH780spKdWTtRf2a1iaCnDO0ZynNOHV2Zw2sg3nCHLXH9B0hwa87ZvgM7OrfjhTYfnHUqRqt/9uDL3itqQLVubnL19d37k1G3Fhz7AO5ycv26Ip6tmhbj5TJKEYLIWDEqzN88uYBnGOmRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d4IKv3T5/Hx+dqQ3Y2Ud1C+n1KbiL2IC5h2n3T2Clw=;
 b=hGxWDzkQHr6e3/xqOQKa97PhE1jnejsPhubxmRXryL4FUlOTfehpT93jRJl+wpjKip73JenCfdHAAynPMzlBe1UdxaL1mmOkjsoLgyDDW1D1vzdkxN9C9UHCGwKY0axieYh3wrGmhk6QxQI8cNWltbnOROJdHXgi+4eBgXCFcvoZwfV2XF6izg0rbaHgqqrws5liWTOPO3WfZAVG4VeYK/ue29/Sy4ReE2GV9hp6I0CsyBDsC1Kb50NlxtOFumNlMQgBzo1CNBZvx8boSTlxakkqWKLLbAyFYjzJxb4ZGAiBIPS+DQYt/v4NNnGT/K7VCbY9gwQZSn5quqkuuMxumQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d4IKv3T5/Hx+dqQ3Y2Ud1C+n1KbiL2IC5h2n3T2Clw=;
 b=8QGPLPeWSQYc+vJdmdH/ZbZiK+Y48Dq3ktEpUJqc+/JAVbibI6qsAjrCa/RU97Bzy6DX/ZbxfsIrdobbmZrPFh0V5BuRvGLUX3Y8y2Oo76R253udOyutw5ajyIHQUIDQQDwY3QPr2yEGiVaOverr/TVoKXNfYNeeaXSTPdIeZhQ=
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
Subject: [PATCH v6 11/11] xen/docs: Document how to do passthrough without IOMMU
Date: Mon, 14 Feb 2022 03:19:56 +0000
Message-ID: <20220214031956.3726764-12-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: fc1a79dc-e9a2-431b-efa0-08d9ef691684
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB5743:EE_|AM5EUR03FT059:EE_|DU2PR08MB7311:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR08MB7311E73A13C3B0FAB2EC8E41F7339@DU2PR08MB7311.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WombyMC2bDJlw1FT3vngoMtKKHro+kaCE4NpYGnxtI3SiHgaqUkraK4E3/85N+tMS0oDfzIrmgS4eaZDtovISQ6ihAKT2FRo5OQwH4OFc6HLjTuADAVV1MAHRPzLjZtqFVLd5vxjkMgruYTJlghAt0cUP1fxHgsairttfUvW6hzjE3mo3jcV8oIIrssVUMtqZhjJEO1xL/eHGTyjaTQlC3n54/eyJOof8qn5AT22eowiJb6rvY0GNK1T6g7OXY/FV+xlQGYfiFPtis/C+4joNjlHp8HUBLmnDL2Otc33EheajX11jma7Rpe2H7SW4gZyrA/zH7E96lL7kQTCjwX0GFQS9/t7ZJso1/lhl67+O3ueI9lVz6NQjqHVV/WUXVDlm+wDPrwdZF6fjYivcVjLrPaw6Fd7Fv+sfHazo4rJBrrAmRmNx92tPQnIJjV3TNnALyKyix2c/xAdog9pEpjpafAFUD3sogNTLfDNq7+1wmcVoGYmGWtP5pk989At+STW7wz9BcTbZccVzZjLHiZB47u4Cp18i4X9irvkQYTt9egq6QXL/wHTBD98cZBTZJk83C/VIgcPdFDfSLDu2++co3AikdFtYuWBsw0EmODldMa1rCZh3KBqXHcbKO5/7hsTd36O6U59TN1MAqgfXF3v25AqPzw4jtJuchFZDW8BdGMH0zHj6BWJWTxUi0CRzZ8N
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(6666004)(2906002)(86362001)(83380400001)(82310400004)(5660300002)(8936002)(44832011)(7696005)(8676002)(47076005)(110136005)(54906003)(508600001)(36860700001)(81166007)(356005)(4326008)(316002)(70586007)(70206006)(186003)(1076003)(26005)(426003)(336012)(36756003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5743
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	397e7931-24d2-4804-7357-08d9ef691092
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DZU9tpJg6ddacCdSAtrFFAh1X3HwtCMOjhELwiqms7IWWdgEAECNZUGFsqMPFyl382WZsgBOoJa6Z5tI61JMFf6FvyhOZDmjfSZL+VpcyVYncdhkneo/QI9AKkrv95w5NgCUQujyDfOVSj5dmgTqWjQMVy2O0EyAkI5z7OV8oaLRrUm/Os8lVd0HFPAFC8CHDf6FQ/EluUUGxMUqjnFEuxhOpWIyMCNDSJ3FtJKglDRMbP7xH14pFv58ttfw9GUHJMG06wOIjvVmpPNBHvFYnem4N58RhRwheVqaDdrCWv9KSKywqNZN1RiFQw+yQKGO/uOX56s1OAgl2aWWEdCTankSJCalwQYWcyUAtcIEqq/6sClyMyosHKO03+wpApF7IS4kmlUnVw0IJmYVGXdQGitBVQJzRpez9QHe1l1k+hjXcSwMuMc1hU72oEbRx5HHHVulEhyQHxltLK3LXuj4uQQ06oeUfH+ppOvG+hQJ15nlydRbrfQbq9i1W964HctU8RIHljMZ5cTc1gezj+glPoctSFAgMSNC/FUhNeYvwYTV0wWW/LHpvkN9LChYmvLGdgcM/9LRp1Ha4qmqd6EHLiUrhMJBJbMWvs5OPoRO2v+CnEoR5gFFuNVWPCQhs5J+Cwf9/Dg32h8dKO6faOFtog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(2616005)(508600001)(426003)(26005)(316002)(336012)(6666004)(7696005)(44832011)(36860700001)(2906002)(1076003)(186003)(36756003)(8676002)(5660300002)(70206006)(47076005)(82310400004)(8936002)(110136005)(54906003)(86362001)(4326008)(83380400001)(81166007)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:27.7582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1a79dc-e9a2-431b-efa0-08d9ef691684
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7311

From: Stefano Stabellini <sstabellini@kernel.org>

This commit creates a new doc to document how to do passthrough without IOMMU.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
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
v6 changes:
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


