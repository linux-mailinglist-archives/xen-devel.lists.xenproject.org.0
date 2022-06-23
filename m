Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341CB557902
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 13:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354851.582178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LIv-0004GG-Ia; Thu, 23 Jun 2022 11:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354851.582178; Thu, 23 Jun 2022 11:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LIv-0004Cq-Eq; Thu, 23 Jun 2022 11:47:21 +0000
Received: by outflank-mailman (input) for mailman id 354851;
 Thu, 23 Jun 2022 11:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4LIt-0004Ck-Jn
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 11:47:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60063.outbound.protection.outlook.com [40.107.6.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b9e7471-f2ea-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 13:47:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8166.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 11:47:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 11:47:16 +0000
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
X-Inumbo-ID: 3b9e7471-f2ea-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llLr61od150z8QLEurreBm5PvY2U6s+PpYcrBXP2UNdUlmLYDq9IClSbFjiwrsGU2leV0RvoYHSlseYR13cUGM1dUty4bpG+kXUs13Ya7Dc0ygEA4okoHKY9EN/lHO/3oXnebglYCnvCy2ZI8T/d9rrDJT6AgiAvG8GIEq9X6kirtVSRqbFBm3zmDjyzSWH7YKYvW8E5gxaIReJUzvhOS1bOLDKiQjeSweOyYj+ojmitvUDOqgIkDEprzrnNI0Z8kM6Ip7FrI3txiDrF5c/2tnyTW2haxqrpVEt2oQJWR0GNWHSQz6z/VEslVN922+RgXSnNRTN3xCzv8Rk5271njA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BjUup+pWpLmGiOXVtu4EvW2I88EGKM/DoGMVSRMXMA=;
 b=GjnAjKH59BHNuf37Rhkyr0r42i/KOm1sAIImG1RMpYmIt78DXehgsa+wRm/vs+wuGm6aL7mKIQzzZFHMRD8T8gRfKAmcG51A3ZRNdbfGZg+f5tpdAkLPNC9cFReY2P/mO3pXowlNS53JeA8H98SKAlVssu5M5BJrF+nacxnfZgCMGOvpJHgpD6Tl6lhdq1qQQnY2St2SGbZq1d2RHy/bDNCwuCkEcEQWJo4AqeIyun410YUt9xVsXWgtkDdEpu3qsZeF8b7mhNUXPdZZ0iJ5RzVwkyYB4EeYYIVEMoz4BT9XBmlqpIC6RB0g6olaah/Z+wpYpz5bIk62wbBLpYLjxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BjUup+pWpLmGiOXVtu4EvW2I88EGKM/DoGMVSRMXMA=;
 b=nCNdIhMDiAtJ/huqNaj4ZLfqyrP7NXXIMs2wj2hBXTSg5z2s2iC7oS6DkaDSgsvXlfKnY0BqVz6eQNDBfqbNBxmZ0hWCHBq2TR3tFb3kOAB9Qt9bVFVFXnImxSTaU1pwa3GYcheFSdqLdLtLUuz8KgTqj0qtffk/1UmtJprAbB/2UleZav4crgRCyvrakp/VfLh+uQPzoGKCrwrlyFXgKAF8A3i87ztHpOxswUf9VKkbV6N2ehL49wpDMcZUKl0A2n/ipoDGzOCfO8sUtxN1tM7nPYjEAXlf7fxu5+7uiv4NOBYTgbGJmF6A+AKcLi2EqgeTeMQ7YOFp1stMmVfSZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6a07ee6-526f-6e6c-2abb-dc83eef22475@suse.com>
Date: Thu, 23 Jun 2022 13:47:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] x86: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <531ab7f7-ce5a-12b2-e7e7-528c26f9ff7f@suse.com>
 <22df182a-762d-711e-5191-d4b628904085@citrix.com>
 <44589528-2655-a949-0fd9-f30b6f2fa09d@suse.com>
