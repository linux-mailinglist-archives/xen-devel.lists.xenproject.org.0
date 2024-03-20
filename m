Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9FB880C02
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695747.1085762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqNA-0002bK-Tc; Wed, 20 Mar 2024 07:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695747.1085762; Wed, 20 Mar 2024 07:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqNA-0002YH-Q7; Wed, 20 Mar 2024 07:28:28 +0000
Received: by outflank-mailman (input) for mailman id 695747;
 Wed, 20 Mar 2024 07:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmqN9-0002YB-5V
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:28:27 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70131dfc-e68b-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 08:28:25 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso779287566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 00:28:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qx33-20020a170907b5a100b00a46baba1a0asm3481034ejc.100.2024.03.20.00.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 00:28:24 -0700 (PDT)
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
X-Inumbo-ID: 70131dfc-e68b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710919704; x=1711524504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0LEgY1RjsJIakwBbbw3bdu6oVzf6ULLUGjZUk7F0xo=;
        b=c/KKEThM87WWKq3Z7Vija5Pxuz30MxqqmaZRUb6pJioPY/ZG4Tb3MeCB7Maeik1QX7
         X/yOwTY3En5TvghOW1sD7i8PkbC439m+OswSjtqq76Rxf1PWFmjLll6TdNrTSGqEvQyk
         /s1P51qzZXvBkQYt6WUHSRdVYevQwciaMLjRUXTP2XnHtXxoA3mtMLbur72RmFAL9t1N
         qyYVwlhNxY7pI8/Z9u90l78NSutAsYAyuIUPFgg95E9U/LIusPsIJ9//WZMVTg+lQqoj
         /Kgm0uqRRA7iQsfnJMhjBeRf8UMgk3FvduCZH0/N8fNStQE7B2m0w1fnGpfq4eINAwod
         d6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710919704; x=1711524504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0LEgY1RjsJIakwBbbw3bdu6oVzf6ULLUGjZUk7F0xo=;
        b=J/Px3L+NflLDzWJyYGwewRqm2j3vZmJEbruHshCeEM2wuL/dI82ijGDDTyliiYR//3
         exW36hpiPyG5nS7ahGSt6Qvd5hzlmk5CN1sjHj2A3NLUhGgcEdDMsiMgY5O/R+LyGer6
         KPgENlRqbbCe1uCdqzAJ93vr8J6uZZG5KCldeL75McZw6cEd4KTIfO9ot7BqJcbN5Q/f
         6xsfk6eJdBdcmXGWDOd169JSXXGD0ArgS7dhB0Ry7PgDbxTmHXJ2m4knurxWEHuZn0km
         tAkX7nuCVrSGSu6y/VQDWy2/EYux0If2EBiX71VH0y2YOqq0j40koZIHG7MJUzbJjxZG
         vSIw==
X-Forwarded-Encrypted: i=1; AJvYcCWm44Nsxiq/LUdVy+a8GFCnFHgdSQhHydU+hFkTdV5HvlPBLZpYNhwxmQHh7cEKV2Hlv+Xm6R4PdhaNAu39I8IoSHbt9IlLdyAvY3bq1ik=
X-Gm-Message-State: AOJu0Yx7V9dui1K6gjPgSW6G+RgAq5AjcluCfF83M2p8TCpKI1O2FLVP
	XePJxSQW2CRdHuah2FuDLaBY2GyxZ6JwRSgUEdNn0qvClQLmYNPvV+sSLjek+g==
X-Google-Smtp-Source: AGHT+IGAOVl6MYYeRG2wz/mmad70P4kBTBXEmWqrh64wZSCM40FdHOXcrbfu7CDsBnLkLzQOzzZlZg==
X-Received: by 2002:a17:906:c042:b0:a46:cf3e:c68f with SMTP id bm2-20020a170906c04200b00a46cf3ec68fmr3904267ejb.49.1710919704477;
        Wed, 20 Mar 2024 00:28:24 -0700 (PDT)
Message-ID: <1f65c061-1877-4c73-86f3-4a814f9a3e18@suse.com>
Date: Wed, 20 Mar 2024 08:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: increase NMI timer frequency if necessary
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d5fd3646-18b3-4dae-8da7-6afa187f930e@suse.com>
 <61b8e8a6-ab9d-434d-88dc-9ea4a082375b@citrix.com>
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
In-Reply-To: <61b8e8a6-ab9d-434d-88dc-9ea4a082375b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2024 21:51, Andrew Cooper wrote:
> On 25/01/2024 4:55 pm, Jan Beulich wrote:
>> Since the performance counters used for the NMI watchdog count non-
>> halted cycles, they may count at a rate higher than cpu_khz.
> 
> Is this in theory, or observed in practice?

It's been over two months since doing the experiments, so I can only go
from memory, but my recollection is that I actually observed higher
rates, just not high enough (yet) for the watchdog (without this change)
to start malfunctioning.

> It is my understanding that perf counters count in P0 reference cycles,
> and not at the Turbo/CBS rate.
> 
>>  Thus the
>> watchdog tick may occur more frequently than invocations of the timer
>> if we don't account for the ratio between nominal and maximum CPU clock
>> speeds, which would be a problem in particular when "watchdog_timeout=1"
>> is in effect (for high enough ratios even larger timout values may pose
>> a problem).
>>
>> Leverage the so far display-only data we collect on newer Intel and AMD
>> CPUs. On older CPUs we just have to (continue to) hope that the default
>> frequency of 1 Hz is okay(-ish) to use.
>>
>> While adding the new variable, also move the (now adjacent) cpu_khz to
>> .data.ro_after_init.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This renders the "log" in the function names somewhat stale, but I don't
>> think this strictly warrants renaming the functions right away.
> 
> I'm not comfortable with this change.  It's adding to a complicated
> timing problem, rather than simplifying it.

The actual change to the watchdog logic is minimal - a build-time constant
is replaced by a boot-time determined value.

> The real problem we've got is that the NMI handler is guessing at the
> timeout by counting NMIs, not by actually counting time.  There are
> several ways to fix this even with the current rendezvous logic.  When
> the NMI handler can actually say "if ( NOW() - last > timeout )", then
> the exact frequently of NMIs becomes far less important.

But that would come with its own downsides: The logic within the NMI
handler should be as simple as possible, involving as little as possible
other code. NOW(), for example, cannot really be used there without
first fiddling with the time rendezvous (to make sure an NMI hitting in
the middle of an update to the scaling values will know how to use
consistent data; that could e.g. be done by flip-flopping between two
instances of the data, with a "selector" always flipped last).

Jan

