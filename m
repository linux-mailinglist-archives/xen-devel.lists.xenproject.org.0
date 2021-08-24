Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD13F5B61
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 11:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170778.311698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5b-0001sV-Ix; Tue, 24 Aug 2021 09:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170778.311698; Tue, 24 Aug 2021 09:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5b-0001ps-FL; Tue, 24 Aug 2021 09:51:27 +0000
Received: by outflank-mailman (input) for mailman id 170778;
 Tue, 24 Aug 2021 09:51:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jFgo=NP=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mIT5Z-0001jx-QZ
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 09:51:25 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6e04b40-04c0-11ec-a8bd-12813bfff9fa;
 Tue, 24 Aug 2021 09:51:23 +0000 (UTC)
Received: from AS8PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:20b:310::20)
 by DB8PR08MB4089.eurprd08.prod.outlook.com (2603:10a6:10:a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 09:51:21 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::1e) by AS8PR04CA0015.outlook.office365.com
 (2603:10a6:20b:310::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:20 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Tue, 24 Aug 2021 09:51:20 +0000
Received: from 994f709d97c8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6900B23F-7D4E-4437-8459-65DD8356B926.1; 
 Tue, 24 Aug 2021 09:51:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 994f709d97c8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 09:51:14 +0000
Received: from AM5PR0201CA0003.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::13) by PAXPR08MB6333.eurprd08.prod.outlook.com
 (2603:10a6:102:12c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:51:12 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::5) by AM5PR0201CA0003.outlook.office365.com
 (2603:10a6:203:3d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:12 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:12 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 24 Aug
 2021 09:51:09 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:07 +0000
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
X-Inumbo-ID: d6e04b40-04c0-11ec-a8bd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgS1Rf3ebomsvnvr/wY+lSEo95uM3e33VHow5395u4k=;
 b=mibLvdyD7IHZhVLqONO9NMM7qZ1LWJo+KRg8oNxux+bsCzDNWREDoCpLcglV///3924VGe40O4EgAh0d37B4lJQZbnmRmcf9o8ODEAvFjbhnQVBe+fFrqVnsJcEaoQtSf6CBqXAiFVb/fV3aOqB8WGmizgChpYekfUiI7wxDrPo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7a8e112fc7dfd32
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cr325YzIupOpAOA1/LY2pt7ID9zs6NLcgNrCfbZVv4wrgZcj1EYMCd9XGRn0fcDAOXSCDqKdoaVCh5V7poHmfTm+Dm4j7yRSl7tHPrbe9N4VkDHOpvpOH5UqHflbsDGvsjJBNhHeUOUrR1f1+mOQoEkneyBnGMh1ybMnZXcaVpExGLZlgAHetU2OibXvQeFAbhMo9ClHqfFp8CFqNcpih5luLFRWsqc0P6yyGZXzTuqPff4QVxp67zY7jgIfOrX1aKVmOCqbmyd10Qux6J5rPyiZoGlmrHEiZjDHag3/Apq6vrvjdbdSNshHjUGI6EP41F/3StZCd4ky2lTmmT1TKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgS1Rf3ebomsvnvr/wY+lSEo95uM3e33VHow5395u4k=;
 b=nM1s/jzKG1cWuMVzLzHmD5BAy6PhR3an9JalFyXCubi/bmbII2zm86s7oP76GZltNnx/wV1FoizqSrF0XABLFZjYyx2Osmw/zVKVz4oIFX4+wTY82OBY4o/We6/9/G9VFGKM4751s80yE7sS90W3RI/U+Uy0pLyjzk1DhdUIX0qGYvde4LCQ3oeNf8iQkCeBbEuYFw7BWGrpmDK+32wN3LEWzYMVLtDTrSO714sfRMpPlqYqHKHrQL3EUdOHEu7CDWA+EGZd7u0/FHal/6+qSuIVPhY4B6R/obHSHVIlw74M4SxaHT6EjMtqJc2CVRzaqA7jbO370cw0Hd3+0mgN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgS1Rf3ebomsvnvr/wY+lSEo95uM3e33VHow5395u4k=;
 b=mibLvdyD7IHZhVLqONO9NMM7qZ1LWJo+KRg8oNxux+bsCzDNWREDoCpLcglV///3924VGe40O4EgAh0d37B4lJQZbnmRmcf9o8ODEAvFjbhnQVBe+fFrqVnsJcEaoQtSf6CBqXAiFVb/fV3aOqB8WGmizgChpYekfUiI7wxDrPo=
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
Subject: [PATCH v5 2/7] xen/arm: introduce domain on Static Allocation
Date: Tue, 24 Aug 2021 09:50:40 +0000
Message-ID: <20210824095045.2281500-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824095045.2281500-1-penny.zheng@arm.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31fd7733-6bd5-41b4-e01a-08d966e4ba08
X-MS-TrafficTypeDiagnostic: PAXPR08MB6333:|DB8PR08MB4089:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4089EE44A9621E1B7BA7BAD2F7C59@DB8PR08MB4089.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rJ7GmzhwkieSGiYdEyCQEKv50U5jUmAsAk2PqOulPk+2lDcViMtBCZUpC66LzLflzLspz4p0hBStw0H7q1onkiqxWtp+DEj1sMueBC8wbG9zwewLaHVBhPAxr25ZP1QdeYv4KRHZOLR8/Ht7Hd3bIl4TLWz2sSpZ2IFBCxSNe38x0ZknoeGRDN9c8trtysG+735lTHfFlpgElMO7KoNA96nK6u+XGEO2NYeRQJn8e2X+unaLzmyHIfjoH+qdLZLicnBD9Y3uGpgVPpyxx16coEA6AlupbTW3Cr5AH3NHPKBCsP8a9cAkeLcOgQb2UJffo9BUlIXnmucC4YaKS21gCPLVdkWZY1/rX8IcPbPqqILtSjMBMS8SW4AC+eOpTgoVqX613YzIEEGtSizbeMHKy60FpxNlOmUAzs6XYTZbAeAIfHDFecVdPRYKan97I7lcc0PuXVzv6ApbPqlqEjEqVs+fhwsudN5xxceDIWfgZzRf1mJhJ7XcK/lTkvWrQV6yCVH3pviOwnbVkR0EbfiuIDzEZ69VrrDmjQo0kXMD/894L7XmbQZIMH3kHfd78KL4Jv6fFx8MKhm99laWPKfrmWJkDwVSl2BEDMfEkkXZnzYRw1NeQspz5zeeWZX7VKNJcp4nevO+n6B8SazKgGtcImXC+splfh+RTzK6ivB4rov+yjz/A+qax9JxkK56HzgVHuVmFKzqdGVdLL2piQ7M25mmZ+pzDWnRFQWZ56BuyGQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(36840700001)(46966006)(36860700001)(83380400001)(426003)(36756003)(82310400003)(82740400003)(356005)(81166007)(2616005)(5660300002)(70206006)(47076005)(110136005)(316002)(44832011)(186003)(478600001)(70586007)(4326008)(2906002)(8676002)(6666004)(336012)(7696005)(26005)(86362001)(54906003)(1076003)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6333
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a15d582-71ce-434f-1c9e-08d966e4b51f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MnFmhpuQHPBh2pDyCfar4UvRieuUCaFnXz8VxmFEH4598/Lfgd6rfRpakTzoYnIfOfb7XoaTltz7R+otrG0co1FJytwXS1ERqqgW3v4qsXffUmRhrWm16LCvZ3RppljEDDv2OshiqhyUoOhEap57Paf08GheOG27+CVNrvyqToXxyhUGc1e4HQZvxmJVr2RhR9xE1XCgPDcE5g96bkEtxMfYJBeO+J2zrpHkNL6QqrR9O80kcF14ELqtnedlFvzYiIuLoIBhl62AM7gOzBPqd8A2nQMTmB+5aJJ0fMEFZ61lQsCd/MEcDpigwMOw95sLrajuWHKpzLyCif/cjOhwdrNoq0J++wuG1ExqlUsFWlaUM7evYASjjfqQJXZzOvfodzJdwDO8G4V6/Aix+HGXe+hZwsFkD9WQdcTagBza4/uqWIFLG7Fn3iPP+FdJSeW3rlh5dInjklqcWZAZ9aKSAFxPFESHKoinbrL1oWGOQloaJOO3c+iOEVhsTVaL1YhsICgu4H/mvMPh0K1t9Tb+/etGEf/yJEB5SeIFJMs6vHLHeQETXAT75CZtlaAHLRidFrqMVNdtBkSYKGzSMeHVsOV3tllb3x7bBYULhG2zZpB+5NT5JjCKhOmaCfXGEXvFvTlZIwVE46rrInrr9vV42pw8WG/zCbD4w6EXvi1hwPg4RyYjhfgLW8RzhtrulhPF1PG9cVQCwN1Ut4/Gf8Uh7Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(36840700001)(46966006)(86362001)(186003)(426003)(336012)(5660300002)(8936002)(36756003)(8676002)(110136005)(83380400001)(54906003)(26005)(82740400003)(70206006)(82310400003)(6666004)(70586007)(316002)(7696005)(36860700001)(47076005)(2906002)(1076003)(4326008)(81166007)(2616005)(44832011)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:51:20.8316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fd7733-6bd5-41b4-e01a-08d966e4ba08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4089

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.
Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Memory can be statically allocated to a domain using the property "xen,static-
mem" defined in the domain configuration. The number of cells for the address
and the size must be defined using respectively the properties
"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".

This patch introduces this new `xen,static-mem` feature, and also documents
and parses this new attribute at boot time.

This patch also introduces a new field "bool xen_domain" in "struct membank"
to tell the difference of one memory bank is reserved as the whole
hardware resource, or bind to one specific xen domain node, through
"xen,static-mem"

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v5 changes:
- check the node using the Xen domain binding whether contains the property
"xen,static-mem", not the property itself
- add "rc = ..." to get the error propagated
- introduce new field "bool xen_domain", then static memory shall be also stored
as reserved memory(bootinfo.reserved_mem), but being bind to one
specific Xen domain node.
- doc refinement
---
 docs/misc/arm/device-tree/booting.txt | 33 ++++++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 36 +++++++++++++++++++++++++--
 xen/include/asm-arm/setup.h           |  1 +
 3 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5243bc7fd3..95b20ddc3a 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -268,3 +268,36 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
 follow the convention explained in docs/misc/arm/passthrough.txt. The
 DTB fragment will be added to the guest device tree, so that the guest
 kernel will be able to discover the device.
+
+
+Static Allocation
+=============
+
+Static Allocation refers to system or sub-system(domains) for which memory
+areas are pre-defined by configuration using physical address ranges.
+
+Memory can be statically allocated to a domain using the property "xen,static-
+mem" defined in the domain configuration. The number of cells for the address
+and the size must be defined using respectively the properties
+"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
+
+Below is an example on how to specify the static memory region in the
+device-tree:
+
+    / {
+        chosen {
+            domU1 {
+                compatible = "xen,domain";
+                #address-cells = <0x2>;
+                #size-cells = <0x2>;
+                cpus = <2>;
+                #xen,static-mem-address-cells = <0x1>;
+                #xen,static-mem-size-cells = <0x1>;
+                xen,static-mem = <0x30000000 0x20000000>;
+                ...
+            };
+        };
+    };
+
+This will reserve a 512MB region starting at the host physical address
+0x30000000 to be exclusively used by DomU1
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 8c81be3379..00f34eec58 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -66,7 +66,7 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
 static int __init device_tree_get_meminfo(const void *fdt, int node,
                                           const char *prop_name,
                                           u32 address_cells, u32 size_cells,
-                                          void *data)
+                                          void *data, bool xen_domain)
 {
     const struct fdt_property *prop;
     unsigned int i, banks;
@@ -90,6 +90,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
             continue;
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
+        mem->bank[mem->nr_banks].xen_domain = xen_domain;
         mem->nr_banks++;
     }
 
