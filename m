Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD09505089
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 14:24:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307194.522524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQQA-0003xA-LI; Mon, 18 Apr 2022 12:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307194.522524; Mon, 18 Apr 2022 12:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQQA-0003u2-Ej; Mon, 18 Apr 2022 12:23:58 +0000
Received: by outflank-mailman (input) for mailman id 307194;
 Mon, 18 Apr 2022 12:23:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkN/=U4=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ngQQ9-0002c3-0W
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 12:23:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a3a52f4-bf12-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 14:23:56 +0200 (CEST)
Received: from AM6PR0502CA0047.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::24) by VI1PR08MB2702.eurprd08.prod.outlook.com
 (2603:10a6:802:1e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 12:23:51 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::57) by AM6PR0502CA0047.outlook.office365.com
 (2603:10a6:20b:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:51 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Mon, 18 Apr 2022 12:23:51 +0000
Received: from e29f6da64349.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8820953C-0C6B-4FA7-A917-066E529E9D5C.1; 
 Mon, 18 Apr 2022 12:23:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e29f6da64349.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 12:23:44 +0000
Received: from AM6P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::31)
 by DB7PR08MB4603.eurprd08.prod.outlook.com (2603:10a6:10:75::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.19; Mon, 18 Apr
 2022 12:23:40 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::9a) by AM6P195CA0018.outlook.office365.com
 (2603:10a6:209:81::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:40 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:40 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 12:23:38 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Mon, 18
 Apr 2022 12:23:37 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:29 +0000
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
X-Inumbo-ID: 6a3a52f4-bf12-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mDieelJvb1HIU1cidQRUGTfXl8e3DylFrqxsNNPrcs=;
 b=K4W6TSM7Alvw8B7lvq1YytYxHhz0/bzuCRtEbPw61p+RpBd6hmGGH+a4hYw8Bd02S1W2JpdubbwNpFMHY2wnu6D4qhBk9DL6kGgTHH4uorr+jpk8w98s6ldfj9uySK54ypm95+hzLiaEyZzPjT1rJJQnkHt9Z1yInvdZVZ+yqiw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a1646ab449e3623
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIhNxDcOmyaw4juOGJZ/GX+RK+qwmky0FL4/A6z1EaN7HyR0MrwTH2DN2Gut8Gk5Etek4mq+gpKK7Ajh+Qe5My/oQGdyqoYbNz6Gp7ZtTOfi+ET47OMAA9pd324bL34O5SL94qkIdnedaS5Sy09h2rBRDjVXK39Pc39HeJJexQltb75C9XPDdLhIYAGX4WPQbjqQGrQInhe5ntbdIW/VDLkcjchC00BpQAWGM0FuXNqHP/jTM7ZxCKdzr7s6jcqJ0R5n3nB3WoS1TPqzvMnrsWQvfzdwToIJm9gqDG0dpqmmJLcxZ/oinoHUw/NplfTGWYe4NwE65Q96Ayp9GHnxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mDieelJvb1HIU1cidQRUGTfXl8e3DylFrqxsNNPrcs=;
 b=b5ro8J7WQdbIDk9HVRgCQeZT4U6pwfxcKrAhEhf+cCg2ZAcuxpOdShABEMdAebwINiO1TJcURBBTLmEvZNuEwu0OJUpnuYGCSEQA5v6R3ar335wO641FqJaWDoNVjntVwTY/NHHaIvPxVqg0JoRM1/nRUHLa8jeN3YS7thnJPAJQtM2BdOQJIr/N0ptRbvXfzeL8XInglWeJOvyQ83k5ldJyVEm8t4f6Maz2IaQbOiRTmsnXsi1aDSt+z0xs01J1q0q8lhls9j7/W5x4NvSIGgLsP3oL9Yl5jZxEC4c8jxeeqw60/oW9Cmfj3VaCwuLKNnJ420VMrWABC/IKw15TEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mDieelJvb1HIU1cidQRUGTfXl8e3DylFrqxsNNPrcs=;
 b=K4W6TSM7Alvw8B7lvq1YytYxHhz0/bzuCRtEbPw61p+RpBd6hmGGH+a4hYw8Bd02S1W2JpdubbwNpFMHY2wnu6D4qhBk9DL6kGgTHH4uorr+jpk8w98s6ldfj9uySK54ypm95+hzLiaEyZzPjT1rJJQnkHt9Z1yInvdZVZ+yqiw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 4/6] xen/arm: introduce CDF_staticmem
