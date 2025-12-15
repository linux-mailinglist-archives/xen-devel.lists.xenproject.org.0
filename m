Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E125CBD7A6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186845.1508267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6aW-0004zY-1L; Mon, 15 Dec 2025 11:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186845.1508267; Mon, 15 Dec 2025 11:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6aV-0004xM-Tj; Mon, 15 Dec 2025 11:17:59 +0000
Received: by outflank-mailman (input) for mailman id 1186845;
 Mon, 15 Dec 2025 11:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbMu=6V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vV6aU-0004xE-0P
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:17:58 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b218bff6-d9a7-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 12:17:52 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:17:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:17:50 +0000
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
X-Inumbo-ID: b218bff6-d9a7-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpPSNcj6KZztH+Jsgqy6fsRckw8biz2GFyPPw7EEQcu4SXZchIa7K/ixJfOk/7eFS4Gl8F0vwfMsqUCwQGqG5BBsE1s998xtcM7Mgv/tdLqHGbvcVH4JE7gjR2/CzdqWbzw7CBDXmJpIBJSI84DvdFVpXziLQrxoIE3q3zi42txnmvmNdnUrf9e978V6LGz0/Kr44b9+Yk02mDdE3VVjBI/TAD5XDD8H450qrPo/0ZO6VRyZR7+XT4JGgiucy3auyDA5lK4aBHMBno0qc2yK3eRTgy3MA5+ohzIqpEl/j6UgrVhczJyKTVYEZaT2OxXDTCKrl1y5qWVFkVSZ4cLhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c7qUlPwz5yf7dO72+gmd4RiEGc368cmvpJzp9y5GXg=;
 b=JnWwcDYGS8Ng2wn+0kVc2FnOyJeVd9ffW+U00fM8DFWbe3QAi7TcERXylhtxOSYzuMilEFpe20XpRYV4b40TpVbGiRPKcUzEkWvd0LAL6NplBMh7irp6fVEMEmxz/V0jIzPK8VxwWbKT2yQVC9SxwehGBzL3TWqIkNAZoKgbtwXS4zqdsEZrLuEPGR6cEleJF6+1YocQoMxoDdJ5HcJvCOPsTvh19LlHH6pqSC0ZHzsO8KRjqMKa729llTeKV6ZHkETE+Lph2DVSaOm7TmtuN419SusWt9fvA92thKD15/ejfU7Ws5PCzaDI12xeQAA9bZNyTPMadkW5G/HS0VgHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c7qUlPwz5yf7dO72+gmd4RiEGc368cmvpJzp9y5GXg=;
 b=wOEatHp6VUWVk0Ls1xEdEYUtfsBEQkNwTokP8lP5L0W3xJLOqlKtHQHWAVMAOKnFDlX2Vvr0Q08AY0ZLzVGgFCFoHGGi/e5+Ds05nbzDHXkQKrcCdwCUFnksGWZS7u+7XUZFJ0hPhcX2++yUM8f8YRoECRItqZsgJdGkSRWRBiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fba355ae-210d-4462-833c-dfaa739234bc@citrix.com>
