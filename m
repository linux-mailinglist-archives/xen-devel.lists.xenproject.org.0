Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36FCB44F2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 00:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183399.1506110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTTvZ-0008AK-QS; Wed, 10 Dec 2025 23:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183399.1506110; Wed, 10 Dec 2025 23:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTTvZ-00088s-Np; Wed, 10 Dec 2025 23:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1183399;
 Wed, 10 Dec 2025 23:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyob=6Q=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTTvY-00088j-AJ
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 23:49:00 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb89fc97-d622-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 00:48:58 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7858.namprd03.prod.outlook.com (2603:10b6:610:24a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 23:48:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 23:48:55 +0000
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
X-Inumbo-ID: cb89fc97-d622-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IA1AgH4LZXwTAazd5RsAdN00dT0uq4erPVWulxD7A6ufi29QCyjbNQQrpu8nELiWudGVOFH8FkcDsJJhD2O2Tb52Lwd97FxOIKd3E3gl3gIKIgIsgSErIvtaktW4ZCAttVOPhKUyLCeKEIf1JQ2kRuUS/6nZSbOjyUKb+cPNPWLcSikWzhrLPDc8dveDWdC300unCMbyK/2CuBJx01km8ffe63tbnG1zVhzsJA1pKedQQL50dx9WGZiZXgAD2ULxBJqHD5cjttqnq08bFjP11RwdQywFog7kONn6b3coW/ePz6YAOyQqTvlN202g0DkyXvdNeZREqSQjkBWlMGep4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhMIduWsaFkCdEc76PVfzyk88I9YH9AxedKQH0bu3cU=;
 b=N0CH9p0IW+WTmYv0KcOxyRWJ6ZezbsyHQQjA31wWQL1CVoRhbj6VEFAzbnRLIjgLh5GAVqnF6ke1FxwhLXWqW2GCMsdAh3M69x95HO9X9jIgHiu7gIDJhtDaH0s9ONz0YSQk/igULcu2kEvSjNwcnGdhhMzzvVTH13oMc6xKVfnjQ5RBxdiyku3pyvzE6yk/KlkU7yfK8Knz+kEQA3gJAzT7eQV8Jr3ysMiKg4n5uQfnyKtiOuGqLoIz6RjBkplqu1z5pRxAi7uibk3sXQ331iIs8kgz+efJ6FE71y7KieBfJIYB1jP3YKdIHHO53cdQ31ovb0M/JEg+hE0etI4+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhMIduWsaFkCdEc76PVfzyk88I9YH9AxedKQH0bu3cU=;
 b=DhtUxAcIerx9a0Kyxe97PpVfhfc5+A8/sbX0aN26RTRnY3lzFblbVN6cywsh1YfCMSQhlBhE/nzDlVZS58d089PuuFfXVSxrPdIb0e1g/PdxDY3m5HgbEsMs2ATePsTTe7js1pnKmHa/kcYQgF+VBVYX0YxBJElPGkG2Ht2xjK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <673e625a-4df9-45fe-a45d-49d988197da8@citrix.com>
Date: Wed, 10 Dec 2025 23:48:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 1/5] x86: Misra fixes for U/L suffixes
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-2-andrew.cooper3@citrix.com>
 <c9c7deeecc839295d04c5374691f848d@bugseng.com>
 <aa03d225a116bbb5db0e7a0df61161b5@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aa03d225a116bbb5db0e7a0df61161b5@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 09836c4f-c408-42ed-4d37-08de3846add2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjJ6elVXdzUvVHNSdUJnNHpMcG8zNitJZUlUN2hQOE5BYU1HT0F6V1loVHpV?=
 =?utf-8?B?V3pyTE1wZ3hjMkZZL0toU29SdzA0Sjc1b1p2KzdyVlZ6NEdCV1RxV0dhUXQ3?=
 =?utf-8?B?RnV3bGJJWkxibEwyN0JMMDFKQytsYS9FeGk2TVBpa1NsdEpNaStVTnEzTWtq?=
 =?utf-8?B?aVlVOGJ2RTVEa0phV1R4Z1oxVzR0bXBGd3cwVlBsR01jWGtBMnc0aXJITTFo?=
 =?utf-8?B?OVFBU3Q0S3BhanAxVytRdVBZTndrMUlLMWJzb3JpR0t4R2QyVDhLbHhXNzVS?=
 =?utf-8?B?dDlWRXAzY0pQVEU1WXo0dEZ2NGJ3WG1DS0d6djdFM1JPYThFekxzZzliSEQr?=
 =?utf-8?B?RWZvd1dwL1VqUDhnMVZHcFRmVnFPZEFHSkRpY0RjUjRDeXFOcHAyQ0MzcEZw?=
 =?utf-8?B?Rk41ZVVSeFd6UlI3dENQanJldEFvUUdDa0FXTlM5MlV0K3NubGtNSi9OeDd0?=
 =?utf-8?B?LzhUcUEyeTlKNm1YRS91SzdGSjQxdXMvdEhSWXVscWQ1TXI4WkFCOHI2bE1W?=
 =?utf-8?B?WUFhMHliNE1TcVJVUkR5aGRFUUxYbzl4RnF4OVZrNndIWTJ3WUU1Q3Juc1hz?=
 =?utf-8?B?SkcrRUkreTBSbzJUcHRMZlJOUlRNWUdlMjQvWHlSTkdwNS9vbDFwaXQ2dHdh?=
 =?utf-8?B?LzFQNXNWVmM0dVo1anNzSWdJc21WL05ldXdjVHhGNW1uT0pyTGpRRVFubzVp?=
 =?utf-8?B?empOQmoybFlHWEgrdWtod0M0dC81YWNjUHBBbTJKdzFhd3l5cnRVdnlSemdI?=
 =?utf-8?B?WnRFaTk0Qkl5TlBqVmhhLzJiV1ZIeGZMOUd2Skt3WC9iZW54cHd1SFV1NVpF?=
 =?utf-8?B?N3BzUmxkRHY0c3BNNm1kQ2tXZXQxK0s3S2dRN3lFcEl3MGRkeWF1VDVES2FX?=
 =?utf-8?B?dGx3YVc3YzRTRklGTjBqdGtYS3YzN2hRYUNyVlhMdFBQQkJLMEczcnI1YUtP?=
 =?utf-8?B?QnJJbnpMeWRueldKZHN2TGdTNWdNMUd6VjRqMThsbEFha3lyQXczdm0xQzJ2?=
 =?utf-8?B?Nmx5TFdQOC8rczM3amZtbVNvamZWQm9sbEVlU0plU0svbEVzRDJyTjgwZWYx?=
 =?utf-8?B?ODZLRWJVSVlYcWRHMGVxUkxONERpS29GWHZMUkw5REpEZXNacXlmd21sUjJu?=
 =?utf-8?B?cUZXYXJLVmltZ0ExVEtNK2g3eWdOemJ5cGVDb0xpclZiMHVQQTN2OE52ZFlv?=
 =?utf-8?B?a1JPRStDRnVEcE1sOUZXaXJEdlJ1eDhiSWczRlF0bHZYcGFMNENleUw4NThV?=
 =?utf-8?B?dFRreDBzR2FZL2pGbDR6aElTVGNPcmUrQkZ0V0JnZjJrOFFDNUdrcCsvOW0v?=
 =?utf-8?B?KzJMQ0Uza2tXOElqNEkyc3BvL1ZoYmdEK2FPMVBDRGZLUVNMZWJ0ZGw1N1NC?=
 =?utf-8?B?T1d0SFpUbWtibVBSUlE1UUMxN2dITFpoaTF1NTZaZ3lSUm1kZ2JpSS9NNmJl?=
 =?utf-8?B?K1BrOXcrYzljOXExdEFCZUhGMThTS2dUb0xYRVoycnl1U2ZRK3RtclFqcUpr?=
 =?utf-8?B?RGo4WlYvVjVFN3ByWDhTeU4yQS9kQmlTVFdEM3JUOFFFU0YyemtPSXJWYjdJ?=
 =?utf-8?B?ajZib25aNkFWRXJhdW9Cdm1DaHVSeC83Q3psZlcrSU1JV0hCQkREQnNyRXQw?=
 =?utf-8?B?cDJMbmZQbjRYK2xQMUE2N1p4UGk1WDdlTWZaOHhvZFhjM3puNWVZcjNxTWx3?=
 =?utf-8?B?aDc5RXhpQkRwajdXeEY1WnUzcmdkK2pIY09KQUpmYWFQZlNjSFJSVVpsM0d6?=
 =?utf-8?B?T2pNZSt4aWN1bElQQWZDdy8zcWVPMVliUVpMRTlyM3FCbTA4K0JnelpYQ3c2?=
 =?utf-8?B?ckZIV1JadzlwQ2FKck9JclJodFdZcXpOcFdxODZ0Y1NYdzlSeHV1SmJnZkV4?=
 =?utf-8?B?WklwYXNOUytseWFrbFB4U2t6WVRXVXBOaUlYd3FSTzVvdmppaDk4VWNuclFW?=
 =?utf-8?B?WTgvTHJlMVoxL0RaVkt1K0dpcVB6azBic3RlemNHeDdLNEVOc2UvcUtGb1hy?=
 =?utf-8?B?UjFtK3BDTTdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFI5MU5oQnRkc2xQTFBvUzJwdlFwWE9vSTBPWVBzWXFFalQwVnJxallvaFpo?=
 =?utf-8?B?OW4zVWoxRGhDQXdlRmd2ZUFTS0c2a3FrNks5QzBEOVBjQ1ZYa2srNGFhaFo1?=
 =?utf-8?B?OUwvNjBtWktGUXVaWDdXVVdlTjBuM3B4aWNwMXp5cmxqWXpiY3M3eHhteVBC?=
 =?utf-8?B?eVJ2aU12OGhiSHR2UnBlVUJISUtpSlUwL1lQaS9CN2krTktDN1l5dWF1bXk2?=
 =?utf-8?B?OVMrUWtHREJ6S2JrczNqaHVabWppNXYvN3RtQjM1aS9sdGs4ZHhoYmhvLzNj?=
 =?utf-8?B?SFFmTThPOEZlM0VOSjdPaVpFV1g0aVcwVzk0b0ZSSG5YY1dhMVMyNk44eVgr?=
 =?utf-8?B?VThJVEh0ZUF3ZWgxTmlqVm5qZi9tMHNVL0VVMW1RU1J1aU9FSW5ncG1EcDhr?=
 =?utf-8?B?Z1JYVGJZRHJZaituMlZCN0hZVU1pT0J4Yk5Ha3g2QUpmb1dsRlVuZC8vUGRi?=
 =?utf-8?B?SXgvaWI3bGlyOVRCN0RhMjd6WVlvWVVsMWhaY0VCZE1waDJ4ZWs1MTdYN2pY?=
 =?utf-8?B?V0hDWVRLeS9UZFgveDhIWWN3b0p6TnBiZWVrVGVzb2xEK1F6Z3l2V0lWVUJi?=
 =?utf-8?B?Tng4aS9zSVIycEpVT09OSk9yS3ZDeEJCTzlxb1RXdkVxZ2xnQ285OW52MWg4?=
 =?utf-8?B?Q0xwVGp0Qmk2WlNodUFGbkF0b1FKVHJ4OWd1RDFXQkZQUGpLejc4dVdWYzFC?=
 =?utf-8?B?T2x0azMrbklPZXNKMmRPeWllNUYzWmxTK3E1T0ZhcGUvd3lQSE1SWjNPNXhR?=
 =?utf-8?B?QVdmRFpJNTFYTzArWGNvU2RnQkROa3VXMWFGTGlNVW5mVktVQXdrclV6a2g3?=
 =?utf-8?B?bm5WckV5MGJmamdnYjhaL28xSTJ6aVVCajEyQnlWSVFjMG1ESUxmUXVRb1pJ?=
 =?utf-8?B?dmZvZlJSQmp3SjRDZUc3QmgzWjZDVjZzb3h2c1FxdEZOZEhWNWFJV0RUVmZj?=
 =?utf-8?B?emQwbkpCOFVXMHprWk1NaWZ6eDhLWUdnRGhVMndtNHo3R0JkNnJSR0NvY2dx?=
 =?utf-8?B?UHAwTzFNNjhkSkZFd3FoOHQ0ZzlLWjlHazMwVzk3dVNNNTRRdkxKVmU3NUUx?=
 =?utf-8?B?RWNzYWZaVDhrR3duS0pnVGJ3L3RONTZWeWgvT3R2TytQdzVKUiszaUZ5WTJE?=
 =?utf-8?B?NlNiRVBqR3NjcVoveGFObS82UElDZG5UbFphYzFwODJKU1BrMTUrSEdwc2NT?=
 =?utf-8?B?UjdLRSticnBRMERCRGVqNjlEN0RqRC8yQUp0M0wxZE8zbGZRaTJQWVFUVGFk?=
 =?utf-8?B?Q0EvcnVsZU9mSUd3SzhmQnhiYS9Zc0YvWXVid0QrZks1TlA0RE5IWit1Y2o0?=
 =?utf-8?B?QnRZdnR3MGQrNjY2a1JNMnZrdytaNzlIZnViWHZYNWVJRTVuNWx1dHVsMjhV?=
 =?utf-8?B?N1FDOXFPL1AvZzJBR0VEcUFGcWxSV2tHQUo2SGpmMTZyNldjb3dwUzFVeUQv?=
 =?utf-8?B?d0xtclh5aTA4K0VJVkpKaitMaktuQjk3SkpmaXNXVTROQytyOVNaWDFZM0ZT?=
 =?utf-8?B?YlVuSFBnZlhQK01aa3ZWNm1lY2pnS2ZKSVNwRlV4Ynl5NWlldk9qZmozRTFl?=
 =?utf-8?B?a2VtSUFrVS9JN2JtN0lGVi84T3ZjcURmamI0SHhwc0pMWXEwUUI2ZkROZG02?=
 =?utf-8?B?dTd1aEtDL2FFM0JhWHlUSDlrOWdBcWxvU29sbVkzcEQ5eFc1RmdEcDF4cFR2?=
 =?utf-8?B?YjN1M20yTkRjaStlT20wOFdPNVIrZjF2MWgyT3c1U0ttWDFhcmMyUTMzM01H?=
 =?utf-8?B?bFluN2tSbVl6VXRPcGFLbURzd0RJKy9pSjhSdkNPVzRPM21vSUZVZXBibTRV?=
 =?utf-8?B?TFlmVi93aVJDZjBqN2xQamxCSC9WRUFnRGZYUkFHSWxFemsweU9Yd0l3Q204?=
 =?utf-8?B?SVhTMWZFY3Rjd0l1dktnVHQ0dEJDdmpUUTc5aHVSK2wzdUJkL0xEbEszSXBD?=
 =?utf-8?B?VXExUFk3am04NHNzMVJrM1cwNjdGWldxK1Q5SkowNDhqV2VEQ0VsSndaZUg1?=
 =?utf-8?B?MFhtTWxsVGQyVVpEWnFGdVdOZnVzd1dIM2RvQmxTZVNyaklET0Z0SDdYdVZK?=
 =?utf-8?B?MkdFWENtdEhVQ3lIczducURkNDVFdmhob1dxRUlIV3RHYk9yL2tYUnJjU2gr?=
 =?utf-8?B?NDR2SW0vRW16S3dWNk8yNWlRYlErbjk3ZU01enRXMVpCM1BkbXNMRkNOc09N?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09836c4f-c408-42ed-4d37-08de3846add2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 23:48:54.9676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOT8x8uGXfohaRtBMvDsuCLwzEd8erjD4+65A9tRh5Nuovkvw/TTJumYKzbTFA5JgIP2APxhF3bfkRtwsZLwinGnbJhz87R9/ZdR9T4YCJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7858

