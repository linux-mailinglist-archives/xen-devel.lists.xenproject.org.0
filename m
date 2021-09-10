Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961A4065D3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 04:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183855.332251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWes-0004oG-Pd; Fri, 10 Sep 2021 02:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183855.332251; Fri, 10 Sep 2021 02:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWes-0004k5-Ja; Fri, 10 Sep 2021 02:52:54 +0000
Received: by outflank-mailman (input) for mailman id 183855;
 Fri, 10 Sep 2021 02:52:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6Hc=OA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mOWeq-0004Sh-UC
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 02:52:52 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 301de676-11e2-11ec-b209-12813bfff9fa;
 Fri, 10 Sep 2021 02:52:51 +0000 (UTC)
Received: from AS9PR06CA0069.eurprd06.prod.outlook.com (2603:10a6:20b:464::18)
 by VI1PR08MB3309.eurprd08.prod.outlook.com (2603:10a6:803:41::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 02:52:49 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::fa) by AS9PR06CA0069.outlook.office365.com
 (2603:10a6:20b:464::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:49 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Fri, 10 Sep 2021 02:52:49 +0000
Received: from 84a38c9bd2fd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 46A29243-FC7F-4B10-A916-47B71ACCF0B8.1; 
 Fri, 10 Sep 2021 02:52:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84a38c9bd2fd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 02:52:42 +0000
Received: from AS8PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:20b:313::23)
 by PAXPR08MB7320.eurprd08.prod.outlook.com (2603:10a6:102:223::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 02:52:40 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::9a) by AS8PR04CA0078.outlook.office365.com
 (2603:10a6:20b:313::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:40 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:40 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 10 Sep
 2021 02:52:43 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:42 +0000
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
X-Inumbo-ID: 301de676-11e2-11ec-b209-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzUXt/Gqs28bjIO6M0/X3qZ/21raERDi7GDI7xhSsGg=;
 b=nVkALiXt6FKKB37t6txu2AjGXor0TqQuiBYRAURs7Sbpm5WkOeNAEubgvT8FKRDzORNrdNeU3DLid9q3cwveEJixGkc9TmL8gC1GQHtrn+kWqQY90cWKQD/52nSrWrZ6fteJXdwYLjPEEjk7pRbY+BivnQ6ThtdjS0vi76/CB40=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6c2d208d22835e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjIhp61sTRlNRhx7xgM0IZICf9Ea48BxK1/OVL7mrWSKMtkYHZeDBuOV3fkEWmCUdz/lvPnR0ldMYNvhHwNq5LTMhZn3vaX4jrRTN5xUYx78aUIa3LMZ+UugFLCetOo/I+67D3I8OSRq96S9TR7vjP9hqCKqFPwuKUZuMolo+Rw7AGReWKsu/Ssf/yTxn7atOrNDWp0aOpE44sSrRZtjtOMJlwZqOL63pl4xr9tX0UOMrAR59yss0vGKnTIyNMfwRdSmcZ+DK3ruxEAtPlS80uzz2BgFTnd54vZgTLVEwfI9/26W46j965OjM9GcoXTdXvqtT1hC97f5Gj8mn5lpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=yzUXt/Gqs28bjIO6M0/X3qZ/21raERDi7GDI7xhSsGg=;
 b=hSq3v9e26erGgEwUb0NLPImQ8TqAPZc4J3nrWY1FHrxKpRpE1MAS213X5MQI6W/vR+aT04t4pWCaj8MSYEqkV4ZaDtLJeZfmabzuBYztemvyni5YduCfZ/SkxNyW++vSCZg4tICpeslVFn/qUZjeq1gqmUyJgNeUWQQFb5mkKdTEjgtKVpSXROMcKzXyzL7b1Cwny6dHS36qXkOj/Ar6EvAEXPBddAWaNQq3cW65LkUgsvFvCP9jTeuUbhIddT5eoUh4m+hiQ2+pnpxcdvePI+EXTeSnzXbcU1USdh1e8EUyR1KEpMWF5SBr2NUOYBhRsdAYkEL+TbjkTfSkiaSZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzUXt/Gqs28bjIO6M0/X3qZ/21raERDi7GDI7xhSsGg=;
 b=nVkALiXt6FKKB37t6txu2AjGXor0TqQuiBYRAURs7Sbpm5WkOeNAEubgvT8FKRDzORNrdNeU3DLid9q3cwveEJixGkc9TmL8gC1GQHtrn+kWqQY90cWKQD/52nSrWrZ6fteJXdwYLjPEEjk7pRbY+BivnQ6ThtdjS0vi76/CB40=
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
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>, <jbeulich@suse.com>
Subject: [PATCH v7 2/7] xen/arm: introduce domain on Static Allocation
Date: Fri, 10 Sep 2021 02:52:10 +0000
Message-ID: <20210910025215.1671073-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910025215.1671073-1-penny.zheng@arm.com>
References: <20210910025215.1671073-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a09e70be-2866-440d-84bc-08d97406134f
X-MS-TrafficTypeDiagnostic: PAXPR08MB7320:|VI1PR08MB3309:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB33097ACE8878E7F194A71984F7D69@VI1PR08MB3309.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZD+CgfeJobLy9gqTgZSbTVW2CSgGgur+Kz69v/oTKp1GwdNEqQyPx8xoRjtNHIQo/oJu99COlDtBRwkVUqzXqosBEEovDRtZ/NIn4Qm73Tq0qi2xZeLNKEa8b96LlfBRH2tYn9yuSD0EGMtURdSoftesjTHfI1m+4JN7HKicvsab5LgJu+10iNhclsk0Qv5atlMN2qfEEdcOjCjFeueHmdUBG4/ZBaB3BB3VzPBsj2yMbYxdMVvV0mEWBR0ZRWBQEl736Hhku6RKW7U3GY39yPEXbJCFbi6Z/L4PE7iQ1lPo2BftdL4VGt+nLoG0pNny41nDCMxb4Nd7ChsomiZmT1wuNY18RKfQ7BomSo4N0OhSTHtfK/8yYozliJKercXEyiW/XOEDHdHHar0sgjT0FOfieomM6VGm0JbyDM5ITOboXe0JZJQ2R2cpVCT0CKo/yf0nIFqzqB1gYUU+MLes8koAeefLsjbUdtb1yvMzMZIMMnBqstQrtDLDYev6D1czbQpvvlY3YcwM0MrgmOv2WcTkq4nOpl9mrKt4cNfzAHmVplTsioAVFhFe/6as9eCLIJ41xpAwPvrUzvt3PLtSuPrVioQ49L/rc3dgix07rIE51DZy5kqTK72ACepjI+oaAN+V9GDHdmHU31Luq6t6hBwE9mxjlzFXfbG1KnBNJsqzvx1A/MZK0Tjek8bAIXm4ZY701F8iitkJPRiH7nDwtHq9wAzKaN4FMHZ4WKoVrXU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(36840700001)(46966006)(36860700001)(36756003)(316002)(110136005)(83380400001)(186003)(47076005)(82310400003)(2616005)(4326008)(70586007)(426003)(70206006)(26005)(5660300002)(478600001)(6666004)(2906002)(86362001)(336012)(82740400003)(81166007)(356005)(54906003)(44832011)(8936002)(8676002)(7696005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7320
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2be9174-2c99-4ace-0a8d-08d974060e08
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P2/wyYznGzsm4nHQEwBb6uXI8CJwGVzwnxBN1lsrOjusHE+6qOsMHZO4dE+i+8C40Mqa5B2NZkGWOsDPUDt5g/GZr8Mmv9tinZlW3BbGjQ251DXHMqOU+fOyHgURj6KTWcbf2VOsl1DWPH9VODiyKhHcTha0451tVX65QIDi/g6KDjQFmFtFYjpPjjhU8LmpTNY0LEmb5OvnOU9cnUzL83FW8J0od4j08hrDHiDLdHIEjcXphqjkVVppLsOj/5orKnaCYiNUEQl9eL5oYQJyGKBsWHuFHg7XluQoyzLWNcS9Vxpg01v7BHNaF3b1rRlG9F4rcLJ5Jc0gy6dvY51PJtMAzafePP6uIOAs+SAF2GqWpaC7Yl3W9ErfEbZpkcTsEgGfExZYSCGBN0ZmlUIkCx9LK/an+KheChYh2HBfqLg6IZlAlZrcn1d/i9LPcqD+pmPEAjx7FIPaKxJSi1EH5t/oMcF4+4XWlI0EyqGdgcQzTgqOSFmeOrRZjksjhuL/Zal9Rm6SXBuANqsrZ6kjYknTLVZg7wqqc4OHyzoqwb4vDbApxtmnQwUuWGTdUWzPCzABX0J3j+sjgBi2mJhsF4VMN2vag7+FX+9S6hpehE0t+1Huq/1bKSR4SPS2CDCWIiSDVWJRFsDbIrl32vgvi8V4zI66/kl0UXkuVVXY65H6uR3SYDaDvomUlmTLphEkgbmRyxvpuUE+29NAwnrkwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(36840700001)(2906002)(2616005)(316002)(83380400001)(478600001)(107886003)(82310400003)(110136005)(186003)(6666004)(44832011)(54906003)(70206006)(70586007)(5660300002)(8936002)(26005)(336012)(86362001)(426003)(4326008)(8676002)(82740400003)(36860700001)(36756003)(1076003)(81166007)(7696005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 02:52:49.1710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a09e70be-2866-440d-84bc-08d97406134f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3309

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.

Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Memory can be statically allocated to a domain using the property "xen,static-
mem" defined in the domain configuration. The number of cells for the address
and the size must be defined using respectively the properties
"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".

The property 'memory' is still needed and should match the amount of memory
given to the guest. Currently, it either comes from static memory or lets Xen
allocate from heap. *Mixing* is not supported.

The static memory will be mapped in the guest at the usual guest memory
addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
xen/include/public/arch-arm.h.

This patch introduces this new `xen,static-mem` feature, and also documents
and parses this new attribute at boot time.

This patch also introduces a new field "bool xen_domain" in "struct membank"
to tell whether the memory bank is reserved as the whole hardware resource,
or bind to a xen domain node, through "xen,static-mem"

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 docs/misc/arm/device-tree/booting.txt | 42 +++++++++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 30 +++++++++++++++++--
 xen/include/asm-arm/setup.h           |  1 +
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5243bc7fd3..44cd9e1a9a 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -268,3 +268,45 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
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
+The property 'memory' is still needed and should match the amount of memory
+given to the guest. Currently, it either comes from static memory or lets Xen
+allocate from heap. *Mixing* is not supported.
+
+The static memory will be mapped in the guest at the usual guest memory
+addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
+xen/include/public/arch-arm.h.
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
+                memory = <0x0 0x80000>;
+                #xen,static-mem-address-cells = <0x1>;
+                #xen,static-mem-size-cells = <0x1>;
+                xen,static-mem = <0x30000000 0x20000000>;
+                ...
+            };
+        };
+    };
+
+This will reserve a 512MB region starting at the host physical address
+0x30000000 to be exclusively used by DomU1.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index b01badda3e..afaa0e249b 100644
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
@@ -97,6 +97,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
             continue;
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
+        mem->bank[mem->nr_banks].xen_domain = xen_domain;
         mem->nr_banks++;
     }
 
@@ -185,7 +186,8 @@ static int __init process_memory_node(const void *fdt, int node,
                                       u32 address_cells, u32 size_cells,
                                       void *data)
 {
-    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells, data);
+    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
+                                   data, false);
 }
 
 static int __init process_reserved_memory_node(const void *fdt, int node,
@@ -339,6 +341,28 @@ static void __init process_chosen_node(const void *fdt, int node,
     add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
 }
 
+static int __init process_domain_node(const void *fdt, int node,
+                                      const char *name,
+                                      u32 address_cells, u32 size_cells)
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
+
+    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
+                                   size_cells, &bootinfo.reserved_mem, true);
+}
+
 static int __init early_scan_node(const void *fdt,
                                   int node, const char *name, int depth,
                                   u32 address_cells, u32 size_cells,
@@ -357,6 +381,8 @@ static int __init early_scan_node(const void *fdt,
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
         process_chosen_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
+        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
 
     if ( rc < 0 )
         printk("fdt: node `%s': parsing failed\n", name);
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index c4b6af6029..95da0b7ab9 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -24,6 +24,7 @@ typedef enum {
 struct membank {
     paddr_t start;
     paddr_t size;
+    bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
 };
 
 struct meminfo {
-- 
2.25.1


