Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E19F46A1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 09:57:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858638.1270885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTOC-0003HM-T6; Tue, 17 Dec 2024 08:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858638.1270885; Tue, 17 Dec 2024 08:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTOC-0003FI-QV; Tue, 17 Dec 2024 08:57:12 +0000
Received: by outflank-mailman (input) for mailman id 858638;
 Tue, 17 Dec 2024 08:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNTOA-0003FA-Mn
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 08:57:10 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6232415-bc54-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 09:57:09 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso34844585e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 00:57:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801ad9asm10404591f8f.58.2024.12.17.00.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 00:57:07 -0800 (PST)
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
X-Inumbo-ID: e6232415-bc54-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734425829; x=1735030629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZqANH81DfpWvQHFgH/lhQ8OEBOOTblLuZ2Pzfhl1zc=;
        b=CJovTNjJh4WcYiML8J4XEUcv0Br1/j+MFLogOvz9aM/0XbV7IC9vXHrHiQslouseJD
         C6d8rwEOIc+DAxhv/3FlmFPECyrG8dRjws0hga3WecDMSOsV5nH76hsYvyU5onKg+7L9
         qVJefFapnQEMikocSgwbEvkSje9vmTPgOL6GGZZLWX6Asn35iXogM6bbo19T4OhyfW8M
         IZaGcczQzg1dX66vyBaA5MfcmJXQlEzTdOMoMfMNdVejEb6qnoiTHsXoH/UPcYi3ubJ+
         XAUWeSbIz/8QJTFOfqARo6LYmlVd/wGpG4xA+YOvvTsvikhancxjsn8Pn5uoYnDAYG55
         6TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425829; x=1735030629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZqANH81DfpWvQHFgH/lhQ8OEBOOTblLuZ2Pzfhl1zc=;
        b=h20K9zuGkm8ntT/9u6eQY/I5fxREpfgU7Olfr/zFQvkstOxkrEiSWsUnl3ZuSqjwbp
         8KnhPO4fR53N4xEAyeSnCriDghSKoTNKfEF9KD2T0jWr1xJBDdWl7s6qGuF2mM/amMYu
         NgJs6QuvDa19fw2+eCAQr09lkrUeFm/Yk2n8XULHgONwXv6MoR5+FK0chhkLFgJRLZJs
         ELy4H9VjFepmDoLHOcxaqJxRgxRV5dHVtR05MaTaFAQ3yZsYmbgTQo5F9bqilLj3h2n6
         FMhHfqZMyTZ7nFQaC1HiwCmPBtqHc5BwVRu4bLdUJNqo4rWbuWWi/Fk4H7LsIIylp840
         SOVg==
X-Forwarded-Encrypted: i=1; AJvYcCX4vi58mFx7XCDEtJ7WqMJi5Xll5QfXqXRPxQDFqBXKG0gTE5l00b3my7ITJjj4Wiu8XPNOuGtgnuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/YzaUUl9ZzUv0X3lRruiP4zHxQwxlB6Hf2Jpdl80pOfFl3SsD
	kPuE1oVTDz4WomugNaSGoKGj4Ip5vaBi/n+F7Vsmd57DzD4psxzlkGOF7gK26w==
X-Gm-Gg: ASbGncv+b0V4+Vqf24SjbUZVeVZdi+Q1KxkUDDhBi+cEVaxkxPJXjEwBa8D+G62Z2dT
	5BuRmMTE98sh737wiK+t8S/o9XoQHzBpHJXId5mFoNUlnz984pD4/Sdqz7dustM7gjJiicx2QNZ
	gUgynrdwlEs2bsku2ijRQrCyJORscuKL8Ky5Sc4tGlRmSXm75rmiX71KFU5lb2d4awN9+YOSC07
	5b9zAru3RWgHpHRGKPw+6qwfBhYHedByPkn+sKG7S1jxumfaRyIF605tt6C2RG09t1wdqgJz7Al
	YBFM6tXDxWXxLPXREc7G7BFsX8k42EexgGA+8gPZ1Q==
X-Google-Smtp-Source: AGHT+IHYMig3P9rX/ddawG9T5zluX386lW4Dq7D29209MQD8Fw/uHo1iCWQ38cFxNVevAZ8jCBpPqw==
X-Received: by 2002:a05:6000:18a5:b0:386:2fc8:ef86 with SMTP id ffacd0b85a97d-38880ad775amr12023236f8f.14.1734425827676;
        Tue, 17 Dec 2024 00:57:07 -0800 (PST)
