Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A93B8ECC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 10:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148301.274074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lys2O-0001Gc-60; Thu, 01 Jul 2021 08:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148301.274074; Thu, 01 Jul 2021 08:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lys2O-0001Dy-2l; Thu, 01 Jul 2021 08:27:08 +0000
Received: by outflank-mailman (input) for mailman id 148301;
 Thu, 01 Jul 2021 08:27:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zJ+h=LZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lys2M-0001Ds-HG
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 08:27:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46bb03ec-53d9-4000-9b0d-cabd097af8e1;
 Thu, 01 Jul 2021 08:27:04 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-NvfE6PnSNJqBlFGOdLjQIA-1; Thu, 01 Jul 2021 10:27:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 08:26:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 08:26:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 08:26:58 +0000
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
X-Inumbo-ID: 46bb03ec-53d9-4000-9b0d-cabd097af8e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625128023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DnD25fAzwh8fY86OSuBQt1PTJe6MeV91euHHkyaJBhU=;
	b=Edd1B1J2ZKvoZOdknV0WIqrn+KsJQhByDUzom+oHTlSZ+h7qgxCfkgb+bt8kvyUKu1YeT4
	qSxrSPs3RoclQn1X7yyWDwhXBo2OjTcWotNm1OtfCnpiZrEVcskz+MkKZgJysZEQMXgVZu
	TEkAFhfO2Zba4S5bES2DN7RPYUNpmPk=
X-MC-Unique: NvfE6PnSNJqBlFGOdLjQIA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHlvt6D4NESpSTphFp0jZEke9TjTAWNZh6TOiESjztlc+BLWg1exP0pRIoIaa4MN1a3fC31JbrwHnGveIZTudVsQnJatEAx5C5bzkDMXDQTiwVPHo/vj2e1UlNm4uoqX07YnvGlNuqkeV5EiUgzJB5lj2ZIJ2cwwCPSxYC0golZCsHIK5/BKGzfmg6uZUtw3zyip0ouwsLiuV6JeYUmoue+sQpe2MYTOYPzIUWnm9scRjv+GStIidMJ0zofb/zpi+snobZ22h1o46bf4w0p5AjFTVoR2fKGiP+QUcF0SZPMVJD0qBj1mkl1krOlFM7SuToG0+DMxQSX3wKjvUwKanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnD25fAzwh8fY86OSuBQt1PTJe6MeV91euHHkyaJBhU=;
 b=DwOdih7sGDrbbhcSwC+qWyGjDe+94UJwMHuysFwT7U3+n8r7bB8c1g2zJRR3qexx0oXGHaXOubJb7+MzONJZvhFX45DYVn71AhSMS+SZlqEBH9BASCidhXqRe+8NkXWmP5YfcPxAKKPLNLCc8nSPL0ptm1Ss45zPH2SFxY2iFp4huEy8YfI9oouuZ2SS4DbJ81nQVnlW/zziR5xccVV+6sLkOz0zl8tfNFmK7sqz6s0DVsq+5F1ZzR8o+pgTtf6HrsLuKHqoIVkPgJV2/h4QIwXI8m0gF2Jk3u4h9Lc99l8yx0n3bFua3m6Q0K6KbITqjkl7rKMKgY3egDcOkC+mqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 5/9] xen: introduce assign_pages_nr
To: Julien Grall <julien@xen.org>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Penny Zheng <penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-6-penny.zheng@arm.com>
 <41a7389b-630c-6cf4-fa28-7d80cb79176b@suse.com>
 <e7e89abb-1601-0cdf-71d2-c22af86057c4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dab3331b-f3b9-4318-bf43-9f994c7d1121@suse.com>
