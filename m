Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2B88AF37B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710896.1110442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIfx-0006Yw-BM; Tue, 23 Apr 2024 16:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710896.1110442; Tue, 23 Apr 2024 16:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIfx-0006X0-7u; Tue, 23 Apr 2024 16:07:21 +0000
Received: by outflank-mailman (input) for mailman id 710896;
 Tue, 23 Apr 2024 16:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzIfw-0006Va-KA
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:07:20 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fa22e54-018b-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 18:07:19 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41a4f291f80so19808195e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 09:07:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cs18-20020a056000089200b003437799a373sm15045095wrb.83.2024.04.23.09.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 09:07:18 -0700 (PDT)
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
X-Inumbo-ID: 8fa22e54-018b-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713888439; x=1714493239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmUXoBxUHPYiekzveS4whVSAKSC3A5vB53Z+WjXbffo=;
        b=JDAVGRPuwyU7tAEbiXwlNQJpguyFAV0w2ZJlgfJeneOmO9iMbGhY1+86ZmK/6LZRkZ
         SbPIVjXzRmdQp6FGnDCHqLagQNwYG8JS7RvvmNyiFwfZKebzFd9hMMqLYTXXj8d3iFvM
         PiCXOECLCXf+2Dl9bBCCmLjxgXbXX+NPKFt2QDR8xSgMC0hoKwW1wSUhy3RhlRYFcbzv
         J1uRkV2S7WlWi3NyAH6Swf2oC0fu2UPGoV/kvk6ABqILsP1Hw9GBupEYClLs7fpkYDFN
         yLQBVjLwSXvdfnW6sBiX1wsSxqDKzjmrxGpRraYPGIAIiJvVVENVI/CuomYmKjkvjppN
         FOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713888439; x=1714493239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmUXoBxUHPYiekzveS4whVSAKSC3A5vB53Z+WjXbffo=;
        b=cyKQ7+F1Uc+b4Q9XkRTQvdisnzBKEezxHg7eaHtNoVaHgQFPYs5m9XJmPZwkfir0Rr
         Q5uz9e68ZHW1Wx+yVlWfM1zUZecINaJ3pElYNEwJEdwYLcXxZeLkZZD4OUo/v7rs/bi8
         aOswqUH9r6HpZCNztj9vk+R1H+7Z7ruWUch/X0foKWaj/f1zWsTKJRlRNgBpvm0qoV1s
         8Lc8yAkWeHQMyknzCGav3JiV0AfTyu7T2FG0p7XcNYPH54LvtO1Znub8kH62AvW1VKK3
         L4AFYmjZV6OFmqTmwePGKkJpXyyyKtsGD3TKd/+1U66PWXonxxTpXYbp/O3Z+MKuuc5R
         P23g==
X-Forwarded-Encrypted: i=1; AJvYcCVCdAZ4Aq4d+CNcaNsAq0dmhFXawT7WSA2WxNvQV1vmMAv8psgXJKAdN3TKLbkAWnGCtEF7nW3XHi9QGAkV8V4WGX3kD+VuHOo5k22n2nQ=
X-Gm-Message-State: AOJu0YxuM3WM5i4Exvwy2XwUGSrqUwCp3yFsKRWwprhNvF4g5bsfyXF/
	T2Nb0vo1unspEyZe0xMBdtAmIdBgY+7ZPKMhI5D/JI0EU8901SmQnh6E7xzDn59gOMD7YIU9Mqg
	=
X-Google-Smtp-Source: AGHT+IG8WflSudFBERzQdeSgIQoqwaiV8B4KHQLp86QdQXUdLjQloEXb0tNPTw3HQSWdXPlSCfo3SQ==
X-Received: by 2002:adf:f705:0:b0:343:7d6b:d30 with SMTP id r5-20020adff705000000b003437d6b0d30mr10666434wrp.12.1713888438870;
        Tue, 23 Apr 2024 09:07:18 -0700 (PDT)
