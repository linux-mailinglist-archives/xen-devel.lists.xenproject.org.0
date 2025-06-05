Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94295ACF079
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006853.1386103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAdR-0006NT-7Q; Thu, 05 Jun 2025 13:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006853.1386103; Thu, 05 Jun 2025 13:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAdR-0006L7-46; Thu, 05 Jun 2025 13:27:57 +0000
Received: by outflank-mailman (input) for mailman id 1006853;
 Thu, 05 Jun 2025 13:27:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNAdP-0006L1-Ix
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 13:27:55 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e274ff53-4210-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 15:27:53 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so1365885f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 06:27:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506d21802sm119390475ad.215.2025.06.05.06.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 06:27:52 -0700 (PDT)
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
X-Inumbo-ID: e274ff53-4210-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749130073; x=1749734873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s8BoNeAxz/18ooR6Va4Bog9IVU7MoN5pP9IrNWTfYXQ=;
        b=B15AZAzIHbPA94tlEqf8CviAssQYk41PtpuFBiaRNGLLygYyPnvInM5U4othuh676h
         jDHhYKER1Y9VjZaMZMrGD6z/eFv7z8ld/8JlzpxyF4BnLz5nAOIzXzVlHYSLMpXExzdy
         bCF04akIueCAexWTVhq+TU5wlZm8RBWbnf2BvoRudVvrxxDey6Md6E2IjJwQ2wkQO+2e
         S+lQ5usKKd6zQB6UvbNDL8isZJdeFRyQhUcCpbIKG2hSHnyR3+voqg5wKGPe+Jwc6/QV
         C2P3NwC9lEcENHHbOQ8P0/5aFyuhWlt7RwnRgxZ0agc/pL3Tjiuo0lYpFBhc4BCy2HAt
         zYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130073; x=1749734873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8BoNeAxz/18ooR6Va4Bog9IVU7MoN5pP9IrNWTfYXQ=;
        b=m2h5wonm9hQ1ukw2R1FZ/Az+aETdxWwV6VYdRf//oJgua+b7lwxMxZFgh5B7+PMSk9
         MMDuYo7CerQHPzqUiPfBsrZT9WVHufuGqdDu5AAfpV/SZVmqlzLs4jd8N59SQxww9rfC
         PRotLG63DqjdudmVjnUbPOPT4/YyhKCOysIzTfxtYKiZNNxcN0Zp9DAl3cKy+sUSar6Q
         8z8tItVE7i0TM1zCaJ/8KYSfFcMkQZyOsA9gVA85rTIZA5+8Dq5XkrGG/GHMFezQXc18
         0VoHkGJcviFE4uDpKxNfwdzxtGEiBbvVuocgc1oKrtEEnQ0X28nTF1fTkcZF0cpMJOde
         a+YA==
X-Forwarded-Encrypted: i=1; AJvYcCVnUVaCZ9BlJKzOY1yktTrBBxJrrFdy4YjxyLWkn2Q9C3Y+5d/q7CShOYIElUr6rr2qN7ioOv/f8Rc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOWSDvWvN9lM/diw8gRXhql4Xhi4jjlABnhrCnIY/ZPEFxSo+U
	aeW090Ib7rioVu15oqAVUD/f/rbKipbn9+Ovd+tsiUL4zqc3ZNanSvt+RmmBV5OTDT/TMpuye46
	f9DA=
X-Gm-Gg: ASbGnctgmcGb8NBavu5cvnpgNj2XiMKai6+f0tB9GmDnnsKB+z66asMUCR+OQ/7hnh+
	YKA/dpjPV4azoADxevqFmgzcQI5072N1Fjshw8J8F+F1nXi461PzjcMhvgXMqbb+TthRSrvtc2U
	TC7I8WDwFk+DKi9p5T9JGsBYkyc6QcGXRk05eysmr5kwVR68vEnJrKePx/G8EOZnpaZEG+4hS0h
	GMVRGonFfaHnORsIHYMHA/m53vUPQSq/gh05zCa5BbIPXIuKxwvvVYsngwKmCB8QSEARhWaTcGG
	HLh+rxiPH+D/Yjyp+G8uyxi91T6mmXjdqMF4oL+BIh43NdjDs0lVs9zhcmryKD0hDDfJQ436QjN
	4uE62W/KjACQdblJs6vV6WnP3jCxrmgP9nJLn
