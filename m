Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619CCBD142
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 10:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186691.1508116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV4Qy-0003iR-Hx; Mon, 15 Dec 2025 09:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186691.1508116; Mon, 15 Dec 2025 09:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV4Qy-0003fu-Et; Mon, 15 Dec 2025 09:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1186691;
 Mon, 15 Dec 2025 08:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV4Qx-0003fo-Gf
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 08:59:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e386bdf-d994-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 09:59:58 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477770019e4so31925295e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 00:59:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd2aab5b5sm1813795e9.5.2025.12.15.00.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 00:59:56 -0800 (PST)
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
X-Inumbo-ID: 6e386bdf-d994-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765789197; x=1766393997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=72OPFhWon9kXoIauxRwR1Xkd54AI2MBkQuX1waJPnt4=;
        b=Gk9t0pmWQqBJE6Zag9cmB63w9k3wUbajqbHH6g69+EyEqzcGbp4hMuGqACDmiqU1qB
         WZpGA1gg0r7PGncfNtPLzNFhw7p7d/OvDhlzrfwS4zmK5wYarp03cnKbp/iFL2BZEK1E
         G4ItdV2wtaxtItqoiy5hgTmvSoR68rjkxy5ul6dRHBG8pwEJirwPEq7oW1ZTD77DYgbu
         nXMrLveinuYitG146FE8FJ6o5fn8xoyEZCxDySe4JRu+HqVy0KXTx2W7fVTnR2dhSWQt
         Z5l2dV1+udxPyXSk/QKRwvMrnRkcFAEKAAELvrKz0eAv3v+4/QBgezXjHCxkrOtXgHa0
         kaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765789197; x=1766393997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72OPFhWon9kXoIauxRwR1Xkd54AI2MBkQuX1waJPnt4=;
        b=G+WDmunb6aNLCAQofbbK+C6C4oHUiKnGP72XM8gRu0wL6wdXAJINDJuFSZpL37dBa1
         xptpJnUZZ4NRRelA7Aa/0+D/7+f0v9B6++2rEFL4ttUHhGMrr3k4GmYrJhTeaNuBdxHU
         slLh2yZj2ohL2QmPMAbvpz7YPJcruYZJbvcZANtMH5nIRJB8D1BhlUDct4U7BfWF6cGN
         G84tz9YBpSxRNf4DAgYg+dHLXM7QSqeGWMcCfc4dWhGNPnt/jNLV9TnyIrXdmkwWVOxC
         uEqYRDQje0B9MQ9UdNocR3qEtJoeJ0o7Lv7GRSToy9hpVlJiqTlPvFqJJSiyAVPtEfSK
         qo+A==
X-Forwarded-Encrypted: i=1; AJvYcCWJd4mEeCEARVb1wJSaCeUbvngi8KvnKlPTnjCo6dFmmKrN1ewlGeTpWHmW4fFdVDI7J4vkpBMUXE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/szuBHFyQnyCnjmAXOrn6kBqvEh2C/iwpFlKtmggPGm2tBo95
	q9E15LDzcEf61AOweaHvEtIHAIZd2Os7ylxlGdpXEb5jpp7BMf4Fz8ohHf+uVOZtpw==
X-Gm-Gg: AY/fxX6k0SaU9mVH6edxo5rgxczBvNAMzVK135YO2Wm1Q6u9Bjt5LrYTtXVaOCQ/KLY
	66lpcfXqZu3eqJvzryX+G0tSK69+pBlViSD+mlk5NfHelxiiib2sFGf+sog/k2dNvMmwcQZdPld
	mXecOTJ8QKOYSZR4us8kMCUaNiTHs/It6y5aa7slXzueGf6qxZ0D66rr3+yQk+f26aLxsTc4Qe/
	G/2ibj3JnOD6kYpxxC8LU3DumN0GBuNo/e41rWfbl0qWmG35/7BXXhppD9fV5YyejK8cctdDXTa
	td8ps5Dgq42j+dOSCqorHPAzz5QMp2k/9Sv3AeAq71408UefE3Q6dAyXdg9JskFZQY+MaJ8YtTb
	LKcjWLBc985oxyqLEfTnQWaMk1YHpfG1sGG1MuO2SciuDwgHfFMlDPsoRjQvDwW7E76IluD+WPK
	D/OFwHhbOHcNzD79Hwq0Y80BgUjX2TymwQZeBu2D/9ghSC/YqrA1R348X48Uw/9YxL7+T1hUYEd
	vE=
X-Google-Smtp-Source: AGHT+IEWkjr/yMbQZ11FRxIPuaPgvXEE7kWLlUguvX5EU1Obn2SGT+6EZRea6meYGrKNKaeOKoqGRA==
X-Received: by 2002:a05:600c:4f4a:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-47a8f8a717dmr109516885e9.7.1765789196903;
        Mon, 15 Dec 2025 00:59:56 -0800 (PST)