Date: Mon, 18 Apr 2022 20:22:49 +0800
Message-ID: <20220418122251.3583049-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418122251.3583049-1-Penny.Zheng@arm.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 44f5ffe0-a21d-4559-9e64-08da21364c28
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB4603:EE_|AM5EUR03FT024:EE_|VI1PR08MB2702:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB2702005C6A0F34902ED78511F7F39@VI1PR08MB2702.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1U7j5DI8E7i8W8LYObBaBcllMn07c/OAXFKyEWrUqp/yQOZkAfB1oGK9fiLnmLxUKlxjJwFf7t1n3ZkZcezdUEcWiCgug5z9N74WJBFRmyP40WLi+RF3EOrZugxCwRRbo3hx3fGRT/rFr9TnwBNjJWWfZbuLB3AtV+HMM7AvtrX/UvhOLCGHzBDmRXriSLPGw3st/Xavw/lokY5cv1l6Jr6YtTRjLV7NiuSpp8K4nlbTTM0tVgw+ry0HWupE8Uht63pULPQyC+GHs8e9U0Cxx4IP3h7qaVYDgfoAh9qTGHbQCI5XrfKLRIePJcqNelOCxLApk95IAcPEqbA8104PQ7+pf/qgctGje+4FLuhhdGd+8b7bvnck+qfQ2SvCXdS2FXINwljV5eG1LQwJEYuyb1hrp9Uy0ProogutF5z8o1sevxrhkk0SeWhVjNntCUSzOIiRxyZ9GybyP/farRiGyHOhrzaBqOwVRTa6EMsN+MnPOPMdYuMUjoaWdLM7UaRsxgNfE/LrGEhDbpfWQ1cudcRXamg8c1HabeQ1SOTl2BscKJ5Vh7J9N0t7GcQ/h6hJvg/xU6BnLq3DbCB5XOdCJ0/GVYJ0NCHlKcRrGMeNdXqfgpcBP22D3D9p+62GvSi/J+371XqRdp1/k0TeIKaGAGw/DLdFrsZduW91clMDnpXYkS8ErA5l4LDgMsIOWVYu
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(508600001)(83380400001)(8936002)(2616005)(2906002)(186003)(4326008)(8676002)(1076003)(70206006)(36756003)(70586007)(86362001)(6916009)(5660300002)(54906003)(81166007)(316002)(7696005)(26005)(6666004)(36860700001)(82310400005)(47076005)(426003)(336012)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4603
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9742ef45-520a-4323-45ca-08da2136454f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cUK60Wv/Pa/9zpmPFYA9v4iGO4FAgdlJwb1oEbksgx4gbkgrze7GBqHLeg6lwht/z5pQZizPZcumxvwMItegwg0QM6nKM/2ke/JZiVpQN3ClHDm66V++ONgG97Ep2rCbN78Fw4vFBHVOTKWgMCILbGsKxrpBI0S0BWucPlzT+/Bvfo/Xth4aoCQbGnjz4IbuyOBPPlKqtIXx4VTVIo+CcANWJuLsqSNKUs5BhzuJkAolNp0jJSkMk07D99nJVg1VyFvWdXaXjJ1QuzUsYWMgQ/nQ3wYEUdLcKBk+8rW2luWunUmYjVpU0+CxW9pK8g1FU/jtlbpsRGyYwLrPLB9rBXL+qcxbASIL8mrv7jwBo2um2SHDhhf2Sf0qHGBeRTJacoP4eHceosOMM6RPohULK9x8x1bMqPrjbUM737/Tkoncp5SdZP4de7khVoSriUQDqV6q8vEC6IXY5cToMuflZsZIt3a4skO8NeDxfR0ag9DEkpqtDqJQ2GCAnlzMUW81XRaSlzx2XjyO5mp7z9zaL6c3EtUCfM6tfdWJn0ep80KcnZrpoRBUj42C/6VB6EQ7WrhRZriojoHI5N1Iy17nsL553SVRn5OhTDvbhrLK2WlpXS0XmzL+UCd2hyssTCDnpGJNWLgR59nGhDzFMjeHVA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(2906002)(47076005)(186003)(2616005)(8936002)(86362001)(6666004)(7696005)(83380400001)(508600001)(26005)(1076003)(336012)(426003)(4326008)(36756003)(36860700001)(70206006)(70586007)(5660300002)(316002)(8676002)(81166007)(82310400005)(54906003)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 12:23:51.5402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f5ffe0-a21d-4559-9e64-08da21364c28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702

In order to have an easy and quick way to find out whether this domain memory
is statically configured, this commit introduces a new flag CDF_staticmem and a
new helper is_domain_static to tell.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- change name from "is_domain_on_static_allocation" to "is_domain_static()"
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
index 36ec00e62d..b097433f9f 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,8 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) ((d)->flags & CDF_directmap)
 
+#define is_domain_static(d) ((d)->flags & CDF_staticmem)
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


