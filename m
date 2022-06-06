Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3C353E043
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 06:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342292.567431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny445-0001jv-Vs; Mon, 06 Jun 2022 04:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342292.567431; Mon, 06 Jun 2022 04:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny445-0001fk-FW; Mon, 06 Jun 2022 04:10:05 +0000
Received: by outflank-mailman (input) for mailman id 342292;
 Mon, 06 Jun 2022 04:10:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNt7=WN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ny442-0000w0-SU
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 04:10:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88e9a548-e54e-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 06:10:01 +0200 (CEST)
Received: from AM6P193CA0083.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::24)
 by VI1PR0802MB2157.eurprd08.prod.outlook.com (2603:10a6:800:9c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 04:09:58 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::c7) by AM6P193CA0083.outlook.office365.com
 (2603:10a6:209:88::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:57 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Mon, 06 Jun 2022 04:09:57 +0000
Received: from b15dbf3b8acb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 50CD7091-62ED-45AF-BC14-8C68E4E28BF3.1; 
 Mon, 06 Jun 2022 04:09:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b15dbf3b8acb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 04:09:50 +0000
Received: from AS9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:20b:462::33)
 by AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 04:09:42 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::e8) by AS9PR06CA0010.outlook.office365.com
 (2603:10a6:20b:462::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.14 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:41 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 6 Jun
 2022 04:09:42 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:40 +0000
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
X-Inumbo-ID: 88e9a548-e54e-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bq8vLUcWh3JhP8o399uCZLIUC4NA0PnujoK2ZiSQ/7dttnZCWcd/xx1GE2FO/4DOm4u1NnF1xwvwZovlToDKm+k7DyoP39fTOBC72mgMTRZ01HZvbIDMMSb1za5TTxolQ/Jr4ObBKzeUzhmBuG8gM5PZX3gUJmTtK3FjO2B4gprzy0+sBDxAFuqCWpaIDK/T+fSxMxIRp/GE8tikAhhMH2PHH7M26gJTx/GQi7hyTE5WkYTMLS52o5nQ34B2u4I35i+wjz3mQMzZjcO1nnpthGKXmoZ7dhl3FKRH7ogXA36tt62SxwdP4XDRut82h4xCwIaqg1/3XZmQ+wVlvQWi6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmWNLdXhXdHZRodNywRZ0AluYyoEUalbdzqUNWlHEjU=;
 b=FO48yEIw7nOe/WhMducvyy5OQaZS255AmNQdAmQ41zDDKnoYY+eKGUULKRMUekT3kpBbesHHRb6Fqh+wV43yze9dTqwcVeu5IudLeDTRhed2gPdlQvzZJCgW5n1S25z99U4OHeFkeNm1Qn0HqOqH/ynHvyzKguaNb/z7P688uweYdvsKgh8XxqRoqRHXS20rk4JAQvKdjWvCPsuEHA/2tgOQKg+FngmbJ6XSQbpZfAtEI5UK8aghN101AdULDjQt86xdIbF3gbgvbak9r95AcqjrgiqTQwBZiqcqno2K1TiIn05FGSsvVAiC+4KAqNXBnQH0JS4XbmzeDWr9W/9Jvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmWNLdXhXdHZRodNywRZ0AluYyoEUalbdzqUNWlHEjU=;
 b=IWHcnCoHzLJ9obstO+SZIfCtTAClU9IJY3Th8es+fDplCczMP5w+wziIx9ez3B8lILIUs/uD9LMANftRxBc6kPkRhyWtd5WoAQ+bsqbFg3Jql/OY0hN3dy6SysFF/NOajS61dZCEtU/R9Ol7s7j/gsoQgBmhe5pyDzqqlxkvQtQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf6fd438c57bcb5f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iK7r0ye4H/mJT9pVfduEvLMivP3VhWa9cdj08q3xB6DRKvQw0+NgaGY7Lan0S2tfqV1cN38zmpLo+scEujmLuyB0XFY1oiW8BuZ08/xhTqLPFwrEqJUMKMXFudijqrJndDsh/AFKzFaOkdMmchVv9nhstMw8w85BCwQWv1Bw76NMTAvilCVjOCLpqFdTv1DEKlZAltbWDcqH3+VnzZNosXADyCe++zY+wxvu3cR5D3OxCQMVS1mUfD3pZZM8n2zO9DpMwc+KlA18DAiTq0cw6H1ywmzrtjGZIizuKOCIPHEKD/YY9/3WVjYLp4htRCFPXxdr1s2forAhRJuy3wYMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmWNLdXhXdHZRodNywRZ0AluYyoEUalbdzqUNWlHEjU=;
 b=iIFguqocLwr74I8CijEwvVmWGw5q46v9hgzrx9lSqqrtJWe7q/BebwBl8CfuemrZEcJRuSbAmhf3Bm7Xc9TKcx0xPPbpB8bNUPQy6sHfg7UTgoeyehkTLwt5jZLnywtsAtTOgjlWe4GiyIW50PkesFkFRRBvEifMzjDqvQ6a43fs1JJoL0EZHg/9R51CMCbciTLBl52Tp2Zbr+gO+/0gKjDZcfQk5tmBflW4ArkmXHPT7b3MEk++lALWBknSMvrdmYjxkA8ZYN/9rCO/GT+B0hOODGGtluz+GIVmgCw5wauhwtSE/ZxmosO5jiBhgL8kzS7hac0qlROppP6gf+l4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmWNLdXhXdHZRodNywRZ0AluYyoEUalbdzqUNWlHEjU=;
 b=IWHcnCoHzLJ9obstO+SZIfCtTAClU9IJY3Th8es+fDplCczMP5w+wziIx9ez3B8lILIUs/uD9LMANftRxBc6kPkRhyWtd5WoAQ+bsqbFg3Jql/OY0hN3dy6SysFF/NOajS61dZCEtU/R9Ol7s7j/gsoQgBmhe5pyDzqqlxkvQtQ=
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
Subject: [PATCH v5 5/8] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
Date: Mon, 6 Jun 2022 12:09:13 +0800
Message-ID: <20220606040916.122184-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606040916.122184-1-wei.chen@arm.com>
References: <20220606040916.122184-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 19bf49c7-5193-4fa0-cb81-08da47726b18
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3956:EE_|VE1EUR03FT012:EE_|VI1PR0802MB2157:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2157EEDE4FC3EE6C7B3B300D9EA29@VI1PR0802MB2157.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 42tXNiIWn2M6QZaO6o7AaLjx2pcpicxiSpUbbPjt0HyUJcQgWEREg2b2EfM2gwjab6NcxjaZwNJ9VX0LClgP6oMTLRJdGChAMtbN3oRJZ603TsICC0HjvF38tDYZZzrrqDRDbyBwvWSMk13domZcBBtNaPRFkw+UWLT3jjsifvKY8G0xEmxVBTBOJfRgbRbP2bpqmOKQ1aPOg3IdLdIJSUglftp9sMMFTldLKgBH777BOfB7KWtdD49oFFxLxKuz4ZGKBx6Y2mueZ2juBTRJd2wqb6LGd/rX/PjEmQ+pXIi8hlS6QmNWIW/5BPyvIkNq17bkX4ERlDwVddYRNBjrASmmwiG6XQ3FzpfLZkJioYS8suqSTugjwWlV7XYF2AkI9hE/1efVN+2PD2pK006H6Hm9EYyVW141mrVyyiXhl0Q/dEuhpH0pxO/eiUpSIXd+DG3H0AWnuV4ulc+n6PeaoV5j95bUWqaNIQusy3GS84Mmz2a2Jhlr9W/HkhaSnOFX9d/rG19h6JWxtQdb4Cg1cqp1r2NlCXl3Gxq0UZW3NY+LcUjOZpqcoB8BR8S8KkSa1wPBXt2ZeErdb8LRgkHDvrzLcIC6qKkFuN26+TY0jxxVm5+S4yCHBzk9Ap1MgMIANRMGu2zbHbEXCMYb4u3FHEG6PxnA3OqvC0h+zUpDYGwZTrPSzn+RIiRjxl3hop9Y1E/4P3yZZOMDcpUQmNyeqQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(26005)(2906002)(6916009)(6666004)(7696005)(54906003)(81166007)(44832011)(316002)(36756003)(86362001)(36860700001)(83380400001)(426003)(40460700003)(336012)(82310400005)(8676002)(2616005)(4326008)(1076003)(70586007)(70206006)(5660300002)(186003)(508600001)(47076005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3956
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18e30440-f57e-497d-22d6-08da477261b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8om3xkk/OXKpDM8CGnoYvtu9qLDcOToMjxmKmwHEKv4zoxMhNWh6Fj4U2aIdn9C8DuveB+T2q2knr1GeBYXHzk35LrtV0Xt0KXAKps8E57UQC91B2sPlxudLyxO7x5qMQZiwiDRRigEJ14ERWJ9/Uqx4Mzy4Wu5RI+LmqoSZpMT5QySn3OCp6VQwYMY65nCV2/I1lZrAoIeNMGQss9BKpnQKdingnyqYAmP3u3xOlKaL0fVheRZ2xVcYsAyGLDA1+kwOdTlad6L/eJZiNS4UZc4gumifnb3R8S9pTRQpvbpXMjvizuNG1DBTeAH1v+s/KLieqDKhQPuJsFLkNqkTvEOtsaumZXvDCeJrcjJKKv/6sofFTe0OKI8HSMXuy+egclwLQHZkS7ChVmo8uTMuMos9cQvzCpCeH6J1gTHlt9tdsDK/+1QCARapaEY8srleNCuX2fWSQ9bj+KZIn6IO+DHBqg8AlPhSJ1I+jEtP7GgVVPrbPzGFlhzEKbYNKQJJOoTWbLG9iHxrXM/HYJ4yHjf5F3k2s9kGKtjQ+lORyzpbkw4jMcrS1smOScWPGwsTGShkBkPFRfEfaUTinrAEWkuFTi0kcvkx17uKojNnAc43GftUrIl7NrPzywlfM8nWFbj7YWuxxzprsaq8WZdCOA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(36756003)(54906003)(70206006)(6916009)(336012)(70586007)(426003)(47076005)(316002)(5660300002)(26005)(81166007)(8936002)(2906002)(4326008)(82310400005)(8676002)(1076003)(83380400001)(7696005)(36860700001)(44832011)(6666004)(2616005)(508600001)(186003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 04:09:57.3883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19bf49c7-5193-4fa0-cb81-08da47726b18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2157

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


