Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307527567DE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 17:26:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564693.882306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQ7V-00023k-31; Mon, 17 Jul 2023 15:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564693.882306; Mon, 17 Jul 2023 15:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQ7V-00020P-0M; Mon, 17 Jul 2023 15:26:41 +0000
Received: by outflank-mailman (input) for mailman id 564693;
 Mon, 17 Jul 2023 15:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLQ7T-00020F-E1
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 15:26:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 526287b5-24b6-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 17:26:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9854.eurprd04.prod.outlook.com (2603:10a6:20b:673::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 15:26:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 15:26:36 +0000
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
X-Inumbo-ID: 526287b5-24b6-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOWal60g7JqN2Dwdjau/eEo0roAp0PQISj+sk3AawR/rGfD1VtP85gpyh7IAJT0AesC9mFySo9L0gx/txYCJPiTwbfbAB8gKPSuU68le0o6uJDsQzLrsqQrTI0P0xNH6Matf8D4abgXa+CLY1Dc0tOnOOeEtIZszVCHtBCiS5KgifGShIugkpq4LDF/55cIEVz+TC34E6ojhYkFiFwnawNTsVnLwgV6ucusVDqqAuAJdpv4uKoBsKr4tvQhBSZP8X1DoSY/5P5FUwRquwjrXx/ZoqEpcZrc9qKhjJHcDfE3bOdib6vt2VdASf9cTDhKpnJ8puHk7BjpjSeh7ZQ5DYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFizzRq6ubBUv8UnCTIZeEGNkuJ58yYStXVp4GsQk9I=;
 b=duh2Iw/FQjv0/INP53xz8Dh/qdTOmWEKG6DmxGKXssUKBAxPKoV+/6FEO2XA6DbRQuRGWqcVS7VJTclp1FqPrJTlHIRswQdDerjFCbkK+7aOsXBB3+AeqVHmbcx9vLjoucFeqCTA/MQD+M0ciLHlos5XbF1Fb3TSug/qil24WEXJvhE+lRnelqEsxAadjJoWMH+qDOaI2uqrdOjtgJAyKfsELKyo/qcIelvdXSf/JtjkGNaA0ZmK4cTVUpWC1E9DpsGLdECAVhicTq/0N/bjabOUOHzgJ7sXgImrEi/sHzSY3hsHERccMUiqNp3b3875pFUkb9q+u+nvlhSrZ7FD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFizzRq6ubBUv8UnCTIZeEGNkuJ58yYStXVp4GsQk9I=;
 b=Vga/xrD9DX7AWjlSIRPvfN/Hge4ekt6BiXWxnG5NjMCO0Cg9jGIABNkspoWurpmyH/7lHNrF0+M7+l8yPed5NO1XxHTYbZRI2Tjk/ayRyab8O3MXTE/F9z0s6Sb0+5MWjmudmcHmqFD3av++myL/Y+7U/xik6L8xNbExI2TN5ZXiBmmzsel5dQ61NZxbMkY5OdWwBFuj94yLmORtmVNCHlxbDj6Wfn5/R+ElIG9hVBRBp9CBzggyIt8d70c1LOkPYjU1QxxLtpuZ437dSwFF+cgk35GcRmQbTNhAHOmsO40ITHls8seeqH8WFVIw81ZMcjvvKK5+rGQEnGEAz7Y64A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8577f99b-7c35-e433-3418-cf8c7dd47f9c@suse.com>
Date: Mon, 17 Jul 2023 17:26:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230707160759.12132-1-alejandro.vallejo@cloud.com>
 <646ce8b8-7a8c-88c1-2b1e-76a721e6f164@suse.com>
 <64b1232a.050a0220.898b.6177@mx.google.com>
 <6519818f-d31e-d588-6613-3671cc7427d4@suse.com>
 <64b55b9e.a70a0220.f2728.ad3a@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64b55b9e.a70a0220.f2728.ad3a@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9854:EE_
X-MS-Office365-Filtering-Correlation-Id: edf718e7-7f4e-4dd1-8b7f-08db86da3569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6+jEZRndZxUvMm4UZecn82qY35cbVut9vl1vWsjZcqoveWFrSSyraMdjLrP2h2J/+Nz5A0D/n9XQmUJiCVw54bfa1UHhluq53YOho0p6WAFCucPHq1KU3GEjHEC39GmWXqQf4+Kl8Cqv2A9EZOm161ChOf1i3J4SadbQ5W4OFxC6JxYky3CNGNEngjcofF/EhCsphxsTHSOdOioEOngrpNIYnBLcNCua2etZtd37TV/rRsMFGBnuqqpXjDKFAayLQKnCUpWKgdCYPsfxtVZqWf3tSlfBke5VWyw3pX70KvQFa5oFBOKbwukyOt78Omjzr8AKHIoGSwWh0XRS29bw5HqNCnDWGoeVZqCwHAfYE7ZGOct/75nR81ZVLgzgo1aVHiif5MjHKWiAPjhfjXtZgtzbbogGCDMfHCzt9ZvT0v4qvUdTT55/8ODbg+5EvrKV/Q1ghtnmLG3L+HtO4Xu7GlhiorOSou8RtmFIdoHoAdWZr8waijPJKRN5cyv5CLkZC8658cuvyeyvbrKu4JSeUcMNrsy8plfg/e3A7psPjezSiyiP987LCGtbBrbNB8AzGKqubQM6WU92ZXhEIStcRxq+jooFgvtzR6w3DEk+RgXYtKnDRhfx9Hufj3kQ/X1DOvFDgWoHZGBlGWt4CeOGOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(478600001)(6486002)(6666004)(54906003)(186003)(53546011)(6506007)(26005)(6512007)(2906002)(316002)(41300700001)(6916009)(66946007)(4326008)(66556008)(8676002)(5660300002)(8936002)(38100700002)(66476007)(36756003)(86362001)(31696002)(2616005)(66899021)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGZKMWE2cDZ0cDVjVXFOUXBRMVNnYXF5SWRiL2xIbHRDWklEWHZrRzRQdEFv?=
 =?utf-8?B?dWtEbTRzZnVQam5lUjU3bFNId2hiMklROHoxOUhjTTJENzJsVWFtd3l1a0Nr?=
 =?utf-8?B?R01OM1FZRlBQOHR4NHBkTUNxS3hsWFdHWGZHKzY0b2VXOUkvSTcyeXAvVjVi?=
 =?utf-8?B?RW5zam9HeGw5UzZSOFU4RTJ4a1F2NzQxbDJsaDRpbkFPb09xcmtzZ29KcnB1?=
 =?utf-8?B?cDNuVGw4Yld0OWtmVlBDS3I5d045TEtNdVVmcXZrYXpSM3ZWM1VjVDQ1aUsw?=
 =?utf-8?B?cWUzck9SK2NGR0VPRmFVV0NOV2ZCYTFYdTBTeTlJRTBZVFJXdTh1ZHIvNnhO?=
 =?utf-8?B?NnFFeThRVURFeCsrUjdSd282MGJGK29MUWxsOVgvWi80NW9aeTBPTndxK21W?=
 =?utf-8?B?SzIzeWRPOGhsV0EwOTBpVXFBNmhWb2dxeW1WTlo0eExlYVdSSVozNTJUQTMy?=
 =?utf-8?B?ZjdQMmlyajJUYWpsS3BQelRhZVhRbUczSFVGMTV1aUJ5bnZWMVlmWUFlTWpz?=
 =?utf-8?B?cHlNa3ZzVUxBOHh3endFUWNWYm12b2pMdmxjRHR1Rk5DR244bElMM1FQa2R0?=
 =?utf-8?B?MFlFQ3lFdGgzcm4zL0hqSTlBZlZ2MjhVbVplSTRHa1ZPcE5YRUhKWWp1bGJG?=
 =?utf-8?B?aGtjSS9LbHJDdmNzbDArdmk0NzFGSVVabEJFQVZBTGNJYkttTnBueHF4c1k0?=
 =?utf-8?B?Njc1RndGSWlMQkh6NElCS3BBOTM2dXdVOUVlTk95QW1IcStnb0htekZGK1hr?=
 =?utf-8?B?anp4bTN2VU9KdjkwcnJoS2V1VkQxeFR5OGZSM3hzakdoUUgxNEQ0MlBvVU9I?=
 =?utf-8?B?TnZ3VGc3eVBDNTRxWWQ2eE5yVUI4QS9CZXU2L3BrQVdpVURNK0pPWnk5UjNR?=
 =?utf-8?B?R0x5TnJLQy9KMGZyaUozQUtDR1ZaazNQSyttOEl6c2psbmRwR29sK3NYMVlz?=
 =?utf-8?B?ZDA0cnp2WlJrMzQwZGJ4UHNSRXFwV3hQQjAyWWpqT2xDTmVUczNWOGsyUVE5?=
 =?utf-8?B?em9odk5KdVB2T3IzK0NkTHFyTGVONVFUNTdiZlhQRUV4R1VjWFA4b2ZnUXRP?=
 =?utf-8?B?TEsrTWg0MlFUSUtMZ252RmV2WmpNV2tRYUdYVWFxbXpnYVl4UGJaSGNmZ1Ey?=
 =?utf-8?B?WERobTU3QzRnQ3l4SDRlY0tvb0ljSCt6VE5mblg4c3RJVjdoNURIZm9yMzlQ?=
 =?utf-8?B?WWpvOVo1T1dKMGppRGFTWHMrWDF3MVR2VjIyN0I2ZWtjSVhyRS9ORGNwbCtH?=
 =?utf-8?B?dXBNQ0s4d01HWXhmTHBhNE9hbWxIdkN3T3EyS0Q1NWoyK3o4U2lCK0ZPbk15?=
 =?utf-8?B?TWJMZzhkM250eE5raW9nVE1qcFlSdVA2dXMwNjZWcndFYmgvQS9oTnVVZzh1?=
 =?utf-8?B?cE4zWTRKRnkyazY0T0QxSFQ3Zy9lTFRpL0NmR2RXcjlrbktTcGJlaGptTHA1?=
 =?utf-8?B?VWxxaG5Sazh4N0c5V1o2bVVNM21tY3l4Wnk5UU84czZRRzBxMlhMWVNmcnND?=
 =?utf-8?B?M0RER2xsUTM1bHRMVXVqNHcrZkZjemZuK1l1bERrMTQ5cTRoaXBWQ1NkVVRR?=
 =?utf-8?B?VE04akJRWU04ZElJcWErSHE2M2wxZWt2WU5hUTQ1OTZWNHFwWnpmUHNINmpC?=
 =?utf-8?B?N0lYK1h0eG5MOUQ1RXpSRzRQSlduT3kzbENjeHlFWGIrTGRtQ29iRkR1aTcr?=
 =?utf-8?B?RjdOay9LLzFZK0RWUEtuSWlWbmh5Q29DZy9ESHA4OHdXSXIwSFlGZWtNRVM2?=
 =?utf-8?B?ejFZOURZNVJpS1MxbDF0TnlSdXZ6NGRkaXhTU0x4SFExcVlnNTl1N3FYQnZE?=
 =?utf-8?B?Tzc1Y245YjJzdWl3YzVIN04vd3h0bFEweEUrUlVpdzZ5aXpTV1BHcDJ1VnJU?=
 =?utf-8?B?c0Q4R2ZoWGUxdi9PVThmUXgwU1JSeFJVbVJDV3lQNVd4TWNWR0w4anhseGxp?=
 =?utf-8?B?bHIvVHJkcDdtSytDQ0hlZjRObElxNkNlWW1WNXhnb1l2Qk5FejBDWHYvcDNa?=
 =?utf-8?B?SkkvNzZpTjgvakZNdjE4ZVlCOXdIcnF1Vmh2WjVEdVowMmE0M3RLMXlnaGw2?=
 =?utf-8?B?bGNvVVZSMHZLR3NHQjBRSTU4NmN5Ly9YUGVVck5jNnNpaFBhRVEyd3RTNEsv?=
 =?utf-8?Q?dBGBpkmg6qNL439hF55OVrZyk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf718e7-7f4e-4dd1-8b7f-08db86da3569
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 15:26:36.1113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJ5J4YA1pbv94xMwT+Cy6gjDoVkSeT93S9ZQJXH8G71DBYaMvkuDCfwhIoBSfSa0aoCycwXVZKt+pDeSt/1rhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9854

On 17.07.2023 17:17, Alejandro Vallejo wrote:
> On Fri, Jul 14, 2023 at 12:36:11PM +0200, Jan Beulich wrote:
>> On 14.07.2023 12:27, Alejandro Vallejo wrote:
>>> On Thu, Jul 13, 2023 at 05:12:09PM +0200, Jan Beulich wrote:
>>>> On 07.07.2023 18:07, Alejandro Vallejo wrote:
>>>>> --- a/xen/include/xen/mm.h
>>>>> +++ b/xen/include/xen/mm.h
>>>>> @@ -31,6 +31,17 @@
>>>>>   *   (i.e. all devices assigned to) a guest share a single DMA address space
>>>>>   *   and, by default, Xen will ensure dfn == pfn.
>>>>>   *
>>>>> + * pdx: Page InDeX
>>>>> + *   Indices into the frame table holding the per-page's book-keeping
>>>>> + *   metadata. A compression scheme may be used, so there's a possibly non
>>>>> + *   identity mapping between valid(mfn) <-> valid(pdx). See the comments
>>>>> + *   in pdx.c for an in-depth explanation of that mapping. This also has a
>>>>> + *   knock-on effect on the directmap, as "compressed" pfns have no
>>>>> + *   corresponding mapped frames.
>>>>
>>>> Didn't you mean to keep the directmap part optional,
>>> I did.
>>>
>>>> which would call for saying "may" here (twice)?
>>> That paragraph as-is doesn't really mandate a directmap. It merely state
>>> that there are knock-on effects on directmap indexing, not that there's
>>> always a directmap to index.
>>>
>>>> Yet then ...
>>>>
>>>>
>>>>> --- a/xen/include/xen/pdx.h
>>>>> +++ b/xen/include/xen/pdx.h
>>>>> @@ -1,6 +1,73 @@
>>>>>  #ifndef __XEN_PDX_H__
>>>>>  #define __XEN_PDX_H__
>>>>>  
>>>>> +/*
>>>>> + * PDX (Page inDeX)
>>>>> + *
>>>>> + * This file deals with optimisations pertaining to frame table and
>>>>> + * directmap indexing, A pdx is an index into the frame table, which
>>>>> + * typically also means an index into the directmap[1]. However, having an
>>>>> + * identity relationship between mfn and pdx could waste copious amounts of
>>>>> + * memory in empty frame table entries and page tables. There are some
>>>>> + * techniques to bring memory wastage down.
>>>>> + *
>>>>> + * [1] Some ports apply further modifications to a pdx before indexing the
>>>>> + *     directmap. This doesn't change the fact that the same compression
>>>>> + *     present in the frame table is also present in the directmap
>>>>> + *     whenever said map is present.
>>>>
>>>> .. you mention it here as non-optional as well. Didn't you tell me that
>>>> Arm doesn't use compressed indexes into the directmap?
>>>>
>>>> Jan
>>>
>>> The [1] note states "whenever said map is present", meaning that it may not
>>> be present. Saying it's optional is a stretch though. It's not like we can
>>> choose right now.
>>>
>>>> Didn't you tell me that Arm doesn't use compressed indexes into the directmap?
>>> arm32 doesn't have a directmap at all. arm64 uses biased pdx as indices
>>> (they are offset by a constant), so they are still subject to compression.
>>
>> Hmm, then our understanding of "optional" was differing: I understood
>> "use of compressed indexes is optional", when you apparently meant
>> "the use of a directmap is optional". If this is the case, then I
>> agree with the chosen wording. (Nevertheless using the suggested "may"
>> wouldn't yield and incorrect outcome.)
> 
> Like this?
> 
> ```
>  * pdx: Page InDeX
>  *   Indices into the frame table holding the per-page's book-keeping
>  *   metadata. A compression scheme may be used, so there's a possibly non
>  *   identity mapping between valid(mfn) <-> valid(pdx). See the comments
>  *   in pdx.c for an in-depth explanation of that mapping. This also may
>  *   have a knock-on effect on the directmap, as "compressed" pfns may not
>  *   have corresponding mapped frames.
> ```
> 
> If so, sure. I don't mind either way. I'm happy for those 2 _may_s to be added. 

Yes please.

Thanks, Jan

