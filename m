Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA30896443
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 07:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700289.1093179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrtXs-0007gw-M6; Wed, 03 Apr 2024 05:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700289.1093179; Wed, 03 Apr 2024 05:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrtXs-0007er-IR; Wed, 03 Apr 2024 05:52:24 +0000
Received: by outflank-mailman (input) for mailman id 700289;
 Wed, 03 Apr 2024 05:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrtXr-0007el-Fp
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 05:52:23 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 565250be-f17e-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 07:52:21 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33ff53528ceso4254919f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 22:52:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r8-20020adfb1c8000000b0033e206a0a7asm16208262wra.26.2024.04.02.22.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 22:52:20 -0700 (PDT)
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
X-Inumbo-ID: 565250be-f17e-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712123541; x=1712728341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7B2xm8LfoO44zkIAissXotfYAfHPsCOayDShK5J2RfA=;
        b=aWsfsDnqkLj8+UbUO8bBwzALzuepK79LVT3lK9KdF6dNS1UycILhRHrfBpwMqaRP0u
         DZkil30LRFazwApZhVYIt6QqEeb+MMu/iQWY2U90ippuw/ObkD2ey/t+fFPndJCn04NW
         okc9GgG/mrHCikGHYAJVpv/faBujYxTJsxQf/UR3hmydMaymR1jHNTmF6j4/g5G+cpF2
         QK1DynJEgSx7ZNYoLAzoPMIfufKUxKfgowyRtL3sIWZTLCYmlAashOWbA0+EExLorjzA
         x/zrl/e0GoCVr/XPTafCtcxzaci/LvG2blzXe7LkRDna2EOa/U7rHUuE/uPejOIBHobF
         RFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712123541; x=1712728341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7B2xm8LfoO44zkIAissXotfYAfHPsCOayDShK5J2RfA=;
        b=CbYASTlqI6VQxq/nvYiOfUPunfYz8bM2ROZPlCak+Kfl6n3/ewqHzJMNUxe7groRkl
         kTeeuYeiaT4u5Z2OFU+ve8Ujae1QfhUB9pxcUaxjgs67FY1Ud1REMKisZXXrA4IK5K+P
         kbLWepHIrSM7UNfKbx6Xgc26Hcl/PqsZT6CmZr9+jO19yiHHFqzYC4Ascb7Wql+4Fs71
         zWuDSsWuRUHrstRcorfTaJw3At4sLZ7qo32BsWZZ1uoMhPinERb3r8bSFKhMg+wbipQk
         weVhDM1O9xUGE3MmkYaw3NlYBV5O/s/hfNNyvdLNHbBd39wFAEjmzWOCs+GzTmJKkuSz
         pM5w==
X-Forwarded-Encrypted: i=1; AJvYcCWKM9Wq9O/Uys+801TzK5ctAFmFFsRL7MXUeghgzP+r05kt7nvjgfGmhO7wqZNUefb8SisQxz7TJvHC/+qieFVuoUQ1LXJ7Idcid8PaJ0E=
X-Gm-Message-State: AOJu0YwdkulsxHlV3xHYs/cgXdQrN07qqt918BxGU2gVKspP8oPJtkQK
	vlGwEmxddJOjWO8C7FiVA7P4NJ6Rz8DGJMS2smISSzPOVsseOLZ5vfYIplHecg==
X-Google-Smtp-Source: AGHT+IGdUUjGUXYNpikH2HjStca3j+AjrZN5Z5eQDdMVRANZ55QpMoQvNHl3HJBapKk/CQcA0APnAA==
X-Received: by 2002:adf:e246:0:b0:342:2eb8:4333 with SMTP id bl6-20020adfe246000000b003422eb84333mr993740wrb.10.1712123540863;
        Tue, 02 Apr 2024 22:52:20 -0700 (PDT)
