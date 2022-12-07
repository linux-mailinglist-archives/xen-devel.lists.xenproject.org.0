Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC164556F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 09:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456008.713670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2poI-000583-Fn; Wed, 07 Dec 2022 08:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456008.713670; Wed, 07 Dec 2022 08:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2poI-00055C-Ca; Wed, 07 Dec 2022 08:29:46 +0000
Received: by outflank-mailman (input) for mailman id 456008;
 Wed, 07 Dec 2022 08:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2poH-00054y-4j
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 08:29:45 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b002deb-7609-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 09:29:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 08:29:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 08:29:36 +0000
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
X-Inumbo-ID: 4b002deb-7609-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqySMr5ka049nBWue1VKIE+apXEJKquYh69bIHLrPTUyW9DPxG/bKVNmdVwplDqnDf2pEQGCo52LUjQaM0dgic0m6JZW3ORca5G2WKAORkM/HR+Uk8aJEu9qpABOk1al+jHypH/J4b/Ksfk3/dyh5WN3dBdfaSDBz+WepaKFwtwcC01P8Bsf8nTg/UcvZtQQGHlqxZ8iUaZX7aT06OXcxV44PbfgPJOHVmIyV2N7dn6xLmx8tC9yFPQaVmaRMWeLNC0ristPGjsvmbf4hevOdzabYZIMf9VQx61ycTmG/z+POTBEi74Ht2qBDL+dBtIv9g3I85S1dclv04syKs9YEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4BBpC1Rz+JerOJ/aGsEdT3EPUunWupe+T0vKq4CyTI=;
 b=dEwlU/5m/OX0D8BZWJbGVOHTDJydnje5GKrH55hZGSg53BAXvmnKnjMf28Vkt0BPAOluilf2raWDOtbT4HgaizSRI1KDOXxGz9zugLOdKN4TmieVGEvrvu6Tx2BM8IiIbRFqQYHHx6ePw8NdIq2FLWFbG+3yDs4XKopflaAuMgwCMFirRoU2fQ/A42elyFAzzJm5Pey/BuH+6kylSrSD8bqqR64GAx0cV962D/EfY8GPAKrkXp2EwFpGgbVuwP3p/lbDs2oOoqjSkGnRdi89ABcqqFewqOgIetqRtonwUfQMBvIuQ6LA+CZV4fZQ+P6CLGDzm5d2JvxGGxiUwGUpGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4BBpC1Rz+JerOJ/aGsEdT3EPUunWupe+T0vKq4CyTI=;
 b=GBqsJRl97Ktp2UkDqAH7vniXwNoRdG+JlpQZXpIgLZgjnZXZAaMo3VvHKb5wEziSO88/0DI7vq79UGQ3MVG4xvh7kgpUSlXeku/tcd17D1DMKSnPRl2E6B8FO/ma2ga+9oBxZGf/W0vuMzEUgvcN8buLIZzMYc+ZIwFP6JPUn+noaUSHWgsLVGw3vSF8bZKBEuJ9TErVR67xVCp+7vYyOpwGh9RCTyS8k3sjSgwkLk5+57R16mfreJteeXZl1l9LbzV0YmM76DtXD0OhlbqVHpdVwmxEwIH1PF00cqTAM6onhvJubo+7E5bYbFtFrEliK4ON8C1gNT4YtBPuH+sBBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d811bc39-6de8-5365-8d7e-e81f35eaf652@suse.com>
