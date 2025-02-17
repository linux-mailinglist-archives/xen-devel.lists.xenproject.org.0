Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268FCA38A25
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890736.1299872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4Q9-0005Nw-6L; Mon, 17 Feb 2025 16:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890736.1299872; Mon, 17 Feb 2025 16:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4Q9-0005LZ-3O; Mon, 17 Feb 2025 16:56:37 +0000
Received: by outflank-mailman (input) for mailman id 890736;
 Mon, 17 Feb 2025 16:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tk4Q7-0005LT-Lv
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:56:35 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2464ec6d-ed50-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 17:56:33 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e05717755bso1941517a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:56:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9ec913d5sm195346166b.170.2025.02.17.08.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 08:56:32 -0800 (PST)
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
X-Inumbo-ID: 2464ec6d-ed50-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739811393; x=1740416193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vAbS91Sl05p526YlHloD24EKINrLLj0nDsbOvNqi3bE=;
        b=IegjTT3VGSze3xhsdvLlkbwdt0fxZRVWTR+mrGo8Rwd40ZvJinKMUNMQQbKx6Lm0OI
         8V4kP48f2/RdSq4fLbK5bweuUXUiK1c1rOfAbUlhhnOg6cDsOgrCE4EPpSQW2ue2FQ1t
         XV9HwogotVZbX++R1jp1pCvmgUVOZg4fwbmOL6rwbhCGbtWQpM/35ATzaTR4FE/XGXhy
         dQro8lbDf/io/1gpPTw4ts/DrAdMgUPvl2/ko+5qSLLMB5uOBiEEKBK0/LKuCwBS7hSj
         Ycd5pN3hhaponK3C4ApdI4neVuZUvx17t2ofmXhw0Z6wUcoHoOeqlvPps1YVN7f4RGP5
         0VLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811393; x=1740416193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAbS91Sl05p526YlHloD24EKINrLLj0nDsbOvNqi3bE=;
        b=CBIKtDWBwbLc0u3F2Ce3AOUiccQ5ux/wvwgB9ZqwLyvJ4A0Z8XDW0i8V1wSo/v0XeM
         vopwRCbyJnFz6zrpznMm98XJKvFkw+ko58u2B+Ih/89EA/0XEb7MTyLMu2cueSCNWHmz
         5rgF1MFoPOqWb7Vg86jT4vFNMZy1FBhZq42I6/SoaJN9rg1phg17FL6EBm5oILS9oekc
         I2E7NtvGZoTigCKZnaEdnP+R3lc+URSuBdOaae1LywQdh9DPWYFZtoLNzebTjulIc3KD
         8aNQiTvu1rIGgMSDAyysiz9rUaR+6fq6CUuMyP7ITLRpDS9LbobLLcp/US600Jf6BgBF
         LXSg==
X-Forwarded-Encrypted: i=1; AJvYcCXmcIbmxiSEqAj7fq8g1iHBEOD/o/JdHIJoTmSyE+FyQkIsKf4+IdpKEAbtDbH1bykh0oBOBbncqXM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOiSC4I39hohaQUoC8N6S4sbxKrdar3/gUcYkBOikLFI1n4CDW
	Vin4yACh+BHfwO93hX+X09cOJ6IBkDgi3K9mS3Xbk6cEpjj1D47UrqFvVA9FMw==
X-Gm-Gg: ASbGnctMamIaoYrpybZrAgmObb3POrHCe2Bz42rryugLlTQxUq+FiGdEjLBJBdVTeB3
	Tfxg6rQh+MqzXZsbrY9nTF7iZCNJX4IYSoFOjrnYfrsiDmroAu87Ls3R90mlaixrkQR1NyG9UQW
	2xSpNQUyZJXu7+HScDjJJqmmDkQw2Inf9eSPVPxP9lqRfTSonVnQ5kWUgoKUSfJ3Wpw6/nCtdBP
	hr1/k3NHW1y78t+4907pLcy8psme+N+mWfRXYqA7gtT3bBULDPtjpqvKFOCOrU/vIt0fr3eQZcz
	bHfwfYsx0vnuiCMfemLR8sBCvonr7uIwL0FTous2mvSHne9c+A9023A5wPHPFYIWUCLY7cqFFqC
	n
X-Google-Smtp-Source: AGHT+IEE1oO2HZfh/zYO47E6wJzF8oOtK6luB0hcN1TjHwkvJg3/M+dl7SptcsoYrlf0spPI3MG28A==
X-Received: by 2002:a17:907:9716:b0:ab7:e3f4:51cc with SMTP id a640c23a62f3a-abb70c314bemr1220188366b.33.1739811393131;
        Mon, 17 Feb 2025 08:56:33 -0800 (PST)
Message-ID: <1923357b-c303-4900-9e2a-be4328ae4dc3@suse.com>
Date: Mon, 17 Feb 2025 17:56:32 +0100
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
In-Reply-To: <CACHz=ZhuOL3Le=+y0zFRaWBDEdLO_faLKZ83072Z0e88wZMpPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.02.2025 17:52, Frediano Ziglio wrote:
> On Mon, Feb 17, 2025 at 4:41 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 17/02/2025 4:31 pm, Jan Beulich wrote:
>>> On 17.02.2025 17:26, Frediano Ziglio wrote:
>>>> --- a/xen/common/efi/efi-common.mk
>>>> +++ b/xen/common/efi/efi-common.mk
>>>> @@ -2,6 +2,7 @@ EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
>>>>  EFIOBJ-$(CONFIG_COMPAT) += compat.o
>>>>
>>>>  CFLAGS-y += -fshort-wchar
>>>> +CFLAGS-y += -fno-jump-tables
>>>>  CFLAGS-y += -iquote $(srctree)/common/efi
>>>>  CFLAGS-y += -iquote $(srcdir)
>>> Do source files other than boot.c really need this? Do any other files outside
>>> of efi/ maybe also need this (iirc this point was made along with the v5 comment
>>> you got)?
>>
>> Every TU reachable from efi_multiboot2() needs this, because all of
>> those have logic executed at an incorrect virtual address.
>>
>> ~Andrew
> 
> I assume all the files in efi directory will deal with EFI boot so
> it's good to have the option enabled for the files inside the
> directory. The only exception seems runtime.c file.

And compat.c, being a wrapper around runtime.c.

> About external dependencies not sure how to detect them (beside
> looking at all symbols).

Which raises the question whether we don't need to turn on that option
globally, without (as we have it now) any condition.

Jan

