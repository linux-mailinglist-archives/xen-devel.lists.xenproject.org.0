Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963974EBDC6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:38:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296135.504066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUmW-00024s-1H; Wed, 30 Mar 2022 09:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296135.504066; Wed, 30 Mar 2022 09:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUmV-00021H-T1; Wed, 30 Mar 2022 09:38:23 +0000
Received: by outflank-mailman (input) for mailman id 296135;
 Wed, 30 Mar 2022 09:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u124=UJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZUmU-0000Fm-Hs
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:38:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2344ff12-b00d-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 11:38:21 +0200 (CEST)
Received: from AM6P195CA0069.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::46)
 by AM0PR08MB3811.eurprd08.prod.outlook.com (2603:10a6:208:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Wed, 30 Mar
 2022 09:38:18 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::3a) by AM6P195CA0069.outlook.office365.com
 (2603:10a6:209:87::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Wed, 30 Mar 2022 09:38:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:38:17 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Wed, 30 Mar 2022 09:38:17 +0000
Received: from f961511ea16c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC901C94-3FD1-4D61-9A00-815D65616AB8.1; 
 Wed, 30 Mar 2022 09:38:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f961511ea16c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Mar 2022 09:38:09 +0000
Received: from AS9PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:20b:48b::6)
 by DB7PR08MB4619.eurprd08.prod.outlook.com (2603:10a6:10:7d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 09:38:06 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::5f) by AS9PR04CA0082.outlook.office365.com
 (2603:10a6:20b:48b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 09:38:06 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:38:05 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 30 Mar
 2022 09:37:51 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:42 +0000
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
X-Inumbo-ID: 2344ff12-b00d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znsC665yGCk5zE8FKB/DjZh+uBcFbBobBpnEb5l3DdA=;
 b=T5KExU6oHi4JSE0FnI6i1LDFukEGvF3yDljyV/ClQl4BSHJBaNYi8qmldEre49q89L+A8MOXaMnxG5BqvQGrsTKsAw5XEyUQXz5BRK44W/OPS+BvtHn3C6gy2UOx1E7BDToKQAum9cS77F+oghWO+l1ZOh7YBI9xjKziw4srDWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b2bc2a68fb15f2c0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovnq9ej+sqptTfndfJ7i4RGgH+A+x+lub4O9pYc+98GrlUwuSWGCcA2aTfYy5uGP+FTAUW5uNaDE15rpQpBtHqgjKjNgqctQ4bogf+pSKH30Rghnh5k/b4tft0//ibsof5f1EjvRmzgln4alXXg/Tdh+wNGgLLGnfjikGMn4ApVoG5zHnKZI0UX6o5ebVGocXiTe/R2cTVRh6MGoPF/KlrKcQ8H40tnRdwwBPzSXgru0rrFNgz3i0nHrmcWxUNME8yVDIOKQGocF+1o4SQd/G9rJgd1n7Ez9V+HY1Wg9EaISkpuvXCSnFmWJQHibbUw5XrrpcFBZ1X3qismNkptFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znsC665yGCk5zE8FKB/DjZh+uBcFbBobBpnEb5l3DdA=;
 b=bLMQP6Y+rsLDmjFa8qpakbCORiztYJJ+qLDH3qav4xhWCoJ2SZn/gs0OkMAba5BvYBkALO0N53DzJeC6oLOMPm44frFDTpC0jatvgEBbCnM354OQx4RHdcdVNHKj4CINqcLRqEsuf5xjjCezCZ310E1ZkcrraBEKdWp1b4wwpG53QcTukuHi7Fvlk1CMwqIoXouDx2sPSSrbvu+ceuf0kAa0dDAZyuHSvzynXcu0mqAxZpgNiFMU+DtRLbG0Yj48RS0ndYn9yO1njzjC4Q6BjMHP36fNm5PaPsh87+8fgCLaHlO2rfpr+VYhTShPfCqA24WYGh8dv37NcsRXy3KhQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znsC665yGCk5zE8FKB/DjZh+uBcFbBobBpnEb5l3DdA=;
 b=T5KExU6oHi4JSE0FnI6i1LDFukEGvF3yDljyV/ClQl4BSHJBaNYi8qmldEre49q89L+A8MOXaMnxG5BqvQGrsTKsAw5XEyUQXz5BRK44W/OPS+BvtHn3C6gy2UOx1E7BDToKQAum9cS77F+oghWO+l1ZOh7YBI9xjKziw4srDWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 5/5] xen/arm: no need to store pages in resv_page_list when domain is directly mapped
