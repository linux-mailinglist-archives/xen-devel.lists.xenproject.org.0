Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F187EB03
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 15:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694754.1083831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmE1F-0001Jt-VI; Mon, 18 Mar 2024 14:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694754.1083831; Mon, 18 Mar 2024 14:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmE1F-0001HJ-S0; Mon, 18 Mar 2024 14:31:17 +0000
Received: by outflank-mailman (input) for mailman id 694754;
 Mon, 18 Mar 2024 14:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmE1E-0001HD-H0
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 14:31:16 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d09db4f-e534-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 15:31:15 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a46c0b40157so120532666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 07:31:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170906190b00b00a44e2f3024bsm4879318eje.68.2024.03.18.07.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:31:14 -0700 (PDT)
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
X-Inumbo-ID: 2d09db4f-e534-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710772275; x=1711377075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wrVp/XY+6S5ve9dYXYVPytiqX81mqwYE5sySayCRtpg=;
        b=KW5qp7dwoLAVLpZ86h8Nr2wTs7cyPZwhvqoSSgvwZ+lqPSaNw24dRVdJwSgioPG2JK
         LIYQxT4+0QGiD2JZJMr4Uh7SWDVNqTEKSjdaBgbjgfg/QzgUGxUvii/x4sYECiO4lBOS
         Rs1DfZVYZf6mIaS/CcbgK0h7AfQaV+/xNVj58K54P8770L+foUBBxhRECVjdwuhJJnqP
         zvRmZ4VmeyU/NPbOOPSl/v5h5HeXhvvQlaQgjLDvJmJxZgxaoRUP84CJ1Dv5kDZ45aVB
         zCo9C+SdL7r0g4KjyKe0Rn2t7F2IG1z4+rbsejpsmUzJBQ56RJkAlpBduRqRLBzifgG/
         e8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710772275; x=1711377075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrVp/XY+6S5ve9dYXYVPytiqX81mqwYE5sySayCRtpg=;
        b=e9oG7fm7Ay9jEfR/yUw/+4qponOJ9VY9NofgrEH8Pc8/zCTLbjQdf9pEh6bWsQE8ak
         /EeUC0JtaF0SMbt4aO67Zs+CnqgUGaTBd+xc772iMUv0hCMwwLGUvWTNgDozoZUiTPHk
         4nVBmUd7OS09Ohx5Vie5krOk92Hz6NEi+GE7+rnh5lRtwTrUYrW3ZOavKfK3d5vqRY6D
         gV6N80tGqKz1bDDRkjM8Br8d3eNtXF0VEW0S09z2ICNyQ2HciVIhQH5CY/2bcxsq1fGA
         4JZ9W96sFXy2YBKFAhT2jmc+CD+cGkjXmIc5k6P14ktfvG5W1B98WGSzMGbodPk3vT7N
         WzIw==
X-Forwarded-Encrypted: i=1; AJvYcCWAE6cM/aaZUEJayG/juFHUC1gpIhplEYzwnSCBPcyWcc633/niXQPRzGXn6qKyTPU6TO2BWWxThsmSRdUBAJM4t+l6B7TR17KO/72lc5s=
X-Gm-Message-State: AOJu0YzysgHM6ysfNlbD00j4z/XR3nbJlxH3w85I3HnPqurJ1+7t5/q7
	1lU3lknGnd7q9LAAEUgJJJej9rE9POQLFcN0PF3ijk9BBrOCSrLzGWKXSIHjow==
X-Google-Smtp-Source: AGHT+IFe7UIPLsNGypZ+1N7ZnzHPe5vLLzmY5y6Estp0zdhkvNS3g1EE3MaCZFpwg21UCfn1DB8otg==
X-Received: by 2002:a17:906:f75a:b0:a44:1fcf:9b97 with SMTP id jp26-20020a170906f75a00b00a441fcf9b97mr7244104ejb.24.1710772274800;
        Mon, 18 Mar 2024 07:31:14 -0700 (PDT)
