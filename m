Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69C452AFE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226082.390656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1N-0004Md-U2; Tue, 16 Nov 2021 06:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226082.390656; Tue, 16 Nov 2021 06:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1N-0004DT-Kf; Tue, 16 Nov 2021 06:32:45 +0000
Received: by outflank-mailman (input) for mailman id 226082;
 Tue, 16 Nov 2021 06:32:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms1L-0001ym-Ro
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:43 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe07::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00965f2a-46a7-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 07:32:43 +0100 (CET)
Received: from AS9PR06CA0280.eurprd06.prod.outlook.com (2603:10a6:20b:45a::17)
 by PAXPR08MB6750.eurprd08.prod.outlook.com (2603:10a6:102:13f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 16 Nov
 2021 06:32:41 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::1d) by AS9PR06CA0280.outlook.office365.com
 (2603:10a6:20b:45a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:40 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Tue, 16 Nov 2021 06:32:40 +0000
Received: from 807e261bc616.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 207AFA60-8D1D-4E12-B544-83F9B777763F.1; 
 Tue, 16 Nov 2021 06:32:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 807e261bc616.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:34 +0000
Received: from AM6P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::14)
 by DU0PR08MB7414.eurprd08.prod.outlook.com (2603:10a6:10:352::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 06:32:32 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::d8) by AM6P195CA0001.outlook.office365.com
 (2603:10a6:209:81::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:32 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:32 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:23 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:21 +0000
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
X-Inumbo-ID: 00965f2a-46a7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di6LXp+ObESAv9zUS3ByuNk/9QRwMZWkKNg30Nnkt2M=;
 b=gqOA7AdBHQGVWTRI+/s97b4fDj002SnmS0fsgZ+yfzUD4iEvhe82zymF4ubc9fkgMK4JlKEyDW3ncAh1B8EoMQQKCDI6cBQwmOWTPPhVry8W89XAP2+Se1uyVd0dQygLO0QSMG5ID1ERpu6AhP8XvDV6Yw0NAj6bprEZmMm+rss=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed62ec4aa64b0e41
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fg37MS5NcHCEaGDeVXefJv8AO1+OBUmFLXWPq1VAuQMhExf7wCH44tUVRSUNBeaQPG/eNDOTr3SupJU2whL5LmWKdOeQPje8toBSK90EFpETveZSZ8YcDdjak/q/jRe1vr7zbcBmfDDvFwIUMbyZr7lZy9yl5xbpO6yuYk4ChRdOpa6257Z7F4xqpX+EBLzNblo7lg90HjKouH29e7cXqeyaHagjQ1bOKjTiWPtlcdmjsT2lgNtJb2J5h7KB1nKr7I7NqnsV10etEMl3ePutNrUxZlYIN0nWcX4JFavNjwodj7tk5FDaqodj/st2gZPFk96aTXv58adVnib4+UTAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=di6LXp+ObESAv9zUS3ByuNk/9QRwMZWkKNg30Nnkt2M=;
 b=V/EyL4dDnb/0vM0SYOMTxKjVijq7Bgb9zfKTuGku6a0I5hbi4F41jPmroebaFvpmpxSSpsXC6KFDuHEWeDk9EkTU2yLjYHzXjXVacAeZf4tnhrd/7+hp3YCeQIvnhf9BzGONPB0ZCdt+zfOzHSb5XlmBiVp7pcCjNnHc9Z5pNFDN+XllK347z3HE407oTNYFmpfPrFaxpcHc78eGAtkON+5qCCfz3X2DsiLIiyklcWc6PGh68s/O01bdH9G4H34Ll1aOdur7MgWctpwziyPYOekE9DIap3XCK3ENvvveuE720rRp4WRenvzLTq+kKByvTzqU7jze7WuTZp5OSZjyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di6LXp+ObESAv9zUS3ByuNk/9QRwMZWkKNg30Nnkt2M=;
 b=gqOA7AdBHQGVWTRI+/s97b4fDj002SnmS0fsgZ+yfzUD4iEvhe82zymF4ubc9fkgMK4JlKEyDW3ncAh1B8EoMQQKCDI6cBQwmOWTPPhVry8W89XAP2+Se1uyVd0dQygLO0QSMG5ID1ERpu6AhP8XvDV6Yw0NAj6bprEZmMm+rss=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v3 07/10] xen/arm: gate make_gicv3_domU_node with CONFIG_GICV3
