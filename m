Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA331961344
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 17:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784223.1193619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siySo-0003T7-2H; Tue, 27 Aug 2024 15:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784223.1193619; Tue, 27 Aug 2024 15:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siySn-0003Qj-Uu; Tue, 27 Aug 2024 15:50:33 +0000
Received: by outflank-mailman (input) for mailman id 784223;
 Tue, 27 Aug 2024 15:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siySm-0003Qd-6X
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 15:50:32 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16b50e9e-648c-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 17:50:31 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5bed05c0a2fso6947269a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 08:50:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c4f37sm1142919a12.15.2024.08.27.08.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:50:30 -0700 (PDT)
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
X-Inumbo-ID: 16b50e9e-648c-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724773831; x=1725378631; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TnoIv9rn8ZSaCj7N5sMftzWerTKewjrZ/r8uJIgT2hE=;
        b=CQ1kaDfRJ0pb/YQ1S/5dVCE+6u2nRnvQjIMu0a+9eSvXYr43kaiAV2oWI3dnjR+hVX
         I+e0KV+EbKCAVAMVYhTz1E5ZrOgLwAsDXIssCEzsHP7a36oemRwNZA4tQkKPlWPe4UES
         YQFUxyh1mG/xTLCu/uQXz+AfT8gy5zpAPOhbiLDCHF9srILQ9c5/2Pz5uCU+DRKQu8+V
         hItaJTVXJvgDFmi1gGsG0GrDAzNBi8vqgArFPF2sOC7DGLQm9L8y2iQ+qke802Mdx+VJ
         wB9w+ue6oQ18+2z4ZDKCynhldAmc/V4TF87uqVLdgxqnpmf4o4f4wNvOhApW1bUJD11W
         jsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724773831; x=1725378631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnoIv9rn8ZSaCj7N5sMftzWerTKewjrZ/r8uJIgT2hE=;
        b=TSJU011mTnt8FOMfaGWixy2WZh8Yo02al32LFBH+4q38mxvqm1VfY3pOmmtVN5odFs
         wk4b7nD5+e+6sN9rDh09qFQcfhucaiL+X77iTaKit/slumvByfscvybaUTnYQdxdATuy
         h5410N3mZBUjiIajsdPfkOOB/e6IPUaI/dUp+UNPAqjUq1HNI2/lRSMiQwQy4lNA7iIO
         TFujXj5xeoS0+uIcLCst0aS7hWrs0IXMitPwwFzvWDrgfrz17DNee5iMX74lm86aCt5C
         fjXKHDqm8lWY10WCSW3+h4/rXRlbvctjI3ZO69jhLjw7n5C5VVX2VhBhSJcqIEzwWRMD
         rkIA==
X-Forwarded-Encrypted: i=1; AJvYcCUfz0y104iw2AYy0i2cFm00KuOSEJh3GlcNdLUuNGBLXyl5+M2H86Gix4uLx1UN+ytVGo2WoQ2M2Cw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdCBDMSU/8+mfNDHCuhH4uM6a59j9KmDmwVobk+9GWIIXV5z26
	/zFBrRqZICIJxClDdDRSb571pHEFPYYIPVtLBKC1qvrwy1yC/o8fdpWTWzPIkQ==
X-Google-Smtp-Source: AGHT+IFDx+ZkETay8GNFrGIQPbco4CBBtrTKn7k4uh+vlubrFcNlO4r/ob9ziWIM+gLC4wf5glOLhw==
X-Received: by 2002:a05:6402:42c7:b0:5be:e9f8:9bbf with SMTP id 4fb4d7f45d1cf-5c089164ac8mr11017040a12.9.1724773830476;
        Tue, 27 Aug 2024 08:50:30 -0700 (PDT)
