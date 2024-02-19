Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6985A6B9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 16:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682958.1062233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc58p-0007G1-O9; Mon, 19 Feb 2024 15:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682958.1062233; Mon, 19 Feb 2024 15:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc58p-0007EB-L2; Mon, 19 Feb 2024 15:01:11 +0000
Received: by outflank-mailman (input) for mailman id 682958;
 Mon, 19 Feb 2024 15:01:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc58o-0007Dr-9u
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 15:01:10 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b40db1df-cf37-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 16:01:04 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33d509ab80eso431193f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 07:01:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bo29-20020a056000069d00b0033d5f5571b4sm1544190wrb.44.2024.02.19.07.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 07:01:03 -0800 (PST)
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
X-Inumbo-ID: b40db1df-cf37-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708354864; x=1708959664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMmVpS8COeMnbZvfmiiZ98a0W983xBw30lGDGRuDq3s=;
        b=Svhm895ZWqhEQjzqtwp1+s2VXz1E5AOcggKXsbfap4k+NVQm1Dy58bPmE5Cru4dOsW
         RDAgx7AOGjgposujkNkGX7CdZ4Zh8ocu3zXhgR7mLD60LoR/ozhnHFrMv5W8j5BhFxhy
         6TLN43CGDtxw1QCBWu8cFi2dAMyD2we1Upxa3eAkTjOdXA/gxh3pr6SbrUWkFFPeE89L
         EuGYwnXnyOgiILWEfBOSZhCXa2UUQLiRCuK+tsoeiccXCalSTpI3YiQ5pXN905ylus7S
         DU9xHQL1irUGq2ModI3AWOSnYomMRqyLRSTbkv3h3BfQOsHceUmSs1pI8kEZyBhV4Rtw
         HUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354864; x=1708959664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMmVpS8COeMnbZvfmiiZ98a0W983xBw30lGDGRuDq3s=;
        b=Qh9HEQQaMaayyfoJhFozsaf6sA6+NNUEH3XqwIliOH3PqVkuPOPjQlLZznxb6We9Nw
         aV540ARJQ26YRMMM1ztUhNocquobcjZ7CtDnaIn1zrA7+4VWhEZfxgkC+a1MfY8yo5zN
         DdB4pb48g2f18I8M6xaS06Bap4qJzkJe2kD8QOsO4mM8PC2rQgKgcK6bW82CBdlFdQdq
         wcVejCcb7N5JKZ6SuZAD3dJZHypjwqnmdEFX9qynJ2pP3Uc4jZJ4iMlTKz5zEUzg5ZFO
         x1aKB4mOEvlhGzTpAXyR2yg8KtZcJvDo0gQSlBCa1gXMlOYTd1NlHT8uRM2cPdJtLMfT
         525A==
X-Forwarded-Encrypted: i=1; AJvYcCWpwkw1aG2QsyEAfyfAvHIUi7F4uAD1OLbRC04KEJ/tFyafRAj+xwHZeUsMFUC7ChJgPgUiHguTPHHuK9UxWWxKRXm1vEYoEnvOY7APAtY=
X-Gm-Message-State: AOJu0YxCDg47US+aKUyNGARMjWS7vzF3t1qf+7YK9myFBTpAX5MCO2XC
	MAYZh1HaMgTkT4GeJ6f2WvAiPw050l2myj3e7MWE/WMR1RcMJGXLHM5SeW3vEA==
X-Google-Smtp-Source: AGHT+IGhzsbfLNh7ZPzx4xeY6rwsIXkjr9lBN5dAGvnAaKjzy7gQEWbWbUMLzyJgpR+VssziScpyog==
X-Received: by 2002:adf:e751:0:b0:33d:19fc:c4e9 with SMTP id c17-20020adfe751000000b0033d19fcc4e9mr5701381wrn.50.1708354864147;
        Mon, 19 Feb 2024 07:01:04 -0800 (PST)
Message-ID: <3b38fe82-ee0f-4666-93e1-bd78fe69c534@suse.com>
Date: Mon, 19 Feb 2024 16:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
 <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
 <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
 <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
 <1c53b52ee39161a8f59209d28af69fe997479dbc.camel@gmail.com>
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
In-Reply-To: <1c53b52ee39161a8f59209d28af69fe997479dbc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 15:29, Oleksii wrote:
> On Mon, 2024-02-19 at 12:22 +0100, Jan Beulich wrote:
>> On 15.02.2024 14:41, Oleksii wrote:
>>> As I mentioned above with 4-byte alignment and then reading and
>>> working
>>> with 8-byte then crossing a word or double-word boundary shouldn't
>>> be
>>> an issue.
>>>
>>> I am not sure that I know how to check that we are crossing cache
>>> line
>>> boundary.
>>>
>>> Regarding page boundary, if the next page is mapped then all should
>>> work fine, otherwise it will be an exception.
>>
>> Are you sure lr.d / sc.d are happy to access across such a boundary,
>> when both pages are mapped?
> If they are mapped, my expectation that lr.d and sc.d should be happy.

How does this expectation of yours fit with the A extension doc having
this:

"For LR and SC, the A extension requires that the address held in rs1 be
 naturally aligned to the size of the operand (i.e., eight-byte aligned
 for 64-bit words and four-byte aligned for 32-bit words). If the
 address is not naturally aligned, an address-misaligned exception or an
 access-fault exception will be generated."

It doesn't even say "may"; it says "will".

>> To me it seems pretty clear that for atomic accesses you want to
>> demand natural alignment, i.e. 2-byte alignment for 2-byte accesses.
>> This way you can be sure no potentially problematic boundaries will
>> be crossed.
> It makes sense, but I am not sure that I can guarantee that a user of
> macros will always have 2-byte alignment (except during a panic) in the
> future.
> 
> Even now, I am uncertain that everyone will be willing to add
> __alignment(...) to struct vcpu->is_urgent
> (xen/include/xen/sched.h:218) and other possible cases to accommodate
> RISC-V requirements.

->is_urgent is bool, i.e. 1 byte and hence okay at any address. For all
normal variables and fields the compiler will guarantee suitable
(natural) alignment. What you prohibit by requiring aligned items is
use of fields of e.g. packed structures.

>>> As 1- and 2-byte cases are emulated I decided that is not to
>>> provide
>>> sfx argument for emulation macros as it will not have to much
>>> affect on
>>> emulated types and just consume more performance on acquire and
>>> release
>>> version of sc/ld instructions.
>>
>> Question is whether the common case (4- and 8-byte accesses)
>> shouldn't
>> be valued higher, with 1- and 2-byte emulation being there just to
>> allow things to not break altogether.
> If I understand you correctly, it would make sense to add the 'sfx'
> argument for the 1/2-byte access case, ensuring that all options are
> available for 1/2-byte access case as well.

That's one of the possibilities. As said, I'm not overly worried about
the emulated cases. For the initial implementation I'd recommend going
with what is easiest there, yielding the best possible result for the
4- and 8-byte cases. If later it turns out repeated acquire/release
accesses are a problem in the emulation loop, things can be changed
to explicit barriers, without touching the 4- and 8-byte cases.

Jan

