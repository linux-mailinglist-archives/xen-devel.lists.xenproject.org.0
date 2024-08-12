Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9BA94EF22
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 16:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775597.1185816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdVft-00086c-Cw; Mon, 12 Aug 2024 14:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775597.1185816; Mon, 12 Aug 2024 14:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdVft-00084H-AI; Mon, 12 Aug 2024 14:05:29 +0000
Received: by outflank-mailman (input) for mailman id 775597;
 Mon, 12 Aug 2024 14:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyEi=PL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdVfs-00084B-7b
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 14:05:28 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb88e83f-58b3-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 16:05:24 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6135eso434881a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 07:05:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd187f5671sm2165380a12.3.2024.08.12.07.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 07:05:23 -0700 (PDT)
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
X-Inumbo-ID: eb88e83f-58b3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723471524; x=1724076324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JX1QH7IOkjSMUhCLKa0/jbvdEy/KbXTGBFZkU/dLY4M=;
        b=eZV43b93P0SnoOMY+lfmH7RnXJOuS7aqoY/qnwD5/1Ngi0GgLhlVLmWyOtPEZy6i2W
         ehqxqfW3A95ezGObkj9cNChZl9bysfWXq+YdIYWNNGF0ml26oJULHEbFdbPikdAJx6aQ
         ZujWOADuP6ygLK5fUDxPfABGJeCdbM1uMFF/9yWcFFh1Z+LdB6lb+W4mT9E+HUrHcYD6
         ITQ3JX7bggInj3JcHq2tIJtBo3sBIL4XPxpyO6aplhYiw7NebYjOYu53AEMLbq3p0wC9
         Th4VqYnoInQ46AcfE9wRMPELGAojhNEjfyTE/rCR0t50KVJf5eWa/09TRsJbVMLoxYD1
         xMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723471524; x=1724076324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JX1QH7IOkjSMUhCLKa0/jbvdEy/KbXTGBFZkU/dLY4M=;
        b=iXreGFOMjjO0PL6GTGIs7ZEXDoGTQhg8daJ301nFXyef+YqiwzzjzYevdL5pQy0RI/
         1H7DBtoAq/D7+MDPPU8xqcMaILisuFZjUfMwbU6S1Q2jPyOtbEUr9aJPUCnQaCBYnt7o
         qen9qPgxxlE7rmIKkU8LCWS9KvWDKJijFV81k3fOvhnSeyFke9xoVpO/jdEkh1fQa/QB
         46AuqladDjb6tyP+hW50dcFn7/eNyhPxiMVDF8mAzSzUdyIeWvV/DJH15mMu89xCCbWg
         hF0ybwrxXZvxdzJMnHt4gD6yN/1X8ndl8mCX+J/q4XTyxKn+Ccyga7LoX8CEtfCXvRw/
         itbw==
X-Forwarded-Encrypted: i=1; AJvYcCUjGHuyzD1aU4JwSH/nxpSMnnTGSCxu1iNPDGQnq0ZHG2C8YFpVUXCT6g1RnRgB6e5EVE6+Me+kbaEX54pxgCSvoFrnBOEvLVZfTruMO6Q=
X-Gm-Message-State: AOJu0YwvEwwpnspInCv3++JFAKxPhnDNQAmxcrunLY2VrF2L6l99YMvN
	L7Rb7IzGiRswJ6CSPrPjooY7dB1YhsRyqZF2K8EPmHM5iOjaaOUeapoYA1vnvA==
X-Google-Smtp-Source: AGHT+IEUWImIy7cFwJOntnWHhmPAMC5i74plkYYac0jZeFivsaZMvxJO/sg8lbPYqRDWOn5/OjpNlg==
X-Received: by 2002:a05:6402:13d3:b0:5bb:723:a189 with SMTP id 4fb4d7f45d1cf-5bd450f71bcmr259757a12.14.1723471524008;
        Mon, 12 Aug 2024 07:05:24 -0700 (PDT)
Message-ID: <e0081fc2-c631-45a0-a847-edc8dcc3988e@suse.com>
Date: Mon, 12 Aug 2024 16:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: don't call ->read_segment() with x86_seg_none
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
 <a7d15429-ce49-43b1-9bbd-7b0129094388@citrix.com>
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
In-Reply-To: <a7d15429-ce49-43b1-9bbd-7b0129094388@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2024 15:04, Andrew Cooper wrote:
> On 05/08/2024 2:26 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -839,7 +839,8 @@ protmode_load_seg(
>>          case x86_seg_tr:
>>              goto raise_exn;
>>          }
>> -        if ( !_amd_like(cp) || vcpu_has_nscb() || !ops->read_segment ||
>> +        if ( seg == x86_seg_none || !_amd_like(cp) || vcpu_has_nscb() ||
>> +             !ops->read_segment ||
>>               ops->read_segment(seg, sreg, ctxt) != X86EMUL_OKAY )
>>              memset(sreg, 0, sizeof(*sreg));
>>          else
> 
> While this fixes the crash, I'm not sure it will behave correctly for
> VERR/VERW.
> 
> protmode_load_seg() is unconditionally X86EMUL_OKAY for a NULL selector,
> and VERW checks for type != 0x8 which an empty attr will pass.

That's past an sreg.s check, which will have failed (for sreg coming back
all clear).

Also if there was a concern here, it would be orthogonal to the adding of
the seg_none check: It would then have been similarly an issue for all
possibilities of taking the memset() path.

> Interestingly, both Intel and AMD state that the NULL selector is
> neither readable nor writeable.

Which makes sense, doesn't it? A nul selector is really more like a
system segment in this regard (for VERR/VERW).

> Also, looking at the emulator logic, we're missing the DPL vs
> CPL/RPL/Conforming checks.

There's surely nothing "conforming" for a nul selector. Hence perhaps you
refer to something entirely unrelated?

Jan

