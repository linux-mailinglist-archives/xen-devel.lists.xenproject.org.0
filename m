Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C84BB14D53
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 14:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062586.1428297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugj0c-0003sV-Cx; Tue, 29 Jul 2025 12:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062586.1428297; Tue, 29 Jul 2025 12:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugj0c-0003q5-AI; Tue, 29 Jul 2025 12:00:42 +0000
Received: by outflank-mailman (input) for mailman id 1062586;
 Tue, 29 Jul 2025 12:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugj0a-0002lo-PF
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 12:00:40 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a526ec3c-6c73-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 14:00:39 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b78d337dd9so739873f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 05:00:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ff630766bsm59385815ad.182.2025.07.29.05.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 05:00:38 -0700 (PDT)
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
X-Inumbo-ID: a526ec3c-6c73-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753790439; x=1754395239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oCPByNSW0BWcOF15x1RomhLDn46RY1Erc3zTnMA3L54=;
        b=KRebPo+m1uV9vb7VhQ4JkqUMZvJqKL1VywhuJ48At1NgCI8o/D1w6tNKCELnYZxcjJ
         4kG9qAq4ibBbshxNcr0IvI8xyG392roLuDzdnB04+5kO/tp0VliXnHVi8y8Pe311sWIU
         rdz85CXO4mFYHp5lXjWR0lCBDgxSTXjkD3S0i54zcCX9OCSWCfv4NkA6REFNAnkpfoIF
         3zJsYbGH3TI9x5WDCVgx7HyOWq97obsbmvtyMsEs2bZGxYGYWP9t9fVK1dBOguRlU0Up
         3qx4HAEsTzJicukvqCz1rzB3YbUz1HA7y/XiRY7L2LwmKTyyppCAdViAd1LyQPMYFuwy
         egMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790439; x=1754395239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCPByNSW0BWcOF15x1RomhLDn46RY1Erc3zTnMA3L54=;
        b=GPAEZqdBOX/IM/o5FnihKvFlGo55u/vaIBtfvc/KlxlE8F0fI4LhVjG2vu7nqUxmio
         wmG1KaFtchGn+XWE/qndRz9nROxYdhuA/PXmuUwSdyhdzGaS96OG1aSWwVfi/ylOMNnm
         RhjI8k0CH55sHECFVeFkdgZkMknteYZxolSfQq06Ds/KpfAx9L621ZorCNwEPhoWewTN
         sBlXzIdn/7BFtF2fsKMkOibqMQcVHtD7WYxTl3iXFCI6CZvgFLSEX6do1cia3CdkU9vu
         p7pJEZlKP3SCiD5IfxNzioSVwYvurwE4j2uklDd3pgiXZ+yjtV3iEGSeR5UBSQZmOasx
         ySKA==
X-Forwarded-Encrypted: i=1; AJvYcCUExGCrD8c0zTlBgOqRehCBq/mwmqHJL6IC5yR0UuDpDcPa76xqHsCROzH521mpS5z1XhKVvmo07Fw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAAl8hKe9HeNYrkhSwQdNn0+Sx1Osf3tVMz9Dgc2zALnIwjxJ6
	B5RtRaqdqkxKf/DX6+W/4qb5d6qy/eXZnf16TiUZGGLUW0G+VRH47rweZgoppnxxJA==
X-Gm-Gg: ASbGnctswfxv1aKCIVXyWm0vpHBT11tEvObO+zuSblgN1Xpp1VvB0Y/CJohv/c2EjcI
	m9N4g4OrDen9+nFLQ3huY6gguQROOodgzOoiQumculfB9V0wVQ4qJMmy4WQs54y0sXemJHeKO6P
	1fsobgpwNeSZBRgU56SRBctCOexjRndYsDZ8qllCqYaHqOLju0sHEwi0tguOjY5+tD2y17hwU0G
	yfmkRbgTOIY40CIjvDpl5FKW9cdx8bpr/Qe//h2fkJHEqXawxkl8TVcjMXcF6PFoBTvMZdMPPdX
	CKDPczHcL+Z7enOiMRaM+Bl9oy7aB0vU0/DGDDj/VqhGd7a+UZ1TCjpfn5d6mczYPJeuA2spNPm
	CYzPvoaerHlagkxZy135If1+ZA3nvuPfP/CX+kwWLCsWU8KVdWv2EACKzCx2luHzSrNcwRA0W4N
	FwuotrFV0=
