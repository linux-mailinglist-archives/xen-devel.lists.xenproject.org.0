Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F987A775
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 13:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692391.1079463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNa4-00034r-4T; Wed, 13 Mar 2024 12:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692391.1079463; Wed, 13 Mar 2024 12:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNa4-00032h-0y; Wed, 13 Mar 2024 12:19:36 +0000
Received: by outflank-mailman (input) for mailman id 692391;
 Wed, 13 Mar 2024 12:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bR7k=KT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkNa2-00032b-Bh
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 12:19:34 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2720fbe-e133-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 13:19:32 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a45ecef71deso615167866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 05:19:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p27-20020a17090628db00b00a465b6c9a67sm562955ejd.6.2024.03.13.05.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 05:19:31 -0700 (PDT)
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
X-Inumbo-ID: f2720fbe-e133-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710332372; x=1710937172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaCYrtmOr2uKYn2hAmsXIWQpm/Q2ypOYfRTxP7WXYJk=;
        b=NpPmZ6JGmwQdqVQ9dudgVQQUP/ZaNnQ+U0sdyxqY/X+qpJGldhA1hJG2gF+YguEGW/
         wmlPK8QscWh4NuAv/2L3L6ix2H/jnGJmgs9u9ZKgs2Vm/6mdpHO9HP0N2RY9cbygCMMt
         XeFyr30WMoNcPBoZjaeqMJ7ERzZO7wc7tBjLp+3Kne5XFk8j+S0V0jkXzEx9ydyV/8+a
         0us6iDND3vRQCG3a0wttINxrMAPU4Sebau3JG7phXpW3Mibbf+ALCTbYFdgRWyWDBp+w
         POb+lhyH8hK47dgdw1IyIluA+mPRLriba9aO25zcTLVmk7KCnUm2IH+Gh1OBQUoKPY91
         lgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710332372; x=1710937172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YaCYrtmOr2uKYn2hAmsXIWQpm/Q2ypOYfRTxP7WXYJk=;
        b=aOE4LcVcAYfxqg75wSXtm1cUYayP4suZby8bz/62YZHTrABm/cXzPf7xlRQ6j1HZ/N
         CDf+scdtvF+yjx9OWMIIvWIlNujwBJIJ2UG9sqR7/f9dUy5prodLLFALsvyzeh2FX76z
         XfrFeQrdnKxu9geGYsxZX9vc2Snmat/UHCi2EXJHyZxzB/3+5tJ8FjC+C7Gv9K2Xz6sK
         gtAhKoTjkJBNYseEP3k0QM8qrcokg5FL1pTWR8hP61FBO4BvDrd8ChlbeXgzCpcaWSLJ
         uPhpPsVVkcH1uBqaFr+ww0myTq+zzNiqsMaOx3fWH9s/hZjnUP4Ffv/xn9d5JT+AuVZM
         UV8A==
X-Gm-Message-State: AOJu0YyACZ3dSPFVSr0kLQXmIiXSMxcgF/WBzgJKbtE7Us9oBFsodpJf
	2e4WiwkekBNqxuWFQTn8UpDsm4JLkfp5xWEZS//MEs+i5Osd/3kxUEtm4Fbliw==
X-Google-Smtp-Source: AGHT+IH9VoLcmawr8UbzJ6KQZ5tV0irQywRcFvOZwdTcROFV17n4dyGdEplEHcRZxGH3BuKWJZY4Rw==
X-Received: by 2002:a17:906:cb08:b0:a44:48db:9060 with SMTP id lk8-20020a170906cb0800b00a4448db9060mr2967797ejb.19.1710332371823;
        Wed, 13 Mar 2024 05:19:31 -0700 (PDT)
Message-ID: <064ec76a-4957-448b-9afe-1bd264fd81c7@suse.com>
Date: Wed, 13 Mar 2024 13:19:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/PoD: tie together P2M update and increment of
 entry count
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <740404f0-3da9-4ae5-b4a5-b24cb2907e7d@suse.com>
 <CA+zSX=YiG9dskoZVw8u+bKtD5a-8Sc1Z+hRMUgzv=a1HmYawZg@mail.gmail.com>
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
In-Reply-To: <CA+zSX=YiG9dskoZVw8u+bKtD5a-8Sc1Z+hRMUgzv=a1HmYawZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2024 11:58, George Dunlap wrote:
> On Tue, Mar 12, 2024 at 3:22 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> When not holding the PoD lock across the entire region covering P2M
>> update and stats update, the entry count - if to be incorrect at all -
>> should indicate too large a value in preference to a too small one, to
>> avoid functions bailing early when they find the count is zero. However,
>> instead of moving the increment ahead (and adjust back upon failure),
>> extend the PoD-locked region.
>>
>> Fixes: 99af3cd40b6e ("x86/mm: Rework locking in the PoD layer")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The locked region could be shrunk again, by having multiple unlock
>> calls. But I think both ioreq_request_mapcache_invalidate() and
>> domain_crash() are fair enough to call with the lock still held?
>> ---
>> v3: Extend locked region instead. Add Fixes: tag.
>> v2: Add comments.
>>
>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -1348,16 +1348,22 @@ mark_populate_on_demand(struct domain *d
>>          }
>>      }
>>
>> +    /*
>> +     * P2M update and stats increment need to collectively be under PoD lock,
>> +     * to prevent code elsewhere observing PoD entry count being zero despite
>> +     * there actually still being PoD entries (created by the p2m_set_entry()
>> +     * invocation below).
>> +     */
>> +    pod_lock(p2m);
>> +
>>      /* Now, actually do the two-way mapping */
>>      rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
>>                         p2m_populate_on_demand, p2m->default_access);
>>      if ( rc == 0 )
>>      {
>> -        pod_lock(p2m);
>>          p2m->pod.entry_count += 1UL << order;
>>          p2m->pod.entry_count -= pod_count;
>>          BUG_ON(p2m->pod.entry_count < 0);
>> -        pod_unlock(p2m);
>>
>>          ioreq_request_mapcache_invalidate(d);
>>      }
>> @@ -1373,6 +1379,8 @@ mark_populate_on_demand(struct domain *d
>>          domain_crash(d);
>>      }
>>
>> +    pod_unlock(p2m);
> 
> We're confident that neither domain_crash() nor
> ioreq_request_mapcache_invalidate() will grab any of the p2m locks?

There's no doubt about ioreq_request_mapcache_invalidate(). domain_crash(),
otoh, invokes show_execution_state(), which in principle would be nice to
dump the guest stack among other things. My patch doing so was reverted, so
right now there's no issue there. Plus any attempt to do so would need to
be careful anyway regarding locks. But as you see it is not a clear cut no,
so ...

> If so,
> 
> Reviewed-by: George Dunlap <george.dunlap@cloud.com>

... rather than taking this (thanks), maybe I indeed better follow the
alternative outlined in the post-commit-message remark?

Jan

