Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE573D8BB3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161425.296428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8go3-0005FI-AA; Wed, 28 Jul 2021 10:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161425.296428; Wed, 28 Jul 2021 10:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8go3-0005Cg-5q; Wed, 28 Jul 2021 10:28:55 +0000
Received: by outflank-mailman (input) for mailman id 161425;
 Wed, 28 Jul 2021 10:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8go1-00040B-Ie
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:28:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::628])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a0e5ef1-843b-4116-aa70-f155df538fc3;
 Wed, 28 Jul 2021 10:28:49 +0000 (UTC)
Received: from DB6PR0501CA0044.eurprd05.prod.outlook.com (2603:10a6:4:67::30)
 by VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 28 Jul
 2021 10:28:47 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::16) by DB6PR0501CA0044.outlook.office365.com
 (2603:10a6:4:67::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:47 +0000
Received: ("Tessian outbound 1942ea606101:v100");
 Wed, 28 Jul 2021 10:28:47 +0000
Received: from 824baf3abbc7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18516FEE-9590-4434-9503-CB263F55DF89.1; 
 Wed, 28 Jul 2021 10:28:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 824baf3abbc7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:41 +0000
Received: from AM3PR07CA0090.eurprd07.prod.outlook.com (2603:10a6:207:6::24)
 by AM0PR08MB4580.eurprd08.prod.outlook.com (2603:10a6:208:10c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 10:28:40 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:6:cafe::73) by AM3PR07CA0090.outlook.office365.com
 (2603:10a6:207:6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:40 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:40 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:37 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:35 +0000
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
X-Inumbo-ID: 7a0e5ef1-843b-4116-aa70-f155df538fc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq/CVp/Ccy89yXBl4+lKWxTcJAN2riHCxWA4scIZ/gk=;
 b=y89XdKUP6fMzJgqTnuICOwWs1J4FA21prd8h4m64CE0HmvURKkM633vRr57CoLwynTl8n9fUpqHvBsiUfJEcgvC6Nu2pWuPNCHhZjekaSH8LVgwPaCcTr2/ntCzWA1w7ms+RF7hALbx8btGKP33U5C+uUt9Qg8EgNxElEkvcsrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87a4df21130eecb1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyawuLUc0VdWsIVBAc4Ffaqr0TTx+O64R7m0SGgXVlRmJ2YFDg/OfJrKVwOHAKWwnEZ0cnxkARmWqtYoQnxLqLcHpn13fzQxhvspME/eRdrXXaPshO7YrFfKkfj662/ti9FKIou81tW2BNGrrOVWZ4iMPHI0aL1Ijown/+bLK6gyY8nfTZ73UeLQZHrH539BdWj8a0ffvI2vrB6+eTZ+YgegDz4oxgrZVO0SWC+kJ3s/ulzKW/6Zep6KozgWS0/9TivgxHpIDGKl9EM74TKSkdoZ6d66+9/vXifc69/eAOpwDIhAuufu6kQn7Px1hVmb5ac6j5LrrN6ucMuJiN1SmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq/CVp/Ccy89yXBl4+lKWxTcJAN2riHCxWA4scIZ/gk=;
 b=An0ALzUDtTqXGssePqPdmijk+t8AGpKGRuMaLwpnozE5Ekfc0PXfBhkKqvTbytJeco1wEXehnCjGq3I5DnHc0JLRBG9VU79VsHeWvyO0WiJqABcisr9KZkTe7BYmSN1xdvdk+3iAHcGROm+EBUehd8oSsLa/Ah56IOznp16awo8BWVEMCQFYEfikQB8w9XO16SkODYTVVlfTeNdzKfzseVKfpvC4MNv4G4HIyuG4R5wP680fiKIt7GViqx2AtDDg8Ys+CEF4Mo4PsCJKola4M7TnTRCsaCfJMoLChzuG7J2tTuSjyGuz1WHxxMv2uvo2W1Cr1J6Jv6XePP3nXjnrbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq/CVp/Ccy89yXBl4+lKWxTcJAN2riHCxWA4scIZ/gk=;
 b=y89XdKUP6fMzJgqTnuICOwWs1J4FA21prd8h4m64CE0HmvURKkM633vRr57CoLwynTl8n9fUpqHvBsiUfJEcgvC6Nu2pWuPNCHhZjekaSH8LVgwPaCcTr2/ntCzWA1w7ms+RF7hALbx8btGKP33U5C+uUt9Qg8EgNxElEkvcsrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<nd@arm.com>
Subject: [PATCH V4 06/10] xen/arm: introduce PGC_reserved
Date: Wed, 28 Jul 2021 10:27:53 +0000
Message-ID: <20210728102758.3269446-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10c93beb-31dc-4980-060b-08d951b27c05
X-MS-TrafficTypeDiagnostic: AM0PR08MB4580:|VE1PR08MB4974:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB4974289D30AD656B0C64461CF7EA9@VE1PR08MB4974.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /zSPlKVUKfFkwodmYumipm35csRyivtLk04Z3AFbmpNoI+6cC3XlBhK3a8D3g3nsiU8Sk3NUyStJBuOnKgVwNB7UyFhble0djf8CUfcwWAIbLORMY3VV+iQy4LnhkLGN1/BUGfJD75WUkw8Nb6eeZ2+WzotyarGaGo5oxD2AFpx8nxozDPiSAr8Nfx1QfaIY5J7j1mDJ01ILxsV89FwmQ9cb55fyEwNIdmgRqab5iSF9c9O4fqkgLv/yJiCkbCTY9fCKacSjlpqbRndcWvcBP0X54k06xKJWq6OfH6FrPqmhdXtas0BQuGLFdc2cq/RZYJtEFIRCAwhOVjRuM0VUYzPYzb2zJVbNT8MO0kjbe0VUN4Vt7hAKdNCupTHWZcpNXS3qv0xSzPobKmgx64JHlMkfSOj3SUQEGUeiQs3GU/0mPQHEsYfbWd2NePgfaM/RLZ71QPQpJeBVfc2mmhZ40Yn8VKaIB7pZnVAWhUDZX28jqvGVDZOG+2253TP+mwPgs6MKMMPLtIXPKNJJ9kocbi4BygwW0VxCKK2hUdt5RnCPM2vv/HsFfc7jUb9yvEId+90LO5WLVWbZT3ubGPVB20ljjoFNJl/6C3kPNVPXjh1qodL+8cIfo1j7SgGLm9JWXcuWKYnqIPMYAz9B1Mdhs+cTnqKPsXgval9bWmv4jkPxM9x7xBnbZ28/d09NT96ZTqsW85Xnt1YUgxFSHICUYxhuZRGPUuXgz3p4qEVx77M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966006)(36840700001)(336012)(478600001)(2906002)(26005)(6666004)(186003)(82310400003)(36756003)(7696005)(86362001)(356005)(5660300002)(44832011)(81166007)(36860700001)(70586007)(83380400001)(2616005)(426003)(1076003)(47076005)(54906003)(70206006)(110136005)(316002)(82740400003)(4326008)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4580
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e8eb35b-a2c9-4526-a0fe-08d951b2778b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2sbfYgLwNPMwhJyhR+ZdaOQj8o7X0Fx/YlcmJC//i0CKFdt7SPgVo2Z1iZyp41EE1wSQcuz+QbdRe/TrkoQS/AZYfr7Sm+9RacEJ7PYwUw32oKR/lw/9aV+oUqVYFvQdrsbACqUiBLQaGkVBJAu//QQACvmFTFhPj/Bp8fXMGKe0A0jHmYUMyCryrvgvK+re3KaStXNf6bHymYb5f2tfHwomr12wkU+TWA/USqN8zLLvqQBv9cotED1JzXX3B2aCRLQi7usHdxFT7nY+E9Bf99hLAFd8yZvKJ3jVFK36WUuWM2TYYBF6Zy4wTnYXZKmYkER3vylOSbppmbal5dVCLCgXoH+1xtRaEzEEQfGTZhf4uqYiHyUBsbfrYmFGqmDpLq94oZxF2S9m9WFf3NO14nvJ+LaKtDtnQKbgnRWwTiasRQZlKNDAN9PuioOaPCHHVwfY+aZSGH6L9p1Guk5FW2egFYRisE/XZEWcdvIYjjaITSW85IOod2JFRJoBle+SmPZN6EuwsKDXQ+u92JEXhuIu/U39/9J8Y5B4dpKFRE/RQr/urw5eTBVeWSwcFjr/JUItoAKd6ciD5ILYS00/i6oKt7a505jMlSZ9zKNuPKVMX6MsunT0/ufvfX5yKCSmkEnWjza27KXerBZ7rTejPfspA7XRV7wDSFAfriQDG3DLSjCxwM+FnzPT9kyJ8uXefllVe1TNC+PHo6lgdrA3sA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(36840700001)(46966006)(6666004)(54906003)(110136005)(426003)(82740400003)(4326008)(36756003)(83380400001)(5660300002)(44832011)(70206006)(2616005)(336012)(86362001)(36860700001)(316002)(47076005)(8936002)(81166007)(186003)(7696005)(1076003)(70586007)(2906002)(82310400003)(8676002)(478600001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:47.6308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c93beb-31dc-4980-060b-08d951b27c05
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4974

This patch introduces a new page flag PGC_reserved in order to differentiate
pages of static memory from those allocated from heap.

Mark pages of static memory PGC_reserved when initializing them.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/common/page_alloc.c  | 3 +++
 xen/include/asm-arm/mm.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2acb73e323..f51e406401 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1536,6 +1536,9 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
             /* TODO: asynchronous scrubbing for pages of static memory. */
             scrub_one_page(pg);
         }
+
+        /* In case initializing page of static memory, mark it PGC_reserved. */
+        pg[i].count_info |= PGC_reserved;
     }
 }
 #endif
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index ded74d29da..7b5e7b7f69 100644
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


