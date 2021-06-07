Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE47239D312
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137535.254860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5F7-0003La-4i; Mon, 07 Jun 2021 02:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137535.254860; Mon, 07 Jun 2021 02:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5F7-0003Ig-0j; Mon, 07 Jun 2021 02:43:57 +0000
Received: by outflank-mailman (input) for mailman id 137535;
 Mon, 07 Jun 2021 02:43:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5F6-0003IQ-5W
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:43:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1845ea1-542b-467f-92d7-6d1257dcd900;
 Mon, 07 Jun 2021 02:43:52 +0000 (UTC)
Received: from AM6PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:92::37)
 by DB7PR08MB3835.eurprd08.prod.outlook.com (2603:10a6:10:75::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 02:43:48 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::e4) by AM6PR04CA0024.outlook.office365.com
 (2603:10a6:20b:92::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:48 +0000
Received: ("Tessian outbound 836922dda4f1:v93");
 Mon, 07 Jun 2021 02:43:48 +0000
Received: from ebf985aec23b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BA651BA8-78CC-4AA1-97E2-FC7EEFFB8E5B.1; 
 Mon, 07 Jun 2021 02:43:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebf985aec23b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:43:42 +0000
Received: from DU2PR04CA0248.eurprd04.prod.outlook.com (2603:10a6:10:28e::13)
 by AM0PR08MB5363.eurprd08.prod.outlook.com (2603:10a6:208:188::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Mon, 7 Jun
 2021 02:43:41 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::d) by DU2PR04CA0248.outlook.office365.com
 (2603:10a6:10:28e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:40 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:43:40 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Mon, 7
 Jun 2021 02:43:39 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:37 +0000
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
X-Inumbo-ID: f1845ea1-542b-467f-92d7-6d1257dcd900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC5QXJLTfZEmB3XeRfskTwUSAKX1zEyV98uM4QkI6go=;
 b=bQWQjoWa7x4Dy26UKrmGSwt6+XmWzDF7MQGjqnk+JYIdBpljmWjKjE9SrejpXmplCt7WSDDgWZV6VsdYNJyWuUgZzB7jdmmQzBjtxkmkF/P7llq47Xki7xWsnLqSxkPEPOPWcMVwH3Yxxg7noISegeR8eBNpxh07tCBZIieUqPI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9750348ef5da09c8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMCWgHXTxOc0cNVXAY8QQxYXCBbsefASSAuvKuKKA3W1fuxJlc3YHRtBgTdtLtIV7aYLjd6QSqLjotRnXFzi8y9kj3TV/uw2n1uXOiuF9k/oYW57rB2s62cCdi05BzoW5AeGSCpio/rG/cc9uokRPYz2+Q2pe5W+jvcEC8U93Tbh/33T1VHmQ/Mw16neHrERzu80YMPml+H8gVIhF2cczIifD0S+w5/OK6jW6A9cdhtbL3KE9hqruovxrMPEsznr7PMVjMwahSEpaedOFGPqEM1J9f1gwx6HBB9HsMuQPE+mU3gHAFo59NvOmS24oFBnJZdDe75H24iBbVsN95wkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC5QXJLTfZEmB3XeRfskTwUSAKX1zEyV98uM4QkI6go=;
 b=O64j7kBeSfEmzG2oEZ6KmJhg+eR6kk3B48KNipA9NpmIv0zzht+RjZ6KQ5T/hNG0bMhQpZCvQzFW5qXRymW4CPEmb5dJcowNkRMUPDvp+wnjLwviGc3pxqQ6P8G80s6fRchjyVhsCvLSXeUfcCDnJXbnewuq+zlac2kJeH3AhuGU17vjMgIHxMRmkUo8nK07vGIpg/Fx+hdgxMzQwb14BlHXH/zo2XwoVweYXXHSRR3BJ8fifOafYSqgu/8eXbazsHY3OZkL9cAAzWY9GsSxaoJystrESPGBwAFsX4TGPMp837r9hqorffdECbsNjeACwkN+lUSMmtA0nljn9sX/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC5QXJLTfZEmB3XeRfskTwUSAKX1zEyV98uM4QkI6go=;
 b=bQWQjoWa7x4Dy26UKrmGSwt6+XmWzDF7MQGjqnk+JYIdBpljmWjKjE9SrejpXmplCt7WSDDgWZV6VsdYNJyWuUgZzB7jdmmQzBjtxkmkF/P7llq47Xki7xWsnLqSxkPEPOPWcMVwH3Yxxg7noISegeR8eBNpxh07tCBZIieUqPI=
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
Subject: [PATCH 2/9] xen/arm: introduce PGC_reserved
Date: Mon, 7 Jun 2021 02:43:11 +0000
Message-ID: <20210607024318.3988467-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607024318.3988467-1-penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05ef190f-59bc-4f7e-641f-08d9295e13ee
X-MS-TrafficTypeDiagnostic: AM0PR08MB5363:|DB7PR08MB3835:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3835B189E317A6373D527F82F7389@DB7PR08MB3835.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2/4uV6FPm6UCjnOKker4xkzeHRaNboO9iP4x7G4+L/dVX7xF1EakLc9TXvOS4H8D9C90IS2+Kpb23IZlqCIi87E/wT1XVtJicddOGG0fT2ntYDWPEJyfr8H3UTJPJ3ZIgcf3HHGuY2wEwGgLfeoLRyJkezZjls7zFDXiVqKaB5GMjr+DIsH52aXEBbWxBGk9THXsesRQPOjWUd+92+WeL/LqLKWpWIwhZwT1V2t401s75G5d6yFq5x1TdeSfnvM3UCLQpRNZW+hgR2SE1T24gqB4QpdzgVou8f08Cbk7LdcjSwbBEQMo7U6xwF6XbmgJPyd80NeAfoPPLx//rMYd+5Ws5xsd/KnCUoL0Aaxl5RiRYpu2KXbfHT+DKb+BC2OTqgXaMEthBC69aLBxka+mIkIifKBs5hUSiq6SVCLxr7R8ivSZEzdksmjkxRrIDSrxSrMTodFB61W+tk4REFjPN+sL8pkfCuyEbx4KE2jk/uZPUKl1h6CozasM+fHffAL224uY+wPydbmbOH7MiuTJqSb5Sm4annHwPAvR2NGOOTQWjJmLS5ytlUYVxawlsfDu6xJzMjLi8jKLozVfzh+hH8iLsrEWUvREdtsJEAuK2TckOmyO2uGGfv/Ai2mKh44OgrsRnwxkOhOJRxfUi2d2mM7sSkZkIJw2n8Hm1548rVIWmGPuFuECdviojEV9W5HaCpY16f/Vkj8IYvz7qECvXg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(6666004)(36860700001)(478600001)(82310400003)(70586007)(36756003)(316002)(4326008)(47076005)(4744005)(2906002)(7696005)(54906003)(26005)(86362001)(1076003)(5660300002)(110136005)(70206006)(8676002)(2616005)(186003)(336012)(426003)(44832011)(83380400001)(356005)(82740400003)(8936002)(81166007)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5363
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01b2e2f6-f140-4562-e251-08d9295e0f4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nlerk61MW5oPLFmXPREyYUinC8sxtRf9MD1dgHcbrHjnzimfVM7iX8HnqasiHILtwiWlOjkWTfjyHehaC9imIEJ+KFXMd81c+Z4kjnDaax60y/i6xmC8eIytrwKaG7jlMs9H3OdK2QdC8OBqRARlXYzwAkOZ4/we5t4SWgJryFJ9Tqgw5OemYfu1S7aZtt0nArZ128NZPj07LZQNjaJH3nGSeXTzBRNgZQBp6NsIQjbSkZyQC86bqdoEk0MAhA2p13l/TPaxuBWesHSqBZzBIEix2wxzqYwcbOVsHOQBNsKrcUwEBngH7YutRM7J4IITFisIv+rTBhj1tExiwxwDAPs/+jPr99VnAvgayhKaUgkopY9VluJQb4kLQVRkQrrbrZUc31cjIFLPe7x+Jk/xtcoHr0IfnEI75skPsSrc1fh1InQjj8zMyFYUhjWlHn07HoIHXqYBWbUbXCNYItyJj/w5EF23uIdPRbA6GnmYOjtymA7FLDsoFFc7LORDMfnXIiz09m9EnqH0aEOf2uAywrdKUAOARnnroDlLk/aTifE8XwHLkaYzc9AzorhUGpC2SOqLzD8+/viVPVTQoxnXCFgzA9K6nMcYL9SC61Ibqopk3Wgg+Pkm8tUoy1aecoQallPenv8EkMo5LKvOR1TxPzeG94IN6hpbMKOPaAJZPKAM5oXvQpOvqXORs2NrSduQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(36840700001)(46966006)(2616005)(478600001)(8936002)(426003)(82310400003)(36756003)(4744005)(86362001)(70206006)(83380400001)(1076003)(5660300002)(44832011)(82740400003)(4326008)(54906003)(110136005)(316002)(2906002)(6666004)(36860700001)(47076005)(336012)(81166007)(26005)(7696005)(70586007)(186003)(8676002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:43:48.6371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ef190f-59bc-4f7e-641f-08d9295e13ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3835

In order to differentiate pages of static memory, from those allocated from
heap, this patch introduces a new page flag PGC_reserved to tell.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
changes v2:
- remove unused reserved field in struct page_info
- remove unused helper page_get_reserved_owner and page_set_reserved_owner
---
 xen/include/asm-arm/mm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index 0b7de3102e..7034fae1b6 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -108,6 +108,9 @@ struct page_info
   /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
+  /* Page is reserved */
+#define _PGC_reserved     PG_shift(3)
+#define PGC_reserved      PG_mask(1, 3)
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
-- 
2.25.1


