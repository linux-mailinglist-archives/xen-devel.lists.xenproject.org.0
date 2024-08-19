Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10251956D51
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 16:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779774.1189467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg3On-0006qT-70; Mon, 19 Aug 2024 14:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779774.1189467; Mon, 19 Aug 2024 14:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg3On-0006oc-3S; Mon, 19 Aug 2024 14:30:21 +0000
Received: by outflank-mailman (input) for mailman id 779774;
 Mon, 19 Aug 2024 14:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg3Ok-0006ns-QJ
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 14:30:18 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e113ee5-5e37-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 16:30:17 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a2b4so360907a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 07:30:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bf004c2ebfsm765018a12.1.2024.08.19.07.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 07:29:53 -0700 (PDT)
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
X-Inumbo-ID: 8e113ee5-5e37-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724077817; x=1724682617; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vFziP5HtWjS+iqVsFwy35jW6si/g6fOZTDXfKiREB+E=;
        b=S1/r7e/FDlDufe4xVhZezMUwGf6StnJHETiUfYiuBTpj9idG7VN41xh1voWoGeOXHF
         IckCCUz961smX4VFQCQMsVxOeTPGCfNKoKqd8jaaIb3UccCH5S5fOYm19wizmeNZOTKO
         H7GyCVcA9YVgk4m8HP1N5jqIZ18xPzuWnvxeZNkLZtR1pQoWfcI70JHflgxd79UF/xC2
         lnKBsc/GyIB3n8+IFT72yjIDkN2QZvE/8WU/yGrQ8mN6fao0DjXeYLJR7MJaouURGBZN
         yNHk+6U21o0ddpR3QlrUkCBQ7OtU6vvOXkc6E7MPDBHmOpqlMrlJkAx4ajcdB3I3Qu1O
         QBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724077817; x=1724682617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFziP5HtWjS+iqVsFwy35jW6si/g6fOZTDXfKiREB+E=;
        b=L/jf5kRvyertIH9O6aEwWp8Kccfi0+Cx/GQcOHPYQF9yB5XUReZ3glVN85A6UPQyVh
         hJHLbnNZJKpivsugtEMeSY8TPgJHpk+nfkwUStzcgHFgbuQOhwV2FnfUITVz6n8WYHc+
         R/y1w5kOza1aD9pO+JAUSObN6O5lyH6msKtZWTNNSWW9wUSrFDqFO7F9ONEoDkYzD5W8
         0suYGsRxQVsU7D9yoClZfISJ0KK5pzuNlvXun7/H+EJ7EWw4Jm5IMMT0Ls3Y7kMqe6D1
         dXa/L5Pv++44nHwWCVKYJkdcyucNkp3p9oYveVMCjOA8cCXPX286neLpOBmISWKNklPt
         6LKg==
X-Forwarded-Encrypted: i=1; AJvYcCVRFaKiMZGKsT6QCuBDs+BV7mn0WlhYsIs8OfHMNMq+1OQxxuiNrNhJxNLSdmcmHhy3T+82qHzXbTiVnWUIrTTJF5hkzw2A54CGJHPIm8w=
X-Gm-Message-State: AOJu0Yw6uV/W3R2ZpZpoom6fhP8V5L+0CSo+8hSk3aJ99ho/UlCMGBeV
	aQMNL3Afk9O03kVO0bXPnuL3kKwbuM0wZkP8leHuYaaCOrAiBrCtRzLvSEMmvQ==
X-Google-Smtp-Source: AGHT+IG2rSH/srQ/zLAHokup5di0Ieswh7Lqd2dHl7+0/JXmWvfHfHhkCZ+xtMos/Nq8jHILKwvAbg==
X-Received: by 2002:a05:6402:26cc:b0:5be:df5e:3c5d with SMTP id 4fb4d7f45d1cf-5bedf5e413fmr6558227a12.14.1724077816636;
        Mon, 19 Aug 2024 07:30:16 -0700 (PDT)
