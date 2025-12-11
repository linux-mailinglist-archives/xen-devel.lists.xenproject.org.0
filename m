Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E9CB5007
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 08:41:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183593.1506228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbIu-0003cp-MH; Thu, 11 Dec 2025 07:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183593.1506228; Thu, 11 Dec 2025 07:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbIu-0003ap-Jc; Thu, 11 Dec 2025 07:41:36 +0000
Received: by outflank-mailman (input) for mailman id 1183593;
 Thu, 11 Dec 2025 07:41:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTbIt-0003ah-J6
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 07:41:35 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0699258-d664-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 08:41:33 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so2935455e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 23:41:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d836c4sm7578065e9.1.2025.12.10.23.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 23:41:32 -0800 (PST)
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
X-Inumbo-ID: d0699258-d664-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765438892; x=1766043692; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qgJnG7vvKe5fkGL1qjYTwfe696ujHpCbU/AQkE7N9r4=;
        b=GN8IXZ7pliZQhuAvJmiguIDT6FxlRa8wWPUO6tZWmOTmDS/fstsxJU3DH3z0QykR8r
         Rc53FyS7+/qfZi81LvVgrrJVio2H/LCAWz5bwWwJII2Vel3yMbeSdZiigkGrXRz6dEAr
         PaP1St9OSNavZx07204EJORyMRzvRzyT4Q3A8N7k6Hbi5pFDYs10tvhVqeYhEtwwN+GL
         t27d+5Y4PrD+WnhUdj1r+yxj5JTVhdhJDWBO+H0LcHDQYXbBAprThN9cmZVs9VpFn32k
         5UntdCxmNCgFlDFqGMIXc1kJwDf+z+OPXYpxS18F2/Kv1XPVYCRjFEFPz3p1tuUJV8cd
         2iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765438892; x=1766043692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgJnG7vvKe5fkGL1qjYTwfe696ujHpCbU/AQkE7N9r4=;
        b=cMhDdMlBzJPgTeFrp1gYYeaQ8SDhw0roYzsxUDgBEfL4ne52vrvs4MyIVX6JSMc7dw
         YBrQVRKiZMbEf/98pZzRw2DIoPppnsQNiGNydiXHC/G5sgN1fY9+pyQrYjGutjx4/BnN
         m9WyqPJnKtuSIJzCq5MdvJWSUliWEtn+QIcHvPw4b+rW0uLAP2XI3605gNa1WGeKS2by
         leRzenRpYPL87dny2fEMv/Ih2zShrIJk6mzfxyXiGOdBUOFZk8nJZ9cw13jOi1Ugn+K3
         LmFpjLnvi2tAz63vhHNjShzvGRiF3zczBGuEtyAEitwmdAy8rv02FPchDJSMZuYkL8/f
         PtmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXigBhyuEUMC6zNdaHyO8OUbL3lx5tuB3+2/qgZLhYGRZYmk536oFJuMInqDaRMRbCkaKFw2vQLSq0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyU807GzbrWLu/mydWdcYZ5NikEOd93FFLQl/x04rwEQRZcblSd
	QJs5oUTGdbcfH8y7HUdw/K0RySQTtIOrunaD22CnCa9C84yvtDgebuwhe8I6OXAyuQ==
X-Gm-Gg: AY/fxX5FyEAlppgftjn9F/W16hjMgeDV6kkqBEULAH7vk8gdr0Sk74urPLIVcDeklha
	bVpJ/tPZV3F7DM87jRFmlaayDYCbSoAtAO2sKDTSTq8NUqTp2g8Mf2JT/ZbNMA0H7l2c3wggmyf
	gIh+g6KOdNVdkigxjd/wn1mx7lO6rJ1IEfPLgd+vr9yLbpaUxCQslYyrPGlJsjLlbx2MFT3+x+o
	VbZUCQqlpKl+58Ehi3dij5RRJQbvBa0GKHL05unEZSzIcwjFHUahjdAr7r9eUhAqieinv/BkzmF
	c/HE+0wiO+Gqz4t2qqmE003yj9uSyCWne/QmA9wApV61i7/cQ7taB/i6QyHYI4Wm5w+DLjGW9Tj
	9cpi3/jh508TkE3ZEZj+nVsab0FJgdAMS4lVprSk9+5jULWaUw/8LVueYJac7W8v2lZVbaLNxvL
	KzU1i+JVwTTp7zCtfbrKAwd8XuBzUhAZbj9/Msl+KAuhf0oWi0SQ7CwLLdH7hs0UjnCa3QboM40
	e0=
