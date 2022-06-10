Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDB5545BEA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345794.571499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXal-0007lt-Nr; Fri, 10 Jun 2022 05:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345794.571499; Fri, 10 Jun 2022 05:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXal-0007hL-Ia; Fri, 10 Jun 2022 05:53:55 +0000
Received: by outflank-mailman (input) for mailman id 345794;
 Fri, 10 Jun 2022 05:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4Vh=WR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nzXak-0006br-Ka
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 05:53:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b55134a2-e881-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 07:53:53 +0200 (CEST)
Received: from AM6PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:20b:92::29)
 by AM8PR08MB5730.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Fri, 10 Jun
 2022 05:53:51 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::bf) by AM6PR04CA0016.outlook.office365.com
 (2603:10a6:20b:92::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:50 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Fri, 10 Jun 2022 05:53:50 +0000
Received: from a3ca2fe92f07.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9CA918F4-8782-4CE1-908E-F754DF5B9AED.1; 
 Fri, 10 Jun 2022 05:53:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3ca2fe92f07.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 05:53:44 +0000
Received: from AM7PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:20b:100::34)
 by AM0PR08MB3540.eurprd08.prod.outlook.com (2603:10a6:208:e3::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 05:53:42 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::eb) by AM7PR02CA0024.outlook.office365.com
 (2603:10a6:20b:100::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:41 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 10 Jun
 2022 05:53:39 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:37 +0000
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
X-Inumbo-ID: b55134a2-e881-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kSfAkbNk81eQzNWPE3QDbQm3oD1YG9O7wL9/6vrLucxKacuXNpdQPqricAnJzqf2udy4AFeRioiFJ/DpSkYVaQJAvFQCM5oVqeuJyDbQt3l5q30XpwUyA1NGWD2xSUn2JmhL0+LNWTEgCyeZUKtPGt1FpuIi+V5D5YaVG6MVHOHn7t5hnkD3ZF0Q61dj46DzvuVHxxu8RMDc2+vGXAsY1mDJhXbcEyi9ofSrnUFSa1XO+YdUWqm8WPCGZfMK4673TsO+7J9WTMOdRjcmYxV8fvJFeEWvuAOi+on36+rBXbNNkYdZ2g9ZgvTIVTdM9tXnvn8LE5HUmZ+y1Mu7BQEdnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmWNLdXhXdHZRodNywRZ0AluYyoEUalbdzqUNWlHEjU=;
 b=XkgdtfFf2aMCdZ90IIcIwVVr/SMQNPiwMZLkfOJA+7HMON5bnQejnwvj3/QXmCzf6Du9ITs8/rWaiWSl6VnUBLxxG6d+dbl2RijRpWXks3DhhdoLQHnyn58Np6wg/pO3sN0bzsWdR7WjSPRAQsFhLiQ1RHrN783w14DJMXG/2xPesLuWgoR1KHfy+bAQBQ0a44OYJsYftBWdPVKgwqT01ZmYrFNwnuEK4lCkEP2SOurXERn2pka46co0CDEd2GPJjKa3S6D+k76QC7SyjY6Xk8j5TaPpILUueUMZi5glbOjUgsCles9LY4snfKw4HhIjcMZy/kUqP1MwZ5bRpkwLFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmWNLdXhXdHZRodNywRZ0AluYyoEUalbdzqUNWlHEjU=;
 b=VVl79PuYH21t3JY8WZTzMoQDBh/zAOTbv1S7FUWXZEtF9GypSYnL9urhaTpAmvfz6rQkXxsOmNtzSHSHRAYHlNfmCnCW5BPr9+JhYGs4OMiR3NdibBKHyBlY0md73mnm94NJH6DptvfyIEl5EJJcgZNpaG0xLjNXTpGk5ruxQSs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dcb9a448a5a7c00a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2HwBh7mrxuzD6NjMg95fVqfZIxZh82MZmLDvR1ciqt+sNplv+z0Hbx/QxDikDn/ZkEHwKjgt7Kw4AO2DXbpLohMmcZGrd2rwnaoBdiTMZEpCwTU0JQ779bhmlAITRRi8BT+Hbzn5QobEHlD7DjDDrHDa7uT5EY5WIsDgMiyNkdW7sy03fMpZzuQ87yCiUlUl/uQDNreQdejqFcqQb6YkG3Dccc1aUOoEJK7LxavixAurBkbM+VUFNBFfYu/biUIH71ll0g8SpwcKQeg6tZ8H23fTr4MhvFBbl4RoCxw8AteE8yMLpo5FepQnlnGexLF/wFDGFhs3Aga+x/Rv/TUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmWNLdXhXdHZRodNywRZ0AluYyoEUalbdzqUNWlHEjU=;
 b=h9fezbv4JRBSUPUgAnUQaCnD0ncE9Od4WDOgW8IaGgWUkBEYIf3/KQVV8UU1ZzVPFKdQYM7tN3xPaNKAr2DCCSzg6rXKVnqZIOshrRI1to1ArAVC34svEYqxEWQWx1fJv57HNM81tv440KHhdYbubqyD9ByXphanxAFRYMIq6cJQGtW1mJsDWygqiQB19haSo/d9TX17pUA2K84+NmC60BRFz4nWYKUkdK7aiZPw+KWz4C8BGHrc2rv47BJodkhiTi1Ig2Gi5fYFa3wsb+Sn79zx0mKoQkRao/gqC1iaKIv6ArAgakZYBaVJrRPPltVqD69t5wTcDhW30RLtFDqe0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmWNLdXhXdHZRodNywRZ0AluYyoEUalbdzqUNWlHEjU=;
 b=VVl79PuYH21t3JY8WZTzMoQDBh/zAOTbv1S7FUWXZEtF9GypSYnL9urhaTpAmvfz6rQkXxsOmNtzSHSHRAYHlNfmCnCW5BPr9+JhYGs4OMiR3NdibBKHyBlY0md73mnm94NJH6DptvfyIEl5EJJcgZNpaG0xLjNXTpGk5ruxQSs=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v6 5/8] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