@@ -184,7 +185,8 @@ static int __init process_memory_node(const void *fdt, int node,
         return -EINVAL;
     }
 
-    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells, data);
+    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
+                                   data, false);
 }
 
 static int __init process_reserved_memory_node(const void *fdt, int node,
@@ -338,6 +340,34 @@ static void __init process_chosen_node(const void *fdt, int node,
     add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
 }
 
+static int __init process_domain_node(const void *fdt, int node,
+                                       const char *name,
+                                       u32 address_cells, u32 size_cells)
+{
+    const struct fdt_property *prop;
+
+    printk("Checking for \"xen,static-mem\" in domain node\n");
+
+    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
+    if ( !prop )
+        /* No "xen,static-mem" present. */
+        return 0;
+
+    address_cells = device_tree_get_u32(fdt, node,
+                                        "#xen,static-mem-address-cells", 0);
+    size_cells = device_tree_get_u32(fdt, node,
+                                     "#xen,static-mem-size-cells", 0);
+    if ( address_cells < 1 || size_cells < 1 )
+    {
+        printk("fdt: node `%s': invalid #xen,static-mem-address-cells or #xen,static-mem-size-cells",
+               name);
+        return -EINVAL;
+    }
+
+    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
+                                   size_cells, &bootinfo.reserved_mem, true);
+}
+
 static int __init early_scan_node(const void *fdt,
                                   int node, const char *name, int depth,
                                   u32 address_cells, u32 size_cells,
@@ -356,6 +386,8 @@ static int __init early_scan_node(const void *fdt,
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
         process_chosen_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
+        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
 
     if ( rc < 0 )
         printk("fdt: node `%s': parsing failed\n", name);
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index c4b6af6029..6c3c16294b 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -24,6 +24,7 @@ typedef enum {
 struct membank {
     paddr_t start;
     paddr_t size;
+    bool xen_domain; /* whether memory bank is bind to Xen domain. */
 };
 
 struct meminfo {
-- 
2.25.1


