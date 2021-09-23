Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320CE415DC9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193819.345314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSD-00074r-Qt; Thu, 23 Sep 2021 12:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193819.345314; Thu, 23 Sep 2021 12:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSD-000724-Ly; Thu, 23 Sep 2021 12:03:53 +0000
Received: by outflank-mailman (input) for mailman id 193819;
 Thu, 23 Sep 2021 12:03:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSB-0005KP-UZ
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:03:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1eb32525-e5a8-45c0-aa12-c4acde350d6e;
 Thu, 23 Sep 2021 12:03:45 +0000 (UTC)
Received: from DU2PR04CA0157.eurprd04.prod.outlook.com (2603:10a6:10:2b0::12)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:03:44 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::f4) by DU2PR04CA0157.outlook.office365.com
 (2603:10a6:10:2b0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:43 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Thu, 23 Sep 2021 12:03:42 +0000
Received: from f568312eedc8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95FF0764-608F-409F-816D-B7FE6DA940F1.1; 
 Thu, 23 Sep 2021 12:03:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f568312eedc8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:30 +0000
Received: from DU2PR04CA0230.eurprd04.prod.outlook.com (2603:10a6:10:2b1::25)
 by AM9PR08MB6049.eurprd08.prod.outlook.com (2603:10a6:20b:2de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:29 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::a4) by DU2PR04CA0230.outlook.office365.com
 (2603:10a6:10:2b1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:29 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:28 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:28 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:27 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:26 +0000
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
X-Inumbo-ID: 1eb32525-e5a8-45c0-aa12-c4acde350d6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+me4FoPz33FS1cQ5pOAkpgqjLy+g/9qUY65MaXt3uY=;
 b=rKYjq6WQv1Bgrpg0ZOkOGhWOb67ddyFqeC1zu2pWyTLWaNJgBC9WR13BAixZC/k3tt4rrmZge0AKh3UsV4X/aj9bGuP/EOtW8+SWg2FLoFlz7Xnv1jwt4HgCNQibX4d6SjdPk1EeIh+WmVHhZgAiJ5IplsTit4NlqPXeUEZr7Xk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 585b1ce00a515de2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVNJJfMRr8Ane83w7P6tHN1EJLgkv9HCKHJM5cRUHipLxd8Yj+CUcaz0WZYzKWKAM6cCbZD8jdia51kpvTVDHNBRdGKy+Hc79jp9f4L7LTRdhMrrnHI0RBsIPkljsBX/u0jz35SEVVpcO6e1Ql0lPWKVf3ANwf6S7npYy4s4HZ1aYv9QGGV7yksSryJFyCFW78lIfzcFWoVjXHCDSNqiJZJEj/wYQRcZnOV/390WJRJ5Mz7obLb1JGNyRK2FPxjXYbUlfGGv738s3MrQyIc2GnFr74j6O51eLHeq4Z/R20ltci+yQlkmDQTqW0+ARlvFQq6D5mEhUFvIYgLUzsy+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7+me4FoPz33FS1cQ5pOAkpgqjLy+g/9qUY65MaXt3uY=;
 b=V4D92yE0UjSfZNXmoA/tnwYWl3sAAdUCOCjxx3RhEJ8ZL5NbfEYfZGe38eKtTO3D56Zvg79Kk/w1QYSc8uU9RB1YeI3oEo2buoCSsZ1Zmtr+hWE8356Mgq8kjKb5BFnYCcs3aNE+lR8uH/ET6vs2vPN2w4/lPvsALEFN5ntkm6qdbgbwEy/3ILCVEK5tCZW3aa4cYQR2tcJSwTK+2akoV489CIR2Nz96t1HxmMaKwnapY1qBWfxjKq77OGw0fe3rbrcVvQ7Wp07shqv9NI9v02jx+/+VSP4tOgUMqK46akUx/g3r6NwZI88q4Wix/64f2USZQSF7va0crXpwvRoMcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+me4FoPz33FS1cQ5pOAkpgqjLy+g/9qUY65MaXt3uY=;
 b=rKYjq6WQv1Bgrpg0ZOkOGhWOb67ddyFqeC1zu2pWyTLWaNJgBC9WR13BAixZC/k3tt4rrmZge0AKh3UsV4X/aj9bGuP/EOtW8+SWg2FLoFlz7Xnv1jwt4HgCNQibX4d6SjdPk1EeIh+WmVHhZgAiJ5IplsTit4NlqPXeUEZr7Xk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 09/37] xen/x86: introduce two helpers to access memory hotplug end
Date: Thu, 23 Sep 2021 20:02:08 +0800
Message-ID: <20210923120236.3692135-10-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76cdc768-a892-4049-c2d5-08d97e8a3086
X-MS-TrafficTypeDiagnostic: AM9PR08MB6049:|AM6PR08MB4849:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4849678C6864AE8122FDA8589EA39@AM6PR08MB4849.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RuUUUdBNTw2mQqdB6hKctYEwo7orXlwKISmDAvYkHG0pG/DMP8fazMz0ffjgrqpRVqmdcL4V5XniTIlsDuX4YaUI+XH+Rhj8COl0jqQ96CTm0mYEfiziEn+uw7N8catOFxnub38JZy/zQe2VyjHqRpxEQ7neS3Z1yBmo+WBDQ6pt8xpBVDgOTUpHuZ28vCXp1cRngGS9V9ITr0eTsz1zq0srBjh8t65zL/OjFn8rp5yIW2VfukswBOtxFWMfUAQcR5xvf7DSbx0okWajFkLaj8y7yVlSGTjhFofu49IhyTmeUBAIgaIfh9X7K8/1KDsbvpw/0iptgcbq2VuigbYzVFcITpipa1qwtn9/3xUwjfcByD+8k8c8DviPNjItB5xjAJrozPdbZIqYLcp40F3Ii9CX4hh6zqlN24om2jg5Y2EqSvxTzY92k2iu0g1fOnCArgsBip0Ch8ws9wkGqm9Ph3JVNdMADiqrMOYbV8KAOurv9bBYWlN37O1FJoGxB1H8HRVt7E6bBBmr8qHQ0UANtafxWGyiwQfnV92eH9IGtZS3dsvLxF84ctAkTzEUzhqoAO1DX5zNvDtAedChGHiGjCNqQh0ekGL/q0/1QZaqGWGkztKW2SBtmdhrgRVc32nhmhiKwlIwF+ZFc0rPgAWTPRe/u4cRgslYyuFYOghDzsPC60bKJrmYX1nJPgfomdGw5zlkiQcocZXRjBppz+dA5PlepjYRlXW1mca05NVnXUg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(356005)(508600001)(186003)(2616005)(1076003)(81166007)(8936002)(36756003)(26005)(4326008)(426003)(8676002)(86362001)(336012)(47076005)(83380400001)(44832011)(36860700001)(70586007)(70206006)(7696005)(2906002)(110136005)(82310400003)(316002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6049
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f642fd07-b7f4-4bc2-282f-08d97e8a27e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kL8SGwFY1oL/Yhchkippm4uPktKmc/NMabRtjfKqZRK7yliz0ZQINv9+Mwy7dLmG7mYD8p+QRWei3dTVDN10qWmktis5aygau4kvbV+ZrO3BUkBKmMxR71AfGVE7gAYv1cPlZZF9Msp14mSzJyW1WkNByytHBe/R5ZPAQZPmroRqww/v6HfpAQJDupa05ajRTD/YByAVQQ7pkexOta7r5atpd1AmifJi3nine2z5lLAviPVPlTtV82seqwUVyIa43rOUDNSxn5cIVcjKXj+kDaHJxn237V76bxVrKSYojJfZWC3jFiEcu5sl/4MStRWcmxNGB2qM8GW34RKPoBUR03AXwZgm6pd5sn/wnlrOr9QySVGqSCkJd+OkBrwOzfaq9yyKG0cG2IoX3mhliT+TrE61/QWrVuV145XOzx0Et3CBRJ9V62z1MZZWXhl4nu+Mg0ipNx2FvNIxCjhPdV4F93ANDXb5DvyphIuDBJs9aiLm1/dV1PTk1VSr9lsEfXIVm7Y/t7QJlbl+JR7Jps/ynrHgMu/ooGe1YHk2IHdE123/bwWRPXGA/juRL5YUcrdhb0SDW+rYH8MEv+er+IDmUufjKdjItjqvmxp5M25ccoVCxn5hTfm+nPn3FyO3vjMwRvYB3OTHUIMkEak8VCM7kMh95on8RvPv+dbRbXTbHmqoXILBzm/0OqQHhPmFjA+pZZuidintkCOqnWg3TmtxZQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(1076003)(86362001)(7696005)(36860700001)(2616005)(8936002)(47076005)(186003)(508600001)(81166007)(426003)(83380400001)(336012)(70206006)(70586007)(5660300002)(2906002)(6666004)(44832011)(26005)(316002)(36756003)(82310400003)(110136005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:43.4270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cdc768-a892-4049-c2d5-08d97e8a3086
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849

x86 provides a mem_hotplug to maintain the end of memory hotplug
end address. This variable can be accessed out of mm.c. We want
some code out of mm.c can be reused by other architectures without
memory hotplug ability. So in this patch, we introduce these two
helpers to replace mem_hotplug direct access. This will give the
ability to stub these two API.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-x86/mm.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index cb90527499..af2fc4b0cd 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -475,6 +475,16 @@ static inline int get_page_and_type(struct page_info *page,
 
 extern paddr_t mem_hotplug;
 
+static inline void mem_hotplug_update_boundary(paddr_t end)
+{
+    mem_hotplug = end;
+}
+
+static inline paddr_t mem_hotplug_boundary(void)
+{
+    return mem_hotplug;
+}
+
 /******************************************************************************
  * With shadow pagetables, the different kinds of address start
  * to get get confusing.
-- 
2.25.1