On 10/12/2025 8:31 pm, Nicola Vetrini wrote:
> On 2025-12-10 21:09, Nicola Vetrini wrote:
>> On 2025-12-10 19:30, Andrew Cooper wrote:
>>> diff --git a/xen/include/xen/elfstructs.h
>>> b/xen/include/xen/elfstructs.h
>>> index eb6b87a823a8..8770e7454672 100644
>>> --- a/xen/include/xen/elfstructs.h
>>> +++ b/xen/include/xen/elfstructs.h
>>> @@ -360,7 +360,7 @@ typedef struct {
>>>  } Elf64_Rela;
>>>
>>>  #define    ELF64_R_SYM(info)    ((info) >> 32)
>>> -#define    ELF64_R_TYPE(info)    ((info) & 0xFFFFFFFF)
>>> +#define    ELF64_R_TYPE(info)    ((uint32_t)(info))
>
> Actually I think this doesn't build:
>
> arch/x86/livepatch.c: In function ‘arch_livepatch_perform_rela’:
> ././include/xen/config.h:55:24: error: format ‘%lu’ expects argument
> of type ‘long unsigned int’, but argument 3 has type ‘unsigned int’
> [-Werror=format=]
>    55 | #define XENLOG_ERR     "<0>"
>       |                        ^~~~~
> arch/x86/livepatch.c:332:20: note: in expansion of macro ‘XENLOG_ERR’
>   332 |             printk(XENLOG_ERR LIVEPATCH "%s: Unhandled
> relocation %lu\n",
>       |                    ^~~~~~~~~~
> arch/x86/livepatch.c:332:69: note: format string is defined here
>   332 |             printk(XENLOG_ERR LIVEPATCH "%s: Unhandled
> relocation %lu\n",
>      
> |                                                                   ~~^
>      
> |                                                                     |
>      
> |                                                                    
> long unsigned int
>      
> |                                                                   %u
>
> the error location is a bit unclear, but the cast is the culprit

Yeah, I spotted that just as I heading out, and ran
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2207521982
instead.

I've swapped back to using 0xFFFFFFFFU.  info ends up being long, and
the result of the expression needs to stay that way.

However, looking at the report for that, I still missed one.  I've
folded in this hunk too.

diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index 8c44dea12330..e741e686c1af 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -37,7 +37,7 @@ int pv_emul_read_descriptor(unsigned int sel, const struct vcpu *v,
     if ( !(desc.b & _SEGMENT_L) )
     {
         *base = ((desc.a >> 16) + ((desc.b & 0xff) << 16) +
-                 (desc.b & 0xff000000));
+                 (desc.b & 0xff000000U));
         *limit = (desc.a & 0xffff) | (desc.b & 0x000f0000);
         if ( desc.b & _SEGMENT_G )
             *limit = ((*limit + 1) << 12) - 1;


~Andrew

