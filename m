Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7C49DBEC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261217.452073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYV-0001Dz-TE; Thu, 27 Jan 2022 07:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261217.452073; Thu, 27 Jan 2022 07:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYV-00018c-LR; Thu, 27 Jan 2022 07:50:55 +0000
Received: by outflank-mailman (input) for mailman id 261217;
 Thu, 27 Jan 2022 07:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYU-0008Mi-Dg
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:50:54 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da354251-7f45-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 08:50:53 +0100 (CET)
Received: from DB6PR1001CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::13)
 by VI1PR0801MB1885.eurprd08.prod.outlook.com (2603:10a6:800:84::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:50:50 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::df) by DB6PR1001CA0027.outlook.office365.com
 (2603:10a6:4:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:49 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Thu, 27 Jan 2022 07:50:49 +0000
Received: from 22ec596bc51f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F59E17D-8800-4770-B9F5-9F826555375A.1; 
 Thu, 27 Jan 2022 07:50:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22ec596bc51f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:43 +0000
Received: from AS9PR06CA0396.eurprd06.prod.outlook.com (2603:10a6:20b:461::9)
 by AM5PR0801MB1634.eurprd08.prod.outlook.com (2603:10a6:203:39::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Thu, 27 Jan
 2022 07:50:40 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::4e) by AS9PR06CA0396.outlook.office365.com
 (2603:10a6:20b:461::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:40 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:40 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:38 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Thu, 27
 Jan 2022 07:50:37 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:36 +0000
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
X-Inumbo-ID: da354251-7f45-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ADeT2DevMW88RBtpOZP9XyqhR303hWtW1f/VBC5H4k=;
 b=evXeaosW0bIjoA8RBjMsViybg5chvFqBj8UTq1W7uFQFajFAtxPnH/aZtafomgCnKCamBZtR0uk0aOrWrtrr1YxlGVyYoA4p7KQs3GyRizIenFgOSmx2F+sZg+MZ9CgDfMPkD8EY/o4qylGKLaKXyH6mTmWpAi9fphK/tdo8+5U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4668b5f1c2a5e3f1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCW6lGP8Nwbc9guDJDgDin3T5X8WFfNzB4cxbjPIpQE+m8Bpw8qIkY5II2gbvI59AiVLHVYcas1aRRtzHj2vzhEoyBv3hndU0xotzFR+jvO83yMkv12xQZYZy4qyqWfbZLAOMmd2+MHs0D7B/rNqw04MY8UVEveSBk/mZz+78aj9aqgOCJf1D3Kw67gjTC6EU60pTghKeVULkzJsntpANBrGLZx5NgjrCFP6l+fQT7HBWnA1XD5zwI9+ucjxIrMAUEaGbjMNCauNLADS1tH8uCo7KsxjcAOcfSIP7KuTFbZtxXPfsKZM615qOO7iNsCW2ZCAYOUcGYDYG9yXbombyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ADeT2DevMW88RBtpOZP9XyqhR303hWtW1f/VBC5H4k=;
 b=FaHwWwq1w4BUmm9nj74ATWuxD1T4sLijglvTn5IzLNG2wdroKvOviUB69jEV0PyZAd25nnxtQOMkE49kiTS54qoY+8K9iTEA1gehLNSUJcrW+ylMOys1uVv6fWyJVje3lVJSbQBOuLTvlNYF1xrIXU+5b1Ard+1uxOsWVknN+e/u91rEy4S3Zk3eFsR19FkYiW2lbE6ULQB8rz8UXZ5iGl+YmcdEjXjuOCNbgJQ6+La+SWh3kegAC0IgW2qYiEfWiF1+Uwmm142i3+reJQmg5gT7XGEcQf5jz4Ll95Z/PbmuZtcEnYEYCpfoA6ZLbQmxoJmZw/eSvZjsgdm8LnbnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ADeT2DevMW88RBtpOZP9XyqhR303hWtW1f/VBC5H4k=;
 b=evXeaosW0bIjoA8RBjMsViybg5chvFqBj8UTq1W7uFQFajFAtxPnH/aZtafomgCnKCamBZtR0uk0aOrWrtrr1YxlGVyYoA4p7KQs3GyRizIenFgOSmx2F+sZg+MZ9CgDfMPkD8EY/o4qylGKLaKXyH6mTmWpAi9fphK/tdo8+5U=
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
Subject: [PATCH v5 06/11] xen/arm: add ASSERT_UNREACHABLE in allocate_static_memory
Date: Thu, 27 Jan 2022 07:49:24 +0000
Message-ID: <20220127074929.502885-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: cf3d3887-5b1d-49a8-080a-08d9e169bc73
X-MS-TrafficTypeDiagnostic:
	AM5PR0801MB1634:EE_|DB5EUR03FT027:EE_|VI1PR0801MB1885:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1885FED9DBCA29F06866F0C4F7219@VI1PR0801MB1885.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:326;OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dKj/ASqYfY7IOU1Pk0j5xYdQUFcdH1dgbeRLmE7joC2iSl0LB2SiXZQTK97w/01HOr8Nx0YHAlpJSqWSoiisT8pbN95Hqwxg6fyWfyciGSEBZ7/cQzxahq1BdxulpnVZYndCGXYZA3aBEMNniZ50HKKsi/iR9leEgNj+bxyiGp8/M5YQFOkebh4/AOy/5dLHHNtLt5sjBywD6ZJaZpElOOYvVIUAst790YT6RuMuowNOxlK10qmjPMeo4En4np0ByKMljkVk/6FmHMBMGkyuzTmViAKxdY7vKg4ZSschYwA7tcnRWarTggJkZOuc8wRfPWc795CrGuL/VAsfyIIrp9ChOVlAkEfPTqm0nuHR47M/IgqUFJ7Q8OOPTD2EJAhZMS/H1GssXlD1dInCNc4uxn+nfmGF2T8bWMOHEp5SXpvxzs099TCq/+I9kBbrTXd7omQmHgaUGat1RfgiU+D+LTBLeSnFrifnbf291Yjam1VL5NwZHCeminzZgPe/gYvmbhdlovt8iYt9hyMLaq7hZOeVJ5GMVkMv5IOVnxsAkHMWtua24vsRdx03ASg/nbtoXKkX1i+4vJbS5Wbpdf6EN8dOmFuXAQQ4uBBYpilpJBnpCORZtmUNcbU+zO0t0GHguxKfqInTrhnxCJt9E4Yc0Av/DSnmS437ymYoODOgw/RE6m5mfS0WjbgccJGRRl3fs2uM0D4ZEw4JC8PpKDiKk0PvDExXxzVPhB2LIdSAZN7BmVbkLiocAx/T0EvAAPviLFhlKFqs2IzhVO7MAqQsuM64rS8Vt2V/cmXNK4Hs1fQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(40470700004)(46966006)(82310400004)(40460700003)(8676002)(2906002)(54906003)(316002)(4326008)(508600001)(186003)(336012)(110136005)(26005)(47076005)(5660300002)(6666004)(1076003)(4744005)(81166007)(2616005)(44832011)(7696005)(36860700001)(70586007)(426003)(70206006)(86362001)(36756003)(356005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1634
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f988be24-d081-4013-29c4-08d9e169b6d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SscVWSg11K5oGEhNhQX+U3nImf8evTA2NTemQDdw/v3LcD3Sf4DAKl9ExEoHTmLbyrKqTmwbE/iPiOAe5g30leEt9Ju3VTp3kOfDFk9bTUkzQUsPLD55Uef1WbpcXJboELRZLyXrL+VR+5H/tbGVkumypysZc59m4NKgySff9Iw4S78wp98Ib7Tr8t9bUrECEF7G6hd/SjxBc6Ztxd3KxOt+xkc294vJyiuQYF3HF00jgxgLGDN6L64OkFd5pAvu9lUz908BUVCbodBFrYgFSb/dNrKq0gUxAVn87Hmo3Bq2oGYWv3QycvY8UQAmNeZUrjl8+bzr0Ulb7hD0PJYgSow1oGpBiuowzrljF5z9X5Wohb0vTasldZmFW+tiZFE90daGi3I016B3MhaV6b8kWafoFrTc3NKQC9X3qH39TsSk4sU5+NO05CI1lWng+t5qAFgfVysjCx83s5j7aQH0K2a+OL/+05XHZNrvBwe/Diiksl1cVizfzbjLrg+dAFDcfPFZYmLAKQLZYAQJkOTqH8v3htJ4HJGUSVollEb2sgQupaLJreYsfjl3j8E2m7cqpboTLrPx3jRRvL0WDTqgm8sOXm3NclxRPsWaHrT2GhLQ0TrmgO/EGZ3BLprU0PvI8rnT9Sx9CjnvqQJiNNYNEJ/zBnP88Okben6cQW56YVCs9k6n8cgFcd1gaeDgZJ67
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(316002)(70586007)(70206006)(8936002)(8676002)(82310400004)(4326008)(7696005)(40460700003)(336012)(426003)(26005)(44832011)(5660300002)(186003)(6666004)(1076003)(86362001)(47076005)(36756003)(81166007)(36860700001)(508600001)(4744005)(2616005)(54906003)(2906002)(110136005)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:50:49.9106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3d3887-5b1d-49a8-080a-08d9e169bc73
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1885

Helper allocate_static_memory is not meant to be reachable when built with
!CONFIG_STATIC_MEMORY, so this commit adds ASSERT_UNREACHABLE in it to catch
potential misuse.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 changes:
- new commit
---
v4 changes:
- nothing changed
---
v5 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ec29bd302c..52f256de9c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -755,6 +755,7 @@ static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
+    ASSERT_UNREACHABLE();
 }
 
 static void __init assign_static_memory_11(struct domain *d,
-- 
2.25.1


