Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F3255310
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 04:35:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBUDj-0001ay-1S; Fri, 28 Aug 2020 02:34:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UB2A=CG=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kBUDh-0001at-KO
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 02:34:25 +0000
X-Inumbo-ID: 4050aaca-c929-4db5-849c-40c38cfd85d4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4050aaca-c929-4db5-849c-40c38cfd85d4;
 Fri, 28 Aug 2020 02:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO9efFaq5wEOo++Fy4tv1aJrTxnbNQSeSgs/TrRSuBU=;
 b=j5DSuIj/G8Y/0uj8v9ozQJq4NMJJjzVHqIfb51nJPlQP0RXUUEnyUYzndWp0yY5zVdE2zudtUpE2L1T5tCxucz2dTzhiKlHSSgPPAy8Dka54CVFDDOAx9Tj+aWvHk0loAuY8Z2fa7QmLZNeYgHv3N4S4XXAR+ZmFDewIoxRkgDs=
Received: from MRXP264CA0048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::36)
 by DB8PR08MB5497.eurprd08.prod.outlook.com (2603:10a6:10:11a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 28 Aug
 2020 02:34:20 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::80) by MRXP264CA0048.outlook.office365.com
 (2603:10a6:500:14::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Fri, 28 Aug 2020 02:34:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 02:34:20 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Fri, 28 Aug 2020 02:34:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 208062b9fdd150ee
X-CR-MTA-TID: 64aa7808
Received: from e64d50107e70.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07BEE591-7EC8-4527-B97F-4AE947407F6D.1; 
 Fri, 28 Aug 2020 02:34:14 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e64d50107e70.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Aug 2020 02:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C162ntESH0R0jU0V4F0skL1f3hZtb+uSmdTCl+E0ZQ80ITfxFn87X9UPyJnftV2wnbWX2q7toSNVIK6ASmdlDKZtygtMt0qe06J48Wsa6XMoqLjYoKrZ/C9mgcWIIA+TsYEPg0rB7ITUJVDN7qXCdVh2DEEqkTqDEeFzRYl4wySe1zoGAB4AM8rjeZX1FD1Dzy+/g9I5FjfcdRwvi2yYwgN7t3IpZWt78VWNXpXbjK7/T7UnqBAjINWryy8jsdrVwa/G5K8gNTQPyy1+MitQ0lCkxuU+GVO9FgsaGV08V8C3UsGVwxshrr/CVu44LKQHlvCIkPK5CzHhKBVeREBkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO9efFaq5wEOo++Fy4tv1aJrTxnbNQSeSgs/TrRSuBU=;
 b=GELG2cr/RXxyDh250D1bMS/DILDo/whm7zv3CsHr7xnCvUJPfMMZzLbriUWH16jpegWcQgFqqLaVBJpCvn+GukVojxPRUZdkNhLcah+auRaHUxT+tDMZ7IJg2UN2Fkufj7eehXwe7VUDsPBKns9eTrrTYoBq+3dW+OUWYX20I1uKpUFoIiuCHI9MuCWB5/9aaYZoJwzjCIs38GbBzsH3t6UT+mhWoRiyukJhDlZ/C99JkiZC1VSqI9DS7oMb873rwL+gf+O8U3OxCG39mKMIlbkekJjFgBjlnZKXRzOlxePqCQ324xRmf2wnhR/pOnO06Y3Ur2A29Y3aGPYac81tBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO9efFaq5wEOo++Fy4tv1aJrTxnbNQSeSgs/TrRSuBU=;
 b=j5DSuIj/G8Y/0uj8v9ozQJq4NMJJjzVHqIfb51nJPlQP0RXUUEnyUYzndWp0yY5zVdE2zudtUpE2L1T5tCxucz2dTzhiKlHSSgPPAy8Dka54CVFDDOAx9Tj+aWvHk0loAuY8Z2fa7QmLZNeYgHv3N4S4XXAR+ZmFDewIoxRkgDs=
Received: from DB7PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:10:52::33)
 by AM8PR08MB5827.eurprd08.prod.outlook.com (2603:10a6:20b:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Fri, 28 Aug
 2020 02:34:13 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::a2) by DB7PR02CA0020.outlook.office365.com
 (2603:10a6:10:52::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Fri, 28 Aug 2020 02:34:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 02:34:13 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 28 Aug
 2020 02:34:11 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Fri, 28 Aug 2020 02:34:09 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v5 0/2] Fix Guest random crash on Cortex-N1/A76/A75 cores