Date: Thu, 1 Jul 2021 10:26:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e7e89abb-1601-0cdf-71d2-c22af86057c4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f00bab8-97a7-47f5-ba73-08d93c69fe82
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233544CDCFFFD4DAE269D227B3009@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WfOupHHZe+VofinmFWHwCgwUTzh3XPRv5NiyaHjsbjTudZksD5QJ8kxmKXganpHzImctcXyMJb8F/fOD7dNKP0KxrC+FrV1vcvcWipKzuRd6hYyagChh2jpvXljwiDXMOFjDXLK9D2WPI6KAtReaAyAgvN3Scdu4lc78SLn46pjJ2RDwZwJJNEZb7r4XIP2nTsW1UCMgMkLTL8Wzxh6XAI0GyOb7+gbh3vvUUR32b5wH/EoGduZhvgxVd7oBhMEnqpDBWRDFxAmogLz31jkZ0ltI7FKcYaLmWmqsrqJe1vBF5Rxa4bI9haj8B8T3yF8uCUn4ZTOane2c7lIKptPWHaR71oCwElDJPEsGeTNG9ZuE5ASTVxvO86xsinpua/zeYfi6+8AZ3F4/Njc1sqJWDHH3NwgP565SViA1BN7X87Hw4grQNQCQpYya13oyPwPzQimCqMrZQ8ozDgcEHr/FHCjvIf54Dr5hx2tv42/Iw5x2/5mtb1jOW3b+UuCsdZz+CkYn6Cvkj7PiXDld61yoxgvx/8BXJx7ybou62jZzepXKwsoTmewtlh2edyaPn+q8z+BzoGCZIBJbJHCKLQsFh4QHO2LYeJpyVf4XavsswMsvDHRu4y5IqkS/QLItcj4Bg6epKcqCfdJLOc0a8G3euyK+x06Im1h/+VBzhKiV35jWQ5VkfIWD+HpJRJjXjug8+wI/IICwLcoYwMLrEheAHlSOPnE3XouFbVMGyi3DrOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39830400003)(136003)(366004)(376002)(2616005)(956004)(83380400001)(26005)(2906002)(4326008)(36756003)(16526019)(186003)(6486002)(8936002)(16576012)(66476007)(31686004)(66946007)(478600001)(66556008)(6916009)(5660300002)(31696002)(86362001)(53546011)(316002)(38100700002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDFkUzlBeHdlY25keUR0YlpsUTFsWUVxeG9oaWVUQjE0dmVXb3V2L29tZWlh?=
 =?utf-8?B?YU1LcWI3bStYSFMycTlJVXlVWmZUSk81bnoyWXZQRW1CcXA4Nk1zTFpBZmpF?=
 =?utf-8?B?SG5ETW8zS0pYNndDeitacWN2ODBHMHlBNkhwZ1poY2tmWGI2bmFCREwyRG1B?=
 =?utf-8?B?eXh0Y0RzcnFYcVYzZDYwUmhLL3d6VTdKNmdZaVlhVVhVN3k4bGlQWDBUM3Vk?=
 =?utf-8?B?b0E1ekpDWVZvT2p2cm1DWVBQZ3FPRStPbnRNLzd1dURrUU04Q1BoYldhMkpZ?=
 =?utf-8?B?bkt6NW03M2pEVzkxVkhIS2VsK1BrZ0lJeGs3ZElTZlJYMmYwZTQ4ZldEOGdu?=
 =?utf-8?B?dU84UTBTOTQrbi8zUDlrLzFPTFRlcUZJUWpBWXY5K2ExdHdQZ2NHRU1BSTBq?=
 =?utf-8?B?NlVTd21iQ3kzQXhyWndLL1E5aktJcGVTbUN5Z1ltUjV1OUdLME56akhhcGx4?=
 =?utf-8?B?Ky9FeTZjdnBjZjBqbXNwZEo0WGovSGZOeGxWMWNRTnZBblhyWmRGQU85Z05K?=
 =?utf-8?B?djN3SmQxZU14UXBjN3ZCem5zM2laV2NMVG1hTFdyRE9BczBmS0t1cjMzbHdO?=
 =?utf-8?B?K1BvUUJkUVJFajRvb2RPR0VsdUtLaWxkWXhxdzZiSkRKRHJBYzNmTmNBMEpH?=
 =?utf-8?B?b3lpcWNvSmwxc2FjeHpKRDlnZ0pCWXhHaUUzUnQ5TTI4WTRMdzFzVUtQWHlT?=
 =?utf-8?B?ZmFjNnVNOWNSQlFqNGRNRnBMZUhoN1p0cXFtSzcySFU5T3I3MzA3U1BDeFFJ?=
 =?utf-8?B?ZzN4U0JYUWRvMmtnY2tOZzdDRDFlR2xxMXdhUFhnWUt2VDh6cHRCdldHOEx1?=
 =?utf-8?B?dkFYT2tVeGxweHNySVBQNVlXV1BNNE93WVRJN2NZb25hc0lERDNSZGdwbjFq?=
 =?utf-8?B?K1BQa3FQWkJDYmZpY08vc05xdmpjU1l6bUtBb2lzY2JCbWUzOW9pQjZLSXV2?=
 =?utf-8?B?aXJRUGE3ZExMaUIxbDQvVVZxMGlRZ0xJTU5aZkk0SkZRSEg5VzBoR3N1ZnB5?=
 =?utf-8?B?R2Y4TDMyd05jcklZYU42ZnMydlRPZ0Zta2o3di9vSG9YOS9uc2tIZkRtOVNX?=
 =?utf-8?B?cmxCSmhnRXVKeGl6aWZhM0dyNVRnMWlrTnBvVHNHNERhNHBwWGtzRGFPeThU?=
 =?utf-8?B?OGduaGUzNSt1cXlnNlkySXM0cW5QdEhPU3phK2xvK0FYZy9FYXV1bWxpVTdR?=
 =?utf-8?B?bWR5WVUvMjFibkpMbndlN3lwYjU5dmpobXVKUHBlWUloNzZqRGp0WitoeFVI?=
 =?utf-8?B?Z000eEE5akQyMnZTenB3cXJ5QWZQTG8rVUY3S1ptbVRtVmw1dElKSlpRSHlh?=
 =?utf-8?B?ckR5YlFjb3NKWldiYXprdXozZDR3MjIxUHFxSjVDMnV6U0ZNYm9Ka2lyMTdO?=
 =?utf-8?B?TXkxYmViWURFTzAvcTZxUzBpdHJsR3BONkpmZWl1cVNMbDdkVTFXZjU4Z1pU?=
 =?utf-8?B?QWRJR1VadXBnOVdvLzRMYVJqYmF4RDVGM1p4a1Z5VGgycUdwUENVcnhqMHJ6?=
 =?utf-8?B?VVY2eDFMcitqUVg1eDkxYlFDZEZtQllwVEZMUGwrbzFwSEgwOVRIc2lERFZ2?=
 =?utf-8?B?SDluRmh1N2hGYmNEWVl5SCthem83bGlxUTNzVHNwcytoTnUwbXVZTVRXU2xz?=
 =?utf-8?B?WHpMajZLOUNENllHTlR6SVlheG5qMEFDakkrcHg2K3NUSE5EVzJtbTJEejhN?=
 =?utf-8?B?cTRZbmxOTXlNTXdRVXZleHM0aXRWWnMzWDE0TWVNZkRkYTRXSGF1azJFTU9B?=
 =?utf-8?Q?9Jee3QpDkmnrnFBbXujldNSxzyyvx57CSjuOniA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f00bab8-97a7-47f5-ba73-08d93c69fe82
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 08:26:58.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7FyyUfTp9ZNs0bQl2wVNyVzjmfSGIKjfg+2PHCOPQQDz7pUX6TeefwsnxdALB8KI3B6+aQ0YQLeRQ6FZhLE0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 30.06.2021 20:29, Julien Grall wrote:
> On 10/06/2021 10:49, Jan Beulich wrote:
>> On 07.06.2021 04:43, Penny Zheng wrote:
>>> Introduce new interface assign_pages_nr to deal with when page number is
>>> not in a power-of-two, which will save the trouble each time user needs
>>> to split the size in a power of 2 to use assign_pages.
>>
>> First of all I still don't see why in this one special case it is a
>> meaningful burden to do the count-to-order conversion in the caller you
>> mean to add,
> 
> This sort of works for one caller. However, I would expect some more 
> user in the future (we use it for Live-Update).
> 
>> and hence why we really need this new function (to keep it
>> simple, you could even have the caller not break down to arbitrary
>> power-of-2 chunks, but simply iterate over all individual [order-0]
>> pages).
> 
> The function assign_pages() will always use 1U << order (and sadly 1 << 
> order). So we would end up to convert the count in multiple order for 
> then directly converting back to a number. To me, this sounds rather 
> pointless...
> 
> There are also a slight benefits to call assign_pages() a single time 
> during boot because it will reduce the number of time we need to 
> lock/unlock d->page_alloc_lock.

Well, all of this is why I did add ...

>> The more that I'm not happy with the chosen name, despite it
>> having been suggested during v1 review. _If_ we needed two functions,
>> imo they ought to be named assign_page() (dealing with a single page of
>> the given order) and assign_pages(). Backporting confusion could be
>> helped by altering the order of parameters, such that the compiler
>> would point out that adjustments at call sites are needed.

... this. Not sure whether you not commenting on it means you agree
with the proposal.

>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -2301,14 +2301,14 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>>>   }
>>>   
>>>   
>>> -int assign_pages(
>>> +int assign_pages_nr(
>>>       struct domain *d,
>>>       struct page_info *pg,
>>> -    unsigned int order,
>>> +    unsigned int nr_pfns,
>>
>> Even leaving the naming aspect of "pfns" aside, I can't see why this
>> can't be simply "nr" (of appropriate type, see next remark).
>>
>>>       unsigned int memflags)
>>>   {
>>>       int rc = 0;
>>> -    unsigned long i;
>>> +    unsigned int i;
>>
>> This is not an acceptable type change, at least not as long as it's not
>> justified at all in the description. While both Arm and x86 will be
>> fine this way, the code here is supposed to be generic, and hence would
>> better remain generally correct.
> 
> I would like to point out the code is already not correct as we are 
> using 1U << order or worse 1 << order :).

Indeed there are improvements (towards being consistent) to be made. But
this is not an excuse to make things worse here. At least one of the two
loops already properly uses 1ul; sadly that's only debugging code. And
of course something like domain_tot_pages() (and the underlying field)
dealing with "unsigned int" doesn't help consistency either. As it stands
we're limiting ourselves to 8Tb VMs, as it seems, and for no good reason.

Jan


