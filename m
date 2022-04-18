Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C9C504E41
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307084.522381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNQG-0003Zg-6O; Mon, 18 Apr 2022 09:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307084.522381; Mon, 18 Apr 2022 09:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNQF-0003XX-Uw; Mon, 18 Apr 2022 09:11:51 +0000
Received: by outflank-mailman (input) for mailman id 307084;
 Mon, 18 Apr 2022 09:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNO4-0006ub-SW
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:09:36 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe07::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44786735-bef7-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 11:09:36 +0200 (CEST)
Received: from DB6PR07CA0086.eurprd07.prod.outlook.com (2603:10a6:6:2b::24) by
 DB8PR08MB4057.eurprd08.prod.outlook.com (2603:10a6:10:a5::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.18; Mon, 18 Apr 2022 09:09:32 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::75) by DB6PR07CA0086.outlook.office365.com
 (2603:10a6:6:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.12 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:32 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Mon, 18 Apr 2022 09:09:32 +0000
Received: from 473d338c93a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1E534BB9-E16A-47EF-9784-088848B356DE.1; 
 Mon, 18 Apr 2022 09:09:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 473d338c93a5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:09:25 +0000
Received: from AM6P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::37)
 by AM6PR08MB4659.eurprd08.prod.outlook.com (2603:10a6:20b:ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:24 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::96) by AM6P192CA0024.outlook.office365.com
 (2603:10a6:209:83::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:24 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:23 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:09:22 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:20 +0000
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
X-Inumbo-ID: 44786735-bef7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryDzFvecatRrku+p3Uf242SapmXbat71UQcLw2AlN5k=;
 b=kRdd1KkF/a9OIi8OvMKVCRWILg36qwTODXAZ+P03LTPM64hqkt+AOjC6p1NqCTr3jSrxHsiFlodHVRWWY6RfQcZIUsNZ41R1ZS4PqfJ+VOkNhfYHBzlzcQXCP2bisOiczHGnjF7qMvppGpFOx4nO+N97F7nUAJQAw7zbzLOm3sw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c151209e6bdb9ca
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvbN3UGXKosLyTwzRN1T4ZaXMq65MMCC2iQhb8bXVEC3wO+tLkFLtfhHTQcaOqaerAU2lSoPFOVixllZ60q7MqHUIKlx9w2+CfbrUcMKFZ0u+yRWTvjdiHRV/r9HlUnUhQ2gbW1qgDfamW4bGnUmNsIIC83nLU/TRfvOTd0hDRqUKHZK31H8LeZRMVg6clokV0GnSNzA2EhtezM3zZ8KJOCMylbL/Kv1Dn5djTTuzvYIE3HkvxJgvOf1DRj9+XiE9BrfZdPiDjwP8iQzTFK+GMoM/OPll9+iaF/ri/ti/R4Nn36is5tM9Yximlh9IjVNPTAbqT42FfMVvHlc6/5UvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryDzFvecatRrku+p3Uf242SapmXbat71UQcLw2AlN5k=;
 b=h85gJgsW7lC3C9jfpluPe8RVDCVyZnAfnyMH0xqnV9qfRRsqL28ymsSPsenYXwScE0BQsQS2kK/Z1p3yXqcNQCD7iyrDqh9NiG1HeZXJBMxv7D0IZHxR9oVnsC0VonNX5Ps9nF6vjZFNP34IeNZDBXKJ0TacoejsBdjZrK5HbDfu7KwQTpiRsrYeRXolHl4ayqFAWvkg42rywDoPQqUr0vR58YNsS+RM3k/KgMkQ9I+YDM1/NRT7wBUgQcljTf65XZ62QOiiYbcaT4K+eBHlTioOswT7zf82YlZYLrLj8HGyibsgLeU+EPUUyaYjNDhMrvZcp2E/8YiYdoBtALKGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryDzFvecatRrku+p3Uf242SapmXbat71UQcLw2AlN5k=;
 b=kRdd1KkF/a9OIi8OvMKVCRWILg36qwTODXAZ+P03LTPM64hqkt+AOjC6p1NqCTr3jSrxHsiFlodHVRWWY6RfQcZIUsNZ41R1ZS4PqfJ+VOkNhfYHBzlzcQXCP2bisOiczHGnjF7qMvppGpFOx4nO+N97F7nUAJQAw7zbzLOm3sw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 08/10] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