X-Google-Smtp-Source: AGHT+IHk7yg8vwepikh5N/rsUopvmmKH+5c3I7V+xXxNg3MVELgABK/+95unmFmJh461UFvcFXyDtg==
X-Received: by 2002:a05:600c:681b:b0:477:632a:fd67 with SMTP id 5b1f17b1804b1-47a838040e1mr51922065e9.12.1765438892580;
        Wed, 10 Dec 2025 23:41:32 -0800 (PST)
Message-ID: <d3943552-07ca-4d3d-955f-64302da152e4@suse.com>
Date: Thu, 11 Dec 2025 08:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] x86/cpu-policy: define bits of leaf 6
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <8791387c-2799-4e0b-b187-1900b224a101@suse.com>
 <4827eec7-1452-4840-a151-1f5deeff1384@citrix.com>
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
In-Reply-To: <4827eec7-1452-4840-a151-1f5deeff1384@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 14:37, Andrew Cooper wrote:
> On 24/11/2025 12:23 pm, Jan Beulich wrote:
>> ... as far as we presently use them in the codebase.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Or should we make both parts proper featureset elements? At least
>> APERFMPERF could likely be made visible to guests (in principle).
>> ---
>> v2: Use bool and unions.
>>
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -121,7 +121,46 @@ struct cpu_policy
>>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
>> +
>> +            /* Leaf 0x6 - Therm/Perf. */
>> +            union {
>> +                uint32_t _6a;
>> +                struct {
>> +                    bool :1,
>> +                        turbo:1,
>> +                        arat:1,
>> +                        :1,
>> +                        :1,
>> +                        :1,
>> +                        :1,
>> +                        hwp:1,
>> +                        hwp_notification:1,
>> +                        hwp_activity_window:1,
>> +                        hwp_epp:1,
>> +                        hwp_plr:1,
>> +                        :1,
>> +                        hdc:1,
>> +                        :1,
>> +                        :1,
>> +                        hwp_peci:1,
>> +                        :1,
>> +                        :1,
>> +                        hw_feedback:1;
>> +                };
>> +            };
>> +            union {
>> +                uint32_t _6b;
>> +            };
>> +            union {
>> +                uint32_t _6c;
>> +                struct {
>> +                    bool aperfmperf:1;
>> +                };
>> +            };
>> +            union {
>> +                uint32_t _6d;
>> +            };
> 
> The _6[a-d] variables are only needed for the featureset <-> policy
> conversion which isn't the case here (notice how you don't need it the
> series), and we're unlikely to want in the future.
> 
> This wants to read:
> 
>             /* Leaf 0x6 - Therm/Perf. */
>             bool :1,
>                 turbo:1,
>                 arat:1,
>                 :1,
>                 :1,
>                 :1,
>                 :1,
>                 hwp:1,
>                 hwp_notification:1,
>                 hwp_activity_window:1,
>                 hwp_epp:1,
>                 hwp_plr:1,
>                 :1,
>                 hdc:1,
>                 :1,
>                 :1,
>                 hwp_peci:1,
>                 :1,
>                 :1,
>                 hw_feedback:1;
>             uint32_t :32; /* b */
>             bool aperfmperf:1;
>             uint32_t :32; /* d */
> 
> and with that, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, but: If then someone doesn't pay close attention when breaking up the "b"
field (perhaps also into booleans), things may go wrong. I deliberately added the
"raw" fields, despite not (presently) being used.

And to be frank: I said I would even before I sent the new version, without you
indicating I shouldn't go this route. Now what is pretty much a mechanical patch
will face yet more of a delay going in. I think requests like this should either
be made in a timely manner, or simply be omitted (in particular if otherwise a
patch is ready to go in). Had Jason not reviewed the series, and had I not
indicated that on this basis I would commit it today, how much longer would I
have had to wait? How's the backlog ever going to reduce this way?

Now that this is going to take yet longer anyway, we can as well deal with your
naming request in reply to patch 6 (which really would apply here first, imo). I
picked names largely based on what was used in the HWP driver, as that was the
in-tree status quo. I can certainly move closer to what the SDM has, but your
reply to patch 6 ended up being non-conclusive to me. I'll reply in more detail
there.

Jan

