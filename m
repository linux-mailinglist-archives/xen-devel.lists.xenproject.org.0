Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1714EA3D260
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 08:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893534.1302404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl13B-0001UT-Ks; Thu, 20 Feb 2025 07:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893534.1302404; Thu, 20 Feb 2025 07:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl13B-0001SU-GJ; Thu, 20 Feb 2025 07:32:49 +0000
Received: by outflank-mailman (input) for mailman id 893534;
 Thu, 20 Feb 2025 07:32:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl139-0001SO-Ni
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 07:32:47 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e05863f6-ef5c-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 08:32:45 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e0939c6456so936940a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 23:32:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5337673dsm1398890266b.89.2025.02.19.23.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 23:32:44 -0800 (PST)
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
X-Inumbo-ID: e05863f6-ef5c-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740036765; x=1740641565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4vdhKcv7rCfTYirP7UrIts9AOx7kf+Za9cZERXyjJNc=;
        b=crHFtzTYx4+m6WUI5fu5+oVQfeJXPjNJClm9f065RmjkQhKzfOc3YIIEEsPt8F8/Cc
         M0QDRc+fsWNb5G+BBdpZZcJE4Ru6R6hl36xTXj/R6l6E8O7bLlZpv2Y9rKeaDqXC2pvM
         +3evalXDtiid0zsPck+gztJ5vS2Si5ysB/wb9+7L/7ygDq9Imx1N66XF/YpR/v9BQX7j
         /AowJnc7XkfBXTMJPU3hUhqL0sFn57FNto7FfKYonv0gqJDCsvwRiTZ7rey8ttAv7+Qc
         V7lsStck+XBywT/9nnY4yYpwNDe7mBX6AwfcgREOplKbauw8Ot3lUKXD6lFx+Rn1+/Et
         ha1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740036765; x=1740641565;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vdhKcv7rCfTYirP7UrIts9AOx7kf+Za9cZERXyjJNc=;
        b=X7qAkJ3KwWTIjSfZe3w3znrqIoWJU4ky5XDaeTeBNBQUzpQh+j9a7kL0Afze3MIuNN
         ACKP2n4OcLO86+O+oOp1QSKWBpS5q++isM7cKh7WwETUYWHfJuVTIJ6L1a9a2DVg7FDt
         X28xnKICe7Ns4Ia64yT7hw7WEx6WADBJzRMMExQbsoW0X3kZ8vteR6/aTObQ9vKvAeR0
         4JFTGS0xtiKSAS/4gu8/68WmGD93sphAt/AeMEPDUso3KY5qnv1LJR8x2h9mSEt1ei+c
         OGvd+C3ntSfsc+W/K1tdJDVnOLixBbeEdQrKJxO999Lx0nckwBek4WAycdbMRBXQyjX+
         MrFA==
X-Forwarded-Encrypted: i=1; AJvYcCU7GqWd5OKv43d/mrbOJqcJbIyLZZSpTG57NNchwQhFk7kRZL+aRHkkzxmvE5AfyjElsDs5p6Bq4RI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVa+c/ZuzrOmtl6NYNEmGi0xyW4JXDV0EETdg71p1+nwzHOR1F
	g6D8gKCLI4xCLvbKaG/PcivaMC4vXW+QcIGPTVal9bAHIYW4PJESnp6Ze//ULQ==
X-Gm-Gg: ASbGncvZssWzrIAZtuwrxeFXoCURHsv54gY+ttAVakY3Lwqq8m55XwUEsIURp2ROZ4+
	WN9MljFtZFmsnmvTFFPANFTjX61OowZoHpGpUq6LmmACGONwTOalpsAkPkKl7xh2xhNPZWce4/I
	qLRAQMqWw7iQT80HUBIYa1VMZ6c1FCmG2xJ7vVVsJn14Q+sBuCnX0R8j0r63gNTxuUNzRcIRaJ9
	mL13VsFUmlf+wF4LyeBhdkGsfR/6/vK+w8LW+Mhy5rHTxqRVBojz0jhR8qiPaSyWEsGYt4lVSWA
	LpFaUKueBSfVwB6k8/YVXisLsUGYCOdvi7qpXUUX/wgB2zAtus5w6LB6oqDtnFiPVT5nJF3w2hj
	1
X-Google-Smtp-Source: AGHT+IGl/gsoR7VGPP5O7iiUy8GP+nSG+ZPwXOxWirmUO1+B0uXT5S7EXX+n84iKVK4lAPSQtgqvUw==
X-Received: by 2002:a17:907:930a:b0:ab7:e7c5:b373 with SMTP id a640c23a62f3a-abb70e3b378mr1980231166b.55.1740036764613;
        Wed, 19 Feb 2025 23:32:44 -0800 (PST)
Message-ID: <f35ef066-2829-46c3-a65a-97436d8b39e2@suse.com>
Date: Thu, 20 Feb 2025 08:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <77eb149c-bb1e-4f77-85ba-c44b173a5c1e@suse.com>
 <ddfee078-409e-4253-9d51-b2f512b41e63@citrix.com>
 <CACHz=ZhuOL3Le=+y0zFRaWBDEdLO_faLKZ83072Z0e88wZMpPw@mail.gmail.com>
 <1923357b-c303-4900-9e2a-be4328ae4dc3@suse.com>
 <CACHz=Zhv5jnQ-amWwcjxOD0L+vNXFHbhs+qUkJp53MqUuwvQ1g@mail.gmail.com>
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
In-Reply-To: <CACHz=Zhv5jnQ-amWwcjxOD0L+vNXFHbhs+qUkJp53MqUuwvQ1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 17:34, Frediano Ziglio wrote:
> On Mon, Feb 17, 2025 at 4:56 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 17.02.2025 17:52, Frediano Ziglio wrote:
>>> On Mon, Feb 17, 2025 at 4:41 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> On 17/02/2025 4:31 pm, Jan Beulich wrote:
>>>>> On 17.02.2025 17:26, Frediano Ziglio wrote:
>>>>>> --- a/xen/common/efi/efi-common.mk
>>>>>> +++ b/xen/common/efi/efi-common.mk
>>>>>> @@ -2,6 +2,7 @@ EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
>>>>>>  EFIOBJ-$(CONFIG_COMPAT) += compat.o
>>>>>>
>>>>>>  CFLAGS-y += -fshort-wchar
>>>>>> +CFLAGS-y += -fno-jump-tables
>>>>>>  CFLAGS-y += -iquote $(srctree)/common/efi
>>>>>>  CFLAGS-y += -iquote $(srcdir)
>>>>> Do source files other than boot.c really need this? Do any other files outside
>>>>> of efi/ maybe also need this (iirc this point was made along with the v5 comment
>>>>> you got)?
>>>>
>>>> Every TU reachable from efi_multiboot2() needs this, because all of
>>>> those have logic executed at an incorrect virtual address.
>>>
>>> I assume all the files in efi directory will deal with EFI boot so
>>> it's good to have the option enabled for the files inside the
>>> directory. The only exception seems runtime.c file.
>>
>> And compat.c, being a wrapper around runtime.c.
>>
>>> About external dependencies not sure how to detect them (beside
>>> looking at all symbols).
>>
>> Which raises the question whether we don't need to turn on that option
>> globally, without (as we have it now) any condition.
> 
> I would avoid adding a potential option that could affect performances
> so badly at the moment.
> These changes are pretty contained.
> I would merge this patch and check any external dependencies as a follow up.

Well. It's a judgement call to the maintainers. If I were them, I'd demand
that Andrew's remark be addressed, one way or another.

Jan

