Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA5547A48F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249455.429924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzBES-00067q-Mp; Mon, 20 Dec 2021 05:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249455.429924; Mon, 20 Dec 2021 05:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzBES-000662-JC; Mon, 20 Dec 2021 05:29:08 +0000
Received: by outflank-mailman (input) for mailman id 249455;
 Mon, 20 Dec 2021 05:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7x-0007eG-0b
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:22:25 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe07::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfca89a9-6154-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 06:22:23 +0100 (CET)
Received: from AM6P194CA0023.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::36)
 by PA4PR08MB7386.eurprd08.prod.outlook.com (2603:10a6:102:2a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 05:22:21 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::46) by AM6P194CA0023.outlook.office365.com
 (2603:10a6:209:90::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:22:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:22:20 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Mon, 20 Dec 2021 05:22:20 +0000
Received: from aed54ac085ac.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55BB4AAD-2D96-4A28-8183-1BA4183CD9EE.1; 
 Mon, 20 Dec 2021 05:22:14 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aed54ac085ac.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:22:14 +0000
Received: from DB8PR09CA0029.eurprd09.prod.outlook.com (2603:10a6:10:a0::42)
 by AM9PR08MB5892.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 05:22:04 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::f5) by DB8PR09CA0029.outlook.office365.com
 (2603:10a6:10:a0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:22:04 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:22:04 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:22:02 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:22:01 +0000
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
X-Inumbo-ID: cfca89a9-6154-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoG3f1Km9oFGa5vmtcmGleQgdrI0y3/dqorS3WOWRUE=;
 b=spxvrevom+33Si6xWHULujnKJTY7jo/M5yL5FjpBc1Rd8mt/TXCg4qbBL/C3zLBLUxZF/pFL8hp2ZDIdcU4QY5AgzkCsALqizHkjRrfKo+KGbXT4w7L3b9XQRG3vbFWtzlV5InGHfgGVeac4xxayvfgplaXAlcGDpO0FS8AtaeI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6cc640bca0a1ec7a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBpaNefUIsRsvFmgA1NnvTbPQd4PT5X6Se46rvMHoQcM/OLzvr67F/SFSb0WqiLcWSMVI+8/i4xDfaQCyl9KniSr0Wf2pW/fNRpMtypN1lWXnlN6LCcJcO00pSZMHZMMKewYsILUFXsEYy5gmcbafm8kP4+rAMt59kWvLBJUV8ILmPhcegNCaUke4JqAgaZZth/yBIkFo6W/p7tf2ai2WGn8aTZIGbSrRU5U0OztpkRqJsY6WaVoQ4OiAQnSjepX2P4G7kMEiHrQ/zYnxrAGX2QvtCPpBINfk7SIsWfoy6QPbF/35UDhIGZ2TSWx/VVz+vMcoZnEFEAGLiGsISMmgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoG3f1Km9oFGa5vmtcmGleQgdrI0y3/dqorS3WOWRUE=;
 b=M/05YB5nBkas9llZQWocVRfgphJp14Nl8kEiYEq7V2D7n+lDy7rA66scATB3IZOrZXzlOHHESFjdtgF0Ve01MkknfsQhf0j0d3qLr2qOpfKS9RD2f+B9LTU8AVAorVFpLwRZlwhGetbMhi26B9hQgXlqs/7QBQIvacti9tqKwBsyLfHtJAHEFVpTLo7TYLT6cXFI1odxjY45AmuTaVrDK84S3hB3J/Ajv6Xom/I+cK3Tm6DrA4HCdRgUNPXUmLSJ9PdtNkY2RA++gwdM93wS+eKI0ofZ3tPyqYrxXsMETjegjBTmDUfzo4o+uAc1W+/xVbPG2XoBAysaCj4AVrqhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoG3f1Km9oFGa5vmtcmGleQgdrI0y3/dqorS3WOWRUE=;
 b=spxvrevom+33Si6xWHULujnKJTY7jo/M5yL5FjpBc1Rd8mt/TXCg4qbBL/C3zLBLUxZF/pFL8hp2ZDIdcU4QY5AgzkCsALqizHkjRrfKo+KGbXT4w7L3b9XQRG3vbFWtzlV5InGHfgGVeac4xxayvfgplaXAlcGDpO0FS8AtaeI=
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
Subject: [PATCH v4 11/11] xen/docs: Document how to do passthrough without IOMMU
Date: Mon, 20 Dec 2021 05:21:23 +0000
Message-ID: <20211220052123.969876-12-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 3538d98f-5961-45e6-02d8-08d9c378b2a9
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB5892:EE_|AM5EUR03FT004:EE_|PA4PR08MB7386:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB7386752082F26FD605D93FB3F77B9@PA4PR08MB7386.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Xh8+scXtx6hjAb9d3K95WinV5/qfWhUWBtb7FK8U5NR8FV/8WEesRWcbCwUDw50wOIdi6PA+0t1vjux/ty2sS2TGPAtaI7W7qqlLk3/ZZ4NS21hq6tAturoXY4YfaG3fGj7OO4XgUcBKl2BvMViY18nw+nhKE5p+vvaRO5bheGOtZuU8J9udRSGaBOrchU1UThngfxve4JPDYAqC43in/g9KuU796PW7v5kVdMXKQlEdhlWcZPUrzT8qcKjJdMQIDDbdZTk4vKsg5zMc7zB4fGY/mub3I646swz5YxJAabn+Uz1Ajq7VuwYkpKimmK4LHxMxQSCVIhOHg431optACxeKDi/lvfwt+jrFeiTASg3yZjSlfm6uARuvMGEjcNKT0K9TL94fx0YFhLoqPRyXavZWsG8ElukluDE7f5BJ0mdi6eDaLkyoyuHAT86qbcfSyvQEbi4si3kCinLk4UN4Ks90xgVwk40dIMQ4z2KgbJl9tuDYzDD8ymYG+oh3iMoua4TvYOFKbZlYh4tiztrKbQH+TBNSFoDEXnjwPeSSu8QRAnKCtT7KrD9Pv3AAPlKyObkVm7SfLY2HLmjw+jmVbLbAtQmydHDjYLxvp0zHJf1YVzErjsa6gdTWXAU1DttezUvleEeXhPt3TeLEmfEdDhNJgfsbOXqhMUx+p3a+zo29Q5w78xNaOdo85HMQxSJC/Y3Jl9sM/pYEERS6IStEzZ4IfsmSjwjlLFPjMFp/LfqiuitGTfYHi+o0OwN+kj/ySPy0ZRH+F2IlbSita4FvvyC6I5oiQlaWE1PS6/6msUI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(356005)(54906003)(81166007)(110136005)(70206006)(70586007)(36756003)(26005)(7696005)(316002)(2906002)(86362001)(1076003)(426003)(336012)(2616005)(4326008)(83380400001)(44832011)(186003)(36860700001)(508600001)(82310400004)(5660300002)(6666004)(47076005)(8936002)(8676002)(40460700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5892
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	005b0956-b353-430d-b627-08d9c378a8bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yTd5q/rpzXZNQFov5rUPKaT9VR3OW54+y3IRMtbm6m1LlRgX2r9w1MgIUQNLUBcs/VGnCp6fwA/tn+EgjhSDYPsGMXk7/bXQkIXnApEJc/8uy5iQQYobWgqkKfL5fMHZNla5oyKUArkR3qPeNN3i2vQ2KGDyHOKoPZLMjmVYtwmPdiLKPqe0Sgf3Y7/94PHTfEb828oZrkJHTpcxEAj7lmGyFgH8MGlm08QvmCP++muONf7m68H1V0MfJdqslhFCPmcDeOclA8nJBZ4PjarhD2D+HSY17ifDm+QVvtfTkv0BS1t0bTTI6W219mJva9c2HhPXVr9kjJjPB7jTPsXZhaSOkqy6xYKxql5qp0eKQ1pyy2TZ958VdUrS+rnLm7Rjj4ml/qRv1Frs7fePXGWF1J615Ur732HkbFzP8SWGfgrXi/WKL7qgQyfUa6B2R+42zktovJcdvu0wxQrBS5Wbz4I0r+WXuDh2L3KPwjw8OWhbpyDTSIaXOlDSW3EZzWXQVJzjNMceeZ2lV88bWFCiMMM8ymu51iCyzfm2xLhfMpbLrO69rVL0Rk9u6sJDPJ1kV3LeKyx48q1YgXh8W8Ttn3eQzgJsE3QVLixA2+KZOzePEvtpoR+Yb7s9ujGIgM4rUZbPpm1bGV1O+Fa60STm8VEduE4k2iD5VEfDI/zGCHOtRL+++Xa8B9wj5Ys+w5BJPKMiHfeau9yjNvyquTVjxg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(110136005)(316002)(54906003)(8936002)(26005)(83380400001)(36860700001)(7696005)(186003)(8676002)(36756003)(70206006)(70586007)(44832011)(426003)(1076003)(2616005)(86362001)(82310400004)(508600001)(81166007)(4326008)(47076005)(6666004)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:22:20.9923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3538d98f-5961-45e6-02d8-08d9c378b2a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7386

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

This commit creates a new doc to document how to do passthrough without IOMMU.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
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


