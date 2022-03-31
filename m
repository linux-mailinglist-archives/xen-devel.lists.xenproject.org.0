Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048404ED45B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 09:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296689.505098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZosU-000837-S9; Thu, 31 Mar 2022 07:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296689.505098; Thu, 31 Mar 2022 07:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZosU-00080q-P7; Thu, 31 Mar 2022 07:05:54 +0000
Received: by outflank-mailman (input) for mailman id 296689;
 Thu, 31 Mar 2022 07:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZosT-0007Sb-4J
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 07:05:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 003ace48-b0c1-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 09:05:52 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-U7RqQfbvOmShN7mBTjwxwA-1; Thu, 31 Mar 2022 09:05:48 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB7869.eurprd04.prod.outlook.com (2603:10a6:102:c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 07:05:47 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 07:05:47 +0000
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
X-Inumbo-ID: 003ace48-b0c1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648710352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdrsWaLtmY2qMkmYlEuyZvgWuPbUEWDPCqkCJ5X+YuQ=;
	b=RGGfJyTSuq6onbxnMFKbFERVn9cUr6daSgaNVbSUiRB2Q9kiHoBpHyWqThHwtwsy73oRhn
	NauJ3d38iJn7p+klHCyjWNuWgpBaeWkiz0fHYKF0jjN5+q28KsKXBFPVzHSMYpRlNST3r3
	CdfVFDN7rIKlUg5Ysm+Zcm2eABleab8=
X-MC-Unique: U7RqQfbvOmShN7mBTjwxwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYXUtWD/6TWdeRNbjl+K6gQN9JnmmTixy0cHIPUAii4wIlGK+Can7yXqkF2rEc8QJ2h4p8OFNT3BFwx2nIQrE7znWspy76Nt3xQ6Wx23lbySRpUnK5B2KFiwsyhOxF0Hbg0QEdQToFnUcAdcbdXwmRAOanS9DuJQIBiu8SM0yNn1dFnPJ1SApsQQgiukOsFf/naeptJvkJT6MNVB09n+OMAeX9GraaHU/nJX1/2/YhJHvlqkTeHbyb3zJUW+Pru68PgzshFrZdOtdEFM7kfvba4CH3gCupi3whjuqpE1w2BoSv1m2awWATDlaloiqv92heT18r74jmlg7VE7NKP64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdrsWaLtmY2qMkmYlEuyZvgWuPbUEWDPCqkCJ5X+YuQ=;
 b=Ipml+zz4YIfc292yNnfkbAZZpW96Vy00Qw+53khJU5P8zdpx5/fq0YXf8CRcfJb4ORt/M/MSHLH6o73YPGxbT+JSQooUhAGnT1ADb0/MLaH9+g3o8nnsAQ6EN8SWblCzDUMlzIEbV3otvHt+4u8dn5kSv6JJ+uSBRDm4uYmPWGqh7V2Z8K9vRaqmbki5f+oN9uhRPCdUGwPuo/bW1FA0VThREczYhycc5lerpZTchOQ1wYpNWysEiw7HEVikUqWPqZfXU3v7IMCK/20JATbjOSwBx/+APlwXBYTvhSUlx3i94lK9eGluU73w0CjNq6EKtTCHnSrxhob0XOtv6qW+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eba664e6-4146-426b-5119-59fe02a96bb5@suse.com>
Date: Thu, 31 Mar 2022 09:05:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-4-Penny.Zheng@arm.com>
 <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
 <DU2PR08MB73251B78F8EB19E334A70876F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB73251B78F8EB19E334A70876F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0027.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5ab47c6-9347-41f3-5752-08da12e4e16c
X-MS-TrafficTypeDiagnostic: PA4PR04MB7869:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB78695B7538069E2E32ACAB2AB3E19@PA4PR04MB7869.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e681eFqJe4QSVKwQK7ErXb7NrGN5ntmC7KKEUYcssiZ2q2LNh/bqdccRBAq99xtLeuH2YOpMYwlhEQIAn5YEeWGGaDjHGkXexGKfkG3tkUvmwItUHcRJKar0xhQs3D8Op26jD6bvfPjnASSvtifou57hn04tt8/c1sGqIlJaNX9D8SfZydRXLTcKpCrF1+6FlM5IpHeNOLfGpMn7jG0c2T0bjl8HoN9U6tFkjxtrEkLJrGaruJPxXLddN6DnmHowy6gGSM/6Ws8/CzTjQs94NgCw1oeixMjvvUXs8D5K22tY/Dgk8B9+znYuSp5+d11MrYIDASsvZeUFk8MtROiPWq8p7e8ddEGUghXJ4WtZaXo/hPuOdrac5RFj8RBxnOssLjG5249EqCTBts91k9BxGgJd6pFXAATZLFFfxdkNemeatg6SkIpjM1KQ3X0w+ukSnRqGeL/qnl+mX7upFGqkBInRFnqX8lA2/D11tkVo8qzC3jogqMJ6Vz7z2L1jJP+iIa5tI7o4GrWBbr6zFOSSjTiEqsUUGoU4TSVJS65Pu3eWmZZjyh8TLnFF0WQar6JKo+lTJ3VqjQYQmVS20nVpNh167JkzO0AN/2UB4WHdxx3VzZZeQI4Ei2eblocLy6JkQ6kTqZ7aJ4RN5kG1yHNz4iVB/0rUxVmUI+dl5ijh38b17yJMm/LujBdRaLFkL+XFaUSlK49gEaeelkTNs4pxD59+O+AUUzgD+kkixNObRk5FWqD1fz7/s9azjPY9U8nZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(2906002)(45080400002)(6512007)(26005)(186003)(53546011)(316002)(8676002)(66556008)(38100700002)(66946007)(83380400001)(66476007)(5660300002)(6486002)(4326008)(36756003)(508600001)(8936002)(31686004)(6506007)(2616005)(54906003)(6916009)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNucFlSMExkMmk3dlNHUmltUkJweEdlak12a0RsRU43OVVocGVoNGpJQ1lG?=
 =?utf-8?B?TTFnc2h6bGVaMlVwTXVDeWhISDRxdm5zdi84YitiS2k1VXVEQllZZElYN2ZC?=
 =?utf-8?B?c1R3Vk4yYk5iYTJkMmJ6KzhreHFVV3BRMUdEYzUrek5oamRVaXhrVW03MVZu?=
 =?utf-8?B?ZWNGQ2pnVG91NFpGM3lhWS9HSFpLcU9nVkljYXZ5WWJBNmg1TS9PT3BPdloy?=
 =?utf-8?B?bVk1cElOMzdlRDA2cFRKUVZHQVJwZmptOWxVdm4wdnNPK2Z4QVd4Y3hxUnlL?=
 =?utf-8?B?WGdGY2NoRzBtVjRBNW1xK21MOVl3NzRqSFdmWktEanYreG01ekZmc2dsOW5P?=
 =?utf-8?B?WFhIQzk0MkhsTWZTenFUcGVyNHJseWdUN2s2dVYxSlJrTkxQTjdubHV1cVhv?=
 =?utf-8?B?YmpSUlB4VlBLVjllNTFXaWVjMUtFY2tJQkMzZkh3SnBuVXMxUStLZTRaNnZI?=
 =?utf-8?B?NUZFbi9IbFQxc05tVnA1dmRST0NNNmM0cjBMc1Q2VElnM21xU2t6dThxTUQ4?=
 =?utf-8?B?MGJZdldWbWpGRWFTTCtoN3Z3V3lsTThmUHZ1NkVnREZZSGs3TldqeTFBa2lS?=
 =?utf-8?B?bXBRL01QWUlKdkxOVis3ZnBaTVRjaUdTV1FQY3huSGsvaE1hTkJaTjZaWmU3?=
 =?utf-8?B?ZUN2eW5HeGhFN0h4SlFza0JtV2NHVmdJajhlVXZjWG85dVlhYS9LVWZYQVFH?=
 =?utf-8?B?ZnpEZVlIcEpVb2QwSDlRZms1Qm9qejlma01tckVGNDR4Q3hIL2paSGRFUG9F?=
 =?utf-8?B?dnQ5MjNSSnJzQkU4Wk8xRDJsKzNZRWJsUDk5THJkdU51WkVGYk1RdVd3ZEQ3?=
 =?utf-8?B?TUFPQ1luTlhJMUtFaTJwelF3RkR5VGQvNzFNOVZJakNDNkFkckJaVEdIUVhz?=
 =?utf-8?B?bDZVc2ltTVI4SjFhQW1tM2E0QWNZa0lzY1Jpb0s5YjIralhScktHWVVKVGJO?=
 =?utf-8?B?ZStpWm5ZcDZuNmN6Rm05UzdUMFZpWEN5L3dnVmFkVnY3WUc0Q3ZBUE9aSW1j?=
 =?utf-8?B?WnFLVU9VazMvN2hJZUtNbHVBcGxkU0xHbTdhYjN2M0ZMMDJ1WVpkaGg4SDUy?=
 =?utf-8?B?dmlla1pSaUZ2MGx3bFZFUTVZZkVaaVJpY3U1UWF0MXNlK3JoRWowSm85NFpy?=
 =?utf-8?B?U2VNM0FLUnJ3aE5zaXNKdHhaU1VsK3JXMStKbUVHVDhlK1VIT0w0c1lNRmNZ?=
 =?utf-8?B?TkV1QmNjTFQ5aXJVcXRnZElFTXpqVjU0MWVpS2VBbEtBb0ppT1UwckxqeDFl?=
 =?utf-8?B?clZKWkRlNFRRbEwyckRLbVlPVGs2WmRtTmtzSTMveHN3d1dtRnhMcEk1SnBI?=
 =?utf-8?B?bXJDQ0JhVjlJRWtraXpuTVpZQkhkY2lKRVZiZWRtUENQakpPNHFUaFlpRlZY?=
 =?utf-8?B?Z2I2RkRLOGRzbFNiN2N6WnVwVjQyZUtQOElvQUQ0cFZWckxrbkJxUFI4TjVR?=
 =?utf-8?B?WTRqNzV3TmxwdDZUc2hIbFREbHNLZVpwV2NUcDQraE5ySCt1amdQc08rQ1Ay?=
 =?utf-8?B?ODlYaEhTWENpTmRTTWZNd0FoQ1IwVEIxV3MvdWtBR1NXRnVYSWxXbnVDOXhy?=
 =?utf-8?B?R2R3aHlOV2Z0ZVpleW1raytUUTlsZE9WaEhTWFFOQ2VnU0h0TXpJT1ZGTllM?=
 =?utf-8?B?dW44ZDFPU2g5SzJiSDQ4a1NCS0QxNUxyUFZIbXJUdXhYODBJVXBHdVNMdXZw?=
 =?utf-8?B?U24ydUtRdno1K1dBRmowWmZKVjJrbjBTQ2JiRmVYSnhCVTBzZ1RUd2VoeHhy?=
 =?utf-8?B?am12WlJ0eXl0dUs2S0FuWjNpUGN1THpZQi9IUm1uU2lCU21aaW81cjBsREEv?=
 =?utf-8?B?RFROQkN0TmRxYWkwZWdxTjZ3SHUxdU1iQy8zVW9kVGwwTzFEM0RRK042cFBS?=
 =?utf-8?B?c3daV3lramFUVnB6MWVncldNc3RIa2x1MjdxbG1TNkVMSGt6dm1POWd5bUNn?=
 =?utf-8?B?Y3laNU9tWG9Ha1I2Y20wMGVqclNSRGNZRktFQ0NJMWJUOGJTTGxXTTlHWjlS?=
 =?utf-8?B?cnRFTTNtOHBmZk11NW9rdUpTVHhyRTE0YjJCako3YkRRLzdJMVZFbnYwaFhx?=
 =?utf-8?B?WmhRakZETml6cm1NWVZ4dUNTUE5FRWlIOGY2d2dnWkdIRjBub05vVnk5a08v?=
 =?utf-8?B?cG1wOWVLWForUUpUVSszbGlGdXhMMnl2aWNVT3Z4ai9kV0hCcWphOERzVGRL?=
 =?utf-8?B?SGN3aDJaV1VzcGFUQ3o5VHcvNUdKem5TZXNVcERJbFVFOE9xOHFxS2F4dFpl?=
 =?utf-8?B?U3lWNlJMc1pMNGEyQWc4R1BQVXVjeHFjUER2S09kOWhnK3ovZU9LdUNjMEdh?=
 =?utf-8?B?MTBaSXdGNVhsRVBsTm5BTmM5VHdYak1naDJXeSt3VHlGNGF2WTA1UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ab47c6-9347-41f3-5752-08da12e4e16c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 07:05:47.1569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1f+Pvcshdr6jEfZJlq6GC1EoPw8uKZuf/gqmAsyJeM13Ixhmk5aKo75TFp8wQxMKlAb7SsHBbdHVXfwbAdFlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7869

On 31.03.2022 08:13, Penny Zheng wrote:
> Hi Jan
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, March 30, 2022 5:53 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Henry Wang <Henry.Wang@arm.com>;
>> Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on
>> static allocation
>>
>> On 30.03.2022 11:36, Penny Zheng wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -35,6 +35,10 @@
>>>  #include <asm/guest.h>
>>>  #endif
>>>
>>> +#ifndef is_domain_on_static_allocation #define
>>> +is_domain_on_static_allocation(d) 0
>>
>> Nit: "false", not "0".
>>
>>> @@ -405,13 +409,29 @@ int guest_remove_page(struct domain *d,
>> unsigned long gmfn)
>>>       * device must retrieve the same pfn when the hypercall
>> populate_physmap
>>>       * is called.
>>>       *
>>> +     * When domain on static allocation, they should always get pages from
>> the
>>> +     * reserved static region when the hypercall populate_physmap is called.
>>> +     *
>>>       * For this purpose (and to match populate_physmap() behavior), the page
>>>       * is kept allocated.
>>>       */
>>> -    if ( !rc && !is_domain_direct_mapped(d) )
>>> +    if ( !rc && !(is_domain_direct_mapped(d) ||
>>> +                  is_domain_on_static_allocation(d)) )
>>>          put_page_alloc_ref(page);
>>>
>>>      put_page(page);
>>> +#ifdef CONFIG_STATIC_MEMORY
>>> +    /*
>>> +     * When domain on static allocation, we shall store pages to
>> resv_page_list,
>>> +     * so the hypercall populate_physmap could retrieve pages from it,
>>> +     * rather than allocating from heap.
>>> +     */
>>> +    if ( is_domain_on_static_allocation(d) )
>>> +    {
>>> +        page_list_add_tail(page, &d->resv_page_list);
>>> +        d->resv_pages++;
>>> +    }
>>> +#endif
>>
>> I think this is wrong, as a result of not integrating with put_page().
>> The page should only go on that list once its last ref was dropped. I don't recall
>> for sure, but iirc staticmem pages are put on the domain's page list just like
>> other pages would be. But then you also corrupt the list when this isn't the last
>> ref which is put.
> 
> Yes, staticmem pages are put on the domain's page list.
> Here, I tried to only destroy the P2M mapping, and keep the page still allocated
> to this domain.

Well, much depends on what you call "allocated". For populate_physmap
you then take pages from resv_page_list. So I'd like to distinguish
"allocated" from "reserved": The pages are allocated to the domain
when they're on the normal page list; they're reserved when they're
on the new list you introduce. And what you want to initiate here is
an "allocated" -> "reserved" transition.

> resv_page_list is just providing an easy way to track down the unpopulated memory. 
> '''
> But then you also corrupt the list when this isn't the last
> ref which is put.
> '''
> I'm sorry, would you like to be more specific on this comment?
> I want these pages to linked in the domain's page list, then it could be
> freed properly when domain get destroyed through relinquish_memory.

Clearly they can't be on both lists. Hence you can put them on the
new list only _after_ having taken them off the "normal" list. That
"taking off the normal list" should happen when the last ref is
dropped, not here - see free_domheap_pages()'s uses of
arch_free_heap_page(), recalling that free_domheap_page() is what
put_page() calls upon dropping the last ref.

Jan


