Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABBE810DD8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 11:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653821.1020444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDM6j-0000el-Th; Wed, 13 Dec 2023 10:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653821.1020444; Wed, 13 Dec 2023 10:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDM6j-0000d4-Qq; Wed, 13 Dec 2023 10:04:49 +0000
Received: by outflank-mailman (input) for mailman id 653821;
 Wed, 13 Dec 2023 10:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDM6i-0000cw-6J
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 10:04:48 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b97076b-999f-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 11:04:47 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1e35c2807fso889206066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 02:04:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 rf19-20020a1709076a1300b00a1f75d21bf3sm6746906ejc.6.2023.12.13.02.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 02:04:46 -0800 (PST)
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
X-Inumbo-ID: 0b97076b-999f-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702461886; x=1703066686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNiJZsoBYryJdjdOSl6hGATdLgRfPm1eIEa1SEoGZxY=;
        b=OTrUa9dY+3JQgBWxFj2rg9MS5DEE/+st9dKQMFR5gvjM/PUh23YVQmcE+oFIVfrSXD
         8TQPLsZoJ1gj4LRV0xk6U6vgntgmlOwsCq40aKGlDwVU5Tz8tXiiMND80iIiRpKbm+yl
         Tyktfi+EB5npwEK1bqm2cqO2HGhGA70y1heMK6f8WP21WIAMFpOmDyW7kksMjpOd5vFv
         58xXX7rsrHokRdYmgU2HRQnRDv1G5qoymNrE1rvNHvuHpIK+oBvsR8mcCLLAQfmp87J1
         WQLNHzZgLY9mXEKWyMy71Dug3Ym9Rug6y6gGdVizVW86XATSuz7wSvvVvutmXTVdPU/1
         Xq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702461886; x=1703066686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNiJZsoBYryJdjdOSl6hGATdLgRfPm1eIEa1SEoGZxY=;
        b=TuFEnMChHiwvr/cv0vKrHRUQAwAXAcJZpH2HMAXNxrYh0P6GKMc3didBD8sPj5Ral0
         9qRqmdXmvm1oR6WTYBtPJ4Fo3q4o4bLa1fAnIpehSJJLksOgUUX7ZEmHc5ad5DSMnxJA
         YmCPGmHgXV3TnVOKUpM/TPJt4xrzBhi/AZ5LeZd5cifPKU0X044Ie7MttbzfYZcewqIQ
         DwwJIpyeq8G4YIIu+oINDwdtbV17R4jJ16Y8AWQRAtaPW+KnOcLJUT3l2uMeJSvG0l9d
         40V6C/aq4/PrxJJtWVhclLejYv00Ei61CmMetnHtE3mz8fmv6MS7O5+htfrg07EEx9oG
         jGuA==
X-Gm-Message-State: AOJu0YyOzmvoNJ1la3Lf6N+VH3cK5OfGtgQXgSLXmj/NG3iRGRCMZdst
	xcRKwjGfAl3Hk62uLLNtoHYV
X-Google-Smtp-Source: AGHT+IFbgxt8N5O3tgkR1H5F0GjKYos2eDSpZGj99byJL9KXl3H0jptRoXWXdwn4J2G6CLqHjiSp6A==
X-Received: by 2002:a17:907:c91a:b0:a1d:b7b9:3266 with SMTP id ui26-20020a170907c91a00b00a1db7b93266mr3292677ejc.6.1702461886340;
        Wed, 13 Dec 2023 02:04:46 -0800 (PST)
Message-ID: <7e9256eb-1146-4373-b30a-571d3526882e@suse.com>
Date: Wed, 13 Dec 2023 11:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
 <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
 <2cccc696-a9d6-49ed-9b00-74de59884d43@suse.com>
 <fa87ab8c-b422-4a79-a32d-608c6c63ddf8@xen.org>
 <ea73d863-6ead-4b03-98f4-7ab873fa614b@suse.com>
 <0f922ab8-ecad-40f5-a63c-c3be9006a5be@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <0f922ab8-ecad-40f5-a63c-c3be9006a5be@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.12.2023 10:48, Julien Grall wrote:
