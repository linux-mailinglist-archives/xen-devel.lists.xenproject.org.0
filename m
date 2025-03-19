Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A800A68D0F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920610.1324729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tushv-00055L-84; Wed, 19 Mar 2025 12:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920610.1324729; Wed, 19 Mar 2025 12:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tushv-00053P-4v; Wed, 19 Mar 2025 12:39:39 +0000
Received: by outflank-mailman (input) for mailman id 920610;
 Wed, 19 Mar 2025 12:39:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tusht-00053J-UY
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:39:37 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37027ff5-04bf-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:39:35 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so5871241f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:39:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df35bdsm20371104f8f.5.2025.03.19.05.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:39:34 -0700 (PDT)
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
X-Inumbo-ID: 37027ff5-04bf-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742387975; x=1742992775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kN+0a/vLw66V9O/wcMOPIJOzf7SRbJBB0gmD3W7EMgg=;
        b=EnEoF1XRHdbWK1H9+T6ifBfjQHev5X16JKi3APYy6tZ2NtfM0XyaY97dlyJQUXrr1D
         UcCnGFn/r/u70uB96CbrFgs4BXnpBhotTXW4JUJVjUEKGhfefeCg9B6WeVuG0hpM8X+J
         2U9sIgOYY+ooyHzJlFYgxQcxdXI0t15BQNcXXi8sJ1IU8wQJRjzpBczNHsYfqo66X7a3
         cAe6tdoHAXm1RFzmPTk87O9TDl9C6IeGdEUKsWCNip+iWLJLsuHX5XD1Z8OOj7XqqcW9
         P72ixPf28hPI4ucngX7RAEPpXFRYL+/JxXYAB727PnSCST2V0rLCza6nRrL5EcNEKW8K
         uDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742387975; x=1742992775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN+0a/vLw66V9O/wcMOPIJOzf7SRbJBB0gmD3W7EMgg=;
        b=BuxkoHG48+Ytjs0VT+9nCAqUi2lY9j2NBQYFVdduOGr7b1oBaVTbxGG9112zm5eKv7
         +aNGt0HQ9akePtxc7lR2VqIscEFsDjBnlouAQkdgnJl6oWlmY5g4TLe/Pt9HkAlbQntN
         30EQJaGGfPU/L7+FHrHhNpUQ0SHnCr+CLrfPri5P0roDmKtAZPtbqSHQQS4H4WHqV6+N
         gtGzu2jiU8uOZNr1OgzFU9TWEIkun/dYoka9y20vPx0Ntd9sfDCIs8EcW/AKc3OY0lf3
         iZvhtiY37Uuc65v+EgIatO5RRBk8QoTowPuv9fo5y4fAeAxCemCzbUu3JKRAlkcK4CUk
         ejRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYcE+0qoj+4BshYmZLsqs1NN+OajUVtfhq7xKj1d4XhQ3dvnP0d1qix6shFksvzsMFbA24BvlBDhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyecrwRXco4M9i46vO8xqmZjEobPZCNBfRdduXHFt3DR2FRLzdl
	G4vCeOS2y8oPG7L3MB1FHT3haao+BBvFJScnqRjgaassUx3HKQt/uv9U2/jo6w==
X-Gm-Gg: ASbGnctdhMhhWtLXPT+yNJ/Pb7Lg5Et4tV1QOudB8ztPGB7+dZYE23az0oHz4ed3vP5
	Xjr7Qzf5bKyuhFl+GOFkwkGx5kAwttsUOQ+5P3bBZJmyYsy8XWl7PKrm1n+wrfMFjxcnN4Q8SOl
	pKDhtiIRm8qhjl8BN47qqyknh6Ymcz/B87lbZ8KJO7nuVbe1fLLaTeKZaW7QJT9JO+cMlvJmUfE
	Wwth+Y9bJjA9sDHB6TeuMa6yLCzOO9iluXk1f/075d6BKlDGvyp2wDXSAtV+HSzuZIhi/mkdoJ6
	/HXVgTiewThN0+HqRMbaKht05WdWgD0cghtX4jv7cSM/i+gF9cad8y2BIaHK3H6xNiS+CZE15hu
	QNAjkFgJgWh/57Ar0iB1BCSPBFU38Q9xZyQ7HUTMd
