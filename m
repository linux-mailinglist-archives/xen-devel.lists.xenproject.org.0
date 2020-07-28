Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A324C230867
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 13:10:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0NUE-0003at-CL; Tue, 28 Jul 2020 11:09:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMAr=BH=amazon.com=prvs=4712fd9bf=elnikety@srs-us1.protection.inumbo.net>)
 id 1k0NUD-0003ao-Nm
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 11:09:33 +0000
X-Inumbo-ID: d036db5c-d0c2-11ea-a8a0-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d036db5c-d0c2-11ea-a8a0-12813bfff9fa;
 Tue, 28 Jul 2020 11:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1595934572; x=1627470572;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3Requ7kIPFVQtzR1jFatrXyBIb7TnieU1eKfFKFEi2Y=;
 b=mAie5v7UlX+RWi45EdTAqrIOaaX0AdGC6xcw5ZSOcZ2EaK3+OXRlTMF3
 EfSBnaccobsg3vlSnHLaUnXwCvKcBr+Yrr42O85ygDuuYQLPfFcNpxq+F
 79RLxaxl3FlTjtGX03vXj5bag4GVvG59sx72Mq9rbNvtP8yUmXp+Jn3I3 Q=;
IronPort-SDR: TxpgzrKoVN4IKCnHDU0jgqi0jdFjgJEyuTLyxPTtGoXoAEvXnXiN4TzJIywZV/NEkO2Pnm8f/H
 Pah0glIPdQfw==
X-IronPort-AV: E=Sophos;i="5.75,406,1589241600"; d="scan'208";a="63548064"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 28 Jul 2020 11:09:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3561BA1DD9; Tue, 28 Jul 2020 11:09:30 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 28 Jul 2020 11:09:29 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.162.73) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 28 Jul 2020 11:09:25 +0000
Subject: Re: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
To: Andrew Cooper <andrew.cooper3@citrix.com>, Eslam Elnikety
 <elnikety@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20200728083357.77999-1-elnikety@amazon.com>
 <a55fba45-a008-059e-ea8c-b7300e2e8b7d@citrix.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <09b2f75d-13d7-8f53-54a1-6f10ecd7b6e2@amazon.com>
Date: Tue, 28 Jul 2020 13:09:21 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a55fba45-a008-059e-ea8c-b7300e2e8b7d@citrix.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.73]
X-ClientProxiedBy: EX13D42UWB004.ant.amazon.com (10.43.161.99) To
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
Cc: Paul Durrant <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.20 11:26, Andrew Cooper wrote:
> On 28/07/2020 09:33, Eslam Elnikety wrote:
>> The macro timer_int_route_cap evalutes to a 64 bit value. Extend the
>> size of left side of timer_int_route_valid to match.
>>
>> This bug was discovered and resolved using Coverity Static Analysis
>> Security Testing (SAST) by Synopsys, Inc.
>>
>> Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
>> ---
>>   xen/arch/x86/hvm/hpet.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
>> index ca94e8b453..9afe6e6760 100644
>> --- a/xen/arch/x86/hvm/hpet.c
>> +++ b/xen/arch/x86/hvm/hpet.c
>> @@ -66,7 +66,7 @@
>>       MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
>>   
>>   #define timer_int_route_valid(h, n) \
>> -    ((1u << timer_int_route(h, n)) & timer_int_route_cap(h, n))
>> +    ((1ULL << timer_int_route(h, n)) & timer_int_route_cap(h, n))
>>   
>>   static inline uint64_t hpet_read_maincounter(HPETState *h, uint64_t guest_time)
>>   {
> 
> Does this work?

Yes! This is better than my fix (and I like that it clarifies the route 
part of the config. Will you sign-off and send a patch?

> 
> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
> index ca94e8b453..638f6174de 100644
> --- a/xen/arch/x86/hvm/hpet.c
> +++ b/xen/arch/x86/hvm/hpet.c
> @@ -62,8 +62,7 @@
>   
>   #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n),
> HPET_TN_ROUTE)
>   
> -#define timer_int_route_cap(h, n) \
> -    MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
> +#define timer_int_route_cap(h, n) (h)->hpet.timers[(n)].route
>   
>   #define timer_int_route_valid(h, n) \
>       ((1u << timer_int_route(h, n)) & timer_int_route_cap(h, n))
> diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
> index f0e0eaec83..a41fc443cc 100644
> --- a/xen/include/asm-x86/hvm/vpt.h
> +++ b/xen/include/asm-x86/hvm/vpt.h
> @@ -73,7 +73,13 @@ struct hpet_registers {
>       uint64_t isr;               /* interrupt status reg */
>       uint64_t mc64;              /* main counter */
>       struct {                    /* timers */
> -        uint64_t config;        /* configuration/cap */
> +        union {
> +            uint64_t config;    /* configuration/cap */
> +            struct {
> +                uint32_t _;
> +                uint32_t route;
> +            };
> +        };
>           uint64_t cmp;           /* comparator */
>           uint64_t fsb;           /* FSB route, not supported now */
>       } timers[HPET_TIMER_NUM];
> 
> 


