Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE889C6AC18
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 17:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165209.1491999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOxv-0006gA-97; Tue, 18 Nov 2025 16:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165209.1491999; Tue, 18 Nov 2025 16:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOxv-0006d2-5r; Tue, 18 Nov 2025 16:54:03 +0000
Received: by outflank-mailman (input) for mailman id 1165209;
 Tue, 18 Nov 2025 16:54:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLOxu-0006cv-IG
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 16:54:02 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e1dd83a-c49f-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 17:54:00 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6431b0a1948so10128387a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 08:54:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad43dfsm1394125566b.20.2025.11.18.08.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 08:53:57 -0800 (PST)
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
X-Inumbo-ID: 2e1dd83a-c49f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763484840; x=1764089640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MxMe46qWD6ZN/K6B9MwEFXrhgMmccQiQCLHBui5UjoI=;
        b=NvWsKGX5vB9VUiwEdBywXeBndcyXf4PWGc1iKBOTmLffYZklniM5gB3EP1xITUXQ8J
         H7D8nzRJt+N+7KTKHGv9ajXOgAKbS7mVx9tPYJ8F60XUWcVOvcYOInVVrnyW3j5hhpXB
         xPWnhmGQQaZlATN5zDFMLWLnE07QRWfRq23fXFG7v+gqmyk5Rhi3o2EdwkSRGIwpIIrL
         7LW4XTI8IDZVrB0mFF8BEpwFymmgCAe6cNPOlw8mxwTt8OlOXo+7F8adPT1//vuoQkvG
         GTF+BwtNwH5aDdkKbzpjX7dA2FEbZ0TnEdQ1fqKKGeATDwgy+//ayKMa4hXoXfI72P/t
         jetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484840; x=1764089640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxMe46qWD6ZN/K6B9MwEFXrhgMmccQiQCLHBui5UjoI=;
        b=ldKAVfwY6Bn1xj3iweHyE32EZWAdlt1n/h2lJ/WrjTmkkiJQbaVSqhLcfLM0EvhGNA
         1WlAtEnjqDYbqwUBsJmSWP7fjmil7RUM6NaQL1EQCY524IoSz18nrs84QDE1gsHrICOS
         DogGX6dud7SPUme08rplskbcshRvFd9gqgHtUGPR97xIGONrKGli64/kYU4bnMKNgNck
         nQmkKbp26MzGTeEIvzcH4IBglU3IBEwHa45zQfBbfBVbK8QHmuhMGwU8oAygp0Yqvl7H
         j8YTuOXrddUyoP2xQ1eCpggStTbTDgHGWRDG6K+RrzdS3hawN2EjKd8gmZj9Alxfi1uI
         4g5A==
X-Forwarded-Encrypted: i=1; AJvYcCXGvgeKW1EwyUWOAC3mdGlwqLXWNbdFG+bVAxi4oll4xHCzBkZUmDerfIutyE0+6OFZ5CtaKD5lKCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywyYVa39D8iulVFj8QijWWVrdHk8B84FtZ2q2fA/zRSv0FeSXb
	ELZgcPG/Lf6GE8QIls6ki/1TGxpuiPbXjgPRHKP1yYuNhtj+qzEg2su+G+9FZCDGxQ==
X-Gm-Gg: ASbGncs7yfgNBIdyqBdUs3qjle4+qE0zcT/Iiqu3aDi1RMjCnFPuBwHCiTorcSVF0B0
	2PpEzGWT8AyO3xJ+KLZ4o7HWvKYuLwhqD9KqkL8O5A0nAx+Lq8PofHDn0NJKJzWZOulJp8gdTZu
	SuzOlrzYjZzV63Fp4J42w1EAYbUNqyaS2RFPGhuiNs7OWano94fUxX+yqL/R8Nfg9Lei/6pjy70
	NUHWrBDZ3jefLtrqlC3EsT/dfXooETni3H5zJYhHp+GDsrpZ3RJPTwsw7kelGhLfVB5ZT//j1H2
	/6YdrI3tGLTs5PZXaLuVNXTfnBW/HrFuD3lsSnMa4MYFf69g87+T9pmoezMKETKbAwsBvKTPoEv
	Yx1F5GG9L+Q5207TLmJB7ya2+sGhRKzNRYouSv/hGnlNqEQisgiutfjib6KexXz5qUqBKF01ic4
	tJmRE+07uviFkax6QtdLJp3ytRcMYGpCerarWm/2b6zcrhvrwulSTNZfsuR4Ze24iO
X-Google-Smtp-Source: AGHT+IGh5nkSDGrxftaeDOlHn+vNVAVaaXJLI8pxqLTrBauRHhWdq+z8N/6rff8dNd/iFSiTCd1zbg==
X-Received: by 2002:a17:907:7f8a:b0:b76:277b:9a58 with SMTP id a640c23a62f3a-b76277ba172mr274700666b.9.1763484839705;
        Tue, 18 Nov 2025 08:53:59 -0800 (PST)
Message-ID: <b3e43204-6555-49ec-8ae1-8c54e91b432c@suse.com>
Date: Tue, 18 Nov 2025 17:53:56 +0100
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
In-Reply-To: <ab1dc276-2753-4a9b-932b-6cce3ee2b58a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 16:30, Andrew Cooper wrote:
> On 18/11/2025 3:06 pm, Jan Beulich wrote:
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -121,7 +121,31 @@ struct cpu_policy
>>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
>> +
>> +            /* Leaf 0x6 - Therm/Perf. */
>> +            struct {
>> +                uint32_t /* a */:1,
>> +                    turbo:1,
>> +                    arat:1,
>> +                    :4,
>> +                    hwp:1,
>> +                    hwp_notification:1,
>> +                    hwp_activity_window:1,
>> +                    hwp_epp:1,
>> +                    hwp_plr:1,
>> +                    :1,
>> +                    hdc:1,
>> +                    :2,
>> +                    hwp_peci:1,
>> +                    :2,
>> +                    hw_feedback:1,
>> +                    :12;
>> +                uint32_t /* b */:32;
>> +                uint32_t /* c */ aperfmperf:1,
>> +                    :31;
>> +                uint32_t /* d */:32;
> 
> Elsewhere, single bit fields are bool foo:1, and these want to match for
> consistency.

Oh, yes, will change.

>  In particular using uint32_t:1 creates a latent bug in
> patch 8.

I don't see where that would be.

> One problem with bool bitfields is that your :4 needs to become 4x :1. 
> Right now his hidden in the macros that gen-cpuid.py makes.
> 
> Given that b is of type uint32_t, you can omit the :12 from the end of a
> and leave a comment.  Similarly, the trailing :31 on c can be dropped.

We have these in many other places, and omitting in particular the :31
would also feel somewhat fragile / misleading. It'll need to be

                bool     /* c */ aperfmperf:1;
                uint32_t :31;

or something along these lines.

>> +            } pm;
> 
> Nothing else is sub-scoped.  I'd prefer that you drop the 'pm'.

Wouldn't that require the use of the very extension you just talked about
at the committer's call?

Jan

