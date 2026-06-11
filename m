Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aN6PB3lSKmqXnQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 08:15:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4895B66EF24
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 08:15:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=selector1 header.b=VWM2aEOs;
	dkim=pass header.d=arm.com header.s=selector1 header.b=VWM2aEOs;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=2")
Received: from list by lists.xenproject.org with outflank-mailman.1335065.1597599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXYg1-0008N7-7h; Thu, 11 Jun 2026 06:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335065.1597599; Thu, 11 Jun 2026 06:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXYg1-0008Kn-1Z; Thu, 11 Jun 2026 06:14:05 +0000
Received: by outflank-mailman (input) for mailman id 1335065;
 Thu, 11 Jun 2026 06:14:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wXYfz-0008Kh-5E
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 06:14:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXYfy-009btB-Hu
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 08:14:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a2a521b-e002-0a2a0a5209dd-0a2a45059458-48
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:14:00 +0200
Received: from [40.107.159.34]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a2a5228-aaa8-0a2a45050019-286b9f22705d-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:14:00 +0200
Received: from AS4P195CA0041.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::13)
 by AS2PR08MB8927.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 11 Jun 2026
 06:13:54 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:65a:cafe::57) by AS4P195CA0041.outlook.office365.com
 (2603:10a6:20b:65a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 06:13:54 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 06:13:53 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 by AS2PR08MB8363.eurprd08.prod.outlook.com (2603:10a6:20b:546::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 06:12:45 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b]) by DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b%4]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 06:12:44 +0000
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
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wygmKx3i4vUBnpRvR55C9cFKR+hap7Bv/I28sR6pv28nPTnm95OWQsegr66qEgpHJIT9Mi7e2Gn27ORxv83nJ7e+Ei6oJspr38ur/Cls31J6J1zlSNPHjQzzLEjoSlg414ul7J47WoeIGet2gaxqd1SRD1A3PgM9+E91dHcR8iBbN8p2bzqMUNqPcY1jYUgyrjA8/MsDcvZ3xlFoc1a70JwyxpePuPwGqCmF+WSFQk+PD62d9MbfuM3HICbSBc0qeQJas3AXevk4ul9ZFHqA52c2aE7HmL2i39jkA1/p56JOxTUGbRdfDxpWraeRaJ9SALm9G/wiiucJdSRAr0YUyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXDvUv2PMe5nnuUKGR/91V45d4NDhbyAmB81s5ANGak=;
 b=yFBMsRHpeL4vK4rNMhxkOWzH4Nxme+TNOh34JffDYXAx5RQv8AFp7XNKnOlGf+/kkHR2iTic9FK7gv2Rbv5SMoeTx2IFWMgYJIb8NI4S7yHvkUVoTlpfDw4bZCY03xES/7oUVzXJk/V7f9D/B82uPktMt+2S9dPaS2HcAhEQI8X5Q4UZ5XUF/Bu81D3OxIXKEJf97d89tmctuZ5GPONs5ZIEZA8zdEw6GGOy6cJxNrjx00HOjQ+NBBfENlKVbEiGEcexEPb+2FD+xEWDfDyRrUJJi6RfKqSMsV3HZDf8YxvsTCGqPQIc/imT35xnX7xPzM7fgatnVhrqfkr2gqNCag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXDvUv2PMe5nnuUKGR/91V45d4NDhbyAmB81s5ANGak=;
 b=VWM2aEOsULrGiXP/E/KIRYiUOWvhMDe/kSp4XQwDhrYViA1x3/dws1QqorpkP7iNYFy3Ut9PMmjH/oaKC1WHjgberiSzE9qbtLHJIK63RMhLKcRXvZrYfX7wfP80FigQnxAn5PjPqzhAZoJHOUzreHEYYli6EtAgwc5+pBZxXq0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JL8q4bc5Q5aOtylVkdr5stzhufIbc1ds5AAsV+EXFD2EMVm4c+LCPBJICOkZii7beBQ90p5/3Av+uSxF8VtaebbzlWdr+V7EMzyNC+lYujzDF4FWUNwI/83vRGrIOAM/gtt1J4j+ZKjdydeEZrB9f36MTwme37CL4YOG4LwLF0nsHoYPX2qeGnzLIK/m9nPm4RzcJkfiOyn708af+diuv9h2Wneqswj1cq8Vw3+HgplWVnyVFYzIZe9gcECn2AGcGBH1pt000zmpHN+jhPaT7YV823SRqsLQ0PSB7rhCC/i5QrfvvH8CBCDWkvdN4HeLyVlpj8JcehyJNXQpwm/CFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXDvUv2PMe5nnuUKGR/91V45d4NDhbyAmB81s5ANGak=;
 b=w2ylOklPoUbjnJsaO9yNE88ApDgQbN/eyR8NuHT8SRwh07mSprMqKrT34s6sMzO9H4PogCp2yBzDJu4HZhgcA1JxhL2A35OeF9iuesXq+AMeWFyaYhUf+KUJA5yj+Lebm32dK999uj9xox+xO9+WZAixSJomYxg+saCsEAqLc7BbboqX5sN9d2S2q5OyA15RzyC5B486qb1zccccHfmF0AKBLK/hUBbBc1qxtVOuQEDujvgU755vvNhD+AmYqzyFezcqcF+z377rIgmQdr5HFlbP2ESLp3uxNOMNxLdAmRJ4zz4BoDYjKazRQahdqncfUZjxeOgMWAHvKMVlH7fhJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXDvUv2PMe5nnuUKGR/91V45d4NDhbyAmB81s5ANGak=;
 b=VWM2aEOsULrGiXP/E/KIRYiUOWvhMDe/kSp4XQwDhrYViA1x3/dws1QqorpkP7iNYFy3Ut9PMmjH/oaKC1WHjgberiSzE9qbtLHJIK63RMhLKcRXvZrYfX7wfP80FigQnxAn5PjPqzhAZoJHOUzreHEYYli6EtAgwc5+pBZxXq0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Milan Djokic <milan_djokic@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Thread-Topic: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Thread-Index:
 AQHcuxeUeXMMAhMgNk65vf8IyW5YQ7Xd846AgAjb84CAApA2gIALGl0AgCjouoCAF3h0gIADmeAAgADnRAA=
