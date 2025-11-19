Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D71C6D03B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 08:02:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165526.1492250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLcCz-0007NA-PQ; Wed, 19 Nov 2025 07:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165526.1492250; Wed, 19 Nov 2025 07:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLcCz-0007Ld-Mk; Wed, 19 Nov 2025 07:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1165526;
 Wed, 19 Nov 2025 07:02:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLc7Q-00055J-PW
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 06:56:44 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5ea9e2c-c514-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 07:56:39 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6419b7b4b80so9471060a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 22:56:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b2155sm14267224a12.29.2025.11.18.22.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 22:56:38 -0800 (PST)
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
X-Inumbo-ID: e5ea9e2c-c514-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763535399; x=1764140199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fy55kcq9Jf4HY7Gu+2WwFcbUpHpA0ue3SoOVYKIlmd8=;
        b=Qr5JrZ2o8PKv45zQ01ljVcocArOD+a0itl7P9xq7pWN5Ignd/M9QDXQ/VgoB9cmVW2
         YhiwmDCHcq0A/ubumv4NxaKiqS84TXNxBQ9vc4BU2zlS6XlFoOGP+5wY1BPAFNvJWDVe
         YB2nOdW6a9X1lJ0xsiPDpC3/gGsbiKMIJOoKNgB0RF7uXk3k1WQgX/QmnqvtWJgVFmX4
         35PP69nu3h4AyhjHpPQrMZqtu+0znx68E1O1NcjRkzNwKixNgQq1uH71YT23QBP0n9Vu
         U8/8RNoxLeClYnKbZJwFNfmKfH+NADIVfTlnLjQzz8eFpZnNAhi0XEqu6Iru3+oDw7Sj
         GKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763535399; x=1764140199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fy55kcq9Jf4HY7Gu+2WwFcbUpHpA0ue3SoOVYKIlmd8=;
        b=aQQL9Yf/40XVrEziaKItZYsLiDzd5Rpr9SxXcMKTLDSUiKv8mkl6+xhcBInOWzVWmi
         zBMZQet0enbkW4o4xrqMMg8UFl2TilW/LMslmT8OqVqJeeDVsO6v6A4Tz1WdrfKAhgmv
         ih1b9YK64Z6ajWJa9W8puOPUFDqOVLoa0R9EaupSiRPkE3fpn9ozFuC+JB8jr/94VnTF
         9S0NXpVDEUsaoitCyGA1Nv6AWnaHSpeZlkKMSW07D0tEGNTlAP/phBlqE4a4/rlnJWIA
         H4tN09wcYMykZrCKJsNJYvOA92frorCoh6NsSoaAYe0/PNW3C9a5HPIVTxqYU+myXXOy
         UAww==
X-Forwarded-Encrypted: i=1; AJvYcCUtMkIsNVQ20oAfpjxRR2TvaxJWV+UAIqEvOFtSAx7bTJji8ktSRRGpAUEPPHkejoe+w4qS7pyUh7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJ+LfSRn4ccZc4qQ9/mJrKyF6D83/tmu22ACIn5x9qy9BQ5fn3
	owa894CZj/2fqt3OEyvQ56ugWTrVqzc7JOBn1k8sRnaDJTmuqLq8qN/vkZKeJbz3ug==
X-Gm-Gg: ASbGnctGyJtvua8vDjirt/pPHV/h1Y3S22WdWRGvvWnR9MnreKzbkLNfhxR0iOaBHO+
	DpE1Cue9eaOQthq3PI2v8YXoQX669qpROWLRCxZ/R9nB6OYWCe23LNPrGLpr5sOBC7k624oAkZC
	XXnJnh0VARDgRmOse0V+B4oNc08wdzYHcwSkGmpeq/O+WfuiA3YqqG/uqeZDPGXTFF0Oefy55bT
	n6KffZXp3c6zX5g+Gdh7KAkOe1ii+GbLgVUoHjsolkTVNX54frEDtWIj4xLq/3jh+qgV7k4m1qp
	foGfMw4NpY+7npxwE/8eyV5AM7hwnLm6xM+qGK8gPJg/xGVyVvGRHfJUbJYhCV80xcAauDegymA
	UkG87wckVvzx5KYcUEce8wys8DuE0PcZIThgx4DUu7B2knGMZxu4ba3q5Glpf+Kaofalx7Ywrq4
	KlWK4eWFXK6GxRRXNWKV3UmpDdKK2w+gaEZ+XHC7mIfxdnjooDQOofmVmo1xZhnjIwE/fgkGRuF
	R6XIB1MYwhe1oaQG8Wr8AD5
