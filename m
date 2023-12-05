Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526068055C2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647866.1011532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVOE-00056G-SA; Tue, 05 Dec 2023 13:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647866.1011532; Tue, 05 Dec 2023 13:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVOE-00054L-Pg; Tue, 05 Dec 2023 13:23:06 +0000
Received: by outflank-mailman (input) for mailman id 647866;
 Tue, 05 Dec 2023 13:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAVOD-00053o-Mu
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:23:05 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b1368c1-9371-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 14:23:03 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c0a03eb87so26293225e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 05:23:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c451100b0040b379e8526sm22219422wmo.25.2023.12.05.05.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 05:23:02 -0800 (PST)
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
X-Inumbo-ID: 6b1368c1-9371-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701782583; x=1702387383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMcn1Dv/BCuFpWqbgMxo+xk7m0QXnQkn6DxoF81FIfg=;
        b=OvvWfwCtQ57iVmj9jmz/Q6PIgvnS+6Wx6bf8SVLfewBo/o9dOmVVq+Ruu1IsuyHZwF
         DkrW09Ua2GKB5StOYFo91tQyZRYjD4sfz+UbirngWYAKCHxGRTyBslPYK9iAiNVQBlZx
         vAS2hzv8EdUhNKRuAQq2UGfnPKhjkR5IfF8fIxW5pnmXwOgiyim+snA0Rw3eWVgkm/9j
         S64DI2A9it3K5ThVE+HGVdsiWL+0WA8Ej+Ir9HshZYHZrq+wR4F75LBIQKDMVlEkfuAf
         eqg+w5U+nAa+RSTey/ry9687qa2dWhXvdPLd8/sj5vrNaIrtMEUv1TT04KgmHJX14h8Q
         kG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701782583; x=1702387383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMcn1Dv/BCuFpWqbgMxo+xk7m0QXnQkn6DxoF81FIfg=;
        b=W2Tpbpn2ODSKm+2ovW0vUaD7WulzAEJWTisVuq4wdqVh4cyMsG2TGhnj8Z313tuJqY
         qILg8RgTqMgKXXneCWUK6dW64GwJUSLnOLI1Usf4b1h8ZNbCmQ/afsB9nnV3AP7sHh6N
         ftyjvWetFcwHr/rFR2juxT/HpgUii+M7/m1EUAvgLWg6dnWVC80PZr9oST1yhZ9o/a7L
         ooh5G5s+Vg7+VgQnpHiHHNtR6BMSk+6Bd8hkx0MDsbk07NVgAya6Zjt/KPpwzJk5JwZp
         WaXc6cUNz7P0978sKo2iPRqc8jMTTv7NHqkmbdicdi1roVcihyOoEHqMfThQLxuUvaFb
         Ri9A==
X-Gm-Message-State: AOJu0Yw827yW9liI5m8xabdzAmE7pW2+OlihrU9exLHU8y3ymxp+5HAw
	W9y0twyZ4TaoGgIa20hMg3A8
X-Google-Smtp-Source: AGHT+IGJ5WVisJu+RzrcQbibsSsbKmiq4dZ+xQBmLpJEuu7aKxQ0GrYoHd6s9pZMepJiP8X7WqGjGQ==
X-Received: by 2002:a05:600c:3652:b0:40c:f27:1b81 with SMTP id y18-20020a05600c365200b0040c0f271b81mr500626wmq.373.1701782582803;
        Tue, 05 Dec 2023 05:23:02 -0800 (PST)
Message-ID: <df0df233-d44c-4386-a864-0e08e06d07a1@suse.com>
Date: Tue, 5 Dec 2023 14:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/livepatch: introduce a basic live patch test
 to gitlab CI
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-5-roger.pau@citrix.com>
 <00de64fd-5669-424d-9b32-2342b5936f1a@suse.com> <ZW8g144id8e1Aoy3@macbook>
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
In-Reply-To: <ZW8g144id8e1Aoy3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 14:08, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 12:49:38PM +0100, Jan Beulich wrote:
>> On 28.11.2023 11:03, Roger Pau Monne wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/test-smc-lp-alt.c
>>> @@ -0,0 +1,23 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +
>>> +#include <asm/test-smc.h>
>>> +
>>> +/*
>>> + * Interesting case because `return false` can be encoded as an xor
>>> + * instruction, which is shorter than `return true` which is a mov instruction,
>>> + * and also shorter than a jmp instruction.
>>> + */
>>
>> I'm a little wary of this comment: "mov $1, %al" is two bytes only, just like
> 
> Don't we need to zero the high part of the register also?  Or since
> the return type is a bool the compiler could assume it's truncated by
> the caller?

I think so, yes. I.e. ...

>> "xor %eax, %eax" is.
> 
> GCC 13.2 (from godbolt) generates at -O2:
> 
> mov    $0x1,%eax
> ret
> 
> Which is 5 bytes long mov insn.

... at -Os I'd kind of expect the compiler to use the shorter (albeit
slower to execute) "mov $1,%al" (unless of course I'm overlooking a
specific rule in psABI).

> The return false case is:
> 
> xor    %eax,%eax
> ret
> 
> I can adjust to mention this specific behavior.
> 
>>> +bool cf_check test_lp_insn_replacement(void)
>>
>> What's the purpose of the cf_check here?
> 
> Because it's added to the array of test functions to call in
> test_smc().  Doesn't it need cf_check in that case?

Oh, of course it does. I managed to overlook that use (misguided by one
of the two files being built without being actually used).

Jan

