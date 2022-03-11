Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595924D5B69
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288712.489697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW1-0000kt-3y; Fri, 11 Mar 2022 06:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288712.489697; Fri, 11 Mar 2022 06:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW0-0000ek-V7; Fri, 11 Mar 2022 06:12:40 +0000
Received: by outflank-mailman (input) for mailman id 288712;
 Fri, 11 Mar 2022 06:12:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYVz-0008Q3-48
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:39 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe09::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 401d07cd-a102-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 07:12:38 +0100 (CET)
Received: from DB9PR06CA0007.eurprd06.prod.outlook.com (2603:10a6:10:1db::12)
 by PR2PR08MB4763.eurprd08.prod.outlook.com (2603:10a6:101:20::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 06:12:35 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::3d) by DB9PR06CA0007.outlook.office365.com
 (2603:10a6:10:1db::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:35 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Fri, 11 Mar 2022 06:12:35 +0000
Received: from ee42f0a71c79.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52173E03-777A-4219-8A16-B8A7E30F730C.1; 
 Fri, 11 Mar 2022 06:12:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee42f0a71c79.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:29 +0000
Received: from AM6P193CA0100.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::41)
 by AM6PR08MB4785.eurprd08.prod.outlook.com (2603:10a6:20b:d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.29; Fri, 11 Mar
 2022 06:12:27 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::34) by AM6P193CA0100.outlook.office365.com
 (2603:10a6:209:88::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:27 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:27 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:24 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:22 +0000
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
X-Inumbo-ID: 401d07cd-a102-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tUy/0RXwgpLcKCk4dgzOJCVdOMJ/pIH58P1Z/r+6Ms=;
 b=8AAxO/XQZbs9mKqqiBvUKePnRIfdB97MlrofFNBffhBA419DgSdnSlErgygiJxfJO7FY7eTe/M0okFsyvZ0aUnJp5Ub7aFYummkfyhqdaGleklTBixAoCFYKwi80fOYWFbpbt8kA+7YLVehfRYSokcfrsEp9dHUAAsh79tXwINE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2fe5afede2149a2a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nz2IqV+9TTz6sdPjRlH6hcPMppdkxe4txsu3HLjSwiekouz6gLpEj7GXg46Ym04eq7myHhRRIsBbAeiFqd6aIfNXOFRulb/KlKiyI6YB20kScu6ZxuqE9Q+jgAJz8b8wyCM/i5MovcbnOTog8L+P1ox1dNNSfdp0aIS9PEwWbhEysRufraSGZQpnOv5Q0LOgA+WQEV2Zko077JEjjXUO2dAfbWdNjhPwMKgk417O/Nogn5f1JzsU/XQCd/G00UfIkaDVtJZAMiMaxLrkWZ36h3ckT+WzU6rXckGyd8rY+osF7RUMvyrmYI6i0WISujIhPQcG7vp57hABTfJDXDoxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tUy/0RXwgpLcKCk4dgzOJCVdOMJ/pIH58P1Z/r+6Ms=;
 b=m/k3EKXbeVect56qh7hRMes04UP22AwB/5bsntYqaFi+jkxxNdh9zYBVHWLg9t6R80nFi2AIK3WdvRn5fwu9TQn4OCVNIH1iAw6d1K1dv3bXDwr/GRLoOsj+6SZrV+0hsKcuSGQXvAMCG91dvoT7e88qLzX7XHx7puMpN+cw5XPUsMO6FeIu0racbAC2rlBjAe1SSPgwoNEHTN46g24vDY21kCmqbdBYH7cPY9QmlwA5aaAfB2KabJPUdRint8w18UUa/8ebuFBbvYGZaKCqe3bFVYDXrEk7xfKC8HA8SdkmaaO9Qbyla6Adsm1N4+6LgYCHR4w8/+VIGfeIBIMGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tUy/0RXwgpLcKCk4dgzOJCVdOMJ/pIH58P1Z/r+6Ms=;
 b=8AAxO/XQZbs9mKqqiBvUKePnRIfdB97MlrofFNBffhBA419DgSdnSlErgygiJxfJO7FY7eTe/M0okFsyvZ0aUnJp5Ub7aFYummkfyhqdaGleklTBixAoCFYKwi80fOYWFbpbt8kA+7YLVehfRYSokcfrsEp9dHUAAsh79tXwINE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 05/13] xen/arm: introduce get_pages_from_gfn
