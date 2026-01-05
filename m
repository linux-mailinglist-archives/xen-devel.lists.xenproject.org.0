Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1241DCF4173
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 15:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195417.1513359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclUK-00075w-3L; Mon, 05 Jan 2026 14:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195417.1513359; Mon, 05 Jan 2026 14:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclUJ-00073Y-W5; Mon, 05 Jan 2026 14:23:15 +0000
Received: by outflank-mailman (input) for mailman id 1195417;
 Mon, 05 Jan 2026 14:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vclUH-00073S-UL
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 14:23:13 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1026e15d-ea42-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 15:23:11 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso24809875e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 06:23:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6c0c148bsm57250425e9.18.2026.01.05.06.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 06:23:09 -0800 (PST)
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
X-Inumbo-ID: 1026e15d-ea42-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767622990; x=1768227790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6si9mWEhUYCepCa96A28RLdBxiL+gruBzfgL8pmOmtk=;
        b=Q7KkMQPuuFX+9z+3hM0hH4nQVxbnJzI6vmD3WqQz0OcGUsycEg00LqtupAY3P79i7b
         QF3Dj+/UZyJJ4khtwNwqfmQmf71txiJnBCUpe9o0Cjpk0YGFgtOH1nPFdoHdMaGfKFDv
         ioZNt2jvOZK1S+EKmmbaZtpL6KCqGGK48fTIZGJ93ZzVMhAA3NLlLNpvMEkDpIpm+M34
         OA4CozK7W1MNyT/8OGaQdLtk98a66JF9+2nw21gLf1exrc5zQU6KKB+yCss98Y1xuEKy
         nQGYJuc2B3cWcfavyB0izhctWsGX7N08uVG/eSFmQXlAEDAJn8eLBcgpozzrXLfBPPC2
         zrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767622990; x=1768227790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6si9mWEhUYCepCa96A28RLdBxiL+gruBzfgL8pmOmtk=;
        b=eXjqqBA4TDKkSkMDlzgKDiwJfwgS+AMgwDTnZTyX9AAoEPzaMZAqpYhQ2CZhwu4aYw
         CO4Gw8EBpNtPWvpLqqvk+kKuqjof7jIM5hTpJ9Woh0qr6JK0bZChO6EudbCWXQCEQjLQ
         gJNd8dIZXdpkXCPR4/5i5V2xVQXwkGhKG2XUEtxmj+oRwJ/yzP0oD9tiL7Si+6SV+dkh
         L3jITK2TCs5F5HBKvwulEX24fPmuNaf1lkQhaQxldwahL+PnhOWDyFeWIvFmMX0N+Ir4
         /3IT0T7isxoFRzHwPTjsGQpwFRs08XcBVdodo3mIUPl/YPhYnLGmyjxMJv52sWZ3DbHN
         U/QA==
X-Forwarded-Encrypted: i=1; AJvYcCXr7+nMYIsUXxG7Rzj0QM0v4qLa7Bw9CPpEjq0tgmCwXHTQi8McoBSXdYpRxhEIsbbF1EFbr1Zgmo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWsEvQ0VNRVYSG6zdh542vaXma6fK4U0l4wI2+uK1axbQ47ILf
	7lAjncZR0Po890F2yaKv5Q4Dhp48XwajDH3SF6pNV+yenUzaFun5Zlzzh5TNOt09Fw==
X-Gm-Gg: AY/fxX7hKpmrcAuj5YF/xdGbcjt9sJ3KVMiY0fx7UQ3NxRatkyIplDbZ/XFUsVRljVt
	yaNWQesfKI9ZjRsou+/UBP82Rkv8JuK3gJSNQw5otPK/voMWBDyWbOTbka764ypJNqbst8ntife
	Pq6r+qnNBijVyIiQ9kujiUz7TEEIUjqq5jiLXuEmry0Y/hnaI6lfqQVHxYr42tX5kKNn3qMQ5s4
	mlgYDW/d38c+9OyiyabFoI9Z9SR2fM/Y4JiwoWmH+EqxPMBWNt9CS9hkUx54Z7jRQDPCScseoYz
	h1MPKWLbmIRCcm5naqwJnqCq74tj9OtvehSWyUvmxZigXyBN4jiPXnQ/wx7c/ff2XAMSdVlM7XD
	FF0AkKI47+GdFxAjOW6xVGruki6EhUePxJQKKY7QfIcydiTrngbEKtPS730/lCSC3s1+1/nHHq0
	8tJGUeLQyAdkZkRSDNshLXYPjhtkmbkMB+DWjCVz/+kQYuVDLg9O4AABpP3Az8xUyAJZwmoKs24
	Ib3AJDobZEgxQ==
