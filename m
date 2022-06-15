Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A0354BF58
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 03:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349536.575642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1I0j-0004yg-8m; Wed, 15 Jun 2022 01:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349536.575642; Wed, 15 Jun 2022 01:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1I0j-0004wm-3r; Wed, 15 Jun 2022 01:39:57 +0000
Received: by outflank-mailman (input) for mailman id 349536;
 Wed, 15 Jun 2022 01:39:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dio+=WW=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o1I0h-0004wg-Bf
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 01:39:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0db6452e-ec4c-11ec-9917-058037db3bb5;
 Wed, 15 Jun 2022 03:39:54 +0200 (CEST)
Received: from AM6P193CA0082.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::23)
 by AM6PR08MB4296.eurprd08.prod.outlook.com (2603:10a6:20b:b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 01:39:50 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::73) by AM6P193CA0082.outlook.office365.com
 (2603:10a6:209:88::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Wed, 15 Jun 2022 01:39:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Wed, 15 Jun 2022 01:39:50 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Wed, 15 Jun 2022 01:39:42 +0000
Received: from 05eb9e9f074c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A276644A-ACDD-43A9-BE58-F64CCD0AA477.1; 
 Wed, 15 Jun 2022 01:39:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05eb9e9f074c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Jun 2022 01:39:35 +0000
Received: from AM6PR02CA0029.eurprd02.prod.outlook.com (2603:10a6:20b:6e::42)
 by HE1PR0802MB2489.eurprd08.prod.outlook.com (2603:10a6:3:d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Wed, 15 Jun
 2022 01:39:32 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::7f) by AM6PR02CA0029.outlook.office365.com
 (2603:10a6:20b:6e::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 15 Jun 2022 01:39:32 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Wed, 15 Jun 2022 01:39:31 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 15 Jun
 2022 01:39:29 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 15 Jun 2022 01:39:26 +0000
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
X-Inumbo-ID: 0db6452e-ec4c-11ec-9917-058037db3bb5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QjvTfJMsay8g6lB2ozoWUEc3WoTDegZtr8pSpkqAMKTi22MVwnq4LscPxuuhj5GjZ45Z+5Hx392xU5hp6PJbS5QbNLqCw+xl1A3vn2kiZdzaytcfWgENJp49DAUP/X5BaiR81SvuZLiFcRT4Fpr22smH9Hju76GzJHoo1U0Dnihi2nDLrYBIQHlc1KEo2coy7s1n6fsGp9Olf6vMhE3lkZ8FHs1vcZ8RiWeJRT/JA5N5xDxU7qSntcu9u0q3Frooor12b6TU4W7wWs4QUoR7aFSN9TxsIuK0965QPOdSRbtR7D9Oxyw1R3/di3geCDzgJ1HRp3yZdxOj5lEGh7dXlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVHM+ZSTPQplj51mDH4GF5q/liVjrtXDoFS+oFNMT8s=;
 b=gJoqHcoc67E1gW8XmRBbqXfFHIJm9wkHUbLp38lM9UGht3Y9pmGhCmp28oQawBWq3QMPIpcRlm5oUkMiee5wFGpPenhVoP6sDpdAcDnBPdQzdLPZ6zgExcpAqos6R2LNckwfHYpihcIFGOldLd5uhx5VhYxQ4orNhSx2jpOErWRAh/Jp1GW/TmE8Kc8yuDrOb7d2b21DFK4RhCqOkzOSTYbNsrtqlpEPAff4GoLT49kQ41fg/x4YIHtxbMR+07LdbZuXRZA6JLvAJdhDiBx25O8ybiyTsOx6BLhgW0aeeRdgiHBWstY8f/oI3VuL8TzPLhxEBxg1lU7Ao+JuOhQc6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVHM+ZSTPQplj51mDH4GF5q/liVjrtXDoFS+oFNMT8s=;
 b=j2gPatPdIR7wuLZimYffQstL/t2iWmeoa9i7MMJ+lPaVvBlV1S2JXRuJXQWhPk19Oyt+lLo5U9lTs23QM6Jq284tkr/U+TJKYbtyMDqJeQonmujuymAVUkTsY0fEQbCWwxJxeJGhFDAx+eGDRa4eB4rAbbXTpe1rtUD8iaiZYN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8650f332f5582df7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GySrC5+LOSc1cCzWphaPkAEyEuXj2+srzQxNFAQH/SokJnua3+Yp/GPil8fyk9310YmN1MllglnrClwkA3ZCqkpg20VqIvVO5ChI8ekvCjYaLFWOYhIKzL9v8Kx1Mj4P0Tj+Ia2jEuYJUDRuQyrOcKVeEEfuL7b8QnJE3dcYbwsfbM6/2M9uBMavYVMVz+KPc0AfS4koypMp/GOgcChlQSlUyJzHvKgc8gwPldsGJ9pz7WMbln/5lVrvJqQW4c+5lftMYZIDzqlSdDPN5VatpUZ9dkmsZaBv8I3R0iRDCxmyxL8rKB7GeMzEPBXBXYrEW0WMgcdyK+BIvpcqHqEsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVHM+ZSTPQplj51mDH4GF5q/liVjrtXDoFS+oFNMT8s=;
 b=Yl5IE10H/55w/fwBRjwarZNZAejktNx+Tz8sQ9qcK28FXRulOsx5qLOQG+3rpV2k5fapCQ3HHGXvR7NbGTvaGL9Khelmw4cGEmdP5wfqay9yVsFsQynD6JsY9fvjJ6tXP40U8rVFrinEffu8JJGG9kNLFeXIp5scSwkY9EdXsIHOZOEXwk7MVN7vG8RlXQcjigKirIliNwy3WsEMAu5mfzfotUTktKo5LmPS3VnQFBHnfW7HXcFOiWzK3NyfxFfZtcxHsyYSNaxmY5bn+fC5T+W0B2tF8dajCmrgkSXK7JLJTzpI2uyiTYbLkDyEaDJODy9ckuZumqeTvHFE9MTuDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVHM+ZSTPQplj51mDH4GF5q/liVjrtXDoFS+oFNMT8s=;
 b=j2gPatPdIR7wuLZimYffQstL/t2iWmeoa9i7MMJ+lPaVvBlV1S2JXRuJXQWhPk19Oyt+lLo5U9lTs23QM6Jq284tkr/U+TJKYbtyMDqJeQonmujuymAVUkTsY0fEQbCWwxJxeJGhFDAx+eGDRa4eB4rAbbXTpe1rtUD8iaiZYN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: avoid vtimer flip-flop transition in context switch
Date: Wed, 15 Jun 2022 09:39:09 +0800
Message-ID: <20220615013909.283887-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: ff72a2d2-c899-454c-b9ad-08da4e6ff022
X-MS-TrafficTypeDiagnostic:
	HE1PR0802MB2489:EE_|AM5EUR03FT054:EE_|AM6PR08MB4296:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4296B6E47A11BB99E7366D109EAD9@AM6PR08MB4296.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hUWCr0wUKeuknX1aQ7l/Zroqz1GTQ/i6tWsQ0BbVLnu5iy+hS9doewY/by1sXvoTrgs3PhAVM45F/B027I+2eQLkmslIB4C1fDRL7pnpOFGMBvAaIL8iwc8RyY1QbvU6JfebGPTlInTiJt/cdABrTfray5+0mClpnlwgWDTY/ppBI37vn9dVxQTedyCp+LEjrd5YSZpowRsOoPyW03TuNTK5GT8F5u1N8JM9hunwUJ771fNBrsiTGK5ondkFj1xP1ygqiYh0uTeJyIR7sXi93OPZTxK2FtRR/a/i5beqgBy9ThsQRQv1ag0Pa2zpF9AE754YZsZMAeIQfUIf7KmhMaqVbmO8Yf3AvVZuiJCtvjiqSYNYg0r9y6AUcdTsjFfPDLhWCKI1UK0g4xsxY2N7yCo4QAp18Z3GXmsD1LcPXJT2ckFEQH2Gf4rtZmOedIIpXkmpsdmXcw8uDK1aTIJQ1YFur+Ix95dwWf4HyY9yTRViz2kd7FA/uEgJ0YUSpm7gPwIi8QUzjBWVFaIvD/jmh0lx4IwiZDjUkinzpI7NQS76AQ5kQ+bvUv9PS2kmSUkuktunebC6hGWog90HILDrcBYpvTAtoNlmXFuZmZp+ziA2K+heaB1uP+vjp+7c9+e/nBvCeEH2aen7Xmx0h0NRPQsBaUEzxShw6PZoQ0cx0BXat7IHOPcSxrkPNeDvsYe8wxaZOFYTlXrc9rHzVvQbcA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(426003)(356005)(83380400001)(82310400005)(508600001)(36756003)(5660300002)(336012)(47076005)(2906002)(40460700003)(44832011)(81166007)(2616005)(4326008)(54906003)(8676002)(6916009)(1076003)(86362001)(6666004)(70586007)(8936002)(7696005)(26005)(186003)(316002)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2489
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5abdc51f-8c32-438e-4b76-08da4e6fe4e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OVeVwwPaST6lKANtFC8IVuc48nPoBBvRTobVDaRq2FNJNVC9wB00dZUc6xpjWvQVVLAINqo63H1F48pESUw50nyU3QAnvP8TB9IGHo0AaPgBuo0naa8oxjQRnZ59N5JDFfMQ9bOVi9w7DU2vLvIdCm5SdPxdv48MjCZ1umGIiNXcD26tjFCAIktqVwKVKfRnq4K1NlZU2Rpll+UIg3r8WWr2GBWMxRG3ONvKqHoU+HZbt0fsduMnAtTgPPBaVBF+l51xq5MEhVdWxTAZdbd9S07uqpJzHaezXW01yjl7ZEgWa5Q4sO4E4KUOYnnOKtgp0pTkGk40XXvjo6N96vy66OHIHvXd0P8XfmwZdhYPlNShzouyaKRkf1rQtufUNtoTSlMxC9tPzsNUG4AKhjKmF60+Z6gG68fgN89GNgPt2IC4c+mltZz5FrS9RKoxGtsGbUr+BugG7d+7GYX7kezZ2ymcaujHoTWY6aJWEt9V1c1yb2rGX++E6bykkvCNBOJpwdciHSFZIln79xMxFrslu4IprFdxc33rYPIx2C74jDyznaeM2WDfDSkEYH9Lq9gc5NZeDhMXuCTz+knwcvd2R2IT5igWnYngafWRp/p+jpclTUFGQsfQIjXltYQiT7vkrI10NQUVdf6t+GG9+xSUsZ0BSC55nBWfeBA5V5dXXglVrVQ26BKVGsBW40kvWwmz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(2906002)(316002)(107886003)(5660300002)(70206006)(6666004)(54906003)(86362001)(1076003)(81166007)(186003)(508600001)(8936002)(8676002)(2616005)(4326008)(82310400005)(44832011)(36756003)(6916009)(26005)(36860700001)(40460700003)(7696005)(70586007)(47076005)(426003)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 01:39:50.2865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff72a2d2-c899-454c-b9ad-08da4e6ff022
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4296

virt_vtimer_save is calculating the new time for the vtimer and
has a potential risk of timer flip in:
"v->arch.virt_timer.cval + v->domain->arch.virt_timer_base.offset
- boot_count".
In this formula, "cval + offset" could make uint64_t overflow.
Generally speaking, this is difficult to trigger. But unfortunately
the problem was encountered with a platform where the timer started
with a very huge initial value, like 0xF333899122223333. On this
platform cval + offset is overflowing after running for a while.

So in this patch, we adjust the formula to use "offset - boot_count"
first, and then use the result to plus cval. This will avoid the
uint64_t overflow.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/vtimer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 5bb5970f58..86e63303c8 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -144,8 +144,9 @@ void virt_timer_save(struct vcpu *v)
     if ( (v->arch.virt_timer.ctl & CNTx_CTL_ENABLE) &&
          !(v->arch.virt_timer.ctl & CNTx_CTL_MASK))
     {
-        set_timer(&v->arch.virt_timer.timer, ticks_to_ns(v->arch.virt_timer.cval +
-                  v->domain->arch.virt_timer_base.offset - boot_count));
+        set_timer(&v->arch.virt_timer.timer,
+                  ticks_to_ns(v->domain->arch.virt_timer_base.offset -
+                              boot_count + v->arch.virt_timer.cval));
     }
 }
 
-- 
2.25.1


