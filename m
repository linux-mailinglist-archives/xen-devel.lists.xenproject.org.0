Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0943EA65236
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916960.1321962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuB3i-00059r-QR; Mon, 17 Mar 2025 14:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916960.1321962; Mon, 17 Mar 2025 14:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuB3i-00057M-N6; Mon, 17 Mar 2025 14:03:14 +0000
Received: by outflank-mailman (input) for mailman id 916960;
 Mon, 17 Mar 2025 14:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuB3g-000579-UE
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:03:12 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f5a5ce7-0338-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 15:03:10 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so14212905e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:03:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c888167bsm15055642f8f.45.2025.03.17.07.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:03:09 -0700 (PDT)
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
X-Inumbo-ID: 8f5a5ce7-0338-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742220190; x=1742824990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k4GV3UTv6kbLdrio4VZzl2pgpU0w19w/oDEwCfA6Ets=;
        b=WZhtyMSTqyzZrqiuUGBN06CXBlPW6Lw2Paip5j9o3ec+8CQ/7BDwuJykr9vh+qqvT5
         snDxDkY3zwbbv3pT9jmg6Z9FZ3w3aiZXiaUekMoMCjOkT0a/4KdhScG/zSH52iDVl29x
         Wg+dor9jDjeL1Dr53AaxlXrYCZZV8OgChuatcjoD+kLT+QsPr9Eyt7qo/0Waea70kXen
         S8Fg8V0pb2POm8n/EuDNxoxkC7CQn3lzHm8kxDjUEOTRKeBEJbgub1sbiBuP2mkPkQKJ
         mUC7qHA2xOIOykl/HvESYGz3Hvdr7Xc/DXfkukMQrpIQIh6RwWwk6g7kGOakFMdwGa96
         LPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742220190; x=1742824990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4GV3UTv6kbLdrio4VZzl2pgpU0w19w/oDEwCfA6Ets=;
        b=aCaHXO0ks47rkM6psH9Eg3xHTsccXNLj9Yi5U+R++Uv5fZN8PIsHVVmIQhWnDMhIYQ
         lrrerctx8NmpmiwOFdQFrLrKPKUl9Kbyk5YRngwTlUYOFlstdZEzbbMYgejRdvzILBju
         CdfvMvny5g9U6Y4Rnc8YcuQ5a5Pgllypi0tB9DakCJunfhco1LtXb+jXHMNRnjETogRB
         45F+KnrBmt2mxRiNX7GRsQe1peA5GcmlwcfM6bQMkj7hp1S55dM0VNwwYX65b4fkvfB9
         8iTocNwD7iv7qDO7+poIQUwZ+oxsqWhgrrpC+8PHv0fDdxf0etKyiD4WlKYotR2IDZJz
         0ycg==
X-Gm-Message-State: AOJu0YxTxAgvW7Mk1tDNrGKxb12SJfbOZvZoElf+5L9cSQLfuBWDefUa
	wuV8zpOSlZe1Cdf1Poxz7U10Pmu8h6/6lkdL8jExCFoqk79KUvy/y9M8PbSSnA==
X-Gm-Gg: ASbGncsn9kko8O72LAdShLq1kkvJ38eavh9Ip+J6UYktEERtHosZGA8kwjYr9GYLtGA
	1FQQlyBIzBxwYs1xNBaPdQL2WNIVc6tr72r6w8gEklFtf0Ns77DTw9eqhBWFWZFfjf4W5kE0P4N
	aiShyvSh8XUfzykIPyjJ5VOtS/SpsXCuDBliub9FGj3N5UveuYQWj8hIxO28VP2e1FVT1BfjNcn
	j9cZFzpb3fC6lsyG2jqXD9i2tOChnmS5MT0vhFhCsaMtRhPbLFbPgSmhWOu1JlfNiPkzbwekPjH
	xVova1QYBMs4vMqqRpeQmVFidye8n7xeMENSTrANLtgKk+sF88mNVM0tf6Jz6DsMZ2kemhFh6Rv
	oDT21dBNQ5VYgmaIqT80s4o8vLfltzKGGfPSnJBfk
X-Google-Smtp-Source: AGHT+IHavqn7e4pCXT/yHD+WXuEh+LDeIk2dAAZxKsX+kK2ckvOBcuvH0R/kz40xlmivSBUIsCtSjg==
X-Received: by 2002:a05:6000:4025:b0:391:42f2:5c7b with SMTP id ffacd0b85a97d-3971d51fec1mr15021938f8f.16.1742220190055;
        Mon, 17 Mar 2025 07:03:10 -0700 (PDT)
Message-ID: <ab0d92a3-d63b-44d5-b6e2-8c283f97ba82@suse.com>
Date: Mon, 17 Mar 2025 15:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86: make Viridian support optional
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
 <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
 <98bf4aa4-b896-4240-b13a-80a0f964a8b1@suse.com>
 <CAFi36o2sVRrhs7GXpW3Qpnc+VNQBfAzg8zEofqrEjYXz-wgU9A@mail.gmail.com>
 <D8ILCMMM9QFI.2TWP5REOAE2JB@cloud.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <D8ILCMMM9QFI.2TWP5REOAE2JB@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.03.2025 14:55, Alejandro Vallejo wrote:
> On Mon, 17 Mar 2025, 09:29 Jan Beulich, <jbeulich@suse.com> wrote:
>> On 17.03.2025 10:19, Alejandro Vallejo wrote:
>>> On Mon, 17 Mar 2025, 07:19 Sergiy Kibrik, <Sergiy_Kibrik@epam.com> wrote:
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -348,6 +348,11 @@ config HYPERV_GUEST
>>>>
>>>>  endif
>>>>
>>>> +config HVM_VIRIDIAN
>>>> +       bool "Viridian enlightenments support" if EXPERT
>>>> +       depends on HVM
>>>> +       default y
>>>> +
>>>>
>>>
>>>
>>> I don't see why this should be gated by EXPERT, provided a
>>> suitable (now absent) help message was to exist explaining
>>> what it does in plain simple words.
>>>
>>> For the title, I'd say it needs to properly state it refers to
>>> enlightenments for guests, rather than enlightenments for
>>> Xen itself when running under Hyper-V. As it is, it sounds
>>> ambiguous (Maybe "Hyper-V enlighnments for guests"?).
>>
>> I'm slightly puzzled: Here you're worried about ambiguity, yet then ...
>>
>>> On a personal nitpicky preference note, I'd say HVM_VIRIDIAN sounds
>>> rather redundant, and I think just VIRIDIAN works just as well
>>> while being shorter.
>>
>> ... you suggest to introduce ambiguity here. I'd expect VIRIDIAN alone
>> to cover whatever enlightenments Xen might want to use itself, when
>> run on top of Viridian.
> 
> For the define name, I did say it it was a matter of preference rather
> than a worry. I'm perfectly happy with HVM_VIRIDIAN :)
> 
> CONFIG_{HVM_}VIRIDIAN would only be seen in code, where we use that
> name exclusively for enlightenments given to a guest, AFAIK, so I don't
> see as much ambiguity. Doesn't matter much either way.
> 
> However,
> 
> Non-Xen-developers rely on nconfig/menuconfig titles and descriptions
> alone to make decisions, so not providing adequate background (even
> if under EXPERT) seems less than great.

No question that the prompt wants amending (see also my separate reply
to Sergiy), and I fully agree help text wants adding.

Jan