In-Reply-To: <44589528-2655-a949-0fd9-f30b6f2fa09d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0062.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::39) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 511405dd-38e0-4c0c-3f6e-08da550e1eaf
X-MS-TrafficTypeDiagnostic: AS8PR04MB8166:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB81668CC8E813DF949EE0755AB3B59@AS8PR04MB8166.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wXfHuRCA6od9zTazyqLrkhIgpaInF9tuzCeQAgLT6WB08Pc+Dlpnry3R/ZKMEPgwW6o0B0be7XliPYuQHJICnoKcLuV+ZYJjyO9fGbifPIMtpcAXiOAsrI6uAazz2V6Sk2zCOXSLqtqWir1Dkik682PiU6NcDJvINZc9Vj37sA6ehq5n0Ydp9EKiEVnDZo+bEYDifO/7x34cLcCVtJe7isXy5vJghrn556WEHap4AGY4xwB19cZ95sq8ks5yWc6cWKSPARQaJi2P8oTXTfCMgfBsTB9JryTWVNXAO4UiexDXXtdGtjhGQz2CyKg0VspaDOctywNZ2UmGvSgQsgtqt3k6JGhj98MHLQ6Tco7NdPKkty2J5VYHIMa/1pdA8Ipv2xbBpht7WQLiT4DYPhNFUsP4wqIjFnHhsDtt25ifH3u41GX3h0YRkv2ahHj02wpfksa7NVi/4Zbg9rXkWc5cf4KstO4HimiQ+7NjLep/b7Sx9/TRq7Su3KY/7gP3J+TCYrNjoObVBN6DddHLZc3laGn08EJrKPE/zzBfQK0NShCsszTq8tWlSEjVjrd0IZFgxra+Vndiui4CU7ZJLtur9oBORyxhyEP5IL917pU6lM4kCU7SsaTq0yKeokUcQ0jpLCVkZnO1NYJAb1ZMTi8MJx7EmDTsBO2vZ8rjoDxGBTMmL7EqZrFNuvtNIXe5rSdVqEWLA0BMnDtUs8caMnKX5gAD3J9eEEm49QsrIWhs1kUxEzT+PY7xgvzhLeeDabd7sxqtsAVVVtUcDLNGZy37YDQZ89B1RrgUq4elrG6W63L44nL0Y+414kphO2BEp47Yrm0C1Q2/G96+Jkd4PLCuwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(136003)(346002)(39860400002)(26005)(6666004)(478600001)(36756003)(41300700001)(53546011)(5660300002)(38100700002)(2616005)(8936002)(31686004)(2906002)(6506007)(6512007)(66556008)(66946007)(66476007)(6486002)(86362001)(83380400001)(186003)(6916009)(4326008)(31696002)(54906003)(316002)(966005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHhPTVhWS00wL0ltRDJTbHBJUkJ0MXZRbmdPdjFYNUgzSitBUTAyRGhoeDdp?=
 =?utf-8?B?OWpwRGxLSlZBekUvWUFvbWRlRzJOTG1WWWEwTU5FZy8rNjJ4ak94c3o2QVpT?=
 =?utf-8?B?TVBLcE5vUkl1MldRbElWQURuQkpYLzRVNG8zQUVJam1GL25IT0JRN3ZzdEhO?=
 =?utf-8?B?QkJrNjkyOEdNYTJpWFRkeUUvaGpRTzhrRG1lVXNzSkhDUEV5eGFLRjl1TW51?=
 =?utf-8?B?d3NWWDZQODR1R2hVb0FOT0Z0YUdVK2FoalpFRUtINWw0ckE3Y2xnbDlxS0FG?=
 =?utf-8?B?bW5UWDlRVW5UaEg4RDVEVlNRUXR1OVBQZXJuVDJWa2ZRYk90Y1R6dXF1NE5B?=
 =?utf-8?B?SDhnZithMnBnc0pLQVVNVzVOOVZGcDJsd1ovMndyS3FmN211R3NUVXlSa1Iy?=
 =?utf-8?B?eGJ5Q3QzQkNYWmhoVlZRWFVCSTltdk0zTXNIK21iU0FnaVlYRmQ3aE4xQXZu?=
 =?utf-8?B?bVFsdE1ra3A2N1RBQkNydGtPcDNLRklqVTdmaG5wdmVSTy8vVk4zaFdsbzNP?=
 =?utf-8?B?VG96emxRNTFlOGlodytvSHppeERJK3NTOGRuWXhvNWRpeUxJbkVNdlpyVVhD?=
 =?utf-8?B?Uzh2NEtTYSsvUDlxb0JNcU8yRU51QXFqUFJXTTg1aDlSYVlwc2ZxRENJeFo4?=
 =?utf-8?B?N29HZm5jY0RvZ3FPNnBpNzIrK0JvTzVXYm13a3JIVnpUT1RvTkdRL1d0UXU3?=
 =?utf-8?B?ZFUza1BqaVYzMExIMEFYMmtEYzRDSnpUbW5PT2dubjlWVVpCczFvRFNxQ1RY?=
 =?utf-8?B?OGVHckZQczAvbzNydXVWQnUwTFFNdGQ5cDBOVlpvREtsNHhxRVF0bFFrVnVj?=
 =?utf-8?B?cEhsUWVZZ0pOQkRlRmRzRXNEYnBGU1U3Z0tIZSs3bFBTM1ZLOVJmdFhqL0Y2?=
 =?utf-8?B?RlVrUDhVU3o5OFMrQlhFMURWWmlCemIwalpQaXI4R2k0S2FYbm5Pb2pLZVpR?=
 =?utf-8?B?emRURkhxM3k2Y1RBTXNrVnhvMFVDQ0p3STNsa0pnMmVuNG1qMndnNERDMmgy?=
 =?utf-8?B?MFhQMkVPa1dFWUR5R0VNRWxsdTJmM1pQOWRLdk1LWEtOODdhNWJSeTJDYU0r?=
 =?utf-8?B?aFZwS0RJY24zS3owOWFnWktoWGJwUmV3c01pbHUwdlk5citCR241U2hrUWtJ?=
 =?utf-8?B?SGcxRGxSNysweFBTSEVXdUJvSHU4MklpSkFqVTVUWmgrWUlKejFhbDVlTlBn?=
 =?utf-8?B?ejZ1WTV0bWtTMVJObWxNaFdDbDlWNFlGMW9xS3Z2aU1yQVdmU2pPaWI0ck1y?=
 =?utf-8?B?dmdQRjM1S0hSd00vcVpWUnJPZkVhK2ZMODc0ZkxjeFlOSE5qaEY1WHNIMnRJ?=
 =?utf-8?B?SFphOTNDemZLemNuWW1ua2VRUjhoU3prdzR2RW1OOTFqLy80Y1FtSERmd0c4?=
 =?utf-8?B?VHRCNHFDbjN0VklQaUE5QlBoWXNCdUlhNHpjdW5sdlNMY0liS0Uza3JuajZu?=
 =?utf-8?B?SmREZ2hpakhQUG1HaDUwMU1WNk5TQTViTWdRdkNuaWl1ZHg4dGhOb284NUNo?=
 =?utf-8?B?TE5PSVptTlFraUJyaXhVL1FncVoxTUgvN01VbTQ3em5UOVFQMDVKZDhBaVZv?=
 =?utf-8?B?dmxoTVhPeGtRY0RhZlhYSGs1azMxSEhvZDE0cW50MFF6eTBiT3ROa2tHbm5D?=
 =?utf-8?B?SjFXNWd1aUpTZ1ZWZEV1TzJVVFd2OENHT2pOYkxxdytlVlEwSjRkeFFNNFlt?=
 =?utf-8?B?cktsUWN6ZVRhV04wcktJRUYrL2JJVlRzQlVjR3UrN085R2Z1VGp3MHVPWGdS?=
 =?utf-8?B?OGtrV1dPaGozejRBVkZtaUxKRmlYQjltZ0pOZTJxRGN3eGtCdHJvOTRtK001?=
 =?utf-8?B?NUd5cmVXL3oxdERXclVsazhEaHRaMU4wUVpKWWxiQ3VOSWVZdWpRVGVxSkFW?=
 =?utf-8?B?VUQzTGU5eXJkczB6QXFmdm5XcldUQitmMmVWUmgxMkh0R0J2VXd6N29oVG5O?=
 =?utf-8?B?TUc0WmdQdlNWd2dDSW5lY2VjbWkwMzdkVlZFVS9GeDBRUTk5Mml1R0Qrbi9o?=
 =?utf-8?B?d01kOGdDbjYxUVdOcU1ncFJuak90M1JrTWRISlpVTkNyeFc0dDE0U0dnSXZw?=
 =?utf-8?B?dEJOekdlM1k4UGRUTmo3b053MGpONUlnSmpHYVlrVXdYYzJoc0l4RzF0RVUy?=
 =?utf-8?Q?xDdbq2b/+/sskGQYFqqnFc60J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511405dd-38e0-4c0c-3f6e-08da550e1eaf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 11:47:16.0613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 067xamdaXtomaJJOSCEp5+mwzvmAK3X5NwUh6gVweDdioq4rDOV/2jEowr8vcTUExXxRzzCmGH7oh9y011T1uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8166

On 14.04.2022 14:59, Jan Beulich wrote:
> On 14.04.2022 14:49, Andrew Cooper wrote:
>> On 12/04/2022 11:28, Jan Beulich wrote:
>>> Future gas versions will generate minimalistic Dwarf debug info for
>>> items annotated as functions and having their sizes specified [1].
>>> "Borrow" Arm's END() and ENDPROC() to avoid open-coding (and perhaps
>>> typo-ing) the respective directives.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28
>>
>> I'm conflicted by this change.
>>
>> You've clearly changed your mind since you rejected my patch introducing
>> this infrastructure and starting to use it.
> 
> Hmm, to be honest I don't recall me rejecting such work of yours.
> In fact I have always been in favor of properly typing symbols,
> where sensible and possible. I would therefore assume it was more
> the "how" than the "that" which I wasn't happy with. If you have
> a reference to the old thread to hand, I'd be interested in
> looking up what made me oppose back at the time.
> 
>> Given that it is a reoccurring bug with livepatching which has been in
>> need of fixing since 2018, I'd organised some work to port Linux's
>> linkage.h as something more likely to have been acceptable.
> 
> Taking what they've got would likely be fine as well. At least in
> a suitably stripped down manner (looking at their header they may
> have gone a little overboard with this).

Over two months have passed. I wonder whether I had misunderstood your
reply: I took it to mean an alternative patch or series would be
posted. In the absence of that and considering that you say that you
did want such annotations anyway, I wonder what it is that stands in
the way of these two patches making it in.

Jan

