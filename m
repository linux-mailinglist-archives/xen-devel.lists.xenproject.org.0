Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A505452B07
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226080.390635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1L-0003jV-Pl; Tue, 16 Nov 2021 06:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226080.390635; Tue, 16 Nov 2021 06:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1L-0003fS-Jb; Tue, 16 Nov 2021 06:32:43 +0000
Received: by outflank-mailman (input) for mailman id 226080;
 Tue, 16 Nov 2021 06:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms1J-0001yg-IA
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:41 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe05::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff47ce7f-46a6-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 07:32:40 +0100 (CET)
Received: from AS9PR06CA0283.eurprd06.prod.outlook.com (2603:10a6:20b:45a::14)
 by AM0PR08MB5330.eurprd08.prod.outlook.com (2603:10a6:208:17f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 06:32:38 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::a2) by AS9PR06CA0283.outlook.office365.com
 (2603:10a6:20b:45a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:38 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Tue, 16 Nov 2021 06:32:38 +0000
Received: from cb1db89898a0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F601A534-0442-43B8-889E-73F095B253B4.1; 
 Tue, 16 Nov 2021 06:32:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb1db89898a0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:31 +0000
Received: from DB7PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:10:52::21)
 by DB9PR08MB6732.eurprd08.prod.outlook.com (2603:10a6:10:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 16 Nov
 2021 06:32:31 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::c3) by DB7PR02CA0008.outlook.office365.com
 (2603:10a6:10:52::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:31 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 06:32:30 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:30 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Tue, 16
 Nov 2021 06:32:29 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:28 +0000
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
X-Inumbo-ID: ff47ce7f-46a6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoG3f1Km9oFGa5vmtcmGleQgdrI0y3/dqorS3WOWRUE=;
 b=nHmpsXOe82se/svLvcoW0oA+D5zekw2tVGSL4IragPgTcjKH1wj0zvTFfzaRYxKQm1Kgd2jgeIt7nkJPunrjILfMJcJbLwxpb/bDANPARG4fiINIdhcXkBgUg486AKflLzLtEsEwmcMRJy3an9JdEyQfQlvpBjQ+F0sQIV4+ies=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ecf3ed14b9bbc7df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAiWWZ8Yu0IFvCK+A+ftXDeVP6WT6Dq0C9hLSjI/9oUnCVYhJ5PiJEFCNfsGSji9jBO9BlGcUO7gkZIKXxSVmbUjyKsvoH6PWz9tnb1jRgNyAq131YO3EzL6Dc4QM9NEESeWK9+J6QXUNlnkL4v+93vKSLcY5uEFi4drfTgxddT2pBk6XD+I6QHWTWLQnVi9OtYvKz4dcIIELLv4V5IyaUgoxyB43Y2NvzPihTTA08y5OfdIMKRnKWdSgO6XNuMET6ge7v3Mpp9B8nsrxngP0MUl+MgIrhKAdM0KXcO5jy40AalH2NNcJsTt2j+fXgT7edxqav0p3ERrtRWQGTeLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoG3f1Km9oFGa5vmtcmGleQgdrI0y3/dqorS3WOWRUE=;
 b=Rq7Vnq4Esc66okzlxiTZVVN9DakYL4MhhHlCmpc/zc+LlYXPGlEpf6IZXlTOeb1jKCXvZ6uCkMxvDTrczJQg0bUmuNYHIL0aaWV9l0dm1RPchstxUEqWK/sm4ncrwD7RT2p/X7anLAbOPQz21lRqgGHiYPE2LxOIf9Pxb7/Nl+bf4qaXhTzFJTaF0qFW/JPd4En3kOru7LShx3oQdCGYLBoXknvliDIYdSxgLM7kqxHa6XOua0CemIyM8Rg1y9fKcOh90mE/7KVr+sgWStBQcp2q7TCm628zRYuJdScP/hdZ3+vTfIl1ZhFkb8bHUuEN2upNH/kJUM55HZvrixrxHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoG3f1Km9oFGa5vmtcmGleQgdrI0y3/dqorS3WOWRUE=;
 b=nHmpsXOe82se/svLvcoW0oA+D5zekw2tVGSL4IragPgTcjKH1wj0zvTFfzaRYxKQm1Kgd2jgeIt7nkJPunrjILfMJcJbLwxpb/bDANPARG4fiINIdhcXkBgUg486AKflLzLtEsEwmcMRJy3an9JdEyQfQlvpBjQ+F0sQIV4+ies=
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
Subject: [PATCH v3 10/10] xen/docs: Document how to do passthrough without IOMMU
Date: Tue, 16 Nov 2021 06:31:55 +0000
Message-ID: <20211116063155.901183-11-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8df81466-ff40-4cf6-4e4a-08d9a8cae26e
X-MS-TrafficTypeDiagnostic: DB9PR08MB6732:|AM0PR08MB5330:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB533075308FA688F426FBC15EF7999@AM0PR08MB5330.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yecjwNlIpkY3sdVcTuWyhXs8WMbaDigmBDCSco+gqDcd0RZEXb00xbACgVdsWkT1sT+EaUd9dD9odeJmF2wdAS7ogos2XJvkKiwlM3HGD21Thd9IAfVXiFK9tLLWi5hJTCOErXCcptmdfJ62KWyf34TEYiNYhKLfGFZsbQtcirZ22sSID2BsIwTRMGnybFPYEodfMBdWqckcalYk6w7jvUbe9sZ+GfTitqHUD3a1N+NGmPF7qMwZur9s4q4mesjqfbUKDyca+xCelyx/720mdajoy6l3nDeF6JnIxSbJSo6H0xqX6s3CllwbQDI74SkFTyV0slCHX8mYhZXYL5YpPOmT7kEJ/Fh889ZzmEHk6NfHLdB0TkzC/xWDcZnEoY4HlCv+LxEojbEZ1Ipkk07OzafS9ykkMuvtl1QmjIuiKzEYNkmhzXNMjQvGDNTLTQRxOnOQWo6tURRaGUz/LsWL4yOPSQNm13ifZag5+2d86BT/ZjDNvk3pIu/uKPdLZ8oQjIqvln1vRPuOOazejnqECBSUlQkbMG9xj9SuKstg5sgTgt2rB/gLP9qOYUfB2cRJIa4VRTAkDUO3fYNTTjcg7DnZ2TSdeOEpyggxYxNWA1IFg1xvZXN0+nI4f8unHpvYff4FptL7uCz6JwJC7jZzNBW9JQQjINy4SRnQbeJQ9L7Yl34oxq5KisdkJaQGY3iF3kPb+TiLT+VeizqK/bZ5MGW7Z9y/gZS0Rv7J+M9cz6E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(70586007)(70206006)(186003)(81166007)(36756003)(336012)(36860700001)(356005)(2906002)(47076005)(26005)(8676002)(83380400001)(426003)(4326008)(6666004)(54906003)(316002)(110136005)(7696005)(1076003)(2616005)(82310400003)(86362001)(44832011)(508600001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6732
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd342311-6a3b-4489-2635-08d9a8caddde
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KbamTBjPkBbyVcusCDct1SNh3X8oHpDCB38+psbg92PKwOYkTn+15RTSoo2xMpHapP4WWJdWUQG1zWZDQMT8gAVItdmi+CRAZHi/AINABx09Qm9fTDLCm5y9BGBU9aHTVeZ40q/VIfjQ80r9ykDOYHoRmJJOY41fsvL8Ks4lHCEsELGel17EXFUT/YMg4ifX/A1pp1ARyx8lzbjozH/vbMUekr/asOQiXsXajM4Ddr1CnFJM48MCyhxctcsft/TXmPUYYpaGnK8byCGHw4E5aspzwsMxWpjY7aJQ9rvk481JZVwetgRzSB+BW0GEk350S8MSFWo4vCgfOl+FFygI09i95DdvKaLWKO53xDar8ZPqiEn4RdV/S0ZY6sG/ssKH5DEVOECqCIl2+I558olHK0Locb207hSs5hJl1TdTsC/Ba+clRQ1nPFs0motKM4YqeAZ1GPY9v5gQjUh5Rvt3vnG5wLc3luLVIDNZPhlGwsuPa6QvBiS2bxnZzTSDcIZF3yk6jAsSdOxhaBFCwRpuaLlPbNDiDBF/KTlHANykc50HJLWuFVd5mM+xi8x3hykCOnxwf1xq//kIIoCKsJ/GohRRwPfkA46SNr4IjiKGmaymOPQsptPJDB2gIW/8ITEIkbSrNY6JlMksWGUIWkChJYrxCRkKV5V2RKOXtt0MhZQNY96CiIedzjSPvIAnK6/vW5xS8bYdlpZiL8A2tKYTMQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(86362001)(83380400001)(110136005)(186003)(336012)(316002)(426003)(36860700001)(8936002)(6666004)(2616005)(26005)(70206006)(7696005)(1076003)(36756003)(5660300002)(82310400003)(4326008)(508600001)(8676002)(54906003)(47076005)(2906002)(70586007)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:38.4266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df81466-ff40-4cf6-4e4a-08d9a8cae26e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5330

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


