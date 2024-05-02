Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C4E8B94BD
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715552.1117272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Q3J-0000PW-DW; Thu, 02 May 2024 06:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715552.1117272; Thu, 02 May 2024 06:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Q3J-0000NF-9O; Thu, 02 May 2024 06:36:21 +0000
Received: by outflank-mailman (input) for mailman id 715552;
 Thu, 02 May 2024 06:36:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2Q3H-0000N1-NA
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:36:19 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47951d1f-084e-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 08:36:17 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41ba1ba5592so40611775e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:36:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z18-20020adff752000000b0034e19861891sm430398wrp.33.2024.05.01.23.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 23:36:16 -0700 (PDT)
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
X-Inumbo-ID: 47951d1f-084e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714631777; x=1715236577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zgd5O08lB3GVxDkuAEkT5TAjyO3f5o57F518B1Bh+c=;
        b=LH5SpfssKMDwPp6XkzhvXufPGtw/bENv9TaSOZlq+U/5FQWdNAJdqzj1sQeLBmxf3Z
         1x7fnkR+is6EJkEcVWciYYIGhd2lS5jIW+Z3XajdJ3pA8nGt89EvfdsW/wQLPrPiU5mt
         7Uk76x3GHaocp2U6MpWSXvXJBLcTL2iPE9h7Kn4h9RmQCrcFMLq5OpJ0i+8N8smnqbER
         gHO2qTuBEiEpwf6HjkfYgIHM1+DpcqdJVtBdjXFN63yfwb+ddpRUa0xVFjBqpUecvWu1
         twvz69KcMVIEN80giSD9i3leLvNqBaacSFUsJ1kymVnMe+6ikh6IA+8cySYT61TOhuRe
         9O3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714631777; x=1715236577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zgd5O08lB3GVxDkuAEkT5TAjyO3f5o57F518B1Bh+c=;
        b=lumq2KFBtr8VuMYrbixnaEwploAdRmtwmeILybActUwnkh6m2VjG92yybeC5emZ7ty
         K884rAXnL9Xtu1seQ6B8eBLlWKD9Me/8x9UMFm1JQ6u8s1eceYtWI1zGsSYLxo2Os/g6
         +l6CRKPQq5pU1bY1HXNcUwfLzDWm7upbAl8kO6l2tPkSScWYAwr6QmWK0IG0MgYkaP6t
         OW+5DMoOd+x+7x2cFQNArEds4SKWP8F23uqy5EkMtW4Ulk7PXKBtaijXiRHjVVcXXrG9
         CuHFB/5G6F1VeMhTUjPXSogfOvI2J0nwfObJ1rwcpzTqy/lWN6QY3gHAt82p7X5Yn7Ue
         kgQA==
X-Forwarded-Encrypted: i=1; AJvYcCXKdV0IngduRYBVdILWlgzWcuZWQpwI1JsajsVFZyeXY/SYSkg1QqstBknzAbA0xr8AycSPamECM2X7wVtIqSpKwhScPQVr973ZU+ZwvvU=
X-Gm-Message-State: AOJu0YxXByOkh8ZAZ1TD5K7zAwEIWaNjmzkdkDgghP8Z2qDD39KXJnrt
	kl7TzBuXKFvIbqMjLAfIQGLfjB05Y1qPPndbAcowdv+GS4cvPTtBMHXHkmCPMBwZ1EswKi0dBvY
	=
X-Google-Smtp-Source: AGHT+IFvbz4GmEz1n6lESs/vvvzNkIIt4udh1z310njh8y21NGKVHJF2AtrixRd6FlONhwUFq4FVwA==
X-Received: by 2002:a5d:4011:0:b0:347:3037:188d with SMTP id n17-20020a5d4011000000b003473037188dmr935046wrp.34.1714631776866;
        Wed, 01 May 2024 23:36:16 -0700 (PDT)
