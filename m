Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893CA83974
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 08:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944895.1343196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2lXd-0007ox-9I; Thu, 10 Apr 2025 06:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944895.1343196; Thu, 10 Apr 2025 06:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2lXd-0007nR-6R; Thu, 10 Apr 2025 06:37:37 +0000
Received: by outflank-mailman (input) for mailman id 944895;
 Thu, 10 Apr 2025 06:37:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2lXb-0007n2-6q
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 06:37:35 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 486be30a-15d6-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 08:37:33 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso178427f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 23:37:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893fdf9asm3698105f8f.84.2025.04.09.23.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 23:37:29 -0700 (PDT)
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
X-Inumbo-ID: 486be30a-15d6-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744267052; x=1744871852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt41AS7wb5RQEELbz2qblq8bXt4lBMzeuUrx3IoOesM=;
        b=VH9xWH+jS081WL1tGZYUxjsz54W0H5VUjD5Pdb70riVH4XE79aZbcjM9CjqgY2rfjb
         aj/okkvM9X3cjFILkoN7YA6Vc8JuwSesJbun0A4j/KbWzpwB4PZbR8SxzgAvVUJHei8j
         0cwPLblnck4TIW+RALq6QJ7LV+qam7yVXRWja7VHGR1hgdr46U2t6zCqkCI6zCDkoykl
         g0QzdDpLVBsmiXqvoTFFQcA093C4DA4sn481EK5qUCRlQxhTWJCh15xRx/xFLL9vKV7y
         AbBfoTxpT2mniuy4qHz800AYE90JzryaUNE7+yMspNVkku+WE6JdmVx8r0NENLO3tZGi
         hYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267052; x=1744871852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt41AS7wb5RQEELbz2qblq8bXt4lBMzeuUrx3IoOesM=;
        b=CBLqkZZNfboTUFIdADi1LwHycJBc8l+omEKClBXgxji3G6G4ripQEwkENuyjyPXTl5
         q8idxOKCo/3t2lzw9Y9k5JijOTSXVK3fKaR76Cur1NXdK2h/e1qejhz0JAJHVGz43HF5
         bsNqNqFpGdGpiV4P3F4M34OjhZg0aII/l1tdaFqtISBZ4ICB620O5Lk+PhdgS0Oua+1Y
         G55iTScw1OuHRj8bfY+NHxUdRdQq65cKRZFi3inG5WgJTuZo+GfDWrtrYDVp2ixcae/K
         FDCsVH+3NaVWrezKjG0zUFqifw3YKSQavz0leWhmWaUnBHOIeccJWRygfBYFS9EOQVX2
         lCLg==
X-Forwarded-Encrypted: i=1; AJvYcCU4dRxKyRxkR56PksnSjCjhvsClZZHf4bp6Lv58dlOWEXb8eNZLff7dE96Cfi46qvvfCmuwqSOIeHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeLr4KzJFx6E+F7C4n38kAcqmVE/S7IR9kbZgPpmdAgyiNhJnR
	m4nfdOihwVovRj+twg66C7fx7Th4B2nYcCXSLWjv8NSLf7qmb9vz3wDTh955E9CBGmqRFnAIV1U
	=
X-Gm-Gg: ASbGncu0wtyK/Zv35WgwZIZ92eFAqQO9pDrX/4dKidKcNdiQLaUl1LWlboC0xqYpIez
	wLrW6KK6r4A2mNh1FYwH42jX0wAea8IV9V6/QlJVfLmbLMb/xFKDL7HmlFEk/sc/OEnew67o8SG
	Q/F7ZFmock/MvTzd4O4RzNEjVCVcz6rwZ80BxdpAOQRtAhaDyzeJNunestccLmLk5/DR11d3kw5
	qglo6qxZ/xfbUYaaLuuSdHinbGsr9tacKwf0tthLFgPg4AKqYHsDLs/uPJIostMqgUBAcCa1FKz
	EMsXlKnSp5pdEM28OzC2PHVN0dRJRgbhjhlIm5oOY9HjPKD+TwK/j+5u18FgtLWMQeoZtVy3VLI
	IJ9XFKxqcQQIN76fzJXLvkqagXoWoJUD9Bx/2
X-Google-Smtp-Source: AGHT+IGY2AYJopaw5U0cTG6fY1fNkhnokNgmTTAHuPXQL9KXNIHA6qbNYKsz01tiNrdLb3fJ0MG5gw==
X-Received: by 2002:a05:6000:144a:b0:38d:d701:419c with SMTP id ffacd0b85a97d-39d8f4e71admr964179f8f.41.1744267049733;
        Wed, 09 Apr 2025 23:37:29 -0700 (PDT)