Date: Thu, 11 Jun 2026 06:12:44 +0000
Message-ID: <21F24A06-115C-4384-89AF-B6A04029F356@arm.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
 <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
 <cd2c76a2-7a13-4bbf-9c29-5dcf3ae06fc0@xen.org>
 <4c96c478-aeb5-443c-a6ca-f23caf7d5430@epam.com>
 <e489f44e-ef61-425c-bd0e-0a992c32f7cf@xen.org>
 <f258e2e5-f7ba-4183-8b33-c3a169dc1d7c@epam.com>
 <bd0588e3-2824-4c2a-a1cc-6ff62fed7f62@xen.org>
In-Reply-To: <bd0588e3-2824-4c2a-a1cc-6ff62fed7f62@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5590:EE_|AS2PR08MB8363:EE_|AM1PEPF000252E1:EE_|AS2PR08MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: ea91101d-90c0-4809-d254-08dec7809d27
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|23010399003|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 qfOt49VnZMTyD9c8TTF7XEFijkBHcpKK5Cy4ozJuNdmOgvMnNqxH+BE9lv77e/cl33dr3Rr+NIjz6x5EiglkhPr4ezVeDRr/tir1f5+N0pqKUfBRcQgZ+7ulmM7xmG7kqNsbNhvbRNRdpkcQqYpDg82zhN9tNSbMY7/YPbn5+urIIL/U8nUSNNAyGF/l0EefcyywcwQmskYYBYPnpNiiRSmQBfiPfy3kQxpvgPYIRhO0rWTIEY9Ly+Cuw6fOSnLrIZcewFw+PZ33JHBnkNst065YoPZe7l3z674OfB7rf3bOBBILulAmFOHWvxJ0w35CNZusckp3kknCLTEAjeLAv1mzOmtZtThWcoGe1/EGcRipJddis6jYwwrGMsvx2KgE7hvOj5o51RnnDbkcT0pDtjixCR3gLr7h/gB7ZHCI5g2Pt8pMJMyga2CMXsTillfIWihPvnYnlpjydcL4zKVFliCasaHesEkr+FJG3mMW3OhwXwLzJVWt4uenNzYBRsFbRt5Ji9aZMgSoao2RAY1O/mkX3U8nVkKXDQ0mq9Ylm9hV9ZujGBE+1t+dL0qzkv1urgmZ3FYGoBlcLnZQkAJ6NVmAk2QG30BTLQM/bbh6eJB4MOwypJhrqShIOj+sSb0z9weDZ5ZbxPxJBLfT6Uo94FZREM2yQ2JgGA82CspblG9AOGu/blR4uVQohR+rhq5LnOuy3rpgXtvwDR/Q8OulFPx9BmNkSpuBjVuzofRk2/j1rvNomJXgtXqPaREyQxUI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5590.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C3CB20BA00F244BAE159FCE4129A06E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 GoH/TtCuBsdL6PbnLr+V92Ya7Dk3S18WzGcZpcn3s3ePwDa5unZCFtwCxwD2g4kJubcGJMMeb387ZIhgYKy6njN4dyLCImfPB9jVtyLmMPpJQpntIRW/Q+NcCGOgUSYRBadeAaeLKJOtNOD6T4DxHgF9MW+Z8U4qindTXq3tqrukKwDf84/zYyjLvXYc1LiT4YZ6r72MwoPxh7jWIBc5fXKC4JtX1krlUlTs6EFw6D5/qL5S26iUPxba7b/fwnlnPJpCKLZU24VxcUO9iJar2ePJqiNmwYbawoDimnbF/Med4HKmOEK/ZuE4zWluvmcvck4P0suwEg6/2heV9XzCtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8363
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8578dc7e-e20a-4320-7b14-08dec78073fc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|35042699022|36860700016|376014|1800799024|14060799003|11063799006|56012099006|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5X7dp0W05VeyOk6vlI8UXzVLYDJvTnyuzWwDPcAFEyIMXkrFm8Ul7ti6BIrfyzFiuHFtsRBeSTdNxPV+ZhdpGI7YucKOM/kibGdoXvG0lCaIjo62P+M9UpjxK2X0Ypj8i9qKA8SRGTay/kb25mAnPeL0ksutQFbcRyzOw0SiqvGWejhTIrdxyoGSK704xj1Im0fRpradyGI/0e1p7hYfmH9rVtc3+cQRiaQXXUKKFO5ios5YwtNm55Qb67EcvRSne+tLbfRvnu1Zyt+tIm3zgng6PuIRZW24xSOltV03ft8DwyGHVqZlAk4L5nRhRCp1Wn5xvJfw5lMQpg0tTp2KgvmZD1CwjfHVFFANJGAK1ukkRa1Z0PknJ54U1OH436jSVINWl8hX3t9TOpkaFWDOzaEs4fUN+rEayMMbNMIWKrmcyWGijpyPfDzSUYCEgLk814Qy6nwpejt4XxEZ24BHkwJ7sEB6Ie9iR+upYWigYjCn/68K5SfnHQy7Al7TyS2jh7zL0E2KviUGttmZr/2PmAsQX8682RtwqPzvchCRKsZ0fv7zUaKwLXnBs0G5WWO14PoihiitHZSXPKAR0XKPEmXQqlz2cWDnmgFKDtED/DKi+iu+yzTUGIdQMXnLZ818bflY/aeIx32cGa8vuxskLwu4bdjswMr8acy7ga0W25jkvJ5/HdzXmZFhgNT/D1wn3kWHkqFKE9dFzwGLovYFv3l/NJGVkisrBtmzhGUEDNk=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(35042699022)(36860700016)(376014)(1800799024)(14060799003)(11063799006)(56012099006)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zSc4T0GfRYYid4cXtE2pZH5+C7JRNPVinTUFGxVfdpFwFyZUFo8CCA4jcSyawgySwdF9oOJ1dwP1rBRf4QkTLXf0Nu38ZrCYuVOn9ABTumf0fay7Iu1tYhLk+kH2zrbDRY1lqAKSeefy4AzsVZOhJupqK3LYZx+/7Z1sR4DF96CH4Z/e3JBhZRPlkdyX6LmHvU7btpVAonUVJ54DLsN8PgL6bgks72mr6wk6TWi/Dmj5B6kYiJ0bnZWbtUIa8etLpab0y4oOXbkJOHAwXG24RV77hrDdqlZsMtttwDuq4qQ+QuOXAH6r/5DGQVFfcuWj/ghYnI4ia+hgaleI9q3dBwa31klFuRMOP6Mbo1Otcgky3ATaoNb35TsLvMeM2XG1eau3YTTRBrjftkyrj3Dpa1eR2uDH8OX5Zhc4zNq9aaU2b2U2wpoPSG4wyOW1dcNM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 06:13:53.8605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea91101d-90c0-4809-d254-08dec7809d27
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8927
X-purgate-ID: tlsNG-c201ff/1781158440-E0A66443-D7C09FF4/0/0
X-purgate-type: clean
X-purgate-size: 3373
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,arm.com:dkim,arm.com:mid,arm.com:from_mime,xen.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4895B66EF24

