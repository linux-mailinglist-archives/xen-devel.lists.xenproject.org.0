Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B764F51144E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314624.532809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdzD-000336-99; Wed, 27 Apr 2022 09:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314624.532809; Wed, 27 Apr 2022 09:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdzD-000301-5X; Wed, 27 Apr 2022 09:29:27 +0000
Received: by outflank-mailman (input) for mailman id 314624;
 Wed, 27 Apr 2022 09:29:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ksbQ=VF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1njdzC-00015W-5x
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:29:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe06::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86fdbeb6-c60c-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:29:25 +0200 (CEST)
Received: from AM6PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:20b:2e::30)
 by HE1PR0802MB2363.eurprd08.prod.outlook.com (2603:10a6:3:c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 09:29:22 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::c6) by AM6PR05CA0017.outlook.office365.com
 (2603:10a6:20b:2e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Wed, 27 Apr 2022 09:29:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:29:22 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Wed, 27 Apr 2022 09:29:22 +0000
Received: from ef1b70aa2845.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19911613-40BF-4E00-8FCF-3EEB1596DE4F.1; 
 Wed, 27 Apr 2022 09:29:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef1b70aa2845.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 09:29:15 +0000
Received: from AS9PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:20b:50e::26)
 by GV2PR08MB8052.eurprd08.prod.outlook.com (2603:10a6:150:75::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Wed, 27 Apr
 2022 09:29:13 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::19) by AS9PR04CA0096.outlook.office365.com
 (2603:10a6:20b:50e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Wed, 27 Apr 2022 09:29:12 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:29:12 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Wed, 27 Apr
 2022 09:29:09 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Wed, 27
 Apr 2022 09:29:06 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 27 Apr 2022 09:29:00 +0000
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
X-Inumbo-ID: 86fdbeb6-c60c-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lx3muvo1NlYjIRnnCg1kt3OFOpKsUqq0PYoEogUasjlIPigg1ZmUPEWmGE8MPto+mhdGkXhvUEMqgN2DIsuUw3SITjghayxLbPY1iRZ615rwJoVHKZT0ECKEodfPDYpvPyqNBg+STctti5BCCHWS3OE2t+vMvWWt7Tprwt0RSjfFvD4xt871CdAdYpaNlWa/7UuvMcccvfSYnj7WXzNPocpdlQ+ki6PLkDgxLjz1kANfJpC+40TY8ma1mt7R/aLjd7E9/NzIh1KLSIT3qCKYYDVd1eCPs9olwbKrKRqNcDPbq413PVsT9RXJRbkJao8mEJmccJ62vmWgWVcogrYvuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqcTO4An0BbV9XfJHUHLhj5Zal3nPygOYB8CUZJHxi4=;
 b=jIRWwNoqH63Jm5Ju9lr39dEPu1WB4gYILPphBCrzKJXIvMDlVbv2K7rHjARfbMQs/hFp36hYxbBKZu25x/wWRGshnyb6y/4naQIdiVw6eZwpRb5Q/qo98d2MIKSkwLTKnIEeSyfwNMMa5s9UKvoSR1jGA9UonP7TEa/6SzhZj9myrvng+9yWDdsIUbH1HVPeEf5f8ewsaNrYxxav6Ub5U2lBUX76SN9QlCmGGyoyt2Lc1fgN1FYy49LsabucmL6zjAF47NbkzI3BG0N4id4RGYqWtMmjUkRNcAFvEoIkwm4xIGYHJkjsRj5Bdt9OrEGcRBP8F1Kg3/hVZ155Pw/CZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqcTO4An0BbV9XfJHUHLhj5Zal3nPygOYB8CUZJHxi4=;
 b=3abGuENAl1r7u00mChf+Xh6QW0FI1QdciX/j9njLNLntUMdBeVQ+Rby01mdCyfAEUrGgi2EslaG9EJapZapwyMEJWNr5WogyjpzjX9PGyRNZsDO4KV6iK2piB3UINbrWRQK86vFmNIx1dbLNHtIx1GP2ZVJ4ayzGiLPzIWFthNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b06a487819eedf4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHWeu1xM4N6IL9tfKciKbagCXC/TR8susY2uFAgeyrPFuoSt7c3VJ9FOu55myfqqrC3yd0FpMAX2uIOgIpc/lWh2Cszj5KyAd+gX5LylJUr59KeY0Qrx1kgpB0j13h9i1kOLCHUXZex7yuP5yWCMfFGx8RP7feakMJQ3gBHDSH9+DqywR9HAOODAv5VwPqc0PDx1xLwRI91+Yq8eo3EvXRs5DO9czhMWnWagEDUbpYiZ7L48ViH1IPeY4pXkfCU5oKvNeohT81SFx67G0dfsjzLeAmlEeiR7H8mbXHxhvFeuZmQBi6v2d9vGuxM9X+cFzwO/1ybJF1eAHXShsL6/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqcTO4An0BbV9XfJHUHLhj5Zal3nPygOYB8CUZJHxi4=;
 b=U1eEY0dqSIK+Ysny16f3TO96ijWbwrS1A/NYGj6Dp9jQNLQCr2LfiRVp2Dxob/3WtcjU/bZ67D+N708WyvxOcfC0zeVCXMjGTKbkUfhHIcD6EoQYfA35RgAFHMj+LVDVyPUo/oiNdEF8gD0Fibtd0fxopNXJmQQP20m/dB5b+W52mLsaqkKM4BLW+Jqyet1gzP9G9vQuRNy2hgysgFViDvfiTEkkESmHcHygWfBJ8tynGl4LLyPoQvmPuzzJZOni/LFAVWfIpHCdBvSRo3kApZM8cQ3CYZ/8K7nK2breLxKFjZjN1wE+oK3ESoweMU4Q0xY3Dtr1Xs5N/DrchT+CAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqcTO4An0BbV9XfJHUHLhj5Zal3nPygOYB8CUZJHxi4=;
 b=3abGuENAl1r7u00mChf+Xh6QW0FI1QdciX/j9njLNLntUMdBeVQ+Rby01mdCyfAEUrGgi2EslaG9EJapZapwyMEJWNr5WogyjpzjX9PGyRNZsDO4KV6iK2piB3UINbrWRQK86vFmNIx1dbLNHtIx1GP2ZVJ4ayzGiLPzIWFthNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Date: Wed, 27 Apr 2022 17:27:43 +0800
Message-ID: <20220427092743.925563-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427092743.925563-1-Penny.Zheng@arm.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 2508ef9c-4a05-4230-4942-08da283069c4
X-MS-TrafficTypeDiagnostic:
	GV2PR08MB8052:EE_|AM5EUR03FT052:EE_|HE1PR0802MB2363:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2363F4FCD50681354AEA2BC9F7FA9@HE1PR0802MB2363.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gdoBoYK/OIMyiV9XnuWnT9a4L/tOa2B7LKMnWSi9Vf2nobRNq3qs63KqyhChWntCK2glnDqwqIBE9BdOELgXzIqi8sq4ewMhnkwR5buLsvvAeQyu8+JpQm1JWi9g74wYBlB/3BOgaVmhZUCgdo+o2m/4XQCyq5uqt08VMM4vGRvFXTkr5VtdXW1qsFfljHfFSGjhUkKeaTox+10crtHtlPu65/g4xdvKY6u5NoskMx7XFf/tkTx6p1e0Nnj5JI1EqFR0pGKJxwEWddEHqYRvmZieDfTEKhiTR1Kar4+pJTSfPxDn8eTj46bhIzZnP5s3JKhyACQW2FVHMoUbyTaUKdbGMPb0BKcSYgsk7Isvfmhl0lA8wqhmNIh5grLEaaSraqBPJHL8T8Cx1hOOV+xShTybNbF7I9NgKyoHFVdJ2HljvumXajrMIX7d80WcKjFc5sOpsZpVuVUTFlKB+EzxUkWEqL7dFyIIGeARldnzyupBeiYgE6t0rv9PCJUVH29mYB9CH7PkX+mQf/3FlBG4h8VhbxORxcpZ5wXkRtpTsoRcnfUuMaa9HpQFmL0jB/vyA9ckx8GfqgBg6bhS28S7IdWnD6thKZZjLy2bbxGpwnZB8k8fhmS9zO/FLj06JYbw8uB2Iu9wCyQzita4F2NVJHrPNFpvE6W1vN8ZpY8M4dSPmBc4x31UrvpnimtHN+q3YuLtfwWTRtqwJfj/pT7DhA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(47076005)(2906002)(6916009)(7696005)(70206006)(6666004)(83380400001)(70586007)(356005)(186003)(86362001)(36860700001)(4326008)(40460700003)(8936002)(54906003)(8676002)(508600001)(426003)(26005)(36756003)(336012)(81166007)(82310400005)(5660300002)(2616005)(316002)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8052
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a46b7fa6-f55f-4a58-3f5a-08da28306406
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N6c1Ihfe0cmjtFPH2PJbQqLz+tAeMGs3Fi3nrezTzXJjUV0RMnHbV6rVTIrR3+6AcZp1j/TT22y3cvLI57krMU4nUJYdYldfxD4GtWtvPoQn0ngZkhsZpISYiIfpNDSvWIXjPPYwjS/t/AI4ibayAAKAuez51FMJINcqJlYBEOEn6FN+pJxKS7teoFF32cDTXgl937MgkCR2Ztc61JspYSj2I2p/6j+vGP1mvgq5S3xr8JRsKVLKoKJ0wWPzC0gOoFp1agUfVfqb/CZgd0F0tBVF3NoCMbRJZ+UnOJ7udXj6ew4uwIJf8Eihrr/3OpJIavraki6T06CiQIBLmIFhxHJ87RsGnLj1dYXaFHeHOXW0Um6t/dYd+HhzsVAJHtvlk9Ns3L+jw/qaW9VTorug3t+GnizC6QJBKImNYBa39RjTWRt/lGO6zByiMA0s1VFvyWYMlr/wZrDRqtiTPO3YezqVkW0BzBAIvlNUOr0LAXYyx2Wi2ei8L1MgzEuKz2ld9mwmx61XwvAl5oUbODw2gBymcS2SzF68UfvLFWybyhu5bImF4loWPuwOF8/n3QjX26rSNJCBn+D7T/bJ5K0IQLr0WF/nPNDNraBKGKu4YLYczFp2huNoZ6EXDKyLkGDsSzUgzjCKQ2Z7g2EBi/2YlwXkoOgLvOgxdnnmQUFqTXzcx66gC8/Z+JvMunjDb8Xh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(26005)(6666004)(7696005)(54906003)(83380400001)(86362001)(47076005)(336012)(2616005)(186003)(426003)(1076003)(8936002)(4326008)(40460700003)(8676002)(2906002)(5660300002)(82310400005)(81166007)(36756003)(508600001)(70586007)(6916009)(316002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:29:22.3734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2508ef9c-4a05-4230-4942-08da283069c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2363

When static domain populates memory through populate_physmap on runtime,
other than allocating from heap, it shall retrieve reserved pages from
resv_page_list to make sure that guest RAM is still restricted in statically
configured memory regions. And this commit introduces a new helper
acquire_reserved_page to make it work.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes
- move #ifndef is_domain_using_staticmem to the common header file
- remove #ifdef CONFIG_STATIC_MEMORY-ary
- remove meaningless page_to_mfn(page) in error log
---
v2 changes:
- introduce acquire_reserved_page to retrieve reserved pages from
resv_page_list
- forbid non-zero-order requests in populate_physmap
- let is_domain_static return ((void)(d), false) on x86
---
 xen/common/memory.c      | 23 +++++++++++++++++++++++
 xen/common/page_alloc.c  | 38 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/domain.h |  4 ++++
 xen/include/xen/mm.h     |  3 +--
 4 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 69b0cd1e50..6cee51f0e3 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -245,6 +245,29 @@ static void populate_physmap(struct memop_args *a)
 
                 mfn = _mfn(gpfn);
             }
+            else if ( is_domain_using_staticmem(d) )
+            {
+                /*
+                 * No easy way to guarantee the retreived pages are contiguous,
+                 * so forbid non-zero-order requests here.
+                 */
+                if ( a->extent_order != 0 )
+                {
+                    gdprintk(XENLOG_INFO,
+                             "Could not allocate non-zero-order pages for static %pd.\n.",
+                             d);
+                    goto out;
+                }
+
+                mfn = acquire_reserved_page(d, a->memflags);
+                if ( mfn_eq(mfn, INVALID_MFN) )
+                {
+                    gdprintk(XENLOG_INFO,
+                             "%pd: failed to retrieve a reserved page.\n.",
+                             d);
+                    goto out;
+                }
+            }
             else
             {
                 page = alloc_domheap_pages(d, a->extent_order, a->memflags);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1f3ad4bd28..78cc52986c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2769,12 +2769,50 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
 
     return 0;
 }
+
+/*
+ * Acquire a page from reserved page list(resv_page_list), when populating
+ * memory for static domain on runtime.
+ */
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
+{
+    struct page_info *page;
+    mfn_t smfn;
+
+    /* Acquire a page from reserved page list(resv_page_list). */
+    page = page_list_remove_head(&d->resv_page_list);
+    if ( unlikely(!page) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to acquire a reserved page from resv_page_list.\n",
+               d);
+        return INVALID_MFN;
+    }
+
+    smfn = page_to_mfn(page);
+
+    if ( acquire_domstatic_pages(d, smfn, 1, memflags) )
+        return INVALID_MFN;
+
+    return smfn;
+}
 #else
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub)
 {
     ASSERT_UNREACHABLE();
 }
+
+int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
+                                   unsigned int nr_mfns, unsigned int memflags)
+{
+    ASSERT_UNREACHABLE();
+}
+
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 /*
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 35dc7143a4..c613afa57e 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -38,6 +38,10 @@ void arch_get_domain_info(const struct domain *d,
 #define CDF_staticmem            (1U << 2)
 #endif
 
+#ifndef is_domain_using_staticmem
+#define is_domain_using_staticmem(d) ((void)(d), false)
+#endif
+
 /*
  * Arch-specifics.
  */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 9fd95deaec..32b0837fa0 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -88,10 +88,9 @@ bool scrub_free_pages(void);
 /* These functions are for static memory */
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
-#ifdef CONFIG_STATIC_MEMORY
 int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
-#endif
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags);
 
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
-- 
2.25.1


