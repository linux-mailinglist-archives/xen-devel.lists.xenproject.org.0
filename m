Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4E663BDF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474429.735612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOX-0006Cu-LC; Tue, 10 Jan 2023 08:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474429.735612; Tue, 10 Jan 2023 08:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOX-0006AD-H5; Tue, 10 Jan 2023 08:54:09 +0000
Received: by outflank-mailman (input) for mailman id 474429;
 Tue, 10 Jan 2023 08:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOW-0005s6-8W
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 577127da-90c4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:54:07 +0100 (CET)
Received: from AS8PR07CA0035.eurprd07.prod.outlook.com (2603:10a6:20b:459::27)
 by AS4PR08MB7687.eurprd08.prod.outlook.com (2603:10a6:20b:506::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:05 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::2c) by AS8PR07CA0035.outlook.office365.com
 (2603:10a6:20b:459::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:05 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Tue, 10 Jan 2023 08:54:05 +0000
Received: from 1a530aeacf9f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E72D6A2F-6BE3-4CAD-BE82-F07CD82351F6.1; 
 Tue, 10 Jan 2023 08:53:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a530aeacf9f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:53:58 +0000
Received: from AS9PR05CA0329.eurprd05.prod.outlook.com (2603:10a6:20b:491::35)
 by PA4PR08MB7572.eurprd08.prod.outlook.com (2603:10a6:102:271::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:53:57 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:491:cafe::6e) by AS9PR05CA0329.outlook.office365.com
 (2603:10a6:20b:491::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:57 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:53:56 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:53:56 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:53:55 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:53 +0000
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
X-Inumbo-ID: 577127da-90c4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukOHSyYJNGo1PvmsWwUlZnhKUtTLLuyk3pl7Z1kqbYk=;
 b=IQfayMYuPhAh9yCaVERhL4zea685Z/8WMvbuqmwEdwVpuGd3xSOYqqDfJ0QZKaXrmspo2Ik3eDSAOuKhtOJoUkhYVD5q98QbRmJLz17wzMNkusDnMfdsZGS9IWSpQq2H+WO7ANTOTBBcLuTPtCw/qEbfrgT5q7qPpY2PxbnMbg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e0d06204b1326e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k49p0Ga7YSHbcTaLM2Yf/9a9ZP59cMtgjQBkE/WVtAwtE6NDu9XURdL5qrg5bD8UW78p6fcIbG59CItouubUY0kmPxs0YzEnCmYGas70O16RrdilfYOjNVLWCiqkMm8J0lzMZkN8JXc4GYCHgA6mVZucgnigC2pArN4eqQpEJNnhFkU5jgHeJxZDLwaXm77S9y8L4kX5YMaLntwieu/WBLnTKxSPcUJMzlkpqivGZOIUFkPvowpcIXk3PjpVJMUB8gseDMtMC30Yngbb3B1++NpgF+iMd9TYzd3cjZCQuX1Z13m0w5JbiVNZgEHALyKPKoeqTt8hAgdzYL0KNtFJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukOHSyYJNGo1PvmsWwUlZnhKUtTLLuyk3pl7Z1kqbYk=;
 b=K7UlsP3WRXewE0HeGJh5m024Fc5+fKKtRzVbukGfy7iG4POxJJhgmuuA6tgkq5mY+odNsSXRoDc7/eORIwWftKFT3PlzNp2eUsD3j7IBLoy7QDkDKvurZSw/ftNi66BziT1NU0Hzx21yRXXllUrsSHAHrfJPzfoEKNm6Lj/Djvr3ohwAxoiTEWhWyWR0ivRvFLsfwS8f+noK23b4X11BXyFjSjTb9BEkAiJ4fpWejf+DamYUCOIX2j4Wk+SK93e/MEnDYpoeQUo/EFhBkVJOy1H+apMnbEqx5vuh2NcTpWu2iVTQrwtmc31bVBjlAu5WEPnRcuXJVZ5Cts6xaR5zDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukOHSyYJNGo1PvmsWwUlZnhKUtTLLuyk3pl7Z1kqbYk=;
 b=IQfayMYuPhAh9yCaVERhL4zea685Z/8WMvbuqmwEdwVpuGd3xSOYqqDfJ0QZKaXrmspo2Ik3eDSAOuKhtOJoUkhYVD5q98QbRmJLz17wzMNkusDnMfdsZGS9IWSpQq2H+WO7ANTOTBBcLuTPtCw/qEbfrgT5q7qPpY2PxbnMbg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 04/17] xen/arm: use arch_get_ram_range to memory ranges from bootinfo
Date: Tue, 10 Jan 2023 16:49:17 +0800
Message-ID: <20230110084930.1095203-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT031:EE_|PA4PR08MB7572:EE_|AM7EUR03FT009:EE_|AS4PR08MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: b38d74bf-f550-4b63-7f18-08daf2e83a9a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8qWH3Cdk6TooUHnWV6bBmMqkiv8YlWmA95yuq/P/7tr80IVpC33v1tU3OEGP/5k9QMS/p20oGjydcTymTScaaPE2ucdSZTq63pAe2W9F2EpLgXjXiz1FLLytfl/+Ekjn2A+WyHQiiBVeuvfC15zoh6ROuDg2ldcokeoeeYfjlRssS6mb1K6pewsHBTJBm+LQq36szooRGhqVAW1xqSN3hQIXhRckRWWsv2ZbmrSSY81XLYb/9lxciIRoGweteF3VM23a8OwblX3sCyWzSCQOo+Ms4fdGrwXclVflGt9HrjTEhSixh2R5vvm8L5E8lzHhYGQNmqggty7ivZ5Kv90HwhLCK/AqSvjCM0q2DbCk8NNtWYBbQaWMNE+xbLO2Flofu30lyQKL66QE4QYFART+mmjO8ynL9lxcbAntix0IxFsa+dLPvoXs5ka2YH8Q1a9eqickxuJuQhfYaLVl5NKosOrjifNfViehb3NDdQQNsPcHg56YVdJ40ZF9Tf3d9HAT9l1fd7Vds7gmAMUliUuA+EMrrKZhGP7N6SwsU6E6SAbc8++EAIRKhlMkOLVtWKSllzKjcOC+p6xAs3vTa1+A/wgNuiNQCQR5uODPtPn9uxxpR6w77cTIUVbQmDM6RfXlbltga6846yFqzBRYQqBAcyQX+BOLBX8GrtNnCZEt6aWeRkQFzNgAWRVzR9giCxF4MbEMIFDrkV1LbYKd/PpXqA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(46966006)(36840700001)(83380400001)(36860700001)(41300700001)(70586007)(8676002)(70206006)(4326008)(5660300002)(4744005)(8936002)(36756003)(26005)(2616005)(186003)(54906003)(1076003)(81166007)(478600001)(7696005)(356005)(47076005)(86362001)(6666004)(82740400003)(82310400005)(40480700001)(6916009)(336012)(316002)(426003)(44832011)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7572
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae21e75f-961f-4e03-646b-08daf2e83555
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xVon1AF4OQ+FXef+6denCz3kTho9IgTteDaY9XB8cmZvWT/3Ep6ZrNsnDLY/zAxxmc7bo4P32Y/jzDE609bcqRd+Eo5xlmmMaD7eYCEgrtT9avQiuqynDz/tZPo54FrNLhLrOhxCNqw9qfvel3Pc33DRLlXfP/JLuOMIojtoRiWnkfviHbV9ReMA9GNUVEo9FuuDkTeGh1jIVbq1NaCXr1jrT0JjE3TFQ1nKx4DaJpvN4Wm8iboXiyQVL7HahssI5XjlWGDLzRWPQZUWVdIvlR43zLIHjoeejBxNG+jVSdAKSa4L2VM7zES4keCouwbya4WhOvAwJsLmXLoxrXYOufzB9fk/RMZTsmaNwfR7znKol+hen1tDpe3dko1lp+emClDAea3nKHWm7+O1ECmQO7zh9Afv5/dORSAzjGpjncANXw2GcjGn2wheMyC/oJqRDWwMC23TbH7yyJD4hYHkcM7qH1HXusNdR/y2FmWC+PZa0TiBDyv37J1HRiIGHEKGWIpfzePFgz8rCzciON6kpqsT3SLkvPe5z1KdxHlI+Gn2s6fpx2kvAyj14G4HqVIqLRlFSAj89vV4BeeyWMvqvMhHcfAvnwwgNh342n/LFMcSOFrwuWdJw5HJUSCq9wpsEbvSr1M3PYGTPbzgxRLMGkQyNEzYfXF0H4XG+4kDIfc+WAZdkM/RyyzH2OLg1H3op2Hrw8xFs2ipfmwmhXQ03Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(36860700001)(44832011)(5660300002)(4744005)(7696005)(41300700001)(8936002)(36756003)(4326008)(83380400001)(70206006)(70586007)(8676002)(40460700003)(86362001)(47076005)(82310400005)(1076003)(336012)(2616005)(6916009)(426003)(26005)(81166007)(40480700001)(478600001)(186003)(82740400003)(316002)(6666004)(107886003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:05.5259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b38d74bf-f550-4b63-7f18-08daf2e83a9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7687

Implement the same helper "arch_get_ram_range" as x86 for NUMA
code to get memory bank from Arm bootinfo.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v2 -> v3:
1. Use arch_get_ram_range instead of arch_get_memory_map.
v1 -> v2:
1. Use arch_get_memory_map to replace arch_get_memory_bank_range
   and arch_get_memory_bank_number.
---
 xen/arch/arm/numa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 34851ceacf..dcfcd85fcf 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -92,3 +92,14 @@ unsigned char __node_distance(nodeid_t from, nodeid_t to)
 }
 
 EXPORT_SYMBOL(__node_distance);
+
+int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    if ( idx >= bootinfo.mem.nr_banks )
+        return -ENOENT;
+
+    *start = bootinfo.mem.bank[idx].start;
+    *end = *start + bootinfo.mem.bank[idx].size;
+
+    return 0;
+}
-- 
2.25.1