Date: Fri, 10 Jun 2022 13:53:13 +0800
Message-ID: <20220610055316.2197571-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610055316.2197571-1-wei.chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 468dd8fa-9af7-4ef8-07ea-08da4aa59806
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3540:EE_|AM5EUR03FT028:EE_|AM8PR08MB5730:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB573018800AAD6DAE5A91F4D19EA69@AM8PR08MB5730.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GqdDHs7kS1W4EK09IJzUlGaJEjGEYKAXaxvNTRwGVQoMfusEqpbQ2lQ2RrvDD0hR6hHpYIlkdY+c03ukSt2rCMCcafUMKqmOVpM8UaNK0LqWSoNjuUOYFoTz8V/cTBN/obx+Lx27kWyY6XDZ9tIcPHOuXxfwIc081+UMFeODRQAKzuyeY/wZox/hicKmjt1FREO5ofd8OgmUiNL78Wa0hjJx+8rM+XMT23gDQeh53uy2eWNwHcy2VxvcNQ9cw8w0BfDe5gX01ei45EFnQVNuGCMAeFHpFCmFQBpUnU5BUVurMQJc2usVsiw+L66+r35vqpSQSSRklbuSKi8K7FsKSuQaCFrn3C0Nkap4kMPtXtG4fl6wrHBiNmMWDFwBvs2y2Z4CcB41q0j8FeNyILztMOdn+CFKKoBdYw11s+FOK+eJmtoNfdM9X2qn8oGE/+F14o7ENOf9IRjEcEeXGUqh2szUeDXs7VDNR0cBUGqKrTZGFy5+wZZLFWOVXnhK0upTJW5JEEuI+a6aDCXCudy28iNvdSKTdKI3JOrx9TiQjKUpthK2PiV6O0V+OP7yZjkCRbrAEO/xhJO6JKxYFMpB3zBDO0lgnvKDckfzX/wWyE1pwTEN4Jq3LFDOD3xjHYzCgrwYgSB3B8JGHTc/NLCc0f1gpeYyRbrsl2YPB8gR/RgLvEnxCxrI5snLZNiUBImYoOKix+pzUCOAZ2xNWStCnA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(83380400001)(1076003)(47076005)(186003)(81166007)(70586007)(356005)(40460700003)(82310400005)(2616005)(70206006)(26005)(426003)(336012)(6916009)(4326008)(7696005)(54906003)(36756003)(316002)(508600001)(86362001)(8936002)(44832011)(2906002)(6666004)(36860700001)(5660300002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3540
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	668805e6-5774-4489-fcdf-08da4aa59298
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CVDLQox4ssdRtS/wvPRIvPKKJMo/wgB93k46mTq9eiKqvaAG8SkZ3RFFk9GzDcNIKaSCQ53BO2emN+SHWRwRETyi+A83CuDUb/Bb3sVj7RkhtGMU4M2feOX+MyMx4lK2vxhLjeQx0CgMX0fU8q7Ve9jfyb9Poqi8vZeJLREN55m6uVSX4uGVMZQO2QS6xmGKpnDEK9IGhuwIlQduME9fBNxrEmDR3dvDtByV05CjWe9NG6IyMFx2mPzVhDlrvz46UfxJi0E9N9Un4A/JvEGFqZeYEVB6yCc0UWNRK626hVKj3Yyy4sZwpL6ZrSqPQnieaUF/A/ZMAkuCgsVkHR1CI/+pEMTXmy/eSoI792BnOZdrhARBjtRdgGEVilKBsI0ktX9TCISCy4F1rQO+/gZVTwQecHYFzBvR2v0DHQwR7o2y+ufn3E0qi25b9djln4fModFzwCL9VqUnMcRg9wbdXdTVUnTs66Yk/PYCaeCQElvD1hO/Q2qLQPbJpfRS2eVcn0b5JeMAytdX4Ugr3l94Rw2nsOHCPpeP45GeR65BocC/XwXm5IG8mO78vaWIBzZ+hfedEJUB/EOrU79o0UXeAmefmjssgFqr9PwAlRe3y+6PUWCFtRVff5BPrGCaQ7MqcO1K6VIFPj+d6daiiCNyYriemtuVXSiZ9y050FJkU0vB1Cr2Rmpg4P6JPZ6isZX6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(1076003)(6916009)(7696005)(36756003)(86362001)(81166007)(47076005)(2616005)(316002)(82310400005)(4326008)(336012)(8676002)(36860700001)(70206006)(70586007)(426003)(40460700003)(54906003)(6666004)(8936002)(5660300002)(26005)(508600001)(83380400001)(186003)(44832011)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:53:50.6312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 468dd8fa-9af7-4ef8-07ea-08da4aa59806
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5730

We have introduced CONFIG_NUMA in a previous patch. And this
option is enabled only on x86 at the current stage. In a follow
up patch, we will enable this option for Arm. But we still
want users to be able to disable the CONFIG_NUMA via Kconfig. In
this case, keep the fake NUMA API, will make Arm code still
able to work with NUMA aware memory allocation and scheduler.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 -> v4:
no change
v2 -> v3:
Add Tb.
v1 -> v2:
No change.
---
 xen/arch/arm/include/asm/numa.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index e4c4d89192..268a9db055 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -5,6 +5,8 @@
 
 typedef u8 nodeid_t;
 
+#ifndef CONFIG_NUMA
+
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
@@ -24,6 +26,9 @@ extern mfn_t first_valid_mfn;
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
+
+#endif
+
 #define arch_want_default_dmazone() (false)
 
 #endif /* __ARCH_ARM_NUMA_H */
-- 
2.25.1


