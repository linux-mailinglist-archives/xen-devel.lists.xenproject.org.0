Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C9AC04BB
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 08:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992935.1376402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzcG-0005VZ-0S; Thu, 22 May 2025 06:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992935.1376402; Thu, 22 May 2025 06:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzcF-0005TN-Tu; Thu, 22 May 2025 06:41:19 +0000
Received: by outflank-mailman (input) for mailman id 992935;
 Thu, 22 May 2025 06:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isH4=YG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uHzZ9-0003lz-Gv
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 06:38:07 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f403:260c::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51d1e9af-36d7-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 08:38:07 +0200 (CEST)
Received: from DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) by DB3PR08MB9088.eurprd08.prod.outlook.com
 (2603:10a6:10:436::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 06:38:04 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::c) by DUZPR01CA0007.outlook.office365.com
 (2603:10a6:10:3c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 06:38:16 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 06:38:03 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB3PR08MB10336.eurprd08.prod.outlook.com (2603:10a6:10:43b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 06:37:31 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.8699.022; Thu, 22 May 2025
 06:37:31 +0000
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
X-Inumbo-ID: 51d1e9af-36d7-11f0-a2fb-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QE3e7I4wfOeBIl0VTMaAuwz40hE6DCkntTL56otMOuNEAYXwttjgZ772bxZqF5T9zy2nAWeMbFqHaXeNk9F1gPQJFdl2X2MQP+Gu2vL905SWFcWEQWKtGtlkU2vwI3LJe+/o+oNf5DK8fRat2Xmn5rKQzIiOrIEkC+PyKLV6kMAdP+MPrtRzxSn+vlUfhEQpNXvtbuX5idSvy1htSRNlAI4W+Iauu5azCT/s8rYOY/5cwsTmTYA56I9ldn2FO4bdLETDOksI04QVqMbKy9tkLEJD7bHNf2IiB/3psiBPeknnYLvUzghGTkIc66KvxZ3azJbV65XuGYFtZL2Jx5xrlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuGhrbvwPujqvDryH/rJ1rbDnCyY1eN/Ff6Wa5GnYlM=;
 b=aDQ0/mVu2UNRoebTjKqHifLodj7h4JKntv2ymJGz/Nga2gPe0E2qm9y/BUHXJyiTMK3yl1J50dEaiOxjNisU/e+9MvSecc5rF5xbxZahSL8gf5SokLz1lZPNgczNP6nQtwFl6MUAK7N9gdm1DkMtOvOa6yXszyEq/5k4NilZPNEi/Bhp18EVI98kjrKxlf0Pu+zMT5NzgIHJeJwQcgDLoun+7h1z7ab5GBF0Uq8zkr7y+TS/ntQcsKAwGkRKV+5U1680YIGenoHug0MAkoEcJO2Qkzi3YVA7TfjjHPf7OI0uzeIaLuJ1eAPeFiMRexT+gtLkHk5ddG32Y9w7tATQ5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuGhrbvwPujqvDryH/rJ1rbDnCyY1eN/Ff6Wa5GnYlM=;
 b=p3cI8uAJOc5WKyRGvsdqQNm1ZjJWEPb4RasELtvYt16ggy/kv5GQUESMNBBNCfkWIuA/OxyfC58e6aw91TN8h7bfIwrBdnzrByStMz+fYnRhYqvsXUR4J67yl4RPc1iwnF7zwuiBo1XLBuAMiHDnJ/Mora6ekLsj9ZBEPFIV/UA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWl6JSc6rslhRoiRgz99G0eRW5b5QBZ6MXpSL/QY0ZrtTp9T062SUvfXNJO6btfVT5sVF4xiZHfKPtPLIbvoDdfjIOlgQR4StL8VZeY5yweonq5VM388MYpsjjSEifsUfL492o28xe0IV+fObdI3NEPilj6gB6JN41rh8z2kHV8UHi2gmZq8WY0Gps2BymrxAhUlXqOSVn1W9YQm8wAQGfID1ddcgCKK4LncfackOtns4Sv7F4ABcJTnQtZEufq/1ONtGrKzUYZiGtvHcI5Bj52EzUwSR6QJpPG/ytl06HJ95Z94GYhfFSAOYjdy+j79epF3cAmDrcg/k9sSJJIShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuGhrbvwPujqvDryH/rJ1rbDnCyY1eN/Ff6Wa5GnYlM=;
 b=Auo6kHO2zwTl0qsJqps6AvvqHEGe8oWcoHVWC0YwDe5PxdWJ0w9cSRV25Rh0eGpKuwG66BKmSCSaM2phjI/EqyLNomOIymznPtuc6XI6D6M7q1snB5oyzFan9G3PjF8h7hFz6EUqLRB/YYKJhVXmCBN0O6sNtRfXBjYnjvMuAb1RixfeGh1CKOOM7pcP5Qgi1aDmr0rdSDP+1XiLeCM9C2Sf/Gsw0QxAyeJrPCW4xeRcFDSloRX0pDKk1bKbzbXDAVCBC0t0vzd+ykfWDNmQCK+asczw//eEeKejkLTXTiTuC4AjBW5pmhYaqBqJ3+9Sb1cK2lWrViduci7CXL6cyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuGhrbvwPujqvDryH/rJ1rbDnCyY1eN/Ff6Wa5GnYlM=;
 b=p3cI8uAJOc5WKyRGvsdqQNm1ZjJWEPb4RasELtvYt16ggy/kv5GQUESMNBBNCfkWIuA/OxyfC58e6aw91TN8h7bfIwrBdnzrByStMz+fYnRhYqvsXUR4J67yl4RPc1iwnF7zwuiBo1XLBuAMiHDnJ/Mora6ekLsj9ZBEPFIV/UA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v5 5/6] xen/arm: ffa: Add indirect message between VM
Thread-Topic: [PATCH v5 5/6] xen/arm: ffa: Add indirect message between VM
Thread-Index: AQHbrqLZUo9s1RWIvkuj+N+Xve97jrPdhJCAgADmGoA=
Date: Thu, 22 May 2025 06:37:31 +0000
Message-ID: <1E1317C0-DBF7-4A07-A7BC-BC04B3FF7F03@arm.com>
References: <cover.1744787720.git.bertrand.marquis@arm.com>
 <81ec9ce34c3990b02ec6427d95b6238445333b57.1744787720.git.bertrand.marquis@arm.com>
 <CAHUa44G1qdtC7PY0bpsGXMhCdEn9greidJPgSNy0hymh7ckZ5A@mail.gmail.com>
In-Reply-To:
 <CAHUa44G1qdtC7PY0bpsGXMhCdEn9greidJPgSNy0hymh7ckZ5A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB3PR08MB10336:EE_|DU6PEPF0000B61C:EE_|DB3PR08MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f561047-9c93-4c25-64b1-08dd98fb3466
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Q1ZCM0lialZvOGRYcUpubUlubURnYUFCS3NDSGt1TTltZzhlR0gvT2R2U3M5?=
 =?utf-8?B?cWhzQUpqdGRQQTFwQ0JYbXlISk05akhQWHlId1NLdHk4ZkdRSzVVcVhSWEVC?=
 =?utf-8?B?WDlnMnhGYktlZExqTU80TDFKbDdxT3J2ak9rRTVKSGdSUnloY0d1TjlOOXYx?=
 =?utf-8?B?ZTVTQmxPbVBmSm9heitlZUUrQU5IUlFlMmxhYWdzblZuQzBIZjVpSDI5blBy?=
 =?utf-8?B?TUdWNzUvQ3UzcEgxYStnd1lTMFB0NXQ2Qmoyd0RiTGYvdndlTjZpTXZhaklp?=
 =?utf-8?B?OGFscnNNLzAzZVIyb1M1c3kyVUh6UDVaTkFkM0ZRWFZJWi9mN0lqNzdPOFp0?=
 =?utf-8?B?aWE1clpNN2ExdVZTd2hzT2hwSVIxbUVEOERCUkVxNnd1c05Sdk5PelB4dkdG?=
 =?utf-8?B?b1RseFlCQStJWUF2ZjlQVlM0TE1Hb0JFMnd0bXJKQlRQNWNDZGRPVkRkS0Vl?=
 =?utf-8?B?MGtwRTllYlB0N3hYbjZwNkhnQWNydWIxbVc2RVRwNWlwL1Bwb21IMTZmREJw?=
 =?utf-8?B?Y0pnb2VNcnhBaXNYRGhER3VrQlg4aGtKLy9PM0ZvWDJSU2tOWXRnTmhobVIr?=
 =?utf-8?B?d04xWVd3OHNnOGRkUHhYNlVBb0VJbXNBQXJISTNOS21HdWVCNE02S2xQYnNB?=
 =?utf-8?B?MmNyR0gybDNoS0oyT28rN0JaeXlZWTY0TDN2cDBJNTVMY0ZZMG94Q1FsNngw?=
 =?utf-8?B?WUQvUEQwZVpEMDZDRVZPVEdUWGhGdTZrN2RJUXQ2SlFHcFc5RVN3Nmc3QnZw?=
 =?utf-8?B?NC9WZmo4TDVkOTV0WXRSY1I2UGM1dkhCZTlVQVFyc0lleEN4aWZjS3doeFE2?=
 =?utf-8?B?RTh4OExSM00zT2xhZG8yRS9tSVUrTXpoRG4xaHRZZkdBZFNOSnRNUDhiVkdN?=
 =?utf-8?B?VmdyY1pxV2ZXVHFiOFVVMVJkSXJBNTdrSm5kMGR0KzdRcmgyT0M3c24vejZ0?=
 =?utf-8?B?Y3hyWlBtN2Y4YktUdkRBNGZkdCt1RXN4eW56blhMQXpKMWhwZVVyTE1qbVZm?=
 =?utf-8?B?dXpvYW5wMmMwSHBXc2xDeGI5K0dmcEl0dnYweWtYREYvOHB3SzJ1QTV4MHdT?=
 =?utf-8?B?UVZFRlZSbnJDY1hhMjZHbjEwZ1hIdm0vaUZrKzNMT1EzbUpUb2Q2ZWU5a3hq?=
 =?utf-8?B?NlVXUVlVY0RuN2RTTGE4eGF1VVQyd000ZzRiS3ZQR2hTKzNiV2JTb3F0NEhs?=
 =?utf-8?B?YnVQTVVZV1ozTGdiMk1xYXVWUitld2hDODVOcVY2MmVaWUZDMEthY1VKRVcr?=
 =?utf-8?B?c1BNUXQrL3cwRmUxaW1YeTkwd1hVMm5zVC9OWjV6WjQyQ0lXb21wWjRQREg3?=
 =?utf-8?B?V09qS3ZVN2hjRkN5cVdwYlI4UEpWbVJLcnVDRXFlVCtmcjhXTEVXejVFcVZj?=
 =?utf-8?B?YnJES0Fqc3RieWk3Qy9WNUlqTld1bkw5L1k2b0N1eHp6K3VIbGdyc0xlUjVs?=
 =?utf-8?B?TXVmQW5GcUlLQ1dPSUhrcXdCRFMzQzJWOFRweTFBMUVJMVl0Qlp3MVU1M1FP?=
 =?utf-8?B?Z0lNYlFNcHhqWEo2ZDFGaXowdHVDVFc3RFU4MER0dFRxUDl2VnFHczdWNjJi?=
 =?utf-8?B?V2p1TldRVlFtN1FvZXhZRndMQ1pveTVOMUV3ekRVc09rak8xc2p2dlorYmhL?=
 =?utf-8?B?TFJuNUVoTEtPR1JDeE0wVGdjRFZWZFFEdmtYUnBEVUdkTG96Y2RaSkIxSEtL?=
 =?utf-8?B?M1J5Z2xTUjVVNmxsMUE2MHlxRFQydGQ1TG10c2xuMkc0R1pHVVZhWE8zREow?=
 =?utf-8?B?aWRBOE0ram1kQVZyZFZJeEo3eXhkS3NHN0RGOU54WEJZdWZKTFFVb0JMR0s2?=
 =?utf-8?B?OVNTWTRCbGhrWDdWdTRKekt3cTMxNTlqZ2dCbG9wVjQzUWx2cU1rOVRLRElm?=
 =?utf-8?B?L2xSQm1LUnczMitHWFRmdDdKSnJreU9TWGNIcitGVmE2ZWFvbC8xbnJnVkR1?=
 =?utf-8?B?R215WFgvc2NjcS9WckI5NTFnalRBQzVBc3dhUTdlVVErMHk3SmZTb1pSR0pZ?=
 =?utf-8?B?OGdFSFg1TGh3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A01810072FD4734CB57C9377E1324FFE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB10336
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	689bedc0-ac89-48d8-4235-08dd98fb20fe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|82310400026|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDZZYlFYMklIMFR3M3E0VUxyZjFwWmxVV2NTWXRCb3RqRFMxYU5PbXk0Qi9T?=
 =?utf-8?B?QnE1M1NFcjdWeWpycFNsZ0hoY1hQeDBONU40OTJneXIyelpUM3pGaDNCbzlL?=
 =?utf-8?B?bHdNVlBJZGEwNjVLN2theUJvOWRJUVBKSE1HTkFxVTl2Q3FNejh0eDNIckFw?=
 =?utf-8?B?d21rbVY2eUdOR1lSdnppZTJ6MFdTc3VqY2dEQzRqRURKem4rTVBEOHVMSmFz?=
 =?utf-8?B?eVFpWElaRmlTeDdPajljell5THlJcW02OXpiTFZRTmltcktCajd5eHFvcHhK?=
 =?utf-8?B?c3pkUzNCaW8yQVQ2MXlMSE9oZEV5a3NWOGMxUXhrMjVTdkJQTVN4bjJHVjJ0?=
 =?utf-8?B?M3lpRmZsSU95eW9pZDJMMFErblpxNHk4dEVQRUZvVG00ZHRpbkZZWU51OHBP?=
 =?utf-8?B?ejc4dW9ta3cyUTV2NmxyaGI0VnJaOGsvanJMaTIvd1liWG5FaDZ1MUxTSEhG?=
 =?utf-8?B?OUZyQ0ZtU2JaRmxhZW9LVUFlKzZCd3dGVGcwSzVpSlVMK0FnclB2SWorVjBj?=
 =?utf-8?B?SGxFR1A2bzJuSlRxMk9jcXgyeDNMNTJLYkFlZnZHL0lCOW96aUhPQzJiNkNt?=
 =?utf-8?B?UGlsdVZzVGRucHRqdFVseVRmcEZra1RDaGthL2hvUHV5YVV2a0ZwWFY5emJk?=
 =?utf-8?B?bnBveXZoSlBIamhhcWNoVG4wQXVjR1lad3VuY2JERnNaSlA2YlM4emhRTzZa?=
 =?utf-8?B?Uk1tMk9yM0hhL1NsczBtenZUZ1JsVXNnYUhjNUQrNVFzN2tXTHpTZktLb0Zi?=
 =?utf-8?B?STFSdVczNkZEZ2IxSG1VM1dhOTNLdElOQ09KUkFXTkk4bVNwK2FxelNBdnBV?=
 =?utf-8?B?NDh3U1dISHc3VHZFU1ZQYS9TTzUrYkJsM3Uyc1lWYjRBWkljakMzeWRzZmZw?=
 =?utf-8?B?MU9WK1ZLWEFmeUdtOWpqYjYzNWZrL25OWEdFOHdGOFZ3aWIwNEpYZTVsTlp4?=
 =?utf-8?B?VlpIVTJ2cHlOKzAycldSdy93SGtWRnBtemJKaWZLVlJOVFZpakpyRExvVS9q?=
 =?utf-8?B?VFdyWGxWMy9nRk44SHhscndrcFV1a3JnNkVJSTRqRzhFT0ZUZldlQ3JzYWhp?=
 =?utf-8?B?SzhJbERCL0ZvNDBPdDNnTUdCYTA3RWxFR0xib0wxQWxZc0tqd2kyNWtzUjRu?=
 =?utf-8?B?QXhXcGtFOUhlWUVZVi9EZWpaNzh1ck1Xd1JzQ2pnMzZ1VitSODA0VnJsbllM?=
 =?utf-8?B?bFJJM3QyaVN6aXZPOTBoMEhFZCttVVBTWk1MaHpzSnIxa3JrRDVZTldHQWxJ?=
 =?utf-8?B?VUp3SXNObHRmN1VYNXNaR0tSelpaTE5NTDYrUHltTnowVWxneHBSM2JPMnl0?=
 =?utf-8?B?SFVhbkNjYjFURWFIZ2piTFB2WFJFRkxzeFRVVDhHVDR3dWZaRVNrZjloWW5s?=
 =?utf-8?B?cGwxWC9wMU15a3pXeVM4elQ3eHNvRjhLYmZmbnVjL3JtOUh6TGZHK3VqZXJB?=
 =?utf-8?B?Nm02eFU5T3FGcVBQVGJDdGY2ZldjTDcxUzAxbVNyNUx2SEdhOTJzUHFQcUVH?=
 =?utf-8?B?YU9yb1B3ZEdpd0RsYVBKdUF6eGMvUCtXMzcvamVHZzFCVkZOMWV3VzdOY2lt?=
 =?utf-8?B?c0YxS3lVaVI0TVFLSkpnWXZUZVpZcmJ1cVhnOUk2OTJPNFEvY0YrcVBOOS9P?=
 =?utf-8?B?MW1NQU9ua2NiWDhLblZRb0JsZ0R0UW1YckhuVU43bUozSkVKRUlaZzVTVWx0?=
 =?utf-8?B?UU1oVlVQUzhEdzAzR2hrSWl0ME1CazFkekNweTREQ2ErVTdrYmdTTDN5ZDlh?=
 =?utf-8?B?cHRGY0dOam5RbXF3UTBueUZidjh5YklhUUVxRE92djdsd2JrTGlGUmlLTk1x?=
 =?utf-8?B?eEpYcHNvb3RyWHVsejEzSG8xdGNwTzhvUG5KZksrMUw3eVVoZm82NXdtTlpl?=
 =?utf-8?B?ZDh1bFREc0wxV0lxbkV6WG0rT3phS2taZUNnZllmZS9KMEpCRWRGbzhDQjRS?=
 =?utf-8?B?ZU9hZGNTeENGVGQvVGJ4QTRtNE1JNVFaY1B5K0tkYmpvK2EwNmF1dEcxclhY?=
 =?utf-8?B?KzJRT0xmVFI0anNrMnA4ZG13TXNPdkxCVlNTZTFTNzZHYkNNUWszNUsxdDBz?=
 =?utf-8?Q?NOVERG?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(82310400026)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 06:38:03.8719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f561047-9c93-4c25-64b1-08dd98fb3466
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9088

DQoNCj4gT24gMjEgTWF5IDIwMjUsIGF0IDE4OjUzLCBKZW5zIFdpa2xhbmRlciA8amVucy53aWts
YW5kZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9uIFdl
ZCwgQXByIDE2LCAyMDI1IGF0IDk6NDDigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxiZXJ0cmFu
ZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBBZGQgc3VwcG9ydCBmb3IgaW5kaXJl
Y3QgbWVzc2FnZXMgYmV0d2VlbiBWTXMuDQo+PiBUaGlzIGlzIG9ubHkgZW5hYmxlZCBpZiBDT05G
SUdfRkZBX1ZNX1RPX1ZNIGlzIHNlbGVjdGVkLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0
cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IENoYW5n
ZXMgaW4gdjU6DQo+PiAtIFByZXZlbnQgcG90ZW50aWFsIG92ZXJmbG93IGluIHNlbmQyIGhhbmRs
aW5nIChKdWxpZW4pDQo+PiAtIE9ubHkgdXNlIHBhZ2VfY291bnQgd2l0aCByeCBsb2NrIGFjcXVp
cmVkDQo+PiAtIEZpeCBhbiBpc3N1ZSB3aGVyZSBzZW5kMiBiZXR3ZWVuIFZNcyB3YXMgbm90IGRv
aW5nIHRoZSBjb3B5IGZyb20gdGhlDQo+PiAgdHggYnVmZmVyIGJ1dCBmcm9tIGEgd3JvbmcgbG9j
YXRpb24gaW4gdGhlIHN0YWNrLiBUaGlzIGJ1ZyB3YXMNCj4+ICBpbnRyb2R1Y2VkIGluIHY0IHdo
ZW4gc3dpdGNoaW5nIHRvIGEgbG9jYWwgY29weSBmb3IgdGhlIGhlYWRlci4NCj4+IENoYW5nZXMg
aW4gdjQ6DQo+PiAtIFVzZSBhIGxvY2FsIGNvcHkgb2YgdGhlIG1lc3NhZ2UgaGVhZGVyIHRvIHBy
ZXZlbnQgYSBUT0MvVE9VIHBvc3NpYmxlDQo+PiAgaXNzdWUgd2hlbiB1c2luZyB0aGUgcGF5bG9h
ZCBzaXplDQo+PiBDaGFuZ2VzIGluIHYzOg0KPj4gLSBNb3ZlIHZtIHRvIHZtIGluZGlyZWN0IG1l
c3NhZ2UgaGFuZGxpbmcgaW4gYSBzdWIgZnVuY3Rpb24gdG8gc2ltcGxpZnkNCj4+ICBsb2NrIGhh
bmRsaW5nIGFuZCBtYWtlIGltcGxlbWVudGF0aW9uIGVhc2llciB0byByZWFkDQo+PiBDaGFuZ2Vz
IGluIHYyOg0KPj4gLSBTd2l0Y2ggaWZkZWYgdG8gSVNfRU5BQkxFRA0KPj4gLS0tDQo+PiB4ZW4v
YXJjaC9hcm0vdGVlL2ZmYV9tc2cuYyB8IDExNSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tDQo+PiAxIGZpbGUgY2hhbmdlZCwgMTAxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMg
Yi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYw0KPj4gaW5kZXggZWU1OTRlNzM3ZmM3Li4zNWRl
MjYwYzAxM2EgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYw0KPj4g
KysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMNCj4+IEBAIC04OCw0MyArODgsMTMwIEBA
IG91dDoNCj4+ICAgICAgICAgICAgICAgICAgcmVzcC5hNyAmIG1hc2spOw0KPj4gfQ0KPj4gDQo+
PiArc3RhdGljIGludDMyX3QgZmZhX21zZ19zZW5kMl92bSh1aW50MTZfdCBkc3RfaWQsIGNvbnN0
IHZvaWQgKnNyY19idWYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgZmZhX3BhcnRfbXNnX3J4dHggKnNyY19tc2cpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgZG9t
YWluICpkc3RfZDsNCj4+ICsgICAgc3RydWN0IGZmYV9jdHggKmRzdF9jdHg7DQo+PiArICAgIHN0
cnVjdCBmZmFfcGFydF9tc2dfcnh0eCAqZHN0X21zZzsNCj4+ICsgICAgaW50IGVycjsNCj4+ICsg
ICAgaW50MzJfdCByZXQ7DQo+PiArDQo+PiArICAgIGlmICggZHN0X2lkID09IDAgKQ0KPj4gKyAg
ICAgICAgLyogRkYtQSBJRCAwIGlzIHRoZSBoeXBlcnZpc29yLCB0aGlzIGlzIG5vdCB2YWxpZCAq
Lw0KPj4gKyAgICAgICAgcmV0dXJuIEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4gKw0K
Pj4gKyAgICAvKiBUaGlzIGlzIGFsc28gY2hlY2tpbmcgdGhhdCBkZXN0IGlzIG5vdCBzcmMgKi8N
Cj4+ICsgICAgZXJyID0gcmN1X2xvY2tfbGl2ZV9yZW1vdGVfZG9tYWluX2J5X2lkKGRzdF9pZCAt
IDEsICZkc3RfZCk7DQo+PiArICAgIGlmICggZXJyICkNCj4+ICsgICAgICAgIHJldHVybiBGRkFf
UkVUX0lOVkFMSURfUEFSQU1FVEVSUzsNCj4+ICsNCj4+ICsgICAgaWYgKCBkc3RfZC0+YXJjaC50
ZWUgPT0gTlVMTCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJ
RF9QQVJBTUVURVJTOw0KPj4gKyAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gKyAgICB9DQo+
PiArDQo+PiArICAgIGRzdF9jdHggPSBkc3RfZC0+YXJjaC50ZWU7DQo+PiArICAgIGlmICggIWRz
dF9jdHgtPmd1ZXN0X3ZlcnMgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICByZXQgPSBGRkFfUkVU
X0lOVkFMSURfUEFSQU1FVEVSUzsNCj4+ICsgICAgICAgIGdvdG8gb3V0X3VubG9jazsNCj4+ICsg
ICAgfQ0KPj4gKw0KPj4gKyAgICAvKiBUaGlzIGFsc28gY2hlY2tzIHRoYXQgZGVzdGluYXRpb24g
aGFzIHNldCBhIFJ4IGJ1ZmZlciAqLw0KPj4gKyAgICByZXQgPSBmZmFfcnhfYWNxdWlyZShkc3Rf
ZCk7DQo+PiArICAgIGlmICggcmV0ICkNCj4+ICsgICAgICAgIGdvdG8gb3V0X3VubG9jazsNCj4+
ICsNCj4+ICsgICAgLyogd2UgbmVlZCB0byBoYXZlIGVub3VnaCBzcGFjZSBpbiB0aGUgZGVzdGlu
YXRpb24gYnVmZmVyICovDQo+PiArICAgIGlmICggKGRzdF9jdHgtPnBhZ2VfY291bnQgKiBGRkFf
UEFHRV9TSVpFIC0NCj4+ICsgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBmZmFfcGFydF9tc2dfcnh0
eCkpIDwgc3JjX21zZy0+bXNnX3NpemUgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICByZXQgPSBG
RkFfUkVUX05PX01FTU9SWTsNCj4+ICsgICAgICAgIGZmYV9yeF9yZWxlYXNlKGRzdF9kKTsNCj4+
ICsgICAgICAgIGdvdG8gb3V0X3VubG9jazsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBkc3Rf
bXNnID0gZHN0X2N0eC0+cng7DQo+PiArDQo+PiArICAgIC8qIHByZXBhcmUgZGVzdGluYXRpb24g
aGVhZGVyICovDQo+PiArICAgIGRzdF9tc2ctPmZsYWdzID0gMDsNCj4+ICsgICAgZHN0X21zZy0+
cmVzZXJ2ZWQgPSAwOw0KPj4gKyAgICBkc3RfbXNnLT5tc2dfb2Zmc2V0ID0gc2l6ZW9mKHN0cnVj
dCBmZmFfcGFydF9tc2dfcnh0eCk7DQo+PiArICAgIGRzdF9tc2ctPnNlbmRfcmVjdl9pZCA9IHNy
Y19tc2ctPnNlbmRfcmVjdl9pZDsNCj4+ICsgICAgZHN0X21zZy0+bXNnX3NpemUgPSBzcmNfbXNn
LT5tc2dfc2l6ZTsNCj4+ICsNCj4+ICsgICAgbWVtY3B5KGRzdF9jdHgtPnJ4ICsgc2l6ZW9mKHN0
cnVjdCBmZmFfcGFydF9tc2dfcnh0eCksDQo+PiArICAgICAgICAgICBzcmNfYnVmICsgc3JjX21z
Zy0+bXNnX29mZnNldCwgc3JjX21zZy0+bXNnX3NpemUpOw0KPj4gKw0KPj4gKyAgICAvKiByZWNl
aXZlciByeCBidWZmZXIgd2lsbCBiZSByZWxlYXNlZCBieSB0aGUgcmVjZWl2ZXIqLw0KPj4gKw0K
Pj4gK291dF91bmxvY2s6DQo+PiArICAgIHJjdV91bmxvY2tfZG9tYWluKGRzdF9kKTsNCj4+ICsg
ICAgaWYgKCAhcmV0ICkNCj4+ICsgICAgICAgIGZmYV9yYWlzZV9yeF9idWZmZXJfZnVsbChkc3Rf
ZCk7DQo+PiArDQo+PiArICAgIHJldHVybiByZXQ7DQo+PiArfQ0KPj4gKw0KPj4gaW50MzJfdCBm
ZmFfaGFuZGxlX21zZ19zZW5kMihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+IHsNCj4+
ICAgICBzdHJ1Y3QgZG9tYWluICpzcmNfZCA9IGN1cnJlbnQtPmRvbWFpbjsNCj4+ICAgICBzdHJ1
Y3QgZmZhX2N0eCAqc3JjX2N0eCA9IHNyY19kLT5hcmNoLnRlZTsNCj4+IC0gICAgY29uc3Qgc3Ry
dWN0IGZmYV9wYXJ0X21zZ19yeHR4ICpzcmNfbXNnOw0KPj4gKyAgICBzdHJ1Y3QgZmZhX3BhcnRf
bXNnX3J4dHggc3JjX21zZzsNCj4+ICAgICB1aW50MTZfdCBkc3RfaWQsIHNyY19pZDsNCj4+ICAg
ICBpbnQzMl90IHJldDsNCj4+IA0KPj4gLSAgICBpZiAoICFmZmFfZndfc3VwcG9ydHNfZmlkKEZG
QV9NU0dfU0VORDIpICkNCj4+IC0gICAgICAgIHJldHVybiBGRkFfUkVUX05PVF9TVVBQT1JURUQ7
DQo+PiArICAgIEJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4KSA+
PSBGRkFfUEFHRV9TSVpFKTsNCj4+IA0KPj4gICAgIGlmICggIXNwaW5fdHJ5bG9jaygmc3JjX2N0
eC0+dHhfbG9jaykgKQ0KPj4gICAgICAgICByZXR1cm4gRkZBX1JFVF9CVVNZOw0KPj4gDQo+PiAt
ICAgIHNyY19tc2cgPSBzcmNfY3R4LT50eDsNCj4+IC0gICAgc3JjX2lkID0gc3JjX21zZy0+c2Vu
ZF9yZWN2X2lkID4+IDE2Ow0KPj4gLSAgICBkc3RfaWQgPSBzcmNfbXNnLT5zZW5kX3JlY3ZfaWQg
JiBHRU5NQVNLKDE1LDApOw0KPj4gKyAgICAvKiBjcmVhdGUgYSBjb3B5IG9mIHRoZSBtZXNzYWdl
IGhlYWRlciAqLw0KPj4gKyAgICBtZW1jcHkoJnNyY19tc2csIHNyY19jdHgtPnR4LCBzaXplb2Yo
c3JjX21zZykpOw0KPj4gDQo+PiAtICAgIGlmICggc3JjX2lkICE9IGZmYV9nZXRfdm1faWQoc3Jj
X2QpIHx8ICFGRkFfSURfSVNfU0VDVVJFKGRzdF9pZCkgKQ0KPj4gKyAgICBzcmNfaWQgPSBzcmNf
bXNnLnNlbmRfcmVjdl9pZCA+PiAxNjsNCj4+ICsgICAgZHN0X2lkID0gc3JjX21zZy5zZW5kX3Jl
Y3ZfaWQgJiBHRU5NQVNLKDE1LDApOw0KPj4gKw0KPj4gKyAgICBpZiAoIHNyY19pZCAhPSBmZmFf
Z2V0X3ZtX2lkKHNyY19kKSApDQo+PiAgICAgew0KPj4gICAgICAgICByZXQgPSBGRkFfUkVUX0lO
VkFMSURfUEFSQU1FVEVSUzsNCj4+IC0gICAgICAgIGdvdG8gb3V0X3VubG9ja190eDsNCj4+ICsg
ICAgICAgIGdvdG8gb3V0Ow0KPj4gICAgIH0NCj4+IA0KPj4gICAgIC8qIGNoZWNrIHNvdXJjZSBt
ZXNzYWdlIGZpdHMgaW4gYnVmZmVyICovDQo+PiAtICAgIGlmICggc3JjX2N0eC0+cGFnZV9jb3Vu
dCAqIEZGQV9QQUdFX1NJWkUgPA0KPj4gLSAgICAgICAgIHNyY19tc2ctPm1zZ19vZmZzZXQgKyBz
cmNfbXNnLT5tc2dfc2l6ZSB8fA0KPj4gLSAgICAgICAgIHNyY19tc2ctPm1zZ19vZmZzZXQgPCBz
aXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4KSApDQo+PiArICAgIGlmICggc3JjX21zZy5t
c2dfb2Zmc2V0IDwgc2l6ZW9mKHN0cnVjdCBmZmFfcGFydF9tc2dfcnh0eCkgfHwNCj4+ICsgICAg
ICAgICAgICBzcmNfbXNnLm1zZ19zaXplID09IDAgfHwNCj4+ICsgICAgICAgICAgICBzcmNfbXNn
Lm1zZ19vZmZzZXQgPiBzcmNfY3R4LT5wYWdlX2NvdW50ICogRkZBX1BBR0VfU0laRSB8fA0KPj4g
KyAgICAgICAgICAgIHNyY19tc2cubXNnX3NpemUgPiAoc3JjX2N0eC0+cGFnZV9jb3VudCAqIEZG
QV9QQUdFX1NJWkUgLQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3JjX21z
Zy5tc2dfb2Zmc2V0KSApDQo+PiAgICAgew0KPj4gICAgICAgICByZXQgPSBGRkFfUkVUX0lOVkFM
SURfUEFSQU1FVEVSUzsNCj4+IC0gICAgICAgIGdvdG8gb3V0X3VubG9ja190eDsNCj4+ICsgICAg
ICAgIGdvdG8gb3V0Ow0KPj4gICAgIH0NCj4+IA0KPj4gLSAgICByZXQgPSBmZmFfc2ltcGxlX2Nh
bGwoRkZBX01TR19TRU5EMiwNCj4+ICsgICAgaWYgKCBGRkFfSURfSVNfU0VDVVJFKGRzdF9pZCkg
KQ0KPj4gKyAgICB7DQo+PiArICAgICAgICAvKiBNZXNzYWdlIGZvciBhIHNlY3VyZSBwYXJ0aXRp
b24gKi8NCj4+ICsgICAgICAgIGlmICggIWZmYV9md19zdXBwb3J0c19maWQoRkZBX01TR19TRU5E
MikgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHJldCA9IEZGQV9SRVRfTk9UX1NV
UFBPUlRFRDsNCj4+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4+ICsgICAgICAgIH0NCj4+ICsN
Cj4+ICsgICAgICAgIHJldCA9IGZmYV9zaW1wbGVfY2FsbChGRkFfTVNHX1NFTkQyLA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAoKHVpbnQzMl90KWZmYV9nZXRfdm1faWQoc3JjX2QpKSA8
PCAxNiwgMCwgMCwgMCk7DQo+IA0KPiBQbGVhc2UgYWxpZ24gd2l0aCB0aGUgb3BlbmluZyAnKCcg
YXQgdGhlIHJvdyBhYm92ZS4NCg0KV2lsbCBkby4NCg0KPiANCj4gT3RoZXIgdGhhbiB0aGF0Og0K
PiBSZXZpZXdlZC1ieTogSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+
DQo+IA0KDQpUaGFua3MNCkJlcnRyYW5kDQoNCj4gQ2hlZXJzLA0KPiBKZW5zDQo+IA0KPj4gKyAg
ICB9DQo+PiArICAgIGVsc2UgaWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkN
Cj4+ICsgICAgew0KPj4gKyAgICAgICAgLyogTWVzc2FnZSBmb3IgYSBWTSAqLw0KPj4gKyAgICAg
ICAgcmV0ID0gZmZhX21zZ19zZW5kMl92bShkc3RfaWQsIHNyY19jdHgtPnR4LCAmc3JjX21zZyk7
DQo+PiArICAgIH0NCj4+ICsgICAgZWxzZQ0KPj4gKyAgICAgICAgcmV0ID0gRkZBX1JFVF9JTlZB
TElEX1BBUkFNRVRFUlM7DQo+PiANCj4+IC1vdXRfdW5sb2NrX3R4Og0KPj4gK291dDoNCj4+ICAg
ICBzcGluX3VubG9jaygmc3JjX2N0eC0+dHhfbG9jayk7DQo+PiAgICAgcmV0dXJuIHJldDsNCj4+
IH0NCj4+IC0tDQo+PiAyLjQ3LjENCj4+IA0KDQo=