Message-ID: <115a6513-559c-44d9-a828-10d1e4e5c401@suse.com>
Date: Thu, 2 May 2024 08:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] x86/hap: Increase the number of initial
 mempool_size to 1024 pages
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714322424.git.w1benny@gmail.com>
 <a26bc4aeba89f7895c79df7e320adfc695b16d50.1714322424.git.w1benny@gmail.com>
 <4d9930d4-4379-4440-83b2-14ebffc7c03d@suse.com>
 <CAKBKdXgAgb=+Spr_nobWy_zuN-yXTUfAL+Q3MdLDCDVgshOS7Q@mail.gmail.com>
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
In-Reply-To: <CAKBKdXgAgb=+Spr_nobWy_zuN-yXTUfAL+Q3MdLDCDVgshOS7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.2024 17:40, Petr Beneš wrote:
> On Tue, Apr 30, 2024 at 4:47 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.04.2024 18:52, Petr Beneš wrote:
>>> From: Petr Beneš <w1benny@gmail.com>
>>>
>>> This change anticipates scenarios where `max_altp2m` is set to its maximum
>>> supported value (i.e., 512), ensuring sufficient memory is allocated upfront
>>> to accommodate all altp2m tables without initialization failure.
>>
>> And guests with fewer or even no altp2m-s still need the same bump? You
>> know the number of altp2m-s upon domain creation, so why bump by any more
>> than what's strictly needed for that?
> 
> I have to admit I've considered computing the value which goes to
> hap_set_allocation
> by simply adding 256 + max_altp2m, but that felt so arbitrary - the
> 256 value itself
> feels arbitrary, as I haven't found any reasoning for it anywhere.
> 
> I have also tried to make code changes to make the initial allocation
> size configurable
> via libxl (possibly reusing the shadow_memkb) - which seemed to me
> like the "correct"
> solution, but those changes were more complicated than I had
> anticipated and I would
> definitely not make it till the 4.19 deadline.
> 
> Question is, what to do now? Should I change it to 256 + max_altp2m?

Counter question: Is accounting for just the root page table really
enough? Meaning to say: I'm not convinced that minimum would really
be appropriate for altp2m use even before your changes. You growing
the number of root page tables _always_ required just makes things
worse even without considering how (many) altp2m-s are then going
to be used. Such an issue, if I'm right with this, would imo want
addressing up front, in a separate patch.

You may also want to take a look at the shadow side of things, even
if for altp2m shadow mode may not be relevant. Things like
sh_min_allocation() and shadow_min_acceptable_pages() may well need
proper counterparts in HAP now.

>>> --- a/tools/tests/paging-mempool/test-paging-mempool.c
>>> +++ b/tools/tests/paging-mempool/test-paging-mempool.c
>>> @@ -35,7 +35,7 @@ static struct xen_domctl_createdomain create = {
>>>
>>>  static uint64_t default_mempool_size_bytes =
>>>  #if defined(__x86_64__) || defined(__i386__)
>>> -    256 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. */
>>> +    1024 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. */
>>
>> I also can't derive from the description why we'd need to go from 256 to
>> 1024 here and ...
> 
> It's explained in the code few lines below:
> 
>     /*
>      * Check that the domain has the expected default allocation size.  This
>      * will fail if the logic in Xen is altered without an equivalent
>      * adjustment here.
>      */
> 
> I have verified that the default_mempool_size_bytes must reflect the number
> of pages in the initial hap_set_allocation() call.
> 
> Is it something I should include in the commit message, too?

Well, yes and no. My question wasn't about the "why", but ...

>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -468,7 +468,7 @@ int hap_enable(struct domain *d, u32 mode)
>>>      if ( old_pages == 0 )
>>>      {
>>>          paging_lock(d);
>>> -        rv = hap_set_allocation(d, 256, NULL);
>>> +        rv = hap_set_allocation(d, 1024, NULL);
>>
>> ... here. You talk of (up to) 512 pages there only.

... about the "by how many".

>> Also isn't there at least one more place where the tool stack (libxl I
>> think) would need changing, where Dom0 ballooning needs are calculated?
>> And/or doesn't the pool size have a default calculation in the tool
>> stack, too?
> 
> I have found places in libxl where the mempool_size is calculated, but
> that mempool
> size is then set AFTER the domain is created via xc_set_paging_mempool_size.
> 
> In my opinion it doesn't necessarily require change, since it's
> expected by the user
> to manually set it via shadow_memkb. The only current problem is (which this
> commit is trying to fix) that setting shadow_memkb doesn't help when
> max_altp2m > (256 - 1 + vcpus + MAX_NESTEDP2M), since the initial mempool
> size is hardcoded.

Wait - are you saying the guest config value isn't respected in certain
cases? That would be another thing wanting to be fixed separately, up
front.

Jan

