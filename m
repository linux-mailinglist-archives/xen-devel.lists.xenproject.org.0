Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB65AA4342
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 08:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973373.1361502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA19m-00020k-LY; Wed, 30 Apr 2025 06:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973373.1361502; Wed, 30 Apr 2025 06:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA19m-0001zL-J3; Wed, 30 Apr 2025 06:42:58 +0000
Received: by outflank-mailman (input) for mailman id 973373;
 Wed, 30 Apr 2025 06:42:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA19l-0001zF-II
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 06:42:57 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58c46029-258e-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 08:42:55 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-acb615228a4so117294866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 23:42:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acebe7a4ee8sm298305766b.74.2025.04.29.23.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 23:42:54 -0700 (PDT)
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
X-Inumbo-ID: 58c46029-258e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745995375; x=1746600175; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w24C94yCtZNiYZM1uGyK1BMoOOqzTr/r96aCJiM298o=;
        b=HuF08CV8kqfon8oT6OP4tbRJwJ1lSltIT5WT86+jUEtfLTqgLVzGLpe0BLwDum+dxQ
         5XDbtm0ejVfH9CoMhmDbfkGT01wXnaBKXlK5Jp/O8XGih4PzL7QlI3dS49+73+CAytWA
         3U9CJkgHOWwQLrSG3Ya1tUvomii8X3JS2lLfgFNBR6vXdJ0EHvQW+vj/JxuERI3xconZ
         IpY593S6eAo1lN9UjXCXt92RMLfuDobmCS3cNY+lKD7WscTLN+N9qa1vDlqvRcrSsIKX
         Fq9vbFaUzR56VScdOgZQZOe6O9VTHyYzbSXgmXodwok1tWgaNONy4H7qCR1qNNSl2mWh
         xA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995375; x=1746600175;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w24C94yCtZNiYZM1uGyK1BMoOOqzTr/r96aCJiM298o=;
        b=sdqF7lt/mpRykc0uD4crAu3mTYWrwHTkM1rNRUkkr3cd2mJOKUvHmsH+ALJCyBEkjW
         eT2l+PIpTtC0WNWm7Wy+0LL5L4kELV/6NOulYvT7Ay3e+F0ci/EWribFtPJwLpWr8Q7t
         mjAEqCJnW22vnsdIFPRcD8DEpaJEDOAF2SYioJqEYJdlfPOsfGh+XzlPZu3dn/Knwewl
         PcpsnCne8eYh0EUNaNN5ja01vQV0jdNXO+G6G/ef6udVtk4uzDZk5U70Y8xW38m+aFdk
         RF4KR+YT7gzVeHmQ9FKjc+Co5U9DoCmGE/ZHe5Xmu8m8Cg9K2/eJCCicSVOY9G5eB16z
         33cw==
X-Gm-Message-State: AOJu0Ywu3gFUjY8ObbK5sbXxDXJa3/2cvlB51wu9aveyRTHJiIzBWhoM
	Gr/5VX+KLwRxOsB92PMGxaEffD1/UhO6iGIKj+ehKkOhO/Y2jKE1bHcvrmH6Tg==
X-Gm-Gg: ASbGncuTHkQ9xoSo/fc4CrTKaAL7wUeYR9/XtsATibg4VHHRDr4r/BYtLFcf4+Rm2TZ
	K7HzRqbsW7uNubTfi3nZTIlWE5MotMMpa+ABK8DFll2099SJh2JY0QajrowCjH0jVb7xWRwpYFN
	sxuoLrqLLP6CLmv8oZh8HPxpEcj8gdpGlWlSJ0XVh6zoTP5YyT3pB97gYek5V1l7VYDJgziqgRG
	IlTTgnrzj99Eq7BVzU6Uw1oVnbgE0TfalP3KFNuPCjYgxYL9VVvaMvfKVv9pzTiogfdzZYNTNgb
	SotsjB8vvJi1P3j1fx+HxjUCFa+4YxsHlLIvasSCMi3jSAr9R+TWzLqfEh76ltKGhfh/xWxQ+KI
	8x0eFDKM2B5F7ouj87JTEBbcQTQ==
X-Google-Smtp-Source: AGHT+IFPk4K7P4LQ4/KfOBrORJRrD9KHnJbHyzwcc94f7fmlgMCGYTkG70qfp+2vCUnCW0cym/1XFA==
X-Received: by 2002:a17:906:7307:b0:ac7:3441:79aa with SMTP id a640c23a62f3a-acedf6bd27bmr155803166b.13.1745995374910;
        Tue, 29 Apr 2025 23:42:54 -0700 (PDT)
Message-ID: <14fed5e0-643a-45cf-8929-461e11e7f4c3@suse.com>
Date: Wed, 30 Apr 2025 08:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>
References: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
 <5d519ffd-8747-4367-b92f-01c20a483e72@xen.org> <87cycue6l3.fsf@epam.com>
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
In-Reply-To: <87cycue6l3.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2025 04:17, Volodymyr Babchuk wrote:
> Julien Grall <julien@xen.org> writes:
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/libafl_qemu_defs.h
>>> @@ -0,0 +1,37 @@
>>
>> Missing license. Also, is this file taken from somewhere?
>>
> 
> I add MIT license, as libafl is dual licensed under Apache-2 and
> MIT. This file is based on libafl_qemu [1]
> 
>>> +#ifndef LIBAFL_QEMU_DEFS
>>> +#define LIBAFL_QEMU_DEFS
>>> +
>>> +#define LIBAFL_STRINGIFY(s) #s
>>> +#define XSTRINGIFY(s) LIBAFL_STRINGIFY(s)
>>> +
>>> +#if __STDC_VERSION__ >= 201112L
>>> +  #define STATIC_CHECKS                                   \
>>> +    _Static_assert(sizeof(void *) <= sizeof(libafl_word), \
>>> +                   "pointer type should not be larger and libafl_word");
>>> +#else
>>> +  #define STATIC_CHECKS
>>> +#endif
>>
>> No-one seems to use STATIC_CHECKS? Is this intended?
> 
> I used this file as is... But I'll rework this part.
> 
>>> +
>>> +#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
>>> +#define LIBAFL_BACKDOOR_OPCODE 0x44f23a0f
>>
>> Are the opcode valid for arm32? If not, they should be protected with
>> #ifdef CONFIG_ARM_64.
>>
> 
> It is valid even for x86_64. They use the same opcode for x86_64, arm,
> aarch64 and riscv.

Wow. On x86-64 they rely on the (prefix-less) opcode 0f3af2 to not gain
any meaning. Somewhat similar on RISC-V, somewhere in MISC_MEM opcode
space. Pretty fragile. Not to speak of what the effect of using such an
opcode is on disassembly of surrounding code (at least for x86).

Jan

