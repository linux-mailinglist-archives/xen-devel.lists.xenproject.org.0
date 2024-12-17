Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2CB9F49A2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 12:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858769.1271007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVV5-0002yn-Ec; Tue, 17 Dec 2024 11:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858769.1271007; Tue, 17 Dec 2024 11:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVV5-0002wt-Bp; Tue, 17 Dec 2024 11:12:27 +0000
Received: by outflank-mailman (input) for mailman id 858769;
 Tue, 17 Dec 2024 11:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNVV4-0002wn-Oa
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 11:12:26 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cafbb95a-bc67-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 12:12:24 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso2513107f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 03:12:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801a7c8sm11070220f8f.49.2024.12.17.03.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 03:12:23 -0800 (PST)
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
X-Inumbo-ID: cafbb95a-bc67-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734433944; x=1735038744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ht0RZ4NK1kl3bi/eY/EWuXlbYq/ZtzNOq443JJbuVhY=;
        b=BShBVIOSIJNKHbvjAOOUGdox9SP5Os/MEWz8O2JJJd1a8O90YOLE3dFzV9UNeAx+fg
         vyW8t80FIBkEOb6+m8Kk7nf9YTrO4ZcFmKhxaY+j5f8CEyUuv0zqdErWxem4Ayyaapen
         cYuqOCUNCrtnK1wnFidvult2oNhnKMM1qQWKblklaF/OrClnFKitHyblqUKC50LZSiNr
         hKlJgNs1ZJz9rpGjtmNIdxGCIDIlWvSP+4hXtkaZvPtxF7SahExVeRLOBcTSLwbf4DuO
         GOyZmijl3M0bMN+HnLc2TprnJsf3e1pltoH5NGjUuJ/N9ZKp0wMIVwUiflIOMeIGZ3Sc
         XCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433944; x=1735038744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht0RZ4NK1kl3bi/eY/EWuXlbYq/ZtzNOq443JJbuVhY=;
        b=iabeO8YWjsR80O/l/drsZ9uzKomsiSti/sA2sOoeUrdpyiiW3zR4+k89+RPtzxDhur
         /Wpl9fLRD1XKlXiBzgKqMP/HrGVwE/cWaoniLQ/PM1wpg7hPLQcTWd5KytD36bVO+O9J
         UnsLwH9Zj87uMDLeSG+N0I73gccIhqDRjnvx9tYE8lRXtLH0cqQ9L5Dx3bj83BzPBtEw
         TWC9IeVoqQQk4L7uco3SfW5UG0yn9kBuqUQ+PFVzQ7JAKhM1B45FA+IVMY+plDmfzuh6
         LmdYz/kGk/RmvnMdv1x7ciVQKikQNRPM9y87IreOabxkjF52WtPMCXBsjam46CvS0D4G
         c3/w==
X-Forwarded-Encrypted: i=1; AJvYcCWU4XZc4XqRy6fvKq/7Nn9Sja3GRzySEOfxAmgWqCQD9ZFxfQAHw2meIva7xNcIb75BfemBq7J0qvA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJ16h2uupWUDDR1MiRjwEMJW7obeRAT1IQvgi/htWTLj3tKvGE
	DE140K4wn5Y2Gczmp7ZxWkLwLm3r5ng6d6DOF+reGY89EJZjAzXAsChs2RWo/g==
X-Gm-Gg: ASbGnctlFvAgMo+/n/R1SyB6d4DGU9x1nG6lRWBPcZcMCLoYUP3RV2ghtACal1qVYfj
	Ys9OL81Mwn4hWQiVeWDqJ1sdB3G0CSkgXc6zpd4QHVaafytlFfNU33H+4t3+PFg6E1o5L5MMn+w
	S3dvTBynb+D4Of4ZLN5j8zvS5XtIGsKNYxhKzqPKr+65QfFZICKmVGiJlh6z5mCni/+Pf5/C3Lv
	91N6pW1RUaWr5HojXZN/XTYj6GiDRDcL9ULSzOvv/LnR+aqkag8BznZy/BMDNz/u0rdEMinfKhh
	5Mr6pSwRIp799X3Sd6M+JEqZVUKcVky0cF16b8Y3GA==
X-Google-Smtp-Source: AGHT+IHhLJ6a9kqTDYwQ1sKAUX7qSsk+gfhMpq3XMs73EhSPLlgOBcMfBSOl+3vxP5QHDGNT7tkOcw==
X-Received: by 2002:adf:a1c1:0:b0:388:da2a:e48 with SMTP id ffacd0b85a97d-388da2a0e58mr1867676f8f.23.1734433944047;
        Tue, 17 Dec 2024 03:12:24 -0800 (PST)
