Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C381425352
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 14:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203538.358674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYSk3-0006td-Ir; Thu, 07 Oct 2021 12:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203538.358674; Thu, 07 Oct 2021 12:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYSk3-0006rO-FG; Thu, 07 Oct 2021 12:43:19 +0000
Received: by outflank-mailman (input) for mailman id 203538;
 Thu, 07 Oct 2021 12:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYSk2-0006rI-4G
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 12:43:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f840d157-8c08-49ae-9a12-acac68b9cd35;
 Thu, 07 Oct 2021 12:43:17 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-g012MywgMj2eNly-IK6uWg-1; Thu, 07 Oct 2021 14:43:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 12:43:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 12:43:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:20b:310::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 12:43:09 +0000
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
X-Inumbo-ID: f840d157-8c08-49ae-9a12-acac68b9cd35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633610595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ads2pLpEmPIshtguItxijndEtuL6sIznRl/P3HMXu0M=;
	b=Eja6GmXw8bXJhnpxfywpQVULB8j2u5hhnFN99dECDRCzlgDB4ge4q6rIx2qgb8eYW9oexn
	cIO+/8fL1YZO8/cywkDXIWc2j9fPwdtwU2rW1yX1SSwsjgQkeMlQQHLvtZwnIpaEUbJtoB
	ppOWtnMxbixbbWMV41wweLum3K7Zq+k=
X-MC-Unique: g012MywgMj2eNly-IK6uWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJdq3aTAqJQDaCp9ng1KJifpJEVPf7V//AdWapPYiyDN03vXKrrgjw66riDnh5sxfvg1TKNxKiozmZBTZrsHOLPXMp9N4wx7fby+waKby92YQdizDarLNfzU8EkT0Ap4ZoU8QypVC8liA+KRFbHohwS29ur4lGXrKfZhuhGWxEOSG999+P2rNQwT4bRsYNnaKxKnihtLaTtwz2KVcuNF9wU3bq8KdZY35FzW1DtVygnZNfLvWLDYnoqRc9zgirspGG53B1ROzPWYnXT5pqxQM0+jor5lEZlU064L+gZmAyZyucHjWWZCBNIGcIujucJLMAiLKzhpboWRZ98e/ik+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ads2pLpEmPIshtguItxijndEtuL6sIznRl/P3HMXu0M=;
 b=XZJcWXppwLFtO/s/EL5uv7O+R5IL8HG1UThFhKuw/TppuP5Lg84POT+VzNDpNmSdDXSVCAuGCana6HcZNzjJBH+3EFNpzEI2SwFWPyoLUiEy5v2dkA1VGGTZJT4hW8y4cveD6jOEn8IdBirA11TyUNclraG5HezL9rO/luT5NoRjF/dALdC+oTNhaArLtRlTYu4R9OIB6cpLdgxUXC/eIeHYNUT8uQYgKZtsobTvfoeJ2V0dHBi5lBOQoxYRdg02nOFq05WhpP7IRbQuXin4OTm6GOpcXvfAodxhFuFpMUz0MxA7/D7SG787QyGjJzTlEBLMS0Oz4H9VyOv9vCaw2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
 <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
 <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
