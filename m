Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327C35FD7E9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 12:45:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421846.667506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oivhU-0008OI-AH; Thu, 13 Oct 2022 10:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421846.667506; Thu, 13 Oct 2022 10:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oivhU-0008LU-7V; Thu, 13 Oct 2022 10:44:28 +0000
Received: by outflank-mailman (input) for mailman id 421846;
 Thu, 13 Oct 2022 10:44:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oivhS-0008LO-Pg
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 10:44:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01223b9f-4ae4-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 12:44:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Thu, 13 Oct
 2022 10:44:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 10:44:23 +0000
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
X-Inumbo-ID: 01223b9f-4ae4-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhJjx8Lo49tQNXsbiWd7CYhsd5hK5FNZeOj7JNVKaNFoKvc/AxphlF8eVw8X++3Awv3zkEu/a4bw63Nj1TNmOsUUXmAvwQx1mIsM8uYssavjlOj5bE8/3OAmd1j/M5tVGt2S62s6H8Uox2pYZCM4AK3SAGEzqz7jv4cHG+j30QP4XNw4WQWlHJ3z2cORP4Cj9y+D/kRJBk2/020acFe2E63D3ow74NaRAU4oupri+s4C2UVe3OdQi0acssQnbM8FU+FhfWR9/rfG3kDwGeTepjHy3tGWW5m2zJsyerrZyvhHB6QR33IYuhhs0LhY2wIc7/Vlbr+89li1tRyR6Q1p/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgNnsIgISvcoAwLgemL6WUhGOiqJYx0k5cHPEE38Ias=;
 b=PpFyoxwr7rqsj2AmgpCV7lGJzvqh1qUiAY7Zy27+aTaCxdAQnwgTqg/zXKCBdrn8JISvZMzds+Py5aKRkLeESReUYXW+q617vEoIOr28MBrrTDpz6QsDvc3NmwW3MW7hgCgjoBGTicVmK2vTKkNDTZXoBNAEQn9DtAfQSsd7kjhLYzxGzJCcayB0heW7yzajxm5ypkZrBIzhPCtTmUSAm5LzTp/p0I+pNRghmXWzv4HCkNaUQY4+1GVfm5MyWsan3cnUXyeHdI2VCj1gS//Tn7A1SLuSTtGcLXRTtNbm6QZLKBjY7822exDxqfLjwAqw934WH3waA/pUT1zAmkF4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgNnsIgISvcoAwLgemL6WUhGOiqJYx0k5cHPEE38Ias=;
 b=O6KlfgfGtWDxgVM5OeFFl0F5etu20IOXdzMwN44j9bcUGYbqZttocjgl2Wb+N+G3XNtjLh2XGCZWHvzAn/sgcKbJW7IXwwf64jASplf2ZqHjQVqZmVbZxaU9K0+KnL1b71tIbb3AcvD1SwzzJ3GEnRrl+vzutXKntqwfeCwoSbDsTrM3VBD/SsUTf6hUjSoViEx25Acay+r+9DQUNG0xFLz17zj90RxyjkN7FCgeKuFdIJhEn4mhE0PrqzfXCflgSqxgwt0YgoF2QmBnbz8KRIAchDavoLAvSBXOt9ZmPFNh0E6tuq/mKpS82rVrltEwyBy7C6oHPrWO4J6n/Vg56g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <097a6db1-51e4-3b6e-af94-46fef203b27a@suse.com>