Date: Wed, 7 Dec 2022 09:29:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
 <c8f79867-42b3-a23f-6fe0-de8b698c6b0c@suse.com>
 <ceb28c2f-d4c6-3190-ea84-d6f7c9acb4ad@xen.org>
 <d8ba56a3-3b3f-788c-620e-823d4e2e38ea@suse.com>
 <7a66f7f3-174d-a9ce-ff5a-582de82843fb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7a66f7f3-174d-a9ce-ff5a-582de82843fb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 7437ccfe-bee9-43d3-8954-08dad82d2c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y8vywOUyBK6305aLxI1O1iTNXCUv4m4Em3oO4bPA0WjYBxLj/vvHe31LY9pGPofHgKQz+F+G48ADEojQ8JHlBrJgFcRviyeiW2IiWcl1ndWBSSvP1VWogjZRqePr98YPvw59Jt8tcBPyK7fNxmMMv1RzekMJxYMue+0bjzEaK1pOHg77ZhHR0mTszLcxA3h8iT2YlYuT+wTJVcFeDcdTLYAeZMwJZ5YCUSPKv5SNQB/C2PIu06rZ/aqo04QDlqucTpinSTHlDii83ACXXJi4R7hJXnByLbQR7nBBQUW5B14c8TJ8HvP3Xb7hIJbRVEPtcaxeVmehG5/zAMgfifCrEKgHTdR6/mQfoagsxn3szlWP/DINN/4S1OVHwgjT9QHEL0jeJlbL5GDnBC48cGq+3wJc9GGONd9oA7YNq9FkmcuynhxQrGK8Bv0JjzpaYYPRotzXpDb7LffBG93vJAH7Qd9RkHwC4jXD0acHyL6oVn4C7V5OPYC8RVIjwG/uFTN6YBr0qCwyhe0rmpcSIh/mArsp1fTFPgq6H0AGzXHbrYtlntOQYsKrQHv/ipZbwFK0MMQrIdujRAjZ1Kjo2L8PBtyufP3BAPZxxF+cOjGycDU6Mz4Lx6FjWKwem2QBTtsXvhvdquiNP7w6d/JEp1kkzWUZQkHVG/vCHtf0+y+ljYm7pM+kUE86a6nM1fKJj4IbXYtonFS7+ZJLOiQ3VzTaLg2FSXfpGjhp6iisJlxpe/w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199015)(6486002)(6506007)(478600001)(66899015)(6512007)(53546011)(26005)(316002)(66476007)(6916009)(54906003)(66556008)(8676002)(4326008)(66946007)(186003)(83380400001)(2906002)(38100700002)(41300700001)(2616005)(5660300002)(86362001)(31696002)(31686004)(36756003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTNNUUswb1BSaitZQlN3dkJwc0dhM0U4WDdwTi83clRFaC9GeHNSRU5QVnV3?=
 =?utf-8?B?clgvaUVDb1ZIRUdHR0ZIeG93cHhPTHNlNlZ5N1RQejQ2QStWOUd5anNpRFFI?=
 =?utf-8?B?bDBBSGw3ZWEzZTR6THhydEpRbHI3UVl2bDZuaVVzU3o1dU5wZ3d5bklCOUtY?=
 =?utf-8?B?SVlzN3lLNFRvM3NSNVdwdGxvbmNiak92bkFsc3lYV2FWeWVUNlBkeCtDQnRC?=
 =?utf-8?B?c0IyVUcvS3l2WVlYTWhnQk04MWVyTDJoSGpRZ3V4TTJwdGhTTS9qVEQ5WGVZ?=
 =?utf-8?B?QUpPUnc0ZHRoZXNxY0FHMUZFdHp4OEJab1JQWG5qNGZtZFg5UWpqUWsrYlRH?=
 =?utf-8?B?T1RvZ012ajZCOHp4aDZZMEFPNUhoZWorKzNEZ2FIWHVqR3VkTWJLSWpwOXZS?=
 =?utf-8?B?NUxYaExaNHJ5TWhjbThVZFFIVEtEVEttTmZyYzVFT0VWRmFERXZ2OWhkRS9k?=
 =?utf-8?B?SnUvK1MvZnJyUUdBU1hYaFZwK01JNE1iVGVEVGRrNCtJaDJWTXdtdGw3ekNq?=
 =?utf-8?B?cmtkakgzK21iR1BpcW5KNi9QcXNqUnF1MllDZThGZVRoMFp6dkNLQ05oYUxY?=
 =?utf-8?B?cHpMRFkvRnpKdVNIRnFiQSt6UnI3UnRMT1pkWU9FdUI0bE1FMGswSWd2bkdu?=
 =?utf-8?B?NUNheTRESnJnMk1FL1BTc3VNTTVjNjBpNGdCOGVsV3VBNmNkR21OMTRqWDBD?=
 =?utf-8?B?LzlhV3JPTmlkRUpVT3p4Yk1WMmswZmo3MDJ6bVZkS3V2YXdEb1JWcTNBbUNl?=
 =?utf-8?B?eXhmd1p1VGpsU3crNVZMQjVWN1MrTmhmaDN2Y0c2c3lBRFE0WHBtN3VZRk54?=
 =?utf-8?B?ckxOUWtOV3QvMUhwOThoaFNtcXRKRUN0L3dlNkRVZkJzZ3FRKy9IMDBwNjBX?=
 =?utf-8?B?c2FzSCt5UlVodWJkUC9NWXJ5OGlOY3dvVytGcTdhc0xBTzBuR2dHRVhIZkhN?=
 =?utf-8?B?OVNaU3VWQUZTV0dLbWJZL3JlSE1paGlFZE0zN1hyOExqZldES0gwa3NEU0FE?=
 =?utf-8?B?Z3ZCckV0MzI4RnJrYStHbnNhb0twbS85M3FNays5ZEJ6Q1YraVpieGlqd2k0?=
 =?utf-8?B?UEN5NkdCUVl3OGlVb2phMGJ5S25iUVlKRHRONTJoYW96SXVIS1pubUYwb0Q2?=
 =?utf-8?B?MEhZb0w1MVlJMm1MM2ZnQUFpNFRsVlg3Z0J6dFd1YnUzTW1RVDQ0V3VLbzNU?=
 =?utf-8?B?ZzNSYWo1RlhQN3JLQXoyakNPaFF5QnB2dlFtL3RkZHlYRkI1NGxpRzlseU9r?=
 =?utf-8?B?NXJ4MWpmY3MzdzNKSFJEQzBDOTdkYk84NTNDQzIyT1g3bSs4bFhTNUQxNzhn?=
 =?utf-8?B?OWo1cXJUdGFsekxLL25xWU5Xd3N5UThhT25xbDEwTllSdzVwRXlqL2JOdkZw?=
 =?utf-8?B?QlpobUJWeW44bHpMRXJ4K2I3OUQwYmttNkJ1TFBEeExSYm9LREt6REpta2J4?=
 =?utf-8?B?NXhzck1yRHUzNmdYWlZ6aHd3R2dmemtrVGhEajk1T0pCV0cvUXRLalBTWG5t?=
 =?utf-8?B?eGFiZHBuQUdRQTl1Qk9tMTl3bEYwMXVUMFk2U016STFxYTJuVml6SENLam53?=
 =?utf-8?B?Vyt2YkcxSGtvQ2xCQWVQWHNsR2ZOY3R2M1hEOFg2L04xZjhQb204dTB0MlFW?=
 =?utf-8?B?VEN2Y1Y4ZEFucnl4b2VZSzB5WkYxVEFpck8zREw3YU51VTVRaVZlb0hORUZB?=
 =?utf-8?B?eXV1cW5CRjZZL3dPamlId3BXVXUvNjNQYUwyc2xGNGNFOWE4Z01ES2VRSG5V?=
 =?utf-8?B?TzZzWkJmNHdKc1JWbDVyVGpJZ1MwSXN1Ujd0VE53RDhqek5qeWhmQjlUU1R6?=
 =?utf-8?B?WTN3cXlYYWlqVDlQYUZmeHJEZUVMUjNxMnBXbXd6anVyRE1oa05STDk5Uk9L?=
 =?utf-8?B?cnZGM0lPZlpYd0QrRGZod1JweDh0djZuRWE2RXlFSXhwdzh3R2lmRWdadDZt?=
 =?utf-8?B?VEpTZURwWHR5d0R3elZqeGd2LzBUK3c2LzJnYzJlMmxsck9tS1cwRnBVbytH?=
 =?utf-8?B?bG9sTlNqdDV6Q0JtM25TS1RqV0c0SDhGd0pGek50UkV0ZnNEYjF4cEJXYWtK?=
 =?utf-8?B?SytnZkF3c2c4T0lwbFdpN3A0RTVJQWZJeUtzcURkTk1NcUJpbHNiNjE4cnBI?=
 =?utf-8?Q?RBs14FPU4h14178aGcOD+Ucef?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7437ccfe-bee9-43d3-8954-08dad82d2c88
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 08:29:36.0182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7gvHn66JbP2EvllAKv0nZ//40AsV+lqiRAE8dAdDq9ghL2WZWS+ESq0DVt58DXxv71pyv7mWWBVqqnJsmnfig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9452

On 06.12.2022 19:27, Julien Grall wrote:
> On 29/11/2022 14:02, Jan Beulich wrote:
>> On 29.11.2022 09:40, Julien Grall wrote:
>>> On 28/11/2022 10:01, Jan Beulich wrote:
>>>> On 24.11.2022 22:29, Julien Grall wrote:
>>>>> On 19/10/2022 09:43, Jan Beulich wrote:
>>>>>> --- a/xen/common/domain.c
>>>>>> +++ b/xen/common/domain.c
>>>>>> @@ -1563,7 +1563,82 @@ int map_guest_area(struct vcpu *v, paddr
>>>>>>                        struct guest_area *area,
>>>>>>                        void (*populate)(void *dst, struct vcpu *v))
>>>>>>     {
>>>>>> -    return -EOPNOTSUPP;
>>>>>> +    struct domain *currd = v->domain;
>>>>>> +    void *map = NULL;
>>>>>> +    struct page_info *pg = NULL;
>>>>>> +    int rc = 0;
>>>>>> +
>>>>>> +    if ( gaddr )
>>>>>
>>>>> 0 is technically a valid (guest) physical address on Arm.
>>>>
>>>> I guess it is everywhere; it certainly also is on x86. While perhaps a
>>>> little unfortunate in ordering, the public header changes coming only
>>>> in the following patches was the best way I could think of to split
>>>> this work into reasonable size pieces. There the special meaning of 0
>>>> is clearly documented. And I don't really see it as a meaningful
>>>> limitation to not allow guests to register such areas at address zero.
>>> I would expect an OS to allocate the region using the generic physical
>>> allocator. This allocator may decide that '0' is a valid address and
>>> return it.
>>>
>>> So I think your approach could potentially complicate the OS
>>> implementation. I think it would be better to use an all Fs value as
>>> this cannot be valid for this hypercall (we require at least 4-byte
>>> alignment).
>>
>> Valid point, yet my avoiding of an all-Fs value was specifically with
>> compat callers in mind - the values would be different for these and
>> native ones, which would make the check more clumsy (otherwise it
>> could simply be "if ( ~gaddr )").
> 
> Ah I forgot about compat. How about converting the 32-bit Fs to a 64-bit 
> Fs in the compat code?
> 
> This will avoid to add restriction in the hypercall interface just 
> because of compat.

Possible, but ugly: Since we're using the uint64_t field of the interface
structure, no translation is presently necessary for
VCPUOP_register_vcpu_time_phys_area (we do have the layer for
VCPUOP_register_runstate_phys_area, because of the size of the pointed
to area being different). Hence what you ask for would mean adding compat
code somewhere. In which case we could as well make the above check
itself depend on whether we're dealing with a compat domain. Which is
what I've named "clumsy" above; still that would seem better to me than
to add actual compat translation code.

Then again, looking at the last patch, switching to what you suggest
would (largely) address one of the RFC remarks there as well. So I guess
I'll make the change to that if() plus associated adjustments elsewhere
(in particular in the last patch there is a similar check which needs to
remain in sync).

Jan

