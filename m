Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB298AE9A3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710703.1110092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHFD-0003tD-T4; Tue, 23 Apr 2024 14:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710703.1110092; Tue, 23 Apr 2024 14:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHFD-0003q1-Pp; Tue, 23 Apr 2024 14:35:39 +0000
Received: by outflank-mailman (input) for mailman id 710703;
 Tue, 23 Apr 2024 14:35:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHFC-0003pv-Uv
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:35:38 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c078658b-017e-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 16:35:38 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34b64b7728cso825775f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:35:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056000050c00b00349ac818326sm14807065wrf.43.2024.04.23.07.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 07:35:37 -0700 (PDT)
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
X-Inumbo-ID: c078658b-017e-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713882937; x=1714487737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cY8o8c6KuDv2121lopt9EwZKeOgy645xmnimRBA/QZM=;
        b=DblQETabBG9JYj30rPvo5b10nyMOm2eUEtM/6JuFKGc7xLvyoLLAzu6avmLFvuAdJX
         2GCh3L+v9rSyNxLeCelFwepISkUiaPMgDkzUNV/vttZIm94/UfT9B1DiOYxY6NK0+x/A
         oEtc0Uuaf+1FuaAwmc+xS6kIYAvwHtXRJgxn5TO+segNYvwfmrpOUNnZG/5wUQ3WWHqy
         5Jzgsh5ZTMjChzPnzjuME5Adn4ocK7CAqbBDsNfPfi3YOxKt9jq2jd32wleRXnUiGvbn
         hsd6ct7RyS7rCm574DJyAPgo66o8rM9vS/FDNA/Ab6lsjOD8eWWMqAqF1PlTg+p0Ufaw
         q4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882937; x=1714487737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cY8o8c6KuDv2121lopt9EwZKeOgy645xmnimRBA/QZM=;
        b=vI+WhWkH/czbB+T9iWjz+izc7GQ2/pLtJxQmL3QjvG9KVrWXR1eCLs7IjMw9LOJAwv
         alFVLmjwaKZqSV6I6Y2jbOXskP3NWQFdVJKWMfhsgzxcjkxxvwALhse8qASdgdziI26f
         l641Q+m9/QsjDWqq0Lk1Kf55iUGyhwyjNOlxDcSdqhU8LuLXAQZKUPSCziQFvTjhWjoZ
         AtsVxnnoCN+nTAfvCEZo7qBSqmGwz/shGA5Pb/whBPjrfMuNlHdJQzKFThqmBu03RqGD
         q5IeJOlZo4Zkz1gRfYmaH3tg/gudD62iF/Yz65tgaBt5/zr5uf1ZHK7xBt/z7SRWq7de
         BZtA==
X-Forwarded-Encrypted: i=1; AJvYcCULxLOTU/EafcyWMSbSEgXuLeGOiCYv5bnbh7iXMzBjMVZJZdcZfEOMwfngOHXtmzcw+JWpIINidN8c370EH1XMey9UCaG4XcZEJCzxXq4=
X-Gm-Message-State: AOJu0YzkA8K5kyExS74tAaS/UJBfMW2K1C88eNtc55CovCcFj2ny5CSY
	l9gpZamcxEiHnGjhlvRsnQRVrdbuh0N3WbEb7rc1r54kfR8vxWSYvgIgry2BVw==
X-Google-Smtp-Source: AGHT+IEh8xXBTHbFfFRq/vv/iBtmw6XlibrwmSSIsFztnAz8suv5Iw4N6xKnU0+09OFgAh9e8pvPTA==
X-Received: by 2002:a5d:4082:0:b0:343:b5f0:f511 with SMTP id o2-20020a5d4082000000b00343b5f0f511mr7544166wrp.12.1713882937442;
        Tue, 23 Apr 2024 07:35:37 -0700 (PDT)
Message-ID: <50425a7c-2284-431c-8946-6f6ccf73b507@suse.com>
Date: Tue, 23 Apr 2024 16:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86/livepatch: perform sanity checks on the
 payload exception table contents
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-5-roger.pau@citrix.com>
 <b76f105b-ac92-4759-8e93-64b97232a60c@suse.com> <ZifGQaO8RkveaH0Z@macbook>
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
In-Reply-To: <ZifGQaO8RkveaH0Z@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 16:31, Roger Pau Monné wrote:
> On Tue, Apr 23, 2024 at 03:51:31PM +0200, Jan Beulich wrote:
>> On 23.04.2024 15:12, Roger Pau Monne wrote:
>>> Ensure the entries of a payload exception table only apply to text regions in
>>> the payload itself.  Since the payload exception table needs to be loaded and
>>> active even before a patch is applied (because hooks might already rely on it),
>>> make sure the exception table (if any) only contains fixups for the payload
>>> text section.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> In principle
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Still two comments:
>>
>>> --- a/xen/arch/x86/extable.c
>>> +++ b/xen/arch/x86/extable.c
>>> @@ -228,3 +228,21 @@ unsigned long asmlinkage search_pre_exception_table(struct cpu_user_regs *regs)
>>>      }
>>>      return fixup;
>>>  }
>>> +
>>> +#ifdef CONFIG_LIVEPATCH
>>> +bool extable_is_between_bounds(const struct exception_table_entry *ex_start,
>>
>> s/between/in/ or even s/is_between/in/? "Between", to me at least, reads
>> very much like meaning "exclusive at both ends".
> 
> Oh, OK, I don't associate any boundary inclusion with 'between' or
> 'in'.  The result is shorter, so I like it.
> 
>>> +                               const struct exception_table_entry *ex_end,
>>> +                               const void *start, const void *end)
>>> +{
>>> +    for ( ; ex_start < ex_end; ex_start++ )
>>> +    {
>>> +        const void *addr = (void *)ex_addr(ex_start);
>>> +        const void *cont = (void *)ex_cont(ex_start);
>>
>> Might be nicer to use _p() here, or not do the comparisons with pointers, but
>> instead with unsigned long-s.
> 
> No strong opinion regarding whether to use unsigned longs or pointers.
> I've used pointers because I think the function parameters should be
> pointers, and that avoided doing a cast in the comparison with
> obfuscates it (or introducing yet another local variable).
> 
> I can switch to _p(), that's indeed better.
> 
> Let me know if you have a strong opinion for using unsigned longs,
> otherwise my preference would be to leave it with pointers.

Especially if you want to stick to pointer function arguments - no, no
strong opinion.

Jan

