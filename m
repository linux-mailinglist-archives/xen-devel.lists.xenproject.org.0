Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A851F6752
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 13:59:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjLrR-0000eH-El; Thu, 11 Jun 2020 11:59:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muN5=7Y=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjLrP-0000dl-PK
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 11:59:07 +0000
X-Inumbo-ID: f335c8aa-abda-11ea-bb8b-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f335c8aa-abda-11ea-bb8b-bc764e2007e4;
 Thu, 11 Jun 2020 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D71s0T/Tl8igW2rP4gqzsvEUPhyc07Mh5DOpvYbwWYM=;
 b=AA0/jo6dVDqbcXZ6Zgb6kLHov3EJZuY1JTC27ww8iLov4YDBJ405941Lp+PifS3ncLf7gBzHUHn2lgi7vC7Dj6OniM5p0Zow1fsACoEr92tZlodcWQzw+25k6UMo8lWSY3Mg107z7aEEBkUlQtROYroTIXszqTxU1UctV86Lr4A=
Received: from AM5P194CA0003.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::13)
 by VI1PR08MB3023.eurprd08.prod.outlook.com (2603:10a6:803:4e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Thu, 11 Jun
 2020 11:59:04 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::2d) by AM5P194CA0003.outlook.office365.com
 (2603:10a6:203:8f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Thu, 11 Jun 2020 11:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 11:59:04 +0000
Received: ("Tessian outbound 3e82c366635e:v59");
 Thu, 11 Jun 2020 11:59:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1ef58a267a01458
X-CR-MTA-TID: 64aa7808
Received: from 423a97113ec8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85CF8D81-6F59-4500-9932-2BC025A901A9.1; 
 Thu, 11 Jun 2020 11:58:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 423a97113ec8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Jun 2020 11:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AksEIz08AH8H2w9lq8/zfMdyWEZoetnhhLYXvEtSCPedqxA3UZctTQwz1v5n7/EpcSnS4huOL5gzUEwYDXc9YJHQiXZVlMhtRuVbBok9x1uYVfWwttO1gTvDJgxUlFLRZdXnRmonlN+FWVYtIKeTAii3u0eTazK3ohfTFqFefkNgOHWp6D/Yc6MhjgCHeVaM0ztPA4BRxHzHpQqxVkMbJWrIZ1aKT+J1qfjAxk9srI+c7P/9P/D18TodDjFreTP3yQ6OBXnljhbxkuzazt5qGiWO9H1TVNJ//Z83gghaf56ehqU+6a/cGmquKY4f48UUInc3JEzSiL76xr6r9+ZmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D71s0T/Tl8igW2rP4gqzsvEUPhyc07Mh5DOpvYbwWYM=;
 b=Cgm/d4FAxgkIK6FO30elEz2p/FfRQbAwzscoh8sp+svJXF3bM0G7S377yg51rtjFn2Mc5vsE5x8Q823lvi2sVT3BnqBrnj2m4vZla/q5CYWqfZHHXExxDctDrJ7kyPniNOL9iHhWYZxDs3lf315uphsc/l6zo8E2MKx55hWOm7LeYY6hHM8x0c9pCYQH+TKPJJAxkk2L9oV1qKciDlQRgZyOlxOnmLr8Nqh8WQIHZlrMtTjs6vJ1CI5I36XrbflpSAErHDuD/ENFPNJCOpcfgYwQs3e5gEsQEbafEXM5LKiAFfDTFyJvLDc+QRSM22+jgYTdPjhgndpkQjzLPt99rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D71s0T/Tl8igW2rP4gqzsvEUPhyc07Mh5DOpvYbwWYM=;
 b=AA0/jo6dVDqbcXZ6Zgb6kLHov3EJZuY1JTC27ww8iLov4YDBJ405941Lp+PifS3ncLf7gBzHUHn2lgi7vC7Dj6OniM5p0Zow1fsACoEr92tZlodcWQzw+25k6UMo8lWSY3Mg107z7aEEBkUlQtROYroTIXszqTxU1UctV86Lr4A=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3387.eurprd08.prod.outlook.com (2603:10a6:10:45::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 11:58:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 11:58:56 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] xen/arm: Convert runstate address during hypcall
Date: Thu, 11 Jun 2020 12:58:19 +0100
Message-Id: <cover.1591806713.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0008.namprd21.prod.outlook.com
 (2603:10b6:805:106::18) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by
 SN6PR2101CA0008.namprd21.prod.outlook.com (2603:10b6:805:106::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.0 via Frontend
 Transport; Thu, 11 Jun 2020 11:58:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 394d73d0-a7a7-43b5-fa28-08d80dfed652
X-MS-TrafficTypeDiagnostic: DB7PR08MB3387:|VI1PR08MB3023:
X-Microsoft-Antispam-PRVS: <VI1PR08MB30237C42B726E1DBB2AC5F5F9D800@VI1PR08MB3023.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BaUlJctEk8+HTyGSZ6CaZ0AlwSmUclD92s9kqlpTDqSavLrl9JtPXy5x62OSCroHQip/l+4BmNe7EoMIVvDbb+oYVIOhGuvXiKVsHpkUzH8Q2UP5iB2OjOyQO3mXzdxcWP2LukyQ3nV5V/qJFnvTYN4/OoDotvZir9M/ox+MQSG3H5xYZlQ7nJTOXjhWfiNqSIBuQgvQ8hzO9HBQxnRsoXLmXxGv60QV/MversBtdguX4jEV6lxhHcA9mfsp4D7avfC0AuucKEjsqpO9kqHTJYXBwJ/VEa2qNxqHHJW4JU94t0q3Op6aJvZV+QenjbiANCJh+uDe6Yfq64lgej0tFmMU81FR/sgg96VgLZs67FwR6viTIWXuMMX1XNEHCWqH
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(66476007)(6486002)(66946007)(86362001)(5660300002)(16526019)(36756003)(6666004)(7416002)(186003)(4326008)(2906002)(4744005)(26005)(83380400001)(66556008)(8676002)(956004)(6916009)(54906003)(8936002)(52116002)(2616005)(7696005)(316002)(44832011)(478600001)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: oCgdadJncviDXfQKWhWu8uh9aBHbhf0Ub/MnIO4dEuaPQixjdW1veMyUvJfrAu+6VZy4/K0QC/M5nXCmicN2khxDkCbzOh95mu7jHm1gAIffCsLAqx8iX0I5J5HkJOkgZAYV4rjLhe0GhcsnahF1sb6mZD5bIW9kEE7xgIdHvx6VmGo5bJ2Zj61gI6pOrcCn1e8huJyH5de60PrmOHIPfwc2zYxryxJQcyfJl9F5lD4T156ic8vM1sRFI4JzoTNKpsG8YjQi5PjJxgSwLqQxayezJOGU71d8rZsq1EN7KRYu+JZ5fQUc6n0CLl6ToRMA9DIb+NTeGGYxAaG6kd5082WR5GH1s0xZsrA+zjgOI5XXTDKCHAV5KwDH2qiL/eqPiE/KSPCJCFgR3Exm60AVYPQTqKX87HNEyDRTbKb2ZF2DSO5erk0EXmEjvvludkH/OflgOAM/+JfzP8PEwUXNdGjEnysUZ0sGG1QZD7OmlM3iFgxdwJBon1OOlC0UJIHM
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3387
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(336012)(54906003)(478600001)(316002)(356005)(107886003)(83380400001)(956004)(82310400002)(7696005)(6486002)(44832011)(2616005)(36906005)(81166007)(4744005)(8936002)(4326008)(8676002)(36756003)(2906002)(86362001)(5660300002)(70206006)(6916009)(70586007)(16526019)(186003)(26005)(6666004)(47076004)(82740400003)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c61e6fd4-a110-4a54-8b66-08d80dfed16b
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hT9kP9j/YFLEm8ospivXTM/ORYE6MhnbUG33O759teeM6nCv3yIyhXK3+fESOrpteumcmbrfmz0tesqvQkqBnGpcgyW+z85LaatPdAOoDeXOkxocO53PWQc/tcooqQL+7MT3/rYXH9nJ4oytZ+mE7RZfnXlYPh22nYABfh2oFJIoBieWqUNJcXF1hR+dSSZwftmEQoqZ7kOJsyMDVgO2Z1EbSQGbEN/9Yb49yEWrWPpGWAcjdJZOwmKeV+2wAcFVT+b8TUhYHKhlL0cLVCX4dVeceSuDzhbu4EUNAB1NIFyEsAT4bsUrHp6HVCTEAQSfiqG/a0Xo8jO2I9FQN4WyFzK+cFxj1l8sTxGx/NBDx4GXiSZcoFgZMbBh3j+jxGxkEMuxSVv4FoH1gSVNCs23GL+zh450EYRz8hrlrLOHqCJYHNAlRhVqIKB+7/UWuq/Y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 11:59:04.0402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 394d73d0-a7a7-43b5-fa28-08d80dfed652
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3023
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This serie is introducing changes to convert runstate address virtual
address provided by a guest during the hypercall on Arm.
It keeps the current strategy on x86 but moves some of the common code
inside the architecture code.
The serie is divided in 2 patches to allow an easier review of the
specific code to handle the use case where the guest area is actually
crossing 2 pages.

Bertrand Marquis (2):
  xen/arm: Convert runstate address during hypcall
  xen/arm: Support runstate crossing pages

 xen/arch/arm/domain.c        | 154 ++++++++++++++++++++++++++++++-----
 xen/arch/x86/domain.c        |  30 ++++++-
 xen/arch/x86/x86_64/domain.c |   4 +-
 xen/common/domain.c          |  19 ++---
 xen/include/asm-arm/domain.h |   9 ++
 xen/include/asm-x86/domain.h |  16 ++++
 xen/include/xen/domain.h     |   4 +
 xen/include/xen/sched.h      |  16 +---
 8 files changed, 199 insertions(+), 53 deletions(-)

-- 
2.17.1


