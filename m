Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B013DCD4E20
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 08:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191926.1511313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXaWm-0003qU-JF; Mon, 22 Dec 2025 07:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191926.1511313; Mon, 22 Dec 2025 07:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXaWm-0003nh-G6; Mon, 22 Dec 2025 07:40:24 +0000
Received: by outflank-mailman (input) for mailman id 1191926;
 Mon, 22 Dec 2025 07:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXaWk-0003na-HU
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 07:40:22 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 747fc437-df09-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 08:40:15 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso37535255e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 21 Dec 2025 23:40:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3a20af0sm88800465e9.4.2025.12.21.23.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Dec 2025 23:40:14 -0800 (PST)
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
X-Inumbo-ID: 747fc437-df09-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766389214; x=1766994014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1dX/tWMl+E0a5KW2fk14VTiHOdF85cPvS4qKeRhQgqY=;
        b=GHwxDIlMGRQNuPkSMPnJAgNCS0M6Zm8KFjy+RNS9rDEu+y+YGnFmzwtuN9WzE5qbTr
         feiI+4IcoaujhCpyiAnzl5CQLhgUqLc/nVJieQqMsU4hNFTfuGb/TWmiKsvBrIOJKNM3
         jAJT8Qk+nTndB7N9plL0XMZGB9HCqqIeKVIZDdH7qjW7rfCjuIWN49GIDvq0m1taeRSW
         q62sE3n3bvI0Zx85JtMi5xhF05zpQnB/UB0LqId3H0as02IcAqvH7dfSfaLNqxVr3HXa
         S67MJpCQTeSCP1nvB7Oev73WpRMZTzsxzBhOweDyMm0pw5BhLhyxuEUbqR2A0WxLB7fn
         og/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766389214; x=1766994014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dX/tWMl+E0a5KW2fk14VTiHOdF85cPvS4qKeRhQgqY=;
        b=ux3BqFZzvI48JMdT4xWl8LTPt+xdLncwdtcJ849cNNeDT9HZYIL2u3hIXSSd7DuVyU
         w0T8sL/vz63ModAgKcYyN/LCGkv+226Ty+z9wQ7NxisXmI1iGAI+uAtzDTEvlyrpRiJe
         GHvwWt6aEtQBVCrTWJsSzM9egbv9uqQvpt3VNciMETwSlYhmKSVMto9ztDAvFYMWZfBC
         ChAMdwWg9EgsYO3AyvTL6ctvPuv9XOXcGY7o+wN99Oo72XZODzNqOTcyJje91swi1DW4
         GX1pcgP6qgHNojelOU5CnccWWsP/Ut29Q8RtpkM6nPq6M6K0imHmKbUfb/YELDLKdEey
         0ncw==
X-Forwarded-Encrypted: i=1; AJvYcCWxJbpEOOJWe2iGgXEKKHK9SR2Piriyvs9+KsPKboU/0J8RGUaX1TuWDtu9lse65/AWD+J10QxJo7s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1p4Ud5sw2GFw3y5lDwuMvL2CHzoc92K/wnfbkga2nH71Uk+lj
	235cYiCmfH8rpiKb6vzBULoqJWIIWwrgLB161CwRh+wvud0rygodkJ8wvi9247Oz6Q==
X-Gm-Gg: AY/fxX5dypw0Z6v4eZllkNJHk2uU1TesHyYJ4V5IGf8y9dvtCfKd4c9i5Slr+MJ0yrD
	BhyTlsfNYqub8jp4xQIfQrlHq1GnkTNQ4+X1Ji9YZgYpkb0Aa9BfPl+4xYORpmbKAz/5H5wTNiT
	U4eEUXBUgPp+N2LLzp+BvZ0PyfDkBHjzOl+duqCLrNDLXgMObtIj/xqmA4flDBVxbvgUD+E+P4R
	x8g/SrN8extlSHESeVhPBU/VEIFYR3KbXS9OIhHeKZZQEv4DK2xW+tDZSNxkeUWjQZI+93MJ5Hm
	HU33kWWaEzRJihRezWpQG1eUR2kTlx65uSODWHI2aADwTEVNTwVvJdNlKtFI6cU2naJTrSdXmD+
	NN4zHdTBJgp12cxSMBC4wzj5cBwnEsbR7RIf0011wsWHzlNKmKA6d4IWnIMIXu981StDw+lbSw8
	W13szsmC5xI0Ouo4ZsTCdmtveRWfnb6sMoh4kXlKhU1UruDaUZ1PPQUUYm+TuwcdsmGQG/hKq8p
	9s=
