Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF27C7B1D81
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 15:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609704.948812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqvU-0006na-Kn; Thu, 28 Sep 2023 13:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609704.948812; Thu, 28 Sep 2023 13:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqvU-0006kw-Hy; Thu, 28 Sep 2023 13:19:32 +0000
Received: by outflank-mailman (input) for mailman id 609704;
 Thu, 28 Sep 2023 13:19:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlqvS-0006ko-Sm
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 13:19:31 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7adbc0b-5e01-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 15:19:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 13:19:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 13:19:28 +0000
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
X-Inumbo-ID: a7adbc0b-5e01-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz68zQTyJtiiVW92YrskSaMXKXNCXybXHC2quvrhgfLb4JRfy9+7TifjI+dN3qHB37DlcvDN9gNyWlghetG3lBlkG7SeGQsS86wMfYh2zyc+G2wX/ScOy+kQJGt8mmmWaVcexbgyNjS0sMt755IKObFVPZcnxM1Tq8wu3cV/QGuka8wnFMbbVsxXAXq6oDIS8DEh0TotGRJNBc2FztHJ1pd5As2nggX+i3l8kdiig0pJ0ZpEE7yFyDDe2t/hCGBel2KjB9R+Rd8ygyNXXAc3HGOaH4Dg5R0ks9FXDgC0F3GhHu5ji6kXIda1ng8NxOJWlamTfwom+T6KRLMdwqblBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV6fOoxT4lI+0q9BhmcjphMe+Os1d1bLqPZmkU063w4=;
 b=D3ngVyW2lhJCo42HYGuK47uIjFkFq27SofR4dD9h6uHJkxzAmSG9QlFNAJZEAUNGpKfiI5yxZ6gE/cZmil3CGV+MGD/2DTaa3X48wWQspSqgnAEJrWVNNdUjiB6NY4CClcQPkUgJoMQX2A7LDjNPzS0kEv5gWGp0aDWBrcOUyCwqRy2tCcqow8Vcaz8tYcaoZOhCoU43iH1uJQLm0H3KSAA6T6s7J9OICW5XC2rFyQBWSRe09/qFHUA4RklP7dcakrETlebvLF14rzEAqdSHY/JDjKzUkjoxE0o0xZuNv+ua1UgBm+EXypToQvTmNT+Pw6RYbZwda76IjC0LBRrxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV6fOoxT4lI+0q9BhmcjphMe+Os1d1bLqPZmkU063w4=;
 b=EBXkoZscjX7ZBwtHswYNTaHFVspKyLIwzdjaHNCLMg4zasZDcRqb1SoIUcYE4PiQzHNCsjbxCAoq9SWJ5YLU0lAyulimpyJ330gx3OM30GY/AUd9ExPGTGItU0pq+wZmEmnU8uJk1KwpeAeWBwsBHsQq3MEISv0FRUsaKR4LQRU8V34VxvFmwTmkG1bomAIX4RlYCtmAO4lA78Jr1hTuAbM1egpcUBhJLKqa8bbgoEOX3HvwXMuKi2maDI3Ykyts/1qwc3/qYaNQ9RM5KyVbmwLbJtgDxVejtnjt6+SVs54nNGvVxiON3r46/wei45AHpshpmdIEjitRQQimJY8ALw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b05190e0-f091-b52c-7d89-d72bd993fec9@suse.com>
