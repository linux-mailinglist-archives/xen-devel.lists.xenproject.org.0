Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C28452B03
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226079.390624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1D-0003BU-A5; Tue, 16 Nov 2021 06:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226079.390624; Tue, 16 Nov 2021 06:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1D-00038J-6h; Tue, 16 Nov 2021 06:32:35 +0000
Received: by outflank-mailman (input) for mailman id 226079;
 Tue, 16 Nov 2021 06:32:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms1B-0001yg-6E
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa504851-46a6-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 07:32:32 +0100 (CET)
Received: from AS9PR06CA0309.eurprd06.prod.outlook.com (2603:10a6:20b:45b::11)
 by AM0PR08MB4194.eurprd08.prod.outlook.com (2603:10a6:208:130::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 06:32:29 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::b2) by AS9PR06CA0309.outlook.office365.com
 (2603:10a6:20b:45b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:28 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Tue, 16 Nov 2021 06:32:28 +0000
Received: from 32557013ab59.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6034030A-BAB0-447F-BA7B-FE5ABA6CCC9D.1; 
 Tue, 16 Nov 2021 06:32:22 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32557013ab59.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:22 +0000
Received: from DU2P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::22)
 by AM0PR08MB5010.eurprd08.prod.outlook.com (2603:10a6:208:15c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 06:32:20 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::14) by DU2P251CA0009.outlook.office365.com
 (2603:10a6:10:230::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:20 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 06:32:20 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:18 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:16 +0000
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
X-Inumbo-ID: fa504851-46a6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk9A/ODYAnbqpkicTWn0UlFfqa7O0F+EdCboEgibH8E=;
 b=iMDCmZ0t2pXelKzTPcs1ogMbyuLwR3LPJTy+nnrALtQtCS/nHJBBQmR4gyUjEp2vYwehIbDDTIcAvlvz0OkrRmxfuKHAv2Z6P5xlI1EQQMQLwipqOa1iCfQjDKdDOd8XZZqdkW2mnvjP+9z/fwb3SJQjHXqq2EUz0oOO0hdevI8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35dbd49221cc357c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1v6Vqtd9Mxb+AV/q7n3Wjye4SNZ0so5ceHMuD5v6qXlN3uFtBt9zIwb86SIJvHvefb/REfFmtd3zGYpkEsh8vBX1G8Gkgd8V2bjlhUQ8pJ9SFSuXHrKmdX/9yvedRA9yEO/dtWGuuDimbr176BAIFtF8I84IC7w4Wgnfcfg51v0AYsP8eQEskoWIvU5FonM21E3Vv4LHye0Ik5VpbJh5vhv6BzCq8DfVC2DoVYQrVC8GtItAg02QlYaWBMDGODP8g+vO1ZWD0sro5eqQjG+fNPDscp3zfQhye6oG2n/piaP0XXcwM0QNWbsnNVNODLXERTvJ9FlO0h2yNimEme6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk9A/ODYAnbqpkicTWn0UlFfqa7O0F+EdCboEgibH8E=;
 b=cjutisVC4wXvgaVG8rDLNIuvzW2M/ComGEo+QvkArcwIzc1MIMtga+Q5fFdcAxohcBIeTtmu7EOMkEE+DjsOem8TVr3NET/FoiwmUzVDoJGyBr37rQeN8kgw8krBEA/aChWlifVKDCvKmc0eorfNmEJ4KkkcdxQJjCzoz0Ad+mreEZI5nf9K0Scih0paWSlvaMoK7ns8qdE/QNAKT1UDJ/0mrSMFzJ5Q/JUtEpWfX6KgP6JA6PPoBnrDbsrJIRT7mR7+eB5UHx+ksbgx0fae6WqJSo8PGPgnq62q8I2lXUICRrEdnnpgVX9eZrn0WJNnNhjOVYDyjgFbkWws8RjDQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk9A/ODYAnbqpkicTWn0UlFfqa7O0F+EdCboEgibH8E=;
 b=iMDCmZ0t2pXelKzTPcs1ogMbyuLwR3LPJTy+nnrALtQtCS/nHJBBQmR4gyUjEp2vYwehIbDDTIcAvlvz0OkrRmxfuKHAv2Z6P5xlI1EQQMQLwipqOa1iCfQjDKdDOd8XZZqdkW2mnvjP+9z/fwb3SJQjHXqq2EUz0oOO0hdevI8=
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
Subject: [PATCH v3 05/10] xen/arm: add ASSERT_UNREACHABLE in allocate_static_memory
Date: Tue, 16 Nov 2021 06:31:50 +0000
Message-ID: <20211116063155.901183-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2336b8e2-10cc-4500-0b8b-08d9a8cadcc1
X-MS-TrafficTypeDiagnostic: AM0PR08MB5010:|AM0PR08MB4194:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4194A26EDD3185D198371760F7999@AM0PR08MB4194.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:326;OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XQXSO08ubdsatULn2e4nWNk2+486Kz+Gx3EUwfwPzXpZFC7UvSS45uaRBeAILI/wF4fkxcGARGNGx8Rr+cjrgRLqaL2lqz1lMqw0STnIWInyxA9xVqI7hbNz95ea956zz3gjOTs6ddp1ZGhUPrcLuKTyC35d2RZNx/xGbCpqEUn/STda8beovyRGQPW3r6I2NN2lkBEFJan4TilTGMzdnp6QA4t967jX+WPgPoHmA49nZnn/X5DmIUcdvIJgYAdhKD1NHa2iJpRqL8xS3sTT1c54n4u6bUrcRL+7imKPUbXCfaIP4kkwfnRQLsLuTeO3eoLfB5jbqp1Ino3Ss860DZoOuMiO7lfAPoTF0doBfjg0YmLK9wxy84iX1KtB3VBaTWcrzYnpfM0rN2H7dSH+eUy+TdliwsLyLYCKWwdASanQUid8Cji+CJffvwttipYlMOl7W6PQNOj26AB/3VFoUVylNb89nx2vtvTCirpdcyK32o8YI+aUE222I03wR0n7GvmhQpyijS8QpxHTls38Fex4uYTvPc+mErMusJDyEeqwznkvXIqalBumdNQS/BljpMP4r5fUOFlLZ11ltqyv4zjbg+UTIYKNrf1r5Qh6jdhFTfIpWzV5Vqe8O717MHJqWXHNMTfiS+xzHLL9FKDvwniKv/K0mqBEUxxEpmJDBttlWSHJRwbJB942MiOA53uHE6tdgndHZZSwzXp6uB2LtLpn+DGz5Y3bItIANWx2JL8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(70206006)(44832011)(70586007)(2906002)(26005)(4744005)(6666004)(336012)(356005)(508600001)(86362001)(81166007)(426003)(7696005)(2616005)(316002)(5660300002)(54906003)(47076005)(36756003)(110136005)(8676002)(1076003)(8936002)(186003)(36860700001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5010
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af329248-ad92-4d51-af83-08d9a8cad783
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QO0nWTv51/nE4EZZsM5fhM6e6HcaABW175lULNIWUsL+S/SBIHa9Lo9rNqoA3QoS/ms+8d7F3CUzGY730Tc/2SZ76YKXJxfaXeHOUQx615NtXz+irqYlUXbF74Tq4XH0qlYwEFwcYO6UTgY/DKmj4UmBWENq9pGtTseMjp0nIjbeGb37y6Ov1dkYS7gCWUbJnME4Mz4fwuWwXlgIO1W/eututC5h2n2yWitXs0G3+zhF8nSisMAFNZKX39rz0QfYhlPNik/D6+5y/sUJQT9nZsg46OoEptSr/FJj5hDUhw9/FeHSSanJq0TfZPBjb64sbJ701iqtcUeMjsur/SR7CMujoUgjKV5k6btJ1+/F045LX1lD1cqQQfwu13oVQiEB7VIV90u6DlPMvq5WR9vhxo3nWL5kScXScXL3RNIdnqZpOOqfd3AkIOX9EMtzJ3kkzkOd/JMkuwmyK/5+ym7p3hUxmXtRi99MxFF0R4QQjwH8iPvxZ8Q1/5XlJZg9LcUC3XJ/8ktaiNFXsGtQ0F3p5kP+uz16vuoJfMqFx1tHymQMopee9c7GczmGepTSfn4FCj63dJc/ntiixBkXJRBASm4jn6tiDLLMSAYRrGXF00FWdvD1JFB/OPaeneHByj1MtdlX11loCZs7QYiQl8K4L8s5JfBY2INAWkAYAhuCDej3IQBjamOlrwxDC3xB/BOs3qL9hv3WwLDQw2xMNtt41w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(110136005)(70206006)(70586007)(4744005)(508600001)(316002)(186003)(5660300002)(36860700001)(426003)(44832011)(36756003)(6666004)(2616005)(336012)(7696005)(54906003)(8936002)(2906002)(8676002)(26005)(82310400003)(1076003)(47076005)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:28.9085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2336b8e2-10cc-4500-0b8b-08d9a8cadcc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4194

Helper allocate_static_memory is not meant to be reachable when built with
!CONFIG_STATIC_MEMORY, so this commit adds ASSERT_UNREACHABLE in it to catch
potential misuse.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- new commit
---
 xen/arch/arm/domain_build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 97a5b5dedd..b6fde74d74 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -759,6 +759,7 @@ static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
+    ASSERT_UNREACHABLE();
 }
 
 static void __init allocate_static_memory_11(struct domain *d,
-- 
2.25.1