Date: Thu, 13 Oct 2022 12:44:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for
 domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-7-carlo.nonato@minervasys.tech>
 <32e2a752-975f-baa6-8d6c-ba27cf516c64@suse.com>
 <CAG+AhRUJ0+CszWjSzO7=v4SmKtjG7VMpZ8P050s-rLz0rgXJBw@mail.gmail.com>
 <5e5ee6f1-a5fc-fcd4-5d61-7f1e4be6b630@suse.com>
 <CAG+AhRWXi8V142aSx_P1cjyaXTb+CnS-EOB_o8c4Y7ZkBt7Gkg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRWXi8V142aSx_P1cjyaXTb+CnS-EOB_o8c4Y7ZkBt7Gkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5038f9-9a4b-4db8-d29a-08daad07e424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FYT+Jm7hX+p52axtXQGHu0c22yzLtwV1MMHoZJxvY8wrVQTtitEtcylaw1PIdETNPB2O+0R7u9hsZj4zspeeqTvByMVuea3QagiDImsX7iI4/LBvoDGfqf/yZkeWxKvn2M041MU+pCJu9ao5a8BlVNnUGKpaQI6zkxLqr8g+1/Tv/D2kXENoBs09W00TLunLBs9tCKmsY9gGPxXlyuXWZ3excGgRIhQEoKPatb2CsDB7hBZa2Eu72WmwE9P1g5Hs2kwhh0/FKSvPLFWQZK9iPIek+8tr08tjmintOJBMEUkmE08tZxKIR7Bdm9soM5/3CTxhTh6US6RppH6NwZdOCxAVuYIqYBT9oTYnodmUkChMlj1F8ZSO93TK1FNQWk9MI0suEwuIj6Xl3Y4/yMrDa8/0zLKXYNX1exL/ZHDvnLWKaX/pbL7+yHQ7jmTOg9f8iCReufSVPCW1E+/g0FbuJUHeCSHrNi3cwqz/b2rnTmW3Kh1AX/3wKj7T8JXOUfezQTar5XhCv+J70tstCwfzdDoMG3FksZUYhpv/vnqVafUnwA/ecS4AQvBmjpQudMwwRQ8OlzNVC3Zq96XSdt7mzlBQN4J4IPiT96dVFe4bGTEXtDHrZclDpextfDXin/lzHJ8+jZHm+3B2EUCnE5Ix/W7LzdtK6euBdB/M6twzxDvV8yC9XNZDbru7bSXRxwXzlk33YPZxX4xhk891xzYHswxcglxhXoIVJygcKC1oFyD0lRJS4Jf1nfyPswCA2gYX92+1PmQ4rs4Fl+84kznZBNnl5U2vSW9zap88oYXT1fFEEV21d81JGXRAid3/nQvrstHtAAL1rKWk1mbnXs/CUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(136003)(396003)(366004)(376002)(346002)(451199015)(26005)(6512007)(6506007)(54906003)(86362001)(316002)(478600001)(6486002)(6916009)(36756003)(38100700002)(8936002)(186003)(2616005)(83380400001)(53546011)(31686004)(7416002)(8676002)(31696002)(66556008)(2906002)(5660300002)(66476007)(66946007)(41300700001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2puR2JYYjd4bStWTFR5b0ZpVDMveFBLenptQUNGYUhpUTk4cy9JUXhVVWxj?=
 =?utf-8?B?K25JTnJhV3JNWkFReG85VWxSSVViVzdpR3ByRUQ3UFNzWkJOanQ0ZE1lZkg0?=
 =?utf-8?B?endhM2ZzZlJ0R3B5c1BoekdkdnBLR3grLzUzWmtRaWovMjhWcExJMWk4ZlBF?=
 =?utf-8?B?TXZiaElLZWQ5RFgvelBuZHRqUk1mckQ2NHA1bWNCbThYdzI4SlJNRFQxTUlH?=
 =?utf-8?B?Rm9nbVhBR1lNRXg1aVdTR3IvNG51WjQxZHNucnZMTGt2eGppSVpoSVdlV0FL?=
 =?utf-8?B?WDlLTmsydkhnUVVvMWtaaXBTNUd2WTRPbHVCSStsZlJyMkdzSE1xa2x0Uk5v?=
 =?utf-8?B?dDNoL1QyZzc3R2I0SWROeXo5QlFMMjI3d25kRFhQbTlWa3AwN1RRNWt2RDZI?=
 =?utf-8?B?VGt3dnYzK3VJMS9PWStselRETEc5Slh2eDg4clpudXRSSzh0UWFBM1B3Z0w0?=
 =?utf-8?B?RzY3OGlvaDl2d29KcWZKWFRLOHVKUzJ2RXRtRzVOWUpIa0hqVmVpK0RoVU5N?=
 =?utf-8?B?NUlwdk9GVUpvNzY4aEEvSUQ5WlBLemNiekM3WmZPWkUzd0tYVVB6bllyUWtR?=
 =?utf-8?B?WDNWdjlsVjJqaENPZndBVWRoNWRQdmVoTXhDQ3RrUnIzYTVxRU1lRDFqZmRJ?=
 =?utf-8?B?SWJJd3Z2M0dtZncxZkpNeXBLQUFiOWx3R2M1VjJFdUZZa1lFN1psdTdQMUVR?=
 =?utf-8?B?d3JURi8wclg4VFpjV2xURzB2MlEvMlBrTnRrVnorcW1QeVg4Q0JsU2wyNy9k?=
 =?utf-8?B?Q255UGg5aHE3bVV4RlF6MXl4Tnc3VEdLRnprTUd6dTlXS0s1dlZ2R1hmR1Bq?=
 =?utf-8?B?RWJ1bGdmZmhxMi9VcDB2czlXbEVIQjVHWkZkV1pEUEpuOC9CblN5MFF4Ungz?=
 =?utf-8?B?ekdSZktoekNXVmJobllicjdxbTV4czAxbkJ5NDVndkIzUWpvYUM1WFN2Z3M3?=
 =?utf-8?B?KzlLZ0l1dEZNclV0SDlwbis0Z3ZhMTR2b1JjQjVGYVhMelFCcGY3anl3eUdx?=
 =?utf-8?B?Zkgxc2xmMmhJc1JXbW43TmdmeDVteFQva2tiQ2ZJR2RDeDFVNGhXWkdhWEhG?=
 =?utf-8?B?WFFIL2o2dUZmenBneGxraDg2a2xvNk1mbmxWM1grelMrT0kwQmkyaXhZOTRo?=
 =?utf-8?B?UzhqWklsQkROUUdZK3lyWU1qMWFWNFovSDR3THNSSWMzVnpPSXNuV1JteExU?=
 =?utf-8?B?eHZrWDZYTlErTDFHSEx6dHJsYkxxV1hTWU5mNHc3L0hLRUQ4YWlFL2REQW5p?=
 =?utf-8?B?eXVkZUxJTHBDcytHUEJhOC9rVVh3aS93Y0pEcmJjblhkdHY5L1QvTGtBMFE4?=
 =?utf-8?B?VGtqb2o3ZWdFZWVaNWxVZFNuaWR5QW40b2lveDdJT2Fwb0pZUmpVdm5YY2w2?=
 =?utf-8?B?cUhXRC95aUZ6Mm1TV1pWZU9OdERRbFNzV0xISzZYZ0kxbThjWDFQVGtlRFlK?=
 =?utf-8?B?M1JKNWMwdisvbzJ3QXN2UFVMRGNjVHVrMUtYVER3UlUwbGo5K2hUWmtnMFpN?=
 =?utf-8?B?RUt2alc2eUJHYVBhbU05RU03UEwvc3NPbkQvdnU3dzZ3Um55aUYzSDN3U0Vv?=
 =?utf-8?B?S0ZaNm80bmRHRjNLSXpVak1zeEJjaU5EUEtaZEljZnNlc0pNWGpZUnJrUGJP?=
 =?utf-8?B?ZzFDa3U4aGNpSnBobjdKcHVKL0dFV0xvb2tYSHlyTUNqMWJkRkZMcmZscnVR?=
 =?utf-8?B?UTdsZmxPQUJ2V0YwdmQ4UFl3bFAwZFZ1OVlHZGpsQ0tmQ3A4N3pkUTVNakVO?=
 =?utf-8?B?Uk1jUU9oWStmbWxvMVlkTGNuYW95ZStiMmszWUhPYlRyZ0FsNi92VHFndXo4?=
 =?utf-8?B?TnRsS3F0L2haQmtOKy9tU29pcVFtRlY4cEtDc0NZRW1pQUtpekVSYWNyZEVT?=
 =?utf-8?B?SGUvejFaYkkybjJhWHkweTAwYkJ0TTBXWTE5akdQTm1laWQyU2ZMbnZBd2tr?=
 =?utf-8?B?TWdaeXJ6WnAyNHIrUmhIc1VwcWUrb0kxUkhIZDZwdlhGa2gxV0JSajJ5M085?=
 =?utf-8?B?OEtNcmc1dUp6K1hNVFFHV0dYSjFYaFErR3piVzJnWk9jdWNLNkx3K2NYQXBI?=
 =?utf-8?B?cWlTSXU2Rm9CQkR5VVlVS2ZkT0FWeWppK3owMG4zT2lEY1NpWjJkWVhycUkr?=
 =?utf-8?Q?EGYHIKZKGUT/hKK0jHn/nn/75?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5038f9-9a4b-4db8-d29a-08daad07e424
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 10:44:23.2841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFTqcYXPssXuCp5LGg7xbzCdywQPQmFD8EdWc6Vr/wJAUlZnCKZeJIk7jGs+hmx3HFPZeTusEjY7PGmQ/qhDyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838

On 13.10.2022 11:47, Carlo Nonato wrote:
> On Mon, Sep 19, 2022 at 8:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 16.09.2022 18:05, Carlo Nonato wrote:
>>> On Thu, Sep 15, 2022 at 3:13 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 26.08.2022 14:51, Carlo Nonato wrote:
>>>>> --- a/xen/arch/arm/coloring.c
>>>>> +++ b/xen/arch/arm/coloring.c
>>>>> @@ -300,6 +300,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
>>>>>      config->num_colors = (uint16_t)num;
>>>>>  }
>>>>>
>>>>> +unsigned int page_to_color(struct page_info *pg)
>>>>
>>>> The parameter will want to be pointer-to-const and I wonder whether ...
>>>>
>>>>> +{
>>>>> +    return addr_to_color(page_to_maddr(pg));
>>>>> +}
>>>>
>>>> ... the function as a whole wouldn't be a good candidate for being an
>>>> inline one (requiring addr_to_color() to be available in outside of
>>>> this file, of course).
>>>
>>> You mean defining it as static inline in the coloring.h header?
>>
>> That would seem preferable for a simple function like this one.
>>
> 
> I didn't want to expose that function since I would also have to expose
> the addr_col_mask global variable.
> Same goes for get_max_colors(): it exist only for the purpose to restrict
> the max_colors variable visibility.