X-Google-Smtp-Source: AGHT+IFDg28Gj1x4GD0A+rR9Wx4+4D3KtGLpRoFuJqdTgNEedwf5Csir2L3Mj1bE0UOmAP0S9ucP6Q==
X-Received: by 2002:a05:6000:1547:b0:390:e7c1:59c0 with SMTP id ffacd0b85a97d-399739cab50mr1949419f8f.26.1742387975157;
        Wed, 19 Mar 2025 05:39:35 -0700 (PDT)
Message-ID: <182e6183-8a61-4c03-902c-ab75b69cdd4f@suse.com>
Date: Wed, 19 Mar 2025 13:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: account for module command line length
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <730d8143-8cda-49da-a48a-3b82c2b77c9d@suse.com>
 <5b959741-2e51-4576-9219-df495d0e30be@citrix.com>
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
In-Reply-To: <5b959741-2e51-4576-9219-df495d0e30be@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 13:12, Andrew Cooper wrote:
> On 19/03/2025 11:18 am, Jan Beulich wrote:
>> As per observation in practice, initrd->cmdline_pa is not normally zero.
>> Hence so far we always appended at least one byte. That alone may
>> already render insufficient the "allocation" made by find_memory().
>> Things would be worse when there's actually a (perhaps long) command
>> line.
>>
>> Skip setup when the command line is empty. Amend the "allocation" size
>> by padding and actual size of module command line.
>>
>> Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -712,7 +712,15 @@ static int __init pvh_load_kernel(
>>       * simplify it.
>>       */
>>      last_addr = find_memory(d, &elf, sizeof(start_info) +
>> -                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
>> +                            (initrd ? ROUNDUP(ROUNDUP(initrd_len,
>> +                                                      elf_64bit(&elf) ? 8 : 4) +
>> +                                              (initrd->cmdline_pa &&
>> +                                               strlen(__va(initrd->
>> +                                                           cmdline_pa))
>> +                                               ? strlen(__va(initrd->
>> +                                                             cmdline_pa)) + 1
>> +                                               : 0),
>> +                                              PAGE_SIZE) +
>>                                        sizeof(mod)
>>                                      : 0) +
>>                              (cmdline ? ROUNDUP(strlen(cmdline) + 1,
> 
> This piece of logic was already bad, but this is rather worse.
> 
> One patch I made while doing the boot module work is:
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 6a4453103a9a..7292ddd07276 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -654,6 +654,7 @@ static int __init pvh_load_kernel(
>      const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) :
> NULL;
>      struct elf_binary elf;
>      struct elf_dom_parms parms;
> +    size_t metadata_len;
>      paddr_t last_addr;
>      struct hvm_start_info start_info = { 0 };
>      struct hvm_modlist_entry mod = { 0 };
> @@ -711,13 +712,16 @@ static int __init pvh_load_kernel(
>       * split into smaller allocations, done as a single region in order to
>       * simplify it.
>       */
> -    last_addr = find_memory(d, &elf, sizeof(start_info) +
> -                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
> -                                      sizeof(mod)
> -                                    : 0) +
> -                            (cmdline ? ROUNDUP(strlen(cmdline) + 1,
> -                                               elf_64bit(&elf) ? 8 : 4)
> -                                     : 0));
> +    metadata_len = sizeof(start_info);
> +
> +    if ( initrd )
> +        metadata_len += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
> +
> +    if ( cmdline )
> +        metadata_len += ROUNDUP(strlen(cmdline) + 1,
> +                                elf_64bit(&elf) ? 8 : 4);
> +
> +    last_addr = find_memory(d, &elf, metadata_len);
>      if ( last_addr == INVALID_PADDR )
>      {
>          printk("Unable to find a memory region to load initrd and
> metadata\n");
> 
> 
> which I think I ought to submit as a prerequisite to this, after which
> your logic squashed on the RHS now becomes an expansion of the `if (
> initrd )`.

Yes please.

Another thing I was considering to put in a local variable is the
repeated "elf_64bit(&elf) ? 8 : 4". If that sounds okay, I can make that
a(nother) pre-patch to mine.

Jan

