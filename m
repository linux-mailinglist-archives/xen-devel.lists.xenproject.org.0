Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396ECD56B2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 10:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192008.1511373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXcfh-0006Hn-Fl; Mon, 22 Dec 2025 09:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192008.1511373; Mon, 22 Dec 2025 09:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXcfh-0006F9-Cj; Mon, 22 Dec 2025 09:57:45 +0000
Received: by outflank-mailman (input) for mailman id 1192008;
 Mon, 22 Dec 2025 09:57:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXcfg-0006F3-AI
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 09:57:44 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6175863-df1c-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 10:57:41 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so2466877f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 01:57:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2c4fsm21149809f8f.42.2025.12.22.01.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:57:37 -0800 (PST)
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
X-Inumbo-ID: a6175863-df1c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766397458; x=1767002258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R6qONmfhrp0vYklg3MG5Tlx7YLSOohcz7juIkmdsYLo=;
        b=FcvX3hzBLSlFUtpK15VBKskD52lMbW8fvspRpSUZEbhnDIIFXN2kcdwh2a4ng1hKkm
         If+jCEvskMgGSTohZ7+eKUAPwjVwAZW2mMtlavmYMff3cvfVhgyFCoM25y5K9Y1isD+d
         WZJ9VAKneTSMtFlej82RxlpZhy8svE4kBll2KVse3h+/y02mQUj/LHAS8AS2vyDuyQNd
         4k5y++63VOo13J+7RLQZsQxKdazJ4YDiMqe2AHd41c06zi1jLiUmhR0ZQw1Cmp2AGKPB
         EmsBRAHGuo5nrqMdnLeVp2Cc4c03S6AE9cRLIHcoMk+aARa4MvHTCaELslXytNY9/abr
         zwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766397458; x=1767002258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6qONmfhrp0vYklg3MG5Tlx7YLSOohcz7juIkmdsYLo=;
        b=nguHYrhVsemNxyOgONbpLeCxzumyH1rS3ibcrqIer8tzkjDGwjipmhkQEuEmKZfdxq
         07bm2PstRQDAuJ3bibgqy9gCW97l36phCNf9w7uY5CPDVwE1sBsKKXqO4P7LmIKbFF3d
         RkktN9jT46pXKo3qKbmrgoT+r4ivmC0GOtqxzkicYMstri/7VYrwottpUNSl7exbdeI6
         pf1jIdHE0p1qzNjMieHawF+aybJ5J78iXv1uir6C6Xl3RMvgaHApeNSC6ws4YjmZ8NQs
         4j3dTBFD2GUMwiVT4BIC8acCaQJvRht5hJAwyE1zNSEGTOJhwF7nINReHSMiEyfXMXUw
         qnyw==
X-Forwarded-Encrypted: i=1; AJvYcCUfMf4Q7vuP2H7i6Na9oPGvg2My0esO2hJrNbrc9wyCTOuM3ws5bv5Ck8FkI9JXs7o53mTvaO5qxMs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznEfgWU2FB+UcO8WuPrM3Sk+cSTksYP6sScMeQeuNQVYI+fC9+
	pHr3ERWe28MH7Sz8miWTXijLWIR9VEdj060oK7EgpwFAcbnRCHbnHOhuUmoBtBPMig==
X-Gm-Gg: AY/fxX4EaANDlSwJPupJFV1SX5jewGKzvjPKVFaqDvrfmL4+/D+K4+jSn+GSsud3afb
	38YNgxpnSjoK2WQIqOuCyOpT5LPnkD1A/BMBdXqB1uwjoSl88lQjh6bH4byCFUlHWU1yewgx5Q9
	K8IFXiOMwTj1ll+J5p3lsZ0c5qd1PaZdL4vti0MJ9rI2qFCokzbCd/E8A4IQO2lfkoyXYFrT2Vq
	/TMeS4ahy9JZ/IPydyveQ3tNyoNNBhkZ9jEuc4w8kWnZb7UhTpFyAPRvhz7JXXKygIBP9SfOQ8Z
	B+BlR9bjjgN4SF5Nng2IMT0o1fuPBYyqgnPawmzJBCRiYAG42eZsFjQiaAZmee+7I+yG5QJQdxc
	a/oR6hxJWigmY4+9wddEvqfU64ixAMZ3NWwnvAaJCGXK5acp+KsEhUWKa2rxA9vg177iWrbZLYq
	4hTBNAjhe5rik8VVPPbD3/T8/dXnbXv4td8X9ysJvlBV/GK343qs43kqIIl156hUtn7bLlJsv3v
	sw=
X-Google-Smtp-Source: AGHT+IEyikmEJrBQhC3NqhvIV6WstZ6NEvftKFaVHflHLw7d/OOem8r2cZI6I09Wh4761kJLCJDIFw==
X-Received: by 2002:a05:6000:604:b0:430:7d4c:3dbc with SMTP id ffacd0b85a97d-4324e50b175mr12965835f8f.53.1766397458159;
        Mon, 22 Dec 2025 01:57:38 -0800 (PST)
