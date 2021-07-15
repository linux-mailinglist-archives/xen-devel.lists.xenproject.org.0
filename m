Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6C3C9840
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156292.288408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tlm-00087D-9x; Thu, 15 Jul 2021 05:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156292.288408; Thu, 15 Jul 2021 05:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tlm-000848-5Q; Thu, 15 Jul 2021 05:18:46 +0000
Received: by outflank-mailman (input) for mailman id 156292;
 Thu, 15 Jul 2021 05:18:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tlk-00083i-ND
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:18:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.63]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f13d1fc-e52c-11eb-8891-12813bfff9fa;
 Thu, 15 Jul 2021 05:18:43 +0000 (UTC)
Received: from AS8PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:20b:313::27)
 by AM6PR08MB3798.eurprd08.prod.outlook.com (2603:10a6:20b:82::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 05:18:37 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::21) by AS8PR04CA0082.outlook.office365.com
 (2603:10a6:20b:313::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:36 +0000
Received: ("Tessian outbound b81a99a0393d:v99");
 Thu, 15 Jul 2021 05:18:36 +0000
Received: from 5290271f0273.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 47E4E018-3139-41CF-A2CB-CB8DA517D4A9.1; 
 Thu, 15 Jul 2021 05:18:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5290271f0273.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:30 +0000
Received: from DB8PR06CA0066.eurprd06.prod.outlook.com (2603:10a6:10:120::40)
 by AM5PR0802MB2451.eurprd08.prod.outlook.com (2603:10a6:203:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Thu, 15 Jul
 2021 05:18:28 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::f) by DB8PR06CA0066.outlook.office365.com
 (2603:10a6:10:120::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:27 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:26 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:24 +0000
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
X-Inumbo-ID: 1f13d1fc-e52c-11eb-8891-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iful6SKFh5yAFK5a8vc6iLO1PFy2rWyY82gDbNfEiXM=;
 b=K0JIJPdHtmuwaELCHS2rq4MBVeulibfFEJQukUh2GglwO9cvRLDVYo/1v8c/swtdwsZXNbexC8S5jMSbbCC4WaPBV860qQtXxbmk6c8fWvBbtNM2osY8MgMWPSFewSVArSY3MDSS3MxIbZCGo2MJcLeZXwZmXgvzMayIrH299ZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1763cc68dc876658
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsDnvUay8FYop8XcCtpK6Jyq0Jjr3DbxssatqHICHkjR8aHC3tziohSgvHS9AQMLpVbhQ+kAGoW9oA2EzjXTdojgvG2xau6Wfq6PgXqqU1nfSJCQawLp5wPVhW6fGvxZfNZAL1fbcYXqSgKj5D2KTZ34qjMYZtr4EKMQL8qx1pi/WHtMN/tV2JPX4hEt1f6Z8fSmJZ9eXQG+/ZAZEGCSOZuvuzMAVEVuB+yzkoB3zOOgJQWDjHfb9hqkz8eKCDuzggQWqG3xuJFuNl5/AMdGJ6ZG5+kx5yrWAU1aPgVolteXJ/6yw16clepruZwEqZmn+MTHM9hGPBCxZJgh7dJJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iful6SKFh5yAFK5a8vc6iLO1PFy2rWyY82gDbNfEiXM=;
 b=FEz99fMg+o/ruZLT72I+rn7qJx87+RedUuGNjBA4Uv9XnU/5h2NxFJc1iZvSVnWCa3uP41uaP+69626FyVzHbE8gcJ3fDaLy1oM4eDvaYR9aabpUjwxWDB52uTxghRgq6hnVGl3Z4WtZ3n0EVaYTFhjXtpS9Jr5r2XFDGYFXxGocpv/bMMvg+840OPTR/66vialB/UOOuUGxE891TAOgkmsS3d9ZXlG72ry+tvrTQtDH+gmuc9E0I4zOcGtqSuQzCIeydt9DICA60Cp6nYYg77EWVYf3MGIkkAiD7hL9geQN46g4CxFjKxrZqi6T1uF/xlJjgzq8J9NrDei1E/qpWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iful6SKFh5yAFK5a8vc6iLO1PFy2rWyY82gDbNfEiXM=;
 b=K0JIJPdHtmuwaELCHS2rq4MBVeulibfFEJQukUh2GglwO9cvRLDVYo/1v8c/swtdwsZXNbexC8S5jMSbbCC4WaPBV860qQtXxbmk6c8fWvBbtNM2osY8MgMWPSFewSVArSY3MDSS3MxIbZCGo2MJcLeZXwZmXgvzMayIrH299ZM=
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
	<jbeulich@suse.com>, <nd@arm.com>
Subject: [PATCH V3 01/10] xen/arm: introduce domain on Static Allocation
Date: Thu, 15 Jul 2021 05:18:10 +0000
Message-ID: <20210715051819.3073628-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53a6a949-714c-4a9a-6aed-08d9474fffbc
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2451:|AM6PR08MB3798:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB379807729030BBF56E40A37CF7129@AM6PR08MB3798.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MW2GkbPOErCi9d8aNJPbCFsRjfvCrsNV/AF+Rx2BeVvZBJR60zXuTFMWwcMeTHhAlB9pFL6arF8T071xxsFc9YEWA+CI6Lq9utd805TwaLiLfIGwdldq7HpYbiU8siPLkZLIDeruMx0PVxEXNsc691qt0IfOaxbbnwd7rumguVX4XuY/zlSMUgzApWsPbGF9g9AELfJROrGRpdD69h6Xjs6/JtsQ9KA2wKsZIJal1NJmxk4wWwx0cgdxHzN6r5/lWEtySC5Xh+oSItcHfLudPCtzuFSdOXFh1yi/Bw3S7rtaM1PNWcErTs4o2Leos/X2Tntxjovr4se3NEhjnCLi6vSz2fr5bg7Y6QXvMnsNm7YU17ahhBByhlk5dKr0kZgc+NxIMUOYzPcdI17hBEopxas+BRzLF7wY7JdxYBJvW+PdnChR0fGBYYaN1WdufEVCyghoET61zIIxZwxomi4Y3Rq04j0ePWgtuuR3vQAJ/ASDtm6+zuuZZuXBrj5V7w5ZkvBCjFhkH9Bg1PJcWMIAKcPT40BRjK4ikwjJPdfH1XLNGbnytncOaVAGJr+D/NqSJ6E1r0PCqEQzlPNsqehliQR9ypsCfGYM+T4ABxsTtJodDpjO5TyDOW7tTFacRUZWczMsLQ2I7V/phgm7q15vBXf03Ri1FehakOQ1DAgR8Mwh6EUZ0lHHwkYQWqR1KXO3VlzGRyPveAozBUUvCuO5uU8T85CJzF2wUpCvX4CtVBY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(26005)(7696005)(478600001)(2616005)(5660300002)(6666004)(82310400003)(356005)(4326008)(2906002)(8676002)(86362001)(316002)(54906003)(186003)(1076003)(8936002)(70586007)(70206006)(36756003)(426003)(36860700001)(110136005)(47076005)(44832011)(336012)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2451
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b840cf3-293c-4fa1-a81b-08d9474ffa6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ysdv00YuWUpDUQnzYFGngbs/HRb9g5HtUrgpWdnua7CmcQtyfqrI9cx6CqB0xT6hhW7qEwztOt2aR1ltDHAegQp6bdqSWUaoye5GPnYlYpdam6bM7sYGrPcDFLMsXWTvIxZVi1pED2GJvNx71Bcu2ZO5jvqKKXyW7mAYvWhfTCfz1iaqGCiL38aOFFACCgMLSye0ysretIdN16FJFsQaU1EG/GnPVxRcv3qB0vTQLSQ6LvHMPgGT7YkpeljMI/Cp4amj1NAZXuQ9B6JRV6UKqw5HATWQTMHu+PNcJ7N30FuRawrbMyiVQtGNVBZpp+vy2RQa9FqJX1Sta5Y35cSiN3B43FJsLHo9W96WEUXT1tZJIs6qrnEEwG7QBo/lULV4HjXZEVlUerRZXsEAvDezko/FhE37WkH5kjHlrlMmLMxqtkuauBsASRvTDvUBHc+PB4uLwEUJgTxP+BpEUfdKfc7lkiQD+HdEvhaoYlV9cQIFNzL0ESzT5IeWuKjLY/sKAGR7I30AWoClebKCZL2KVNund4cL70ZhF2ibxfmSnJ7ZGI6/DvJQjkyEdAulzxR3keIbL1wTSB7jyRWzVJFYG0e30o+Qo2Le4zL5iri2x8+7egnaEvHIT2yXXRSkc6sMh1qRovpQi0TkL5/pLMHDVQsIdWeYczgvWGr+EVy+rPeLBVnD9h7ig/XxPtdxZCqXloy5gSOfpv1MF18iRPJ8og==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(36840700001)(46966006)(54906003)(36860700001)(82310400003)(478600001)(81166007)(7696005)(4326008)(82740400003)(6666004)(86362001)(8936002)(1076003)(110136005)(5660300002)(336012)(316002)(8676002)(36756003)(186003)(70586007)(426003)(70206006)(47076005)(44832011)(2616005)(83380400001)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:18:36.7583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a6a949-714c-4a9a-6aed-08d9474fffbc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3798

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.
Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Domains on Static Allocation is supported through device tree property
`xen,static-mem` specifying reserved RAM banks as this domain's guest RAM.
By default, they shall be mapped to the fixed guest RAM address
`GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.

This patch introduces this new `xen,static-mem` feature, and also documents
and parses this new attribute at boot time and stores related info in
static_mem for later initialization.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- use "xen,static-mem" property to be compatible with System Sevice Tree
in the future
---
 docs/misc/arm/device-tree/booting.txt | 40 +++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 51 +++++++++++++++++++++++++++
 xen/include/asm-arm/setup.h           |  2 ++
 3 files changed, 93 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5243bc7fd3..2a1ddca29b 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -268,3 +268,43 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
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
+Domains on Static Allocation is supported through static memory property,
+defined under according /domUx in the name of "xen,static-mem", which are
+specifying physical RAM as this domain's guest RAM.
+The size of address-cells/size-cells must be defined in
+"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
+
+On memory allocation, these pre-defined static memory ranges shall be
+firstly mapped to the fixed guest bank "GUEST_RAM0". Until it exhausts the
+`GUEST_RAM0_SIZE`, then it will seek to `GUEST_RAM1_BASE`, and so on.
+`GUEST_RAM0` may take up several pre-defined physical RAM regions.
+
+The dtb property should look like as follows:
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
+DomU1 will have a static memory of 512MB reserved from the physical address
+0x30000000 to 0x50000000.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 476e32e0f5..d2714446e1 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -193,6 +193,55 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
     return 0;
 }
 
+static int __init process_static_memory(const void *fdt, int node, void *data)
+{
+    int i = 0, banks;
+    const __be32 *cell;
+    paddr_t start, size;
+    u32 address_cells, size_cells, reg_cells;
+    struct meminfo *mem = data;
+    const struct fdt_property *prop;
+
+
+    address_cells = device_tree_get_u32(fdt, node,
+                                        "#xen,static-mem-address-cells", 0);
+    size_cells = device_tree_get_u32(fdt, node,
+                                     "#xen,static-mem-size-cells", 0);
+    if ( (address_cells == 0) || (size_cells == 0) )
+    {
+         printk("Missing \"#xen,static-mem-address-cell\" or "
+                 "\"#xen,static-mem-address-cell\".\n");
+         return -EINVAL;
+    }
+    reg_cells = address_cells + size_cells;
+
+    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
+    /*
+     * Static memory shall belong to a specific domain, that is,
+     * its node `domUx` has compatible string "xen,domain".
+     */
+    if ( fdt_node_check_compatible(fdt, node, "xen,domain") != 0 )
+    {
+        printk("xen,static-mem property can only be located under /domUx node.\n");
+        return -EINVAL;
+    }
+
+    cell = (const __be32 *)prop->data;
+    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
+
+    for ( ; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
+    {
+        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        mem->bank[mem->nr_banks].start = start;
+        mem->bank[mem->nr_banks].size = size;
+        mem->nr_banks++;
+    }
+
+    if ( i < banks )
+        return -ENOSPC;
+    return 0;
+}
+
 static int __init process_reserved_memory(const void *fdt, int node,
                                           const char *name, int depth,
                                           u32 address_cells, u32 size_cells)
@@ -346,6 +395,8 @@ static int __init early_scan_node(const void *fdt,
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
         process_chosen_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 2 && fdt_get_property(fdt, node, "xen,static-mem", NULL) )
+        process_static_memory(fdt, node, &bootinfo.static_mem);
 
     if ( rc < 0 )
         printk("fdt: node `%s': parsing failed\n", name);
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index c4b6af6029..e076329fc4 100644
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