X-Google-Smtp-Source: AGHT+IGljgB7DJRroBXArNdgyz5nVUpCKsHeFZiupoUpcKgCIK5ImQ3eNXc6aAk8a2wUa4QeDKzHmQ==
X-Received: by 2002:a05:6402:518a:b0:641:27d8:ec3f with SMTP id 4fb4d7f45d1cf-64350eac3e6mr16873469a12.29.1763535399105;
        Tue, 18 Nov 2025 22:56:39 -0800 (PST)
Message-ID: <55bfa9d5-d795-4408-bcfa-6b3d2d1a89e7@suse.com>
Date: Wed, 19 Nov 2025 07:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] x86/cpu-policy: define bits of leaf 6
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <b59c0994-6bb2-4506-88ec-4ea0f3b6c311@suse.com>
 <ab1dc276-2753-4a9b-932b-6cce3ee2b58a@citrix.com>
 <b3e43204-6555-49ec-8ae1-8c54e91b432c@suse.com>
 <a35d9c4c-e76a-40db-9e27-3fd329ece089@citrix.com>
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
In-Reply-To: <a35d9c4c-e76a-40db-9e27-3fd329ece089@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 18:20, Andrew Cooper wrote:
> On 18/11/2025 4:53 pm, Jan Beulich wrote:
>> On 18.11.2025 16:30, Andrew Cooper wrote:
>>> On 18/11/2025 3:06 pm, Jan Beulich wrote:
>>>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>>>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>>>> @@ -121,7 +121,31 @@ struct cpu_policy
>>>>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>>>>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>>>>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>>>> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
>>>> +
>>>> +            /* Leaf 0x6 - Therm/Perf. */
>>>> +            struct {
>>>> +                uint32_t /* a */:1,
>>>> +                    turbo:1,
>>>> +                    arat:1,
>>>> +                    :4,
>>>> +                    hwp:1,
>>>> +                    hwp_notification:1,
>>>> +                    hwp_activity_window:1,
>>>> +                    hwp_epp:1,
>>>> +                    hwp_plr:1,
>>>> +                    :1,
>>>> +                    hdc:1,
>>>> +                    :2,
>>>> +                    hwp_peci:1,
>>>> +                    :2,
>>>> +                    hw_feedback:1,
>>>> +                    :12;
>>>> +                uint32_t /* b */:32;
>>>> +                uint32_t /* c */ aperfmperf:1,
>>>> +                    :31;
>>>> +                uint32_t /* d */:32;
>>> Elsewhere, single bit fields are bool foo:1, and these want to match for
>>> consistency.
>> Oh, yes, will change.
>>
>>>   In particular using uint32_t:1 creates a latent bug in
>>> patch 8.
>> I don't see where that would be.
> 
> In the printf.  %d vs %u.  Latent because it's ok until bit 31 gets
> used, and then it's not ok.

How would there be a difference? Every bit is individually unsigned when
the field type is uint32_t, so even bit 31 will cleanly produce 0 / 1
when read.

>>> One problem with bool bitfields is that your :4 needs to become 4x :1. 
>>> Right now his hidden in the macros that gen-cpuid.py makes.
>>>
>>> Given that b is of type uint32_t, you can omit the :12 from the end of a
>>> and leave a comment.  Similarly, the trailing :31 on c can be dropped.
>> We have these in many other places, and omitting in particular the :31
>> would also feel somewhat fragile / misleading. It'll need to be
>>
>>                 bool     /* c */ aperfmperf:1;
>>                 uint32_t :31;
>>
>> or something along these lines.
> 
> This doesn't work.  A gap of 31 bits gets inserted because of uint32_t's
> alignment, which is why the suggestion to ignore it does work (even if
> fragile).

Interesting. When (iirc) we converted the AMD IOMMU machinery to use
struct-s, it was me to be concerned of this, and you telling me the
opposite of what you say now. See how there's no problem in e.g.
struct amd_iommu_dte.

> I suggest a /* 31 spare bits */ comment, because the only other option
> is 31x :1's.

I'll do this differently anyway, ..

>>>> +            } pm;
>>> Nothing else is sub-scoped.  I'd prefer that you drop the 'pm'.
>> Wouldn't that require the use of the very extension you just talked about
>> at the committer's call?
> 
> No. It would just be a plain anonymous struct in this case, but it
> doesn't even need to be a struct.

... having realized over night that this would be what you ask for, and ...

> leaf 0,2,10 are all "top level" insofar as they're all inside .basic. 
> leaf 1 only has anonymous unions to join the the bitfield names and the
> field-wide name.

... getting things closer to what we use there:

            union {
                uint32_t _6c;
                struct { ... };
            };

Then I can safely and obviously omit any unused tail bits in the bitfield
set. I hope that's going to be okay with you.

Jan