Ah yes, that's a good reason to keep the function out-of-line.

>>>>> +    page_list_for_each( pos, head )
>>>>> +    {
>>>>> +        if ( page_to_maddr(pos) < page_to_maddr(pg) )
>>>>> +        {
>>>>> +            head = &pos->list;
>>>>> +            break;
>>>>> +        }
>>>>> +    }
>>>>
>>>> Wait - a linear search for every single page insertion? How well
>>>> is that going to perform on a multi-terabyte system?
>>>
>>> For our test cases (embedded systems) the linear search is good enough.
>>> I agree with you that in the general case this is bad (even though the main
>>> targets are indeed embedded systems).
>>> Are there any already available data structures that we can exploit to get
>>> better performances?
>>
>> I'm afraid there aren't any that I would see as a good fit here.
>>
> 
> Regarding this I can see three options:
> 1) We leave it as it is and we warn the user in the docs that cache coloring
>    is embedded system specific for the moment since it has, probably, bad
>    performances with bigger systems.

I could live with this as long as it's stated prominently enough, but ...

> 2) We use some priority queue implementation to replace the actual lists.
>    Red/black trees are available in Xen codebase, but I think I would have
>    to change the page_info struct to use them.
>    Maybe just a binary heap implemented as an array could be viable, but that
>    would require me to implement somewhere the logic for insertion,
>    extract-min and other operations.
> 3) I have a working prototype of a buddy allocator that also makes use of
>    coloring information. It isn't an extension of the main one, but rather a
>    simpler version. This means that nodes, zones, scrubbing, aren't
>    supported, but this is true also for the already submitted colored
>    allocator. With this, order > 0 pages can be served (up until
>    log2(max_colors)) and insertion is no more linear, but constant instead.

... this sounds even more promising, not the least because it also eliminates
yet another shortcoming we've talked about already. In fact I would expect
that log2(max_colors) doesn't need to be the limit either, as you'd cycle
back to the first color anyway once you've reached the last one.

Jan

