Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA09B6139
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828107.1242941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66hY-0003Mb-9V; Wed, 30 Oct 2024 11:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828107.1242941; Wed, 30 Oct 2024 11:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66hY-0003K6-6S; Wed, 30 Oct 2024 11:17:24 +0000
Received: by outflank-mailman (input) for mailman id 828107;
 Wed, 30 Oct 2024 11:17:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t66hW-0003Jo-Nv
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:17:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86db87c9-96b0-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 12:17:19 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so82659405e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:17:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b13223sm15121917f8f.1.2024.10.30.04.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 04:17:18 -0700 (PDT)
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
X-Inumbo-ID: 86db87c9-96b0-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg2ZGI4N2M5LTk2YjAtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg3MDM5LjYyOTc2NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730287039; x=1730891839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=No1FlRIfpjF/Tg6hjlLc/4nEivohUEu7B25eL3XjwMI=;
        b=XrfAy9Zn9fvgQOFVwHD7fDYj/2Q1UuYSJCAHJ4OsZZhow7HnYXpL/Cn3YoTg0Npa4A
         VksLYIn1MGqkb4QgbFnQ+UDliiLrBpKQ0FMxcpC4hmq9MHy2AjOf57WXygYwmPpgRgQu
         W7yGigMAyAm5Q2FdBs8ZFGR/DnSwqGAqQWwBriHNzB/O5Ufr+q+fYTPajJMOTuZmPmcP
         9faNlq/aFMQ4mTkS3o1yCtfHMuEsw7kgO0xyS3ivORv+vLCLczUSc2tF5s98yWwDrUua
         RoE8qw1wTi+sTo32ioGG4iev2Ce7G+feIvHJDByWy9K8k2bVkvpqXBSSS+5Ja9JCR0XQ
         HNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287039; x=1730891839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No1FlRIfpjF/Tg6hjlLc/4nEivohUEu7B25eL3XjwMI=;
        b=c4XBigTsZI9gO59VeQ35XumRrpDCyZhoTNdIP0jZLEt43aZGv6j5NmYTzOBrBgz2ra
         E8l2IMV6Y4Is/Ua/VqDPJwiA9z1yNEWrsvZguilzqcbGLDaCK5aD+Q7f+EBEBroBC8pH
         Wbss1YJmmzPK0RTYKn7E+VR+bT82/NdzEhXnu/aTQZ5aHm2FK5H/De8CL4jD33dWA7Kz
         xrFruPQ3PWkMMA67XKoJK6/dNVwIbNU8BE9fHscUVZ4A+eJZlT7lJWKbjohAcRfkY/dy
         tLXUKPZuTl4LlQJX+HGhJu4FNwG66OsjuzfJhivtFEh6pGAEhHn4R7UQnIwb9LI6grSi
         h0sw==
X-Forwarded-Encrypted: i=1; AJvYcCXWk1ZUpKi6iKseo2bCwvt7yC8iGmSS5o+95If9+tN68dMseh1ldHVbysBf+83yJsZZ7XXkGunoPaE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrkFbcWiaiHnuHjseNsX8uBOobuVPVw2apuBp37hPRsopcyGRn
	BB0BUIZvW/ymingDMxgEWf9kwVS/5eHM9qhSHULoKbrEPGDY8MZcN6sXyO8b1g==
X-Google-Smtp-Source: AGHT+IEPJKhxhxZkwkNtRT6v0X8zCRzvUBFajGfw7ykNlemdI7Gytdf6WA8vmLUVhVStiMBXi1avTA==
X-Received: by 2002:a05:6000:b88:b0:37d:397a:5a05 with SMTP id ffacd0b85a97d-38061248a2dmr12360122f8f.54.1730287038807;
        Wed, 30 Oct 2024 04:17:18 -0700 (PDT)
Message-ID: <8984f1da-d4bb-4ab7-b1dc-bcc23c180abc@suse.com>
Date: Wed, 30 Oct 2024 12:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/setup: Make setup.h header self contained
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241030104406.2173357-1-frediano.ziglio@cloud.com>
 <1fa03cb0-ded1-4904-8830-f3feefecc404@suse.com>
 <CACHz=Zh04AhAwdhYY=i4DecvJbPMF770PE6SkLG+LzQLxueOMQ@mail.gmail.com>
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
In-Reply-To: <CACHz=Zh04AhAwdhYY=i4DecvJbPMF770PE6SkLG+LzQLxueOMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 12:15, Frediano Ziglio wrote:
> On Wed, Oct 30, 2024 at 10:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 30.10.2024 11:44, Frediano Ziglio wrote:
>>> The header uses rangeset structure typedef which definition
>>> is not included.
>>
>> And it doesn't need to be. For
>>
>> int remove_xen_ranges(struct rangeset *r);
>>
>> we don't need ...
>>
>>> --- a/xen/arch/x86/include/asm/setup.h
>>> +++ b/xen/arch/x86/include/asm/setup.h
>>> @@ -2,6 +2,7 @@
>>>  #define __X86_SETUP_H_
>>>
>>>  #include <xen/multiboot.h>
>>> +#include <xen/rangeset.h>
>>>  #include <asm/numa.h>
>>>
>>>  extern const char __2M_text_start[], __2M_text_end[];
>>
>> ... this, a mere
>>
>> struct rangeset;
>>
>> forward decl will suffice.
>>
>> Jan
>>
> 
> It's true, but for the same reason, we could avoid including
> "xen/multiboot.h" and use "struct module" instead of "module_t".

Indeed. I'd even question the need for that typedef.

Jan