Message-ID: <a3d901f9-0a74-4cef-b616-77d338dda314@suse.com>
Date: Mon, 19 Aug 2024 16:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86: Put trampoline in .init.data section
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-2-alejandro.vallejo@cloud.com>
 <ad72cc97-b9dd-4e7e-93f6-333805e40785@suse.com>
 <CACHz=Zh7wK58mbB762fnevHEKW9qhp-NRJ6buNe1b-qLxP0qPg@mail.gmail.com>
 <b9b40658-ff13-4240-98a2-4811411e31b6@suse.com>
 <CACHz=Zj8h-TeDa2Ey8EKKEOpXJqx9MnL+AGpdTBY1B8PZ0==mA@mail.gmail.com>
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
In-Reply-To: <CACHz=Zj8h-TeDa2Ey8EKKEOpXJqx9MnL+AGpdTBY1B8PZ0==mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2024 16:16, Frediano Ziglio wrote:
> On Thu, Aug 8, 2024 at 9:54 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 08.08.2024 10:00, Frediano Ziglio wrote:
>>> On Thu, Aug 8, 2024 at 8:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
>>>>> This change allows to put the trampoline in a separate, not executable
>>>>> section. The trampoline contains a mix of code and data (data which
>>>>> is modified from C code during early start so must be writable).
>>>>> This is in preparation for W^X patch in order to satisfy UEFI CA
>>>>> memory mitigation requirements.
>>>>
>>>> Which, aiui, has the downside of disassembly of the section no longer
>>>> happening by default, when using objdump or similar tools, which go from
>>>> section attributes. Why is it being in .init.text (and hence RX) not
>>>> appropriate? It should - in principle at least - be possible to avoid
>>>> all in-place writing to it, but instead only ever write to its relocated
>>>> copy. Quite a bit more code churn of course.
>>>>
>>>> I wonder if we shouldn't put the trampoline in its own section, RWX in
>>>> the object file, and switched to whatever appropriate in the binary
>>>> (which really may be RX, not RW).
>>>
>>> We cannot have RWX to satisfy UEFI CA memory mitigation, that's why I
>>> had to move it, code sections should not be writeable. We can mark
>>> either RX or RW but we use the data very early so we are not able to
>>> change the permissions (we can try with all complications that this
>>> could bring like how to report an error at so early stages).
>>
>> The early writing could be done away with, as indicated. There's not
>> really any strict requirement to write to the trampoline region within
>> the Xen image. All updates to it could in principle be done after it
>> was copied into low memory. Then (and of course only then) could it be
>> part of an RX section in the image, maybe .init.text, maybe a separate
>> .trampoline section.
> 
>    how strong are you on this? Is this "objdump" thing such a big
> issue? The code contains a lot of 16 bit code which would require
> additional options anyway. Won't be an assembly listing output more
> helpful instead?

Well. Whether a listing can serve as a stand-in depends on the situation.
Not being able to disassemble code (e.g. also in the final executable)
can be pretty limiting. The need to pass extra options is related, but
not really an argument against.

> I tried to change the code to change only the final copy of the
> trampoline but it looks like lot of code assumes it can change the
> source of it (that is requiring it to be in a writeable section). For
> instance EFI change settings directly and then allocate space for the
> copy later. The allocation could be moved but there's a fallback on
> code that assumes that early allocation can fail.

Right, if there's too much standing in the way then we need to look at
possible alternatives.

> The trampoline relocation is done with PC relative addressing which is
> helpful if you are changing the source directly, not the copy.

I'm afraid I can't make a connection between this and what we're
discussing.

> Could I ouput the trampoline in a code section ("ax" instead of "aw")
> and then later move it into .init.data section assuring .init.data is
> writeable but not executable?

Could you go into a little more detail on what you mean here? At the
first glance my reaction is "yes, sure, why not", but much depends on
what exactly is meant.

Jan