Date: Fri, 28 Aug 2020 02:34:02 +0000
Message-ID: <20200828023404.28638-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ba4fdf0-5a2c-449e-c1f6-08d84afade44
X-MS-TrafficTypeDiagnostic: AM8PR08MB5827:|DB8PR08MB5497:
X-Microsoft-Antispam-PRVS: <DB8PR08MB54979135671CE5C712B945749E520@DB8PR08MB5497.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FrgoHS02AM9Z+ba2RDNnErRuWfxf9iwSyQ+RlCO4RS7ZRjX5FCBAanc3vQFQ9fHv3k+5Gia8w2dv21c3YXYG6cnzA6/CqoybvCkDM9uGm6oQFJV0x4t4uyw65Nu0+0b5HAlYVaq5vbAQX9itr85DB+5JiE9QxtdBqSLveJDlf1Cfm7bEnqN3NrirPJPblnWZ6gOsGlK+FUiax2m3dv+Ns4fNIOAnwImP6DB4KOGwReB9kstLBzC6ZeY0j4uKxl4uGkAaeWZ2wcHwGQtg9M+ZWagGsxGJF9RbShEMcUJ5wLLa+GOMlE6pZF8kG0OWaTgy6rZDy2VeGuamLzCLZX6EDro/8BFu8nrZcNgqB4tVu+P24PTVs/8XW1A/VUJ6MzDcbNSzFvqz22G5gret0d+SN44nnttL2m++0Hpx8zBN0rHfkMVengMrco3icIIb5NqJeQ8+2EK3705Fr56lB9CVWc4RmoxLhdn3n2JWTcs2idc=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966005)(83380400001)(8936002)(8676002)(36756003)(70586007)(356005)(2616005)(70206006)(47076004)(6666004)(478600001)(336012)(44832011)(966005)(82740400003)(5660300002)(186003)(81166007)(426003)(316002)(2906002)(4744005)(82310400002)(86362001)(4326008)(1076003)(26005)(54906003)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5827
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5348dfd7-2015-478f-396b-08d84afad9eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PRmr6bmVdNiTjHk0sGQAt8/aWEyKmwawDMfyms7KWGBPD1/LMY6ECTDtEmcfY6grq2WUS58lfhmbLAHzOSVsLxSvy83uVDN25M5E+/FmD3q5kESf3i2dbJT7EgxrvCg+9qDyqcywa6Bb3c02Ll/lpjxQn038/ndrcne/b2S7oB65GCN9rvaON6jJYkN/bTrjmRPcZYoe9e0zVTahELPDNuE+2kxyourl+k0QidBH625DODvBXFwoLyoluQq0mO+F6AzFWNXrygb/Gy3o3nvl6JvyNL/9TR+0d8wNkCc7303lUdUDcFF1ZfngQW0V+g1kO/JI9aG71Mnvc95C0jXsfYLaSeVF6PtAFvpMSY7SLntpLSFw1czWLzPWiFXMIvFsebYysGkulciEkfyz9aZxhIllZeLu/z/atalUP/qQdBUSI37/b31RYVw2sflT+T0te/YkadAtCBZpWnpMC7EN9FOnG0CYB+p0FT1dNdS07Pc=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966005)(110136005)(6666004)(54906003)(26005)(5660300002)(2906002)(86362001)(478600001)(1076003)(70206006)(4744005)(82310400002)(36906005)(426003)(8676002)(81166007)(47076004)(70586007)(36756003)(82740400003)(316002)(336012)(83380400001)(186003)(8936002)(44832011)(966005)(2616005)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 02:34:20.3163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba4fdf0-5a2c-449e-c1f6-08d84afade44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5497
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
 v4 --> v5:
  1. Fix typos.

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


