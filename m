Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C8A68F01
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 15:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920789.1324848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuNQ-0001mk-0V; Wed, 19 Mar 2025 14:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920789.1324848; Wed, 19 Mar 2025 14:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuNP-0001lK-U2; Wed, 19 Mar 2025 14:26:35 +0000
Received: by outflank-mailman (input) for mailman id 920789;
 Wed, 19 Mar 2025 14:26:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuuNO-0001kD-Nr
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 14:26:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27e667ad-04ce-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 15:26:32 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so31880265e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 07:26:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f331dasm20713295e9.8.2025.03.19.07.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 07:26:31 -0700 (PDT)
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
X-Inumbo-ID: 27e667ad-04ce-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742394392; x=1742999192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8PQnakvylZY9QpVX/EMz9QUNknaDAdPSzQ1ITE4XWD4=;
        b=F43TjAJfNeHqeESW6k2UjSnSzl5gl0W3kLeNR1+gModCTXKgkGEDIwwa7kbJp28yJD
         kskA3AEzxUNVp8MA24AEBE8CFdy98u6ai4aXBOQah8HUuVvJ+JgvDVWjkfJS0fZyF3H+
         U37BvnU4YqeWZSZqj+lJsP6lhdBOehqtr91KEdX6wbDcktzSoksN8Mzrj94skrcdfCEv
         sTxI6Xri2QUu9xNEhfOR/67my10V5N0RGjvJKrcKqZaXmTXSZqSjbKZPTbp6bRFIYtOd
         HlnUlsQJmHEzVN7op1GocoZ2VlTrNYuPnrsRW5M7SK2LVhWEyAraOWIh+UPwIEoHbUgp
         5x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742394392; x=1742999192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PQnakvylZY9QpVX/EMz9QUNknaDAdPSzQ1ITE4XWD4=;
        b=lkywI1Ybb2fu2AxfT15vhMeAbwSuefEG9qXmHDyXSqys+WhNYpwDjepB3Vc2ebzLOo
         NTnYLtCVX3xV8S2OIOkVMp18dWq9a177PEG4XxnlEneoKENCAs9Ic0dffjKwXGjqZXCZ
         rGaA6pZBo6PV1g/X4W/GX1R8re7l9NehDkLKgT9OgN57fHZtq+m6/Qf5nxawjCL1bAiK
         VS18dOtYNpAUu4m3FBkQ33gYwVBLZcrOikmK47YnSBkRbZAmKFHPL2lj7CHeg8tgl0fk
         K+4ZH85V4u4jxap7WD3V/CyrEZ2wC/197qcRx//NOHAHBEDabX7Rwql04M/8Gxjn7RRT
         vdVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+XsiNwMoe+4ZCnaPAmRVDnmEkiwcRenPdCTbJtNt6IzrmkssVFiraATH7h/r2HkdWMzX13gLbe80=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzeyz44hl6tPHjzrpO+/MD+zyUIIuLeQ95OMYkYVyVBM6nAYW9b
	3vrRRDPrak7augs1sXjUXE7QEvgAk5NUQZEt9B4sFewXg0DTC/Z9XuXjQUI2dQ==
X-Gm-Gg: ASbGnctCfLz1YZfK0XVWduB6s+DPrD9+TrTllQdzW0bzRIH0p/jQEbW3au62UW+UYw9
	5o1Ge0hRTtxyS0vxMvgtkhOxRJhLPIGXn0h+EwEuC1tl31ODbOe+wF3XV3JcSL81YiDwWZ5OZQn
	OiA5NFI6LbWIscqncMergLWQZPUI6/M24BTN/Cl2uH0ylWRyIzQ89T8CTX9lCawByCertCwEMEZ
	UGsxZlqi3q2V08Uw5+igtChkEE/I6mNTLYhLBHap0q5DONQSqszb9lbAoYvhQEQ6FsPk54I0hZF
	zU/DB1r76Ejy/lukCXahUm0n2UiMKKC7BXukHz3HKcW1TRAU+hU3NATkG4CEP0nwE7Zd3kj9pTK
	j30kklmOHKIB/ktTjK+USxAzJ7qs7yg==