Date: Tue, 16 Nov 2021 06:31:52 +0000
Message-ID: <20211116063155.901183-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 921efb67-754d-4fa7-ba26-08d9a8cae3e4
X-MS-TrafficTypeDiagnostic: DU0PR08MB7414:|PAXPR08MB6750:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6750146C4B222E77F6CDFB7CF7999@PAXPR08MB6750.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:82;OLM:82;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FDLWlQIi9gky1x+cfJzpDFlYnRdrwhmmfSVSHZy5ATmf5Al3ucBa6EMx1zwAtMR6w2Q/1gWYYo0vDO0CIte4BT82NHhMN2ml6VZ3KRSos2LfH0dyd2tmivnFCCFJpXaii8HmIdlBzvuHz7hOMcERLjS/CD7ufC+1ifw6ZjkxMk+4TJfJdRgW6i7jwTmAyXbnXLwDcEbZdLtmEiIJ6ZZfO9Pve7pXT3XME+M5eUhE4OPAwc7ns9qEMmn6lmqP6/mlMr2rAw8mkchaCZ7mnaJbyUWt6cUx/HgNigNBq/HQn4X/7+8+rue6kXTvwYst3TX1+0mS61BjZAEk499ofKsrEcLW4DRD7OAgx2x3Yf8MC1hRsywMDyV3VAAOG83+sDZx5JGmBl98KhwXrWj3yLL3nQ8khk85mHjy4o/ZSvM9kSKY1AgGCfA3WIqdx1aOMunxrCGKqYqYC9XRfpBcB5+C1FKhE2m8N9RGGXO93Je68K7JS89GMRWsOjdod8lv/DrSiT7dyCUnrPfRiBMjGU/C29VfhadNb+nm3u3gmxptab4TekuG4ZSCpU2UZnsc0NSk6uP5RTo9szsuYcNgPMPf811KvuqPwQMpWkNsEnWgWTQPUVmShiWvYJrS4laK0IOjXYRKs9L91sNeljgrJ7hSf5F0T/ySJnNB1+iLTmlcsdR7Fj65PaTHKPvxUk6qiUTqEoanwJA3Plg/gtjpqX+nauWbkaAEfsW31IsKWQoE+2w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(4744005)(356005)(70206006)(47076005)(6666004)(186003)(81166007)(316002)(110136005)(1076003)(4326008)(7696005)(36756003)(2616005)(82310400003)(426003)(54906003)(86362001)(8676002)(36860700001)(5660300002)(70586007)(26005)(336012)(508600001)(44832011)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7414
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81ac1b34-04ca-49c2-c874-08d9a8caded3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	la7lbGRNTx4Q08+nfE1qnHTgTBt73ZmSbAqYjWu8IGC1bFlmf29zUIHn7nPz5G8s1zj4DjD5FvpdAj23vyCSa0lsM3Bjt4adL8DoRyIlsNb/i7x2L8P5Og/8yhjHbA061pzIjSDX07FoY0KC3vo0OJVAAkY95RRnjFngcBEiYgH58NdLsMlwxd+q1ICvbi3/TKVxpNC+dmkP3s/OkQaPGsNL+GcqdstmuUt9BbwhTkE/w6vVr+5a51LgbuZT97AXhPVNV2vDYXijfVc0GNH9ewxr1Bcq8wbtTdEpztvcXu6ybwBtWjXf9qEndklvtp5bV0Y/Hol5hGhEMsLXoq1F0dJNxHCF081T9qREt+7blnpf8knHpCURhsuIZ25+hjcynLm0X3PwmJgshkJfq3EEcACxjc/Qxxk8XG7OVSrWrGiRtVRzUta3/97SqBMBdlzV1T4Slgiz1xi4ZaBvR2ulazxjrP6xFyrWRzMFI+EhjMQS+5Wsbdkmy/g9v+FT7JQzLxDpFnREOlUJabUWO2w2EMLxiUge/SXNkzqNphgPKxqoT8NL5OisyGtLnuFdJtJbO1OgbamKW16arTqq4wBh9ilVCaOyRfF8845naYHu5PAsFbfHysGDo/laGEBvAiOMNDaIn9gxCsdWnSXgU/X8mcPvIauWVFe0gwAr9ZzoXkg+3UC2b2sa4ey+/ITnj/M0TkOxIRedpcDo+jl3vn+dVA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(2906002)(508600001)(316002)(110136005)(336012)(26005)(1076003)(186003)(6666004)(70206006)(82310400003)(70586007)(8676002)(7696005)(4326008)(8936002)(86362001)(36860700001)(47076005)(426003)(4744005)(36756003)(2616005)(44832011)(81166007)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:40.8864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921efb67-754d-4fa7-ba26-08d9a8cae3e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6750

This commit gates function make_gicv3_domU_node with CONFIG_GICV3, and
also adds ASSERT_UNREACHABLE to catch any misuse.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- new commit
---
 xen/arch/arm/domain_build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c419a4b2cc..24f3edf069 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2279,6 +2279,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     return res;
 }
 
+#ifdef CONFIG_GICV3
 static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
@@ -2328,6 +2329,12 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 
     return res;
 }
+#else
+static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
+{
+    ASSERT_UNREACHABLE();
+}
+#endif
 
 static int __init make_gic_domU_node(struct kernel_info *kinfo)
 {
-- 
2.25.1