Message-ID: <527b3a0f-3e86-47aa-9092-e67df329b7e9@suse.com>
Date: Tue, 27 Aug 2024 17:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Avoid additional relocations in trampoline code
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240822152953.489136-1-frediano.ziglio@cloud.com>
 <55e6dc6c-344a-4483-90c2-e414ef4bc869@suse.com>
 <CACHz=ZgbU3-HBgoDC9ws=cCK10B2D4K2JxjLN3_0YGoksVep8w@mail.gmail.com>
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
In-Reply-To: <CACHz=ZgbU3-HBgoDC9ws=cCK10B2D4K2JxjLN3_0YGoksVep8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 15:56, Frediano Ziglio wrote:
> On Mon, Aug 26, 2024 at 9:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 22.08.2024 17:29, Frediano Ziglio wrote:
>>> The trampoline could have "manual" relocation entries (created
>>> by assembly macros and some code to use them) and (in case of PE)
>>> normal executable relocations.
>>> Remove all normal executable ones. In this way we don't have to
>>> worry about applying both correctly (they need proper order
>>> which is hard to spot looking at the code).
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> I think this wants splitting into one patch replacing sym_offs() and a
>> 2nd one introducing the hand-crafted __XEN_VIRT_START additions (which
>> may want macro-izing). Plus the justification for the change wants
>> extending, to actually explain what the problem is - after all there's
>> no issue anywhere right now.
> 
> Should I explain the time dependency issue with source code?

Time dependency? I guess I don't understand ...

> I suppose I can describe where currently is and why it would be better
> to have it removed (honestly I though I did but reading the commit
> message I didn't).
> Maybe for search reasons it would be better to define 2 macros like
> the following?
> 
> #define phys_addr(sym) sym ## _pa
> #define virt_addr(sym) sym ## _va
> 
> This way, for instance, searching for the "__high_start" word (like
> "grep -rw __high_start") would produce a result.

I assume it's best to keep everything there together, so see below.

>> With the sym_offs() uses gone, I think it would be best if the macro was
>> #undef-ed ahead of the inclusion of trampoline.S. Since x86_64.S uses the
>> macro, that'll require careful re-arrangement of #include order.
>>
> 
> I think you mean including the trampoline after including x86_64.S in
> head.S.

Yes.

>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -71,7 +71,12 @@ SECTIONS
>>>    __2M_text_start = .;         /* Start of 2M superpages, mapped RX. */
>>>  #endif
>>>
>>> -  start_pa = ABSOLUTE(start - __XEN_VIRT_START);
>>> +#define DEFINE_PA_ADDRESS(sym) sym ## _pa = ABSOLUTE(sym - __XEN_VIRT_START)
>>> +  DEFINE_PA_ADDRESS(start);
>>> +  DEFINE_PA_ADDRESS(saved_magic);
>>> +  DEFINE_PA_ADDRESS(idle_pg_table);
>>> +  DEFINE_PA_ADDRESS(__high_start);
>>> +  DEFINE_PA_ADDRESS(s3_resume);
>>>
>>>    . = __XEN_VIRT_START + XEN_IMG_OFFSET;
>>>    _start = .;
>>
>> For the cases where in assembly code you add __XEN_VIRT_START this is pretty
>> odd: You subtract the value here just to add it back there. Did you consider
>> a more straightforward approach, like introducing absolute xxx_va symbols?
> 
> I didn't consider. Would something like
> 
> #define DEFINE_ABS_ADDRESSES(sym) \
>    sym ## _pa = ABSOLUTE(sym - __XEN_VIRT_START); \
>    sym ## _va = ABSOLUTE(sym)
> 
> make sense? Maybe the _pa and _va suffixes are too similar? Maybe
> _physaddr and _virtaddr? Or use capical letters and macros (as above)
> to avoid possible clashes?

I'd like to ask that we don't introduce symbols we don't actually use. Hence
a single macro defining both is probably not going to be overly helpful. As
to capital letters: I'm struggling with the "(as above)" - I don't see any
use of capital letters in symbol names being generated. But yes, I was going
to suggest to consider _VA and _PA tags, precisely to reduce the risk of
clashes.

Jan

