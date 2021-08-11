Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417BF3E8E92
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165656.302758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQc-0006B0-TK; Wed, 11 Aug 2021 10:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165656.302758; Wed, 11 Aug 2021 10:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQc-00066a-LT; Wed, 11 Aug 2021 10:25:42 +0000
Received: by outflank-mailman (input) for mailman id 165656;
 Wed, 11 Aug 2021 10:25:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQb-0002Qj-F9
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75270a4c-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:25:32 +0000 (UTC)
Received: from DB6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::14) by
 AM6PR08MB4785.eurprd08.prod.outlook.com (2603:10a6:20b:d2::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.19; Wed, 11 Aug 2021 10:25:26 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::8d) by DB6P192CA0004.outlook.office365.com
 (2603:10a6:4:b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:26 +0000
Received: ("Tessian outbound ab45ca2b67bc:v101");
 Wed, 11 Aug 2021 10:25:26 +0000
Received: from 7f71c6e7d59f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52B14470-63A4-42F3-8A67-DF6CC4B489BE.1; 
 Wed, 11 Aug 2021 10:25:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f71c6e7d59f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:19 +0000
Received: from DB6P18901CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::29)
 by DB8PR08MB5018.eurprd08.prod.outlook.com (2603:10a6:10:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:25:17 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::57) by DB6P18901CA0019.outlook.office365.com
 (2603:10a6:4:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:17 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:05 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:04 +0000
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
X-Inumbo-ID: 75270a4c-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADy+xgeVyGznBAi23oXEJ0cpv/hao8FwBoKS3LhfV94=;
 b=mo0fZj35FtwR3/htoEDvlw2SrhHQ5zyZwhSDrLI9wzrfhyqTHOBnA3GuVJ/XMfOQ9x24PTPt6J6f7cWhhxFlzPJGcz547TYouJAXCA8FfOX9tzp5CQOZN7MYFpKlw9+l4ALcfjKlucrmw7BHqmZJkdeEvOGPx4gx7s6yRsMN7B4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36dbf6cfc345242e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItR46e+Tp3oAe3k6Ovqn+0ONCYcrgJvfjAqO9yb0N+sEADUQ3ZKx0OU1MKWhxRw5Lj6gqWdzSUbOPzzY3kB03Wkdl5gqAdFl2yzVtRmUkzPznF93W5dQKdOMY4RNNrR7oVpz9TFK3h/t1+AtW+O9RBDRoMMylUjH2kakzmMyUHecAQ6XVcNFtVPkswe9BdZqfLOclRQAWi62OW+yfBoWFgRTcnB5F6aU1PgJ9mPMPE/oIAugiDzpPgkaV2WBP0HgH37yTE3q2R+ndBivH8YooPbtKp4ZBiLCa5lJjvd6CjvYoGASwX99LyA6WVJU5cNSVl7/q3WULsblwWk3ZRS2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADy+xgeVyGznBAi23oXEJ0cpv/hao8FwBoKS3LhfV94=;
 b=aQv45BfzL3yftAU1OyR5HS40OvD2yw55Qg38HLlWR4dphUMpCoMXnDKwxddIl8y6KaL5WKJ3eWfjLuUqBe1z2tBn5SqQHNKEg6zNZICdmE5WUy/Co6f1MdJyKcqBcr9C5YEdaW+h2xPZs1xxgZRTMCRu/9GkBjUzH3fdLpwRfpuHtLO0H6xdzBg/+7Tc3FaS2OdKLGSiwSS15L8IcOt5YkD+yNVh9eCwEh2BVWRtIthkBYS2iCjpH5TYz0gGb9X/l2jP7fENa9S8DIclPiYzUv6o1r2nld+xm/079tI8Qg3KbZZAka3aeNyY1Zw/zzuyZJ+DWIHdKUlrb5stcn//4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADy+xgeVyGznBAi23oXEJ0cpv/hao8FwBoKS3LhfV94=;
 b=mo0fZj35FtwR3/htoEDvlw2SrhHQ5zyZwhSDrLI9wzrfhyqTHOBnA3GuVJ/XMfOQ9x24PTPt6J6f7cWhhxFlzPJGcz547TYouJAXCA8FfOX9tzp5CQOZN7MYFpKlw9+l4ALcfjKlucrmw7BHqmZJkdeEvOGPx4gx7s6yRsMN7B4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 14/40] xen/arm: set NUMA nodes max number to 64 by default