Message-ID: <b4e28b55-dbb0-4129-98d4-784cab026302@suse.com>
Date: Mon, 22 Dec 2025 10:57:39 +0100
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
 <d3f6189d-7a4b-4d7e-8b22-71c325ce109e@suse.com>
 <46373e3b-51e7-4843-82c8-9c0c2d644b16@gmail.com>
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
In-Reply-To: <46373e3b-51e7-4843-82c8-9c0c2d644b16@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2025 10:29, Oleksii Kurochko wrote:
> On 12/22/25 8:40 AM, Jan Beulich wrote:
>> On 19.12.2025 21:04, Oleksii Kurochko wrote:
>>> On 12/18/25 3:20 PM, Jan Beulich wrote:
>>>> On 17.12.2025 17:54, Oleksii Kurochko wrote:
>>>>> This commit adds support for legacy SBI extensions (version 0.1) in Xen
>>>>> for guest domains.
>>>>>
>>>>> The changes include:
>>>>> 1. Define all legacy SBI extension IDs (0x0 to 0x8) for better clarity and
>>>>>      completeness.
>>>>> 2. Implement handling of legacy SBI extensions, starting with support for
>>>>>      SBI_EXT_0_1_CONSOLE_{PUT,GET}CHAR.
>>>> I can't spot any actual support for GETCHAR.
>>>>
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/vsbi/legacy-extension.c
>>>>> @@ -0,0 +1,65 @@
>>>>> +
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +
>>>>> +#include <xen/console.h>
>>>>> +#include <xen/lib.h>
>>>>> +#include <xen/sched.h>
>>>>> +
>>>>> +#include <asm/processor.h>
>>>>> +#include <asm/vsbi.h>
>>>>> +
>>>>> +static void vsbi_print_line(char c)
>>>> Misleading function name? The parameter doesn't fit the name, and ...
>>> It was called only because of ...
>>>
>>>>> +{
>>>>> +    struct domain *cd = current->domain;
>>>> I guess you copied this code from somewhere, but a variable of this type and
>>>> contents wants to be named "currd".
>>>>
>>>>> +    struct domain_console *cons = cd->console;
>>>>> +
>>>>> +    if ( !is_console_printable(c) )
>>>>> +        return;
>>>>> +
>>>>> +    spin_lock(&cons->lock);
>>>>> +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
>>>>> +    if ( c != '\n' )
>>>>> +        cons->buf[cons->idx++] = c;
>>>>> +    if ( (cons->idx == (ARRAY_SIZE(cons->buf) - 1)) || (c == '\n') )
>>>>> +    {
>>>>> +        cons->buf[cons->idx] = '\0';
>>>>> +        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
>>>> ... you also only print a line under certain conditions.
>>> ... this. (for the same reason as hvm_print_line() which has an argument
>>> 'uint32_t *val' but inside function working with chars because of
>>> 'char c = *val;')
>>>
>>> I will change the name to vsbi_print_char().
>>>
>>>>> +        cons->idx = 0;
>>>>> +    }
>>>>> +    spin_unlock(&cons->lock);
>>>>> +}
>>>>> +
>>>>> +static int vsbi_legacy_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>>>>> +                                     unsigned long fid,
>>>>> +                                     struct cpu_user_regs *regs)
>>>>> +{
>>>>> +    int ret = 0;
>>>>> +
>>>>> +    switch ( eid )
>>>>> +    {
>>>>> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
>>>>> +        vsbi_print_line((char)regs->a0);
>>>> The cast isn't really needed, is it?
>>> No, I think it could be omitted.
>>>
>>>>    And just to double-check: The spec demands
>>>> the upper bits to be ignored? (A link to the spec could have been useful, e.g.
>>>> in the cover letter.)
>>> It doesn't mention anything about upper bit for PUTCHAR:
>>>     https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-legacy.adoc#extension-console-putchar-eid-0x01
>>>     (I will add a link to the spec in the cover letter.)
>>> So I assume that they don't care about it. (IIUC your question correctly).
>> I fear such a conclusion cannot be easily drawn. The parameter there is even
>> "int". Anything not ASCII will remain unclear how to handle until the spec is
>> changed to actually say what is intended.
> 
> Then it makes sense to add "WARN_ON(regs->a0 >> __CHAR_BIT__);" in
> SBI_EXT_0_1_CONSOLE_PUTCHAR case block.

Well, no, or at least not longer term: Like you may not ASSERT() or BUG_ON() on
guest controlled data, you may not WARN_ON() on such.

>>>>> +        break;
>>>>> +
>>>>> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
>>>>> +        ret = SBI_ERR_NOT_SUPPORTED;
>>>>> +        break;
>>>>> +
>>>>> +    default:
>>>>> +        /*
>>>>> +         * TODO: domain_crash() is acceptable here while things are still under
>>>>> +         * development.
>>>>> +         * It shouldn't stay like this in the end though: guests should not
>>>>> +         * be punished like this for something Xen hasn't implemented.
>>>>> +         */
>>>> Question then is why SBI_EXT_0_1_CONSOLE_GETCHAR gets a separate case block.
>>> Because we intentionally do not support|SBI_EXT_0_1_CONSOLE_GETCHAR|,|domain_crash()|
>>> should not be called for it.
>> That contradicts the patch description saying "starting with support for
>> SBI_EXT_0_1_CONSOLE_{PUT,GET}CHAR." (Still in context at the top.)
> 
> I will update the patch description. I just thought that that returning of "not supported"
> for *_GETCHAR() could count as an implementation.

It counts as an implementation, but calling such "support" goes too far imo.

Jan

