Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D69EE497
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855743.1268569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgtQ-0004Zg-PL; Thu, 12 Dec 2024 10:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855743.1268569; Thu, 12 Dec 2024 10:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgtQ-0004YD-M6; Thu, 12 Dec 2024 10:58:04 +0000
Received: by outflank-mailman (input) for mailman id 855743;
 Thu, 12 Dec 2024 10:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLgtO-0004Y7-Nl
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:58:02 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f49c2aea-b877-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 11:58:01 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa6b4cc7270so60481166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:58:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6996487aesm467619066b.12.2024.12.12.02.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 02:58:00 -0800 (PST)
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
X-Inumbo-ID: f49c2aea-b877-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734001081; x=1734605881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=by+E7a3ewMGaFfF7TK+NdMjs7TBxHf743/QgL6QMkp8=;
        b=KS5NVZoN9a1m9Fhfa4WQKd8jXSzHsrSjgSrgPVumxzdIh+nh9CAKfJ/T/LSxM5kRax
         gyxb98rlvRZgzW6m9XXothYUzyQwHQbHhIcjA0+qkMOdWe0M5Q1VbbGzBUDguNNtUJSE
         CjyeSS6V0CyujtuFC80kMcjm/+WTsx1C6tBsljIsO0gndhZJsJJu89R0x7RkSsJuhrrc
         nFh747iscbwywEZ3IwxEsJ3P9FM0lgoBbosCdTbul5qZxDtxyDTHyFZnsHjKSNnZPzlm
         jeMIPrFvM7eAen66Z2g2NEvP2p89/cX4Cb1s6SbM5KujPNweITPdftT4ZBy6LdQXdXd/
         niHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734001081; x=1734605881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=by+E7a3ewMGaFfF7TK+NdMjs7TBxHf743/QgL6QMkp8=;
        b=VrEkL1FyeFEcWt5b8QnUjYi3pi1uMqEqpIDTw+TJBQB/91xLLLlfMgHzWiBr73ojYp
         flUqmjfOoTK84Z7zMYDDragDtaWPIZ6+fnM2YFvh//swWv8tlUaFHXlFcEglpPI0lqAh
         BQZb90M0c3rCKEbI1RReqPJUaRYgSZ7vhhEFh5pgzHJhjsA+kgXOQadYAQh83JvPVhwV
         dD6nktSS4Gr2W8oS8FHTIgO70onWekZXjapDoBm6rlPc4CAcAWa/iWNqkn2hUhaCYKOy
         qVPPq5+aBDW27vzrQii/oWrqUDzWPPC7Wd/yVsCJ2JPAaAOMhN+RUiiafqiif7i5mfTC
         XegA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3vLfon9Cuee8NEed/J9DYJYEb8f5hz5GlUywUiI8J+mg6gvh5FTY6C73QzAbCbVg+S1q2WUu20s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPzGHvlpx+cXYeBEUNZT5+l9Qh5TQLnV2RuxNTedOQ1EIojujX
	SStL0RSbQg0BGNF8rP1FqZihvtKCIIOIP/TnnPy0FQhCWhllbWBXlgZIjXCgTA==
X-Gm-Gg: ASbGnctSWilSI3Ef1+TDFJ1q35MC/0/cbOTxr+Pxmy3cIQnRKmTXc8zBGV4kQb+eO2L
	QvtDCuFpopYf4zyscXjU4SVxCASiNdkPQuoSX0rDmYZmtkWuri7Gwp0A+8D/kAAlRc3u8byGqKs
	qmPCXWvL9NHzC2OK0HdNX//LDxmKNuAfaA8r/tdTfHs7pp/7s6eGW1t27Xe6wL6WpZzMQRHfH8e
	X7KijywzJ1Uu4kZmX7SPuyr/+lPPZG1gh9sPrh91nzrZ2/cqh03DsmKNLt88DtTwlnbyg6YPpw2
	dGdN8rAsKgqKARAkMMPFJlc3OiiGupVedkwFhimJnA==
X-Google-Smtp-Source: AGHT+IGo+F7owOExUnkR0TgOEMLggooc9djHXbgdgKekbJsugQouE+Y1KBgBpJsRSOY4iZuTp4x+Dw==
X-Received: by 2002:a05:6402:34d6:b0:5d3:cf89:bd3e with SMTP id 4fb4d7f45d1cf-5d4fa1b2936mr1380060a12.30.1734001081186;
        Thu, 12 Dec 2024 02:58:01 -0800 (PST)
Message-ID: <55078aa2-7baf-40a4-80a2-1b083adff2f6@suse.com>
Date: Thu, 12 Dec 2024 11:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <20241211020424.401614-3-volodymyr_babchuk@epam.com>
 <0d04abb1-dae1-47d1-93e3-23d88399fa64@suse.com> <87bjxh3exi.fsf@epam.com>
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
In-Reply-To: <87bjxh3exi.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2024 01:47, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 11.12.2024 03:04, Volodymyr Babchuk wrote:
>>> --- a/xen/include/asm-generic/random.h
>>> +++ b/xen/include/asm-generic/random.h
>>> @@ -2,6 +2,11 @@
>>>  #ifndef __ASM_GENERIC_RANDOM_H__
>>>  #define __ASM_GENERIC_RANDOM_H__
>>>  
>>> +/*
>>> + * When implementing arch_get_random(), please make sure that
>>> + * it can provide random data before stack protector is initialized
>>> + * (i.e. before boot_stack_chk_guard_setup() is called).
>>> + */
>>>  static inline unsigned int arch_get_random(void)
>>>  {
>>>      return 0;
>>
>> What exactly will go (entirely) wrong if the comment isn't followed?
> 
> This will not cause immediate harm, but it will give false confidence to
> anyone who enables stack protector.
> 
> I'd prefer more substantial protection, but we can't even check if
> random generator is available in runtime. Taking into account that we
> potential can get 0 as result of RNG, we can't even put
> WARN_ON(!arch_get_random()) check.

Right, and hence 0 isn't strictly something that can be called "bad".
With at least some randomness one will of course observe a possible
problem at least across two or more runs. However, you don't call
arch_get_random() directly anyway, and get_random() has fallback code,
which is no more likely to return 0 than arch_get_random() is.

In fact this fallback code means get_random() will also use it when
arch_get_random() returns 0 as coming from an actual RNG. Which can
be considered bogus, as for a good random number source _every_
possible value ought to have equal probability of being returned.
Plus if we special-case 0, why not also special-case ~0? Or any other
number with only very few bits set/clear?

For the purpose of stack protector we may want to consider using a
mix of static pattern (not used elsewhere in the codebase) and random
number. The static pattern part would then want arranging such that
at least any value representing a valid address (within Xen alone)
won't match possible canary values.

>> (I'm afraid anyway that the comment living here is easy to miss.)
> 
> I didn't found a better place for it. Maybe you can suggest one?

I'm of two minds here really. Part of me wants this simply dropped. Yet
then some may deem this worthwhile information, except that then it
needs to live is a suitably exposed place. Just that I can't think of
any that would really fit.

Jan