Message-ID: <00e38f79-6185-4dcb-be69-4b08fb4a81f4@suse.com>
Date: Tue, 17 Dec 2024 09:57:06 +0100
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
In-Reply-To: <CAG+AhRUNrj9a2P1TL7MNbkPw5scZjcTamQGxKsDS5sBWqpZrYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.12.2024 17:33, Carlo Nonato wrote:
> On Mon, Dec 16, 2024 at 11:51 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 13.12.2024 17:28, Carlo Nonato wrote:
>>> --- /dev/null
>>> +++ b/xen/common/llc-coloring.c
>>> @@ -0,0 +1,124 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Last Level Cache (LLC) coloring common code
>>> + *
>>> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
>>> + * Copyright (C) 2024, Minerva Systems SRL
>>> + */
>>> +#include <xen/keyhandler.h>
>>> +#include <xen/llc-coloring.h>
>>> +#include <xen/param.h>
>>> +
>>> +#define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
>>> +
>>> +/*
>>> + * -1: not specified (disabled unless llc-size and llc-nr-ways present)
>>> + *  0: explicitly disabled through cmdline
>>> + *  1: explicitly enabled through cmdline
>>> + */
>>> +static int8_t __initdata opt_llc_coloring = -1;
>>> +boolean_param("llc-coloring", opt_llc_coloring);
>>> +
>>> +static bool __ro_after_init llc_coloring_enabled;
>>> +
>>> +static unsigned int __initdata llc_size;
>>> +size_param("llc-size", llc_size);
>>> +static unsigned int __initdata llc_nr_ways;
>>> +integer_param("llc-nr-ways", llc_nr_ways);
>>> +/* Number of colors available in the LLC */
>>> +static unsigned int __ro_after_init max_nr_colors;
>>> +
>>> +static void print_colors(const unsigned int colors[], unsigned int num_colors)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    printk("{ ");
>>> +    for ( i = 0; i < num_colors; i++ )
>>> +    {
>>> +        unsigned int start = colors[i], end = start;
>>> +
>>> +        printk("%u", start);
>>> +
>>> +        for ( ; i < num_colors - 1 && end + 1 == colors[i + 1]; i++, end++ )
>>> +            ;
>>> +
>>> +        if ( start != end )
>>> +            printk("-%u", end);
>>> +
>>> +        if ( i < num_colors - 1 )
>>> +            printk(", ");
>>> +    }
>>> +    printk(" }\n");
>>> +}
>>> +
>>> +void __init llc_coloring_init(void)
>>> +{
>>> +    unsigned int way_size;
>>> +
>>> +    llc_coloring_enabled = (opt_llc_coloring == 1);
>>
>> Generally I'd suggest to only use > 0, >= 0, < 0, and <= 0 on such
>> variables.
>>
>>> +    if ( (opt_llc_coloring != 0) && llc_size && llc_nr_ways )
>>> +    {
>>> +        llc_coloring_enabled = true;
>>> +        way_size = llc_size / llc_nr_ways;
>>> +    }
>>
>> Hmm, I actually see a difference in someone saying
>>
>> "llc-coloring=0 llc-size=... llc-nr-ways=..."
>>
>> vs
>>
>> "llc-size=... llc-nr-ways=... llc-coloring=0"
>>
>> I'm not sure about Arm, but on x86 this can be relevant as there may be
>> pre-set parts of a command line with appended (human) overrides. Therefore
>> it always wants to be "last wins". Yet yes, you may weant to take the
>> position that in such a case the former example would require "llc-coloring=1"
>> to also be added.
> 
> Yes, I think this should be the way to go.
> 
>> Kind of against the shorthand llc-size+llc-nr-ways only,
>> though.
> 
> The shorthand was proposed by you here:
> https://patchew.org/Xen/20240315105902.160047-1-carlo.nonato@minervasys.tech/20240315105902.160047-2-carlo.nonato@minervasys.tech/#05e4d3da-4130-4c57-9855-43b685ce5005@suse.com
> 
>> Wouldn't it make sense to infer "llc-coloring" when both of the latter options
>> were supplied?
> 
> We both agreed that it was something good to have.

Right, and I'm not putting that under question. With that, however, I find
your reply ambiguous. If the shorthand is useful to have, is the requirement
to put a 2nd "llc-coloring=1" on a command line (as per above) really a good
idea?

Jan

