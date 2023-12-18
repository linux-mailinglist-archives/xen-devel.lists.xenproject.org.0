Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D627816D58
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 13:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655949.1023847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCN1-0001sf-Qh; Mon, 18 Dec 2023 12:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655949.1023847; Mon, 18 Dec 2023 12:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCN1-0001r1-Nf; Mon, 18 Dec 2023 12:05:15 +0000
Received: by outflank-mailman (input) for mailman id 655949;
 Mon, 18 Dec 2023 12:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFCN0-0001pL-Ao
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 12:05:14 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3128f95-9d9d-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 13:05:13 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c6e2a47f6so27870455e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 04:05:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bd19-20020a05600c1f1300b0040839fcb217sm42151486wmb.8.2023.12.18.04.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 04:05:12 -0800 (PST)
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
X-Inumbo-ID: b3128f95-9d9d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702901113; x=1703505913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+S2YZtpkrXpPeCF/W4lHSTE3t8QggdrwTPCu+mAiobg=;
        b=c/TdN6G8wt7/iace5NCjDMwRJ10oNYcsiCvzwu5nMgMBlcA6dIO3+FYQT3rKQTO91M
         MbeG9kzhozJU/ReMZDxn7pztXY8H5JFYuWk9XypnKHRkOXUJfIluvsFM5pV3PAYDVgzp
         9TVyLFJsYv6NGKRWZkUlJ3vMD8xugwQYqH6qXQXKT5mCx8qzm2TFVG3/fmU/I1E9tjUl
         AluWpkoNVEwIs6CFa+vJrFHSlQqf2DKhC7vqAuPxe75rBxhCbhyrn9ZiWs7gWf0Xu4dI
         6b2QTJCyAeW1q8zGwmGTLOVNojw8D10I+v8WW/u5SbLhXkMg4ABORDOy9VDtvH61e2MR
         zamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901113; x=1703505913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+S2YZtpkrXpPeCF/W4lHSTE3t8QggdrwTPCu+mAiobg=;
        b=ATx6KPDjsBy0v0IvLULobfV41tOkui8N59M/8sKXO5WRw7jy6xydaiNQgoJuliVbre
         9Oi70vQCEsbA1+HJUaD5u9eUvDuAmkwmyJpIxwFc9hKRmVrSX3xCjiR+8bDbMnXs7l3j
         QcTjPTX/8SJktz6xXERYX+v81MBU5GFzWuQSxBXGVY8otDTm4U5G55CBBaFQXanVaYW7
         sn3Y8onRLRbEeIPdxG1xo0Z8vfxB90eq4j/MGmjM93na+o9ImiM4FmLfYzRhWFguWHDI
         +e1v6CKcJO55IDVLeWQB2T2dkw8DhOKgZSFcsI3cK1PZhW6hC7F3NKwWJHc6zrH1BACz
         hZOQ==
X-Gm-Message-State: AOJu0Yzmffb2wRXj1klBWwUKxu+wIsUDJfHiJxfE5qVn/tNjnk094V3I
	tJoSg2vpPuqv9tA+j7t2jwm7
X-Google-Smtp-Source: AGHT+IGtQ+kY7TgL0YgE7TkFXyZ6g+/VLHfG1BehiFO55NonRfM9ZIL/vK5vyQR6AxpNwNL6jB+VOg==
X-Received: by 2002:a05:600c:310c:b0:40b:5f03:b3cd with SMTP id g12-20020a05600c310c00b0040b5f03b3cdmr4279146wmo.239.1702901113020;
        Mon, 18 Dec 2023 04:05:13 -0800 (PST)
Message-ID: <929aef52-2f5e-4796-9404-c507b987cab3@suse.com>
Date: Mon, 18 Dec 2023 13:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/39] xen/riscv: add minimal stuff to asm/page.h to
 build full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <34a4bc023eb50e1d1cf70fa149825c51f2f4555f.1700761381.git.oleksii.kurochko@gmail.com>
 <ccef1adc-af39-43b2-8f97-ed3895e8809d@suse.com>
 <c0ae5654e6be1eb10282a3d95fb419d5c975e98b.camel@gmail.com>
 <2fa8fa4f-86d9-4856-91f3-f3dcf1c1013c@suse.com>
 <61afc7bf7dd153c368173eb8a82052d726ae2512.camel@gmail.com>
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
In-Reply-To: <61afc7bf7dd153c368173eb8a82052d726ae2512.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 12:57, Oleksii wrote:
> On Mon, 2023-12-18 at 12:36 +0100, Jan Beulich wrote:
>> On 18.12.2023 11:45, Oleksii wrote:
>>> On Thu, 2023-12-14 at 16:57 +0100, Jan Beulich wrote:
>>>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I wonder though ...
>>>>
>>>>> --- a/xen/arch/riscv/include/asm/page.h
>>>>> +++ b/xen/arch/riscv/include/asm/page.h
>>>>> @@ -6,6 +6,7 @@
>>>>>  #ifndef __ASSEMBLY__
>>>>>  
>>>>>  #include <xen/const.h>
>>>>> +#include <xen/bug.h>
>>>>>  #include <xen/types.h>
>>>>>  
>>>>>  #include <asm/mm.h>
>>>>> @@ -32,6 +33,9 @@
>>>>>  #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE
>>>>> |
>>>>> PTE_WRITABLE)
>>>>>  #define PTE_TABLE                   (PTE_VALID)
>>>>>  
>>>>> +/* TODO */
>>>>> +#define PAGE_HYPERVISOR 0
>>>>
>>>> ... whether this couldn't be defined properly right away.
>>> It can be introduced now but it requires some additional defines to
>>> be
>>> introduced in the same time:
>>>
>>> #define _PAGE_W_BIT     2
>>> #define _PAGE_XN_BIT    3
>>> #define _PAGE_RO_BIT    1
>>> #define _PAGE_XN        (1U << _PAGE_XN_BIT)
>>> #define _PAGE_RO        (1U << _PAGE_RO_BIT)
>>> #define _PAGE_W         (1U << _PAGE_W_BIT)
>>
>> Why would you need these, when you already have
>> PTE_{READABLE,WRITABLE,EXECUTABLE} just out of context from above?
> I thought that the hypervisor page table is fully software-related, and
> that's why a separate PAGE*BIT was introduced. These bits can be
> different from PTE* bits, which are hardware-related
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/include/asm/page.h?ref_type=heads#L66
> 
> It looks like I misunderstood that, and PTE* can be used everywhere
> instead of _PAGE*. Alternatively, we could consider renaming everything
> to PAGE* to maintain consistency across architectures.
> 
> Does it make sense?

Sure. Whether renaming makes sense is harder to tell though. It would
be only the name prefix that's uniform, as how exactly e.g. permissions
are controlled is arch-specific anyway. The one place I'm aware where
PAGE_* (or, sadly, still _PAGE_*) would matter for common code is
_PAGE_NONE (not sure though whether that's something that can / wants
to be expressed for RISC-V).

Jan

