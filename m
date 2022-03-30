Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E4C4EBDC0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296119.504032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUll-0000PM-0F; Wed, 30 Mar 2022 09:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296119.504032; Wed, 30 Mar 2022 09:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUlk-0000NX-TQ; Wed, 30 Mar 2022 09:37:36 +0000
Received: by outflank-mailman (input) for mailman id 296119;
 Wed, 30 Mar 2022 09:37:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u124=UJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZUlj-0000Fm-35
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:37:35 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 061e665d-b00d-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 11:37:33 +0200 (CEST)
Received: from DU2P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::12)
 by AM4PR0802MB2211.eurprd08.prod.outlook.com (2603:10a6:200:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Wed, 30 Mar
 2022 09:37:26 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::87) by DU2P250CA0007.outlook.office365.com
 (2603:10a6:10:231::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:37:26 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Wed, 30 Mar 2022 09:37:26 +0000
Received: from ab1cb7758456.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF3A45DD-2CBE-47D9-9F06-2B0A9C3837B1.1; 
 Wed, 30 Mar 2022 09:37:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ab1cb7758456.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Mar 2022 09:37:18 +0000
Received: from AM6P194CA0102.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::43)
 by AM0PR08MB3954.eurprd08.prod.outlook.com (2603:10a6:208:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Wed, 30 Mar
 2022 09:37:16 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::c) by AM6P194CA0102.outlook.office365.com
 (2603:10a6:209:8f::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:16 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:37:16 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 30 Mar
 2022 09:37:11 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:02 +0000
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
X-Inumbo-ID: 061e665d-b00d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLwBeL3HiizwBwJEJZAokUo9XslH5YOwT1NuUQp5TDI=;
 b=OEyDjSp4hWDbIZaBatyhohvFRxs7CXrAqk0iHzScj/Ud58VLP0uW7JuP+QzKS12P+4kLseGgov3haNaI/3gT68aYr5ckeC1hzyITaWE6P8rgdoOHCH3s1rPFfCH781T+PZMhRPy9z3Sl47c2ny+Yq69K+SuojA4+YmLxsXgxDKE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6eb2069c4d4ff3f8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7PNs4ZzMXRQJ9bJjdia+W14BqFGHrVigoIxELq6ATVcMmirBrgZte7WwDSa8wdyQCc5JQ0MnmgUJfPw3tBrCnmv8Es5R+U98jYFs8KYT8vNlm7+0W9rB0MQ6OzYK5tGDmRDl54UkJKUWwhnv8CPCqmfAjYqriFs6sTeXTxOU3OR726DSnsQWCoMFuKlTE4Qae35ld8vGjjXQEs1Nus5xnCs5C/Jufr6nHzR8WKCkmN9MaYHAn2bQ0lqB2r++X9hjtclv9+Y/793LfKXr5ZFv00c7Rsyvj3BzKKnpmq/I6v7Ro22+RTuraXPvNXkJbhUSnbTqY2wqllNhmQc8W58ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLwBeL3HiizwBwJEJZAokUo9XslH5YOwT1NuUQp5TDI=;
 b=CgMJDWamaw0cXv6Nhc5aO+jPUEdJ685nDeR8cEvuhV3ZloDsxAW5zPAyk3UfQVp6YAswzEhJxsOOVtRiS5a0TFLVP3kTM3rvg3wlYRaAJQ61irbkhL4phR3l1fO8P4svn7efkTAS8UcT/wdwrCdFFlmLL4dZne+mHkfISnRGiknHuX/ECT17U/tCLogLMBq3tnAif6jp0TVCskO798sFSm8STw5kNMLDhIld5JK2vgrLnSn9MIAcbIKdi2NnPl26LE8TO7XKsEOPQNHfeBImgQg2LqljmWtn0Chnf2RfSAxgy9jJRqFU+il0KsCPXyqx7jhtfB/wpNpnbHK4PfhInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLwBeL3HiizwBwJEJZAokUo9XslH5YOwT1NuUQp5TDI=;
 b=OEyDjSp4hWDbIZaBatyhohvFRxs7CXrAqk0iHzScj/Ud58VLP0uW7JuP+QzKS12P+4kLseGgov3haNaI/3gT68aYr5ckeC1hzyITaWE6P8rgdoOHCH3s1rPFfCH781T+PZMhRPy9z3Sl47c2ny+Yq69K+SuojA4+YmLxsXgxDKE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Penny Zheng
	<penny.zheng@arm.com>
Subject: [PATCH v1 2/5] xen/arm: introduce CDF_staticmem
Date: Wed, 30 Mar 2022 17:36:14 +0800
Message-ID: <20220330093617.3870589-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330093617.3870589-1-Penny.Zheng@arm.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 5eb5d2db-237b-4de9-94e9-08da1230e692
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3954:EE_|DB5EUR03FT012:EE_|AM4PR0802MB2211:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB22110E55626178685F4E568AF71F9@AM4PR0802MB2211.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 juvwHx/nEsNO3LUftiuwVqiC2l0LZVqwyYGqRE0StsDmbrrDpF509vkEo/WZpEKRqk7BR8epJ1QxkS41YBMTlrSQ3xZwtQG9/Ca5ttxPEKLAGdCCUSjOIOxdUShgWvtMJnfqHwOF7D0Ajpf/01u2KKcC3neZ1WduDIjWqWo2i/kp1pRClHq0aWgHTd0ev7qlwJvx4uoDPjVijC/UbKBFdrjCqYSkWoewltwoL6Td5pnzSB+o0+2ZRnXSXd2+mEX+9kO3S15qG9fSpvpP7648puTInIRre07SeA9mJ/1c33zA1cYQ5uu0qaw1OEhUK29H00BT7DYfUGustDX5XYmDY/nxUJlmSsYBlRIE81CrztqUDu6ESPYZ33iByYt19XOSJhNR+me+89qNzDsb6R9KLxWz/oMqgz7NXvknjvT4POxBkPojIqPzXWlGUSeFCBeO9CVbHn1lRCuOU0FaQWFerekw5dSd76lXyMdAUVxBdEQ9QxT7mm8ADt1HgyiZ5AzeZYWu5ChUvBnC35CrUjK9J2D0wslwSlUnqiNO3GmY4C0nbvw92uP/OeSPJe7PUh5yYBqkQRCuRH+CngxEK53FdewRLw/4H5Cn5FZXHQToBcky3KqKYctUTSX+E7gos+yYvz0zaRGpS5TbCwn//2fybyuY8VdJhKwVE490Rf2jjOEXGVZTooyVakw3HKvcuYqr9gf9kYIOT8dA2EfxjXp8gg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(81166007)(2906002)(70206006)(5660300002)(356005)(2616005)(82310400004)(40460700003)(83380400001)(70586007)(316002)(4326008)(1076003)(8936002)(54906003)(426003)(36860700001)(36756003)(7696005)(336012)(86362001)(47076005)(6916009)(8676002)(508600001)(26005)(6666004)(186003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3954
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c474861f-45dc-4cce-8d35-08da1230e099
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lkpOzXx+E9lBXxUjIwa6bzJeihYOSSiyAyaQMtf08db6gvVWAfO8hMq1CnOQpbOglujA1lNR8rRaMGUodKdCLIEHPcuLjpetLhqfDA3Ry9Aoo9RwTt50H7sLWFcDHaB0W52zS8jE2aIH3QyKJkQEFOIeyuzzJ52EKZXd8aaxnzBxkEhkG/cmF3SbiiqAQV2F3vTrEJNSDOqsX29quXL6h9gXuYscZzrsKt8KSTntpoMGFTpmjf87MvDJlDRmoYNl428AP22FRKx7SNlMlIaQCsDSPJFk3xCkDXG5UkMONn8dZanyqbAFm7KRsFhaj8YmO4wM7VCEfsFaV16cBN27MVBLnTrQSIrArmfqPZI2Og4WyNcDRtRmIbzqLWL80514pDYs7SEwKW03KVgeKWunVJeSXS1iq12Ohuz/jczP7RmVgPozJ/GYhGJ5U2lqgkqBVsmm02fi0OXxX7zyol1rTw8VUml9f7EWn6N+u+ln7rTgIeQf+d8ccxnfIawL7v9C3D6Ijwq9pvvnOa/D/hbdAdgBUWujqYScUOEiEHfpO8CUq7x2z9fDUQqDjeRivJTq6TzTuVpNNd1P2P8ULXIXOrVzejACHVgy3aj3dt6mjeX1iLD4AVTPq5NDos7ZTVp1ddUoJ94c2CZTVRHmZ89qztCAL3LyBGwh908RasQ2fC01OMgIePkwFC+8dF0ft2nK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(86362001)(6666004)(8936002)(4326008)(47076005)(5660300002)(508600001)(8676002)(81166007)(70206006)(70586007)(7696005)(426003)(36860700001)(1076003)(316002)(54906003)(6916009)(82310400004)(2906002)(336012)(186003)(26005)(40460700003)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:37:26.2442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb5d2db-237b-4de9-94e9-08da1230e692
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2211

In order to have an easy and quick way to find out whether this domain is
on static allocation, this commit introduces a new flag CDF_staticmem and a
new helper is_domain_on_static_allocation.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c       | 5 ++++-
 xen/arch/arm/include/asm/domain.h | 2 ++
 xen/include/xen/domain.h          | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8be01678de..4e62fd0bf1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3191,9 +3191,12 @@ void __init create_domUs(void)
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
 
+        if ( dt_find_property(node, "xen,static-mem", NULL) )
+            flags |= CDF_staticmem;
+
         if ( dt_property_read_bool(node, "direct-map") )
         {
-            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !dt_find_property(node, "xen,static-mem", NULL) )
+            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !(flags & CDF_staticmem) )
                 panic("direct-map is not valid for domain %s without static allocation.\n",
                       dt_node_name(node));
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 95fef29111..4379f20a12 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,8 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) (((d)->arch.flags) & CDF_directmap)
 
+#define is_domain_on_static_allocation(d) (((d)->arch.flags) & CDF_staticmem)
+
 /*
  * Is the domain using the host memory layout?
  *
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 1c3c88a14d..35dc7143a4 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -34,6 +34,8 @@ void arch_get_domain_info(const struct domain *d,
 #ifdef CONFIG_ARM
 /* Should domain memory be directly mapped? */
 #define CDF_directmap            (1U << 1)
+/* Is domain memory on static allocation? */
+#define CDF_staticmem            (1U << 2)
 #endif
 
 /*
-- 
2.25.1


