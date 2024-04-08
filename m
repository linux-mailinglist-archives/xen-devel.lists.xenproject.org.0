Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA389B795
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 08:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701725.1096099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtiOk-000337-ND; Mon, 08 Apr 2024 06:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701725.1096099; Mon, 08 Apr 2024 06:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtiOk-000314-Ju; Mon, 08 Apr 2024 06:22:30 +0000
Received: by outflank-mailman (input) for mailman id 701725;
 Mon, 08 Apr 2024 06:22:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtiOi-00030w-UG
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 06:22:28 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f431b5a-f570-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 08:22:28 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4165d03308fso7853975e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 23:22:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b17-20020a5d40d1000000b00343cad2a4d3sm8124018wrq.18.2024.04.07.23.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 23:22:27 -0700 (PDT)
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
X-Inumbo-ID: 5f431b5a-f570-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712557347; x=1713162147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjSm8F6eUQIivWZ/kM3Gv3zgHRKZvUXI2rEJhkBfgVA=;
        b=TNhUDGzkY/TTS2QOgjejpT1Rirss4GRaToXK0MgkSgZ7C6j6yfLoNQWSd3nYYc7wJW
         WYwGRA76bJ5eaolYvhM0izqhtNLMeWD6Zql/AirtL+0dNLHJQpC0opk8GH+FfzgY2xuj
         rcc8iyF9V2e+u0oCHHPdNUovfoLBFnEOjQ8ATf45yV9AC29bDFhZ1KbwnxeEDCFK6AUF
         NgHusonyiI8e9a5+9bCaIlWBgCa0bCpyfsq8ik0UFTQWWo1vIa/DkOhw2Ig+TLSwlkWx
         jUR6dApbMrJ0bUp9acoOXacHrDWhE4cW8fRgtor3YMUiQLuNVM3aRM/rq94AT8GUtRwY
         UDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712557347; x=1713162147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjSm8F6eUQIivWZ/kM3Gv3zgHRKZvUXI2rEJhkBfgVA=;
        b=QZPWpDm5JaeTUJkVTjghdFy4zl+rh99kxmcxiY3FxsmzRhqCmDMiEI+JS7QYhG/Gxj
         7brTe0UsIYpWxtvSTH+7iAFA3kcHc6/Fur/RKSW3oWomIrT7rbNY0yDsFhMaxLjxM+Mr
         p9fuA7y1FdCU/1EgYNYJfzmNNiFkkfeacP/qKRjtu7gu4XrfNr84AHvqGgqOwkcaHSgk
         COhlP8Fl5Zo4Oaz+ar22nfjUf6akAExAaXMKt6T1a9nNwp2aqKF/IEWbx4r972feUhvp
         a1w49YAM7Pl3A0JsBQH/I+PTefpZT8S/rmex5XfSziKelgBSoa0mHM/PxuQjvGwZlpgh
         g3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO4lNDhLUh5apbJcLjz4DUypzElmAS53FmXpK/YNbyIkkOsLQOZr5/bND9IvyKXby/evEjr90W5uxuNAwc0Sh9oLbZIvysw1YKV0xTVrI=
X-Gm-Message-State: AOJu0Yxlk6J8rFCuoW0mMwHzMJ2UQJNLNRHbpDgXUlm7UM3eDvSerrup
	oAoDl1YmLZUFRmdbzRNRytDRMQBvIWpENIsQRKBCnhcBuR4BpRlqhNtx4QmLHg==
X-Google-Smtp-Source: AGHT+IHBPBBkEoRWtZbh5Km1fYyt93hZHFAWRfaS+gkfJZlVSDklhpJANqaXMc3ncKFxZVassxstxQ==
X-Received: by 2002:adf:ee46:0:b0:343:81ea:c539 with SMTP id w6-20020adfee46000000b0034381eac539mr6869465wro.28.1712557347494;
        Sun, 07 Apr 2024 23:22:27 -0700 (PDT)
Message-ID: <951cc6ba-c971-4b5b-9cfc-bc79245a9549@suse.com>
Date: Mon, 8 Apr 2024 08:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-5-xin.wang2@amd.com>
 <e9167c39-187f-4a66-b9a4-8b3a6ae3000b@suse.com>
 <09cc419a-cdf6-4cda-90f1-c0e1ae83ad47@amd.com>
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
In-Reply-To: <09cc419a-cdf6-4cda-90f1-c0e1ae83ad47@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2024 05:19, Henry Wang wrote:
> On 4/4/2024 5:38 PM, Jan Beulich wrote:
>> On 03.04.2024 10:16, Henry Wang wrote:
>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -41,6 +41,11 @@
>>>   #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>>   /* Flag to indicate the node specified is virtual node */
>>>   #define XENMEMF_vnode  (1<<18)
>>> +/*
>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>> + * or static allocation.
>>> + */
>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>> As before, a separate new sub-op would look to me as being the cleaner
>> approach, avoiding the need to consume a bit position for something not
>> even going to be used on all architectures.
> 
> Like discussed in v2, I doubt that if introducing a new sub-op, the 
> helpers added to duplicate mainly populate_physmap() and the toolstack 
> helpers would be a good idea.

I'm curious what amount of duplication you still see left. By suitably
adding a new parameter, there should be very little left.

> Similarly as the way that we do for the 
> MEMF_force_heap_alloc, if in the future we run out of the bit positions, 
> can't we reuse this bit for different architectures as an alias? Or 
> maybe we can even alias it now?

I view this as far less desirable in the public interface.

Jan