Date: Thu, 7 Oct 2021 14:43:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48c018b5-0ff9-4e09-02d7-08d98990053e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5166B32ECEB2F644985BD014B3B19@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eJbik7Uj2nxGCtbHA+WQUQakjZMhJfn2Dtw/eMcRvL7QBIwcW+VFGzfsTk89jb10NHD7IeW+YvgbqavVLCqFMWgNaeaT9LIP8oCaYnYYEJ9pdgQ1nPzUGo1oefIRbbpjQ8Z9PFVgEe7DUaJi50Txkab7rT28rjc7D5bLTDG+qwMwJ2j/tl86acqvFBitlxziDyI+wFE5IdcaxawV7HYbr4A9ItaQy2HoyrSFCTakrcePNyZrUZwWB4euqxJ+4NOjEu+QzyJz+n39N/YiJhEHYCh1yibOIH+ci7rgdEfgsA5C+9RV79rat1qTDxQMqpiwk/nXVHtPHY4/KhDH+T91NdUlMlA4h1xDWUOLbeNuz5G7RmF21k+Z7Cluclb3R3SjuCWW8ZJSIJOK93VRqiWYBbBFeCQK1ZYFdzmp+ZHNzPyi37xIyuqzlyEyqpQFW0V55dsl0TL/5lx22sPWgk+d3VgdE7whOJxfmVNNyRcGmq94fvgkNVD+MLXpELcewbdRgrp2t1z8VTsVhwxeiP7+IdCCoOP0jGxOt/VHc6z/JN3qSM8JrdmVOidOtZVz9bkZ+9XJE8saRkt4rHyj7TtyBXfCfSQtDJwSD7VOU93zHx2u6HN6ZnYExp6mPmxn/BjFh+g3/rwVDruf09whcoEUx+nBM5evjOD3GU95MrUmWBjYg8YZ1OSPqDjFa5p4KXdvYoePrG4smeC2yqhOYUa+7jqzQatjHHGRWRIzhe1Fnni5E3lDTT+1aAFn0Eyqnu7v0j/h6lV6On6LRkB6E0Dq+tjx8kOyMMmvQtVOaMMIpMIgiTrcD8AfVPKd7A/C2aiPZI6R045AlQiR0RXqnwC+cQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(31686004)(2616005)(316002)(16576012)(966005)(8936002)(66946007)(31696002)(2906002)(5660300002)(6916009)(86362001)(508600001)(54906003)(38100700002)(26005)(186003)(83380400001)(36756003)(53546011)(6486002)(66476007)(8676002)(66556008)(4326008)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUdrZTMybk5qb09obHl4Q3NUZjEvY1Z4MmlpWTh5eXZUTDlRZjRwZFJzZU0z?=
 =?utf-8?B?N3RaczBXeCs4VWMwQ2djcVh5a2tLZUtHZmFGelZ2R0w2eTRUK1Zmak13d212?=
 =?utf-8?B?dU1yRHNIa0JOWk9vTTF2MzVUNHdrOERpa29OUnpSY3pwWmFoakhFWHlTenpp?=
 =?utf-8?B?NldEdnh2Y0w3T25hZmI5dkUxZXlJdnFYSnlvajhFVnhVblRBemJPZE5uckQ2?=
 =?utf-8?B?Q29uVTIrOUpTS28vdkVGZmZXUnlOZVZxVGJJdFg2d3pwZFh3S2gxcHZFZEVB?=
 =?utf-8?B?czZhTDZZTVVPaVVhT3E4czV1ZW9udG1UZkt2OEtGVjJTTHhmSlZzbWMrMS8w?=
 =?utf-8?B?V2dwcTlNS1NGRGJRckZqMGt2dVpVZStCNzNSRUFtVEF5SUNhQi80dEthT2pY?=
 =?utf-8?B?bGs2SmViL0h0QStWdjJnekp6ejY4azRQLys3cEpWUjNnZkpOcUZQT3RnTVBM?=
 =?utf-8?B?Vjd5OVBER1IzYWIyeWFTdzBPeTV6b0p4S2dYV2NET20yWFJKbUtvWjNseU40?=
 =?utf-8?B?RS9TSkY4U3N4NVNTYmJqSmw1ZkxhU3BDMHR4aGRLcXM4TDNKL3dKdDJBU05K?=
 =?utf-8?B?U0NWUGtUL2o3N0h4U25nd2FLL0UzSGJIb21zZjRyMEVlSmtuTGFGN3N2NnEx?=
 =?utf-8?B?V3l3MXVtMnlMV2JkQVJ3QVhjNjAzaWVqNnJwbFRNWnkvOFBrQ2huelhsdmhm?=
 =?utf-8?B?VlRiTHg4NEhIYTViQzRkNXVYelRENit4YU1mVzdRSDRxcDR2Z001d0FtSlh3?=
 =?utf-8?B?WEJCZlhXN3dQTnZWNk9YUDhLN005WHNuUU5tSVZJZXh4VmoxSjlPVDJPTkpB?=
 =?utf-8?B?bFJlYUZJQVBISkhPMzhKV3NEbmtrWVFORU5ab3Z3QWVFbTdyVHYxeXRpWmds?=
 =?utf-8?B?M0pTMGcyMGRuSE9qM3pkU0grL21IZ01hRWRVU25EMSthczFxWWlFaTZxVUJZ?=
 =?utf-8?B?R3MxdVh3QXRBMmJhWURaZ0xmSFB6c1JicXMvY3FHaGR0RzdLK1BnR0hsWmZV?=
 =?utf-8?B?bUdSZHZobDBpbzhEV3JlR2ZzL2lqczI3VVZXQTF4bU1mTXRtVUVzODlYc1o2?=
 =?utf-8?B?YWpRc2x4NnR5dmxxemNQVHlBbjRQOVhCVlZDaEJZb2swTzlLbVB1U3N0M0xB?=
 =?utf-8?B?VHB4c2N6UnBGa09SbkdvOWJXbzhRdDREdkJCaWI3eDJwZ29uMnlrdmc3TmRs?=
 =?utf-8?B?SFpNRlZhRm1BY3pYSGxJb2IwKzN6WDVEUU5wb0NEanpaRllLZVFDK2hRbjlz?=
 =?utf-8?B?WHl6QTVBR3hOOUllS2pKUEpUeHJrYVc3TjRJdk5WRE5uMUZGaDdjL2NLT2lK?=
 =?utf-8?B?c0tweDhXcm1TNzBhaTUrZVM4MHZxUVlzNW9UZDJlaFpuN1cwVlZ6R0RzR2l0?=
 =?utf-8?B?WDdkUTRqd2hqMnZZV1QwVVVKNGl4cXFjb1hNdGtTSkNUR1hZR0JHYmZxVjdU?=
 =?utf-8?B?cHVhT1NETUQyZlJPcmF4bFVFUWgvaTA3NVM0cGtKZzZxSTVEV2VWTTl1SE8w?=
 =?utf-8?B?QUdwNEtUQ1o5Q0EwTEk5ajJGS1dGaUV5SDFvVFZ5YjVLL01RN2JiWi9JUG1s?=
 =?utf-8?B?VldkTFRkWWRkLy91MFNOUU9LUThrWTZDbzNYNGFCbFRSdXlJRlNFMmJuYnpl?=
 =?utf-8?B?dXJ5c25ubm5MTFBXbkE1Ymh5MTJWWGtMa0pTa3RIdFR0REppZjlYclA3dy9q?=
 =?utf-8?B?bCthZTNyaUNwcTJNVW5aQThRQUdXVHE3SjJaZVhiYmRRanBmY0RYL1VnajJz?=
 =?utf-8?Q?vYTrbBDxfFgXjCXZClGgC0IaEL77KQX7HfRSGhm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c018b5-0ff9-4e09-02d7-08d98990053e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 12:43:10.7900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifnR+VQ2gVtJ2lHCaXs+QGjoCSul+kadCgUhs8FNz4ULTTow38J+6rq+rRdbxbqqk/TarRdTXzXvotT9fTkkYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 07.10.2021 14:30, Oleksandr wrote:
