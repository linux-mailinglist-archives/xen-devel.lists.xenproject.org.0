Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C05A39D311
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137538.254881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FB-0003yp-TO; Mon, 07 Jun 2021 02:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137538.254881; Mon, 07 Jun 2021 02:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FB-0003vz-PE; Mon, 07 Jun 2021 02:44:01 +0000
Received: by outflank-mailman (input) for mailman id 137538;
 Mon, 07 Jun 2021 02:44:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5FB-0003IQ-1f
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:44:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e62f02ba-88a0-4b92-9ede-1c653ad2ce13;
 Mon, 07 Jun 2021 02:43:56 +0000 (UTC)
Received: from AM5PR0101CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::37) by AM6PR08MB3878.eurprd08.prod.outlook.com
 (2603:10a6:20b:8b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 02:43:54 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::ed) by AM5PR0101CA0024.outlook.office365.com
 (2603:10a6:206:16::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:53 +0000
Received: ("Tessian outbound bf434e582664:v93");
 Mon, 07 Jun 2021 02:43:53 +0000
Received: from a622a86e5caa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D36962D-F638-467F-B7D3-5FAE4E9318DC.1; 
 Mon, 07 Jun 2021 02:43:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a622a86e5caa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:43:46 +0000
Received: from DB6PR0601CA0035.eurprd06.prod.outlook.com (2603:10a6:4:17::21)
 by DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 02:43:44 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::e5) by DB6PR0601CA0035.outlook.office365.com
 (2603:10a6:4:17::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:44 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:44 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:43:43 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:41 +0000
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
X-Inumbo-ID: e62f02ba-88a0-4b92-9ede-1c653ad2ce13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oM5iiW6n6qyxMv8aSjmUSUvQgcdsVFFxcjsWYlu1N4=;
 b=a/yA+w7oQl3DWt4LH5LvZezJTRI88SIvm051IVTo4/epBsxsQgKkarXVCH0KFZGbHwalKXJbkeUuROKIlPZPxiOTeVhKzVHwK+4SweuZUF9ehV+k2m5sQR81/rZIKEcdp6tOo5IDxo/TpLsT5yjTOLuuGFK215upjxbXqoQSiTY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17c4e3fb51055c7c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0Z+rh36tSswXq3WjIP5LefuUHKZGA/8lGB4QyEtw4mjflMlSmv6sfwvcTBr/H12YBy5HEmR53vzq2ZUM3Z5LLCZ5KhnW52bekQD06wldFUiCJN1RsGwg508tYgLvJqrflghAPYEsJp+qKmVC6a70rmK07tfooZ7r3oTK3LJ4zeDxh5D7pGsOQbPM+YIwSFE7I6Vcs5a2ZXjv9VoC6ut/BczJY6En/sylPna4OneH55Ipt4fkaxE0U7q0I8wXgyWEF+XNlK7fjegpucq0aHUkK2xOxInSb7QNqdTnOp4rQXgWgZDDabEzPMU7yFllKyN8Bqf2MLxqFzj4HUKZghcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oM5iiW6n6qyxMv8aSjmUSUvQgcdsVFFxcjsWYlu1N4=;
 b=XPQFYD1b6BoJip5Q5CrYg95em3XmCzvSh4ZFL4gxZV5t45+VjHyY2nWlzvEQFdwZ4/Mz27xxk3aL10/gcj8YUojYSC5zpOKlz7ssIPk9TOcPR/iGIzJq3GzGMlO1XDN9z8HSsf7Gs2MhNluJBNj+ozrjTUYinnlE2ANjQQUE6/bBB0AN0imdQhzEzLsjSL1RgnuSnbVuHJqpnlpXll4U2uNnZ5oTpYkUHk7/yrUU0yejmFV4QEDRFSfNXQ/HtddxTz4E8cMSL9u0Dov/EEB5JO8ZbuZyFanq/zVA6CTJ2WZDiFVTnFqkFb5Xf/Sf1SjVg8dXNNn59JxaiBExMRlrkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oM5iiW6n6qyxMv8aSjmUSUvQgcdsVFFxcjsWYlu1N4=;
 b=a/yA+w7oQl3DWt4LH5LvZezJTRI88SIvm051IVTo4/epBsxsQgKkarXVCH0KFZGbHwalKXJbkeUuROKIlPZPxiOTeVhKzVHwK+4SweuZUF9ehV+k2m5sQR81/rZIKEcdp6tOo5IDxo/TpLsT5yjTOLuuGFK215upjxbXqoQSiTY=
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
Subject: [PATCH 3/9] xen/arm: introduce CONFIG_STATIC_ALLOCATION
Date: Mon, 7 Jun 2021 02:43:12 +0000
Message-ID: <20210607024318.3988467-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607024318.3988467-1-penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40525657-4722-41d8-d4c6-08d9295e16e6
X-MS-TrafficTypeDiagnostic: DB9PR08MB6857:|AM6PR08MB3878:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB38789D2AA6F6002AEEBF78F7F7389@AM6PR08MB3878.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:348;OLM:348;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O7qhMxvRfGcbsbx5+7sohuD+Lx4RCcWRgE8G2euMwTo/QcLP/RkLdjIp5aJ+6BCEnwayHWUhtPXNXqLLF7DMFnNuhvf5XAJRCZEg4aMvvpIbzjBSRqy7cQY5I099P9NKDGVH4dFfBBoDKt6VhJJvxrLs7rRBPraKZPPzaMsL9XSKb+iG80PaYhcwIwXVq95W/3RDVCHMWp32FoEFlVbXEwbR10dp3w3YMAtLZKC74XBPgbgPxosOOt6ktT/6LyEtChZxhXMGqv1IRncfjqMyCu0IWCRyqxMC9FHbou2QGqBlHAzgVIjqGpot2qeMKWeA9GmdoF4c+scKQ5S8yCF+0eAKrTZNrDs5/PzpLo124V8Lj4zx2AYInhDL+wWbxM5PQvQYEM1wg2HnRz5kWnSlSlySLzD7Uc9xRglcpC1Rt1Nw/39fwJegl4Hc2N9O8XJ/xBm2mE6wjJlzAokxQFVoyhDOkGYUxjnkSTCNIe9zin1cp37H+PLBuF3vZtI7CJAfqq6W4/tge8Nvhx3tTs2eQwE07eiFJt+N+pGjg48u0Bl37iN8tkQ0bTk7M5QqLEE6usnYJoFLKL0LcuGM1X+YHANcDp5n2Ebtc0LH+mMeVbOrF97ARh6YYdHFkETCDT/tK+xHYDdXsYc0pq9i8xG3HH4ACf7HFWxVwVfqJaNDSaYPH0eXq9fe8/JjuOJuHbjeermHfUlrpAOik5rK971TRg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(36840700001)(336012)(4744005)(478600001)(7696005)(86362001)(186003)(4326008)(44832011)(36860700001)(356005)(54906003)(1076003)(26005)(36756003)(2616005)(70586007)(70206006)(426003)(47076005)(82310400003)(82740400003)(6666004)(81166007)(8936002)(8676002)(110136005)(2906002)(316002)(5660300002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6857
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be6afcbc-5bf2-476d-361c-08d9295e1188
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+f37c69d9C9HMxXkDUEO1AqdJBgnYekDM65yyvyv8ebEQydVsSkFZyo9W2zRVCJ1n9ExMP4qoE/grFSbNlzu4VN+XOpHoT+e+F+NqkXAGk2A67JRYE+YjPvIelUr5SD8mXz2u4rVHmzaB4Ei12Y4Ht1DSxGN0ni6NFQAfd1uOipBSx5RSuNnSQbTa9osURKclLXSXxVi+3T9gbsSWAKeMGwYAF1HKdvcQTPaETzqQkIuaHgW0FVpKMrPczrQ+SimSr0rd9cGp6BfDwxorA1C7gSL6zECiRd5OiUjtnp+o85QcQV0NfJ0WFSc6FrngwykIot0G/i7jX6VQQkF0T1ctkDFYA+aW+g6tMpcXfOGXg3jFdVTkv1mUu9K5iSo1961VpM2DYsR7FmnYIcwPZFJSQJet8i6VEQ5r/gT+bztjpEv/Hi+ryOy6eAUWXIa7SNRhshmPLdxU0bZQNNxTLjiTjBDxlR+lHfnjMCLpSuJU2DIiHiJjhmcxiQJkPDwA0EgyXIg5DIXCscpFpk3oGtO+Gyuk4o5zI+7L/XzfjSkNg9bTkMQLXpKEaxgJKAJN8i32uaami/GEfrEbvdZbZ2FyPDuvbdivjAZu605KV3h2vqkVFXIiZ2EvOum661EgZ6ExOBt157MNhdRATx4rB69i+SwkwlUkqlMJO2cVPdRRrCmJ8es+n/Nqop6X3IRCja2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966006)(36840700001)(8676002)(82740400003)(36756003)(110136005)(478600001)(6666004)(5660300002)(2906002)(8936002)(316002)(4326008)(54906003)(70206006)(86362001)(36860700001)(70586007)(426003)(336012)(47076005)(2616005)(7696005)(82310400003)(44832011)(81166007)(1076003)(26005)(186003)(4744005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:43:53.6967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40525657-4722-41d8-d4c6-08d9295e16e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3878

For now, since the feature of Domain on Static Allocation is only supported
on ARM Architecture, this commit introduces new CONFIG_STATIC_ALLOCATION to
avoid bringing dead codes in other archs.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
changes v2:
- new commit
---
 xen/arch/arm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..f165db8ecd 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -278,6 +278,9 @@ config ARM64_ERRATUM_1286807
 
 	  If unsure, say Y.
 
+config STATIC_ALLOCATION
+    def_bool y
+
 endmenu
 
 config ARM64_HARDEN_BRANCH_PREDICTOR
-- 
2.25.1


