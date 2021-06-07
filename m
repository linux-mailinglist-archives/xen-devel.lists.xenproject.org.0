Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ACD39D30E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137536.254870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5F9-0003dU-GH; Mon, 07 Jun 2021 02:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137536.254870; Mon, 07 Jun 2021 02:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5F9-0003ak-BS; Mon, 07 Jun 2021 02:43:59 +0000
Received: by outflank-mailman (input) for mailman id 137536;
 Mon, 07 Jun 2021 02:43:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5F7-0003W9-KM
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:43:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::613])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e72c521d-edcb-45e3-a34c-0b80ce31f886;
 Mon, 07 Jun 2021 02:43:53 +0000 (UTC)
Received: from AM6PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:92::17)
 by AM9PR08MB5938.eurprd08.prod.outlook.com (2603:10a6:20b:2da::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 02:43:47 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::86) by AM6PR04CA0004.outlook.office365.com
 (2603:10a6:20b:92::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:47 +0000
Received: ("Tessian outbound 836922dda4f1:v93");
 Mon, 07 Jun 2021 02:43:46 +0000
Received: from 5e7e6bb04b87.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3FF24D9-2469-4FA8-BD57-4AD5C80A7B5F.1; 
 Mon, 07 Jun 2021 02:43:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e7e6bb04b87.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:43:40 +0000
Received: from DBBPR09CA0037.eurprd09.prod.outlook.com (2603:10a6:10:d4::25)
 by DBBPR08MB4522.eurprd08.prod.outlook.com (2603:10a6:10:d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 02:43:37 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::df) by DBBPR09CA0037.outlook.office365.com
 (2603:10a6:10:d4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:37 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:37 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:43:35 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:33 +0000
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
X-Inumbo-ID: e72c521d-edcb-45e3-a34c-0b80ce31f886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFHlw8L+DYMmW1VL14RO+7hEsLY/c2HmSWKQXFt7g74=;
 b=1bsKOM63byfLzsKnBPezFiDgPYOCfArV7ULsjR5ZpnwtG7nslTQcymaS9+nCker/oSnBeKtuT0fxeeTp9Ot3s0ECDXgdq/D5aHxAB3tb0vNm6OrPAxtTR8No91VaZQ2jlAd1nTJRO4EznZvydi5WlsTMOc6Fp6FozwKWxlZGvjE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb25161b750b923f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/uoTfvXvra6bWOonyZLbRBeNe3EFBTydk4OAwtkgqGN9fjJQVdclSUyg+6MvHffj2hTtrVWlKeBbrRdkMcFT+Ia1vQxGRM2MvcEOZx548O9gSFhDfTuQ+UBFdvVJ3oZNJxxeNXxALWX5vbFZvv8/ZWvEpjcd2RlJ3mun+CkzUj7jH0qhWl38gon+xncVE95sWCGRHPqBAwu7WgJv2E0rJLNNBIGpaQa9KPRwxPF7SXGDQ1X2cWnUpRj2fRazbU0FSPJ9Jo2OPTycJq/XrfYxvnv/HEl3xRkQ4Avj0eyxqDK+AnQ+l9G4ZCyWW9fSZi0GliiXK5ZzZX70zk7Ec0bVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFHlw8L+DYMmW1VL14RO+7hEsLY/c2HmSWKQXFt7g74=;
 b=DbyzKIyIGXkuxFzL+jrIPBVrl+YPPgOwUnYNIyTOv5WEet4hb5ycGx8+mrQvaokVrWoe30zGj3zAIXx+hWTXGIAYpk1AWMTgVdXI138Qbu5X/Xehqi5nTfprcuaf1fYxZmO6FEnaWIg6y2mI7e2vwHFins8/YsqxCvqQLrfNPvO91ThuCCkjSXX9uOzMYZq1eBQ8bQxSrHYXi7ivBCxr76EFNObxAaVyFWgTtzuvZq+qIJvP76C/0EfkMF/vPaPJntqu7uAiYNm0XbGOjxviEKzWAm9rIIjOE5+mBy5ZFrjXlOnQNKvzzi5JVaIjedDmUgyvuzoz9+zOMm11l9of5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFHlw8L+DYMmW1VL14RO+7hEsLY/c2HmSWKQXFt7g74=;
 b=1bsKOM63byfLzsKnBPezFiDgPYOCfArV7ULsjR5ZpnwtG7nslTQcymaS9+nCker/oSnBeKtuT0fxeeTp9Ot3s0ECDXgdq/D5aHxAB3tb0vNm6OrPAxtTR8No91VaZQ2jlAd1nTJRO4EznZvydi5WlsTMOc6Fp6FozwKWxlZGvjE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 1/9] xen/arm: introduce domain on Static Allocation
Date: Mon, 7 Jun 2021 02:43:10 +0000
Message-ID: <20210607024318.3988467-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607024318.3988467-1-penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1afd8f2-ce5f-42fc-e02a-08d9295e12fd
X-MS-TrafficTypeDiagnostic: DBBPR08MB4522:|AM9PR08MB5938:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB59383FC85FED5F8EF3413AC0F7389@AM9PR08MB5938.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yN1QZl0eKLy6qmQjvRD+eNwBzWKoWU6aLms5DiUPiqTb1byCqsXdMnSPfhQWdcCy7F432l9WSFRy9m0JmouZRnk5KIwYjowhZjq1QHuUpreJ6VI2YGB6Ki8TxbeXHpxJc0eejgSNmGj2PK7+uY4ILMOAgRQGZO4DB4T6Fod5Xju2M+KlM3kRpm+1lg8u5Ovux6+ZgGYjwaJnoo7+YObfzf80UF0mFeSnyMWxeUj+IMopy5/kT1Yq5RUHPoWxUYQn0OGqKm3aITHFkA2z3AbKQFfdGkTCcXRujp11IhByZkSN/7cztkdTN0dmp4wpssiskHTg83XlowlJn1QTs08rdbKdMQ5csHoW2V4RKpl1lxs7UKM/A14+MWgW8BOuhMx6hxUS83DB27tC/icxgXNBfLrYd7ympaYniHPCwjC21D0ZKmxE3Z6A03va6+7At0jS3KdhYHdDmQrt/m+OXij14l3tSxI+f9F2v0DIf+DtZNS0O24lX8Ta3lzL1sDAVNwD6xwHOz9nOcCWrb+xs7rWpAn+GwIW4dE0ryX/RCj6sgtUeLbkFblo2PjGbfBtfEQZDA/58VpHfRgfJ8o6RsYofKvLiMDySH+owBDndUNTcXnPmyqybQST69zx8xs+RlTKEyiFSJ1azaLGyLm7iwZH29HMdjLZz2VFByIoZkUJ03dUFsO92USO0+HuBIVyyJLFCjxbtAl7Y3o3WC7F7hjGNg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(36840700001)(46966006)(356005)(186003)(82310400003)(70206006)(54906003)(1076003)(316002)(4326008)(426003)(6666004)(8936002)(110136005)(8676002)(26005)(83380400001)(47076005)(81166007)(36756003)(44832011)(86362001)(70586007)(82740400003)(36860700001)(5660300002)(7696005)(478600001)(2616005)(2906002)(336012)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4522
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d6a9e6ac-375a-410d-7b66-08d9295e0d1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MLZezpl5jCBA2q6yA5SUm7rr62tlT4We+bqZLJlAPrkK759HkGh+Yrb+yDbxMRT3JOcE1FAghtOsDRuus2Z2e6twd8pn9NDZPgat1hp6R92TE1KBUceVcVw47R5Fwyu9yeihYkhyb/dcXh+aCkw7z5cqtuM9s+EZmxukVCigrZMaKL6Y5LehpGJ4XC9PFT1FWlM/7NS0laplSw4HtIy7EbvN5whrDnZ60q3w4CT/b1AW+pPHf2J7ur+Ehn/7UOANYQ2aC8F+7qHK+Kpww4bFva7V+S66B6FmrUnSskH01uTGz1tKW1NNViHdgRRcZsbrlQNwQNh6/M8VJChCzaCSqw/cxgbXgcTZt7fQODODiX/os7nLBGngU0qoalPB07JolfM2gk3FjP5OZNhGjZdDR8u4JQ2r9Ylyb4Jv6DSkUBCpBDE/64dXurZrhOgKffXM53l6gOzp4AQjHg66HWbEwN17GqgNs5hwOVMrXQ1WmrTUoe59PbSeewjaIkAXCCde/9q7WzDzfKXiiAT7La4VBF5EvPzS5tmvJMx+NYwbqTnTkhU6MiRWRGdMmoS2w8TKA0/NzFPy6iOTicpnsU0ukgoplGwANH9xchlXsfqkpYGVipOQcwevMzSFPzUoslfato0wvN8O6fLrZy3qSw800kOp/CHaC+GPOPZqA27bVqEWMAz3U1dG1LRKkPyTQcuL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(36840700001)(46966006)(186003)(82310400003)(70206006)(54906003)(1076003)(316002)(4326008)(426003)(6666004)(8936002)(110136005)(8676002)(26005)(83380400001)(47076005)(81166007)(36756003)(44832011)(86362001)(70586007)(82740400003)(36860700001)(5660300002)(7696005)(478600001)(2616005)(2906002)(336012)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:43:47.0608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1afd8f2-ce5f-42fc-e02a-08d9295e12fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5938

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.
Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Domains on Static Allocation is supported through static memory nodes,
defined in reserved-memory node with `xen,static-memory-domain` compatible,
which are specifying physical RAM as this domain's guest RAM.
{address, size}-cells will be consistent with the ones defined in the
parent node, reserved-memory.

This patch introduces this new static memory device tree node, and also
documents and parses this new attribute at boot time and
stores related info in static_mem for later initialization.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- fix typos
- consider reserved-memory binding and use phandle to refer
---
 docs/misc/arm/device-tree/booting.txt | 49 +++++++++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 12 +++++--
 xen/include/asm-arm/setup.h           |  2 ++
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5243bc7fd3..ba7854b2d3 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -268,3 +268,52 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
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
+Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
+beginning, shall never go to heap allocator or boot allocator for any use.
+
+Domains on Static Allocation is supported through static memory nodes,
+defined in reserved-memory node with `xen,static-memory-domain` compatible,
+which are specifying physical RAM as this domain's guest RAM.
+#{address, size}-cells will be consistent with the ones defined in the
+parent node, reserved-memory.
+
+On memory allocation, these pre-defiend static memory ranges shall be
+firstly mapped to the fixed guest RAM address `GUEST_RAM0_BASE`.
+And until it exhausts the `GUEST_RAM0_SIZE`, it will seek to `GUEST_RAM1_BASE`.
+`GUEST_RAM0` may take up several pre-defined physical RAM regions.
+
+The dtb property should look like as follows:
+
+    / {
+        reserved-memory {
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            staticmemdomU1: static-memory@0x30000000 {
+                compatible = "xen,static-memory-domain";
+                reg = <0x0 0x30000000 0x0 0x20000000>;
+            };
+        };
+
+        chosen {
+            domU1 {
+                compatible = "xen,domain";
+                #address-cells = <0x2>;
+                #size-cells = <0x2>;
+                cpus = <2>;
+                xen,static-mem = <&staticmemdomU1>;
+
+                ...
+            };
+        };
+    };
+
+DomU1 will have a static memory of 512MB reserved from the physical address
+0x30000000 to 0x50000000.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index dcff512648..5b3bb75b5f 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -187,9 +187,17 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
 
     if ( rc == -ENOSPC )
         panic("Max number of supported reserved-memory regions reached.");
-    else if ( rc != -ENOENT )
+    else if ( rc == -ENOENT )
+        return 0;
+    else if ( rc )
         return rc;
-    return 0;
+
+    /* Static memory node with compatible string "xen,static-memory-domain". */
+    if ( fdt_node_check_compatible(fdt, node, "xen,static-memory-domain") == 0 )
+        rc = process_memory_node(fdt, node, name, depth, address_cells,
+                                 size_cells, &bootinfo.static_mem);
+
+    return rc;
 }
 
 static int __init process_reserved_memory(const void *fdt, int node,
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index 5283244015..5e9f296760 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -74,6 +74,8 @@ struct bootinfo {
 #ifdef CONFIG_ACPI
     struct meminfo acpi;
 #endif
+    /* Static Memory */
+    struct meminfo static_mem;
 };
 
 extern struct bootinfo bootinfo;
-- 
2.25.1


