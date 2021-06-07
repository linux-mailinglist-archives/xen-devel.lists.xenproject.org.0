Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C5339D315
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137551.254936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FY-0006kf-BY; Mon, 07 Jun 2021 02:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137551.254936; Mon, 07 Jun 2021 02:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FY-0006gr-6n; Mon, 07 Jun 2021 02:44:24 +0000
Received: by outflank-mailman (input) for mailman id 137551;
 Mon, 07 Jun 2021 02:44:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5FW-0003W9-KG
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:44:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2355fa02-f776-46e9-8159-3fc5e00c58ce;
 Mon, 07 Jun 2021 02:44:16 +0000 (UTC)
Received: from AS8PR04CA0124.eurprd04.prod.outlook.com (2603:10a6:20b:127::9)
 by DBBPR08MB5882.eurprd08.prod.outlook.com (2603:10a6:10:200::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 02:44:10 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::7a) by AS8PR04CA0124.outlook.office365.com
 (2603:10a6:20b:127::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:44:09 +0000
Received: ("Tessian outbound bf434e582664:v93");
 Mon, 07 Jun 2021 02:44:09 +0000
Received: from 42d751cfa30d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 27168AAA-11A1-4D08-8710-E696E1208AE5.1; 
 Mon, 07 Jun 2021 02:44:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 42d751cfa30d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:44:03 +0000
Received: from DB6PR0601CA0013.eurprd06.prod.outlook.com (2603:10a6:4:7b::23)
 by HE1PR0802MB2521.eurprd08.prod.outlook.com (2603:10a6:3:df::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 02:44:00 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::40) by DB6PR0601CA0013.outlook.office365.com
 (2603:10a6:4:7b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:00 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:44:00 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:43:58 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:56 +0000
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
X-Inumbo-ID: 2355fa02-f776-46e9-8159-3fc5e00c58ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JHF5WaQ0fbVKChrSZ5i9VP+rOLKRk36xXg7oyU+VXY=;
 b=HWX+z9JGnwqGi3cpZzIMNBN/ppMighqzDDhgZronSd5B5eb+b1RrJz46/9NOBOe23GnF+EXnI5cQnGtnb6a1vw6SAbfwCH1ma7PWNZmvnQL7loeoBVGRk8m4N0Q8U6ZgJzykFrky96RyuOnQ5BdM8TRSBRW2ZCRWK0/K0y4Kvpo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 788d0609dd54f541
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/D7veZtl/BSsuiNy6+mof86zzVKMNR35v03tl9zbDZmUwSDkRRIVLroKYVqMGBlwN/UpfxUvcGmo4PENcOZhpUxjamaR0mGpQX9n0S0o/K6PnKMbA0VJjw8FZrcPeq7GPAC7BgR2k5tPZN4dO604kWCIvvkUWFIgcv6rMq9HOYqtV/bb9WxgLJIt4Z7lhuYItKsvaLF7zIbI+1NFeKo7j3mfrd9ipg1vYkSFsxy9g+sL58gTaD0FkmLVrxTXmUGl+0lWXDEemJXcuH26TbVSRYohYSSNpILb3RQpTwnReisT8kpB/GI8zVPYJIM64zLJCxEAr0KJI7RktDkxs5HGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JHF5WaQ0fbVKChrSZ5i9VP+rOLKRk36xXg7oyU+VXY=;
 b=ZXMvDk8VmcyqAKBFBaQJv46ex32NcwSViXlCMPjde3qlQrtUcAEvGSdpIyf+sFx15J45fZIVxL7zwriEjanDyxuh3OlZP61T+5AQ3DT5PKd4k629pqMeuR7DqIcfDjI/QQZ6e3y0ztHGF2KGZ1jv8FhJ0BWCLgoDWyIdweCtOehwTbDRpumusyPCd2EoewQlTCuBA9qD0QIyTgSyX77uCux8l3v/W3Vb0csY25Fg2fSWHc3oAx/x8BbPgzoKwUgi1VZAnLZhZ0rmXbXC58cBLtOLButEvUNcG6sT+WfD13NnmuLQX+SLu/FRo0RsrSFWFvAYGfCmPr52A/VH6uwcHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JHF5WaQ0fbVKChrSZ5i9VP+rOLKRk36xXg7oyU+VXY=;
 b=HWX+z9JGnwqGi3cpZzIMNBN/ppMighqzDDhgZronSd5B5eb+b1RrJz46/9NOBOe23GnF+EXnI5cQnGtnb6a1vw6SAbfwCH1ma7PWNZmvnQL7loeoBVGRk8m4N0Q8U6ZgJzykFrky96RyuOnQ5BdM8TRSBRW2ZCRWK0/K0y4Kvpo=
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
Subject: [PATCH 7/9] xen/arm: take care of concurrency on static memory allocation
Date: Mon, 7 Jun 2021 02:43:16 +0000
Message-ID: <20210607024318.3988467-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607024318.3988467-1-penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6b9e365-948f-4a72-7f9b-08d9295e209f
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2521:|DBBPR08MB5882:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB588204EBEB30A8E2065B6B23F7389@DBBPR08MB5882.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:590;OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1iz3w8t67Ip9LiWn+hr8BIL5flrBarhkPkeQ/GsDwSiiWR/3h9uOyCAQNCneyhq/g0f02H0sKth46apmAUnr1e1fvSvpcrZ1JviL9r57FRSlHI0dVpfGx25GVmasL56TQvCXVb1SL4kZjCFqj27pQ2GnV7b9ikFrbvALkTKPKSf1LqFFahPnF70lyrDy5UeaUtsMVsOgswDjKY1t67AdgGgeF0JbuukmAj1iJ0FxZq1a8MjYP6D1lNQaVks3Rov2e6ucfQVkK2HTSi5+EmFehershm7DZMwVAxaULiZrHPWfs+/IygQDkhPzGI5cfps3o7WvJFvINj9KvP3VSzjqZIY2Rt/4hMb68gA4/apxoNsgnv2ovIddadsGHOqM+q/qgLhzn3Gu2f+CAMbinVoCi+s4QhywiemtCDcf3dTl2YHOKHMQS2Kgs9xvCCzI1vfLH0ieWd2ynaxlh5llrQT+NxUU5/E11Kd2I0OizlfJG6c3hFBpkR8vw2uA5hZ5rDmNoKTZura2iRFHoWl83XBTakfexJ1r81v9B11KuacWTb7CG4ZEm7q74vvQ4dxf2ktE+6hPTV620eY9JLK509fJft/QXzgUEx034C7kUlKIkcEV7n0jTxIt7ay7EQA+Qb3J8xozaJ4qARUXH25YwcotOZC4F5/2jQzSCLyzyamBUinuhDIy1t5ZKEwOCe8x03X/HgOIKzivQSytDj5OEgwkUw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(2906002)(6666004)(36756003)(5660300002)(47076005)(1076003)(4744005)(186003)(26005)(44832011)(86362001)(426003)(110136005)(54906003)(8676002)(83380400001)(81166007)(36860700001)(356005)(7696005)(4326008)(82310400003)(70586007)(70206006)(478600001)(82740400003)(8936002)(336012)(316002)(2616005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2521
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53a0d1e3-767e-4d74-b760-08d9295e1aff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bFpj7HCWmiqb0wFsnYY519160ZUpJcZ8BpGAUQSZ7OMIq2QeiV5V6y+AWEAGAoH1WiyqnjnBnD38ovr43mjQBtAoVWzWOHFM59AVeiDbzf6wLhnxgcbQB9gWbAj7lTv7qPx5CcSjun7uel86cqgYyCfE3hA2L3AyF6mJPAPLqWvASTMA0D44kIX972XNMKi5Aye7ZEi0PW9OnDEp7JCkRQrmVZVOQWHBzD4VAF7dcEgNCIjU5VVSl/y9A16LmWRZnMz7FgK9g7jkP/7fTWUqUbFP4y2yELY2ppVhXcoa8N0pVSnvY78tyjqBJZFrlMqDSNgqjUBlYCM4fLKmJ4NeONmjpnkf/7rN+3AN1KKZ7S2SXuw8nlTLYQ+st3g3SVngj+ykFj4/JLzyR/pfGx0f76nnorRvjRt3tVZXoZP6l1LhvIixDeKrbCUiIiNwjg/+g3BuQy5tbeWbO17mBMEHTBC0P+lQ0lNlJRDqCAHGOEcuQZ4Y1MqkzJ2FRLAn6ByPTe0/wSQPxa6H3gipamY7FGeFduJqYAa4wRN+nYKg2LWKn+3F6zHrvU/ZVbGJELhzGXDoN2nMtE67WhkxL+F0Wfr42uQAtA6zijMzHsv4wwc99eG7aeuswosKVAQTsu1oxPEctFGvRHGjj5oOm6rcWQj81wa2r+Z6n755K8Fj5r4DZ8ZvBo48oyWCNmxRSUa8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(36840700001)(46966006)(4326008)(6666004)(83380400001)(36860700001)(8676002)(47076005)(36756003)(81166007)(8936002)(26005)(2616005)(2906002)(478600001)(70206006)(1076003)(44832011)(426003)(54906003)(110136005)(70586007)(86362001)(4744005)(316002)(82310400003)(7696005)(82740400003)(186003)(5660300002)(336012)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:44:09.8884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b9e365-948f-4a72-7f9b-08d9295e209f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5882

In the future, user may want to allocate static memory at runtime,
and it is quite important to get the code protected from concurrent
access.

Re-use heap_lock to protect concurrent access in alloc_staticmem_pages.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
changes v2:
- new commit
---
 xen/common/page_alloc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index a0eea5f1a4..c6ccfc3216 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1087,6 +1087,9 @@ static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
                nr_mfns, mfn_x(smfn));
         return NULL;
     }
+
+    spin_lock(&heap_lock);
+
     pg = mfn_to_page(smfn);
 
     for ( i = 0; i < nr_mfns; i++ )
@@ -1127,6 +1130,8 @@ static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
                             !(memflags & MEMF_no_icache_flush));
     }
 
+    spin_unlock(&heap_lock);
+
     if ( need_tlbflush )
         filtered_flush_tlb_mask(tlbflush_timestamp);
 
-- 
2.25.1


