Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B75C3EB38
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 08:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157364.1486161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHGaT-00022m-NX; Fri, 07 Nov 2025 07:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157364.1486161; Fri, 07 Nov 2025 07:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHGaT-00021L-KM; Fri, 07 Nov 2025 07:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1157364;
 Fri, 07 Nov 2025 07:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vHGaR-00021F-VI
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 07:08:43 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97e4f545-bba8-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 08:08:42 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-640b4a52950so644843a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 23:08:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d0f3sm172671466b.48.2025.11.06.23.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 23:08:41 -0800 (PST)
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
X-Inumbo-ID: 97e4f545-bba8-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762499322; x=1763104122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=leFjE9259Sq/ezXHqaZMh5rdJUxWsZFRt30RuF0icqo=;
        b=Lo4sCJbcvxeYbc6SB7I8X3Fi6deqNDYTIjVeIyYiEU+3JTm03Jl1wnhg/NwAKCqTTh
         DryUPsJReXQS4L4FAQEveW9YcRCofY5ozyJC582gqPBPo/xOKPxayYqV+Q7douA7D8A3
         v0XQT3tJJ1z6rYaiqLUlseWXqKnXzePpE7ihU37X5bZeT32KZogqFtE8NaCn45Gmg30n
         3SzsTdnRnf67qeJcjejkhM/SuBJJXQpSz1d1WjeR6zTO9xbZ1icSMf0vqT51XlSNcEDy
         tlH+zVfTMYOaqXw7Y7oNUNphZpIgjhmr0RSySgWhpzBYiO1iEmNySZhEa5c3G2cZD/hI
         y56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499322; x=1763104122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leFjE9259Sq/ezXHqaZMh5rdJUxWsZFRt30RuF0icqo=;
        b=wuasEsEI1co1rJhVV7s8CBeG1t1ZJti3ILlASnn5l764rISKTWPoSn0WKiGYYTRqIn
         FCh7BDkjRr6pc4ACvj3IvYOolturMZT4FGRHNex8zIMGzMIGya2hCOQq20ITVD5Bx91W
         GuDU+z+G2BSRwvGSri4VUE/sKDAVDjxV0EtPSrrs4Bs5FMNTKtrvbLYVsxQi7oK8rlP9
         OQE9CzygRoVhCQBlm94gAaZj9Ct0su5UTlLomdg5R1vhEn9I402Rjly61w1PUl6qM2XS
         2KBcyZWroIA/X09HWV+Hk+p0ouogo3A+8Mg3qDhBw6FXqgjigdi9ZqL9AdlC0y6ekkwy
         dPmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe/KbNKYGddxt6FplOhTlQnuAIbVEytvhRkpyx+3AoOzzsWrf+0a7aZfeHzRvY/S8c/2StKmve7fA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySKAnSvnF9obx9K6dF3vJI1Iolx6Il6nyxGqQgW23Lq6x08/nG
	ed5uaiCslyfkrKoHMKvOBDTyEuijGU+8eVf3jQEj3irX9WVs1CqPVb5+jtkIh01zSg==
X-Gm-Gg: ASbGncsOwey8oIxf0N57QmMkzNbI7G/O9Nr650FSsgp3EYkROVAfTlyxIT3hgK27qwW
	uaVLxFlaBMrLUO7ipkAPlz6rVuZ6Mt5byQ9tF89lFk2gcsm1E+InFlk9cz0pe5YnmIRXPUxu/hS
	I7TbgD+1nUwYwSZDt8HmDTadLZC8xX4FtacIUFVqGyrFtg/k/8k0NvOaJHA/nNo8Gz7JtN2SyOb
	4D/umPzX/NVDsXCTC6iDJbhn2RgqO73wniEW3tQUhHv33I2pnzdyY+oAvFbkeIiHbrQh710DJC/
	BF4n9qHYwchYz2bwLD770SMkFTTP1k3UGc2nlUT9DQs3KO64TPwXET8FJKi3iZARDqHyyfzYzkN
	Oou2mBC8wvhgrs1/z1Ed4Mua0OyahaYcgVlglcRaZJrpeydv0hCvCAEt2VEQQh0l2udVgI8yQFV
	BtDWU1av1OXIJv445y5dR/BxC8J7x2l7LVm/yL+3X7F8PiLw/4s8jMUlAPwZ6dQTabc09U7dc=
