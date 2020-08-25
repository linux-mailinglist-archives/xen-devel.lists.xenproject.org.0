Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9444251CE6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 18:07:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAbTa-00046z-UQ; Tue, 25 Aug 2020 16:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGsN=CD=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kAbTY-00046g-Kd
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 16:07:08 +0000
X-Inumbo-ID: 48da1dc1-3750-4ef8-ba24-cef510d0d220
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48da1dc1-3750-4ef8-ba24-cef510d0d220;
 Tue, 25 Aug 2020 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1weL9yMtSMPOV11Zr/QJTa68jHae4k+udmN1bLikcF8=;
 b=ZqP5lTtXkDRCW8QTqusAuKnc2hNzxwg9DhoDK5ui0oN6cYv5Yndjcf7J/MNv78rslXa0VQusRx2YLBVgUL3gi1jSHwPBoRIoBcPWG4E+8zVK8+NYzaU0/+SzSu9z/j4XAfD1+PJHPtBXVKZUVs5SxsdO476MDxH85sKEi0tBeS4=
Received: from AM6PR0502CA0052.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::29) by AM7PR08MB5384.eurprd08.prod.outlook.com
 (2603:10a6:20b:10c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 16:07:03 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::3d) by AM6PR0502CA0052.outlook.office365.com
 (2603:10a6:20b:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 16:07:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 16:07:03 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Tue, 25 Aug 2020 16:07:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: af9cf1e9b55b1fd2
X-CR-MTA-TID: 64aa7808
Received: from eac5b9ac2073.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9BC2BE32-6B37-4D8F-9277-F671098DA0D0.1; 
 Tue, 25 Aug 2020 16:06:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eac5b9ac2073.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 16:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzz64irPaddXIiXYNMQXjTvcij7sdIzXR4+nrAlzrXlI3ELb38df3FT+Nh+4mmOi1iXXKa+L08IAWgSQ9rWh7yjxFw2s6pZQbScOxAFL893EadqesOz0lQO/CeNHyrnpxSB16hCKfK4DCJyhbBLWhmASwbGn7jKHfsDUH8qMPoJW49kvXeuDjnOAaVaeOljCxoJUUiNu1POGMDLqEE4A+ooOcNZZfvvgiegQ3L3srS/jIq8UiKf5Vfag+gib7X0xZpGU2/3kPu4q6GI/rkCoLRxiEIokGOnr0HXkfWWUsMu6jaow+F3+cmgKri0DBY89YXoyAmFYwHgdNaAGcqDNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1weL9yMtSMPOV11Zr/QJTa68jHae4k+udmN1bLikcF8=;
 b=WrhEpCHf/qAEDU64P0GshaKBp8kL+1AAKUm58mK7n6SfFmWnaduefQTrjjLdpWgN5MtsiiBUwnHsAIjYEMH7Q+OpEmjg37HmVm0pMMp4vVjI1ob0H0+3QbvdF/I0vcAus3dapVTXDAN0pg8gAxwJ+c340F3YaKFTqQQONOyFQH5YISAr9OuqU2h8blgR6riGt2OsNz9AHLEucXozAgPGEiQcKkjZj0TjDe+WKvwkVp1OMa2YsGQOHq9qpkoVo3ZZe5fJv8G86i0YlncLmUeeUhk+PSlVo3IHSzQ6dD+tHeNYJFqai0hEjEhMOuS8tsjgcoHaHnnZYCgRGa4cVeTiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1weL9yMtSMPOV11Zr/QJTa68jHae4k+udmN1bLikcF8=;
 b=ZqP5lTtXkDRCW8QTqusAuKnc2hNzxwg9DhoDK5ui0oN6cYv5Yndjcf7J/MNv78rslXa0VQusRx2YLBVgUL3gi1jSHwPBoRIoBcPWG4E+8zVK8+NYzaU0/+SzSu9z/j4XAfD1+PJHPtBXVKZUVs5SxsdO476MDxH85sKEi0tBeS4=
Received: from AM7PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:110::21)
 by DB6PR0802MB2551.eurprd08.prod.outlook.com (2603:10a6:4:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 16:06:23 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::25) by AM7PR04CA0011.outlook.office365.com
 (2603:10a6:20b:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 25 Aug 2020 16:06:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 16:06:22 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:06:12 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 25 Aug 2020 16:06:09 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v4 0/2] Fix Guest random crash on Cortex-N1/A76/A75 cores