Date: Wed, 11 Aug 2021 18:23:57 +0800
Message-ID: <20210811102423.28908-15-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d07a97f-7976-4fdc-169a-08d95cb255e3
X-MS-TrafficTypeDiagnostic: DB8PR08MB5018:|AM6PR08MB4785:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB47852AA7AC0417CDB249204B9EF89@AM6PR08MB4785.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YRXEAQ/Lf0UimN46tOYD8IqThje9ugBnlMgdCmuaV01mqjAu6MwMEyrZkHIaIhPCYbGwbcqC2AHXREa+bV4MA1MxdEh8ehpSXwhZjRyoFwQGOEbUtwL81A1EjuiBBm+avsqOJFtgwUbaUwT5e8S44vkIC14Ck0FHPq1u1jPugyPEjSfGk9bEa3nljpjoK76hWQ6VyrI78o8tBoqvLTGL93Rervt892PQ34SokySm/uc91PBJQl0eOtDywUOQUDjKBwirjQoDOOFLF3u5wg2RezZu89vqE0nR2ZTTm8OykP0LWpbea71e0HLy6dtdeehjNyBJcUfiMxeUuRruNdoex8ZpncV6QN/UM5MhDSFYf+8flSu/9p69f7IEP2+6oT8LB8SixB2Hddyo5VK4jCUdlO/oEcFcJ5a7QFt4byNfSoYfJv8sfxRtoEFBCUMGXnC+S56s1ZxKiRBj2doL4lHdvv7YXnaI0kYMP/gH9wal74j4HMBDPj9qKAQtMauHFHbxpOPrHDcfS9B3cZs9JFKw9JGyf6/foRwgN9wSM4JjDSWHLomcka1r8iOUJQCmx+jjZ6+bafqmhHuxpLsJwfZcWLJx1kbIYMGhS8xT8esFA4FZTbpolmmYw02S1mExxoE570vOEOe9LUSPYu+7owPTjdGolDDmv+IG4imLxb+Lk0vR/vA9nnL4GJakSLJNjI439FIXTFBcdAuAPA0kM9w06sD1CIjdg/CfFkvCqVmLcW0za3c0wRV3puPUEPMKf1XKPINONEfuJYHzEzuMjhBZMwHVplrvW5iY3uwTaOrJRIE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(26005)(186003)(1076003)(2906002)(70206006)(70586007)(356005)(7696005)(110136005)(5660300002)(4326008)(81166007)(83380400001)(478600001)(6666004)(82310400003)(316002)(8936002)(82740400003)(4744005)(36756003)(426003)(47076005)(36860700001)(86362001)(336012)(8676002)(44832011)(2616005)(34070700002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5018
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	76f7e428-a6d0-4a74-14c0-08d95cb2509d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cthx+Xdhu2tGj5nbPTFLYbxOe5FiejwLvd61QUYxkCB8XiuUDNiBFwum064tps9Mb396V13/A0GOrwpE9O+B7cXi095YsU+i7UJP/nWpq8Yv9qLc/XMIqO/BO/XzYppU3JBzFjLAbxehCaklNGdjAvsObxrB4ZYF2gav4XM7yXfeL29JSRM6fuZcY2gDq+hgq2nz4B7nCZ5YAYDwucmqTm+Qi8QcQssbBesymJOs7BITxhrQzH8SaK+dkYXAjTS1gLBqcLkC3qN4bCRJ8y86uAlGXdyny0aUauVwzmwhq+eSsqVmtmWdJ+S6Dgj+ir5nr2w8jbCSp7PAEVsewaGMMUb6BJRtbrV44CVCrOd/FTs3L6JIsACJtLl8IaMNLn5VhYAmZ9VLkAFkS4ZRZUiDJAhFZpMLuNZ4Q4IYoee4SSHec3vMj0kBgAUI+89qHmDPsiQaSvIU7BTwoCOPjE25aH5v7ORyBejDvq2NiVbes+POksiYppIn5IJwqmYYbBhykb7wrAeILpOHHysP8tPKqTSMhusKaBrpEbsgsm8jd09xph1u+srVTRq+QJ+NQcrCEMoxPvA3tWCouW3AGI7smaV6UufhRIBkhxPQOntZO0Uf3fYmhdKSzHSxRQ8e84Jj9Va8qBnLTsYHnwSy4Sc8YWQaXbFIt7Rlw/fPryzH6q5MtDIw+TXq9Z8ePpu82VsnA5fUBJeDhO416BeUMNZ2RY40d8yJUXJyOTlGuNSj9is=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(36840700001)(46966006)(2616005)(316002)(4744005)(110136005)(6666004)(70586007)(1076003)(83380400001)(82310400003)(336012)(186003)(36860700001)(47076005)(4326008)(82740400003)(86362001)(81166007)(70206006)(7696005)(8676002)(8936002)(2906002)(36756003)(478600001)(5660300002)(44832011)(26005)(426003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:26.4435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d07a97f-7976-4fdc-169a-08d95cb255e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4785

Today's Arm64 systems can reach or exceed 16 NUMA nodes, so
we set the number to 64 to match with x86.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-arm/numa.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 1162c702df..b2982f9053 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -5,7 +5,15 @@
 
 typedef u8 nodeid_t;
 
-#if !defined(CONFIG_NUMA)
+#if defined(CONFIG_NUMA)
+
+/*
+ * Same as x86, we set the max number of NUMA nodes to 64 and
+ * set the number of NUMA memory block number to 128.
+ */
+#define NODES_SHIFT      6
+
+#else
 
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
-- 
2.25.1


