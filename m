Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0497C6A501
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165031.1491858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNf5-00034q-Be; Tue, 18 Nov 2025 15:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165031.1491858; Tue, 18 Nov 2025 15:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNf5-000327-8P; Tue, 18 Nov 2025 15:30:31 +0000
Received: by outflank-mailman (input) for mailman id 1165031;
 Tue, 18 Nov 2025 15:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLNf4-000321-FB
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:30:30 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 806f6acf-c493-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 16:30:25 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7868.namprd03.prod.outlook.com (2603:10b6:303:276::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 15:30:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 15:30:21 +0000
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
X-Inumbo-ID: 806f6acf-c493-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIjaYblgcfguBQWB+9LFHGOcI+4eu59u9UXIuybwWm8Gv5c4rJ7PNqpxrM9EHLmwGqJouS/F9tu0Z778johYLGY1WFaarAV+ehKACM+v6CndgGFoBLTL+ahEPq2zsigW1u4ZIbrWTYH15ei5grVE14nfvO9qsHlqKnT10gGn0XVuImGCZTU9oj/VRv85YS/T/V4yO9jfT/Mt/gfiAl8e8VyFas0xBoFekhUdYmiTG82AVHlQTXYSFChVRCnL03hvrI+umdwfUrT/wl4k/9XipGIj6LUhgxUaqhuYKr4qvH0WGnUgGyBGnGaV23G2QZ3C7Jzlh1ctSv35C2fIPW9hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmn8UUt4vfhhKg5rTv2J3CvJWselWfmjzEw1oeY1aUA=;
 b=Wr989+wVSBVI34NNB7Vc57ErIrhMAFAAjRc5GRqreZP/MCr9B6BplleGw43YRZdEsuGzcC1QlYsHQ91P5Jk6TWL6OkLoWCTupPRwa1B6RuJBKLs2EG4jGkBnui1TZIzLxH2vDcuQqegEIjUBVaJ+9k7qUfl7uJzOI9ycGWjE+HQ35uudATk/JCR6hnyHEfmNbFnQjdKcgGxsEO065bLVkKmk88NTWNbgS1TnEnaqxkLfpqsYxKO9tM7nU/B53BsRSnTKQRSRBTELsIcR4zocD4n08cQmuBQUk0jUZDfzh1n/KTmUFxK5+ubyaik6Rtn3bYJJ82UJk4UiNSpSZPGgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmn8UUt4vfhhKg5rTv2J3CvJWselWfmjzEw1oeY1aUA=;
 b=hW8liaMJ+A5DneTu7lOb34nOMEg2Wh+ZV4Fa6V5ulEP23DdDdpL3RvC4djkKeQh7L0TwCYG833OgKIo5wgKyb2KKR6/jNwGi4/LUSylHg12jsvni6shupSidxnmURk0Tq/P1NR2TBlZYxJmBSWx4y/fz8haG+vjgwlpAaBko1Jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ab1dc276-2753-4a9b-932b-6cce3ee2b58a@citrix.com>
Date: Tue, 18 Nov 2025 15:30:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] x86/cpu-policy: define bits of leaf 6
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <b59c0994-6bb2-4506-88ec-4ea0f3b6c311@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b59c0994-6bb2-4506-88ec-4ea0f3b6c311@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e0cd7a-d358-4bb1-51e2-08de26b762eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFJ0V2NhRko2WUx5QUFqWklZSnpBTm1iZ0szZmtyS1NkMnNRODFPSUZQaitB?=
 =?utf-8?B?WTZ6TG5uR1FiY3JoYWQ5Q0ppcUV6ODFGSEd3dEltbUhadGF6RnhsdEd5YkF2?=
 =?utf-8?B?Q1huUVZ1QnhXMVp1L0dLbGhCeG9XaCtoN2RmdUhBckY2OEFYSVhXcDQvbzFy?=
 =?utf-8?B?MWZlVi8vZUh6RXNNc3VoWGJjbGN5K1BhT1ZyVEM3SmVvYmNSRjNzbkxDQ1hG?=
 =?utf-8?B?OUZoTEhXSmdrNE9UV3ZscEZMeHVVT253dFVwN200dERtS2g5Nm5ZSk1nVmwx?=
 =?utf-8?B?RWdKdU1zbTAzYk5HWjA0Y010YU5HbUl5elR4UHZWejIyZnpDR3lMakFhWjZH?=
 =?utf-8?B?QmU0U1ZOVWRJTTdDS3BjQ09MSnAzcHhoVWg2cy8vMTdYVmsxcFJzS2ZUVTVM?=
 =?utf-8?B?bTB3SWl2RTJicUtBMzV5ay9uVzBMM0lPaFVoRysrZE5SdkFIWnpDc0s4dWUw?=
 =?utf-8?B?ZkJ0VVpiYVBYUGx5bmpPRklCWjVjUkdObmJMZFZmMUZaUEtWUDBUVnpZWmV4?=
 =?utf-8?B?SlRQRWN4TnBuNHhBOC9KYjFGalRPam56cFNTTXFqaTFMbG5ObmZtNTVYQTh4?=
 =?utf-8?B?R0xhblB4ZnNjSXBrd2x2RmpUUmRDMjc0SWpaVjdnekRKd0Z4Q0dLWktvNVRD?=
 =?utf-8?B?UlBQS3RvUWQrVU9jVkk0WGE5YnpsU3RNcjUxNlc3M0g5cmtXdEJlQkJZM0sw?=
 =?utf-8?B?Y3hXRS9jNEFITjJrOFp0VEhQYllaaHgwN2dUWm9mVXRKTTRCcmhOWmY3WkhO?=
 =?utf-8?B?bUVBbGJYN2VjS1l2VXRPdEIvYlg1S2s1emg1ODVMQU5BK3BhRlQxeFlidldl?=
 =?utf-8?B?a1Jybk1UbzZnZWhsTXRhWVdhK1NvcTBHTmMzWGZ2QUlLVFhpN1psaGxUeUcz?=
 =?utf-8?B?bXpuNXEvalRsbG9zdWFObjJja3RqVWZjN09sbWY5V2ZUY21hZE9EdVpaMjhC?=
 =?utf-8?B?NGQrWTdDY0ZONXVYU1JGYkxxUWplaFdWMXBONnpWbmFMUDhya01BbmJLWTJj?=
 =?utf-8?B?SEE4bnZzNHhaVVZHM3FaejBhZXZRdWxvYnRNQ2x3cXBjU1UxamorNGxCdVpK?=
 =?utf-8?B?MC9OK2dnejFFeWdzUkZNMFpuZ3ZoUFcvSlVsdlNjMmhtd3o2cUgrbTRWNElK?=
 =?utf-8?B?aWlEQTVOQmxxMTgzMC80TVd1alZrVm05bUUwVENScG5MbFlORTU4a1Zlc0Nr?=
 =?utf-8?B?NGlwS1JoTHRTTllQcU40VzkyMFVmZ29qT29VMStTakMzeVIrNHV0WFlLeUZN?=
 =?utf-8?B?d0VUT3dpaDBRVUhlNEdjWTBwQnllMW1oeVFrQ2FXVlI1c1A0c0JEV2hkeVUz?=
 =?utf-8?B?a240VUU2M09GbHg4N25FUmxkM0EzQUx1VHhnMWFDaUtsUUxxSk54aDVWNk00?=
 =?utf-8?B?VXZXRFJYWWNTV0hZaVQwYkRKZi9pQTM3WWpjSVJ4SXhadGtQY09hL1lZd0VN?=
 =?utf-8?B?NGZPU1hTYVFlMnMrcy95VURLWnRCRjJZZ1llcjFnYUtvbXo1cjU3ZVBHU3c0?=
 =?utf-8?B?aGtWUEREWUtBYlAydFRVbGRuaENsb3lTNWRWQUtuMWFpVWYvZGR0ZlFUTVcv?=
 =?utf-8?B?N3hUc0FsUkprZW1EK2p0TGZlaFZxNVlMYUh0V0UzRHBQbHM2UXl3QTl0ZENH?=
 =?utf-8?B?QWFHdWk0SEl0blFDUklteENGcm9zWWYyZmVvaUpBQ0JuTmw1Ry9GMVFiSzhv?=
 =?utf-8?B?YWJCVW1uTnNNTGcyOUpEYUNTZEFGRVZ1V2pFUVFQN2FpVlFXdkpXOVoyZGYw?=
 =?utf-8?B?aGFZV1JSYTFNMStRVjlqam9TTW5EV1JGdnArdzVlUU5VL0NaSVpReHhSTXFp?=
 =?utf-8?B?dTR1a3lqRXBPTThhdDF3UGFrQzRnbmFLVEdlQmJ0dU84RVJmbWwydmV4K09O?=
 =?utf-8?B?M3VzWHRPWVFodUsrTUhsT09JM2c1NHVFUnpMUFNTcFJnbmJIS0JxcmFPNm9u?=
 =?utf-8?Q?qoyCnl5+mM++aZM4oW+ohy+yWi9WNJgR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SldaMzRtcHROcjFKaVpkM1k3alkxb2poWi8xSERINEc5VXlXVmhMeTNFWC8w?=
 =?utf-8?B?d2x1WU9YVE13cjdzSEZObU9IRWMvNlNGOUVrb2JFd2FhanFwMFIyRzcxRmhU?=
 =?utf-8?B?TkhKK0kwQ0VrL3dwNnR0RGloNnF2cGdJb2t6ZS9zYUVQS3ZxNHRUZFdmOWNt?=
 =?utf-8?B?cmUvUllFMEpNSmhYQnV4QU9zWlA4bS9XS1l5ajFsYjg4Z09iMGdvUTRHL1ov?=
 =?utf-8?B?OVV4eUlRMDNQVzlrRkRWbGJNM0ZZaEdSdFNVZ2Rxc0dpY1Z1NmEvMDVoUk1a?=
 =?utf-8?B?R1pndjMyU0wwK2ZESy9MaEpqeUQ3Nnl3am9EWU03NVN3NnRXb2RPMGxPZDUz?=
 =?utf-8?B?NXE5NzlXT3p2Q29TcFZoNU5PL2liR3JLNERmQSs5K3NYMURnOEM4cDNYRWlQ?=
 =?utf-8?B?eC9oUFlmNEpPRlBqSHd2YkZkZDJGelg1cmxSSmlzaXBvY0xMNFoydFVkbzBX?=
 =?utf-8?B?Z3JGc0I3OXNtcndDaURudTVPWTV5VDNoUFRHRVZRdjdZcFBHUkVHbXlhYW9s?=
 =?utf-8?B?N2d2aWpiRjFvSVpmRFR0d3lVazRmWnY3cHFZV0ZmOVJqbHBwMHhMckxjV0Rp?=
 =?utf-8?B?Nm12YzdnVjZzMmhvY09KMXlaUXF0b3JoeGU1S29pS0EwaE1VQnFnRW9kRWlo?=
 =?utf-8?B?WENSV0ZCWTdzTms1ZThTU09YYkJUWVkyM2VIQ2wwdHNYYW1LcllJZ0kxV2JV?=
 =?utf-8?B?Mjk1TlByQ28za3d5UzJZUVJNS1VMKzVVU3NSRW0yL1kxWEgrOUp3QWNYWDFS?=
 =?utf-8?B?bkFaQlFrRW1kVGxRekg1TXBaWWJ2UmxTRkF4TTBTV25pSExnOGNQM2pUOTFN?=
 =?utf-8?B?c21RcXBucTlVUloxakU1TXc1NzlQeGVqdklvdW8xNFl1K0thOUF3SHhxOE0w?=
 =?utf-8?B?ZzFLRHNidzlQWmI0dkd3dVhUY2FpY0pSM2l2R0dQZzYvbUNhYkVzTi8zWDlY?=
 =?utf-8?B?aFhTZzdCZlZLZUNnZXZ6eUxoM1V1NkpyT2NGa3BYL1I2UHduUlBoSm81amh4?=
 =?utf-8?B?UkM0M2ZnN1hWQlJxY29VbWJjbnpNaDFwdC9ncWg5SGlEVXUySkJ4bjRKME4v?=
 =?utf-8?B?anRQWnJUdUd5R3MyNDJhMU04b3NlUlA0aUJXV1oza1FRSldRMDg2SkdNN3RB?=
 =?utf-8?B?c2tOTENrdlptYVpzM0RIbnljOHBEY2ptR2tYUis3dHFSTXdvcWVQUU1XOGFE?=
 =?utf-8?B?OHpYWUpxTDZvMnNNOHBZTndKN1d3c2x3ODYzU3FFNzZjSy9vb2VNVGRYbkJX?=
 =?utf-8?B?K3I3VzRoY1lQNTYwYnp5WE1BaHlTNmNud0xOeisva0s1YktlZFFQSk1nNkpB?=
 =?utf-8?B?bVBNMXBCRWVtUHUwN1VMZkZwaTNDVkFsTHEwd1RBYU5YQk0xL2lUT0QrZnJW?=
 =?utf-8?B?UWJLRUk3WUNhZE1QTW95ZTJnMzMxdTNxT1FpcmJML2I5QTdyRUg0bTQ5RXp4?=
 =?utf-8?B?aWtiWjYvT281UVFCMXJ2dkFSTHhHaDFkQ28wR1d6NitjQU92aTJxSFdISnVp?=
 =?utf-8?B?S0IwR24vSHRtOGZ2QldxSURjaDl2Tk94NWNZeG5FMzl5bVl6UFNZSE5nYVo1?=
 =?utf-8?B?UmFkQ1NLaWNPMS9NeHJXVFpEWVNNV2Rhb0gxNE5rQWUwajd6UU1Lc0I3OFZw?=
 =?utf-8?B?dXhucllaTzU3MVI5YXpqREdpSU92QVFpbU9mbytJZG1BMkp2SWZsODVhMlpy?=
 =?utf-8?B?U2dwdithUUtkTmxCeDJQY1h1QVJhejB3M1ZLVFhXaGViOUFKQlRxS1Bsdk5X?=
 =?utf-8?B?VVRDQVVVWkJOME1DMVgxZ1UwODBPcFRWdW80WEhSalRGWE8rc0NWelVmaHlN?=
 =?utf-8?B?K1FxUDQwd1pHV0szdFVBaGo4WEN4L3FoTFBLQTczMlN3VFU3TTJhanJhT0tW?=
 =?utf-8?B?VmZCc2wyaEVIVU4vTGdsYXpYNndySitjNTExeHBvMzMreGVTWkVZUVdlYzNP?=
 =?utf-8?B?Ti83Vi81dDVNTjNUWjBqTDhSOG5mQVprNWl6c3hEV04yL1ByOGhwNDJucnlp?=
 =?utf-8?B?L3dveHhiQ0RlN0E5TGNKN1dQaklxTjlOdWpnWEFIbHlrbUhNa3Y2eS84S05u?=
 =?utf-8?B?UXpVWTVja0h1ZkdtVVZXa21sQW5wMVJaRWk5ZXJLT2J6azd3M2ZDa0NIYzQ4?=
 =?utf-8?B?a3VNbDJJQWVrNjVRUlBlVnh4dDd4UW95YUw2MzZLbkZ5M3FVRUsxLy9SVVI1?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e0cd7a-d358-4bb1-51e2-08de26b762eb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:30:21.5220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+awdpVVUlSjZY8mfhvInQdJNSBcQ+i5fmJ1baVEgMnlFoEIsn1FjF1ef2XxF6OvE3wBxovOWz1a6odpY0+2HVKG6+tqNVHmgS9377bekdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7868