Message-ID: <8d9ccb03-08d5-4bc7-adc4-7d2ac9f867ce@suse.com>
Date: Thu, 10 Apr 2025 08:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-2-dpsmith@apertussolutions.com>
 <2e02b7d6-fe71-4ed8-a09d-5bde7438718c@suse.com>
 <4aa999f4-48d3-400c-9dc4-21d3f31f3d78@apertussolutions.com>
 <72d3e83d-cb99-41b7-bf0d-b98b3927076e@suse.com>
 <0fabd9d0-ac4c-4ddd-83c7-e4fc2819b506@apertussolutions.com>
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
In-Reply-To: <0fabd9d0-ac4c-4ddd-83c7-e4fc2819b506@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.04.2025 01:55, Daniel P. Smith wrote:
> On 4/7/25 03:10, Jan Beulich wrote:
>> On 05.04.2025 02:04, Daniel P. Smith wrote:
>>> On 1/30/25 08:45, Jan Beulich wrote:
>>>> On 26.12.2024 17:57, Daniel P. Smith wrote:
>>>>> @@ -596,9 +597,10 @@ int __init dom0_setup_permissions(struct domain *d)
>>>>>        return rc;
>>>>>    }
>>>>>    
>>>>> -int __init construct_dom0(struct boot_info *bi, struct domain *d)
>>>>> +int __init construct_dom0(struct boot_domain *bd)
>>>>
>>>> Pointer-to-const? Domain construction should only be consuming data
>>>> supplied, I expect.
>>>>
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>>>>
>>>> Maybe boot-domain.h? Or was that suggested before and discarded for
>>>> whatever reason?
>>>>
>>>>> @@ -0,0 +1,28 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>> +/*
>>>>> + * Copyright (c) 2024 Apertus Solutions, LLC
>>>>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>>>>> + */
>>>>> +
>>>>> +#ifndef __XEN_X86_BOOTDOMAIN_H__
>>>>> +#define __XEN_X86_BOOTDOMAIN_H__
>>>>> +
>>>>> +struct boot_domain {
>>>>> +    struct boot_module *kernel;
>>>>> +    struct boot_module *ramdisk;
>>>>
>>>> "ramdisk" is Linux-centric, I think. Can we name this more generically?
>>>> "module" perhaps, despite it then being the same name as we use for the
>>>> modules Xen is passed?
>>>
>>> Ramdisk is not a linux-centric, take OpenBSD for example [1]. Calling
>>> the field "module" is a recipe for confusion. Especially considering
>>> that we are more or less providing a lightweight version of the
>>> toolstack interface which use the name ramdisk.
>>>
>>> [1] https://openbsd.fandom.com/wiki/Creating_a_custom_OpenBSD_RAM_disk
>>
>> Just one other OS also using such a concept doesn't mean much. In fact, "ramdisk"
>> isn't quite appropriate a term for Linux nowadays anymore anyway. An initrd can
>> consist of multiple pieces now, not all of which end up taken as "ramdisk". I
>> wouldn't insist on "module" as a name, but I continue to think "ramdisk" is
>> inappropriate. The fact that the toolstack uses the term has historical reasons;
>> it doesn't mean new code in Xen needs to continue to use that term.
> 
> That opening response is very disingenuous and goal post moving. Your 
> initial comment asserted that it is a Linux only concept, and when met 
> with another example, you now want to just brush it off.

Well, not quite. I deliberately said "..., I think" to indicate the my
horizon. For background, I've originally come from the DOS/Windows and
NetWare worlds, where no such concept ever existed (again, to my
necessarily limited knowledge).

> The fact is that the concept of a ramdisk predates Linux by a 
> considerable amount, 1979 CP/M introduced the concept. Yes, initrd is a 
> variation of a ramdisk, which is why the field is not called initrd 
> (despite that term used elsewhere as a variable name). I would also 
> point out, as you very well know, Linux's multiple module ramdisk is not 
> supported by Xen today, nor is there any plan to add it.

I don't understand what you're alluding to here. Xen doesn't itself need
a ramdisk. Nevertheless to perhaps find microcode to load, it peeks into
the (sole) module provided to the Dom0 kernel.

> The fact is that ramdisk **is** a general term for the specific 
> capability that the primary supported operating system uses, along with 
> other operating systems *BSD. As a result the concept is all over the 
> code base and so it is not at all unreasonable to have an explicit 
> reference reserved for it.

Yet then, compared to multiboot, it being just a single module is a
perhaps severe (portability) limitation. And as soon as we talk about
multiple modules, I'm relatively sure you agree that we can't assume
them all to be RAM disk images. See how Xen itself has got Dom0 kernel,
Dom0 initrd, XSM policy, and CPU microcode.

Naming the thing as generically as possible at least clearly indicates
the route to go from 1 to N.

Jan

