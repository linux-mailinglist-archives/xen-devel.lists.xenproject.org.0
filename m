Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603278CA7D4
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 08:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726580.1130902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Ikn-0002ss-Pe; Tue, 21 May 2024 06:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726580.1130902; Tue, 21 May 2024 06:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Ikn-0002qU-Mz; Tue, 21 May 2024 06:13:41 +0000
Received: by outflank-mailman (input) for mailman id 726580;
 Tue, 21 May 2024 06:13:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9Ikl-0002qO-CN
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 06:13:39 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4362e1df-1739-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 08:13:38 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-574f7c0bab4so10581910a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 23:13:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a614224cb3csm249449566b.13.2024.05.20.23.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 23:13:37 -0700 (PDT)
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
X-Inumbo-ID: 4362e1df-1739-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716272018; x=1716876818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Py0J/8XG38Oeg/B/OwG3ASmwChchTQyQzCMIKm8DEk=;
        b=MwyUGyGeruF2dxDpYsaisyLPwSLXUg9RqsX3feyNXSZYvKeN9RdPC5PCFiARY4qXpF
         INa6ABu+2Z5e5RsAbxRjnyVrGq5bbRkNuqII0Vh+M4i3JQqRVVRYgrFjxs+s6iBrHZdV
         ndhvLBg6+3dJIek9J4Hyp7yo+6tf8uFNS9eonxei/Hk0WZwOd4tDzJ0ssqxiMgj4jqcn
         atGjkTclqmYyAZUm++kO7roHGkXdZ9QL16rKQn6nvjQ4Pg9W5GPeYM7cXSVOLG3snFXC
         xoXS1MJ5SzkdabB0N5qY7RM96Pi+7yHIwYAI6j2C34WK8ZZ72mvAkemKZ/FfkZSS984H
         vlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716272018; x=1716876818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Py0J/8XG38Oeg/B/OwG3ASmwChchTQyQzCMIKm8DEk=;
        b=jImjvm42qD+qZ/EuzPMBm4CUDPFbcZ31m2mV1WQfkCPaTHpMzx4QUHXdRXSA2gEybr
         nTlhyG7WE4RC5AHn/akYm29ml6FWIn0AusDIx011DDd0HWl4XnZnoAG4RH+V37tMhxql
         TsdsaFkDVfbLgA+A8bXb9mEti4EQGLr0rTise8kBOnb2NEF9AgUKAq8W6RuRJ1shsndq
         0iIZcVqw0vdxKUf6UFo4sA8ZmyWM6HUhPuRB2bud13RDV4fBNlWX2tq5Qa1Od/bBNZ5l
         9nPzG23sWeNjsGPpcaJ4EIXMntxBC+3ML3F8c7HClUfP1UYThXaFZjWsvlMioM/DHK2Q
         UqjQ==
X-Gm-Message-State: AOJu0Yzgihe57lOCmwXN6jYMxVf8VvNFJfFyCg/Qp1Kji4pmJ1PXHq6E
	IqN9xbGsGL3F/tEuRpbdGd5gPmu29OxFHSc3U6h6YsXxw9Q2teZB3XWua38FDEX6LGspRyrFi/U
	=
X-Google-Smtp-Source: AGHT+IGikqzXrDPgTGwZ1UqAgpXY/STcOmJJlk2+dLaMbdWw2LRCr3xUdZj26NLThTj1PfGdl7UNqw==
X-Received: by 2002:a17:906:cf83:b0:a5a:5c8f:120d with SMTP id a640c23a62f3a-a5d5fd58885mr659250066b.36.1716272017749;
        Mon, 20 May 2024 23:13:37 -0700 (PDT)
Message-ID: <1bc341cb-7620-4597-9e35-187758dc28ce@suse.com>
Date: Tue, 21 May 2024 08:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
 <ZkXvdWf2mVkPW458@macbook> <7965ba74-9177-44b7-9253-7ab5a77fd88f@cloud.com>
 <ce573d24-1d52-48a8-b3f0-8636dacd5c9b@suse.com>
 <26f1627c-4325-42f0-bbb1-0bd9be35bbce@cloud.com>
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
In-Reply-To: <26f1627c-4325-42f0-bbb1-0bd9be35bbce@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2024 16:46, Alejandro Vallejo wrote:
> Hi,
> 
> On 16/05/2024 13:37, Jan Beulich wrote:
>> On 16.05.2024 14:29, Alejandro Vallejo wrote:
>>> On 16/05/2024 12:35, Roger Pau Monné wrote:
>>>> On Thu, May 16, 2024 at 12:07:10PM +0100, Alejandro Vallejo wrote:
>>>>> Bring test_x86_emulator in line with other tests by adding
>>>>> install/uninstall rules.
>>>>>
>>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>>> ---
>>>>>  tools/tests/x86_emulator/Makefile | 11 +++++++++--
>>>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
>>>>> index 834b2112e7fe..30edf7e0185d 100644
>>>>> --- a/tools/tests/x86_emulator/Makefile
>>>>> +++ b/tools/tests/x86_emulator/Makefile
>>>>> @@ -269,8 +269,15 @@ clean:
>>>>>  .PHONY: distclean
>>>>>  distclean: clean
>>>>>  
>>>>> -.PHONY: install uninstall
>>>>> -install uninstall:
>>>>> +.PHONY: install
>>>>> +install: all
>>>>> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>>>>> +	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
>>>>> +
>>>>> +.PHONY: uninstall
>>>>> +uninstall:
>>>>> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
>>>>> +
>>>>
>>>> FWIW, should you check that HOSTCC == CC before installing?  Otherwise
>>>> I'm unsure of the result in cross-compiled builds, as the x86_emulator
>>>> is built with HOSTCC, not CC.
>>>>
>>>> Thanks, Roger.
>>>
>>> Right...
>>>
>>> More generally, should we do s/CC/HOSTCC/ on all compiler checks? I see
>>> no particular reason to do them on $(CC) rather than the actual compiler
>>> used during build.
>>
>> No. There really is a mix here, intentionally. Anything built through testcase.mk
>> is using CC, and hence respective checking needs to use CC, too. That said, I
>> don't think the split is done quite correctly just yet, which may raise the
>> question of whether having the split is actually worth it.
> 
> I'm a bit puzzled by this. Why do we compile pieces of the test binary
> with different toolchains?
> 
> At a glance it seems inconsequential in the native case and
> fully broken on the cross-compiled case (which I guess is what Roger was
> hinting at and I failed to notice).
> 
> Why the distinction? What am I missing?

It's convoluted and not fully consistent, yes. Consider for a moment that the
emulator truly was what its name says, i.e. not merely re-playing insns. In
such a case it could be run on non-x86, while still emulating x86 code. Thus
code being emulated and code doing the emulation would necessarily need to be
built with different compilers.

It being (in most cases) merely replaying, the boundary has been fuzzy for a
very long time: While for most parts it's clear what group they fall into,
test_x86_emulator.c itself is (has become? even 3.2.3 already has at least
one instance) a hybrid. Yet in principle this file should also be buildable
with the (x86 or non-x86) host compiler.

Jan