Date: Fri, 11 Mar 2022 14:11:15 +0800
Message-ID: <20220311061123.1883189-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: d51735c1-b30d-4373-cc63-08da032622e3
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4785:EE_|DB5EUR03FT050:EE_|PR2PR08MB4763:EE_
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB4763C7AE1373A27C64C8C61DF70C9@PR2PR08MB4763.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DUBojstnuxMuYIKIy30FD3+PUuUGNekrPc2JEaanLlZNB5/fiwOHqMnUMjsxq/BPYy3Kank6ds6ftjhRYEELp8/kTvRJAcZMc7nOrGQUs6NuwaagF6XpL2jvSH0oxkciCcBDSEDi3SjBQ3Z5UmHVKAqOCBK6Wyw1JeEtV29ldq5bfCTTNUBHulIjTjm4wcFOpPW6cd6x4cE9FtvRc9wX6EUfKWXkNlP+rewGGQJ9rw9D9lY/+1LYS1bEQEu1UaeqcXHbudicy63EDSKQnRHkPVUhLmXGct36x6UJyu4MkgA2fIc5EGOF/M7pbeZKPjRpgamG6cn6tGT9rFT6fbit9xeGMOKLHEpedtXpaDVjv3SjXhfLidSW++ESZPlyLP3dAN0w2u28zCgzUfujMN8vlhNRbXLh9bIekh1xApMFfcJasklX8t2OLPT/ft3Ql2C1UB9bNrlM/yP3kbKh4tX88KyHmZ0liQTkbLhBCudOuBLHguycU52EvgEa1E6TFbEhSlsHousm4h0zgfkynt+Sw64xpdZaEmMvFORbsbUYM6y8TW1bqV/P82rcyNbP0Jyb0YgJrJ9c2wOUYA4TxSPiZfUieTrxftoA1LwTZfz4U2vcKJJW5C+A62DhI+rhfLx7Hg44hweW7alLMvVOyQB/lTOGkQUfA9/O/8oYfG8PdaY3TZ8HFaIYBJnUnY5eBqyU0w9EC91T9X3Mlnn629iQ/A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(508600001)(356005)(6916009)(54906003)(5660300002)(316002)(8936002)(81166007)(47076005)(8676002)(70586007)(36860700001)(4326008)(70206006)(83380400001)(186003)(26005)(1076003)(336012)(2616005)(40460700003)(7696005)(6666004)(36756003)(82310400004)(86362001)(2906002)(426003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4785
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	73a9ee89-54eb-4df2-f584-08da03261df2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QuOUcR3KkLiURbcG5aYIBY+MzhYnTx0tbRlB5FHx3mfvo/HZIZl6EZ2I29npLK5zihY8i7zlieGy5RfkgjYExjh2W9fyqi7pLGzVdU+APL+fm7hqW8Kw7MF0EtJnmHbhtRKuKAiNP4USkOUSX0bylxn+yiMxNADp0xy74YAXt7PA2exvxapw9lMh5HiePyTJSycdNuxsiewDoGvYqk3lhRrVklENAsprNMsEjSYV0BcqAntqVv5YZGJRAHPk5vFgAOP12kzMfnfVPz/m/Y+cYDpou4V83Op8kbrsw8nTyU+oMYgavmVEbhBWBGIttdkvoi5geo5dWIdy9Q/0NGwLbguqYTrlvazEuUsyh6/YLtsw9M9fNogTQFJSGZzjVZQMh0O9v7dS0mXQ5mCSO9l5aSlNAhhrIkcK7TQk2pAEwaFJJwC/0tqzJyR68M6ah3Sv4i1kIHY4ofMgaY688niL8j+NeDfkVvQ5cGLIeaEhHaNikOvyS9OCOA4jxVwqoMIyhp8rQ7TXDnWCisTwgPlMUnDrmXrRzJS8LcRvi0xeE7Q8Bl0cWxwHLtcQK40it8yj+Uhe5BW6AxX/ZFY5zr+jLyrfsWsPF/phQEF9gnGTox6nYFqqaMQwwzpzj/ZsphhTyGRhTprK70ybcpjvp4ytOyr8mY/W2qtRyienaDdDBQpHU8t6kr4WXlYrnW6oFZs/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(47076005)(36860700001)(5660300002)(86362001)(83380400001)(8936002)(4326008)(8676002)(36756003)(1076003)(70586007)(2616005)(426003)(26005)(186003)(81166007)(336012)(82310400004)(316002)(54906003)(6666004)(7696005)(40460700003)(508600001)(107886003)(6916009)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:35.5341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d51735c1-b30d-4373-cc63-08da032622e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4763

From: Penny Zheng <penny.zheng@arm.com>

In order to getting statically shared pages based on gfn with nr_pages, this
commit introduces a new helper get_pages_from_gfn to acquire a set of pages
based on [gfn, gfn + nr_gfns), with the same P2M type.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/include/asm/p2m.h | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 58590145b0..b23024b9a1 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -370,6 +370,43 @@ static inline struct page_info *get_page_from_gfn(
     return page;
 }
 
+static inline int get_pages_from_gfn(struct domain *d, unsigned long gfn,
+                                     unsigned long nr_gfns,
+                                     struct page_info **pages, p2m_type_t *t,
+                                     p2m_query_t q)
+{
+    p2m_type_t _t;
+    unsigned long i = 0;
+    int ret = 0;
+
+    for ( ; i < nr_gfns; i++ )
+    {
+        pages[i] = get_page_from_gfn(d, gfn + i, t, q);
+
+        if ( !pages[i] )
+        {
+            ret = -ENOENT;
+            goto fail_get;
+        }
+
+        if ( i == 0 )
+            _t = *t;
+        /* Check if all pages share the same p2m type. */
+        else if ( *t != _t )
+        {
+            ret = -EINVAL;
+            goto fail_get;
+        }
+    }
+
+    return ret;
+
+ fail_get:
+        while( --i >= 0 )
+            put_page(pages[i]);
+        return ret;
+}
+
 int get_page_type(struct page_info *page, unsigned long type);
 bool is_iomem_page(mfn_t mfn);
 static inline int get_page_and_type(struct page_info *page,
-- 
2.25.1


