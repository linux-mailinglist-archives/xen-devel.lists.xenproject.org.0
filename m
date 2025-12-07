Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D83CAB702
	for <lists+xen-devel@lfdr.de>; Sun, 07 Dec 2025 16:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180008.1503284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSH8C-0004jp-Uq; Sun, 07 Dec 2025 15:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180008.1503284; Sun, 07 Dec 2025 15:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSH8C-0004hS-SC; Sun, 07 Dec 2025 15:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1180008;
 Sun, 07 Dec 2025 15:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=INev=6N=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vSH8B-0004hM-Rn
 for xen-devel@lists.xenproject.org; Sun, 07 Dec 2025 15:57:03 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ac308ff-d385-11f0-980a-7dc792cee155;
 Sun, 07 Dec 2025 16:56:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6935.namprd03.prod.outlook.com (2603:10b6:8:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Sun, 7 Dec
 2025 15:56:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Sun, 7 Dec 2025
 15:56:52 +0000
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
X-Inumbo-ID: 5ac308ff-d385-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGQTD02SrSugjsTJTCdSrAPE1LGlRWuUrUGI0zKhi3BKGYUPiDe4nsxjYkOvVOXko1nwlEi2cDzK9CS+PYqc7J9MoOsSzt9Ucq6GDuB0mTnM3PoEP0UR1hdaKHarsAevMwroZbi+2rpRCXFW64FmA+Ud3uxSsWBcDI17KVWv5dWCAhFkHbHcAUmVpAyukDcqW3ixrwPqJnGJSi4dUzN5mB6crOxLKOmJ13Ue84vemvtZKkaCzbSK3O3q8ZlSAsiGlr3Z5ebUJVU5AlNDiGV3FyiFjgI8QRF+FDkoMH4DF6dpVVF0iZH/iheAS46NfEIXSHccA7IuxXhuEpKiOjvbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY+Ky9HHN+uebW55Pczfm4Q/xq5MIHEUHCfIOJfn15c=;
 b=Kzvl409VUtTQ47ZDhRL1RwEYm9RnrhksuppU61cQqDh/SPKfjNwiM/IxjYE8M+JI6ipIhhRkZ5DEeQkZyOuO288t9BJW+T4yBemGUDqv8ae0kGSWo6ie5mE28NZyoUZsoyV5sfeLMFj0r6y8kjXg+3hKv52PwRHPpI8SBVpiA1nzhBImgqB4QysJTrNenR28vnd4JoQCVP0tNL3ai5I2O5c9pprKwKjT2fMc1Op9gyAB8mIrjswCui9XAQgY+wKEuBYH5DTPJo40rVzXR8O4AzVFrh5Af8IbERJnSnlPhVSos/ivzbxj0iPhuda6Kmw+5yl1Mg/cs2DxwSuVCJwaUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qY+Ky9HHN+uebW55Pczfm4Q/xq5MIHEUHCfIOJfn15c=;
 b=wAG7pPyyLtX7ha1lz4eARCI5WbusVtxFL/S8wiJ7RlcvDkWu22Uad8Qr+B9ctML8o3K1KMvBWl8carR/cmxm3gXLMbNwpE43Woa6aAp1nSgQMWAiCZrV967OamZQcWGmOA979grEEGpOgYS66yRJSwKXsNvim/cdiYr2m924288=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <444d7cfd-0f2b-4fe2-b5d5-12a82754233a@citrix.com>
Date: Sun, 7 Dec 2025 15:56:49 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: Fix container build jobs
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20251207145216.35234-1-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251207145216.35234-1-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0458.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 437145a9-8607-47c3-6b68-08de35a93d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTRISG1uYjQ3WkpoSWQyYXl6U050a1laZzg5b0M0SW5BK2ZSUlFQNjIrWmxP?=
 =?utf-8?B?NkFQWTRnVGRmZ2hDTklNTDd2UlhMcUlTUnBvZUd3MDlVeGdLUmc2WlFGSXpq?=
 =?utf-8?B?TFZyWk96WFRhTzdRNVMweitXNW5IenlGc243d3pYbVREZUdkQjljTHhWbTc5?=
 =?utf-8?B?UE9GWEpsK2ZrSnp4WWx0QzRxYk41RWVTVWRZZXdoQkJCalJCYTdRNisyeXp4?=
 =?utf-8?B?SnQ3dC9MdHU3QTAxTGxRNFFiOGhEdFAxZW1leVBtRTdFbFJqczRoMURMb0dJ?=
 =?utf-8?B?Q1dUSWZlSVZka09Eck9ONnV1TVlpOEVBZW02WFY2eFB4Mzc3aU9pT0ZSeG9N?=
 =?utf-8?B?eC9aVDBGdXBLZ0NHZE4rRDVFZlpkMDlaRHdBTHg3bmN2NmZ4azNZUWJSRERL?=
 =?utf-8?B?L2tZUHh1Z01pTlRtbFArdVNxUlNEWEQrNklYWUxQY21KcFlYZ28rUU1EamFq?=
 =?utf-8?B?cjZjWlN4WFdaVzN3WGJjREhwNGJjdUZMbGVZN093dW02c09pemIrSXZMRFRB?=
 =?utf-8?B?VitjMm01OU9EaktFTCs4VHI5SGlQSllEZU53S3pmaHp3UTFqMGRHam8xVVBC?=
 =?utf-8?B?ZitJYUNWNXEyNTJ4VDJ0WUdENXplWTQvV1pOVkIySFBDYmhOZ2FWRmRmOXp5?=
 =?utf-8?B?RVB5QW0yRXVVTnRMZFdTdmZlbnUzVmRyQlFzY0RUK2NVNkxkQXAva1FKZWEr?=
 =?utf-8?B?RDAzWHRyT01VWURDWlZ4a1F1S1dtdGNUajlpaGlld1FLMERXODFJcTI3dEtQ?=
 =?utf-8?B?bjZneXFlUU9FWnZVVmZkdlhRZ1VWbGpWaE1kN0ljeE10cDdwV090cGNScXFG?=
 =?utf-8?B?VU54QTYyVlRQeTdoSzhKS0k4SlZoSjEzMnBJWlcwUXdCNXcyTzBTTlN6TFhx?=
 =?utf-8?B?eUFBRzJjeE9rRmh2bmVHSVFqekwvM25Uakg4OVZsU014TGd6M0EydTZ6akZL?=
 =?utf-8?B?UCtMd3V4M3N5OFdTMmRzaDhDMGhFUGt3YnhUOUdqUU8vMWlsbG9CaTRlZmFn?=
 =?utf-8?B?a095TmNobFkwc0pjM21jdE1mSEVzeDJtSGo4Yng3VXBaaTloNlBJb2RZcWxm?=
 =?utf-8?B?enB0WVpEVnpDNlpvRVIwN3ZsOGRFNXE2RjYvcVFZVFZXTU9QZEJ2M2xoMHV3?=
 =?utf-8?B?L1RqMXRoVHhOMGhwaVRCZDZFdkM2blIzWXMrb0NuNU56Ykl1WDZSSGozelEz?=
 =?utf-8?B?TW1zRWFuZ1dHQWNvdkZRVXVWSzVqeTN1WnBVUWhSbXpBaXJNbnYrUk5zYjFX?=
 =?utf-8?B?TWQ5bGFJMk9tcDBSTlVMSGFCeTFtVU1lM2REWm5CK1J0UXBwK2xZYjMzTGFn?=
 =?utf-8?B?NytpUGdXcWNCeVYrclpVMUtjUDV0OEl0UkFyMWtnNkRybmVxanVrdjlmRnJS?=
 =?utf-8?B?bVI3WUNEeVBRSWxXdGErMEdRL1I0U2hHZ2Z0emJNUFhyYU55OUluUy80bk41?=
 =?utf-8?B?c1ZiVGRuMkYvV2laVjhCbjNNc1pFb2o2UWhpbTJuSGlnZXJNWTdRMjFCTTg5?=
 =?utf-8?B?OTc4Q3I3T3RvWS9mdDFTVjBwQ0ZleVFSY1RKVkt1ODFrM1daT1ArdFFTb0Rz?=
 =?utf-8?B?cTBza0wwb0RvcXpWallvdEFCUXdmY2xPUlhpNWV3VWFwa2lwRm1Wb2JwbVZh?=
 =?utf-8?B?cm1WUzh5YTNlcVM5WVhIY3p3cUM4bFlKNlpzTk9iTVlJcEhwMTVZZnk4NlVC?=
 =?utf-8?B?ajhSK2JTOXVTRVVyZXpERlQ5ZCtJRGJCVmRXWU9HU05aMHdrdnJveklzekg5?=
 =?utf-8?B?T3ZDWEViWTBTVTlrdWFoeGFoc1BJdmJmUkMxeFpaS2NnME9FN1BadXZxeVJS?=
 =?utf-8?B?VnhCcy9JeFZ1N1A4cmFWRDJSZFlhbVZYeE1oMWtkVjNuMEFZcVlodVc1SS96?=
 =?utf-8?B?KzVMemo1R1BGLytoVXVZN2ZFYVJRcDQvMzR4L0YrM2dTTTJLckdhVWpXZnJj?=
 =?utf-8?Q?Wh8h8Y50QjrqKKJL946lyaHwRFDZah6g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGhoZWxEdkNOZnkxYjN6a0hnaElTcFhFTWY2Qm1uVXlhVXJEWmRuMW5IbmRU?=
 =?utf-8?B?dWczNGNFRkhkNXhYdnVUUFcyUnJFZDlGNWlXM0FuWWwwbWkwdlU3MW5BWUtJ?=
 =?utf-8?B?N0ZHYjRTT2xocTlpWHVtWU9RQ2xXUlV2dlBrUkNXVkJObU9IM21ZeFhSVCtx?=
 =?utf-8?B?L1pKbUs3RHdsOHNDcWhQdGdrSEd3VDFPK3p1cGNzUm1aczdzdVdRRUJ2S3pT?=
 =?utf-8?B?TUxubFJ0VnRwNGw5eGROZXpCNU1nU09qdklTMUVtSVBtTE1MMXk2RHF4bzk3?=
 =?utf-8?B?OUIwalUyaGZuQXYxM3VXZk5kT0EyU2RUMVZ5VXltNk5TWUpWR1M4UE1pUWxP?=
 =?utf-8?B?Z2VpMFFBaUwrSm5KSHRuSTdHWVdZYTNrTW1kTThLQUg0Y3ZzM0tEbTlncEVF?=
 =?utf-8?B?SzdxN3djNGlINmJUZFU5WVhzMGswVGpSZnh3Y1g4OTlPVmoycldwOGRGSUtD?=
 =?utf-8?B?WUlHMktnVnhiaENSaEdjRW9oZk1LekxOdjNOOUVHQlBMc0t0b0E0cTVLZnZ1?=
 =?utf-8?B?RGpXMHovNXhtN2pEQTJHV1RJcnJ1bFdLaXlmREx5MFVhSHFycTduZEZXUmN2?=
 =?utf-8?B?ZUNFbUxjZzRnc2tDVnlaaysxWlZqQVoySktPbTFmUWpWbzFiNHpHekpzd2JX?=
 =?utf-8?B?ZUM0NjNrM050WnFnNFZ6b0hQRUZFWW90M0VxS0hrbnZkem0vQnhpdDQ1L0w0?=
 =?utf-8?B?dHpCUE9Qcms3MWRCMGxGbXdMZmwrcnp5K2QvVXB2cGJZdWtDcFJpdEpodFJE?=
 =?utf-8?B?ZGdndEZUSHEvMHhVb284YUNKOXhGY1Q5NGJzcllGT1dvOCtxeS9XZnhDaEts?=
 =?utf-8?B?bjdHRHdwUm90NU9nN2h2NlJoUEVyblI3emxuTVdwSjVXVWhONUVzRGpRajFv?=
 =?utf-8?B?b1V6VEJUOW12NXhMSU5ZcDkxNFhCZ3JtSEhtc1gzbGw5K0daK2xiTmd6NEhD?=
 =?utf-8?B?ZUN1a1o0eWNyQm85TDI2U09CQWoxcEFPOE1ZU25sT211bDZ5djZwakNuRE9P?=
 =?utf-8?B?M2t4cGtyT29nWkMyUG9IWTFlOVBTQmJEbHRTVGs3N1VvczBrcXlEeEpxQUV5?=
 =?utf-8?B?azEwMHNhbEFFdkJ5YUJnQ3RyOFN1VCtXVGNxbFVuTDdGRWFpZ25SOFp0MVRP?=
 =?utf-8?B?Nk5VbWJpQWdGam5aQ0VyYUR4cWRubjhuYWFGSmFyNHRWQTVLVnRMU3EvT3Ax?=
 =?utf-8?B?ekJWaWt0dkdqK1pUSzljVVgwVFMrVm5QaFhiMzVhV3RjcVZQZmx4RG9qcGZl?=
 =?utf-8?B?ZEJ6bWxYTVFYcFI4R0dxV2RhYUtEQTlMN1hERjk3NkRZVG5HOXBrRkJQT2Vi?=
 =?utf-8?B?bEpJekVuaVQ5Uzhhck9rR2d6WEpjTUd6NEhRTlZ0MU5Nb0xDYUh5T29vRTJp?=
 =?utf-8?B?STd3cTdlR3YzVjVGWVVtZXA1blBxV1huUm9WWklaL2E2SEQrQkowWWcraHFs?=
 =?utf-8?B?RkYwTi9NeHpienlzbmJXV2ljMW5HRDdLSmVUdzVnWXp5NTdsWUcxdmlaam52?=
 =?utf-8?B?YkVkUmhZNU1OTW5qNmxEV1Q4SWkwMXpoQUd6dVdOVjFoQzNLMUZ5R3h4WGtt?=
 =?utf-8?B?MEZSNHhWSlF4WitZTExsTDlhd2RHVVYzemNzRHdJRFlIVXFRUHNyQ1FFK21m?=
 =?utf-8?B?SlpJMFl5UGhXWEJhUVc3dDl1bzB5OWMxNzdSdVZ6d0NhcTFYNG1tWmtxNWNv?=
 =?utf-8?B?UUpIOE9MUXFIWlJleVkrMU5waHI4Kytnc3d6bkFpdDM2dGllTHdQUm95ck1O?=
 =?utf-8?B?ek1rYlVKR04xZW5VT0l4dnR4TWNhdWVhNGNqSUtGYXlRdkxnVVVqbE0xZEwy?=
 =?utf-8?B?SHUzcDZ0ZTZ1dnczNUFzaVN2TWhNc09LTTFvNXYxcno3NFQ3TzNwQzVualN2?=
 =?utf-8?B?Q3J5bjhEOS8zSkpSY2ZsZitPbU9LbVE5SFNXOExvQWR3clFOYlcyTEd3ZExX?=
 =?utf-8?B?aDZvVDg0UnNjOGFxcmJ5K3AxY1daTEhiVitVZS8rT05kWGZ4L3RiRnl5T1JG?=
 =?utf-8?B?ejcwUmxZU3Mva2FQZndMdVZLNGt3ZGdhaElnOFJ2UkFKZDB0QlQ5WjRqTHF1?=
 =?utf-8?B?UjhldU9MS0RjaTRRTDNFVVRlNDA4aEU3MmlROUhZeGJNMmVnLy9NU0lzN2pw?=
 =?utf-8?B?dmhNUmh6ZmZOaUNleHFXQ01xb1dHN200RTdUeG4zZU5TZFB5UzlJV0psdWZ5?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437145a9-8607-47c3-6b68-08de35a93d18
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2025 15:56:52.5857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fGePxfydvcuTr84SsXqD9Fc0UzkxfI/wUckEudVp0WpHZE+zT9zdYov1plmM0cfBNxGUsnOjXGX4owUJuV9e7qb/7pmJboQapfaayubdog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6935

On 07/12/2025 2:52 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> `docker:stable` tag hasn't been updated in 5 years, and has been
> deprecated, according to https://hub.docker.com/_/docker, while
> `docker:dind` (image use for the service) is using a recent version of
> docker.
>
> Now, `docker info` fails with:
>     Error response from daemon: client version 1.40 is too old. ...
>
> Switch to a newer tag, and just the "cli" version which contains only
> the docker client. With that, both `:dind` and `:cli` should keep
> using the same version of version. (`:cli` seems to be the base image
> used to build `:dind`.)
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

