Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A990204C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737186.1143369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdAw-00069A-D4; Mon, 10 Jun 2024 11:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737186.1143369; Mon, 10 Jun 2024 11:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdAw-00067G-9E; Mon, 10 Jun 2024 11:26:58 +0000
Received: by outflank-mailman (input) for mailman id 737186;
 Mon, 10 Jun 2024 11:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGdAv-00067A-94
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:26:57 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57905e70-271c-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 13:26:55 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso6269482a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 04:26:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c8615c188sm1006411a12.10.2024.06.10.04.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:26:54 -0700 (PDT)
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
X-Inumbo-ID: 57905e70-271c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718018815; x=1718623615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/vdEmArE5XL+7quSxxBXVAaCtSRnV30OuJL1b8ceXW4=;
        b=HKaMpkwV/at14w/dr63vM5trO71TVAVQGNyiJpcmd73YTgR0GCFdfRtijiu/tQAJvX
         dmO+2nO3GXdzeJ51hrtA7iEh1X63oU5clijF+h0YEMoXQkrDAJXppMa1GaWyueomDXFC
         uQfv3vUyYcr3y7PaGWBXEuRTt5Qp3001xZ7bweN21mMNRHVteRCHmrUuJgseBenP7eu7
         +aj2yVdbjaMkm2ewZ+FczNRp1r5HAbOxhBuJUGt9MBcIJshLpcKKHbbTu6iglBisGZ6n
         PGGa7ftYMu2eJQuSrVOFie+ciuRo2RnkxzXZbdsOGsb83jPi6wdHD72vBbjj3P9Rf0a7
         /VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718018815; x=1718623615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vdEmArE5XL+7quSxxBXVAaCtSRnV30OuJL1b8ceXW4=;
        b=Q0QXuYxWLA2Jf+KDZKwDXnfrlGKOMLrHKdZyexh3kOHLhNWfuab6jWgRN3fbSnTHY2
         LtpI97QP7DBMyOEOw0LidirZ0XIXov6UQtsukHyQjcXn9s2N88oHIGlqQAyZqnXI5uhF
         NUhoOYWk2p2lPxedMluQOdLL8d0PUlthn6qp8OZpxTL0sYyHJwmgBdNACjedkuNuHr2F
         +Pe2n/5tIcg09lGjnl5EsB8umt+DLzfAgD4aRAsJejEso0eVUKngeokTCpr+e8Li3Zb4
         IYzROYoWFM+jmV4FO+wM6mKNYiHvtfIFTMyZLXgvmLnI+m+7sEfCu+B9rfeQiPILc16D
         nEsw==
X-Forwarded-Encrypted: i=1; AJvYcCWursxzJ5g69v7CqsaSwdFYRAqB6x5AuWgaoa94TAlJGci2oWZAxJdL3lsoOk6b+PgPu+DpIswbJ0bYV0IgiYXnpt9Jn2vhRHNGceQpdWI=
X-Gm-Message-State: AOJu0YzVlspNgTk8ylKeWlecjpbPTtjdznEr+FtqDiB1UKv+R2lIZCi1
	QNTeXfIBbPFyDPDwDF8+Qmzx7iEFScIU6uZUzF9ASkZ1JGjk4USLdoYI2yh3Dg==
X-Google-Smtp-Source: AGHT+IH3YGzNvlzAjkw1WXC7R6lSf8RUEE6T6culeoS7lotBzQaTnwVn5pHNP7rMePfBMEq5jBgXxw==
X-Received: by 2002:a50:9f4b:0:b0:57c:603a:6b2b with SMTP id 4fb4d7f45d1cf-57c603a6eebmr5118402a12.21.1718018814703;
        Mon, 10 Jun 2024 04:26:54 -0700 (PDT)
Message-ID: <be69d7c6-c004-44de-acee-c16dc923d412@suse.com>
Date: Mon, 10 Jun 2024 13:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 04/16] x86: introduce CONFIG_ALTP2M Kconfig option
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <035f63f2b92b963f2585064fa21e09e73157f9d3.1717410850.git.Sergiy_Kibrik@epam.com>
 <856e3517-4aef-4e18-85b1-174ebf5c358f@suse.com>
 <6b55015a-4cea-4064-a50e-38ab2b2e665c@epam.com>
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
In-Reply-To: <6b55015a-4cea-4064-a50e-38ab2b2e665c@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2024 12:48, Sergiy Kibrik wrote:
> 07.06.24 10:47, Jan Beulich:
>> On 03.06.2024 13:13, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/include/asm/p2m.h
>>> +++ b/xen/arch/x86/include/asm/p2m.h
>>> @@ -577,10 +577,10 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
>>>           return _gfn(mfn_x(mfn));
>>>   }
>>>   
>>> -#ifdef CONFIG_HVM
>>>   #define AP2MGET_prepopulate true
>>>   #define AP2MGET_query false
>>>   
>>> +#ifdef CONFIG_ALTP2M
>>>   /*
>>>    * Looks up altp2m entry. If the entry is not found it looks up the entry in
>>>    * hostp2m.
>>
>> In principle this #ifdef shouldn't need moving. It's just that the
>> three use sites need taking care of a little differently. E.g. ...
>>
>>> @@ -589,6 +589,15 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
>>>   int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
>>>                                  p2m_type_t *t, p2m_access_t *a,
>>>                                  bool prepopulate);
>>> +#else
>>> +static inline int altp2m_get_effective_entry(struct p2m_domain *ap2m,
>>> +                                             gfn_t gfn, mfn_t *mfn,
>>> +                                             p2m_type_t *t, p2m_access_t *a,
>>> +                                             bool prepopulate)
>>> +{
>>> +    ASSERT_UNREACHABLE();
>>> +    return -EOPNOTSUPP;
>>> +}
>>
>> static inline int altp2m_get_effective_entry(struct p2m_domain *ap2m,
>>                                               gfn_t gfn, mfn_t *mfn,
>>                                               p2m_type_t *t, p2m_access_t *a)
>> {
>>      ASSERT_UNREACHABLE();
>>      return -EOPNOTSUPP;
>> }
>> #define altp2m_get_effective_entry(ap2m, gfn, mfn, t, a, prepopulate) \
>>          altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
>>
>> Misra doesn't like such shadowing, so the inline function may want
>> naming slightly differently, e.g. _ap2m_get_effective_entry().
> 
> 
> I can do that, sure.
> Though here I'm curious what benefits we're getting from little 
> complication of an indirect call to an empty stub -- is avoiding of 
> AP2MGET_* defines worth it?

First - how is an indirect call coming into the picture here? We aim at
avoiding indirect calls where possible, after all. Yet iirc all calls
to altp2m_get_effective_entry() are direct ones.

As to avoiding the (or in fact any such) #define-s - imo it's better to
not have items in the name space which can't validly be used, unless this
(elsewhere) helps to keep the code tidy overall. This way problems (e.g.
from misunderstandings or flaws elsewhere) can be detected early.

Jan

