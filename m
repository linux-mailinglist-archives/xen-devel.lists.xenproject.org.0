Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFcxKwYWtGlkgwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 14:49:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 145EB284384
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 14:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253735.1549804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w12ss-0007hZ-7k; Fri, 13 Mar 2026 13:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253735.1549804; Fri, 13 Mar 2026 13:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w12ss-0007f3-4g; Fri, 13 Mar 2026 13:48:58 +0000
Received: by outflank-mailman (input) for mailman id 1253735;
 Fri, 13 Mar 2026 13:48:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1w12sq-0007ex-EW
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 13:48:56 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5efe064d-1ee3-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 14:48:53 +0100 (CET)
Received: from AS4P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::6)
 by PAVPR08MB8920.eurprd08.prod.outlook.com (2603:10a6:102:328::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 13:48:45 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::84) by AS4P195CA0002.outlook.office365.com
 (2603:10a6:20b:5e2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Fri,
 13 Mar 2026 13:48:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 13:48:44 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB9865.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 13:47:41 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 13:47:40 +0000
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
X-Inumbo-ID: 5efe064d-1ee3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bkTpzgM5wyCkLQSlaZpXucJYI2alOu91TMxCZ/saGMuueqXxF2zD0O8POrVa+jUxmGIACC7rZbS41i3N3uDtnGqJ6wsczrXO+7lBm+biXxzEtGXnLF9qt7wWGxYFeZnEz6fIA3UvqzehUcPcbj6OjPFgfDJRpMPqHc+7gfD0KPJQkP+FcgycnwUXouqktXeFqc15GPTiynuMnNyH1TuzBhVJ6WpFnY2NuJoTEgtPjS5Fdnt74eMJU0gjA4QggwB3hEneIAxBWy+izYnSeR6jrhSUOiqnYcXRo/RP4ytkmzaehUhWFYEqpH9mzfPbZfy/z4MmV6AG67QmBUoo7KHSBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAvZr++PS8HJGN2RBjUK5uwFOBMEtFwQQvyRsdE2Zos=;
 b=WCi1g8rFmMNSimdHmVvePuRsJ98jlXqncy3jrfrELknquqVS94ICAlnRfoDaS70SyG6KyztgEJ0imyL1sGLcTegdWV3XzCkjTM13irxaFnv9U8a1HfWjNXAgYF/6bbWg1Y9/RQqHa8rsNrG2TDm6Wn+4aiXdED7ACEdamRT2fKohLpiudQdAW5mOUzzLpstDPsJVqqWQQtjXflxLmcATrTb61hU0rHJQVLpBVfT7hFkKNOS84Cr/5qLVLODRdytgcdLFNDjqoDsZR25KpPjmP5mDbdK13NwOMmFSF5euN2YxZrd2qrq7WycIbKxQAX5IMMYPQ5dng6aIdMCFC3vb6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAvZr++PS8HJGN2RBjUK5uwFOBMEtFwQQvyRsdE2Zos=;
 b=Buaalwo2Py9ORB6+xgkIc5vXmxsNvIecYBwabOkAugeL+oLXa7F4sc3BuMIPMuHgVbcSYtt2LRLnnTItNaEsj7kmuxjz1MU/qjXEylBkLudOBytAJ3VT49tk6N9zR0yTloBHyEyk1rkoPaJ/6iJvyhlI2V5G6nVx3THmkL9ZCzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8Dl5l9G3lrwSGow0v+1ueRpn/Gx91lb3+zz10Hj68OtDEskGiIz48cpSxpW88nLjyKZqp0RV6SfvH7jn1YdXK5WkDBdBHq7l/SldUcjxHLbdk6/nQWanWPh7wtYI1+nwTkNZtXT6yuLHX+HyWVZJBz46UcKKjm8sRpAG8Q3nnkf7/bhM7A4D8jvT2c9ZEmRxTpTEGsh1s8C7FPitZXp+ydG0MjEb5Bwb5Q6jQiNuIs9C/NiAZNiGehs/PVLEfSwiAKxC92c+FSudNjPb3gan7lcOlmavLDHTqFn2wtSP6yV+UL/d1Lw2uGvbA+lTUxCXSJF3+AhVsh+MUVBQZXevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAvZr++PS8HJGN2RBjUK5uwFOBMEtFwQQvyRsdE2Zos=;
 b=ao8bn9hEuynwHiardN5Ud3dCQuTiTqp57DGEp4wA0pMV3gRyWFWNN8BhqP/2Dmx4ywkz4caveoqZWbG3jd4uzVWb9oImG42P9NMlfEyVBJMlyOPXiEqAi+6GS2HslzOjO2KMhtTl9hloqWcrPUdPvjDHpZy0q82M1Y438r67u9bSsJ4d4ifiRr+DXQ20+LZ8i2XLF1U22Htxz7blCLT8ezzfkinxJUHFDGIp5r8aZJkmW2JnBsw8oqMH+6H91OJBdaQmeTnlcGBEZQGzC5ahTPLe4YgbsnD2IzUSrpQo4WFJJLM5Z3+80whdYiVXIl2UFIjtm3FIqXj99lRdFj4lUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAvZr++PS8HJGN2RBjUK5uwFOBMEtFwQQvyRsdE2Zos=;
 b=Buaalwo2Py9ORB6+xgkIc5vXmxsNvIecYBwabOkAugeL+oLXa7F4sc3BuMIPMuHgVbcSYtt2LRLnnTItNaEsj7kmuxjz1MU/qjXEylBkLudOBytAJ3VT49tk6N9zR0yTloBHyEyk1rkoPaJ/6iJvyhlI2V5G6nVx3THmkL9ZCzY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jens Wiklander
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm/ffa: deviate violation of MISRA C Rule 20.12
Thread-Topic: [PATCH] arm/ffa: deviate violation of MISRA C Rule 20.12
Thread-Index: AQHcss5tR2+5DPx62k6x27kB0BQ6vbWsekIA
Date: Fri, 13 Mar 2026 13:47:40 +0000
Message-ID: <548021A8-AF47-4466-A8A2-C924B7BCBF9F@arm.com>
References:
 <5c415313cb818323b70c59c2a9c26e6122bdc434.1773393963.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <5c415313cb818323b70c59c2a9c26e6122bdc434.1773393963.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB9865:EE_|AMS1EPF00000043:EE_|PAVPR08MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 13cb5fc7-2071-4da3-b1bc-08de81073e92
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 GfapNKisQRS0udRLdjWBWWuSq0RpzR9pYDHFu3x7dzjB2yhnb7NUGCwhpho5gzIdp/vA613fE5v+HIt4Qd/0d4xhXt/JeoHbTgXUnyrypk/HygJkXQzqV5tlg7rMCVXCO1Hh4YL5Vllqvilgnw8Q0bmq50xCGP41DqVWLQdqqaWjH7fIKTvrK+lLF3A5LDxi1PYgukRgKHgH59kOXjXig76OGoNReA0al94GaWk6rAKeqmCH5EHXw5Ubhc3uJFwN/PhCFpBrCpYKScItO28E+k/6ToLlK1qJtOhHkSGsW9fPaKpR7U93Jiu+EJ0MAfIrWhtqdWZzs3gTttVWVuqxivPZS74HPZaDDzS7hkVRAjFr6f3Vz3GgSxgL3/DojE5+RpNIa12t6O4cJ6Kx0oxSODyTSvzOe2fpUdv10YckFDRwd8DTIK9jyqjzCJlRXac/hqcX6LR6xZcha7kIM2ZfcQPW869ULIMWVYgxs5ZKd2rkiU2x6NR66hCIOcNZOW4Y0MAuDYey1zUlyM6/7JMhO/lbeR7BaNt+FV5oPt5zhW5BWPAO1as25KHzpNbHtRsFAf7rGIfQXLRRD4nU+M7i4RuyFVJNr0nGtZOHPIujkKi1pYGMPQZYlYpIsMIsC45JbVQVPlB+SaQ3Itczgtzqj1Ue3U52RwiqPFTuaDSxru4TvIW3ZeAb+6A8CbLB97Ks3iIq6VsoHMUlrfsN9MOtRFdhciJ2Yz5lbzxWQdN1GKOObGCWt+cf2lCeYnbQiQxDziwowgeQdGyGVwv9vcKZ4KbSQqwZBmlrFDrryZVBBek=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <555351D173AB974AB20CD731B23AA00A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 pMcsKwy9NVx/pLbE25kLQHbKMfGVdS9adcWvTSEekYRtykrw6p3X8UNu+38drzxD8jqNYHeFlpDuGRNC+XBcX0Pkd3wxnk6wis4rRH4reEpfNXCDfvfzDqsuLmt0MEBtPUDZ+Fbg/C3P14YYe6cwTUxFlG6vnDxte+lQ4TfFGVkUV/mJ5oDVne9CtCgaPs1npHtWZUdpn2Snp5lNvt37EMuaI+fHRX7YrpSXonMQx4y8LIuK1gIzf6YD1rjIxinuGmgLL2+5Ep1Xy3zQp7KLj4mOQYGAqk07FYozTYtbV1ddyn6KfDYrXJ50PHw6f2V8XRr/AVW3h2NV27b+Dkkxfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9865
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a83217e-2a01-46a6-0c81-08de81071868
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|14060799003|36860700016|35042699022|13003099007|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BnwjBxpkuTmL6n+ZopFuBkTDJ0VcdDICtyhIwWzX1dU17FSCaoZzShs/AdE9rNGJm/5bF8bbIYAIubBCfd0BfMVGwGXhGZI0JQonrTm58JIrcOdcLL7v+Cnbs07hqfi4WAJ4+nVeid+EXMX4x2WC1qI1Aj5+kQWYx7ioSlIeWpTJlBh05k7EAE09WPHIk0wZfG+wix7yJyhVNqcz1V7m4IMn2Zqv/N0POpBGeYcQ7jCBNAa2F28UHx8mhXlMnXe9593cgpiXqnWcmF9kDHh4vEVNlnxtoC8+ZBDEnGtkk8GkX/4RtjL68AHwzAj2l7f5BCCL9hhixF+n4pqvavCR9LfZ0kJVe1YuRxWjXptp0JGejkGgQI/K8HOE6+GlDiiwHQVtuPcIyuLU2XAnh/MLbv0iEb3piNG0l9zTbQ6jrOpmMSLdVbrZ9e0jtl2/eaKwNGu9hA050hzA+DgA6jLOIWBEej5dBjXooUIUXtkOTF+BAf/rT503t6ZuVKPuUC4pNY8brGq56MFfQOqV43EI5jNn91rFQfe+xpdpJS7PqE4SpzOpedzTCW33kurg3lQ0U78ziHV50zMm6RZ5QuWPEVwfx1MrNU0SQmTnvRcWmcANcn9RxJ3I+ymSnajybqhGnR5Z7wkv4YOXBqiBRZ+n/Gb+bqdgLYnDwe1PrTdcEhSc49yxd9Gpy+yLNV3wo6IWIRxJ51heKbquaq2OhqFnUImgBV6gozWD6mXMJS6+fsSA1IAB9l6QbI5DT93Cl/A+5Wesz+tsTQ4dv54xd5FC6g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(14060799003)(36860700016)(35042699022)(13003099007)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fUkGb+qOTpbszvYOBmzEugm+B1Qygy02uCVFvujJp/qwpmd7yrDTkNIyXFDgW2UTDw4svJMdTcfiZOuhY85rgo132YpmZLJFo26+6EzjDGPWbPKbJAk9BTVo3gUbx9GKmIvPy/NWlZxtQcOhXWMu2rYFDUZklr76WvD5TJ6Mw20EXXppzFJrmI6RiEZY0MjdFSLupJlw8YnNsWiKCRw4h0SVMZj0wWZUcx+mr9kLxxcja8MdobaIzzzbHMvwnPju+uIUEcVE/A/6Yp/Fj/15BEXDKn1DfEkucbhy3aQwgrDMhQJaKjhi3MKE7ZYhB0J4IIUbcyQ4WC4HCclSJ12C4Vtr7ecfa9VyzDgJenTSyia+PgdhylX656b1nZrPJqqRTevGQ9ifhtpoSH6X9nK4zhoD/D38Me3GFS6L73/lKu9MicY4OpVCZ8f2HP4W5Y/m
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:48:44.6736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cb5fc7-2071-4da3-b1bc-08de81073e92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8920
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:Volodymyr_Babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 145EB284384
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmytro,

> On 13 Mar 2026, at 10:47, Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com=
> wrote:
>=20
> MISRA C Rule 20.12 states: "A macro parameter used as an operand to
> the # or ## operators, which is itself subject to further macro replaceme=
nt,
> shall only be used as an operand to these operators".
>=20
> In this case the 'FFA_*' macros are used both as a regular macro argument=
 and
> as an operand for '#' stringification in the expansion of 'FW_ABI()'.
> This is deviated using a SAF-x-safe comment.
>=20
> No functional changes.
>=20
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Thanks for that :-)

Looks good to me.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/23831419=
97
> ---
> xen/arch/arm/tee/ffa.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index aa43ae2595..d4a77206c6 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -80,6 +80,7 @@ struct ffa_fw_abi {
>     const char *name;
> };
>=20
> +/* SAF-6-safe Rule 20.12 expansion of macro FFA_* with FW_ABI */
> #define FW_ABI(abi) {abi,#abi}
>=20
> /* List of ABI we use from the firmware */
> --=20
> 2.43.0