X-Google-Smtp-Source: AGHT+IFId92m8FLvtkRLqxHo6o7HQ94iWBgVgItjHW8SokaeDql5ULrUFH+ZVFry3gF5ZcPqzuY9DQ==
X-Received: by 2002:a05:600c:638d:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47d4c8f4972mr351702685e9.21.1767622990197;
        Mon, 05 Jan 2026 06:23:10 -0800 (PST)
Message-ID: <9287e959-dc85-48ba-ac8a-97589b79c5be@suse.com>
Date: Mon, 5 Jan 2026 15:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766406895.git.oleksii.kurochko@gmail.com>
 <5d10efb00eebb35861135280dfee391d0c55cf0d.1766406895.git.oleksii.kurochko@gmail.com>
 <e77ddd04-3dfa-464c-9655-3cc853e1759e@suse.com>
 <360d4fb9-52b9-400d-93a7-baa4b98e708a@gmail.com>
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
In-Reply-To: <360d4fb9-52b9-400d-93a7-baa4b98e708a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 16:25, Oleksii Kurochko wrote:
> 
> On 12/29/25 4:06 PM, Jan Beulich wrote:
>> On 22.12.2025 17:37, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -1057,3 +1057,188 @@ int map_regions_p2mt(struct domain *d,
>>>   
>>>       return rc;
>>>   }
>>> +
>>> +/*
>>> + * p2m_get_entry() should always return the correct order value, even if an
>>> + * entry is not present (i.e. the GFN is outside the range):
>>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
>>> + *
>>> + * This ensures that callers of p2m_get_entry() can determine what range of
>>> + * address space would be altered by a corresponding p2m_set_entry().
>>> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
>>> + *
>>> + * Therefore, this function returns true for GFNs outside range (1), and in
>>> + * that case the corresponding level is returned via the level_out argument.
>>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>>> + * find the proper entry.
>>> + */
>>> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
>>> +                                   gfn_t boundary, bool is_lower,
>>> +                                   unsigned int *level_out)
>>> +{
>>> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
>>> +    bool ret = false;
>>> +
>>> +    ASSERT(p2m);
>>> +
>>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>>> +    {
>>> +        for ( ; level; level-- )
>>> +        {
>>> +            unsigned long mask = BIT(P2M_GFN_LEVEL_SHIFT(level), UL) - 1;
>>> +
>>> +            if ( is_lower ? (gfn_x(gfn) | mask) < gfn_x(boundary)
>>> +                          : (gfn_x(gfn) & ~mask) > gfn_x(boundary) )
>>> +                break;
>>> +        }
>>> +
>>> +        ret = true;
>> For this case ...
>>
>>> +    }
>>> +
>>> +    if ( level_out )
>>> +        *level_out = level;
>> ... this is correct, but of "ret" is still false it very likely isn't, and
>> arranging things this way may end up being confusing. Perhaps "level" should
>> be constrained to the if()'s scope? The caller cares about the value only
>> when the return value is true, after all.
> 
> We could simply move the "|if ( level_out )"| check inside the|if| block, but
> is this really a significant issue?

As I said - it is (or has the potential to be) confusing. No more, but also no
less.

> We still need to check the return value,
> and if it is false,|level_out| should just be ignored and there is not big
> difference then if level_out will contain what it contained before the call
> of check_outside_boundary() or it will be set to P2M_ROOT_LEVEL(p2m).
> 
> Alternatively, could we initialize|level| to a non-existent value in the
> "ret=false" case, for example|P2M_MAX_ROOT_LEVEL| + 1, and return that value
> via|level_out|?

Might be another option, yes. Depending on how the ultimate set of callers
are going to behave.

Jan