X-Google-Smtp-Source: AGHT+IH9IzJwKclOgpgw0Izj0bXnkFsbx6HjRdazthC4nY2QgKGK5QzB649hLQbhZ1Lfvwp+T+yNng==
X-Received: by 2002:a05:6000:2310:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3a526e1cf0fmr3252435f8f.25.1749130073015;
        Thu, 05 Jun 2025 06:27:53 -0700 (PDT)
Message-ID: <b10f8e18-4009-4168-9946-5a7ae9fcee73@suse.com>
Date: Thu, 5 Jun 2025 15:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/keyhandler: add missing noreturn attribute
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: victorm.lira@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?B?Um9nZXIgUGF1IE1vbm7Dg8Kp?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20250604235034.1595881-1-victorm.lira@amd.com>
 <9e3a7b1b-7fbe-428b-888a-c18c95d8ee37@suse.com>
 <b258936e289290321e9a8b2d23723fc2@bugseng.com>
 <3b24b1df1a0ce4a62b53067b09fe9a02@bugseng.com>
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
In-Reply-To: <3b24b1df1a0ce4a62b53067b09fe9a02@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 14:26, Nicola Vetrini wrote:
> On 2025-06-05 14:22, Nicola Vetrini wrote:
>> On 2025-06-05 09:17, Jan Beulich wrote:
>>> On 05.06.2025 01:49, victorm.lira@amd.com wrote:
>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>
>>>> Function `reboot_machine' does not return, but lacks the `noreturn' 
>>>> attribute,
>>>> therefore causing a violation of MISRA C Rule 2.1: "A project shall 
>>>> not contain
>>>> unreachable code".
>>>
>>> Is this (uniformly) true? Looking at ...
>>>
>>>> --- a/xen/common/keyhandler.c
>>>> +++ b/xen/common/keyhandler.c
>>>> @@ -251,7 +251,7 @@ static void cf_check 
>>>> dump_hwdom_registers(unsigned char key)
>>>>      }
>>>>  }
>>>>
>>>> -static void cf_check reboot_machine(unsigned char key, bool unused)
>>>> +static void noreturn cf_check reboot_machine(unsigned char key, bool 
>>>> unused)
>>>>  {
>>>>      printk("'%c' pressed -> rebooting machine\n", key);
>>>>      machine_restart(0);
>>>
>>> ... generated code here, I can see that the compiler is perfectly able 
>>> to
>>> leverage the noreturn that machine_restart() has, resulting in no
>>> unreachable code to be generated. That is - neither in source nor in
>>> binary there is any unreachable code. Therefore I'm having a hard time
>>> seeing what the violation is here.
>>>
>>> That said, I certainly don't mind the addition of the (seemingly) 
>>> missing
>>> attribute. Otoh I wonder whether an attribute the removal of which has 
>>> no
>>> effect wouldn't count as "dead code" or alike, violating some other 
>>> rule.
>>>
>>
>> Inlining does not play a role in this case. Here reboot_machine() is 
>> marked as a violation because machine_restart() is noreturn and there 
>> is no other path upon which reboot_machine() may return, hence any 
>> function calling reboot_machine() could have portions that are 
>> inadvertently unreachable (as in never executed due to divergence) by 
>> not having the annotation.

Just that there's not going to be a 2nd caller, considering the purpose
of the function.

>> That said, in such trivial cases compilers 
>> are typically able to derive the property automatically, but they are 
>> not obliged to and, more importantly, the behavior may even differ with 
>> the same compiler using different optimization levels.
> 
> Just a note: in later revisions of MISRA C this has become a rule of its 
> own [1], which helps reduce confusion, but up to MISRA C:2012 Amendment 
> 2 (currently used by Xen), this is part of Rule 2.1.
> 
> [1] Rule 17.11: "A function that never returns should be declared with a 
> _Noreturn function specifier"

Oh, that's indeed quite a bit more explicit.

Jan