Message-ID: <87b68741-71dc-407c-ab46-8dadcc0dfcef@suse.com>
Date: Mon, 18 Mar 2024 15:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen/virtual-region: Link the list build time
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
 <20240318110442.3653997-4-andrew.cooper3@citrix.com>
 <94622e8d-e5b9-4306-bc61-d37cd8078338@suse.com>
 <483c2375-26f9-442d-ba2f-c87cb2253178@citrix.com>
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
In-Reply-To: <483c2375-26f9-442d-ba2f-c87cb2253178@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 14:54, Andrew Cooper wrote:
> On 18/03/2024 1:25 pm, Jan Beulich wrote:
>> On 18.03.2024 12:04, Andrew Cooper wrote:
>>> Given 3 statically initialised objects, its easy to link the list at build
>>> time.  There's no need to do it during runtime at boot (and with IRQs-off,
>>> even).
>> Hmm, technically that's correct, but isn't the overall result more fragile,
>> in being more error prone if going forward someone found a need to alter
>> things? Kind of supporting that view is also ...
>>
>>> ---
>>>  xen/common/virtual_region.c | 45 ++++++++++++++++++++++++-------------
>>>  1 file changed, 30 insertions(+), 15 deletions(-)
>> ... the diffstat of the change. It's perhaps also for a reason that ...
>>
>>> --- a/xen/common/virtual_region.c
>>> +++ b/xen/common/virtual_region.c
>>> @@ -15,8 +15,19 @@ extern const struct bug_frame
>>>      __start_bug_frames_2[], __stop_bug_frames_2[],
>>>      __start_bug_frames_3[], __stop_bug_frames_3[];
>>>  
>>> +/*
>>> + * For the built-in regions, the double linked list can be constructed at
>>> + * build time.  Forward-declare the elements.
>>> + */
>>> +static struct list_head virtual_region_list;
>>> +static struct virtual_region core, core_init;
>>> +
>>>  static struct virtual_region core = {
>>> -    .list = LIST_HEAD_INIT(core.list),
>>> +    .list = {
>>> +        .next = &core_init.list,
>>> +        .prev = &virtual_region_list,
>>> +    },
>>> +
>>>      .text_start = _stext,
>>>      .text_end = _etext,
>>>      .rodata_start = _srodata,
>>> @@ -32,7 +43,11 @@ static struct virtual_region core = {
>>>  
>>>  /* Becomes irrelevant when __init sections are cleared. */
>>>  static struct virtual_region core_init __initdata = {
>>> -    .list = LIST_HEAD_INIT(core_init.list),
>>> +    .list = {
>>> +        .next = &virtual_region_list,
>>> +        .prev = &core.list,
>>> +    },
>>> +
>>>      .text_start = _sinittext,
>>>      .text_end = _einittext,
>>>  
>>> @@ -50,7 +65,10 @@ static struct virtual_region core_init __initdata = {
>>>   *
>>>   * All readers of virtual_region_list MUST use list_for_each_entry_rcu.
>>>   */
>>> -static LIST_HEAD(virtual_region_list);
>>> +static struct list_head virtual_region_list = {
>>> +    .next = &core.list,
>>> +    .prev = &core_init.list,
>>> +};
>> ... there's no pre-cooked construct to avoid any open-coding at least
>> here.
>>
>> To clarify up front: I'm willing to be convinced otherwise, and I therefore
>> might subsequently provide an ack. I'm also specifically not meaning this
>> to be treated as "pending objection"; if another maintainer provides an ack,
>> that's okay(ish) with me.
> 
> I think it's a very small price to pay in order to allow patch 4 to exist.
> 
> If you can think of a nice way to express this with a pre-cooked
> construct then suggestions welcome, but it's a really complicated piece
> of metaprogramming to express in a nice way.

I don't see any suitable pre-cooked construct, but something custom just for
this file might be to have

/*
 * For the built-in regions, the double linked list can be constructed at
 * build time.  Forward-declare the elements.
 */
static struct list_head virtual_region_list;
static struct virtual_region core, core_init;
#define ENTRY1() { .next = &core_init.list, .prev = &virtual_region_list }
#define ENTRY2() { .next = &virtual_region_list, .prev = &core.list }
#define ENTRY3() { .next = &core.list, .prev = &core_init.list }

such that they're all close together and hence the list arrangement can be
easily seen. Sure, that'll still require each of the macros to be used
exactly once. Maybe instead of numeric suffixes the name of the struct the
macro is to be used in might help:

#define ENTRY_HEAD() { .next = &core.list, .prev = &core_init.list }
#define ENTRY_CORE() { .next = &core_init.list, .prev = &virtual_region_list }
#define ENTRY_INIT() { .next = &virtual_region_list, .prev = &core.list }

This way entries also come in list order.

Jan