Message-ID: <49a1b364-595e-4971-9819-f7e4beb35b05@suse.com>
Date: Tue, 17 Dec 2024 12:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/12] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-2-carlo.nonato@minervasys.tech>
 <eaf99fc7-30f4-4820-ab36-8f5926a4e9b8@suse.com>
 <CAG+AhRUNrj9a2P1TL7MNbkPw5scZjcTamQGxKsDS5sBWqpZrYg@mail.gmail.com>
 <00e38f79-6185-4dcb-be69-4b08fb4a81f4@suse.com>
 <CAG+AhRUxBDkw+Vhjg+dKcEX-56rM95NOuxSF2-a8DWangp-2uA@mail.gmail.com>
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
In-Reply-To: <CAG+AhRUxBDkw+Vhjg+dKcEX-56rM95NOuxSF2-a8DWangp-2uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.12.2024 11:25, Carlo Nonato wrote:
> On Tue, Dec 17, 2024 at 9:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.12.2024 17:33, Carlo Nonato wrote:
>>> On Mon, Dec 16, 2024 at 11:51 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 13.12.2024 17:28, Carlo Nonato wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/common/llc-coloring.c
>>>>> @@ -0,0 +1,124 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +/*
>>>>> + * Last Level Cache (LLC) coloring common code
>>>>> + *
>>>>> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
>>>>> + * Copyright (C) 2024, Minerva Systems SRL
>>>>> + */
>>>>> +#include <xen/keyhandler.h>
>>>>> +#include <xen/llc-coloring.h>
>>>>> +#include <xen/param.h>
>>>>> +
>>>>> +#define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
>>>>> +
>>>>> +/*
>>>>> + * -1: not specified (disabled unless llc-size and llc-nr-ways present)
>>>>> + *  0: explicitly disabled through cmdline
>>>>> + *  1: explicitly enabled through cmdline
>>>>> + */
>>>>> +static int8_t __initdata opt_llc_coloring = -1;
>>>>> +boolean_param("llc-coloring", opt_llc_coloring);
>>>>> +
>>>>> +static bool __ro_after_init llc_coloring_enabled;
>>>>> +
>>>>> +static unsigned int __initdata llc_size;
>>>>> +size_param("llc-size", llc_size);
>>>>> +static unsigned int __initdata llc_nr_ways;
>>>>> +integer_param("llc-nr-ways", llc_nr_ways);
>>>>> +/* Number of colors available in the LLC */
>>>>> +static unsigned int __ro_after_init max_nr_colors;
>>>>> +
>>>>> +static void print_colors(const unsigned int colors[], unsigned int num_colors)
>>>>> +{
>>>>> +    unsigned int i;
>>>>> +
>>>>> +    printk("{ ");
>>>>> +    for ( i = 0; i < num_colors; i++ )
>>>>> +    {
>>>>> +        unsigned int start = colors[i], end = start;
>>>>> +
>>>>> +        printk("%u", start);
>>>>> +
>>>>> +        for ( ; i < num_colors - 1 && end + 1 == colors[i + 1]; i++, end++ )
>>>>> +            ;
>>>>> +
>>>>> +        if ( start != end )
>>>>> +            printk("-%u", end);
>>>>> +
>>>>> +        if ( i < num_colors - 1 )
>>>>> +            printk(", ");
>>>>> +    }
>>>>> +    printk(" }\n");
>>>>> +}
>>>>> +
>>>>> +void __init llc_coloring_init(void)
>>>>> +{
>>>>> +    unsigned int way_size;
>>>>> +
>>>>> +    llc_coloring_enabled = (opt_llc_coloring == 1);
>>>>
>>>> Generally I'd suggest to only use > 0, >= 0, < 0, and <= 0 on such
>>>> variables.
>>>>
>>>>> +    if ( (opt_llc_coloring != 0) && llc_size && llc_nr_ways )
>>>>> +    {
>>>>> +        llc_coloring_enabled = true;
>>>>> +        way_size = llc_size / llc_nr_ways;
>>>>> +    }
>>>>
>>>> Hmm, I actually see a difference in someone saying
>>>>
>>>> "llc-coloring=0 llc-size=... llc-nr-ways=..."
>>>>
>>>> vs
>>>>
>>>> "llc-size=... llc-nr-ways=... llc-coloring=0"
>>>>
>>>> I'm not sure about Arm, but on x86 this can be relevant as there may be
>>>> pre-set parts of a command line with appended (human) overrides. Therefore
>>>> it always wants to be "last wins". Yet yes, you may weant to take the
>>>> position that in such a case the former example would require "llc-coloring=1"
>>>> to also be added.
>>>
>>> Yes, I think this should be the way to go.
>>>
>>>> Kind of against the shorthand llc-size+llc-nr-ways only,
>>>> though.
>>>
>>> The shorthand was proposed by you here:
>>> https://patchew.org/Xen/20240315105902.160047-1-carlo.nonato@minervasys.tech/20240315105902.160047-2-carlo.nonato@minervasys.tech/#05e4d3da-4130-4c57-9855-43b685ce5005@suse.com
>>>
>>>> Wouldn't it make sense to infer "llc-coloring" when both of the latter options
>>>> were supplied?
>>>
>>> We both agreed that it was something good to have.
>>
>> Right, and I'm not putting that under question. With that, however, I find
>> your reply ambiguous. If the shorthand is useful to have, is the requirement
>> to put a 2nd "llc-coloring=1" on a command line (as per above) really a good
>> idea?
> 
> I don't know an easy way to check for parameters order. We're close to feature
> freeze. Isn't this solution good enough for now?

Maybe it is, but then imo only when also calling out the apparent anomaly in
the command line doc. I.e. amend 'Note that using both options implies
"llc-coloring=on"' by e.g. 'unless an earlier "llc-coloring=off" is there' (in
both places).

Jan