X-Google-Smtp-Source: AGHT+IGEXUEB8qV65f7YQewcr+nmy8V/wIzan7cmRHdC1B8io9XKxRCPf8Gz2V9BiAqSi1yQqQnRcA==
X-Received: by 2002:a05:600c:3b10:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43d4384e93fmr25344335e9.29.1742394392232;
        Wed, 19 Mar 2025 07:26:32 -0700 (PDT)
Message-ID: <2f3548cf-a6dd-41e2-8a35-cab1bda0e923@suse.com>
Date: Wed, 19 Mar 2025 15:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
 <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
 <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com> <Z9qxcRtap-k-wW8B@mail-itl>
 <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com> <Z9rJUWCARMQYqNXr@mail-itl>
Content-Language: en-US
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
In-Reply-To: <Z9rJUWCARMQYqNXr@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 14:40, Marek Marczykowski-Górecki wrote:
> On Wed, Mar 19, 2025 at 01:43:59PM +0100, Jan Beulich wrote:
>> On 19.03.2025 12:58, Marek Marczykowski-Górecki wrote:
>>> On Wed, Mar 19, 2025 at 10:43:12AM +0100, Jan Beulich wrote:
>>>> On 19.03.2025 10:15, Jan Beulich wrote:
>>>>> On 18.03.2025 18:01, Marek Marczykowski-Górecki wrote:
>>>>>> --- a/xen/Makefile
>>>>>> +++ b/xen/Makefile
>>>>>> @@ -411,6 +411,8 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
>>>>>>  CFLAGS += -Wa,--strip-local-absolute
>>>>>>  endif
>>>>>>  
>>>>>> +$(call cc-option-add CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)
>>>>>
>>>>> This is lacking a comma:
>>>>>
>>>>> $(call cc-option-add,CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)
>>>>
>>>> And then, having tried the correct form (seeing the option then is passed
>>>> to the compiler), I can't spot any difference in the resulting
>>>> xen-syms.map. There were a few absolute paths there before (for
>>>> arch/x86/x86_64/kexec_reloc.S and arch/x86/acpi/wakeup_prot.S), and the
>>>> exact same ones are present afterwards.
>>>
>>> I'm not sure about xen-syms.map, it's about build path included in
>>> xen-syms. It appears at least once in .debug_str and once in
>>> .debug_line_str.
>>
>> In which case -fdebug-prefix-map= may suffice, which is available on
>> more compiler versions? And then only if DEBUG_INFO=y?
> 
> Oh, and xen.efi is full of build path. Binary on plain staging has 790
> occurrences. But there, -fdebug-prefix-map= also helps.
> 
> But also I don't think -fdebug-prefix-map= will be enough for tools, it
> looks like at least libxl has build path embedded in .rodata too.

And _all_ of them go away with -ffile-prefix-map=?

>>> But also, I see the patch lost a chunk during rebase (from before
>>> 4.17...), that adjusts XEN_ROOT to use $(realpath ...). That's the part
>>> even mentioned in the commit message...
>>>
>>> I'll send v2 shortly.
>>
>> Provided there's actually a need. I was in fact wondering whether this
>> was known to have significant effect prior to Anthony's work to make
>> out-of-tree builds possible (plus less related adjustments), but may
>> have lost most of its functionality since then (yet was still carried
>> forward for all the time).
> 
> There are clearly some build path embedding left. And
> -ffile-prefix-map=/-fdebug-prefix-map= doesn't work correctly with
> XEN_ROOT having xen/.. at the end.
> BTW, would it be acceptable to have this?
> 
>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(realpath $(XEN_ROOT))=.)
> 
> It may be less efficient (if make doesn't cache result),

What do you mean here? Variable evaluation depends solely on how we
use variables. I don't think there's any caching make does on its own?

As to $(realpath ...) - make 3.80 doesn't support that. We do provide a
fallback, but for that you need to use $(call realpath,...).

Jan

> but helps
> especially in tools, where XEN_ROOT is set in _a lot_ of places.
> 


