Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDEF2D22FC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 06:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47129.83449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmVRp-0007Io-4x; Tue, 08 Dec 2020 05:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47129.83449; Tue, 08 Dec 2020 05:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmVRp-0007IP-1b; Tue, 08 Dec 2020 05:22:01 +0000
Received: by outflank-mailman (input) for mailman id 47129;
 Tue, 08 Dec 2020 05:21:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IMz/=FM=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1kmVRn-0007IK-MP
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 05:21:59 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f2f351c-2adc-42a6-8668-09a43f694c72;
 Tue, 08 Dec 2020 05:21:57 +0000 (UTC)
Received: from DB6PR07CA0119.eurprd07.prod.outlook.com (2603:10a6:6:2c::33) by
 VI1PR08MB4608.eurprd08.prod.outlook.com (2603:10a6:803:c0::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Tue, 8 Dec 2020 05:21:52 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::fe) by DB6PR07CA0119.outlook.office365.com
 (2603:10a6:6:2c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.5 via Frontend
 Transport; Tue, 8 Dec 2020 05:21:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 05:21:52 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Tue, 08 Dec 2020 05:21:52 +0000
Received: from c9c30700e293.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC184327-F0B3-4E7C-A1FB-B0015BC7E11B.1; 
 Tue, 08 Dec 2020 05:21:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9c30700e293.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Dec 2020 05:21:36 +0000
Received: from DU2PR04CA0032.eurprd04.prod.outlook.com (2603:10a6:10:234::7)
 by DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Tue, 8 Dec
 2020 05:21:34 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::8e) by DU2PR04CA0032.outlook.office365.com
 (2603:10a6:10:234::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 8 Dec 2020 05:21:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 05:21:33 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2044.4; Tue, 8 Dec 2020
 05:21:24 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Tue, 8 Dec
 2020 05:21:23 +0000
Received: from entos-d05.shanghai.arm.com (10.169.212.212) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 8 Dec 2020 05:21:20 +0000
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
X-Inumbo-ID: 0f2f351c-2adc-42a6-8668-09a43f694c72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xke5hNIj05zvXJb580XIY9RhZFz2LEBvBYMvDx7nia0=;
 b=eApz4/JVFn9ghlYGv8RGBZIeYBnuN4CsDdOc+tTWTi5cwuyxX5wWCcPCr1faVOCToeXRvDEjOm1H5PkTHAOXln6pIv/Ej15VOsNsIE8TTmZoCFjtPQmeL4xkgHuE80a9Tnsgvf2A8CVxBjvNRVjSs8CxZU0H37M4QJ4rJEt77Vc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1591b7bbf81c0587
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXY2xiSKhQFnb7+Pr2hQ11p5IaLU+sCbSTDAj2KtFsYSBI+3dLo5uGTii2uL6QoAuNAveH7V/8Jn+NIuZL38kvPwwUjNWFXOyOw+oK+WVV/xUxTNDRMTxdAHoQz+wBnWs2e5TC11bBx4mHtA0p+vOaksSo6+eRxoY5feslinQ8JrmoIipgPZuwZgOy6GtvmjK83FN3mFBxxCtZg22p1kCF1eKreqtB0kISgUJ1qHybOpSpURmTGGk1Q1iiO/7TNmEKMa9qepOYNJAazS68J53qpMJVIPSc/Wu5MTKBMQi2sOpd7ckk0W2zw1lshygtCLfbaMgeE33iL+703WCE3jFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xke5hNIj05zvXJb580XIY9RhZFz2LEBvBYMvDx7nia0=;
 b=aMuOeDRa14qZ2TPx0V8xyvpZDbP4ngBszbqvRH+sxk1FkVtnxoRCuUmGdt+FJY1WWnYMhbei0cxoVOHJCAwnb4WhpV2tLCQUYieMIZZCMH8ze9QqVvNLaxFL4W4EYQC8/g0eup1x5r/CJXFk+uyrPx8n+alFboy0dynDdRJxD/2U7L0gyZM5u4SMy2oTe2zUteScoMfSCnuQxzzo9PXgUY+W4tErHwZvQLg6Fiwjj8DBU6jIERfwRr+rt3dtIwe+RfxZgglWIBsm7EKPG7HRjjsnhr77t16Dz2CuVNgUKEV/6Q4LOMOEEwKNEq7G9vXnimng0oMHMkD2t+3998YMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xke5hNIj05zvXJb580XIY9RhZFz2LEBvBYMvDx7nia0=;
 b=eApz4/JVFn9ghlYGv8RGBZIeYBnuN4CsDdOc+tTWTi5cwuyxX5wWCcPCr1faVOCToeXRvDEjOm1H5PkTHAOXln6pIv/Ej15VOsNsIE8TTmZoCFjtPQmeL4xkgHuE80a9Tnsgvf2A8CVxBjvNRVjSs8CxZU0H37M4QJ4rJEt77Vc=
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
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>,
	<Wei.Chen@arm.com>, <nd@arm.com>
Subject: [RFC] design: design doc for 1:1 direct-map
Date: Tue, 8 Dec 2020 13:21:13 +0800
Message-ID: <20201208052113.1641514-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 201b1dd2-622d-4e28-6c0e-08d89b392c0d
X-MS-TrafficTypeDiagnostic: DBBPR08MB4725:|VI1PR08MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB46080845A998D3FA724081BFF7CD0@VI1PR08MB4608.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QV26fuKh7gMSJRrrYk8OLIQf7uM7NWf2O0M94r/n23WpZAjOwsH5r0St2pm6i4XB60oVC8uptGMahg1Tqk2QAofaL4xr/L9e1m0dTTYgxxHItS7v29gzUM6o90lIjJ/Q/iC5R4g11z8yccw6MLtNCfKU1xjKLm/rhshy7DOLZlSB5ENTUXvEb2iGRRj8QwMGTvrpsk6IfnSupAmO08quWFc+nGHyv9zGzuqVZViNC4EJxw8gsJw5CWT9LenII2YwluhWzqBoiGsXAvkmo2Jt/nHyMpoPGCnwo9wx49SnANx7e0Ub/yXD437xzZW2iKlgK0ckjoFDotI7DsdSzmqLW+4SIlwJB1i2FOieZNd6bOsVxt9u5E9UGAy+SFJ7NyJ/lRsrEUoIDRjD1GPzr6p/EDQjK14LzxqYYhQxbcwmnYosK4Kv7zK5VPo0C/d3bd7+JgGZVRqRqZ/LLSMN2VOafQcJazstK67FL51+BinJY4C0y0nUf6QYypJpXvYhuSnH
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(46966005)(6666004)(70586007)(86362001)(7696005)(83380400001)(47076004)(82310400003)(110136005)(5660300002)(36756003)(54906003)(356005)(1076003)(81166007)(4326008)(426003)(26005)(336012)(44832011)(8676002)(70206006)(186003)(508600001)(2906002)(2616005)(8936002)(966005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4725
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04e3f927-46ef-4eb5-817e-08d89b3920db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fPlE419AV/rIIOGpj60fX7BYdD4fAWk69QLpYm+O/TBR+2z5mpwsQKo4SVYoZDNF+5oJQ6/FcRuGjcm+w98/QKJxKkoTEXLWGwDNGN4T7OfEcjhJ2WPHxovu6GmmRKFcLPyImUjPJc1il5Fk8F3KnLfO6yoNV8zK/xxYbbnAAmpuPZmHQ0RugPkWcwLJ7XjREoOGWYZp+VW6lRNZlng7zgl2joCdNUtXqOnOORIDBhPCEzQLfRflX5Acp4aw86Q7MS6bQgPFsavJQqUe2k8sFFnby29fRDZ2HVBwWF3yQYQCZXIuoHLD/Oa1fYW+rqRvnrniZL8irP878rO9DC9JuU+t6bDH6OFzKgSndqgRWg38YniVujq+dx8mt3nbBdad9vtB0DQM2CXgl39dZVwQjr1FytjpHtS6sUwQRbvM/avlEpC1OnMG7OOkCU5HrtaQmO6uicZcFJKuf0y5B42YfKmt3Prfv5wjh5W9tTZwDk2IZBmWHqZUePAwc/RjufUG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(46966005)(26005)(70586007)(2616005)(186003)(426003)(82310400003)(36756003)(966005)(70206006)(336012)(44832011)(1076003)(83380400001)(7696005)(5660300002)(8936002)(4326008)(110136005)(54906003)(47076004)(2906002)(8676002)(86362001)(508600001)(81166007)(6666004)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 05:21:52.7373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 201b1dd2-622d-4e28-6c0e-08d89b392c0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4608

This is one draft design about the infrastructure for now, not ready
for upstream yet (hence the RFC tag), thought it'd be useful to firstly
start a discussion with the community.

Create one design doc for 1:1 direct-map.
It aims to describe why and how we allocate 1:1 direct-map(guest physical
== physical) domains.

This document is partly based on Stefano Stabellini's patch serie v1:
[direct-map DomUs](
https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00707.html).

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
For the part regarding allocating 1:1 direct-map domains with user-defined
memory regions, it will be included in next design of static memory
allocation.
---
 docs/designs/1_1_direct-map.md | 87 ++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 docs/designs/1_1_direct-map.md

diff --git a/docs/designs/1_1_direct-map.md b/docs/designs/1_1_direct-map.md
new file mode 100644
index 0000000000..ce3e2c77fd
--- /dev/null
+++ b/docs/designs/1_1_direct-map.md
@@ -0,0 +1,87 @@
+# Preface
+
+The document is an early draft for direct-map memory map
+(`guest physical == physical`) of domUs. And right now, it constrains to ARM
+architecture.
+
+It aims to describe why and how the guest would be created as direct-map domain.
+
+This document is partly based on Stefano Stabellini's patch serie v1:
+[direct-map DomUs](
+https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00707.html).
+
+This is a first draft and some questions are still unanswered. When this is the
+case, the text shall contain XXX.
+
+# Introduction
+
+## Background
+
+Cases where domU needs direct-map memory map:
+
+  * IOMMU not present in the system.
+  * IOMMU disabled, since it doesn't cover a specific device.
+  * IOMMU disabled, since it doesn't have enough bandwidth.
+  * IOMMU disabled, since it adds too much latency.
+
+*WARNING:
+Users should be careful that it is not always secure to assign a device without
+IOMMU/SMMU protection.
+Users must be aware of this risk, that guests having access to hardware with
+DMA capacity must be trusted, or it could use the DMA engine to access any
+other memory area.
+Guests could use additional security hardware component like NOC, System MPU
+to protect the memory.
+
+## Design
+
+The implementation may cover following aspects:
+
+### Native Address and IRQ numbers for GIC and UART(vPL011)
+
+Today, fixed addresses and IRQ numbers are used to map GIC and UART(vPL011)
+in DomUs. And it may cause potential clash on direct-map domains.
+So, Using native addresses and irq numbers for GIC, UART(vPL011), in
+direct-map domains is necessary.
+e.g.
+For the virtual interrupt of vPL011: instead of always using `GUEST_VPL011_SPI`,
+try to reuse the physical SPI number if possible.
+
+### Device tree option: `direct_map`
+
+Introduce a new device tree option `direct_map` for direct-map domains.
+Then, when users try to allocate one direct-map domain(except DOM0),
+`direct-map` property needs to be added under the appropriate `/chosen/domUx`.
+
+
+            chosen {
+                ...
+                domU1 {
+                    compatible = "xen, domain";
+                    #address-cells = <0x2>;
+                    #size-cells = <0x1>;
+                    direct-map;
+                    ...
+                };
+                ...
+            };
+
+If users are using imagebuilder, they can add to boot.source something like the
+following:
+
+    fdt set /chosen/domU1 direct-map
+
+Users could also use `xl` to create direct-map domains, just use the following
+config option: `direct-map=true`
+
+### direct-map guest memory allocation
+
+Func `allocate_memory_direct_map` is based on `allocate_memory_11`, and shall
+be refined to allocate memory for all direct-map domains, including DOM0.
+Roughly speaking, firstly, it tries to allocate arbitrary memory chunk of
+requested size from domain sub-allocator(`alloc_domheap_pages`). If fail,
+split the chunk into halves, and re-try, until it succeed or bail out with the
+smallest chunk size.
+Then, `insert_11_bank` shall insert above allocated pages into a memory bank,
+which are ordered by address, and also set up guest P2M mapping(
+`guest_physmap_add_page`) to ensure `gfn == mfn`.
-- 
2.25.1