On 18/11/2025 3:06 pm, Jan Beulich wrote:
> ... as far as we presently use them in the codebase.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Or should we make both parts proper featureset elements? At least
> APERFMPERF could likely be made visible to guests (in principle).

As before, A/MPERF can't be used safely by a VM.

In order to be persuaded to offer this to VMs, someone is going to have
to present a mechanism for how a VM could even figure out that it read
junk from the regsiters...

>
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -121,7 +121,31 @@ struct cpu_policy
>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
> +
> +            /* Leaf 0x6 - Therm/Perf. */
> +            struct {
> +                uint32_t /* a */:1,
> +                    turbo:1,
> +                    arat:1,
> +                    :4,
> +                    hwp:1,
> +                    hwp_notification:1,
> +                    hwp_activity_window:1,
> +                    hwp_epp:1,
> +                    hwp_plr:1,
> +                    :1,
> +                    hdc:1,
> +                    :2,
> +                    hwp_peci:1,
> +                    :2,
> +                    hw_feedback:1,
> +                    :12;
> +                uint32_t /* b */:32;
> +                uint32_t /* c */ aperfmperf:1,
> +                    :31;
> +                uint32_t /* d */:32;

Elsewhere, single bit fields are bool foo:1, and these want to match for
consistency.  In particular using uint32_t:1 creates a latent bug in
patch 8.

One problem with bool bitfields is that your :4 needs to become 4x :1. 
Right now his hidden in the macros that gen-cpuid.py makes.

Given that b is of type uint32_t, you can omit the :12 from the end of a
and leave a comment.  Similarly, the trailing :31 on c can be dropped.

> +            } pm;

Nothing else is sub-scoped.  I'd prefer that you drop the 'pm'.

~Andrew