Date: Mon, 15 Dec 2025 11:17:46 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] bump default SeaBIOS version to 1.17.0
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6706eff3-bdb2-452c-8ed9-131d6bc9b8da@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6706eff3-bdb2-452c-8ed9-131d6bc9b8da@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 746a3a8f-2ed8-471f-ab47-08de3bcb9513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDV0bUZKUkpzazkrS0tGakhmU25YcW9mbU1IMGdBZnZGYVRaMWNBcU93enlS?=
 =?utf-8?B?M0lvZlZjeVpLUnVPWjNGWnl1WVp6bDA4dzdCV0NyYVZsMmU0TWRPSlJLa0lO?=
 =?utf-8?B?QTV0TDU3alNMWGwxanRKSGZzL2dPL0R0bU5DNlQrUmtxaE91V0ppRW9LQXFV?=
 =?utf-8?B?UmRtUGVZa29aSXdkRmpXS1RuUVNENEs3UDlodllxdkI1NTFCQkZxOWhGUXQr?=
 =?utf-8?B?cE1BVzNYK0oyRW1xSkNWMlhCUjRpRmxyTTh1SXZ5QU5VMFQ2UDVRL3RIR3dV?=
 =?utf-8?B?ZHBubUxDSXRmeEZNTXFjc0U4ZWJ0N25pRFVVT250Q0pPdzcvOTR1cDVtcjN1?=
 =?utf-8?B?dlQ2c2docFo1aUJiQjNvbW85MVRxV2VuL0ZzcENjbWkzR3FlNldoV21QSGZn?=
 =?utf-8?B?dUYweHBRaWxkUFVDYmM0ZDU5ZzJBcEozdzNMN3lOWDNTQ1U3bjMzMkxJNFdq?=
 =?utf-8?B?ZmZ1QTRFbzQ4Y1dLWENUM1huMnRkR3NZMTQ3SzBPbkdiaDdHaWszc2xYelRP?=
 =?utf-8?B?ZVhuWDZYYWhvVmQ0Q3JGd25lY0cwTFZacW1hdlRLVnhhd2ZqQ0FBVGV6bTFT?=
 =?utf-8?B?dTRGbjlSdjNPVzdXcFVMa2ZaT0VFVW5VUHNObE9GMDhKQ2lpbS9tamFpdTNZ?=
 =?utf-8?B?RUJYSnIzY25tMkptVmRmeTZGU0xRd3VLUy9wc3pVTWpjSmtGbjRiRkhRdVg1?=
 =?utf-8?B?d3kxK2lrUkQxRmpVWW5weDFnVkdjbHNHbG95L2o3ZEp2eDlLbHJZYTljdXZ4?=
 =?utf-8?B?YWMwNUp1WXhpNnB2Q1BMNGdQK3pVQ3Z4NmUrUXVBOTY2bllKT3VVbmZvemdu?=
 =?utf-8?B?bVBXYmhBcDVnbVlGSkVHT1M4dXh6SzMwQkpvdmlKNU0veWlieWdDbGc5U1Vp?=
 =?utf-8?B?dndSa0Jld29mSFdRYTBsVWJSYkU2dU9JNDVteDYwc2hhNTVVTDVSa3pPd251?=
 =?utf-8?B?bmY1WnRCTTRPcGlkRmhTRGtBVXplZ3R3cDdrM3JrWmxFY2FkaGI0a1FiRFJh?=
 =?utf-8?B?WjBrckIyRS9sRDZiMUNOV090eXNqN01nVmIrTDFWRTdIY3MrYmxoNVFlNk9X?=
 =?utf-8?B?ZGlIRWJMcTNyWlp4b0Y5UzcvekxDRzdNRUpsNHBmU1ovTENNcGMzYjlPYzdN?=
 =?utf-8?B?L1MvWU1MK2xXd1ppTnVqQUZDdDI3MXYxMnFZM3JoVnJNUGdNWjA5emJXL1dV?=
 =?utf-8?B?SXR2Y3h1RGV0Z3NwQjEwZlo5eGZpc0ZBb0VVSTBEbFJOd2RJdG9SemtRTmFL?=
 =?utf-8?B?cHpQNCtYUE1pNzlQNXgrM1hYT0o1RklUY05ETHBOYW9jZ1FKS1hwRy9hd1Zr?=
 =?utf-8?B?U2FxZUJhSUxvbENZb08vM3ZKOWhqdFhyLytJWTFJTmF2TGJrcXBHU3dpQ0c3?=
 =?utf-8?B?MmNiR1NXdGlTRm11aFFhS1d5Zml4ZnhuVENPS3ZydE9UZEFuSDBuV3Y5UlBO?=
 =?utf-8?B?WXJaaVU4NU1BSDBrbmphdW9mM0RPSXNmQVJqNkZOV201RXdQNExTVmhua1Vw?=
 =?utf-8?B?ajc2Tnh2TDlJaWVESnl5dWlkUCt3Mm5BSUlCQkk5RExVTTdnRHpMRWoydVRs?=
 =?utf-8?B?NW1lWjRyOHc5a0ZUaVRUZmtMZWszZGdoQ3RXTXFuWVVLWUE4Tkc4NndwY0Vz?=
 =?utf-8?B?ZEtPTzMwQSsxczdiRkpZS3ZFaFZDZUMvaWdxT2tmWjdFaGlEeXltN2hkNkRt?=
 =?utf-8?B?R1kwbXVVdjlwK1MyU0VpdnVWNVljVldNWkFsSWdWOHpZYzlRUHpCejBwSkNO?=
 =?utf-8?B?OEZOaDVNUXU4NEhGVHhhTmRaR3cyY3I4T1RLL0ZjR2JiYldISnBSR2JJV3h0?=
 =?utf-8?B?VitQUjRDZ2RPcHRzU2dwUXVsZWNVS0d3MGJsdWFEc2Q3b0ljNW11dDI3cHRY?=
 =?utf-8?B?S0pLeGpBeHBvMWF1aVQxeFp4SWIwUTdZbVE3ejYyRlcyWlpYbFNTREJ5c2o3?=
 =?utf-8?Q?PefzahGTE1B1WO1rJrG1u819FRtfNijp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXlQUTBXS2krWGVMTHNGVG9QQXEzdkxLeGV5S09oL2owSThTdGMvenJYUnNy?=
 =?utf-8?B?NDc3TnIyTnc4VklmSDZYMzFtaGsvMHR4a3BpRkxla2FINVd3eEwxWmpWWTNl?=
 =?utf-8?B?bzk3L0ZHWHBhU0NQb09reFpXa1ZsaERDSjNkUlkxTFk4a1QvUVdoR3Nhcld4?=
 =?utf-8?B?d1oyVzVMYnMxMkhwWURvOE5LVG42YzRWbk15dW44ZmlDaUd3NU1JZkh6WEov?=
 =?utf-8?B?b2tKUFNOQnlBS2VuOUM1MzFNaUZSbkNFYVBxc3NyZVpRcTBuMzZFWHk4ZkpQ?=
 =?utf-8?B?cE03OFphMlZaU0pLMjRzRTcrZVpNYWRlVjV0TFZZdSt0clJ2Q2pQK3U1aWZv?=
 =?utf-8?B?eURTcHg2K2RTNFhubnFpc1J4bFd5ZUZQeXVITVMvSW5PTFNGYytEU1ZpOEFD?=
 =?utf-8?B?STRiNk4vTFc3bUVPUG5QQTZFZCtLdnZobDhLNHlRUlhyV3NnUXlyaWRFR3Zy?=
 =?utf-8?B?V2d5WmVSeFEwOTBIRGJHemJqK2lXYUpHRks0aVpzdCtzcWJkcHNuU2syQ3po?=
 =?utf-8?B?dEVJekpDN292R25ON25JQjRYOGlVWEFtTEpWWGt2RXNTK0JpRzBNQjEweFpS?=
 =?utf-8?B?N1Bqd1VlbFpqOU9qU1BFUktzRHlxaUNNN2VnNVpWMlM4TG5lSlh0dzFnRXgv?=
 =?utf-8?B?b01qWXlrNFRQSURyQW42UEdubVg5SHJCa2lZcis4eCs5Y0hISXU2L2dvSko0?=
 =?utf-8?B?a1hDU1hvMlVKMGlUb1RDSkVyd1F1NWJ0U1JQaFp6eGlrY0Y5YUZZNHBoSjJw?=
 =?utf-8?B?NXJZQlI4cEFvZjZBTUR1N1I2KzZ0cTNXL29TdnVrMk5HZkRhNVJPUDZDWVJE?=
 =?utf-8?B?RDV2ZWsvRXF0MThwRHkyeTNZQ0NOU2VYMjkwQ3pLY1UxelQwKy9xTnloSXJH?=
 =?utf-8?B?NEhhRUhVSEdEUE9RKzkzV3BLa1dDakRFc0gwSTRQMnUzMWZnWXpNS0J0SFc4?=
 =?utf-8?B?SXV3bFl5UUxkZ3FiY25CcHFYYlhOa282K3BCcElNQUNCTmpjRjNKbkRvSG5r?=
 =?utf-8?B?ZGFpYnRNM0NqK05mbFRUbHJYL0FVZm1DdGlxakRYTzFCYjBZdURXVzVqMkJE?=
 =?utf-8?B?NmYwRDFGdXBYVTl5YXZBNzJmV0pmZ1Bla1NxSy8zMjFqK01od21oS1RxRCtL?=
 =?utf-8?B?TkFFQzNKaS9UM3VnaVZGOVZaTGpIRzVUdU5zenhURzhKZTBMNFlzcDRUQW5q?=
 =?utf-8?B?VUkvTUhzV3l1TzRVZUV1WE9OQ09MMDExQ0I2ZklVM2FLL3lRNk1Hb1RLRFNa?=
 =?utf-8?B?dzJITUlZMjFkVG8yeVRWcXBqLzJ5UTJ0MXZDYjFodnRHbUlLU2NkOUpobTNC?=
 =?utf-8?B?TW9GdFNqQjFmUDVBTTZDMnIxU2xldEdURGhPd0dveUEwVmRGbUsyV3A1dTl6?=
 =?utf-8?B?anpaVDNVV3NsSmQ1YkdlU1Y0bFFFRTVvQWxkRlBZODBVQkcwTkNGUmJRQ3E2?=
 =?utf-8?B?cDZXb3JUUVlCZHg0RXk0TXFhUmh5RTIwQnVxMTNuVk9JUHZmOGJnSnlIYzNz?=
 =?utf-8?B?Z255UlgyZTV1ZjZlRk1WbDVxK0pFUjl1aU5nQXI4dnkzY1pkSEFpS3BNOExS?=
 =?utf-8?B?cFc1Z1QrbVNPMU91cGgrUzZLcWlBZnNSOWI5LzdtQWh1L3Y1cFlQVVpHWW0z?=
 =?utf-8?B?WmNreEU0aWhwMEpUVmVZV08wcnVndVF1U3hHR2lMTE12ZVRnRmNBZ2JWUVMv?=
 =?utf-8?B?cjZEMHZtN0xTRlBGNTFQd2NxZStxTVVZSW9DNnd3SXpsY0FvZ2VicGovbGxZ?=
 =?utf-8?B?QXliUFk2bWs1RDJ5MzhNWVF4OTY0emZjTlBFdjg0R1k3ZVRaN2JUYkdxK2lv?=
 =?utf-8?B?N3p4TlU2N3I5QUdFNURLaUY3UnNVMVAvSktacVFzMlI3cjMyVzVvRWNrcHE0?=
 =?utf-8?B?NDZMdzFoSXFHRXJMWkkrK3JsWXV2WTdKZ0lnVGRac3VhSldMSDliOWx2STRK?=
 =?utf-8?B?cVJxVHA0c2ZRZW1MNnU0aVFFczVpUnR6Q1FORjNSYkFNQ2lnNW1uZGtUT3hO?=
 =?utf-8?B?OFJaT0FmTGJiTnZJQ2k2aTQrQktoS1FIVzdjWk1sMEZ3WkVZR2pjbXhLdGRn?=
 =?utf-8?B?UHZjNEF6WjNXTHZMV3RnbFQvbFFadGxMcE1jbDZ3MUowejB6VDJXbmhTcEZT?=
 =?utf-8?B?bEZYYlo1UHJhZFF4TTd6UklRQmNWRW9qczJiMUFpb29WZ2FlWDJyc2N4eXFp?=
 =?utf-8?B?clE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746a3a8f-2ed8-471f-ab47-08de3bcb9513
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:17:50.0670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+nD4rwAirDudxfOzoGP36Ve/AwWRmI4Vv0jLDpJwSb+uCklQF2NanRSzqRlC4F3JUFswsnOYdL72l0aIapt+9XRX4359Msy8n91R8fIJBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608

On 15/12/2025 11:14 am, Jan Beulich wrote:
> It has been around for a while.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Be aware that I don't think we've got any Gitlab CI coverage of BIOS HVM
domains right now.

~Andrew