Message-ID: <f1bd1d10-c3a0-4dfa-88aa-f14a5bf88308@suse.com>
Date: Mon, 15 Dec 2025 09:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Victor Lira <victorm.lira@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
 <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
 <7514a67c-d140-43b6-bed0-3467530a086d@suse.com>
 <fbe63318-b764-46ce-a377-dd4ce7229abe@amd.com>
 <83eedd0c-dcaf-4e28-ac0f-f4991f053350@suse.com>
 <c2d3da12-7bcb-4a61-a495-a09c4d4123c4@amd.com>
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
In-Reply-To: <c2d3da12-7bcb-4a61-a495-a09c4d4123c4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 16:48, Jason Andryuk wrote:
> On 2025-12-12 08:22, Jan Beulich wrote:
>> On 12.12.2025 02:34, Jason Andryuk wrote:
>>> The alternative is section groups?  I'm trying that, and it kinda works
>>> sometimes, but .attach_to_group fails when .init.text is involved.
>>>
>>> Here's an example that I think would work, I could make it to
>>> --gc-sectrions:
>>> group section [    3] `.group' [.text.vpmu_do_msr] contains 5 sections:
>>>      [Index]    Name
>>>      [   43]   .text.vpmu_do_msr
>>>      [   44]   .rela.text.vpmu_do_msr
>>>      [   45]   .altinstructions..text.vpmu_do_msr
>>>      [   46]   .rela.altinstructions..text.vpmu_do_msr
>>>      [   47]   .altinstr_replacement..text.vpmu_do_msr
>>>
>>> But I don't make it that far.  Other files blow up with tons of:
>>> {standard input}:9098: Warning: dwarf line number information for
>>> .init.text ignored
>>> and
>>> {standard input}:50083: Error: leb128 operand is an undefined symbol:
>>> .LVU4040
>>>
>>> Line 9098 of apic.s is .loc below:
>>> """
>>>           .section        .init.text
>>>           .globl  setup_boot_APIC_clock
>>>           .hidden setup_boot_APIC_clock
>>>           .type   setup_boot_APIC_clock, @function
>>> setup_boot_APIC_clock:
>>> .LFB827:
>>>           .loc 1 1150 1 is_stmt 1 view -0
>>>           .cfi_startproc
>>>           pushq   %rbp
>>> """
>>>
>>> diff below.  Any ideas?
>>
>> I haven't looked into this in detail yet, but ...
>>
>>> --- a/xen/arch/x86/include/asm/alternative.h
>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>> @@ -90,25 +90,31 @@ extern void alternative_instructions(void);
>>>    /* alternative assembly primitive: */
>>>    #define ALTERNATIVE(oldinstr, newinstr, feature)                      \
>>>            OLDINSTR_1(oldinstr, 1)                                       \
>>> -        ".pushsection .altinstructions, \"a\", @progbits\n"           \
>>> +        ".attach_to_group %%S\n"                                      \
>>> +        ".pushsection .altinstructions.%%S, \"a?\", @progbits\n"      \
>>
>> ... wouldn't you need another .attach_to_group here and ...
>>
>>>            ALTINSTR_ENTRY(feature, 1)                                    \
>>> -        ".section .discard, \"a\", @progbits\n"                       \
>>> +        ".popsection\n"                                               \
>>> +        ".pushsection .discard, \"a\", @progbits\n"                   \
>>>            ".byte " alt_total_len "\n" /* total_len <= 255 */            \
>>>            DISCARD_ENTRY(1)                                              \
>>> -        ".section .altinstr_replacement, \"ax\", @progbits\n"         \
>>> +        ".popsection\n"                                               \
>>> +        ".pushsection .altinstr_replacement.%%S, \"ax?\", @progbits\n"\
>>
>> ... here? Or alternatively use the 'G' section flag to the specify the group
>> name?
> 
> The '?' flag puts the new section in the previous group, so it doesn't 
> have to be specified.  I have used 'G' and %%S with similar results. 
> The example vpmu output above shows that is working.  I can't get to 
> linking with --gc-sections yes to see if %%S is no longer necessary with 
> proper groups.

Oh, sorry - I had managed to overlook the use of '?' above.

> The problem is "the current function" needs to be assigned to the same 
> group, and that is what I hoped to address with .attach_to_group.  From 
> what I can tell, the function-section is not assigned to a group without 
> .attach_to_group.
> 
>> As to debug info, I wonder whether playing with groups behind the back of the
>> compiler is going to work well. Iirc it groups sections itself, too. Did you
>> look at the generated assembly with this in mind?
> 
> The generated assembly differs only by the presence of .attach_to_group 
> for build vs. doesn't build.  Is the debug information expected to 
> differ according to groups?  (This is all new to me).  I have more to 
> look into, I figured I'd post what I have in case anyone had seen it before.

Hmm, looking at a random example, .debug_info (and other Dwarf sections) is
still monolithic with -ffunction-sections. I'm having a hard time seeing
how that would work nicely. And while I'm sure I saw gcc emit section
groups in certain cases (e.g. while building tools/), I can't observe it
doing so there, so that must also depend on something I haven't figured out
yet.

Jan

