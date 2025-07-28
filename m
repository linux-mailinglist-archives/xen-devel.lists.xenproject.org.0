Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74121B13B07
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061479.1427077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNbg-0001eR-MA; Mon, 28 Jul 2025 13:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061479.1427077; Mon, 28 Jul 2025 13:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNbg-0001bi-JJ; Mon, 28 Jul 2025 13:09:32 +0000
Received: by outflank-mailman (input) for mailman id 1061479;
 Mon, 28 Jul 2025 13:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9gA=2J=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugNbf-0001Wl-9W
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:09:31 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 184f8415-6bb4-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 15:09:29 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM7PR03MB6197.eurprd03.prod.outlook.com (2603:10a6:20b:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 13:09:27 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 13:09:27 +0000
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
X-Inumbo-ID: 184f8415-6bb4-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myflVmUUPZ4zGNeF8JF4RnqNqvjaq707oZx+42g54FcXLzVRBi3bfYvdiYp9c/ZirW6gwfkASQBso7OCsLiC+eJCZIwC+bCImlL8YzUvMQtT/Dj4vdpJdrcI7fpbudqLCGhd3JwY4+T0knRio8QbAjhseAb/6+7mieZsGh2kmrdR322tGxmslxASwdPlvkLCwiXXF4I4kOLchtjFHMafhvU/rMBhAqJjVmfQPaEqo/qi6LN0rFz3RPJvKlUg14A0l4IF2wgD4Rnn7lrKRm6LqrA9+8YZ38w7Ab/Q3KIQIp/ukzxUE11SjEweIcxdkLpTMQoEfaZnM7qz5BHFmetsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjKe6X+eYPguSrbqeM/C7uwAdBKE62l93TuD7AKcLE0=;
 b=D1dncpoIDsydi1WfzVFAuWnwdG7l0piVFXLNI9qNnR7p1S6ktefq3pP7wi/D17ibn1hWgIYCXVeTja2qsKNisffuJGTpsqpOMaioydqzA1Wh2Pfw9oMLZY3L8G83bvtjcjg01IVlcKYFACeaEY6iuw/tChJST1mWB8Mq/ynF7pq6KY6HOyxzrwhzuXdBGRZToyEp3mt3W9k9Y7Yks+B0PBxkjlsEjEr56pO3mMDZa9jUFHwlCWK1QqIykfSYETEpp2/vfERQGLrydxu4eh5ZedzEKJeLOXZJKie0B/5C+uHcXUsd624a1tLp6bvCIJ2KbKaFM5zcghBVuj8iIzQfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjKe6X+eYPguSrbqeM/C7uwAdBKE62l93TuD7AKcLE0=;
 b=Ry0T8cApzdoOksLGMLSJrqwGK9NSkepzIlC7J+ujZTYsg2HzxcO7KOe+EoNbTvWqrqpX1K/RD7Wb8Y4MRyoDXECKvFzm3TaTb9+tfvctAO4Lq6Thzi+MWvCr6+m+3iN5PZZE1tHKQX7kKBAGMH3Ljh0Hfv6qlqtkYkOIZupkZXVj9b76WxKOd65GvcFNV+yIQ+wjhr+8zCp0nfaeLew25DuJ7B+PtDLbZESQn5E+hFs3/MMU5qPqjnfup1lGyKKcPweRAjjjIzWKAGq+p9ZxxwZcwMsP6xDPH3zEJKwWMch30nAbM6aEJajYJj9dxq+AnCw4i3LV9n6j40NruH7SLA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
Thread-Topic: [PATCH] misra: deviate explicit cast for Rule 11.1
Thread-Index: AQHb/zTS/PoTkNo+DkioPyw1aNE6A7RHTViAgAA17gA=
Date: Mon, 28 Jul 2025 13:09:27 +0000
Message-ID: <c112f144-6f75-4f19-ac14-57d538ccc7ab@epam.com>
References:
 <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
 <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
In-Reply-To: <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM7PR03MB6197:EE_
x-ms-office365-filtering-correlation-id: 7c25b1c6-5578-4b31-1c7c-08ddcdd7fb24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eE1PcXRyL25Memp2dG4wMDh6VFlJMnMzSXNHbGtMUitFZ1dtOTNqQmpTUE1K?=
 =?utf-8?B?RTEzVVVMRnhqamRtNGlwMy8vWXVUb1g5RU1iVHc1d3JTSEpPV3dGZVNxNS9h?=
 =?utf-8?B?RHl5a1F0RzkrTVRic2FQakNkRXhSbDJQeXpqdDJtYTlXRStkUTBnUEx6TWk3?=
 =?utf-8?B?WFE5QUZ1ZG0xOGxGT0hoZmtUZW1Nd0tzWEt2K2krUFhCb05HalZkOG02b0ly?=
 =?utf-8?B?a2ROZUN4RTRjYUltNDRnQWllYXRaYmxWbVVDL3NWZjFiUDR2TUZTRW5GbDVx?=
 =?utf-8?B?S200Y0NYUXBhOXF5MUlPRW8wdjVRbXF0S1Rxc3lQZWlRK3hHQ1BLVHZVVXZE?=
 =?utf-8?B?dW83ZTVydmF0bkcxL0ZtVHN2MGNUakU3SVREN290TXVVN0lCYVVzRmh6cFVG?=
 =?utf-8?B?dVNiTURSU0xHSmFvNWxCcDAyZlBEOGNWRFZCcDhkUEJpZjA5cnNjODJGWEdF?=
 =?utf-8?B?aHRhdnhRb1VIdTI3OG9FdmQxZFlVcndRZitvVjNXTm5UcVZxd1hCbVd3MUpU?=
 =?utf-8?B?Y1g4cTVxVzhoem81SGM0MlNiNHNXWUxpRGIvNENtWnVITHI5UndHVERWRHJq?=
 =?utf-8?B?b3lSRk9xb2V6RWRKa1haZVNqdFVtU3NKSGxPWXY1cmtjNXg3alg2dDdyNzJo?=
 =?utf-8?B?NDh4RlBzYm5WT0F4QmY3S1RyRjJQT1NpN1A3NnVKRTNYRS82OXhqVE9ZRW9h?=
 =?utf-8?B?T3F1VnZrait5dkZxTzJUK0xCaXpncmM4NUpFR3BPMDByUW1BOHJQdGIzV0p6?=
 =?utf-8?B?MjFnUU1Wa1VKYWVkamRVTitXYmJKdm1kRlVseDJKU1VwSjJvRVNHdGRYbjR3?=
 =?utf-8?B?ekhzd3RrVitVMHNlTkcvQjlVeHVzbzdHQ0FhWjJRV0UwRkJ2anlVMURVQmxi?=
 =?utf-8?B?K3N1M2cvSm11VVQyRTE5NnIyUXBpY2pXY0VwZjRqNzlxQkZZYThIRWMrZWhr?=
 =?utf-8?B?TmJBc2V4Wmo0Q0lIRFRieTRGbE5SeGNwTVBYZyt2ZjlsdGhlWmIyNWFRaXJa?=
 =?utf-8?B?Yzd4YzVjU1I1QjJKNElJRXluWW9yLzdkbUlhWlRCNnMwWmFNNlVhRGpSNHNm?=
 =?utf-8?B?VGZTaG5HUlcyZnVIelVFZU5QSEhHcVlPenhFeDNtOEp1ZU9kZ204OTZqNUVm?=
 =?utf-8?B?djdvVTJVdkxQYjRRMFk4R1Z4aHlDejBOTVVDRDVGWnV5clNZejdRNXZTZ1BC?=
 =?utf-8?B?UzdZMFBOUk1MUVhNeHFHbG5tdEtEUUFHd2E4ZExtYkpWMnZyWjRVWDROSDJk?=
 =?utf-8?B?YkhXTThkb1I3b2Q2ai84a2lFdmwwbjhxU0pjaEdXQk9tZ1JHYXR6bFVuQ0pG?=
 =?utf-8?B?MURTSzJUc3M3aDRFL1dqYXFoclY4bDhLOHl6c1IzWHhLY1V4TmhkY1dmeU5J?=
 =?utf-8?B?V0lTSXkrY0JuWWtWVW0rRTRaOHVLamRtNFlhVTdHbTBFOHlDR3N5K1llSGx6?=
 =?utf-8?B?WUpLemVXUFNudTZTUUJteHMyZHU5dWt3QU5NVzhCRGFGZjRpY292amlYTmNU?=
 =?utf-8?B?MVM1TGt5MkVqaHlrV3Bqd1B0Qng5V25sQWsvTHFtVVh3RGl3U0p1QWI1Slh2?=
 =?utf-8?B?NzFIbW9HYmZoR1Qwejh0dDhKSXVKTmY5MFNVcS9uT3RiamZjMG53dEpCaXFq?=
 =?utf-8?B?WitVNWNWclpqbVJlVGlUNVZZa1dTSitqWGVqSkpVVjVWQmt4LytjN055ajIx?=
 =?utf-8?B?d3A4cDQrbTlqeTBtWTVMSzY5K09GZU8xOGR3NEtxa0tHaS9LeiszZUxZTDRT?=
 =?utf-8?B?YWh1aXF1STU0bTRyU01Pa0NMRkdtbUJwc1MrOXhHQk80U0s5OVI3WUtKNUFK?=
 =?utf-8?B?UHFieEU3bHdVYUtzR28wbTVpeVdiZlZYU2V3ZzcxTXFDOG5jWExzcThqK003?=
 =?utf-8?B?RWFTdG9EZkpCTEJoL0dQYmVXcVNZOTQ4TFh4eUZXR1RTVDZvc3MrY2p6bC81?=
 =?utf-8?B?SDJjNm0yZmZIb3NpTmlVaitsK01rZlVlUEIybXhkQkhzc2tFMjRMZmVoMG5w?=
 =?utf-8?B?eTlVeXJQRktRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGxoa3l0eXhadUw3ZW03cTRGVmVUUUNvdVpGb3h5d2RsRlRZSER2TTNCN0p3?=
 =?utf-8?B?cVBlejArNmEvZ0RSMEVlbHJmd0pyTzBZMDhvM08wVmNXczRudFlIMTBqSEZR?=
 =?utf-8?B?eGVNeEVkbUNFNitFcFh0WHluZ1lERG9oUDFuWDNxYVIrbUY3eTA3S3dYcnd6?=
 =?utf-8?B?KzhIekdYTFJVdjNBQjg0dS9vWE5oRHJDNVJOTzBERTdaREMycjlKb1g2SFdC?=
 =?utf-8?B?SGpNSlpzOWtBRXpHWUYwdDlGWWJRUnFRNklMODAyc2cxUXZTTFQxekRjcXhz?=
 =?utf-8?B?Q01UUU9sanp6T1JTMlQ0Z1lPaTd5Z0ZvNzdJbTAwWGNVVGhJZTJld3Y3S1lI?=
 =?utf-8?B?MENZQjNzV0RlK0xTVGVYQjhXNGpTdzdIS1B0MitkalNjOGJnTktBTkFzanlS?=
 =?utf-8?B?dUtWK1NyTW44VDErbE93SWFBSndJMnFRbkFoR3p5c0M1U1VTRW1qZkwrVGtw?=
 =?utf-8?B?VWRPSUs1dU9MS3RpVCtDSVR2Zm8vZUJSMjFTbW5Fb1gzSzM3bFpZMXY2MVBx?=
 =?utf-8?B?UkVwb015SmpKTFZaajVNWkt6UkpOMUc1OFkxSlNQcm5iSy9LeDR0MDhlc0Yr?=
 =?utf-8?B?RlZ0QXY4QkRybmp0UmZxSTVxVkVvTy9HR0xpVVZManZoTGVFVW90cjM1WEtj?=
 =?utf-8?B?RSs1Vi9LLzBsblRWYTFNc1RGcitUbzVQTjNNR2YrSy9oK3RnRFNNNi9MR0xY?=
 =?utf-8?B?dENnVStDTmJybEFBanVyakNaV0JoN3R2SW5jVGlpMHRhbEhZa3dNaEF0SVlD?=
 =?utf-8?B?OHRlRTEzVVdtcEZ5YVhzOGI0TG9nNnl6NnNOc1JvL1o3bHQwVE0zMjZBb295?=
 =?utf-8?B?UGs4VDVUbEQvLzg1RjFZSWczc01Va2VCVkZ5dWJRNTZHNFdMcVR6REFxRGZE?=
 =?utf-8?B?YjF6T3VCWDdyU0EwamFYY0srRHJaY2RDRW14ZFFPWjVVc3Z0S3hWalVIcGxx?=
 =?utf-8?B?czNOQ29mUUxwcHdMOFRYSXd0NUV0cmJpdmJWZ3Vrb1lqRldnM3N5d0Y3bTlR?=
 =?utf-8?B?QTh4S2hUVDlmQjBBSlZWYVNMODBBWUNrUWdzTmRsbkt6dldNWHlRN3pZZTF4?=
 =?utf-8?B?dVBlWXRQK1RydE5yelJYaTNVWHNiUVUzU202aTRuQVUreExaQlNOcW0rU2x5?=
 =?utf-8?B?TDNMRkEvcEhrUHBpclJqSFNvQlhJTW50TXZIWmJDOWNWMDRRVWVRUlpIeElS?=
 =?utf-8?B?bHJzUkhwdG9MaGNha1FPdDNxT3ZyOFVEazJoL1ZzbGl2cFl2eTlrUGR3U25Z?=
 =?utf-8?B?MlNkazZBNzlqcENidE8yV0JqMEt0V0lnbFZvRHI1UmdzUlBNSzBjVmIrWCtX?=
 =?utf-8?B?N0k3YTFQWUtqNE9zZEZXTFNIcU4xb1RxanB1OVFBdkV6Njhva3AwZndudnVk?=
 =?utf-8?B?aVFiY29hQmNuejhCT1JvbmhIQmRWWmZyd3VzU0tXclJJYS9xTFFFTitnUitu?=
 =?utf-8?B?MmNNQ2Rtd2hsNXk1S0FzMzhmL3R6OS9jSTc3V2xkRFYzRHdlTkJzOXRLMm1v?=
 =?utf-8?B?U3BXRUU5VjliVGlSWEtBZmRHZFhxWVMxNmJDZUtxQ29WT0lDTVgxUFFTbDl0?=
 =?utf-8?B?bDhqZHBWZVAwMUIwVVlQY05aQ2txQVpHTlo1bExady91Y0tMMFJKVkpGdy8x?=
 =?utf-8?B?YU54QnJYdUtGeHZaTTFiWTNGU1o4dVF3U2d6aWdBUDk0SS8rMHFFOTJLTnV0?=
 =?utf-8?B?L2pxRXczNjBkY3pFQkU5c09MVXMzem9rSGhNb3l3a3dtNWY3OURDb1p1Q1hj?=
 =?utf-8?B?RktXWG1kUjV5VUdPZDk1WDVCNnlEbStxUVZ5em1RZmxzdWUvNG9uVkNZUk1p?=
 =?utf-8?B?ZXVXN3pHbkhDcFErdUF4bFU0cG1HWWxJbzZzUlVVMlVzSVBnbVpuazBoSWVS?=
 =?utf-8?B?SVhOS0RyazlJaDROMFFEWUcrZXM5b3ZyMi8vcWZhTFBZQ2RXbmh2aEtiUDEx?=
 =?utf-8?B?Vnp3aW5RV3phL0pBTVgydWVCdkdtWmFtSTVNaWFEeitjbTJPcjJHY2djdUFY?=
 =?utf-8?B?U2E1MTBUVitnT0JabzY0M2RpWDlFOFdJSnRBM0VSVzZNSWxtb2hoZktsOFF5?=
 =?utf-8?B?UWM4cDh3OVlFWHEzOVJxUUJadUM3RmxTNXpMYkhFejlXR3JhbjVRNC8rMlE3?=
 =?utf-8?B?ZFBsNGpqSkcvQXFjZmFqeXIxOThPRGhrVHBHVDlUVWZyOTNrUnNOcUcySE1x?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F59711475121474C834ECC83869BB726@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c25b1c6-5578-4b31-1c7c-08ddcdd7fb24
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 13:09:27.1081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5R9jIxyGUm4bqA5qAcyuhQgkChrrQaJ0VTjft0RkxWKQKwqzB+wdRqhyvyJtNBfYlE/7UA8Vx6LrV97nKtkc72wl7GjeBncRmipxnsxWuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6197

DQoNCk9uIDcvMjgvMjUgMTI6NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4wNy4yMDI1
IDIyOjI3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBFeHBsaWNpdGx5IGNhc3QgJ2hh
bHRfdGhpc19jcHUnIHdoZW4gcGFzc2luZyBpdA0KPj4gdG8gJ3NtcF9jYWxsX2Z1bmN0aW9uJyB0
byBtYXRjaCB0aGUgcmVxdWlyZWQNCj4+IGZ1bmN0aW9uIHBvaW50ZXIgdHlwZSAnKHZvaWQgKCop
KHZvaWQgKmluZm8pKScuDQo+Pg0KPj4gRG9jdW1lbnQgYW5kIGp1c3RpZnkgYSBNSVNSQSBDIFIx
MS4xIGRldmlhdGlvbg0KPj4gKGV4cGxpY2l0IGNhc3QpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+IA0KPiBB
bGwgeW91IHRhbGsgYWJvdXQgaXMgdGhlIHJ1bGUgdGhhdCB5b3UgdmlvbGF0ZSBieSBhZGRpbmcg
YSBjYXN0LiBCdXQgd2hhdCBpcw0KPiB0aGUgcHJvYmxlbSB5b3UncmUgYWN0dWFsbHkgdHJ5aW5n
IHRvIHJlc29sdmUgYnkgYWRkaW5nIGEgY2FzdD8NCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
c2h1dGRvd24uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3NodXRkb3duLmMNCj4+IEBAIC0yNSw3
ICsyNSw4IEBAIHZvaWQgbWFjaGluZV9oYWx0KHZvaWQpDQo+PiAgICAgICB3YXRjaGRvZ19kaXNh
YmxlKCk7DQo+PiAgICAgICBjb25zb2xlX3N0YXJ0X3N5bmMoKTsNCj4+ICAgICAgIGxvY2FsX2ly
cV9lbmFibGUoKTsNCj4+IC0gICAgc21wX2NhbGxfZnVuY3Rpb24oaGFsdF90aGlzX2NwdSwgTlVM
TCwgMCk7DQo+PiArICAgIC8qIFNBRi0xNS1zYWZlICovDQo+PiArICAgIHNtcF9jYWxsX2Z1bmN0
aW9uKCh2b2lkICgqKSh2b2lkICopKWhhbHRfdGhpc19jcHUsIE5VTEwsIDApOw0KPiANCj4gTm93
IHRoaXMgaXMgdGhlIGtpbmQgb2YgY2FzdCB0aGF0IGlzIHZlcnkgZGFuZ2Vyb3VzLiBUaGUgZnVu
Y3Rpb24ncyBzaWduYXR1cmUNCj4gY2hhbmdpbmcgd2lsbCBnbyBlbnRpcmVseSB1bm5vdGljZWQg
KGJ5IHRoZSBjb21waWxlcikgd2l0aCBzdWNoIGEgY2FzdCBpbiBwbGFjZS4NCj4gDQo+IElmIE1p
c3JhIC8gRWNsYWlyIGFyZSB1bmhhcHB5IGFib3V0IHN1Y2ggYW4gZXh0cmEgKGJlbmlnbiBoZXJl
KSBhdHRyaWJ1dGUsIEknZA0KPiBiZSBpbnRlcmVzdGVkIHRvIGtub3cgd2hhdCB0aGVpciBzdWdn
ZXN0aW9uIGlzIHRvIGRlYWwgd2l0aCB0aGUgc2l0dWF0aW9uDQo+IHdpdGhvdXQgbWFraW5nIHRo
ZSBjb2RlIHdvcnNlIChhcyBpbjogbW9yZSByaXNreSkuIEkgZmlyc3QgdGhvdWdodCBhYm91dCBo
YXZpbmcNCj4gYSBuZXcgaGVscGVyIGZ1bmN0aW9uIHRoYXQgdGhlbiBzaW1wbHkgY2hhaW5zIHRv
IGhhbHRfdGhpc19jcHUoKSwgeWV0IHRoYXQNCj4gd291bGQgcmVzdWx0IGluIGEgZnVuY3Rpb24g
d2hpY2ggY2FuJ3QgcmV0dXJuLCBidXQgaGFzIG5vIG5vcmV0dXJuIGF0dHJpYnV0ZS4NCj4gDQo+
IEphbg0KDQpZZXMsIE1pc3JhIGRvZXNuJ3QgbGlrZSBjYXN0Lg0KDQpJbml0aWFsbHkgTWlzcmEg
cmVwb3J0ZWQgYWJvdXQgbm9uLWNvbXBsaWFudCBpbXBsaWNpdCBjYXN0IGR1ZSB0byANCidub3Jl
dHVybicgYXR0cmlidXRlOg0Kc21wX2NhbGxfZnVuY3Rpb24oaGFsdF90aGlzX2NwdSwgTlVMTCwg
MCk7DQoNCkkgdGhvdWdodCB0aGF0IGluIHRoaXMgY2FzZSBleHBsaWNpdCBjYXN0IGlzIGJldHRl
ciwgdGVsbGluZyBjb21waWxlciANCmV4YWN0IHR5cGUuDQpCdXQsIE1pc3JhIHJlcG9ydGVkIGFi
b3V0IG5vbi1jb21wbGlhbnQgYy1zdHlsZSAoZXhwbGljaXQpIGNhc3QuDQpTbywgSSBkZWNpZGVk
IHRvIGRldmlhdGUgZXhwbGljaXQgY2FzdC4NCg0KSSB0cmllZCB0byB3cml0ZSB3cmFwcGVyIGZ1
bmN0aW9uIHRvIHJlc29sdmUgdGhpcy4NCkV4YW1wbGU6DQpzdGF0aWMgdm9pZCBoYWx0X3RoaXNf
Y3B1XzIodm9pZCAqYXJnKQ0Kew0KICAgICBoYWx0X3RoaXNfY3B1KGFyZyk7DQp9DQp2b2lkIG1h
Y2hpbmVfaGFsdCh2b2lkKQ0Kew0KICAgICAuLi4NCiAgICAgc21wX2NhbGxfZnVuY3Rpb24oaGFs
dF90aGlzX2NwdV8yLCBOVUxMLCAwKTsNCiAgICAgLi4uDQoNClVuZm9ydHVuYXRlbHkgbmV3IFIy
LjEgdmlvbGF0aW9uIHdhcyBvYnNlcnZlZC4NCiJmdW5jdGlvbiBkZWZpbml0aW9uIGBoYWx0X3Ro
aXNfY3B1XzIodm9pZCopJyAodW5pdCANCmB4ZW4vYXJjaC9hcm0vc2h1dGRvd24uYycgd2l0aCB0
YXJnZXQgYHhlbi9hcmNoL2FybS9zaHV0ZG93bi5vJykgd2lsbCANCm5ldmVyIHJldHVybiINCg0K
TWF5YmUgaXQncyBiZXR0ZXIgdG8gaGF2ZSBzdWNoIHZpb2xhdGlvbi4uLi5pbnN0ZWFkIG9mIFIx
MS4xIA0KIm5vbi1jb21wbGlhbnQgY2FzdCINCg0KDQpJIGNhbiByZW1vdmUgY2FzdCBhbmQgcmUt
d3JpdGUgZGV2aWF0aW9uIGp1c3RpZmljYXRpb24uDQpBcmUgeW91IE9LIHdpdGggdGhhdCwgSmFu
Pw0KDQpEbXl0cm8NCg0KDQo=

