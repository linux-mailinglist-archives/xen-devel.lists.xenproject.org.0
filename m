Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E04155DF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193365.344440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTFEV-0002Zq-FY; Thu, 23 Sep 2021 03:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193365.344440; Thu, 23 Sep 2021 03:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTFEV-0002Xh-AT; Thu, 23 Sep 2021 03:17:11 +0000
Received: by outflank-mailman (input) for mailman id 193365;
 Thu, 23 Sep 2021 03:17:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTFAI-0004kC-DH
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:12:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1440ab9d-f2de-4053-afbd-a762e60e0d86;
 Thu, 23 Sep 2021 03:12:08 +0000 (UTC)
Received: from PR2P264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::23) by
 VE1PR08MB4927.eurprd08.prod.outlook.com (2603:10a6:802:b1::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Thu, 23 Sep 2021 03:12:05 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:101:1:cafe::f0) by PR2P264CA0035.outlook.office365.com
 (2603:10a6:101:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:12:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:12:04 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Thu, 23 Sep 2021 03:12:03 +0000
Received: from 7325449563a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3642A666-F715-4B71-9D5D-AA48DAE3704D.1; 
 Thu, 23 Sep 2021 03:11:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7325449563a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:52 +0000
Received: from AM5PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:206:1::18)
 by AM9PR08MB6644.eurprd08.prod.outlook.com (2603:10a6:20b:30e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:50 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::35) by AM5PR04CA0005.outlook.office365.com
 (2603:10a6:206:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:50 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:50 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:49 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 03:11:47 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:46 +0000
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
X-Inumbo-ID: 1440ab9d-f2de-4053-afbd-a762e60e0d86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUJuKpAtpsPU2vd6yUZACXFm8wINo0vkIbxoIx5eFVM=;
 b=ypSDbTU8t9Xwb5caDPUzAwZ6mMmObt51t5Wce17gQJ36XEHQoO4UF1jS24nL43tqIISmAurDVGgT6RXUZQ4s+o8EUoQWElq814kCrgnrOJ98g/VYlgE3ddXvF5i7VkBTPSecieN7ELAXfM53SDWgzLSwQp5P0WNlobjqvw8pAJM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 487e76dfad220cde
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bq2Zpaw/e9e1p1xcN78eXrjRSnjtprwT6B7MaIiPQ38naQONa81rVczoNTbhMzi1n/iwKWKjrXnJrDp+y4XqayaS3yDY37EHAWMDdfXi3oDP70vYT7md+7QiHzu3O/Ojm/zIQJcd6+xmwByXLt4xLVVEyRM1vlgNrDYcMXcTbbhj8oaoQTM/QNh+q/JN5NA6j1ovikwgvuSCCsmNrDwBcx5m+bOollfoqNTWeeh4fx9vs7QrHy+NPbi2U7jcs1Zftc9b9MXgQEqWY/8kMZpiAWzeQaYCquaCB4PicelM+wSpY884BP6JwJVSISmDpAleL5V97imKWQfRWC7Cv1/gmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RUJuKpAtpsPU2vd6yUZACXFm8wINo0vkIbxoIx5eFVM=;
 b=h9rJhd93Bpcl7698BBThJLkAX3cxhPcMzqD8I8smmAqbx9JM8Rh6tUMjmQP+pors0wzNC9zOO6vCMhj77ns15Fj58tUt3wDsd25VgNMYtFsTeiJQ5RpxKIAFWK2V7M7FuMwMa0tSejXe+cKVCMR44NkbuB+4flC0Q3Wg7amew8FwTEJJ75VrAyYJQbTCqNJCv13WyISAX2v84YCRp/sHEa2UWak7TfJmPnCRxEnFmsvQxUSfGQGlkDr+l5HoCgiCWRwZKioCXMBxgZmiW1N70GYHs4piSH6+ll0wctMc+IBgtl1f+9l/CI6s7DAnq6Z/mwoVjL00Uh+g91PDcQeX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUJuKpAtpsPU2vd6yUZACXFm8wINo0vkIbxoIx5eFVM=;
 b=ypSDbTU8t9Xwb5caDPUzAwZ6mMmObt51t5Wce17gQJ36XEHQoO4UF1jS24nL43tqIISmAurDVGgT6RXUZQ4s+o8EUoQWElq814kCrgnrOJ98g/VYlgE3ddXvF5i7VkBTPSecieN7ELAXfM53SDWgzLSwQp5P0WNlobjqvw8pAJM=
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
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 11/11] xen/docs: add a document to explain how to do passthrough without IOMMU
Date: Thu, 23 Sep 2021 03:11:15 +0000
Message-ID: <20210923031115.1429719-12-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d862402-9c47-41b0-0b5b-08d97e3feb73
X-MS-TrafficTypeDiagnostic: AM9PR08MB6644:|VE1PR08MB4927:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB49272BB9CE5A81EB801A9458F7A39@VE1PR08MB4927.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S0mO2j1P9agY2idP2mQTWaiKi+dMeW0y3fZg2Ubl9IzhnhYufsj3KwoXioheiXCUHt+eS80R0WjPY4o9fCMgM5iEFuIR8Lr4sbacS2sfQXDQu+erv0aOZ3Mps0bxvxnEonlOPJvuxuhzRvXmNTS8CuItWiJPuYxwvGkJnYp4UtxTIuUIYgsNCaYIbo7sP/vLZrrvm2PFLoJogREBk4jxsmkmLzXlTWQ42EdO93n4BeetvKon/kA62ZiPov8AjPtALtV24GlHmYHawGn/Y7EaV8qYVPaK20lHwVALaXEwSHN+Gtn15JMT7TdmU3PnhM0U7gXEWpA4ZfUMAkeI5V4cFZZl/vm4wgK0kx4uAYB9wLD0/svpDzYrPnBKY+sL1idwD45yqR6GucLSu8M1wJpcazYt8h9yCk2wHgszHY0F9YGq7RW6p6fuVU4k7gRl9zCxn7MiSLfQSuH0dS9d3fHrAKWe8rECyuoVp0GdoxThnS5LAcnPAXunTcc6JMsHp/yJpTHpHdyXtlpeVUcoxv8kMLnDtOdSobE9koz8N+fQEKe31ck6hN/6lmjAMpZIjsjMHYN5fCars2a5OuBDzj7a4kylH1+rLOFDuRa5zt8gb+ue5z95o89OFTMPt8AOi5tT88hD+WubnXEf+6Dm8Ib5CyLOkI5v08K9shAjH2W4eAm8FkYelwwCDzcC7EzTAFQ3fOu5q6Ke9yaULajFS1wtiy9/Pi5Oqs+MdNtVZC/DG2A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(47076005)(2906002)(2616005)(8676002)(356005)(7696005)(4326008)(82310400003)(70586007)(5660300002)(6666004)(44832011)(336012)(508600001)(83380400001)(36860700001)(81166007)(54906003)(186003)(8936002)(1076003)(316002)(36756003)(86362001)(426003)(110136005)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6644
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db3771a0-69b3-494f-7eac-08d97e3fe2c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sIx/sxz/+QFN0YlTZd9vWuRFe4Oz3B2WdnIzdbXHfErI5uJa/4l1lbg1iurV9AC33foj5twiXemyyol3dQnEp+zVFdKMjhtKaabm2PXiuma9Jxb2NVnAdQkiEk+LwvpvKzP9RlXiQFaCdBV0yif/PwO/93P96ZTahsqRZow1B3lHOQkr4EX1ckAs+oOCn7g3cn5QgrGUMaVP86cZ4hbyXSFkGG1aQNxX6etWWEu3+HjWI0e0EqvfZ9jqsUjC/hyj44gqpY/uM0On+h78Li4/xaH2ZbLcpCDzM1d0VRZJboCc+kkH4Rmgequ9F/RvEKd8wmWRWQaB9o4Awpfr/jA74gN5gkFeRanhKkIOqYBcOaj0uvOOowyB0Kn+uP7HRT2OZnMc9YkllxHaSPVi1pcAB4t7xHAiFr2tnZd0Xv5GDHKQNkNsJG2T//oOFXj8q1708Se5XHJE5E0yE/H1Fq2ngDlG3OrgYOwJYU0SioTEpxtURPCkmNbfJoRQlYrvNLgs0AyNR3cx/+LuMGRPkIM6FFzEVnsvXfj3lZliahZl/EnIz5bXIJf760fPlBW2y9uyAjzgVGHpIpE28Je9EAqqck74fuYQ+d0u2w88rHZyig29Dvl4gJFic0avJDaru8EWTepfFMCTpuH7PJvh4dO+tgQoQ7Qzmbl+ngoxi4uvQPU83ER2hFx5pcudMbmDugGcnraUXFfAlPM91Dp2mNKynw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(7696005)(81166007)(2616005)(44832011)(36860700001)(8936002)(8676002)(2906002)(5660300002)(83380400001)(1076003)(82310400003)(86362001)(110136005)(47076005)(316002)(36756003)(6666004)(26005)(54906003)(426003)(186003)(4326008)(70206006)(70586007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:12:04.6851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d862402-9c47-41b0-0b5b-08d97e3feb73
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4927

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


