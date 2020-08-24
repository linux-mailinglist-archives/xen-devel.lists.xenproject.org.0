Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65F24F187
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 05:29:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA3AH-0004ec-Tk; Mon, 24 Aug 2020 03:28:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ot5I=CC=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kA3AG-0004eS-J1
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 03:28:56 +0000
X-Inumbo-ID: 71e2c94b-cfa4-42a4-9228-236efcccb75f
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.66]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71e2c94b-cfa4-42a4-9228-236efcccb75f;
 Mon, 24 Aug 2020 03:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywALeRVakL8xEn/iUPHQaTWq9eX9MYOqqTgVTlXbl/0=;
 b=JXgFP4Jmlc4QbcM4h1IDhv+oDp3xMhCeRhxMpL+eovLU/B3wVU84NboagaYwo6vbk2jmQ1NjKqROZSkmao3UfcX+ySIGv+r9UMPFd9hUm4YA/v1QU7vd4Lf24mkSTImklt1nrtAsGQ0NjucKT0i7mgeWtddBdWRzUXBIwEETxkY=
Received: from DB6PR0202CA0016.eurprd02.prod.outlook.com (2603:10a6:4:29::26)
 by AM6PR08MB3783.eurprd08.prod.outlook.com (2603:10a6:20b:8a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 03:28:49 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::54) by DB6PR0202CA0016.outlook.office365.com
 (2603:10a6:4:29::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Mon, 24 Aug 2020 03:28:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 03:28:49 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Mon, 24 Aug 2020 03:28:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0233c306f06551e3
X-CR-MTA-TID: 64aa7808
Received: from 11cbed1041bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0E8FF42A-36C8-4EDE-A9C0-C53D7433EC73.1; 
 Mon, 24 Aug 2020 03:28:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11cbed1041bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Aug 2020 03:28:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjvP7fcjwXgktYEVumMcdAwiK+Xt2zFmAI462q7nFiA6rtEPC/iLdtEWY2zeO9SD53nkrysRe2eO1+Np7YdUSJVQxUH3BFX3UxkTOXfQXypf1lUzf21PelAePmHoo4qPI2MFveM06wCMAXaHkjcE2O5kcR5xB01c76Qe7wwFeM7v/oySENeBQb9v7zlqK6cN4wqwEYMhZ96afxBR0nxkV904ynyID5GvPBI+QSctCvlgmYDwvlH93JPHVp8n5ckuataXDLiNB2YYx0mn19+wFNle5SHrbAG0OmvwHoiHmMOoWoaoKwrM4A7YfX6UAP+jjCYZ8kCnm6VVXz1lhp9UUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywALeRVakL8xEn/iUPHQaTWq9eX9MYOqqTgVTlXbl/0=;
 b=Cb/mY4YOzIxpgKwlzzE/Vkz88TkmJoS2+p8jwHEG61lYRCglQkxO8hW6pt1ExiUujgE31IF14PID9+uJ3/i5OXWAk/D+2aDaXuWI0lJSnfAnF7XThxoFZWK81uNgdOeKklB9lelIOGbcN5WNlp0+M0iTEaY1IbWpr0k54Ocj7jcrGZeB5rv6JTHb8SDRJcDQ8w31BM8hYERbUmju8kwajwoyjhKGnTgqXwycNvgfUMNU/KLuclPRRtHOOjw3gXQHLn7Xl9L2JC8rRP8mpT1UEZy5hzIWNFBFL1EQPVE/0uW/6Tt4+12MnKL/lCPYCvzvHnEZ25K+Xvh30IIRE5pUjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywALeRVakL8xEn/iUPHQaTWq9eX9MYOqqTgVTlXbl/0=;
 b=JXgFP4Jmlc4QbcM4h1IDhv+oDp3xMhCeRhxMpL+eovLU/B3wVU84NboagaYwo6vbk2jmQ1NjKqROZSkmao3UfcX+ySIGv+r9UMPFd9hUm4YA/v1QU7vd4Lf24mkSTImklt1nrtAsGQ0NjucKT0i7mgeWtddBdWRzUXBIwEETxkY=
Received: from DBBPR09CA0012.eurprd09.prod.outlook.com (2603:10a6:10:c0::24)
 by VI1PR08MB4206.eurprd08.prod.outlook.com (2603:10a6:803:ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 03:28:40 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::5c) by DBBPR09CA0012.outlook.office365.com
 (2603:10a6:10:c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Mon, 24 Aug 2020 03:28:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 03:28:40 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 24 Aug
 2020 03:28:39 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Mon, 24 Aug 2020 03:28:36 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v2 0/2] Fix Guest random crash on Cortex-N1/A76/A75 cores
Date: Mon, 24 Aug 2020 03:28:23 +0000
Message-ID: <20200824032825.18368-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6ff63e9-3ae8-4d08-7226-08d847ddd117
X-MS-TrafficTypeDiagnostic: VI1PR08MB4206:|AM6PR08MB3783:
X-Microsoft-Antispam-PRVS: <AM6PR08MB378364AD72CEB5AEFF0518009E560@AM6PR08MB3783.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Zy3y1J6i4ck4dy5cxvEMzgaGg7jNJkNS2GKVbPyIZHam7N0PjWP70JhGfNXwsdBWNfxsNfT1qRi6ptKbxLghlZ3up5QCTGhc5K6JZvlcb+R/llA8k6+F7tFIStAsrAAl2QdTBAQ4NlYDl/YCQQ3HlfENXxaC5VO+UkxhcbN7ET8uRFkTRLayjh6Yw82cK2cHFLnxanj1HD0cPqX2izKeuEgGpr7nYA/xeSoUcXfPA4BiYLqEQKxCU1Wmk3QEj5PRpDVri56SvOL3y0QESrNIkg2WjWe803gH3KdsbxLQ6+3knGs+RSksl4PuvaDSQ1e8hB3NNi+S+MC/SlL4rcHOGfLWeS3zXc6lIIzZB8HvJgluswdTXZfbrG9kTGna5o0cJk+zkmReKDbdAjfqhlYUZlWcd059oWOvSTVtfK16fYLj41kDmbBdXbXPqy9erKuOSj84oW22hPbA+CYc52kSBi54jF7IJ52s7UxfdTLnWVc=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(396003)(376002)(136003)(46966005)(336012)(70586007)(44832011)(70206006)(26005)(54906003)(110136005)(8936002)(2616005)(478600001)(966005)(2906002)(1076003)(426003)(6666004)(316002)(186003)(4326008)(86362001)(8676002)(82310400002)(81166007)(47076004)(356005)(36756003)(82740400003)(83380400001)(5660300002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4206
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3eb7c1c7-c186-4c43-4326-08d847ddcb9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xs9lhgiW2EGP0Hnvsb6+W4TA6hpniw9AX8dfO5Xcgee5uSWOr67o0yJCi0nSyi70aDpYE8CSFWcsR97ehktBO0SMJbv2i0ZnniLZeXrJ2fvd2eadDQWxNpzUD6X6fHnBmSR2gRJIvcjE3rexs5PJ2tuOxBPQp/XhVt9vzNtxjVWpBP0QHyokeNXtPAr2a6uwaSy9f+ZggeDvg1kDe6kBwdWTAd1WPMXMQLgga31xqTr7L0ZBoVw9lxt9crPXn4LMR33/xT88pL6xGLB5cfGb+Y32x9dyhuzcFVNwSVPLC8AiokKiFuamU7ClFwyVuYdwk70PA1r8am4+sULtpJDyPQOGKdNj5K8kHr84CW4pMp32fJfddLlDHCn5yXUgqe5FHvBOo5lDKuICtb3eG0ROHiLv4HR7ym0cym3cDvHYrksgG0TrPLVLK0Jyq2bOqFW1Ztib/bn9vkW58JjaJJR5b9D+zZRK4gTHfmf5YO6oIMc=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(46966005)(6666004)(86362001)(1076003)(70206006)(8676002)(4744005)(478600001)(336012)(966005)(2906002)(36756003)(83380400001)(70586007)(26005)(82740400003)(44832011)(8936002)(82310400002)(110136005)(54906003)(47076004)(316002)(2616005)(4326008)(186003)(5660300002)(426003)(81166007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 03:28:49.4174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ff63e9-3ae8-4d08-7226-08d847ddd117
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3783
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
 v1 --> v2:
  1. Use "< 8" instead of "<= 1" to detect FP/SIMD features.
  2. Give messages for unknown FP/SIMD features.
  3. Fix typos.
 
 v1:
  https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00857.html

Wei Chen (2):
  xen/arm: Missing N1/A76/A75 FP registers in vCPU context switch
  xen/arm: Throw messages for unknown FP/SIMD implement ID

 xen/arch/arm/setup.c             | 26 ++++++++++++++++++++++++--
 xen/include/asm-arm/cpufeature.h |  4 ++--
 2 files changed, 26 insertions(+), 4 deletions(-)

-- 
2.17.1


