Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B042816C75
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655888.1023770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBx3-0007WH-Sn; Mon, 18 Dec 2023 11:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655888.1023770; Mon, 18 Dec 2023 11:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBx3-0007Tr-QC; Mon, 18 Dec 2023 11:38:25 +0000
Received: by outflank-mailman (input) for mailman id 655888;
 Mon, 18 Dec 2023 11:38:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFBx2-0007Tc-9h
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:38:24 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f34a7ab4-9d99-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 12:38:23 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3365f09de18so1653605f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:38:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o10-20020a5d408a000000b00336614e25d0sm5086289wrp.56.2023.12.18.03.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 03:38:22 -0800 (PST)
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
X-Inumbo-ID: f34a7ab4-9d99-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702899503; x=1703504303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FaGE3Ts2cqNjsxHOLEGHqXBRMtYea0jFnnNCq7d/TrE=;
        b=SKwSK5k0C3QtrSnvrw9/rLq4h+y+afhU/RKo+CP5Pg9atjCphWpJCquQqbbUIAvADn
         IV6P1hQOFq5BPFbjLciMXj834mGJF06xNztsfVWI1X2N0fhBEskNSdlIpQmBmnZbB1zB
         iS9pT35w1uozedTvr58G7VbY3nQp79t6Da2gXCvh5WRvQP0DGIvXR5A9ZgtXlbjAQNGP
         Ixgud7ljHwIkXF2urmceDkm4ep+uDojW7Qy7t8xrWNCps5Mi2wGyR07HlivT2oKzXIVh
         v9YJSzk6u/o+yXWxyOT7ULNEPywf+RCkyVFabrPzj7Lkv7xrB0Ws2UZYj5qc28S0UR+3
         mRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702899503; x=1703504303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FaGE3Ts2cqNjsxHOLEGHqXBRMtYea0jFnnNCq7d/TrE=;
        b=uJ4gg/YRnP3s9X2ZmncYEFB9qsyIDnJmdlwHjRehN3j3fDmJwQkapydCSgrD+xU1lw
         UxKqHmdIyAvyEk8O8tE/D8nx+zU9DGhneKcNl1S7kRME56rg3Jp0SZhpBMPS5DkCkrUO
         kzPNyw6BOd5RI8KOPsQAi3axqOeNaXdG4/Nwa4cXzs69PNCumDTmOJlRcoF2qVKpxP78
         K1RnUGdNQXmRj8iYaAMUHK5/TO8vhir2OSC7BlnGKE/BBY0MxE9c1hWZU/rxHmmpQhbk
         EYOjf3BsfFREwDEw02TNJUgORLJZHApgwoet9G91AEELmvvIumSUZ1IlrJSeETUdfp/o
         gL4A==
X-Gm-Message-State: AOJu0Yw2xVJCFetVBfCWWfpbJe4QneLeR5CDP2tgwyQL2RCBOltiwEfg
	zP+Rqwzqb6hK4uVCfIVuu8Fw
X-Google-Smtp-Source: AGHT+IH5a+/v+3dAdY1UbkVgkb7ASeE9RBeb6OWes8QuWufnFteX39UVdsWnMnkpvrpoyNb5lmtOlw==
X-Received: by 2002:adf:f3ca:0:b0:336:64b8:9d39 with SMTP id g10-20020adff3ca000000b0033664b89d39mr1205589wrp.89.1702899502885;
        Mon, 18 Dec 2023 03:38:22 -0800 (PST)
Message-ID: <c89a7b34-c5d2-4406-9c1f-16d662379b32@suse.com>
Date: Mon, 18 Dec 2023 12:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/39] xen/riscv: add minimal stuff to asm/processor.h
 to build full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <11f177882b74c60233626075a69bdd00d3da2311.1700761381.git.oleksii.kurochko@gmail.com>
 <c431a7ac-ac4d-4de2-969a-ad2acf1a7aee@suse.com>
 <a46dee8dc5f15beb8c01f84b6363f6d7763e0ede.camel@gmail.com>
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
In-Reply-To: <a46dee8dc5f15beb8c01f84b6363f6d7763e0ede.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2023 11:49, Oleksii wrote:
> On Thu, 2023-12-14 at 17:04 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> +static inline void cpu_relax(void)
>>> +{
>>> +	int dummy;
>>> +	/* In lieu of a halt instruction, induce a long-latency
>>> stall. */
>>> +	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>>
>> Any reason for this, when Arm's is just barrier(), and apparently
>> they got
>> away with this quite fine? Also isn't this causing a division by
>> zero,
>> which I'd expect to cause some kind of exception? (Terminology-wise
>> I'm of
>> course biased by x86, where "halt instruction" wouldn't be suitable
>> to use
>> here. But if that terminology is fine on RISC-V, then obviously no
>> objection.)
> It was based on Linux kernel code:
> https://elixir.bootlin.com/linux/latest/source/arch/riscv/include/asm/vdso/processor.h#L9
> 
> But looks I missed barrier()...
> Probably it will be better update cpu_relax() to:
> 
> 	/* Encoding of the pause instruction */
> 	__asm__ __volatile__ (".4byte 0x100000F");
> 
> 	barrier();

But definitely without .4byte, which defines a piece of data. If for
whatever reason you don't want to use "pause" directly, please use
.insn.

Jan

