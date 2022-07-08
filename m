Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896F556BBF2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363470.594032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOC-0007Zl-4y; Fri, 08 Jul 2022 14:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363470.594032; Fri, 08 Jul 2022 14:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOC-0007Wb-1e; Fri, 08 Jul 2022 14:55:28 +0000
Received: by outflank-mailman (input) for mailman id 363470;
 Fri, 08 Jul 2022 14:55:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pOA-0006vD-Pd
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:55:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffd1eb02-fecd-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 16:55:25 +0200 (CEST)
Received: from AM5P194CA0006.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::16)
 by PAXPR08MB6912.eurprd08.prod.outlook.com (2603:10a6:102:137::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 14:55:24 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::34) by AM5P194CA0006.outlook.office365.com
 (2603:10a6:203:8f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16 via Frontend Transport; Fri, 8 Jul 2022 14:55:23 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Fri, 08 Jul 2022 14:55:23 +0000
Received: from 32f413fbdd89.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C20FECCA-9427-4FEF-822D-2A857CD2E588.1; 
 Fri, 08 Jul 2022 14:55:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32f413fbdd89.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:55:17 +0000
Received: from DB6PR0202CA0044.eurprd02.prod.outlook.com (2603:10a6:4:a5::30)
 by DB9PR08MB6649.eurprd08.prod.outlook.com (2603:10a6:10:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 14:55:14 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::6a) by DB6PR0202CA0044.outlook.office365.com
 (2603:10a6:4:a5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:14 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:14 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:55:07 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:04 +0000
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
X-Inumbo-ID: ffd1eb02-fecd-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Wmw9uhcQvlqoQfsqQKnCb6GYRbv0nfzcevcMi9oDjhtet8V49Jka6Cn7iN71MV7YJs4OmYjZcTRvKhk6AvO6do8jtTUHb2XG2009Ml0rwsDSXVpEkE7qEzB60+tb4cGmEtKKoG3n41GRLMJiaME6pIwFtbvkplNSaTU2lcMopYt7yJEqRBK5hD+LOtBUB3OltG85t2pwWQ5HH4ZOrHv0It7yhM2ozas+/IJBNjlNNRrqTwvKHr8YLatgFN1BRgEQPSg2OmP9zO0AlYoIbAmdgODvYkXO3vEKo/LUIsjoNMuJ685k89nBUYPf5vCWgYkMa3HIKuoOAMxCETG7J7BROA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hrldKnD93EUpTTS3t0Fp32LcqOWPG36yIxeFRBs9ew=;
 b=U1D0CzkuG/bS9NDAKPHyY3uDiuz20Eavvyfo8M0Ld/kL7u7MUffbRK8hcSFXUuo0WbEOo2dXfFm/EFEmvmzaBiUAbDrAEiPRzs4XNeU6plEDi+X8CErEZhJ8qZM1Uk0fzqfm/MIgzf8F2AvvrUbNPx4IKi1mH3DM+qbGoqI3CylWi3zKgEG+fbsnr2s/cPEvXNZIxs2+Uy7Tg5OKRNgSQh6OTQCj65Ol9iWW47/PJ5ROu72qxHqnxvlcUkxuoZry63dzcIzclpmpUOFA6q8JXxiUmXdILcEwTSYzfcw+e70juzaLOHKUSWY18c4DNXx2f82eNAaWe7416LrslsJ7Ng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hrldKnD93EUpTTS3t0Fp32LcqOWPG36yIxeFRBs9ew=;
 b=W52zosK23K2Dbskpj5kcMvByi2K0X6WLHttkygQDXQZvtxBCh8XLD+LHhyIGxyuSMSp2IzB+S8RQJA6n3p373HZQXwQb9B0JIW/YMcBoeQj5XDiWILkZw8uzBoQrfKmqc4DMy49thp1uNd5boMfLRmGhlp305LGYFvw9lAm2fyM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e8f0e31302abb90
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIHrdJvFu0vMjmIyUBGHBwFFYq4cd+uNR0WGKg+FeGnM3E1Ro3ofkprkX0OGeJCnj11SucXA2RXUGHbQS7Xvk06DCyrWY22zLbeHKarJbcs8SRmNNz1XoiU6r7Nt1b7cACMAL0tspsqeIoH6A8t3bJFHoe9VX/kLnZirAv58TnLudgcm67+qVNNW4q/yqytHesY7vFBjUuYeqrZE8cLqhGIlojz2/QN3JBKvlwnRkxkOV+FVtgZim491wgG+N0AYI1lMi+qOkhfBOL6nX5WqYRmlz4LixSfFitigKpLaRYJ2SExb15uwJcaldq8Fc/2j2J4VrKvv5jLjfA180po3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hrldKnD93EUpTTS3t0Fp32LcqOWPG36yIxeFRBs9ew=;
 b=Ij8niYl0dRhV3OChGMOKPu08IIiWnM66A9e7957ZEBaQk3RDITL87wehcfZmj/kN7X5Xu8nTQIwD2m7wqDjTkGx4uwDXw9ifacl8rC4tO+Vrp3sXpK8Bo4AUneYGix4Q88TLb/M1Pk6MrgrZIP8f5gKWjhuvpcmhu1us6rwtAD/OgfdeG+Z85tnIzkrnb+x6S+frN5FeocAc5kZg5InTK9enykOekU0msmh08G1MvOc5wAvQYeYib1u3asu4UuV8MdkgAXNSrzB5gTj8Vg07WMkKG/quuc3/HK5J/7x3YHOBERoT3Q6uiZyNafa0gRgUS/xcMX5C5Cvf5PtzdwoIKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hrldKnD93EUpTTS3t0Fp32LcqOWPG36yIxeFRBs9ew=;
 b=W52zosK23K2Dbskpj5kcMvByi2K0X6WLHttkygQDXQZvtxBCh8XLD+LHhyIGxyuSMSp2IzB+S8RQJA6n3p373HZQXwQb9B0JIW/YMcBoeQj5XDiWILkZw8uzBoQrfKmqc4DMy49thp1uNd5boMfLRmGhlp305LGYFvw9lAm2fyM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v2 4/9] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
Date: Fri, 8 Jul 2022 22:54:19 +0800
Message-ID: <20220708145424.1848572-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708145424.1848572-1-wei.chen@arm.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 371f0f16-54cb-4d99-5546-08da60f1e2f3
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB6649:EE_|AM5EUR03FT064:EE_|PAXPR08MB6912:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C/TH2QUcBlatTcsOZce6fy1N79coYK1iS0Qql1xPWeWxV05ah19+w9cigN5uxOtvaCdvkndztLMYafHHdCW5WMgOQsOwwmOJFvsy/9AhRIILOLUo89Bt+av9NKsln+9XijMJQ+giOVD0R/UqyGZw9WSVfECn97813l1FCYkvt07f692KsPS4+v242jq5owAou+APQ70+rP340jEgHhHqX+kkLzz/vMWWtLif04vgJ5KczJxwZzFKeYp4CmYUltlobVxO7WCMZZ0poB683ppqGeLzPXx8vs6z39WNnCPd3QalSwWyfzdLhE3oFxlfIrv8ZABPyiyjvaZ8/g/Zx4QUe/J6wDM3WY9B1Ap6SYd41nSHZ6BPCVByTB5uGKyHHP5Dk00lyWRZHs8QzqmCx6dst/qmkZC55iXvkuHzW6Vexm/1CabCRK/RYxWj5fqIgG5GOTjCgWG1HVk1yTvhz1f0PVGB6sG8mHnbY8GQk5AcnuOfpX+TQdlay2mJgGwhSSEDr74GTa608htGBiqCCfffUCV1DXzhYMiqseKsoyvbsru4lrJRllXqwH3Y+hzpVKtwR7T95sdMlDNBELyxaXZnjf49QKMfoRRz4o6oU+OCDdgFEsSZkyivrO0e8u0j1un3fTDmjeU0XUIIjrMiA1JzyKl4Xmv7uSJWI4s6b6o7lJjb27GxVO/J37dpIV1SRxHGFyeq20x4o6nP1RErNefGf5+NPOBTN92wulr+Q5adiYMXcd9KjXQKtnOLPO65iVBWMUNCoHVXQCS8cTmcX6TkS7zsoZpvPdUoH3y7GoWu7LzyRYC+gC/7AN/hTeOSaaEtzoKe1JjuQ8I8XVKZyqwcLGsWB01dmc3SxYz/czNI+yk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(44832011)(2906002)(40480700001)(40460700003)(82310400005)(83380400001)(36860700001)(82740400003)(86362001)(6666004)(81166007)(186003)(36756003)(6916009)(54906003)(7696005)(70206006)(70586007)(2616005)(4326008)(316002)(356005)(1076003)(26005)(47076005)(336012)(41300700001)(478600001)(426003)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6649
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0cccf23a-e4a2-49e3-7d59-08da60f1dd49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t+y/a9yq0ij6V+9RnM/faSB+7E8mYS+EDOoqUYD5qi0SL/HTW5kjXZc6lMgbq5kXKILjhdnnRmsGwUJH7dCJU9UF6UeYF5B/77boXc5h6sdKhZ190ydLK0Q9LTXM2RYmna0AiFIkECtGynA7BpyxFW0QGawgEALuNfP5JGufkuwYrbl9efPtW2jSbPJ2N6ae6ncW/kSNdR4G9uudCpoAUnwfsUWqCK2p9rX+vZnQGedyihVWFvN5UXTvrq162UysYwcqYB+yMrnuLvGSis3BWOtNFWl4bSWM9J6KeNmEh3f3OowtlzeeFgYDhO9TAYoVi3/grBYAHq4bVfbkIg8torepf0pAPUvQnHLkOBTBTZX0pvnp6ugykDDn/HEZ/bBZHrMYLIrgKPD8Ks+f03XnPmLvyiiN/oggBmJ1gUFIDssSMbXVQl0zZgfjIuhO5fbnpL0aq+QG53htlB8g/rfaByM1wj7q73OSk95Mm2fSTt6hzPrF4YeVa8bAJ20yrnplbPTCevZQATK+CLMe5pjB1gabDYSw8PClZ24NDLA8WlKUal1NVX3j6JJBOrjvV0oCRdztfBotdmrwDVgDz4CJJ0wwn1R/h9E3OfKwhg1Q/q5T7yyYYIijrVLjZhQ5ik4GFjqUy6sqogjJO6190rgB4PaoBesIhA/mEJeOQIqs4n0mRSRj4mtbXuR0BZoAcKCPSPuv/zW2ga91M0NVjAwYGgSIMqMJTuHoXWpYbfFFA2S2QFyOfDQoKutnsQ7F3YFalxQscI/YWB8wDgEJg83czUJKlnZIa6l/JLk0qSSkGlOrSKs76kq5/yZhDXyDPMM8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(36840700001)(46966006)(40470700004)(336012)(41300700001)(40460700003)(36860700001)(6666004)(426003)(47076005)(1076003)(26005)(2616005)(316002)(7696005)(6916009)(83380400001)(54906003)(36756003)(2906002)(5660300002)(8936002)(81166007)(40480700001)(70206006)(4326008)(8676002)(44832011)(86362001)(70586007)(186003)(82740400003)(82310400005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:55:23.6770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 371f0f16-54cb-4d99-5546-08da60f1e2f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6912

VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
results in two lines of error-checking code in phys_to_nid
that is not actually working and causing two compilation
errors:
1. error: "MAX_NUMNODES" undeclared (first use in this function).
   This is because in the common header file, "MAX_NUMNODES" is
   defined after the common header file includes the ARCH header
   file, where phys_to_nid has attempted to use "MAX_NUMNODES".
   This error was resolved after we moved the phys_to_nid from
   x86 ARCH header file to common header file.
2. error: wrong type argument to unary exclamation mark.
   This is because, the error-checking code contains !node_data[nid].
   But node_data is a data structure variable, it's not a pointer.

So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
enable the two lines of error-checking code. And fix the left
compilation errors by replacing !node_data[nid] to
!node_data[nid].node_spanned_pages. Although NUMA allows one node
can only have CPUs but without any memory. And node with 0 bytes
of memory might have an entry in memnodemap[] theoretically. But
that doesn't mean phys_to_nid can find any valid address from a
node with 0 bytes memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
---
v1 -> v2:
1. Move from part#1 to part#2. (Comment from NUMA part1 series)
2. Refine the justification of using
   !node_data[nid].node_spanned_pages. (From NUMA part1 series)
3. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
4. Adjust the conditional express for ASSERT.
5. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
6. Use conditional macro to gate MAX_NUMNODES for other architectures.
---
 xen/include/xen/numa.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index db0e524a0e..695ad51df0 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -36,8 +36,6 @@ struct node {
 extern int compute_hash_shift(struct node *nodes, int numnodes,
                               nodeid_t *nodeids);
 
-#define VIRTUAL_BUG_ON(x)
-
 /* Enumerations for NUMA status. */
 enum numa_mode {
     numa_on = 0,
@@ -77,9 +75,9 @@ extern struct node_data node_data[];
 static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 {
     nodeid_t nid;
-    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
     nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
-    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
     return nid;
 }
 
-- 
2.25.1


