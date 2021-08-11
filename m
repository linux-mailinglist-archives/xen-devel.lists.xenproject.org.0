Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A9F3E8EC1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165810.303058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWh-0005lx-Nz; Wed, 11 Aug 2021 10:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165810.303058; Wed, 11 Aug 2021 10:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWg-0005aU-Sh; Wed, 11 Aug 2021 10:31:58 +0000
Received: by outflank-mailman (input) for mailman id 165810;
 Wed, 11 Aug 2021 10:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlTm-0000BQ-Ji
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:28:58 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b19cbc6f-9eee-46cb-b1be-8ae1a1c5ce56;
 Wed, 11 Aug 2021 10:26:13 +0000 (UTC)
Received: from AM6PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:92::31)
 by DB9PR08MB6348.eurprd08.prod.outlook.com (2603:10a6:10:263::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:26:11 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::b6) by AM6PR04CA0018.outlook.office365.com
 (2603:10a6:20b:92::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:11 +0000
Received: ("Tessian outbound 077ab11054bf:v101");
 Wed, 11 Aug 2021 10:26:11 +0000
Received: from db816a265a1c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 27D4D6AE-CC55-44EF-B201-B565A8CD2269.1; 
 Wed, 11 Aug 2021 10:26:04 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db816a265a1c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:04 +0000
Received: from DU2P251CA0015.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::19)
 by VE1PR08MB5133.eurprd08.prod.outlook.com (2603:10a6:803:109::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:26:01 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::2) by DU2P251CA0015.outlook.office365.com
 (2603:10a6:10:230::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:01 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:01 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:59 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:57 +0000
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
X-Inumbo-ID: b19cbc6f-9eee-46cb-b1be-8ae1a1c5ce56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jK2PW/1OK3X6TWEry7lKAeMTQlsnddWZt6g/VQHny0=;
 b=sg0C3ioq+ACGGnKELxsgmh+BHHbvmmIkaWxkwrySzNc7kbFgtVgVPI0hBqCpkOMPaebfOCu5NkemitRGJKtOs/JsuWqYq9NfuY1JRWylQhZ+nuGlgSD/JshYw7gvDGw7eEgrWygGMM9jrFnP0uLDyKrJSpwX+CyDXsJxqfPBNDU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37e791966c4b9bcc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxNHX8MZx05gJtyo6+lS4jeWRHM/30o7f75fCHVbfpUV9cUSmsESI53/8rkBhpxbJ7vsCOvTg2wjxzvRNEMtifD/B22w/KO/JU8QqamoWfzAqPicnXz9U71r8ziE0bPxO4DrS4EOXL8H7e1ODxU9d6OBcgNdgmj5ZyJz2Yeg3Xpvx30aOBai2Z8htACrsKIT95KdbTjuim1dYdDqvAe8Z77depqZ9Ag07wZVbf+p2XpoxcVDBtVBGrTjGUIRAqlOm9dpTcn9Z61pkLE8FXpJHvkVbNv0alLdD64JNzH31V0RF3rSUv0Z94xbz6xE7DdCAnc+L8VbQa/9us+87TzXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jK2PW/1OK3X6TWEry7lKAeMTQlsnddWZt6g/VQHny0=;
 b=fgStff7yY+L1mkSihxdKn7+QWkhKFeUrDuJFMxutfBvJmeT6nlBdn1+mJnBKlGM3nqBqRvFYhfdyrekkQajRnF3inC/HHLckOo8Zc1nyyAQpQc7nGGTqz1BnFjXm5nfBqQIA50pj4jlchmMtYNmjozKGEIvbxFqJtHJETQ86kGjSaFY9uyh8P43ceQ99Hs/JOtIfYYpleioAFS5llBjiUw+GFYVoGK6E9eVck7j6IGanna++mBzFdoFwIEc9RthLKqtdDgAxK+bTV+DZLNeISOrLhTsLUZLykCyLyYWBB29rCLuigPpzC/k2M7Bu7WAm5lbJyKoBCnVgEHZFm/1D3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jK2PW/1OK3X6TWEry7lKAeMTQlsnddWZt6g/VQHny0=;
 b=sg0C3ioq+ACGGnKELxsgmh+BHHbvmmIkaWxkwrySzNc7kbFgtVgVPI0hBqCpkOMPaebfOCu5NkemitRGJKtOs/JsuWqYq9NfuY1JRWylQhZ+nuGlgSD/JshYw7gvDGw7eEgrWygGMM9jrFnP0uLDyKrJSpwX+CyDXsJxqfPBNDU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 36/40] xen/arm: keep guest still be NUMA unware
