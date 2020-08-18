Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2F248662
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:49:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k81yo-0008K5-IH; Tue, 18 Aug 2020 13:48:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k81ym-0008Jw-Tz
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:48:44 +0000
X-Inumbo-ID: f92983d4-ff36-4125-bb7a-46d58046ff60
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f92983d4-ff36-4125-bb7a-46d58046ff60;
 Tue, 18 Aug 2020 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvmWqXs3SisNMiyySvdute+TsnHGwvEDQ5mePCpbMeQ=;
 b=M1dqME4u5t80WFYD3++ZTpeSsLGlNWejeo1jl2MD/1GOmhlWHdaU4fkNqhqQZT/zNRfcSAkBv09I5CI3KH5rUzrvzsXn57iTX8NsAuStES4YRWW8oc3+M2j5ORRCo7WIGXzXFqEBja3L96Nm89fo9du77W7A0WRwYHX74W/LakE=
Received: from AM6PR0202CA0050.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::27) by AM4PR0802MB2193.eurprd08.prod.outlook.com
 (2603:10a6:200:5b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 13:48:42 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::c5) by AM6PR0202CA0050.outlook.office365.com
 (2603:10a6:20b:3a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Tue, 18 Aug 2020 13:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 13:48:41 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Tue, 18 Aug 2020 13:48:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c6bab26cdf25cedc
X-CR-MTA-TID: 64aa7808
Received: from 42bb0d1704dc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5C65DEB-F769-4CC8-9735-250F98F5522B.1; 
 Tue, 18 Aug 2020 13:48:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 42bb0d1704dc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 13:48:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1QLzF8pnAv16pJ2h/PayNqocxAEv2rsu2SDl594wFaB0eP5w/n/DBjBi4BvSg3OJ+lFftJ+6RybVGsRS8pulXkdZmSlbncGRvf7FUroqO2lspeZpciDOsTj8c7M+OZ+1dqtCG/bSCH/pXYDM7BpI9qkHESz2wnjqUCL6m3nJBDAUkZPT00eeTU/l7mEXYgkhM9a44G2vQVcDMYYdNH+LWApuUWeaf+OQpMCKeS76Gs6HmALgbjNW/rm7mSQ6AkNC8kZwPzpSBHr/IIdVNurwOVfRztIvajGHRGbLoQA81T6/G5xby7TmQasSKRYNyTQqTSqRWJ52B9RIk8cr9Qs+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvmWqXs3SisNMiyySvdute+TsnHGwvEDQ5mePCpbMeQ=;
 b=BJ7hhomfiaq5HPIVvW845D5E92ETeoJXqTtYwU3iu0Tgq6UjzRw9Abb3h5RFAANNK5/ABGiKSGsqefQDffauVFm8ZckY5gjMMMgWe5e1WrW6h1sigSTWPE+YZ3yqwxf1WWgyoL4L3xRLs2IivM5M2ICPN0AWuCAuIbwzRo5tR2q8uB+0n34WwiaHEKYGKpuwfWD2qqnta6T3K4z6Tyb5aQsVpbvhcTxii2lwRRyouWW0IMyN24hJZcnbD7RmG+bCZqZIii0CGh9sr8EBFllCmnXu6FFtyCllrIo9I7+Ujuqm6uaiNOi8JribYeQEaB2C7H26HtFJVN73kR+UrxvVPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvmWqXs3SisNMiyySvdute+TsnHGwvEDQ5mePCpbMeQ=;
 b=M1dqME4u5t80WFYD3++ZTpeSsLGlNWejeo1jl2MD/1GOmhlWHdaU4fkNqhqQZT/zNRfcSAkBv09I5CI3KH5rUzrvzsXn57iTX8NsAuStES4YRWW8oc3+M2j5ORRCo7WIGXzXFqEBja3L96Nm89fo9du77W7A0WRwYHX74W/LakE=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5322.eurprd08.prod.outlook.com (2603:10a6:10:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 13:48:19 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 13:48:18 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Wei Chen <wei.chen@arm.com>, Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 2/2] xen/arm: Enable CPU Errata 1165522 for Neoverse
Date: Tue, 18 Aug 2020 14:47:39 +0100
Message-Id: <8680961067334f6049eb5215b3939195d3da00d8.1597740876.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597740876.git.bertrand.marquis@arm.com>
References: <cover.1597740876.git.bertrand.marquis@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: DM5PR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:4:ae::22) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by
 DM5PR07CA0093.namprd07.prod.outlook.com (2603:10b6:4:ae::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 18 Aug 2020 13:48:16 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0a4f5fd-3ceb-44f7-b8f8-08d8437d6b0a
X-MS-TrafficTypeDiagnostic: DB8PR08MB5322:|AM4PR0802MB2193:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2193EEF87692189527D3E87B9D5C0@AM4PR0802MB2193.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: kzxomH/UmWKTw6sRhNbyL884lbRwqox1lV2OOQlKKUAFINSOo3ewXpZpp+e5fAuf1Gkpg1x9MJ23yaKLk/HaAVH5G2VcNfz3GPtDXnzaZ9/I4LEN1sYtlE+iS2+o438VYh/bRBeJPOFPN/easPUVlgWyXdx08dS9IWIhb4ltaLJJy7hpyENk2zCohT8mGlh8DsiQ6VnIn8aBhDh+5f1N2XCZlXOiPbWGzl2jg2D1WmcMeH6YQcsTmW/zqcKVRGQqYawPwPhtyiup+EbxsSz3KIpAfoHPWiKZOxE97XdDfo2o89OL2exJRj+bOLsDdpOUCjSOeMA5Gf06RO1U/2RiNMKi9SbVZyRkC56tAuxk0+XTlUL6DOV8rFvJzwZjUBDc
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(36756003)(54906003)(16526019)(316002)(26005)(6486002)(2906002)(4326008)(52116002)(7696005)(186003)(6916009)(478600001)(83380400001)(66476007)(86362001)(2616005)(44832011)(4744005)(6666004)(8676002)(66946007)(5660300002)(66556008)(956004)(8936002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qj3nfF/GngDWVB+R8IT28dU7m4+hu1CwBOVfVaKrrdKRLMynvSOlIPS1sH80i+kukrZUQWJ6cbFDe2kOYjHJhfYRzBgHv1756jJPfdwMAzNKvrPf0UCGxY7rhO4fpEOpT++pW5mgPY12d80gP9Y5pI8rKhe7ckrufvebsgxmYM02M+4xL6gQ8eqUjtjubJAuhpYmsTaSgJNUvYIm63aRQO/LMY5XryBaQr68n0r9DJUXyhocctjJfBdlBeV5uN9nWLiFriPQpf3RLq0y5M32fAigiPjhjmiwhE9aaXYDsBGOXisbyFNQfNOEuQx/o3nJE8bCthDVHCTDcSIp6fyV0uPiX1ftPQSVde5V9eY9xJs0RWubVzE5w2KrbvRrX4dsroaFfIE3IK2lB9SWw6DO2Sfhjv3V3r0t9oA2tmp93+f4HaHvEbjbfVQi2d7tuGU2AoSq6Idt3pKekS/rK5OoE90TMtx3AM73xLRcz4LqzDjjaULFWS2nAbgW+ECuZZvFYqAhOIHJQJHtMI2S3X2fwpaBuIy+E52MmsjLr/GblCJAkt54FP5uTj1n0QX/Tfl4QaAt/luHNrTSIJzxdfuxJel6ek/VVgXqhuEns+DnKqxd6j0I8OdT5fu1nfOkBl6f4SV04Echr8cPWOFUf0dQ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5322
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 13b29629-1463-4351-5b3e-08d8437d5cea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89/ZvbgtHbcKTWB+tPCb7JE/7E3Nboc0UIu9btaf9WzTx3JN9mpJTnutWAaI0BSCY/7bqaBP8mnNsnu+wnmkl7JqVVOukR8Ob185WUYGSWTJ2KlqNhifV8drjwSRDGSEf2+IJSCETy8RltpKbVGqsnu1QtOm8edAAEMnHkS8Uzxc7E7AEo1122QyUoYO6pICH3cTATrh+NaCDfCB7fkw39kZ0FS01TI+Wc+ebE3kCbrltkWx1QNUH84i3F4Rrwy/17cKre68QIiLvzh+7i7tP58vBN4O6/my/utFbNeRD60Vb5mKZWyy3BbhuGpNQZhwlIpoaLiadZirR66QmlYKkespB3/IFpfH2+fTRVXcZ+9RWf+WtD+KavzARL5Awz0fBQV/j6QEXR52zavG0i1t9jES7SdZCq+XL33QNuGfNqTMkmaSSAif9MWBoNVPhaeC
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966005)(316002)(8936002)(7696005)(36906005)(5660300002)(54906003)(4326008)(356005)(2906002)(6666004)(4744005)(336012)(81166007)(8676002)(186003)(16526019)(70206006)(70586007)(86362001)(47076004)(44832011)(82740400003)(956004)(6486002)(83380400001)(26005)(2616005)(82310400002)(478600001)(6916009)(36756003)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 13:48:41.8133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a4f5fd-3ceb-44f7-b8f8-08d8437d6b0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2193
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Enable CPU errata of Speculative AT on the Neoverse N1 processor
versions r0p0 to r2p0.
Also Fix Cortex A76 Errata string which had a wrong errata number.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/cpuerrata.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 0248893de0..6c09017515 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -476,9 +476,15 @@ static const struct arm_cpu_capabilities arm_errata[] = {
         .matches = has_ssbd_mitigation,
     },
 #endif
+    {
+        /* Neoverse r0p0 - r2p0 */
+        .desc = "ARM erratum 1165522",
+        .capability = ARM64_WORKAROUND_AT_SPECULATE,
+        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 2 << MIDR_VARIANT_SHIFT),
+    },
     {
         /* Cortex-A76 r0p0 - r2p0 */
-        .desc = "ARM erratum 116522",
+        .desc = "ARM erratum 1165522",
         .capability = ARM64_WORKAROUND_AT_SPECULATE,
         MIDR_RANGE(MIDR_CORTEX_A76, 0, 2 << MIDR_VARIANT_SHIFT),
     },
-- 
2.17.1


