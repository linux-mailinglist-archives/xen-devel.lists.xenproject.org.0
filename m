Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BA7415E20
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193970.345600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfT-0008Kz-6r; Thu, 23 Sep 2021 12:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193970.345600; Thu, 23 Sep 2021 12:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfT-0008Hv-1y; Thu, 23 Sep 2021 12:17:35 +0000
Received: by outflank-mailman (input) for mailman id 193970;
 Thu, 23 Sep 2021 12:17:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNX2-0005KP-8o
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:08:52 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ca9c1d0-3899-468a-8635-c1a380dc1cd1;
 Thu, 23 Sep 2021 12:05:06 +0000 (UTC)
Received: from AS8PR04CA0205.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::30)
 by VE1PR08MB4990.eurprd08.prod.outlook.com (2603:10a6:803:112::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:05:04 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::63) by AS8PR04CA0205.outlook.office365.com
 (2603:10a6:20b:2f3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:05:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:05:04 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Thu, 23 Sep 2021 12:05:02 +0000
Received: from 03d3309475cf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D43E9940-4716-47EF-8348-3EBC63C515C1.1; 
 Thu, 23 Sep 2021 12:04:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03d3309475cf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:50 +0000
Received: from AM6P191CA0085.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::26)
 by PA4PR08MB6256.eurprd08.prod.outlook.com (2603:10a6:102:e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:48 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::b7) by AM6P191CA0085.outlook.office365.com
 (2603:10a6:209:8a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:48 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:47 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:31 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:04:30 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:29 +0000
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
X-Inumbo-ID: 8ca9c1d0-3899-468a-8635-c1a380dc1cd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVsq3Ppcw/iW83lpjuNFJbIFMRjYaGc0rT7Th+1FJeA=;
 b=ixk63QG1kWaz3bXLoDY6betbAhNtXdNLlRX8sE+M9juzzsGlDDuSpdyzEo+xnZ0JCI3La2xh2f/rPNvAxE7xMdodMKxpsfbkxbpmKTlxeqlvQqaXE/Y7HOLCcd7xD1tfUfhpd61EibdBWbAgvc+rAg6xFWYXghenk6ev5nhMvbA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 302f1b9d54d65633
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGA3SDr9uzmdia9ASGcsVX8tnaq00WIBwuTPkwakvbClze7wp2Dnq1d4mXMQWU3HBuht7AP+YNnkSIDzlqjneR9xyR44C1y885p3XMy2mB5fCxMhGKHe8oqne+68MqjhbBdiLfADaGIzrFcMIaw48WAvzJ3zPQqFbMHOqPO1M/OKG6Z4XhZHvEo32rIUmwYAS21tAg+KiWfcPmHw6MRw+8QONgyRlyaRj7zcwO8q28/XO7gwRQSR27oysHPKNEPPglJhVuIZss5e3E5VPZxGSFMIwGLf9VZiq8YHgcBOFX09RDtJKm7731vYojbvva3++X8TJENc34bg4HnNvNsEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZVsq3Ppcw/iW83lpjuNFJbIFMRjYaGc0rT7Th+1FJeA=;
 b=b0108p3kECqYWhgw93J6e9EZ0DzYyKmhK5+qUjh7bCd/42AzpvyHwo/hInENPtwZoAKBxI6QmoXJPiwBIE2pBZbKe3v/OEaaymn0qoePTxXXZCiSvyjJYcm12I2fVcce78TdP03oahI/36hgMheHHJ6fRQZ95mlPdaPKhzne8dt4MNxeLLyqb3zYBzZ5Kma8euE+eIIREKuWrwhxb3VKLQcxJnydyaaPsxuhX5bxfsaEYWDmKXNdYzLGAZyaIOMcmSln8ckNkqsO0t7XBJJn66/s1Qx8F71NHFrmqjZ5K6JgFiUqSE/A6AXlxehdldEASTSolrzCuYqhGE3nQvPS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVsq3Ppcw/iW83lpjuNFJbIFMRjYaGc0rT7Th+1FJeA=;
 b=ixk63QG1kWaz3bXLoDY6betbAhNtXdNLlRX8sE+M9juzzsGlDDuSpdyzEo+xnZ0JCI3La2xh2f/rPNvAxE7xMdodMKxpsfbkxbpmKTlxeqlvQqaXE/Y7HOLCcd7xD1tfUfhpd61EibdBWbAgvc+rAg6xFWYXghenk6ev5nhMvbA=
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
Subject: [PATCH 37/37] docs: update numa command line to support Arm
Date: Thu, 23 Sep 2021 20:02:36 +0800
Message-ID: <20210923120236.3692135-38-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 501d9ee5-7f18-417a-1e0e-08d97e8a6097
X-MS-TrafficTypeDiagnostic: PA4PR08MB6256:|VE1PR08MB4990:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB4990145D89D2E6DD8F5FB0509EA39@VE1PR08MB4990.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NyB0pYDfej+Hc1Jtckj9ywjtSegCo4lZBbn+mZQNDgGZviVn3Q+lufG0cJwVJHXjCrlcz1Lq5qTUHGBgzqcnA/OcjcIGe9dNMfC86pxlcV6crfDIiXoFFwxZjJ9I9uumGvzwf4cBFdHQbf7F+tFg1YcafnPibU0ElWC4LNhzTkQvDGP6m39N/0e1V4WVbmHMvSL3i+LpJhlxe+BleVeYj8/98UrTStJTZsbKKE19Z8rUMlyyl7/zBaTjsserkeMvdsYIjHL1ZFUyIxuzedrLfZYEyI0OMkYKVHpgExmN2YWZ92yxoDpnmDb0tnymBwI2/xmxNdAtg7oQG8t43TjzeOQb1xdNHbJ7BW2e5QdeHA7f1q/xklf9nlhuawOFs6ocVH6BuJcp1cZl7uE+kFUl7Eom6/zyPG8ov0qeAQ42VOtwP0ssK+tSZWmZtx8UOAALRpHvluBhUxts0Fs6k/mXvH9X0C1BnTHvhvO4eVJ/2M5LPEeaycGksvL/mbYmP7W/vYWiXzO2XfzviphjjZPv0dytdyj7dWS9p9DE8vMGmDRzy818mudNHwS33/wMPI0aIB2QvJkQOFBq5bWODvA2CeSkjY/13oG1HqpjYZWFOXgrWK9wuvD7t5VvlkI1ifTJ5/Vv0AfMNse63Ln6xVbqXPeJoAIBn5FbBZhge1MvY+ktYRaqxCxjrwoql0ozr0x44IXcc2tHMBUmS/B8AQ+J8+DDX8FjLkJrcxtr/+gqvSU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(1076003)(70586007)(5660300002)(2906002)(86362001)(508600001)(356005)(47076005)(70206006)(110136005)(36860700001)(316002)(2616005)(8936002)(83380400001)(7696005)(8676002)(26005)(186003)(36756003)(6666004)(4744005)(336012)(426003)(82310400003)(4326008)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6256
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a893dde5-7dbb-4cc5-1bd6-08d97e8a56d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xmnnYWr0A8FOmDIH440d/ddiZ1AcHHKqkoxL4qWI5Ax5req0SAefWu7+psjJIvWDkgaN7B9k0kajYDY8t/H+P3s+dTdQDBzMEq0PROM9IuHU35/GiheScg1htyE9B7BcpvkjeIxzT1FPY82eHWwhE6/adBee241R0XAPtTTHbeEZYsNQUDvLiJ7TtlN1tfIKTO8FLtoSYpin72SimSWYdwpRI7/dUut31fb9mqpOJU4mSWi96mIAQ9PaETu8SsG64IiiqzlZr3OAbc5q2J8xdhf8Cu2F09o5d3QA+fV/NpMJj+tXh/a2eG6w2aLiXsJy0CQGnLCMDz+yntumzgQkqSvyFuo/2XIB9Ra45MOr3huaMbVxaAFjl745Eqm2/t00xzY97MgUkvmytT3uOp+QLNn6SaqsCdL/Bt7s476UWaM4YecCxJybG+9rFuqED4VqShzjudNYWpszO837hfeVoAqIdjm8rnVts166Ik3uQuEKbd7qTW8QlGrblqgHftNewz9bKTiquKwVWHQpEyCi7RmnKQ0zJcywhEAcjUgjvlOWgf9DI8Gnt57rDj+eCyOQetag7LT5Vixsb4NVzLH28IjbzaMvl884ITDUU+LALPzXsuH4FjahDh6B+8pgDML+NUFDIFmfxqg44lr/3fIDFizFQHvLywJ0iD3Vt0Su3Cp+jpnTMmzmJNlPqNEe850dGsbkFhx/qtYuGg4F8/GGvQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(508600001)(83380400001)(2616005)(186003)(26005)(426003)(8676002)(6666004)(44832011)(2906002)(36756003)(1076003)(336012)(70206006)(70586007)(7696005)(86362001)(110136005)(316002)(81166007)(8936002)(5660300002)(4744005)(47076005)(82310400003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:05:04.0124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501d9ee5-7f18-417a-1e0e-08d97e8a6097
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4990

Current numa command in documentation is x86 only. Remove
x86 from numa command's arch limitation in this patch.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 docs/misc/xen-command-line.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 177e656f12..4f3f24eb9d 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1785,7 +1785,7 @@ i.e. a limit on the number of guests it is possible to start each having
 assigned a device sharing a common interrupt line.  Accepts values between
 1 and 255.
 
-### numa (x86)
+### numa
 > `= on | off | fake=<integer> | noacpi`
 
 > Default: `on`
-- 
2.25.1


