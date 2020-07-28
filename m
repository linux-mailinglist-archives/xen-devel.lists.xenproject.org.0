Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7724F230BD9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 15:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Q51-0001nB-Td; Tue, 28 Jul 2020 13:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMAr=BH=amazon.com=prvs=4712fd9bf=elnikety@srs-us1.protection.inumbo.net>)
 id 1k0Q4z-0001n1-Ph
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 13:55:41 +0000
X-Inumbo-ID: 0601aeef-d0da-11ea-8b61-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0601aeef-d0da-11ea-8b61-bc764e2007e4;
 Tue, 28 Jul 2020 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1595944541; x=1627480541;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pzzlPohXMmuFAnHly/l4tQpx3Vs5iY/K7RWtn9IkALM=;
 b=luzQw0Ub/ZEG8XB56nG1vIOzPyA6JrfNjNU5vKbPJrGHRocmnUdE4zAZ
 +m7BrgALGfa5DTi5jISNSEN0hVJqkdDgwmV7OOBHhoa4Tpc1srkEEjxsx
 wv7kj+OxFf52qP/lWWvONfcqtcMh5tKzjCFRE/prcVfkE03RwVMqqRezz w=;
IronPort-SDR: wxGW1hOizBSJTCKJNeHfnK5OPCP0y/k3J+p298XYpIu9T4V35758RHm9JFsVkQbbgWJpEXjoas
 d4UdRxnc0/GQ==
X-IronPort-AV: E=Sophos;i="5.75,406,1589241600"; d="scan'208";a="45986696"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 28 Jul 2020 13:55:40 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 5D6F9A20CC; Tue, 28 Jul 2020 13:55:39 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 28 Jul 2020 13:55:38 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.65) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 28 Jul 2020 13:55:34 +0000
Subject: Re: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
To: Andrew Cooper <andrew.cooper3@citrix.com>, Eslam Elnikety
 <elnikety@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20200728083357.77999-1-elnikety@amazon.com>
 <a55fba45-a008-059e-ea8c-b7300e2e8b7d@citrix.com>
 <09b2f75d-13d7-8f53-54a1-6f10ecd7b6e2@amazon.com>
 <da2eb826-5652-6020-0738-27f55659925c@citrix.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <9a3970c8-0186-45b5-d608-838f42f726d8@amazon.com>
Date: Tue, 28 Jul 2020 15:55:29 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <da2eb826-5652-6020-0738-27f55659925c@citrix.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.65]
X-ClientProxiedBy: EX13D28UWC002.ant.amazon.com (10.43.162.145) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <pdurrant@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.20 15:46, Andrew Cooper wrote:
> On 28/07/2020 12:09, Eslam Elnikety wrote:
>> On 28.07.20 11:26, Andrew Cooper wrote:
>>> On 28/07/2020 09:33, Eslam Elnikety wrote:
>>>> The macro timer_int_route_cap evalutes to a 64 bit value. Extend the
>>>> size of left side of timer_int_route_valid to match.
>>>>
>>>> This bug was discovered and resolved using Coverity Static Analysis
>>>> Security Testing (SAST) by Synopsys, Inc.
>>>>
>>>> Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
>>>> ---
>>>>    xen/arch/x86/hvm/hpet.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
>>>> index ca94e8b453..9afe6e6760 100644
>>>> --- a/xen/arch/x86/hvm/hpet.c
>>>> +++ b/xen/arch/x86/hvm/hpet.c
>>>> @@ -66,7 +66,7 @@
>>>>        MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
>>>>      #define timer_int_route_valid(h, n) \
>>>> -    ((1u << timer_int_route(h, n)) & timer_int_route_cap(h, n))
>>>> +    ((1ULL << timer_int_route(h, n)) & timer_int_route_cap(h, n))
>>>>      static inline uint64_t hpet_read_maincounter(HPETState *h,
>>>> uint64_t guest_time)
>>>>    {
>>>
>>> Does this work?
>>
>> Yes! This is better than my fix (and I like that it clarifies the
>> route part of the config. Will you sign-off and send a patch?
> 
> Any chance I can persuade you, or someone else to do this?  Loads of the
> macros can be removed by filling in proper bitfield names in place of
> '_', resulting in rather better code.
> 
> ~Andrew
> 

Sure, I can send a patch for this one occurrence at hand right away -- 
and I will keep my eye on the general pattern. Since the patch will be 
mostly your diff, please send your sign-off (or another tag as you see fit).

Thanks,
Eslam

>>
>>>
>>> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
>>> index ca94e8b453..638f6174de 100644
>>> --- a/xen/arch/x86/hvm/hpet.c
>>> +++ b/xen/arch/x86/hvm/hpet.c
>>> @@ -62,8 +62,7 @@
>>>      #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n),
>>> HPET_TN_ROUTE)
>>>    -#define timer_int_route_cap(h, n) \
>>> -    MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
>>> +#define timer_int_route_cap(h, n) (h)->hpet.timers[(n)].route
>>>      #define timer_int_route_valid(h, n) \
>>>        ((1u << timer_int_route(h, n)) & timer_int_route_cap(h, n))
>>> diff --git a/xen/include/asm-x86/hvm/vpt.h
>>> b/xen/include/asm-x86/hvm/vpt.h
>>> index f0e0eaec83..a41fc443cc 100644
>>> --- a/xen/include/asm-x86/hvm/vpt.h
>>> +++ b/xen/include/asm-x86/hvm/vpt.h
>>> @@ -73,7 +73,13 @@ struct hpet_registers {
>>>        uint64_t isr;               /* interrupt status reg */
>>>        uint64_t mc64;              /* main counter */
>>>        struct {                    /* timers */
>>> -        uint64_t config;        /* configuration/cap */
>>> +        union {
>>> +            uint64_t config;    /* configuration/cap */
>>> +            struct {
>>> +                uint32_t _;
>>> +                uint32_t route;
>>> +            };
>>> +        };
>>>            uint64_t cmp;           /* comparator */
>>>            uint64_t fsb;           /* FSB route, not supported now */
>>>        } timers[HPET_TIMER_NUM];
>>>
>>>
>>
> 
> 


