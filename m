Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348B19BD310
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 18:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830471.1245478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8N0i-00041g-O6; Tue, 05 Nov 2024 17:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830471.1245478; Tue, 05 Nov 2024 17:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8N0i-0003zD-KL; Tue, 05 Nov 2024 17:06:32 +0000
Received: by outflank-mailman (input) for mailman id 830471;
 Tue, 05 Nov 2024 17:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8N0h-0003z7-9M
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 17:06:31 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b3321a0-9b98-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 18:06:27 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539f4d8ef66so7137373e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 09:06:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116abdasm16896232f8f.97.2024.11.05.09.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 09:06:26 -0800 (PST)
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
X-Inumbo-ID: 4b3321a0-9b98-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmYiLCJoZWxvIjoibWFpbC1sZjEteDEyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRiMzMyMWEwLTliOTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODI2Mzg3LjIzMzE2LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730826386; x=1731431186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kIqsCuObXplFO/YegFmzAI7Mt4dx/tAI9qcu+Dkzj6Y=;
        b=LjVext//FBvAlYORUjQ5F9oVQBF3OKkp5yHLl9uLpZhso0z8Vfh1PigDx6fnC2IYeC
         9Qq1X7THhmJKtVLjFp4Yj37FLKgcMKh7q8Z79pZMRT3SUwYIZ5YKT6BTigXvEAAI5h3b
         nLgxW3EinOxYvj0EWWH3yCKNaNwNHCIAIJ9x2XtNfwrfcWWxk09vfJUDK8AlUtWV2LEm
         qL2Krnl8nZMiFY04W9/oCFC6+bHIc2BlXJkwqbsXJ6n14eLT74vSbvcPtdSCmi6NKRqr
         jUjGJpguR+a0qTfz0Mn3XatdtR4EIJCiGxAxPFRrJm/+Oey/cwEu2Oc9SPWT/Xngf5Ln
         t8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730826386; x=1731431186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIqsCuObXplFO/YegFmzAI7Mt4dx/tAI9qcu+Dkzj6Y=;
        b=d+VCo5GbTbtTb1XoOAoXkXuRtwxdRfjzxJ6sgyVi3yML0+mIAh5mM359aj3R0wufOL
         iYoAu5itUcWH9HNy2/pMYXjhlLFR/rPczbe4BibyRps3k1HsKzWAxfYj15WmbFm3Cdva
         C5VFms19ROzhivFyA59gJ99P4/1ZDl/ZScPD9x2HzwpzAlXjRJ9MOhI2nSMV/S8e5VMA
         +pvbghmxkplk9nggSZHBXZ0mRR+Ti/jX0asiBJrcnvvB91bKwORI+XqrtLZ2R65ZKCpD
         3L9N5iAX6J7odf0BZZxZrRt6Lw7kZCzrIUi3N0bvnD7QUI75DFpKfQ/KrsyhRB2j3tTJ
         VM2g==
X-Forwarded-Encrypted: i=1; AJvYcCUXf9IgjCfRAsMEiONJXUQIFEPI87Y/NXIvShB+LmHWIaE+X/6qEAvbW+03ER2gkU2KQW1/EqowTNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzyFDF+GCUDCfBP5b/ILQxzAzVynS1ddd4hMw6hqtaQZYZsrux
	N9RTBp7JE/PIiKf1uYFJurVxMlqtdFv+wYGLcWnT+7qdak+g/MaMWi1bvJryMg==
X-Google-Smtp-Source: AGHT+IGY5R667mk7y5zv27mFFjLJg6XksT1fYo23iGH7Xk+WPmE/NnbvMglcDCiVG0XgqPmZPVl9dA==
X-Received: by 2002:a05:6512:3b27:b0:539:de9c:c890 with SMTP id 2adb3069b0e04-53b34c5f9b5mr17421837e87.42.1730826386433;
        Tue, 05 Nov 2024 09:06:26 -0800 (PST)
Message-ID: <816ae079-378b-4bfd-93f2-83c5a281eb01@suse.com>
Date: Tue, 5 Nov 2024 18:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
 <48a22295-f3ac-496b-bdfb-ee17b0ada994@suse.com>
 <CACHz=ZhrxTSYGyWMQSE0Xi6sW2BZiLDuKkP2508CBRELD-USgQ@mail.gmail.com>
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
In-Reply-To: <CACHz=ZhrxTSYGyWMQSE0Xi6sW2BZiLDuKkP2508CBRELD-USgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.11.2024 17:35, Frediano Ziglio wrote:
> On Tue, Nov 5, 2024 at 3:32 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.11.2024 15:55, Frediano Ziglio wrote:
>>> This toolchain generates different object and map files.
>>> Account for these changes.
>>
>> At least briefly mentioning what exactly the differences are would be
>> quite nice, imo.
>>
> 
> What about.
> 
> Object have 3 additional sections which must be handled by the linker script.

I expect these sections are there in both cases. The difference, I assume,
is that for the GNU linker they don't need mentioning in the linker script.
Maybe that's what you mean to say, but to me at least the sentence can also
be interpreted differently.

>>> +    symbol_re_gnu = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
>>>      for line in open(args.mapfile):
>>> -        m = symbol_re.match(line)
>>> -        if not m or m.group(2) not in exports:
>>> +        name = None
>>> +        m = symbol_re_clang.match(line)
>>> +        if m:
>>> +            name = m.group(5)
>>> +        else:
>>> +            m = symbol_re_gnu.match(line)
>>> +            if m:
>>> +                name = m.group(2)
>>
>> ... uniformly use m.group(2) here (outside of the conditional)?
>>
> 
> It could be done. The initial idea was testing that VMA and LMA fields
> should be identical, which gives a bit more certainty about the format
> used.
> About map file format, both formats have some headers. Would it be
> sensible to detect such headers? BTW, probably a mis-detection would
> cause symbols not to be detected.

Not sure either way, to be honest.

Jan