Message-ID: <bdf38245-8b86-4b3b-a616-ca9e7bd09ba4@suse.com>
Date: Tue, 23 Apr 2024 18:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] livepatch: refuse to resolve symbols that belong
 to init sections
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-4-roger.pau@citrix.com>
 <0625d7fd-1554-4d47-a8a5-0d6bfb1fcd56@suse.com> <ZifE_rQhaZNbjIt2@macbook>
 <46c58aa4-d908-40ff-9c77-e0eacc7e10b6@suse.com> <ZifN3YMbYtlv-Aa4@macbook>
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
In-Reply-To: <ZifN3YMbYtlv-Aa4@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 17:03, Roger Pau Monné wrote:
> On Tue, Apr 23, 2024 at 04:28:59PM +0200, Jan Beulich wrote:
>> On 23.04.2024 16:26, Roger Pau Monné wrote:
>>> On Tue, Apr 23, 2024 at 03:44:42PM +0200, Jan Beulich wrote:
>>>> On 23.04.2024 15:12, Roger Pau Monne wrote:
>>>>> Livepatch payloads containing symbols that belong to init sections can only
>>>>> lead to page faults later on, as by the time the livepatch is loaded init
>>>>> sections have already been freed.
>>>>>
>>>>> Refuse to resolve such symbols and return an error instead.
>>>>>
>>>>> Note such resolutions are only relevant for symbols that point to undefined
>>>>> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
>>>>> and hence must either be a Xen or a different livepatch payload symbol.
>>>>>
>>>>> Do not allow to resolve symbols that point to __init_begin, as that address is
>>>>> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
>>>>> resolutions against it.
>>>>>
>>>>> Since __init_begin can alias other symbols (like _erodata for example)
>>>>> allow the force flag to override the check and resolve the symbol anyway.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> In principle, as promised (and just to indicate earlier concerns were
>>>> addressed, as this is meaningless for other purposes)
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>> However, ...
>>>>
>>>>> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>>>>>                      break;
>>>>>                  }
>>>>>              }
>>>>> +
>>>>> +            /*
>>>>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
>>>>> +             * livepatch payloads don't have init sections or equivalent.
>>>>> +             */
>>>>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
>>>>> +                      st_value <  (uintptr_t)&__init_end && !force )
>>>>> +            {
>>>>> +                printk(XENLOG_ERR LIVEPATCH
>>>>> +                       "%s: symbol %s is in init section, not resolving\n",
>>>>> +                       elf->name, elf->sym[i].name);
>>>>> +                rc = -ENXIO;
>>>>> +                break;
>>>>> +            }
>>>>
>>>> ... wouldn't it make sense to still warn in this case when "force" is set?
>>>
>>> Pondered it, I was thinking that a user would first run without
>>> --force, and use the option as a result of seeing the first failure.
>>>
>>> However if there is more than one check that's bypassed, further ones
>>> won't be noticed, so:
>>>
>>>             else if ( st_value >= (uintptr_t)&__init_begin &&
>>>                       st_value <  (uintptr_t)&__init_end )
>>>             {
>>>                 printk(XENLOG_ERR LIVEPATCH
>>>                        "%s: symbol %s is in init section, not resolving\n",
>>>                        elf->name, elf->sym[i].name);
>>>                 if ( !force )
>>>                 {
>>>                     rc = -ENXIO;
>>>                     break;
>>>                 }
>>>             }
>>>
>>> Would be OK then?
>>
>> Perhaps. "not resolving" isn't quite true when "force" is true, and warnings
>> would also better not be issued with XENLOG_ERR.
> 
> I was assuming that printing as XENLOG_ERR level would still be OK -
> even if bypassed because of the usage of --force.  The "not resolving"
> part should indeed go away. Maybe this is better:
> 
>             else if ( st_value >= (uintptr_t)&__init_begin &&
>                       st_value <  (uintptr_t)&__init_end )
>             {
>                 printk("%s" LIVEPATCH "%s: symbol %s is in init section%s\n",
>                        force ? XENLOG_WARNING : XENLOG_ERR,
>                        elf->name, elf->sym[i].name,
>                        force ? "" : ", not resolving");
>                 if ( !force )
>                 {
>                     rc = -ENXIO;
>                     break;
>                 }
>             }

I'd be okay with this; the livepatch maintainers will have the ultimate say.

Jan

