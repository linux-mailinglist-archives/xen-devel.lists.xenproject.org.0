Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10422AB9666
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 09:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986352.1371920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpAa-0000U9-IF; Fri, 16 May 2025 07:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986352.1371920; Fri, 16 May 2025 07:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpAa-0000Rg-FL; Fri, 16 May 2025 07:07:48 +0000
Received: by outflank-mailman (input) for mailman id 986352;
 Fri, 16 May 2025 07:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFpAZ-0000Ra-If
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 07:07:47 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 778a78fc-3224-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 09:07:45 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad21a5466f6so563717066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 00:07:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4967e2sm102738566b.128.2025.05.16.00.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 00:07:44 -0700 (PDT)
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
X-Inumbo-ID: 778a78fc-3224-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747379265; x=1747984065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R39dlZ5xJXFuRZquO6BMI9obJIby4ZZBfBzfAzBxbuc=;
        b=f8GuzoXMQ2a4INaDZwRA4+0JUv5rSyJ98F4ZkoyknAm9Gc1g6LJRy5gIQiJCpwBPOk
         2Jw2bmkBd6YMOsb/WDhREOaoc3R+hY4xAOwYq7XiZ/u8Un70CNqEkaaFXLF0r463xjxV
         QGBzcg8go500SPGG6zYE6lyvpRcOzs1v0TZ3dakBKiprQ+9sB1xJw6X5LEVn4J79yyhV
         AvXpog0E9+lvrmCkf8/ZifXWqeNeSB8OT1xCvQi9vOyeDE5JyXneYB2LGLs66JANwk6p
         vOWCNZu4Hkn0vMpdj5cyvxnNgy5EmfSsdwPzx8GkijMjp4J5/S4VXFL3qGOZghd2BZA9
         9VLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747379265; x=1747984065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R39dlZ5xJXFuRZquO6BMI9obJIby4ZZBfBzfAzBxbuc=;
        b=PmenmX/Lv0/j53t0ofDiANKN270ZqkHrGD7neDxzbPy4MUZAXBN4VZX51D2Olz+ifM
         vrw7nC88/RZF7JTbhbe/caTaDmQ+XNApWA0lJwH0xDEU1gz4DYdxilU8xhpZvqklfTXK
         QaA5mXoqO5Sbc5SYtw9nLjz78nZQBf45AtHd79nM2OLLkYy9/v/1okWpXV06jfEPv7JY
         9kp7NbzxcGFCz4Ho5GZEHbdNWa1Rn1kq7xSWmv59jBFn9MyIQJYZ4BUG6wcya/nnBurr
         gsG/K/ht2hTaF6zfKlNPAcpXpUOrB7Iu6G6KQwrK4FYH4WabMJYeWz7+S60ThYn/6e7h
         PVZA==
X-Forwarded-Encrypted: i=1; AJvYcCVvxvP6GequwQ0AJDNSC+gnBvp+Cgr98TOsUIHeMXvNIIOZgkwSirUkxq3I9eZ4JIPsSsGn5P+8Qjk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwG506buaXprTUI8PSeZ7QQ4EMS6e6qgFqeJX7eDDa3LbVlzLrJ
	PB/25dWhdFfJFgQlPYCHW/deBtzMzgYok9Ff2n865i3i3WBhlgaHzVIxLye/FPTTBA==
X-Gm-Gg: ASbGncs3taQibLftl5GOKXSpJp8kIb9WfwPV02u2K4CfD3DQ5QY9Wc+fEQgCIUrMdqO
	QWy1q2YjVLzrnTNs6/JbiB/u28Rixm9pCId28wCmchD89oaNmRT3WHOUXSj/rO3YLzZOqt02jia
	SX5A0G+Wow5qcmLVjhkU5GHXEp2A59bYU6z0g1/8UgIp82eWt/rpsoX7IYUu0l23QpLbBVEUisa
	ii47VSj3IhfgzpLt65enAPlt9Rj23zwtH9/VrwAUD6ANbjRAJfVFFO2o8SXJoqQiq1MVsypoqpj
	20IrYIn352RKKK/2KUY7rIPjLEhF8yj8OeLo5PMPdJ7iTSReZcR0R0fMGBsdElPp8+pMVhPpFjV
	Iw8rc2q5SwZjLMhAamtoCaVIs6ClYz+NaSi/w/+4Y5p8F3A4=
X-Google-Smtp-Source: AGHT+IHXV7uveMgIFqiiWjkrPPuIvnLjW712xNGSvnD1w6AZENafZvDavqB+p7QzA7GAvZKXhKHceA==
X-Received: by 2002:a17:907:7d93:b0:acb:a7cc:4102 with SMTP id a640c23a62f3a-ad50f611f20mr538656466b.4.1747379264961;
        Fri, 16 May 2025 00:07:44 -0700 (PDT)
Message-ID: <205a65d3-92bd-4281-8605-758ca03fcac5@suse.com>
Date: Fri, 16 May 2025 09:07:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] xen/x86: rename cache_flush_permitted() to
 has_arch_io_resources()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-8-roger.pau@citrix.com>
 <e2396e92-79b6-487a-88d6-725cd9e173a9@suse.com>
 <aCXB5zpqGfBrPTZy@macbook.lan>
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
In-Reply-To: <aCXB5zpqGfBrPTZy@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2025 12:28, Roger Pau Monné wrote:
> On Mon, May 12, 2025 at 05:16:02PM +0200, Jan Beulich wrote:
>> On 06.05.2025 10:31, Roger Pau Monne wrote:
>>> To better describe the underlying implementation.  Define
>>> cache_flush_permitted() as an alias of has_arch_io_resources(), so that
>>> current users of cache_flush_permitted() are not effectively modified.
>>>
>>> With the introduction of the new handler, change some of the call sites of
>>> cache_flush_permitted() to instead use has_arch_io_resources() as such
>>> callers are not after whether cache flush is enabled, but rather whether
>>> the domain has any IO resources assigned.
>>>
>>> Take the opportunity to adjust l1_disallow_mask() to use the newly
>>> introduced has_arch_io_resources() macro.
>>
>> While I'm happy with everything else here, to me it's at least on the
>> edge whether cache_flush_permitted() wouldn't be the better predicate
>> to use there, for this being about ...
>>
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -172,8 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
>>>  
>>>  #define l1_disallow_mask(d)                                     \
>>>      (((d) != dom_io) &&                                         \
>>> -     (rangeset_is_empty((d)->iomem_caps) &&                     \
>>> -      rangeset_is_empty((d)->arch.ioport_caps) &&               \
>>> +     (!has_arch_io_resources(d) &&                              \
>>>        !has_arch_pdevs(d) &&                                     \
>>>        is_pv_domain(d)) ?                                        \
>>>       L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
>>
>> ... cachability, which goes hand in hand with the ability to also
>> flush cache contents.
> 
> Hm, I was on the edge here, in fact I've previously coded this using
> cache_flush_permitted(), just to the change back to
> has_arch_io_resources().  If you think cache_flush_permitted() is
> better I'm fine with that.

I think that would be better here, yet as you say - it's not entirely
clear cut either way.

>> Tangentially - is it plausible for has_arch_io_resources() to return
>> false when has_arch_pdevs() returns true? Perhaps there are exotic
>> PCI devices (but non-bridges) which work with no BARs at all ...
> 
> I guess it's technically possible, albeit very unlikely?  How would
> the OS interact with such device then, exclusively with PCI config
> space accesses?

Yes, that's what I'd expect for such devices. Looking around, there
are numerous such devices (leaving aside bridges). Just that it looks
implausible to me that one would want to pass those through to a guest.

Jan