> On 07.10.21 10:42, Jan Beulich wrote:
>> On 06.10.2021 13:22, Oleksandr Tyshchenko wrote:
>>> Changes V4 -> V5:
>>>     - update patch subject and description
>>>     - drop Michal's R-b
>>>     - pass gpaddr_bits via createdomain domctl
>>>       (struct xen_arch_domainconfig)
>> I'm afraid I can't bring this in line with ...
>>
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
>>>        *
>>>        */
>>>       uint32_t clock_frequency;
>>> +    /*
>>> +     * OUT
>>> +     * Guest physical address space size
>>> +     */
>>> +    uint8_t gpaddr_bits;
>> ... this being an OUT field. Is this really what Andrew had asked for?
>> I would have expected the entire struct to be IN (and the comment at
>> the top of the containing struct in public/domctl.h also suggests so,
>> i.e. your new field renders that comment stale). gic_version being
>> IN/OUT is already somewhat in conflict ...
> I am sorry but I'm totally confused now, we want the Xen to provide 
> gpaddr_bits to the toolstack, but not the other way around.
> As I understand the main ask was to switch to domctl for which I wanted 
> to get some clarification on how it would look like... Well, this patch 
> switches to use
> domctl, and I think exactly as it was suggested at [1] in case if a 
> common one is a difficult to achieve. I have to admit, I felt it was 
> indeed difficult to achieve.

Sadly the mail you reference isn't the one I was referring to. It's not
even from Andrew. Unfortunately I also can't seem to be able to locate
this, i.e. I'm now wondering whether this was under a different subject.
Julien, in any event, confirmed in a recent reply on this thread that
there was such a mail (otherwise I would have started wondering whether
the request was made on irc). In any case it is _that_ mail that would
need going through again.

> I thought that a comment for struct xen_domctl_createdomain in 
> public/domctl.h was rather related to the struct fields described in the 
> public header than to the arch sub-struct internals described elsewhere. 
> But if my assumption is incorrect, then yes the comment got stale and 
> probably not by changes in current patch, but after adding 
> clock_frequency field (OUT). If so we can add a comment on top of arch 
> field clarifying that internal fields *might* be OUT.
> 
> 
>> One of the problems with
>> _any_ of the fields being OUT is that then it is unclear how the output
>> is intended to be propagated to consumers other than the entity
>> creating the domain.
> If I *properly* understood your concern, we could hide that field in 
> struct libxl__domain_build_state and not expose it to struct 
> libxl_domain_build_info. Shall I?

I'm afraid I'm lost: I didn't talk about the tool stack at all. While
"consumer" generally means the tool stack, the remark was of more
abstract nature.

Jan

> [1] 
> https://lore.kernel.org/xen-devel/093bc1d5-bf6a-da0a-78b5-7a8dd471a063@gmail.com/
> 
> 