Date: Tue, 25 Aug 2020 16:06:01 +0000
Message-ID: <20200825160603.32388-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e648913-c2a3-453a-5859-08d84910e826
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2551:|AM7PR08MB5384:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5384C4BD005C3D85445500DB9E570@AM7PR08MB5384.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Rx1LjyFm/o6yFcEIrBFt3iZLFrnDyaeRAn2QGCuIOJYm0Yp0iqUZmMTzvT9aZZrXYVcYkzFUfBFg4rEzpgWKrfxZwv2t+gUQjoQSILk/hst689NbHSeYbpl+Y2Rzvw16EB3CEEyauWQ/i4F4nQfoaL1wtzeXiHyxpU0z8PZsTEikZ8RSKFSQy/HMahmhkm+5NmWsxkQA5vPoDEWXZgrh2WxOvw/IXk0j8Jki+kLwHBgh+KnxxIeZYtiyvMgIdsYYS5f1znr10u+6jigcdsu/jFL1B/9oLoVHiISqXwiyfTa5KUX/opPFnZvKxrYFB4hu30x2cHQQW0Vztly8zzzEqqll4SK+wQWtYDbEEtJe8bEpGR0EMX0JZCDyGcyqAFGTRecfV8t6+Y42C2y/9CKHFHN3cAvsFjv8W2mEj8LDjcGmnynJCidV7LLYTDBjdRMuqmihhjf6OPEjbKz7TS+BlDZzJrW/ROC8TwxSAlGIw7s=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(966005)(6666004)(26005)(2616005)(4326008)(54906003)(186003)(2906002)(426003)(8676002)(8936002)(44832011)(478600001)(316002)(336012)(110136005)(47076004)(70206006)(5660300002)(4744005)(83380400001)(36756003)(82740400003)(81166007)(356005)(1076003)(70586007)(82310400002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2551
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2aec0b8d-4d98-48d5-6f3f-08d84910cfaf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nbTbQzJRFf4FTfzFhSWP1zAATZj9L1cu0HpHhIwCV4elVXpcAceMxbPC2nEDt6nT3OiPZANXpkplJtGmHLXlBtDngHlCLPBdGfyvLyOmhs8dJ2DzP03PbG0IZgKTzbFGXxIomgH/t++imaZuuOrKEU0Cl8qyrxV4tMca/abzgSHN3DOwGJKPYycEOKielA/VwAqB+f/GDny3iayLE1mui1qmm1EEnkv6yh9C0TsI49xVXg3SF2suLQCYZafutY7lbsGbhagbCvgCu6i98JUzWcpDJfZZ3XjkA+7dWJEYAaNCQdo0eatiR9B5ZEWCkTgfix3F4XtLBobu5PSCZhy7V/RVTKVD45CxBKX4YkzdJmKd/67SjEG4yaZu/UQSkPv4oLSmajefOKUJ9z/BqZdJkolVIylz3kH/gaejSOg27KkRqlZXh5NzlqL5l0q46aUBqnbPvzWkHr7v60fRhgM73VRTgWXU7PRS06H6I4FMd2k=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(46966005)(186003)(478600001)(966005)(36906005)(86362001)(70206006)(316002)(26005)(47076004)(54906003)(82740400003)(2906002)(110136005)(5660300002)(70586007)(4744005)(336012)(6666004)(36756003)(1076003)(44832011)(83380400001)(81166007)(8936002)(426003)(8676002)(2616005)(82310400002)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 16:07:03.4968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e648913-c2a3-453a-5859-08d84910e826
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384
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

On latest Arm Cortex-N1/A76/A75 cores, Xen guests will encouter random
crash when they have wordloads. It's because Xen will ignore FP/SIMD
registers in vCPU context switch (see patch#1 for more details).

This patch set fix guest random crash on these new cores, and throw
messages when Xen detects known FP/SIMD features.

---
 v3 --> v4:
  1. Use open-code instead of new cpu_has_unknown_{fp,simd} macros.

 v2 --> v3:
  1. Improve the warning messages to give clear meanings
  2. Fix typos

 v1 --> v2:
  1. Use "< 8" instead of "<= 1" to detect FP/SIMD features.
  2. Give messages for unknown FP/SIMD features.
  3. Fix typos.
 
 v1:
  https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00857.html

Wei Chen (2):
  xen/arm: Missing N1/A76/A75 FP registers in vCPU context switch
  xen/arm: Throw messages for unknown FP/SIMD implement ID

 xen/arch/arm/setup.c             | 12 ++++++++++++
 xen/include/asm-arm/cpufeature.h |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.17.1


