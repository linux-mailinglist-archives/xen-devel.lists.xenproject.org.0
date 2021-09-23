Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB4415E1A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193950.345578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfF-0006vp-DO; Thu, 23 Sep 2021 12:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193950.345578; Thu, 23 Sep 2021 12:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfF-0006tB-8P; Thu, 23 Sep 2021 12:17:21 +0000
Received: by outflank-mailman (input) for mailman id 193950;
 Thu, 23 Sep 2021 12:17:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNW9-0005KP-6q
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:07:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09719c9d-0cd5-4463-94da-71b36f3bfc83;
 Thu, 23 Sep 2021 12:04:35 +0000 (UTC)
Received: from AS8PR04CA0191.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::16)
 by DB6PR0801MB1800.eurprd08.prod.outlook.com (2603:10a6:4:38::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 12:04:33 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::8a) by AS8PR04CA0191.outlook.office365.com
 (2603:10a6:20b:2f3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:33 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Thu, 23 Sep 2021 12:04:33 +0000
Received: from ef915eeccf5d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD7BA721-1AE9-4FA1-BC79-24EB200E25CE.1; 
 Thu, 23 Sep 2021 12:04:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef915eeccf5d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:20 +0000
Received: from AS9PR06CA0094.eurprd06.prod.outlook.com (2603:10a6:20b:465::7)
 by AM6PR08MB5045.eurprd08.prod.outlook.com (2603:10a6:20b:e4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:04:17 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::cf) by AS9PR06CA0094.outlook.office365.com
 (2603:10a6:20b:465::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:17 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:04 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:02 +0000
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
X-Inumbo-ID: 09719c9d-0cd5-4463-94da-71b36f3bfc83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bv/kyQCgDxJAB2ngKdqERIdGChRlUtb76o5kiaGFJyA=;
 b=8tVQGWrAjiDKX7u7KJroWaNvSMZkrVTT1RF7UmWLOvTMaMIACQW8nRvJNoTu7xhsngpM35RQ53wzsyGu8AiiMMHWQyxaxKxOrdMUs/lOSjT9BrqpvEjc/dc1PVmGjEdg60rE9Bi1jlQ6RPvre47Tq+aFae0PM7Spn2//ykCIPSs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd2f19f131e286cb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgBOSq28pwyt6AIc/9cb/+Yiwc51u+QucM/hlhLHFzvwPBlukFtEwJ/j+Pw0M2OCILVOMfiT4oTL0tePlEIZQ9v2IiJFwnJkcWTXZW5oa7/MaOTbHhXboJQFSXoHUAicp4kcsqfJ25N2zAgdDI/bdTps9tSok907mH+iuhOKk2Q3QwEl3xA5sTTlRgZmPbMzXs8kskTfJyLUPmGSW5PrNyyigyqNPfwL/ANqF1rN4KN3pQm2Jqh0t1je0QRleKcKTgWnmvgyymO/wXjzZn5IWJJzu6PRJUseQP8+nEw7nk/oewhSPdd46Eq59P5/qChALveqejTm0+k1cFmOIc9v5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bv/kyQCgDxJAB2ngKdqERIdGChRlUtb76o5kiaGFJyA=;
 b=A4zyZLqf8yfFmidpoKTLZwN8XlrxQQluSLGbaFY2q0bHNKjBsPSlp15UiM6bUi7dr35WRgd9Pssh4vGNE0v8cZuZ7vcKtitkw/z+vzhbE67BLxTWL8LBB0iQLa9+JsQVeAEYhOVksfZ1co2Vkh3GEcmfoY4t9GHZqCYp8NEDFESsYmVKvlURSsiRAJfC6Fxwc63qxL13Oe0xDoKvhoqdHQCjYi5RYoYPET+ZcJKwgEJAGtXTpbllBFlowBHyulpV07jmbmw/SbqrCO/fro1reItDJ9stRNKVO/eLtyUSQjj6p6kczQaysjOSFYRoXD9lcWGvnBZVs93TRjCg9MGDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bv/kyQCgDxJAB2ngKdqERIdGChRlUtb76o5kiaGFJyA=;
 b=8tVQGWrAjiDKX7u7KJroWaNvSMZkrVTT1RF7UmWLOvTMaMIACQW8nRvJNoTu7xhsngpM35RQ53wzsyGu8AiiMMHWQyxaxKxOrdMUs/lOSjT9BrqpvEjc/dc1PVmGjEdg60rE9Bi1jlQ6RPvre47Tq+aFae0PM7Spn2//ykCIPSs=
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
Subject: [PATCH 25/37] xen/arm: implement bad_srat for Arm NUMA initialization
Date: Thu, 23 Sep 2021 20:02:24 +0800
Message-ID: <20210923120236.3692135-26-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17e2335d-43fc-4a59-bb9e-08d97e8a4e8d
X-MS-TrafficTypeDiagnostic: AM6PR08MB5045:|DB6PR0801MB1800:
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1800903BD03C6E6399E2C7799EA39@DB6PR0801MB1800.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hH8Kge7MB/PPB0wKl7fKIbFtyh7/6prOeHhF6M7svzrk5jTO+EBNnhd5m7v0wFh88OpCOFpWDjduwg+r1AAjbWDHKFiGYyReT8JdPmtbJh1fMgDthqcERkGsbzz5UBhb8nO+7P8h771AiaAQ3cvULVzNmfcwKml1EOEjZ+ewBZjf3B+X3Gdyh60GD6EKETysQXPHwpnOfjl1/lTauVZ7xj9G+15MQwAx1d5QOFkQHJ1s4F/7psmToMk84zYlytYwASkpvjUChIZ+LeNCEcnClaRXbzv50nFLnYCGwpOHYiU69NPqZUpTguM5AZ452pjmYP2LWlfd1aIJHKJqhD0CFf56Brql/kO5f9YhUol2QEqNziVBMq9oPP5IaKJrWrVexbXZ14wREgYiytTE93Lh8DATi38VzVhwGSUoZbVv5hBaJA7QTSlo+ILhKTpIm1Azs4LhsZ0YIrlkUvU+aq4JD3Ap/p/77yDbdck3RM8cLGplpZQGnpcNBI0mRBxdqAm8bi6q2ZQo5kQXVkeajefIwD1U3cZW6Yh29YXPE7dp5sdyRlBu9biaz7qHoUPbXmUAHqx+7oLhU57yiXYIXxq9K9X+c5Hj440PKoEbD1nclBuWzcH5H34zgT93u9P399AFQ6MK7fNgdaeqC0iOfAMsV8TuuiFu721Gsr4Wp72JwD4CXiqqnNOYgaaZdjxnyTBOKanS9q8QWDI0KUHFqWjP5wuMO35TOE4yWp1Dye2Jvic=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(356005)(8936002)(70206006)(110136005)(2906002)(7696005)(86362001)(336012)(26005)(81166007)(6666004)(5660300002)(82310400003)(36756003)(2616005)(4326008)(70586007)(47076005)(426003)(44832011)(8676002)(1076003)(316002)(186003)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5045
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	767039c6-5a48-42f6-3a62-08d97e8a44db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VHxLos1TlwEIj8PhHqYPfgpZeFNnJi8JiQtAnwJGB6T3afLb0CAgDhJYOfN23PVQU88cUGnCYr5xLSICbNjm0Y+BgDuLPG2tOE7nmHYolQ6B0t+haQEInCDrCYzl/CPYg0k2ZpQg5++MOmnX5NErrtAnIVPVUma+NxpxqwpvWCaXgztfz8yvPOXbSF58+xOgnyytuA59HHAWaXc67tuZbolJCWzDdjIldcOPrtJtAmicyyAD4mvhHChWt9kpYgWemAjJnKRYFXYZvEnAtI/brFgbsOrlbBp9BCccv+4THCUhOK2ZWANtzIUCOBF1jtmMh8hKgvhYvW3BK/UuX1RAu7bGJlJEBtAlt7Z2zVBUQUNN+aMsIGQQ9sKNirx4mZ61CxlO/yD73Ejdo91cBAKN+xG/KgsIQfxOx9T5A6BceihFK2ZmH9fHcUCOGoEHPF5BmDRr1+ldZEzOOA4W9YRvx3mjhInmzWLZvOMrdSVWIRk6ybn9aeZBzDEXPut/GYG3etUFCxqs2EJW1+prFUm5C5K/Sqf+YlmGAmye+CxCCj/PH6x6lMaj67Xvn8g0r1QCvCucNHq6Hvcn6Aw6gd7p74jdM+c8GWfwyMizejMFvRHZNmjen29SLSy2G0hIGAIw0JyF+P8znkUyP84UnhqUrCx6djOgJWdcigRs2w37PEMiM/wQT8TuCwxKjV+hVC2gYTqt90BNk9mQC8qLJSqgEw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(2616005)(4326008)(426003)(47076005)(8676002)(36860700001)(81166007)(86362001)(82310400003)(8936002)(110136005)(186003)(36756003)(5660300002)(1076003)(70206006)(70586007)(508600001)(336012)(6666004)(7696005)(316002)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:33.7529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e2335d-43fc-4a59-bb9e-08d97e8a4e8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1800

NUMA initialization will parse information from firmware provided
static resource affinity table (ACPI SRAT or DTB). bad_srat if a
function that will be used when initialization code encounters
some unexcepted errors.

In this patch, we introduce Arm version bad_srat for NUMA common
initialization code to invoke it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 3755b01ef4..5209d3de4d 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -18,6 +18,7 @@
  *
  */
 #include <xen/init.h>
+#include <xen/nodemask.h>
 #include <xen/numa.h>
 
 static uint8_t __read_mostly
@@ -25,6 +26,12 @@ node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
     { 0 }
 };
 
+__init void bad_srat(void)
+{
+    printk(KERN_ERR "NUMA: Firmware SRAT table not used.\n");
+    fw_numa = -1;
+}
+
 void __init numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance)
 {
     if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
-- 
2.25.1