X-Google-Smtp-Source: AGHT+IGZc9sc2GURlGQ7MaMkXk8LtnVSRqDyfYxWgSRPSmPNd48XJAThpjOMclbyPDd6lk7VYDtuug==
X-Received: by 2002:a5d:5885:0:b0:3b6:d6c:a740 with SMTP id ffacd0b85a97d-3b776680be3mr11288379f8f.54.1753790438966;
        Tue, 29 Jul 2025 05:00:38 -0700 (PDT)
Message-ID: <0916bed8-fa87-4003-8aad-af3a6ff7ccfc@suse.com>
Date: Tue, 29 Jul 2025 14:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra/eclair: set 'noreturn' attribute as safe during
 cast
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <8989bf6d8d245537628912a00f5ba4731b292fb1.1753738107.git.dmytro_prokopchuk1@epam.com>
 <2f2a1992-0d88-4429-bed1-af5e60e05664@suse.com>
 <ef43422f-902c-43d6-8b67-10385427e2fe@epam.com>
 <2c016cc6-bd1e-44c1-baaa-5faa6b88cf6b@suse.com>
 <7c1de6ab79993a96f8c2cf6ce4c6ddff@bugseng.com>
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
In-Reply-To: <7c1de6ab79993a96f8c2cf6ce4c6ddff@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 12:55, Nicola Vetrini wrote:
> On 2025-07-29 12:52, Jan Beulich wrote:
>> On 29.07.2025 12:04, Dmytro Prokopchuk1 wrote:
>>>
>>>
>>> On 7/29/25 11:04, Jan Beulich wrote:
>>>> On 29.07.2025 00:15, Dmytro Prokopchuk1 wrote:
>>>>> ECLAIR reports a non-compliant cast due to the presence
>>>>> of the 'noreturn' attribute in the callee function.
>>>>
>>>> Which callee function? Which cast? Please be concrete. You don't need
>>>> to enumerate all case, but one specific example wants pointing at.
>>>>
>>>>> The issue occurs when casting a function pointer with
>>>>> the 'noreturn' attribute (void noreturn (*)(void *))
>>>>> to a general function pointer type (void (*)(void *)).
>>>>
>>>> And again - why "casting"? As per ...
>>>>
>>>>> Configure ECLAIR to treat 'noreturn' attributes as safe
>>>>> in this conversion.
>>>>>
>>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>>> ---
>>>>> Previous discussion thread:
>>>>> https://patchew.org/Xen/181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro._5Fprokopchuk1@epam.com/
>>>>
>>>> ... there was no cast involved, iirc. We specifically rejected your
>>>> attempt to add a cast there. It's a conversion the compiler does, 
>>>> aiui.
>>>>
>>> Yes, you are right.
>>> Word "cast" is not appropriate there.
>>>
>>> Below is updated text:
>>>
>>>      misra: allow 'noreturn' as safe for function pointer conversions
>>>
>>>      The conversion from a function pointer with the
>>>      'noreturn' attribute ('void noreturn (*)(void *)')
>>>      to a function pointer type ('void (*)(void *)'
>>>      causes type incompatibility according to
>>>      MISRA C Rule 11.1, which forbids conversions
>>>      between incompatible function pointer types.
>>>
>>>      The violation occurs at the call site
>>>          smp_call_function(halt_this_cpu, NULL, 0);
>>>      where 'halt_this_cpu' with type 'void noreturn (*)(void *)'
>>>      is passed to 'smp_call_function' expecting a function
>>>      pointer of type 'void (*)(void *)'.
>>>
>>>      The 'noreturn' attribute does not change the function
>>>      calling convention or parameter handling at runtime,
>>>      making the conversion safe.
>>
>> Up to here things read much better now, thanks. Just one more request:
>> Please make better use of the 72 (or maybe even 75) characters that are
>> permitted per line.
>>
>>>      Configure ECLAIR to treat 'noreturn' attributes as safe.
> 
> Configure ECLAIR to treat implicit casts that lose the "noreturn" 
> attribute on a function void (*fp)(void*) as safe. This is because the 
> deviation actually just deviates void noreturn (*fp)(void*) -> void 
> (*fp)(void*)

Thanks. Just one more nit: s/casts/conversions/.

Jan

