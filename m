Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7778B3615
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 12:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712645.1113469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0JDo-0006HS-O5; Fri, 26 Apr 2024 10:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712645.1113469; Fri, 26 Apr 2024 10:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0JDo-0006Et-Kt; Fri, 26 Apr 2024 10:54:28 +0000
Received: by outflank-mailman (input) for mailman id 712645;
 Fri, 26 Apr 2024 10:54:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0JDn-0006En-1d
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 10:54:27 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 586b95b6-03bb-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 12:54:25 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2db101c11beso21365271fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 03:54:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x16-20020a1709060a5000b00a5575c9d5b4sm10268501ejf.63.2024.04.26.03.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 03:54:24 -0700 (PDT)
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
X-Inumbo-ID: 586b95b6-03bb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714128864; x=1714733664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvVGniZk0l+qBd9SNb8+3MoUeNuCKMe4CmEnjUlNdmY=;
        b=OZ6fC5aRz7jez6DdA3hXo8Fg+H3azIvJK5Vl3r4jH1FO3vnnx5cFgZgVis9VdnU/bP
         hn5TItEiY65iZ+aGhppCWQPO/Sg+sVhorx3CqVmVaeBe5UAktER5HLhOsZeBpl0C55SW
         XCX0aeln1YrOU/f7cwO8gAZcGZ1bl6IyYhC0dFd5tZuMQsKYNBerbpDvyIrLv4q7R11t
         JrH9dlBAjasQYdlx+zw7HqCdaqbqx8jTSSQEI2TkwSkXLnS1pGKpKOT8MrV/jsKhEKwf
         9jODoaBumqx1pq8HGp6Gs53rivLgsrIxvwrP8Rq/yCsU6bp51pCc9QBoZXy4JQJcADJ0
         2dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714128864; x=1714733664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvVGniZk0l+qBd9SNb8+3MoUeNuCKMe4CmEnjUlNdmY=;
        b=ahrL3TOq0vCIsoeacL7XuPt694BntUHc92DHYsX81iCOD7TPWGR1bKUy2n4kmYodzp
         24WqzMEKDW3ieaPHUhXR53AKY4PzT3L7w7xhGdWet5BXKcAWl0kj0Q9Z44tnhcNTZwjL
         /UAWUYAOM0cSZ3xmG3FMkcgaDd5rugDT72T9cOsj1hc6dMCgy1SFB2KgmXGBEz4qsZer
         VLsxHMjky3817E/q+7WG4YYtEN3S3AfNnBbtRH7uAIoOrzBrDlcqCPHc9MYdHWmNi6DD
         6ZS+gl2vrbsbc5mQe1bAyrhh9ZOzweEqJINxrPVwjVQV5pLzUflmiGQ0QshwpjOOwLWI
         cfwg==
X-Forwarded-Encrypted: i=1; AJvYcCXlhkIRasgiAxrNYfgmMd4QqephM3nJLb216A1U+wqj2kYGo8Zmx5yWxeFmkChEN+ue4Y0AW/YgPueaZSoxY+lmQZJMVIudHJuoUSnMTPY=
X-Gm-Message-State: AOJu0YzlVah/RZXLEEwrPTu5muI0p7iyE5uKBCbAEvCDj0Ix/N1CjZE6
	QoI7x4RMJiCx8V26ny61RtJWFNzsiHJ/3breDWxUyLreZ0EBoVszPjOlMbSUBQ==
X-Google-Smtp-Source: AGHT+IGN2kmz4W+i7Hm1V44uxis0DUbrhKzRH3eSwBYCDGziktnlZkJQYhbOKC9hdZ4lGHUGYnETZQ==
X-Received: by 2002:a19:8c42:0:b0:51c:5fab:c23d with SMTP id i2-20020a198c42000000b0051c5fabc23dmr1149516lfj.17.1714128864311;
        Fri, 26 Apr 2024 03:54:24 -0700 (PDT)
