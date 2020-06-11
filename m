Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC691F6740
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 13:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjLnh-0000Os-Ue; Thu, 11 Jun 2020 11:55:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muN5=7Y=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjLng-0000Oh-Lp
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 11:55:16 +0000
X-Inumbo-ID: 69f0bd8e-abda-11ea-b50b-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69f0bd8e-abda-11ea-b50b-12813bfff9fa;
 Thu, 11 Jun 2020 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN0ESUHA9bGBuQJ/n5WIUk8FCzXe8w4C0qhno0Uz0bs=;
 b=BwDoWKZxyY7nwbKxJKhXoWJJrrSPXTqWPDDsbMlFVRUSqTebn5AEdtCU93zlt1v6X4qqLXSFV+swo5QMqLEXlJqLGN3RT6sRatBjAbhi+kccf6CPhVFo5w9z3QAL967YGvh7BsOrq/d7ZvC/V1iuceaFaj+IvRVxkjJ8KwwSoPQ=
Received: from DB6PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:6:2d::11) by
 AM0PR08MB4114.eurprd08.prod.outlook.com (2603:10a6:208:132::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 11:55:14 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::2d) by DB6PR07CA0001.outlook.office365.com
 (2603:10a6:6:2d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.10 via Frontend
 Transport; Thu, 11 Jun 2020 11:55:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 11:55:14 +0000
Received: ("Tessian outbound 39cdd740f5cb:v59");
 Thu, 11 Jun 2020 11:55:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b7cc936da58a66bb
X-CR-MTA-TID: 64aa7808
Received: from be19d5ddf299.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7275799E-FBB8-4101-B1EB-CB4F30CECDCE.1; 
 Thu, 11 Jun 2020 11:55:08 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be19d5ddf299.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Jun 2020 11:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6oAAnQWbPAq0XVtE9SEnTPo5iLIIHDw9ehFawy0eEn/CKYs2rLq8zfaKz68QsekAJlTo3TotpyieS1HYI2aEVpFFgCmWVsQxhGKV4HjbXUwaCHnWxn9CMnft6p5BfRp6qv6ddly53VT4AcqQwzMsOp8i1/dZlufISd1WsrUmGCOfySuGX+sMYZFtB9aDw6jUDXssLH7pvCz30Ozw3fBZaxSjB/h5iTwdWu+q/8KlO1yO0vLXFg1y9g0nB8omX/VBPZnpI/UGCvDc4Dy0sGY8nESSpMpV22+A0FjI27RoJjwBwtwUyNiaDMRyN8yvzvk5n15tvLwr+KAio8srhvXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN0ESUHA9bGBuQJ/n5WIUk8FCzXe8w4C0qhno0Uz0bs=;
 b=QGiLlwP8gtli+RcFB3sAfaZWyUqJu/f25LlfK998CTEz7iJj6EWu3t3edn+1cqENRa83g7HlcojPCrS92+moLPE2J9YYQwi2tWqoU+g3MqzaprLjoaakksoigaZFsl5tlGwAm/WiaUtS4QcNqSjW4McIYRxF5ANYN/YKuiA7CQx0xUVbJCmCGZzI63AfXmK3dMEi9HDAgtGvEaS4AbisyyWGJ2B6WOFi/zLlwECr25CdtksMpKpTHokKErqi+UCt2LxXsaDWCJsMJSdvDQ09YGsrZfVRAcRSD7OCjL+BDWXZQZwy8MeCWUaYCdaqW89D55pzTDllxz0VPw0KCEWrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN0ESUHA9bGBuQJ/n5WIUk8FCzXe8w4C0qhno0Uz0bs=;
 b=BwDoWKZxyY7nwbKxJKhXoWJJrrSPXTqWPDDsbMlFVRUSqTebn5AEdtCU93zlt1v6X4qqLXSFV+swo5QMqLEXlJqLGN3RT6sRatBjAbhi+kccf6CPhVFo5w9z3QAL967YGvh7BsOrq/d7ZvC/V1iuceaFaj+IvRVxkjJ8KwwSoPQ=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3707.eurprd08.prod.outlook.com (2603:10a6:10:76::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 11:55:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 11:55:07 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] xen/arm: Add arm Neoverse N1 processor
Date: Thu, 11 Jun 2020 12:54:51 +0100
Message-Id: <5d99ae7a1432152e25d063c634e1e7292ab988aa.1591806668.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: DM5PR21CA0053.namprd21.prod.outlook.com
 (2603:10b6:3:129::15) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.54) by
 DM5PR21CA0053.namprd21.prod.outlook.com (2603:10b6:3:129::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.0 via Frontend Transport; Thu, 11 Jun 2020 11:55:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7f51b4b-81b1-4bbf-d411-08d80dfe4d30
X-MS-TrafficTypeDiagnostic: DB7PR08MB3707:|AM0PR08MB4114:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4114F9AA254CD517022B82E99D800@AM0PR08MB4114.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:439;OLM:439;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4Ll7mpJmZQ/3bCsTGpjqwASC4dFhgsiPiPyGwZhEcC79YJJe4qSbhsWF5nruN1oW0GEdSGAQ6QEKLHnudA0nRwYaZqtsXYhTEBYNMkLYB/d9gprJ8sF0OnjKD/pDQD5Y0+uyv1jpwv7V+5fxjUJgpHLi44f0rt5jb+KjELB5uuBisUl4DL7G10UxXhyqKFR1azMb39OxAHdaX6bn5j7PMYTqYHZkWX8cwWvW+Pwu+81/ukvMktDJn7XjycciheDRqKxa177q4Cf7CELJ0tExGu3sKnoMNvTRM5jLAj6/Sy2WGuBHntx3PsHlYPse7ig1NVRVM3jaMKrXS/vecwJ59nOJpmBnDT3qrElajRqVnNXqo9VUaQGgNGFqlEhUD2SZ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(6916009)(54906003)(4326008)(86362001)(44832011)(26005)(8936002)(316002)(6666004)(36756003)(5660300002)(6486002)(7696005)(8676002)(2616005)(66556008)(16526019)(186003)(52116002)(66476007)(478600001)(956004)(66946007)(2906002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: l2EN3hr87/H8kI2pNxaV2ZbB4fYmzgxFNsCezSEHM4LnXqsHbDqm4WsLAb4LCvKVsI0GxXY9v1EnR5HaiJXzm1gfNSLpCVwCWUbVq0VvRmoByc+oAGYJyr3pzZFtCVj3tVXXeuUeVp0MKES+MVmRF/xRvl2BFoEiP7Vqylj1epmVZ0zzCG0YQkMpRZCH6w8B1nv1kFjYLotZJoWbVT7M1rOJVu+jRp2yp14ykTaTw2YKuz4xVa3ahEtxm+8ihs3dy0qXI7BJPYEdDlnmcSTtI935THbBS51onyXo5gFw8BJ0TG44OAYcyJZZCFwQmeJP+fOxq19kGD6xkAwF8z8V+DgRYhfMX/OL+BkSn97Ht3e5L+tRMlog6089poElS0GhKqgIfDYtENvsnvpqa5QjAVRfWeSzXTiN7naiMGERq/TqLdgyiq3vk04IpxP49BzxOTlIg3ehFSmAqbKCgWREB0hz8XZr8r4SYztg/w9Yx2EEgQDroWepHRoxXaAnzanc
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3707
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(8936002)(36756003)(82310400002)(336012)(7696005)(16526019)(356005)(6666004)(316002)(70206006)(4326008)(2906002)(44832011)(54906003)(5660300002)(186003)(81166007)(70586007)(86362001)(6916009)(8676002)(956004)(82740400003)(26005)(478600001)(6486002)(2616005)(47076004)(107886003)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5c1c2266-bf6f-45ea-7e71-08d80dfe48e9
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YiQoCXNLYZGstEZ9SmgHuKRidtsogRD8BZwCV3zGqQQ/EqfdrI4BZv9rogyVEg9l1Fs73n/UEXJjv9qmRYeGWm79zUmVuaa8iGWmAh1NX4P0QCt/qWL36l+dQxz9qffAQjpgGZYRHIFDYAEW+6BwNbpcZkk9T0QsPG5z6O5ua2aLBEeWTgFDy1CwRmraEU2fWY+uXIAYiWxVZuh+E2i7eqmtbv7snd7Yvo/Ws2Pxhfbolr6ZusvzKd3b1WR+t8JJvXa7l+0caSrLgFBNoRYC4BLgXOuGBpeM7lzOfBrvy7tzjXlplFg+UMgW+gpZTQnnmQx+98DQE+71zrzfPBc3AML2eR6V1h26AALY9mmth05WwfszCTmbId7EqYHzm/bGTnUS2nDzXcP/s8auE1vS4F11f6RUcUMbbh0yQNdJ7SAGzUqj63vFroW+oRj+n4sh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 11:55:14.0755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f51b4b-81b1-4bbf-d411-08d80dfe4d30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4114
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, nd@arm.com,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add MIDR and CPU part numbers for Arm Neoverse N1 processor

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/include/asm-arm/processor.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
index aa642e3ab2..3ca67f8157 100644
--- a/xen/include/asm-arm/processor.h
+++ b/xen/include/asm-arm/processor.h
@@ -58,6 +58,7 @@
 #define ARM_CPU_PART_CORTEX_A73     0xD09
 #define ARM_CPU_PART_CORTEX_A75     0xD0A
 #define ARM_CPU_PART_CORTEX_A76     0xD0B
+#define ARM_CPU_PART_NEOVERSE_N1    0xD0C
 
 #define MIDR_CORTEX_A12 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A12)
 #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A17)
@@ -68,6 +69,7 @@
 #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A73)
 #define MIDR_CORTEX_A75 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A75)
 #define MIDR_CORTEX_A76 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76)
+#define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N1)
 
 /* MPIDR Multiprocessor Affinity Register */
 #define _MPIDR_UP           (30)
-- 
2.17.1


