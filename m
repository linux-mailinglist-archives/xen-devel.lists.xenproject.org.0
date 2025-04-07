Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AEAA7E3DB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940381.1340196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oGG-0000QB-5z; Mon, 07 Apr 2025 15:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940381.1340196; Mon, 07 Apr 2025 15:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oGG-0000Nc-3M; Mon, 07 Apr 2025 15:19:44 +0000
Received: by outflank-mailman (input) for mailman id 940381;
 Mon, 07 Apr 2025 15:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1oGF-0000NW-0q
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:19:43 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba0d9bf4-13c3-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 17:19:41 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so30839245e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 08:19:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d9cfsm12348615f8f.78.2025.04.07.08.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 08:19:40 -0700 (PDT)
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
X-Inumbo-ID: ba0d9bf4-13c3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744039180; x=1744643980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GbMYU1+GOcM2LB/9eTTQn6lzNTRKL1wgV9ssKAeDmL0=;
        b=Y5hGu0q8lGD9lQnO7v8iG70dRK2cdouzBcp4ZGwTD0p5QJmm0MbkB29Vfmrw/ECCIl
         JpmGU4vZVszO2XqtwsWtavulhRJj8TpZ1zTWJa0IShxpYt9mbTsPddBbIEkRnJtrYIrW
         nkphWkchVbDywgTR9EOLGmdNtABtWpVVs93vhWFyCTbfbFNMbbdhg+4BjmlHmUhTv4yJ
         XSbgP22NELPX9aD5LomMI4pgGNE+b2yjIz2LGza0dlvRg+YTrntX4N85XIDsKL5MqPpw
         lRABrZqSe5asTWZkjdIObDCvpaqNmrs9h43Cvg0wIW8F2VyfP9VRH2ONDuffbJjLVFNi
         VWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039180; x=1744643980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbMYU1+GOcM2LB/9eTTQn6lzNTRKL1wgV9ssKAeDmL0=;
        b=ccCs/9oGu0tHp+4/hSqu9vBxw0TDXfV21A99qOznoK6WTK7UlWs+sBKaa145g/cYM7
         PxMsgbVdRj4oela3OLeAbF5yoRVj8IjmGb/S30/AysoZ3UrL1k77u3WOIuifX/bmA4WR
         b+QpMkpwJg6/B2nWUCnBbCzor1IuE+TD3kbvtH51G01raEA6GyS4hRAt6/Mu4wjU6NBv
         AaowrUUF9GSWKctS1iuV9ZicuOoyFj9gtM0MtXOI1IUYb1DvCz8FSfliTQ50aLiMhTwq
         QChiGYvV6w/vpaPBxr5+1v5dvcFjzV2aUJ3v6YrlCz8Sl5gtYHuNFOILrE1yMOm9fAEw
         e47g==
X-Forwarded-Encrypted: i=1; AJvYcCU2OvtWi+s1ArjlxGg+muz6t0XxN/UD1gUs08z5A09kJMLCNjTS0MyAVnjCjZ3cONxusobTP0RjwHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXzPDjAcqO7JzPFCEDCWZv4iLV3Ufumo5WakI1OTs7Q8Sy2en9
	Pl7N1UVRn47eQIcRSccvQpdmGiTxH1E7va/CS7VdzSpgf9LeyLz+A0h+Usl4MQ==
X-Gm-Gg: ASbGncthS8xzSPtBzQuh9a/eIJ1bMonDjDjhK1QUU3vdrtbNkbqWd6stNKpSG2ueLNt
	jjdnwi+iPTII+yz8PFAiZZ17fi5v5ktUqay2xVuiXdvzSINlnGZzczh0Dr6Z/giRhdC6rLxuElF
	fVEzO6BtNn6c3iLSw+e8q/6UDs/wCgrEgJJcHqCtJAKdQf+wE0ah+//Gep4KoK5cyzVo/x2bYdI
	nFd3Ex5mp4e2JjMwXjRfkbH/LTeohI0jA4vPM+p2UITA6LrHtx/6sDAupsdlvcKPcH2IN6pyrcU
	WEBGNzX/TJjiEch28GmpGK7WmHAn8LcyEv/dn4tfttJ+9+7a/WB2TpE4HKo4rRrtpIEau11eok4
	BiMKfUKZWHvUCi8xg6v7TasbrBRSOMg==
X-Google-Smtp-Source: AGHT+IFSVq0iemkCUUDotYc+Dz/ktdxBdgFniE+SXrAuqov0yYeFJmCMW9WTTKFXPR05PzliEeLdng==
X-Received: by 2002:a05:6000:4006:b0:39a:ca0c:fc90 with SMTP id ffacd0b85a97d-39d6fc28539mr7869960f8f.14.1744039180539;
        Mon, 07 Apr 2025 08:19:40 -0700 (PDT)
Message-ID: <292a7c46-dc2d-4047-9967-23c0dd6a375a@suse.com>
Date: Mon, 7 Apr 2025 17:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mem-sharing: short-circuit p2m_is_shared() when
 MEM_SHARING=n
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a261173-d225-44fc-9078-4030ba11cfd8@suse.com>
 <00df5854-0ef6-459e-9cb7-978a9633fc7a@citrix.com>
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
In-Reply-To: <00df5854-0ef6-459e-9cb7-978a9633fc7a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 16:50, Andrew Cooper wrote:
> On 03/04/2025 9:41 am, Jan Beulich wrote:
>> Some of the uses of dom_cow aren't easily DCE-able (without extra
>> #ifdef-ary), and hence it being constantly NULL when MEM_SHARING=n
>> misguides Coverity into thinking that there may be a NULL deref in
>>
>>         if ( p2m_is_shared(t) )
>>             d = dom_cow;
>>
>>         if ( get_page(page, d) )
>>             return page;
>>
>> (in get_page_from_mfn_and_type()). Help the situation by making
>> p2m_is_shared() be compile-time false when MEM_SHARING=n, thus also
>> permitting the compiler to DCE some other code.
>>
>> Note that p2m_is_sharable() isn't used outside of mem_sharing.c, and
>> hence P2M_SHARABLE_TYPES can simply be left undefined when
>> MEM_SHARING=n.

Note this for ...

>> --- a/xen/arch/x86/include/asm/p2m.h
>> +++ b/xen/arch/x86/include/asm/p2m.h
>> @@ -136,11 +136,16 @@ typedef unsigned int p2m_query_t;
>>  #endif
>>  
>>  /* Shared types */
>> +#ifdef CONFIG_MEM_SHARING
>>  /* XXX: Sharable types could include p2m_ram_ro too, but we would need to
>>   * reinit the type correctly after fault */
>>  #define P2M_SHARABLE_TYPES (p2m_to_mask(p2m_ram_rw) \
>>                              | p2m_to_mask(p2m_ram_logdirty) )
>>  #define P2M_SHARED_TYPES   (p2m_to_mask(p2m_ram_shared))
>> +#else
>> +/* P2M_SHARABLE_TYPES deliberately not provided. */
>> +#define P2M_SHARED_TYPES 0
> 
> You need P2M_SHARABLE_TYPES too, or p2m_is_sharable() will start
> becoming a syntax error.

... what you're saying here. If you did take that into consideration, then
please be more specific about the concern(s) you have.

Jan