Date: Thu, 28 Sep 2023 15:19:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 5/9] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <6047c192-0f37-e4ff-5980-fd137b3f1869@suse.com>
 <ZRVMhdyI8s4chr7b@MacBookPdeRoger>
 <d285a456-307a-0a36-0910-cb80f419627d@suse.com>
 <ZRVeiAFlyf1LJ2qR@MacBookPdeRoger>
 <CABfawhmAZGTaKZfmwY4t8599i6qKaTOJ-fngFmtvS4LhJMh7iA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmAZGTaKZfmwY4t8599i6qKaTOJ-fngFmtvS4LhJMh7iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdbed50-0012-466a-fcf6-08dbc0258ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P2i0UpFNiH1ddo/df91eE3lqtT+XuDAk4VRymBwYnKwb5hLvhICjzdH5CcLvY4FKCIDxP8V/Q62lCd0p6zrXKSB0aRbzEG93PaP8KWfzIiSRVyaErXSnwj4Hh714nvOIadLBNKpZkZOP+ZGwbhN9efgPtrR+O32Enmvw9wtf9NFQE07qDc45KTh6jfVJCm1lFsPsxZ0WPaapkbaYTUp8WiVOvhEL8VDYv23PvlQRBs59w5ffzruhU6m0c966+sFLwvf/V3Bwj/mRYIDCSQ3xzOcsZ0Z7NHhfXad+bI2LDQmAxG4Pgg6C9tXDljw6p9FGAphgmzHp1nTFpgSAXqZfI8b0CTgQXLnDbUcSettKtxCGEdw6SlaDEaYuAohlom0NaD/+q+W7/SGoBM7XTmXTvCKfk3Iylrk8kGuMZ0ELxRVj1wWa9th+STwayD0dGqu7Lg3i3JL4KbctxuLpDC0rK1B489QeoQb7pnQhvH6RqjYWYqx8PuNKdNzLt2+Nbc/ksl5ukntlv+e22mLeLmFvy92smifosH9+PzcfBwOKbMaUrTeF/yi80TfE5xpPZVQDopoL+PxYvxTLXJ8Z/ie/z2E87bk3lxvhx3BH8tg0wYXGERQQxyIzNGZVvUZjZ3oL3juLW2KsbkYGjhGNUWJ6TQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(41300700001)(31686004)(6916009)(316002)(83380400001)(8676002)(66946007)(36756003)(8936002)(4326008)(5660300002)(2616005)(6486002)(31696002)(6512007)(53546011)(86362001)(6506007)(54906003)(66476007)(6666004)(26005)(66556008)(38100700002)(2906002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHk3QXpDRDVGRXZSbFphbjR1U0x1ZEk5bFhwSFNDcFdLVEw1amY0UTNPYm55?=
 =?utf-8?B?Qjh5WEh2a3VkeGR0UUtyWEp3bmNmSzRFUm9CeDgwN29ZN2tjWmpGaE9GMHRV?=
 =?utf-8?B?V28zK1FkMDhEUUIwbnhobEt6dE1wSEs4ME5FaE03bG5EdktsN0FDOFY5VUMz?=
 =?utf-8?B?eFQ1MGQxcDJOTDdtaFYwZkRvTkZCUjIrd1pUNFRaNTg3MGg2dnRSdWcvOW4w?=
 =?utf-8?B?b2xwYmlFeDlvUlNwL3NLSDFVTzllejJybkd0QjdRZ0lKZFJLRWVUWFdib0pR?=
 =?utf-8?B?dHhvMnRESG0xK2xwN3NTb0N6akkwMDVRbXpzNnBmelBvOTdSNEpSQ2J0dWZi?=
 =?utf-8?B?ZXR1WGNvaTdHcWY3UlRPQmdSSDBUeGEzTk5nK0J5SXVhSTdadmNwcWl4dWV5?=
 =?utf-8?B?M011Vk9RQXZoN216V25ISGtSczJUT2N3WlBYa2pRaXRXOStYbGd6dTZPajBv?=
 =?utf-8?B?S1l4VTVxNHlpd2grUWYySDV2K2JDa1Z0NW9qazFNWFQ1djAvUmwvLzJ2dUk4?=
 =?utf-8?B?czJsTUV1VUVPb0NsOHRIeFA2RlJGVllBOWlrdUdPN3h0RTFScnZDVzlNZUJo?=
 =?utf-8?B?Tkc1ZmxGUmdIOWNCdTg2ZWs4VFB5dEJmUFFsRC9RUXkyZkNuYVNlSGFMZGZi?=
 =?utf-8?B?N3ZHN1FMZFl0QlEzRmI5WFl4bVpYZWVxNGRNQWlqUjZCLzNFRyt0aUI1ajBL?=
 =?utf-8?B?QzFNdUZOakdMR0ZQK1lwWVJOSjI3VDg0Rjk4RFhSek9IUERRUUdNVm9UUENX?=
 =?utf-8?B?d2ZuUG5SblEzNXZlVkYxZlVZRi9ERjlWK3QzaTlyK2IyOGJPM2N2Y2R0aWhE?=
 =?utf-8?B?MzBJMDNlNkJraVJrbTlhYzV5WGFsMVl1cXpnTHFjVlJrd01jNWRWb1F4cnFR?=
 =?utf-8?B?UWFsQ3h2WXJDVlJzc25ZVHNHMG9NTW5uTm0xeHhnMkNRMGJLQVhuaVdBWEU1?=
 =?utf-8?B?QjVxRllJT2N2dmxablppN0F5NVNjSE16L24vNWl4bmZVUWhVaWpOWWdtbW1I?=
 =?utf-8?B?L0VoWCsyM3pGUk4vaW1HYTlsZjhtNE9BdjNrVW5ZeGhpV3BoVmJoa0sxZW8y?=
 =?utf-8?B?WHV6Z05MVXU3Rmx6ZEp0SkxjRytvWGN3L0VtWEpxWkFZYWVQUVB5UmhyOHA5?=
 =?utf-8?B?OGJKK29lZTBGTWpVMXF6dy9icFdrTFY2RmVPV1d1cnJYMHJJalRpUXBzdkN6?=
 =?utf-8?B?NGhKNXN2eGlVTDJRNUd6aU5hUzYzZFZDTGsreno1TlFDdWdIdEFpc3JIZ1Ey?=
 =?utf-8?B?b2VZMlVnN0xTVUxjRGFCSjRGSG1NQTdIbld3eGU5MmFQVlFaWm5qWXdvVVkz?=
 =?utf-8?B?RlhEc1ViVGttaUFBOFo3VnhFQnk4S2F3S1RZK1lWOVF4YnJYUmNVeFJNdkdI?=
 =?utf-8?B?SldJeG5CaHN2Wml2S0RwSHVYY3BRQkpJVkZ6Z2hwUGh0bWh0dU1CMXNieENV?=
 =?utf-8?B?OEozc2FFLzZ5VG9zOEVhK2k5eVZHM1pGRFdra25XZzNZZ3JyQnJEdkRzVE9K?=
 =?utf-8?B?VFNDdi9uYThicjlKK0NsWWRSemFUSHB0bVhpSEJoOXJSdkRjeDhRSWxjQmow?=
 =?utf-8?B?Z1ZkTllvR2x2amNWbjUySGtjWVBiNm1Wd29LNjcvcHR5c29DbnFRSEJyWGRU?=
 =?utf-8?B?WkhJdi9IVFhqWDhjYk9EQWJaOXRSbDJDSTl5YjF6VXVEaDRMdzZ0YWZlc2JP?=
 =?utf-8?B?Z05LWGRaSzUyRGtOSWd3YjgyT2EzQ0VRNDU0TE5RYkF5K2Rad0VlR3Q3d3NO?=
 =?utf-8?B?WFplK1o1cWZNWEpZTEgrd2tSS1pISWNwZlduZytvWXVzbExXWXlNK3ZabDlN?=
 =?utf-8?B?blF6d0dSNERxRFZMT0lmeWVybXMwS2dLZUx5SzN0SmdMNEwvYTdZRWR5UTlU?=
 =?utf-8?B?Ym44MkZqakE2YzFkN1lJTmkyUzV4bGdkRkFaZU1rYXJvdy9LWE0vQlg1YnQ0?=
 =?utf-8?B?VThneVgxOE9jWWtQZ0MxQ3NTb0Q4WG9UczlxQjdLOG5CdHVLWlVUT2FXdHJh?=
 =?utf-8?B?K1Mrc0JPMEplRFdJM3N0dXVsS1JyWFJKazY0UDN5emZBQkEycERiYklOUVI3?=
 =?utf-8?B?Y1Q5a3hPc0pGMTFLSzYybEFudFQ4bGxFZXdTOHNOU2JLWmxLSW9QcENYSVJG?=
 =?utf-8?Q?nDTYCE0Qhl60RyQ1i1zzB4ehp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdbed50-0012-466a-fcf6-08dbc0258ae4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 13:19:28.0656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLBnKig+oajcwDrVe11hPwHSyaTXLpeRONfVstBzoipZbPesOsNc0SgusyU7jNccivRWbX0qxzlNZ+8OWsJSaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8774

On 28.09.2023 14:57, Tamas K Lengyel wrote:
> On Thu, Sep 28, 2023 at 7:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>> On Thu, Sep 28, 2023 at 12:11:02PM +0200, Jan Beulich wrote:
>>> On 28.09.2023 11:51, Roger Pau Monné wrote:
>>>> On Thu, Sep 28, 2023 at 09:16:20AM +0200, Jan Beulich wrote:
>>>>> +        /*
>>>>> +         * Map the area into the guest. For simplicity specify the entire range
>>>>> +         * up to the end of the page: All the function uses it for is to check
>>>>> +         * that the range doesn't cross page boundaries. Having the area mapped
>>>>> +         * in the original domain implies that it fits there and therefore will
>>>>> +         * also fit in the clone.
>>>>> +         */
>>>>> +        offset = PAGE_OFFSET(d_area->map);
>>>>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
>>>>> +                             PAGE_SIZE - offset, cd_area, NULL);
>>>>> +        if ( ret )
>>>>> +            return ret;
>>>>> +    }
>>>>> +    else
>>>>> +        cd_mfn = page_to_mfn(cd_area->pg);
>>>>> +
>>>>> +    copy_domain_page(cd_mfn, d_mfn);
>>>>
>>>> I think the page copy should be done only once, when the page is
>>>> populated on the child p2m.  Otherwise areas smaller than a page size
>>>> (like vpcu_time_info_t) that share the same page will get multiple
>>>> copies of the same data for no reason.
>>>
>>> I think you're right, but this would then be another issue in the original
>>> code that I merely didn't spot (and it's not just "copy for no reason",
>>> we'd actually corrupt what was put there before). IOW the copying needs to
>>> move ahead of map_guest_area() (or yet more precisely after the error
>>> checking for p2m->set_entry()), and in the original code it would have
>>> needed to live ahead of map_vcpu_info(). Once again I'd like Tamas to
>>> confirm (or otherwise) before making that change, though.
>>
>> Yes, it's already an issue in the current code.  I wonder whether
>> logic in the guest or Xen could malfunctions due to the fact that
>> map_vcpu_info() unconditionally sets evtchn_upcall_pending and injects
>> an event channel upcall, but the later call to copy_domain_page()
>> might unset evtchn_upcall_pending while the vector is already injected.
> 
> Sorry but I really don't follow the discussion here. My understanding
> was that map_vcpu_info, as its name suggests, maps the page. We use it
> to map a new page into that position in case the fork hasn't set it up
> yet but the parent has one. Then we follow with the copy from the
> parent so the page content is matching. If there is already a
> vcpu_info page in the fork, we just do the copy.
> 
> Now, if map_vcpu_info does more then mapping, then I don't know what
> it does, why it does it, and what happens if we skip it when the fork
> is reset for example. Is the suggestion to call it map_vcpu_info every
> time the page content is reset (ie after the copy)?

The vCPU info area (already prior to this series) and the two other areas
can be updated by the hypervisor at any time. Once one such area is
registered within a certain page, if another such area happens to live in
the same page, copying the entire page again would overwrite all updates
that might already have been made for the first area. IOW copying ought
to - imo - happen exactly once, when the new page is allocated.

As to map_vcpu_info() - just look at the function: It writes to the newly
registered area. Even if the function name says just "map", that's an
integral part of the operation. We can't just map it, but leave the area
untouched.

Jan

