Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5658B9AA0
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 14:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715795.1117703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2VQO-0001tw-Kz; Thu, 02 May 2024 12:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715795.1117703; Thu, 02 May 2024 12:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2VQO-0001rh-I6; Thu, 02 May 2024 12:20:32 +0000
Received: by outflank-mailman (input) for mailman id 715795;
 Thu, 02 May 2024 12:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2VQN-0000VG-Vd
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 12:20:31 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5da8e27a-087e-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 14:20:30 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41b4ff362a8so73283365e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 05:20:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm1784794wmq.7.2024.05.02.05.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 05:20:29 -0700 (PDT)
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
X-Inumbo-ID: 5da8e27a-087e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714652430; x=1715257230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3TQCesLjOF/25eiD8fMMvT518zpci2PUnWHdF5a0guQ=;
        b=N8WKL00ZepChYoE16lUA83OAFoAUJsMQDfijOJQQK29XLM6jW4FHHGRx4ijuKnuew0
         Wl3iL+Mb0xHfjLEcoPBkPvblSpAvUrb+z7O3ZiluYAj1YBFWRs8vvc2rTwbxlfDHKvbs
         JCx3LVd/BwXjEnQvXbMW9th1KFvzEH8eO8SiYhkdyWyGodF4kTi4Fw4YS6N5jKdl9Kst
         fn6tAVsHLs/CdwMMUhTMHAcz9hA8FVTad4u4EGY14jkBBd07LzXUVn0XEzJ/91vuSEWy
         u4I85Cod88jojdGUMu+ZHK7h19wkadGIFNMk5nPkH7ssoOaOnu1vVxq1RG2N29AjAJwb
         Ymjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714652430; x=1715257230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TQCesLjOF/25eiD8fMMvT518zpci2PUnWHdF5a0guQ=;
        b=DkC5P88NPXigrmfqrmqI0n6uI5wB5s4g24RSv3HPvzwlCmPwOyfT5tCFkR8ApoIsXG
         IkPDls3tlkxqtHP2WlTKRevfTbkK180MX8TrzWLO/xFvSvSk1e6CHe/BWNdfgqNB39+a
         OXHsylOKwYCQJusP5kBjylxjU+2e+EtIUEVz2j2gMPkPTu8yTUBLJHqDJ4Z3QaZPVi+E
         OKFntQvpUIhQ663xdLKilnLKvhv8jk1WFcpEyyDT6oe9zWQGjxHeA54XBGeAGMjFWmsQ
         flfvIvPoE6R3wrAGvtbzToNwKuh9c/cPKL4q8x1AOaYN9cwOFYN3kOYvgDfhakbv2rHq
         TkzA==
X-Forwarded-Encrypted: i=1; AJvYcCVKLyLBF7ayNYriIrxxH+C2ismDAXyg0f3pixL56Wju/1/Ksgd2eOaDkZMx49hIZBJGjBgiySu544EmobLMR7zglBggPTwQY3Wn/LUI8lo=
X-Gm-Message-State: AOJu0YzGTuSc9fykXjtoVh+aFb48qlctxBZ6atbp9cMjTJGvFTZFUx31
	9GmZ+dQTFFmQ59tSKx606jwJgvpG4YEOZfAZjagkeiNiHxy9VxMpQeyYpjmgCg==
X-Google-Smtp-Source: AGHT+IGA9qvl10RoUcA+Ygs/mtcTcvRzaaaq+XX9uBwvkHrAOZhxsurHvxSeiuM1ZDXts4HbuvlUHg==
X-Received: by 2002:a05:600c:4587:b0:41b:d85c:d3e2 with SMTP id r7-20020a05600c458700b0041bd85cd3e2mr5188670wmo.38.1714652429809;
        Thu, 02 May 2024 05:20:29 -0700 (PDT)
Message-ID: <76089076-e041-4bcd-921d-c7a8f0c417e3@suse.com>
Date: Thu, 2 May 2024 14:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] tools/xen-cpuid: switch to use cpu-policy
 defined names
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240430082901.77662-1-roger.pau@citrix.com>
 <78d009f4-6610-4fcf-9cdc-ee1081e6c763@suse.com> <ZjDVN6kexFD0vcT2@macbook>
 <f1e594f7-2bf2-4898-824f-abd407690644@suse.com> <ZjDqHfdjUE1CTk1W@macbook>
 <ee407b03-a1aa-4fa0-a700-71278f643489@citrix.com>
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
In-Reply-To: <ee407b03-a1aa-4fa0-a700-71278f643489@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.05.2024 14:14, Andrew Cooper wrote:
> On 30/04/2024 1:54 pm, Roger Pau Monné wrote:
>> On Tue, Apr 30, 2024 at 02:06:38PM +0200, Jan Beulich wrote:
>>> On 30.04.2024 13:25, Roger Pau Monné wrote:
>>>> On Tue, Apr 30, 2024 at 12:37:44PM +0200, Jan Beulich wrote:
>>>>> On 30.04.2024 10:29, Roger Pau Monne wrote:
>>>>>> @@ -301,21 +52,32 @@ static const char *const fs_names[] = {
>>>>>>      [XEN_SYSCTL_cpu_featureset_hvm_max] = "HVM Max",
>>>>>>  };
>>>>>>  
>>>>>> -static void dump_leaf(uint32_t leaf, const char *const *strs)
>>>>>> +static const char *find_name(unsigned int index)
>>>>>>  {
>>>>>> -    unsigned i;
>>>>>> +    static const struct feature_name {
>>>>>> +        const char *name;
>>>>>> +        unsigned int bit;
>>>>>> +    } feature_names[] = INIT_FEATURE_NAMES;
>>>>>> +    unsigned int i;
>>>>>>  
>>>>>> -    if ( !strs )
>>>>>> -    {
>>>>>> -        printf(" ???");
>>>>>> -        return;
>>>>>> -    }
>>>>>> +    for ( i = 0; i < ARRAY_SIZE(feature_names); i++ )
>>>>>> +        if ( feature_names[i].bit == index )
>>>>>> +            return feature_names[i].name;
>>>>> ... a linear search, repeated perhaps hundreds of times, looks still a
>>>>> little odd to me.
>>>> I didn't benchmark what kind of performance impact this change would
>>>> have on the tool, but I didn't think it was that relevant, as this is
>>>> a diagnostic/debug tool, and hence performance (unless it took seconds
>>>> to execute) shouldn't be that important.
>>> As indicated, performance itself isn't much of a concern here. My earlier
>>> question wants reading in relation to the other question raised, regarding
>>> the script maybe wanting to produce macro(s) more suitable for the purpose
>>> here.
>> Hm, we could maybe produce an array of strings, one per feature bit
>> (features without names would get NULL).
>>
>> I will see, albeit my python skills are very limited.
> 
> See how Xen's cmdline parsing uses feature_names; they're intentionally
> sorted already.

Sorted by name, when here we'd like to have it sorted by feature index.

Jan