Date: Mon, 18 Apr 2022 17:07:33 +0800
Message-ID: <20220418090735.3940393-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: c15145fe-f9b9-416e-b35f-08da211b26a7
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4659:EE_|DB5EUR03FT062:EE_|DB8PR08MB4057:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB40577EA08132D81E73D3215B9EF39@DB8PR08MB4057.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0Bbpp2Dc7JF+jbPJeJ3ESNoo3UbR9EXyjBpRvm/02e1f3d/LwKlxHQ28Pv9EN7n/4DDnCESngLqeKQ5oBIwuwyaBmuwWn1IrD5ZjZ26oXocI9czMSavjthQPxnsLSgtJv3EOjKjDeo4Ab8td0UqrBN2uKyVxOfeLn90WxW46bcWVJWvvsvuBqrkuIbcLv+cBpHynhJ3WarDYPL1cI4ulFAeZ1qOTTNCMpBSN5iXL++Cl1I+4uhNUUYD2L2ShsDbacJwOtBRjgxxGyJ6LeGaKenBHrIA1Gkr/ZWz8+ZBKF/eouqabM3eMF7WokiyWptio7R8rAvgGruDV0xAekVh/4Jaoh1X2YXYRLnsBstK5abr6TIzLk4eWBdeHOzIx4H6We96/wqQTsESFgMxZhAR+XduBqgi6gUDWZX1OXK3tMnU7h914+3e7Sp1MYBdJYAJsSIA3Ha1CD2N95JPexUbjPvFfhYsGvjbPrUlkz69m9w0UuEbxP2lR24biKMvhTvbqeI8HRMRkLyUt26jV1cbBODtpl9fR9+r3DDUR0rM5LPKUWQIUctviWJHUeze0s3t4LKNEek9X5D86mDlFJlW8cyXeoBUK4SktE6Zj9ma1W54GwC9/Nww0qTrvUYBa/khCtOaYSnd2lJeuXSGsLLIPWecFCjgBcjI7LVklCScqGD2qUErdzlD92rMFWYjzy/PPXlkzjVsjVMwXHzlWZq7ujg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(8936002)(336012)(426003)(86362001)(1076003)(4326008)(508600001)(83380400001)(47076005)(26005)(316002)(54906003)(110136005)(5660300002)(36756003)(6666004)(36860700001)(7696005)(82310400005)(8676002)(70586007)(70206006)(186003)(81166007)(2616005)(2906002)(44832011)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4659
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84fc2458-507d-4f9e-f124-08da211b21c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o3wAxv0Yx+4bc/e2GiE9lDFYuYcCW8sJef+RNUHm11bH0S8zU6wYjmg/LyaejnnpmO5WViPNLpHTsGNnha5/P+5tu0qH+NcLDvBZLA0VSto8ncCdzbdvixInz2gaGxTCVJwKH+8KiA/nSibzJ/ZtsTiPYXhR37wrsyEg9rihuOo4iJ20TNY5EVPvAYCmiTHE+qLAIvAzgWPQWjIFPK17JP55Zg2dajSHJwgekwZOHjnkjE6/VrxZrJxSly4+d4K7qN4PNqyF5c2gCs+iO9xBAK7O4osUyHtUgOs5KWRvSd4DNoVipf8p3/Do8uPpUFWvItEyBr22bFKn00ylYxn+qFgc/isb1wmbMIcVTMIaWodcOclu8Yrobef2kW/5kWFwU01yDPWcwdlQerIsx4GBKLkKX1qNPgg29VY903Bss5DR1QRD502atZUX9Ii5xDbRfz14q8Ye1wnlmFLQgdITg68xfS8tHzTX5jvel8ZOBDVD1spF6K+5rl1EdWty/D7TEPfo8DUHxGRWblP1huMh8XzxP3nBMxI0EpO5cp/p6C4h1iQKrY9Ii++smWoXMmbVqp+nTmfSCarkl8p4LxYpnZVwy/oD14iRFdyqVso02mOOCHJI74UgYBe6/qBNcqNe2IDYlZCL/pndkWM5/x347+TW1JkaZYXZIfFABNIwvDnUJ2tWeUqXjfwLft7HmXU3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(426003)(86362001)(4326008)(8676002)(2616005)(81166007)(450100002)(110136005)(70206006)(82310400005)(70586007)(508600001)(7696005)(40460700003)(107886003)(47076005)(2906002)(336012)(26005)(54906003)(316002)(6666004)(1076003)(44832011)(83380400001)(36860700001)(186003)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:09:32.2548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c15145fe-f9b9-416e-b35f-08da211b26a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4057

We have introduced CONFIG_NUMA in a previous patch. And this
option is enabled only on x86 at the current stage. In a follow
up patch, we will enable this option for Arm. But we still
want users to be able to disable the CONFIG_NUMA via Kconfig. In
this case, keep the fake NUMA API, will make Arm code still
able to work with NUMA aware memory allocation and scheduler.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/include/asm/numa.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 268ba93a92..59cdf8e39e 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -5,6 +5,8 @@
 
 typedef u8 nodeid_t;
 
+#ifndef CONFIG_NUMA
+
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
@@ -24,6 +26,9 @@ extern mfn_t first_valid_mfn;
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
+
+#endif
+
 #define arch_have_default_dmazone() (false)
 
 #endif /* __ARCH_ARM_NUMA_H */
-- 
2.25.1


