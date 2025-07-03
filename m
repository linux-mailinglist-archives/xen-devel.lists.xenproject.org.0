Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A505AF76AC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 16:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032211.1405931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXKb0-0007DU-Uu; Thu, 03 Jul 2025 14:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032211.1405931; Thu, 03 Jul 2025 14:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXKb0-0007Ac-Ro; Thu, 03 Jul 2025 14:07:26 +0000
Received: by outflank-mailman (input) for mailman id 1032211;
 Thu, 03 Jul 2025 14:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXKay-0007AW-RG
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 14:07:24 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09df6125-5817-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 16:07:22 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso4513765f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 07:07:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56cb98asm17026078b3a.126.2025.07.03.07.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 07:07:20 -0700 (PDT)
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
X-Inumbo-ID: 09df6125-5817-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751551642; x=1752156442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UppbXXPNoa7XaeDkweHOizGpw2oY3nYgmhw4YbzRjfg=;
        b=OC3/tCGBFv63hX/VLkL5fR8+994t8bnRHKYq7azcTnUZp2RAMNm72WnkuIKyuXXfIF
         RQmRlNaRp/ISvOwt9xamOSqgqg7rzgvr94ENxg1ewpKeruC8x9h1wombOkVs4mWuABkv
         Ei8A/0S9qFfWL04bFE3W+V9phQqLDmSP4qByO1cQXBUAuxObRf3K6H6U7RuxMxu92wmE
         muzXvl6x12dUWOMBufnw0+TCuqSXWNLMGeGARXmDyCX/zw2gRpKadSqwkOJGArL9Sp/k
         CRX6S1mx/zmg86bsRE+yswak6ZsZ6D3RMhNxpvWFz+CniuOH4GRhqemEVUxdfJaBCYI9
         uOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751551642; x=1752156442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UppbXXPNoa7XaeDkweHOizGpw2oY3nYgmhw4YbzRjfg=;
        b=JJlVtL7MAum6JqcDxjZWoeerJS80mAYqKy3mOtgG1+NIYK2fmraRrHPAdB/XbUlHJM
         QZ299curDF/quctwO7RWwWF83hSK6K+0YxjW3KQ/WFBnHknRGJ9jZM3JssQjbLgWZytt
         3PqQFLHmpRM39pa4qpAN7ZdCjqBEaVEHoUHgU3g2EoOlCtmjTfRyoHeEIq7SXnrQI7SR
         4YAiXjDFODNivECYNfKMZ1FQC39ZkNI5IInhMpOrfFZ4Z+cvP9zXf5AKNGI6aBi1xJzK
         uRd3PlIQwJ1fEbsnr6TUmaj+1rg89OidSsopHTqLR+/I1bsEGDnadmIG9hFDy4ddOSVF
         wgwA==
X-Forwarded-Encrypted: i=1; AJvYcCW4/Ry9VDTCiH0/AJtCHm30m6M66FkHYmirxhFNB8YSAYzh2+/SCqsjp6UyZmalojxjl71k01kctx4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOf9hcaiJHmdQcmug+EyfK5HPUNbpSH3YAXA88unLVGwYaCNIC
	XAgVj6WoY4IcSx6CK44ES0CHjJfj0vfCrkqtg9/ko/yRL4Pve4ZagL2rIz3sF6CzJA==
X-Gm-Gg: ASbGncsJCmB0ZLX+eDeowwAfPb+xzIKt3MVm81CMxBUXhmin4cBNnYjZ4PYedPdMq0g
	6v75MfRBj8GxS7CdOJOVU9A0MjgmO+3VnqeeAAd2EPDF5WgcAudbRO0+jI0hL+9Xf7d/tGIkiXi
	FkHAciTyd5AVFtA/5fSiVPD9rl/hSw4fN51fJ1ms6nASgku7mHSgJuVB0Reh/qWNai+Dq2DFMlq
	94qt2b+yAFQifHLauyuon8S3CSJowMW7az0e9l5bc/NUNCSfdblXgJuTr7vBq3WkXawgXHg4XfE
	J/7Bj2HwUGC27o8wuGwzAeN2Ya1p+ms9aY6OAwAoG0BMdX38s1/Eba2pNKmmgBvmWNC79caWKH0
	s4Tg2kQPdKSNSh9GdvfHaP6mqlGkOCn8dmbeHlGALC25wNnCAfqUXNuUPJA==
X-Google-Smtp-Source: AGHT+IFnq7dkhX3x/dl5+xA8nrUmQWWC2JgUpowDbOyuBTPdUYi7TQOVmoNAWtAOnb7QPFf8kNT4+Q==
X-Received: by 2002:a05:6000:2d86:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3b32fc27006mr1822224f8f.54.1751551641407;
        Thu, 03 Jul 2025 07:07:21 -0700 (PDT)