> On 13/12/2023 09:17, Juergen Gross wrote:
>> On 13.12.23 09:43, Julien Grall wrote:
>>> On 13/12/2023 06:23, Juergen Gross wrote:
>>>> On 12.12.23 20:10, Julien Grall wrote:
>>>>> On 12/12/2023 09:47, Juergen Gross wrote:
>>>>>> Add another function level in spinlock.c hiding the spinlock_t layout
>>>>>> from the low level locking code.
>>>>>>
>>>>>> This is done in preparation of introducing rspinlock_t for recursive
>>>>>> locks without having to duplicate all of the locking code.
>>>>>
>>>>> So all the fields you pass are the one from spinlock.
>>>>>
>>>>> Looking at pahole after this series is applid, we have:
>>>>>
>>>>> ==== Debug + Lock profile ====
>>>>>
>>>>> struct spinlock {
>>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>>          union lock_debug           debug;                /*     4 4 */
>>>>>          struct lock_profile *      profile;              /*     8 8 */
>>>>>
>>>>>          /* size: 16, cachelines: 1, members: 3 */
>>>>>          /* last cacheline: 16 bytes */
>>>>> };
>>>>> struct rspinlock {
>>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>>          uint16_t                   recurse_cpu;          /*     4 2 */
>>>>>          uint8_t                    recurse_cnt;          /*     6 1 */
>>>>>
>>>>>          /* XXX 1 byte hole, try to pack */
>>>>>
>>>>>          union lock_debug           debug;                /*     8 4 */
>>>>>
>>>>>          /* XXX 4 bytes hole, try to pack */
>>>>>
>>>>>          struct lock_profile *      profile;              /*    16 8 */
>>>>>
>>>>>          /* size: 24, cachelines: 1, members: 5 */
>>>>>          /* sum members: 19, holes: 2, sum holes: 5 */
>>>>>          /* last cacheline: 24 bytes */
>>>>> };
>>>>>
>>>>>
>>>>> ==== Debug ====
>>>>>
>>>>> struct spinlock {
>>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>>          union lock_debug           debug;                /*     4 4 */
>>>>>
>>>>>          /* size: 8, cachelines: 1, members: 2 */
>>>>>          /* last cacheline: 8 bytes */
>>>>> };
>>>>> struct rspinlock {
>>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>>          uint16_t                   recurse_cpu;          /*     4 2 */
>>>>>          uint8_t                    recurse_cnt;          /*     6 1 */
>>>>>
>>>>>          /* XXX 1 byte hole, try to pack */
>>>>>
>>>>>          union lock_debug           debug;                /*     8 4 */
>>>>>
>>>>>          /* size: 12, cachelines: 1, members: 4 */
>>>>>          /* sum members: 11, holes: 1, sum holes: 1 */
>>>>>          /* last cacheline: 12 bytes */
>>>>> };
>>>>>
>>>>> ==== Prod ====
>>>>>
>>>>> struct spinlock {
>>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>>          union lock_debug           debug;                /*     4 0 */
>>>>>
>>>>>          /* size: 4, cachelines: 1, members: 2 */
>>>>>          /* last cacheline: 4 bytes */
>>>>> };
>>>>> struct rspinlock {
>>>>>          spinlock_tickets_t         tickets;              /*     0 4 */
>>>>>          uint16_t                   recurse_cpu;          /*     4 2 */
>>>>>          uint8_t                    recurse_cnt;          /*     6 1 */
>>>>>          union lock_debug           debug;                /*     7 0 */
>>>>>
>>>>>          /* size: 8, cachelines: 1, members: 4 */
>>>>>          /* padding: 1 */
>>>>>          /* last cacheline: 8 bytes */
>>>>> };
>>>>>
>>>>>
>>>>> I think we could embed spinlock_t in rspinlock_t without increasing 
>>>>> rspinlock_t. Have you considered it? This could reduce the number of 
>>>>> function level introduced in this series.
>>>>
>>>> That was the layout in the first version of this series. Jan 
>>>> requested to change
>>>> it to the current layout [1].
>>>
>>> Ah... Looking through the reasoning, I have to disagree with Jan 
>>> argumentations.
>>
>> I would _really_ have liked you to mention this disagreement back then 
>> (you've
>> been on Cc: in the thread, too).
> 
> Sorry for that. My e-mails backlog is quite large and I can't keep up 
> with all the series.
> 
>> Letting me do a major rework and then after 2 more iterations of the series
>> requesting to undo most of the work isn't great.
> 
> Indeed. But I note you continued without any additional feedback [1]. If 
> you were not sure about the approach suggested by Jan, then why did you 
> post two new versions? Shouldn't you have pinged the maintainers to make 
> sure there is a consensus?

I think this is unfair to Jürgen. We use the lazy consensus model generally,
and hence no replies generally mean consensus. Also note that it has been
very close to a fully year between my review comments back then and now. It
has been well over a year from the original posting of the RFC.

That said, I also understand that in particular RFCs receive less attention,
no matter that this is entirely contrary to their purpose. That's all the
same for me - I hardly ever look at RFCs as long as there are still non-RFC
patches pending review. Which in reality means it is close to impossible to
ever look at RFCs.

>>> At least with the full series applied, there is no increase of 
>>> rspinlock_t in debug build (if we compare to the version you provided 
>>> in this series).
>>
>> That wasn't his sole reasoning, right?
> 
> I guess you mean the non-optional fields should always be at the same 
> position?

I consider this at least desirable, yes.

>>> Furthermore, this is going to remove at least patch #6 and #8. We 
>>> would still need nrspinlock_* because they can just be wrapper to
>>> spin_barrier(&lock->lock).
>>>
>>> This should also solve his concern of unwieldy code:
>>>
>>>  > +    spin_barrier(&p2m->pod.lock.lock.lock);
>>
>> Yes, but the demand to have optional fields at the end of the struct isn't
>> covered by your request.
> 
> I note this was a preference and weight against code duplication. It is 
> not clear to me whether Jan agrees with this extra work now.

Well, at the time I said I think "that's a reasonable price to pay", to
further state "with some de-duplication potential".

> Anyway, I am not against this approach and if this is what Jan much 
> prefers then so be it. But I thought I would point out the additional 
> complexity which doesn't seem to be worth it.

It's not "much", I would say, but some of the earlier oddities (like also
the .lock.lock.lock) would be really nice if they went away.

Jan

