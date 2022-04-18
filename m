Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE86505086
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 14:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307190.522491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQPu-0002fA-KW; Mon, 18 Apr 2022 12:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307190.522491; Mon, 18 Apr 2022 12:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQPu-0002cu-FU; Mon, 18 Apr 2022 12:23:42 +0000
Received: by outflank-mailman (input) for mailman id 307190;
 Mon, 18 Apr 2022 12:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkN/=U4=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ngQPs-0002c3-Qa
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 12:23:40 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f1db000-bf12-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 14:23:39 +0200 (CEST)
Received: from AM6P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::18)
 by VI1PR08MB4208.eurprd08.prod.outlook.com (2603:10a6:803:ec::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 12:23:33 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::85) by AM6P192CA0005.outlook.office365.com
 (2603:10a6:209:83::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:32 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Mon, 18 Apr 2022 12:23:32 +0000
Received: from 004be2d42b56.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3F84FA2-5A5B-42EB-8079-4A7752AE7F25.1; 
 Mon, 18 Apr 2022 12:23:26 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 004be2d42b56.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 12:23:26 +0000
Received: from AM6P193CA0094.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::35)
 by VI1PR08MB4623.eurprd08.prod.outlook.com (2603:10a6:803:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Mon, 18 Apr
 2022 12:23:22 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::c1) by AM6P193CA0094.outlook.office365.com
 (2603:10a6:209:88::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.21 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:22 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:21 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 12:23:20 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:12 +0000
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
X-Inumbo-ID: 5f1db000-bf12-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsBClypD3Wkaou4TbtLWlS8ixNFn1OaoB4eWjjlhZLY=;
 b=XMw0DXRrIiWYDMUlgcUxvWzO33jcuxIrFxUjIkIQG5KMtYpwgB5d7bk/BBXBcoNNEoqvDibZML0a+4lOZuShhHz+RN2vcQDx7gwKCM5BmNgLVvya0Dc8bDInoJcrRXOb3OzY9mgrP++nCqUy4WZAzVC2U3qhTRuUSPiecy/RSNA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f18c35403e40e7b4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuWLliA54m3uLQnWMXGz6AaT4+4IEDItBQEgMCFMI+T7TvHa+HSCO3e3oso/c2LMtJgjplY/qjSRfWnQsaWEuLgzHVOO+sSwyFU+TBLw5YvfNkHrAAcrW1bDb0Bl1frXB4ukKe9YAs6NoFFbTWo65RxfV/76Aji+DBfeUwWr/cfMDQr/hSph2/pnC5gosJoBZuurLG96O8zR9fAq8AMFdx6u6Ch2fdcJii9TYW9RqmJsA827LHHG45wQiCFxNDdVe5AnvRq8x3zuFqUbvr5ndorsNXDrQUNL2Gyok4ir4nQ5xdZONgbkzocWw8w0S1vqmxQjxM6iPJ1Mz/XqoLwvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsBClypD3Wkaou4TbtLWlS8ixNFn1OaoB4eWjjlhZLY=;
 b=Z+4r/H9JyyeKjnw2euYP1/ozHcE8Dn0p/X6hHcUceeq64JrOD7VzCQkAcuOLxy4i/w9aFgSXLKgMQ3xHv1NTF76U2NJnbzP27TnmIIbmxUv9buyD3g6R2k3HdijN2ik2oW6zRD7/KK+xrsOXcO0c0ebtS9FOM9Ny+OCvfRlLHVNVa/TtuA49xQ01aGKl3R78p8aHFIWSCo9h+fWFB9+ys3tRBy1qUkx/KMwt54gNnipDTl9rc26C/1LIQa74FbaZK6FH435rDTdgK7cRCzO8nG/jvv6ph3TN8U1XbNUClBAWIW6QT1iZcHq+nsauDk7cFVDqJuNMl9Jm1ftpfvrj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsBClypD3Wkaou4TbtLWlS8ixNFn1OaoB4eWjjlhZLY=;
 b=XMw0DXRrIiWYDMUlgcUxvWzO33jcuxIrFxUjIkIQG5KMtYpwgB5d7bk/BBXBcoNNEoqvDibZML0a+4lOZuShhHz+RN2vcQDx7gwKCM5BmNgLVvya0Dc8bDInoJcrRXOb3OzY9mgrP++nCqUy4WZAzVC2U3qhTRuUSPiecy/RSNA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Penny Zheng
	<penny.zheng@arm.com>
Subject: [PATCH v2 2/6] xen/arm: do not merge reserved pages in free_heap_pages()
Date: Mon, 18 Apr 2022 20:22:47 +0800
Message-ID: <20220418122251.3583049-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418122251.3583049-1-Penny.Zheng@arm.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 345cdf11-6447-4125-6ccc-08da213640d1
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB4623:EE_|AM5EUR03FT063:EE_|VI1PR08MB4208:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB42080EAA77F992417766AD19F7F39@VI1PR08MB4208.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DUe8vwslOtQMM3VjM/l2nefFS84nARDr4352AY8d4ixXR1jt8VzU5BCAuYzApb2eSw33RALJzy41Wb5AcCU8zhV/Qau4jxcrfsmh5FgqwALH9lYCnP80qc9m3IAeSF1EpSP3FH15i4/YMVDG467dennqFfy7u0TNz1auL7ZY/Qiq66HtLEW2luBCP4DB1V055GBEsoLmKF8ruPGI0/0qffSiX/kv1kpVDCYvYbOqQVFUnXXFksD906PG0x/dJzGHkTc7gf1ZUhh96jOFohJxFQ8aQhldn/viuBYW2Rix6XzYC3GkYvO2rYr6D2ML/M6bfI1iKKrLnH2aEXsVXzkugNd6SCrU56J7i5lezlj3Dw1WGT4j8pMiue8iReO3UqlcFTAXs3vaV5DQX+tT/t/2MIzgEnC1YkS02vAaBZ8w6vNADRkSWG8viJ6lS6z2fpYL1+5fCJ+ghKE+AJ0CcxBS4wO8TX9Vaq36+69TM1Ovg6oGMWoljzJYLZR0TUsxOKt/p+4i07liob0EOyo8bwoA0P+znRhJatS+A/0atNSxiLEjM+71cXPdxi2Ix/6HrW18CBeIkBOWi9WhUPcOKwh0lZeIUKCK1pIhF7vPu96t+mvBh7jMTQWiCBlhZTC3GyCNo4lQL28XJfaqVtkAQhdclqcUqe21jlr1N6VeKNh0k+6NI7Hmgguufxkw2o+PpqWD
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(83380400001)(8676002)(86362001)(4326008)(7696005)(70206006)(70586007)(82310400005)(2906002)(26005)(356005)(2616005)(508600001)(81166007)(36860700001)(36756003)(1076003)(6666004)(6916009)(54906003)(316002)(186003)(336012)(426003)(5660300002)(47076005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4623
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	189f755d-ff31-45a7-38ca-08da21363a8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uiPmoukHoBDPcPGxFpmKDJMBH42XjXn7BN7jd5XkIGQTtR/k7rpG9s/HBLhYyeY/WXlPdupVWps+GPyvUQuTL0bOpLxV0b+JKBxNvOmNzw+EYFFv9FG129tvDcAz+X81kfVrrf09eGjuBMSSxbtLGOKgkNMwIKCQxc7t46uTGh9rJ0UO8iuoqDbBMnESc1m88EwzAW/zFkFcHcROHsB98aADt2acSGb83hQG0K1RoMEBziZWxBh7BMfv4d2Fyvj7a7WOtJIEUVwVYfcv7+qh4d3hUV+j1bSOCc45FxB8w0Z+sMuXHUcFy+J39q/rSwbeXAWQxWT7QcHoRHFdeTFxuuTfHahp9e2VYmMHRZtx2L/WXOgDzR5FpLrfPYRJoXHJUoI4Ztxwc8qAEljkpGOdcJWj2I/6AQM/TugSW9HgpSQX7eVpu6BhJBRdwf17nbkzcj6HzREk0Wv5znvqmNTCEakWNy2y6gRNJON2ksMcB0TB+QK+kjU7sgUUOFV+QLuN/4Jtow8wgQTEDAnMJbEIGDzMuNOecm+ggdGIa6HCSEmshc7EnIsYu/7Kxw28ojRyfxQ7tyNkWC/JJXueNNk1QirpTHiDOpVuAlGfuU/N5R05Nxf2VAjJU6sNhQ0R/3e9gE04OwYKKHeN+ZWsH4747w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(6666004)(36860700001)(83380400001)(26005)(4326008)(54906003)(7696005)(47076005)(82310400005)(426003)(186003)(336012)(1076003)(2616005)(2906002)(5660300002)(8936002)(70586007)(70206006)(316002)(508600001)(6916009)(8676002)(36756003)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 12:23:32.5138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 345cdf11-6447-4125-6ccc-08da213640d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4208

There is a slim chance that free_heap_pages() may decide to merge a chunk
from the static region(PGC_reserved) with the about-to-be-free chunk.

So in order to avoid the above scenario, this commit updates free_heap_pages()
to check whether the predecessor and/or successor has PGC_reserved set,
when trying to merge the about-to-be-freed chunk with the predecessor
and/or successor.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- new commit
---
 xen/common/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 9a3e9c1328..8ba38bca9a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1479,6 +1479,7 @@ static void free_heap_pages(
             /* Merge with predecessor block? */
             if ( !mfn_valid(page_to_mfn(predecessor)) ||
                  !page_state_is(predecessor, free) ||
+                 (predecessor->count_info & PGC_reserved) ||
                  (PFN_ORDER(predecessor) != order) ||
                  (phys_to_nid(page_to_maddr(predecessor)) != node) )
                 break;
@@ -1502,6 +1503,7 @@ static void free_heap_pages(
             /* Merge with successor block? */
             if ( !mfn_valid(page_to_mfn(successor)) ||
                  !page_state_is(successor, free) ||
+                 (successor->count_info & PGC_reserved) ||
                  (PFN_ORDER(successor) != order) ||
                  (phys_to_nid(page_to_maddr(successor)) != node) )
                 break;
-- 
2.25.1


