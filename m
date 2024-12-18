Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A768A9F6A98
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 16:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860627.1272638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwQu-00087q-40; Wed, 18 Dec 2024 15:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860627.1272638; Wed, 18 Dec 2024 15:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwQu-000850-0H; Wed, 18 Dec 2024 15:57:56 +0000
Received: by outflank-mailman (input) for mailman id 860627;
 Wed, 18 Dec 2024 15:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNwQt-00084u-1c
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 15:57:55 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d70fce40-bd58-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 16:57:53 +0100 (CET)
Received: from AS4P195CA0036.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::29)
 by VI0PR08MB11018.eurprd08.prod.outlook.com (2603:10a6:800:253::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 15:57:48 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::f) by AS4P195CA0036.outlook.office365.com
 (2603:10a6:20b:65a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 15:57:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 15:57:48 +0000
Received: ("Tessian outbound b519d6c64997:v528");
 Wed, 18 Dec 2024 15:57:47 +0000
Received: from L205f82375703.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB4F8DF5-4DF0-4487-B5BF-8ECC16515590.1; 
 Wed, 18 Dec 2024 15:57:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L205f82375703.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 15:57:38 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB4PR08MB8054.eurprd08.prod.outlook.com (2603:10a6:10:389::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Wed, 18 Dec
 2024 15:57:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 15:57:36 +0000
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
X-Inumbo-ID: d70fce40-bd58-11ef-a0d7-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=E823hqnuILMUxPsvLJvdbAPTpMI2JqN3HS2moD8zRxLPsSecm6rC91vSLCPicGANMHOEhANZSs8EXRZ4LKJfP8GTbYUPqE6ZBQiw9oF4cokzrvAYswbD7c+to0WyNXYETxPtUXH9MCNu7x4gni8IIRry4p9vaRim/iYteox398ivNGHmw2d/Ew1qw5aU6mRlJzo7w9ESjKI/NAN2TiLBl1BPa4AJyDBQMU9Esf8N3LT9kVL6RmsYNqrlMRTv1nCqFehID5OK5xMypmNZY0DNXcRyQ9OF8vXsZZ6gtLBqv5yacLof0lpq4XQM58zfqrwsSEQC1dHDCYBtfmEdr7pjjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wva/7YXkcsAC6ZulTQNTl2G9Q0Iq2uJn12WHp4tfxtQ=;
 b=EZ4q5UqxXXPHTpM+g3H7jvnzvboJ6KCyRbfc6NBjekmA6PHpJmMOlIC7CORkEdfLn3AyN6kLXb6F6SuqvW8OX2Gk5Z4DPtyShl+TcsQ+SG/AVvlm0nqxC6no1tILShJHPKbeW9ARlf1ApaQsvJryedtN8l2+A7HFYWFiuVYnflm6fpqb8Ui8UW7NnfsU9JmTNmL6aGx8SHD1GS1a5xHNKBrT2Er4+5EpuZU9j5OS59/4Ob6znnv3T1XbATzydkppY3tifLeqcTSKYguNIPZFV0Ptb+tp/7/UynqkgBSmLAclSN9Nlwa9H0nUdRyykTA/UCYd/0WHEqL8amTqNpQwWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wva/7YXkcsAC6ZulTQNTl2G9Q0Iq2uJn12WHp4tfxtQ=;
 b=ARwZtGdFP1gZP6Eu+JpFkCJ1l4I0tiKBTMXXYGM+BHsqNJCUwYpRYGgwl1p5hHyJZ0QnpZxlSfm3ZjR9KXmFrG041w94GA4NaMQhBQ/EiLr2t0/M3DH21WivFObgPZC7/h4els7rIj3HKNrqM94lqclZ/+xmB09YTFUqCxJAsm8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5eaf24747635a21a
X-TessianGatewayMetadata: sq4CSfJCi2XjI4wYBuM8mHYeBCY8E4O6ey5+rAd7q1t51sVSWidC5nFHoq1o9FEtikcDVSjMCmsU54B29zhnDTzdysSsLylxvlmlJuq9a565FIo0VVwbl+nCilaEw0uGxwyWHWm0Z1BMSFRpOTB1nCy6C19OuGPvfxTD9jXv1Ic=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ce09Cenn1ev86YflHNgytt+wEJ/t/+TS5D04OSEqf57WGNxQKi8J+eL9ESBGv0HjLj0MMn9Jah+cp273DU2q5TqoBJVb73kn/V3idl9PXsfDJusBzG2ZevYFJ8OXWnnzX41aRbFRqalY60SIjRK3W5NQtKASzDJhwn5afmGDuzRk20+EK5RFpRkGPVQdtzc38tK6K+Vu53WQPPq15V1+gs5fNlUK8F3ckUfQzZwYP3SwdX+oO2KnlkkeEjM1ZR2pvbHkQ2FA1j9vGqvxzFULTbsb5F9CEnJJ/xqkiiLH52Ps5WQPfYj0uRl8QLIMeMxyv5IpPVhY5hVFNzd1v0xjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wva/7YXkcsAC6ZulTQNTl2G9Q0Iq2uJn12WHp4tfxtQ=;
 b=PqkhtE5oR9B5Lwk9uyOrti3ZXYTd+3ToMzX1HyLuE7fKn2B/Yxjk40oTnPiRT/5tf9WS15U4wvzUu6jM1AYReNOxQAd4uCJvqKHSC6kWVntwJn//VuNppQG2kaCCvP4d+vK9MuQRl07wPiF+oK4QXMtye+Wgs7wtCFn+rPTDIARm33n7FxNVkhJHdFaXLHZptCW6L5dgl01h+3e7mi+y9tId1gZ992kw0EmteuE3oLIGrgdAYmCIvc8s6+hMoEA4wpwIwLPHqyHR1RIpA+eU4d9jEaoL0jAcvdOfZUlNQtaqRNoS8TFcFJuqr7/zzgAdhNO8VAAhIE5ZWnmh0GiiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wva/7YXkcsAC6ZulTQNTl2G9Q0Iq2uJn12WHp4tfxtQ=;
 b=ARwZtGdFP1gZP6Eu+JpFkCJ1l4I0tiKBTMXXYGM+BHsqNJCUwYpRYGgwl1p5hHyJZ0QnpZxlSfm3ZjR9KXmFrG041w94GA4NaMQhBQ/EiLr2t0/M3DH21WivFObgPZC7/h4els7rIj3HKNrqM94lqclZ/+xmB09YTFUqCxJAsm8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/6] xen/arm: platforms: Add NXP S32G3 Processors
 config
Thread-Topic: [PATCH v3 3/6] xen/arm: platforms: Add NXP S32G3 Processors
 config
Thread-Index: AQHbUTVdoMCMlYyvB0KhW/HQpIvTvrLsHi4AgAADtICAAAZkAIAAAF6A
Date: Wed, 18 Dec 2024 15:57:36 +0000
Message-ID: <7B7E57E3-C196-4F7B-B855-78E04763C941@arm.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-4-andrei.cherechesu@oss.nxp.com>
 <8f1c342f-61d3-48f5-8311-a1162a20cb24@citrix.com>
 <3FDFACF4-C998-496C-806F-530CA3C87622@arm.com>
 <17240d6a-42bf-45fb-bb8b-2ad5aa1e855f@oss.nxp.com>
In-Reply-To: <17240d6a-42bf-45fb-bb8b-2ad5aa1e855f@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB4PR08MB8054:EE_|AMS1EPF00000046:EE_|VI0PR08MB11018:EE_
X-MS-Office365-Filtering-Correlation-Id: c1aa0feb-4623-4b28-f2f5-08dd1f7cb82e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?xdQ4aYPBkPwcEx9MJXBsqt940xi002vRGQ9Sfv0geIj2WUYTrEoKMu0Mol4B?=
 =?us-ascii?Q?DnxQXR06nm3+ehcAFxBgwCFPzwMHq+oLKYKWHwOi+C3Vri9d5qJdb1J6N9Hp?=
 =?us-ascii?Q?kvmg719lZDa5AxtUT85SFybgtmgRtmF2zbjANnE8sZK3rBHSfTMvYngjMeNu?=
 =?us-ascii?Q?wwFgXTKE5pDln/AVMfAx3GQrDdTConNIy6I9XNZ7U4nVC09yuAG4VzZE3Zev?=
 =?us-ascii?Q?T3QPX4ME5dosF+i+6Q+EIGcO/Tf5dW/LNcWcYvB741fjiHhaNHvYFLCZBp7w?=
 =?us-ascii?Q?bgSaPnQFya2O0qZm+Y5edb4gQ5zLrWRhSNQb0uYJGJNYdbB0t2lLXguoqKIC?=
 =?us-ascii?Q?3s10gPJlSoNNOZgU5d6SdKM32fgV7B151G7Sp1nGXEJkHu3AUeIqXMmWXvpz?=
 =?us-ascii?Q?IJueFZuvFmT2CD61Y69Yw7I5CyJps06W/NdyKmfqHGKm4uCEk4oe2rx6+ZG3?=
 =?us-ascii?Q?JZR6Bx17E5ZZrW3320EIFYOvKyJzMzY4MMuBwDNQo1NWhPPznmzmIZ7BwcpN?=
 =?us-ascii?Q?+HSRGFcoaeWMz+4fF/Ls1iSXyb0S7LTLGyOUJDCl6WAFlxyw5fkYf+rDrglm?=
 =?us-ascii?Q?506QhKg90wqmT31HVR0zx9Kmt/LuE9b+EFGJyjTRJSwbQcO6r7IjPe6MBbsw?=
 =?us-ascii?Q?MsZ0Peqa/h1CjE+uxlHVvT47o7OMtSC42M1wuEuo3dQLgfQrtJ7gMCt9vIJm?=
 =?us-ascii?Q?1DEmz4/6p/Si9yPrdZyxGdEIjyR856W2ZRingmptGmI3HXECj9YU/ehKeVv9?=
 =?us-ascii?Q?CT81B+oXPFAw+CeZKAPIkvqYnRrGonvwD8GfBmQ3Pqi6WMc8kHbaLEsRA3OV?=
 =?us-ascii?Q?VAFGt1PAK1HFZoas932d30SMb/fls9vp9LZktdOfHSMxaHCeaZpuxbYoac5P?=
 =?us-ascii?Q?FYk/yUeFCjRvykg7B3BXMWZUdUly9uvdh9H7n6QUksw89vs7DBWtKAJFyj0M?=
 =?us-ascii?Q?/xH+PnUqzkyTmaWwwJWL3PX4eoTfeGyGqellc0aSt/FIrZBt2B2Nu33nWQT2?=
 =?us-ascii?Q?JlK2mQoYrgJubHgawskL1XeGzE8EMPl5GLgCVR+Rhf1bC/jH7DX/gS/sOfAz?=
 =?us-ascii?Q?Psf16a3q4noPmp4GokTUZ9gQr7YkADFCEMa3hpZCglOroDQe/0ViHMrYvQl5?=
 =?us-ascii?Q?0GUM9P+dqdcPSvBwqsP8PhS2RzA47LaCdlifT4RDGoakzcyH/GM33f9FOue/?=
 =?us-ascii?Q?5RB/+PWJCoSOaBS7UUGVpGOIHf/xRn7LNbptFi1mPhtPecrOHDgK/z6oI3Ye?=
 =?us-ascii?Q?VE5uFAKNsa5kRRBh4vdZAr7NnTW0QbW4Rzeg7BzZWOZ+C3e2Xa9ZJ1cTK7jB?=
 =?us-ascii?Q?ozr1FqaCSYTw6dA29PjZtho2CVpvSn0sRk8Woq6dQq9jfNtLaBZ6vNbPdXSl?=
 =?us-ascii?Q?XQF6KCQve7pxHLxshHXG94cZ+L1V3NC5TW4hC7taKeXEcnbq0ERYODQqHeur?=
 =?us-ascii?Q?FEwQdIpSuhzTIhxfRQm5EATf3XXmDQkS?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <594535A8A4C9B248B7099FC5FDF2DEC5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8054
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	261989c2-1a61-4ce4-5523-08dd1f7cb106
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s0dNC9BIVJ9OI5xCx6I6Fm+O/kxkioM/iQPIn5HeJn+bmkKj706Ul6x6f/LP?=
 =?us-ascii?Q?JAJdSXokI1vY1jJq6Gz/rFpHo1aynXkOfu00OLAg1jmv4/NHoRuuiWo3TSCz?=
 =?us-ascii?Q?QWaVYcGEuHlvV8ANHy0M+UXBkzCR+ogL5oRXvEPG/fXvtvMFHZ5Sr9F1C1jz?=
 =?us-ascii?Q?ZX9kmVtEfIKGbqdBT1HmVwdEFxcDgc8Kk9daF/Jhg6FKJgzCjl5sDsos8MnS?=
 =?us-ascii?Q?HaUXW9dwNwgiZ/Km2R6RWuJ6tT49i05pnop5MJMtXPiLCqiV7AssUd3fGqe/?=
 =?us-ascii?Q?nv72jBx286cZTITNgHM9XRe4PK2Z5SvHnGQuW2xZsIXrS3aWmWWIsQo2VwaH?=
 =?us-ascii?Q?lcAUuNpTQBF8hmbN4mXPtV95YPG6HM/J1NM+n5jmWjT/qSrixOH1qsNouxTf?=
 =?us-ascii?Q?UB6VMaMP3BqiPamJGr/zHW/GSZwcDA8Z7Sy5p6JleARwr7fPRXVOENbiJatN?=
 =?us-ascii?Q?ZjfDH/iT/j9yyg+A696K/DNp6/+aU3oRf78sN4jcWnocwT460YL1O53UDiVZ?=
 =?us-ascii?Q?l4HBmgs4QteGsfET8Z5DTrsyc173PCdHyEv0W1Idpwbl1UmCqQu+IifQFkq6?=
 =?us-ascii?Q?Kyn3itDNnZl/hf7q2MZidrtHKSYTdQTgUPlYOWJE4RkuTVuOrMVf0GIFDVZj?=
 =?us-ascii?Q?MFCeGvbIfPKBmGsiPRkdB1Yxc2yG37WviCWwP5Eq7ICt830UPEwG3OU7XUq5?=
 =?us-ascii?Q?r2EWAkfEzz+aTQPFEJ1NKQHRaUSceQiNrWFrjj7xkZPCnywYpe0uTUaNgVUj?=
 =?us-ascii?Q?/OR34mPrpylCwvFPjw0IBpQfk1x/im4paanRvtepri0AmQYo2oOmLlV+OnAh?=
 =?us-ascii?Q?OIsOxDVSKV57pmv6fjkJe9I4222gf2Hw/MVsj0jLiMPJqLR/0p1KYoY2dBBi?=
 =?us-ascii?Q?iblbZvwagItSHMMh3edwufKkQ/JZhU/sVqYhxkXa0MKaydFtlGqcn+F2aU6c?=
 =?us-ascii?Q?lqnvwFw7Wx/e6etcphRlc4XZWFu2LHIAPNL0AQ151CLFcYbiaFo7QZ7CQork?=
 =?us-ascii?Q?VxDRCV9YI5SpEH5BafTB6zldPI5EZDBy87ZGds+UH3IhXR9uvc3AkXbRrHVr?=
 =?us-ascii?Q?61Xt/zt9aYYZbB0bFoiHRYh+mywxpgCNw5KC2XHX5wFzHn6ApvfgnEnm1fy1?=
 =?us-ascii?Q?+Ua0wj5tMfABAUKjQJKNSbCyPeWpR9DRdyAQy8JklhDtuNS82ZefU747Auld?=
 =?us-ascii?Q?K54ikhsAKKTNZtvp0TLKmx/SYTiC1/o24zRq4orfNft22aTa23ShaSySOtGo?=
 =?us-ascii?Q?vRd3wIK+KGATlV/27wXBRoAn6wrYUrASWEpAXelJs2XsB7tAM55slggSLOjb?=
 =?us-ascii?Q?WGI0AVRDzaui1bbkXz7Wmr3JmMl0BQptOSuydh9T7UNloG8fgR0CnjvY+A+r?=
 =?us-ascii?Q?3BHuB3nU5q10X5mJ83hX4RwZY33bofsO5E1LYEdEKBewkH1xPhvmYnQlGEkF?=
 =?us-ascii?Q?aaqY0Eb54xuAYL51u2noXSduSgRNFVDIKxx4QioLUMPYk9FpjOF/hGB1wvH8?=
 =?us-ascii?Q?+1XeNDZe6oeKieI=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 15:57:48.2500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1aa0feb-4623-4b28-f2f5-08dd1f7cb82e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11018

Hi Andrei,

> On 18 Dec 2024, at 16:56, Andrei Cherechesu <andrei.cherechesu@oss.nxp.co=
m> wrote:
>=20
> Hi Bertrand, Andrew,
>=20
> On 18/12/2024 17:33, Bertrand Marquis wrote:
>> Hi Andrew,
>>=20
>>> On 18 Dec 2024, at 16:19, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>>>=20
>>> On 18/12/2024 10:11 am, Andrei Cherechesu (OSS) wrote:
>>>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/K=
config
>>>> index 02322c259c..6dbf6ec87b 100644
>>>> --- a/xen/arch/arm/platforms/Kconfig
>>>> +++ b/xen/arch/arm/platforms/Kconfig
>>>> @@ -37,6 +37,14 @@ config MPSOC
>>>> help
>>>> Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>>>>=20
>>>> +config S32G3
>>>> + bool "NXP S32G3 Processors support"
>>>> + depends on ARM_64
>>>> + select HAS_LINFLEX
>>>> + select SCMI_SMC
>>>> + help
>>>> + Enable all the required drivers for NXP S32G3 Processors Family
>>> Minor point.  Help text should be intended by 1 tab and 2 spaces.  The
>>> surrounding examples are wrong.
>>>=20
>>> This can probably be fixed on commit if the series doesn't need a resen=
d.
>> All entries in this file are actually wrong.
>> I did not mention it due to this fact and I thought of pushing one chang=
e to fix them all=20
>> instead once this would have been commited.
>=20
> So, do you want me do address this individually in v4 (which I will send
> anyway for other reasons), or would it be preferable that you make a
> separate patch to fix them all afterwards?

Do not address this one, I will handle it with an independent patch after t=
he release.

Cheers
Bertrand

>=20
>>=20
>> Cheers
>> Bertrand
>>=20
>>> ~Andrew
>=20
> Regards,
> Andrei Cherechesu