Date: Wed, 30 Mar 2022 17:36:17 +0800
Message-ID: <20220330093617.3870589-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330093617.3870589-1-Penny.Zheng@arm.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 62a3db76-fa7c-4824-0689-08da12310550
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB4619:EE_|VE1EUR03FT048:EE_|AM0PR08MB3811:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3811A57B23F9E06ECAF96E74F71F9@AM0PR08MB3811.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NZkBB6e9hupq/LnQ5QVudyRu9/95w+88uvfu88myVoGXs27FOCmysqjjk7D+9M1aEQ19N7ShVXZOMNkPoNoa7FCm1PmkCtGVlHVpiwmFh3u/dsAypEH8EuHCwbSX0dspFBfuSGCdoh8XRl2o17nq0YuhnmjBpHdiIy+xqRwio/baVmx/N0Fn777NidmdbIFknFF/iYSg/Pvv23gIvRVe3c9Afz8FA8jqZBASVBuVwO11QBM9LhzQJZamQ1VQOaGYSKy+baGyIOpdyHkuNC1w7bD0J9LQhSZN1exGMIpNuSbqQfI8KaeK/WgBJSNmyTid0PZc9TA7SzdcokS/4ks6/DXtYwBlO5VvkX+Llv8LX3+UtB0DTtjv4WrMzzftqaENbYxv9Lm++BcCoKEvvANottkXqJYEaz0k/wkD3hXUp+qXClMvFUIIOB1BWHheKs24uGo1sTH4JUfjMYUvv35XR0lwcQDppv+Z9DrbCEqC+2UKcYOa027JmPJOAwouWtM9BToiNmj34zNGiqSWR/6NzF8dPaFTrQnyiHOsA90llOjUrUC0Mbw4/AlEdqQeu/0yamUbDkC4We2MvBaJRkmod4mzF54AbRPTTB67HiKE2MLp0Z+uN3opfD+wA0qbqtvCp5DTPKSmvpxIpEP8ZyNg4wcomupOq40hmOUPapIgwLLoJhkty4VkFWqF53CKrpJwK+pAUIVgDp8Il2gnPflnmQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82310400004)(8936002)(70586007)(70206006)(4326008)(508600001)(86362001)(2906002)(54906003)(6666004)(316002)(40460700003)(5660300002)(7696005)(8676002)(426003)(336012)(47076005)(83380400001)(36860700001)(2616005)(6916009)(356005)(186003)(81166007)(36756003)(1076003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4619
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dccf726f-824f-47c1-2657-08da1230fdb9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lWM3k/m7UqQdLjSs3IhQAA0Es5x6w8PWTOAD4qq0SZO8ERwzu3hT5gBdcXSCSKGyIk9m1UiL+OopRVjTpZZN8GkxEmP4fgb1wf+7fR7ObhD0yDT+jC8OUvsa8YuaMcSkxbJ0M/2YyCaoe6M2RTV4gRfS6ZyewnC1YGHvulMY2fIurjsUw03e2dJlUTNcJVq7Hi1NFtnG05UHv3X1ebKnW7i5d5ca6r08Zr/R55jsNAsowZlZdlas6NRlBaXFFZtl3LBA3IDgPnKDJjL3RslrzjcgDnWkHkRLmoup7YKg/2UPC+g8fkcetUDiYSrUmZGNgxL0uJbJrF08Q9lQw310Nj1tiXb9XNn6aiT/sqW9/+iNHXR4ErxiFej4mqbU4FGRP++Mo6guuuVf4ZX4cQ6Xk7a9TIO5SeEAsxIj0F+F/UwvW6qTaTUla6lkawwiiJgq9yb7brqCRCqtuRtssDHIqhUvdyzmgcHZaIcea81WQJqXMc0Hm9gf3FejzQiCXRHRMFG4Fk4AyBgKDnkDN0srNnxHF0uzNqLtWsK/cX/W4hYvjFmNU9m9vSTxsNg0jDuDMCom3CIrpsRgNnfHYCfJv4Y56WDO5f1rfwQEussiCyf2R1DU6tXyIaYKoc6G7CZEguyNh5rGEVYHf7GLmOEr7TtStWxTgqGMT+YOgb55gv36ig6TQ3RjeItUVQl0TYM0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6666004)(86362001)(8936002)(508600001)(5660300002)(36756003)(4326008)(8676002)(81166007)(47076005)(7696005)(70206006)(70586007)(316002)(1076003)(36860700001)(2906002)(54906003)(6916009)(82310400004)(336012)(186003)(26005)(426003)(2616005)(40460700003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:38:17.7116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a3db76-fa7c-4824-0689-08da12310550
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3811

When domain on static allocation and is directly mapped, in terms of
GPA == HPA(guest physical address == host physical address), we could use
mfn_to_page() to easily find the page, so there is no need to store pages
in resv_page_list.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/common/memory.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 2122ceeba7..2865e09a33 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -445,8 +445,11 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
      * When domain on static allocation, we shall store pages to resv_page_list,
      * so the hypercall populate_physmap could retrieve pages from it,
      * rather than allocating from heap.
+     * No need to store pages in resv_page_list when domain on static
+     * allocation and directly mapped, since we could use mfn_to_page() to
+     * easily find the page.
      */
-    if ( is_domain_on_static_allocation(d) )
+    if ( is_domain_on_static_allocation(d) && !is_domain_direct_mapped(d) )
     {
         page_list_add_tail(page, &d->resv_page_list);
         d->resv_pages++;
-- 
2.25.1