Hi,

> On 10 Jun 2026, at 18:24, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 08/06/2026 10:25, Milan Djokic wrote:
>> Hi Julien,
>=20
> Hi Milan,
>> On 5/24/26 13:00, Julien Grall wrote:
>>> Hi Milan,
>>>=20
>>> On 28/04/2026 11:16, Milan Djokic wrote:
>>>>>> The original idea was to also allow stage-1-only support. But I'm no=
t
>>>>>> sure if stage-1-only usecase is useful or even valid for Xen.. I wil=
l
>>>>>> update the patch series with the missing parts for stage-1-only supp=
ort,
>>>>>> pointed out by Luca, but the question remains if this is needed at a=
ll.
>>>>>> If not, I can revert to original state where stage-2 was always
>>>>>> required.
>>>>>=20
>>>>> By "stage-1 only" support, do you mean Xen would use the stage-1 in
>>>>> replacement of the stage-2? Or do you mean the guest will use the
>>>>> stage-1 page-table and there will be no isolation from Xen?
>>>>>=20
>>>>> If the former, then I believe the page tables don't have the exact sa=
me
>>>>> format. Today, the page-tables are shared between the CPU and IOMMU, =
so
>>>>> this would need to be duplicated. For now, I am not sure this is wort=
h
>>>>> to do.
>>>>>=20
>>>>> If the latter, this would require the guest to be directly mapped (i.=
e.
>>>>> IPA =3D=3D PA) but it would also open a big hole. So I would want to
>>>>> understand the exact use case first.
>>>>>=20
>>>>=20
>>>> The latter. In this case, the guest would configure stage-1 while
>>>> stage-2 translation is not used, so there is no additional isolation
>>>> enforced by Xen. This would only be intended for specific usecases wit=
h
>>>> trusted domains. But yes, this opens a significant hole if used with
>>>> untrusted guests. If there is no strong usecase, we could restrict the
>>>> implementation to always require stage-2.
>>>=20
>>> It is still unclear what would be the exact use-case. Is it a system
>>> where the SMMU doesn't support stage-2? Performance reason?
>>>=20
>> This primarily targets systems where the SMMU does not support Stage-2 t=
ranslation.
>> If we decide to keep this code, I will address the associated security c=
onsiderations and document the corresponding AoU in the design. Otherwise, =
we can fall back to supporting only the "nested" translation case.
>=20
> Thanks for the feedback. I think for such setup, I would consider whether=
 we can use the stage-1 in Xen to protect the device. AFAIK, this what Linu=
x will do.
>=20
> I would be interested to hear what the other maintainers think.

Giving access to the smmu to a guest means giving it a solution to access w=
hatever he wants through a DMA engine.
This is not less secure than no SMMU at all but I would definitely think th=
at in such a case SMMU should be reserved for
Xen to use it to protect from accessing other guests memory using DMA.

Now i know that in some setups there are cases where a specific device cann=
ot be used without an SMMU (mostly GPUs
but there might be others). In that case, the device cannot be used easily =
if the kernel cannot use the SMMU to remap the
memory at a convenient place for the device.

We should not disallow such cases completely but we should give strong reco=
mmandations when such a setup is used.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



