Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E487C90103
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 20:50:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174360.1499305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOhzx-0006qu-LP; Thu, 27 Nov 2025 19:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174360.1499305; Thu, 27 Nov 2025 19:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOhzx-0006ol-I0; Thu, 27 Nov 2025 19:49:49 +0000
Received: by outflank-mailman (input) for mailman id 1174360;
 Thu, 27 Nov 2025 19:49:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOhzw-0006of-Qa
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 19:49:48 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 377ba2af-cbca-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 20:49:43 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5304.namprd03.prod.outlook.com (2603:10b6:610:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 19:49:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 19:49:39 +0000
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
X-Inumbo-ID: 377ba2af-cbca-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrhEKVAt3d38/wCaHxyO5dpEU9M1DJkhrcTBh/p+4sPqQCtZdtdRL4oxhD3pwoMC0R3Nxj23+LgmGH7Kb6n2iG9d6XwBkGHgXGtUt5/tV4KLugF/CDw8PrvG6ML2yeb8H6jkb/WdXB4UiSNJ1PyvLg+J4yEcj2ZMf6nBGVABxDjUtNIPVX6dCWRCKQUUyxj25Hps+ioY71iCZoj78kpY4lb35GNNf5WeSacHl0dv+OnE/oEook3blFIp+24bSync3bAw9oEjXvPrTDx6aadQBTrAm9vcq2imdQ3m0tI0vwN5nAic/9dlXSw/Z2Skt45hcjR1iJnp3zfBxtS+sOdK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5KTJT6qeEcqQDufjR8tLfzcjQLPnA66jpBFH7oofzI=;
 b=VUZG5EkxjkJ2I30/CKDEjSuThr9qb8EYWJoX73jwxNJVLu8E6cZeWKCCq+HPMUtbu9IGypaFudqfZsXxoZ625TeBWTohj6vN4pHK34Oxtz3kfBHfWlbbOZRPr9B7d2MWNul7jPEUjSSqo0fN2+A1oiNswKgyFIs+8KaIyJTnAmsieyhsqKbrf7+ev5oHWgat5P9U4ey1txKIzCiXjVKcMcbwtgcPeBmUtsE/TksqVi9prmiVx+GrzSfmr3zgmX88CAqGZmxqaCv1a1tA1QKPuS1VxWKGUBjPgF1oFFMnH5LIc810y22VrDlnqOasZvdt9SDrE+DatGFmDGG8CTiERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5KTJT6qeEcqQDufjR8tLfzcjQLPnA66jpBFH7oofzI=;
 b=bFgBkNO/a12cCEhNGR5nX+ySlUktpE+1WTpqM6ULvLie4gSFIODlZLN30WwquSXg1h4nm2ziy4Ywoup5uGbVpiKGJiDOsmzziHlrSkeo2c7AeyZTSZHKsGIO7/a5Yk401LoV2xZXTlfMN2f6hjxNPKZpHztHMiX9AmQH55La2Tk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0235ecb0-20aa-4c18-a172-0e48c13d00b9@citrix.com>
Date: Thu, 27 Nov 2025 19:49:36 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
Subject: Re: [RFC PATCH 0/4] x86/p2m: Some P2M refactoring
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1764248710.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cover.1764248710.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a04948-ff83-49af-6025-08de2dee1a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THRWdGowVVdLbUhVU2NjdHhtUmpzenZDcmxWV3p4a0RlQ1YxVElSRWRQb2Rx?=
 =?utf-8?B?Nk1JVzZ0YkJZTHdTMFE3OVVzYURDcUtjK2YvVSs0Zzc5OGk5ejlFdGY2UVRD?=
 =?utf-8?B?K3RobFkvMkJCRGpKS1NOY0VLWTF5aHg5eStkUnNFdTVGZFBTSXA1RktadmE3?=
 =?utf-8?B?OVhoMWIwUWJEajJLcFo2c3k5Wm5aWm80MmJrMjArM2plSkppSnBlVUtnSG9S?=
 =?utf-8?B?a0JqUktKdTJKdzdsT2hJbWNhSmRvVmYvOE9lRTNpZSsrZ2dmYldVWGJYakxw?=
 =?utf-8?B?Uzlqa0p1cGZlRXZDb0N4bGJsSnpBVERQaThpSlFidVpsQ1dMZm0zL1BESENR?=
 =?utf-8?B?TjBoeWxPVkRoNzVmd3l0SWlBRnZxU3FnYmk2aW14RWRLZ3pwZW9Sem81VXBT?=
 =?utf-8?B?WEhrOVFNdktHRlhBVDhpTWw5ZjcyUUVMajdnZDdyTVdzeUZKVk1SVlRlYytW?=
 =?utf-8?B?Q1YvLzAyRWxPeG5VRjJkSGRPS3dvRU1BZDlLVStCSnE1MmJDQWtscUtURTdx?=
 =?utf-8?B?WlkzbTBlbkZwZDk5R3d1TXRzTEQ5NGpaOWd2aU5LTUFseFIxQWY0TkNvZ3F1?=
 =?utf-8?B?a0xqblYzMktMVzJhUWpMNEJ5b3VobCt4c0g5TTBEMmpKb3FYeVY2d0crc0RU?=
 =?utf-8?B?aHF2SUJBbW5PNDI2UDJlbXJHNmhvaVpKSG02ekhTd3JnSTBjMGxQLzUzbGRN?=
 =?utf-8?B?eUJBVUQ5dXBNTjJwKy83LzhYOXRyVDIwN0phUFdlWGI3dkNtYk52VWFsQ01M?=
 =?utf-8?B?VnVjQkNucU93V1BhZG0zUGRoWmV2eC9FcEk4YkNxclFOdVUwMjVXYzJVQ2xS?=
 =?utf-8?B?WElSUUdrb2d4OGp4S2pRYmpnT1ZPa2lzdVdEMVI1RUhqYW53emo1R3FRaTVU?=
 =?utf-8?B?dStDNmVZbUd0ejQzWFgxcXlKSGZsSWJ5SFkwQ3o3YUhlbjhhS1ZSR1RXRCtW?=
 =?utf-8?B?MzRLaFF2V3EyL0kvOWRtVWEvbEhZR2pSa3RzWnNxaWxuVmI0cEw3REtjV2FK?=
 =?utf-8?B?TkpPVzJpTHM3TjMzWTVNQ0RESy80VWNZYjhLNG9scFVxRGxiY2RDaXNYS3Jp?=
 =?utf-8?B?QjhBTGZTMjVRWnBCdEJ0bCsyWTNFU3Jwbi81UWVXZFVrd2ttUjZ6aDkzYzQv?=
 =?utf-8?B?M0xWQkNkSWt5cFRIMGwwWW1IMCs1WXJoOG5xNkx6aHZ5ZVp5ZnRiS0dPbUtL?=
 =?utf-8?B?Z0JYZUpDa002VlVROUZuRjlUZ3dBYlN2YTZjZlVhbDM3Rk1wbVFFUW9pcXRP?=
 =?utf-8?B?bDZxNTYzSjlFaTdyYUY5UmI5RW1JU2ZmcHp1ZEU3bmJPQnBvWG5VSTdTSGZ3?=
 =?utf-8?B?RGtUekJHSm4wU0xMVTBMYktWZUpja01ma3ZlUGk5UzhoVXpjS2JmQUtDY1ZF?=
 =?utf-8?B?KytMb2tvY0tMaXpEakE0V0ZuMTNZVjBBVXFzbEFOYUhkbjFIUU5aQXhlYlpM?=
 =?utf-8?B?Z241eXE4TWcrRjJtM3J1VmN0QVhaTUZzbHQxa2gxdjdidkNqZE9rbnlCOVRm?=
 =?utf-8?B?M3R0bzFqWVA1ZVpidGFLSUZiN1hmY0pnaTZPNEZhZng3b2g0S1NmME1jUU5X?=
 =?utf-8?B?WkJWRUtwRksvcmtiNGl5VnRUeWNycG14dU9HZFRuRldFYytLVkVrUmpzejhE?=
 =?utf-8?B?VFhwNm44dndiRlNNdzVQL3JPUkZ4WjVGUWJUa1M1TmRLMDVqajM5ZjBkdnl2?=
 =?utf-8?B?OUkydVVvWDlWcUpsWU8rM01oOFgzYVU2bms5SUw0dEpSWGxKdHBuVUY0aFd4?=
 =?utf-8?B?REtnK0xNZUF3MW1LcFpoYmN5OHl2cHRqVjdxUzZoM1RWNVVmQmRRb3A2UEhF?=
 =?utf-8?B?ODUrcXBBUmtPeTNNclZWTHJIVm91MFBlaURMSzRMU2NMN1JpZ0xhQ1l4aHJm?=
 =?utf-8?B?azhiTmtGRllyS0FvaUdhZVh3YVYwNy95QXJUN2ZQNkFJaUlqNlpieVV1MU45?=
 =?utf-8?Q?xI8lLkfMXvsEpBO+qp1drausHUg2E9+H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlhxWitrZHVqSloyQitYL0xFMWs3bHJZVDBkRWFnMlFOU1FJc1Fma1NUM0E2?=
 =?utf-8?B?WndCYXB0SFhDSW9ZNFlFQXBGaVp1L3ZDNFkwOU5vUDNkdGQ0M0E2RW1rRUho?=
 =?utf-8?B?NzgzcFpSZE9UR2xHdUE3cG1BdUExWmVlNWtBMG5DMU1GdUxTU1BwdFk1UzN6?=
 =?utf-8?B?Y2NORjdYTklXMm5DVWpKRHl0bnJjMldwOEc1YzZicFVXY3lRenpGeS9Wa2E3?=
 =?utf-8?B?bnVleXdZb3NnbEptanFBMmdWbnd0blIxc3JyYTlERFREOEdaUCtrZm1STUZB?=
 =?utf-8?B?dmdMZWZnQks3VndKL3RtNFMwY3hEWXBONEtVOVBjczNpRDVISGIrQWt6cXpq?=
 =?utf-8?B?Q29CK1N2VjNWa3E1VGZmdjY1ZGIvZnc2UTVrc2l6by9rYkFzSVNxMW9UUy9R?=
 =?utf-8?B?OHNTZW1YM2RnL1BaRUt2UXpjbFZzNnFwekF2ZDlHN3JxUmdlVGEzSENLeGhv?=
 =?utf-8?B?ajc1Q0owQ25hVlIycFkxZE1IOGJkZmFIZjQ1V044NkFaNlFVZkQyalRnb1Mr?=
 =?utf-8?B?R0kvZTBuUmxnTTdRaUliTHFTcGxUUkxjUVIxZllMb0gySXlKckNWMnJUWHhR?=
 =?utf-8?B?VUJvMXA2NHFOWnhiRHhnM3Z3Sm0va0NlYlBTd1ZRVzFJNGIzdk5MS3BXaWVV?=
 =?utf-8?B?TFI1T0FKcmYzOVo5WlRieDhwdXFVT0RqcFIwNW9ITDlITjNwb3ZCWUdlN0tD?=
 =?utf-8?B?bXljWXNIRWFYQlJOUTE0dHRua1F2ZlR3RDNzTGRYV1hVVVF3VjFCWnNWaDFl?=
 =?utf-8?B?Zk5vS1ZTK2F2Ukg3MjdlcUltbkh3M2N2OXBTMHMvNlQwc2NqeFhJZGNacHdS?=
 =?utf-8?B?NjZ0L0JzZHRiL1NHVzBhRUdCTTBLMUVlaTZLc05yN3UrQTROV0doeVRKUDZo?=
 =?utf-8?B?K1E0a0UyMnhZSXdlbi9aWE95UzNlNHp2c3dLbDdmMTY2dytySHlhZUdBZ1NH?=
 =?utf-8?B?STlJc0Q0Z1QwUS9wWHBJbnBETlN4VHFqYWtCTVhBVmw1YmJkMzFOZHVQYUUx?=
 =?utf-8?B?cmJQd242ZytWZlVqV080K2Q2eERTZGNLNUpnYlpBQ1dpYkdiTnpkTmptZ3J5?=
 =?utf-8?B?NTJxYzZVTFI3RllLNnh3V1lhYnFlZDhOZDB2QnNzREZPZFZzOVVzOHNzRVgw?=
 =?utf-8?B?ODVHcytBT1NlL3ZpejdRODlTMWFwT3JDM3kyUW9ScmZZNGRudHFROUJmQVYw?=
 =?utf-8?B?NGlaZkZkaUZpQWRrS2xJT3gySlVmSXZrZVh4RjNBSG5OSWMwYzMzSFoxM2Uw?=
 =?utf-8?B?a2FkbTlGaitjdU50UVFVOFJMYitBM1U0Y1JNNEdubEJlWVgvQ0ROMHhVZCtw?=
 =?utf-8?B?OW1IRHByV3R4eXRMNzc4K2dzR1hZYTdneEdscmp4bjZBUktQVThJYmZ3N1ls?=
 =?utf-8?B?dkJEdEtSN05zRmNsWVdwRHAyRFhoeXNEM2pLVWFmaG15S1hxVldxeEs0QmRh?=
 =?utf-8?B?VUV4YVprakVDTUUzenJUZW1jeGIxWWFUUUlqMzJJNFdBQk1aL1hpa1M2NUFD?=
 =?utf-8?B?Ukt1bnZWS3BhRkJxaGhxUks0d0FWdW5EUTlaaDBSRUJvNW1NQys2K3FBVE0x?=
 =?utf-8?B?a2c3T0hoT1NEZVZKalB6NWg1alNSTVdCZVNpR28yREwzR3JNWWEvbk9sckk1?=
 =?utf-8?B?Ykl5bldCbGVEdlpsVWZOdlRwQUcrT1BHOFRhRDZxdVJFR2pndVMxcm9taEU5?=
 =?utf-8?B?eURRdDFhRmVVa1BSOHN1R2tBaFRiRVVrcUZ2NFA3SUFVMmZsVDNPOVovRlVY?=
 =?utf-8?B?TzhVb2oveUp4VzJTTkRoYWJ1dmNBQ0dxaVRiNEtCbnlFdEVSSVFjbVhmZi8w?=
 =?utf-8?B?VE9wQXJQZkc0dmFHSkRiaHJjY1NpanJyZFA5UlJaL282dlBmNXIwNWF4M3Bm?=
 =?utf-8?B?ZjlDR1IyMDFoL25EbGZUT05RQkllNXZNOEZTbjhpajRGOUltMTFSeVZSY2tr?=
 =?utf-8?B?YjZBZWIyM0dvQVFrZ29UKy91SlRFVHQ3RUI2cjNGL3pnZTNEdVVSU0c5aVpV?=
 =?utf-8?B?YjlpMURNNEJvd1JIYlJIYzRYWTN2QjJZNlZJbHg4eTFXVnRHc2IwNTBrTCtZ?=
 =?utf-8?B?UHk1alJ6eDlGTDZlb1kwUjhoYWg1enZwRHpTMmM0ZnEwQmVrZ1lxTTY0L2F3?=
 =?utf-8?B?Q1QxekYxZWM0S3cwR29lbTQzdUN3NWV4cDN5N0piQnByeElvN0pxVmVjcVNK?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a04948-ff83-49af-6025-08de2dee1a11
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 19:49:39.6804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9eIFMwqfT72H+pgxzklcK+JnofHi2mXrnebdYmtNxjTfyy/ZPZoYDxbrqAud75ZgHlCkFTb8MeRTMsWM5vBRU153vkS6rvah4FWe3GycP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5304

On 27/11/2025 1:39 pm, Teddy Astie wrote:
> First patch removes a shadow mode check in a function that can't be
> called with shadow mode (only called with EPT hence HAP).
>
> 3 other patches drops guest_tlb_flush_mask by removing all its users :
> in the shadow paging case by migrating it a shadow variant of it and
> in the hap case by moving it to p2m->flush_tlb logic.
>
> One of the goal is to prepare adding HAP-specific optimizations to TLB
> flushing code without risking regressions in the shadow paging code.

You need a clearer background to try and explain the changes.  I've
discussed some of it with you, but it needs describing here for everyone
else.

From memory, encrypted AMD VMs cannot use "asid++" to flush TLBs, and
must used VMCB->tlb_ctrl instead.

On top of that, Xen does not have a correct abstraction for "flush guest
VA space" vs "flush guest PA space" vs "flush Xen's mappings of guest VA
space".  This comes about because of the shadow code originally had all
3 things together, and HAP didn't clean this up when the need first arose.

This causes over-flushing (Tamas found and reported this on Intel), and
FLUSH_HVM_ASID_CORE isn't an adequate abstraction either.


All of that said, it would help to have a sketch of what you want the
logic to look like in the end.

"flush guest VA space" and "flush guest PA space" originate from
different actions.  VA flushes always from emulation of a guest action,
whereas PA flushes originate from modifications to the P2M.  When shadow
is in use, both of these escalate into a full local flush because of
Xen's use of shadow linear mappings, but this escalation should be
inside the shadow code, not the top level primitive.

Have I missed anything else?

~Andrew