Date: Wed, 11 Aug 2021 18:24:19 +0800
Message-ID: <20210811102423.28908-37-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 424edb30-3815-4983-ade0-08d95cb270aa
X-MS-TrafficTypeDiagnostic: VE1PR08MB5133:|DB9PR08MB6348:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB63489EB5B69AFE437C22B2769EF89@DB9PR08MB6348.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pgmEJHhkc+S7yCR7TsJ9+YUM/gvDwc1dysiaIrrVckk2Eqe/LosQP41kHNOf85LcjRFC2i2ldhYXo9JZkEEmklhur8j/cYPpQRFgxWBu5p7p+G+RNn/gjn4LAinC3JjEECNbUAP5uQAG0rZpuLLS32RQNfxP6Wc3ffKmsgEQwawZZynEX7mWkeCb/QDXG/p1mYYJQkypBXzGI6m7cUsTbtkP48vJRUoJCsgR7uvguPZUxq6FNK4RD1Dxht2VE5KKg9BIAu/1kxBS/Pqe1JYdsqbQA9rDeYHNG8YHI0BvD/YJIndC1b170wDpIhXzUX/u4zWK2nZYdKun8xiXGeC6FZL0pwX1lM/hzU0BqnMrg1F3kUkBIfZ1Ts8QILRlRpDWKVKCtzlMnAsdmRYMXmOSGpURYy5hXEexKidnzujZGJMnBNpxZEuPi9BCXsIdbavCyRdgA4QfU8s0a72JBjn6eNqS+BgmcedeegV86Z4pj6TX2sj1n4bb9PHylb7I45VYdzyz/CjOEKzYncb8w2J5xWAetOEMd22Y2Sz78GJ+/PwqunsOH9drRRZhZlcQXqVu4fzYPyg+fR0C+i0Ty/1Io9Ib3DgoKRHnZUP52djp4RVw9jxb5WXaEWgLBHyui0mNGbWnTn7rlKYuXv/P9M6Kpw3k05ZDEs4hLFpj3pwpR9X1nHE1nqh6lnVWBU9tkOnvAmbsCrfDLVSoZXrA5dfgCZnmxX8ipCV2aUg6fsrsenCVO0NyrkMRhc+2Gt1hCDP8DnJdHLGcH4hMUeomgWjZFP/OsGHfRfDkAlob8MqeHIc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(36840700001)(46966006)(82310400003)(356005)(426003)(26005)(4326008)(70586007)(336012)(36860700001)(1076003)(478600001)(2616005)(86362001)(5660300002)(47076005)(8936002)(7696005)(70206006)(2906002)(186003)(110136005)(8676002)(316002)(36756003)(82740400003)(44832011)(81166007)(34070700002)(6666004)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5133
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54d64f97-3fd4-435b-e325-08d95cb26ada
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4QdhahvlHORyZ3sIo8iXC4gWRagCHwh0F00y7nMk0iOAP33vS0MYSPUzVX6hH4EB1CPd+U/zhGOkQcA6EICIjyXL/73hCAJU1qZENjJDnYQVgjZa3Hc70tTquIAF8FmOjnmo8XwZGf+qu9H7nUMkHGMGI6xc4eg0Q6/bsmXrNAArGMi9zIzIWtAMgj4RK8BCD8H6cXlO5u4u4FzsCVQUBvCEhCqnezqV7ZoBarZdzD8JehHaz+VCnwoa9fUEgmOvNgGZ+KFqG2v3mHD1O7nvxbjwL5QVBVcNCh5JfJlnmYbyrKpmRSxHhFuudOBPPwUs0w5HPYMDi/6XVDRd7p8/eGa5Gkyh5Smt2p0hRt/3rexUMyBlGnerQX9jiOu8Gx1/qenz2hD7YtXaW9HWG0F+wSMzSt36VDFW50JtEP8psSMeQnBUei3pnW1NgBIIdQiBKIuidaVr4yPT/BlFL9F5B72XkTrOPJn0AdLBv/VZBI8fQFMB4nk9KnSHDtyElPrMc8uoOqVbFf+Kf6rHB655W9FCv0X8nIHk4F++sfHKRMZMTaetws0NWU8iKMbgA14MeUTay+2jT3j8z+75TNh0iQ3NaCKkMsARMtPN04cBnDqmb9yHbTh0sFWenoZMUG5VsOWG7gx5tIIvA9We8hHdmmJ6uaPmtz2qGnSoqfUibb3Mvocy0o70hDxgjH8Ny7Pjbv3cZ+u0pTTW9tqadiKXEW9bfCOJPka8ydU7TPguV7M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966006)(36840700001)(82310400003)(426003)(47076005)(82740400003)(110136005)(316002)(2616005)(4326008)(5660300002)(478600001)(81166007)(36860700001)(1076003)(44832011)(2906002)(7696005)(36756003)(336012)(8676002)(8936002)(70206006)(186003)(86362001)(26005)(70586007)(6666004)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:11.3144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 424edb30-3815-4983-ade0-08d95cb270aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6348

We have not wanted to make Xen guest be NUMA aware in this patch
series. So in this patch, Xen will skip NUMA distance matrix node
and skip the numa-node-id property in CPU node and memory node,
when Xen is creating guest device tree binary.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/domain_build.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index cf341f349f..e62fa761bd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -584,6 +584,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                 continue;
         }
 
+        /* Guest is numa unaware in current stage */
+        if ( dt_property_name_is_equal(prop, "numa-node-id") )
+            continue;
+
         res = fdt_property(kinfo->fdt, prop->name, prop_data, prop_len);
 
         if ( res )
@@ -1454,6 +1458,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         DT_MATCH_TYPE("memory"),
         /* The memory mapped timer is not supported by Xen. */
         DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
+        /* Numa info doesn't need to be exposed to Domain-0 */
+        DT_MATCH_COMPATIBLE("numa-distance-map-v1"),
         { /* sentinel */ },
     };
     static const struct dt_device_match timer_matches[] __initconst =
-- 
2.25.1