X-Google-Smtp-Source: AGHT+IG+1wIOIC2D7fvIE6GH7KrxUp1iatLigrZmPnwjEYiIjqpl6mtOZHaFVznGav/2uYjWcPt4nw==
X-Received: by 2002:a05:600c:4f09:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-47d195672d1mr100339485e9.15.1766389214605;
        Sun, 21 Dec 2025 23:40:14 -0800 (PST)
Message-ID: <d3f6189d-7a4b-4d7e-8b22-71c325ce109e@suse.com>
Date: Mon, 22 Dec 2025 08:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
 <df7a7e94fba79265138d6cc8d23b1f6b958f5bd5.1765888425.git.oleksii.kurochko@gmail.com>
 <08105722-0920-462a-aeba-a36f8044a5dc@suse.com>
 <dddbd311-99a2-44b1-926e-f3859ff936dc@gmail.com>
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
In-Reply-To: <dddbd311-99a2-44b1-926e-f3859ff936dc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2025 21:04, Oleksii Kurochko wrote:
> On 12/18/25 3:20 PM, Jan Beulich wrote:
>> On 17.12.2025 17:54, Oleksii Kurochko wrote:
>>> This commit adds support for legacy SBI extensions (version 0.1) in Xen
>>> for guest domains.
>>>
>>> The changes include:
>>> 1. Define all legacy SBI extension IDs (0x0 to 0x8) for better clarity and
>>>     completeness.
>>> 2. Implement handling of legacy SBI extensions, starting with support for
>>>     SBI_EXT_0_1_CONSOLE_{PUT,GET}CHAR.
>> I can't spot any actual support for GETCHAR.
>>
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/vsbi/legacy-extension.c
>>> @@ -0,0 +1,65 @@
>>> +
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/console.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/sched.h>
>>> +
>>> +#include <asm/processor.h>
>>> +#include <asm/vsbi.h>
>>> +
>>> +static void vsbi_print_line(char c)
>> Misleading function name? The parameter doesn't fit the name, and ...
> 
> It was called only because of ...
> 
>>
>>> +{
>>> +    struct domain *cd = current->domain;
>> I guess you copied this code from somewhere, but a variable of this type and
>> contents wants to be named "currd".
>>
>>> +    struct domain_console *cons = cd->console;
>>> +
>>> +    if ( !is_console_printable(c) )
>>> +        return;
>>> +
>>> +    spin_lock(&cons->lock);
>>> +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
>>> +    if ( c != '\n' )
>>> +        cons->buf[cons->idx++] = c;
>>> +    if ( (cons->idx == (ARRAY_SIZE(cons->buf) - 1)) || (c == '\n') )
>>> +    {
>>> +        cons->buf[cons->idx] = '\0';
>>> +        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
>> ... you also only print a line under certain conditions.
> 
> ... this. (for the same reason as hvm_print_line() which has an argument
> 'uint32_t *val' but inside function working with chars because of
> 'char c = *val;')
> 
> I will change the name to vsbi_print_char().
> 
>>
>>> +        cons->idx = 0;
>>> +    }
>>> +    spin_unlock(&cons->lock);
>>> +}
>>> +
>>> +static int vsbi_legacy_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>>> +                                     unsigned long fid,
>>> +                                     struct cpu_user_regs *regs)
>>> +{
>>> +    int ret = 0;
>>> +
>>> +    switch ( eid )
>>> +    {
>>> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
>>> +        vsbi_print_line((char)regs->a0);
>> The cast isn't really needed, is it?
> 
> No, I think it could be omitted.
> 
>>   And just to double-check: The spec demands
>> the upper bits to be ignored? (A link to the spec could have been useful, e.g.
>> in the cover letter.)
> 
> It doesn't mention anything about upper bit for PUTCHAR:
>    https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-legacy.adoc#extension-console-putchar-eid-0x01
>    (I will add a link to the spec in the cover letter.)
> So I assume that they don't care about it. (IIUC your question correctly).

I fear such a conclusion cannot be easily drawn. The parameter there is even
"int". Anything not ASCII will remain unclear how to handle until the spec is
changed to actually say what is intended.

>>> +        break;
>>> +
>>> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
>>> +        ret = SBI_ERR_NOT_SUPPORTED;
>>> +        break;
>>> +
>>> +    default:
>>> +        /*
>>> +         * TODO: domain_crash() is acceptable here while things are still under
>>> +         * development.
>>> +         * It shouldn't stay like this in the end though: guests should not
>>> +         * be punished like this for something Xen hasn't implemented.
>>> +         */
>> Question then is why SBI_EXT_0_1_CONSOLE_GETCHAR gets a separate case block.
> 
> Because we intentionally do not support|SBI_EXT_0_1_CONSOLE_GETCHAR|,|domain_crash()|
> should not be called for it.

That contradicts the patch description saying "starting with support for
SBI_EXT_0_1_CONSOLE_{PUT,GET}CHAR." (Still in context at the top.)

Jan

