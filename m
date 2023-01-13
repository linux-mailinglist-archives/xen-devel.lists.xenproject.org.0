Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B56699FB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 15:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477382.740084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKxU-0004dO-Ug; Fri, 13 Jan 2023 14:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477382.740084; Fri, 13 Jan 2023 14:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKxU-0004av-RM; Fri, 13 Jan 2023 14:23:04 +0000
Received: by outflank-mailman (input) for mailman id 477382;
 Fri, 13 Jan 2023 14:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGKxT-0004ak-8i
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 14:23:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2040.outbound.protection.outlook.com [40.107.15.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c86f90aa-934d-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 15:23:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8830.eurprd04.prod.outlook.com (2603:10a6:102:20d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 14:22:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 14:22:58 +0000
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
X-Inumbo-ID: c86f90aa-934d-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8KwfngPendc/RFulZwuah9sBP80w1z4HUlwgA1Nap5QVaiyQis6ey1W2LXMoaySrXIoboWGckXVJWO/bqnRz+ONe/FmdQpO5SaUbGdbOE8vyq95FsPtbrJzLWJsVayj/WpQzCMId26UOYx0Du0kKAHysIu2UPrObNvN6RmRCSzfeC60YypGiFdXupG10U0zS8XEcrrkfnfIYP3cIXp58Ltg5UnBzuGChNBCJbhiutrjEwA9C/Q8ZluDU91tLK+k4+P+afso3DhmD6goOB91qdK/wfWD8GXLzTPAs66TP0KS1I/4qpSmEfW0XXLLnmTLpof7Xlw9LVBgL9jE6hhXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5/N32WcKpy/9eodosmzYYsCq1e9XuOCxjg5CzZMbyQ=;
 b=kiWQt6k0XAE9r81ISE6P3l8NHBigw/6PR5FdJIMLLWZpezOQE+abIumXZiUFkJUAA4IuIRssJRH5nv/Z3CiOVwWJ+BuL5yTifkRitKrm3SplnMC0SSNwcsLCT63u75R+j5huj0xBy3XvF8nMYdZjuVGk/JkYMCVPsEhHknkl6/ekZVekiFY4hvg8SC7mZSlsuMJ3NKB3kp3qUfKo7u6G8OF+mlzs42eNSBRCHdaYaT+6nHkuPSrd7GHKdcTtSVB9h19fJALPCRc8Bxp9sl0g6Tb480U6osefkzZbX+FXa/bpdxZW+xEvN0rD2hqBybOyUSCYVkjlg9m3VRTkPQ52dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5/N32WcKpy/9eodosmzYYsCq1e9XuOCxjg5CzZMbyQ=;
 b=0/bgcLs2i5XLXiBU3vaNBfG1mACmF+jf4XqRLbOxwJIWwjYCRckJH1zDuRH7Ics9Ew74dVXpgrDqZ1WP7MX4ORK7vubBwWeYURxjAePVQie+52tV8RgdI/BLeLKAXpboNme/X5ErmUDggCzMZBVAfiKVCVwL4EjeG5XDuw4q9iYPFK3YWBAJ1KrM0fVAhro4sa9fDTHkZh5di3wRrA14A8XIKnV8Ngl77kGEpfl5CgT6J/fbTVUO580LYFQI/erOCgxLU03oCRz2tFuWaZis8QdN+726+otOcbOyEq0yYZ7yhMy2zUZ41je7DgTb6RT8CgTGAjJPBmrcojBjxGT+JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fc41018-b27f-61f5-632d-3a36e5460590@suse.com>
Date: Fri, 13 Jan 2023 15:22:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
 <6596d648-6400-7907-bc21-8074dc244247@gmail.com>
 <88e3ec77-587a-ae68-a634-fed1fa917cd7@suse.com>
 <b76a7834-9868-c5c2-e058-89911a552c80@gmail.com>
 <512d8768-28f6-d9d6-c1cc-18c5fbf2a636@suse.com>
 <4f1d289a-7c3b-c4a1-34bc-1e8bd62a416a@gmail.com>
 <da973e5a-3a1b-3e99-ebf9-e462915eb338@suse.com>
 <8e1ecdf9-c5b2-2977-b4fc-a64cf04c765b@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8e1ecdf9-c5b2-2977-b4fc-a64cf04c765b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: ac441efb-c99c-49b0-2380-08daf571aaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lld5KclfsJJpaLmm5yOOJ/AFvJqWSN3ZAEsh63J1vQyi2atxt8ItTiPo8WfDLyMo2KyQ8dG5eGFihubVVOVc+r976TiicINSdYlVIhVFGZywU4xUOVYlgIQhGB4XmW5b8FkKp/wz0e6kUQ1fwqGOW2vLzC20KRmlCu/PYqhE4i9HjrY0i6AXLeqr0FRLIAnhwiZerbQkII+zQ4W0iWLUPq1L1IemvwLSMhqA2VrOtf5j/05oevB8YQMfMoVQ4VEz0e23Y3XcO1OQybICIzKTbo+5vvbcZf1gj3tGadtblrQRxrFiVIzcRbmBO2aUTXywJED61YSzz6zuUEY6W1PyJS6zdrtxmMLo1eNNRQYf+h6zvY07RTc55PHcmLEEHlPo5piHO+5gKq8QWZgbCWcz+Ff+QxkuKOm9foWY6LdtJ4UTL8CdqeHLittBclvnpJ+1tUtYQclwQXzQ1wkr59m9mQiu8f1TwKh0LIfBUnWmxoOHrBEUisKyW/FaH7bVXPunUtE0zrkIYCWc0HcpI8EN0+bsGTn+M/O91kLvxhCgcZOAKhtz8OQa62ktGNdXeRRt1tcb+7CdooXdih/9MP0ThO9+6cNqOUq3juDFvBlZFC3Yw7TZtIuFzVUlSEYFQuKFz6ajLpsJtMoGIihmvXX/f6T7OKB+xGbzWW8EHp6REzCZwtizWP4z6mM5bstW2sQuhvuxAxSr9YH0KEJWS4lTyL3+qX1M6scKluTgQCC/Etc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199015)(31686004)(8936002)(5660300002)(54906003)(41300700001)(4326008)(66946007)(2906002)(66556008)(316002)(6916009)(66476007)(8676002)(478600001)(6486002)(38100700002)(186003)(6512007)(26005)(53546011)(6666004)(36756003)(6506007)(86362001)(31696002)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmZRSzZtTmU4M2F5dXFHSjFjblhtN0liWDdybHM2VTk4ZXNBYkFMenpHYVhO?=
 =?utf-8?B?V1ViQlpiL2pvUERHVlg4cmJRamU1UVhpNTVXS091RDNVQlJIajRqUkdBOFpP?=
 =?utf-8?B?WDE2MnNCZzB3cGZhaW8vS2VaVUFmWXB1THZFUmRxSmlSdjA5anZRZEN2KzNS?=
 =?utf-8?B?NkwwZWVCZnBlTjVxdUgwUE5pT0VYYjllcVMxSDJLbVhjTTE3YU1Lang0WExh?=
 =?utf-8?B?R01qL2RKZ28zOGd4Y2EwNXpyWC9JYUZlQnF6WGp2dlBaMTJWWk9wdDAxZExu?=
 =?utf-8?B?L0VkL0tBT1hZb0ZnUUZRWEhrYW1aOGV3VytZVmovaFZreW50Y0RBZjNXRnNM?=
 =?utf-8?B?YUVJNlRxbyttNGpEeWtnSVlxSTVoOU1RT24wOGlZcGN3Q1I4Z2E0L3BpUlY5?=
 =?utf-8?B?Uk84NWJVYVRPZGFiQXJKMnZXSE1vWXZmSmR3NW5LQnpNR1ppRk1RUWxibVND?=
 =?utf-8?B?Y0QrMFBhdEw4MDBwLzNYVVVlRSs0blRYMTRiSTU0eGk3N2E2K2tjclJiSFJV?=
 =?utf-8?B?ZG9wZkw0YzZmTnNwZXBWVTJwRDlTaUFac2FFN1B6aHJsRFNNd3l2QVljTnpP?=
 =?utf-8?B?ZlhGcWo2aFBuME1BTi9ZZ3NCSGxrQkx4US9tSmJlYW5ieDJuakcrdytWV2p0?=
 =?utf-8?B?bi9ZMkt0aFUvSXE3ZUhqbVJRemplSS9HQXJSOVQxZmdUaWtscWlSUmVOcFBv?=
 =?utf-8?B?cE9KTmJhaHFHNWRKU0hrTjJ6eXcwMlFXS0ZJc0krRVBTRytRLy9weG5XbDRo?=
 =?utf-8?B?bmdLV04ycEpxc2RyMmlpOWw5YVdMQkx4YmpvM2JiZklrYVhrOUR6bndFZ2x3?=
 =?utf-8?B?SlJOQVltZ2JRanl1R1ZDTmVtSmFwZ1BFbUgydWVYOE9QbUZSdEFLVzdVb1h1?=
 =?utf-8?B?KzR0U1hOb1hubTMwaEN4bTVSdEViclBkWDhyS1hJQWptcXkrRlNrUDVJWEJH?=
 =?utf-8?B?ZU1VYm5LcWJ2T2E2bm84L08yTEZQcnVxWUlFcGFBa3V2Zm9jdXhUSjllMnVY?=
 =?utf-8?B?Rm9YcWFBVHhLdXYzY2ZYRDhFQS9LQmVxZ0RUZnpWTVJEaFg5bVJoeG1Vd3Rl?=
 =?utf-8?B?WXlhTDJMc0Yzb0hGZGdHcUhBOEhyUmkwTzcranExOVM0QU40TzhRN0dBYWU0?=
 =?utf-8?B?YS9YUUt5MlUzOXZpQWVhc1cxVlRqc0JGQnZKcXBtcW1CSkRHZnZtYVdTNVdy?=
 =?utf-8?B?THh1RGltNWM0RG1naDJXdmdWdDU0dDBNVWU1blcwSjZJMHIyeGJ5VWVKMkw1?=
 =?utf-8?B?QXYvNzBudi91ODdsSllvQXFTbktBb1BJS3QwcDA5Wm95cFdQYjFxc3JCUlJP?=
 =?utf-8?B?REl2bysxWFl5eXlBYi9ZWG5iaEh1ZWhFL1FqelFlZy9nemNuM3pnMlNOeWVF?=
 =?utf-8?B?azRMSEk5Uit2L0QranU0N2FObHFTVGNhWmdCOWs1eEowdDlvTlpaNzZNR041?=
 =?utf-8?B?cGFaV3p5YzE4R3JWQ3NyTTkvQjNacG45cFVPTDRVYU16ME04THVwaGNvTEtK?=
 =?utf-8?B?am11STlVanhjelplaDhqUGl1QWxLV3JIdlF2ZXd4aFlpaTNmOUVoM0pzT3Yr?=
 =?utf-8?B?cENyWjhIUUkrUDRwcG1WMkUxVzVheGpndTcwL29jUUFZbGlUTCtWMHNUeGNY?=
 =?utf-8?B?REFiY25lcXd2NGhGWUtpZ1RNbGVXWUhWZzFPRGxYNmpKNFlTN1VPdWM5K0tr?=
 =?utf-8?B?SnZaMDU4ZDlzckxIazI3MjU0Smh3dHBwWmpscGFwNm13TlJZd0Z2QVNrWVZu?=
 =?utf-8?B?d1c1T2Nhb0Z2eDlkaTVmelBkS3A2d0JoTlc2ZWRTQ0M4bjdqVHY1dzh2Rlhi?=
 =?utf-8?B?YzZRRTdPSEhwNCtNZEw5eWlvS1pKcTJzR2diUWpmYjkzcCtSdW9ibmdVVzNw?=
 =?utf-8?B?SkNqcjN2a0lNR0xmeUpuMmovb0FyMVFVby9CYXltd1pqZ2VrbWoxbGlJNGY1?=
 =?utf-8?B?RGJzV3grTElyY3E4N2VOZkhZRjZUYngwS1NCT2RMdWk1bnN1eVo5Q1ljR3Ar?=
 =?utf-8?B?Q0hEK3FRQ0pkWm5tc3NhNWpJN3FsUk05eksrb1o3NFZxUEV4bWxzdW9DL0g0?=
 =?utf-8?B?SHV5dCtnby9KaGRmSEY2US8wdHdKTkpHQlFCdEpRRkt4ak1IL0NMN1g0S1R2?=
 =?utf-8?Q?5BOlB2+axHNH4B50/dw89b8Up?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac441efb-c99c-49b0-2380-08daf571aaf8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 14:22:58.1094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vO2M8ZfMVHb3kpecSQRjcWjurstu5LI5tYDvlbduF40bk1FWCg6PnlofWMHXW1LBSUEMs4PQ1KJBjPwFS6j1lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8830

On 13.01.2023 14:53, Xenia Ragiadakou wrote:
> On 1/13/23 15:24, Jan Beulich wrote:
>> On 13.01.2023 14:07, Xenia Ragiadakou wrote:
>>> On 1/13/23 14:12, Jan Beulich wrote:
>>>> On 13.01.2023 12:55, Xenia Ragiadakou wrote:
>>>>> On 1/13/23 11:53, Jan Beulich wrote:
>>>>>> On 13.01.2023 10:34, Xenia Ragiadakou wrote:
>>>>>>> On 1/13/23 10:47, Jan Beulich wrote:
>>>>>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>>>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>>>>>> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>>>>>>>>          if ( !acpi_disabled )
>>>>>>>>          {
>>>>>>>>              ret = acpi_dmar_init();
>>>>>>>> +
>>>>>>>> +#ifndef iommu_snoop
>>>>>>>> +        /* A command line override for snoop control affects VT-d only. */
>>>>>>>> +        if ( ret )
>>>>>>>> +            iommu_snoop = true;
>>>>>>>> +#endif
>>>>>>>> +
>>>>>>>
>>>>>>> Why here iommu_snoop is forced when iommu is not enabled?
>>>>>>> This change is confusing because later on, in iommu_setup, iommu_snoop
>>>>>>> will be set to false in the case of !iommu_enabled.
>>>>>>
>>>>>> Counter question: Why is it being set to false there? I see no reason at
>>>>>> all. On the same basis as here, I'd actually expect it to be set back to
>>>>>> true in such a case.Which, however, would be a benign change now that
>>>>>> all uses of the variable are properly qualified. Which in turn is why I
>>>>>> thought I'd leave that other place alone.
>>>>>
>>>>> I think I got confused... AFAIU with disabled iommu snooping cannot be
>>>>> enforced i.e iommu_snoop=true translates to snooping is enforced by the
>>>>> iommu (that's why we need to check that the iommu is enabled for the
>>>>> guest). So if the iommu is disabled how can iommu_snoop be true?
>>>>
>>>> For a non-existent (or disabled) IOMMU the value of this boolean simply
>>>> is irrelevant. Or to put it in other words, when there's no active
>>>> IOMMU, it doesn't matter whether it would actually snoop.
>>>
>>> The variable iommu_snoop is initialized to true.
>>> Also, the above change does not prevent it from being overwritten
>>> through the cmdline iommu param in iommu_setup().
>>
>> Command line parsing happens earlier (and in parse_iommu_param(), not in
>> iommu_setup()). iommu_setup() can further overwrite it on its error path,
>> but as said that's benign then.
> 
> You are right. I misunderstood.
> 
>>
>>> I m afraid I still cannot understand why the change above is needed.
>>
>> When using an AMD IOMMU, with how things work right now the variable ought
>> to always be true (hence why I've suggested that when !INTEL_IOMMU, this
>> simply become a #define to true). See also Andrew's comments here and/or
>> on your patch.
> 
> Ok I see, so this change is specific to AMD iommu and when iommu_snoop 
> becomes a #define, this change won't be needed anymore, right?

Well the (source) code change will still be needed; it'll simply be
compiled out for the case where iommu_snoop is a #define (which it
looks like we agree it will be when !INTEL_IOMMU).

Jan

