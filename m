Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E05F2EED68
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 07:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63195.112225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxl9h-0002ls-HA; Fri, 08 Jan 2021 06:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63195.112225; Fri, 08 Jan 2021 06:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxl9h-0002lS-DY; Fri, 08 Jan 2021 06:21:49 +0000
Received: by outflank-mailman (input) for mailman id 63195;
 Fri, 08 Jan 2021 06:21:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eC+b=GL=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kxl9g-0002l4-Ji
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 06:21:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 097296ff-4005-4bb6-b023-a80e295e37a0;
 Fri, 08 Jan 2021 06:21:45 +0000 (UTC)
Received: from DB6PR0301CA0065.eurprd03.prod.outlook.com (2603:10a6:4:54::33)
 by VI1PR08MB3789.eurprd08.prod.outlook.com (2603:10a6:803:bd::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:21:43 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::e9) by DB6PR0301CA0065.outlook.office365.com
 (2603:10a6:4:54::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 06:21:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:21:43 +0000
Received: ("Tessian outbound 39646a0fd094:v71");
 Fri, 08 Jan 2021 06:21:43 +0000
Received: from b411f7652e5d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CAAF682F-BAB2-40D1-B5A0-9A23CD0737E3.1; 
 Fri, 08 Jan 2021 06:21:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b411f7652e5d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jan 2021 06:21:37 +0000
Received: from AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) by VI1PR08MB4493.eurprd08.prod.outlook.com
 (2603:10a6:803:ff::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:21:35 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::70) by AM5PR0402CA0023.outlook.office365.com
 (2603:10a6:203:90::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 06:21:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:21:34 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 8 Jan 2021
 06:21:33 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Fri, 8 Jan 2021 06:21:30 +0000
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
X-Inumbo-ID: 097296ff-4005-4bb6-b023-a80e295e37a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gIm3oLkSEmYWGWpCpJZSe0AuabXNVNjjr3yC3vTx3M=;
 b=YpaY5zWPvZ9XWQfwBi7JmYvPq0Kdkm0PjAushrQsdb762WSSzATdN9u1p1TnoVCI03/Yfrsviz4JOwFjPZ4piLdUzz/Yg90iPeptxrKh4Xq6o7MuUJi1XuH4Z8cy4EIaweuewGujKwI6N5iX1YuI08S9Y9MSfE75T64v1iLSH7w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c62b3843d9e087b2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8hFs4gZPmz6gbslF9Y+7y+unQgt6xke5KgAPEGjzazk0HE+lCJuHt+/xX8pH7szPNll3PbfiFILb7JJYJH346ypV2XWUcumT+mqZPLQvtVpxHF+CZD2L+ROjqr0OSkoMdxro/u8U/pwUyJPaBhhZpldmuuqJQW0xy9gEo4vIjj1Nj04SMVCgI8vMFMpZpJv03KwC74OLWC3e6wK+BKIIXNVVcBc7aH7ahwc2welZepXlxkDbss66N7/cUJ1pH6CLxEvERBC+6Yzjf6G4h9sdZxNOWM7Ns8kMWilrbcKyixqgyZ7TEJd1hRA+YBWez7FsVD1L2Ex6XlngmtBQ1G+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gIm3oLkSEmYWGWpCpJZSe0AuabXNVNjjr3yC3vTx3M=;
 b=e5vkRxWODQXQreYS6gTHfau+AAPBh4RSXqaAAD2hYnWtJooetnWB9HTdX/ni1iYLJR/wI1FLTbVRI7puGbX5xBMAmL5qh/OXB3RDigH3BeteN4zebmg/x1azRwtwExDYY7gJYj145hthnkiM74NLD4UTuR+x+04aAGRzKPi0D5sBlnEJQLnaDcd71vm4eZOeUSLOtJB1xYdZGMIsv7vXaUjKWrJOfiWUTMbvXCsDZKtiJcEkDe69Pb3OZ1bJuYSL4ytlNtceCxM3zZpOoH/uB3tiry7CewRBlFd5fsYE+6ucfAh6Tz20mo6U1un/fMkoOxl+gf0QgxOmpnuoZui3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gIm3oLkSEmYWGWpCpJZSe0AuabXNVNjjr3yC3vTx3M=;
 b=YpaY5zWPvZ9XWQfwBi7JmYvPq0Kdkm0PjAushrQsdb762WSSzATdN9u1p1TnoVCI03/Yfrsviz4JOwFjPZ4piLdUzz/Yg90iPeptxrKh4Xq6o7MuUJi1XuH4Z8cy4EIaweuewGujKwI6N5iX1YuI08S9Y9MSfE75T64v1iLSH7w=
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
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Jiamei.Xie@arm.com>,
	<nd@arm.com>
Subject: [PATCH v2 1/2] xen/arm: Correct the coding style of get_cycles
Date: Fri, 8 Jan 2021 14:21:25 +0800
Message-ID: <20210108062126.2335873-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6f6a9ff-4185-4dc9-1060-08d8b39dab1f
X-MS-TrafficTypeDiagnostic: VI1PR08MB4493:|VI1PR08MB3789:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3789524932934381004A7BF29EAE0@VI1PR08MB3789.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 07N2DioM4Snj/j1Yn4beYP6plBRq+2xUED4BgO2IIZYY70PjMkrq3+N3AM8f6qMTtxJcIDL+LPhfunMw5QixuFolPEZ73YGvliSrydqAo2U7ZlbyJ3IgMeJFXAhrlIbGZhnI3NWUY8OcZkFPXhrcl/k3InlKFguVlvIuQNnaTSC+QaxenTXzJsTWs+jG+91H5A3PAHdgb4XT28EcoqVnTARXauxYsLaXvI4Eqx9KOl/q/NruFjTCmPMurZwqDLB3/CPwXroxHb8wZsnaft1isEwDzVmryvI18qMmQGDmLJ0RR2U+qNTUmuWWi6wgs3n0M6WEmkDLLrLsVU22zYZtLsiASrKvHWiP/MN1kBlMTWPn5BoyUJbmWgpqyi6pi9wnJJPmeri7YS/RQ/VPO2mrxmY20UGupZBWIhwVKBcz3tNW4QPHpaeuRoDivu92HXK3xt5H/Cn/J1f3AxwmHNp8+8L6ODcXUBKM2nuujMhukppBDEwqdUbhmeYlRdEOkoQs
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(5660300002)(36756003)(86362001)(7696005)(47076005)(110136005)(54906003)(4326008)(316002)(82740400003)(83380400001)(2616005)(82310400003)(8676002)(34020700004)(70206006)(70586007)(426003)(478600001)(26005)(44832011)(2906002)(186003)(6666004)(336012)(81166007)(1076003)(356005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4493
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee9399ac-6a35-4038-109a-08d8b39da60a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wktm6mEu6BvsK8KQ6UjJOof1NN7g/vnwMPkGnwQqlwS4uU0zpEiRyoUGAJiuaXiN8t9q0QtzpHv44guFGabfu/Gy9r6pKXZkNolhjirX5nB73PJF1LCy9/47e8zQtzWVd/LcEdlozykjRpiGIoqHDD0mCzQJ/Ywx0jKi/sCBetIHvHONUIXi+z6Jg8R55krflnRlfbHqYNWm4Kgku7yiMNpWaeZg3g1KGykSeJlTINBbP/OJosFFtHtZ17D5WJS2uj2EdJ+keo0xn1UHdQABideRXTPjBg7k84OFzGu58HLoKIRGRLGhH9d/BMQ2BxQ+Uac6uO9v/VVEp/ZTVUkjfAjEasMtlOU6zHKDvggB1UymBATFALQinTnZJckWSrYeMH6HmT/HwE+jgMq6oH1ovPOLUXoU5or7zqgtZfyr1HlI/BmQDDt8BoJK5DUH3ZDN79UmPEJGTkewFpNkyj8vxGVBBINgo8T6tT7it6/FAnrgm31RMeQKodqgkYBMjlvV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(2616005)(7696005)(34020700004)(86362001)(82310400003)(5660300002)(47076005)(44832011)(54906003)(70206006)(336012)(82740400003)(81166007)(26005)(186003)(4326008)(8676002)(478600001)(316002)(426003)(36756003)(2906002)(6666004)(83380400001)(110136005)(1076003)(8936002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:21:43.5032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f6a9ff-4185-4dc9-1060-08d8b39dab1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3789

It seems the arm inline function get_cycles has used 8 spaces for
line indent since 2012. This patch correct them to 4 spaces and
remove extra space between function name and bracket.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-arm/time.h | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
index 1b2c13614b..5c4529ebb5 100644
--- a/xen/include/asm-arm/time.h
+++ b/xen/include/asm-arm/time.h
@@ -11,29 +11,29 @@
 
 typedef uint64_t cycles_t;
 
-static inline cycles_t get_cycles (void)
+static inline cycles_t get_cycles(void)
 {
-        isb();
+    isb();
+    /*
+     * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
+     * can return a wrong value when the counter crosses a 32bit boundary.
+     */
+    if ( !check_workaround_858921() )
+        return READ_SYSREG64(CNTPCT_EL0);
+    else
+    {
         /*
-         * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
-         * can return a wrong value when the counter crosses a 32bit boundary.
+         * A recommended workaround for erratum 858921 is to:
+         *  1- Read twice CNTPCT.
+         *  2- Compare bit[32] of the two read values.
+         *      - If bit[32] is different, keep the old value.
+         *      - If bit[32] is the same, keep the new value.
          */
-        if ( !check_workaround_858921() )
-            return READ_SYSREG64(CNTPCT_EL0);
-        else
-        {
-            /*
-             * A recommended workaround for erratum 858921 is to:
-             *  1- Read twice CNTPCT.
-             *  2- Compare bit[32] of the two read values.
-             *      - If bit[32] is different, keep the old value.
-             *      - If bit[32] is the same, keep the new value.
-             */
-            cycles_t old, new;
-            old = READ_SYSREG64(CNTPCT_EL0);
-            new = READ_SYSREG64(CNTPCT_EL0);
-            return (((old ^ new) >> 32) & 1) ? old : new;
-        }
+        cycles_t old, new;
+        old = READ_SYSREG64(CNTPCT_EL0);
+        new = READ_SYSREG64(CNTPCT_EL0);
+        return (((old ^ new) >> 32) & 1) ? old : new;
+    }
 }
 
 /* List of timer's IRQ */
-- 
2.25.1


