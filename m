Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2837E42E715
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 05:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209671.366250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDcF-0004gl-4Z; Fri, 15 Oct 2021 03:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209671.366250; Fri, 15 Oct 2021 03:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDcF-0004cP-06; Fri, 15 Oct 2021 03:10:39 +0000
Received: by outflank-mailman (input) for mailman id 209671;
 Fri, 15 Oct 2021 03:10:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHOs=PD=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mbDcD-00031m-Hp
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 03:10:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b76fa7e3-50da-4fd5-8d0a-a9be13ad0605;
 Fri, 15 Oct 2021 03:10:34 +0000 (UTC)
Received: from AS9PR06CA0008.eurprd06.prod.outlook.com (2603:10a6:20b:462::22)
 by VI1PR08MB4046.eurprd08.prod.outlook.com (2603:10a6:803:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 03:10:32 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::be) by AS9PR06CA0008.outlook.office365.com
 (2603:10a6:20b:462::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:31 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Fri, 15 Oct 2021 03:10:31 +0000
Received: from efea9ca5927b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC475658-FDCE-4757-B107-C3B05D98B7EF.1; 
 Fri, 15 Oct 2021 03:10:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id efea9ca5927b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 03:10:25 +0000
Received: from AS9PR06CA0398.eurprd06.prod.outlook.com (2603:10a6:20b:461::17)
 by DBAPR08MB5639.eurprd08.prod.outlook.com (2603:10a6:10:1a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 03:10:24 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::89) by AS9PR06CA0398.outlook.office365.com
 (2603:10a6:20b:461::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:23 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:23 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 15 Oct
 2021 03:10:23 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:21 +0000
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
X-Inumbo-ID: b76fa7e3-50da-4fd5-8d0a-a9be13ad0605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUJuKpAtpsPU2vd6yUZACXFm8wINo0vkIbxoIx5eFVM=;
 b=KEVRmGYC0T2TTQplNAlzGBfiygHJmkOyRIev7IzJNNbEhh+ipIWpDbQ2R0D3znn87aMIvbIL/IP6/rZsy3qCUjwXOBgTaqWj68yo9r4RVTXCsIgy5yK/0T09k/2/1xWyUBs7WDXscI7TkEpOXe6gI+iEtHdpAyJvb9uS2qdDOoc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6692223e128db74c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTil/ROeOmMLOH5a1lRAnlSp5rPpVYsB31Y0sGMCldDxYNHOhVDXwvlhhMFbsXoQYrliXpE8YkS6XC9fLCdxIYnfW8answvxRG4/99IkufxK+wd3y+vdMGXPuEeB54p+/UufGVpJ+ILlzq3q/ZcZNCh7bTM2/4MFeUmjSHtFrfYQ+8srQOt7xxCAkVh5a29Q6gqNEv3zmCkA7XoftsxLdsnf2ePBQ6vIF+XOc59zPKzH7NVyywQnOi/ayXPOP7zA/0XnOChV3FO/41ZThw5k1VQ8IL/PIJ9TgfjktdeNK5gHgGRHgS65SXgtHd7vyTKMe7mfrXqJ2KXnDJa1fXoS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUJuKpAtpsPU2vd6yUZACXFm8wINo0vkIbxoIx5eFVM=;
 b=Rjy6QoCV3pDCu5gpmG9yF+GWjaKwaStinPyOgojDWpLE1Y+nhnounzUsUTJJ4DFljhR6MzZG5p+fJ633yIlBrEClucHfh4V15Q/5qJ8ba8UiETjih8QJ/Fq5JGhNxxnfskdsaNqLtdEezERfxdavQjEIr9CZcDdcsYekpwVfBn6fsn7BG86Xr5hpSVo1CeTja08h1jt+N/fjw+dVdkVq6rvzhmm2WFvodCh5ryV8pue0bBLx3lWHEJHM0NkF1dPkLal8V4UH+wG8fodEBc3T4/jmm/Ht4xG+UZZJzCj2cr42H2zGu7dCFfDNpK3ezb8yy6glIwRkVQkS/yeokJQdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUJuKpAtpsPU2vd6yUZACXFm8wINo0vkIbxoIx5eFVM=;
 b=KEVRmGYC0T2TTQplNAlzGBfiygHJmkOyRIev7IzJNNbEhh+ipIWpDbQ2R0D3znn87aMIvbIL/IP6/rZsy3qCUjwXOBgTaqWj68yo9r4RVTXCsIgy5yK/0T09k/2/1xWyUBs7WDXscI7TkEpOXe6gI+iEtHdpAyJvb9uS2qdDOoc=
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
CC: <Wei.Chen@arm.com>, <Bertrand.Marquis@arm.com>
Subject: [PATCH v2 6/6] xen/docs: add a document to explain how to do passthrough without IOMMU
Date: Fri, 15 Oct 2021 03:09:45 +0000
Message-ID: <20211015030945.2082898-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015030945.2082898-1-penny.zheng@arm.com>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c4ff210-081e-4742-c1b2-08d98f895936
X-MS-TrafficTypeDiagnostic: DBAPR08MB5639:|VI1PR08MB4046:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB40462940A03EF099B0E386ECF7B99@VI1PR08MB4046.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xGxNC2DHMncS/Qs/Df9vCMt3AyEJKiPpGWu9lW8mAYrWPr9WvAsOFFh0yty+J6KRA7NRSssXQQPDRgv6hzA03t82+34eR/uBy+dEVv8K2tTsi6Tpnq+MgjoB6FJ4lqjv/whuJbEDLW2RGDi2BpRlt1wOLUCNHxiA9X9rMPdGwbulyaI4Dfu3wFsPfq8RIwW//ODO+LYL/9X/AZ4z9XriiOh/lY6FoPOI+r2WQTs/wfUp69khLRt/TJDDNlnYIdypPqLs4N0WxgJF+aD7cgTyUZ1IrxUuoEeCt3MLtz9u9PmcvLRjQT2GO88TfVQgeVbDBofB00jhHdxpEAs8WNM3cpef+xAz+xKxC2HG4Jsy2TAYX1z8LJWegmjfKkulbVP3HKW1jpxl3giJ2USE1j1aHSN7sdFdKJuk8mLScbhaJI5wSbQrwz9WqoBx9aZgw41eqx9q+GdtlS7zUYr9OndWMK6d4XmYqs+cPL2nGoYr+7kleuolN9PoFg2B7b9dVZUCxuRFZMc1OEoaEZhM5PJ81HhoTlNiD5ADj6y6AGx2S6CX1Z6K3QU1pEsBKRp6fOrlwnHOFxkfYDuOXaoNlV3tCwf9aQ190T11AqDYfPLvUb8cHE0k7f28ziC33wp3KD3ggyOEAyfKeH7fiHcjU5Vbq5ROEQ9/0c1Zo3+WW0GmJsXA7LvxlsjKbOd00dUa4JAgfVGczDFtvJIp2tBbCTyf0hj97TaAahlO0xOo64KhdwE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(70586007)(2616005)(44832011)(8676002)(7696005)(508600001)(426003)(356005)(8936002)(70206006)(86362001)(110136005)(54906003)(81166007)(4326008)(47076005)(26005)(186003)(83380400001)(5660300002)(336012)(6666004)(36860700001)(1076003)(36756003)(316002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5639
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6655f12-dc00-441c-39e5-08d98f895452
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4tbHAxVfjTbBSah5PNe2tzrMUHCo5+sp+q/7wIZw9IVgDCqbWkowcQzCx4xRZqbjrPdiHM8uezETB7+5qgb6xP3AW2UH7ulRJtAfNiaVoKVDTsh6FR9sHLn3gfIaSo5Y2cy5Znbxbw6/1HdHsXQ3CITV8wWySPCXsXGGMWah6S7qSCoCZIe1QrgfJfFW/y6DLCUOSaL+I5JYQq6GchszE2ZXChkhqISCc9R7SN9vy08m514UjSGYm+0WMoIPnhaUPZb4RxhRXmtkdyDY7qIkzWtL0ka/s7DRfyEAzqB/lwL1syN3fQIBrKB0moGF/vn9BhiX2D+cq+VXko4pIwJJVtdcxz7YyMnISkOvo2ekc5SWeV2M+XOJojn5iNEiYYvwW8O0xpNrinegycoKhbOtSqhkPqCVkKE/Y2VqAp1VojKLjud1vMxaWE7VfVsKBMnHMYNm3Hzz1SkUuOs+CEsGkbl2m+WTNe6neYOR23H4Nh7t33VbXYGu3QFMKCg0ONKopCfxcWPGLLSp+nX8XpsDhCGGdnihZIZ6A6GqQRedwXV8dk5e9p5ullgPMO2J4n/AiR9KUaZSTACc2jXnz6OulHWNPhD7r2J49ptkrG11b2+j9waKD7RwVjnDbZPEz6uH9ScBPnlavG/eUnL+gZw0aBw8EnIrFVl18e3rSUbKHbnfI75TI8fuquGG1Dx631sIsIhhOaaVbArU2jIBujWV5g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(47076005)(82310400003)(8936002)(6666004)(1076003)(508600001)(70206006)(4326008)(2906002)(7696005)(36756003)(70586007)(2616005)(186003)(83380400001)(5660300002)(316002)(54906003)(44832011)(110136005)(8676002)(26005)(86362001)(336012)(81166007)(426003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:10:31.8638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4ff210-081e-4742-c1b2-08d98f895936
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4046

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Make sure to start with a WARNING about security.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/misc/arm/passthrough-noiommu.txt | 54 +++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 docs/misc/arm/passthrough-noiommu.txt

diff --git a/docs/misc/arm/passthrough-noiommu.txt b/docs/misc/arm/passthrough-noiommu.txt
new file mode 100644
index 0000000000..61aeb8a5cd
--- /dev/null
+++ b/docs/misc/arm/passthrough-noiommu.txt
@@ -0,0 +1,54 @@
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
+
+This document assumes that the IOMMU is absent from the system or it is
+disabled (status = "disabled" in device tree).
+
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