Message-ID: <fa38e755-8796-4ba1-9f41-07382f3f62b6@suse.com>
Date: Thu, 3 Jul 2025 16:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-5-andrew.cooper3@citrix.com>
 <0309f4d6-fa2a-4be3-a313-d6b4ebe362a2@suse.com>
 <947761f1-d474-421b-ac39-6926d8fdde56@citrix.com>
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
In-Reply-To: <947761f1-d474-421b-ac39-6926d8fdde56@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.07.2025 13:59, Andrew Cooper wrote:
> On 03/07/2025 10:01 am, Jan Beulich wrote:
>> On 02.07.2025 16:41, Andrew Cooper wrote:
>>> @@ -452,6 +466,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>>>          mwait(eax, ecx);
>>>          spec_ctrl_exit_idle(info);
>>>      }
>>> +
>>> +    alternative_io("movb $0, %[in_mwait]",
>>> +                   "", X86_BUG_MONITOR,
>>> +                   [in_mwait] "=m" (stat->in_mwait));
>> This doesn't strictly need to be an alternative, does it? We can save a
>> memory write in the buggy case, but that likely makes at most a marginal
>> difference.
> 
> It doesn't *need* to be an alternative.  It could be:
> 
> if ( !cpu_bug_monitor )
>     ACCESS_ONCE(stat->in_mwait) = true;
> 
> but getting rid of the branch is an advantage too.

That's the other alternative blob. What I mean that here it could simply
be

    ACCESS_ONCE(stat->in_mwait) = false;

without any conditional.

>>> --- a/xen/arch/x86/include/asm/hardirq.h
>>> +++ b/xen/arch/x86/include/asm/hardirq.h
>>> @@ -5,7 +5,19 @@
>>>  #include <xen/types.h>
>>>  
>>>  typedef struct {
>>> -    unsigned int __softirq_pending;
>>> +    /*
>>> +     * The layout is important.  Any CPU can set bits in __softirq_pending,
>>> +     * but in_mwait is a status bit owned by the CPU.  softirq_mwait_raw must
>>> +     * cover both, and must be in a single cacheline.
>>> +     */
>>> +    union {
>>> +        struct {
>>> +            unsigned int __softirq_pending;
>>> +            bool in_mwait;
>>> +        };
>>> +        uint64_t softirq_mwait_raw;
>>> +    };
>> To guard against someone changing e.g. __softirq_pending to unsigned long
>> while ignoring the comment, how about adding a BUILD_BUG_ON() checking both
>> parts of the union are the same size (which of course would require naming
>> either the union field within the containing struct or its struct member)?
> 
> That turns out to be very hard because of the definition of
> softirq_pending() being common.  More below.

Hmm, yes, I see. Then maybe

    BUILD_BUG_ON(offsetof(irq_cpustat_t, in_mwait) +
                   sizeof(irq_stat[0].in_mwait) >
                 offsetof(irq_cpustat_t, softirq_mwait_raw) +
                   sizeof(irq_stat[0].softirq_mwait_raw));

(or something substantially similar using e.g. typeof())?

>>> @@ -9,4 +11,36 @@
>>>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
>>>  #define NR_ARCH_SOFTIRQS       5
>>>  
>>> +/*
>>> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
>>> + * skipped, false if the IPI cannot be skipped.
>>> + *
>>> + * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
>>> + * set softirq @nr while also observing in_mwait in a race-free way.
>>> + */
>>> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
>>> +{
>>> +    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
>>> +    uint64_t old, new;
>>> +    unsigned int softirq = 1U << nr;
>>> +
>>> +    old = ACCESS_ONCE(*ptr);
>>> +
>>> +    do {
>>> +        if ( old & softirq )
>>> +            /* Softirq already pending, nothing to do. */
>>> +            return true;
>>> +
>>> +        new = old | softirq;
>>> +
>>> +    } while ( (old = cmpxchg(ptr, old, new)) != new );
>> Don't you mean
>>
>>     } while ( (new = cmpxchg(ptr, old, new)) != old );
>>
>> here
> 
> No. I'm pretty sure I don't.
> 
>> (with new latched ahead of the loop and old set from new inside it),
>> like we have it elsewhere when we avoid the use of yet another variable,
>> e.g. in inc_linear_{entries,uses}()?
> 
> Eww, no.  Having new and old backwards like that is borderline
> obfucation, and is unnecessary cognitive complexity for the reader.

Why backwards? You want to compare the (original) value read against the
expected old value. The way you wrote it you'll do at least one extra
loop iteration, as you wait for the fetched (original) value to equal
"new".

Jan

