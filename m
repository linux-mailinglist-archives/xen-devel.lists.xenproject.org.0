Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DBACDD177
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 22:52:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193214.1512159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYWlf-00086D-AT; Wed, 24 Dec 2025 21:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193214.1512159; Wed, 24 Dec 2025 21:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYWlf-00084m-7c; Wed, 24 Dec 2025 21:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1193214;
 Wed, 24 Dec 2025 21:51:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2J/=66=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vYWld-00084g-IM
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 21:51:37 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e303d9-e112-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 22:51:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW5PR03MB7006.namprd03.prod.outlook.com (2603:10b6:303:1a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 21:51:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 21:51:28 +0000
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
X-Inumbo-ID: b4e303d9-e112-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7J84sBHTnj8P1Uq60qgbGUVT7FpOiRSAFwnSU9zRlwGi88TcTwJW8KslT9bxz5p0hgUnc0TC5Luo1YE5k+9a/zLba4EJbQJ+bwrnZUrMRNyLtRDVqNWCoxbkDCrqC93lw5p1PIDtDWxNsiYIkTt3cp/va/h2CrrmzHkLS3JQ0vHV6TDuMA4WddtjDxV8y9ixz/NM+xWRQ7aP9CCfSne74t2AxDoGiM45d+QCBY4rloY5lar/PJdD/etEnsPcvwAFihIF05NKI8JCDdEJ4syO9hy08b6DiDoYX6FdRrFxcNBF0Az/hZXYVYTVqU2HDRowyLP3s1BTVl7b16J1Qyl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAYQp2jY0c2ffDuovH+vVpGvWCzGf1gztqyf7C9P4NM=;
 b=rQ1CUAmt3svudWNrqTAxKzWvImXjOqD07yZ1a+Oy8HJy7K0AYdKeaB73T+gZqUs+0JneEJjaWwWeSkKay3bBV0MWoMzpNZrDVKzXo11RfA9iV4kKzngrHcs4AgEJpOp5KB/29zejn0uLggELX5jz5kBzcliDlfmGelgOLJqj4KdoNWbcUKRvP724oPzWz/GesJXaBFysgHn56RnHlJEQ7hwLYnV1uMO5hzeQMDP2bJCShEykXXGgoUsbhHKrkdCR/R1e2ViI7blEOXUy1uaVZ7Hv4zt/hudYJMyH1tNAeSfNoTLuUQp+PDw4JAER2Z4wGud4OTW+znKL8Ln3T9asqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAYQp2jY0c2ffDuovH+vVpGvWCzGf1gztqyf7C9P4NM=;
 b=ooXN7DNpesMG+do+77oSgp1KM6aet5XrTWjHmViD1rRe3bM0w5cNQWdWQiliR90ngjF/mOWgVBILjpcZqRhRsT0ianc1h63vN/sVbZSK6G0BF1fK5ayruGeMSzxF6UvTcfVacgQq8ugcsjqJnGPjXrcrl+I9amTaYr3gwwyEOHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e93e13e6-ae8a-4546-b495-791e9ce1d150@citrix.com>
Date: Wed, 24 Dec 2025 21:51:23 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] xen/mm: reject XENMEM_claim_pages when using LLC
 coloring
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20251224194035.60173-1-roger.pau@citrix.com>
 <20251224194035.60173-3-roger.pau@citrix.com>
 <23c0fcc3-234e-4eee-971a-7ed6cd045d1b@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <23c0fcc3-234e-4eee-971a-7ed6cd045d1b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW5PR03MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4d5274-b21e-4efc-1a43-08de4336974a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzUxdnF4OVI2S3ZBbWlBbHI2SCtiYWV3ZWRUT3Z4NlJ0dVZwSXhIaGZDVitG?=
 =?utf-8?B?TW12bjR0SUJEWW16Qkd0OTAxNWlEdnV3YjFGTWdQdWtpeG1iOWxuYzN1cm9X?=
 =?utf-8?B?WENuR3I5bnZKTTdEQW5ORERZemVUR1FaOTBPTW5ha3pPbXJUTHVvTHN6M2po?=
 =?utf-8?B?WlA0WmtxcmFOUU00TEd6TDVSUXZsUEtndElTRTRqMTZVcEtnMkVkN3hDS1lP?=
 =?utf-8?B?TUVMYkU0RlJ5OUtVSExBQkU3bjduancyRUsydmRTUUhGd2RGcXI5SXNVWGRU?=
 =?utf-8?B?cUpIaWV2SFVORXNKdnlsbzZNaTNlNjErYjNQWVdaeFJuTlYzV0JxaUdqK0lR?=
 =?utf-8?B?aDhlTTYvOHd3cXR6OVNLZGZOS0lkNThvMWMzN3hsWEVhbXdwZkowTlN2Tm1I?=
 =?utf-8?B?cFJSWkYzVW5NSWRIV0YyTTltMkdIZ2R1b0ViOFg1MDkxVVVuM253QzgyL2Nl?=
 =?utf-8?B?ZElhOTFFajBPbHBSdmtOY0lIdW1MbEtvTEFpcm5XQnBpOEQySnBtbVNmNmZx?=
 =?utf-8?B?R0NGWDJoL3ZjL3FxM3h5ejlaQzc2S2ZIa3psRlM2b3JxRDdvZkRQOGNaZFoy?=
 =?utf-8?B?V3ZRbVgwV1NtUEcxUWY2bzVMOGpLazdTWGF2K3B3amdmbTMxZXp2ak5NZTJC?=
 =?utf-8?B?cUNDYnBHd25MTndpUlhMSi9IY1k2b0J0MDA1NGI4YTk2N0RpTHJCa1Jzczgy?=
 =?utf-8?B?bkFVT1lzYUtmdFhTU3lBaG9VbGVQL0w4cXdxNHM1clhjbWZKWVZ2ODB3Lzk5?=
 =?utf-8?B?MUQyMWZYTEJrS1VFU2cvb056WjY2dFVySzdzNGpYQUFDd2pqZ05GdlRvSU9Y?=
 =?utf-8?B?UENOYUlwa0ppekJNdW5hcVAxYmRrWkgvYTQvUVBpcGlOaDR3elQxRktaSWZR?=
 =?utf-8?B?MElsbHJSU2tzaFFiSGdiUXFPM3VsY0M0V1pra1p1R1JaY2VEQjkxR3cwVHhp?=
 =?utf-8?B?b3hkVlhVTVp2V0tUNk1wMzExakp3SVZZTzJJSnFTU3VaL21FSVJ3bjBRd0E1?=
 =?utf-8?B?Qy9WNHlwUzRQTWdjSFlXTVRGMzdiUmpUV2FiSytBNnlLZU50a3I2SVJWek8y?=
 =?utf-8?B?UzA5SUM4dUpGQmV3UGRUWW1wekZWNnlHNnJGanM5NHY3SjFZa1pKeFpqZkI4?=
 =?utf-8?B?L1drbFdoVXpENXlMdGdzSjJ5dEFsSDQ2R3RGaDB0aEhhNnZUOVMxS2pjeUk1?=
 =?utf-8?B?UUp5VW1UL1k0WVUySERRQjJLeTNLamdNV1dCK0RaTHB3S0RWSlYrNFNUZWNh?=
 =?utf-8?B?MDREN1QwR0g2RDFvSkJNa1Jqc2tvUlZiL0J4U0d1SzMrVCtzTGhmWW5uT2l0?=
 =?utf-8?B?dG90SDhmdWZxOXpvdXZTUjl3TlF5NDQvU0x2b084OEVuYm5JN0Y1S3ZQR3JC?=
 =?utf-8?B?WkpiREk1aGREVGJsaXB4TjYrMDVBWXZBeEpjM2ZySks5VUcxMmRsVVkyUEEz?=
 =?utf-8?B?aVJndnloNlFEYUpCNGg5YkZmR1RlSll5NzZxSlhOZ1BUM3lyNm1MeVVTWmpj?=
 =?utf-8?B?RWE3RlpOeVQ5QzhBQndvYnFqbkpnaVlYMzlOSE1YT2JLb0hTK3lRRTg4NTJm?=
 =?utf-8?B?MFZOeXNFdC9ZdFk2QThkY25QbkREU1NpM1lyVTJkUnpZZkFqVGxvOTFYSTFM?=
 =?utf-8?B?L1VVRVRUQXMza2orUnpVcmdRZzNzMDZXZVZvM3E1WHBXZk9HRm9Uc1YwSHA4?=
 =?utf-8?B?c2lnamNaYkZkdFdMMjZlNHAreStzb2lNZWhZVFAxemhCMlhsSVpiSUNsOGpD?=
 =?utf-8?B?MUwxaE53SjlvaWZ1dStvOGVRYWJRT0M5Vk1nTkVwaWl1dWFwczZWcE1SZkpp?=
 =?utf-8?B?eDJhMDhlNkZLL2xQdC9WTlB4ZUdXa1dIQXZ6SitqNzdoNFZlSmFEem5SMU4v?=
 =?utf-8?B?SU5lVEcwYkxMbUhqdVpYbklGOXptUG8rT3JlVThFU0Rjek9mUXNaMTNmWFJC?=
 =?utf-8?Q?fmNmg7GZM6aXTzZyt1RRRldKOC+wu17D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2wrdHpMbjhOeFZ2ZlJtMW0wRG1CenVrUVBkM2p3dkZVVTF2c2dHUjZOdkVq?=
 =?utf-8?B?ZVhCZSt4UXJlNCt0bit2QWZ4ZFo2QWdrT2ZMc0wwWmg4ajFuNkI1NEdGUEhp?=
 =?utf-8?B?M0xtczY2M2lLMjBUZWZhYkQwVy85dDNNcllPcWhETURHcjNjcWxQVWZMZ2oz?=
 =?utf-8?B?T01qYjZPTW1TM0lxcm1MdTNPQTcwVmZGQUg0SnBNWE5yQUNEVG5HRkJXMGxB?=
 =?utf-8?B?bFJNY2hzZjNIWThaQitvZ1MwTGlINnl2NlBQeG9vU0ZsUVpvUjNQTnlmZ3dx?=
 =?utf-8?B?ZllVaHp0b29VcWVNVnNwaWx3aUdzSUgrbCtmUzV6Um9laVNPeDNVZXlxMldP?=
 =?utf-8?B?S1IvWXJxQ1NNMWlrNVczZ1M3bUQ0Ym92QmhYN25CUEo5Yy9aeTVWMzJZeTlT?=
 =?utf-8?B?S2w1QmN3eU1vN2lCU1V6Rmk3Nnk5MHc5RWo4Mkx2ellvay8zdUV0VCtaMklt?=
 =?utf-8?B?SHZRVG1pSXhFTHY1aUI2Q0ZodkI2bkVReHYzelZKNWQrdlRFSDRpRmRGLzlH?=
 =?utf-8?B?MWJGODM2dXI5VXdmcENORnBWU3lacmJJUHQ0M3VKb0FjaDhvSDhkNXgrUWZt?=
 =?utf-8?B?dzVpTElvRVA4ZE5zb1RZUENrbDl3MkZnT2M0TnpJeGVSeTBTMm0wRnZva001?=
 =?utf-8?B?NTRSRmRra285aEtIYmNwM0VYRmtublFKY2NVWkJPQUxVMXZ2dUtLeGd5R3Vw?=
 =?utf-8?B?a2lGMm1JWG5ULzJzNDNFSjQ1VlNyeGd6YUJDekhmbGV2TngxQVJpZGNrRWc5?=
 =?utf-8?B?dE9mRzNZcWtHYXRpaExnYm1JZUNoMllrVjFmcWg0dkx0bUNueW5QZUtDRFRB?=
 =?utf-8?B?aWQwWVVzNG92WjVzVm1WSlk4bE5MSXovbEFtdFJqWHhIdWtXTFYwRXZEN3ND?=
 =?utf-8?B?K0tHaXEvZm5uYTljbXJ0Wm8xTHRpcWJ0UVl5OTBKU0J0Y214L0xQVUJjUUEx?=
 =?utf-8?B?S3B4ajloZTJ3MWtRSkg0eFBLL3h3L25ZK3VpK0JyaTJ2Y0xySjdrL2d3cDJJ?=
 =?utf-8?B?dUkrSk5KL2R3SzN0c0NZWmw5YWJIUExwVTQ5UVZrQ25zeEJ1MEtVcm85bEk3?=
 =?utf-8?B?UXl0Um55QTdzQWJ3NThvdzk1R0ZydzVFNFJuY2JCZktQaVk1RmloMHVaNC96?=
 =?utf-8?B?MGFYMkg3YnoreEtJTGNRanUwTjh1QWh5V0JYOVpsbmNtN0dDRWZieFFqbDFZ?=
 =?utf-8?B?Q0RNR3pob3o3OXc3eUQyQ1h2RU11aERvYlVwTnFweWJ4QjJ6ZnJWVVpJSGls?=
 =?utf-8?B?QlZhcVdMS1FBVmpQU2RaVmlIRlA3bThhc0pOTGhVUDU0ZEdUSExJWi9jN0tQ?=
 =?utf-8?B?R2NadTUyZFVqa1VTb0pNOWdVeDRqckg0MjlKQVdublkwb0ZWcWFWcyt4Sm9B?=
 =?utf-8?B?Q0RYMU5nd29Qa2YrdVJCaS81ZFk3YzlwRThSSW5LL0VjK1ZjOHE0T1hJRDhR?=
 =?utf-8?B?bmpvVm9ueVVqNzRkeXp1elRuUTR0UUlEdys2cERUWmZ1M25YMFNYNGNHbEhq?=
 =?utf-8?B?azZidzZDd1YxRDlWQ01tZ25aTjJDSEl4RDVCV2x4UEIxbm5ZNXg5VE5ZcWhm?=
 =?utf-8?B?TU0yNFNhRUhCSENoR2k4Qy9Yc2d4N1dxT3V3ODg0UUhwQ1ppOThuRHlwZEow?=
 =?utf-8?B?dFdINTNVL3ZLV205QlEwTGF0dWU2aXUrSUpqdnUvd1RtSVg2a2xNKzAzallY?=
 =?utf-8?B?eFJHK3JkbkxiNFIzaXlNa2tGRFdmdmxUNk5EY3IrZ0Z4WE9yRlJtMnNZRTNy?=
 =?utf-8?B?WEVla1FMbzB4cnZuT1N3aEFwZkFQQlBjZ1dvMWVpL1BSTDd6NUtnNThON0d1?=
 =?utf-8?B?L3JhTk1BNS9VNWovSHFVNkdwVmdmWS9vSDR3T1B1QVZFZlgrOS8rcTZqa09x?=
 =?utf-8?B?VlJOOHFyYVlNZDdWZTJoU3FVREEyRGFUNnB4NUNZa1JpbTljenlTajZveHlk?=
 =?utf-8?B?WFF5TjN1WGR1dWplWERaT0hYTWE5YUxERWkxYS9uYzBrWk9JK1Fxek04dVNM?=
 =?utf-8?B?cXNvZWRNVGhNejlHek1pWDN4TDFVSUMwUHhFaUpxT1JPWjdXZmxMZDlCbi92?=
 =?utf-8?B?dWs3NXF5Z0FaVjJKUWdsVDlNQnZuRFU0WTJBd1YybXJYdFRvWXIrdkdCSm0r?=
 =?utf-8?B?ZjNaaTNVZmdaRTBibkhjTUMxOXBrUHhycmdnRFd2RThSM2NyNnVqYnd2Q21D?=
 =?utf-8?B?Yk84RW5vYlJ5V3ZQRWtZQjNQakUwU2VtSnA0RVdtZXcraUpaRjZ3UUpRb1Vu?=
 =?utf-8?B?NDdVYm04S3pJdzVsdHdpckpmUmF3ODRCTFdlZHVQYjFYZ3FTbnV6QUR2UURr?=
 =?utf-8?B?M3crWEtWR1Fhc3VkU3VqVUUzdW1sVVZ3V3Q2RGVKK0tsUkFWZnprQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4d5274-b21e-4efc-1a43-08de4336974a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 21:51:28.0334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASUIDv2XNMtyUvcsXBhJfl/ND3Owd9u26ViLdcU2sP8uWh+XiTjBCJ9qO4KTufMcQPGQHU3yFy8FXDNkrs6VblKNudBc+QofoVEWuwddSes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB7006

On 24/12/2025 8:33 pm, Andrew Cooper wrote:
> On 24/12/2025 7:40 pm, Roger Pau Monne wrote:
>> The coloring allocator ignores claims, reject the usage of the hypercall if
> Minor grammar nit.  You want a semicolon here rather than a comma.
>
>> LLC coloring is enabled.  Note that the usage of alloc_color_heap_page() is
>> selected at boot time, and it's a system wide decision.  Once enabled all
>> domains will use alloc_color_heap_page() for allocations, which ignores any
>> outstanding claims.
>>
>> The hypercall can be enabled if/when LLC coloring is adjusted to support
>> claims.
>>
>> Fixes: 95debe51a936 ("xen: add cache coloring allocator for domains")
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

With whatever config I've got lying around, this doesn't compile.  It needs

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3d978227276a..10becf7c1f4c 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -16,6 +16,7 @@
 #include <xen/iocap.h>
 #include <xen/ioreq.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/mem_access.h>
 #include <xen/mm.h>
 #include <xen/numa.h>

added.

~Andrew