Message-ID: <b4034412-fc56-4f8d-9b1b-347d8c9bab4c@suse.com>
Date: Wed, 3 Apr 2024 07:52:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] svm/nestedsvm: Introduce nested capabilities bit
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240313122454.965566-1-george.dunlap@cloud.com>
 <20240313122454.965566-4-george.dunlap@cloud.com>
 <7a5b3ec3-c122-479a-b714-529e150bf4c0@suse.com>
 <CA+zSX=ZE6uLf12o3WDUpNuZ6Kost=JEfWH0HugGqD43QGPsJ1A@mail.gmail.com>
 <f4f33db5-a49d-4706-8b55-cfcad916e8cb@suse.com>
 <CA+zSX=ZUfcL-HA_ygLxHkuvmWUu4hdk36Cc+CZPwfsK5akNUSA@mail.gmail.com>
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
In-Reply-To: <CA+zSX=ZUfcL-HA_ygLxHkuvmWUu4hdk36Cc+CZPwfsK5akNUSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.03.2024 11:57, George Dunlap wrote:
> On Thu, Mar 28, 2024 at 6:44 AM Jan Beulich <jbeulich@suse.com> wrote:
>>> As to why to have each vendor independent code check for HAP -- there
>>> are in fact two implementations of the code; it's nice to be able to
>>> look in one place for each implementation to determine the
>>> requirements.  Additionally, it would be possible, in the future, for
>>> one of the nested virt implementations to enable shadow mode, while
>>> the other one didn't.  The current arrangement makes that easy.
>>
>> Well, first - how likely is this, when instead we've been considering
>> whether we could get rid of shadow mode? And then this is balancing
>> between ease of future changes vs avoiding redundancy where it can be
>> avoided. I'm not going to insist on centralizing the HAP check, but I
>> certainly wanted the option to be considered.
> 
> I considered it before replying to you; so consider it considered. :-)
> 
>>>>> --- a/xen/arch/x86/hvm/nestedhvm.c
>>>>> +++ b/xen/arch/x86/hvm/nestedhvm.c
>>>>> @@ -150,6 +150,16 @@ static int __init cf_check nestedhvm_setup(void)
>>>>>      __clear_bit(0x80, shadow_io_bitmap[0]);
>>>>>      __clear_bit(0xed, shadow_io_bitmap[1]);
>>>>>
>>>>> +    /*
>>>>> +     * NB this must be called after all command-line processing has been
>>>>> +     * done, so that if (for example) HAP is disabled, nested virt is
>>>>> +     * disabled as well.
>>>>> +     */
>>>>> +    if ( cpu_has_vmx )
>>>>> +        start_nested_vmx(&hvm_funcs);
>>>>> +    else if ( cpu_has_svm )
>>>>> +        start_nested_svm(&hvm_funcs);
>>>>
>>>> Instead of passing the pointer, couldn't you have the functions return
>>>> bool, and then set hvm_funcs.caps.nested_virt from that? Passing that
>>>> pointer looks somewhat odd to me.
>>>
>>> For one, it makes start_nested_XXX symmetric to start_XXX, which also
>>> has access to the full hvm_funcs structure (albeit in the former case
>>> because it's creating the structure).
>>
>> This last aspect is the crucial aspect: start{svm,vmx}() are indeed quite
>> special because of this. Everywhere else we have accessor helpers when
>> hvm_funcs needs consulting, e.g. ...
>>
>>>  For two, both of them need to read caps.hap.
>>
>> ... caps _reads_ would want using (an) accessor(s), too.
>>
>>>  For three, it's just more flexible -- there may be
>>> future things that we want to modify in the start_nested_*()
>>> functions.  If we did as you suggest, and then added (say)
>>> caps.nested_virt_needs_hap, then we'd either need to add a second
>>> function, or refactor it to look like this.
>>
>> Right, I can see this as an argument when taking, as you do, speculation
>> on future needs into account. Albeit I'm then inclined to say that even
>> such modifications may better be done through accessor helpers.
> 
> Why access it through accessor helpers?
> 
> I consider that it's the SVM and VMX "construction/setup" code
> respectively which "own" hvm_funcs (as evidenced by the fact that they
> create the structures and then return them); and I consider the
> start_nested_{vmx/svm} to be a part of the same code; so I consider it
> valid for them to have direct access to the structure.
> 
>>>> Is there a reason to use direct calls here rather than a true hook
>>>> (seeing that hvm_funcs must have been populated by the time we make it
>>>> here)? I understand we're (remotely) considering to switch away from
>>>> using hooks at some point, but right now this feels somewhat
>>>> inconsistent if not further justified.
>>>
>>> Again it mimics the calls to start_vmx/svm in hvm_enable.  But I could
>>> look at adding a function pointer to see if it works.
>>
>> Andrew - do you have any input here towards those somewhat vague plans
>> of getting rid of the hook functions? I guess they're more relevant in
>> places where we can't easily use the altcall machinery (i.e. not here).
> 
> Rather than do all that work collecting information, why don't we just
> check it in as it is?  Obviously if we're thinking about getting rid
> of hook functions at some point anyway, it can't be all that bad.
> There is an aesthetic justification for the lack of hook, in that it's
> similar to the start_vmx/svm() functions.
> 
> So far I really don't think the remaining "open" changes we're
> discussing are worth either of our efforts.  I don't plan to make any
> of these changes unless another x86 maintainer seconds your request
> (or you can convince me they're worth making).
> 
> (The other two changes -- correcting the function name in the commit
> message, and removing the extra blank line -- I've already changed
> locally, so could check in with your ack.)

After some mumbling to myself over the holidays
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

