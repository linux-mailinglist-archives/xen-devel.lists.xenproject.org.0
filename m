Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5615B27070
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 22:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082557.1442361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umeyp-0004DF-Ad; Thu, 14 Aug 2025 20:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082557.1442361; Thu, 14 Aug 2025 20:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umeyp-0004BE-83; Thu, 14 Aug 2025 20:55:23 +0000
Received: by outflank-mailman (input) for mailman id 1082557;
 Thu, 14 Aug 2025 20:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umeyo-0004Ay-4H
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 20:55:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd0de4ab-7950-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 22:55:20 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b065d59so7298805e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 13:55:20 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c773e57sm35944625e9.23.2025.08.14.13.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 13:55:18 -0700 (PDT)
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
X-Inumbo-ID: fd0de4ab-7950-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755204919; x=1755809719; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rod5wjhx1PqBzw1BP3Cl+Q066L7oGZUW3oODyYVwXew=;
        b=AjVEHuk6JvwYLncvOru5T3TSSZm6sYvfNnO1W+L85vK0V4Tu0Lu/gVW9QQf9ejEOSX
         shFOpFiWqmmKOYU/2SiKsqKkTBZcVZA9sjnEX6XJN7uqzvQ/6cHcx7G3aWvdhCJ856FH
         LvojtDe0RHgfoY4HpZDRK/MzIN3lQlogNeSqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755204919; x=1755809719;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rod5wjhx1PqBzw1BP3Cl+Q066L7oGZUW3oODyYVwXew=;
        b=ggEgJkLssV7WybxIb65p2QAunB5Bi1ZQHmYI5Sep2NFwe/xYpXtVVe2WCtEbOC9aER
         ADwelMaWpR33QJEDcC32yaboGYjDUWbd2z05NIIx0IsslHde2PBOX8SUKxoGu8wCjEIV
         qge13+EFlGjoXSje+7XuWPWR7xiLEyqkm70q7HI9ezQuobWsTUTc56KebuRm6kcB8Vxb
         M1CuErg1FWhLPCu1FNgK5laQX87urN0bf5DupSAwks/HvX/W9HgSJ1eGKyHaF0rphtX9
         mqHhTPztimjgWqWeeF+iAeHoZ8DUHrXHS3/1q+AuzMCqjeY7gy9h8TS2iHdtw3ogfojF
         w8ig==
X-Forwarded-Encrypted: i=1; AJvYcCUQIZFyGPmDQ1D2q/kaZzXcBl7cnsueiNvlEzDXKoOHi51XIGN5jrHpcXV3odMDQ1K1SgG9IkaP3J4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzccRzQd2rCfO0nV1MoBww+SZwbrnt9woVfmziar68p8jBW0qoh
	IhL8Qw7ruXzWgiasAcBgYojMf9J+H95vRyrI+GH8GUW+OaTb0e0Vvp8LWt5ZQXHfyVfq5oE2iB6
	RlHZr
X-Gm-Gg: ASbGncuwZwq2NOmB8YmiuJ3qBVo0h4Ru1t0xR/zDw1bwhKt4D1+VzH0lDkoN1aDMj1d
	Kz4sXUPKEyH2BhQ48B7Rl120X1l9U0atrD9AgNbWw+DlEz7Bk21HoHlxPXpjkF/u6mqccK01Epq
	dN/GekIy/pNMtNzzBbBtxm1kFE50CV4Lh/iCIJ5PRr+KUJrVBjDNAq0MpW7OWpKid/qZOTzSy8Y
	Rvf1PukTvWQuMlZpipsZlhK0F5ERBgQZLK803HTSa9dDr1WZws2J5tiqklbj4eWtrLpyqmWJin2
	WOvv3oiVz/nx/dBj98ehVHVeQpH/eLz+01oMj4kXg2j1/Kmb04hv3IGTqF1b+AgkGnjE+qG/fpW
	oCMLYcD12bHTw7v80iNKN31k7uR9ztPl/PsYZG28YTPcYSrojllP8NDfjlGK8QtGeIfQ8
X-Google-Smtp-Source: AGHT+IF7Pnlrd1U8dsxHvK0vr24DCg1PcifVWJu5JxmmmIWAGOrIz+dZ6+mx/Yt4g7hH3qPLrDYryg==
X-Received: by 2002:a05:600c:450e:b0:456:1904:27f3 with SMTP id 5b1f17b1804b1-45a1b66d9bbmr41779755e9.18.1755204919147;
        Thu, 14 Aug 2025 13:55:19 -0700 (PDT)
Message-ID: <17498f02-0603-489c-bbc9-2207ffef8029@citrix.com>
Date: Thu, 14 Aug 2025 21:55:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/22] x86/traps: Alter switch_stack_and_jump() for FRED
 mode
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-21-andrew.cooper3@citrix.com>
 <7b46de92-d7b6-462f-8469-0f334d9e70bb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7b46de92-d7b6-462f-8469-0f334d9e70bb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 4:35 pm, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
>> means that switch_stack_and_jump() needs to discard one extra word when FRED
>> is active.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> RFC.  I don't like this, but it does work.
>>
>> This emits opt_fred logic outside of CONFIG_XEN_SHSTK.
> opt_fred and XEN_SHSTK are orthogonal, so that's fine anyway. What I guess
> you may mean is that you now have a shstk-related calculation outside of
> a respective #ifdef.

I really mean "outside of the path where shadow stacks are known to be
active", i.e. inside the middle of SHADOW_STACK_WORK

>  Given the simplicity of the calculation, ...
>
>>  But frankly, the
>> construct is already too unweildly, and all options I can think of make it
>> moreso.
> ... I agree having it like this is okay.

Yes, but it is a read of a global even when it's not used.

And as a tangent, we probably want __ro_after_init_read_mostly too.  The
read mostly is about cache locality, and is applicable even to the
__ro_after_init section.

>
>> @@ -154,7 +155,6 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>      "rdsspd %[ssp];"                                            \
>>      "cmp $1, %[ssp];"                                           \
>>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
>> -    "mov $%c[skstk_base], %[val];"                              \
>>      "and $%c[stack_mask], %[ssp];"                              \
>>      "sub %[ssp], %[val];"                                       \
>>      "shr $3, %[val];"                                           \
> With the latter two insns here, ...
>
>> @@ -177,6 +177,8 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>  
>>  #define switch_stack_and_jump(fn, instr, constr)                        \
>>      ({                                                                  \
>> +        unsigned int token_offset =                                     \
>> +            (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - (opt_fred ? 0 : 8);  \
>>          unsigned int tmp;                                               \
>>          BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
>>          __asm__ __volatile__ (                                          \
>> @@ -184,12 +186,11 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>              "mov %[stk], %%rsp;"                                        \
>>              CHECK_FOR_LIVEPATCH_WORK                                    \
>>              instr "[fun]"                                               \
>> -            : [val] "=&r" (tmp),                                        \
>> +            : [val] "=r" (tmp),                                         \
> ... I don't think you can legitimately drop the & from here? With it
> retained:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

You chopped the bit which has an explicit input for "[val]", making the
earlyclobber incorrect.

IIRC, one version of Clang complained.

~Andrew