X-Google-Smtp-Source: AGHT+IHMP6WhrS4dfoqSRpJd1ARSUMhrsErweHaWbTqeL3ZVjOHDi4LtJFvHD/lC8JcUkaQbUcTHuw==
X-Received: by 2002:a17:907:7f26:b0:b3d:9261:ff1b with SMTP id a640c23a62f3a-b72c0a5f780mr187160766b.5.1762499322172;
        Thu, 06 Nov 2025 23:08:42 -0800 (PST)
Message-ID: <c0a7d349-8338-45a3-b701-f07ef3e6526b@suse.com>
Date: Fri, 7 Nov 2025 08:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
 <97611b79-228c-40a6-9fb2-4571b2447258@suse.com>
 <CAHt6W4ce9cPwdaYXwgL4Unkprh4BQ2Qh_CSM0q9WjP2fdVf-Gg@mail.gmail.com>
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
In-Reply-To: <CAHt6W4ce9cPwdaYXwgL4Unkprh4BQ2Qh_CSM0q9WjP2fdVf-Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2025 17:37, Frediano Ziglio wrote:
> On Thu, 6 Nov 2025 at 10:32, Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.11.2025 16:38, Frediano Ziglio wrote:
>>> --- a/xen/Kconfig.debug
>>> +++ b/xen/Kconfig.debug
>>> @@ -147,12 +147,7 @@ config DEBUG_INFO
>>>         Say Y here if you want to build Xen with debug information. This
>>>         information is needed e.g. for doing crash dump analysis of the
>>>         hypervisor via the "crash" tool.
>>> -       Saying Y will increase the size of the xen-syms and xen.efi
>>> -       binaries. In case the space on the EFI boot partition is rather
>>> -       limited, you may want to install a stripped variant of xen.efi in
>>> -       the EFI boot partition (look for "INSTALL_EFI_STRIP" in
>>> -       docs/misc/efi.pandoc for more information - when not using
>>> -       "make install-xen" for installing xen.efi, stripping needs to be
>>> -       done outside the Xen build environment).
>>> +       Saying Y will increase the size of the xen-syms and xen.efi.elf
>>> +       binaries.
>>
>> Why xen.efi.elf and not xen-syms.efi?
>>
> 
> I forgot to update this part.
> Now that I see the comment, was the suggestion about having an
> additional xen-syms.efi file or having xen-syms.efi instead of
> xen.efi.elf ?

The former. We want to have the binary available that the linker produced
directly. Anything else are extra's for what people think they may need.

>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -228,14 +228,17 @@ endif
>>>       $(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>>>       $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>>>             $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
>>> -           $(note_file_option) -o $@
>>> -     $(NM) -pa --format=sysv $@ \
>>> +           $(note_file_option) -o $@.tmp
>>> +     $(NM) -pa --format=sysv $@.tmp \
>>>               | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>>>               > $@.map
>>>  ifeq ($(CONFIG_DEBUG_INFO),y)
>>> -     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
>>> +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))cp -f \
>>> +        $@.tmp $(TARGET)-syms.efi
>>> +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
>>>  endif
>>>       rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>>> +     mv -f $@.tmp $@
>>>  ifeq ($(CONFIG_XEN_IBT),y)
>>>       $(SHELL) $(srctree)/tools/check-endbr.sh $@
>>>  endif
>>
>> I see $@.tmp here, but no sign of xen-syms. Did you submit a stake patch? Am
>> I missing something?
>>
> 
> I don't know what a "stake patch" is.

Sorry, typo - "stale" was meant.

> xen-syms.efi (that is $(TARGET)-syms.efi in the Makefile) is not a
> target of this rule so if the rule fails it will be generated again.

How does this matter in this context? The description talks of a xen-syms.efi
being generated, yet I'm simply unable to spot where that would be happening.

>> I also think the mv should sit ahead of the cleaning-up rm.
> 
> Are you sure?
> Usually you want it as the last command so any failure won't create
> the target. For instance here if check-endbr.sh is failing the target
> is still created and next make command will succeed.

Except that the rm is tidying up rather than creating anything.

Jan