Message-ID: <52d3e3bc-e57f-4656-8e1d-7a3f6e871a83@suse.com>
Date: Fri, 26 Apr 2024 12:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: check whether the assembler has Zbb
 extension support
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <95441782d1920f219d63dee1c82c7df68424d374.1713523124.git.oleksii.kurochko@gmail.com>
 <956388de-ef6d-4d7a-8b5f-2a292af8db53@suse.com>
 <f410f3a619079b5089ea13018c26117e7e3f6e62.camel@gmail.com>
 <f06c079116c194965491dfc669a32b9c60a90b3d.camel@gmail.com>
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
In-Reply-To: <f06c079116c194965491dfc669a32b9c60a90b3d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 10:26, Oleksii wrote:
> On Mon, 2024-04-22 at 17:41 +0200, Oleksii wrote:
>> On Mon, 2024-04-22 at 11:43 +0200, Jan Beulich wrote:
>>> On 19.04.2024 16:23, Oleksii Kurochko wrote:
>>>> Update the argument of the as-insn for the Zbb case to verify
>>>> that
>>>> Zbb is supported not only by a compiler, but also by an
>>>> assembler.
>>>>
>>>> Also, check-extenstion(ext_name, "insn") helper macro is
>>>> introduced
>>>> to check whether extension is supported by a compiler and an
>>>> assembler.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> despite ...
>>>
>>>> --- a/xen/arch/riscv/arch.mk
>>>> +++ b/xen/arch/riscv/arch.mk
>>>> @@ -11,9 +11,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       :=
>>>> $(riscv-march-y)c
>>>>  
>>>>  riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
>>>>  
>>>> -zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
>>>> -zihintpause := $(call as-insn, \
>>>> -                      $(CC) $(riscv-generic-
>>>> flags)_zihintpause,"pause",_zihintpause)
>>>> +# check-extension: Check whether extenstion is supported by a
>>>> compiler and
>>>> +#                  an assembler.
>>>> +# Usage: $(call check-extension,extension_name,"instr")
>>>> +check-extension = $(call as-insn,$(CC) $(riscv-generic-
>>>> flags)_$(1),$(2),_$(1))
>>>> +
>>>> +zbb-insn := "andn t0, t0, t0"
>>>> +zbb := $(call check-extension,zbb,$(zbb-insn))
>>>> +zihintpause := $(call check-extension,zihintpause,"pause")
>>>
>>> ... still not really being happy with this: Either, as said before,
>>> zbb-insn
>>> would better be avoided (by using $(comma) as necessary), or you
>>> should have
>>> gone yet a step further to fully address my "redundancy" concern.
>>> Note how
>>> the two ultimate lines still have 3 (zbb) and 2 (zihintpause)
>>> references
>>> respectively, when the goal ought to be to have exactly one. E.g.
>>> along the
>>> lines of
>>>
>>> $(call check-extension,zbb)
>>> $(call check-extension,zihintpause)
>>>
>>> suitably using $(eval ...) (to effect the variable definitions) and
>>> defining
>>> both zbb-insn and zihintpause-insn.
>>>
>>> But I'll nevertheless put this in as is, unless you tell me you're
>>> up
>>> to
>>> going the extra step.

Well, as per this v3 went in already. Hence ...

>> I am okay with all your suggestions. So the final version will look
>> like ( if I understood you correctly ):
> Jan,
> 
> Could you please review the changes below? I just want to ensure that
> you are okay with them. If you are, I'll add your Acked-by that you
> gave to this patch in previous answers.

... if you now want to further update the logic, it'll be a new patch
anyway. The adjustments below look okay to me, but I'm not going to
insist at this point that this be further fiddled with.

Jan

>> --- a/xen/arch/riscv/arch.mk
>> +++ b/xen/arch/riscv/arch.mk
>> @@ -13,12 +13,19 @@ riscv-generic-flags := $(riscv-abi-y) -
>> march=$(riscv-march-y)
>>  
>>  # check-extension: Check whether extenstion is supported by a
>> compiler
>> and
>>  #                  an assembler.
>> -# Usage: $(call check-extension,extension_name,"instr")
>> -check-extension = $(call as-insn,$(CC) $(riscv-generic-
>> flags)_$(1),$(2),_$(1))
>> +# Usage: $(call check-extension,extension_name).
>> +#        it should be defined variable with name: extension-name :=
>> "insn"
>>  
>> -zbb-insn := "andn t0, t0, t0"
>> -zbb := $(call check-extension,zbb,$(zbb-insn))
>> -zihintpause := $(call check-extension,zihintpause,"pause")
>> +define check-extension =
>> +$(eval $(1) := \
>> +       $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value
>> $(1)-
>> insn),_$(1)))
>> +endef
>> +
>> +zbb-insn := "andn t0$(comma)t0$(comma)t0"
>> +$(call check-extension,zbb)
>> +
>> +zihintpause-insn := "pause"
>> +$(call check-extension,zihintpause)
>>  
>>  extensions := $(zbb) $(zihintpause)
>>
>> If the diff above looks good, I'll sent a new patch version.
>>
>> Thanks.
>>
>> ~ Oleksii
> 


